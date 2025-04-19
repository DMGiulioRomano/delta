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
    iDensityState xin
    
    prints "Chiamata generateRhythmsForState con stato densità: %d\n", iDensityState
    
    ; Limita lo stato a valori validi (0-2)
    iDensityState = limit(iDensityState, 0, 2)
    
    ; Dimensione della tabella con margine di sicurezza
    iTblSize = 5  
    iTableNum ftgen 0, 0, iTblSize+2, -2, 0  ; +2 per sicurezza
    
    ; Ottieni range di DENSITÀ, non di movimento
    iMinEvents, iMaxEvents mapStateToParameter iDensityState, "density"
    
    ; Converti la densità in valori ritmici
    ; Densità alta (stato 2) -> Ritmi bassi (1-4) per creare più eventi ravvicinati
    ; Densità bassa (stato 0) -> Ritmi alti (12-20) per creare pochi eventi distanziati
    
    ; Calcolo inverso: stati di densità alti producono ritmi bassi
    if (iDensityState == 0) then  ; Sparse
        iMinRhythm = 1
        iMaxRhythm = 5
    elseif (iDensityState == 1) then  ; Medium
        iMinRhythm = 5
        iMaxRhythm = 12
    else  ; Dense (stato 2)
        iMinRhythm = 12
        iMaxRhythm = 35
    endif
    
    prints "Stato densità %d -> Range valori ritmici: Min=%d, Max=%d\n", 
           iDensityState, iMinRhythm, iMaxRhythm
    
    ; Genera valori ritmici con controllo di validità
    iIdx = 0
    while iIdx < iTblSize do
        ; Verifica che l'indice sia valido
        if (iIdx >= 0 && iIdx < ftlen(iTableNum)) then
            iRhythmVal random iMinRhythm, iMaxRhythm
            iRhythmVal = round(iRhythmVal)  
            
            ; Assicura che sia positivo
            iRhythmVal = max(1, iRhythmVal)
            
            ; Scrivi nella tabella
            tabw_i iRhythmVal, iIdx, iTableNum
            
            if (iIdx == 0) then
                prints "Primo valore ritmico generato: %d\n", iRhythmVal
            endif
        else
            prints "ERRORE: Indice %d fuori dai limiti della tabella (%d)\n", 
                  iIdx, ftlen(iTableNum)
        endif
        
        iIdx += 1
    od
    
    prints "Tabella ritmica generata con %d elementi\n", ftlen(iTableNum)
    
    xout iTableNum
endop
