<CsoundSynthesizer>
<CsOptions>
;-n 
-o "behaviorGenerator.wav" -W
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
#include "../../udos/tc_interpolateParameter.udo"
#include "../../udos/tc_storeTransitionBehaviorParameters.udo"
#include "../../udos/parameterInterpolation.udo"
#include "../../udos/tc_generateTransitionBehavior.udo"

#include "../../udos/interpolations.udo"
#include "../../udos/selectNextState.udo"
#include "../../udos/instantiateState.udo"

; Include the instruments we're testing
#include "../../orc/eventoSonoro.orc"                               ; instr 1
#include "../../orc/comportamento.orc"                              ; instr 2
#include "../../orc/BehaviorWrapper.orc"                            ; instr 3
#include "../../orc/Analizzatore.orc"                            ; instr 3
#include "../../orc/Birth.orc"

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


instr BehaviorGenerator
    prints "\n========================== open BehaviorGenerator *INIT-PASS*\n\n"
    k_tc_debug = 6;gi_debug
    idur = p3
    kTrig metro 10
    ; Check if transition is active
    if kTrig == 1 then
        println "\n========================== open BehaviorGenerator *PERF-PASS*\n\n"
        println "\t\tk-cycle: %d and a-cycle: %d at abs time: %f\n", gk_current_time*kr, gk_current_time*sr, gk_current_time
        println "\t\tnext_behavior_time=%.2f, active=%d\n", 
            gk_tc_next_behavior_time, gk_tc_transition_active
        if (gk_tc_transition_active == 0) then
            turnoff
        endif
        ; Calculate current transition progress
        k_elapsed_time = gk_current_time - gi_tc_transition_start_time
        k_progress = k_elapsed_time / gi_tc_transition_duration
        gk_tc_transition_progress = k_progress
        if k_tc_debug >= 6 then
            println "\t\tgi_tc_transition_duration %f\n\t\tk_elapsed_time %f\n\t\tk_progress %f\n\t\tgk_tc_transition_progress %f",
                gi_tc_transition_duration, k_elapsed_time, k_progress, gk_tc_transition_progress
        endif

        ; Real-time transition adjustment
        if (gk_tc_transition_active == 1) then
            ; Get current progress percentage (0-99)
            kProgressIndex = limit(int(k_progress * 100), 0, 99)
            println "kProgressIndex %f", kProgressIndex
            ; Get expected state at this point in the transition
            kExpectedDensity = tab(kProgressIndex, gi_tc_expected_state_density)
            kExpectedRegister = tab(kProgressIndex, gi_tc_expected_state_register)
            kExpectedMovement = tab(kProgressIndex, gi_tc_expected_state_movement) 
            ; Calculate deviation
            kDensityDeviation = abs(gk_tc_current_density - kExpectedDensity)
            kRegisterDeviation = abs(gk_tc_current_register - kExpectedRegister)
            kMovementDeviation = abs(gk_tc_current_movement - kExpectedMovement)

            kMaxDeviation = max(kDensityDeviation, max(kRegisterDeviation, kMovementDeviation))

            if (k_progress >= 0.15 && k_elapsed_time >= gi_tc_last_adjustment_time + 5 && kMaxDeviation >= 1) then
                ; in generale c'è il problema che gk_tc_current_* è un int discreto mentre kExpected* 
                ; si basa sui valori dell'interpolazione cubica. bisogna trovare un modo per descrivere
                ; in maniera interpolata la transizione.

                ; Adattamento della densità (se necessario)
                ; da fare
                ; Adattamento del registro (se necessario)
                ; da fare 
                ; Adattamento del movimento (se necessario)
                ; da fare
            endif

; parte non funzionante
            ; Check if it's time to generate a new behavior
            if (gk_current_time >= gk_tc_next_behavior_time) then
                ; Generate interpolated parameters based on transition progress
                println "\t\t\t\tk_progress %f",k_progress
                generateTransitionBehavior k_progress
/*                
                ; Calculate time for next behavior
                k_behavior_interval interpolateBehaviorTiming k_progress
                gk_tc_next_behavior_time = k_progress + k_behavior_interval
*/                
                if (k_tc_debug >= 2) then
                    println "\t\t\t\tGenerated behavior at time %.3f (progress: %.2f)\n", 
                        gk_current_time, k_progress
                    ;prints "\t\t\t\tNext behavior scheduled at +%.1f seconds\n", k_behavior_interval
                endif
            endif

        endif

        println "\n========================== close BehaviorGenerator *PERF-PASS*\n\n"
    endif
    prints "\n========================== close BehaviorGenerator *INIT-PASS*\n\n"
endin

