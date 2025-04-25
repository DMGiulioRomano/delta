<CsoundSynthesizer>
<CsOptions>
-o "comportamento-test.wav" -W -m0
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; Debug level - increase to see more detailed output
gi_debug init 3

; --------------------------------------------------------------------------
; IMPORT REQUIRED FILES
; --------------------------------------------------------------------------
#include "../../MACROS/debug.orc"
#include "../../MACROS/init.orc"
#include "../../udos/utils.udo"
#include "../../udos/GenPythagFreqs.udo"
#include "../../udos/pfield_comp.udo"
#include "../../udos/calcDurationFactor.udo"
#include "../../udos/determineCurrentState.udo"
#include "../../udos/validator.udo"
#include "../../orc/eventoSonoro.orc"
#include "../../orc/Comportamento.orc"

; --------------------------------------------------------------------------
; INITIALIZATION
; --------------------------------------------------------------------------

instr Init
    ; Create directory for test results
    iRes system_i 1, "mkdir -p ./test-results"

    ; Set up logging file for the test
    prints "test-results/comportamento_test_log.txt", "\n=== COMPORTAMENTO STRESS TEST ===\n"
    prints "test-results/comportamento_test_log.txt", "Started at: %s\n", date(1)
    prints "test-results/comportamento_test_log.txt", "Debug level: %d\n\n", gi_debug
    
    ; Initialize frequency system
    iRes GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    
    if iRes == 1 then
        prints "\nGenPythagFreqs: Success!\n\n"
        prints "test-results/comportamento_test_log.txt", "PythagFreqs initialization: SUCCESS\n"
    else
        prints "\nGenPythagFreqs failed: %d\n", iRes
        prints "test-results/comportamento_test_log.txt", "PythagFreqs initialization: FAILED (%d)\n", iRes
        exitnow
    endif
    
    ; Initialize Analyzer with default values
    schedule "AnalyzerControl", 0, -1, 1, 5  ; Mode 1 (normal), default overlap 5
    
    ; Generate test rhythm tables
    giRhythmsNormal ftgen 0, 0, 16, -2, 4, 5, 6, 7, 8  ; Normal rhythms
    giPosNormal ftgen 0, 0, 16, -2, 0, 1, 2, 3, 4     ; Normal positions
    
    giRhythmsFast ftgen 0, 0, 16, -2, 1, 2, 1, 2, 3   ; Fast rhythms
    giPosFast ftgen 0, 0, 16, -2, 0, 1, 0, 1, 2       ; Fast positions
    
    giRhythmsSlow ftgen 0, 0, 16, -2, 10, 12, 15, 20, 25 ; Slow rhythms
    giPosSlow ftgen 0, 0, 16, -2, 5, 6, 7, 10, 12      ; Slow positions
    
    prints "test-results/comportamento_test_log.txt", "Test tables initialized\n"
    prints "test-results/comportamento_test_log.txt", "Starting test sequence...\n\n"
endin

; --------------------------------------------------------------------------
; CUSTOM ANALYZER CONTROL
; --------------------------------------------------------------------------

instr AnalyzerControl
    ; Mode:
    ;  1 = normal (value set by p4)
    ;  2 = escalating (starts at p4, increases to p5 over duration)
    ;  3 = oscillating (oscillates between p4 and p5)
    ;  0 = disabled (always returns 0)
    iMode = p4
    iValue1 = p5
    iValue2 = (p6 == 0) ? 20 : p6
    
    if iMode == 0 then
        gi_current_overlap = 0
        printks "Analyzer DISABLED - overlap fixed at 0\n", 1
        prints "test-results/comportamento_test_log.txt", "Analyzer mode: DISABLED\n"
    elseif iMode == 1 then
        gi_current_overlap = iValue1
        printks "Analyzer FIXED - overlap = %d\n", 1, gi_current_overlap
        prints "test-results/comportamento_test_log.txt", "Analyzer mode: FIXED (value: %d)\n", iValue1
    elseif iMode == 2 then
        ; Escalating mode
        kTime timeinsts
        kDur = 60  ; Duration of escalation
        kProgress = limit(kTime/kDur, 0, 1)
        gi_current_overlap = iValue1 + (iValue2 - iValue1) * kProgress
        
        ktrig metro 2
        if ktrig == 1 then
            printks "Analyzer ESCALATING - overlap = %.2f\n", 0, gi_current_overlap
        endif
        
        if kTime < 0.1 then
            prints "test-results/comportamento_test_log.txt", "Analyzer mode: ESCALATING (from %d to %d over %.1f seconds)\n", 
                     iValue1, iValue2, kDur
        endif
    elseif iMode == 3 then
        ; Oscillating mode
        kTime timeinsts
        kFreq = 0.05  ; Complete cycle every 20 seconds
        gi_current_overlap = iValue1 + (iValue2 - iValue1) * 0.5 * (1 + sin(kTime * kFreq * 2 * 3.14159))
        
        ktrig metro 2
        if ktrig == 1 then
            printks "Analyzer OSCILLATING - overlap = %.2f\n", 0, gi_current_overlap
        endif
        
        if kTime < 0.1 then
            prints "test-results/comportamento_test_log.txt", "Analyzer mode: OSCILLATING (between %d and %d, %.1f seconds per cycle)\n", 
                     iValue1, iValue2, 1/kFreq
        endif
    endif
