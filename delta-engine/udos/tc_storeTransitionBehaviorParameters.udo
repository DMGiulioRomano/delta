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

opcode storeTransitionBehaviorParameters, i, i[]i[]iiiiii
    iRhythms[], iPositions[], iAttacco, iDuration, iHarmonicDuration, iAmplitude, iOctave, iRegister  xin

    ; Calcola le dimensioni effettive degli array
    iRhythmsSize = lenarray(iRhythms)
    iPositionsSize = lenarray(iPositions)

    ; Incrementa il contatore globale per ottenere un nuovo ID
    gi_compId += 1
    iIdComp = gi_compId
    
    ; Controlla che l'ID sia entro i limiti
    if (iIdComp >= gi_NUMComportamenti) then
        prints "ERRORE: Superato il numero massimo di comportamenti (%d)\n", gi_NUMComportamenti
        iIdComp = gi_NUMComportamenti - 1
    endif
    
    ; Memorizza i parametri principali nelle tabelle
    tabw_i iAttacco, iIdComp, gi_comp_ATTACCO
    tabw_i iDuration, iIdComp, gi_comp_DURATA
    tabw_i iHarmonicDuration, iIdComp, gi_comp_DURARMONICA
    tabw_i iAmplitude, iIdComp, gi_comp_AMPIEZZA
    tabw_i iOctave, iIdComp, gi_comp_OTTAVA
    tabw_i iRegister, iIdComp, gi_comp_REGISTRO
    
    ; Limita il numero di ritmi
    iNumRitmi = min(iRhythmsSize, 10)
    
    ; Calcola l'indice base per i ritmi
    iRitmiBaseIndex = iIdComp * 11
    
    ; Memorizza la lunghezza come primo elemento
    tabw_i iNumRitmi, iRitmiBaseIndex, gi_comp_RITMI
    
    ; Copia i valori dei ritmi dall'array
    iRIdx = 0
    while (iRIdx < iNumRitmi) do
        iRitmo = iRhythms[iRIdx]
        tabw_i iRitmo, iRitmiBaseIndex + 1 + iRIdx, gi_comp_RITMI
        iRIdx += 1
    od
    
    ; Limita il numero di posizioni
    iNumPos = min(iPositionsSize, 10)
    
    ; Calcola l'indice base per le posizioni
    iPosBaseIndex = iIdComp * 11
    
    ; Memorizza la lunghezza come primo elemento
    tabw_i iNumPos, iPosBaseIndex, gi_comp_POSIZIONI
    
    ; Copia i valori delle posizioni dall'array
    iPIdx = 0
    while (iPIdx < iNumPos) do
        iPos = iPositions[iPIdx]
        tabw_i iPos, iPosBaseIndex + 1 + iPIdx, gi_comp_POSIZIONI
        iPIdx += 1
    od
    
    ; Debug output se richiesto
    if (gi_debug >= 2) then
        prints "\tComportamento %d memorizzato nelle tabelle:\n", iIdComp
        prints "\t\tAttacco: %.2f, Durata: %.2f, DurArmonica: %.2f\n", 
               iAttacco, iDuration, iHarmonicDuration
        prints "\t\tAmpiezza: %.2f, Ottava: %d, Registro: %d\n",
               iAmplitude, iOctave, iRegister
        prints "\t\tRitmi (%d): ", iNumRitmi
        
        iIdx = 0
        while (iIdx < iNumRitmi) do
            prints "%d ", iRhythms[iIdx]
            iIdx += 1
        od        
        prints "  Posizioni (%d): ", iNumPos
        iIdx = 0
        while (iIdx < iNumPos) do
            prints "%d ", iPositions[iIdx]
            iIdx += 1
        od
        prints "\n"
    endif
    
    xout iIdComp
endop
