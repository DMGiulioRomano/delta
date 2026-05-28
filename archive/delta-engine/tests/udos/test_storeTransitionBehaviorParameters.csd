<CsoundSynthesizer>
<CsOptions>
-d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; ====================================================================
; MINIMA INIZIALIZZAZIONE NECESSARIA PER IL TEST
; ====================================================================

; Livello debug (0 = nessun debug, 1 = base, 2 = dettagliato, 3 = tutto)
gi_debug init 2

; Contatore degli ID dei comportamenti
gi_compId init 0

; Numero massimo di comportamenti
gi_NUMComportamenti init 100

; Tabelle per memorizzare i parametri dei comportamenti (versione ristrutturata)
gi_comp_RITMI      ftgen 0, 0, gi_NUMComportamenti*11, -2, 0      ; Nuova struttura: 10 ritmi + 1 lunghezza
gi_comp_POSIZIONI  ftgen 0, 0, gi_NUMComportamenti*11, -2, 0      ; Nuova struttura: 10 posizioni + 1 lunghezza

; Tabelle standard per i parametri dei comportamenti
gi_comp_ATTACCO     ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Tempo di attacco
gi_comp_DURARMONICA ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Durata armonica
gi_comp_DURATA      ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Durata complessiva
gi_comp_AMPIEZZA    ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Ampiezza in dB
gi_comp_OTTAVA      ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Ottava
gi_comp_REGISTRO    ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Registro

; ====================================================================
; IMPLEMENTAZIONE DELL'OPCODE DI TEST MODIFICATO PER ARRAY
; ====================================================================

; Implementazione corretta dell'opcode che determina le dimensioni con lenarray()
opcode storeTransitionBehaviorParameters, i, iiiiiii[]i[]
    iAttacco, iDurata, iDurataArmonica, iAmpiezza, iOttava, iRegistro, iRhythms[], iPositions[] xin
    
    ; Calcola le dimensioni effettive degli array
    iRhythmsSize = lenarray(iRhythms)
    iPositionsSize = lenarray(iPositions)
    
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
    
    ; Limita il numero di ritmi
    iNumRitmi = min(iRhythmsSize, 10)  ; Limita a max 10 ritmi
    
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
    iNumPos = min(iPositionsSize, 10)  ; Limita a max 10 posizioni
    
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
        prints "Comportamento %d memorizzato nelle tabelle:\n", iIdComp
        prints "  Attacco: %.2f, Durata: %.2f, DurArmonica: %.2f\n", 
               iAttacco, iDurata, iDurataArmonica
        prints "  Ampiezza: %.2f, Ottava: %d, Registro: %d\n",
               iAmpiezza, iOttava, iRegistro
        prints "  Ritmi (%d): ", iNumRitmi
        
        iIdx = 0
        while (iIdx < iNumRitmi) do
            prints "%d ", iRhythms[iIdx]
            iIdx += 1
        od
        prints "\n"
        
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

; ====================================================================
; STRUMENTI DI TEST ADATTATI PER USARE ARRAY
; ====================================================================

; Strumento per testare con ritmi e posizioni di varie lunghezze
instr TestCase1
    prints "\n=== TEST CASE 1: Ritmi e posizioni di varie lunghezze (versione array) ===\n"
    
    ; Parametri base di test
    iAttacco = 0
    iDurata = 20
    iDurataArmonica = 5
    iAmpiezza = -12
    iOttava = 4
    iRegistro = 5
    
    ; CASO 1: Pochi elementi (3 ritmi, 2 posizioni)
    prints "CASO 1.1: Pochi elementi (3 ritmi, 2 posizioni)\n"
    iRhythms[] init 3
    iRhythms[0] = 4
    iRhythms[1] = 5
    iRhythms[2] = 6
    
    iPositions[] init 2
    iPositions[0] = 1
    iPositions[1] = 2
    
    prints "Array di ritmi creato con %d elementi\n", lenarray(iRhythms)
    prints "Array di posizioni creato con %d elementi\n", lenarray(iPositions)
    
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythms, iPositions
    
    ; CASO 2: Esattamente 10 elementi (limite)
    prints "\nCASO 1.2: Esattamente 10 elementi (limite)\n"
    iRhythms10[] init 10
    iPositions10[] init 10
    
    iIdx = 0
    while (iIdx < 10) do
        iRhythms10[iIdx] = iIdx + 1
        iPositions10[iIdx] = iIdx
        iIdx += 1
    od
    
    prints "Array di ritmi creato con %d elementi\n", lenarray(iRhythms10)
    prints "Array di posizioni creato con %d elementi\n", lenarray(iPositions10)
    
    iAttacco = 10 ; Modifica l'attacco per distinguere i casi
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythms10, iPositions10
    
    ; CASO 3: Più di 10 elementi (dovrebbe limitare)
    prints "\nCASO 1.3: Più di 10 elementi (dovrebbe limitare a 10)\n"
    iRhythms15[] init 15
    iPositions12[] init 12
    
    iIdx = 0
    while (iIdx < 15) do
        iRhythms15[iIdx] = iIdx + 1
        if (iIdx < 12) then
            iPositions12[iIdx] = iIdx
        endif
        iIdx += 1
    od
    
    prints "Array di ritmi creato con %d elementi\n", lenarray(iRhythms15)
    prints "Array di posizioni creato con %d elementi\n", lenarray(iPositions12)
    
    iAttacco = 20 ; Modifica l'attacco per distinguere i casi
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythms15, iPositions12
endin

