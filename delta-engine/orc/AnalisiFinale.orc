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
        iTime tab_i iIdx, gi_analysis_timepoints
        iActiveEvents tab_i iIdx, gi_analysis_active_events
        
        ; Scrivi solo punti validi (tempo > 0)
        if iTime > 0 then
            fprints SdataFile, "%.3f,%d\n", iTime, iActiveEvents
            iNumValidPoints += 1
        endif
        
        iIdx += 1
    od
    
    ; Esporta i dati armonici in CSV
    SHarmonicFile = "docs/analysis/harmonic_data.csv"
    fprints SHarmonicFile, "time,harmonic_density,octave_spread,spectral_centroid,spatial_movement\n"
    
    iHarmonicPoints = 0
    iIdx = 0
    while iIdx < gi_memory_size do
        iTime = iIdx * gi_memory_resolution
        iHarmonicDensity tab_i iIdx, gi_memory_harmonic_density
        iOctaveSpread tab_i iIdx, gi_memory_octave_spread
        iSpectralCentroid tab_i iIdx, gi_memory_spectral_centroid
        iSpatialMovement tab_i iIdx, gi_memory_spatial_movement  

        ; Esporta solo punti con dati validi
        if iHarmonicDensity > 0 || iOctaveSpread > 0 || iSpectralCentroid > 0 || iSpatialMovement > 0 then
            fprints SHarmonicFile, "%.2f,%.4f,%.4f,%.4f,%.4f\n", iTime, iHarmonicDensity, iOctaveSpread, iSpectralCentroid, iSpatialMovement
            iHarmonicPoints += 1
        endif
        
        iIdx += 1
    od
    
    ; Esporta snapshot della distribuzione ottava/registro
    SOctaveDistFile = "docs/analysis/octave_distribution.csv"
    fprints SOctaveDistFile, "octave,count\n"
    iOctIdx = 0
    while iOctIdx < $OTTAVE do
        iOctCount tab_i iOctIdx, gi_active_octaves
        fprints SOctaveDistFile, "%d,%d\n", iOctIdx, iOctCount
        iOctIdx += 1
    od
    
    SRegisterDistFile = "docs/analysis/register_distribution.csv"
    fprints SRegisterDistFile, "register,count\n"
    iRegIdx = 0
    while iRegIdx < $REGISTRI do
        iRegCount tab_i iRegIdx, gi_active_registers
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
            iMatrixVal table iMatrixIdx, gi_cumulative_octave_register_matrix
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
        iOverlap tab_i iIdx, gi_memory_overlap
        iEvents tab_i iIdx, gi_memory_events
        
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
        iActiveEvents tab_i iIdx, gi_analysis_active_events
        iTime tab_i iIdx, gi_analysis_timepoints
        
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
        iOctCount tab_i iOctIdx, gi_active_octaves
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
