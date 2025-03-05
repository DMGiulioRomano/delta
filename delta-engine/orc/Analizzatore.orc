/*instr Analizzatore
    aMid zar 1
    aSide zar 2
    
    
    
    zacl
endin*/

instr Analizzatore
    ; Analisi della sovrapposizione di eventi - eseguita a k-rate 
    kTrig metro 10  ; 10 Hz per avere una buona risoluzione temporale
    if kTrig == 1 then
        ; Ottieni tempo corrente
        kCurrentTime timeinsts
        
        ; Calcolo eventi attivi in questo momento
        kActiveEventsCount = 0
        
        ; Analisi delle tabelle di eventi
        kEventIdx = 0
        while kEventIdx < gi_Index do  ; gi_Index contiene il numero totale di eventi creati
            kAttackTime table kEventIdx, gi_eve_attacco
            kDuration table kEventIdx, gi_eve_durata
            
            ; Verifica se l'evento è attualmente attivo
            if kAttackTime <= kCurrentTime && kAttackTime + kDuration >= kCurrentTime then
                kActiveEventsCount += 1
            endif
            
            kEventIdx += 1
        od
        
        ; Aggiorna la variabile globale per comunicare con il Comportamento
        gk_current_overlap = kActiveEventsCount
        
        ; Memorizza il conteggio degli eventi attivi e il timestamp
        tabw kActiveEventsCount, gk_analysis_index, gi_analysis_active_events
        tabw kCurrentTime, gk_analysis_index, gi_analysis_timepoints
        
        ; Avanzamento ciclico nell'indice della tabella
        gk_analysis_index = (gk_analysis_index + 1) % gi_analysis_buffer_size
    endif

    kMemTrig metro 1/gi_memory_resolution
    if kMemTrig == 1 then
        kCurrentTime timeinsts
        kMemIdx = int(kCurrentTime / gi_memory_resolution)
        
        if kMemIdx >= 0 && kMemIdx < gi_memory_size then
            tabw gk_current_overlap, kMemIdx, gi_memory_overlap
            tabw kActiveEventsCount, kMemIdx, gi_memory_events  ; Usa lo stesso valore calcolato sopra
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
    
    ; NUOVO: Esporta i dati della memoria compositiva
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
    
    ; Stampa statistiche finali
    prints "\n=== ANALISI SOVRAPPOSIZIONE EVENTI ===\n"
    prints "Punti analizzati: %d\n", iNumValidPoints
    prints "Sovrapposizione massima: %d eventi\n", iMaxOverlap
    prints "Sovrapposizione media: %.2f eventi\n", iAvgOverlap
    prints "Dati esportati in %s\n", SdataFile
    prints "Memoria compositiva: %d punti esportati in %s\n", iValidPoints, SMemoryFile
    
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