endin

; --------------------------------------------------------------------------
; TEST COORDINATOR
; --------------------------------------------------------------------------

instr TestCoordinator
    ; Schedule the test sequence
    
    ; TEST 1: Basic functionality test - single behavior
    schedule "TestSingleBehavior", 0, 1
    
    ; TEST 2: Concurrency Test - Multiple behaviors with slight time offset
    schedule "TestConcurrentBehaviors", 10, 1 
    
    ; TEST 3: Analyzer dependency test - changing analyzer values
    schedule "TestAnalyzerDependency", 30, 1
    
    ; TEST 4: Long duration stability test
    schedule "TestLongDuration", 50, 1
    
    ; TEST 5: Extreme concurrency - many behaviors with small increments
    schedule "TestExtremeConcurrency", 90, 1
    
    ; Final analysis scheduled far enough to capture all events
    schedule "TestAnalysis", 150, 1
endin

; --------------------------------------------------------------------------
; TEST SCENARIOS
; --------------------------------------------------------------------------

; TEST 1 - Basic functionality test - single behavior
instr TestSingleBehavior
    prints "\n\n=== TEST 1: SINGLE BEHAVIOR TEST ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST 1: SINGLE BEHAVIOR ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    ; Normal single behavior
    schedule "Comportamento", 0, 10, giRhythmsNormal, 10, -20, 4, 5, giPosNormal, 1
endin

; TEST 2 - Concurrency test - multiple behaviors with slight time offset
instr TestConcurrentBehaviors
    prints "\n\n=== TEST 2: CONCURRENT BEHAVIORS TEST ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST 2: CONCURRENT BEHAVIORS ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    iOffset = 0
    iCount = 5
    
    iIdx = 0
    while iIdx < iCount do
        schedule "Comportamento", iOffset, 15, giRhythmsNormal, 10, -20, 4, 5, giPosNormal, 10+iIdx
        iOffset += 0.5  ; Half-second offset between behaviors
        iIdx += 1
    od
    
    prints "test-results/comportamento_test_log.txt", "Scheduled %d concurrent behaviors with %.1f second offset\n", 
             iCount, 0.5
endin

; TEST 3 - Analyzer dependency test
instr TestAnalyzerDependency
    prints "\n\n=== TEST 3: ANALYZER DEPENDENCY TEST ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST 3: ANALYZER DEPENDENCY ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    ; First test with normal analyzer
    schedule "Comportamento", 0, 5, giRhythmsFast, 8, -15, 3, 4, giPosFast, 20
    
    ; Change analyzer to disabled mode
    prints "test-results/comportamento_test_log.txt", "Disabling analyzer at %.2f\n", times()
    schedule "AnalyzerControl", 5, -1, 0, 0
    
    ; Run behavior with analyzer disabled
    schedule "Comportamento", 5, 5, giRhythmsFast, 8, -15, 3, 4, giPosFast, 21
    
    ; Change analyzer to escalating mode
    prints "test-results/comportamento_test_log.txt", "Setting analyzer to escalating mode at %.2f\n", times()
    schedule "AnalyzerControl", 10, -1, 2, 1, 30
    
    ; Run behavior with escalating analyzer
    schedule "Comportamento", 10, 5, giRhythmsFast, 8, -15, 3, 4, giPosFast, 22
    
    ; Reset analyzer to normal
    schedule "AnalyzerControl", 15, -1, 1, 5
endin

; TEST 4 - Long duration stability test
instr TestLongDuration
    prints "\n\n=== TEST 4: LONG DURATION STABILITY TEST ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST 4: LONG DURATION STABILITY ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    ; Test with long duration to check NonlinearFunc stability
    iDuration = 30
    schedule "Comportamento", 0, iDuration, giRhythmsSlow, 20, -18, 2, 6, giPosSlow, 30
    
    prints "test-results/comportamento_test_log.txt", "Scheduled long behavior (duration: %d seconds)\n", iDuration
