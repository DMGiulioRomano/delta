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
gi_debug init 3

; ==========================================
; Global variables setup
; ==========================================
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0
gi_asp_context_features ftgen 0, 0, 10, -2, 0

; ==========================================
; The improved opcode being tested
; ==========================================
#include "../udos/calculateContextSimilarity.udo"

; ==========================================
; Testing Instrument
; ==========================================
instr TestSimilarity
    prints "\n====== TESTING IMPROVED SIMILARITY CALCULATION ======\n"
    
    ; Prepare several test cases with varying levels of similarity
    
    ; Test Case 1: Identical contexts
    iTestBase1 = 0 
    tabw_i 0.5, iTestBase1, gi_asp_transition_history     ; overlap
    tabw_i 0.6, iTestBase1+1, gi_asp_transition_history   ; spread
    tabw_i 0.7, iTestBase1+2, gi_asp_transition_history   ; centroid
    tabw_i 0.4, iTestBase1+3, gi_asp_transition_history   ; movement
    
    ; Test Case 2: Similar but not identical
    iTestBase2 = 10
    tabw_i 0.55, iTestBase2, gi_asp_transition_history    ; slightly different
    tabw_i 0.65, iTestBase2+1, gi_asp_transition_history  ; slightly different
    tabw_i 0.7, iTestBase2+2, gi_asp_transition_history   ; identical
    tabw_i 0.45, iTestBase2+3, gi_asp_transition_history  ; slightly different
    
    ; Test Case 3: Somewhat different
    iTestBase3 = 20
    tabw_i 0.7, iTestBase3, gi_asp_transition_history     ; moderately different
    tabw_i 0.4, iTestBase3+1, gi_asp_transition_history   ; moderately different
    tabw_i 0.8, iTestBase3+2, gi_asp_transition_history   ; moderately different
    tabw_i 0.3, iTestBase3+3, gi_asp_transition_history   ; moderately different
    
    ; Test Case 4: Very different
    iTestBase4 = 30
    tabw_i 0.1, iTestBase4, gi_asp_transition_history     ; very different
    tabw_i 0.9, iTestBase4+1, gi_asp_transition_history   ; very different
    tabw_i 0.2, iTestBase4+2, gi_asp_transition_history   ; very different
    tabw_i 0.8, iTestBase4+3, gi_asp_transition_history   ; very different
    
    ; Test Case 5: One critical feature exactly same, others different
    iTestBase5 = 40
    tabw_i 0.1, iTestBase5, gi_asp_transition_history     ; very different
    tabw_i 0.9, iTestBase5+1, gi_asp_transition_history   ; very different
    tabw_i 0.7, iTestBase5+2, gi_asp_transition_history   ; identical (centroid)
    tabw_i 0.8, iTestBase5+3, gi_asp_transition_history   ; very different
    
    ; Set current context
    tabw_i 0.5, 0, gi_asp_context_features  ; overlap
    tabw_i 0.6, 1, gi_asp_context_features  ; spread
    tabw_i 0.7, 2, gi_asp_context_features  ; centroid
    tabw_i 0.4, 3, gi_asp_context_features  ; movement
    
    prints "Current context: [%.2f, %.2f, %.2f, %.2f]\n\n", 
           tab_i(0, gi_asp_context_features),
           tab_i(1, gi_asp_context_features),
           tab_i(2, gi_asp_context_features),
           tab_i(3, gi_asp_context_features)
    
    ; Run basic similarity test
    prints "Basic similarity test:\n"
    prints "-----------------------\n"
    
    iSim1 calculateContextSimilarity iTestBase1
    iSim2 calculateContextSimilarity iTestBase2
    iSim3 calculateContextSimilarity iTestBase3
    iSim4 calculateContextSimilarity iTestBase4
    iSim5 calculateContextSimilarity iTestBase5
    
    prints "Test Case 1 (Identical): %.4f\n", iSim1
    prints "Test Case 2 (Slightly Different): %.4f\n", iSim2
    prints "Test Case 3 (Moderately Different): %.4f\n", iSim3
    prints "Test Case 4 (Very Different): %.4f\n", iSim4
    prints "Test Case 5 (One Feature Match): %.4f\n", iSim5
    
    ; Run detailed similarity test
    prints "\nDetailed similarity test:\n"
    prints "-------------------------\n"
    
    iResult1[], iOverall1 calculateContextSimilarityDetailed iTestBase1
    iResult2[], iOverall2 calculateContextSimilarityDetailed iTestBase2
    iResult5[], iOverall5 calculateContextSimilarityDetailed iTestBase5
    
    prints "Test Case 1 (Identical):\n"
    prints "  Overall: %.4f\n", iResult1[0]
    prints "  Feature similarities: [%.4f, %.4f, %.4f, %.4f]\n",
           iResult1[1], iResult1[2], iResult1[3], iResult1[4]
    
    prints "\nTest Case 2 (Slightly Different):\n"
    prints "  Overall: %.4f\n", iResult2[0]
    prints "  Feature similarities: [%.4f, %.4f, %.4f, %.4f]\n",
           iResult2[1], iResult2[2], iResult2[3], iResult2[4]
    
    prints "\nTest Case 5 (One Feature Match):\n"
    prints "  Overall: %.4f\n", iResult5[0]
    prints "  Feature similarities: [%.4f, %.4f, %.4f, %.4f]\n",
           iResult5[1], iResult5[2], iResult5[3], iResult5[4]
    
    ; Test different debug levels
    prints "\nTesting with different debug levels:\n"
    prints "-----------------------------------\n"
    
    prints "Debug Level 0 (Minimal):\n"
    iSimDebug0 calculateContextSimilarity iTestBase3, 0
    
    prints "\nDebug Level 1 (Basic):\n"
    iSimDebug1 calculateContextSimilarity iTestBase3, 1
    
    prints "\nDebug Level 2 (Standard):\n"
    iSimDebug2 calculateContextSimilarity iTestBase3, 2
    
    prints "\nDebug Level 3 (Verbose):\n"
    iSimDebug3 calculateContextSimilarity iTestBase3, 3
    
    prints "\n====== TEST COMPLETED ======\n"
endin

</CsInstruments>

<CsScore>
i "TestSimilarity" 0 0.1
e
</CsScore>
</CsoundSynthesizer>