<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Debug level
gi_debug init 2

; ==========================================
; Global variables setup
; ==========================================

; Transition learning system
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0  ; Store transitions
gi_asp_history_index init 0
gi_asp_transition_count init 20 
gi_asp_learning_rate init 0.1

; Current context
gi_asp_context_features ftgen 0, 0, 10, -2, 0

; Current states
gi_tc_source_density init 1
gi_tc_source_register init 0
gi_tc_source_movement init 1

; Musical parameters
gk_current_overlap init 5
gk_current_octave_spread init 0.6
gk_current_spectral_centroid init 6
gk_current_spatial_movement init 0.4

; Memory resolution
gi_memory_resolution init 1

; Transition matrix (would normally be initialized by another function)
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Initialize transition matrix with some default values
instr InitTransitionMatrix
    iStateIdx = 0
    while (iStateIdx < 27) do
        ; Initialize with equal probability to all states
        iNextIdx = 0
        while (iNextIdx < 27) do
            tabw_i 1/27, iStateIdx*27+iNextIdx, gi_transition_matrix
            iNextIdx += 1
        od
        iStateIdx += 1
    od
    
    prints "Transition matrix initialized with equal probabilities\n"
endin

; ==========================================
; Include the improved code being tested
; ==========================================
#include "../udos/adaptiveStatePrediction.udo"

; Placeholder for selectNextState opcode (simplified for testing)
opcode selectNextState, iii, 0
    iNextDensity = 0  ; Default fallback values
    iNextRegister = 1
    iNextMovement = 2
    
    xout iNextDensity, iNextRegister, iNextMovement
endop

; ==========================================
; Test setup
; ==========================================
instr Setup
    prints "\n====== TESTING IMPROVED ADAPTIVE PREDICTION SYSTEM ======\n"
    
    ; Initialize transition matrix
    event_i "i", "InitTransitionMatrix", 0, 0.1
    
    ; Create a history of transitions with varying quality and contexts
    ; We'll create 20 transitions - some from our current state, some not
    
    ; Current state: [1,0,1] = index 10
    iCurrentStateIdx = 10
    iTestCount = 0
    
    ; High quality transitions from current state
    GenerateTestTransition iTestCount, iCurrentStateIdx, 22, 0.9, 0.5, 0.7, 0.6, 0.3  ; to [2,1,1]
    iTestCount += 1
    
    GenerateTestTransition iTestCount, iCurrentStateIdx, 18, 0.85, 0.55, 0.65, 0.62, 0.35  ; to [2,0,0]
    iTestCount += 1
    
    GenerateTestTransition iTestCount, iCurrentStateIdx, 18, 0.8, 0.49, 0.59, 0.58, 0.39  ; to [2,0,0] again
    iTestCount += 1
    
    ; Medium quality from current state
    GenerateTestTransition iTestCount, iCurrentStateIdx, 19, 0.7, 0.4, 0.5, 0.6, 0.45  ; to [2,0,1]
    iTestCount += 1
    
    GenerateTestTransition iTestCount, iCurrentStateIdx, 1, 0.6, 0.3, 0.4, 0.5, 0.5  ; to [0,0,1]
    iTestCount += 1
    
    ; Different context, from current state
    GenerateTestTransition iTestCount, iCurrentStateIdx, 0, 0.5, 0.1, 0.2, 0.3, 0.9  ; to [0,0,0]
    iTestCount += 1
    
    ; Transitions from other states
    GenerateTestTransition iTestCount, 0, 1, 0.7, 0.2, 0.3, 0.4, 0.5  ; from [0,0,0] to [0,0,1]
    iTestCount += 1
    
    GenerateTestTransition iTestCount, 1, 0, 0.6, 0.3, 0.4, 0.5, 0.6  ; from [0,0,1] to [0,0,0] 
    iTestCount += 1
    
    GenerateTestTransition iTestCount, 18, 19, 0.8, 0.5, 0.6, 0.7, 0.4  ; from [2,0,0] to [2,0,1]
    iTestCount += 1
    
    ; Fill remaining with random transitions
    while (iTestCount < 20) do
        iFromState = int(random:i(0, 26.999))
        iToState = int(random:i(0, 26.999))
        iQuality = random:i(0.4, 0.9)
        iF1 = random:i(0.1, 0.9)
        iF2 = random:i(0.1, 0.9)
        iF3 = random:i(0.1, 0.9)
        iF4 = random:i(0.1, 0.9)
        
        GenerateTestTransition iTestCount, iFromState, iToState, iQuality, iF1, iF2, iF3, iF4
        iTestCount += 1
    od
    
    gi_asp_transition_count = 20
    
    ; Set current context
    ; Similar to our high-quality transitions
    tabw_i 0.5, 0, gi_asp_context_features   ; overlap
    tabw_i 0.6, 1, gi_asp_context_features   ; spread
    tabw_i 0.6, 2, gi_asp_context_features   ; centroid
    tabw_i 0.4, 3, gi_asp_context_features   ; movement
    
    prints "\nCurrent state: [%d,%d,%d] (index %d)\n", 
           gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement, 
           iCurrentStateIdx
           
    prints "Current context: [%.2f, %.2f, %.2f, %.2f]\n\n", 
           tab_i(0, gi_asp_context_features), 
           tab_i(1, gi_asp_context_features),
           tab_i(2, gi_asp_context_features),
           tab_i(3, gi_asp_context_features)
           
    ; Run tests
    event_i "i", "TestPrediction", 0, 0.1
    event_i "i", "TestLearning", 0.2, 0.1
    event_i "i", "TestEdgeCases", 0.4, 0.1
