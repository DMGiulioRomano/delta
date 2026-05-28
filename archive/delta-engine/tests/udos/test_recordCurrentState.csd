<CsoundSynthesizer>
<CsOptions>
; Minimal output options
-o dac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; -----------------------------------------------------------------------
; GLOBAL VARIABLES AND CONSTANTS
; -----------------------------------------------------------------------
; Debug level
gi_debug init 3  ; More verbose for testing

; Constants for dimensioning the system
#define OTTAVE    #10#      ; Number of octaves
#define REGISTRI  #10#      ; Number of registers available

; State classification thresholds
gi_density_thresholds ftgen 0, 0, 4, -2, 0, 10, 30, 1000    ; Sparse, Medium, Dense
gi_register_thresholds ftgen 0, 0, 4, -2, 0, 0.3, 0.7, 1.001 ; Low, Mid, High
gi_movement_thresholds ftgen 0, 0, 4, -2, 0, 0.2, 0.5, 1.001 ; Static, Moderate, Dynamic

; Current state memory tables (populated by Analizzatore in the real system)
gi_state_history_size = 10
gi_state_history_density ftgen 0, 0, gi_state_history_size, -2, 0
gi_state_history_register ftgen 0, 0, gi_state_history_size, -2, 0
gi_state_history_movement ftgen 0, 0, gi_state_history_size, -2, 0
gk_state_history_index init 0

; Transition system state variables
gi_tc_current_density init 0     ; Current state values
gi_tc_current_register init 0
gi_tc_current_movement init 0

gi_tc_past_states ftgen 0, 0, 24, -2, 0  ; Store last 8 states (density, register, movement triplets)
gi_tc_past_states_index init 0

; Current musical state variables (normally populated by Analizzatore)
gi_current_overlap init 1
gi_current_octave_spread init 0.2
gi_current_spectral_centroid init 4
gi_current_spatial_movement init 0.1

; Transition tracking variables
gi_tc_transition_active init 0        ; Flag if transition is active
gi_tc_transition_start_time init 0    ; Start time
gi_tc_transition_duration init 10     ; Duration in seconds
gk_current_time init 0                ; Current global time

; Transition source and target states
gi_tc_source_density init 0
gi_tc_source_register init 0
gi_tc_source_movement init 0
gi_tc_target_density init 2
gi_tc_target_register init 1
gi_tc_target_movement init 2

; Transition state tracking tables (100 points resolution)
gi_tc_expected_state_density ftgen 0, 0, 100, -2, 0   
gi_tc_expected_state_register ftgen 0, 0, 100, -2, 0  
gi_tc_expected_state_movement ftgen 0, 0, 100, -2, 0  

gi_tc_actual_state_density ftgen 0, 0, 100, -2, 0     
gi_tc_actual_state_register ftgen 0, 0, 100, -2, 0    
gi_tc_actual_state_movement ftgen 0, 0, 100, -2, 0    

gi_tc_deviation_density ftgen 0, 0, 100, -2, 0
gi_tc_deviation_register ftgen 0, 0, 100, -2, 0
gi_tc_deviation_movement ftgen 0, 0, 100, -2, 0

; -----------------------------------------------------------------------
; OPCODES FOR TESTING
; -----------------------------------------------------------------------
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
    if gi_current_overlap < tab_i(0, gi_density_thresholds) then
        iDensityState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_overlap >= tab_i(iDensityThresholdLen-1, gi_density_thresholds) then
        iDensityState = iDensityThresholdLen - 2 ; Last valid state index
    else
        ; Determine density state by checking each threshold pair
        iDensityIdx = 0
        while iDensityIdx < iDensityThresholdLen-1 do
            iLowerBound tab_i iDensityIdx, gi_density_thresholds
            iUpperBound tab_i iDensityIdx+1, gi_density_thresholds
            
            if gi_current_overlap >= iLowerBound && gi_current_overlap < iUpperBound then
                iDensityState = iDensityIdx
                igoto density_done
            endif
            
            iDensityIdx += 1
        od
    endif
    density_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gi_current_octave_spread < tab_i(0, gi_register_thresholds) then
        iRegisterState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_octave_spread >= tab_i(iRegisterThresholdLen-1, gi_register_thresholds) then
        iRegisterState = iRegisterThresholdLen - 2 ; Last valid state index
    else
        ; Determine register state by checking each threshold pair
        iRegisterIdx = 0
        while iRegisterIdx < iRegisterThresholdLen-1 do
            iLowerBound tab_i iRegisterIdx, gi_register_thresholds
            iUpperBound tab_i iRegisterIdx+1, gi_register_thresholds
            
            if gi_current_octave_spread >= iLowerBound && gi_current_octave_spread < iUpperBound then
                iRegisterState = iRegisterIdx
                igoto register_done
            endif
            
            iRegisterIdx += 1
        od
    endif
    register_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gi_current_spatial_movement < tab_i(0, gi_movement_thresholds) then
        iMovementState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_spatial_movement >= tab_i(iMovementThresholdLen-1, gi_movement_thresholds) then
        iMovementState = iMovementThresholdLen - 2 ; Last valid state index
    else
        ; Determine movement state by checking each threshold pair
        iMovementIdx = 0
        while iMovementIdx < iMovementThresholdLen-1 do
            iLowerBound tab_i iMovementIdx, gi_movement_thresholds
            iUpperBound tab_i iMovementIdx+1, gi_movement_thresholds
            
            if gi_current_spatial_movement >= iLowerBound && gi_current_spatial_movement < iUpperBound then
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
               gi_current_overlap, gi_current_octave_spread, gi_current_spatial_movement,
               iDensityState, iRegisterState, iMovementState
    endif
    xout iDensityState, iRegisterState, iMovementState
