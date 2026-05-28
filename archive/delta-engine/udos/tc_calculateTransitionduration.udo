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
