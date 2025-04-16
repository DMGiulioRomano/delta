instr TransitionAnalyzer
    ; Executed periodically to analyze transition quality trends
    i_currentTime times
    
    ; Load recent transition history
    iSuccessCount = 0
    iFailureCount = 0
    iTotalQuality = 0
    iEntryCount = 0
    
    ; Analyze only last 20 transitions (or fewer if we haven't had 20)
    iMaxEntries = min(gi_asp_transition_count, 20)
    
    iHistoryIdx = 0
    while (iHistoryIdx < iMaxEntries) do
        ; Get entry from circular buffer (most recent first)
        iEntryPos = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        iEntryIdx = iEntryPos * 7
        iQuality tab_i iEntryIdx+2, gi_asp_transition_history
        
        iTotalQuality += iQuality
        if (iQuality >= 0.7) then
            iSuccessCount += 1
        elseif (iQuality <= 0.4) then
            iFailureCount += 1
        endif
        
        iEntryCount += 1
        iHistoryIdx += 1
    od
    
    ; Calculate statistics
    iAvgQuality = (iEntryCount > 0) ? iTotalQuality / iEntryCount : 0
    iSuccessRate = (iEntryCount > 0) ? iSuccessCount / iEntryCount : 0
    iFailureRate = (iEntryCount > 0) ? iFailureCount / iEntryCount : 0
    
    ; Log the analysis
    fprints "docs/analysis/transition_quality_log.csv", "%.2f,%d,%.4f,%.2f,%.2f\n",
           i_currentTime, iEntryCount, iAvgQuality, iSuccessRate, iFailureRate
    
    ; Display in console
    if (gi_debug >= 1) then
        prints "\n=== TRANSITION QUALITY ANALYSIS at %.1f sec ===\n", i_currentTime
        prints "Recent transitions: %d\n", iEntryCount
        prints "Average quality: %.2f\n", iAvgQuality
        prints "Success rate: %.0f%%\n", iSuccessRate * 100
        prints "Failure rate: %.0f%%\n", iFailureRate * 100
        prints "==============================================\n\n"
    endif
    
    ; Schedule next analysis in 30 seconds
    event_i "i", "TransitionAnalyzer", 30, 0.1
endin