endop

; Corrected version of the recordCurrentState opcode
; Properly handles time calculations and transition state recording
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

; Helper function to initialize expected transition states
opcode initExpectedStates, 0, 0
    ; Fill with expected progression from source to target
    iIdx = 0
    while iIdx < 100 do
        iProgress = iIdx / 99
        
        ; Linear interpolation for simplicity in test
        iExpDensity = gi_tc_source_density + (gi_tc_target_density - gi_tc_source_density) * iProgress
        iExpRegister = gi_tc_source_register + (gi_tc_target_register - gi_tc_source_register) * iProgress
        iExpMovement = gi_tc_source_movement + (gi_tc_target_movement - gi_tc_source_movement) * iProgress
        
        tabw_i iExpDensity, iIdx, gi_tc_expected_state_density
        tabw_i iExpRegister, iIdx, gi_tc_expected_state_register
        tabw_i iExpMovement, iIdx, gi_tc_expected_state_movement
        
        iIdx += 1
    od
endop

; -----------------------------------------------------------------------
; INSTRUMENT DEFINITIONS
; -----------------------------------------------------------------------

; Time keeper
instr TimeKeeper
    ktime times
    gk_current_time = ktime
endin

instr TestTransition
    iTime times
    
    prints "\n=== TESTING TRANSITION STATE RECORDING (FIXED VERSION) ===\n"
    
    ; Setup for transition test - USO I-RATE VARIABLES
    gi_tc_transition_active = 1
    gi_tc_transition_start_time = iTime    ; Usa il tempo attuale
    gi_tc_transition_duration = 10
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    gi_tc_target_density = 2
    gi_tc_target_register = 1
    gi_tc_target_movement = 2
    
    ; Initialize expected states for the transition
    initExpectedStates
    
    prints "Transition active from [%d,%d,%d] to [%d,%d,%d] over %.1f seconds\n",
           gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement,
           gi_tc_target_density, gi_tc_target_register, gi_tc_target_movement,
           gi_tc_transition_duration
    
    ; Invece di manipolare gk_current_time, usa un ritardo nel file .sco
    ; e imposta direttamente i valori dei parametri musicali
    
    ; Per il test a 25%, settiamo dei valori appropriati
    gi_current_overlap = 2
    gi_current_octave_spread = 0.2
    gi_current_spatial_movement = 0.3
    printks "new overlap : %d, new spread: %d, new movement: %d", .1, gi_current_overlap, gi_current_octave_spread, gi_current_spatial_movement
    recordCurrentState   ; Questa chiamata verrà eseguita quando lo strumento viene attivato
    
    turnoff
endin

instr TestTransition75
    ; Test 75% progress - questo strumento sarà attivato più tardi nel file .sco
    gi_current_overlap = 6
    gi_current_octave_spread = 0.6
    gi_current_spatial_movement = 0.6
    
    recordCurrentState
    
    ; Verifica manualmente i risultati
    iIndex = 75
    prints "At 75%% progress (index %d):\n", iIndex
    prints "  Expected states: [%.1f, %.1f, %.1f]\n",
           tab_i(iIndex, gi_tc_expected_state_density),
           tab_i(iIndex, gi_tc_expected_state_register),
           tab_i(iIndex, gi_tc_expected_state_movement)
    prints "  Actual states: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_actual_state_density),
           tab_i(iIndex, gi_tc_actual_state_register),
           tab_i(iIndex, gi_tc_actual_state_movement)
    prints "  Deviations: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_deviation_density),
           tab_i(iIndex, gi_tc_deviation_register),
           tab_i(iIndex, gi_tc_deviation_movement)
    
    ; Reset transition state
    gi_tc_transition_active = 0
    
    turnoff
