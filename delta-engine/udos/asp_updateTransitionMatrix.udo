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
