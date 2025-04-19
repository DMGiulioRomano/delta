; -----------------------------------------------------------------------
; RECORDER FOR CURRENT MUSICAL STATE
; -----------------------------------------------------------------------
opcode recordCurrentState, 0, 0
    ; Read current state from global variables populated by Analizzatore
    i_current_overlap = i(gk_current_overlap)
    i_current_octave_spread = i(gk_current_octave_spread)
    i_current_spatial_movement = i(gk_current_spatial_movement)
    
    ; Determine the current state using the existing determineCurrentState opcode
    iDensityState, iRegisterState, iMovementState determineCurrentState i_current_overlap, i_current_octave_spread, i_current_spatial_movement 
    
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
        iProgress = (i(gk_current_time) - gi_tc_transition_start_time) / gi_tc_transition_duration
        iProgress = limit(iProgress, 0, 0.99)  ; Avoid buffer overflow
        
        iTimeIndex = int(iProgress * 100)

        // Store all state components
        tabw_i iDensityState, iTimeIndex, gi_tc_actual_state_density
        tabw_i iRegisterState, iTimeIndex, gi_tc_actual_state_register
        tabw_i iMovementState, iTimeIndex, gi_tc_actual_state_movement
        
        // Compare with expected states
        iExpectedDensity tab_i iTimeIndex, gi_tc_expected_state_density
        iExpectedRegister tab_i iTimeIndex, gi_tc_expected_state_register 
        iExpectedMovement tab_i iTimeIndex, gi_tc_expected_state_movement
        
        // Calculate deviation
        iDensityDev = abs(iDensityState - iExpectedDensity)
        iRegisterDev = abs(iRegisterState - iExpectedRegister)
        iMovementDev = abs(iMovementState - iExpectedMovement)
        
        // Store deviation for later quality assessment
        tabw_i iDensityDev, iTimeIndex, gi_tc_deviation_density
        tabw_i iRegisterDev, iTimeIndex, gi_tc_deviation_register
        tabw_i iMovementDev, iTimeIndex, gi_tc_deviation_movement
    endif
endop


