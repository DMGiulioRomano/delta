<CsoundSynthesizer>
<CsOptions>
-m0 ; Disattiva l'audio, eseguiamo solo test
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


; ===========================================================================
; OPCODE PER GENERAZIONE RITMI VERAMENTE CAOTICI
; ===========================================================================
; Genera valori ritmici con comportamento controllabile dal deterministico al caotico
; Input:
;   iX          - Valore precedente (seme iniziale)
;   iMode       - Modalità di comportamento:
;                 0 = convergente (tende a stabilizzarsi su pochi valori)
;                 1 = periodico (cicla tra pochi valori)
;                 2 = caotico (comportamento irregolare ma con pattern)
;                 3 = caotico vero (completamente imprevedibile ma controllato)
;   iMinVal     - Valore minimo di output (default = 1)
;   iMaxVal     - Valore massimo di output (default = 35)
; Output:
;   iResult     - Nuovo valore ritmico generato (intero tra iMinVal e iMaxVal)
; ===========================================================================
opcode NonlinearFunc, i, ipoo
  iX, iMode, iMinVal, iMaxVal xin
  
  ; Valori di default per min/max se non specificati
  iMinVal = (iMinVal == 0) ? 1 : iMinVal
  iMaxVal = (iMaxVal == 0) ? 35 : iMaxVal
  
  ; Assicurati che iX sia entro limiti sensati
  iX = limit(iX, 1, 100)
  
  ; Pi greco per calcoli trigonometrici
  iPI = 4 * taninv(1.0)  
  
  ; Risultato temporaneo
  iTemp = 0
  
  if iMode == 0 then
    ; ===================================================================
    ; MODALITÀ 0: CONVERGENTE
    ; ===================================================================
    iR = 2.8
    ; Formula logistica con parametri moderati
    iTemp = iR * iX * (1 - iX/40)
    
  elseif iMode == 1 then
    ; ===================================================================
    ; MODALITÀ 1: PERIODICA
    ; ===================================================================
    ; Mappa non lineare che genera cicli prevedibili
    iP1 = sin(iX * iPI/18)
    iP2 = cos(iX * iPI/10)
    iTemp = abs(iP1 * iP2) * 20 + 10
    
  elseif iMode == 2 then
    ; ===================================================================
    ; MODALITÀ 2: CAOTICA DETERMINISTICA
    ; ===================================================================
    ; Mappa logistica in regime caotico
    iR = 3.99
    
    ; Normalizza iX per la mappa logistica
    iNormX = (iX % 100) / 100
    iNormX = limit(iNormX, 0.01, 0.99)  ; Evita i bordi
    
    ; Calcola il prossimo valore con la mappa logistica
    iLogistic = iR * iNormX * (1 - iNormX)
    
    ; Aggiungi una piccola componente di rumore controllato (5%)
    iNoise = random:i(-0.05, 0.05)
    iLogistic = limit(iLogistic + iNoise, 0, 1)
    
    ; Mappa al range di output
    iRange = iMaxVal - iMinVal + 1
    iTemp = iMinVal + (iLogistic * iRange)
    
  else
    ; ===================================================================
    ; MODALITÀ 3: CAOS VERO (STOCASTICO)
    ; ===================================================================
    
    ; Combina determinismo con casualità in proporzioni controllate
    
    ; 1. COMPONENTE DETERMINISTICA (60%)
    ; Utilizzo di una formula caotica complessa
    iSeed1 = (iX * 1.3) % 10
    iSeed2 = (iX * 0.7) % 10
    iSeed3 = (iX * 2.5) % 10
    
    iNonlinear1 = abs(sin(iSeed1 * iPI/5 + iSeed2))
    iNonlinear2 = abs(cos(iSeed2 * iPI/3 + iSeed3))
    iNonlinear3 = abs(tan(iSeed3 * iPI/7 + iSeed1) % 1)
    
    iDeterministic = (iNonlinear1 + iNonlinear2 + iNonlinear3) / 3
    
    ; 2. COMPONENTE CASUALE (40%)
    iRandom = random:i(0, 1)
    
    ; 3. COMBINA LE DUE COMPONENTI
    iMixRatio = 0.6  ; 60% deterministico, 40% casuale
    iCombined = (iDeterministic * iMixRatio) + (iRandom * (1 - iMixRatio))
    
    ; 4. PERTURBAZIONE BASATA SU VALORI PASSATI
    iPerturbation = 0
    if (iX % 7 == 0) then 
      ; Ogni 7 valori, introduci una variazione importante
      iPerturbation = random:i(-0.3, 0.3)
    endif
    
    ; 5. RISULTATO FINALE MAPPATO AL RANGE RICHIESTO
    iRange = iMaxVal - iMinVal + 1
    iTemp = iMinVal + (iCombined * iRange) + (iPerturbation * iRange)
  endif
  
  ; Garantisci che il risultato sia sempre un intero nell'intervallo [iMinVal, iMaxVal]
  iResult = max(iMinVal, min(iMaxVal, round(iTemp)))
  
  xout iResult