; -----------------------------------------------------------------------
; BEHAVIOR GENERATOR - Creates and schedules new behaviors during transitions
; -----------------------------------------------------------------------
/*instr BehaviorGenerator
    prints "\n========================== open BehaviorGenerator *INIT-PASS*\n\n"
    i_tc_debug = gi_debug
    idur = p3
    kTrig metro 10
    println "BehaviorGenerator: time=%.2f, next_time=%.2f, active=%d\n", 
       gk_current_time, gi_tc_next_behavior_time, gi_tc_transition_active
    ; Check if transition is active
    if (gi_tc_transition_active == 0) then
        turnoff
    endif
    ; Calculate current transition progress
    i_elapsed_time = i_current_time - gi_tc_transition_start_time
    i_progress = i_elapsed_time / gi_tc_transition_duration
    gi_tc_transition_progress = i_progress
    
    ; If transition is complete, finalize
    if (i_progress >= 1.0) then
        ; Transition complete - update state and reset
        gi_tc_current_density = gi_tc_target_density
        gi_tc_current_register = gi_tc_target_register
        gi_tc_current_movement = gi_tc_target_movement
        
        ; Calculate state indices for recording
        iSourceStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
        iTargetStateIdx = (gi_tc_target_density * 9) + (gi_tc_target_register * 3) + gi_tc_target_movement
        
        ; Assess transition quality
        iTransitionQuality assessTransitionQuality 
        
        ; Record this transition for adaptive learning
        recordTransition iSourceStateIdx, iTargetStateIdx, iTransitionQuality
        
        ; Update controller state
        gi_tc_transition_active = 0
        gi_tc_last_stable_time = i_current_time
        
        ; Save transition matrix periodically
        if (gi_tc_transition_count % 5 == 0) then
            iMatrixSaveTime = i_current_time + 0.1
            prints "Scheduling transition matrix save at time %.1f\n", iMatrixSaveTime
            schedule "EnhancedSaveTransitionMatrix", iMatrixSaveTime, 1
        endif
        gi_tc_transition_count += 1
        
        ; Adapt transition parameters based on quality
        adaptTransitionParameters(iTransitionQuality)
        
        if (i_tc_debug >= 1) then
            prints "TransitionController: TRANSITION COMPLETE at time %.1f\n", i_current_time
            prints "  Reached target state [%d,%d,%d] with quality %.2f\n", 
                   gi_tc_current_density, gi_tc_current_register, gi_tc_current_movement,
                   iTransitionQuality
        endif
        
        turnoff
    endif

    ; Real-time transition adjustment
    if (gi_tc_transition_active == 1) then
        ; Only consider adjusting if we're in an active transition
        
        ; Get current progress percentage (0-99)
        iProgressIndex = limit(int(i_progress * 100), 0, 99)
        
        ; Get current state from global variables (already populated by Analizzatore)
        iCurrentDensityState = gi_tc_current_density  ; Use current tracked state
        
        ; Get expected state at this point in the transition
        iExpectedDensity = tab_i(iProgressIndex, gi_tc_expected_state_density)
        
        ; Calculate deviation
        iDeviation = abs(iCurrentDensityState - iExpectedDensity)
        
        ; Only make adjustments if:
        ; 1. We've progressed at least 15% into the transition
        ; 2. We have a significant deviation
        ; 3. We haven't already made an adjustment recently
        if (i_progress >= 0.15 && iDeviation >= 1 && i_elapsed_time >= gi_tc_last_adjustment_time + 5) then
            
            ; Determine adjustment direction
            if (iCurrentDensityState < iExpectedDensity) then
                ; We're not dense enough
                iNewTargetDensity = min(2, gi_tc_target_density + 1)
                
                ; Only apply if this is actually a change
                if (iNewTargetDensity != gi_tc_target_density) then
                    gi_tc_target_density = iNewTargetDensity
                    gi_tc_last_adjustment_time = i_elapsed_time
                    
                    if (gi_debug >= 1) then
                        prints "TRANSITION ADJUSTMENT: Increasing target density to %d (at %.1f sec)\n", 
                            gi_tc_target_density, i_elapsed_time
                    endif
                endif
            elseif (iCurrentDensityState > iExpectedDensity) then
                ; We're too dense
                iNewTargetDensity = max(0, gi_tc_target_density - 1)
                
                ; Only apply if this is actually a change
                if (iNewTargetDensity != gi_tc_target_density) then
                    gi_tc_target_density = iNewTargetDensity
                    gi_tc_last_adjustment_time = i_elapsed_time
                    
                    if (gi_debug >= 1) then
                        prints "TRANSITION ADJUSTMENT: Decreasing target density to %d (at %.1f sec)\n", 
                            gi_tc_target_density, i_elapsed_time
                    endif
                endif
            endif
            
            ; After adjustment, regenerate expected state progression
            if (gi_tc_last_adjustment_time == i_elapsed_time) then
                ; Update expected state tables with new target
                iIdx = 0
                while (iIdx < 100) do
                    iPoint = iIdx * 0.01  ; 0.00 to 0.99
                    
                    ; Only update remaining points (from current progress forward)
                    if (iPoint >= i_progress) then
                        ; Recalculate expected density with new target
                        iExpDensity cubicInterpolate gi_tc_source_density, gi_tc_target_density, 
                                                (iPoint - i_progress) / (1 - i_progress)
                        tabw_i iExpDensity, iIdx, gi_tc_expected_state_density
                    endif
                    
                    iIdx += 1
                od
            endif
        endif
    endif

    ; Check if it's time to generate a new behavior
    if (i_current_time >= gi_tc_next_behavior_time) then
        ; Generate interpolated parameters based on transition progress
        print i_progress
        prints "\n\n\n\n\n"
        generateTransitionBehavior i_progress
        
        ; Calculate time for next behavior
        i_behavior_interval interpolateBehaviorTiming i_progress
        gi_tc_next_behavior_time = i_current_time + i_behavior_interval
        
        if (i_tc_debug >= 2) then
            prints "BehaviorGenerator: Generated behavior at time %.1f (progress: %.2f)\n", 
                   i_current_time, i_progress
            prints "  Next behavior scheduled at +%.1f seconds\n", i_behavior_interval
        endif
    endif
    
    ; Schedule self to run again soon
    event_i "i", "BehaviorGenerator", 1, 0.1
    prints "\n========================== open BehaviorGenerator *INIT-PASS*\n\n"

endin
*/

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
e 100
i "TestGenerator" 0 60 ; Test with dense context
e 20
</CsScore>
</CsoundSynthesizer>