<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Importa i file necessari
#include "../MACROS/first.orc"
#include "../udos/utils.udo"
#include "determineState.udo"
#include "../udos/stateTransition.udo"
#include "../orc/SaveTransitionMatrix.orc"

; Output test file
giTestOutputFile ftgen 0, 0, 16, -2, 0
giStateSequenceFile ftgen 0, 0, 8000, -2, 0

; Strumento per testare initTransitionMatrix e selectNextState
instr TestTransitionMatrix
    prints "\n=== TEST: Inizializzazione matrice di transizione ===\n"
    
    ; Inizializza la matrice con le probabilità predefinite
    initTransitionMatrix
    
    ; Verifica alcune celle della matrice per controllare che sia stata inizializzata
    iSameState = tab_i 0*27+0, gi_transition_matrix  ; Prob di rimanere nello stato [0,0,0]
    iSmallChange = tab_i 0*27+1, gi_transition_matrix  ; Prob di passare da [0,0,0] a [0,0,1]
    iLargeChange = tab_i 0*27+26, gi_transition_matrix  ; Prob di passare da [0,0,0] a [2,2,2]
    
    prints "Probabilità stato [0,0,0] -> [0,0,0]: %.4f\n", iSameState
    prints "Probabilità stato [0,0,0] -> [0,0,1]: %.4f\n", iSmallChange
    prints "Probabilità stato [0,0,0] -> [2,2,2]: %.4f\n", iLargeChange
    
    ; Verifica che la somma delle probabilità di transizione da uno stato sia 1
    iSum = 0
    iStateIdx = 0
    while iStateIdx < 27 do
        iProb tab_i 0*27+iStateIdx, gi_transition_matrix
        iSum += iProb
        iStateIdx += 1
    od
    
    prints "Somma delle probabilità di transizione da [0,0,0]: %.4f (dovrebbe essere 1.0)\n", iSum
    
    ; Avvia il test di selectNextState
    schedule "TestSelectNextState", 0, 0.1, 0, 0, 0
endin

; Strumento per testare selectNextState con una sequenza di transizioni
instr TestSelectNextState
    iCurrentDensity = p4
    iCurrentRegister = p5
    iCurrentMovement = p6
    iNumTests = 1000  ; Numero di transizioni da testare
    iSeqIdx = 0  ; Indice per salvare la sequenza
    
    prints "\n=== TEST: Selezione del prossimo stato ===\n"
    prints "Stato iniziale: [%d,%d,%d]\n", iCurrentDensity, iCurrentRegister, iCurrentMovement
    
    ; Esegui test multipli e conta le frequenze di ogni transizione
    iStateCounters[] init 27
    iTestIdx = 0
    while iTestIdx < iNumTests do
        iNextDensity, iNextRegister, iNextMovement selectNextState iCurrentDensity, iCurrentRegister, iCurrentMovement
        
        ; Calcola l'indice dello stato selezionato
        iSelectedStateIdx = (iNextDensity * 9) + (iNextRegister * 3) + iNextMovement
        
        ; Incrementa il contatore per questo stato
        iStateCounters[iSelectedStateIdx] += 1
        
        ; Salva nella sequenza
        tabw_i iNextDensity, iSeqIdx, giStateSequenceFile
        tabw_i iNextRegister, iSeqIdx+1, giStateSequenceFile
        tabw_i iNextMovement, iSeqIdx+2, giStateSequenceFile
        iSeqIdx += 3
        
        ; Imposta il nuovo stato corrente per la prossima iterazione
        iCurrentDensity = iNextDensity
        iCurrentRegister = iNextRegister
        iCurrentMovement = iNextMovement
        
        iTestIdx += 1
    od
    
    ; Calcola l'indice dello stato di partenza
    iCurrentStateIdx = (p4 * 9) + (p5 * 3) + p6
    
    ; Stampa la distribuzione osservata delle transizioni
    prints "\nDistribuzione osservata delle transizioni (dopo %d test):\n", iNumTests
    prints "Stato di partenza: [%d,%d,%d] (indice %d)\n", p4, p5, p6, iCurrentStateIdx
    
    ; Stampa le N transizioni più frequenti per compattezza
    iMaxTransitions = 10  ; Massimo numero di transizioni da stampare
    
    ; Trova le N transizioni più frequenti
    iTopStates[] init iMaxTransitions
    iTopCounts[] init iMaxTransitions
    
    iIdx = 0
    while iIdx < 27 do
        iCount = iStateCounters[iIdx]
        
        ; Controllo se questo stato dovrebbe essere tra i top
        iMinInTop = 999999
        iMinIdx = -1
        
        iTopIdx = 0
        while iTopIdx < iMaxTransitions do
            if iTopCounts[iTopIdx] < iMinInTop then
                iMinInTop = iTopCounts[iTopIdx]
                iMinIdx = iTopIdx
            endif
            iTopIdx += 1
        od
        
        if iCount > iMinInTop || (iCount > 0 && iMinInTop == 0) then
            iTopStates[iMinIdx] = iIdx
            iTopCounts[iMinIdx] = iCount
        endif
        
        iIdx += 1
    od
    
    ; Stampa i risultati
    prints "\nTransizioni più frequenti:\n"
    iTopIdx = 0
    while iTopIdx < iMaxTransitions do
        if iTopCounts[iTopIdx] > 0 then
            iStateIdx = iTopStates[iTopIdx]
            iDensity = int(iStateIdx / 9)
            iRemainder = iStateIdx % 9
            iRegister = int(iRemainder / 3)
            iMovement = iRemainder % 3
            
            iExpectedProb tab_i iCurrentStateIdx*27+iStateIdx, gi_transition_matrix
            iObservedProb = iTopCounts[iTopIdx] / iNumTests
            
            prints "  -> [%d,%d,%d]: osservato %.2f%%, atteso %.2f%%\n", 
                   iDensity, iRegister, iMovement, 
                   iObservedProb*100, iExpectedProb*100
        endif
        iTopIdx += 1
    od
    
    ; Salva la sequenza completa in un file per ulteriori analisi
    SOutputFile = "test_sequence.txt"
    prints "\nSequenza di stati salvata in %s\n", SOutputFile
    fprints SOutputFile, "density,register,movement\n"
    
    iSeqIdx = 0
    iStateIdx = 0
    while iStateIdx < iNumTests do
        iDens tab_i iSeqIdx, giStateSequenceFile
        iReg tab_i iSeqIdx+1, giStateSequenceFile
        iMov tab_i iSeqIdx+2, giStateSequenceFile
        
        fprints SOutputFile, "%d,%d,%d\n", iDens, iReg, iMov
        
        iSeqIdx += 3
        iStateIdx += 1
    od
    
    ; Avvia il test con una matrice di transizione personalizzata
    schedule "TestCustomMatrix", 0, 0.1
