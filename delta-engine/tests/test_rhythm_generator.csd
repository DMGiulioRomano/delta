<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, display messages only
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Set debug level to see detailed output
gi_debug init 2

; Include the UDO file
#include "../udos/parameterInterpolation.udo"

; Test instrument for rhythm generation with continuous states
instr TestRhythmGenerator
    prints "\n=== TEST RHYTHM GENERATOR WITH CONTINUOUS STATES ===\n"
    ; Parameters
    iDensityState = p4
    iMovementState = p5
    iHarmonicDuration = p6
    iTableSize = p7
    
    ; Generate rhythms
    iRhythmTable = generateRhythmsForState(iDensityState, iMovementState, iHarmonicDuration, iTableSize)
    
    ; Calculate and display some statistics
    iSum = 0
    iMin = 9999
    iMax = 0
    iIdx = 0
    
    while iIdx < iTableSize do
        iVal = tab_i(iIdx, iRhythmTable)
        iSum += iVal
        iMin = min(iMin, iVal)
        iMax = max(iMax, iVal)
        iIdx += 1
    od
    
    iAvg = iSum / iTableSize
    
    ; Show a histogram of values
    prints "\nHistogram of rhythm values:\n"
    prints "-------------------------\n"
    
    iMaxRange = 20  ; Maximum rhythm value to show in histogram
    iHistBin = 0
    
    while iHistBin <= iMaxRange do
        iCount = 0
        iIdx = 0
        
        while iIdx < iTableSize do
            iVal = tab_i(iIdx, iRhythmTable)
            if iVal == iHistBin then
                iCount += 1
            endif
            iIdx += 1
        od
        
        if iCount > 0 then
            prints "  Value %2d: ", iHistBin
            iBar = 0
            while iBar < iCount do
                prints "*"
                iBar += 1
            od
            prints " (%d)\n", iCount
        endif
        
        iHistBin += 1
    od
    
    ; Calculate expected events per second and overlap with this harmonic duration
    iEventsPerSec = iAvg / iHarmonicDuration
    iExpectedOverlap = iEventsPerSec * (iHarmonicDuration / 2)  ; Rough approximation
    
    prints "\nStatistics:\n"
    prints "  Average rhythm value: %.2f\n", iAvg
    prints "  Range: %d to %d\n", iMin, iMax
    prints "  Expected events per second: %.2f\n", iEventsPerSec
    prints "  Estimated event overlap: %.2f\n", iExpectedOverlap
    
    ; Calculate actual timing sequence for first few events
    prints "\nExample event timing sequence (harmonic duration: %.2f):\n", iHarmonicDuration
    prints "  Time 0.00: Event starts\n"
    
    iTimeSoFar = 0
    iShowEvents = min(iTableSize, 10)  ; Show up to 10 events
    iRhythmIdx = 0
    
    while iRhythmIdx < iShowEvents do
        iRhythm = tab_i(iRhythmIdx, iRhythmTable)
        iTimeDelta = iHarmonicDuration / iRhythm
        iTimeSoFar += iTimeDelta
        prints "  Time %.2f: Next event (rhythm value: %d, delta: %.2f)\n", 
               iTimeSoFar, iRhythm, iTimeDelta
        iRhythmIdx += 1
    od
    
    prints "\n=== TEST COMPLETE ===\n\n"
    
    turnoff
endin

