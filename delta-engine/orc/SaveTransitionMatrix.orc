instr SaveTransitionMatrix
    prints "\nInitializing transition matrix and saving to CSV...\n"
    
    ; Chiamata all'opcode che inizializza la matrice di transizione
    initTransitionMatrix
    
    ; Crea una directory per i dati di analisi se non esiste
    iRes system_i 1, "mkdir -p ./docs/analysis", 0
    
    ; Nome del file CSV da creare
    SMatrixFile = "docs/analysis/transition_matrix.csv"
    
    ; Crea l'intestazione del file con i nomi degli stati
    fprints SMatrixFile, "from_state,to_state,probability\n"
    
    ; Ciclo attraverso tutti gli stati di origine
    iFromIdx = 0
    while iFromIdx < 27 do
        ; Scomponi l'indice dello stato di origine nelle sue componenti
        iFromDensity = int(iFromIdx / 9)
        iFromRemainder = iFromIdx % 9
        iFromRegister = int(iFromRemainder / 3)
        iFromMovement = iFromRemainder % 3
        
        ; Etichetta lo stato di origine
        SFromState sprintf "D%d-R%d-M%d", iFromDensity, iFromRegister, iFromMovement
        
        ; Ciclo attraverso tutti gli stati di destinazione
        iToIdx = 0
        while iToIdx < 27 do
            ; Scomponi l'indice dello stato di destinazione
            iToDensity = int(iToIdx / 9)
            iToRemainder = iToIdx % 9
            iToRegister = int(iToRemainder / 3)
            iToMovement = iToRemainder % 3
            
            ; Etichetta lo stato di destinazione
            SToState sprintf "D%d-R%d-M%d", iToDensity, iToRegister, iToMovement
            
            ; Ottieni la probabilità dalla matrice
            iProb tab_i iFromIdx*27+iToIdx, gi_transition_matrix
            
            ; Scrivi la riga nel file CSV
            fprints SMatrixFile, "%s,%s,%.4f\n", SFromState, SToState, iProb
            
            iToIdx += 1
        od
        
        iFromIdx += 1
    od
    
    ; Crea anche una versione bidimensionale per una heatmap
    SMatrixFile2D = "docs/analysis/transition_matrix_2d.csv"
    
    ; Scrivi l'intestazione con gli stati di destinazione
    fprints SMatrixFile2D, "from_state"
    iToIdx = 0
    while iToIdx < 27 do
        iToDensity = int(iToIdx / 9)
        iToRemainder = iToIdx % 9
        iToRegister = int(iToRemainder / 3)
        iToMovement = iToRemainder % 3
        SToState sprintf ",D%d-R%d-M%d", iToDensity, iToRegister, iToMovement
        fprints SMatrixFile2D, "%s", SToState
        iToIdx += 1
    od
    fprints SMatrixFile2D, "\n"
    
    ; Scrivi i dati della matrice
    iFromIdx = 0
    while iFromIdx < 27 do
        ; Etichetta lo stato di origine
        iFromDensity = int(iFromIdx / 9)
        iFromRemainder = iFromIdx % 9
        iFromRegister = int(iFromRemainder / 3)
        iFromMovement = iFromRemainder % 3
        SFromState sprintf "D%d-R%d-M%d", iFromDensity, iFromRegister, iFromMovement
        fprints SMatrixFile2D, "%s", SFromState
        
        ; Scrivi tutte le probabilità per questa riga
        iToIdx = 0
        while iToIdx < 27 do
            iProb tab_i iFromIdx*27+iToIdx, gi_transition_matrix
            fprints SMatrixFile2D, ",%.4f", iProb
            iToIdx += 1
        od
        fprints SMatrixFile2D, "\n"
        
        iFromIdx += 1
    od
    
    prints "\nTransition matrix saved to %s and %s\n", SMatrixFile, SMatrixFile2D
    
    ; Avvia lo script Python per creare la heatmap, se esiste
    SHeatmapScript = "make analyze-transitions"
    iRes system_i 1, SHeatmapScript, 0
    
    if iRes == 0 then
        prints "Heatmap generation successful!\n"
    else
        prints "Note: Heatmap script not found or failed. Create a Python script named 'visualize_transition_matrix.py' to generate a heatmap visualization.\n"
    endif
    
    turnoff
endin
