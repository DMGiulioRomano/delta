<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Create transition matrix and required global variables
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Global variables needed by selectNextState
gi_tc_source_density init 0
gi_tc_source_register init 0
gi_tc_source_movement init 0

; Include the stateTransition.udo file
#include "../udos/stateTransition.udo"

instr TestSelectState
    prints "Testing selectNextState...\n"
    
    ; First initialize the transition matrix
    initTransitionMatrix
    
    ; Create arrays to track state selections
    iStateCounts[] init 27
    iTotalTransitions = 500  ; Number of test transitions to perform
    
    ; Test multiple transitions and collect statistics
    indx = 0
    while indx < iTotalTransitions do
        ; Set random source state for testing different transitions
        gi_tc_source_density = int(random:i(0, 3))
        gi_tc_source_register = int(random:i(0, 3)) 
        gi_tc_source_movement = int(random:i(0, 3))
        
        ; Get source state index for debugging
        iSrcIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
        
        ; Select next state 
        iNextDensity, iNextRegister, iNextMovement selectNextState
        
        ; Convert to state index
        iNextIdx = (iNextDensity * 9) + (iNextRegister * 3) + iNextMovement
        
        ; Increment counter for this state
        iStateCounts[iNextIdx] = iStateCounts[iNextIdx] + 1
        
        ; Debug output for a few transitions
        if indx < 5 then
            prints "Source state (%d,%d,%d) → Target state (%d,%d,%d)\n", 
                gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement,
                iNextDensity, iNextRegister, iNextMovement
        endif
        
        indx += 1
    od
    
    ; Print statistics for a specific source state
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    
    ; Reset counters for specific test
    indx = 0
    while indx < 27 do
        iStateCounts[indx] = 0
        indx += 1
    od
    
    ; Run 1000 transitions from the same state to see probability distribution
    prints "\nTesting 1000 transitions from state (0,0,0):\n"
    indx = 0
    while indx < 1000 do
        iNextDensity, iNextRegister, iNextMovement selectNextState
        iNextIdx = (iNextDensity * 9) + (iNextRegister * 3) + iNextMovement
        iStateCounts[iNextIdx] = iStateCounts[iNextIdx] + 1
        indx += 1
    od
    
    ; Print results
    prints "Transition distribution from state (0,0,0):\n"
    indx = 0
    while indx < 27 do
        if iStateCounts[indx] > 0 then
            iDensity = int(indx / 9)
            iRemainder = indx % 9
            iRegister = int(iRemainder / 3)
            iMovement = iRemainder % 3
            
            iExpectedProb tab_i indx, gi_transition_matrix
            iActualProb = iStateCounts[indx] / 1000
            
            prints "  To state (%d,%d,%d): Count=%d (%.3f vs expected %.3f)\n", 
                iDensity, iRegister, iMovement, iStateCounts[indx],
                iActualProb, iExpectedProb
        endif
        indx += 1
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestSelectState" 0 0.1
e
</CsScore>
</CsoundSynthesizer>