opcode recordCurrentState, 0, 0    
    ; Get current time (use a local variable to avoid k-rate/i-rate conversion issues)
    iCurrentTime times
    
    ; Determine the current state using the fixed determineCurrentState opcode
    iDensityState, iRegisterState, iMovementState determineCurrentState
    
    ; Debug output if requested
    if gi_debug >= 2 then
        prints "recordCurrentState: Current musical parameters [%.2f, %.2f, %.2f] -> State [%d, %d, %d]\n",
               gi_current_overlap, gi_current_octave_spread, gi_current_spatial_movement,
               iDensityState, iRegisterState, iMovementState
    endif
    
    ; Update controller's knowledge of current state
    gi_tc_current_density = iDensityState
    gi_tc_current_register = iRegisterState
    gi_tc_current_movement = iMovementState
    
    ; Record this state in the past states memory
    iMemoryIdx = gi_tc_past_states_index * 3
    tabw_i iDensityState, iMemoryIdx, gi_tc_past_states
    tabw_i iRegisterState, iMemoryIdx+1, gi_tc_past_states
    tabw_i iMovementState, iMemoryIdx+2, gi_tc_past_states
    
    ; Update index for circular buffer of past states (capacity for 8 states)
    gi_tc_past_states_index = (gi_tc_past_states_index + 1) % 8
    
    ; During transitions, record actual state for quality assessment
    if (gi_tc_transition_active == 1) then
        ; Use transition parameters directly from global variables
        ; Important: Get a fresh copy of the current time for accurate progress calculation
        iElapsedTime = iCurrentTime - gi_tc_transition_start_time
        
        ; Calculate progress as a ratio of elapsed time to total duration
        iProgress = iElapsedTime / gi_tc_transition_duration
        
        if gi_debug >= 3 then
            prints "Transition tracking: time=%.2f, start=%.2f, duration=%.2f\n",
                   iCurrentTime, gi_tc_transition_start_time, gi_tc_transition_duration
            prints "Elapsed time: %.2f, Progress: %.3f\n", iElapsedTime, iProgress
        endif
        
        ; Ensure progress is within valid range [0, 0.99]
        ; This prevents buffer overflow and handles cases where we might be slightly past the transition end
        iProgress = limit(iProgress, 0, 0.99)
        
        ; Calculate index in the tracking tables (0-99)
        iTimeIndex = int(iProgress * 100)
        
        if gi_debug >= 3 then
            prints "Using time index: %d for progress %.3f\n", iTimeIndex, iProgress
        endif

        ; Store all state components in the actual state tables
        tabw_i iDensityState, iTimeIndex, gi_tc_actual_state_density
        tabw_i iRegisterState, iTimeIndex, gi_tc_actual_state_register
        tabw_i iMovementState, iTimeIndex, gi_tc_actual_state_movement
        
        ; Compare with expected states
        iExpectedDensity tab_i iTimeIndex, gi_tc_expected_state_density
        iExpectedRegister tab_i iTimeIndex, gi_tc_expected_state_register 
        iExpectedMovement tab_i iTimeIndex, gi_tc_expected_state_movement
        
        ; Calculate deviation
        iDensityDev = abs(iDensityState - iExpectedDensity)
        iRegisterDev = abs(iRegisterState - iExpectedRegister)
        iMovementDev = abs(iMovementState - iExpectedMovement)
        
        ; Store deviation for later quality assessment
        tabw_i iDensityDev, iTimeIndex, gi_tc_deviation_density
        tabw_i iRegisterDev, iTimeIndex, gi_tc_deviation_register
        tabw_i iMovementDev, iTimeIndex, gi_tc_deviation_movement
        
        if gi_debug >= 3 then
            prints "Recorded state [%d,%d,%d] at progress %.2f (index %d)\n", 
                   iDensityState, iRegisterState, iMovementState, 
                   iProgress, iTimeIndex
            prints "Expected: [%.2f,%.2f,%.2f], Deviation: [%.2f,%.2f,%.2f]\n",
                   iExpectedDensity, iExpectedRegister, iExpectedMovement,
                   iDensityDev, iRegisterDev, iMovementDev
        endif
    endif
endop
