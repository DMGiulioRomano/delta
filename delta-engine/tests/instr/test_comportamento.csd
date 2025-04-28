<CsoundSynthesizer>
<CsOptions>
-o "comportamento.wav" -W
-d
</CsOptions>
<CsInstruments>
sr = 96000
ksmps=1
nchnls = 2
0dbfs = 1
; Debug mode
gi_debug init 4

; Include necessary UDOs and macros
#include "../../MACROS/init.orc"
#include "../../MACROS/debug.orc"
#include "../../udos/utils.udo"
#include "../../udos/GenPythagFreqs.udo"
#include "../../udos/pfield_comp.udo"
#include "../../udos/calcDurationFactor.udo"
#include "../../udos/validator.udo"
; Include the instruments we're testing
#include "../../orc/eventoSonoro.orc"
#include "../../udos/saveFtablesBehavior.udo"
#include "../../udos/tc_storeTransitionBehaviorParameters.udo"
; ==========================================================================
; TEST ENVIRONMENT SETUP
; ==========================================================================
gSdirSco = "sco/"
; Create test tab_iles for different musical context scenarios
; Format: Time, Overlap, HarmonicDensity, OctaveSpread, SpatialMovement
gi_test_dense ftgen 0, 0, 7, -2,15,      18,      20,      25,      22,      18,      15      
gi_test_sparse ftgen 0, 0, 7, -2,3,2,4,5,3,2,3
gi_test_fluctuating ftgen 0, 0, 7, -2,5, 12,3, 18,6, 14,4

; Globals for test control
gi_test_mode init 0    ; 0=dense, 1=sparse, 2=fluctuating
gi_test_idx  init 0    ; Current index in the test tab_ile
gi_test_last_time init 0  ; Last update time

gk_current_overlap init 1
; ===========================================================================
; OPCODE PER GENERAZIONE RITMI NON LINEARE
; ===========================================================================
opcode NonlinearFunc, i, i
  iX xin
  iPI = 4*taninv(1.0)  ; Calcolo preciso di PI
  ; Formula non lineare per generare nuovi ritmi basati sui precedenti
  ; Produce un comportamento pseudo-caotico per varietà ritmica
  iResult = abs(iX*2 * sin(iX * iPI/2 + iX) + 1/(iX+0.001))
  iResult = round(iResult)
  
  xout iResult
endop