endin
; Test recordCurrentState in normal mode
instr TestNormal
    iTime times
    
    prints "=== TESTING NORMAL STATE RECORDING (FIXED VERSION) ===\n"
    prints "Initial state values before recording:\n"
    prints "  Density: %d, Register: %d, Movement: %d\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
    
    ; Set some test values
    gi_current_overlap = 5        ; Medium density (state 1)
    gi_current_octave_spread = 0.5 ; Medium register (state 1)
    gi_current_spatial_movement = 0.6 ; Dynamic movement (state 2)
    
    ; Call the recordCurrentState opcode
    recordCurrentState
    
    prints "After recording with values: Overlap=5, Spread=0.5, Movement=0.6\n"
    prints "  Density: %d, Register: %d, Movement: %d\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
    
    ; Test past states tracking
    prints "Past states buffer at index %d contains: [%d, %d, %d]\n",
           gi_tc_past_states_index - 1,
           tab_i((gi_tc_past_states_index - 1) * 3, gi_tc_past_states),
           tab_i((gi_tc_past_states_index - 1) * 3 + 1, gi_tc_past_states),
           tab_i((gi_tc_past_states_index - 1) * 3 + 2, gi_tc_past_states)
    
    ; Change values and test again
    gi_current_overlap = 1        ; Sparse density (state 0)
    gi_current_octave_spread = 0.8 ; High register (state 2)
    gi_current_spatial_movement = 0.1 ; Static movement (state 0)
    
    recordCurrentState
    
    prints "After recording with values: Overlap=1, Spread=0.8, Movement=0.1\n"
    prints "  Density: %d, Register: %d, Movement: %d\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
           
    prints "Past states buffer at index %d contains: [%d, %d, %d]\n",
           gi_tc_past_states_index - 1,
           tab_i((gi_tc_past_states_index - 1) * 3, gi_tc_past_states),
           tab_i((gi_tc_past_states_index - 1) * 3 + 1, gi_tc_past_states),
           tab_i((gi_tc_past_states_index - 1) * 3 + 2, gi_tc_past_states)
    
    turnoff
endin

; Test recordCurrentState during a transition
instr TestTransition
    iTime times
    
    prints "\n=== TESTING TRANSITION STATE RECORDING (FIXED VERSION) ===\n"
    
    ; Setup for transition test
    gi_tc_transition_active = 1
    gi_tc_transition_start_time = iTime
    gi_tc_transition_duration = 10
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    gi_tc_target_density = 2
    gi_tc_target_register = 1
    gi_tc_target_movement = 2
    
    ; Initialize expected states for the transition
    initExpectedStates
    
    prints "Transition active from [%d,%d,%d] to [%d,%d,%d] over %.1f seconds\n",
           gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement,
           gi_tc_target_density, gi_tc_target_register, gi_tc_target_movement,
           gi_tc_transition_duration
    
    ; Testing at 25% progress
    gk_current_time = iTime + (gi_tc_transition_duration * 0.25)
    
    ; Set values that slightly deviate from expected at 25%
    gi_current_overlap = 2        ; Should be between states 0 and 1
    gi_current_octave_spread = 0.2 ; Should be in state 0
    gi_current_spatial_movement = 0.3 ; Should be in state 1
    
    recordCurrentState
    
    iProgress = 0.25
    iIndex = int(iProgress * 100)
    
    prints "At 25%% progress (index %d):\n", iIndex
    prints "  Expected states: [%.1f, %.1f, %.1f]\n",
           tab_i(iIndex, gi_tc_expected_state_density),
           tab_i(iIndex, gi_tc_expected_state_register),
           tab_i(iIndex, gi_tc_expected_state_movement)
    prints "  Actual states: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_actual_state_density),
           tab_i(iIndex, gi_tc_actual_state_register),
           tab_i(iIndex, gi_tc_actual_state_movement)
    prints "  Deviations: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_deviation_density),
           tab_i(iIndex, gi_tc_deviation_register),
           tab_i(iIndex, gi_tc_deviation_movement)
    
    ; Testing at 75% progress
    gk_current_time = iTime + (gi_tc_transition_duration * 0.75)
    
    ; Set values for 75% that are closer to expected
    gi_current_overlap = 6        ; Should be state 1, close to expected
    gi_current_octave_spread = 0.6 ; Should be state 1, exactly as expected
    gi_current_spatial_movement = 0.6 ; Should be state 2, close to expected
    
    recordCurrentState
    
    iProgress = 0.75
    iIndex = int(iProgress * 100)
    
    prints "At 75%% progress (index %d):\n", iIndex
    prints "  Expected states: [%.1f, %.1f, %.1f]\n",
           tab_i(iIndex, gi_tc_expected_state_density),
           tab_i(iIndex, gi_tc_expected_state_register),
           tab_i(iIndex, gi_tc_expected_state_movement)
    prints "  Actual states: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_actual_state_density),
           tab_i(iIndex, gi_tc_actual_state_register),
           tab_i(iIndex, gi_tc_actual_state_movement)
    prints "  Deviations: [%d, %d, %d]\n",
           tab_i(iIndex, gi_tc_deviation_density),
           tab_i(iIndex, gi_tc_deviation_register),
           tab_i(iIndex, gi_tc_deviation_movement)
    
    ; Reset transition state
    gi_tc_transition_active = 0
    
    turnoff
