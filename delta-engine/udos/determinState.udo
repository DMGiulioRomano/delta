opcode determineCurrentState, iii, iii
    iDensity, iRegisterSpread, iMovement xin
    
    ; Initialize output states
    iDensityState = 0
    iRegisterState = 0
    iMovementState = 0
    
    ; Determine density state
    iDensityIdx = 0
    while iDensityIdx < ftlen(gi_density_thresholds)-1 do
        iLowerBound tab_i iDensityIdx, gi_density_thresholds
        iUpperBound tab_i iDensityIdx+1, gi_density_thresholds
        
        if iDensity >= iLowerBound && iDensity < iUpperBound then
            iDensityState = iDensityIdx
            igoto density_done
        endif
        
        iDensityIdx += 1
    od
    density_done:
    
    ; Determine register state
    iRegisterIdx = 0
    while iRegisterIdx < ftlen(gi_register_thresholds)-1 do
        iLowerBound tab_i iRegisterIdx, gi_register_thresholds
        iUpperBound tab_i iRegisterIdx+1, gi_register_thresholds
        
        if iRegisterSpread >= iLowerBound && iRegisterSpread < iUpperBound then
            iRegisterState = iRegisterIdx
            igoto register_done
        endif
        
        iRegisterIdx += 1
    od
    register_done:
    
    ; Determine movement state
    iMovementIdx = 0
    while iMovementIdx < ftlen(gi_movement_thresholds)-1 do
        iLowerBound tab_i iMovementIdx, gi_movement_thresholds
        iUpperBound tab_i iMovementIdx+1, gi_movement_thresholds
        
        if iMovement >= iLowerBound && iMovement < iUpperBound then
            iMovementState = iMovementIdx
            igoto movement_done
        endif
        
        iMovementIdx += 1
    od
    movement_done:
    
    ; Optional debug output
    if gi_debug >= 2 then
        prints "State Analysis: Density=%d, Register=%d, Movement=%d\n", 
               iDensityState, iRegisterState, iMovementState
    endif
    
    xout iDensityState, iRegisterState, iMovementState
endop