endop


; ===========================================================================
; FUNZIONE PER CALCOLARE ENTROPIA DEI VALORI GENERATI
; Più alta è l'entropia, più caotico è il sistema
; ===========================================================================
opcode CalculateEntropy, i, i[]i
  iValues[], iLength xin
  
  ; Conta le occorrenze di ogni valore
  iMaxValue = 0
  iIdx = 0
  while iIdx < iLength do
    iMaxValue = max(iMaxValue, iValues[iIdx])
    iIdx += 1
  od
  
  ; Crea un array per contare le occorrenze
  iCounts[] init iMaxValue + 1
  
  ; Conta le occorrenze
  iIdx = 0
  while iIdx < iLength do
    iValue = iValues[iIdx]
    iCounts[iValue] = iCounts[iValue] + 1
    iIdx += 1
  od
  
  ; Calcola l'entropia
  iEntropy = 0
  iIdx = 0
  while iIdx <= iMaxValue do
    if iCounts[iIdx] > 0 then
      iProb = iCounts[iIdx] / iLength
      iEntropy -= iProb * log2(iProb)
    endif
    iIdx += 1
  od
  
  ; Normalizza l'entropia rispetto al massimo possibile
  iMaxEntropy = log2(iMaxValue + 1)
  if iMaxEntropy > 0 then
    iEntropyNormalized = iEntropy / iMaxEntropy
  else
    iEntropyNormalized = 0
  endif
  
  xout iEntropyNormalized
endop

; ===========================================================================
; STRUMENTO DI TEST PER NonlinearFunc
; ===========================================================================
; p4 = modalità (0=convergente, 1=periodica, 2=caotica, 3=caotica avanzata)
; p5 = valore iniziale (seme)
; p6 = numero di iterazioni
; p7 = valore minimo
; p8 = valore massimo
; ===========================================================================
instr TestNonlinearFunc
    ; Parametri di input
    iMode = p4
    iInitialValue = p5
    iIterations = p6
    iMinVal = p7
    iMaxVal = p8
    
    ; Nome per la modalità corrente
    SmodeName = "sconosciuta"
    if iMode == 0 then
        SmodeName = "convergente"
    elseif iMode == 1 then
        SmodeName = "periodica"
    elseif iMode == 2 then
        SmodeName = "caotica"
    elseif iMode == 3 then
        SmodeName = "caotica avanzata"
    endif
    
    prints "\n==================================================\n"
    prints "TEST NonlinearFunc - Modalità %d (%s)\n", iMode, SmodeName
    prints "Seme iniziale: %d, Intervallo: [%d, %d]\n", iInitialValue, iMinVal, iMaxVal
    prints "==================================================\n\n"
    
    ; Creiamo una tabella per memorizzare i risultati
    iResultsTable ftgen 0, 0, iIterations + 1, -2, 0
    
    ; Inizializza con il valore iniziale
    iCurrentValue = iInitialValue
    tabw_i iCurrentValue, 0, iResultsTable
    
    ; Esegui le iterazioni
    iIteration = 1
    while iIteration <= iIterations do
        iCurrentValue NonlinearFunc iCurrentValue, iMode, iMinVal, iMaxVal
        tabw_i iCurrentValue, iIteration, iResultsTable
        
        ; Stampa ogni valore generato
        prints "Iterazione %3d: %d\n", iIteration, iCurrentValue
        
        iIteration += 1
    od
    
    ; Analisi dei risultati
    iSum = 0
    iMin = iMaxVal
    iMax = iMinVal
    iUniqueValues ftgen 0, 0, iMaxVal - iMinVal + 1, -2, 0  ; Per contare valori unici
    
    ; Prepara array per calcolo entropia
    iValuesArray[] init iIterations + 1
    
    iIdx = 0
    while iIdx <= iIterations do
        iValue tab_i iIdx, iResultsTable
        iValuesArray[iIdx] = iValue
        iSum += iValue
        
        ; Aggiorna min/max
        iMin = iValue < iMin ? iValue : iMin
        iMax = iValue > iMax ? iValue : iMax
        
        ; Incrementa conteggio per questo valore
        iValueIndex = iValue - iMinVal
        iCount tab_i iValueIndex, iUniqueValues
        tabw_i iCount + 1, iValueIndex, iUniqueValues
        
        iIdx += 1
    od
    
    ; Calcola la media
    iAverage = iSum / (iIterations + 1)
    
    ; Conta i valori unici effettivamente utilizzati
    iUniqueCount = 0
    iValueIdx = 0
    while iValueIdx <= (iMaxVal - iMinVal) do
        iCount tab_i iValueIdx, iUniqueValues
        if iCount > 0 then
            iUniqueCount += 1
        endif
        iValueIdx += 1
    od
    
    ; Calcola l'entropia
    iEntropy CalculateEntropy iValuesArray, iIterations + 1
    
    ; Stampa le statistiche
    prints "\n--- STATISTICHE ---\n"
    prints "Media: %.2f\n", iAverage
    prints "Minimo: %d\n", iMin
    prints "Massimo: %d\n", iMax
    prints "Valori unici generati: %d su %d possibili\n", iUniqueCount, iMaxVal - iMinVal + 1
    prints "Percentuale utilizzo range: %.1f%%\n", (iUniqueCount * 100) / (iMaxVal - iMinVal + 1)
    prints "Entropia normalizzata: %.3f (0=deterministico, 1=completamente caotico)\n", iEntropy
    
    ; Stampa i valori più frequenti
    prints "\n--- VALORI PIÙ FREQUENTI ---\n"
    iThreshold = iIterations / 20  ; Mostra solo valori che appaiono > 5% delle volte
    
    iValueIdx = 0
    while iValueIdx <= (iMaxVal - iMinVal) do
        iCount tab_i iValueIdx, iUniqueValues
        if iCount > iThreshold then
            iActualValue = iMinVal + iValueIdx
            iPercentage = (iCount * 100) / (iIterations + 1)
            prints "Valore %d: %d occorrenze (%.1f%%)\n", 
                  iActualValue, iCount, iPercentage
        endif
        iValueIdx += 1
    od
    
    prints "\n--------------------------------------------------\n"
    
    ; Test per serie ripetute (pattern)
    prints "\n--- ANALISI PATTERN ---\n"
    
    ; Cerca pattern di lunghezza 2-5
    iMaxPatternLength = 5
    iPatternLength = 2
    
    while iPatternLength <= iMaxPatternLength do
        iPatternCount = 0
        
        ; Cerca pattern di lunghezza iPatternLength
        iStartIdx = 0
        while iStartIdx <= iIterations - (2 * iPatternLength) do
            ; Verifica se c'è un pattern a partire da questo indice
            iPattern[] init iPatternLength
            iIdx = 0
            while iIdx < iPatternLength do
                iPattern[iIdx] = tab_i(iStartIdx + iIdx, iResultsTable)
                iIdx += 1
            od
            
            ; Cerca dove si ripete questo pattern
            iRepeatStart = iStartIdx + iPatternLength
            while iRepeatStart <= iIterations - iPatternLength do
                iMatches = 1
                iIdx = 0
                while iIdx < iPatternLength do
                    if tab_i(iRepeatStart + iIdx, iResultsTable) != iPattern[iIdx] then
                        iMatches = 0
                        igoto patternMismatch
                    endif
                    iIdx += 1
                od
                
                ; Se arriva qui, il pattern corrisponde
                iPatternCount += 1
                
                ; Stampa il pattern trovato
                SpatternStr = ""
                iIdx = 0
                while iIdx < iPatternLength do
                    SpatternStr = strcat(SpatternStr, sprintf("%d ", iPattern[iIdx]))
                    iIdx += 1
                od
                
                prints "Pattern trovato: [%s] alle posizioni %d e %d\n", 
                      SpatternStr, iStartIdx, iRepeatStart
                
                patternMismatch:
                iRepeatStart += 1
            od
            
            iStartIdx += 1
        od
        
        if iPatternCount == 0 then
            prints "Nessun pattern di lunghezza %d trovato\n", iPatternLength
        endif
        
        iPatternLength += 1
    od
    
    prints "\n==================================================\n\n"
