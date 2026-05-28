opcode visualizeTransitionMatrix, 0, Si
    Soutputfile, iDebugLevel xin
    
    ; Imposta debug level predefinito se non fornito
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Se non viene fornito un filename, usa il predefinito
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/transition_matrix_visualization.csv"
    endif
    
    ; Create directory if it doesn't exist
    iSystem system_i 1, "mkdir -p docs/analysis", 0

    ; Crea la directory se non esiste - usiamo direttamente system_i con comandi shell
    ;iSystem system_i 1, sprintf("mkdir -p $(dirname %s)", Soutputfile)
    
    ; Inizia con l'header CSV usando system_i
    iSystem system_i 1, sprintf("echo 'from_state,to_state,probability,from_density,from_register,from_movement,to_density,to_register,to_movement' > %s", Soutputfile)
    
    ; Variabile per tenere traccia delle righe scritte
    iRowsWritten = 0
    
    ; Scrivi ogni probabilità di transizione
    iFromStateIdx = 0
    while (iFromStateIdx < 27) do
        ; Converti lo stato sorgente in componenti
        iFromDens = int(iFromStateIdx / 9)
        iFromRem = iFromStateIdx % 9
        iFromReg = int(iFromRem / 3)
        iFromMov = iFromRem % 3
        
        iToStateIdx = 0
        while (iToStateIdx < 27) do
            ; Ottieni la probabilità
            iProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
            
            ; Includi solo probabilità sopra una certa soglia per ridurre la dimensione del file
            if (iProb > 0.01) then
                ; Converti lo stato target in componenti
                iToDens = int(iToStateIdx / 9)
                iToRem = iToStateIdx % 9
                iToReg = int(iToRem / 3)
                iToMov = iToRem % 3
                
                ; Scrivi nel CSV usando system_i
                SCsvLine =sprintf("%d,%d,%.4f,%d,%d,%d,%d,%d,%d", 
                        iFromStateIdx, iToStateIdx, iProb,
                        iFromDens, iFromReg, iFromMov,
                        iToDens, iToReg, iToMov)
                
                iSystem system_i 1, sprintf("echo '%s' >> %s", SCsvLine, Soutputfile)
                iRowsWritten += 1
            endif
            
            iToStateIdx += 1
        od
        
        iFromStateIdx += 1
    od
    
    if (iDebugLevel >= 1) then
        prints "Transition matrix visualization saved to %s (%d rows)\n", Soutputfile, iRowsWritten
    endif
endop
