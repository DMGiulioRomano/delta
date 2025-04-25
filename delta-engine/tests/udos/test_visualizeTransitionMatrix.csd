<CsoundSynthesizer>
<CsOptions>
-odac
-d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; -----------------------------------------------------------------------
; VARIABILI GLOBALI & TABELLE
; -----------------------------------------------------------------------
gi_debug init 1  ; Livello di debug predefinito
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0  ; Matrice di transizione 27x27
gS_test_dir = "./test_visualize"  ; Directory per i test

; -----------------------------------------------------------------------
; OPCODE DA TESTARE - visualizeTransitionMatrix
; -----------------------------------------------------------------------
opcode visualizeTransitionMatrix, 0, Si
    Soutputfile, iDebugLevel xin
    
    ; Imposta debug level predefinito se non fornito
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Se non viene fornito un filename, usa il predefinito
    if (strcmp(Soutputfile, "") == 0) then
        Soutputfile = "docs/analysis/transition_matrix_visualization.csv"
    endif
    
    ; Crea la directory se non esiste - usiamo direttamente system_i con comandi shell
    iSystem system_i 1, sprintf("mkdir -p $(dirname %s)", Soutputfile)
    
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

; -----------------------------------------------------------------------
; UTILITY PER I TEST
; -----------------------------------------------------------------------

; Popola la matrice con valori semplici di test
opcode populateSimpleTestMatrix, 0, 0
    iIdx = 0
    while (iIdx < 27*27) do
        tabw_i 0, iIdx, gi_transition_matrix
        iIdx += 1
    od
    
    ; Alcuni valori di base per i test
    tabw_i 0.5, 0, gi_transition_matrix  ; Stato 0 rimane in se stesso
    tabw_i 0.3, 1, gi_transition_matrix  ; Stato 0 -> stato 1
    tabw_i 0.2, 9, gi_transition_matrix  ; Stato 0 -> stato 9
    
    tabw_i 0.4, 10*27+10, gi_transition_matrix  ; Stato 10 rimane in se stesso
    tabw_i 0.2, 10*27+11, gi_transition_matrix  ; Stato 10 -> stato 11
    tabw_i 0.2, 10*27+13, gi_transition_matrix  ; Stato 10 -> stato 13
    tabw_i 0.2, 10*27+19, gi_transition_matrix  ; Stato 10 -> stato 19
endop

; -----------------------------------------------------------------------
; STRUMENTO PER I TEST MANUALI
; -----------------------------------------------------------------------
instr TestVisualizeMatrix
    prints "\n=== TEST MANUALE VISUALIZETRANSITIONMATRIX ===\n"
    
    ; Crea directory di test e pulisci
    iRes system_i 1, sprintf("mkdir -p %s", gS_test_dir)
    iRes system_i 1, sprintf("rm -rf %s/*", gS_test_dir)
    
    ; -----------------------------------------------------------------------
    ; TEST 1: Matrice semplice
    ; -----------------------------------------------------------------------
    prints "\nTEST 1: Matrice semplice\n"
    populateSimpleTestMatrix
    SOutputFile1 = sprintf("%s/test1_simple.csv", gS_test_dir)
    visualizeTransitionMatrix SOutputFile1, 0
    
    ; -----------------------------------------------------------------------
    ; TEST 2: Creazione directory annidata
    ; -----------------------------------------------------------------------
    prints "\nTEST 2: Creazione directory annidata\n"
    populateSimpleTestMatrix
    SOutputFile2 = sprintf("%s/nested/dir/test2_nested.csv", gS_test_dir)
    visualizeTransitionMatrix SOutputFile2, 0
    
    ; -----------------------------------------------------------------------
    ; TEST 3: Valori di soglia
    ; -----------------------------------------------------------------------
    prints "\nTEST 3: Valori di soglia\n"
    ; Reset matrice
    iIdx = 0
    while (iIdx < 27*27) do
        tabw_i 0, iIdx, gi_transition_matrix
        iIdx += 1
    od
    
    ; Valori sopra e sotto la soglia (0.02)
    tabw_i 0.01, 0*27+1, gi_transition_matrix  ; Sotto soglia
    tabw_i 0.019, 0*27+2, gi_transition_matrix ; Appena sotto soglia
    tabw_i 0.021, 0*27+3, gi_transition_matrix ; Appena sopra soglia
    tabw_i 0.05, 0*27+4, gi_transition_matrix  ; Sopra soglia
    
    SOutputFile3 = sprintf("%s/test3_threshold.csv", gS_test_dir)
    visualizeTransitionMatrix SOutputFile3, 0
    
    ; -----------------------------------------------------------------------
    ; ISTRUZIONI FINALI
    ; -----------------------------------------------------------------------
    prints "\n=== VERIFICA MANUALE ===\n"
    prints "Per verificare i risultati, controlla manualmente i file:\n"
    prints "1. %s\n", SOutputFile1
    prints "   - Dovrebbe contenere 7 righe (1 header + 6 dati)\n"
    prints "   - Prima riga dovrebbe essere l'header con 'from_state,to_state,...'\n"
    
    prints "2. %s\n", SOutputFile2
    prints "   - Verifica che la directory annidata sia stata creata\n"
    prints "   - Dovrebbe contenere 7 righe come il primo test\n"
    
    prints "3. %s\n", SOutputFile3
    prints "   - Dovrebbe contenere 3 righe (1 header + 2 dati)\n"
    prints "   - Solo i valori sopra 0.02 dovrebbero essere inclusi\n"
    
    ; Comando per visualizzare rapidamente tutti i file
    SPrintCommand = sprintf("echo '\n--- CONTENUTO FILE ---';\necho '\n# TEST1:'; cat %s;\necho '\n# TEST2:'; cat %s;\necho '\n# TEST3:'; cat %s; ", 
                           SOutputFile1, SOutputFile2, SOutputFile3)
    
    prints "\nPer visualizzare il contenuto di tutti i file, esegui:\n%s\n", SPrintCommand
    
    prints "=== FINE DEI TEST ===\n"
endin
</CsInstruments>
<CsScore>
; Esegui i test
i "TestVisualizeMatrix" 0 0.1
f 0 2  ; Esegui per 2 secondi per dare tempo alle operazioni su file
</CsScore>
</CsoundSynthesizer>