endin

; Strumento per testare più modalità in sequenza
instr RunAllTests
    ; Parametri comuni
    iIterations = 50
    iMinVal = 1
    iMaxVal = 35
    
    ; Testa modalità convergente
    schedule "TestNonlinearFunc", 0, 0.1, 0, 15, iIterations, iMinVal, iMaxVal
    
    ; Testa modalità periodica
    schedule "TestNonlinearFunc", 0.2, 0.1, 1, 15, iIterations, iMinVal, iMaxVal
    
    ; Testa modalità caotica
    schedule "TestNonlinearFunc", 0.3, 0.1, 2, 15, iIterations, iMinVal, iMaxVal
    
    ; Testa modalità caotica avanzata
    schedule "TestNonlinearFunc", 0.4, 0.1, 3, 15, iIterations, iMinVal, iMaxVal
        
    ; Test con seed diversi in modalità caotica
    schedule "TestNonlinearFunc", 0.7, 0.1, 2, 5, iIterations, iMinVal, iMaxVal
    schedule "TestNonlinearFunc", 0.8, 0.1, 2, 25, iIterations, iMinVal, iMaxVal
    schedule "TestNonlinearFunc", 0.9, 0.1, 3, 5, iIterations, iMinVal, iMaxVal
    schedule "TestNonlinearFunc", 1.0, 0.1, 3, 25, iIterations, iMinVal, iMaxVal
endin

</CsInstruments>
<CsScore>
; Avvia tutti i test in sequenza
i "RunAllTests" 0 1

e 1
</CsScore>
</CsoundSynthesizer>