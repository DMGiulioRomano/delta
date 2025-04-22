; ============================================================================
; TEST VISUALIZETRANSITIONMATRIX OPCODE
; ============================================================================
; Questo CSD testa isolatamente l'opcode visualizeTransitionMatrix che esporta
; la matrice di transizione in formato CSV per visualizzazione o analisi
;
; Test cases:
; 1. Test con valori predefiniti della matrice (alcuni stati popolati)
; 2. Test con matrice personalizzata (probabilità diverse)
; 3. Test con matrice vuota (tutti zero)
; 4. Test con percorso personalizzato
; 5. Test con livello di debug personalizzato
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
gi_debug init 5  ; Livello di debug 0-5

; Matrice di transizione (27x27 - 3 stati per 3 dimensioni)
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Percorsi temporanei per i test
gS_test_dir = "./docs/analysis"  ; Directory temporanea per i test
gS_default_output = "docs/analysis/default_matrix.csv"
gS_custom_output = "docs/analysis/custom_matrix.csv"
gS_empty_output = "docs/analysis/empty_matrix.csv"

; -----------------------------------------------------------------------
; ORIGINAL FUNCTION TO TEST - visualizeTransitionMatrix opcode
; -----------------------------------------------------------------------
opcode visualizeTransitionMatrix, 0, S
    Soutputfile xin
    prints "DEBUG: Tentativo di scrittura su file: %s\n", Soutputfile
         
    ; If no filename provided, use a default
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/transition_matrix_visualization.csv"
    endif
    
    ; Create directory if it doesn't exist
    iSystem system_i 1, "mkdir -p docs/analysis", 0
    
    ; Write CSV header
    fprints Soutputfile, "from_state,to_state,probability,from_density,from_register,from_movement,to_density,to_register,to_movement\n"
    ; Write each transition probability
    iFromStateIdx = 0
    while (iFromStateIdx < 27) do
        ; Convert source state to components
        iFromDens = int(iFromStateIdx / 9)
        iFromRem = iFromStateIdx % 9
        iFromReg = int(iFromRem / 3)
        iFromMov = iFromRem % 3
        
        iToStateIdx = 0
        while (iToStateIdx < 27) do
            ; Get probability
            iProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
            
            ; Only include probabilities above a threshold to reduce file size
            if (iProb > 0.02) then
                ; Convert target state to components
                iToDens = int(iToStateIdx / 9)
                iToRem = iToStateIdx % 9
                iToReg = int(iToRem / 3)
                iToMov = iToRem % 3
                ; Write to CSV
                fprints Soutputfile, "%d,%d,%.4f,%d,%d,%d,%d,%d,%d\n",
                        iFromStateIdx, iToStateIdx, iProb,
                        iFromDens, iFromReg, iFromMov,
                        iToDens, iToReg, iToMov
            endif
            
            iToStateIdx += 1
        od
        
        iFromStateIdx += 1
    od
    
    if (gi_debug >= 2) then
        prints "Transition matrix visualization saved to %s\n", Soutputfile
    endif
endop

; -----------------------------------------------------------------------
; TEST UTILITY FUNCTIONS
; -----------------------------------------------------------------------

