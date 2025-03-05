; Opcode per analizzare la memoria compositiva in un range temporale
opcode analyzeCompositionMemory, iiii, ii
    iStartTime, iEndTime xin
    
    ; Calcola indici nella tabella di memoria
    iStartIdx = int(iStartTime / gi_memory_resolution)
    iEndIdx = int(iEndTime / gi_memory_resolution)
    
    ; Assicurati che gli indici siano entro i limiti
    iStartIdx = limit(iStartIdx, 0, gi_memory_size-1)
    iEndIdx = limit(iEndIdx, 0, gi_memory_size-1)
    
    ; Inizializza contatori
    iSumOverlap = 0
    iMaxOverlap = 0
    iActivePoints = 0
    iCount = 0
    
    ; Analizza il range temporale
    iIdx = iStartIdx
    while iIdx <= iEndIdx do
        iOverlap table iIdx, gi_memory_overlap
        
        if iOverlap > 0 then
            iSumOverlap += iOverlap
            iMaxOverlap = max(iMaxOverlap, iOverlap)
            iActivePoints += 1
        endif
        
        iCount += 1
        iIdx += 1
    od
    
    ; Calcola valori aggregati
    iAvgOverlap = (iActivePoints > 0) ? iSumOverlap / iActivePoints : 0
    iDensity = (iCount > 0) ? iActivePoints / iCount : 0  ; Misura di quanto è occupato il range temporale
    
    xout iAvgOverlap, iMaxOverlap, iDensity, iCount
endop

; Opcode per suggerire parametri di durata basati sulla memoria compositiva
opcode suggestDurationFactor, i, iii
    iStartTime, iEndTime, iRitmoCorrente xin
    
    ; Analizza la memoria compositiva nel range specificato
    iAvgOverlap, iMaxOverlap, iDensity, iSampleCount = analyzeCompositionMemory(iStartTime, iEndTime)
    
    ; Se non abbiamo abbastanza dati o il range è vuoto, usa valori predefiniti
    if iSampleCount < 2 || iDensity < 0.05 then
        iSuggestedFactor = 1.0  ; Valore neutro
        goto end
    endif
    
    ; Altrimenti, suggerisci un fattore basato sull'analisi
    iMaxReference = 8  ; Livello di riferimento per la sovrapposizione massima
    iAvgReference = 3  ; Livello di riferimento per la sovrapposizione media
    
    ; Calcola un fattore basato sia sul massimo che sulla media
    iFactorFromMax = 1.0 + (iMaxReference - iMaxOverlap) * 0.1
    iFactorFromAvg = 1.0 + (iAvgReference - iAvgOverlap) * 0.2
    
    ; Combina i fattori dando più peso alla media
    iSuggestedFactor = (iFactorFromMax + iFactorFromAvg * 2) / 3
    
    ; Limita il fattore all'intervallo desiderato (1.0 - valore del ritmo)
    iSuggestedFactor = limit(iSuggestedFactor, 1.0, iRitmoCorrente)
    
    end:
    xout iSuggestedFactor
endop