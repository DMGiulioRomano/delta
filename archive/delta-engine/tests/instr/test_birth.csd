<CsoundSynthesizer>
<CsOptions>
;-n 
-o "analizzatore.wav" -W
-d

</CsOptions>
<CsInstruments>
sr = 44100
ksmps= 32
nchnls = 2
0dbfs = 1
; Debug mode
gi_debug init 5
seed 0
; Include necessary UDOs and macros
#include "../../MACROS/init.orc"
#include "../../MACROS/debug.orc"
#include "../../udos/utils.udo"
#include "../../udos/GenPythagFreqs.udo"
#include "../../udos/pfield_comp.udo"
#include "../../udos/calcDurationFactor.udo"
#include "../../udos/validator.udo"
#include "../../udos/initTransitionMatrix.udo"
#include "../../udos/saveFtablesBehavior.udo"                       
#include "../../udos/determineCurrentState.udo"
#include "../../udos/tc_storeTransitionBehaviorParameters.udo"
#include "../../udos/interpolations.udo"
#include "../../udos/selectNextState.udo"

; Include the instruments we're testing
#include "../../orc/eventoSonoro.orc"                               ; instr 1
#include "../../orc/comportamento.orc"                              ; instr 2
#include "../../orc/BehaviorWrapper.orc"                            ; instr 3
#include "../../orc/Analizzatore.orc"                            ; instr 3

alwayson "timeKeeper"
alwayson "Analizzatore"

instr timeKeeper
    prints "\n========================== open timeKeeper *INIT-PASS*\n\n"
    gk_current_time times
    prints "\n========================== close timeKeeper *INIT-PASS*\n\n"
endin

instr initial
    prints "\n========================== open initial *INIT-PASS*\n\n"
    gi_compId = 0
    ipino system_i 1, "mkdir -p ./sco"
    ; Initialize generator for Pythagorean frequencies
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    prints "\n========================== close initial *INIT-PASS*\n\n"
endin


instr Birth
    prints "\n========================== open Birth *INIT-PASS*\n\n"
    ;println "\n========================== open Birth *PERF-PASS*\n\n"
    ; Debug level
    i_debug = (gi_debug == 0) ? 1 : gi_debug

    ; Inizializza sistema di transizione se necessario
    initTransitionMatrix
    ; Seleziona il primo stato attraverso la matrice di transizione
    iTargetDensity, iTargetRegister, iTargetMovement selectNextState

    ; Stampa lo stato selezionato per debug
    if (i_debug >= 1) then
        prints "Birth: Stato iniziale selezionato [%d,%d,%d]\n", 
               iTargetDensity, iTargetRegister, iTargetMovement
    endif

    ; Calcola la distanza euclidea dallo stato zero
    iDistance = sqrt((iTargetDensity^2) + (iTargetRegister^2) + (iTargetMovement^2))
    iMaxDistance = sqrt(12)  ; √(2²+2²+2²)
    iNormalizedDistance = iDistance / iMaxDistance  ; 0-1 range

    ; Calcola la durata della transizione con RELAZIONE INVERSA
    iMinDuration = 3    ; Durata minima (secondi)
    iMaxDuration = 20   ; Durata massima (secondi)
    
    ; Formula inversa: maggiore distanza = minore durata
    iDuration = iMaxDuration * (1 - iNormalizedDistance) + iMinDuration

    ; Configura la transizione iniziale
    gi_tc_source_density = 0
    gi_tc_source_register = 0
    gi_tc_source_movement = 0
    
    gi_tc_target_density = iTargetDensity
    gi_tc_target_register = iTargetRegister
    gi_tc_target_movement = iTargetMovement
    
    gi_tc_transition_active = 1
    gi_tc_transition_duration = iDuration
    gi_tc_transition_start_time times
    gi_tc_transition_progress = 0
    gi_tc_transition_mode = 1        ; Modalità graduale per l'inizio
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
    ;event_i "i", "BehaviorGenerator", 0, 0.1
    
    ; Schedula il primo TransitionDecider dopo questa transizione
    ;event_i "i", "TransitionDecider", iDuration + 5, 0.1
    prints "\n========================== close Birth *INIT-PASS*\n\n"
    ;println "\n========================== close Birth *PERF-PASS*\n\n"
endin


instr TestGenerator
    prints "\n========================== open TestGenerator *INIT-PASS*\n\n"
    i_time=0
    while i_time < p3 do
        iAtt = 2 + i_time
        iDur = max(2,60 - i_time/2)
        iRitmitable ftgen 0, 0,4 , -2, 3, 4, 5, 6
        iDurArm = max(1,20 - i_time/2)
        iAmp = -12 - i_time/4
        iOct = 8 - int(i_time/10)
        iReg = 1
        iPostable ftgen 0, 0, 4, -2, 0, 1, 2, 3
        iRhythmArr[] init ftlen(iRitmitable)
        iPosArr[] init ftlen(iPostable)
        copyf2array iRhythmArr, iRitmitable
        copyf2array iPosArr, iPostable
        iComp storeTransitionBehaviorParameters iRhythmArr, iPosArr, p2+iAtt, iDur, iDurArm, iAmp, iOct, iReg
        schedule "BehaviorWrapper", 0, 1, iComp
        i_time+=5
    od
    prints "\n========================== close TestGenerator *INIT-PASS*\n\n"
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 [2^20] 6 0 [2^19] .5 [2^19] 1
; Test each context mode sequentially
i "initial" 0 1
i "Birth" 0 1
e
i "TestGenerator" 0 60 ; Test with dense context
e 20
</CsScore>
</CsoundSynthesizer>