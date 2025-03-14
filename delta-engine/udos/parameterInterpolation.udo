; Versione continua e rivista di mapDensityToHarmonicDuration
opcode mapDensityToHarmonicDuration, i, i
    iDensityState xin
    
    ; Range continuo per durata armonica
    ; Sparse (0) = durate lunghe (40-70 sec)
    ; Medium (1) = durate medie (20-40 sec)
    ; Dense (2) = durate brevi (5-10 sec)
    
    ; Normalizza lo stato di densità in un valore continuo da 0 a 1
    iNormalizedDensity = limit(iDensityState / 2.0, 0, 1)
    
    ; Calcola durata usando una curva esponenziale inversa
    ; Più denso = durata più breve (relazione inversa)
    iMaxDuration = 70  ; Durata massima per stato sparso
    iMinDuration = 5   ; Durata minima per stato denso
    
    ; Curva esponenziale per transizione più naturale
    iExponentialFactor = 1 - pow(iNormalizedDensity, 1.5)  ; Più pronunciata verso il denso
    iBaseDuration = iMinDuration + (iMaxDuration - iMinDuration) * iExponentialFactor
    
    ; Aggiungi variazione casuale proporzionale alla durata di base
    iVariationRange = iBaseDuration * 0.15  ; 15% di variazione
    iDuration = iBaseDuration + random(-iVariationRange, iVariationRange)
    
    ; Assicurati che la durata resti entro limiti ragionevoli
    iDuration = limit(iDuration, iMinDuration, iMaxDuration)
    
    xout iDuration
endop
