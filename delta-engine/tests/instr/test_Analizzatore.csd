<CsoundSynthesizer>
<CsOptions>
-n 
;-o "analizzatore.wav" -W
-d

</CsOptions>
<CsInstruments>
sr = 44100
ksmps= 32
nchnls = 2
0dbfs = 1
; Debug mode
gi_debug init 4

; Include necessary UDOs and macros
#include "../../MACROS/init.orc"
#include "../../MACROS/debug.orc"
#include "../../udos/utils.udo"
#include "../../udos/GenPythagFreqs.udo"
#include "../../udos/pfield_comp.udo"
#include "../../udos/calcDurationFactor.udo"
#include "../../udos/validator.udo"
; Include the instruments we're testing
#include "../../orc/eventoSonoro.orc"
#include "../../orc/comportamento.orc"
#include "../../orc/behaviorWrapper.orc"
#include "../../udos/saveFtablesBehavior.udo"
#include "../../udos/tc_storeTransitionBehaviorParameters.udo"
#include "../../udos/determineCurrentState.udo"

instr Analizzatore
    prints "===========================================\n"
    prints "\t\tINSTR AnalizzatoreArmonico *init-pass*\n"
    ; Ottieni tempo corrente
    kCurrentTime times
    ; Analisi della sovrapposizione di eventi - eseguita a k-rate 
    kTrig metro 10  ; 10 Hz per avere una buona risoluzione temporale
    STabArm[] = fillarray("ottava", "registro", "matrice tmp", "matrice cumulativa")
    iTabArm[] = fillarray(gi_active_octaves, gi_active_registers, gi_octave_register_matrix, gi_cumulative_octave_register_matrix)  
    kLenBigClear=lenarray(iTabArm)-1
    if kTrig == 1 then
        println "\n==========================================="
        println "\t\tINSTR AnalizzatoreArmonico *perf-pass*\n"
        println "\t\t\tfirst print inside k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime        
        ; Azzero variabile di calcolo eventi attivi in questo momento
        kActiveEventsCount = 0
        ; Azzero variabile di calcolo del movimento spaziale
        kSumInverseRhythms = 0
        ; Azzero tabelle di calcolo del tracciamento armonico
        kIdxBC = 0 ; indice di loop BigClear
        BigClear:
            kfn = iTabArm[kIdxBC]
            kLenTab = tableng(kfn)
            SfnName = STabArm[kIdxBC]
            kIdxC = 0  ; indice di loop Clear
            Clear:
                tablewkt 0, kIdxC, kfn 
            loop_lt kIdxC, 1, kLenTab, Clear  ; ripeti finché kidx < ksize 
        ;println "cleaned tab %d", kfn
            if gi_debug >= 4 then
                println "\t\tSEEING CLEAR! of tab %s --->\t(at index ... value ...)", SfnName
                printMatrixK kfn, (kIdxBC<2?1:$OTTAVE), (kIdxBC<1?$OTTAVE:$REGISTRI), SfnName, 3
                println ""
            endif
        loop_lt kIdxBC, 1, kLenBigClear, BigClear  ; ripeti finché kidx < ksize        


        ; Analisi delle tabelle di eventi
        kEventIdx = 0
        while kEventIdx < gi_Index do
            kAttackTime tab kEventIdx, gi_eve_attacco
            kDuration tab kEventIdx, gi_eve_durata
            
            ; Verifica se l'evento è attualmente attivo
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEventsCount += 1
                
                ; Raccogli il valore ritmico per il calcolo del movimento spaziale
                kRhythm tab kEventIdx, gi_eve_hr
                kSumInverseRhythms += (1/kRhythm)

                ; Identifica ottava e registro dell'evento attivo
                kBehaviorId tab kEventIdx, gi_eve_comportamento
                if kBehaviorId >= 0 && kBehaviorId < gi_NUMComportamenti then
                    k_octReg[] fillarray table(kBehaviorId, gi_comp_OTTAVA),table(kBehaviorId, gi_comp_REGISTRO)
                    println "k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
                    println "Evento %d attivo: Ottava=%d, Registro=%d", kEventIdx, k_octReg[0], k_octReg[1]

                    ; Incrementa i contatori
                    kIdxBC = 0
                    OctReg: ; aggiorna gli indici su gi_active_octaves e gi_active_registers
                        kfn = iTabArm[kIdxBC]
                        tablewkt(tablekt(k_octReg[kIdxBC], kfn) + (k_octReg[kIdxBC] >= 0 ? 1 : 0), k_octReg[kIdxBC], kfn)
                    loop_lt kIdxBC, 1, lenarray(iTabArm)-2, OctReg  
                    kIdxBC = 2
                    Matrix: ; aggiorna gli indici su gi_octave_register_matrix e su gi_cumulative_octave_register_matrix
                        kfn = iTabArm[kIdxBC]
                        kM_idx= k_octReg[0] * $REGISTRI + k_octReg[1]
                        tablewkt(tablekt(kM_idx, kfn) + ((k_octReg[0] >= 0 && k_octReg[1] >=0) ? 1 : 0), k_octReg[0] * $REGISTRI + k_octReg[1], kfn)
                    loop_lt kIdxBC, 1, lenarray(iTabArm), Matrix  
                endif
            endif
            kEventIdx += 1
        od
        
        ; Calcola metriche armoniche
        kActiveOctaves = 0
        kActiveRegisters = 0
        kWeightedOctaveSum = 0
        kTotalOctaveEvents = 0
        
        ; Conta ottave attive e calcola centroide
        kOctIdx = 0
        while kOctIdx < $OTTAVE do
            kOctCount tab kOctIdx, gi_active_octaves
            if kOctCount > 0 then
                kActiveOctaves += 1
                kWeightedOctaveSum += kOctIdx * kOctCount
                kTotalOctaveEvents += kOctCount
            endif
            kOctIdx += 1
        od
        
        ; Calcola metriche armoniche
        if kTotalOctaveEvents > 0 then
            kHarmonicDensity = kActiveOctaves / $OTTAVE
            kOctaveSpread = 1 - (kActiveOctaves / $OTTAVE)
            kSpectralCentroid = kWeightedOctaveSum / kTotalOctaveEvents
        else
            kHarmonicDensity = 0
            kOctaveSpread = 0
            kSpectralCentroid = 0
        endif

        ; Calcola il movimento spaziale medio
        kCurrentSpatialMovement = (kActiveEventsCount > 0) ? kSumInverseRhythms / kActiveEventsCount : 0

        ; Aggiorna variabili globali
        gk_current_overlap = kActiveEventsCount
        gk_current_harmonic_density = kHarmonicDensity
        gk_current_octave_spread = kOctaveSpread
        gk_current_spectral_centroid = kSpectralCentroid
        gk_current_spatial_movement = kCurrentSpatialMovement  
        
        ; Memorizza il conteggio degli eventi attivi e il timestamp
        tabw kActiveEventsCount, gk_analysis_index, gi_analysis_active_events
        tabw kCurrentTime, gk_analysis_index, gi_analysis_timepoints
        
        ; Avanzamento ciclico nell'indice della tabella
        gk_analysis_index = (gk_analysis_index + 1) % gi_analysis_buffer_size
    endif

    ; Aggiornamento memoria compositiva
    kMemTrig metro 1/gi_memory_resolution
    if kMemTrig == 1 then
        kCurrentTime timeinsts
        kMemIdx = int(kCurrentTime / gi_memory_resolution)
        
        if kMemIdx >= 0 && kMemIdx < gi_memory_size then
            tabw gk_current_overlap, kMemIdx, gi_memory_overlap
            tabw kActiveEventsCount, kMemIdx, gi_memory_events
            
            ; Memorizza anche i dati armonici
            tabw gk_current_harmonic_density, kMemIdx, gi_memory_harmonic_density
            tabw gk_current_octave_spread, kMemIdx, gi_memory_octave_spread
            tabw gk_current_spectral_centroid, kMemIdx, gi_memory_spectral_centroid
            tabw gk_current_spatial_movement, kMemIdx, gi_memory_spatial_movement  
            ; Determina lo stato corrente
            
            iDensityState, iRegisterState, iMovementState determineCurrentState 
            
            ; Aggiorna la cronologia degli stati usando il buffer circolare
            kNextIndex = (gk_state_history_index + 1) % gi_state_history_size
            
            ; Memorizza il nuovo stato nella posizione corrente del buffer
            tabw iDensityState, kNextIndex, gi_state_history_density
            tabw iRegisterState, kNextIndex, gi_state_history_register
            tabw iMovementState, kNextIndex, gi_state_history_movement
            
            ; Aggiorna l'indice globale del buffer
            gk_state_history_index = kNextIndex
            
            ; Memorizza lo stato nella cronologia temporale completa
            tabw iDensityState, kMemIdx, gi_memory_state_density
            tabw iRegisterState, kMemIdx, gi_memory_state_register
            tabw iMovementState, kMemIdx, gi_memory_state_movement
        endif
    endif

    ; Stampa info di debug (opzionale)
    kDebugTrig metro 1  ; Stampa ogni secondo
    if kDebugTrig == 1 && gi_debug >= 1 then
        kCurrentTime timeinsts
        kActiveEvents = 0

        kEventIdx = 0
        while kEventIdx < gi_Index do
            kAttackTime tab kEventIdx, gi_eve_attacco
            kDuration tab kEventIdx, gi_eve_durata
            
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEvents += 1
            endif
            
            kEventIdx += 1
        od
        
        printks "Tempo: %.2fs - Eventi attivi: %d\n", 0, kCurrentTime, kActiveEvents
    endif
