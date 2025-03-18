; -----------------------------------------------------------------------
; GLOBAL VARIABLES FOR TRANSITION CONTROLLER
; -----------------------------------------------------------------------
gi_tc_transition_active init 0      ; Flag indicating if transition is active (0=no, 1=yes)
gi_tc_transition_progress init 0    ; Progress of current transition (0.0 to 1.0)
gi_tc_transition_duration init 0    ; Duration of current transition in seconds
gi_tc_transition_start_time init 0  ; Start time of current transition
gi_tc_transition_count init 0       ; Counter for completed transitions

; Source state parameters (starting point)
gi_tc_source_density init 0
gi_tc_source_register init 0
gi_tc_source_movement init 0

; Target state parameters (destination)
gi_tc_target_density init 0
gi_tc_target_register init 0
gi_tc_target_movement init 0

; Current interpolated state parameters
gi_tc_current_density init 0
gi_tc_current_register init 0 
gi_tc_current_movement init 0

; Transition type parameters
gi_tc_transition_mode init 1      ; 0.0=sudden, 1.0=gradual
gi_tc_transition_randomness init 0.2  ; Randomness factor (0.0-1.0)

; Memory of past states for trend analysis and avoiding repetition
gi_tc_past_states ftgen 0, 0, 24, -2, 0  ; Store last 8 states (density, register, movement triplets)
gi_tc_past_states_index init 0           ; Current index in past states buffer

; Transition quality metrics
gi_tc_expected_state_table ftgen 0, 0, 100, -2, 0  ; Expected state values during transition
gi_tc_actual_state_table ftgen 0, 0, 100, -2, 0    ; Actual state values during transition
gi_tc_transition_quality init 1.0                  ; Measure of transition effectiveness (0.0-1.0)

; Behavior scheduling control
gi_tc_next_behavior_time init 0    ; Time to schedule next behavior
gi_tc_min_behavior_interval init 3 ; Minimum time between behaviors in seconds
gi_tc_max_behavior_interval init 10 ; Maximum time between behaviors in seconds

; Transition stability control
gi_tc_stability_threshold init 0.7  ; Threshold for considering a state stable
gi_tc_min_stable_time init 15       ; Minimum time in seconds to stay in a stable state
gi_tc_last_stable_time init 0       ; Last time a stable state was reached

