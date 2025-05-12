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

; Include necessary UDOs and macros
#include "../../MACROS/init.orc"
#include "../../MACROS/debug.orc"
#include "../../udos/utils.udo"
#include "../../udos/GenPythagFreqs.udo"
#include "../../udos/pfield_comp.udo"
#include "../../udos/calcDurationFactor.udo"
#include "../../udos/validator.udo"
#include "../../udos/initTransitionMatrix.udo"
; Include the instruments we're testing
#include "../../orc/eventoSonoro.orc"                               ; instr 1
#include "../../orc/comportamento.orc"                              ; instr 2
#include "../../orc/behaviorWrapper.orc"                            ; instr 3
#include "../../udos/saveFtablesBehavior.udo"                       
#include "../../udos/tc_storeTransitionBehaviorParameters.udo"
#include "../../udos/determineCurrentState.udo"

alwayson "Analizzatore"

instr initial
    prints "\n========================== open initial *INIT-PASS*\n\n"
    gi_compId = 0
    ipino system_i 1, "mkdir -p ./sco"
    ; Initialize generator for Pythagorean frequencies
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 1 then
        prints "\t- GenPythagFreqs: Success!\n"
    else
        prints "x GenPythagFreqs failed: %d\n", i_Res
        turnoff
    endif
    icnt=0
    while icnt < ftlen(gi_active_octaves) do
        tabw_i random(1,10), icnt, gi_active_octaves
        icnt+=1
    od
    icnt=0
    while icnt < ftlen(gi_active_registers) do
        tabw_i random(1,10), icnt, gi_active_registers
        icnt+=1
    od
    icnt=0
    while icnt < ftlen(gi_octave_register_matrix) do
        tabw_i random(1,10), icnt, gi_octave_register_matrix
        icnt+=1
    od
    prints "\n\t[let's observe the tables at init-pass]\n\n"
    printMatrixI gi_active_octaves, 1, 10, "gi_active_octaves", 3, "\t\t"
    printMatrixI gi_active_registers, 1, 10, "gi_active_registers", 3, "\t\t"
    printMatrixI gi_octave_register_matrix, 10, 10, "gi_octave_register_matrix", 3, "\t\t"
    prints "\n========================== close initial *INIT-PASS*\n\n"
    initTransitionMatrix
endin


