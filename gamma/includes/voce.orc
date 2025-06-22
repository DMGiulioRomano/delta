; ===========================================================================
; comportamento.orc (Versione pulita e modificata per il generatore di gamma)
; Generatore di eventi sonori.
; ===========================================================================
instr Voce
    ; -----------------------------------------------------------------------
    ; 1. INIZIALIZZAZIONE E ACQUISIZIONE PARAMETRI
    ; -----------------------------------------------------------------------
    i_CAttacco       = p2             ; Tempo di attacco del comportamento
    i_Durata         = p3             ; Durata complessiva
    i_RitmiTab       = p4             ; Tabella dei ritmi
    i_DurataArmonica = p5             ; Durata armonica di riferimento
    i_DynamicIndex   = p6         
    i_Ottava         = p7             ; Ottava
    i_Registro       = p8             ; Registro
    i_PosTab         = p9             ; Tabella delle posizioni
    i_IdComp         = p10            ; ID del comportamento
    ; Nuovo parametro per la modalità di NonlinearFunc. Default a 3 (caos vero) se non fornito.
    i_NonlinearMode  = (p11 == 0 ? 3 : p11)
    i_SensoMovimento = (p12 == 0 ? 1 : p12) ; <-- NUOVO: Riceve p12, default a 1 (antiorario)
    i_ifnAttacco     = (p13 == 0 ? 10 : p13) ; <-- NUOVO: Riceve p13, default a 10 (lineare)
    ; Se p14 è 0 (o non fornito), non ci sarà inviluppo di sezione.
    i_ifn_section_env = p14 
    i_section_start_time = p15
    i_duration_leeway = p17
    i_section_duration = p16 + p17
    i_section_end = i_section_start_time + i_section_duration
    iSafetyBuffer = p18
    ; -----------------------------------------------------------------------
    ; 2. PREPARAZIONE DELLE SEQUENZE
    ; -----------------------------------------------------------------------
    i_LenRitmiTab = ftlen(i_RitmiTab)
    i_TempRitmiTab ftgen 0, 0, i_LenRitmiTab + 10000, -2, 0 ; Tabella estendibile per nuovi ritmi
    
    ; Copia i ritmi iniziali nella tabella temporanea
    i_IndexCopy = 0
    while i_IndexCopy < i_LenRitmiTab do
        i_ValRitmo tab_i i_IndexCopy, i_RitmiTab
        tabw_i i_ValRitmo, i_IndexCopy, i_TempRitmiTab
        i_IndexCopy += 1
    od

    ; -----------------------------------------------------------------------
    ; 3. GENERAZIONE DEGLI EVENTI SONORI
    ; -----------------------------------------------------------------------
    i_EventIdx = 0
    i_whileTime = 0

    while i_whileTime < i_Durata do
        ; -------- 3.1 GESTIONE RITMI --------
        if i_EventIdx < i_LenRitmiTab then
            i_RitmoCorrente tab_i i_EventIdx, i_TempRitmiTab
            if i_RitmoCorrente == 0 then
                goto generateNewRhythm
            endif
            i_Vecchio_Ritmo = (i_EventIdx == 0) ? 1 : tab_i(i_EventIdx - 1, i_TempRitmiTab)
        else
            generateNewRhythm:
           i_Vecchio_Ritmo tab_i i_EventIdx - 1, i_TempRitmiTab
           ; **MODIFICA CHIAVE**: Passa la modalità alla NonlinearFunc
           i_RitmoCorrente NonlinearFunc i_Vecchio_Ritmo, i_NonlinearMode
           tabw_i i_RitmoCorrente, i_EventIdx, i_TempRitmiTab
        endif

        ; -------- 3.2 CALCOLO TEMPO DI ATTACCO --------
        if i_EventIdx == 0 then
            i_EventAttack = i_CAttacco
        else
            i_RitmoNormalizzato = 1 / i_Vecchio_Ritmo
            i_PreviousAttack tab_i gi_Index - 1, gi_eve_attacco
            i_EventAttack = i_DurataArmonica * i_RitmoNormalizzato + i_PreviousAttack
        endif

        ; -------- 3.3 CALCOLO PARAMETRI DELL'EVENTO --------
        i_Freq1 = calcFrequenza(i_Ottava, i_Registro, i_RitmoCorrente)
        i_Freq2 = i_Freq1
        i_Amp = GetIsoAmp(i_Freq1, i_DynamicIndex)

        if i_EventIdx < ftlen(i_PosTab) then
            i_Pos tab_i i_EventIdx, i_PosTab
        else
            i_Pos = int(random:i(0, i_RitmoCorrente))
        endif

        ; -------- 3.4 CALCOLO DURATA ADATTATIVA --------
        i_GlobalTime = i_whileTime + i_CAttacco
        i_LookbackTime = max(0, i_GlobalTime - 5)

        i_OverlapFactor random 1, 3
        
        i_EventDuration = (i_DurataArmonica / i_RitmoCorrente) * i_OverlapFactor
        
        if i_EventAttack + i_EventDuration > i_section_end then 
            if iSafetyBuffer == 1 then
                prints "voce %d, Evento %d attacco: %f durata: %f fine: %f fine sezione: %f\n", i_IdComp, i_EventIdx, i_EventAttack, i_EventDuration, i_EventAttack+i_EventDuration, i_section_end
                i_EventDuration = i_section_end - i_EventAttack + random:i(0, i_duration_leeway)
                prints "nuova durata: %f, nuova fine: %f\n",  i_EventDuration,  i_EventAttack+i_EventDuration
            endif
        endif

        ; -------- 3.5 MEMORIZZAZIONE EVENTO (Per calcoli interni) --------
        tabw_i i_EventAttack, gi_Index, gi_eve_attacco
        ; ... le altre scritture su tabella `gi_eve_*` non sono necessarie per la sola generazione audio,
        ; ma `i_EventAttack` serve per il calcolo del prossimo attacco.

        if i_RitmoCorrente < 1 then
            prints "ERROR\n"
            prints "Voce %d, Evento %d: Passo i_RitmoCorrente = %f a eventoSonoro\n", i_IdComp, i_EventIdx, i_RitmoCorrente
            exitnow
        endif
        ; -------- 3.6 SCHEDULING DELL'EVENTO SONORO --------
        schedule "eventoSonoro", i_EventAttack - p2, i_EventDuration, i_Amp, i_Freq1, i_Pos,
            i_RitmoCorrente, i_Freq2, i_ifnAttacco, gi_Index,i_IdComp, i_SensoMovimento, i_ifn_section_env, i_section_start_time, i_section_duration

        ; -------- 3.7 AGGIORNAMENTO INDICI E TEMPO --------
        i_EventIdx += 1
        gi_Index += 1
        i_whileTime += (i_DurataArmonica / i_RitmoCorrente)
    od
    ftfree i_TempRitmiTab, 0
endin
