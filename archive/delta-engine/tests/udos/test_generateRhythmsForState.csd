<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Essential constants and globals
#define OTTAVE          #10#
#define INTERVALLI      #200#
#define REGISTRI        #10#
#define M_PI            #3.14159265358979323846#
gi_debug init 2  ; Debug level for detailed output

; Create function tables for testing
gi_memory_harmonic_density ftgen 0, 0, 100, -2, 0
gi_memory_octave_spread ftgen 0, 0, 100, -2, 0
gi_memory_spectral_centroid ftgen 0, 0, 100, -2, 0
gi_memory_spatial_movement ftgen 0, 0, 100, -2, 0
gi_analysis_buffer_size = 100
gi_analysis_active_events ftgen 0, 0, gi_analysis_buffer_size, -2, 0

; Global variables for current state
gk_current_overlap init 0
gk_current_harmonic_density init 0
gk_current_octave_spread init 0
gk_current_spectral_centroid init 0
gk_current_spatial_movement init 0

; Include utilities and the functions we need to test

; Nuova implementazione di generateRhythmsForState che usa array internamente
opcode generateRhythmsForState, i[], iiii
    iDensityState, iMovementState, iHarmonicDuration, iArraySize xin
    
    ; Array di output
    iRhythms[] init iArraySize
    
    ; Debug output
    if gi_debug >= 3 then
        prints "generateRhythmsForState chiamato con:\n"
        prints "  Density: %f, Movement: %f, HarmonicDuration: %f, ArraySize: %d\n",
               iDensityState, iMovementState, iHarmonicDuration, iArraySize
    endif
    
    ; Sanitizziamo i parametri
    iDensityState = limit(iDensityState, 0, 2)
    iMovementState = limit(iMovementState, 0, 2)
    iHarmonicDuration = limit(iHarmonicDuration, 1, 60)
    
    ; Calcola range di ritmi basato sul movimento
    i_MovementNormalized = limit:i(iMovementState / 2, 0, 1)
    i_temp pow i_MovementNormalized, 1.5
    iMovementFactor = 1 - i_temp
    
    ; Calcola range dei ritmi con limiti assoluti
    iMinRhythm = 1 + iMovementFactor * 7
    iMaxRhythm = 4 + iMovementFactor * 16
    iMinRhythm = limit(iMinRhythm, 1, 10)
    iMaxRhythm = limit(iMaxRhythm, 5, 30)
    
    ; Calcoli per la densità
    i_fDensityNormalized = limit:i(iDensityState / 2, 0, 1)
    iDensityFactor = limit(pow(i_fDensityNormalized, 1.2), 0, 1)
    
    ; Calcolo eventi per secondo più sicuro
    iEventsPerSecond = 0.3 + (iDensityFactor * 2.2)
    iEventsPerSecond = limit(iEventsPerSecond, 0.1, 5)
    
    ; Calcolo target con controlli di sicurezza assoluti
    iTargetAvgRhythm = iHarmonicDuration * iEventsPerSecond
    iTargetAvgRhythm = limit(iTargetAvgRhythm, 1, 50)
    
    ; Punto medio del range ritmico
    iRhythmRangeMidpoint = (iMinRhythm + iMaxRhythm) / 2
    
    ; Blending con controlli di sicurezza
    iBlendedTarget = (iTargetAvgRhythm * 0.6) + (iRhythmRangeMidpoint * 0.4)
    iBlendedTarget = limit(iBlendedTarget, 1, 40)
    
    ; Calcolo range finale con limiti stretti
    i_fFinalMin = limit:i(iBlendedTarget * 0.8, iMinRhythm, iMaxRhythm)
    i_fFinalMax = limit:i(iBlendedTarget * 1.2, iMinRhythm, iMaxRhythm)
    
    ; Ulteriori controlli di sicurezza sul range
    i_fFinalMin = limit(i_fFinalMin, 1, 25)
    i_fFinalMax = limit(i_fFinalMax, i_fFinalMin + 1, 30)
    
    if gi_debug >= 3 then
        prints "  Range finale dei ritmi: %f - %f\n", i_fFinalMin, i_fFinalMax
    endif
    
    ; Riempi l'array di ritmi
    iIdx = 0
    while iIdx < iArraySize do
        iRhythmValue = random(i_fFinalMin, i_fFinalMax)
        iRhythmValue = round(iRhythmValue)
        iRhythmValue = limit(iRhythmValue, 1, 40)
        
        iRhythms[iIdx] = iRhythmValue
        
        if gi_debug >= 3 && iIdx == 0 then
            prints "  Primo valore ritmico generato: %f\n", iRhythmValue
        endif
        
        iIdx += 1
    od
    
    xout iRhythms
endop

instr TestGenerateRhythmsForState
    prints "\n=== Testing generateRhythmsForState (versione con array) ===\n\n"
    
    ; Define test cases with different combinations
    iNumTestCases = 9
    iDensityStates[] fillarray 0, 0, 0, 1, 1, 1, 2, 2, 2
    iMovementStates[] fillarray 0, 1, 2, 0, 1, 2, 0, 1, 2
    iHarmonicDurations[] fillarray 20, 20, 20, 10, 10, 10, 5, 5, 5
    
    prints "RHYTHM GENERATION TEST RESULTS:\n"
    prints "------------------------------\n"
    prints "Case | Density | Movement | HarmDur | Generated Rhythms\n"
    prints "--------------------------------------------------\n"
    
    ; Run each test case
    iTestIdx = 0
    iArraySize = 5  ; Generate 5 rhythm values for each test
    
    while iTestIdx < iNumTestCases do
        iDensity = iDensityStates[iTestIdx]
        iMovement = iMovementStates[iTestIdx]
        iHarmonicDuration = iHarmonicDurations[iTestIdx]
        
        ; Call the function to generate rhythms - now returns an array
        iRhythms[] generateRhythmsForState iDensity, iMovement, iHarmonicDuration, iArraySize
        
        ; Print the test case header
        prints " %d   |   %d     |    %d     |   %d    | ", iTestIdx+1, iDensity, iMovement, iHarmonicDuration
        
        ; Print the generated rhythm values from the array
        iRhythmIdx = 0
        while iRhythmIdx < iArraySize do
            prints "%d ", iRhythms[iRhythmIdx]
            iRhythmIdx += 1
        od
        prints "\n"
        
        iTestIdx += 1
    od
    
    ; Show detailed calculation for one specific case
    prints "\nDETAILED CALCULATION FOR SPECIFIC CASE:\n"
    prints "---------------------------------------\n"
    
    ; Choose one interesting case for detailed inspection
    iDetailDensity = 1
    iDetailMovement = 1
    iDetailHarmDur = 10
    
    prints "Parameters: Density=%d, Movement=%d, HarmonicDuration=%d\n", 
           iDetailDensity, iDetailMovement, iDetailHarmDur
    
    ; Set debug level higher temporarily
    iOldDebug = gi_debug
    gi_debug = 3
    
    ; Call the function with higher debug level
    iDetailRhythms[] generateRhythmsForState iDetailDensity, iDetailMovement, iDetailHarmDur, iArraySize
    
    ; Restore previous debug level
    gi_debug = iOldDebug
    
    ; Print the full resulting array
    prints "Final rhythm values: "
    iRhythmIdx = 0
    while iRhythmIdx < iArraySize do
        prints "%d ", iDetailRhythms[iRhythmIdx]
        iRhythmIdx += 1
    od
    prints "\n"
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestGenerateRhythmsForState" 0 0.1
e
</CsScore>
</CsoundSynthesizer>