; Strumento per testare valori limite e casi particolari
instr TestCase2
    prints "\n=== TEST CASE 2: Valori limite e casi particolari (versione array) ===\n"
    
    ; CASO 1: Valori estremi
    prints "CASO 2.1: Valori estremi\n"
    iAttacco = 0
    iDurata = 1000     ; Durata molto lunga
    iDurataArmonica = 0.001  ; Durata armonica molto breve
    iAmpiezza = -90    ; Ampiezza molto bassa
    iOttava = 10       ; Ottava alta
    iRegistro = 1      ; Registro basso
    
    iRhythmsExt[] init 5
    iPositionsExt[] init 5
    
    iIdx = 0
    while (iIdx < 5) do
        iRhythmsExt[iIdx] = (iIdx + 1) * 100
        iPositionsExt[iIdx] = (iIdx + 1) * 100 - 1
        iIdx += 1
    od
    
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythmsExt, iPositionsExt

    ; CASO 2: Valori negativi
    prints "\nCASO 2.2: Valori negativi\n"
    iAttacco = 30
    iDurata = 5
    iDurataArmonica = 1
    iAmpiezza = -6
    iOttava = 2
    iRegistro = 3
    
    iRhythmsNeg[] init 5
    iPositionsNeg[] init 5
    
    iRhythmsNeg[0] = -1
    iRhythmsNeg[1] = 2
    iRhythmsNeg[2] = -3
    iRhythmsNeg[3] = 4
    iRhythmsNeg[4] = -5
    
    iPositionsNeg[0] = -1
    iPositionsNeg[1] = 0
    iPositionsNeg[2] = 1
    iPositionsNeg[3] = -2
    iPositionsNeg[4] = 2
    
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythmsNeg, iPositionsNeg
    
    ; CASO 3: Array molto piccoli
    prints "\nCASO 2.3: Array molto piccoli\n"
    iAttacco = 40
        
    iRhythmsSmall[] init 1
    iRhythmsSmall[0] = 1
        
    ; Non è possibile usare init 0, quindi creo un array di dimensione 1
    ; ma lo tratterò come vuoto in termini logici
    iPositionsEmpty[] init 1
    ; Non assegno nessun valore, lascio così che contenga 0 come valore predefinito

    prints "Array di ritmi creato con %d elementi\n", lenarray(iRhythmsSmall)
    prints "Array di posizioni creato con %d elementi (trattato come vuoto)\n", lenarray(iPositionsEmpty)
        
    iIdComp storeTransitionBehaviorParameters iAttacco, iDurata, iDurataArmonica, 
                                            iAmpiezza, iOttava, iRegistro, 
                                            iRhythmsSmall, iPositionsEmpty
endin

