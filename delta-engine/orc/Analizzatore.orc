
instr Analizzatore
    ; Analisi della sovrapposizione di eventi - eseguita a k-rate 
    kTrig metro 10  ; 10 Hz per avere una buona risoluzione temporale
    if kTrig == 1 then
        ; Ottieni tempo corrente
        kCurrentTime timeinsts
        
        ; Calcolo eventi attivi in questo momento
        kActiveEventsCount = 0

        ; Calcolo del movimento spaziale
        kSumInverseRhythms = 0

        ; Reset dei contatori armonici
        kOctIdx = 0
        while kOctIdx < $OTTAVE do
            tabw 0, kOctIdx, gi_active_octaves
            kOctIdx += 1
        od
        
        kRegIdx = 0
        while kRegIdx < $REGISTRI do
            tabw 0, kRegIdx, gi_active_registers
            kRegIdx += 1
        od
        
        kMatrixIdx = 0
        while kMatrixIdx < ($OTTAVE * $REGISTRI) do
            tabw 0, kMatrixIdx, gi_octave_register_matrix
            kMatrixIdx += 1
        od
        
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
                    kOctave tab kBehaviorId, gi_comp_OTTAVA
                    kRegister tab kBehaviorId, gi_comp_REGISTRO
                    
                    ; Incrementa i contatori
                    if kOctave >= 0 && kOctave < $OTTAVE then
                        kOctCount tab kOctave, gi_active_octaves
                        tabw kOctCount + 1, kOctave, gi_active_octaves
                    endif
                    
                    if kRegister >= 0 && kRegister < $REGISTRI then
                        kRegCount tab kRegister, gi_active_registers
                        tabw kRegCount + 1, kRegister, gi_active_registers
                    endif
                    
                    ; Incrementa la matrice ottava/registro
                    kMatrixIdx = kOctave * $REGISTRI + kRegister
                    if kMatrixIdx >= 0 && kMatrixIdx < ($OTTAVE * $REGISTRI) then
                        kMatrixVal tab kMatrixIdx, gi_octave_register_matrix
                        tabw kMatrixVal + 1, kMatrixIdx, gi_octave_register_matrix
                        ; Aggiorna anche la matrice cumulativa
                        kCumulativeVal tab kMatrixIdx, gi_cumulative_octave_register_matrix
                        tabw kCumulativeVal + 1, kMatrixIdx, gi_cumulative_octave_register_matrix
                    endif
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
