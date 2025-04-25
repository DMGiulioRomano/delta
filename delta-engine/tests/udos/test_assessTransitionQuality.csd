; ============================================================================
; TEST ASSESSTRANSITIONQUALITY OPCODE
; ============================================================================
; Questo CSD testa isolatamente l'opcode assessTransitionQuality in diverse condizioni
; per verificare il suo corretto funzionamento
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

; Tabelle per tracciamento delle deviazioni durante la transizione (100 punti)
gi_tc_deviation_density ftgen 0, 0, 100, -2, 0 
gi_tc_deviation_register ftgen 0, 0, 100, -2, 0
gi_tc_deviation_movement ftgen 0, 0, 100, -2, 0

; -----------------------------------------------------------------------
; ORIGINAL FUNCTION TO TEST - assessTransitionQuality opcode
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
; TEST CASE GENERATOR INSTRUMENT
; -----------------------------------------------------------------------
instr PrepareTest
    p4 = p4  ; Test scenario number
    
    ; Reset all deviation tables
    iZeroIdx = 0
    while (iZeroIdx < 100) do
        tabw_i 0, iZeroIdx, gi_tc_deviation_density
        tabw_i 0, iZeroIdx, gi_tc_deviation_register
        tabw_i 0, iZeroIdx, gi_tc_deviation_movement
        iZeroIdx += 1
    od
    
    prints "\n==========================================================\n"
    prints "PREPARING TEST SCENARIO %d\n", p4
    prints "==========================================================\n"
    
    ; Different test scenarios
    if (p4 == 1) then
        prints "Scenario 1: Perfect transition (no deviation)\n"
        ; Leave all deviations at 0
    
    elseif (p4 == 2) then
        prints "Scenario 2: Terrible transition (maximum deviation)\n"
        ; Set maximum deviation in all dimensions
        iIdx = 0
        while (iIdx < 100) do
            tabw_i 2.0, iIdx, gi_tc_deviation_density  ; Max difference between states
            tabw_i 2.0, iIdx, gi_tc_deviation_register
            tabw_i 2.0, iIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    elseif (p4 == 3) then
        prints "Scenario 3: Average transition (medium deviation)\n"
        ; Set medium deviation values
        iIdx = 0
        while (iIdx < 100) do
            tabw_i 1.0, iIdx, gi_tc_deviation_density
            tabw_i 0.5, iIdx, gi_tc_deviation_register
            tabw_i 0.5, iIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    elseif (p4 == 4) then
        prints "Scenario 4: Good transition (small deviation)\n"
        ; Set small deviation values
        iIdx = 0
        while (iIdx < 100) do
            tabw_i 0.4, iIdx, gi_tc_deviation_density
            tabw_i 0.2, iIdx, gi_tc_deviation_register
            tabw_i 0.3, iIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    elseif (p4 == 5) then
        prints "Scenario 5: Empty data (no samples)\n"
        ; Leave all deviations at 0, but we'll skip sample collection in assessTransitionQuality
    
    elseif (p4 == 6) then
        prints "Scenario 6: Weighted dimension test - only density deviation\n"
        ; Set only density deviation
        iIdx = 0
        while (iIdx < 100) do
            tabw_i 1.0, iIdx, gi_tc_deviation_density
            tabw_i 0.0, iIdx, gi_tc_deviation_register
            tabw_i 0.0, iIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    elseif (p4 == 7) then
        prints "Scenario 7: Progressive quality - worsens over time\n"
        ; Create a transition that gets worse over time
        iIdx = 0
        while (iIdx < 100) do
            iProgress = iIdx / 99  ; 0.0 to 1.0
            tabw_i iProgress * 2, iIdx, gi_tc_deviation_density      ; 0 to 2
            tabw_i iProgress * 1.5, iIdx, gi_tc_deviation_register   ; 0 to 1.5
            tabw_i iProgress * 1, iIdx, gi_tc_deviation_movement     ; 0 to 1
            iIdx += 1
        od
    
    elseif (p4 == 8) then
        prints "Scenario 8: Sparse data points (only 10 samples)\n"
        ; Create only a few data points
        iIdx = 0
        while (iIdx < 10) do
            iPosIdx = iIdx * 10  ; Position 0, 10, 20, ... 90
            tabw_i 1.0, iPosIdx, gi_tc_deviation_density
            tabw_i 0.5, iPosIdx, gi_tc_deviation_register
            tabw_i 0.5, iPosIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    elseif (p4 == 9) then
        prints "Scenario 9: Extreme values test (beyond normal range)\n"
        ; Test with extremely high deviations
        iIdx = 0
        while (iIdx < 100) do
            tabw_i 5.0, iIdx, gi_tc_deviation_density  ; Beyond normal range
            tabw_i 4.0, iIdx, gi_tc_deviation_register
            tabw_i 3.0, iIdx, gi_tc_deviation_movement
            iIdx += 1
        od
    
    endif
    
    ; Schedule the test run
    event_i "i", "RunTest", 0, 0.1, p4
