opcode mapStateToParameter, ii, iS
    iStateIndex, SparamType xin
    
    ; Assicuriamoci che iStateIndex sia nel range [0,2]
    iNormalizedState = limit(iStateIndex, 0, 2) / 2.0  ; Normalizza a [0,1]
    
    if strcmp(SparamType, "density") == 0 then
        ; Density: stato 0 = pochi eventi, stato 2 = molti eventi
        ; Range: da 1 evento a circa 1/3 di NUMEVENTI
        iMinEvents = 1
        iMaxEvents = gi_NUMEVENTI / 3  ; Evita di saturare eccessivamente
        
        ; Applicazione esponenziale per enfatizzare gli stati più densi
        iProgress = iNormalizedState * iNormalizedState  ; Curva quadratica
        iMin = iMinEvents
        iMax = iMinEvents + (iMaxEvents - iMinEvents) * iProgress
        
    elseif strcmp(SparamType, "register") == 0 then
        ; Register: usa l'intero range di ottave disponibili
        ; Stato 0 = ottave basse, stato 2 = ottave alte
        iLowestOctave = 0
        iHighestOctave = $OTTAVE - 1
        
        ; Distribuzione lineare tra le ottave
        iMin = iLowestOctave + (iHighestOctave - iLowestOctave) * iNormalizedState
        iMax = iMin + max(1, $OTTAVE / 6)  ; Range di circa 1/6 delle ottave disponibili
        
    elseif strcmp(SparamType, "movement") == 0 then
        ; Movement: inversamente proporzionale ai valori ritmici
        ; Stato 0 (statico) = ritmi alti, stato 2 (dinamico) = ritmi bassi
        
        ; Range logaritmico da 1 a max 30 per i ritmi
        iLowestRhythm = 1    ; Più movimento
        iHighestRhythm = 30  ; Meno movimento
        
        ; Inverte il normalizedState per la relazione inversa
        iInvertedState = 1 - iNormalizedState
        
        ; Distribuzione logaritmica per enfatizzare i ritmi più bassi
        iLogProgress = exp(iInvertedState * log(iHighestRhythm))
        
        iMin = max(iLowestRhythm, iLogProgress / 1.5)
        iMax = min(iHighestRhythm, iLogProgress * 1.5)
    endif
    
    ; Arrotonda i valori per chiarezza
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