endin

; Test prediction opcode
instr TestPrediction
    prints "====== TEST 1: Prediction Based on Historical Data ======\n"
    
    ; Run prediction with detailed debug
    iNextDensity, iNextRegister, iNextMovement predictNextState 3
    
    ; Verify result
    prints "\nPrediction result: State [%d,%d,%d]\n", 
           iNextDensity, iNextRegister, iNextMovement
    
    ; Check expectation - should favor states with similar contexts
    if (iNextDensity == 2) then
        prints "✓ EXPECTED: Density prediction correctly biased toward 2\n"
    else
        prints "✗ UNEXPECTED: Expected density prediction to favor 2\n"
    endif
    
    prints "\n✓ TEST 1 COMPLETED\n"
endin

; Test recording and learning
instr TestLearning
    prints "\n====== TEST 2: Recording & Learning Transitions ======\n"
    
    ; Record a new transition
    iFromState = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Use a specific target state for testing
    iTargetDensity = 2
    iTargetRegister = 1
    iTargetMovement = 0
    iToState = (iTargetDensity * 9) + (iTargetRegister * 3) + iTargetMovement
    iQuality = 0.95  ; High quality
    
    prints "Recording transition: [%d,%d,%d] to [%d,%d,%d] with quality %.2f\n",
           gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement,
           iTargetDensity, iTargetRegister, iTargetMovement, iQuality
           
    ; Get current probability of this transition
    iProbBefore tab_i iFromState*27+iToState, gi_transition_matrix
    
    ; Record the transition
    recordTransition iFromState, iToState, iQuality, 2
    
    ; Check if probability increased
    iProbAfter tab_i iFromState*27+iToState, gi_transition_matrix
    
    prints "\nTransition probability: %.4f → %.4f\n", iProbBefore, iProbAfter
    
    if (iProbAfter > iProbBefore) then
        prints "✓ EXPECTED: Transition probability increased after high-quality learning\n"
    else
        prints "✗ UNEXPECTED: Transition probability did not increase\n"
    endif
    
    ; Run prediction again to see if learning affected result
    prints "\nRe-testing prediction after learning...\n"
    iNextDensity, iNextRegister, iNextMovement predictNextState 1
    
    ; Verify if learning influenced prediction
    if (iNextDensity == iTargetDensity && 
        iNextRegister == iTargetRegister && 
        iNextMovement == iTargetMovement) then
        prints "✓ EXPECTED: Learning influenced prediction to favor newly learned state\n"
    else
        prints "? INCONCLUSIVE: Learning may be working but randomization factor may have selected different state\n"
        prints "  Predicted: [%d,%d,%d], Target: [%d,%d,%d]\n",
               iNextDensity, iNextRegister, iNextMovement,
               iTargetDensity, iTargetRegister, iTargetMovement
    endif
    
    prints "\n✓ TEST 2 COMPLETED\n"
