instr Analizzatore
    prints "\n========================== open instr Analizzatore *INIT-PASS*\n"
    kTrig metro 10
    SArr[] = fillarray("matrice tmp", "matrice cumulativa")
    iArr[] = fillarray(gi_octave_register_matrix, gi_cumulative_octave_register_matrix)  
    kLenBigClear=lenarray(iArr)-1
    if kTrig == 1 then
        printsk "\n========================== open instr Analizzatore if Speedy *PERF-PASS*\n"
        println "\t\tk-cycle: %d and a-cycle: %d at abs time: %f\n", gk_current_time*kr, gk_current_time*sr, gk_current_time
        ; Calcolo eventi attivi in questo momento
        kActiveCompsCount = 0
        ; Calcolo del movimento spaziale
        kSumInverseRhythms = 0
        kActiveEventsCount = 0
        if gi_debug >= 10 then 
            PrintOctReg2x2, "\t\t\t"
        endif
        println ""
        kIdxBC = 0
        println(gi_debug >= 10?"\t\tSEEING CLEAR! on tabs \n":"")
        BigClear:
            kfn = iArr[kIdxBC]
            kLenTab = tableng(kfn)
            SfnName = SArr[kIdxBC]
            kIdxC = 0         ; indice di loop a k-rate
            Clear:
                tablewkt 0, kIdxC, kfn 
            loop_lt kIdxC, 1, kLenTab, Clear  ; ripeti finché kidx < ksize 
            if gi_debug >= 10 then 
                printMatrixK kfn, $OTTAVE, $REGISTRI, SfnName, 3, "\t\t\t"
                println ""
            endif
        loop_lt kIdxBC, 1, kLenBigClear, BigClear  ; ripeti finché kidx < ksize        
        kCompIdx = 1

        while kCompIdx < gi_compId do
            kAttackTime tab kCompIdx, gi_comp_ATTACCO
            kDuration tab kCompIdx, gi_comp_DURATA

            if kAttackTime <= gk_current_time && kAttackTime + kDuration >= gk_current_time then
                kActiveCompsCount += 1
                k_octReg[] fillarray table(kCompIdx, gi_comp_OTTAVA),table(kCompIdx, gi_comp_REGISTRO)
                kIdxBC = 0
                Matrix: ; aggiorna gli indici su gi_octave_register_matrix e su gi_cumulative_octave_register_matrix
                    kfn = iArr[kIdxBC]
                    kM_idx= k_octReg[0] * $REGISTRI + k_octReg[1]
                    tablewkt(tablekt(kM_idx, kfn) + ((k_octReg[0] >= 0 && k_octReg[1] >=0) ? 1 : 0), k_octReg[0] * $REGISTRI + k_octReg[1], kfn)
                loop_lt kIdxBC, 1, lenarray(iArr), Matrix
                iTmpTable findIndices gi_eve_comportamento, kCompIdx
                k_iter = 0
                while k_iter < ftlen(iTmpTable) do 
                    kTrueIndex = tablekt:k(k_iter,iTmpTable)
                    if kTrueIndex > 0 then
                        kAttackTimeEve =tab:k(kTrueIndex, gi_eve_attacco)
                        kDurationEve = tab:k(kTrueIndex, gi_eve_durata)
                        if kAttackTimeEve <= gk_current_time && kAttackTimeEve + kDurationEve >= gk_current_time then
                            println "kAttackTimeEve %d kDurationEve %d", kAttackTimeEve, kDurationEve
                            kActiveEventsCount+=1
                            kSumInverseRhythms+= 1/(tab:k(kTrueIndex, gi_eve_hr))
                        endif
                    endif
                    k_iter+=1
                od

            endif
            kCompIdx+=1
        od
        kIdxBC = 0
        println(gi_debug >= 10?"\t\tSEEING WRITE on tabs!\n":"")
        PrintMatrix:
            kfn = iArr[kIdxBC]
            SfnName strcpyk SArr[kIdxBC] 
            if gi_debug >= 10 then 
                printMatrixK kfn, $OTTAVE, $REGISTRI, SfnName, 3, "\t\t\t"
            endif
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
            if gi_debug >=6 then
                println "\t\t\tkRegIdx:%d \tkOctIdx:%d\tkOctHasActivity: %d\tkActiveRegisters: %d",kRegIdx,kOctIdx,kOctHasActivity, kActiveRegisters
            endif
            od
            kActiveOctaves += kOctHasActivity
            kOctIdx += 1
        od
        if gi_debug >=6 then
            println "\t\t last kRegIdx:%d \tkOctIdx:%d\tkOctHasActivity: %d\tkActiveRegisters: %d",kRegIdx,kOctIdx,kOctHasActivity, kActiveRegisters
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
        println(gi_debug >= 6?"\t\tSEEING HARMONIC METRICS!\n":"")
        if gi_debug >= 6 then
            println "%skHarmonicDensity: %f\n%skOctaveSpread:%f\n%skSpectralCentroid:%f",Sspace,kHarmonicDensity,Sspace,kOctaveSpread,Sspace,kSpectralCentroid
        endif
        ; Calcola il movimento spaziale medio
        kCurrentSpatialMovement = (kActiveCompsCount > 0) ? kSumInverseRhythms / kActiveEventsCount : 0

        ; Aggiorna variabili globali
        gk_current_overlap = kActiveCompsCount
        gk_current_harmonic_density = kHarmonicDensity
        gk_current_octave_spread = kOctaveSpread
        gk_current_spectral_centroid = kSpectralCentroid
        gk_current_spatial_movement = kCurrentSpatialMovement  
        ; Memorizza il conteggio degli eventi attivi e il timestamp
        tabw gk_current_time, gk_analysis_index, gi_analysis_timepoints

        kDensityState, kRegisterState, kMovementState determineCurrentState 

        gk_tc_current_density = kDensityState
        gk_tc_current_register = kRegisterState
        gk_tc_current_movement = kMovementState

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
        println "\t\tk-cycle: %d and a-cycle: %d at abs time: %f\n", gk_current_time*kr, gk_current_time*sr, gk_current_time

        kMemIdx = int(gk_current_time / gi_memory_resolution)
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
            STATE_MEM_2CSV gk_current_time            
        endif
        printsk "\n========================== close instr Analizzatore if MemRes *PERF-PASS*\n"
    endif


    prints "\n========================== close instr Analizzatore *INIT-PASS*\n\n\n"
endin