endin


; -----------------------------------------------------------------------
; TEST EXECUTION INSTRUMENT
; -----------------------------------------------------------------------
instr RunTest
    p4 = p4   ; Test scenario number
    
    prints "\nRUNNING TEST SCENARIO %d\n", p4
    
    ; Execute the test
    iQuality assessTransitionQuality
    
    ; Validate and print results
    prints "\nTEST SCENARIO %d RESULT: Quality = %.4f\n", p4, iQuality
    
    ; Expected results for each scenario
    iExpectedQuality = 0
    
    if (p4 == 1) then        ; Perfect
        iExpectedQuality = 1.0
    elseif (p4 == 2) then    ; Terrible
        iExpectedQuality = 0.0
    elseif (p4 == 3) then    ; Average
        iExpectedQuality = 0.625  ; Approximately
    elseif (p4 == 4) then    ; Good
        iExpectedQuality = 0.825  ; (1.0 - ((0.4*0.5 + 0.2*0.25 + 0.3*0.25)/2)) ~ 0.825
    elseif (p4 == 5) then    ; Empty
        iExpectedQuality = 1.0    ; Default perfect score with no samples
    elseif (p4 == 6) then    ; Density only
        iExpectedQuality = 0.75  ; (1.0 - ((1.0*0.5 + 0*0.25 + 0*0.25)/2)) = 0.75
    elseif (p4 == 7) then    ; Progressive
        iExpectedQuality = 0.59  ; Approximation for progressive deviation
    elseif (p4 == 8) then    ; Sparse data
        iExpectedQuality = 0.625  ; Same as scenario 3 but with sparse samples
    elseif (p4 == 9) then    ; Extreme values
        iExpectedQuality = 0.0    ; Should be limited to 0
    endif
    
    ; Check if result is close to expected
    iDiff = abs(iQuality - iExpectedQuality)
    
    if (iDiff < 0.05) then
        prints "  TEST PASSED: Quality %.4f is close to expected %.4f\n", iQuality, iExpectedQuality
    else
        prints "  TEST FAILED: Quality %.4f differs from expected %.4f\n", iQuality, iExpectedQuality
        prints "  Difference: %.4f (greater than threshold 0.05)\n", iDiff
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
    prints "\n==========================================================\n"
    prints "STARTING ASSESSTRANSITIONQUALITY OPCODE TESTS\n"
    prints "==========================================================\n"
    
    ; Start the test sequence with scenario 1
    event_i "i", "PrepareTest", 0, 0.1, 1
endin

</CsInstruments>
<CsScore>
; Run the test suite
i "TestRunner" 0 0.1
f 0 0.2  ; Run for 0.2 seconds - just enough for tests to complete
</CsScore>
</CsoundSynthesizer>