<CsoundSynthesizer>
<CsOptions>
; Opzioni minime per l'esecuzione silent (senza output audio)
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Inizializzazione del debug
gi_debug init 2  ; Livello di debug moderato

; ---------------------------------------------------------
; Definizione delle tabelle necessarie per il sistema adattivo
; ---------------------------------------------------------

; Tabella per memorizzare la storia delle transizioni 
; Struttura: [from_state, to_state, quality, context_feature1, context_feature2, context_feature3, context_feature4]
; La dimensione è 100 entrate x 7 valori = 700
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0

; Tabella per le caratteristiche di contesto attuali
gi_asp_context_features ftgen 0, 0, 5, -2, 0.3, 0.6, 0.4, 0.2 

; Contatori e parametri del sistema
gi_asp_history_index init 0        ; Indice corrente nel buffer
gi_asp_transition_count init 0     ; Contatore transizioni registrate
gi_asp_learning_rate init 0.1      ; Tasso di apprendimento

; Altri parametri usati nell'algoritmo
gi_memory_resolution init 1        ; Risoluzione temporale (1 sec)

; ---------------------------------------------------------
; Definizione dell'UDO exportLearningHistory e dipendenze
; ---------------------------------------------------------

; UDO exportLearningHistory: esporta la storia dell'apprendimento in CSV
opcode exportLearningHistory, 0, Si
    Soutputfile, iDebugLevel xin
    
    ; Default values
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/learning_history_export.csv"
    endif
    
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Create directory if it doesn't exist
    iSystem system_i 1, "mkdir -p docs/analysis"
    ; Write CSV header
    fprints Soutputfile, "transition_id,timestamp,from_state,to_state,quality,overlap,spread,centroid,movement\n"
    
    ; Current time for reference
    iCurrentTime times
    
    ; Export all recorded transitions (up to 100)
    iTransitionCount = min(gi_asp_transition_count, 100)
    
    iHistoryIdx = 0
    while (iHistoryIdx < iTransitionCount) do
        ; Calculate position in history buffer
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract transition data
        iEntryBase = iActualIdx * 7
        iFromState tab_i iEntryBase, gi_asp_transition_history
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        iOverlap tab_i iEntryBase+3, gi_asp_transition_history
        iSpread tab_i iEntryBase+4, gi_asp_transition_history
        iCentroid tab_i iEntryBase+5, gi_asp_transition_history
        iMovement tab_i iEntryBase+6, gi_asp_transition_history
        
        ; Estimate timestamp (crude approximation)
        iTransitionTime = iCurrentTime - (iHistoryIdx * gi_memory_resolution)
        
        ; Write to CSV
        fprints Soutputfile, "%d,%.2f,%d,%d,%.4f,%.4f,%.4f,%.4f,%.4f\n",
                gi_asp_transition_count - iHistoryIdx,
                iTransitionTime,
                iFromState, iToState, iQuality,
                iOverlap, iSpread, iCentroid, iMovement
        
        iHistoryIdx += 1
    od
    
    if (iDebugLevel >= 1) then
        prints "Learning history exported to %s (%d transitions)\n", 
               Soutputfile, iTransitionCount
    endif
endop

; ---------------------------------------------------------
; Strumenti di test
; ---------------------------------------------------------

; Strumento per caricare dati simulati di transizione
instr SimulateTransitions
    ; Registra 5 transizioni di esempio nella storia
    iIdx = 0
    iTransitionsToAdd = 5
    
    while iIdx < iTransitionsToAdd do
        ; Indice base per questa transizione (7 valori per transizione)
        iEntryBase = gi_asp_history_index * 7
        
        ; Valori simulati: from_state, to_state, quality, 4 caratteristiche di contesto
        iFromState = int(random:i(0, 26))  ; Stati da 0 a 26
        iToState = int(random:i(0, 26))    ; Stati da 0 a 26
        iQuality = random:i(0.4, 0.95)     ; Qualità da 0.4 a 0.95
        
        ; Caratteristiche di contesto musicale (valori normalizzati)
        iFeature1 = random:i(0.1, 0.9)  ; Overlap (densità eventi)
        iFeature2 = random:i(0.2, 0.8)  ; Spread (dispersione)
        iFeature3 = random:i(0.3, 0.7)  ; Centroid (centroide)
        iFeature4 = random:i(0.1, 0.9)  ; Movement (movimento)
        
        ; Memorizza i dati nella tabella di storia
        tabw_i iFromState, iEntryBase, gi_asp_transition_history
        tabw_i iToState, iEntryBase+1, gi_asp_transition_history
        tabw_i iQuality, iEntryBase+2, gi_asp_transition_history
        tabw_i iFeature1, iEntryBase+3, gi_asp_transition_history
        tabw_i iFeature2, iEntryBase+4, gi_asp_transition_history
        tabw_i iFeature3, iEntryBase+5, gi_asp_transition_history
        tabw_i iFeature4, iEntryBase+6, gi_asp_transition_history
        
        ; Aggiorna l'indice e il contatore
        gi_asp_history_index = (gi_asp_history_index + 1) % 100
        gi_asp_transition_count += 1
        
        prints "Simulata transizione #%d: [%d] → [%d] con qualità %.2f\n", 
               gi_asp_transition_count, iFromState, iToState, iQuality
        
        iIdx += 1
    od
    
    prints "\nSimulate %d transizioni che verranno esportate\n", iTransitionsToAdd
    
    ; Esporta le transizioni dopo la simulazione
    event_i "i", "ExportTest", 0.5, 0.1
endin

; Strumento per testare l'esportazione
instr ExportTest
    ; Test con path di default
    exportLearningHistory "", 2
    
    ; Test con path personalizzato
    exportLearningHistory "test_learning_export.csv", 2
    
    ; Visualizza il contenuto del file esportato (Linux/MacOS)
    prints "\nContenuto del file 'test_learning_export.csv':\n"
    iRes system_i 1, "cat test_learning_export.csv", 0
    
    ; Verifica del file creato
    iRes system_i 1, "ls -l test_learning_export.csv", 0
    
    if iRes == 0 then
        prints "\nTest completato con successo!\n"
    else
        prints "\nErrore: il file non è stato creato o non è accessibile\n"
    endif
endin

</CsInstruments>
<CsScore>
; Simula transizioni
i "SimulateTransitions" 0 0.1

; La durata di 1 secondo è sufficiente per l'esecuzione
f 0 1
</CsScore>
</CsoundSynthesizer>