; -----------------------------------------------------------------------
; TRANSITION INITIALIZATION
; -----------------------------------------------------------------------
opcode initializeTransition, 0, 0
    ; Record current state as source
    gi_tc_source_density = gi_tc_current_density
    gi_tc_source_register = gi_tc_current_register
    gi_tc_source_movement = gi_tc_current_movement
    
    ; Calculate source state index
    iSourceStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Select target state using the adaptive prediction system
    iTargetDensity, iTargetRegister, iTargetMovement predictNextState
    ; Store target state
    gi_tc_target_density = iTargetDensity
    gi_tc_target_register = iTargetRegister
    gi_tc_target_movement = iTargetMovement
    
    ; Calculate target state index
    iTargetStateIdx = (gi_tc_target_density * 9) + (gi_tc_target_register * 3) + gi_tc_target_movement
    
    ; Determine transition characteristics (mode and randomness)
    iDifferentParams = 0
    if (gi_tc_source_density != gi_tc_target_density) then
        iDifferentParams += 1
    endif
    if (gi_tc_source_register != gi_tc_target_register) then
        iDifferentParams += 1
    endif
    if (gi_tc_source_movement != gi_tc_target_movement) then
        iDifferentParams += 1
    endif
    
    ; Decide transition mode (gradual vs sudden) based on parameter distance
    ; More different parameters = more likely to use a gradual transition
    if (iDifferentParams >= 2) then
        gi_tc_transition_mode = random(0.7, 1.0)  ; More likely gradual for big changes
    else
        gi_tc_transition_mode = random(0.3, 1.0)  ; More variety for small changes
    endif
    
    ; Add randomness to make transitions less predictable
    gi_tc_transition_randomness = random(0.1, 0.4)
    
    ; Calculate transition duration using existing opcode
    iTransDuration calculateTransitionDuration
    
    ; Store transition parameters
    gi_tc_transition_active = 1
    gi_tc_transition_duration = iTransDuration
    gi_tc_transition_start_time times
    gi_tc_transition_progress = 0
    
    ; Initialize timing for behavior generation
    gi_tc_next_behavior_time = 0  ; Generate first behavior immediately
        
    ; Initialize expected state progression for all dimensions
    iIndex = 0
    while (iIndex < 100) do
        iProgressPoint = iIndex * 0.01  ; 0.00 to 0.99
        
        ; Start with source states as default values
        iExpectedDensity = gi_tc_source_density
        iExpectedRegister = gi_tc_source_register
        iExpectedMovement = gi_tc_source_movement
        
        ; For DENSITY: Only interpolate if source and target differ
        if (gi_tc_source_density != gi_tc_target_density) then
            ; Need to create i-rate copies for interpolate function
            i_source_density = gi_tc_source_density
            i_target_density = gi_tc_target_density
            iExpectedDensity = cubicInterpolate(i_source_density, i_target_density, iProgressPoint)
        endif
        
        ; For REGISTER: Only interpolate if source and target differ
        if (gi_tc_source_register != gi_tc_target_register) then
            ; Need to create i-rate copies for interpolate function
            i_source_register = gi_tc_source_register
            i_target_register = gi_tc_target_register
            iExpectedRegister = cubicInterpolate(i_source_register, i_target_register, iProgressPoint)
        endif
        
        ; For MOVEMENT: Only interpolate if source and target differ
        if (gi_tc_source_movement != gi_tc_target_movement) then
            ; Need to create i-rate copies for interpolate function
            i_source_movement = gi_tc_source_movement
            i_target_movement = gi_tc_target_movement
            iExpectedMovement = cubicInterpolate(i_source_movement, i_target_movement, iProgressPoint)
        endif
        
        ; Store expected state values in their respective tables
        tabw_i iExpectedDensity, iIndex, gi_tc_expected_state_density
        tabw_i iExpectedRegister, iIndex, gi_tc_expected_state_register
        tabw_i iExpectedMovement, iIndex, gi_tc_expected_state_movement
        
        iIndex += 1
    od  
endop

; -----------------------------------------------------------------------
; PARAMETER INTERPOLATION OPCODES
; -----------------------------------------------------------------------

; Linear interpolation with optional curve shaping
opcode interpolateParameter, i, iiii
    iSourceValue, iTargetValue, iProgress, iCurve xin
    
    ; Apply transition curve if specified (default is linear)
    iMappedProgress = iProgress
    if (iCurve != 0) then
        ; Positive curve = slow start, fast end (ease-in)
        ; Negative curve = fast start, slow end (ease-out)
        if (iCurve > 0) then
            iMappedProgress = pow(iProgress, 1 + iCurve)
        else
            iMappedProgress = 1 - pow(1 - iProgress, 1 - iCurve)
        endif
    endif
    
    ; Perform the interpolation
    iResult = iSourceValue + (iTargetValue - iSourceValue) * iMappedProgress
    
    xout iResult
endop

; Calculates timing between behaviors based on transition progress
opcode interpolateBehaviorTiming, i, i
    iProgress xin    
    ; Interpolate density value at current progress
    iCurrentDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    
    ; Map density state to behavior timing
    ; Higher density = more frequent behaviors
    iMinInterval = gi_tc_min_behavior_interval
    iMaxInterval = gi_tc_max_behavior_interval
    
    ; Exponential mapping from density (0-2) to interval
    iDensityNormalized = limit(iCurrentDensity / 2, 0, 1)
    iIntervalFactor = pow(1 - iDensityNormalized, 1.5)  ; Inverse and non-linear relationship
    
    iInterval = iMinInterval + (iMaxInterval - iMinInterval) * iIntervalFactor
    
    ; Add slight randomization
    iRandomFactor random 0.8, 1.2
    iInterval = iInterval * iRandomFactor
    
    ; Ensure we stay within reasonable bounds
    iInterval = limit(iInterval, iMinInterval, iMaxInterval)
    
    xout iInterval
endop

