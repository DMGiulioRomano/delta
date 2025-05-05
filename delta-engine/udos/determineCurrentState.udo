; determineCurrentState opcode
opcode determineCurrentState, iii, 0    
    
    ; Print threshold tables for debugging
    prints "Density thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_density_thresholds),
           tab_i(1, gi_density_thresholds),
           tab_i(2, gi_density_thresholds),
           tab_i(3, gi_density_thresholds)
    
    prints "Register thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_register_thresholds),
           tab_i(1, gi_register_thresholds),
           tab_i(2, gi_register_thresholds),
           tab_i(3, gi_register_thresholds)
    
    prints "Movement thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_movement_thresholds),
           tab_i(1, gi_movement_thresholds),
           tab_i(2, gi_movement_thresholds),
           tab_i(3, gi_movement_thresholds)
        
    ; Initialize output states
    iDensityState = 0
    iRegisterState = 0
    iMovementState = 0
    
    ; Get number of threshold points (should be 4 in our case, defining 3 regions)
    iDensityThresholdLen = ftlen(gi_density_thresholds)
    iRegisterThresholdLen = ftlen(gi_register_thresholds)
    iMovementThresholdLen = ftlen(gi_movement_thresholds)
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_overlap < tab_i(0, gi_density_thresholds) then
        iDensityState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_overlap >= tab_i(iDensityThresholdLen-1, gi_density_thresholds) then
        iDensityState = iDensityThresholdLen - 2 ; Last valid state index
    else
        ; Determine density state by checking each threshold pair
        iDensityIdx = 0
        while iDensityIdx < iDensityThresholdLen-1 do
            iLowerBound tab_i iDensityIdx, gi_density_thresholds
            iUpperBound tab_i iDensityIdx+1, gi_density_thresholds
            
            if gk_current_overlap >= iLowerBound && gk_current_overlap < iUpperBound then
                iDensityState = iDensityIdx
                igoto density_done
            endif
            
            iDensityIdx += 1
        od
    endif
    density_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_octave_spread < tab_i(0, gi_register_thresholds) then
        iRegisterState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_octave_spread >= tab_i(iRegisterThresholdLen-1, gi_register_thresholds) then
        iRegisterState = iRegisterThresholdLen - 2 ; Last valid state index
    else
        ; Determine register state by checking each threshold pair
        iRegisterIdx = 0
        while iRegisterIdx < iRegisterThresholdLen-1 do
            iLowerBound tab_i iRegisterIdx, gi_register_thresholds
            iUpperBound tab_i iRegisterIdx+1, gi_register_thresholds
            
            if gk_current_octave_spread >= iLowerBound && gk_current_octave_spread < iUpperBound then
                iRegisterState = iRegisterIdx
                igoto register_done
            endif
            
            iRegisterIdx += 1
        od
    endif
    register_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gk_current_spatial_movement < tab_i(0, gi_movement_thresholds) then
        iMovementState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gk_current_spatial_movement >= tab_i(iMovementThresholdLen-1, gi_movement_thresholds) then
        iMovementState = iMovementThresholdLen - 2 ; Last valid state index
    else
        ; Determine movement state by checking each threshold pair
        iMovementIdx = 0
        while iMovementIdx < iMovementThresholdLen-1 do
            iLowerBound tab_i iMovementIdx, gi_movement_thresholds
            iUpperBound tab_i iMovementIdx+1, gi_movement_thresholds
            
            if gk_current_spatial_movement >= iLowerBound && gk_current_spatial_movement < iUpperBound then
                iMovementState = iMovementIdx
                igoto movement_done
            endif
            
            iMovementIdx += 1
        od
    endif
    movement_done:
    
    ; Debug output if requested
    if gi_debug >= 3 then
        prints "determineCurrentState: Input [%.2f, %.2f, %.2f] -> State [%d, %d, %d]\n",
               gk_current_overlap, gk_current_octave_spread, gk_current_spatial_movement,
               iDensityState, iRegisterState, iMovementState
    endif
    xout iDensityState, iRegisterState, iMovementState
endop
