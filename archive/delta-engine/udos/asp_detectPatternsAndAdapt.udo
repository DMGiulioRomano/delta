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
