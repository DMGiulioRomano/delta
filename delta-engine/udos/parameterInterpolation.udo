; Versione continua e rivista di mapDensityToHarmonicDuration
opcode mapDensityToHarmonicDuration, i, i
    iDensityState xin
    
    ; Range continuo per durata armonica
    ; Sparse (0) = durate lunghe (40-70 sec)
    ; Medium (1) = durate medie (20-40 sec)
    ; Dense (2) = durate brevi (5-10 sec)
    
    ; Normalizza lo stato di densità in un valore continuo da 0 a 1
    iNormalizedDensity = limit:i(iDensityState / 2.0, 0, 1)
    
    ; Calcola durata usando una curva esponenziale inversa
    ; Più denso = durata più breve (relazione inversa)
    iMaxDuration = 70  ; Durata massima per stato sparso
    iMinDuration = 5   ; Durata minima per stato denso

    ; Curva esponenziale per transizione più naturale
    iExponentialFactor = 1 - (pow(iNormalizedDensity, 1.5))  ; Più pronunciata verso il denso
    iBaseDuration = iMinDuration + (iMaxDuration - iMinDuration) * iExponentialFactor
    
    ; Aggiungi variazione casuale proporzionale alla durata di base
    iVariationRange = iBaseDuration * 0.15  ; 15% di variazione
    iDuration = iBaseDuration + random(-iVariationRange, iVariationRange)
    
    ; Assicurati che la durata resti entro limiti ragionevoli
    iDuration = limit:i(iDuration, iMinDuration, iMaxDuration)
    
    xout iDuration
endop

; Generate rhythm values with continuous state parameters
opcode generateRhythmsForState, i, iiii
    iDensityState, iMovementState, iHarmonicDuration, iTableSize xin
    
    ; Create rhythm table
    iRhythmTable ftgen 0, 0, iTableSize+1, -2, 0
    
    ; Calculate movement-based rhythm range continuously
    ; Movement state 0 (static) → higher rhythm values (8-20)
    ; Movement state 2 (dynamic) → lower rhythm values (1-4)
    i_MovementNormalized = limit:i(iMovementState / 2, 0, 1)  ; Normalize to 0-1
    i_temp pow i_MovementNormalized, 1.5
    ; Exponential mapping for smoother transitions
    iMovementFactor = 1 - i_temp ; Invert: 1 at movement=0, 0 at movement=2
    
    ; Calculate rhythm range based on movement factor
    iMinRhythm = 1 + iMovementFactor * 7    ; Range: 1 to 8
    iMaxRhythm = 4 + iMovementFactor * 16   ; Range: 4 to 20
    
    ; Calculate desired events per second based on density state continuously
    i_fDensityNormalized = limit:i(iDensityState / 2, 0, 1)  ; Normalize to 0-1
    
    ; Exponential curve for more natural progression
    iDensityFactor pow i_fDensityNormalized, 1.2  ; Non-linear scaling
    
    ; Map density factor to events per second: 0.3 at density=0, 2.5 at density=2
    iEventsPerSecond = 0.3 + (iDensityFactor * 2.2)
    
    ; Calculate target average rhythm value to achieve desired density
    iTargetAvgRhythm = iHarmonicDuration * iEventsPerSecond
    
    ; Find the midpoint of our rhythm range based on movement
    iRhythmRangeMidpoint = (iMinRhythm + iMaxRhythm) / 2
    
    ; Blend target rhythm with movement-based range (60% target, 40% movement constraints)
    iBlendedTarget = (iTargetAvgRhythm * 0.6) + (iRhythmRangeMidpoint * 0.4)
    
    ; Adjust rhythm range to center around blended target
    i_fFinalMin = limit:i(iBlendedTarget * 0.8, iMinRhythm, iMaxRhythm)
    i_fFinalMax = limit:i(iBlendedTarget * 1.2, iMinRhythm, iMaxRhythm)
    
    ; Add variation based on density (higher density = less variation)
    iVariationFactor = 1 - (i_fDensityNormalized * 0.5)  ; 1.0 to 0.5
    iRangeWidth = i_fFinalMax - i_fFinalMin
    i_fFinalMin = iBlendedTarget - (iRangeWidth * iVariationFactor / 2)
    i_fFinalMax = iBlendedTarget + (iRangeWidth * iVariationFactor / 2)
    
    ; Ensure range is valid
    i_fFinalMin = max(1, i_fFinalMin)
    i_fFinalMax = max(i_fFinalMin + 1, i_fFinalMax)
    
    ; Fill rhythm table with values
    iIdx = 0
    while iIdx < iTableSize do
        iRhythmValue = random(i_fFinalMin, i_fFinalMax)
        iRhythmValue = round(iRhythmValue)  ; Round to integer for rhythm
        iRhythmValue = max(1, iRhythmValue) ; Ensure positive
        
        tabw_i iRhythmValue, iIdx, iRhythmTable
        
        iIdx += 1
    od
    
    ; Debug output
    if gi_debug >= 2 then
        prints "Continuous Rhythm Generation:\n"
        prints "  Density State: %d (normalized: %d)\n", iDensityState, i_fDensityNormalized
        prints "  Movement State: %d (normalized: %d)\n", iMovementState, i_MovementNormalized
        prints "  Harmonic Duration: %d\n", iHarmonicDuration
        prints "  Desired Events/Sec: %d\n", iEventsPerSecond
        prints "  Target Rhythm: %d\n", iTargetAvgRhythm
        prints "  Final Range: %d-%d\n", i_fFinalMin, i_fFinalMax
        
        prints "  Generated Rhythms:\n"
        iIdx = 0
        while iIdx < iTableSize do
            prints "    [%d]: %d\n", iIdx, tab_i(iIdx, iRhythmTable)
            iIdx += 1
        od
    endif
    
    xout iRhythmTable
endop
