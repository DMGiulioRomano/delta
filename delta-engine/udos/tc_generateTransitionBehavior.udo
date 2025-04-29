; -----------------------------------------------------------------------
; BEHAVIOR GENERATION WITH INTERPOLATED PARAMETERS - VERSIONE RISTRUTTURATA
; -----------------------------------------------------------------------
opcode generateTransitionBehavior, 0, i
    iProgress xin
    
    ; Limitazione esplicita del progresso tra 0 e 1 per prevenire valori nan
    iProgress = limit(iProgress, 0, 1)
    
    ; Interpolate between source and target states
    iInterpolatedDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    iInterpolatedRegister interpolateParameter gi_tc_source_register, gi_tc_target_register, iProgress, 0
    iInterpolatedMovement interpolateParameter gi_tc_source_movement, gi_tc_target_movement, iProgress, -0.3

    ; Limita esplicitamente i valori interpolati nel range [0,2]
    iInterpolatedDensity = limit(iInterpolatedDensity, 0, 2)
    iInterpolatedRegister = limit(iInterpolatedRegister, 0, 2)
    iInterpolatedMovement = limit(iInterpolatedMovement, 0, 2)

    ; Now map these state values to actual musical parameters
    
    ; 1. Harmonic Duration based on density
    iHarmonicDuration mapDensityToHarmonicDuration iInterpolatedDensity
    
    ; 2. Octave and Register parameters
    iMinOctave, iMaxOctave mapStateToParameter iInterpolatedRegister, "register"
    iOctave random iMinOctave, iMaxOctave
    iOctave = round(iOctave)
    
    iRegister random 1, 10  ; Full range of registers
    iRegister = round(iRegister)
    
    ; 3. Generate rhythm values based on interpolated movement parameter
    iRhythmSize = 5
    iRhythms[] generateRhythmsForState iInterpolatedDensity, iInterpolatedMovement, iHarmonicDuration, iRhythmSize
    
    ; 4. Amplitude based on register and octave
    iMaxAmplitude calculateMaxAmplitude iOctave, iRegister
    iAmplitude random iMaxAmplitude - 3, iMaxAmplitude
    
    ; 5. Duration based on harmonic duration and density
    iDuration = iHarmonicDuration * (2 + iInterpolatedDensity)
    iDuration = max(5, iDuration)
    iDuration = min(iDuration, 300)  ; Previene durate estremamente lunghe
    
    ; 6. Generate positions - for simplicity, use random positions
    iIdx = 0
    while (iIdx < iRhythmSize) do
        iRhythmVal = iRhythms[iIdx]
        iPos random 0, iRhythmVal
        iPos = int(iPos)
        iPositions[iIdx] = iPos
        iIdx += 1
    od
    
    ; Tempo corrente come attacco
    iAttacco times
    
    ; Utilizza lo storeTransitionBehaviorParameters per memorizzare i parametri
    ; NON incrementare gi_compId qui, lo fa già storeTransitionBehaviorParameters
    iIdComp storeTransitionBehaviorParameters iRhythms[], iPositions[], iAttacco, 
                                              iDuration, iHarmonicDuration, 
                                              iAmplitude, iOctave, iRegister
    ; Chiama GeneraComportamenti con i parametri essenziali
    schedule "BehaviorWrapper", 0, 5, 0, iDuration, iIdComp
    
    ; Debug output
    if (gi_debug >= 2) then
        prints "Generated transition behavior at progress %.2f (ID %d):\n", iProgress, iIdComp
        prints "  Density: %.2f, Register: %.2f, Movement: %.2f\n", 
               iInterpolatedDensity, iInterpolatedRegister, iInterpolatedMovement
        prints "  Duration: %.1f, Harmonic Duration: %.1f\n", 
               iDuration, iHarmonicDuration
        prints "  Octave: %d, Register: %d, Amplitude: %.1f\n", 
               iOctave, iRegister, iAmplitude
        iIdx = 0
        while (iIdx < iRhythmSize) do
            prints "Rhythm val: %d for idx %d", iRhythms[iIdx], iIdx
        od
        while (iIdx < iRhythmSize) do
            prints "Positions val: %d for idx %d", iPositions[iIdx], iIdx
        od
    endif
endop