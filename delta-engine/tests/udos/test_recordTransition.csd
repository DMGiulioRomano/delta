<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; ======================================================
; Definizione delle variabili globali necessarie
; ======================================================
gi_debug init 3 ; Livello di debug elevato per test

; Buffer circolare per la storia delle transizioni
; 100 transizioni * 7 valori per transizione
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0
gi_asp_history_index init 0
gi_asp_transition_count init 0
gi_asp_learning_rate init 0.1

; Tabella per le caratteristiche di contesto correnti
gi_asp_context_features ftgen 0, 0, 5, -2, 0.3, 0.5, 0.7, 0.4

; Matrice di transizione (27x27)
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; ======================================================
; Implementazione di updateTransitionMatrix (mock)
; ======================================================
opcode updateTransitionMatrix, 0, iiii
    iFromStateIdx, iToStateIdx, iQuality, iDebugLevel xin
    
    prints "Mock updateTransitionMatrix: from %d to %d with quality %.2f\n", 
           iFromStateIdx, iToStateIdx, iQuality
    
    ; Aggiorna matrice solo per scopi di test
    iCurrentProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    iNewProb = iCurrentProb + 0.1
    tabw_i iNewProb, iFromStateIdx*27+iToStateIdx, gi_transition_matrix
endop

; ======================================================
; Implementazione dell'opcode da testare
; ======================================================
opcode recordTransition, 0, iiii
    iFromStateIdx, iToStateIdx, iQuality, iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Find position in circular buffer
    iRecordIdx = gi_asp_history_index * 7
    
    ; Store transition data with bounds checking
    if (iFromStateIdx >= 0 && iFromStateIdx < 27 && 
        iToStateIdx >= 0 && iToStateIdx < 27 && 
        iQuality >= 0 && iQuality <= 1) then
        
        ; Store transition data
        tabw_i iFromStateIdx, iRecordIdx, gi_asp_transition_history
        tabw_i iToStateIdx, iRecordIdx+1, gi_asp_transition_history
        tabw_i iQuality, iRecordIdx+2, gi_asp_transition_history
        
        ; Store context at the time transition was initiated
        iFeatureIdx = 0
        while (iFeatureIdx < 4) do
            iFeature tab_i iFeatureIdx, gi_asp_context_features
            tabw_i iFeature, iRecordIdx+3+iFeatureIdx, gi_asp_transition_history
            iFeatureIdx += 1
        od
        
        ; Update history index for circular buffer
        gi_asp_history_index = (gi_asp_history_index + 1) % 100
        gi_asp_transition_count += 1
        
        ; Update the transition matrix based on this experience
        updateTransitionMatrix(iFromStateIdx, iToStateIdx, iQuality, iDebugLevel)
        
        if (iDebugLevel >= 1) then
            iFromDens = int(iFromStateIdx / 9)
            iFromRem = iFromStateIdx % 9
            iFromReg = int(iFromRem / 3)
            iFromMov = iFromRem % 3
            
            iToDens = int(iToStateIdx / 9)
            iToRem = iToStateIdx % 9
            iToReg = int(iToRem / 3)
            iToMov = iToRem % 3
            
            prints "Recorded transition #%d: [%d,%d,%d] to [%d,%d,%d] with quality %.2f\n", 
                   gi_asp_transition_count, 
                   iFromDens, iFromReg, iFromMov,
                   iToDens, iToReg, iToMov,
                   iQuality
        endif
    else
        ; Error handling for invalid inputs
        if (iDebugLevel >= 1) then
            prints "ERROR: Invalid transition parameters (%d,%d,%.2f) - not recorded\n",
                   iFromStateIdx, iToStateIdx, iQuality
        endif
    endif
endop

; ======================================================
; Strumenti di test
; ======================================================

; Stampa il contenuto della storia delle transizioni
instr PrintTransitionHistory
    prints "\n=== CURRENT TRANSITION HISTORY ===\n"
    prints "Total transitions recorded: %d\n", gi_asp_transition_count
    prints "Current history index: %d\n", gi_asp_history_index
    prints "Format: [idx] FromState ToState Quality Context(4 values)\n"
    
    iCount = 0
    iMaxToShow = min(gi_asp_transition_count, 100)
    
    while (iCount < iMaxToShow) do
        ; Calculate actual index in buffer (accounting for circular buffer)
        iIdx = (gi_asp_history_index - 1 - iCount + 100) % 100
        iBaseIdx = iIdx * 7
        
        iFrom = tab_i(iBaseIdx, gi_asp_transition_history)
        iTo = tab_i(iBaseIdx+1, gi_asp_transition_history)
        iQual = tab_i(iBaseIdx+2, gi_asp_transition_history)
        iCont1 = tab_i(iBaseIdx+3, gi_asp_transition_history)
        iCont2 = tab_i(iBaseIdx+4, gi_asp_transition_history)
        iCont3 = tab_i(iBaseIdx+5, gi_asp_transition_history)
        iCont4 = tab_i(iBaseIdx+6, gi_asp_transition_history)
        
        prints "[%d] %d → %d (Q:%.2f) Context: [%.2f, %.2f, %.2f, %.2f]\n",
              iIdx, iFrom, iTo, iQual, iCont1, iCont2, iCont3, iCont4
              
        iCount += 1
    od
    
    prints "===================================\n\n"
