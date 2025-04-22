;==============================================================================
; ADAPTIVE STATE PREDICTION SYSTEM - IMPROVED VERSION
;==============================================================================
; A system for learning from past transitions to improve future musical decisions
; Includes improved similarity calculations and robust prediction algorithms
;==============================================================================

; Global variables for adaptive learning system (should be defined in main code)
; gi_asp_transition_history - Store transitions (from_state, to_state, quality, context features)
; gi_asp_history_index - Current index in history buffer
; gi_asp_transition_count - Total number of transitions recorded
; gi_asp_learning_rate - Rate at which system adapts (0.0-1.0)
; gi_asp_context_features - Current musical context features

;------------------------------------------------------------------------------
; STATE PREDICTION SYSTEM
;------------------------------------------------------------------------------

; Update current context features based on musical state
opcode updateContextFeatures, 0, 0
    ; Extract current musical context features
    
    ; Normalize context features with safety bounds checking
    iNormOverlap = limit(gi_current_overlap / 10, 0, 1)  ; Assuming max overlap of 10
    iNormSpread = limit(gi_current_octave_spread, 0, 1)        ; Already 0-1
    iNormCentroid = limit(gi_current_spectral_centroid / 10, 0, 1) ; Normalized to 0-1
    iNormDynamism = limit(gi_current_spatial_movement, 0, 1)     ; Assuming 0-1 range
    
    ; Store current context safely
    tabw_i iNormOverlap, 0, gi_asp_context_features
    tabw_i iNormSpread, 1, gi_asp_context_features
    tabw_i iNormCentroid, 2, gi_asp_context_features
    tabw_i iNormDynamism, 3, gi_asp_context_features
    
    if (gi_debug >= 3) then
        prints "Context updated: [%.2f, %.2f, %.2f, %.2f] (normalized)\n", iNormOverlap, iNormSpread, iNormCentroid, iNormDynamism
    endif
endop

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

;------------------------------------------------------------------------------
; TRANSITION RECORDING AND LEARNING
;------------------------------------------------------------------------------
; Dynamically update the transition matrix based on learning
opcode updateTransitionMatrix, 0, iiii
    iFromStateIdx, iToStateIdx, iQuality, iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Bounds checking
    if (iFromStateIdx < 0 || iFromStateIdx >= 27 || 
        iToStateIdx < 0 || iToStateIdx >= 27) then
        if (iDebugLevel >= 1) then
            prints "ERROR: Invalid state indices in updateTransitionMatrix\n"
        endif
        igoto end
    endif
    
    ; Read current probability
    iCurrentProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    ; Calculate learning rate with quality-based adjustment
    iLearningFactor = gi_asp_learning_rate
    if (iQuality > 0.8) then
        ; For very successful transitions, learn more
        iLearningFactor *= 1.5
    elseif (iQuality < 0.4) then
        ; For poor transitions, learn less
        iLearningFactor *= 0.5
    endif

    ; Calculate quality-based adjustment (centered at 0.5)
    iAdjustment = (iQuality - 0.5) * iLearningFactor  

    ; Apply adjustment with bounds checking
    iNewProb = iCurrentProb + iAdjustment
    iNewProb = limit(iNewProb, 0.01, 0.99)  ; Ensure we don't hit extremes
    
    tabw_i iNewProb, iFromStateIdx*27+iToStateIdx, gi_transition_matrix

    ; Record this learning event for validation
    iCurrentTime times
    Sfilename = "docs/analysis/learning_events.csv"
    
    ; Check if file exists - create if needed
    iSystem system_i 1, sprintf("test -e %s || echo 'time,from_state,to_state,quality,adjustment,new_prob' > %s", 
                                Sfilename, Sfilename)
    
    ; Append the data
    fprints Sfilename, "%.2f,%d,%d,%.4f,%.4f,%.4f\n", 
            iCurrentTime, iFromStateIdx, iToStateIdx, iQuality, iAdjustment, iNewProb

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
    
    if (iDebugLevel >= 2) then
        iFromDens = int(iFromStateIdx / 9)
        iFromRem = iFromStateIdx % 9
        iFromReg = int(iFromRem / 3)
        iFromMov = iFromRem % 3
        
        iToDens = int(iToStateIdx / 9)
        iToRem = iToStateIdx % 9
        iToReg = int(iToRem / 3)
        iToMov = iToRem % 3
        
        prints "Updated transition matrix: [%d,%d,%d] to [%d,%d,%d], prob: %.4f → %.4f\n",
               iFromDens, iFromReg, iFromMov,
               iToDens, iToReg, iToMov,
               iCurrentProb, iNewProb
    endif
    end:
endop


; Record a completed transition with its quality assessment
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
        updateTransitionMatrix(iFromStateIdx, iToStateIdx, iQuality,iDebugLevel)
        
        if (iDebugLevel >= 1) then
            iFromDens = int(iFromStateIdx / 9)
            iFromRem = iFromStateIdx % 9
            iFromReg = int(iFromRem / 3)
            iFromMov = iFromRem % 3
            
            iTodens = int(iToStateIdx / 9)
            iToRem = iToStateIdx % 9
            iToReg = int(iToRem / 3)
            iToMov = iToRem % 3
            
            prints "Recorded transition #%d: [%d,%d,%d] to [%d,%d,%d] with quality %.2f\n", 
                   gi_asp_transition_count, 
                   iFromDens, iFromReg, iFromMov,
                   iTodens, iToReg, iToMov,
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

;------------------------------------------------------------------------------
; LEARNING SYSTEM ANALYSIS AND STATISTICS
;------------------------------------------------------------------------------

; Analyze the learning system and generate statistics
opcode analyzeLearningSystem, 0, i
    iDebugLevel xin
    
    ; Default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Initialize statistics
    iHighQualityCount = 0
    iLowQualityCount = 0
    iMediumQualityCount = 0
    iTotalQuality = 0
    iAverageQuality = 0
    
    ; States with most successful transitions
    iMostSuccessfulFrom = -1
    iMostSuccessfulTo = -1
    iMostSuccessfulCount = 0
    
    ; Matrix of transition counts
    iTransitionCounts ftgen 0, 0, 27*27, -2, 0
    
    ; Analyze the transition history
    iHistoryIdx = 0
    iTransitionCount = min(gi_asp_transition_count, 100)
    
    while (iHistoryIdx < iTransitionCount) do
        ; Calculate position in history buffer (circular buffer management)
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract history entry
        iEntryBase = iActualIdx * 7
        iFromState tab_i iEntryBase, gi_asp_transition_history
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        
        ; Accumulate statistics
        iTotalQuality += iQuality
        
        ; Count by quality range
        if (iQuality >= 0.8) then
            iHighQualityCount += 1
        elseif (iQuality <= 0.4) then
            iLowQualityCount += 1
        else
            iMediumQualityCount += 1
        endif
        
        ; Record transition count
        iMatrixIdx = iFromState * 27 + iToState
        iCount tab_i iMatrixIdx, iTransitionCounts
        tabw_i iCount + 1, iMatrixIdx, iTransitionCounts
        
        ; Check if this might be most common transition
        if (iCount + 1 > iMostSuccessfulCount) then
            iMostSuccessfulCount = iCount + 1
            iMostSuccessfulFrom = iFromState
            iMostSuccessfulTo = iToState
        endif
        
        iHistoryIdx += 1
    od
    
    ; Calculate averages
    if (iTransitionCount > 0) then
        iAverageQuality = iTotalQuality / iTransitionCount
    endif
    
    ; Outputs
    if (iDebugLevel >= 1) then
        prints "\n=== ADAPTIVE LEARNING SYSTEM ANALYSIS ===\n"
        prints "Total transitions recorded: %d\n", gi_asp_transition_count
        prints "High quality transitions (>= 0.8): %d (%.1f%%)\n", 
               iHighQualityCount, (iTransitionCount > 0) ? (iHighQualityCount * 100.0 / iTransitionCount) : 0
        prints "Medium quality transitions: %d (%.1f%%)\n", 
               iMediumQualityCount, (iTransitionCount > 0) ? (iMediumQualityCount * 100.0 / iTransitionCount) : 0
        prints "Low quality transitions (<= 0.4): %d (%.1f%%)\n", 
               iLowQualityCount, (iTransitionCount > 0) ? (iLowQualityCount * 100.0 / iTransitionCount) : 0
        prints "Average transition quality: %.2f\n", iAverageQuality
        
        if (iMostSuccessfulFrom >= 0) then
            ; Convert to component form for more readable output
            iFromDens = int(iMostSuccessfulFrom / 9)
            iFromRem = iMostSuccessfulFrom % 9
            iFromReg = int(iFromRem / 3)
            iFromMov = iFromRem % 3
            
            iToDens = int(iMostSuccessfulTo / 9)
            iToRem = iMostSuccessfulTo % 9
            iToReg = int(iToRem / 3)
            iToMov = iToRem % 3
            
            prints "Most common transition: [%d,%d,%d] to [%d,%d,%d] (occurred %d times)\n",
                   iFromDens, iFromReg, iFromMov,
                   iToDens, iToReg, iToMov,
                   iMostSuccessfulCount
        endif
        prints "=======================================\n"
    endif
    
    ; Save statistics to file for external analysis
    iCurrentTime times
    Sfilename = "docs/analysis/learning_statistics.csv"
    
    ; Check if file exists - create if needed
    iSystem system_i 1, sprintf("test -e %s || echo 'time,transitions,avg_quality,high_pct,med_pct,low_pct,learning_rate' > %s", 
                               Sfilename, Sfilename)
    
    ; Append the data
    fprints Sfilename, "%.2f,%d,%.4f,%.1f,%.1f,%.1f,%.2f\n", 
            iCurrentTime, gi_asp_transition_count, iAverageQuality,
            (iTransitionCount > 0) ? (iHighQualityCount * 100.0 / iTransitionCount) : 0,
            (iTransitionCount > 0) ? (iMediumQualityCount * 100.0 / iTransitionCount) : 0,
            (iTransitionCount > 0) ? (iLowQualityCount * 100.0 / iTransitionCount) : 0,
            gi_asp_learning_rate
