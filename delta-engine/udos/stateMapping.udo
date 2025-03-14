opcode mapStateToParameter, ii, iS
    iStateIndex, SparamType xin
    
    iMin = 0
    iMax = 0
    
    if strcmp(SparamType, "density") == 0 then
        ; Legge le soglie direttamente dalla tabella density_thresholds
        iLowerBound tab_i iStateIndex, gi_density_thresholds
        iUpperBound tab_i iStateIndex+1, gi_density_thresholds
        
        ; Aggiunge un piccolo margine per evitare valori di confine
        iMin = iLowerBound + 0.1
        ; Limita il massimo a un valore ragionevole (999 è solo un limite superiore)
        iMax = (iUpperBound > 100) ? 12 : iUpperBound - 0.1
        
    elseif strcmp(SparamType, "register") == 0 then
        ; Legge le soglie dalla tabella register_thresholds
        iLowerBound tab_i iStateIndex, gi_register_thresholds
        iUpperBound tab_i iStateIndex+1, gi_register_thresholds
        
        ; Converte i valori normalizzati (0-1) in valori di ottave (1-10)
        iMin = 1 + iLowerBound * ($OTTAVE - 1)
        iMax = 1 + iUpperBound * ($OTTAVE - 1)
        
    elseif strcmp(SparamType, "movement") == 0 then
        ; Legge le soglie dalla tabella movement_thresholds
        iLowerBound tab_i iStateIndex, gi_movement_thresholds
        iUpperBound tab_i iStateIndex+1, gi_movement_thresholds
        
        ; Inversione dei valori per il movimento (ricorda: valori ritmici bassi = più movimento)
        iMoveLow = 1 - iUpperBound
        iMoveHigh = 1 - iLowerBound
        
        ; Scala i valori al range di ritmi appropriato (1-20)
        iMin = 1 + iMoveLow * 19
        iMax = 1 + iMoveHigh * 19
    endif
    
    ; Arrotonda i valori per maggiore chiarezza
    iMin = round(iMin)
    iMax = round(iMax)
    
    xout iMin, iMax
endop

opcode generateRhythmsForState, i, i
    iTargetMovement xin
    
    iTblSize = 5  ; Dimensione della tabella ritmica
    iTableNum ftgen 0, 0, iTblSize, -2, 0
    
    ; Ottiene i range di valori appropriati dalle soglie di movimento
    iMinVal, iMaxVal mapStateToParameter iTargetMovement, "movement"
    
    ; Genera valori ritmici appropriati
    iIdx = 0
    while iIdx < iTblSize do
        iRhythmVal random iMinVal, iMaxVal
        iRhythmVal = round(iRhythmVal)  ; Arrotonda al valore intero più vicino
                
        tabw_i iRhythmVal, iIdx, iTableNum
        iIdx += 1
    od
    
    xout iTableNum
endop
