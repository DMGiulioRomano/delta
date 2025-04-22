<CsoundSynthesizer>
<CsOptions>
-m0 ; Disabilita l'audio, è un test funzionale
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Variabili globali necessarie
gi_debug init 3                 ; Livello debug alto per vedere tutti i messaggi
gi_asp_transition_count init 0  ; Contatore transizioni
gi_asp_history_index init 0     ; Indice della cronologia
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0  ; Matrice di transizione vuota

; Stato corrente
gi_tc_source_density init 1
gi_tc_source_register init 1
gi_tc_source_movement init 1

; Tabella per cronologia transizioni (100 transizioni con 7 valori ciascuna)
; Formato: [from_state, to_state, quality, feature1, feature2, feature3, feature4]
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0

; UDO da testare
opcode detectPatternsAndAdapt, 0, ii
    iPatternThreshold, iDebugLevel xin
    
    ; Default values if not provided
    iPatternThreshold = (iPatternThreshold == 0) ? 3 : iPatternThreshold
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Check if we have enough transitions to detect patterns
    if (gi_asp_transition_count < 3) then
        igoto end
    endif
    
    ; Look for repeating patterns in last N transitions
    iMaxPatternLength = 4  ; Maximum pattern length to check for
    
    ; Extract last 10 transitions
    iLastTransitions[] init 10
    ; Determiniamo quante transizioni considerare
    iCount = min(gi_asp_transition_count, 10)
    iOldestIdx = (gi_asp_history_index - iCount + 100) % 100
    
    iHistoryIdx = 0
    while (iHistoryIdx < iCount) do
        ; Calcoliamo la posizione corrente (partendo dalla più vecchia)
        iActualIdx = (iOldestIdx + iHistoryIdx) % 100
        
        ; Extract destination state
        iEntryBase = iActualIdx * 7
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        
        iLastTransitions[iHistoryIdx] = iToState
        iHistoryIdx += 1
    od

    ; Mostra le transizioni lette per debug
    if (iDebugLevel >= 2) then
        prints "Transizioni lette in ordine cronologico: ["
        iIdx = 0
        while (iIdx < iCount) do
            prints "%d%s", iLastTransitions[iIdx], (iIdx < iCount-1 ? ", " : "")
            iIdx += 1
        od
        prints "]\n"
    endif
 
    ; Check for patterns
    iPatternLength = 2
    while (iPatternLength <= iMaxPatternLength) do
        ; Check if last transitions match pattern
        iIsPattern = 1
        
        iCheckIdx = 0
        while (iCheckIdx < iPatternLength && iCheckIdx + iPatternLength < 10) do
            if (iLastTransitions[iCheckIdx] != iLastTransitions[iCheckIdx + iPatternLength]) then
                iIsPattern = 0
                igoto not_pattern
            endif
            iCheckIdx += 1
        od
        
        ; If we get here, we found a repeating pattern
        if (iIsPattern == 1 && iCheckIdx >= iPatternThreshold) then
            ; Pattern detected - modify transition matrix to break it
            if (iDebugLevel >= 1) then
                prints "Detected repeating pattern of length %d in transitions\n", iPatternLength
                prints "Adding randomness to transition matrix to break pattern\n"
            endif
            
            ; Find current state
            iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
            
            ; **SOLUZIONE CORRETTA**: Identifica quali stati seguono lo stato corrente nel pattern
            iFoundStates[] init 27    ; Array per contare quante volte uno stato segue lo stato corrente
            iPatternIdx = 0
            while (iPatternIdx < iPatternLength) do
                ; Se questo stato nel pattern è lo stato corrente...
                if (iLastTransitions[iPatternIdx] == iCurrentStateIdx) then
                    ; ...allora prendi lo stato che lo segue nel pattern
                    iNextPatternIdx = (iPatternIdx + 1) % iPatternLength
                    iNextState = iLastTransitions[iNextPatternIdx]
                    
                    ; Conta questo stato
                    iFoundStates[iNextState] = iFoundStates[iNextState]+1
                    
                    if (iDebugLevel >= 1) then
                        prints "Trovato stato corrente %d in posizione %d, seguito da %d\n", 
                               iCurrentStateIdx, iPatternIdx, iNextState
                    endif
                endif
                iPatternIdx += 1
            od
            
            ; Se non abbiamo trovato lo stato corrente nel pattern, usa il primo stato come predizione
            iFoundAny = 0
            iStateIdx = 0
            while (iStateIdx < 27 && iFoundAny == 0) do
                if (iFoundStates[iStateIdx] > 0) then
                    iFoundAny = 1
                endif
                iStateIdx += 1
            od
            
            if (iFoundAny == 0) then
                ; Non abbiamo trovato lo stato corrente nel pattern, usa il primo elemento
                iNextPatternState = iLastTransitions[0]
                
                ; Riduci questa probabilità
                iCurrentProb tab_i iCurrentStateIdx*27+iNextPatternState, gi_transition_matrix
                iReducedProb = iCurrentProb * 0.7  ; Reduce by 30%
                tabw_i iReducedProb, iCurrentStateIdx*27+iNextPatternState, gi_transition_matrix
                
                if (iDebugLevel >= 1) then
                    prints "Stato corrente %d non trovato nel pattern, riducendo prob. verso %d\n", 
                           iCurrentStateIdx, iNextPatternState
                    prints "iCurrentStateIdx = %d, iNextPatternState = %d\n", 
                           iCurrentStateIdx, iNextPatternState
                    prints "Riducendo probabilità da %.4f a %.4f\n", 
                           iCurrentProb, iReducedProb
                    prints "Probabilità target PRIMA modifica: %.4f\n", iCurrentProb
                    prints "Probabilità target DOPO modifica ma PRIMA norm: %.4f\n", iReducedProb
                endif
            else
                ; Riduci la probabilità per TUTTI gli stati che seguono lo stato corrente nel pattern
                iStateIdx = 0
                while (iStateIdx < 27) do
                    if (iFoundStates[iStateIdx] > 0) then
                        iCurrentProb tab_i iCurrentStateIdx*27+iStateIdx, gi_transition_matrix
                        iReducedProb = iCurrentProb * 0.7
                        tabw_i iReducedProb, iCurrentStateIdx*27+iStateIdx, gi_transition_matrix
                        
                        if (iDebugLevel >= 1) then
                            prints "Riducendo probabilità %d->%d da %.4f a %.4f\n", 
                                   iCurrentStateIdx, iStateIdx, iCurrentProb, iReducedProb
                        endif
                    endif
                    iStateIdx += 1
                od
            endif
            
            ; Re-normalize row
            iSum = 0
            iToIdx = 0
            while (iToIdx < 27) do
                iProb tab_i iCurrentStateIdx*27+iToIdx, gi_transition_matrix
                iSum += iProb
                iToIdx += 1
            od
            
            if (iDebugLevel >= 1) then
                prints "Somma probabilità prima norm: %.4f\n", iSum
            endif
            
            if (iSum > 0) then
                iToIdx = 0
                while (iToIdx < 27) do
                    iProb tab_i iCurrentStateIdx*27+iToIdx, gi_transition_matrix
                    iNormProb = iProb / iSum
                    tabw_i iNormProb, iCurrentStateIdx*27+iToIdx, gi_transition_matrix
                    iToIdx += 1
                od
            endif
            
            ; Return after modification
            igoto end
        endif
        
        not_pattern:
        iPatternLength += 1
    od
    end:
endop

; TEST 1: Pattern semplice alternato
instr TestPatternSemplice
    prints "\n=== TEST 1: Pattern Alternato [5,7,5,7,5,7] ===\n"
    
    ; Reset tabella cronologia
    iIdx = 0
    while iIdx < 100*7 do
        tabw_i 0, iIdx, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Crea pattern alternato 5-7
    ; Transizione 1: stato 5
    tabw_i 2, 0, gi_asp_transition_history     ; from_state
    tabw_i 5, 1, gi_asp_transition_history     ; to_state = 5
    tabw_i 0.8, 2, gi_asp_transition_history   ; quality
    
    ; Transizione 2: stato 7
    tabw_i 5, 7, gi_asp_transition_history     ; from_state
    tabw_i 7, 8, gi_asp_transition_history     ; to_state = 7
    tabw_i 0.8, 9, gi_asp_transition_history   ; quality
    
    ; Transizione 3: stato 5
    tabw_i 7, 14, gi_asp_transition_history    ; from_state
    tabw_i 5, 15, gi_asp_transition_history    ; to_state = 5
    tabw_i 0.8, 16, gi_asp_transition_history  ; quality
    
    ; Transizione 4: stato 7
    tabw_i 5, 21, gi_asp_transition_history    ; from_state
    tabw_i 7, 22, gi_asp_transition_history    ; to_state = 7
    tabw_i 0.8, 23, gi_asp_transition_history  ; quality
    
    ; Transizione 5: stato 5
    tabw_i 7, 28, gi_asp_transition_history    ; from_state
    tabw_i 5, 29, gi_asp_transition_history    ; to_state = 5
    tabw_i 0.8, 30, gi_asp_transition_history  ; quality
    
    ; Transizione 6: stato 7
    tabw_i 5, 35, gi_asp_transition_history    ; from_state
    tabw_i 7, 36, gi_asp_transition_history    ; to_state = 7
    tabw_i 0.8, 37, gi_asp_transition_history  ; quality
    
    ; Aggiungi 4 transizioni in più per arrivare a 10 (soglia minima)
    iExtra = 7
    while iExtra <= 10 do
        iEntryBase = iExtra * 7
        tabw_i 0, iEntryBase, gi_asp_transition_history    ; from_state
        tabw_i 7, iEntryBase+1, gi_asp_transition_history  ; to_state = 7
        tabw_i 0.8, iEntryBase+2, gi_asp_transition_history; quality
        iExtra += 1
    od
    
    ; Configura stato attuale e numero transizioni
    gi_tc_source_density = 0
    gi_tc_source_register = 2
    gi_tc_source_movement = 1  ; Questo corrisponde allo stato 7
    gi_asp_transition_count = 11
    gi_asp_history_index = 11
    
    ; Inizializza matrice di transizione con probabilità uniforme
    iStateIdx = 0
    while iStateIdx < 27 do
        iToIdx = 0
        while iToIdx < 27 do
            tabw_i 1.0/27.0, iStateIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
        iStateIdx += 1
    od
    
    ; Calcola indice stato corrente
    iCurrentState = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Imposta probabilità alta per lo stato successivo previsto nel pattern (5)
    tabw_i 0.5, iCurrentState*27+5, gi_transition_matrix
    
    ; Normalizza la riga
    iSum = 0
    iToIdx = 0
    while iToIdx < 27 do
        iProb tab_i iCurrentState*27+iToIdx, gi_transition_matrix
        iSum += iProb
        iToIdx += 1
    od
    
    if iSum > 0 then
        iToIdx = 0
        while iToIdx < 27 do
            iProb tab_i iCurrentState*27+iToIdx, gi_transition_matrix
            iNormProb = iProb / iSum
            tabw_i iNormProb, iCurrentState*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
    endif
    
    ; Leggi probabilità iniziale
    iProbBefore tab_i iCurrentState*27+5, gi_transition_matrix
    prints "Probabilità prima della rilevazione: %.4f\n", iProbBefore
    
    ; Esegui rilevamento pattern
    detectPatternsAndAdapt 2, 3
    
    ; Leggi probabilità dopo
    iProbAfter tab_i iCurrentState*27+5, gi_transition_matrix
    prints "Probabilità dopo la rilevazione: %.4f\n", iProbAfter
    
    if iProbAfter < iProbBefore then
        prints "TEST SUPERATO: Pattern rilevato, probabilità ridotta\n"
    else
        prints "TEST FALLITO: Pattern non rilevato o probabilità non ridotta\n"
    endif
    
    turnoff