endop

; Generate a visualization of the transition matrix
opcode visualizeTransitionMatrix, 0, Si
    Soutputfile, iDebugLevel xin
    
    ; Default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; If no filename provided, use a default
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/transition_matrix_visualization.csv"
    endif
    
    ; Create directory if it doesn't exist
    iSystem system_i 1, "mkdir -p docs/analysis", 0
    
    ; Write CSV header
    fprints Soutputfile, "from_state,to_state,probability,from_density,from_register,from_movement,to_density,to_register,to_movement\n"
    
    ; Write each transition probability
    iFromStateIdx = 0
    while (iFromStateIdx < 27) do
        ; Convert source state to components
        iFromDens = int(iFromStateIdx / 9)
        iFromRem = iFromStateIdx % 9
        iFromReg = int(iFromRem / 3)
        iFromMov = iFromRem % 3
        
        iToStateIdx = 0
        while (iToStateIdx < 27) do
            ; Get probability
            iProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
            
            ; Only include probabilities above a threshold to reduce file size
            if (iProb > 0.02) then
                ; Convert target state to components
                iToDens = int(iToStateIdx / 9)
                iToRem = iToStateIdx % 9
                iToReg = int(iToRem / 3)
                iToMov = iToRem % 3
                
                ; Write to CSV
                fprints Soutputfile, "%d,%d,%.4f,%d,%d,%d,%d,%d,%d\n",
                        iFromStateIdx, iToStateIdx, iProb,
                        iFromDens, iFromReg, iFromMov,
                        iToDens, iToReg, iToMov
            endif
            
            iToStateIdx += 1
        od
        
        iFromStateIdx += 1
    od
    
    if (iDebugLevel >= 1) then
        prints "Transition matrix visualization saved to %s\n", Soutputfile
    endif
endop

; -----------------------------------------------------------------------
; ADAPTIVE SYSTEM CONFIGURATION CONTROL
; -----------------------------------------------------------------------

