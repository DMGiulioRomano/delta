<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, debug mode
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Define debug level
gi_debug init 1

; Define threshold tables directly to make the test self-contained
gi_density_thresholds ftgen 0, 0, 4, -2, 0, 3, 7, 1000    ; Sparse, Medium, Dense
gi_register_thresholds ftgen 0, 0, 4, -2, 0, 0.3, 0.7, 1.001 ; Low, Mid, High
gi_movement_thresholds ftgen 0, 0, 4, -2, 0, 0.2, 0.5, 1.001 ; Static, Moderate, Dynamic

#include "../udos/determineState.udo"

; Part 1: Specific test cases with expected outcomes
instr TestSpecificCases
    prints "\n=== PART 1: TESTING SPECIFIC CASES ===\n\n"
    
    ; Array of test cases for more concise code
    iNumTests = 7
    iDensityValues[] fillarray 2, 4, 10, 3, 0, 999, 5
    iRegisterValues[] fillarray 0.2, 0.5, 0.9, 0.3, 0, 1, 0.4
    iMovementValues[] fillarray 0.1, 0.3, 0.7, 0.2, 0, 1, 0.3
    
    ; Expected results for each test
    iExpectedDensity[] fillarray 0, 1, 2, 1, 0, 2, 1
    iExpectedRegister[] fillarray 0, 1, 2, 1, 0, 2, 1
    iExpectedMovement[] fillarray 0, 1, 2, 1, 0, 2, 1
    
    ; Test case descriptions
    STestDescriptions[] init 7
    STestDescriptions[0] = "Standard case - all parameters low (state 0)" 
    STestDescriptions[1] = "Standard case - all parameters medium (state 1)"
    STestDescriptions[2] = "Standard case - all parameters high (state 2)"
    STestDescriptions[3] = "Edge case - exactly at threshold values"
    STestDescriptions[4] = "Edge case - minimum values"
    STestDescriptions[5] = "Edge case - maximum values"
    STestDescriptions[6] = "Custom values - mid-range with variations"

    ; Run each test case
    iTestIdx = 0
    while iTestIdx < iNumTests do
        iDensity = iDensityValues[iTestIdx]
        iRegister = iRegisterValues[iTestIdx]
        iMovement = iMovementValues[iTestIdx]
        
        ; Expected results
        iExpDensity = iExpectedDensity[iTestIdx]
        iExpRegister = iExpectedRegister[iTestIdx]
        iExpMovement = iExpectedMovement[iTestIdx]
        
        ; Call the function to test
        iDensityState, iRegisterState, iMovementState determineCurrentState iDensity, iRegister, iMovement
        
        ; Print test header
        prints "\n== TEST CASE %d: %s ==\n", iTestIdx+1, STestDescriptions[iTestIdx]
        prints "Input: Density=%.2f, Register=%.2f, Movement=%.2f\n", 
               iDensity, iRegister, iMovement
        
        ; Check if results match expectations
        iTestPassed = 1
        if iDensityState != iExpDensity then
            prints "* DENSITY TEST FAILED: Got %d, Expected %d\n", iDensityState, iExpDensity
            iTestPassed = 0
        endif
        
        if iRegisterState != iExpRegister then
            prints "* REGISTER TEST FAILED: Got %d, Expected %d\n", iRegisterState, iExpRegister
            iTestPassed = 0
        endif
        
        if iMovementState != iExpMovement then
            prints "* MOVEMENT TEST FAILED: Got %d, Expected %d\n", iMovementState, iExpMovement
            iTestPassed = 0
        endif
        
        if iTestPassed == 1 then
            prints "RESULT: Density=%d, Register=%d, Movement=%d\n", 
                   iDensityState, iRegisterState, iMovementState
            prints "TEST PASSED!\n"
        else
            prints "Expected: Density=%d, Register=%d, Movement=%d\n", 
                   iExpDensity, iExpRegister, iExpMovement
            prints "TEST FAILED!\n"
        endif
        
        iTestIdx += 1
    od
    
    turnoff
endin

