; -----------------------------------------------------------------------
; BEHAVIOR GENERATION WITH INTERPOLATED PARAMETERS
; -----------------------------------------------------------------------
opcode generateTransitionBehavior, 0, i
    iProgress xin
    
    ; Interpolate between source and target states
    iInterpolatedDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    iInterpolatedRegister interpolateParameter gi_tc_source_register, gi_tc_target_register, iProgress, 0
    iInterpolatedMovement interpolateParameter gi_tc_source_movement, gi_tc_target_movement, iProgress, -0.3
    
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
    iRhythmTableSize = 5
    iRhythmsTable generateRhythmsForState iInterpolatedDensity, iInterpolatedMovement, iHarmonicDuration, iRhythmTableSize
    ; 4. Amplitude based on register and octave
    iMaxAmplitude calculateMaxAmplitude iOctave, iRegister
    iAmplitude random iMaxAmplitude - 3, iMaxAmplitude
    
    ; 5. Duration based on harmonic duration and density
    iDuration = iHarmonicDuration * (2 + iInterpolatedDensity)
    
    ; 6. Generate positions - for simplicity, use random positions
    iPositionsTable ftgen 0, 0, iRhythmTableSize+1, -2, 0
    iIdx = 0
    while (iIdx < iRhythmTableSize) do
        iRhythmVal tab_i iIdx, iRhythmsTable
        iPos random 0, iRhythmVal
        iPos = int(iPos)
        tabw_i iPos, iIdx, iPositionsTable
        iIdx += 1
    od
    
    ; Start time for the behavior (now)
    iStartTime = 0
    ; Globally unique ID for this behavior
    gi_compId +=1
    ; 
    ; da capire come gestire iNextID
    iNextID = gi_NUMComportamenti - 10  ; Reserve last 10 slots for transition behaviors
    iNextID += gi_tc_transition_active   ; Increment when transition is active
    iAt times
    ; Schedule the behavior generation with interpolated parameters
    event_i "i", "GeneraComportamenti", iStartTime, 10, 
            iAt, iDuration, iRhythmsTable, iHarmonicDuration, 
            iAmplitude, iOctave, iRegister, iPositionsTable, gi_compId
    
    ; Debug output
    if (gi_debug >= 2) then
        prints "Generated transition behavior at progress %.2f:\n", iProgress
        prints "  Density: %.2f, Register: %.2f, Movement: %.2f\n", 
               iInterpolatedDensity, iInterpolatedRegister, iInterpolatedMovement
        prints "  Duration: %.1f, Harmonic Duration: %.1f\n", 
               iDuration, iHarmonicDuration
        prints "  Octave: %d, Register: %d, Amplitude: %.1f\n", 
               iOctave, iRegister, iAmplitude
    endif
endop

