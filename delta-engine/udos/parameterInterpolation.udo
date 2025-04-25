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

; Fixed version of the complex generateRhythmsForState function
opcode generateRhythmsForState, i[], iiii
    iDensityState, iMovementState, iHarmonicDuration, iArraySize xin

    ; Array di output
    iRhythms[] init iArraySize

    ; Debug output to trace input parameters
    if gi_debug >= 3 then
        prints "generateRhythmsForState called with:\n"
        prints "  Density: %f, Movement: %f, HarmonicDuration: %f, TableSize: %d\n",
               iDensityState, iMovementState, iHarmonicDuration, iArraySize
    endif
    
    ; SAFETY: Sanitize input parameters
    iDensityState = limit(iDensityState, 0, 2)
    iMovementState = limit(iMovementState, 0, 2)
    iHarmonicDuration = limit(iHarmonicDuration, 1, 60)  ; Reasonable range for harmonic duration
        
    ; Calculate movement-based rhythm range continuously
    i_MovementNormalized = limit(iMovementState / 2, 0, 1)
    i_temp pow i_MovementNormalized, 1.5
    iMovementFactor = 1 - i_temp
    
    ; Calculate rhythm range with ABSOLUTE LIMITS
    iMinRhythm = 1 + iMovementFactor * 7
    iMaxRhythm = 4 + iMovementFactor * 16
    iMinRhythm = limit(iMinRhythm, 1, 10)      ; Never below 1, never above 10
    iMaxRhythm = limit(iMaxRhythm, 5, 30)      ; Never below 5, never above 30
    
    ; Density calculations with safety bounds
    i_fDensityNormalized = limit(iDensityState / 2, 0, 1)
    iDensityFactor = limit(pow(i_fDensityNormalized, 1.2), 0, 1)
    
    ; Safer calculation for events per second
    iEventsPerSecond = 0.3 + (iDensityFactor * 2.2)
    iEventsPerSecond = limit(iEventsPerSecond, 0.1, 5)  ; Reasonable range
    
    ; Calculate target with absolute safety checks
    iTargetAvgRhythm = iHarmonicDuration * iEventsPerSecond
    iTargetAvgRhythm = limit(iTargetAvgRhythm, 1, 50)  ; Never allow extreme values
    
    ; Calculate rhythm range midpoint
    iRhythmRangeMidpoint = (iMinRhythm + iMaxRhythm) / 2
    
    ; Blending with safety checks
    iBlendedTarget = (iTargetAvgRhythm * 0.6) + (iRhythmRangeMidpoint * 0.4)
    iBlendedTarget = limit(iBlendedTarget, 1, 40)  ; Reasonable upper limit
    
    ; Final range calculation with strict bounds
    i_fFinalMin = limit(iBlendedTarget * 0.8, iMinRhythm, iMaxRhythm)
    i_fFinalMax = limit(iBlendedTarget * 1.2, iMinRhythm, iMaxRhythm)
    
    ; Additional safety checks on range
    i_fFinalMin = limit(i_fFinalMin, 1, 25)
    i_fFinalMax = limit(i_fFinalMax, i_fFinalMin + 1, 30)
    
    if gi_debug >= 3 then
        prints "  Final rhythm range: %f - %f\n", i_fFinalMin, i_fFinalMax
    endif
    
    ; Fill rhythm table with values - with index bounds checking
    iIdx = 0
    while iIdx < iArraySize do
        iRhythmValue = random(i_fFinalMin, i_fFinalMax)
        iRhythmValue = round(iRhythmValue)
        iRhythmValue = limit(iRhythmValue, 1, 40)  ; Final safety cap
            
        iRhythms[iIdx] = iRhythmValue
            
        if gi_debug >= 3 && iIdx == 0 then
            prints "  First rhythm value generated: %f\n", iRhythmValue
        endif        
        iIdx += 1
    od
    
    xout iRhythms
endop
