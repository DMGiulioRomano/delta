opcode mapStateToParameter, ii, iS
    iStateIndex, SparamType xin
    
    ; Assicuriamoci che iStateIndex sia nel range [0,2]
    iNormalizedState = limit(iStateIndex, 0, 2) / 2.0  ; Normalizza a [0,1]
    
    if strcmp(SparamType, "density") == 0 then
        ; State 0 (sparse): rhythms around 1-6 (creates more frequent events)
        ; State 1 (medium): rhythms around 6-15
        ; State 2 (dense): rhythms around 15-30 (creates fewer, more spaced events)        
        if iStateIndex == 0 then
            iMin = 1
            iMax = 6
        elseif iStateIndex == 1 then
            iMin = 6
            iMax = 15
        else ; state 2
            iMin = 15
            iMax = 30
        endif
        
    elseif strcmp(SparamType, "register") == 0 then
        ; Register: usa l'intero range di ottave disponibili
        ; Stato 0 = ottave basse, stato 2 = ottave alte
        iLowestOctave = 0
        iHighestOctave = $OTTAVE - 1
        
        ; Distribuzione lineare tra le ottave
        iMin = iLowestOctave + (iHighestOctave - iLowestOctave) * iNormalizedState
        iMax = iMin + max(1, $OTTAVE / 3)  ; Range di circa 1/6 delle ottave disponibili
        
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
