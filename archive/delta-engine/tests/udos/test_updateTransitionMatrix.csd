<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Definizione delle tabelle globali necessarie
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0  ; Matrice di transizione (27x27)
gi_asp_learning_rate init 0.1                  ; Tasso di apprendimento

; Implementazione dell'UDO updateTransitionMatrix
opcode updateTransitionMatrix, 0, iiii
    iFromStateIdx, iToStateIdx, iQuality, iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? 1 : iDebugLevel
    
    ; Bounds checking
    if (iFromStateIdx < 0 || iFromStateIdx >= 27 || 
        iToStateIdx < 0 || iToStateIdx >= 27) then
        if (iDebugLevel >= 1) then
            prints "ERRORE: Indici di stato non validi in updateTransitionMatrix (%d,%d)\n",
                   iFromStateIdx, iToStateIdx
        endif
        igoto end
    endif
    
    ; Read current probability
    iCurrentProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    ; Calculate learning rate with quality-based adjustment
    iLearningFactor = gi_asp_learning_rate
    if (iQuality > 0.8) then
        ; For very successful transitions, learn more
        iLearningFactor *= 1.5
    elseif (iQuality < 0.4) then
        ; For poor transitions, learn less
        iLearningFactor *= 0.5
    endif

    ; Calculate quality-based adjustment (centered at 0.5)
    iAdjustment = (iQuality - 0.5) * iLearningFactor  

    ; Apply adjustment with bounds checking
    iNewProb = iCurrentProb + iAdjustment
    iNewProb = limit(iNewProb, 0.01, 0.99)  ; Ensure we don't hit extremes
    
    tabw_i iNewProb, iFromStateIdx*27+iToStateIdx, gi_transition_matrix

    ; Record this learning event for validation
    iCurrentTime times
    Sfilename = "docs/analysis/learning_events.csv"
    
    ; Check if file exists - create if needed
    iSystem system_i 1, sprintf("test -e %s || echo 'time,from_state,to_state,quality,adjustment,new_prob' > %s", 
                                Sfilename, Sfilename)
    
    ; Append the data
    fprints Sfilename, "%.2f,%d,%d,%.4f,%.4f,%.4f\n", 
            iCurrentTime, iFromStateIdx, iToStateIdx, iQuality, iAdjustment, iNewProb

    ; Renormalize row to ensure probabilities sum to 1
    iSum = 0
    iToIdx = 0
    while (iToIdx < 27) do
        iProb tab_i iFromStateIdx*27+iToIdx, gi_transition_matrix
        iSum += iProb
        iToIdx += 1
    od
    
    if (iSum > 0) then
        iToIdx = 0
        while (iToIdx < 27) do
            iProb tab_i iFromStateIdx*27+iToIdx, gi_transition_matrix
            iNormProb = iProb / iSum
            tabw_i iNormProb, iFromStateIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
    endif
    
    if (iDebugLevel >= 2) then
        iFromDens = int(iFromStateIdx / 9)
        iFromRem = iFromStateIdx % 9
        iFromReg = int(iFromRem / 3)
        iFromMov = iFromRem % 3
        
        iToDens = int(iToStateIdx / 9)
        iToRem = iToStateIdx % 9
        iToReg = int(iToRem / 3)
        iToMov = iToRem % 3
        
        prints "Matrice di transizione aggiornata: [%d,%d,%d] a [%d,%d,%d], prob: %.4f → %.4f\n",
               iFromDens, iFromReg, iFromMov,
               iToDens, iToReg, iToMov,
               iCurrentProb, iNewProb
    endif
    end:
endop

