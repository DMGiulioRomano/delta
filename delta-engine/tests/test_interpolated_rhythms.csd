<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, display messages only
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Set debug level to see detailed output
gi_debug init 2

; Include the necessary UDOs
#include "../MACROS/first.orc"
#include "../udos/interpolations.udo"
#include "../udos/stateMapping.udo"
#include "../udos/generateInterpolatedRhythms.udo"

; Strumento di test per generazione base
instr TestBasicGeneration
    prints "\n=== TEST 1: Generazione Base Ritmi ===\n"
    prints "Generazione tabelle ritmi per diversi stati di movimento\n"
    
    ; Test per ogni stato di movimento
    iMovementState = 0 ; Statico
    iRhythmTable = generateInterpolatedRhythms(iMovementState, iMovementState, 0, 5)
    
    ; Stampa valori ritmi
    prints "\nMovimento Statico (0) Ritmi: ["
    iIdx = 0
    iSum = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iSum += iVal
        iIdx += 1
    od
    prints "]\n"
    prints "Media: %.2f\n", iSum/5
    
    ; Test movimento moderato
    iMovementState = 1 ; Moderato
    iRhythmTable = generateInterpolatedRhythms(iMovementState, iMovementState, 0, 5)
    
    ; Stampa valori ritmi
    prints "\nMovimento Moderato (1) Ritmi: ["
    iIdx = 0
    iSum = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iSum += iVal
        iIdx += 1
    od
    prints "]\n"
    prints "Media: %.2f\n", iSum/5
    
    ; Test movimento dinamico
    iMovementState = 2 ; Dinamico
    iRhythmTable = generateInterpolatedRhythms(iMovementState, iMovementState, 0, 5)
    
    ; Stampa valori ritmi
    prints "\nMovimento Dinamico (2) Ritmi: ["
    iIdx = 0
    iSum = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iSum += iVal
        iIdx += 1
    od
    prints "]\n"
    prints "Media: %.2f\n", iSum/5
    
    prints "\nTest 1 Completato\n\n"
    turnoff
endin

; Strumento di test per interpolazione tra stati
instr TestInterpolation
    prints "\n=== TEST 2: Interpolazione Tra Stati ===\n"
    
    ; Stati sorgente e target
    iSourceMovement = 0 ; Statico
    iTargetMovement = 2 ; Dinamico
    
    ; Test con diversi valori di progresso interpolazione
    iProgressValues[] fillarray 0, 0.25, 0.5, 0.75, 1
    iNumProgress = lenarray(iProgressValues)
    
    iProgressIdx = 0
    while iProgressIdx < iNumProgress do
        iProgress = iProgressValues[iProgressIdx]
        
        prints "\nProgresso Interpolazione: %.2f\n", iProgress
        
        ; Genera ritmi con questo valore di progresso
        iRhythmTable = generateInterpolatedRhythms(iSourceMovement, iTargetMovement, iProgress, 8)
        
        ; Stampa valori ritmi
        prints "Ritmi: ["
        iIdx = 0
        iSum = 0
        iMin = 999
        iMax = 0
        while iIdx < 8 do
            if iIdx > 0 then
                prints ", "
            endif
            iVal = tab_i(iIdx, iRhythmTable)
            iMin = iVal < iMin ? iVal : iMin
            iMax = iVal > iMax ? iVal : iMax
            prints "%d", iVal
            iSum += iVal
            iIdx += 1
        od
        prints "]\n"
        prints "Min: %d, Max: %d, Media: %.2f\n", iMin, iMax, iSum/8
        
        iProgressIdx += 1
    od
    
    prints "\nTest 2 Completato\n\n"
    turnoff
endin

; Strumento di test per valori estremi
instr TestExtremeValues
    prints "\n=== TEST 4: Casi Limite ed Estremi ===\n"
    
    ; Test 1: Progresso zero
    iProgress = 0
    iRhythmTable = generateInterpolatedRhythms(0, 2, iProgress, 5)
    
    prints "Progresso zero (dovrebbe essere identico allo stato sorgente 0):\n"
    prints "Ritmi: ["
    iIdx = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iIdx += 1
    od
    prints "]\n"
    
    ; Test 2: Progresso completo
    iProgress = 1
    iRhythmTable = generateInterpolatedRhythms(0, 2, iProgress, 5)
    
    prints "\nProgresso completo (dovrebbe essere identico allo stato target 2):\n"
    prints "Ritmi: ["
    iIdx = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iIdx += 1
    od
    prints "]\n"
    
    ; Test 3: Progresso fuori range
    iProgress = 1.5  ; Dovrebbe essere limitato a 1.0
    iRhythmTable = generateInterpolatedRhythms(0, 2, iProgress, 5)
    
    prints "\nProgresso fuori range (1.5, dovrebbe essere limitato a 1.0):\n"
    prints "Ritmi: ["
    iIdx = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iIdx += 1
    od
    prints "]\n"
    
    ; Test 4: Stessi stati sorgente e target
    iRhythmTable = generateInterpolatedRhythms(1, 1, 0.5, 5)
    
    prints "\nStessi stati sorgente e target (stato 1, progresso 0.5):\n"
    prints "Ritmi: ["
    iIdx = 0
    while iIdx < 5 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iIdx += 1
    od
    prints "]\n"
    
    ; Test 5: Dimensione tabella estrema
    iRhythmTable = generateInterpolatedRhythms(0, 2, 0.5, 15)
    
    prints "\nGrande dimensione tabella (15):\n"
    prints "Ritmi: ["
    iIdx = 0
    while iIdx < 15 do
        if iIdx > 0 then
            prints ", "
        endif
        iVal = tab_i(iIdx, iRhythmTable)
        prints "%d", iVal
        iIdx += 1
    od
    prints "]\n"
    
    prints "\nTest 4 Completato\n\n"
    turnoff
endin

; Strumento di test per misurazioni delle prestazioni
instr TestPerformance
    prints "\n=== TEST 5: Misurazione Prestazioni ===\n"
    
    ; Numero di iterazioni per il test
    iNumIterations = 1000
    
    ; Avvia timer
    iStartTime times
    
    ; Esegui molte generazioni di ritmi
    iIter = 0
    while iIter < iNumIterations do
        iProgress = iIter / iNumIterations
        iSourceMovement = 0
        iTargetMovement = 2
        
        iRhythmTable = generateInterpolatedRhythms(iSourceMovement, iTargetMovement, iProgress, 5)
        
        iIter += 1
    od
    
    ; Termina timer
    iEndTime times
    iTotalTime = iEndTime - iStartTime
    
    prints "Generate %d tabelle ritmi in %.4f secondi\n", iNumIterations, iTotalTime
    prints "Tempo medio per generazione: %.6f secondi\n", iTotalTime / iNumIterations
    
    prints "\nTest 5 Completato\n\n"
    turnoff
endin

; Strumento combinato per test
instr RunAllTests
    prints "\n========================================\n"
    prints "TEST OPCODE generateInterpolatedRhythms\n"
    prints "========================================\n"
    
    ; Esegui test in sequenza
    schedule "TestBasicGeneration", 0, 0.1
    schedule "TestInterpolation", 0.2, 0.1
    schedule "TestSeeds", 0.4, 0.1
    schedule "TestExtremeValues", 0.6, 0.1
    schedule "TestPerformance", 0.8, 0.1
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Esegui tutti i test
i "RunAllTests" 0 1
e
</CsScore>
</CsoundSynthesizer>