endin

; TEST 5 - Extreme concurrency test
instr TestExtremeConcurrency
    prints "\n\n=== TEST 5: EXTREME CONCURRENCY TEST ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST 5: EXTREME CONCURRENCY ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    iStartTime = times()
    iOffset = 0
    iCount = 20
    
    ; Set oscillating analyzer mode
    schedule "AnalyzerControl", 0, -1, 3, 2, 15
    
    ; Schedule many behaviors with tiny offsets
    iIdx = 0
    while iIdx < iCount do
        ; Alternate between different rhythm types
        if (iIdx % 3 == 0) then
            schedule "Comportamento", iOffset, 10, giRhythmsFast, 5, -20, 5, 3, giPosFast, 40+iIdx
        elseif (iIdx % 3 == 1) then
            schedule "Comportamento", iOffset, 12, giRhythmsNormal, 8, -18, 4, 5, giPosNormal, 40+iIdx
        else
            schedule "Comportamento", iOffset, 15, giRhythmsSlow, 12, -15, 3, 7, giPosSlow, 40+iIdx
        endif
        
        iOffset += 0.1  ; Very small offset (100ms)
        iIdx += 1
    od
    
    prints "test-results/comportamento_test_log.txt", "Scheduled %d concurrent behaviors with %.2f second offset\n", 
             iCount, 0.1
    
    ; Reset analyzer after 15 seconds
    schedule "AnalyzerControl", 20, -1, 1, 5
endin

; TEST ANALYSIS - Generate statistics about all tests
instr TestAnalysis
    prints "\n\n=== TEST ANALYSIS ===\n\n"
    prints "test-results/comportamento_test_log.txt", "=== TEST ANALYSIS ===\n"
    prints "test-results/comportamento_test_log.txt", "Time: %.2f\n", times()
    
    ; Count total events generated
    iTotalEvents = gi_Index
    prints "Total events generated: %d\n", iTotalEvents
    prints "test-results/comportamento_test_log.txt", "Total events generated: %d\n", iTotalEvents
    
    ; Analyze event durations
    iMinDuration = 1000000
    iMaxDuration = 0
    iTotalDuration = 0
    
    iIdx = 0
    while iIdx < iTotalEvents do
        iDuration tab_i iIdx, gi_eve_durata
        
        iMinDuration = min(iMinDuration, iDuration)
        iMaxDuration = max(iMaxDuration, iDuration)
        iTotalDuration += iDuration
        
        iIdx += 1
    od
    
    iAvgDuration = (iTotalEvents > 0) ? iTotalDuration / iTotalEvents : 0
    
    prints "test-results/comportamento_test_log.txt", "Event duration statistics:\n"
    prints "test-results/comportamento_test_log.txt", "  Minimum: %.3f seconds\n", iMinDuration
    prints "test-results/comportamento_test_log.txt", "  Maximum: %.3f seconds\n", iMaxDuration
    prints "test-results/comportamento_test_log.txt", "  Average: %.3f seconds\n", iAvgDuration
    
    ; Create CSV of all events for analysis
    fprints "test-results/event_data.csv", "id,attack,duration,amplitude,frequency,position,rhythm,behavior\n"
    
    iIdx = 0
    while iIdx < iTotalEvents do
        iAttack tab_i iIdx, gi_eve_attacco
        iDuration tab_i iIdx, gi_eve_durata
        iAmplitude tab_i iIdx, gi_eve_ampiezza
        iFrequency tab_i iIdx, gi_eve_frequenza1
        iPosition tab_i iIdx, gi_eve_posizione
        iRhythm tab_i iIdx, gi_eve_hr
        iBehavior tab_i iIdx, gi_eve_comportamento
        
        fprints "test-results/event_data.csv", "%d,%.3f,%.3f,%.3f,%.3f,%d,%d,%d\n",
                iIdx, iAttack, iDuration, iAmplitude, iFrequency, iPosition, iRhythm, iBehavior
        
        iIdx += 1
    od
    
    prints "test-results/comportamento_test_log.txt", "Event data exported to test-results/event_data.csv\n"
    prints "test-results/comportamento_test_log.txt", "\nTest completed at: %s\n", date(1)
    prints "test-results/comportamento_test_log.txt", "=== END OF TEST ===\n"
    
    prints "\nTest completed. Results saved to test-results/ directory.\n"
endin

</CsInstruments>
<CsScore>
; Initialize the test environment
i "Init" 0 0.1

; Start the test coordinator
i "TestCoordinator" 0.5 0.1

; Ensure enough time for all tests to complete
f 0 200  ; Run for 200 seconds
e
</CsScore>
</CsoundSynthesizer>