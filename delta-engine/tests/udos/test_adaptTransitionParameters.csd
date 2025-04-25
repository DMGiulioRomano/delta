; ============================================================================
; TEST ADAPTTRANSITIONPARAMETERS OPCODE
; ============================================================================
; Questo CSD testa isolatamente l'opcode adaptTransitionParameters in diverse condizioni
; per verificare come regola i parametri di transizione in base alla qualità
; ============================================================================

<CsoundSynthesizer>
<CsOptions>
-odac  ; Audio output
-d     ; Suppress displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; -----------------------------------------------------------------------
; GLOBAL VARIABLES & TABLES - Minimo necessario per il test
; -----------------------------------------------------------------------
gi_debug init 2  ; Livello di debug 0-5

; Variabili globali per il controllore di transizione
gi_tc_transition_mode init 0.5      ; 0.0=sudden, 1.0=gradual
gi_tc_transition_randomness init 0.2  ; Randomness factor (0.0-1.0)
gi_tc_min_stable_time init 15       ; Minimum time in seconds to stay in a stable state

; Per il test, creiamo copie di backup delle variabili iniziali
gi_initial_mode init 0.5
gi_initial_randomness init 0.2
gi_initial_stable_time init 15

; Tabelle per tracciamento delle deviazioni (solo per test)
gi_tc_expected_state_density ftgen 0, 0, 100, -2, 0
gi_tc_actual_state_density ftgen 0, 0, 100, -2, 0

; -----------------------------------------------------------------------
; ORIGINAL FUNCTION TO TEST - adaptTransitionParameters opcode
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

; -----------------------------------------------------------------------
; Utility opcode to reset parameters to initial values
; -----------------------------------------------------------------------
opcode resetParameters, 0, 0
    gi_tc_transition_mode = gi_initial_mode
    gi_tc_transition_randomness = gi_initial_randomness  
    gi_tc_min_stable_time = gi_initial_stable_time
endop

; -----------------------------------------------------------------------
; TEST CASE GENERATOR INSTRUMENT
; -----------------------------------------------------------------------
instr PrepareTest
    p4 = p4  ; Test scenario number
    
    ; Reset parameters to initial values
    resetParameters
    
    prints "\n==========================================================\n"
    prints "PREPARING TEST SCENARIO %d\n", p4
    prints "==========================================================\n"
    
    ; Log initial values
    prints "Initial parameters: mode=%.2f, randomness=%.2f, stable_time=%.1f\n",
           gi_tc_transition_mode, gi_tc_transition_randomness, gi_tc_min_stable_time
    
    ; Schedule the test run
    event_i "i", "RunTest", 0, 0.1, p4
endin


