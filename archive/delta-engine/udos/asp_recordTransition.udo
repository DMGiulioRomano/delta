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
        updateTransitionMatrix(iFromStateIdx, iToStateIdx, iQuality, iDebugLevel)
        
        if (iDebugLevel >= 1) then
            iFromDens = int(iFromStateIdx / 9)
            iFromRem = iFromStateIdx % 9
            iFromReg = int(iFromRem / 3)
            iFromMov = iFromRem % 3
            
            iToDens = int(iToStateIdx / 9)
            iToRem = iToStateIdx % 9
            iToReg = int(iToRem / 3)
            iToMov = iToRem % 3
            
            prints "Recorded transition #%d: [%d,%d,%d] to [%d,%d,%d] with quality %.2f\n", 
                   gi_asp_transition_count, 
                   iFromDens, iFromReg, iFromMov,
                   iToDens, iToReg, iToMov,
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