endin

; Strumento per testare con una matrice di transizione personalizzata
instr TestCustomMatrix
    prints "\n=== TEST: Matrice di transizione personalizzata ===\n"
    
    ; Modifica alcune probabilità nella matrice per il test
    ; Stato [0,0,0] avrà 90% probabilità di passare a [2,2,2]
    
    ; Prima normalizza tutte le altre probabilità per mantenere somma = 1
    iSum = 0
    iStateIdx = 0
    while iStateIdx < 27 do
        if iStateIdx != 26 then  ; Salta [2,2,2] che imposteremo dopo
            iProb tab_i 0*27+iStateIdx, gi_transition_matrix
            iSum += iProb
        endif
        iStateIdx += 1
    od
    
    iNewSum = iSum * (1 - 0.9)  ; Lascia il 90% per la transizione a [2,2,2]
    iRatio = (iSum > 0) ? iNewSum / iSum : 0
    
    ; Riscala tutte le probabilità
    iStateIdx = 0
    while iStateIdx < 27 do
        if iStateIdx != 26 then  ; Salta [2,2,2]
            iProb tab_i 0*27+iStateIdx, gi_transition_matrix
            iNewProb = iProb * iRatio
            tabw_i iNewProb, 0*27+iStateIdx, gi_transition_matrix
        endif
        iStateIdx += 1
    od
    
    ; Imposta la probabilità alta per [0,0,0] -> [2,2,2]
    tabw_i 0.9, 0*27+26, gi_transition_matrix
    
    prints "Matrice di transizione modificata.\n"
    prints "Probabilità stato [0,0,0] -> [2,2,2]: %.4f\n", tab_i(0*27+26, gi_transition_matrix)
    
    ; Verifica che la somma delle probabilità sia ancora 1
    iSum = 0
    iStateIdx = 0
    while iStateIdx < 27 do
        iProb tab_i 0*27+iStateIdx, gi_transition_matrix
        iSum += iProb
        iStateIdx += 1
    od
    
    prints "Somma delle probabilità di transizione da [0,0,0]: %.4f (dovrebbe essere 1.0)\n", iSum
    
    ; Testa selectNextState con la matrice personalizzata
    schedule "TestSelectNextState", 0, 0.1, 0, 0, 0
    
    ; Salva la matrice di transizione
    schedule "SaveTransitionMatrix", 0, 0.1
endin

; Avvia il test completo
instr RunAllTests
    prints "\n===== INIZIO TEST DEL SISTEMA DI TRANSIZIONE DI STATO =====\n"
    
    ; Testa transizioni da vari stati iniziali
    schedule "TestTransitionMatrix", 0, 0.1
    
    prints "\n===== TEST COMPLETATI =====\n"
endin

</CsInstruments>
<CsScore>
; Avvia i test
i "RunAllTests" 0 0.1
e
</CsScore>
</CsoundSynthesizer>