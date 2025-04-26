
; Opcode per analizzare la memoria compositiva in un range temporale
opcode analyzeMemoryXoverlappDensity, iiii, ii
    iStartTime, iEndTime xin
    
    ; Calcola indici nella tabella di memoria
    iStartIdx = int(iStartTime / gi_memory_resolution)
    iEndIdx = int(iEndTime / gi_memory_resolution)
    
    ; Assicurati che gli indici siano entro i limiti
    iStartIdx = limit(iStartIdx, 0, gi_memory_size)
    iEndIdx = limit(iEndIdx, 0, gi_memory_size)
    
    ; Inizializza contatori
    iSumOverlap = 0
    iMaxOverlap = 0
    iActivePoints = 0
    iCount = 0
    
    ; Analizza il range temporale
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iOverlap tab_i iIdx, gi_memory_overlap
        
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
    iAvgOverlap, iMaxOverlap, iDensity, iSampleCount = analyzeMemoryXoverlappDensity(iStartTime, iEndTime)
    
    ; Se non abbiamo abbastanza dati o il range è vuoto, usa valori predefiniti
    if iSampleCount < 2 || iDensity < 0.05 then
        iSuggestedFactor = 1.0  ; Valore neutro
        goto end
    endif
    
    ; Altrimenti, suggerisci un fattore basato sull'analisi
    ; Valori di riferimento calibrati per il sistema
    iMaxReference = 200  ; Livello di riferimento per la sovrapposizione massima
    iAvgReference = 15  ; Livello di riferimento per la sovrapposizione media
    
    ; Calcola un fattore basato sia sul massimo che sulla media
    ; Coefficienti AUMENTATI per rendere l'algoritmo più reattivo
    iFactorFromMax = 1.0 + (iMaxReference - iMaxOverlap) * 0.1   ; Raddoppiato da 0.05
    iFactorFromAvg = 1.0 + (iAvgReference - iAvgOverlap) * 0.2   ; Raddoppiato da 0.1
    
    ; Limita i fattori per evitare valori estremi
    iFactorFromMax = max(1.0, iFactorFromMax)
    iFactorFromAvg = max(1.0, iFactorFromAvg)
    
    ; Combina i fattori dando più peso alla media
    iSuggestedFactor = (iFactorFromMax + iFactorFromAvg * 2) / 3
    
    ; Applica una soglia minima: se il fattore è troppo vicino a 1.0, lascialo a 1.0
    if iSuggestedFactor < 1.05 then
        iSuggestedFactor = 1.0
    endif
    
    ; Limita il fattore all'intervallo desiderato (1.0 - valore del ritmo)
    iSuggestedFactor = limit(iSuggestedFactor, 1.0, iRitmoCorrente)
    
    end:
    xout iSuggestedFactor
endop

opcode analyzeHarmonicMemory, iiii, ii
    iStartTime, iEndTime xin
    
    ; Calcola indici nella tabella di memoria
    iStartIdx = int(iStartTime / gi_memory_resolution)
    iEndIdx = int(iEndTime / gi_memory_resolution)
    
    ; Assicurati che gli indici siano entro i limiti
    iStartIdx = limit(iStartIdx, 0, gi_memory_size-1)
    iEndIdx = limit(iEndIdx, 0, gi_memory_size-1)
    
    ; Inizializza contatori
    iSumHarmonicDensity = 0
    iSumOctaveSpread = 0
    iMaxHarmonicDensity = 0
    iCount = 0
    
    ; Analizza il range temporale
    iIdx = iStartIdx
    while iIdx <= iEndIdx do
        iHarmonicDensity tab_i iIdx, gi_memory_harmonic_density
        iOctaveSpread tab_i iIdx, gi_memory_octave_spread
        
        iSumHarmonicDensity += iHarmonicDensity
        iSumOctaveSpread += iOctaveSpread
        iMaxHarmonicDensity = max(iMaxHarmonicDensity, iHarmonicDensity)
        
        iCount += 1
        iIdx += 1
    od
    
    ; Calcola valori aggregati
    iAvgHarmonicDensity = (iCount > 0) ? iSumHarmonicDensity / iCount : 0
    iAvgOctaveSpread = (iCount > 0) ? iSumOctaveSpread / iCount : 0
    
    xout iAvgHarmonicDensity, iMaxHarmonicDensity, iAvgOctaveSpread, iCount
endop
