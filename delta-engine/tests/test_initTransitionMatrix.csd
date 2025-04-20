; Test initTransitionMatrix opcode
<CsoundSynthesizer>
<CsOptions>
; No audio output needed for this test
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Create transition matrix with 27×27 elements (3 states for each of 3 dimensions)
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Include the stateTransition.udo file
#include "../udos/stateTransition.udo"

instr TestInitMatrix
    prints "Testing initTransitionMatrix...\n"
    
    ; Call the opcode to initialize the matrix
    initTransitionMatrix
    
    ; Check matrix values after initialization
    iTotal = 0
    
    ; Test a few specific state transitions
    ; For state 0 (0,0,0) - staying in the same state
    iSameStateProb tab_i 0, gi_transition_matrix
    prints "Probability of staying in state (0,0,0): %.3f\n", iSameStateProb
    
    ; For state 0 transitioning to state 1 (changing one parameter)
    iOneChangeProb tab_i 1, gi_transition_matrix
    prints "Probability of state (0,0,0) → (0,0,1): %.3f\n", iOneChangeProb
    
    ; For state 0 transitioning to state 13 (changing two parameters)
    iTwoChangeProb tab_i 13, gi_transition_matrix
    prints "Probability of state (0,0,0) → (1,1,0): %.3f\n", iTwoChangeProb
    
    ; For state 0 transitioning to state 26 (changing all parameters)
    iAllChangeProb tab_i 26, gi_transition_matrix
    prints "Probability of state (0,0,0) → (2,2,2): %.3f\n", iAllChangeProb
    
    ; Verify that row 0 probabilities sum to 1.0 (allowing for floating point precision)
    iSum = 0
    indx = 0
    while indx < 27 do
        iSum += tab_i(indx, gi_transition_matrix)
        indx += 1
    od
    prints "Sum of probabilities for state (0,0,0): %.6f\n", iSum
    
    ; Verify another row (e.g., state 13 = 1,1,0)
    iRowIdx = 13*27
    iSum2 = 0
    indx = 0
    while indx < 27 do
        iSum2 += tab_i(iRowIdx+indx, gi_transition_matrix)
        indx += 1
    od
    prints "Sum of probabilities for state (1,1,0): %.6f\n", iSum2
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestInitMatrix" 0 0.1
e
</CsScore>
</CsoundSynthesizer>