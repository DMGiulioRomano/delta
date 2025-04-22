; Initialize the adaptive learning system
opcode initializeAdaptiveSystem, 0, i
    iDebugLevel xin    
    ; Reset counters and state
    gi_asp_history_index = 0
    gi_asp_transition_count = 0
    gi_asp_learning_rate = 0.1

    ; Azzeramento esplicito della tabella history (opzionale)
    if iDebugLevel >= 3 then
        prints "Resetting transition history table...\n"
    endif
    
    iEntryIdx = 0
    while (iEntryIdx < 700) do ; 100 entries * 7 values per entry
        tabw_i 0, iEntryIdx, gi_asp_transition_history
        iEntryIdx += 1
    od

    ; Initialize context features to neutral values
    iFeatureIdx = 0
    while (iFeatureIdx < 4) do
        tabw_i 0.5, iFeatureIdx, gi_asp_context_features
        iFeatureIdx += 1
    od
    
    ; Report initialization
    if (iDebugLevel >= 1) then
        prints "Adaptive learning system initialized\n"
        prints "  Learning rate: %.2f\n", gi_asp_learning_rate
        prints "  History capacity: %d transitions\n", 100
        prints "  Context features initialized to neutral values\n"
    endif
endop
