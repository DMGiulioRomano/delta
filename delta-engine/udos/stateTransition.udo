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