endin

; TEST 2: Sequenza senza pattern rilevabile
instr TestNoPattern
    prints "\n=== TEST 2: Sequenza Senza Pattern ===\n"
    
    ; Reset tabella cronologia
    iIdx = 0
    while iIdx < 100*7 do
        tabw_i 0, iIdx, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Crea sequenza casuale senza pattern
    seed 12345  ; Per riproducibilità
    
    iStates[] fillarray 3, 8, 12, 15, 3, 9, 22, 14, 6, 11, 17
    
    iTransIdx = 0
    while iTransIdx < 11 do
        iEntryBase = iTransIdx * 7
        tabw_i 0, iEntryBase, gi_asp_transition_history  ; from_state
        tabw_i iStates[iTransIdx], iEntryBase+1, gi_asp_transition_history  ; to_state
        tabw_i 0.8, iEntryBase+2, gi_asp_transition_history  ; quality
        
        iTransIdx += 1
    od
    
    ; Configura stato attuale e numero transizioni
    gi_tc_source_density = 1
    gi_tc_source_register = 1
    gi_tc_source_movement = 2
    gi_asp_transition_count = 11
    gi_asp_history_index = 11
    
    ; Inizializza matrice di transizione con probabilità uniforme
    iStateIdx = 0
    while iStateIdx < 27 do
        iToIdx = 0
        while iToIdx < 27 do
            tabw_i 1.0/27.0, iStateIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
        iStateIdx += 1
    od
    
    ; Calcola indice stato corrente
    iCurrentState = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Leggi probabilità iniziale per uno stato arbitrario
    iTestState = 10
    iProbBefore tab_i iCurrentState*27+iTestState, gi_transition_matrix
    prints "Probabilità iniziale verso stato %d: %.4f\n", iTestState, iProbBefore
    
    ; Esegui rilevamento pattern
    detectPatternsAndAdapt 2, 3
    
    ; Leggi probabilità dopo
    iProbAfter tab_i iCurrentState*27+iTestState, gi_transition_matrix
    prints "Probabilità dopo tentativo di rilevazione: %.4f\n", iProbAfter
    
    if abs(iProbAfter - iProbBefore) < 0.0001 then
        prints "TEST SUPERATO: Nessun pattern rilevato, matrice invariata\n"
    else
        prints "TEST FALLITO: Matrice modificata senza pattern rilevato\n"
    endif
    
    turnoff
