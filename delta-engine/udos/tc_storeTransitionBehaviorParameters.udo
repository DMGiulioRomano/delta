; ==========================================================================
; storeTransitionBehaviorParameters
; Memorizza i parametri di un comportamento generato nelle tabelle globali
; ==========================================================================
; Inputs:
;   iAttacco - Tempo di attacco del comportamento
;   iDurata - Durata complessiva del comportamento
;   iDurataArmonica - Durata armonica
;   iAmpiezza - Ampiezza in dB
;   iOttava - Ottava
;   iRegistro - Registro
;   iRhythmsTable - ID della tabella contenente i ritmi generati
;   iPositionsTable - ID della tabella contenente le posizioni generate
; Output:
;   iIdComp - ID del comportamento memorizzato
; ==========================================================================

opcode storeTransitionBehaviorParameters, i, iiiiiiii
    iAttacco, iDurata, iDurataArmonica, iAmpiezza, iOttava, iRegistro, iRhythmsTable, iPositionsTable xin
    
    ; Incrementa il contatore globale per ottenere un nuovo ID
    gi_compId += 1
    iIdComp = gi_compId
    
    ; Controlla che l'ID sia entro i limiti
    if (iIdComp >= gi_NUMComportamenti) then
        prints "ERRORE: Superato il numero massimo di comportamenti (%d)\n", gi_NUMComportamenti
        iIdComp = gi_NUMComportamenti - 1  ; Limita all'ultimo disponibile
    endif
    
    ; Memorizza i parametri principali nelle tabelle
    tabw_i iAttacco, iIdComp, gi_comp_ATTACCO
    tabw_i iDurata, iIdComp, gi_comp_DURATA
    tabw_i iDurataArmonica, iIdComp, gi_comp_DURARMONICA
    tabw_i iAmpiezza, iIdComp, gi_comp_AMPIEZZA
    tabw_i iOttava, iIdComp, gi_comp_OTTAVA
    tabw_i iRegistro, iIdComp, gi_comp_REGISTRO
    
    ; Conta il numero di ritmi nella tabella di input
    iRhythmSize = ftlen(iRhythmsTable)
    iNumRitmi = min(iRhythmSize, 10)  ; Limita a max 10 ritmi
    
    ; Calcola l'indice base per i ritmi
    iRitmiBaseIndex = iIdComp * 11
    
    ; Memorizza la lunghezza come primo elemento
    tabw_i iNumRitmi, iRitmiBaseIndex, gi_comp_RITMI
    
    ; Copia i valori dei ritmi
    iRIdx = 0
    while (iRIdx < iNumRitmi) do
        iRitmo tab_i iRIdx, iRhythmsTable
        tabw_i iRitmo, iRitmiBaseIndex + 1 + iRIdx, gi_comp_RITMI
        iRIdx += 1
    od
    
    ; Conta il numero di posizioni nella tabella di input
    iPosSize = ftlen(iPositionsTable)
    iNumPos = min(iPosSize, 10)  ; Limita a max 10 posizioni
    
    ; Calcola l'indice base per le posizioni
    iPosBaseIndex = iIdComp * 11
    
    ; Memorizza la lunghezza come primo elemento
    tabw_i iNumPos, iPosBaseIndex, gi_comp_POSIZIONI
    
    ; Copia i valori delle posizioni
    iPIdx = 0
    while (iPIdx < iNumPos) do
        iPos tab_i iPIdx, iPositionsTable
        tabw_i iPos, iPosBaseIndex + 1 + iPIdx, gi_comp_POSIZIONI
        iPIdx += 1
    od
    
    ; Debug output se richiesto
    if (gi_debug >= 2) then
        prints "Comportamento %d memorizzato nelle tabelle:\n", iIdComp
        prints "  Attacco: %.2f, Durata: %.2f, DurArmonica: %.2f\n", 
               iAttacco, iDurata, iDurataArmonica
        prints "  Ampiezza: %.2f, Ottava: %d, Registro: %d\n",
               iAmpiezza, iOttava, iRegistro
        prints "  Ritmi (%d): ", iNumRitmi
        
        iIdx = 0
        while (iIdx < iNumRitmi) do
            iVal tab_i iRitmiBaseIndex + 1 + iIdx, gi_comp_RITMI
            prints "%d ", iVal
            iIdx += 1
        od
        prints "\n"
        
        prints "  Posizioni (%d): ", iNumPos
        iIdx = 0
        while (iIdx < iNumPos) do
            iVal tab_i iPosBaseIndex + 1 + iIdx, gi_comp_POSIZIONI
            prints "%d ", iVal
            iIdx += 1
        od
        prints "\n"
    endif
    
    xout iIdComp
endop
