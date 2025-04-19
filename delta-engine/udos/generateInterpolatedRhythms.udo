opcode generateInterpolatedRhythms, i, iiii
    iSourceMovement, iTargetMovement, iProgress, iTableSize xin
    
    ; Ottieni intervalli di ritmi per gli stati di movimento sorgente e target
    iSourceMin, iSourceMax mapStateToParameter iSourceMovement, "density"
    iTargetMin, iTargetMax mapStateToParameter iTargetMovement, "density"
    
    ; Interpola intervalli min/max
    iInterpolatedMin = cubicInterpolate(iSourceMin, iTargetMin, iProgress)
    iInterpolatedMax = exponentialInterpolate(iSourceMax, iTargetMax, iProgress)
    
    ; Crea tabella ritmi
    iRhythmTable ftgen 0, 0, iTableSize+1, -2, 0
    
    ; Riempi con valori di ritmo
    iIdx = 0
    while iIdx < iTableSize do
        ; Genera valore di ritmo con casualità
        iBaseValue random iInterpolatedMin, iInterpolatedMax
        iRhythmValue = round(iBaseValue)
        
        ; Assicurati che il valore di ritmo sia positivo e ragionevole
        iRhythmValue = max(1, iRhythmValue)
        
        ; Scrivi nella tabella
        tabw_i iRhythmValue, iIdx, iRhythmTable
        
        iIdx += 1
    od
    
    xout iRhythmTable
endop