instr Analizzatore
    prints "\n========================== open instr Analizzatore *INIT-PASS*\n"
    kTrig metro 5
    kCurrentTime times
    SArr[] = fillarray("matrice tmp", "matrice cumulativa")
    iArr[] = fillarray(gi_octave_register_matrix, gi_cumulative_octave_register_matrix)  
    kLenBigClear=lenarray(iArr)-1
    if kTrig == 1 then
        printsk "\n========================== open instr Analizzatore if Speedy *PERF-PASS*\n"
        println "\t\tk-cycle: %d and a-cycle: %d at abs time: %f\n", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
        ; Calcolo eventi attivi in questo momento
        kActiveCompsCount = 0
        ; Calcolo del movimento spaziale
        kSumInverseRhythms = 0

        PrintOctReg2x2, "\t\t\t"
        println ""
        kIdxBC = 0
        println "\t\tSEEING CLEAR! on tabs \n"
        BigClear:
            kfn = iArr[kIdxBC]
            kLenTab = tableng(kfn)
            SfnName = SArr[kIdxBC]
            kIdxC = 0         ; indice di loop a k-rate
            Clear:
                tablewkt 0, kIdxC, kfn 
            loop_lt kIdxC, 1, kLenTab, Clear  ; ripeti finché kidx < ksize 
            printMatrixK kfn, $OTTAVE, $REGISTRI, SfnName, 3, "\t\t\t"
            println ""
        loop_lt kIdxBC, 1, kLenBigClear, BigClear  ; ripeti finché kidx < ksize        
        kCompIdx = 0

        while kCompIdx < gi_compId do
            kAttackTime tab kCompIdx, gi_comp_ATTACCO
            kDuration tab kCompIdx, gi_comp_DURATA
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveCompsCount += 1
                k_octReg[] fillarray table(kCompIdx, gi_comp_OTTAVA),table(kCompIdx, gi_comp_REGISTRO)
                kIdxBC = 0
                Matrix: ; aggiorna gli indici su gi_octave_register_matrix e su gi_cumulative_octave_register_matrix
                    kfn = iArr[kIdxBC]
                    kM_idx= k_octReg[0] * $REGISTRI + k_octReg[1]
                    tablewkt(tablekt(kM_idx, kfn) + ((k_octReg[0] >= 0 && k_octReg[1] >=0) ? 1 : 0), k_octReg[0] * $REGISTRI + k_octReg[1], kfn)
                loop_lt kIdxBC, 1, lenarray(iArr), Matrix  
            endif
            kCompIdx+=1
        od
        kIdxBC = 0
        println "\t\tSEEING WRITE on tabs!\n"
        PrintMatrix:
            kfn = iArr[kIdxBC]
            SfnName strcpyk SArr[kIdxBC] 
            printMatrixK kfn, $OTTAVE, $REGISTRI, SfnName, 3, "\t\t\t"
        loop_lt kIdxBC, 1, lenarray(iArr), PrintMatrix 

        ; Inizializza variabili di conteggio e somma pesata
        kActiveOctaves        = 0    ; quante ottave hanno almeno un evento
        kActiveRegisters      = 0    ; conteggio totale di celle (ottava×registro) attive
        kWeightedRegisterSum  = 0    ; somma pesata degli indici ottava×registro per il centroide
        kTotalRegisterComp  = 0    ; somma di tutti gli eventi (valori) nella matrice

        kOctIdx = 0
        while kOctIdx < $OTTAVE do
            kOctHasActivity = 0
            kRegIdx = 0
            while kRegIdx < $REGISTRI do
                kVal tab (kOctIdx * $REGISTRI + kRegIdx), gi_octave_register_matrix
                if kVal > 0 then
                    kActiveRegisters += 1
                    kWeightedRegisterSum += (kOctIdx * $REGISTRI + kRegIdx) * kVal
                    kTotalRegisterComp += kVal
                    kOctHasActivity = 1
                endif
                kRegIdx += 1
            if gi_debug >=5 then
                println "\t\t\tkRegIdx:%d \tkOctIdx:%d\tkOctHasActivity: %d\tkActiveRegisters: %d",kRegIdx,kOctIdx,kOctHasActivity, kActiveRegisters
            endif
            od
            kActiveOctaves += kOctHasActivity
            kOctIdx += 1
        od
        if gi_debug >=5 then
            println "\t\tkRegIdx:%d \tkOctIdx:%d\tkOctHasActivity: %d\tkActiveRegisters: %d",kRegIdx,kOctIdx,kOctHasActivity, kActiveRegisters
        endif

        if kTotalRegisterComp > 0 then
            kHarmonicDensity = kActiveRegisters / ($OTTAVE * $REGISTRI)
            kOctaveSpread = 1 - (kActiveOctaves / $OTTAVE)
            kSpectralCentroid = (kWeightedRegisterSum / kTotalRegisterComp)/($OTTAVE*$REGISTRI)
        else
            kHarmonicDensity = 0
            kOctaveSpread = 0
            kSpectralCentroid = 0
        endif
        Sspace = "\t\t"
        println "\t\tSEEING HARMONIC METRICS!\n"
        println "%skHarmonicDensity: %f\n%skOctaveSpread:%f\n%skSpectralCentroid:%f",Sspace,kHarmonicDensity,Sspace,kOctaveSpread,Sspace,kSpectralCentroid

        ; Calcola il movimento spaziale medio
        kCurrentSpatialMovement = (kActiveCompsCount > 0) ? kSumInverseRhythms / kActiveCompsCount : 0

        ; Aggiorna variabili globali
        gk_current_overlap = kActiveCompsCount
        gk_current_harmonic_density = kHarmonicDensity
        gk_current_octave_spread = kOctaveSpread
        gk_current_spectral_centroid = kSpectralCentroid
        gk_current_spatial_movement = kCurrentSpatialMovement  
        ; Memorizza il conteggio degli eventi attivi e il timestamp
        tabw kCurrentTime, gk_analysis_index, gi_analysis_timepoints
        
        printks2 "\t\tgi_analysis_timepoints: %f\n", tab:k(gk_analysis_index,gi_analysis_timepoints)
        printks2 "\t\tgk_current_overlap: %f\n", gk_current_overlap
        printks2 "\t\tgk_current_harmonic_density: %f\n", gk_current_harmonic_density
        printks2 "\t\tgk_current_octave_spread: %f\n", gk_current_octave_spread
        printks2 "\t\tgk_current_spectral_centroid: %f\n", gk_current_spectral_centroid
        printks2 "\t\tgk_current_spatial_movement: %f\n", gk_current_spatial_movement
        CURR2CSV
        ; Avanzamento ciclico nell'indice della tabella
        gk_analysis_index = (gk_analysis_index + 1) % gi_analysis_buffer_size
        printsk "\n========================== close instr Analizzatore if Speedy*PERF-PASS*\n\n\n"
    endif

    ; Aggiornamento memoria compositiva
    kMemTrig metro 1/gi_memory_resolution
    if kMemTrig == 1 then
        printsk "\n========================== open instr Analizzatore if MemRes *PERF-PASS*\n"
        println "\t\tk-cycle: %d and a-cycle: %d at abs time: %f\n", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime

        kMemIdx = int(kCurrentTime / gi_memory_resolution)
        if kMemIdx < gi_memory_size then
            tabw gk_current_overlap, kMemIdx, gi_memory_overlap            
            tabw gk_current_harmonic_density, kMemIdx, gi_memory_harmonic_density
            tabw gk_current_octave_spread, kMemIdx, gi_memory_octave_spread
            tabw gk_current_spectral_centroid, kMemIdx, gi_memory_spectral_centroid
            tabw gk_current_spatial_movement, kMemIdx, gi_memory_spatial_movement  
            ; Determina lo stato corrente
            printks2 "\t\t\tkMemIdx: %f\n",kMemIdx
            printks2 "\t\t\tgi_memory_overlap: %f\n", tab:k(kMemIdx,gi_memory_overlap)
            printks2 "\t\t\tgi_memory_harmonic_density: %f\n",  tab:k(kMemIdx,gi_memory_harmonic_density)
            printks2 "\t\t\tgi_memory_octave_spread: %f\n",  tab:k(kMemIdx,gi_memory_octave_spread)
            printks2 "\t\t\tgi_memory_spectral_centroid: %f\n",  tab:k(kMemIdx,gi_memory_spectral_centroid)
            printks2 "\t\t\tgi_memory_spatial_movement: %f\n",  tab:k(kMemIdx,gi_memory_spatial_movement)
            
            kDensityState, kRegisterState, kMovementState determineCurrentState 
            
            ; Questi qui sotto servono per :
            ; - Fornire accesso rapido agli stati recenti per rilevare pattern a breve termine
            ; - Permettere al sistema di rilevare e reagire a comportamenti ciclici o ripetitivi 
            ; - Consentire decisioni basate sulla "storia recente" senza dover analizzare l'intera cronologia
            ; Aggiorna la cronologia degli stati usando il buffer circolare
            kNextIndex = (gk_state_history_index + 1) % gi_state_history_size
            ; Memorizza il nuovo stato nella posizione corrente del buffer
            tabw kDensityState, kNextIndex, gi_state_history_density
            tabw kRegisterState, kNextIndex, gi_state_history_register
            tabw kMovementState, kNextIndex, gi_state_history_movement
            ; Aggiorna l'indice globale del buffer
            gk_state_history_index = kNextIndex
            ; Memorizza lo stato nella cronologia temporale completa
            tabw kDensityState, kMemIdx, gi_memory_state_density
            tabw kRegisterState, kMemIdx, gi_memory_state_register
            tabw kMovementState, kMemIdx, gi_memory_state_movement
            println "\t\t\tSTATE INSIDE MEMRES"
            println "\t\t\tkDensityState: %d",kDensityState
            println "\t\t\tkRegisterState: %d",kRegisterState
            println "\t\t\tkMovementState: %d",kMovementState
            STATE_MEM_2CSV kCurrentTime            
        endif
        printsk "\n========================== close instr Analizzatore if MemRes *PERF-PASS*\n"
    endif


    prints "\n========================== close instr Analizzatore *INIT-PASS*\n\n\n"
