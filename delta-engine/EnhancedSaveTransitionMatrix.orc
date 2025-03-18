; =============================================================================
; EnhancedSaveTransitionMatrix.orc
; Enhanced version of SaveTransitionMatrix that includes transition learning data
; =============================================================================

; -----------------------------------------------------------------------
; Matrix Analysis Opcode
; -----------------------------------------------------------------------
opcode analyzeMatrixDifference, i, 0
    ; This opcode calculates how much the transition matrix has changed
    ; from its initial state due to adaptive learning
    
    ; Create a reference matrix with the initial probabilities
    iRefMatrix ftgen 0, 0, 27*27, -2, 0
    
    ; Initialize the reference matrix with default probabilities
    ; (Similar logic to initTransitionMatrix but without modifying the actual matrix)
    iStateIdx = 0
    while (iStateIdx < 27) do
        ; For each source state
        iNextIdx = 0
        while (iNextIdx < 27) do
            ; Calculate default probability based on "distance" between states
            iFromDensity = int(iStateIdx / 9)
            iFromRemainder = iStateIdx % 9
            iFromRegister = int(iFromRemainder / 3)
            iFromMovement = iFromRemainder % 3
            
            iNextDensity = int(iNextIdx / 9)
            iNextRemainder = iNextIdx % 9
            iNextRegister = int(iNextRemainder / 3)
            iNextMovement = iNextRemainder % 3
            
            ; Count parameter changes
            iChanges = 0
            if (iFromDensity != iNextDensity) then
                iChanges += 1
            endif
            
            if (iFromRegister != iNextRegister) then
                iChanges += 1
            endif
            
            if (iFromMovement != iNextMovement) then
                iChanges += 1
            endif
            
            ; Assign default probability
            iDefaultProb = 0
            if (iChanges == 0) then
                iDefaultProb = 0.4
            elseif (iChanges == 1) then
                iDefaultProb = 0.3
            elseif (iChanges == 2) then
                iDefaultProb = 0.2
            else
                iDefaultProb = 0.1
            endif
            
            ; Store in reference matrix
            tabw_i iDefaultProb, iStateIdx*27+iNextIdx, iRefMatrix
            
            iNextIdx += 1
        od
        
        ; Normalize row
        iRowSum = 0
        iIdx = 0
        while (iIdx < 27) do
            iRowSum += tab_i(iStateIdx*27+iIdx, iRefMatrix)
            iIdx += 1
        od
        
        if (iRowSum > 0) then
            iIdx = 0
            while (iIdx < 27) do
                iProb = tab_i(iStateIdx*27+iIdx, iRefMatrix)
                iNormProb = iProb / iRowSum
                tabw_i iNormProb, iStateIdx*27+iIdx, iRefMatrix
                iIdx += 1
            od
        endif
        
        iStateIdx += 1
    od
    
    ; Calculate total difference between current matrix and reference
    iTotalDiff = 0
    iEntryCount = 0
    
    iFromIdx = 0
    while (iFromIdx < 27) do
        iToIdx = 0
        while (iToIdx < 27) do
            iCurrentProb = tab_i(iFromIdx*27+iToIdx, gi_transition_matrix)
            iRefProb = tab_i(iFromIdx*27+iToIdx, iRefMatrix)
            
            iTotalDiff += abs(iCurrentProb - iRefProb)
            iEntryCount += 1
            
            iToIdx += 1
        od
        iFromIdx += 1
    od
    
    ; Calculate average difference per matrix entry
    iAvgDiff = (iEntryCount > 0) ? iTotalDiff / iEntryCount : 0
    
    ; Scale to 0-1 range (assuming max theoretical difference is 2.0 per entry)
    iNormalizedDiff = iAvgDiff / 2.0
    
    xout iNormalizedDiff
endop

