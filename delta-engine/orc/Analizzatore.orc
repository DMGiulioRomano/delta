
instr Analizzatore
    ; Analisi della sovrapposizione di eventi - eseguita a k-rate 
    kTrig metro 10  ; 10 Hz per avere una buona risoluzione temporale
    if kTrig == 1 then
        ; Ottieni tempo corrente
        kCurrentTime timeinsts
        
        ; Calcolo eventi attivi in questo momento
        kActiveEventsCount = 0
        
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
            kAttackTime table kEventIdx, gi_eve_attacco
            kDuration table kEventIdx, gi_eve_durata
            
            ; Verifica se l'evento è attualmente attivo
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEventsCount += 1
                
                ; Identifica ottava e registro dell'evento attivo
                kBehaviorId table kEventIdx, gi_eve_comportamento
                if kBehaviorId >= 0 && kBehaviorId < gi_NUMComportamenti then
                    kOctave table kBehaviorId, gi_comp_OTTAVA
                    kRegister table kBehaviorId, gi_comp_REGISTRO
                    
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
        
        ; Aggiorna variabili globali
        gk_current_overlap = kActiveEventsCount
        gk_current_harmonic_density = kHarmonicDensity
        gk_current_octave_spread = kOctaveSpread
        gk_current_spectral_centroid = kSpectralCentroid
        
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
        endif
    endif

    ; Stampa info di debug (opzionale)
    kDebugTrig metro 1  ; Stampa ogni secondo
    if kDebugTrig == 1 && gi_debug >= 1 then
        kCurrentTime timeinsts
        kActiveEvents = 0

        kEventIdx = 0
        while kEventIdx < gi_Index do
            kAttackTime table kEventIdx, gi_eve_attacco
            kDuration table kEventIdx, gi_eve_durata
            
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEvents += 1
            endif
            
            kEventIdx += 1
        od
        
        printks "Tempo: %.2fs - Eventi attivi: %d\n", 0, kCurrentTime, kActiveEvents
    endif
endin