endin

; Test the edge case of buffer wrap-around
instr TestBufferWrap
    prints "\n=== TESTING BUFFER WRAP-AROUND (FIXED VERSION) ===\n"
    
    ; Set initial index near the end of buffer
    gi_tc_past_states_index = 7
    
    ; Check initial index
    prints "Initial past states index: %d\n", gi_tc_past_states_index
    
    ; Set test values
    gi_current_overlap = 3        ; State 1
    gi_current_octave_spread = 0.4 ; State 1
    gi_current_spatial_movement = 0.3 ; State 1
    
    ; Record state - should write at index 7
    recordCurrentState
    
    ; Check current index - should be 0 after wrap-around
    prints "After first recording, index = %d\n", gi_tc_past_states_index
    prints "Values at index 7: [%d, %d, %d]\n",
           tab_i(7*3, gi_tc_past_states),
           tab_i(7*3+1, gi_tc_past_states),
           tab_i(7*3+2, gi_tc_past_states)
    
    ; Record again with different values - should write at index 0
    gi_current_overlap = 8        ; State 2
    gi_current_octave_spread = 0.8 ; State 2
    gi_current_spatial_movement = 0.6 ; State 2
    
    recordCurrentState
    
    ; Check that wrap-around occurred correctly
    prints "After second recording, index = %d\n", gi_tc_past_states_index
    prints "Values at index 0: [%d, %d, %d]\n",
           tab_i(0*3, gi_tc_past_states),
           tab_i(0*3+1, gi_tc_past_states),
           tab_i(0*3+2, gi_tc_past_states)
    
    turnoff
endin

; Test extreme values that should be handled properly now
instr TestExtremeValues
    prints "\n=== TESTING EXTREME VALUES (FIXED VERSION) ===\n"
    
    ; Reset state tracking
    gi_tc_current_density = 0
    gi_tc_current_register = 0
    gi_tc_current_movement = 0
    
    ; Test extremely high values
    gi_current_overlap = 2000      ; Should map to highest density state (2)
    gi_current_octave_spread = 5.0 ; Should map to highest register state (2)
    gi_current_spatial_movement = 10.0 ; Should map to highest movement state (2)
    
    recordCurrentState
    
    prints "After recording with extreme high values:\n"
    prints "  Overlap=2000, Spread=5.0, Movement=10.0\n"
    prints "  States: [%d, %d, %d]\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
    
    ; Test negative values
    gi_current_overlap = -10       ; Should map to lowest density state (0)
    gi_current_octave_spread = -2.0 ; Should map to lowest register state (0)
    gi_current_spatial_movement = -1.0 ; Should map to lowest movement state (0)
    
    recordCurrentState
    
    prints "After recording with negative values:\n"
    prints "  Overlap=-10, Spread=-2.0, Movement=-1.0\n"
    prints "  States: [%d, %d, %d]\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Keep the time keeper running throughout the test
i "TimeKeeper" 0 10

; Run the normal state test at 0.1 seconds
i "TestNormal" 0.1 0.1

; Run the transition test - start at 1 second
i "TestTransition" 1 0.1

; Run the 75% test after appropriate delay (7.5 seconds after transition start)
i "TestTransition75" 8.5 0.1  ; 1 + 7.5 = 8.5

; Run the buffer wrap test at 9.5 seconds
i "TestBufferWrap" 9.5 0.1

; Run the extreme values test at 9.8 seconds
i "TestExtremeValues" 9.8 0.1

; End the test after 10 seconds
e 10
</CsScore>
</CsoundSynthesizer>