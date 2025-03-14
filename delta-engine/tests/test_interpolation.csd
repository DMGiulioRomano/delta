<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, debug mode only
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Enable debugging
gi_debug init 2

; Define PI constant if not already defined in your includes
#ifndef M_PI
#define M_PI #3.14159265358979323846#
#endif

; ========================================================
; Basic Interpolation Functions for Testing
; ========================================================
#include "../udos/interpolations.udo"
; ========================================================
; Test Instruments
; ========================================================

; Test basic interpolation functions at evenly spaced points
instr TestBasicInterpolation
    iStartValue = p4
    iEndValue = p5
    iNumSteps = p6
    
    prints "\n=== INTERPOLATION TEST ===\n"
    prints "Start Value: %f\n", iStartValue
    prints "End Value: %f\n", iEndValue
    prints "Steps: %d\n\n", iNumSteps
    
    prints "Progress\tLinear\t\tCubic\t\tExponential\n"
    prints "-----------------------------------------------------\n"
    
    iStep = 0
    while iStep <= iNumSteps do
        iProgress = iStep / iNumSteps
        
        iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
        iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
        iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
        
        prints "%.2f\t\t%.4f\t\t%.4f\t\t%.4f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iStep += 1
    od
    
    turnoff
endin

; Test edge cases and special values
instr TestEdgeCases
    prints "\n=== EDGE CASE TESTS ===\n"
    
    ; Test with progress = 0
    iStartValue = 10
    iEndValue = 20
    iProgress = 0
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Progress = 0: Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    ; Test with progress = 1
    iProgress = 1
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Progress = 1: Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    ; Test with negative progress (should clamp to 0)
    iProgress = -0.5
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Progress = -0.5 (clamped): Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    ; Test with progress > 1 (should clamp to 1)
    iProgress = 1.5
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Progress = 1.5 (clamped): Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    ; Test with start > end (decreasing)
    iStartValue = 100
    iEndValue = 0
    iProgress = 0.5
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Decreasing values (100 to 0), Progress = 0.5: Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    ; Test with negative values
    iStartValue = -10
    iEndValue = -20
    
    iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
    iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
    iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
    
    prints "Negative values (-10 to -20), Progress = 0.5: Linear=%.4f, Cubic=%.4f, Exponential=%.4f\n", 
           iLinear, iCubic, iExponential
    
    turnoff
endin

; Test with musical parameters typical in Delta-Engine
instr TestMusicalParameters
    prints "\n=== MUSICAL PARAMETER INTERPOLATION TEST ===\n"
    
    ; Test rhythm-like values (from static to dynamic movement)
    iStaticRhythm = 20   ; High value = static movement
    iDynamicRhythm = 2   ; Low value = dynamic movement
    
    prints "Rhythm Interpolation (Static 20 -> Dynamic 2):\n"
    prints "Progress\tLinear\t\tCubic\t\tExponential\n"
    prints "-----------------------------------------------------\n"
    
    iStep = 0
    iSteps = 10
    while iStep <= iSteps do
        iProgress = iStep / iSteps
        
        iLinear = linearInterpolate(iStaticRhythm, iDynamicRhythm, iProgress)
        iCubic = cubicInterpolate(iStaticRhythm, iDynamicRhythm, iProgress)
        iExponential = exponentialInterpolate(iStaticRhythm, iDynamicRhythm, iProgress)
        
        prints "%.2f\t\t%.2f\t\t%.2f\t\t%.2f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iStep += 1
    od
    
    ; Test harmonic duration values (sparse to dense)
    iSparseDuration = 25  ; Longer duration for sparse texture
    iDenseDuration = 5    ; Shorter duration for dense texture
    
    prints "\nHarmonic Duration Interpolation (Sparse 25 -> Dense 5):\n"
    prints "Progress\tLinear\t\tCubic\t\tExponential\n"
    prints "-----------------------------------------------------\n"
    
    iStep = 0
    while iStep <= iSteps do
        iProgress = iStep / iSteps
        
        iLinear = linearInterpolate(iSparseDuration, iDenseDuration, iProgress)
        iCubic = cubicInterpolate(iSparseDuration, iDenseDuration, iProgress)
        iExponential = exponentialInterpolate(iSparseDuration, iDenseDuration, iProgress)
        
        prints "%.2f\t\t%.2f\t\t%.2f\t\t%.2f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iStep += 1
    od
    
    ; Test amplitude values (high register to low register adjustment)
    iLowRegisterAmp = -12   ; Higher amplitude for low register
    iHighRegisterAmp = -24  ; Lower amplitude for high register
    
    prints "\nAmplitude Interpolation (Low -12 -> High -24):\n"
    prints "Progress\tLinear\t\tCubic\t\tExponential\n"
    prints "-----------------------------------------------------\n"
    
    iStep = 0
    while iStep <= iSteps do
        iProgress = iStep / iSteps
        
        iLinear = linearInterpolate(iLowRegisterAmp, iHighRegisterAmp, iProgress)
        iCubic = cubicInterpolate(iLowRegisterAmp, iHighRegisterAmp, iProgress)
        iExponential = exponentialInterpolate(iLowRegisterAmp, iHighRegisterAmp, iProgress)
        
        prints "%.2f\t\t%.2f\t\t%.2f\t\t%.2f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iStep += 1
    od
    
    turnoff
