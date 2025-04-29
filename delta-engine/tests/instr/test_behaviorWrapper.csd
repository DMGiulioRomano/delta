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
;#include "../../orc/comportamento.orc"
;#include "../../orc/behaviorWrapper.orc"
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
    prints "i_RitmiTab dentro comportamento\n"
    ftprint i_RitmiTab
    ; Continua a generare eventi finché non raggiungiamo la durata specificata
    while i_whileTime < i_Durata do
        ; -------- 3.1 GESTIONE RITMI --------
        ; Determina il ritmo corrente dalla tabella o genera un nuovo ritmo se necessario
        if i_EventIdx < i_LenRitmiTab then
            ; Usa un ritmo esistente dalla tabella 
            i_RitmoCorrente tab_i i_EventIdx, i_TempRitmiTab
            if i_RitmoCorrente == 0 then
                igoto insideElse
            endif
            $DEBUG_Comp4  ; Debug    
            ; Ottieni anche il ritmo precedente (per il calcolo dell'attacco)
            if i_EventIdx == 0 then
                i_Vecchio_Ritmo = 1  ; Valore default per il primo evento
            else
                i_Vecchio_Ritmo tab_i i_EventIdx-1, i_TempRitmiTab
            endif
        else
            insideElse:
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
        tabw_i 2,                gi_Index, gi_eve_ifn
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


instr BehaviorWrapper
    ; Input parameters
    iIdComp = p4       ; Behavior ID (ora è l'unico parametro necessario)
    
    ; Leggi i parametri dalle tabelle globali usando l'ID del comportamento
    ; Recupera i parametri principali
    i_Attacco tab_i iIdComp, gi_comp_ATTACCO       ; Tempo di attacco
    i_Durata tab_i iIdComp, gi_comp_DURATA         ; Durata complessiva
    i_DurArmonica tab_i iIdComp, gi_comp_DURARMONICA ; Durata armonica
    i_Ampiezza tab_i iIdComp, gi_comp_AMPIEZZA     ; Ampiezza in dB
    i_Ottava tab_i iIdComp, gi_comp_OTTAVA         ; Ottava
    i_Registro tab_i iIdComp, gi_comp_REGISTRO     ; Registro
    
    ; Calcola gli indici base per ritmi e posizioni (ogni blocco occupa 11 elementi)
    i_RitmiBaseIndex = iIdComp * 11
    i_PosBaseIndex = iIdComp * 11
    
    ; Leggi quanti ritmi e posizioni ci sono effettivamente
    i_NumRitmi tab_i i_RitmiBaseIndex, gi_comp_RITMI
    i_NumPos tab_i i_PosBaseIndex, gi_comp_POSIZIONI
    
    ; Crea tabelle temporanee per i ritmi e le posizioni
    i_RitmiTab ftgen 0, 0, i_NumRitmi+1, -2, 0  ; +1 per sicurezza
    i_PosTab ftgen 0, 0, i_NumPos+1, -2, 0      ; +1 per sicurezza
    
    ; Copia i valori nelle tabelle temporanee
    i_Idx = 0
    while (i_Idx < i_NumRitmi) do
        i_Ritmo tab_i i_RitmiBaseIndex + 1 + i_Idx, gi_comp_RITMI  ; +1 perché il primo è la lunghezza
        prints "i_Ritmo: %d, i_Idx: %d,i_RitmiTab len: %d, index real: %d\n", i_Ritmo, i_Idx, ftlen(i_RitmiTab), i_RitmiBaseIndex + 1 + i_Idx
        tabw_i i_Ritmo, i_Idx, i_RitmiTab
        i_Idx += 1
    od
    
    i_Idx = 0
    while (i_Idx < i_NumPos) do
        i_Pos tab_i i_PosBaseIndex + 1 + i_Idx, gi_comp_POSIZIONI  ; +1 perché il primo è la lunghezza
        tabw_i i_Pos, i_Idx, i_PosTab
        i_Idx += 1
    od
    
    ; Debug output se richiesto
    if (gi_debug >= 2) then
        prints "GeneraComportamenti: Comportamento %d\n", iIdComp
        prints "  Parametri: Attacco=%.2f, Durata=%.2f, DurArmonica=%.2f\n", 
               i_Attacco, i_Durata, i_DurArmonica
        prints "  Ottava=%d, Registro=%d, Ampiezza=%.2f\n", 
               i_Ottava, i_Registro, i_Ampiezza
        prints "  Numero ritmi: %d, Numero posizioni: %d\n", 
               i_NumRitmi, i_NumPos
        prints "========\ni_RitmiTab\n"
        ftprint i_RitmiTab
        prints "--------"

    endif
    
    ; Verifica la validità dei parametri (usando il Validator esistente)
    ; i_Res = Validator(i_Durata, i_RitmiTab, i_DurArmonica, i_Ampiezza, i_Ottava, i_Registro, i_PosTab, iIdComp)
    
    ; Schedule del comportamento con i parametri validati
    schedule "Comportamento", i_Attacco, i_Durata, i_RitmiTab, i_DurArmonica, i_Ampiezza, i_Ottava, i_Registro, i_PosTab, iIdComp
endin

instr Salvatore
    saveFtablesBehavior
    saveFtablesEvents
endin

instr initial
    gi_compId = 0
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
    schedule "ContextSimulator", 0, p3
    i_time=0
    while i_time < p3 do
        iAtt = 2 + i_time
        iDur = 60 - i_time/2
        iRitmitable ftgen 0, 0,4 , -2, 3, 4, 5, 6
        iDurArm = 20 - i_time/2
        iAmp = -12 - i_time/4
        iOct = 9 - int(i_time/10)
        iReg = 1
        iPostable ftgen 0, 0, 4, -2, 0, 1, 2, 3
        iRhythmArr[] init ftlen(iRitmitable)
        iPosArr[] init ftlen(iPostable)
        copyf2array iRhythmArr, iRitmitable
        copyf2array iPosArr, iPostable
        iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2+iAtt, iDur, iDurArm, iAmp, iOct, iReg
        schedule "BehaviorWrapper", 0, 1, iComp
        i_time+=5
    od
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 [2^20] 6 0 [2^19] .5 [2^19] 1
; Test each context mode sequentially
i "initial" 0 3
i "TestGenerator" 0 60 ; Test with dense context
i "Salvatore" 180 1
e
i "TestGenerator" 60 60 ; Test with sparse context
i "TestGenerator" 120 60 ; Test with fluctuating context

e 20
</CsScore>
</CsoundSynthesizer>