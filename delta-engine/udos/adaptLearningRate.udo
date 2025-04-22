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

