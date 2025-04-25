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
gi_density_thresholds ftgen 0, 0, 4, -2, 0, 3, 7, 1000    ; Sparse, Medium, Dense
gi_register_thresholds ftgen 0, 0, 4, -2, 0, 0.3, 0.7, 1.001 ; Low, Mid, High
gi_movement_thresholds ftgen 0, 0, 4, -2, 0, 0.2, 0.5, 1.001 ; Static, Moderate, Dynamic
gi_tc_transition_active init 0      ; Flag indicating if transition is active (0=no, 1=yes)
gi_tc_transition_progress init 0    ; Progress of current transition (0.0 to 1.0)
gi_tc_transition_duration init 0    ; Duration of current transition in seconds
gi_tc_transition_start_time init 0  ; Start time of current transition
gi_tc_transition_count init 0       ; Counter for completed transitions
; Actual state recording tables (100 points resolution)
gi_tc_actual_state_density ftgen 0, 0, 100, -2, 0     ; Replace gi_tc_actual_state_table
gi_tc_actual_state_register ftgen 0, 0, 100, -2, 0    ; New table
gi_tc_actual_state_movement ftgen 0, 0, 100, -2, 0    ; New table
gi_tc_expected_state_density ftgen 0, 0, 100, -2, 0   ; Replace gi_tc_expected_state_table
gi_tc_expected_state_register ftgen 0, 0, 100, -2, 0  ; New table
gi_tc_expected_state_movement ftgen 0, 0, 100, -2, 0  ; New table

; Deviation tracking tables (100 points resolution)
gi_tc_deviation_density ftgen 0, 0, 100, -2, 0        ; New table
gi_tc_deviation_register ftgen 0, 0, 100, -2, 0       ; New table
gi_tc_deviation_movement ftgen 0, 0, 100, -2, 0       ; New table

; Global variables setup
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0
gi_asp_history_index init 0
gi_asp_transition_count init 10  ; Sufficient transitions
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
gi_tc_past_states_index init 0           ; Current index in past states buffer
gi_tc_past_states ftgen 0, 0, 24, -2, 0  ; Store last 8 states (density, register, movement triplets)
; Behavior scheduling control
gi_tc_next_behavior_time init 0    ; Time to schedule next behavior
gi_tc_min_behavior_interval init 3 ; Minimum time between behaviors in seconds
gi_tc_max_behavior_interval init 10 ; Maximum time between behaviors in seconds
gi_NUMComportamenti init 100    ; Capacità massima di comportamenti
gi_tc_min_stable_time init 15       ; Minimum time in seconds to stay in a stable state

; Include the improved UDO
#define OTTAVE          #10#      ; Numero di ottave generate
#include "../udos/utils.udo"
#include "../udos/validator.udo"
#include "../udos/mapStateToParameter.udo"
#include "../udos/parameterInterpolation.udo"
#include "../udos/interpolations.udo"
#include "../udos/determineCurrentState.udo"
#include "../udos/stateTransition.udo"
#include "../udos/adaptiveStatePrediction.udo"
#include "../udos/transControllerUtils.udo"

instr TestAdaptLearningRate
    prints "\n=== Testing adaptLearningRate ===\n"
    
    ; Initial learning rate
    prints "Initial learning rate: %.3f\n", gi_asp_learning_rate
    
    ; Imposta un numero di transizioni sufficiente
    gi_asp_transition_count = 30  ; Aumentato a 30 transizioni
    
    ; Update history index to simulate accumulated transitions
    gi_asp_history_index = 30  ; Point to after our test data
    
    ; Create test transitions with high quality (in reverse order as function reads)
    iIdx = 0
    while (iIdx < 30) do  ; Ciclo esteso a 30 transizioni
        ; Calculate position in circular buffer (most recent first)
        iActualIdx = (gi_asp_history_index - 1 - iIdx + 100) % 100
        iRecordIdx = iActualIdx * 7
        
        tabw_i 0, iRecordIdx, gi_asp_transition_history   ; From state
        tabw_i 1, iRecordIdx+1, gi_asp_transition_history ; To state
        
        ; Crea diverse qualità per rendere il test più realistico
        if (iIdx < 15) then
            tabw_i 0.9, iRecordIdx+2, gi_asp_transition_history ; High quality for recent
        else
            tabw_i 0.7, iRecordIdx+2, gi_asp_transition_history ; Medium quality for older
        endif
        
        ; Add some context
        tabw_i 0.5, iRecordIdx+3, gi_asp_transition_history
        tabw_i 0.6, iRecordIdx+4, gi_asp_transition_history
        tabw_i 0.7, iRecordIdx+5, gi_asp_transition_history
        tabw_i 0.4, iRecordIdx+6, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Verifica le transizioni create (opzionale)
    prints "\nDEBUG: Verifica di alcune transizioni memorizzate:\n"
    iIdxPrint = 0
    while (iIdxPrint < 5) do  ; Mostra solo le prime 5 per brevità
        iActualIdxPrint = (gi_asp_history_index - 1 - iIdxPrint + 100) % 100
        iRecordIdxPrint = iActualIdxPrint * 7
        iQualityPrint tab_i iRecordIdxPrint+2, gi_asp_transition_history
        prints "DEBUG: Transition %d at position %d has quality %.2f\n", 
               iIdxPrint, iActualIdxPrint, iQualityPrint
        iIdxPrint += 1
    od
    
    ; Call with target quality of 0.75 (lower than recent 0.9)
    prints "\nCalling adaptLearningRate with target quality of 0.75 (recent quality=0.9):\n"
    adaptLearningRate(0.75, 2)
    
    ; Print result
    prints "New learning rate: %.3f\n", gi_asp_learning_rate
    prints "Expected: learning rate should decrease since recent transitions have higher quality than target\n"
    
    ; Reset and try again with different target
    gi_asp_learning_rate = 0.1
    prints "\nResetting learning rate to 0.1 and testing with target quality of 0.95:\n"
    adaptLearningRate(0.95, 2)
    
    prints "New learning rate: %.3f\n", gi_asp_learning_rate
    prints "Expected: learning rate should increase since recent transitions have lower quality than target\n"
    
    prints "\n=== Test completed ===\n"