instr EnhancedSaveTransitionMatrix
    i_current_time times
    prints "\nSaving enhanced transition matrix with learning data at time %.1f...\n", i_current_time
    
    ; Create directories if they don't exist
    iRes system_i 1, "mkdir -p ./docs/analysis", 0
    iRes system_i 1, "mkdir -p ./docs/analysis/transitions", 0
    
    ; Generate timestamp-based filename for historical tracking
    STimeStamp sprintf "%.0f", i_current_time
    SMatrixFile sprintf "docs/analysis/transitions/transition_matrix_%s.csv", STimeStamp
    SMetadataFile sprintf "docs/analysis/transitions/transition_metadata_%s.csv", STimeStamp
    
    ; Create CSV header
    fprints SMatrixFile, "from_state,to_state,probability,description\n"
    
    ; Map state indices to readable labels
    SStateLabels[] init 27
    iStateIdx = 0
    while (iStateIdx < 27) do
        iDensity = int(iStateIdx / 9)
        iRemainder = iStateIdx % 9
        iRegister = int(iRemainder / 3)
        iMovement = iRemainder % 3
        
        ; Create readable state description
        SDensityLabel = ""
        if (iDensity == 0) then
            SDensityLabel = "Sparse"
        elseif (iDensity == 1) then
            SDensityLabel = "Medium"
        else
            SDensityLabel = "Dense"
        endif
        
        SRegisterLabel = ""
        if (iRegister == 0) then
            SRegisterLabel = "Low"
        elseif (iRegister == 1) then
            SRegisterLabel = "Mid"
        else
            SRegisterLabel = "High"
        endif
        
        SMovementLabel = ""
        if (iMovement == 0) then
            SMovementLabel = "Static"
        elseif (iMovement == 1) then
            SMovementLabel = "Moderate"
        else
            SMovementLabel = "Dynamic"
        endif
        
        SLabel sprintf "D%d-R%d-M%d (%s %s %s)", iDensity, iRegister, iMovement, 
                       SDensityLabel, SRegisterLabel, SMovementLabel
        SStateLabels[iStateIdx] = SLabel
        
        iStateIdx += 1
    od
    
    ; Write the matrix with descriptive labels
    iFromStateIdx = 0
    while (iFromStateIdx < 27) do
        iToStateIdx = 0
        
        ; Calculate total transitions for percentage
        iTotalTransitions = 0
        iToTemp = 0
        while (iToTemp < 27) do
            iProb tab_i iFromStateIdx*27+iToTemp, gi_transition_matrix
            iTotalTransitions += iProb
            iToTemp += 1
        od
        
        while (iToStateIdx < 27) do
            iProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
            
            ; Only include non-zero probabilities to reduce file size
            if (iProb > 0.001) then
                ; Calculate percentage for human readability
                iPercentage = (iTotalTransitions > 0) ? (iProb / iTotalTransitions) * 100 : 0
                
                ; Add row with descriptive labels
                fprints SMatrixFile, "%s,%s,%.4f,\"%.1f%%\"\n", 
                        SStateLabels[iFromStateIdx], SStateLabels[iToStateIdx], 
                        iProb, iPercentage
            endif
            
            iToStateIdx += 1
        od
        
        iFromStateIdx += 1
    od
    
    ; Save metadata about transition system
    fprints SMetadataFile, "parameter,value,description\n"
    fprints SMetadataFile, "timestamp,%.2f,\"Time when matrix was saved\"\n", i_current_time
    fprints SMetadataFile, "transition_count,%d,\"Total transitions completed\"\n", gi_tc_transition_count
    fprints SMetadataFile, "current_density,%d,\"Current density state (0-2)\"\n", gi_tc_current_density
    fprints SMetadataFile, "current_register,%d,\"Current register state (0-2)\"\n", gi_tc_current_register
    fprints SMetadataFile, "current_movement,%d,\"Current movement state (0-2)\"\n", gi_tc_current_movement
    
    ; Include transition controller parameters
    fprints SMetadataFile, "transitions_completed,%d,\"Number of transitions completed\"\n", gi_tc_transition_count
    fprints SMetadataFile, "transition_mode,%.2f,\"Current transition mode (0=sudden, 1=gradual)\"\n", gi_tc_transition_mode
    fprints SMetadataFile, "transition_randomness,%.2f,\"Current transition randomness factor\"\n", gi_tc_transition_randomness
    
    ; Include adaptive system parameters
    fprints SMetadataFile, "adaptive_learning_rate,%.2f,\"Adaptive learning rate\"\n", gi_asp_learning_rate
    fprints SMetadataFile, "adaptive_transitions_recorded,%d,\"Number of transitions in adaptive memory\"\n", gi_asp_transition_count
    
    ; Include advanced statistics about adaptation
    fprints SMetadataFile, "matrix_adaptivity,%.2f,\"Degree of matrix adaptation from initial state\"\n", analyzeMatrixDifference()
    
    ; Generate simplified 2D matrix for heatmap visualization
    S2DMatrixFile sprintf "docs/analysis/transitions/transition_matrix_2d_%s.csv", STimeStamp
    
    ; Write header row
    fprints S2DMatrixFile, "from_state"
    iToIdx = 0
    while (iToIdx < 27) do
        fprints S2DMatrixFile, ",%s", SStateLabels[iToIdx]
        iToIdx += 1
    od
    fprints S2DMatrixFile, "\n"
    
    ; Write data rows
    iFromIdx = 0
    while (iFromIdx < 27) do
        fprints S2DMatrixFile, "%s", SStateLabels[iFromIdx]
        
        iToIdx = 0
        while (iToIdx < 27) do
            iProb tab_i iFromIdx*27+iToIdx, gi_transition_matrix
            fprints S2DMatrixFile, ",%.4f", iProb
            iToIdx += 1
        od
        
        fprints S2DMatrixFile, "\n"
        iFromIdx += 1
    od
    
    ; Generate visual representation if Python is available
;    SPythonCmd sprintf "python3 -c \"import sys; sys.path.append('./docs'); try: from visualize_transition_matrix import visualize_matrix; visualize_matrix('%s', '%s'); print('Transition matrix visualization created'); except Exception as e: print('Could not create visualization:', e)\"", S2DMatrixFile, STimeStamp
;    
;    iRes system_i 1, SPythonCmd, 0
    
    prints "\nTransition matrices saved to:\n  %s\n  %s\n  %s\n", SMatrixFile, SMetadataFile, S2DMatrixFile
    
    ; Always turn off after execution
    turnoff
endin
