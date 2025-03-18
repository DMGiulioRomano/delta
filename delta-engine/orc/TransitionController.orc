; =============================================================================
; TransitionController.orc
; Orchestrates the evolution of musical states and transitions in Delta-Engine
; =============================================================================

; -----------------------------------------------------------------------
; TRANSITION CONTROLLER INSTRUMENT
; -----------------------------------------------------------------------
instr TransitionController
    i_tc_debug = 2   ; Debug level specific for transition controller

    ; Check if this is the initialization of the instrument
    if (gi_tc_transition_active == 0) then
        ; Initialize controller state on first run
        initTransitionMatrix   ; Initialize state transition probability matrix
        
        ; Initialize adaptive learning system
        if (gi_debug >= 1) then
            prints "Initializing adaptive learning system for transitions\n"
        endif
        
        ; Record the initial musical state
        recordCurrentState
        
        ; Start in a stable state - no active transition initially
        gi_tc_transition_active = 0
        gi_tc_next_behavior_time = 0
        
        if (i_tc_debug >= 1) then
            prints "TransitionController initialized with state: %d %d %d\n", 
                   gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
        endif
        
        ; Schedule first decision point
        i_first_decision_time = 10  ; First decision after 10 seconds
        event_i "i", "TransitionDecider", i_first_decision_time, 0.1
    endif
    
    ; This instrument just initializes the system then terminates
    ; The actual work is done by TransitionDecider and BehaviorGenerator
    turnoff
endin

; -----------------------------------------------------------------------
; TRANSITION DECIDER - Decides when and how to transition
; -----------------------------------------------------------------------
instr TransitionDecider
    i_tc_debug = gi_debug
    i_current_time times
    
    ; Record the current state from the analyzer
    recordCurrentState
    
    ; Decide whether to initiate a transition based on:
    ;  1. Time in current state
    ;  2. Compositional development/progress
    ;  3. Stability of current state
    i_time_since_last_transition = i_current_time - gi_tc_last_stable_time
    i_transition_probability = 0.3  ; Base probability
    
    ; Increase probability based on time spent in current state
    if (i_time_since_last_transition > gi_tc_min_stable_time) then
        ; Gradually increase probability after minimum stable time
        i_time_factor = (i_time_since_last_transition - gi_tc_min_stable_time) / 30
        i_time_factor = limit(i_time_factor, 0, 0.5)
        i_transition_probability += i_time_factor
    endif
    
    ; Check if we're already in a transition
    if (gi_tc_transition_active == 1) then
        ; If in transition, just schedule the next check
        i_next_check_time = 2  ; Check again in 2 seconds
        event_i "i", "TransitionDecider", i_next_check_time, 0.1
        turnoff
    endif
    
    ; Make decision to transition or not
    i_random_val random 0, 1
    if (i_random_val < i_transition_probability) then
        ; Decision: Start a new transition

        initializeTransition
        
        ; Log the decision
        if (i_tc_debug >= 1) then
            prints "TransitionDecider: NEW TRANSITION at time %.1f\n", i_current_time
            prints "  From state [%d,%d,%d] to [%d,%d,%d]\n", 
                   gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement,
                   gi_tc_target_density, gi_tc_target_register, gi_tc_target_movement
            prints "  Duration: %.1f seconds, Mode: %.1f, Randomness: %.1f\n", 
                   gi_tc_transition_duration, gi_tc_transition_mode, gi_tc_transition_randomness
        endif
        
        ; Start generating behaviors for this transition
        event_i "i", "BehaviorGenerator", 0, 0.1
    endif
    
    ; Always schedule the next decision point
    i_next_check_time = random(5, 10)  ; Check again in 5-10 seconds
    event_i "i", "TransitionDecider", i_next_check_time, 0.1
    
    turnoff
endin

; -----------------------------------------------------------------------
; BEHAVIOR GENERATOR - Creates and schedules new behaviors during transitions
; -----------------------------------------------------------------------
instr BehaviorGenerator
    i_tc_debug = gi_debug
    i_current_time times
    
    ; Check if transition is active
    if (gi_tc_transition_active == 0) then
        turnoff
    endif
    print gi_tc_transition_duration
    ; Calculate current transition progress
    i_elapsed_time = i_current_time - gi_tc_transition_start_time
    i_progress = i_elapsed_time / gi_tc_transition_duration
    gi_tc_transition_progress = i_progress
    
    ; If transition is complete, finalize
    if (i_progress >= 1.0) then
        ; Transition complete - update state and reset
        gi_tc_current_density = gi_tc_target_density
        gi_tc_current_register = gi_tc_target_register
        gi_tc_current_movement = gi_tc_target_movement
        
        ; Calculate state indices for recording
        iSourceStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
        iTargetStateIdx = (gi_tc_target_density * 9) + (gi_tc_target_register * 3) + gi_tc_target_movement
        
        ; Assess transition quality
        iTransitionQuality assessTransitionQuality 
        
        ; Record this transition for adaptive learning
        recordTransition iSourceStateIdx, iTargetStateIdx, iTransitionQuality, i(gi_tc_transition_duration), i(gi_tc_transition_mode)
        
        ; Update controller state
        gi_tc_transition_active = 0
        gi_tc_last_stable_time = i_current_time
        
        ; Save transition matrix periodically
        if (gi_tc_transition_count % 5 == 0) then
            iMatrixSaveTime = i_current_time + 0.1
            prints "Scheduling transition matrix save at time %.1f\n", iMatrixSaveTime
            schedule "EnhancedSaveTransitionMatrix", iMatrixSaveTime, 1
        endif
        gi_tc_transition_count += 1
        
        ; Adapt transition parameters based on quality
        adaptTransitionParameters(iTransitionQuality)
        
        if (i_tc_debug >= 1) then
            prints "TransitionController: TRANSITION COMPLETE at time %.1f\n", i_current_time
            prints "  Reached target state [%d,%d,%d] with quality %.2f\n", 
                   gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement,
                   iTransitionQuality
        endif
        
        turnoff
    endif
    
    ; Check if it's time to generate a new behavior
    if (i_current_time >= gi_tc_next_behavior_time) then
        ; Generate interpolated parameters based on transition progress
        print i_progress
        prints "\n\n\n\n\n"
        generateTransitionBehavior i_progress
        
        ; Calculate time for next behavior
        i_behavior_interval interpolateBehaviorTiming i_progress
        gi_tc_next_behavior_time = i_current_time + i_behavior_interval
        
        if (i_tc_debug >= 2) then
            prints "BehaviorGenerator: Generated behavior at time %.1f (progress: %.2f)\n", 
                   i_current_time, i_progress
            prints "  Next behavior scheduled at +%.1f seconds\n", i_behavior_interval
        endif
    endif
    
    ; Schedule self to run again soon
    event_i "i", "BehaviorGenerator", 1, 0.1
endin