; Inizializza la matrice con probabilità predefinite per il test
instr InitMatrix
    ; Crea le directory per il log se non esistono
    iRes system_i 1, "mkdir -p docs/analysis", 0
    
    ; Ciclo attraverso tutti gli stati
    iFromIdx = 0
    while (iFromIdx < 27) do
        ; Imposta probabilità iniziale uniforme per tutti gli stati
        iToIdx = 0
        while (iToIdx < 27) do
            ; Imposta una bassa probabilità di base (1/27 ~ 0.037)
            tabw_i 0.037, iFromIdx*27+iToIdx, gi_transition_matrix
            iToIdx += 1
        od
        
        ; Preferenza leggermente più alta a rimanere nello stesso stato
        tabw_i 0.05, iFromIdx*27+iFromIdx, gi_transition_matrix
        
        ; Normalizza la riga
        iSum = 0
        iToIdx = 0
        while (iToIdx < 27) do
            iSum += tab_i(iFromIdx*27+iToIdx, gi_transition_matrix)
            iToIdx += 1
        od
        
        if (iSum > 0) then
            iToIdx = 0
            while (iToIdx < 27) do
                iProb = tab_i(iFromIdx*27+iToIdx, gi_transition_matrix)
                iNormProb = iProb / iSum
                tabw_i iNormProb, iFromIdx*27+iToIdx, gi_transition_matrix
                iToIdx += 1
            od
        endif
        
        iFromIdx += 1
    od
    
    prints "Matrice inizializzata con valori uniformi\n"
    turnoff
endin

; Strumento di test per aggiornare le probabilità di transizione
instr TestUpdate
    ; Componenti degli stati di origine e destinazione
    iFromDensity = p4
    iFromRegister = p5
    iFromMovement = p6
    iToDensity = p7
    iToRegister = p8
    iToMovement = p9
    iQuality = p10
    
    ; Converte in indici di stato
    iFromStateIdx = (iFromDensity * 9) + (iFromRegister * 3) + iFromMovement
    iToStateIdx = (iToDensity * 9) + (iToRegister * 3) + iToMovement
    
    ; Ottiene la probabilità attuale prima dell'aggiornamento
    iCurrentProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    prints "\nTest di aggiornamento: [%d,%d,%d] a [%d,%d,%d] con qualità %.2f\n", 
           iFromDensity, iFromRegister, iFromMovement,
           iToDensity, iToRegister, iToMovement,
           iQuality
    prints "Probabilità attuale: %.4f\n", iCurrentProb
    
    ; Aggiorna la matrice di transizione
    updateTransitionMatrix iFromStateIdx, iToStateIdx, iQuality, 2
    
    ; Ottiene la nuova probabilità dopo l'aggiornamento
    iNewProb tab_i iFromStateIdx*27+iToStateIdx, gi_transition_matrix
    
    prints "Nuova probabilità: %.4f\n", iNewProb
    prints "Differenza: %.4f\n", iNewProb - iCurrentProb
    
    turnoff
endin

