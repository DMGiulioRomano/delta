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
