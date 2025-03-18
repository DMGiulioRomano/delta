; =============================================================================
; AdaptiveStatePrediction.udo
; A system for learning from past transitions to improve future musical decisions
; =============================================================================

; Global variables for adaptive learning system
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0  ; Store last 100 transitions (from_state, to_state, quality, 4 context features)
gi_asp_history_index init 0                         ; Current index in history buffer
gi_asp_transition_count init 0                      ; Total number of transitions recorded
gi_asp_learning_rate init 0.1                       ; Rate at which system adapts (0.0-1.0)

; Context features table (stores musical context data)
gi_asp_context_features ftgen 0, 0, 10, -2, 0        ; Various musical context features

; -----------------------------------------------------------------------
; STATE PREDICTION AND LEARNING SYSTEM
; -----------------------------------------------------------------------

; Predicts the next state based on current state and musical context
opcode predictNextState, iii, 0
    
    ; Default to using standard transition matrix if insufficient history
    if (gi_asp_transition_count < 10) then
        iNextDensity, iNextRegister, iNextMovement selectNextState 
        igoto end
    endif
    
    ; Extract current musical context features
    iCurrentOverlap = i(gk_current_overlap)
    iCurrentSpread = i(gk_current_octave_spread)
    iCurrentCentroid = i(gk_current_spectral_centroid)
    iCurrentDynamism = i(gk_current_spatial_movement)
    
    ; Normalize context features
    iNormOverlap = limit(iCurrentOverlap / 5, 0, 1)  ; Assuming max overlap of 5
    iNormSpread = iCurrentSpread                    ; Already 0-1
    iNormCentroid = limit(iCurrentCentroid / 10, 0, 1) ; Normalized to 0-1
    iNormDynamism = limit(iCurrentDynamism, 0, 1)    ; Assuming 0-1 range
    
    ; Store current context 
    tabw_i iNormOverlap, 0, gi_asp_context_features
    tabw_i iNormSpread, 1, gi_asp_context_features
    tabw_i iNormCentroid, 2, gi_asp_context_features
    tabw_i iNormDynamism, 3, gi_asp_context_features
    
    ; Calculate current state index (0-26)
    iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Search transition history for similar contexts
    iWinningStateIdx = -1
    iHighestScore = -1
    
    ; Alternative approach - weighted random selection
    ; Create a weighted probability distribution for states
    iStateProbabilities ftgen 0, 0, 27, -2, 0  ; Temporary table for probabilities
    
    ; Initialize with base probabilities from transition matrix
    iBaseIdx = 0
    while (iBaseIdx < 27) do
        iBaseProb tab_i iCurrentStateIdx*27+iBaseIdx, gi_transition_matrix
        tabw_i iBaseProb, iBaseIdx, iStateProbabilities
        iBaseIdx += 1
    od
    
    ; Now adjust based on historical performance in similar contexts
    iHistoryIdx = 0
    iCount = min(gi_asp_transition_count, 100)  ; Look at up to 100 past transitions
    
    while (iHistoryIdx < iCount) do
        ; Extract history entry
        iEntryIdx = iHistoryIdx * 4
        iFromState tab_i iEntryIdx, gi_asp_transition_history
        iToState tab_i iEntryIdx+1, gi_asp_transition_history
        iQuality tab_i iEntryIdx+2, gi_asp_transition_history
        print iEntryIdx
        i_ContextBase = iEntryIdx+3
        print i_ContextBase
        ; Skip if not matching current state
        if (iFromState != iCurrentStateIdx) then
            iHistoryIdx += 1
        else
            exitnow
            ; Calculate context similarity
            i_SimilarityScore = 0;calculateContextSimilarity(i_ContextBase)
                        
            ; If context is similar enough, adjust probability based on quality
            if (i_SimilarityScore > 0.7) then
                ; Multiply quality by similarity for weighted influence
                iInfluence = iQuality * i_SimilarityScore * gi_asp_learning_rate
                
                ; Positive reinforcement for this transition
                iCurrentProb tab_i iToState, iStateProbabilities
                iNewProb = iCurrentProb * (1 + iInfluence)
                tabw_i iNewProb, iToState, iStateProbabilities
            endif
            
            iHistoryIdx += 1
        endif
    od
    
    ; Normalize probabilities
    iSum = 0
    iNormIdx = 0
    while (iNormIdx < 27) do
        iSum += tab_i(iNormIdx, iStateProbabilities)
        iNormIdx += 1
    od
    
    if (iSum > 0) then
        iNormIdx = 0
        while (iNormIdx < 27) do
            iProb tab_i iNormIdx, iStateProbabilities
            iNormProb = iProb / iSum
            tabw_i iNormProb, iNormIdx, iStateProbabilities
            iNormIdx += 1
        od
    endif
    
    ; Random selection from weighted distribution
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
    
    if (gi_debug >= 2) then
        prints "Adaptive Prediction: Selected next state [%d,%d,%d] based on context similarity\n", 
               iNextDensity, iNextRegister, iNextMovement
    endif
    goto end
    iou=0
    end:
    xout iNextDensity, iNextRegister, iNextMovement
