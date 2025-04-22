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