; -----------------------------------------------------------------------
; BEHAVIOR GENERATION WITH INTERPOLATED PARAMETERS
; -----------------------------------------------------------------------
opcode generateTransitionBehavior, 0, i
    iProgress xin
    
    ; Interpolate between source and target states
    iInterpolatedDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    iInterpolatedRegister interpolateParameter gi_tc_source_register, gi_tc_target_register, iProgress, 0
    iInterpolatedMovement interpolateParameter gi_tc_source_movement, gi_tc_target_movement, iProgress, -0.3
    
    ; Now map these state values to actual musical parameters
    
    ; 1. Harmonic Duration based on density
    iHarmonicDuration mapDensityToHarmonicDuration iInterpolatedDensity
    
    ; 2. Octave and Register parameters
    iMinOctave, iMaxOctave mapStateToParameter iInterpolatedRegister, "register"
    iOctave random iMinOctave, iMaxOctave
    iOctave = round(iOctave)
    
    iRegister random 1, 10  ; Full range of registers
    iRegister = round(iRegister)
    
    ; 3. Generate rhythm values based on interpolated movement parameter
    iRhythmTableSize = 5
    iRhythmsTable generateRhythmsForState iInterpolatedDensity, iInterpolatedMovement, iHarmonicDuration, iRhythmTableSize
    ; 4. Amplitude based on register and octave
    iMaxAmplitude calculateMaxAmplitude iOctave, iRegister
    iAmplitude random iMaxAmplitude - 3, iMaxAmplitude
    
    ; 5. Duration based on harmonic duration and density
    iDuration = iHarmonicDuration * (2 + iInterpolatedDensity)
    
    ; 6. Generate positions - for simplicity, use random positions
    iPositionsTable ftgen 0, 0, iRhythmTableSize+1, -2, 0
    iIdx = 0
    while (iIdx < iRhythmTableSize) do
        iRhythmVal tab_i iIdx, iRhythmsTable
        iPos random 0, iRhythmVal
        iPos = int(iPos)
        tabw_i iPos, iIdx, iPositionsTable
        iIdx += 1
    od
    
    ; Start time for the behavior (now)
    iStartTime = 0
    ; Globally unique ID for this behavior
    gi_compId +=1
    ; 
    ; da capire come gestire iNextID
    iNextID = gi_NUMComportamenti - 10  ; Reserve last 10 slots for transition behaviors
    iNextID += gi_tc_transition_active   ; Increment when transition is active
    iAt times
    ; Schedule the behavior generation with interpolated parameters
    event_i "i", "GeneraComportamenti", iStartTime, 10, 
            iAt, iDuration, iRhythmsTable, iHarmonicDuration, 
            iAmplitude, iOctave, iRegister, iPositionsTable, gi_compId
    
    ; Debug output
    if (gi_debug >= 2) then
        prints "Generated transition behavior at progress %.2f:\n", iProgress
        prints "  Density: %.2f, Register: %.2f, Movement: %.2f\n", 
               iInterpolatedDensity, iInterpolatedRegister, iInterpolatedMovement
        prints "  Duration: %.1f, Harmonic Duration: %.1f\n", 
               iDuration, iHarmonicDuration
        prints "  Octave: %d, Register: %d, Amplitude: %.1f\n", 
               iOctave, iRegister, iAmplitude
    endif
endop