endin

; Test scenario 1: Valid transitions
instr TestValidTransitions
    prints "\n\n=== TEST SCENARIO 1: VALID TRANSITIONS ===\n"
    
    ; Transizione valida: stato 0 a stato 1, qualità 0.8
    recordTransition(0, 1, 0.8, 2)
    
    ; Transizione valida: stato 5 a stato 10, qualità 0.5
    recordTransition(5, 10, 0.5, 2)
    
    ; Transizione valida: stato 26 a stato 0, qualità 0.3
    recordTransition(26, 0, 0.3, 2)
    
    ; Stampa contenuto memoria
    event_i "i", "PrintTransitionHistory", 0, 1
endin

; Test scenario 2: Invalid parameters
instr TestInvalidParameters
    prints "\n\n=== TEST SCENARIO 2: INVALID PARAMETERS ===\n"
    
    ; Stato origine invalido (negativo)
    recordTransition(-1, 5, 0.7, 2)
    
    ; Stato destinazione invalido (troppo grande)
    recordTransition(5, 30, 0.7, 2)
    
    ; Qualità invalida (negativa)
    recordTransition(5, 10, -0.2, 2)
    
    ; Qualità invalida (>1)
    recordTransition(5, 10, 1.5, 2)
    
    ; Stampa contenuto memoria
    event_i "i", "PrintTransitionHistory", 0, 1
endin

; Test scenario 3: Context changes
instr TestContextChanges
    prints "\n\n=== TEST SCENARIO 3: CONTEXT CHANGES ===\n"
    
    ; Memorizziamo stato iniziale del contesto
    prints "Initial context: [%.2f, %.2f, %.2f, %.2f]\n",
          tab_i(0, gi_asp_context_features),
          tab_i(1, gi_asp_context_features),
          tab_i(2, gi_asp_context_features),
          tab_i(3, gi_asp_context_features)
    
    ; Cambiamo il contesto
    tabw_i 0.1, 0, gi_asp_context_features
    tabw_i 0.2, 1, gi_asp_context_features
    tabw_i 0.9, 2, gi_asp_context_features
    tabw_i 0.8, 3, gi_asp_context_features
    
    prints "Changed context: [%.2f, %.2f, %.2f, %.2f]\n",
          tab_i(0, gi_asp_context_features),
          tab_i(1, gi_asp_context_features),
          tab_i(2, gi_asp_context_features),
          tab_i(3, gi_asp_context_features)
    
    ; Registriamo una transizione
    recordTransition(7, 8, 0.9, 2)
    
    ; Stampa contenuto memoria
    event_i "i", "PrintTransitionHistory", 0, 1
endin

; Test scenario 4: Circular buffer overflow
instr TestCircularBuffer
    prints "\n\n=== TEST SCENARIO 4: CIRCULAR BUFFER ===\n"
    prints "Testing with %d transitions (starting from index %d)\n", 
           105, gi_asp_history_index
    
    ; Genera più transizioni di quante possa contenere il buffer
    iStartIdx = gi_asp_history_index
    iCount = 0
    
    while (iCount < 105) do
        iFrom = iCount % 27
        iTo = (iCount + 3) % 27
        iQuality = 0.5 + (iCount % 6) * 0.1
        
        recordTransition(iFrom, iTo, iQuality, 0) ; debug level 0 per ridurre output
        
        iCount += 1
    od
    
    ; Verifica valori estremi del buffer
    prints "Verifying buffer after %d transitions...\n", iCount
    iLastIdx = (gi_asp_history_index - 1 + 100) % 100
    iBaseIdx = iLastIdx * 7
    
    prints "Last transition recorded at index %d: %d → %d (Q:%.2f)\n",
           iLastIdx,
           tab_i(iBaseIdx, gi_asp_transition_history),
           tab_i(iBaseIdx+1, gi_asp_transition_history),
           tab_i(iBaseIdx+2, gi_asp_transition_history)
           
    ; Stampa alcune transizioni dalla storia
    event_i "i", "PrintTransitionHistory", 0, 1
endin

; ======================================================
; Sequenza di test principale
; ======================================================
instr RunAllTests
    prints "\n====================================\n"
    prints "TESTING RECORD TRANSITION OPCODE\n"
    prints "====================================\n"
    
    ; Esegui tutti i test in sequenza
    event_i "i", "TestValidTransitions", 0, 1
    event_i "i", "TestInvalidParameters", 1, 1
    event_i "i", "TestContextChanges", 2, 1
    event_i "i", "TestCircularBuffer", 3, 1
    
    ; Stampa riepilogo finale
    prints "\n====================================\n"
    prints "SUMMARY: recordTransition test complete\n"
    prints "Total transitions recorded: %d\n", gi_asp_transition_count
    prints "Current history index: %d\n", gi_asp_history_index
    prints "====================================\n"
endin

</CsInstruments>
<CsScore>
; Esegui tutti i test
i "RunAllTests" 0 5
e
</CsScore>
</CsoundSynthesizer>