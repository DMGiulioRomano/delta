<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Define some essential constants and macros needed for the UDO
#define M_PI #3.14159265358979323846#
gi_debug init 1
#include "../udos/interpolations.udo"
#include "../udos/parameterInterpolation.udo"
; Test instrument that calls the UDO with a range of values
instr TestMapDensityToHarmonicDuration
    prints "\n==========================================\n"
    prints "Testing mapDensityToHarmonicDuration UDO\n"
    prints "==========================================\n\n"
    
    prints "Format: Density State -> Harmonic Duration (seconds)\n\n"
    
    ; Test with exact state values
    prints "Exact state values:\n"
    iResultSparse = mapDensityToHarmonicDuration(0)
    prints "Sparse (0)   -> %.2f seconds\n", iResultSparse
    
    iResultMedium = mapDensityToHarmonicDuration(1)
    prints "Medium (1)   -> %.2f seconds\n", iResultMedium
    
    iResultDense = mapDensityToHarmonicDuration(2)
    prints "Dense (2)    -> %.2f seconds\n", iResultDense
    
    prints "\nIntermediate values:\n"
    
    ; Test with intermediate values (to check gradual transitions)
    iStep = 0.25
    iStateVal = 0
    while iStateVal <= 2 do
        iResult = mapDensityToHarmonicDuration(iStateVal)
        prints "State %.2f -> %.2f seconds\n", iStateVal, iResult
        iStateVal = iStateVal + iStep
    od
    
    prints "\nRandomization test (same input, multiple runs):\n"
    
    ; Test randomization effect - multiple runs with same input
    iFixed = 1.0  ; Medium density
    iRun = 0
    while iRun < 5 do
        iResult = mapDensityToHarmonicDuration(iFixed)
        prints "State %.1f (run %d) -> %.2f seconds\n", iFixed, iRun+1, iResult
        iRun = iRun + 1
    od
    
    prints "\nEdge cases:\n"
    
    ; Test edge cases and out-of-range inputs
    iNegative = mapDensityToHarmonicDuration(-1)
    prints "Negative (-1) -> %.2f seconds\n", iNegative
    
    iOverRange = mapDensityToHarmonicDuration(3)
    prints "Over range (3) -> %.2f seconds\n", iOverRange
    
    prints "\n==========================================\n"
    prints "Test completed\n"
    prints "==========================================\n"
    
    turnoff
endin

; Run tests
instr RunTests
    event_i "i", "TestMapDensityToHarmonicDuration", 0, 0.1
endin

</CsInstruments>
<CsScore>
i "RunTests" 0 0.1
e 0.2  ; Short duration since we're not producing audio
</CsScore>
</CsoundSynthesizer>