endin


instr Salvatore
    saveFtablesBehavior
    saveFtablesEvents
endin

instr AnalizzatoreConteggio
    kCurrentTime times
    kTrig metro 10
    if kTrig == 1 then
        kActiveEventsCount = 0
        
        kEventIdx = 0
        while kEventIdx < gi_Index do
            kAttackTime tab kEventIdx, gi_eve_attacco
            kDuration tab kEventIdx, gi_eve_durata
            
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEventsCount += 1
            endif
            
            kEventIdx += 1
        od
        
        printks "Tempo: %.2fs - Eventi attivi: %d\n", 0, kCurrentTime, kActiveEventsCount
    endif
endin

instr initial
    prints "===========================================\n"
    prints "\t\tINSTR initial *init-pass\n"
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
    printMatrixI gi_active_octaves, 1, 10, "gi_active_octaves", 3, "\t\t\t"
    printMatrixI gi_active_registers, 1, 10, "gi_active_registers", 3, "\t\t\t"
    printMatrixI gi_octave_register_matrix, 10, 10, "gi_octave_register_matrix", 3, "\t\t\t"
    prints "\n===========================================\n\n"

endin

instr AnalizzatoreArmonico
    prints "===========================================\n"
    prints "\t\tINSTR AnalizzatoreArmonico *init-pass*\n"
    kTrig metro 10
    kCurrentTime times
    SArr[] = fillarray("ottava", "registro", "matrice tmp", "matrice cumulativa")
    iArr[] = fillarray(gi_active_octaves, gi_active_registers, gi_octave_register_matrix, gi_cumulative_octave_register_matrix)  
    kLenBigClear=lenarray(iArr)-1
    if kTrig == 1 then
        println "\n==========================================="
        println "\t\tINSTR AnalizzatoreArmonico *perf-pass*\n"
        println "\tfirst print inside k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
        kIdxBC = 0
        BigClear:
            kfn = iArr[kIdxBC]
            kLenTab = tableng(kfn)
            SfnName = SArr[kIdxBC]
            kIdxC = 0         ; indice di loop a k-rate
            Clear:
                tablewkt 0, kIdxC, kfn 
            loop_lt kIdxC, 1, kLenTab, Clear  ; ripeti finché kidx < ksize 
            kIdxC = 0         ; indice di loop a k-rate
        ;println "cleaned tab %d", kfn
            println "\t\tSEEING CLEAR! of tab %s --->\t(at index ... value ...)", SfnName
            printMatrixK kfn, (kIdxBC<2?1:10), 10, SfnName, 3
            println ""
        loop_lt kIdxBC, 1, kLenBigClear, BigClear  ; ripeti finché kidx < ksize        

        kEventIdx = 0
        while kEventIdx < gi_Index do
            kAttackTime tab kEventIdx, gi_eve_attacco
            kDuration tab kEventIdx, gi_eve_durata
            println "mid k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
            ; Verifica se l'evento è attualmente attivo
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                ; Identifica ottava e registro dell'evento attivo
                kBehaviorId tab kEventIdx, gi_eve_comportamento
                if kBehaviorId >= 0 && kBehaviorId < gi_NUMComportamenti then
                    k_octReg[] fillarray table(kBehaviorId, gi_comp_OTTAVA),table(kBehaviorId, gi_comp_REGISTRO)
                    ; Stampa per debug
                    ;printks "Evento %d attivo: Ottava=%d, Registro=%d\n", 0, kEventIdx, kOctave, kRegister
                    println "k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
                    println "Evento %d attivo: Ottava=%d, Registro=%d", kEventIdx, k_octReg[0], k_octReg[1]
                    ; Incrementa i contatori
                    kIdxBC = 0
                    OctReg: ; aggiorna gli indici su gi_active_octaves e gi_active_registers
                        kfn = iArr[kIdxBC]
                        tablewkt(tablekt(k_octReg[kIdxBC], kfn) + (k_octReg[kIdxBC] >= 0 ? 1 : 0), k_octReg[kIdxBC], kfn)
                    loop_lt kIdxBC, 1, lenarray(iArr)-2, OctReg  
                    kIdxBC = 2
                    Matrix: ; aggiorna gli indici su gi_octave_register_matrix e su gi_cumulative_octave_register_matrix
                        kfn = iArr[kIdxBC]
                        kM_idx= k_octReg[0] * $REGISTRI + k_octReg[1]
                        tablewkt(tablekt(kM_idx, kfn) + ((k_octReg[0] >= 0 && k_octReg[1] >=0) ? 1 : 0), k_octReg[0] * $REGISTRI + k_octReg[1], kfn)
                    loop_lt kIdxBC, 1, lenarray(iArr), Matrix  
                endif
            endif
            kEventIdx += 1
        od

        kIdxBC = 0
        PrintMatrix:
            println "\t\tSEEING WRITE! of tab %s --->\t(at index ... value ...)", SfnName
            kfn = iArr[kIdxBC]
            SfnName = SArr[kIdxBC] 
            printMatrixK kfn, (kIdxBC<2?1:10), 10, SfnName, 3
        loop_lt kIdxBC, 1, lenarray(iArr), PrintMatrix 

    endif
    
    prints "\n===========================================\n\n"
endin


instr TestGenerator
    prints "===========================================\n"
    prints "\t\tINSTR TestGenerator *init-pass*\n"
    i_time=0
    while i_time < p3 do
        iAtt = 2 + i_time
        iDur = 60 - i_time/2
        iRitmitable ftgen 0, 0,4 , -2, 3, 4, 5, 6
        iDurArm = 20 - i_time/2
        iAmp = -12 - i_time/4
        iOct = 9 - int(i_time/10)
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
    prints "\n===========================================\n"
endin

instr Curiosone
    prints "la matrice cumulativaaaa (da leggere cantando)\n"
    ftprint gi_cumulative_octave_register_matrix
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 [2^20] 6 0 [2^19] .5 [2^19] 1
; Test each context mode sequentially
i "initial" 0 1

i "TestGenerator" 0 5 ; Test with dense context
;i "AnalizzatoreConteggio" 0 60
i "AnalizzatoreArmonico" 0 60
;i "Salvatore" 60 1
i "Curiosone" 60 2
e

i "TestGenerator" 60 60 ; Test with sparse context
i "TestGenerator" 120 60 ; Test with fluctuating context
e 20
</CsScore>
</CsoundSynthesizer>