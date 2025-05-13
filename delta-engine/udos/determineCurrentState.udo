; determineCurrentState opcode
opcode determineCurrentState, kkk, 0    
	println "\t\t\t--- open determineCurrentState"
    
    ; Print threshold tables for debugging
    printsk "\t\t\t\tDensity thresholds: [%f, %f, %f, %f]\n",
           tab:k(0, gi_density_thresholds),
           tab:k(1, gi_density_thresholds),
           tab:k(2, gi_density_thresholds),
           tab:k(3, gi_density_thresholds)
    
    printsk "\t\t\t\tRegister thresholds: [%f, %f, %f, %f]\n",
           tab:k(0, gi_harmony_thresholds),
           tab:k(1, gi_harmony_thresholds),
           tab:k(2, gi_harmony_thresholds),
           tab:k(3, gi_harmony_thresholds)
    
    printsk "\t\t\t\tMovement thresholds: [%f, %f, %f, %f]\n",
           tab:k(0, gi_movement_thresholds),
           tab:k(1, gi_movement_thresholds),
           tab:k(2, gi_movement_thresholds),
           tab:k(3, gi_movement_thresholds)
        
    ; Initialize output states
    kDensityState = 0
    kRegisterState = 0
    kMovementState = 0
    
    ; Get number of threshold points (should be 4 in our case, defining 3 regions)
    kDensityThresholdLen = ftlen(gi_density_thresholds)
    kRegisterThresholdLen = ftlen(gi_harmony_thresholds)
    kMovementThresholdLen = ftlen(gi_movement_thresholds)
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_overlap < tab:k(0, gi_density_thresholds) then
        kDensityState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_overlap >= tab:k(kDensityThresholdLen-1, gi_density_thresholds) then
        kDensityState = kDensityThresholdLen - 2 ; Last valid state index
    else
        ; Determine density state by checking each threshold pair
        kDensityIdx = 0
        while kDensityIdx < kDensityThresholdLen-1 do
            kLowerBound tab kDensityIdx, gi_density_thresholds
            kUpperBound tab kDensityIdx+1, gi_density_thresholds
            
            if gk_current_overlap >= kLowerBound && gk_current_overlap < kUpperBound then
                kDensityState = kDensityIdx
                kgoto density_done
            endif
            
            kDensityIdx += 1
        od
    endif
    density_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_octave_spread < tab:k(0, gi_harmony_thresholds) then
        kRegisterState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_octave_spread >= tab:k(kRegisterThresholdLen-1, gi_harmony_thresholds) then
        kRegisterState = kRegisterThresholdLen - 2 ; Last valid state index
    else
        ; Determine register state by checking each threshold pair
        kRegisterIdx = 0
        while kRegisterIdx < kRegisterThresholdLen-1 do
            kLowerBound tab kRegisterIdx, gi_harmony_thresholds
            kUpperBound tab kRegisterIdx+1, gi_harmony_thresholds
            
            if gk_current_octave_spread >= kLowerBound && gk_current_octave_spread < kUpperBound then
                kRegisterState = kRegisterIdx
                kgoto register_done
            endif
            
            kRegisterIdx += 1
        od
    endif
    register_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_spatial_movement < tab:k(0, gi_movement_thresholds) then
        kMovementState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_spatial_movement >= tab:k(kMovementThresholdLen-1, gi_movement_thresholds) then
        kMovementState = kMovementThresholdLen - 2 ; Last valid state index
    else
        ; Determine movement state by checking each threshold pair
        kMovementIdx = 0
        while kMovementIdx < kMovementThresholdLen-1 do
            kLowerBound tab kMovementIdx, gi_movement_thresholds
            kUpperBound tab kMovementIdx+1, gi_movement_thresholds
            
            if gk_current_spatial_movement >= kLowerBound && gk_current_spatial_movement < kUpperBound then
                kMovementState = kMovementIdx
                kgoto movement_done
            endif
            
            kMovementIdx += 1
        od
    endif
    movement_done:
    
    ; Debug output if requested
    if gi_debug >= 3 then
        printsk "\t\t\t\tdetermineCurrentState: Input [%.2f, %.2f, %.2f] -> State [%d, %d, %d]\n",
               gk_current_overlap, gk_current_octave_spread, gk_current_spatial_movement,
               kDensityState, kRegisterState, kMovementState
    endif
	println "\t\t\t--- close determineCurrentState"
    xout kDensityState, kRegisterState, kMovementState
endop