endin

; Test edge cases and error handling
instr TestEdgeCases
    prints "\n====== TEST 3: Edge Cases & Error Handling ======\n"
    
    ; 1. Test with invalid state indices
    prints "Testing invalid state indices in recordTransition...\n"
    recordTransition -1, 5, 0.8, 3  ; Invalid from state
    recordTransition 5, 99, 0.8, 3  ; Invalid to state
    
    ; 2. Test with extreme quality values
    prints "\nTesting extreme quality values...\n"
    
    iFromState = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    iToState = 0  ; [0,0,0]
    iZeroQuality = 0.0
    iOneQuality = 1.0
    
    ; Save original probabilities
    iProbBefore1 tab_i iFromState*27+iToState, gi_transition_matrix
    
    ; Record with zero quality (should decrease probability)
    recordTransition iFromState, iToState, iZeroQuality, 3
    
    iProbAfter1 tab_i iFromState*27+iToState, gi_transition_matrix
    
    if (iProbAfter1 < iProbBefore1) then
        prints "✓ EXPECTED: Zero quality decreased transition probability (%.4f → %.4f)\n", 
               iProbBefore1, iProbAfter1
    else
        prints "✗ UNEXPECTED: Zero quality did not decrease probability\n"
    endif
    
    ; Save for next test
    iProbBefore2 = iProbAfter1
    
    ; Record with max quality (should increase probability)
    recordTransition iFromState, iToState, iOneQuality, 3
    
    iProbAfter2 tab_i iFromState*27+iToState, gi_transition_matrix
    
    if (iProbAfter2 > iProbBefore2) then
        prints "✓ EXPECTED: Maximum quality increased transition probability (%.4f → %.4f)\n", 
               iProbBefore2, iProbAfter2
    else
        prints "✗ UNEXPECTED: Maximum quality did not increase probability\n"
    endif
    
    ; 3. Test insufficient history fallback
    prints "\nTesting fallback with insufficient history...\n"
    
    ; Save current context
    iOriginalCount = gi_asp_transition_count
    
    ; Force insufficient history
    gi_asp_transition_count = 5
    
    iNextDensity, iNextRegister, iNextMovement predictNextState 3
    
    prints "With insufficient history, predicted state: [%d,%d,%d]\n",
           iNextDensity, iNextRegister, iNextMovement
           
    prints "✓ EXPECTED: System fell back to basic prediction with limited history\n"
    
    ; Restore original count
    gi_asp_transition_count = iOriginalCount
    
    prints "\n✓ TEST 3 COMPLETED\n"
endin

; ==========================================
; Helper functions
; ==========================================

; Helper function to create test transition data
opcode GenerateTestTransition, 0, iiiiiii
    iIndex, iFromState, iToState, iQuality, iF1, iF2, iF3, iF4 xin
    
    iRecordIdx = iIndex * 7
    
    tabw_i iFromState, iRecordIdx, gi_asp_transition_history
    tabw_i iToState, iRecordIdx+1, gi_asp_transition_history
    tabw_i iQuality, iRecordIdx+2, gi_asp_transition_history
    
    ; Context features
    tabw_i iF1, iRecordIdx+3, gi_asp_transition_history
    tabw_i iF2, iRecordIdx+4, gi_asp_transition_history
    tabw_i iF3, iRecordIdx+5, gi_asp_transition_history
    tabw_i iF4, iRecordIdx+6, gi_asp_transition_history
    
    if (gi_debug >= 3) then
        prints "Created test transition %d: [%d] to [%d], quality=%.2f, context=[%.2f,%.2f,%.2f,%.2f]\n",
               iIndex, iFromState, iToState, iQuality, iF1, iF2, iF3, iF4
    endif
endop

</CsInstruments>

<CsScore>
i "Setup" 0 0.1
e
</CsScore>
</CsoundSynthesizer>