; ===========================================================================
; COMPORTAMENTO - GENERATORE DI EVENTI SONORI
; ===========================================================================
; Questo strumento genera una sequenza di eventi sonori basati sui parametri
; forniti e li schedula per l'esecuzione. Modula i parametri del suono in base
; al contesto musicale corrente per adattarsi alla composizione globale.
; ===========================================================================
instr Comportamento
    ; -----------------------------------------------------------------------
    ; 1. INIZIALIZZAZIONE E ACQUISIZIONE PARAMETRI
    ; -----------------------------------------------------------------------
    i_debug = gi_debug

    ; Parametri di input
    i_CAttacco = p2             ; Tempo di attacco del comportamento
    i_Durata = p3               ; Durata complessiva del comportamento
    i_RitmiTab = p4             ; Tabella dei ritmi
    i_DurataArmonica = p5       ; Durata armonica di riferimento
    i_Ampiezza = p6             ; Ampiezza in dB
    i_Ottava = p7               ; Ottava
    i_Registro = p8             ; Registro
    i_PosTab = p9               ; Tabella delle posizioni
    i_IdComp = p10              ; ID del comportamento  
    Snamefile sprintf "Comp%d.sco", i_IdComp
    Snamefile strcat gSdirSco, Snamefile
    fprints Snamefile, "\n; =========================="
    fprints Snamefile, "\n; -- COMPORTAMENTO %d\n", i_IdComp
    Srhythms = ""
    Spos=""
    idx=0
    while idx<ftlen(i_RitmiTab) do
        Srhythms strcat Srhythms, sprintf("%d ",tab_i(idx, i_RitmiTab))
        idx+=1
    od
    idx=0
    while idx<ftlen(i_PosTab) do
        Spos strcat Spos, sprintf("%d ",tab_i(idx, i_PosTab))
        idx+=1
    od
    fprints Snamefile, "; - Atk\t\t\tDur\t\t\tRhythmtab\t\tDurataArmonica\tAmpiezza\tOttava\tRegistro\tPositiontab\n"
    fprints Snamefile, "; - %.3f\t\t%.3f\t\t[%s]\t\t%.3f\t\t\t%.3f\t\t%d\t\t%d\t\t\t[%s]\t\t", p2, p3, Srhythms, p5, p6, p7, p8, Spos
    ; Mostra informazioni debug iniziali se richiesto
    if int(i_debug) >= 1 then
        prints "\n\t\t=========================================\n"
        prints "\t\t\tdentro comportamento %d\n", i_IdComp
    endif
    ; -----------------------------------------------------------------------
    ; 2. PREPARAZIONE DELLE SEQUENZE RITMICHE E POSIZIONALI
    ; -----------------------------------------------------------------------
    ; Ottieni la lunghezza effettiva dei ritmi disponibili
    i_LenRitmiTab = ftlen(i_RitmiTab)

    ; Creiamo una tabella temporanea abbastanza grande da contenere 
    ; anche i ritmi che verranno generati algoritmicamente. perché ne ho bisogno?
    ; perché devo dare in pasto alla dnl il ritmo precedente per generare il successivo
    i_TempRitmiTab ftgen 0, 0, i_LenRitmiTab + 100, -2, 0

    ; Copiamo i ritmi dalla tabella di input nella tabella temporanea
    i_IndexCopy = 0
    while i_IndexCopy < i_LenRitmiTab do
        i_ValRitmo tab_i i_IndexCopy, i_RitmiTab
        tabw_i i_ValRitmo, i_IndexCopy, i_TempRitmiTab
        i_IndexCopy += 1
    od

    ; -----------------------------------------------------------------------
    ; 3. GENERAZIONE DEGLI EVENTI SONORI
    ; -----------------------------------------------------------------------
    i_EventIdx = 0     ; Indice dell'evento corrente
    i_whileTime = 0  ; Tempo cumulativo per il ciclo

    ; Continua a generare eventi finché non raggiungiamo la durata specificata
    while i_whileTime < i_Durata do
        ; -------- 3.1 GESTIONE RITMI --------
        ; Determina il ritmo corrente dalla tabella o genera un nuovo ritmo se necessario
        if i_EventIdx < i_LenRitmiTab then
            ; Usa un ritmo esistente dalla tabella
            i_RitmoCorrente tab_i i_EventIdx, i_TempRitmiTab
            $DEBUG_Comp4  ; Debug    
            ; Ottieni anche il ritmo precedente (per il calcolo dell'attacco)
            if i_EventIdx == 0 then
                i_Vecchio_Ritmo = 1  ; Valore default per il primo evento
            else
                i_Vecchio_Ritmo tab_i i_EventIdx-1, i_TempRitmiTab
            endif
        else
           ; Genera un nuovo ritmo basato sull'ultimo ritmo utilizzato
           i_Vecchio_Ritmo tab_i i_EventIdx-1, i_TempRitmiTab
           $DEBUG_Comp5  ; Debug    
           ; Genera un nuovo ritmo usando la funzione non lineare
           i_RitmoCorrente NonlinearFunc i_Vecchio_Ritmo
           $DEBUG_Comp4  ; Debug    
           ; Salva il nuovo ritmo nella tabella temporanea
           tabw_i i_RitmoCorrente, i_EventIdx, i_TempRitmiTab
        endif

        ; -------- 3.2 CALCOLO TEMPO DI ATTACCO --------
        ; Calcola il tempo di attacco per questo evento
        if i_EventIdx == 0 then
           ; Il primo evento inizia all'inizio del comportamento
            i_EventAttack = i_CAttacco
        else
           ; Gli eventi successivi dipendono dal ritmo precedente
            i_RitmoNormalizzato = 1/i_Vecchio_Ritmo
            i_PreviousAttack tab_i gi_Index-1, gi_eve_attacco
            i_EventAttack = i_DurataArmonica * i_RitmoNormalizzato + i_PreviousAttack
        endif

        ; -------- 3.3 CALCOLO PARAMETRI DELL'EVENTO --------
        ; Calcola l'ampiezza con smorzamento
        i_Amp = calcAmpiezza(i_Ampiezza, i_RitmoCorrente, -0.05)

        ; Calcola la frequenza basata su ottava, registro e ritmo
        i_Freq1 = calcFrequenza(i_Ottava, i_Registro, i_RitmoCorrente, gi_Intonazione, $INTERVALLI, $REGISTRI)
        i_Freq2 = i_Freq1  ; Frequenza finale uguale all'iniziale per ora

        ; Determina la posizione - prova a usare la tabella delle posizioni se disponibile,
        ; altrimenti genera casualmente
        if i_EventIdx < ftlen(i_PosTab) then
            i_Pos tab_i i_EventIdx, i_PosTab
        else
            ; Posizione casuale entro il range del ritmo
            i_Pos = int(random:i(0, i_RitmoCorrente))
        endif

        ; -------- 3.4 CALCOLO DURATA ADATTATIVA --------
        ; Calcola la durata dell'evento in base al contesto musicale
        i_GlobalTime = i_whileTime + i_CAttacco
        i_LookbackTime = max(0, i_GlobalTime - 30)  ; Analizza gli ultimi 30 secondi

        ; Ottieni un fattore di durata basato sulla sovrapposizione di eventi nel contesto
        i_OverlapFactor = suggestDurationFactor(i_LookbackTime, i_GlobalTime, i_RitmoCorrente)

        ; Gestione della fase iniziale (bootstrap)
        if gi_Index < 10 then
            if i_debug >= 1 then
                prints "MODALITÀ BOOTSTRAP: Forzatura durata evento\n"
            endif
            i_EventDuration = (i_DurataArmonica/i_RitmoCorrente) * 3.0
        else
            ; Calcola la durata adattativa dell'evento
            i_EventDuration = (i_DurataArmonica/i_RitmoCorrente) * i_OverlapFactor
        endif
        ; -------- 3.5 MEMORIZZAZIONE DELL'EVENTO NELLE TABELLE GLOBALI --------
        ; Salva tutti i parametri dell'evento nelle tabelle globali
        tabw_i i_EventAttack,    gi_Index, gi_eve_attacco
        tabw_i i_EventDuration,  gi_Index, gi_eve_durata  
        tabw_i i_Amp,            gi_Index, gi_eve_ampiezza
        tabw_i i_Freq1,          gi_Index, gi_eve_frequenza1
        tabw_i i_Freq2,          gi_Index, gi_eve_frequenza2 
        tabw_i i_Pos,            gi_Index, gi_eve_posizione
        tabw_i i_RitmoCorrente,  gi_Index, gi_eve_hr
        tabw_i i_Freq2,          gi_Index, gi_eve_ifn
        tabw_i i_IdComp,         gi_Index, gi_eve_comportamento
        iLastStr = (i_whileTime+(i_DurataArmonica/NonlinearFunc(i_RitmoCorrente)) >= i_Durata ? 1 : 0)
        ; -------- 3.6 SCHEDULING DELL'EVENTO SONORO --------
        ; Schedula l'evento sonoro con tutti i parametri calcolati
        schedule "eventoSonoro", i_EventAttack-p2, i_EventDuration, i_Amp, i_Freq1, 
                i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index, i_IdComp,iLastStr
        /*
        SentireSco sprintf "%sAll.sco", gSdirSco
        fprints Snamefile,"\n\n\t;\t\t\t\t\t\tattacco:\tdurata:\t\tamp:\t\tfreq1:\t\t\twz:\t\tHR:\t\tfreq2:\t\t\tifn:\tid_evento:\tid_comp:\tiLastStr:"
        fprints Snamefile,"\n\ti \"eventoSonoro\"\t\t%.3f\t\t%.3f\t\t%.3f\t\t%f\t\t%d\t\t%d\t\t%f\t\t%d\t\t%d\t\t\t%d\t\t\t%d", i_EventAttack, i_EventDuration, i_Amp, i_Freq1, i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index, i_IdComp, iLastStr 
        fprints SentireSco,"\n\n\t; [comp %d]\t\t\t\tattacco:\tdurata:\t\tamp:\t\tfreq1:\t\t\twz:\t\tHR:\t\tfreq2:\t\t\tifn:\tid_evento:\tid_comp:\tiLastStr:", i_IdComp
        fprints SentireSco,"\n\ti \"eventoSonoro\"\t\t%.3f\t\t%.3f\t\t%.3f\t\t%f\t\t%d\t\t%d\t\t%f\t\t%d\t\t%d\t\t\t%d\t\t\t%d", i_EventAttack, i_EventDuration, i_Amp, i_Freq1, i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index, i_IdComp, iLastStr 
        */
        ; -------- 3.7 AGGIORNAMENTO DEGLI INDICI E DEL TEMPO --------
        i_EventIdx += 1          ; Prossimo evento
        gi_Index += 1            ; Incrementa l'indice globale degli eventi
        i_whileTime += (i_DurataArmonica/i_RitmoCorrente)  ; Aggiorna il tempo corrente
    od
    $DEBUG_CompEND
endin


instr Salvatore
    saveFtablesBehavior
    saveFtablesEvents
endin

instr initial
    ipino system_i 1, "mkdir -p ./sco"
    ; Initialize generator for Pythagorean frequencies
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 1 then
        prints "GenPythagFreqs: Success!\n"
    else
        prints "GenPythagFreqs failed: %d\n", i_Res
        turnoff
    endif
endin
; ==========================================================================
; CONTEXT SIMULATOR
; Simulates changing musical context parameters over time
; ==========================================================================
instr ContextSimulator
    
    ; Select test tab_ile based on mode
    itab = 0
    if gi_test_mode == 0 then
        itab = gi_test_dense
        prints "\n=== TEST MODE: DENSE CONTEXT ===\n"
    elseif gi_test_mode == 1 then
        itab = gi_test_sparse
        prints "\n=== TEST MODE: SPARSE CONTEXT ===\n"
    else
        itab = gi_test_fluctuating
        prints "\n=== TEST MODE: FLUCTUATING CONTEXT ===\n"
    endif
    
    ; Update rate (Hz)
    iupdate_rate =1
    
    ; Create metro for regular updates
    ktrig metro iupdate_rate
    ;printks "this is ktrig %d\n", iupdate_rate, ktrig
    kIdx init 0
    iLimiter = ftlen(itab)
    if ktrig == 1 then
        gk_current_overlap tab kIdx%iLimiter, itab
        ktime times
        tabw gk_current_overlap, ktime , gi_memory_overlap
        ;printks "kIdx %d\n", iupdate_rate, kIdx
        ;printks "gk_current_overlap %d\n", iupdate_rate,gk_current_overlap
        ;printks "%.f è il valore di gi_memory_overlap\n", iupdate_rate, tab(int(ktime), gi_memory_overlap)
        ;printks "ktime: %.4f",iupdate_rate, ktime
        kIdx +=1
    endif
endin

; ==========================================================================
; TEST BEHAVIOR GENERATOR
; Schedules test behaviors with different parameters
; ==========================================================================
instr TestGenerator
    ; Schedule a context simulator
    
    ; Schedule test behaviors at different times
    schedule "ContextSimulator", 0, p3
    ; Basic test behavior 1 (standard)
    iAtt1 = 2
    iDur1 = 60
    iRitmitable1 ftgen 0, 0,4 , -2, 3, 4, 5, 6
    iDurArm1 = 20
    iAmp1 = -12
    iOct1 = 7
    iReg1 = 1
    iPostable1 ftgen 0, 0, 4, -2, 0, 1, 2, 3
    iRhythmArr[] init ftlen(iRitmitable1)
    iPosArr[] init ftlen(iPostable1)
    copyf2array iRhythmArr, iRitmitable1
    copyf2array iPosArr, iPostable1
    ; Schedule the first behavior
    schedule "Comportamento", 0, iDur1, iRitmitable1, iDurArm1, iAmp1, iOct1, iReg1, iPostable1, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2, iDur1, iDurArm1, iAmp1, iOct1, iReg1
    schedule "Comportamento", 0+2, iDur1, iRitmitable1, iDurArm1, iAmp1, iOct1-1, iReg1, iPostable1, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2+2, iDur1, iDurArm1, iAmp1, iOct1-1, iReg1
    schedule "Comportamento", 0+7, iDur1, iRitmitable1, iDurArm1, iAmp1, iOct1, iReg1-7, iPostable1, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2+7, iDur1, iDurArm1, iAmp1, iOct1, iReg1-7
    schedule "Comportamento", 0+10, iDur1, iRitmitable1, iDurArm1, iAmp1, iOct1, iReg1-4, iPostable1, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2+10, iDur1, iDurArm1, iAmp1, iOct1, iReg1-4
    ; Test behavior 2 (sparse, higher register)
    iAtt2 = 12
    iDur2 = 40
    iRitmitable2 ftgen 0, 0, 4, -2, 10, 12, 15, 18
    iDurArm2 = 8
    iAmp2 = -12
    iOct2 = 4
    iReg2 = 3
    iPostable2 ftgen 0, 0, 4, -2, 5, 6, 7, 8
    iRhythmArr2[] init ftlen(iRitmitable2)
    iPosArr2[] init ftlen(iPostable2)
    copyf2array iRhythmArr2, iRitmitable2
    copyf2array iPosArr2, iPostable2
    
    ; Schedule the second behavior
    schedule "Comportamento", p2+iAtt2, iDur2, iRitmitable2, iDurArm2, iAmp2, iOct2, iReg2, iPostable2, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr2, iPosArr2, p2+iAtt2, iDur2, iDurArm2, iAmp2, iOct2, iReg2
    schedule "Comportamento", p2+iAtt2+5, iDur2, iRitmitable2, iDurArm2, iAmp2, iOct2, iReg2+2, iPostable2, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr2, iPosArr2, p2+iAtt2+5, iDur2, iDurArm2, iAmp2, iOct2, iReg2+2
    schedule "Comportamento", p2+iAtt2+9, iDur2, iRitmitable2, iDurArm2, iAmp2, iOct2, iReg2+7, iPostable2, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr2, iPosArr2, p2+iAtt2+9, iDur2, iDurArm2, iAmp2, iOct2, iReg2+7

    ; Test behavior 3 (dense, lower register)
    iAtt3 = 22
    iDur3 = 50
    iRitmitable3 ftgen 0, 0, 4, -2, 2, 3, 4, 5
    iDurArm3 = 15
    iAmp3 = -9
    iOct3 = 2
    iReg3 = 8
    iPostable3 ftgen 0, 0, 4, -2, 1, 2, 1, 2
    iRhythmArr3[] init ftlen(iRitmitable3)
    iPosArr3[] init ftlen(iPostable3)
    copyf2array iRhythmArr3, iRitmitable3
    copyf2array iPosArr3, iPostable3
    
    ; Schedule the third behavior
    schedule "Comportamento", p2+iAtt3, iDur3, iRitmitable3, iDurArm3, iAmp3, iOct3, iReg3, iPostable3, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr3, iPosArr3, p2+iAtt3, iDur3, iDurArm3, iAmp3, iOct3, iReg3
    schedule "Comportamento", p2+iAtt3+4, iDur3, iRitmitable3, iDurArm3, iAmp3, iOct3, iReg3+1, iPostable3, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr3, iPosArr3, p2+iAtt3+4, iDur3, iDurArm3, iAmp3, iOct3, iReg3+1
    schedule "Comportamento", p2+iAtt3+10, iDur3, iRitmitable3, iDurArm3, iAmp3, iOct3-1, iReg3, iPostable3, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr3, iPosArr3, p2+iAtt3+10, iDur3, iDurArm3, iAmp3, iOct3-1, iReg3
    schedule "Comportamento", p2+iAtt3+7, iDur3, iRitmitable3, iDurArm3, iAmp3, iOct3, iReg3-2, iPostable3, gi_compId
    iComp storeTransitionBehaviorParameters iRhythmArr3, iPosArr3, p2+iAtt3+7, iDur3, iDurArm3, iAmp3, iOct3, iReg3-2


endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 [2^20] 6 0 [2^19] .5 [2^19] 1
; Test each context mode sequentially
i "initial" 0 3
i "TestGenerator" 0 60 ; Test with dense context
;i "Salvatore" 180 1
i "TestGenerator" 60 60 ; Test with sparse context
i "TestGenerator" 120 60 ; Test with fluctuating context

e 20
</CsScore>
</CsoundSynthesizer>