endin

; TEST 3: Transizioni insufficienti
instr TestInsufficientData
    prints "\n=== TEST 3: Transizioni Insufficienti ===\n"
    
    ; Reset tabella cronologia
    iIdx = 0
    while iIdx < 100*7 do
        tabw_i 0, iIdx, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Crea pattern evidente ma con meno di 10 transizioni
    iTransIdx = 0
    while iTransIdx < 8 do
        iEntryBase = iTransIdx * 7
        tabw_i 0, iEntryBase, gi_asp_transition_history  ; from_state
        tabw_i 1, iEntryBase+1, gi_asp_transition_history  ; to_state = 1 (pattern ripetitivo)
        tabw_i 0.8, iEntryBase+2, gi_asp_transition_history  ; quality
        
        iTransIdx += 1
    od
    
    ; Configura stato attuale e numero transizioni
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 1  ; Stato 1
    gi_asp_transition_count = 8  ; Sotto la soglia di 10
    gi_asp_history_index = 8
    
    ; Inizializza matrice di transizione
    iStateIdx = 0
    while iStateIdx < 27 do
        iToIdx = 0
        while iToIdx < 27 do
            tabw_i 1.0/27.0, iStateIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
        iStateIdx += 1
    od
    
    ; Calcola indice stato corrente
    iCurrentState = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Aumenta probabilità verso stato 1
    tabw_i 0.5, iCurrentState*27+1, gi_transition_matrix
    
    ; Normalizza la riga
    iSum = 0
    iToIdx = 0
    while iToIdx < 27 do
        iProb tab_i iCurrentState*27+iToIdx, gi_transition_matrix
        iSum += iProb
        iToIdx += 1
    od
    
    if iSum > 0 then
        iToIdx = 0
        while iToIdx < 27 do
            iProb tab_i iCurrentState*27+iToIdx, gi_transition_matrix
            iNormProb = iProb / iSum
            tabw_i iNormProb, iCurrentState*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
    endif
    
    ; Leggi probabilità iniziale
    iProbBefore tab_i iCurrentState*27+1, gi_transition_matrix
    prints "Probabilità iniziale verso stato 1: %.4f\n", iProbBefore
    
    ; Esegui rilevamento pattern
    detectPatternsAndAdapt 2, 3
    
    ; Leggi probabilità dopo
    iProbAfter tab_i iCurrentState*27+1, gi_transition_matrix
    prints "Probabilità dopo tentativo di rilevazione: %.4f\n", iProbAfter
    
    if abs(iProbAfter - iProbBefore) < 0.0001 then
        prints "TEST SUPERATO: Uscita immediata per insufficienza dati\n"
    else
        prints "TEST FALLITO: Matrice modificata nonostante dati insufficienti\n"
    endif
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Esegui i test in sequenza
i "TestPatternSemplice" 0 0.1
i "TestNoPattern" 1 0.1
i "TestInsufficientData" 2 0.1
e
</CsScore>
</CsoundSynthesizer>