endop

; Compare two context vectors and return similarity score (0-1)
opcode calculateContextSimilarity, i, i
    i_ContextBase1 xin
    ; Calculate Euclidean distance between context features
    iSumSquaredDiff = 0
    iFeatureIdx = 0
    
    while (iFeatureIdx < 4) do
        iFeature1 tab_i (i_ContextBase1+iFeatureIdx), gi_asp_transition_history
        iFeature2 tab_i iFeatureIdx, gi_asp_context_features
        iDiff = iFeature1 - iFeature2
        iSumSquaredDiff += iDiff * iDiff
        
        iFeatureIdx += 1
    od
    
    ; Convert to similarity (inverse distance, normalized to 0-1)
    iDistance = sqrt(iSumSquaredDiff)
    i_Similarity = 1 / (1 + iDistance * 4)  ; Scale factor adjusts sensitivity
    
    xout i_Similarity
endop

; Record a completed transition with its quality assessment
opcode recordTransition, 0, iiiii
    iFromStateIdx, iToStateIdx, iQuality, iDuration, iMode xin
    
    ; Find position in circular buffer
    iRecordIdx = gi_asp_history_index * 7  ; Ogni record occupa 7 elementi
    
    ; Store transition data
    tabw_i iFromStateIdx, iRecordIdx, gi_asp_transition_history
    tabw_i iToStateIdx, iRecordIdx+1, gi_asp_transition_history
    tabw_i iQuality, iRecordIdx+2, gi_asp_transition_history
    
    ; Store context at the time transition was initiated
    ; (context features already stored in gi_asp_context_features)
    iContextFeatureIdx = 0
    while (iContextFeatureIdx < 4) do
        iFeature tab_i iContextFeatureIdx, gi_asp_context_features
        tabw_i iFeature, iRecordIdx+3+iContextFeatureIdx, gi_asp_transition_history
        iContextFeatureIdx += 1
    od
    
    ; Update history index for circular buffer
    gi_asp_history_index = (gi_asp_history_index + 1) % 100
    gi_asp_transition_count += 1
    
    ; Also update the transition matrix based on this experience
    ;updateTransitionMatrix iFromStateIdx, iToStateIdx, iQuality
    
    if (gi_debug >= 1) then
        prints "Recorded transition from state %d to %d with quality %.2f\n", 
               iFromStateIdx, iToStateIdx, iQuality
    endif
endop

; Dynamically update the transition matrix based on learning
opcode updateTransitionMatrix, 0, iii
    iFromStateIdx, iToStateIdx, iQuality xin
    
    ; Read current probability
    iCurrentProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    ; Calculate adjustment based on quality
    ; High quality -> increase probability
    ; Low quality -> decrease probability
    iAdjustment = (iQuality - 0.5) * gi_asp_learning_rate
    
    ; Apply adjustment with bounds checking
    iNewProb = iCurrentProb + iAdjustment
    iNewProb = limit(iNewProb, 0.01, 0.99)  ; Ensure we don't hit extremes
    
    tabw_i iNewProb, iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    ; Renormalize row to ensure probabilities sum to 1
    iSum = 0
    iToIdx = 0
    while (iToIdx < 27) do
        iProb tab_i iFromStateIdx*27+iToIdx, gi_transition_matrix
        iSum += iProb
        iToIdx += 1
    od
    
    if (iSum > 0) then
        iToIdx = 0
        while (iToIdx < 27) do
            iProb tab_i iFromStateIdx*27+iToIdx, gi_transition_matrix
            iNormProb = iProb / iSum
            tabw_i iNormProb, iFromStateIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
    endif
endop