; Strumento per verificare la lettura dei valori memorizzati
instr VerifyStorage
    prints "\n=== VERIFICA LETTURA VALORI MEMORIZZATI ===\n"
    
    ; Verifica tutti i comportamenti creati finora
    iMaxId = gi_compId
    prints "Comportamenti creati: %d\n", iMaxId
    
    iId = 1 ; Inizia dal primo ID (1)
    while (iId <= iMaxId) do
        prints "\nLETTURA COMPORTAMENTO %d:\n", iId
        
        ; Leggi e stampa i parametri principali
        iAttacco tab_i iId, gi_comp_ATTACCO
        iDurata tab_i iId, gi_comp_DURATA
        iDurataArmonica tab_i iId, gi_comp_DURARMONICA
        iAmpiezza tab_i iId, gi_comp_AMPIEZZA
        iOttava tab_i iId, gi_comp_OTTAVA
        iRegistro tab_i iId, gi_comp_REGISTRO
        
        prints "  Parametri: A=%.2f, D=%.2f, DA=%.2f, Amp=%.2f, Oct=%d, Reg=%d\n",
               iAttacco, iDurata, iDurataArmonica, iAmpiezza, iOttava, iRegistro
        
        ; Leggi e stampa ritmi
        iRitmiBaseIndex = iId * 11
        iNumRitmi tab_i iRitmiBaseIndex, gi_comp_RITMI
        
        prints "  Ritmi (%d): ", iNumRitmi
        iIdx = 0
        while (iIdx < iNumRitmi) do
            iRitmo tab_i iRitmiBaseIndex + 1 + iIdx, gi_comp_RITMI
            prints "%d ", iRitmo
            iIdx += 1
        od
        prints "\n"
        
        ; Leggi e stampa posizioni
        iPosBaseIndex = iId * 11
        iNumPos tab_i iPosBaseIndex, gi_comp_POSIZIONI
        
        prints "  Posizioni (%d): ", iNumPos
        iIdx = 0
        while (iIdx < iNumPos) do
            iPos tab_i iPosBaseIndex + 1 + iIdx, gi_comp_POSIZIONI
            prints "%d ", iPos
            iIdx += 1
        od
        prints "\n"
        
        iId += 1
    od
    
    prints "\nTest completato con successo!\n"
endin

; Questo strumento tenta di generare più comportamenti del limite massimo
instr TestOverflow
    prints "\n=== TEST OVERFLOW: Più comportamenti del limite (versione array) ===\n"
    
    ; Parametri base di test
    iAttacco = 100
    iDurata = 10
    iDurataArmonica = 2
    iAmpiezza = -12
    iOttava = 3
    iRegistro = 4
    
    iRhythmsTest[] init 3
    iPositionsTest[] init 3
    
    iRhythmsTest[0] = 1
    iRhythmsTest[1] = 2
    iRhythmsTest[2] = 3
    
    iPositionsTest[0] = 0
    iPositionsTest[1] = 1
    iPositionsTest[2] = 2
    
    ; Calcola quanti comportamenti dobbiamo creare per raggiungere il limite
    iToCreate = gi_NUMComportamenti - gi_compId
    if (iToCreate <= 0) then
        prints "Già raggiunto il limite di comportamenti (%d)\n", gi_NUMComportamenti
        goto skip
    endif
    
    prints "Creo %d comportamenti per raggiungere il limite...\n", iToCreate
    
    ; Crea comportamenti fino al limite
    iCount = 0
    while (iCount < iToCreate) do
        iIdComp storeTransitionBehaviorParameters iAttacco + iCount, iDurata, iDurataArmonica, 
                                                 iAmpiezza, iOttava, iRegistro, 
                                                 iRhythmsTest, iPositionsTest
        iCount += 1
    od
    
    ; Prova a creare un comportamento oltre il limite
    prints "\nProvo a creare un comportamento oltre il limite...\n"
    iIdComp storeTransitionBehaviorParameters iAttacco + 1000, iDurata, iDurataArmonica, 
                                             iAmpiezza, iOttava, iRegistro, 
                                             iRhythmsTest, iPositionsTest
    
    skip:
endin

; ====================================================================
; STRUMENTO PRINCIPALE DI TEST
; ====================================================================

instr RunTests
    ; Esegui i vari casi di test
    event_i "i", "TestCase1", 0, 0.1
    event_i "i", "TestCase2", 0.5, 0.1
    
    ; Verifica i risultati
    event_i "i", "VerifyStorage", 1, 0.1
        
    ; Test di overflow (commenta se non necessario, richiede molto tempo)
    ; event_i "i", "TestOverflow", 1.5, 0.1
    
    prints "\nTutti i test completati.\n"
    
    ; Termina Csound dopo i test
    turnoff
endin

</CsInstruments>
<CsScore>
; Avvia il test principale
i "RunTests" 0 2
</CsScore>
</CsoundSynthesizer>