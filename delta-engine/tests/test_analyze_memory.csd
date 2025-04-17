<CsoundSynthesizer>
<CsOptions>
-odac 
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1


#include "udos/calcDurationFactor.udo"
; Utility function to fill memory tables with test data
instr FillTestData
    ; Fill memory_overlap with some test patterns
    ; Simple linear ramp from 0 to 5
    iIndex = 0
    while iIndex < gi_memory_size do
        ; Pattern: gradual increase followed by decrease
        iValue = (iIndex < gi_memory_size/2) ? iIndex % 6 : 5 - (iIndex % 6)
        tabw_i iValue, iIndex, gi_memory_overlap
        
        ; Fill events with similar pattern but offset
        iEventValue = (iValue + 2) % 7
        tabw_i iEventValue, iIndex, gi_memory_events
        
        iIndex += 1
    od
    
    prints "Test data generated for memory tables\n"
    prints "Memory size: %d entries at %d second resolution\n", gi_memory_size, gi_memory_resolution
    
    ; Schedule the test instrument
    schedule "TestAnalyzeMemory", 1, 0.1
endin

; Test instrument for analyzeCompositionMemory
instr TestAnalyzeMemory
    ; Define test cases - various time ranges
    prints "\n=== TESTING analyzecompositionMemory OPCODE ===\n"
    
    ; Test case 1: Beginning of memory (0-10 seconds)
    iAvg1, iMax1, iDens1, iCount1 analyzeCompositionMemory 0, 10
    prints "Test 1 (0-10s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg1, iMax1, iDens1, iCount1
    
    ; Test case 2: Middle section (20-30 seconds)
    iAvg2, iMax2, iDens2, iCount2 analyzeCompositionMemory 20, 30 
    prints "Test 2 (20-30s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg2, iMax2, iDens2, iCount2
    
    ; Test case 3: End of memory (50-60 seconds)
    iAvg3, iMax3, iDens3, iCount3 analyzeCompositionMemory 50, 60 
    prints "Test 3 (50-60s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg3, iMax3, iDens3, iCount3
    
    ; Test case 4: Larger range (5-45 seconds)
    iAvg4, iMax4, iDens4, iCount4 analyzeCompositionMemory 5, 45 
    prints "Test 4 (5-45s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg4, iMax4, iDens4, iCount4
    
    ; Test case 5: Out of bounds range (should be limited by the opcode)
    iAvg5, iMax5, iDens5, iCount5 analyzeCompositionMemory -10, 80 
    prints "Test 5 (-10-80s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg5, iMax5, iDens5, iCount5
    
    ; Test case 6: Zero-length range
    iAvg6, iMax6, iDens6, iCount6 analyzeCompositionMemory 15, 15 
    prints "Test 6 (15-15s): Avg=%.2f, Max=%d, Density=%.2f, Count=%d\n", 
           iAvg6, iMax6, iDens6, iCount6
    
    prints "=== TEST COMPLETE ===\n"
    
    turnoff
endin

</CsInstruments>
<CsScore>

;i "FillTestData" 0 0.1
i "FillTestData" 0 1.1

</CsScore>
</CsoundSynthesizer>