; Strumento per l'analisi finale eseguito alla fine del rendering
instr AnalisiFinale
    ; Crea la directory per i risultati
    iRes system_i 1, "mkdir -p ./docs/analysis", 0
    
    ; Esporta i dati di sovrapposizione in CSV
    SdataFile = "docs/analysis/overlap_data.csv"
    fprints SdataFile, "time,active_events\n"
    
    iNumValidPoints = 0
    iIdx = 0
    while iIdx < gi_analysis_buffer_size do
        iTime table iIdx, gi_analysis_timepoints
        iActiveEvents table iIdx, gi_analysis_active_events
        
        ; Scrivi solo punti validi (tempo > 0)
        if iTime > 0 then
            fprints SdataFile, "%.3f,%d\n", iTime, iActiveEvents
            iNumValidPoints += 1
        endif
        
        iIdx += 1
    od
    
    ; Esporta i dati armonici in CSV
    SHarmonicFile = "docs/analysis/harmonic_data.csv"
    fprints SHarmonicFile, "time,harmonic_density,octave_spread,spectral_centroid\n"
    
    iHarmonicPoints = 0
    iIdx = 0
    while iIdx < gi_memory_size do
        iTime = iIdx * gi_memory_resolution
        iHarmonicDensity table iIdx, gi_memory_harmonic_density
        iOctaveSpread table iIdx, gi_memory_octave_spread
        iSpectralCentroid table iIdx, gi_memory_spectral_centroid
        
        ; Esporta solo punti con dati validi
        if iHarmonicDensity > 0 || iOctaveSpread > 0 || iSpectralCentroid > 0 then
            fprints SHarmonicFile, "%.2f,%.4f,%.4f,%.4f\n", iTime, iHarmonicDensity, iOctaveSpread, iSpectralCentroid
            iHarmonicPoints += 1
        endif
        
        iIdx += 1
    od
    
    ; Esporta snapshot della distribuzione ottava/registro
    SOctaveDistFile = "docs/analysis/octave_distribution.csv"
    fprints SOctaveDistFile, "octave,count\n"
    iOctIdx = 0
    while iOctIdx < $OTTAVE do
        iOctCount table iOctIdx, gi_active_octaves
        fprints SOctaveDistFile, "%d,%d\n", iOctIdx, iOctCount
        iOctIdx += 1
    od
    
    SRegisterDistFile = "docs/analysis/register_distribution.csv"
    fprints SRegisterDistFile, "register,count\n"
    iRegIdx = 0
    while iRegIdx < $REGISTRI do
        iRegCount table iRegIdx, gi_active_registers
        fprints SRegisterDistFile, "%d,%d\n", iRegIdx, iRegCount
        iRegIdx += 1
    od
    
    SMatrixFile = "docs/analysis/octave_register_matrix.csv"
    fprints SMatrixFile, "octave,register,count\n"
    iOctIdx = 0
    while iOctIdx < $OTTAVE do
        iRegIdx = 0
        while iRegIdx < $REGISTRI do
            iMatrixIdx = iOctIdx * $REGISTRI + iRegIdx
            iMatrixVal table iMatrixIdx, gi_octave_register_matrix
            if iMatrixVal > 0 then
                fprints SMatrixFile, "%d,%d,%d\n", iOctIdx, iRegIdx, iMatrixVal
            endif
            iRegIdx += 1
        od
        iOctIdx += 1
    od
    
    ; Esporta i dati della memoria compositiva
    SMemoryFile = "docs/analysis/compositional_memory.csv"
    fprints SMemoryFile, "time,overlap,active_events\n"
    
    iIdx = 0
    iValidPoints = 0
    while iIdx < gi_memory_size do
        iTime = iIdx * gi_memory_resolution
        iOverlap table iIdx, gi_memory_overlap
        iEvents table iIdx, gi_memory_events
        
        ; Esporta solo punti con dati validi
        if iOverlap > 0 || iEvents > 0 then
            fprints SMemoryFile, "%.2f,%d,%d\n", iTime, iOverlap, iEvents
            iValidPoints += 1
        endif
        
        iIdx += 1
    od
    
    ; Calcola e stampa statistiche di base
    iMaxOverlap = 0
    iOverlapSum = 0
    iIdx = 0
    iValidCount = 0
    
    while iIdx < gi_analysis_buffer_size do
        iActiveEvents table iIdx, gi_analysis_active_events
        iTime table iIdx, gi_analysis_timepoints
        
        if iTime > 0 then
            iMaxOverlap = max(iMaxOverlap, iActiveEvents)
            iOverlapSum += iActiveEvents
            iValidCount += 1
        endif
        
        iIdx += 1
    od
    
    iAvgOverlap = (iValidCount > 0) ? iOverlapSum / iValidCount : 0
    
    ; Stampa statistiche finali
    prints "\n=== ANALISI SOVRAPPOSIZIONE EVENTI ===\n"
    prints "Punti analizzati: %d\n", iNumValidPoints
    prints "Sovrapposizione massima: %d eventi\n", iMaxOverlap
    prints "Sovrapposizione media: %.2f eventi\n", iAvgOverlap
    prints "Dati esportati in %s\n", SdataFile
    prints "Memoria compositiva: %d punti esportati in %s\n", iValidPoints, SMemoryFile
    
    ; Stampa statistiche anche per i dati armonici
    prints "\n=== ANALISI DATI ARMONICI ===\n"
    prints "Punti analizzati: %d\n", iHarmonicPoints
    prints "Ottave attive: "
    iOctIdx = 0
    while iOctIdx < $OTTAVE do
        iOctCount table iOctIdx, gi_active_octaves
        if iOctCount > 0 then
            prints "Ottava %d: %d eventi, ", iOctIdx, iOctCount
        endif
        iOctIdx += 1
    od
    prints "\n"
    
    prints "Dati esportati in %s\n", SHarmonicFile
    prints "Distribuzione ottave in %s\n", SOctaveDistFile
    prints "Distribuzione registri in %s\n", SRegisterDistFile
    prints "Matrice ottava/registro in %s\n", SMatrixFile
    
    ; Avvia automaticamente l'analisi Python tramite make
    prints "\nAvvio dell'analisi Python...\n"
    iAnalysisRes system_i 1, "make analyze-all", 0
    
    if iAnalysisRes == 0 then
        prints "Analisi Python completata con successo!\n"
    else
        prints "Errore durante l'analisi Python (codice: %d)\n", iAnalysisRes
        prints "Verifica che make e l'ambiente Python siano configurati correttamente.\n"
    endif
    
    turnoff
endin