endin

; Test speed comparison between interpolation methods
instr TestPerformance
    prints "\n=== PERFORMANCE TEST ===\n"
    prints "Executing 10,000 interpolations of each type...\n"
    
    iStartValue = 0
    iEndValue = 100
    iIterations = 10000
    
    ; Start timing for linear interpolation
    iStartTime times
    
    iAccum = 0
    iIter = 0
    while iIter < iIterations do
        iProgress = iIter / iIterations
        iAccum += linearInterpolate(iStartValue, iEndValue, iProgress)
        iIter += 1
    od
    itime times
    iLinearTime = itime - iStartTime
    
    ; Start timing for cubic interpolation
    iStartTime times
    
    iAccum = 0  ; Reset accumulator
    iIter = 0
    while iIter < iIterations do
        iProgress = iIter / iIterations
        iAccum += cubicInterpolate(iStartValue, iEndValue, iProgress)
        iIter += 1
    od
    itime2 times
    iCubicTime = itime2 - iStartTime
    
    ; Start timing for exponential interpolation
    iStartTime times
    
    iAccum = 0  ; Reset accumulator
    iIter = 0
    while iIter < iIterations do
        iProgress = iIter / iIterations
        iAccum += exponentialInterpolate(iStartValue, iEndValue, iProgress)
        iIter += 1
    od
    itime3 times
    iExponentialTime = itime3 - iStartTime
    
    ; Print results
    prints "Linear interpolation: %.6f seconds\n", iLinearTime
    prints "Cubic interpolation: %.6f seconds\n", iCubicTime
    prints "Exponential interpolation: %.6f seconds\n", iExponentialTime
    
    ; Compare performance
    if iLinearTime > 0 then
        prints "Relative Performance:\n"
        prints "Linear: 1.0 (baseline)\n"
        prints "Cubic: %.2f times slower\n", iCubicTime/iLinearTime
        prints "Exponential: %.2f times slower\n", iExponentialTime/iLinearTime
    endif
    
    turnoff
endin

; Visual comparison of interpolation curves
instr GenerateCSVData
    iStartValue = 0
    iEndValue = 100
    iSteps = 100
    
    prints "\n=== GENERATING CSV DATA FOR VISUALIZATION ===\n"
    prints "Writing to 'interpolation_curves.csv'...\n"
    
    iResult system_i 1, "mkdir -p ./tests/data", 0
    ; Open CSV file
    SFileName = "tests/data/interpolation_curves.csv"
    fprints SFileName, "progress,linear,cubic,exponential\n"
    
    
    ; Generate data points
    iStep = 0
    while iStep <= iSteps do
        iProgress = iStep / iSteps
        
        iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
        iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
        iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
        
        fprints SFileName, "%.4f,%.4f,%.4f,%.4f\n", 
                iProgress, iLinear, iCubic, iExponential
        
        iStep += 1
    od
    
    prints "CSV data written successfully. Use with visualization script.\n"
    prints "Example Python command: python tests/plot_interpolation.py %s\n", SFileName
    ipino system_i 1, "make tests-analyze"
    turnoff
endin

; Test different progress values with fixed start/end values
instr TestProgressValues
    iStartValue = 0
    iEndValue = 100
    
    prints "\n=== TESTING SPECIFIC PROGRESS VALUES ===\n"
    prints "Fixed range [%f to %f]\n\n", iStartValue, iEndValue
    
    ; Define specific progress values to test
    iProgressValues[] fillarray 0, 0.1, 0.25, 0.33, 0.5, 0.66, 0.75, 0.9, 1
    iNumValues = lenarray(iProgressValues)
    
    prints "Progress\tLinear\t\tCubic\t\tExponential\n"
    prints "-----------------------------------------------------\n"
    
    iIdx = 0
    while iIdx < iNumValues do
        iProgress = iProgressValues[iIdx]
        
        iLinear = linearInterpolate(iStartValue, iEndValue, iProgress)
        iCubic = cubicInterpolate(iStartValue, iEndValue, iProgress)
        iExponential = exponentialInterpolate(iStartValue, iEndValue, iProgress)
        
        prints "%.2f\t\t%.4f\t\t%.4f\t\t%.4f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iIdx += 1
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Schedule test instruments in sequence

; Basic interpolation from 0 to 100 with 10 steps
i "TestBasicInterpolation" 0 0.1 0 100 10

; Test edge cases and special values
i "TestEdgeCases" + 0.1

; Test with musical parameters relevant to Delta-Engine
i "TestMusicalParameters" + 0.1

; Performance test (speed comparison)
i "TestPerformance" + 0.1

; Generate CSV data for external visualization
i "GenerateCSVData" + 0.1

; Test specific progress values
i "TestProgressValues" + 0.1

e
</CsScore>
</CsoundSynthesizer>