; Stampa una parte della matrice di transizione
instr PrintMatrix
    iStartRow = p4
    iNumRows = p5
    
    prints "\nMatrice di Transizione Parziale (righe %d a %d):\n", iStartRow, iStartRow + iNumRows - 1
    prints "----------------------------------------------\n"
    
    iRowIdx = iStartRow
    while (iRowIdx < iStartRow + iNumRows && iRowIdx < 27) do
        ; Converte l'indice di riga in componenti di stato
        iDensity = int(iRowIdx / 9)
        iRemainder = iRowIdx % 9
        iRegister = int(iRemainder / 3)
        iMovement = iRemainder % 3
        
        prints "Stato [%d,%d,%d] (%d) transizioni:\n", 
               iDensity, iRegister, iMovement, iRowIdx
        
        ; Stampa le 5 probabilità più alte per questa riga
        prints "  Transizioni più probabili: "
        
        ; Metodo alternativo più sicuro: accumula le probabilità in un array temporaneo
        iProbArray[] init 27
        iStateIdx[] init 27
        
        ; Copia tutte le probabilità della riga in array
        iColIdx = 0
        while (iColIdx < 27) do
            iProbArray[iColIdx] = tab_i(iRowIdx*27+iColIdx, gi_transition_matrix)
            iStateIdx[iColIdx] = iColIdx
            iColIdx += 1
        od
        
        ; Bubble sort semplificato per trovare le 5 più alte (più sicuro)
        iSize = 27
        iOuterIdx = 0
        while (iOuterIdx < 5 && iOuterIdx < iSize-1) do
            iInnerIdx = iSize-1
            while (iInnerIdx > iOuterIdx) do
                if (iProbArray[iInnerIdx] > iProbArray[iInnerIdx-1]) then
                    ; Scambia le probabilità
                    iTempProb = iProbArray[iInnerIdx]
                    iProbArray[iInnerIdx] = iProbArray[iInnerIdx-1]
                    iProbArray[iInnerIdx-1] = iTempProb
                    
                    ; Scambia anche gli indici di stato
                    iTempIdx = iStateIdx[iInnerIdx]
                    iStateIdx[iInnerIdx] = iStateIdx[iInnerIdx-1]
                    iStateIdx[iInnerIdx-1] = iTempIdx
                endif
                iInnerIdx -= 1
            od
            iOuterIdx += 1
        od
        
        ; Stampa le prime 5 probabilità (o meno se non ci sono abbastanza)
        iIdx = 0
        iMaxToPrint = min(5, iSize)
        while (iIdx < iMaxToPrint) do
            ; Solo se la probabilità è significativa
            if (iProbArray[iIdx] > 0.01) then
                iToIdx = iStateIdx[iIdx]
                iToD = int(iToIdx / 9)
                iToR = int((iToIdx % 9) / 3)
                iToM = (iToIdx % 9) % 3
                
                prints "[%d,%d,%d]=%.3f ", iToD, iToR, iToM, iProbArray[iIdx]
            endif
            iIdx += 1
        od
        prints "\n"
        
        iRowIdx += 1
    od
    
    prints "----------------------------------------------\n"
    turnoff
endin

; Strumento di controllo file di log
instr CheckLogFile
    prints "\nVerifica file di log...\n"
    SFileName = "docs/analysis/learning_events.csv"
    
    ; Controlla se il file esiste
    iRes system_i 1, sprintf("test -e %s", SFileName)
    
    if (iRes == 0) then
        prints "File CSV creato correttamente: %s\n", SFileName
        ; Mostra le prime righe del file
        iRes2 system_i 1, sprintf("head -n 5 %s", SFileName)
    else
        prints "ERRORE: File CSV non trovato: %s\n", SFileName
    endif
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Inizializza la matrice
i "InitMatrix" 0 0.1

; Attendi un po'
t 0 60

; Test con aggiornamenti di qualità diversa
; p4-p6: stato sorgente [D,R,M]
; p7-p9: stato target [D,R,M]
; p10: qualità (0.0-1.0)

; Test transizioni ad alta qualità
i "TestUpdate" 1 0.1 0 0 0 1 0 0 0.9  ; Qualità molto alta
i "TestUpdate" 2 0.1 0 0 0 1 0 0 0.8  ; Nuovamente qualità alta

; Stampa la parte rilevante della matrice
i "PrintMatrix" 3 0.1 0 3

; Test transizioni di qualità media
i "TestUpdate" 4 0.1 0 0 0 0 1 0 0.5  ; Qualità neutra

; Stampa ancora la matrice
i "PrintMatrix" 5 0.1 0 3

; Test transizioni di bassa qualità
i "TestUpdate" 6 0.1 0 0 0 0 0 1 0.2  ; Qualità bassa

; Stampa ancora la matrice
i "PrintMatrix" 7 0.1 0 3

; Test stati sorgente diversi
i "TestUpdate" 8 0.1 1 1 1 2 2 2 0.9  ; Stato diverso, qualità alta

; Stampa la matrice per questo stato
i "PrintMatrix" 9 0.1 13 3

; Test stati non validi (dovrebbe mostrare un messaggio di errore)
i "TestUpdate" 10 0.1 -1 0 0 1 0 0 0.8  ; Sorgente non valida
i "TestUpdate" 11 0.1 0 0 0 3 0 0 0.8   ; Target non valido

; Controlla il file di log
i "CheckLogFile" 12 0.1

e
</CsScore>
</CsoundSynthesizer>