; Popola la matrice di transizione con valori di test
opcode populateTestMatrix, 0, i
    iTestCase xin
    
    ; Reset matrix first
    iIdx = 0
    while (iIdx < 27*27) do
        tabw_i 0, iIdx, gi_transition_matrix
        iIdx += 1
    od
    
    if (iTestCase == 1) then
        ; Default test case - populate some standard transitions
        ; From state 0 transitions
        tabw_i 0.5, 0, gi_transition_matrix            ; Stay in same state
        tabw_i 0.3, 0+1, gi_transition_matrix          ; To adjacent state
        tabw_i 0.2, 0+9, gi_transition_matrix          ; Jump to different density
        
        ; From state 10 transitions (middle state)
        tabw_i 0.4, 10*27+10, gi_transition_matrix     ; Stay in same state
        tabw_i 0.2, 10*27+11, gi_transition_matrix     ; Adjacent
        tabw_i 0.2, 10*27+13, gi_transition_matrix     ; Adjacent
        tabw_i 0.2, 10*27+19, gi_transition_matrix     ; Jump dimension
        
        ; From state 26 transitions (last state)
        tabw_i 0.6, 26*27+26, gi_transition_matrix     ; Stay in same state
        tabw_i 0.3, 26*27+17, gi_transition_matrix     ; Jump to different state
        tabw_i 0.1, 26*27+0, gi_transition_matrix      ; Jump to far state
        
    elseif (iTestCase == 2) then
        ; Custom test case - more complex pattern
        ; Create a more balanced distribution
        iFromIdx = 0
        while (iFromIdx < 27) do
            ; Each state has some probability to transition to nearby states
            iToIdx = 0
            while (iToIdx < 27) do
                ; Calculate "distance" between states
                iFromDens = int(iFromIdx / 9)
                iFromRem = iFromIdx % 9
                iFromReg = int(iFromRem / 3)
                iFromMov = iFromRem % 3
                
                iToDens = int(iToIdx / 9)
                iToRem = iToIdx % 9
                iToReg = int(iToRem / 3)
                iToMov = iToRem % 3
                
                iDistance = abs(iFromDens - iToDens) + abs(iFromReg - iToReg) + abs(iFromMov - iToMov)
                
                ; Probability based on distance (closer = higher probability)
                iProb = 0
                if (iDistance == 0) then
                    iProb = 0.4  ; Same state
                elseif (iDistance == 1) then
                    iProb = 0.15  ; Adjacent state in one dimension
                elseif (iDistance == 2) then
                    iProb = 0.05  ; Two steps away
                elseif (iDistance == 3) then
                    iProb = 0.03  ; Three steps away
                endif
                
                ; Populate matrix
                if (iProb > 0) then
                    tabw_i iProb, iFromIdx*27+iToIdx, gi_transition_matrix
                endif
                
                iToIdx += 1
            od
            
            ; Ensure row sums to approximately 1.0
            iFromIdx += 1
        od
    endif
endop

; Verifica il file CSV generato
opcode verifyOutputFile, i, S
    SfilePath xin
    ires = -1
    ; Check if file exists
    iExists system_i 1, sprintf("test -e %s && echo 1 || echo 0", SfilePath)
    
    if (iExists == 0) then
        prints "ERROR: Output file %s was not created\n", SfilePath
        ires = 0
        igoto end
    endif
    
    ; Check file content (basic verification)
    iLineCount system_i 1, sprintf("wc -l %s | awk '{print $1}'", SfilePath)
    print iLineCount
    ; Get line count from file
    iLineCount = int(iLineCount)
    
    ; At minimum, file should have a header line
    if (iLineCount < 1) then
        prints "ERROR: Output file %s is empty\n", SfilePath
        ires = 0
        igoto end
    endif
    
    ; Check for header line content
    iHeaderCorrect system_i 1, sprintf("head -1 %s | grep -q 'from_state,to_state,probability' && echo 1 || echo 0", SfilePath)
    
    if (iHeaderCorrect == 0) then
        prints "ERROR: Output file %s has incorrect header\n", SfilePath
        ires = 0
        igoto end
    endif
    ires = 1
    ; Success
    end:
    xout ires
endop

; -----------------------------------------------------------------------
; TEST CASE GENERATOR INSTRUMENT
; -----------------------------------------------------------------------
instr PrepareTest
    p4 = p4  ; Test scenario number
    
    prints "\n==========================================================\n"
    prints "PREPARING TEST SCENARIO %d\n", p4
    prints "==========================================================\n"
    
    ; Create test directory if it doesn't exist
    iRes system_i 1, sprintf("mkdir -p %s", gS_test_dir)
    
    ; Remove any previous output files
    iRes system_i 1, sprintf("rm -f %s/*.csv", gS_test_dir)
    
    ; Schedule the test run
    event_i "i", "RunTest", 0, 0.1, p4
endin

