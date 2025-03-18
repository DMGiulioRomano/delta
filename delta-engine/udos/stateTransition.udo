; Inizializza la matrice di transizione con valori predefiniti
opcode initTransitionMatrix, 0, 0
    ; Impostiamo valori predefiniti: probabilità più alte per transizioni graduali,
    ; più basse per transizioni drastiche
    
    ; Per ogni stato possibile (27 stati totali = 3×3×3)
    iStateIdx = 0
    while iStateIdx < 27 do
        ; Scomponiamo l'indice nei suoi componenti
        iCurrentDensity = int(iStateIdx / 9)
        iRemainder = iStateIdx % 9
        iCurrentRegister = int(iRemainder / 3)
        iCurrentMovement = iRemainder % 3
        
        ; Per ogni possibile stato successivo
        iNextStateIdx = 0
        while iNextStateIdx < 27 do
            ; Scomponiamo l'indice del prossimo stato
            iNextDensity = int(iNextStateIdx / 9)
            iNextRemainder = iNextStateIdx % 9
            iNextRegister = int(iNextRemainder / 3)
            iNextMovement = iNextRemainder % 3
            
            ; Calcoliamo la "distanza" tra stati (quanti parametri cambiano)
            iChanges = 0
            if iCurrentDensity != iNextDensity then
                iChanges += 1
            endif
            if iCurrentRegister != iNextRegister then
                iChanges += 1
            endif
            if iCurrentMovement != iNextMovement then
                iChanges += 1
            endif
            
            ; Assegniamo probabilità basate sulla distanza
            iProb = 0
            if iChanges == 0 then
                iProb = 0.4  ; 40% probabilità di rimanere nello stesso stato
            elseif iChanges == 1 then
                iProb = 0.3  ; 30% probabilità di cambiare un solo parametro
            elseif iChanges == 2 then
                iProb = 0.2  ; 20% probabilità di cambiare due parametri
            else
                iProb = 0.1  ; 10% probabilità di cambiare tutti i parametri
            endif
            
            ; Salva la probabilità nella matrice
            tabw_i iProb, iStateIdx*27+iNextStateIdx, gi_transition_matrix
            
            iNextStateIdx += 1
        od
        
        ; Normalizza le probabilità per assicurarsi che sommino a 1
        iSum = 0
        iNextIdx = 0
        while iNextIdx < 27 do
            iProb tab_i iStateIdx*27+iNextIdx, gi_transition_matrix
            iSum += iProb
            iNextIdx += 1
        od
        
        if iSum > 0 then
            iNextIdx = 0
            while iNextIdx < 27 do
                iProb tab_i iStateIdx*27+iNextIdx, gi_transition_matrix
                iNormProb = iProb / iSum
                tabw_i iNormProb, iStateIdx*27+iNextIdx, gi_transition_matrix
                iNextIdx += 1
            od
        endif
        
        iStateIdx += 1
    od
endop


; Seleziona il prossimo stato in base alle probabilità di transizione
opcode selectNextState, iii, 0
    
    ; Calcola l'indice di base nella matrice di transizione
    iStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Genera un numero casuale
    iRand random 0, 1
    
    ; Seleziona il prossimo stato in base alla probabilità cumulativa
    iCumulativeProb = 0
    iNextStateIdx = 0
    
    iIdx = 0
    while iIdx < 27 do
        iTransProb tab_i iStateIdx*27+iIdx, gi_transition_matrix
        iCumulativeProb += iTransProb
        
        if iRand < iCumulativeProb then
            iNextStateIdx = iIdx
            igoto found_next
        endif
        
        iIdx += 1
    od
    found_next:
    
    ; Converti l'indice nei parametri di stato
    iNextDensity = int(iNextStateIdx / 9)
    iRemainder = iNextStateIdx % 9
    iNextRegister = int(iRemainder / 3)
    iNextMovement = iRemainder % 3
    
    xout iNextDensity, iNextRegister, iNextMovement
endop

opcode calculateTransitionDuration, i, 0
    
    ; Conta quanti parametri sono diversi tra stato attuale e target
    iDifferentParams = 0
    if gi_tc_source_density != gi_tc_target_density then
        iDifferentParams += 1
    endif
    if gi_tc_source_register != gi_tc_target_register then
        iDifferentParams += 1
    endif
    if gi_tc_source_movement != gi_tc_target_movement then
        iDifferentParams += 1
    endif
    
    ; Parametri di base per il calcolo
    iBaseDuration = 10       ; Durata base in secondi
    iTransitionFactor = 2    ; Moltiplicatore per ogni parametro differente
    
    ; Applica la modalità di transizione
    ; iTransitionMode = 0: transizione brusca (1 secondo)
    ; iTransitionMode = 1: transizione graduale (formula normale)
    ; Valori intermedi creano una scala tra i due estremi
    
    ; Calcolo della durata per transizione graduale
    iGradualDuration = iBaseDuration * (1 + iDifferentParams * iTransitionFactor)
    
    ; Durata fissa per transizione brusca
    iBruskDuration = 1
    
    ; Interpola tra le due durate in base al modo di transizione
    iRawDuration = iBruskDuration + gi_tc_transition_mode * (iGradualDuration - iBruskDuration)
    
    ; Applica il fattore di casualità
    ; gi_tc_transition_randomness è un valore tra 0.0 e 1.0 che determina quanto sarà casuale la durata
    if gi_tc_transition_randomness > 0 then
        iRandomAmount = random(-0.3, 0.5) * gi_tc_transition_randomness
        iDuration = iRawDuration * (1 + iRandomAmount)
    else
        iDuration = iRawDuration
    endif
    
    ; Assicura che la durata non sia mai inferiore a 1 secondo
    iDuration = max(1, iDuration)
    
    xout iDuration
endop
