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

; Global variables setup
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0
gi_asp_history_index init 0
gi_asp_transition_count init 25  ; Sufficient transitions
gi_asp_learning_rate init 0.1
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0  ; Inizializzata a zero
gi_tc_source_density init 0
gi_tc_source_register init 0
gi_tc_source_movement init 0
gi_tc_target_density init 0
gi_tc_target_register init 0
gi_tc_target_movement init 0
gi_tc_transition_mode init 1      ; 0.0=sudden, 1.0=gradual
gi_tc_transition_randomness init 0.2  ; Randomness factor (0.0-1.0)
gi_asp_context_features ftgen 0, 0, 10, -2, 0
gi_current_overlap init 1         ; Livello di sovrapposizione attuale
gi_current_harmonic_density init 0    ; Densità armonica corrente
gi_current_octave_spread init 0       ; Dispersione ottave corrente
gi_current_spectral_centroid init 0   ; Centroide spettrale corrente
gi_current_spatial_movement init 0    ; Movimento spaziale corrente
gi_memory_resolution = 1          ; Risoluzione in secondi
gi_memory_duration = 480          ; Durata massima in secondi
gi_memory_size = gi_memory_duration / gi_memory_resolution  ; Dimensione tabella

; Include the improved UDO
#include "../udos/stateTransition.udo"
#include "../udos/adaptiveStatePrediction.udo"

instr TestAdaptLearningRate
    prints "\n=== Testing adaptLearningRate ===\n"
    
    ; Initial learning rate
    prints "Initial learning rate: %.3f\n", gi_asp_learning_rate
    
    ; Create some test transitions with high quality
    iIdx = 0
    while (iIdx < 15) do
        iRecordIdx = iIdx * 7
        tabw_i 0, iRecordIdx, gi_asp_transition_history   ; From state
        tabw_i 1, iRecordIdx+1, gi_asp_transition_history ; To state
        tabw_i 0.9, iRecordIdx+2, gi_asp_transition_history ; High quality
        
        ; Add some context
        tabw_i 0.5, iRecordIdx+3, gi_asp_transition_history
        tabw_i 0.6, iRecordIdx+4, gi_asp_transition_history
        tabw_i 0.7, iRecordIdx+5, gi_asp_transition_history
        tabw_i 0.4, iRecordIdx+6, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Call with target quality of 0.75 (lower than our test data's 0.9)
    prints "\nCalling adaptLearningRate with target quality of 0.75 (our test data has 0.9):\n"
    adaptLearningRate(0.75, 2)
    
    ; Print result
    prints "New learning rate: %.3f\n", gi_asp_learning_rate
    prints "Expected: learning rate should decrease slightly since our transitions have higher quality than target\n"
    
    ; Reset and try again with different target
    gi_asp_learning_rate = 0.1
    prints "\nResetting learning rate to 0.1 and testing with target quality of 0.95:\n"
    adaptLearningRate 0.95, 2
    
    prints "New learning rate: %.3f\n", gi_asp_learning_rate
    prints "Expected: learning rate should increase slightly since our transitions have lower quality than target\n"
    
    prints "\n=== Test completed ===\n"
endin

</CsInstruments>

<CsScore>
i "TestAdaptLearningRate" 0 0.1
e
</CsScore>
</CsoundSynthesizer>