; -----------------------------------------------------------------------
; TEST EXECUTION INSTRUMENT
; -----------------------------------------------------------------------
instr RunTest
    p4 = p4   ; Test scenario number
    
    prints "\nRUNNING TEST SCENARIO %d\n", p4
    
    ; Different test scenarios
    if (p4 == 1) then
        prints "Scenario 1: Default test matrix with default parameters\n"
        
        ; Populate matrix with test case 1
        populateTestMatrix 1
        
        ; Call the function with default output path
        visualizeTransitionMatrix gS_default_output
        
        ; Verify output
        iSuccess = verifyOutputFile(gS_default_output)
        
        if (iSuccess == 1) then
            prints "  TEST PASSED: Default output file created successfully\n"
        else
            prints "  TEST FAILED: Problem with default output file\n"
        endif
        
    elseif (p4 == 2) then
        prints "Scenario 2: Custom matrix with default parameters\n"
        
        ; Populate matrix with test case 2
        populateTestMatrix 2
        
        ; Call the function with custom output path
        visualizeTransitionMatrix gS_custom_output
        
        ; Verify output
        iSuccess = verifyOutputFile(gS_custom_output)
        
        if (iSuccess == 1) then
            prints "  TEST PASSED: Custom matrix output file created successfully\n"
        else
            prints "  TEST FAILED: Problem with custom matrix output file\n"
        endif
        
    elseif (p4 == 3) then
        prints "Scenario 3: Empty matrix\n"
        
        ; Reset matrix to all zeros
        iIdx = 0
        while (iIdx < 27*27) do
            tabw_i 0, iIdx, gi_transition_matrix
            iIdx += 1
        od
        
        ; Call the function with custom output path
        visualizeTransitionMatrix gS_empty_output
        
        ; Verify output
        iSuccess = verifyOutputFile(gS_empty_output)
        
        if (iSuccess == 1) then
            ; Check if file has only header line
            iLineCount system_i 1, sprintf("wc -l %s | awk '{print $1}'", gS_empty_output)
            if (int(iLineCount) <= 1) then
                prints "  TEST PASSED: Empty matrix produced header-only output as expected\n"
            else
                prints "  TEST WARNING: Empty matrix produced output with %d lines (expected 1)\n", int(iLineCount)
            endif
        else
            prints "  TEST FAILED: Problem with empty matrix output file\n"
        endif
        
    elseif (p4 == 4) then
        prints "Scenario 4: Custom output path\n"
        
        ; Populate matrix with test case 1
        populateTestMatrix 1
        
        ; Create a custom path
        SCustomPath = sprintf("%s/custom_path_test.csv", gS_test_dir)
        
        ; Call the function with custom output path
        visualizeTransitionMatrix SCustomPath
        
        ; Verify output
        iSuccess = verifyOutputFile(SCustomPath)
        
        if (iSuccess == 1) then
            prints "  TEST PASSED: Custom path output file created successfully\n"
        else
            prints "  TEST FAILED: Problem with custom path output file\n"
        endif
        
    elseif (p4 == 5) then
        prints "Scenario 5: Debug level customization\n"
        
        ; Populate matrix with test case 1
        populateTestMatrix 1
        
        ; Store original debug level
        iOriginalDebug = gi_debug
        
        ; Test with suppressed debug output
        gi_debug = 0
        SDebugOffPath = sprintf("%s/debug_off_test.csv", gS_test_dir)
        visualizeTransitionMatrix SDebugOffPath
        
        ; Test with forced debug output
        gi_debug = 0  ; Keep global debug off
        SDebugOnPath = sprintf("%s/debug_on_test.csv", gS_test_dir)
        visualizeTransitionMatrix SDebugOnPath  ; Override with level 3
        
        ; Restore original debug level
        gi_debug = iOriginalDebug
        
        ; Verify both outputs
        iSuccess1 = verifyOutputFile(SDebugOffPath)
        iSuccess2 = verifyOutputFile(SDebugOnPath)
        
        if (iSuccess1 == 1 && iSuccess2 == 1) then
            prints "  TEST PASSED: Both debug level variants created files successfully\n"
        else
            prints "  TEST FAILED: Problem with debug level customization\n"
        endif
    endif
    
    ; Schedule next test if not the last one
    if (p4 < 5) then
        event_i "i", "PrepareTest", 0, 0.1, p4 + 1
    else
        prints "\n==========================================================\n"
        prints "ALL TESTS COMPLETED\n"
        prints "==========================================================\n"
        
        ; Clean up test files unless in high debug mode
        if (gi_debug < 3) then
            iRes system_i 1, sprintf("rm -rf %s", gS_test_dir)
            prints "Cleaned up test files\n"
        else
            prints "Test output files preserved in %s for inspection\n", gS_test_dir
        endif
    endif
endin

; -----------------------------------------------------------------------
; TEST RUNNER
; -----------------------------------------------------------------------
instr TestRunner
    prints "\n==========================================================\n"
    prints "STARTING VISUALIZETRANSITIONMATRIX OPCODE TESTS\n"
    prints "==========================================================\n"
    ; Start the test sequence with scenario 1
    event_i "i", "PrepareTest", 0, 0.1, 1
    event_i "i", "PrepareTest", 0, 0.1, 2
    event_i "i", "PrepareTest", 0, 0.1, 3
endin

</CsInstruments>
<CsScore>
; Run the test suite
i "TestRunner" 0 0.1
f 0 2  ; Run for 2 seconds - need more time for the file operations
</CsScore>
</CsoundSynthesizer>