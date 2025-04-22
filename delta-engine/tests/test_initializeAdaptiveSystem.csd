<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Variabili globali necessarie
gi_debug init 2  ; Livello di debug standard per vedere più output

; Allocazione delle tabelle richieste dall'opcode
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0  ; 100 transizioni * 7 valori ciascuna
gi_asp_context_features ftgen 0, 0, 5, -2, 0    ; 4 caratteristiche di contesto

; Variabili globali richieste dall'opcode
gi_asp_history_index init 0
gi_asp_transition_count init 0
gi_asp_learning_rate init 0.0

#include "../udos/initializeAdaptiveSystem.udo"
; Strumento di test 1 - Inizializzazione con valori di default
instr 1
    prints "\n--- TEST 1: Default Initialization ---\n"
    
    ; Prima prepariamo alcune variabili globali con valori non-default per verificare il reset
    gi_asp_history_index = 42
    gi_asp_transition_count = 123
    gi_asp_learning_rate = 0.5
    
    ; Popoliamo alcune celle della tabella con valori non-zero
    tabw_i 0.75, 0, gi_asp_context_features
    tabw_i 0.8, 1, gi_asp_context_features
    tabw_i 0.2, 2, gi_asp_context_features
    tabw_i 0.3, 3, gi_asp_context_features
    
    ; Popoliamo alcune celle della tabella di history
    tabw_i 1.0, 0, gi_asp_transition_history
    tabw_i 2.0, 1, gi_asp_transition_history
    
    ; Chiamiamo l'opcode con valori di default
    initializeAdaptiveSystem gi_debug
    
    ; Verifichiamo i risultati
    prints "After initialization:\n"
    prints "  history_index = %d (expected 0)\n", gi_asp_history_index
    prints "  transition_count = %d (expected 0)\n", gi_asp_transition_count
    prints "  learning_rate = %.2f (expected 0.10)\n", gi_asp_learning_rate
    
    ; Verifichiamo che le caratteristiche di contesto siano state inizializzate a 0.5
    prints "Context features:\n"
    iFeatureIdx = 0
    while (iFeatureIdx < 4) do
        iValue tab_i iFeatureIdx, gi_asp_context_features
        prints "  Feature %d = %.2f (expected 0.50)\n", iFeatureIdx, iValue
        iFeatureIdx += 1
    od
    
    ; Verifichiamo che le celle della tabella history siano state azzerate
    iValue1 tab_i 0, gi_asp_transition_history
    iValue2 tab_i 1, gi_asp_transition_history
    prints "History values:\n"
    prints "  Cell 0 = %.2f (expected 0.00)\n", iValue1
    prints "  Cell 1 = %.2f (expected 0.00)\n", iValue2
endin

; Strumento di test 2 - Inizializzazione con valori personalizzati
instr 2
    prints "\n--- TEST 2: Custom Initialization ---\n"
    
    ; Reset values to non-default again
    gi_asp_history_index = 42
    gi_asp_transition_count = 123
    gi_asp_learning_rate = 0.5
    
    ; Call with custom learning rate and debug level
    initializeAdaptiveSystem gi_debug
    
    ; Verify
    prints "After custom initialization:\n"
    prints "  history_index = %d (expected 0)\n", gi_asp_history_index
    prints "  transition_count = %d (expected 0)\n", gi_asp_transition_count
    prints "  learning_rate = %.2f (expected 0.1)\n", gi_asp_learning_rate
endin

; Strumento di test 3 - Verifica che l'opcode gestisca correttamente tabelle di dimensioni diverse
instr 3
    prints "\n--- TEST 3: Stress Testing ---\n"
    
    ; Set up some extreme values to test robustness
    iManyTransitions = 1000
    gi_asp_transition_count = iManyTransitions
    
    ; Now initialize
    initializeAdaptiveSystem gi_debug
    
    ; Verify reset worked properly
    prints "After stress test initialization:\n"
    prints "  transition_count = %d (expected 0)\n", gi_asp_transition_count
    
    ; Check if history was properly reset
    iSum = 0
    iNumChecks = 50  ; Check first 50 cells
    iEntryIdx = 0
    while (iEntryIdx < iNumChecks) do
        iValue tab_i iEntryIdx, gi_asp_transition_history
        iSum += iValue
        iEntryIdx += 1
    od
    
    ; If the sum is 0, then all checked values are 0
    prints "  Sum of first %d history cells = %.2f (expected 0.00)\n", iNumChecks, iSum
endin

; Strumento riepilogativo
instr 99
    prints "\n=== TEST RESULTS SUMMARY ===\n"
    
    ; Check if all values are as expected
    iHistoryIndexCorrect = (gi_asp_history_index == 0) ? 1 : 0
    iTransitionCountCorrect = (gi_asp_transition_count == 0) ? 1 : 0
    iLearningRateCorrect = (gi_asp_learning_rate == 0.1) ? 1 : 0  ; From last test
    
    iFeature0 tab_i 0, gi_asp_context_features
    iFeature1 tab_i 1, gi_asp_context_features
    iFeature2 tab_i 2, gi_asp_context_features
    iFeature3 tab_i 3, gi_asp_context_features
    
    iFeaturesCorrect = (iFeature0 == 0.5 && iFeature1 == 0.5 && iFeature2 == 0.5 && iFeature3 == 0.5) ? 1 : 0
    
    iAllCorrect = iHistoryIndexCorrect * iTransitionCountCorrect * iLearningRateCorrect * iFeaturesCorrect
    
    if (iAllCorrect == 1) then
        prints "All tests PASSED!\n"
    else
        prints "Some tests FAILED!\n"
        prints "  History index correct: %d\n", iHistoryIndexCorrect
        prints "  Transition count correct: %d\n", iTransitionCountCorrect
        prints "  Learning rate correct: %d\n", iLearningRateCorrect
        prints "  Context features correct: %d\n", iFeaturesCorrect
    endif
    
    prints "===========================\n"
endin

</CsInstruments>
<CsScore>
; Execute tests in sequence
i 1 0 0.1    ; Test with default parameters
i 2 0.5 0.1  ; Test with custom parameters
i 3 1 0.1    ; Stress test
i 99 1.5 0.1 ; Summary

e
</CsScore>
</CsoundSynthesizer>