; Part 2: Visualize mapping across parameter ranges
instr VisualizeParameterMapping
    prints "\n=== PART 2: PARAMETER MAPPING VISUALIZATION ===\n\n"
    
    prints "THRESHOLD VALUES:\n"
    prints "----------------\n"
    
    ; Display density thresholds
    prints "Density thresholds: "
    iIdx = 0
    while iIdx < ftlen(gi_density_thresholds) do
        iVal tab_i iIdx, gi_density_thresholds
        prints "%.2f ", iVal
        iIdx += 1
    od
    prints "\n"
    
    ; Display register thresholds
    prints "Register thresholds: "
    iIdx = 0
    while iIdx < ftlen(gi_register_thresholds) do
        iVal tab_i iIdx, gi_register_thresholds
        prints "%.2f ", iVal
        iIdx += 1
    od
    prints "\n"
    
    ; Display movement thresholds
    prints "Movement thresholds: "
    iIdx = 0
    while iIdx < ftlen(gi_movement_thresholds) do
        iVal tab_i iIdx, gi_movement_thresholds
        prints "%.2f ", iVal
        iIdx += 1
    od
    prints "\n\n"
    
    ; Parameter mapping visualization table
    prints "PARAMETER MAPPING TABLE:\n"
    prints "----------------------\n"
    prints "Parameter Values | Resulting States\n"
    prints "Density | Register | Movement | Density | Register | Movement\n"
    prints "-----------------------------------------------------------\n"
    
    ; Test across ranges with more steps for better visualization
    iDensityValues[] fillarray 0, 1, 2, 3, 4, 6, 7, 8, 12, 20
    iRegisterValues[] fillarray 0.0, 0.1, 0.25, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9, 1.0
    iMovementValues[] fillarray 0.0, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1.0
    
    ; Show mapping for a selection of values (10 rows)
    iRow = 0
    while iRow < 10 do
        iDensity = iDensityValues[iRow]
        iRegister = iRegisterValues[iRow]
        iMovement = iMovementValues[iRow]
        
        ; Call the function
        iDensityState, iRegisterState, iMovementState determineCurrentState iDensity, iRegister, iMovement
        
        ; Print the mapping row
        prints "  %3.1f  |   %4.2f   |   %4.2f   |    %d    |    %d     |    %d\n",
               iDensity, iRegister, iMovement, 
               iDensityState, iRegisterState, iMovementState
        
        iRow += 1
    od
    
    turnoff
endin

; Part 3: Test boundary values around thresholds
instr TestBoundaryValues
    prints "\n=== PART 3: BOUNDARY VALUE TESTING ===\n\n"
    
    ; Test just below, at, and just above each threshold
    prints "DENSITY BOUNDARY TESTS:\n"
    prints "---------------------\n"
    prints "Value | State\n"
    prints "------------\n"
    
    ; Density threshold tests
    iTestVals[] fillarray 0, 2.9, 3, 3.1, 6.9, 7, 7.1, 999
    iTestIdx = 0
    while iTestIdx < lenarray(iTestVals) do
        iDensity = iTestVals[iTestIdx]
        iDensityState, iRegisterState, iMovementState determineCurrentState iDensity, 0.5, 0.5
        prints " %4.1f |   %d\n", iDensity, iDensityState
        iTestIdx += 1
    od
    
    prints "\nREGISTER BOUNDARY TESTS:\n"
    prints "-----------------------\n"
    prints "Value | State\n"
    prints "------------\n"
    
    ; Register threshold tests
    iTestVals[] fillarray 0, 0.29, 0.3, 0.31, 0.69, 0.7, 0.71, 1.0
    iTestIdx = 0
    while iTestIdx < lenarray(iTestVals) do
        iRegister = iTestVals[iTestIdx]
        iDensityState, iRegisterState, iMovementState determineCurrentState 4, iRegister, 0.5
        prints " %4.2f |   %d\n", iRegister, iRegisterState
        iTestIdx += 1
    od
    
    prints "\nMOVEMENT BOUNDARY TESTS:\n"
    prints "-----------------------\n"
    prints "Value | State\n"
    prints "------------\n"
    
    ; Movement threshold tests
    iTestVals[] fillarray 0, 0.19, 0.2, 0.21, 0.49, 0.5, 0.51, 1.0
    iTestIdx = 0
    while iTestIdx < lenarray(iTestVals) do
        iMovement = iTestVals[iTestIdx]
        iDensityState, iRegisterState, iMovementState determineCurrentState 4, 0.5, iMovement
        prints " %4.2f |   %d\n", iMovement, iMovementState
        iTestIdx += 1
    od
    
    turnoff
endin
</CsInstruments>
<CsScore>
; Run all three test components in sequence
i "TestSpecificCases" 0 0.1
i "VisualizeParameterMapping" 0.2 0.1
i "TestBoundaryValues" 0.4 0.1
e
</CsScore>
</CsoundSynthesizer>