; -----------------------------------------------------------------------
; TRANSITION QUALITY ASSESSMENT AND ADAPTATION
; -----------------------------------------------------------------------
opcode assessTransitionQuality, i, 0
    ; Initialize separate counters for each dimension
    iDensityDeviation = 0
    iRegisterDeviation = 0
    iMovementDeviation = 0
    iSamples = 0

    iAvgDensityDev = 0
    iAvgRegisterDev = 0
    iAvgMovementDev = 0

    ; Scan through transition timeline (0-100%)    
    iIndex = 0
    while (iIndex < 100) do
        ; Check if we have data at this point (non-zero values in any dimension)
        iDensityValue tab_i iIndex, gi_tc_deviation_density
        iRegisterValue tab_i iIndex, gi_tc_deviation_register
        iMovementValue tab_i iIndex, gi_tc_deviation_movement
        
        ; Only include points with actual recorded data
        if (iDensityValue > 0 || iRegisterValue > 0 || iMovementValue > 0) then
            ; Accumulate deviations in each dimension
            iDensityDeviation += iDensityValue
            iRegisterDeviation += iRegisterValue
            iMovementDeviation += iMovementValue
            iSamples += 1
        endif
        
        iIndex += 1
    od
    
    ; Calculate weighted quality score
    iQuality = 1.0  ; Default perfect score
    
    if (iSamples > 0) then
        ; Calculate average deviation in each dimension
        iAvgDensityDev = iDensityDeviation / iSamples
        iAvgRegisterDev = iRegisterDeviation / iSamples
        iAvgMovementDev = iMovementDeviation / iSamples
        
        ; Apply dimension weights (50% density, 25% register, 25% movement)
        ; These weights can be adjusted based on compositional priorities
        iWeightedDeviation = (iAvgDensityDev * 0.5) + 
                             (iAvgRegisterDev * 0.25) + 
                             (iAvgMovementDev * 0.25)
        
        ; Convert deviation to quality score (0.0-1.0)
        ; Dividing by 2 assumes max deviation per dimension is 2
        ; (difference between extreme states 0 and 2)
        iQuality = 1.0 - limit(iWeightedDeviation / 2, 0, 1)
    endif
    
    ; Debug output if needed
    if (gi_debug >= 2) then
        prints "Transition Quality Assessment: %.2f (from %d samples)\n", 
               iQuality, iSamples
        if (iSamples > 0) then
            prints "  Avg Deviations - Density: %.2f, Register: %.2f, Movement: %.2f\n",
                   iAvgDensityDev, iAvgRegisterDev, iAvgMovementDev
        endif
    endif
    
    xout iQuality
endop

; -----------------------------------------------------------------------
; FEEDBACK-BASED ADAPTATION MECHANISM
; -----------------------------------------------------------------------
opcode adaptTransitionParameters, 0, i
    iQualityScore xin
    
    ; Adjust transition characteristics based on quality score
    if (iQualityScore < 0.5) then
        ; Poor transition quality - adjust for future transitions
        
        ; Increase graduality for smoother transitions
        gi_tc_transition_mode = limit(gi_tc_transition_mode + 0.1, 0, 1)
        
        ; Decrease randomness for more predictable results
        gi_tc_transition_randomness = limit(gi_tc_transition_randomness - 0.05, 0.1, 0.5)
        
        ; Increase minimum stable time to avoid too frequent transitions
        gi_tc_min_stable_time = limit(gi_tc_min_stable_time + 2, 10, 30)
        
        if (gi_debug >= 1) then
            prints "TransitionController: Adapting parameters due to low quality (%.2f)\n", iQualityScore
            prints "  New mode: %.2f, randomness: %.2f, min stable time: %.1f\n", 
                   gi_tc_transition_mode, gi_tc_transition_randomness, gi_tc_min_stable_time
        endif
    elseif (iQualityScore > 0.8) then
        ; Very good transition quality - can be more adventurous
        
        ; Introduce more variety in transition mode
        iRandomAdjust random -0.1, 0.1
        gi_tc_transition_mode = limit(gi_tc_transition_mode + iRandomAdjust, 0.3, 0.9)
        
        ; Allow more randomness for interesting results
        gi_tc_transition_randomness = limit(gi_tc_transition_randomness + 0.03, 0.1, 0.5)
        
        if (gi_debug >= 2) then
            prints "TransitionController: Encouraging variety due to high quality (%.2f)\n", iQualityScore
        endif
    endif
    
    ; Reset quality assessment tables for next transition
    iIdx = 0
    while (iIdx < 100) do
        tabw_i 0, iIdx, gi_tc_expected_state_density
        tabw_i 0, iIdx, gi_tc_actual_state_density
        iIdx += 1
    od
endop
