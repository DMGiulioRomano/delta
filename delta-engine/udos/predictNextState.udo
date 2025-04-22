; Predicts the next state based on current state and musical context
; Improved version with robustness features and memory biasing
opcode predictNextState, iii, o
    iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Update context features from current musical state
    updateContextFeatures
    iNextDensity=0
    iNextRegister=0
    iNextMovement=0
    ; Calculate current state index (0-26)
    iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Check for sufficient historical data
    if (gi_asp_transition_count < 10) then
        ; Not enough data for adaptive prediction, use standard transitions
        if (iDebugLevel >= 1) then
            prints "Not enough historical data (%d transitions), using standard transition matrix\n", gi_asp_transition_count
        endif
    iNextDensity, iNextRegister, iNextMovement selectNextState

        igoto end
    endif
    
    ; Create distributions for state probabilities
    iStateProbabilities ftgen 0, 0, 27, -2, 0  ; Temporary table for probabilities
    
    ; Initialize with base probabilities from transition matrix
    iBaseIdx = 0
    while (iBaseIdx < 27) do
        ; Get base probability from transition matrix
        iBaseProb tab_i iCurrentStateIdx*27+iBaseIdx, gi_transition_matrix
        tabw_i iBaseProb, iBaseIdx, iStateProbabilities
        
        iBaseIdx += 1
    od
    
    ; Counters for statistical tracking
    iMatchingTransitions = 0
    iInfluentialTransitions = 0
    iHighSimilarityCount = 0
    
    ; Table for tracking all similarity scores (for advanced statistics)
    iSimilarityScores ftgen 0, 0, gi_asp_transition_count, -2, 0
    
    if (iDebugLevel >= 2) then
        prints "\nAnalyzing historical transitions for state %d and current context:\n", iCurrentStateIdx
    endif
    
    ; Now adjust based on historical performance in similar contexts
    iHistoryIdx = 0
    iCount = min(gi_asp_transition_count, 100)  ; Look at up to 100 past transitions
    
    while (iHistoryIdx < iCount) do
        ; Calculate position in history buffer (circular buffer management)
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract history entry
        iEntryBase = iActualIdx * 7
        iFromState tab_i iEntryBase, gi_asp_transition_history
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        
        ; Store similarity score for statistics, regardless of state match
        i_ContextBase = iEntryBase+3
        iSimilarity calculateContextSimilarity i_ContextBase, 0  ; Low debug level for cleaner output
        tabw_i iSimilarity, iHistoryIdx, iSimilarityScores
        
        ; Skip if not matching current state
        if (iFromState != iCurrentStateIdx) then
            if (iDebugLevel >= 3) then
                prints "  Transition %d: from state %d (not matching current %d) - skipped\n", iHistoryIdx+1, iFromState, iCurrentStateIdx
            endif
            iHistoryIdx += 1
            igoto continue
        endif
        
        iMatchingTransitions += 1
        
        ; If context is similar enough, adjust probability based on quality
        if (iSimilarity > 0.3) then  ; Similarity threshold
            ; Apply a more nuanced influence formula
            ; Higher similarities get exponentially more influence
            iInfluence = iQuality * pow(iSimilarity, 2) * gi_asp_learning_rate
            
            ; Positive reinforcement for this transition
            iCurrentProb tab_i iToState, iStateProbabilities
            iNewProb = iCurrentProb * (1 + iInfluence)
            tabw_i iNewProb, iToState, iStateProbabilities
            
            iInfluentialTransitions += 1
            if (iSimilarity > 0.7) then
                iHighSimilarityCount += 1
            endif
            
            if (iDebugLevel >= 2) then
                prints "  Transition %d (%.1fs ago): similarity=%.4f, quality=%.2f, influence=%.4f on state %d\n", 
                       iHistoryIdx+1, (iHistoryIdx * gi_memory_resolution), iSimilarity, 
                       iQuality, iInfluence, iToState
            endif
        else
            if (iDebugLevel >= 3) then
                prints "  Transition %d: similarity=%.4f (below threshold, ignored)\n", 
                       iHistoryIdx+1, iSimilarity
            endif
        endif
        
        continue:
        iHistoryIdx += 1
    od
    
    ; Add creative variance to prevent getting stuck in patterns
    ; If we have very high confidence (multiple high similarity matches),
    ; still maintain some exploration tendency
    if (iHighSimilarityCount >= 3) then
        ; Add small probability to all states to encourage exploration
        iExplorationFactor = 0.05
        
        iStateIdx = 0
        while (iStateIdx < 27) do
            iCurrentProb tab_i iStateIdx, iStateProbabilities
            iNewProb = iCurrentProb + iExplorationFactor
            tabw_i iNewProb, iStateIdx, iStateProbabilities
            iStateIdx += 1
        od
        
        if (iDebugLevel >= 2) then
            prints "  Added exploration factor of %.2f to prevent predictability\n", 
                   iExplorationFactor
        endif
    endif
    
    ; Normalize probabilities
    iSum = 0
    iNormIdx = 0
    while (iNormIdx < 27) do
        iSum += tab_i(iNormIdx, iStateProbabilities)
        iNormIdx += 1
    od
    
    if (iDebugLevel >= 2) then
        prints "\nStatistics: Found %d matching transitions, %d influential (%.1f%%), %d high similarity\n",
               iMatchingTransitions, iInfluentialTransitions, 
               (iMatchingTransitions > 0) ? (iInfluentialTransitions/iMatchingTransitions)*100 : 0,
               iHighSimilarityCount
        
        prints "\nTop state candidates after normalization:\n"
    endif
    
    ; Create an array to hold top candidates
    iNumCandidates = 5  ; Track top 5 candidates
    iCandidateStateIdx[] init iNumCandidates
    iCandidateProb[] init iNumCandidates
    
    ; Initialize with zeros
    indx = 0
    while (indx < iNumCandidates) do
        iCandidateStateIdx[indx] = -1
        iCandidateProb[indx] = 0
        indx += 1
    od
    
    ; Normalize and find top candidates
    if (iSum > 0) then
        iNormIdx = 0
        while (iNormIdx < 27) do
            iProb tab_i iNormIdx, iStateProbabilities
            iNormProb = iProb / iSum
            tabw_i iNormProb, iNormIdx, iStateProbabilities
            
            ; Check if this belongs in top candidates
            indx = 0
            while (indx < iNumCandidates) do
                if (iNormProb > iCandidateProb[indx]) then
                    ; Shift down to make room
                    indx2 = iNumCandidates - 1
                    while (indx2 > indx) do
                        iCandidateStateIdx[indx2] = iCandidateStateIdx[indx2-1]
                        iCandidateProb[indx2] = iCandidateProb[indx2-1]
                        indx2 -= 1
                    od
                    
                    ; Insert new candidate
                    iCandidateStateIdx[indx] = iNormIdx
                    iCandidateProb[indx] = iNormProb
                    igoto found_position
                endif
                indx += 1
            od
            found_position:
            
            iNormIdx += 1
        od
    endif
    
    ; Display top candidates
    if (iDebugLevel >= 2) then
        indx = 0
        while (indx < iNumCandidates && iCandidateStateIdx[indx] >= 0) do
            iStateIdx = iCandidateStateIdx[indx]
            iProb = iCandidateProb[indx]
            
            ; Convert to component form
            iDens = int(iStateIdx / 9)
            iRem = iStateIdx % 9
            iReg = int(iRem / 3)
            iMov = iRem % 3
            
            prints "  Candidate %d: State [%d,%d,%d] (idx %d): probability = %.4f\n", 
                   indx+1, iDens, iReg, iMov, iStateIdx, iProb
            
            indx += 1
        od
    endif
    
    ; Random weighted selection from distribution
    iRand random 0, 1
    iCumulativeProb = 0
    iSelectedStateIdx = 0
    
    iStateIdx = 0
    while (iStateIdx < 27) do
        iProb tab_i iStateIdx, iStateProbabilities
        iCumulativeProb += iProb
        
        if (iRand < iCumulativeProb) then
            iSelectedStateIdx = iStateIdx
            igoto selected_state
        endif
        
        iStateIdx += 1
    od
    
    selected_state:
    
    ; Convert state index back to components
    iNextDensity = int(iSelectedStateIdx / 9)
    iRemainder = iSelectedStateIdx % 9
    iNextRegister = int(iRemainder / 3)
    iNextMovement = iRemainder % 3
    
    if (iDebugLevel >= 1) then
        prints "Selected next state [%d,%d,%d] with probability %.4f\n", 
               iNextDensity, iNextRegister, iNextMovement, 
               tab_i(iSelectedStateIdx, iStateProbabilities)
    endif
    
    igoto end
    
    end:
    xout iNextDensity, iNextRegister, iNextMovement
endop
