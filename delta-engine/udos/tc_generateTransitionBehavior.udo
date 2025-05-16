; -----------------------------------------------------------------------
; BEHAVIOR GENERATION WITH INTERPOLATED PARAMETERS - VERSIONE RISTRUTTURATA
; -----------------------------------------------------------------------
opcode generateTransitionBehavior, 0, k
    kProgress xin
    println "\t\t\t\t--- open generateTransitionBehavior"
    
    ; Interpolate between source and target states
    kInterpolatedDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, kProgress, 0.3
    kInterpolatedRegister interpolateParameter gi_tc_source_register, gi_tc_target_register, kProgress, 0
    kInterpolatedMovement interpolateParameter gi_tc_source_movement, gi_tc_target_movement, kProgress, -0.3

    ; Limita esplicitamente i valori interpolati nel range [0,2]
    kInterpolatedDensity = limit:k(kInterpolatedDensity, 0, 2.999)
    kInterpolatedRegister = limit:k(kInterpolatedRegister, 0, 2.999)
    kInterpolatedMovement = limit:k(kInterpolatedMovement, 0, 2.999)

    if gi_debug >=5 then 
        println "\t\t\t\t\tkInterpolatedDensity %f\n\t\t\t\t\tkInterpolatedRegister %f\n\t\t\t\t\tkInterpolatedMovement %f", kInterpolatedDensity, kInterpolatedRegister, kInterpolatedMovement
    endif
    ; Now map these state values to actual musical parameters
    
    ; 1. Harmonic Duration based on density
    kHarmonicDuration mapDensityToHarmonicDuration kInterpolatedDensity
    if gi_debug >=5 then 
        println "\t\t\t\t\tkHarmonicDuration %f", kHarmonicDuration
    endif

    println "\t\t\t\t--- close generateTransitionBehavior"
    /*
    ; 2. Octave and Register parameters
    iMinOctave, iMaxOctave mapStateToParameter kInterpolatedRegister, "register"
    iOctave random iMinOctave, iMaxOctave
    iOctave = round(iOctave)
    
    iRegister random 1, 10  ; Full range of registers
    iRegister = round(iRegister)
    
    ; 3. Generate rhythm values based on interpolated movement parameter
    iRhythmSize = 5
    iRhythms[] generateRhythmsForState kInterpolatedDensity, kInterpolatedMovement, kHarmonicDuration, iRhythmSize
    
    ; 4. Amplitude based on register and octave
    iMaxAmplitude calculateMaxAmplitude iOctave, iRegister
    iAmplitude random iMaxAmplitude - 3, iMaxAmplitude
    
    ; 5. Duration based on harmonic duration and density
    iDuration = kHarmonicDuration * (2 + kInterpolatedDensity)
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
                                              iDuration, kHarmonicDuration, 
                                              iAmplitude, iOctave, iRegister
    ; Chiama GeneraComportamenti con i parametri essenziali
    schedule "BehaviorWrapper", 0, 5, 0, iDuration, iIdComp
    
    ; Debug output
    if (gi_debug >= 6) then
        println "Generated transition behavior at progress %.2f (ID %d):\n", kProgress, iIdComp
        println "  Density: %.2f, Register: %.2f, Movement: %.2f\n", 
               kInterpolatedDensity, kInterpolatedRegister, kInterpolatedMovement
        println "  Duration: %.1f, Harmonic Duration: %.1f\n", 
               iDuration, kHarmonicDuration
        println "  Octave: %d, Register: %d, Amplitude: %.1f\n", 
               iOctave, iRegister, iAmplitude
        iIdx = 0
        while (iIdx < iRhythmSize) do
            println "Rhythm val: %d for idx %d", iRhythms[iIdx], iIdx
        od
        while (iIdx < iRhythmSize) do
            println "Positions val: %d for idx %d", iPositions[iIdx], iIdx
        od
    endif
    */
endop