endin



instr CurrentGlobalVariables
    kpino metro 10
    if kpino == 1 then
    prints "\n========================== open CurrentGlobalVariables *INIT-PASS*\n\n"
    printsk "\n========================== open CurrentGlobalVariables *PERF-PASS*\n"
    printks2 "\t\tgk_current_harmonic_density: %f\n", gk_current_harmonic_density
    printks2 "\t\tgk_current_octave_spread: %f\n", gk_current_octave_spread
    printks2 "\t\tgk_current_spectral_centroid: %f\n", gk_current_spectral_centroid
    printks2 "\t\tgk_current_spatial_movement: %f\n", gk_current_spatial_movement
    printsk "\n========================== close CurrentGlobalVariables *PERF-PASS*\n\n\n"
    endif
    prints "\n========================== close CurrentGlobalVariables *INIT-PASS*\n\n\n"

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

i "TestGenerator" 0 60 ; Test with dense context
;i "AnalizzatoreConteggio" 0 60

;i "Salvatore" 60 1
i "CurrentGlobalVariables" 0 120
i "Curiosone" 130 1
e


i "TestGenerator" 60 60 ; Test with sparse context
i "TestGenerator" 120 60 ; Test with fluctuating context
e 20
</CsScore>
</CsoundSynthesizer>