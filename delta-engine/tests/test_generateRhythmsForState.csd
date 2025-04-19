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
#include "../udos/utils.udo"
#include "../udos/interpolations.udo"
#include "../udos/stateMapping.udo"
#include "../udos/parameterInterpolation.udo"

instr TestGenerateRhythmsForState
    prints "\n=== Testing generateRhythmsForState ===\n\n"
    
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
    iTableSize = 5  ; Generate 5 rhythm values for each test
    
    while iTestIdx < iNumTestCases do
        iDensity = iDensityStates[iTestIdx]
        iMovement = iMovementStates[iTestIdx]
        iHarmonicDuration = iHarmonicDurations[iTestIdx]
        
        ; Call the function to generate rhythms
        iRhythmTable generateRhythmsForState iDensity, iMovement, iHarmonicDuration, iTableSize
        
        ; Print the test case header
        prints " %d   |   %d     |    %d     |   %d    | ", iTestIdx+1, iDensity, iMovement, iHarmonicDuration
        
        ; Print the generated rhythm values
        iRhythmIdx = 0
        while iRhythmIdx < iTableSize do
            iRhythm tab_i iRhythmIdx, iRhythmTable
            prints "%d ", iRhythm
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
    iDetailRhythmTable generateRhythmsForState iDetailDensity, iDetailMovement, iDetailHarmDur, iTableSize
    
    ; Restore previous debug level
    gi_debug = iOldDebug
    
    ; Print the full resulting table
    prints "Final rhythm values: "
    iRhythmIdx = 0
    while iRhythmIdx < iTableSize do
        iRhythm tab_i iRhythmIdx, iDetailRhythmTable
        prints "%d ", iRhythm
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