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


; -----------------------------------------------------------------------
; ADAPTIVE SYSTEM CONFIGURATION CONTROL
; -----------------------------------------------------------------------

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
; SYSTEM MANAGEMENT FUNCTIONS
; -----------------------------------------------------------------------