; Adjust learning rate based on performance
opcode adaptLearningRate, 0, ii
    iTargetQuality, iDebugLevel xin
    
    ; Default values if not provided
    iTargetQuality = (iTargetQuality == 0) ? 0.75 : iTargetQuality
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Minimum number of transitions before adapting
    if (gi_asp_transition_count < 20) then
        if (iDebugLevel >= 2) then
            prints "Not enough transitions (%d) to adapt learning rate yet\n", 
                   gi_asp_transition_count
        endif
        igoto end
    endif
    
    ; Calculate average quality of recent transitions
    iTotalQuality = 0
    iRecentCount = min(gi_asp_transition_count, 15)  ; Look at last 15 transitions
    
    iHistoryIdx = 0
    while (iHistoryIdx < iRecentCount) do
        ; Calculate position in history buffer (circular buffer management)
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract quality
        iEntryBase = iActualIdx * 7
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        
        iTotalQuality += iQuality
        iHistoryIdx += 1
    od
    
    iAvgQuality = (iRecentCount > 0) ? iTotalQuality / iRecentCount : 0

    ; Determine if learning rate needs adjustment
    iQualityDifference = iAvgQuality - iTargetQuality
    
    if (abs(iQualityDifference) < 0.05) then
        ; Within acceptable range, no change needed
        if (iDebugLevel >= 2) then
            prints "Learning rate stable at %.2f (quality=%.2f vs target=%.2f)\n",
                   gi_asp_learning_rate, iAvgQuality, iTargetQuality
        endif
    else
        ; Calculate adjustment factor
        iOldRate = gi_asp_learning_rate
        
        if (iQualityDifference > 0) then
            ; Quality too high - reduce learning rate to introduce more variety
            gi_asp_learning_rate *= 0.9
        else
            ; Quality too low - increase learning rate to favor good transitions more
            gi_asp_learning_rate *= 1.1
        endif
        
        ; Ensure within reasonable bounds
        gi_asp_learning_rate = limit(gi_asp_learning_rate, 0.05, 0.3)
        
        if (iDebugLevel >= 1) then
            prints "Adjusted learning rate: %.2f → %.2f (quality=%.2f vs target=%.2f)\n",
                   iOldRate, gi_asp_learning_rate, iAvgQuality, iTargetQuality
        endif
    endif
    end:
endop

; Check for transition patterns and break them if necessary
opcode detectPatternsAndAdapt, 0, ii
    iPatternThreshold, iDebugLevel xin
    
    ; Default values if not provided
    iPatternThreshold = (iPatternThreshold == 0) ? 3 : iPatternThreshold
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Check if we have enough transitions to detect patterns
    if (gi_asp_transition_count < 10) then
        igoto end
    endif
    
    ; Look for repeating patterns in last N transitions
    iMaxPatternLength = 4  ; Maximum pattern length to check for
    
    ; Extract last 10 transitions
    iLastTransitions[] init 10
    
    iHistoryIdx = 0
    while (iHistoryIdx < 10 && iHistoryIdx < gi_asp_transition_count) do
        ; Calculate position in history buffer
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract destination state
        iEntryBase = iActualIdx * 7
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        
        iLastTransitions[iHistoryIdx] = iToState
        iHistoryIdx += 1
    od
    
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
            
            ; Get the next state in the repeating pattern
            iNextPatternState = iLastTransitions[iCheckIdx % iPatternLength]
            
            ; Find current state
            iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
            
            ; Temporarily reduce probability for the next state in pattern
            iCurrentProb tab_i iCurrentStateIdx*27+iNextPatternState, gi_transition_matrix
            iReducedProb = iCurrentProb * 0.7  ; Reduce by 30%
            tabw_i iReducedProb, iCurrentStateIdx*27+iNextPatternState, gi_transition_matrix
            
            ; Re-normalize row
            iSum = 0
            iToIdx = 0
            while (iToIdx < 27) do
                iProb tab_i iCurrentStateIdx*27+iToIdx, gi_transition_matrix
                iSum += iProb
                iToIdx += 1
            od
            
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

; -----------------------------------------------------------------------
; DATA EXPORT FUNCTIONS
; -----------------------------------------------------------------------