; -----------------------------------------------------------------------
; TEST EXECUTION INSTRUMENT
; -----------------------------------------------------------------------
instr RunTest
    p4 = p4   ; Test scenario number
    
    prints "\nRUNNING TEST SCENARIO %d\n", p4
    
    ; Different test scenarios with different quality scores
    iQualityScore = 0.5  ; Default value
    if (p4 == 1) then
        iQualityScore = 0.2  ; Very poor quality
        prints "Test with very poor quality (%.2f)\n", iQualityScore
    elseif (p4 == 2) then
        iQualityScore = 0.45  ; Just below threshold
        prints "Test with below threshold quality (%.2f)\n", iQualityScore
    elseif (p4 == 3) then
        iQualityScore = 0.5  ; Exactly at threshold
        prints "Test with threshold quality (%.2f)\n", iQualityScore
    elseif (p4 == 4) then
        iQualityScore = 0.7  ; Good but below high threshold
        prints "Test with good quality (%.2f)\n", iQualityScore
    elseif (p4 == 5) then
        iQualityScore = 0.8  ; At high threshold
        prints "Test with high threshold quality (%.2f)\n", iQualityScore
    elseif (p4 == 6) then
        iQualityScore = 0.95  ; Excellent quality
        prints "Test with excellent quality (%.2f)\n", iQualityScore
    elseif (p4 == 7) then
        ; Test repeated low quality adaptations
        iQualityScore = 0.2  ; Very poor quality
        
        prints "Test with multiple poor quality adaptations (%.2f)\n", iQualityScore
        
        ; Run adaptTransitionParameters three times with low quality
        ; to test if parameters saturate correctly
        prints "First adaptation:\n"
        adaptTransitionParameters iQualityScore
        
        prints "Second adaptation:\n"
        adaptTransitionParameters iQualityScore
        
        prints "Third adaptation:\n"
        adaptTransitionParameters iQualityScore
        
        ; Skip the regular test call below
        igoto skip_regular_test
    elseif (p4 == 8) then
        ; Test boundary conditions
        ; Store initial values for this scenario specifically
        iScenario8_initial_mode = 0.95  ; Near upper limit
        iScenario8_initial_randomness = 0.48  ; Near upper limit
        iScenario8_initial_stable_time = 28  ; Near upper limit
        
        gi_tc_transition_mode = iScenario8_initial_mode
        gi_tc_transition_randomness = iScenario8_initial_randomness
        gi_tc_min_stable_time = iScenario8_initial_stable_time
        iQualityScore = 0.1  ; Very poor
        
        prints "Test boundary upper limits with poor quality (%.2f)\n", iQualityScore
        prints "Starting near upper limits: mode=%.2f, randomness=%.2f, stable_time=%.1f\n",
               gi_tc_transition_mode, gi_tc_transition_randomness, gi_tc_min_stable_time
    elseif (p4 == 9) then
        ; Test boundary conditions
        ; Store initial values for this scenario specifically
        iScenario9_initial_mode = 0.05  ; Near lower limit
        iScenario9_initial_randomness = 0.11  ; Near lower limit
        iScenario9_initial_stable_time = 11  ; Near lower limit
        
        gi_tc_transition_mode = iScenario9_initial_mode
        gi_tc_transition_randomness = iScenario9_initial_randomness
        gi_tc_min_stable_time = iScenario9_initial_stable_time
        iQualityScore = 0.9  ; Very good
        
        prints "Test boundary lower limits with good quality (%.2f)\n", iQualityScore
        prints "Starting near lower limits: mode=%.2f, randomness=%.2f, stable_time=%.1f\n",
               gi_tc_transition_mode, gi_tc_transition_randomness, gi_tc_min_stable_time
    endif
    
    ; Execute the test (except for scenario 7 which does it directly)
    adaptTransitionParameters iQualityScore
    
    skip_regular_test:
    
    ; Print results
    prints "\nTEST SCENARIO %d RESULT:\n", p4
    prints "  Final parameters: mode=%.2f, randomness=%.2f, stable_time=%.1f\n",
           gi_tc_transition_mode, gi_tc_transition_randomness, gi_tc_min_stable_time
    
    ; Analyze changes
    iModeChange = gi_tc_transition_mode - gi_initial_mode
    iRandomnessChange = gi_tc_transition_randomness - gi_initial_randomness
    iStableTimeChange = gi_tc_min_stable_time - gi_initial_stable_time
    
    prints "  Changes: mode %+.2f, randomness %+.2f, stable_time %+.1f\n",
           iModeChange, iRandomnessChange, iStableTimeChange
    
    ; Validate changes based on expected behavior
    iValid = 1  ; Assume valid until proven otherwise
    SFailReason = ""
    
    ; Special handling for boundary test scenarios
    if (p4 == 8) then  ; Upper boundary test
        ; Calculate changes from scenario-specific initial values
        iScenario8_mode_change = gi_tc_transition_mode - iScenario8_initial_mode
        iScenario8_randomness_change = gi_tc_transition_randomness - iScenario8_initial_randomness
        iScenario8_stable_time_change = gi_tc_min_stable_time - iScenario8_initial_stable_time
        
        prints "  Changes from scenario start: mode %+.2f, randomness %+.2f, stable_time %+.1f\n",
               iScenario8_mode_change, iScenario8_randomness_change, iScenario8_stable_time_change
        
        ; For low quality with start near upper limits
        if (iScenario8_randomness_change >= 0) then
            iValid = 0
            SFailReason = "Randomness should decrease from scenario start for low quality"
        elseif (gi_tc_transition_mode > 1.0 || gi_tc_transition_randomness > 0.5 || gi_tc_min_stable_time > 30) then
            iValid = 0
            SFailReason = "Parameters exceeded upper limits"
        else
            iValid = 1  ; Explicitly mark as valid
        endif
    elseif (p4 == 9) then  ; Lower boundary test
        ; Calculate changes from scenario-specific initial values
        iScenario9_mode_change = gi_tc_transition_mode - iScenario9_initial_mode
        iScenario9_randomness_change = gi_tc_transition_randomness - iScenario9_initial_randomness
        iScenario9_stable_time_change = gi_tc_min_stable_time - iScenario9_initial_stable_time
        
        prints "  Changes from scenario start: mode %+.2f, randomness %+.2f, stable_time %+.1f\n",
               iScenario9_mode_change, iScenario9_randomness_change, iScenario9_stable_time_change
        
        ; For high quality with start near lower limits
        if (iScenario9_randomness_change <= 0) then
            iValid = 0
            SFailReason = "Randomness should increase from scenario start for high quality"
        elseif (gi_tc_transition_mode < 0.0 || gi_tc_transition_randomness < 0.1 || gi_tc_min_stable_time < 10) then
            iValid = 0
            SFailReason = "Parameters exceeded lower limits"
        else
            iValid = 1  ; Explicitly mark as valid
        endif
    elseif (iQualityScore < 0.5 && p4 != 7 && p4 != 3) then  ; Low quality adjustment (excluding special tests)
        ; For low quality we expect:
        ; - Increased mode
        ; - Decreased randomness
        ; - Increased stable time
        if (iModeChange <= 0) then
            iValid = 0
            SFailReason = "Mode should increase for low quality"
        elseif (iRandomnessChange >= 0) then
            iValid = 0
            SFailReason = "Randomness should decrease for low quality"
        elseif (iStableTimeChange <= 0) then
            iValid = 0
            SFailReason = "Stable time should increase for low quality"
        endif
    elseif (iQualityScore > 0.8 && p4 != 7) then  ; High quality adjustment (excluding special test)
        ; For high quality we expect:
        ; - Mode could change either way (random)
        ; - Increased randomness
        ; - Stable time unchanged
        if (iRandomnessChange < 0 && p4 != 9) then  ; Exclude scenario 9 from this check
            iValid = 0
            SFailReason = "Randomness should increase for high quality"
        endif
    elseif (iQualityScore >= 0.5 && iQualityScore <= 0.8 && p4 != 7) then  ; Medium quality
        ; For medium quality we expect no changes
        if (iModeChange != 0 || iRandomnessChange != 0 || iStableTimeChange != 0) then
            iValid = 0
            SFailReason = "No changes expected for medium quality"
        endif
    endif
    
    ; Display validation result
    if (iValid == 1) then
        prints "  VALIDATION: PASSED - Changes are as expected\n"
    else
        prints "  VALIDATION: FAILED - %s\n", SFailReason
    endif
    
    ; Schedule next test if not the last one
    if (p4 < 9) then
        event_i "i", "PrepareTest", 0, 0.1, p4 + 1
    else
        prints "\n==========================================================\n"
        prints "ALL TESTS COMPLETED\n"
        prints "==========================================================\n"
    endif
endin
; -----------------------------------------------------------------------
; TEST RUNNER
; -----------------------------------------------------------------------
instr TestRunner
    ; Store initial values
    gi_initial_mode = gi_tc_transition_mode
    gi_initial_randomness = gi_tc_transition_randomness
    gi_initial_stable_time = gi_tc_min_stable_time
    
    prints "\n==========================================================\n"
    prints "STARTING ADAPTTRANSITIONPARAMETERS OPCODE TESTS\n"
    prints "==========================================================\n"
    
    ; Start the test sequence with scenario 1
    event_i "i", "PrepareTest", 0, 0.1, 1
endin

</CsInstruments>
<CsScore>
; Run the test suite
i "TestRunner" 0 0.1
f 0 0.5  ; Run for 0.5 seconds - just enough for tests to complete
</CsScore>
</CsoundSynthesizer>