endin

instr TestIntegration
    prints "\n=== Testing recordCurrentState and adaptLearningRate integration ===\n"
    
    ; Setup some initial state
    gi_current_overlap = 5        ; Simulate current musical parameters
    gi_current_octave_spread = 0.6
    gi_current_spatial_movement = 0.3
    
    ; Record the current state
    prints "Calling recordCurrentState with overlap=5, spread=0.6, movement=0.3\n"
    recordCurrentState
    
    ; Imposta un numero di transizioni sufficiente
    gi_asp_transition_count = 30  ; Aumentato a 30
    gi_asp_history_index = 30     ; Aumentato a 30
    
    ; Create history with a mix of transitions
    iIdx = 0
    while (iIdx < 30) do  ; Ciclo esteso a 30 transizioni
        iActualIdx = (gi_asp_history_index - 1 - iIdx + 100) % 100
        iRecordIdx = iActualIdx * 7
        
        tabw_i gi_tc_current_density, iRecordIdx, gi_asp_transition_history  ; From state (use current)
        tabw_i 1, iRecordIdx+1, gi_asp_transition_history                    ; To state
        
        ; Distribuzione più variata di qualità
        if (iIdx < 10) then
            tabw_i 0.9, iRecordIdx+2, gi_asp_transition_history  ; High quality per le più recenti
        elseif (iIdx < 20) then
            tabw_i 0.7, iRecordIdx+2, gi_asp_transition_history  ; Medium quality per le intermedie
        else
            tabw_i 0.5, iRecordIdx+2, gi_asp_transition_history  ; Lower quality per le più vecchie
        endif
        
        ; Add context similar to what was recorded
        tabw_i gi_current_overlap/10, iRecordIdx+3, gi_asp_transition_history
        tabw_i gi_current_octave_spread, iRecordIdx+4, gi_asp_transition_history
        tabw_i gi_current_spatial_movement, iRecordIdx+5, gi_asp_transition_history
        tabw_i 0.4, iRecordIdx+6, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Verifica le transizioni 
    prints "\nDEBUG: Verifica delle transizioni memorizzate (prime e ultime 3):\n"
    
    ; Mostra prime 3
    iIdxPrint = 0
    while (iIdxPrint < 3) do
        iActualIdxPrint = (gi_asp_history_index - 1 - iIdxPrint + 100) % 100
        iRecordIdxPrint = iActualIdxPrint * 7
        iQualityPrint tab_i iRecordIdxPrint+2, gi_asp_transition_history
        prints "DEBUG: Recent transition %d at position %d has quality %.2f\n", 
               iIdxPrint, iActualIdxPrint, iQualityPrint
        iIdxPrint += 1
    od
    
    ; Mostra ultime 3
    iIdxPrint = 27
    while (iIdxPrint < 30) do
        iActualIdxPrint = (gi_asp_history_index - 1 - iIdxPrint + 100) % 100
        iRecordIdxPrint = iActualIdxPrint * 7
        iQualityPrint tab_i iRecordIdxPrint+2, gi_asp_transition_history
        prints "DEBUG: Older transition %d at position %d has quality %.2f\n", 
               iIdxPrint, iActualIdxPrint, iQualityPrint
        iIdxPrint += 1
    od
    
    ; Test learning rate adaptation
    gi_asp_learning_rate = 0.1  ; Reset
    prints "\nCalling adaptLearningRate with target=0.7 (media qualità circa 0.7-0.8):\n"
    adaptLearningRate(0.7, 2)
    
    ; Change musical context and record again
    gi_current_overlap = 2        ; Lower density
    gi_current_octave_spread = 0.3 ; Lower spread
    gi_current_spatial_movement = 0.8 ; Higher movement
    
    prints "\nCalling recordCurrentState with changed parameters (overlap=2, spread=0.3, movement=0.8)\n"
    recordCurrentState
    
    ; Print final state
    prints "\nIntegration test completed\n"
    prints "Final state: density=%d, register=%d, movement=%d\n", 
           gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement
    prints "Learning rate: %.3f\n", gi_asp_learning_rate
endin

</CsInstruments>

<CsScore>
i "TestAdaptLearningRate" 0 0.1
i "TestIntegration" 0.2 0.1
e
</CsScore>
</CsoundSynthesizer>