; Export learning history to CSV for external analysis
opcode exportLearningHistory, 0, Si
    Soutputfile, iDebugLevel xin
    
    ; Default values
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/learning_history_export.csv"
    endif
    
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Create directory if it doesn't exist
    iSystem system_i 1, "mkdir -p docs/analysis", 0
    
    ; Write CSV header
    fprints Soutputfile, "transition_id,timestamp,from_state,to_state,quality,overlap,spread,centroid,movement\n"
    
    ; Current time for reference
    iCurrentTime times
    
    ; Export all recorded transitions (up to 100)
    iTransitionCount = min(gi_asp_transition_count, 100)
    
    iHistoryIdx = 0
    while (iHistoryIdx < iTransitionCount) do
        ; Calculate position in history buffer
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract transition data
        iEntryBase = iActualIdx * 7
        iFromState tab_i iEntryBase, gi_asp_transition_history
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        iOverlap tab_i iEntryBase+3, gi_asp_transition_history
        iSpread tab_i iEntryBase+4, gi_asp_transition_history
        iCentroid tab_i iEntryBase+5, gi_asp_transition_history
        iMovement tab_i iEntryBase+6, gi_asp_transition_history
        
        ; Estimate timestamp (crude approximation)
        iTransitionTime = iCurrentTime - (iHistoryIdx * gi_memory_resolution)
        
        ; Write to CSV
        fprints Soutputfile, "%d,%.2f,%d,%d,%.4f,%.4f,%.4f,%.4f,%.4f\n",
                gi_asp_transition_count - iHistoryIdx,
                iTransitionTime,
                iFromState, iToState, iQuality,
                iOverlap, iSpread, iCentroid, iMovement
        
        iHistoryIdx += 1
    od
    
    if (iDebugLevel >= 1) then
        prints "Learning history exported to %s (%d transitions)\n", 
               Soutputfile, iTransitionCount
    endif
endop

; -----------------------------------------------------------------------
; SYSTEM MANAGEMENT FUNCTIONS
; -----------------------------------------------------------------------

; Initialize the adaptive learning system
opcode initializeAdaptiveSystem, 0, i
    iDebugLevel xin
    
    ; Default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Reset counters and state
    gi_asp_history_index = 0
    gi_asp_transition_count = 0
    gi_asp_learning_rate = 0.1
    
    ; Initialize context features to neutral values
    iFeatureIdx = 0
    while (iFeatureIdx < 4) do
        tabw_i 0.5, iFeatureIdx, gi_asp_context_features
        iFeatureIdx += 1
    od
    
    ; Report initialization
    if (iDebugLevel >= 1) then
        prints "Adaptive learning system initialized\n"
        prints "  Learning rate: %.2f\n", gi_asp_learning_rate
        prints "  History capacity: %d transitions\n", 100
    endif
endop

; Make a prediction with explanation
opcode explainNextState, iii, i
    iDebugLevel xin
    
    ; Force detailed debug for explanation
    iNextDensity, iNextRegister, iNextMovement predictNextState (iDebugLevel > 0 ? iDebugLevel : 2)
    
    ; Convert prediction to state names for more meaningful explanation
    SdensityName = "unknown"
    if (iNextDensity == 0) then 
        SdensityName = "sparse"
    elseif (iNextDensity == 1) then
        SdensityName = "medium"
    elseif (iNextDensity == 2) then
        SdensityName = "dense"
    endif
    
    SregisterName = "unknown" 
    if (iNextRegister == 0) then
        SregisterName = "low"
    elseif (iNextRegister == 1) then
        SregisterName = "mid"
    elseif (iNextRegister == 2) then
        SregisterName = "high"
    endif
    
    SmovementName = "unknown"
    if (iNextMovement == 0) then
        SmovementName = "static"
    elseif (iNextMovement == 1) then
        SmovementName = "moderate" 
    elseif (iNextMovement == 2) then
        SmovementName = "dynamic"
    endif
    
    prints "\nAdaptive system suggestion: %s density, %s register, %s movement\n",
           SdensityName, SregisterName, SmovementName
    prints "  Based on %d past transitions and current musical context\n", 
           gi_asp_transition_count
    
    xout iNextDensity, iNextRegister, iNextMovement
endop
