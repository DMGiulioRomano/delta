; Test calculateTransitionDuration opcode
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gi_transition_matrix ftgen 0, 0, 27*27, -2, 0
; Create required global variables
gi_tc_source_density init 0
gi_tc_source_register init 0
gi_tc_source_movement init 0

gi_tc_target_density init 0
gi_tc_target_register init 0
gi_tc_target_movement init 0

gi_tc_transition_mode init 1      ; 0.0=sudden, 1.0=gradual
gi_tc_transition_randomness init 0.2  ; Randomness factor (0.0-1.0)

; Include the stateTransition.udo file
#include "../udos/stateTransition.udo"

instr TestTransitionDuration
    prints "Testing calculateTransitionDuration...\n\n"
    
    ; Test 1: Same state (no parameter changes)
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    
    gi_tc_target_density = 0
    gi_tc_target_register = 0
    gi_tc_target_movement = 0
    
    gi_tc_transition_mode = 1  ; Gradual
    gi_tc_transition_randomness = 0  ; No randomness for deterministic testing
    
    iDuration1 calculateTransitionDuration
    prints "Duration for no parameter changes (gradual): %.2f seconds\n", iDuration1
    
    ; Test 2: One parameter change
    gi_tc_target_density = 1
    
    iDuration2 calculateTransitionDuration
    prints "Duration for 1 parameter change (gradual): %.2f seconds\n", iDuration2
    
    ; Test 3: Two parameter changes
    gi_tc_target_register = 1
    
    iDuration3 calculateTransitionDuration
    prints "Duration for 2 parameter changes (gradual): %.2f seconds\n", iDuration3
    
    ; Test 4: Three parameter changes
    gi_tc_target_movement = 1
    
    iDuration4 calculateTransitionDuration
    prints "Duration for 3 parameter changes (gradual): %.2f seconds\n", iDuration4
    
    ; Test 5: Sudden transition mode
    gi_tc_transition_mode = 0  ; Sudden
    
    iDuration5 calculateTransitionDuration
    prints "Duration for 3 parameter changes (sudden): %.2f seconds\n", iDuration5
    
    ; Test 6: Mixed transition mode (somewhere between sudden and gradual)
    gi_tc_transition_mode = 0.5  ; Half gradual, half sudden
    
    iDuration6 calculateTransitionDuration
    prints "Duration for 3 parameter changes (mixed 0.5): %.2f seconds\n", iDuration6
    
    ; Test 7: With randomness
    gi_tc_transition_mode = 1  ; Gradual
    gi_tc_transition_randomness = 0.5  ; 50% randomness
    
    prints "\nTesting randomness effect (transition mode = 1.0, randomness = 0.5):\n"
    
    indx = 0
    while indx < 5 do
        iDuration7 calculateTransitionDuration
        prints "Run %d: Duration = %.2f seconds\n", indx+1, iDuration7
        indx += 1
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestTransitionDuration" 0 0.1
e
</CsScore>
</CsoundSynthesizer>