; Funzione per calcolare il fattore di scala della durata
; basato sulla sovrapposizione degli eventi
opcode calcDurationFactor, i, iii
    iOverlap, iRitmoCorrente, iMinFactor xin
    
    ; Parametri per la sensibilità dell'adattamento
    iMaxOverlap = 10        ; Livello di sovrapposizione considerato "alto"
    iMinOverlap = 1        ; Livello di sovrapposizione considerato "basso"
    iMaxFactor = iRitmoCorrente  ; Fattore massimo (può arrivare fino al valore del ritmo)
    
    ; Limita i valori di overlap al range definito
    iOverlap = limit(iOverlap, iMinOverlap, iMaxOverlap)
    
    ; Calcola il fattore inversamente proporzionale alla sovrapposizione
    ; Quando overlap = minOverlap → factor = maxFactor
    ; Quando overlap = maxOverlap → factor = minFactor
    iRange = iMaxOverlap - iMinOverlap
    if iRange > 0 then
        iNormalized = (iMaxOverlap - iOverlap) / iRange
        iFactor = iMinFactor + iNormalized * (iMaxFactor - iMinFactor)
    else
        iFactor = iMinFactor
    endif
    
    ; Assicurati che il fattore sia nell'intervallo desiderato
    iFactor = limit(iFactor, iMinFactor, iMaxFactor)
    
    xout iFactor
endop
