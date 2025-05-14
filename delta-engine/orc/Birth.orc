instr Birth
    prints "\n========================== open Birth *INIT-PASS*\n\n"
    seed(0)
    ;println "\n========================== open Birth *PERF-PASS*\n\n"
    ; Debug level
    i_debug = (gi_debug == 0) ? 1 : gi_debug

    ; Inizializza sistema di transizione se necessario
    initTransitionMatrix
    ; Seleziona il primo stato attraverso la matrice di transizione
    iTargetDens, iTargetRegist, iTargetMovem selectNextState
    iTargetDensity, iTargetRegister, iTargetMovement instantiate iTargetDens, iTargetRegist, iTargetMovem
    
    ; Stampa lo stato selezionato per debug
    if (i_debug >= 1) then
        prints "Birth: Stato iniziale selezionato [%d,%d,%d]\n", 
               iTargetDensity, iTargetRegister, iTargetMovement
    endif

    ; Calcola la distanza euclidea dallo stato zero
    ; d = √[(x₂-x₁)² + (y₂-y₁)² + (z₂-z₁)²] --> x₁,y₁,z₁ sono tutti = 0
    iDistance = sqrt((iTargetDensity^2) + (iTargetRegister^2) + (iTargetMovement^2))
    iMaxDistance = sqrt(12)  ; √(2²+2²+2²)
    iNormalizedDistance = iDistance / iMaxDistance  ; 0-1 range

    ; Calcola la durata della transizione con RELAZIONE INVERSA
    iMinDuration = 3.0    ; Durata minima (secondi)
    iMaxDuration = 20.0   ; Durata massima (secondi)
    
    ; Formula inversa: maggiore distanza = minore durata
    iDuration = iMaxDuration * (1 - iNormalizedDistance) + iMinDuration

    ; Configura la transizione iniziale
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    
    gi_tc_target_density = iTargetDensity
    gi_tc_target_register = iTargetRegister
    gi_tc_target_movement = iTargetMovement
    
    gk_tc_transition_active = 1
    gi_tc_transition_duration = iDuration
    gi_tc_transition_start_time times
    gk_tc_transition_progress = 0
    gk_tc_transition_mode = 1        ; Modalità graduale per l'inizio
    gi_tc_transition_randomness = 0.1 ; Poca randomizzazione all'inizio
 
    ; Inizializza il percorso di stato atteso
    iIdx = 0
    while (iIdx < 100) do
        iProgressPoint = iIdx * 0.01
        
        ; Interpola i parametri per il percorso atteso
        iExpectedDensity = cubicInterpolate(gi_tc_source_density, gi_tc_target_density, iProgressPoint)
        iExpectedRegister = cubicInterpolate(gi_tc_source_register, gi_tc_target_register, iProgressPoint)
        iExpectedMovement = cubicInterpolate(gi_tc_source_movement, gi_tc_target_movement, iProgressPoint)
        
        ; Salva nei buffer
        tabw_i iExpectedDensity, iIdx, gi_tc_expected_state_density
        tabw_i iExpectedRegister, iIdx, gi_tc_expected_state_register
        tabw_i iExpectedMovement, iIdx, gi_tc_expected_state_movement
        
        iIdx += 1
    od


    ; Stampa informazioni sulla transizione
    if (i_debug >= 1) then
        prints "Birth: Inizializzata transizione con durata %.1f secondi\n", iDuration
        prints "Birth: Distanza calcolata: %.2f (max: %.2f)\n", iDistance, iMaxDistance
        prints "risultati dell'interpolazione:\n"
        printMatrixI gi_tc_expected_state_density, ftlen(gi_tc_expected_state_density)/10, ftlen(gi_tc_expected_state_density)/10, "gi_tc_expected_state_density", 3, "\t"
        printMatrixI gi_tc_expected_state_register, ftlen(gi_tc_expected_state_register)/10, ftlen(gi_tc_expected_state_register)/10, "gi_tc_expected_state_register", 3, "\t"
        printMatrixI gi_tc_expected_state_movement, ftlen(gi_tc_expected_state_movement)/10, ftlen(gi_tc_expected_state_movement)/10, "gi_tc_expected_state_movement", 3, "\t"
    endif
    
    ; Avvia immediatamente il generatore di behavior
    event_i "i", "BehaviorGenerator", 0, gi_tc_transition_duration
    
    ; Schedula il primo TransitionDecider dopo questa transizione
    ;event_i "i", "TransitionDecider", iDuration + 5, 0.1
    prints "\n========================== close Birth *INIT-PASS*\n\n"
    ;println "\n========================== close Birth *PERF-PASS*\n\n"
endin
