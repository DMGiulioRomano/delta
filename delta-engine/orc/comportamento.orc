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
            i_PreviousAttack tab_i i_EventIdx-1, gi_eve_attacco
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

        ; Debug dell'adattamento della durata
        if i_debug >= 2 then
            prints  "Evento %d:\n", i_EventIdx
            printks "Sovrapposizione=%.3f ",0, gk_current_overlap
            prints  "Ritmo=%d, Fattore=%.2f, Durata=%.2f\n", 
                i_RitmoCorrente, i_OverlapFactor, i_EventDuration
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
                i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index, i_IdComp

        ; -------- 3.7 AGGIORNAMENTO DEGLI INDICI E DEL TEMPO --------
        i_EventIdx += 1          ; Prossimo evento
        gi_Index += 1            ; Incrementa l'indice globale degli eventi
        i_whileTime += (i_DurataArmonica/i_RitmoCorrente)  ; Aggiorna il tempo corrente
    od

    ; -----------------------------------------------------------------------
    ; 4. SALVATAGGIO E ANALISI DEI DATI
    ; -----------------------------------------------------------------------
    ; Crea la directory per i dati dei comportamenti
    i_tmp_res system_i 1, "mkdir -p ./docs/tablesData", 0

    ; Genera il nome del file
    Snd sprintf "docs/tablesData/comp%d.table", i_IdComp

    ; Salva i dati del comportamento per analisi
    ftsave Snd, 1, gi_comp_ATTACCO, i_RitmiTab, gi_comp_DURARMONICA, 
           gi_comp_DURATA, gi_comp_AMPIEZZA, gi_comp_OTTAVA, gi_comp_REGISTRO, i_PosTab

    ; Esegui lo script Python di visualizzazione
    Scmd sprintf "python3.11 docs/plot.py %s", Snd
    i_tmp_res system_i 1, Scmd, 0

    ; Debug finale
    $DEBUG_CompEND
endin