; Test instrument to show rhythm evolution during a transition
instr TestTransition
    prints "\n=== TEST RHYTHM EVOLUTION DURING TRANSITION ===\n"
    
    ; Transition parameters
    iSourceDensity = p4
    iSourceMovement = p5
    iTargetDensity = p6
    iTargetMovement = p7
    iDuration = p8
    iSteps = p9
    
    ; Get harmonic durations for source and target
    iSourceHarmDur = mapDensityToHarmonicDuration(iSourceDensity)
    iTargetHarmDur = mapDensityToHarmonicDuration(iTargetDensity)
    
    prints "Source State: Density=%.2f, Movement=%.2f, HarmDur=%.2f\n", 
           iSourceDensity, iSourceMovement, iSourceHarmDur
    prints "Target State: Density=%.2f, Movement=%.2f, HarmDur=%.2f\n", 
           iTargetDensity, iTargetMovement, iTargetHarmDur
    prints "\nTransition steps:\n"
    
    ; Show evolution at each step
    iStep = 0
    while iStep <= iSteps do
        ; Calculate progress
        iProgress = iStep / iSteps
        
        ; Interpolate state parameters
        iDensity = iSourceDensity + (iTargetDensity - iSourceDensity) * iProgress
        iMovement = iSourceMovement + (iTargetMovement - iSourceMovement) * iProgress
        iHarmDur = iSourceHarmDur + (iTargetHarmDur - iSourceHarmDur) * iProgress
        
        ; Generate rhythms for this step
        iTableSize = 5
        iRhythmTable = generateRhythmsForState(iDensity, iMovement, iHarmDur, iTableSize)
        
        ; Calculate average rhythm value
        iSum = 0
        iIdx = 0
        while iIdx < iTableSize do
            iSum += tab_i(iIdx, iRhythmTable)
            iIdx += 1
        od
        iAvg = iSum / iTableSize
        
        ; Calculate expected events per second and overlap
        iEventsPerSec = iAvg / iHarmDur
        iExpectedOverlap = iEventsPerSec * (iHarmDur / 2)  ; Rough approximation
        
        ; Print step info
        prints "\nStep %d (Progress: %.2f)\n", iStep, iProgress
        prints "  Interpolated State: Density=%.2f, Movement=%.2f, HarmDur=%.2f\n", 
               iDensity, iMovement, iHarmDur
        
        ; Print rhythm values
        prints "  Rhythm values: ["
        iIdx = 0
        while iIdx < iTableSize do
            if iIdx > 0 then
                prints ", "
            endif
            prints "%d", tab_i(iIdx, iRhythmTable)
            iIdx += 1
        od
        prints "]\n"
        
        prints "  Average rhythm: %.2f\n", iAvg
        prints "  Expected events/sec: %.2f\n", iEventsPerSec
        prints "  Estimated overlap: %.2f\n", iExpectedOverlap
        
        iStep += 1
    od
    
    prints "\n=== TRANSITION TEST COMPLETE ===\n\n"
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Define test cases for TestRhythmGenerator
;   p4 = Density state (0-2, continuous)
;   p5 = Movement state (0-2, continuous)
;   p6 = Harmonic duration
;   p7 = Table size

; Test 1: Low density, static movement (0, 0)
i "TestRhythmGenerator" 0 0.1 0 0 10 10

; Test 2: Low density, dynamic movement (0, 2)
i "TestRhythmGenerator" + 0.1 0 2 10 10

; Test 3: High density, static movement (2, 0)
i "TestRhythmGenerator" + 0.1 2 0 10 10

; Test 4: High density, dynamic movement (2, 2)
i "TestRhythmGenerator" + 0.1 2 2 10 10

; Test 5: Medium values (1, 1)
i "TestRhythmGenerator" + 0.1 1 1 10 10

; Test 6: In-between values (0.5, 1.5)
i "TestRhythmGenerator" + 0.1 0.5 1.5 10 10

; Test with different harmonic durations
i "TestRhythmGenerator" + 0.1 1 1 5 10
i "TestRhythmGenerator" + 0.1 1 1 15 10
i "TestRhythmGenerator" + 0.1 1 1 25 10

; Define transition tests
;   p4 = Source density state
;   p5 = Source movement state
;   p6 = Target density state
;   p7 = Target movement state
;   p8 = Transition duration (seconds)
;   p9 = Number of steps to show

; Transition 1: Static/sparse to dynamic/dense (0,0 → 2,2)
i "TestTransition" + 0.1 0 0 2 2 15 5

; Transition 2: Dynamic/dense to static/sparse (2,2 → 0,0)
i "TestTransition" + 0.1 2 2 0 0 15 5

; Transition 3: Static/dense to dynamic/sparse (2,0 → 0,2)
i "TestTransition" + 0.1 2 0 0 2 15 5

; Transition 4: Small change (1,1 → 1.5,0.5)
i "TestTransition" + 0.1 1 1 1.5 0.5 10 3

e
</CsScore>
</CsoundSynthesizer>