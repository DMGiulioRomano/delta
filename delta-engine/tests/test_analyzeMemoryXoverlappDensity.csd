<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, debug mode
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Initialize necessary global variables and tables
gi_memory_resolution init 1          ; 1 second resolution
gi_memory_duration init 60           ; 60 seconds test duration 
gi_memory_size = gi_memory_duration / gi_memory_resolution  ; 60 points

; Create all the necessary memory tables for testing
gi_memory_overlap ftgen 0, 0, gi_memory_size+1, -2, 0  ; Initialize with zeros
gi_memory_events ftgen 0, 0, gi_memory_size+1, -2, 0   ; Number of events

; Additional tables needed from first.orc
gi_memory_harmonic_density ftgen 0, 0, gi_memory_size+1, -2, 0   ; Harmonic density
gi_memory_octave_spread ftgen 0, 0, gi_memory_size+1, -2, 0      ; Octave spread
gi_memory_spectral_centroid ftgen 0, 0, gi_memory_size+1, -2, 0  ; Spectral centroid
gi_memory_spatial_movement ftgen 0, 0, gi_memory_size+1, -2, 0   ; Spatial movement

; Analyzer buffer sizes
gi_analysis_buffer_size = 100
gi_analysis_active_events ftgen 0, 0, gi_analysis_buffer_size, -2, 0
gi_analysis_timepoints ftgen 0, 0, gi_analysis_buffer_size, -2, 0

; Global k-rate variables needed (if any)
gk_current_overlap init 1
gk_current_harmonic_density init 0
gk_current_octave_spread init 0
gk_current_spectral_centroid init 0
gk_current_spatial_movement init 0

#include "../udos/calcDurationFactor.udo"

; Test instrument
instr PopulateTestData
    ; Fill the memory table with test data pattern
    ; We'll create a pattern with varying event density:
    ; - First 10 seconds: low density (1-2 events)
    ; - Middle 20 seconds: medium density (3-5 events)
    ; - Last 30 seconds: high density (6-8 events) with a spike
    
    ; Low density region (0-10s)
    iIdx = 0
    while iIdx < 10 do
        iValue = 1 + (iIdx % 2)  ; Alternates between 1 and 2
        tabw_i iValue, iIdx, gi_memory_overlap
        iIdx += 1
    od
    
    ; Medium density region (10-30s)
    iIdx = 10
    while iIdx < 30 do
        iValue = 3 + (iIdx % 3)  ; Cycles between 3, 4, and 5
        tabw_i iValue, iIdx, gi_memory_overlap
        iIdx += 1
    od
    
    ; High density region (30-60s)
    iIdx = 30
    while iIdx < 60 do
        iValue = 6 + (iIdx % 3)  ; Cycles between 6, 7, and 8
        if iIdx == 45 then
            iValue = 12  ; Create a spike at 45s
        endif
        tabw_i iValue, iIdx, gi_memory_overlap
        iIdx += 1
    od
    
    ; Verify the data
    prints "\nVerifying test data in gi_memory_overlap:\n"
    prints "Time Range | Values\n"
    prints "---------------------\n"
    
    ; Print samples of the data
    prints "0-10s:  "
    iIdx = 0
    while iIdx < 10 do
        iVal tab_i iIdx, gi_memory_overlap
        prints "%d ", iVal
        iIdx += 1
    od
    prints "\n"
    
    prints "10-30s: "
    iIdx = 10
    while iIdx < 30 do
        if iIdx % 5 == 0 then
            iVal tab_i iIdx, gi_memory_overlap
            prints "%d ", iVal
        endif
        iIdx += 1
    od
    prints "...\n"
    
    prints "30-60s: "
    iIdx = 30
    while iIdx < 60 do
        if (iIdx % 5 == 0) || (iIdx == 45) then  ; Include the spike
            iVal tab_i iIdx, gi_memory_overlap
            prints "%d ", iVal
        endif
        iIdx += 1
    od
    prints "...\n\n"
    
    ; Calculate expected values for test verification
    ; This helps verify that our test expectations match the actual data
    
    prints "Expected values for test cases:\n"
    prints "------------------------------\n"
    
    ; Case 1: 0-10s
    iStartIdx = 0
    iEndIdx = 10
    iSum = 0
    iMax = 0
    iActive = 0
    iCount = 0
    
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iVal tab_i iIdx, gi_memory_overlap
        if iVal > 0 then
            iSum += iVal
            iMax = max(iMax, iVal)
            iActive += 1
        endif
        iCount += 1
        iIdx += 1
    od
    
    iAvg = (iActive > 0) ? iSum / iActive : 0
    iDens = (iCount > 0) ? iActive / iCount : 0
    
    prints "Case 1 (0-10s): Avg=%.4f, Max=%d, Density=%.4f, Count=%d\n", 
           iAvg, iMax, iDens, iCount

    ; Repeat for other test cases
    ; Case 2: 10-30s
    iStartIdx = 10
    iEndIdx = 30
    iSum = 0
    iMax = 0
    iActive = 0
    iCount = 0
    
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iVal tab_i iIdx, gi_memory_overlap
        if iVal > 0 then
            iSum += iVal
            iMax = max(iMax, iVal)
            iActive += 1
        endif
        iCount += 1
        iIdx += 1
    od
    
    iAvg = (iActive > 0) ? iSum / iActive : 0
    iDens = (iCount > 0) ? iActive / iCount : 0
    
    prints "Case 2 (10-30s): Avg=%.4f, Max=%d, Density=%.4f, Count=%d\n", 
           iAvg, iMax, iDens, iCount
    
    ; Case 3: 30-60s
    iStartIdx = 30
    iEndIdx = 60
    iSum = 0
    iMax = 0
    iActive = 0
    iCount = 0
    
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iVal tab_i iIdx, gi_memory_overlap
        if iVal > 0 then
            iSum += iVal
            iMax = max(iMax, iVal)
            iActive += 1
        endif
        iCount += 1
        iIdx += 1
    od
    
    iAvg = (iActive > 0) ? iSum / iActive : 0
    iDens = (iCount > 0) ? iActive / iCount : 0
    
    prints "Case 3 (30-60s): Avg=%.4f, Max=%d, Density=%.4f, Count=%d\n", 
           iAvg, iMax, iDens, iCount
           
    ; Case 4: 5-35s
    iStartIdx = 5
    iEndIdx = 35
    iSum = 0
    iMax = 0
    iActive = 0
    iCount = 0
    
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iVal tab_i iIdx, gi_memory_overlap
        if iVal > 0 then
            iSum += iVal
            iMax = max(iMax, iVal)
            iActive += 1
        endif
        iCount += 1
        iIdx += 1
    od
    
    iAvg = (iActive > 0) ? iSum / iActive : 0
    iDens = (iCount > 0) ? iActive / iCount : 0
    
    prints "Case 4 (5-35s): Avg=%.4f, Max=%d, Density=%.4f, Count=%d\n", 
           iAvg, iMax, iDens, iCount
    
    ; Case 5: Full range (with bounds checking)
    iStartIdx = limit(-10, 0, gi_memory_size-1)
    iEndIdx = limit(100, 0, gi_memory_size-1)
    iSum = 0
    iMax = 0
    iActive = 0
    iCount = 0
    
    iIdx = iStartIdx
    while iIdx < iEndIdx do
        iVal tab_i iIdx, gi_memory_overlap
        if iVal > 0 then
            iSum += iVal
            iMax = max(iMax, iVal)
            iActive += 1
        endif
        iCount += 1
        iIdx += 1
    od
    
    iAvg = (iActive > 0) ? iSum / iActive : 0
    iDens = (iCount > 0) ? iActive / iCount : 0
    
    prints "Case 5 (-10-100s, bounded): Avg=%.4f, Max=%d, Density=%.4f, Count=%d\n", 
           iAvg, iMax, iDens, iCount
    
    turnoff
endin

instr TestAnalyzeMemory
    iTestCase = p4
    
    ; Define test cases with correct expected values
    if iTestCase == 1 then
        iStartTime = 0
        iEndTime = 10
        iExpAvg = 1.5   
        iExpMax = 2
        iExpDensity = 1.0
        iExpCount = 10   
        
    elseif iTestCase == 2 then
        iStartTime = 10
        iEndTime = 30
        iExpAvg = 4.05
        iExpMax = 5
        iExpDensity = 1.0
        iExpCount = 20   
        
    elseif iTestCase == 3 then
        iStartTime = 30
        iEndTime = 60
        iExpAvg = 7.2000   
        iExpMax = 12
        iExpDensity = 1.0
        iExpCount = 30   
        
    elseif iTestCase == 4 then
        ; Test case spanning multiple regions
        iStartTime = 5
        iEndTime = 35
        iExpAvg = 4.1   
        iExpMax = 8
        iExpDensity = 1.0
        iExpCount = 30   
        
    elseif iTestCase == 5 then
        ; Test with out-of-bounds times
        iStartTime = -10
        iEndTime = 100
        iExpAvg = 5.2   
        iExpMax = 12
        iExpDensity = 1.0
        iExpCount = 60   
    endif
    
    ; Call the function to test
    iAvgOverlap, iMaxOverlap, iDensity, iCount = analyzeMemoryXoverlappDensity(iStartTime, iEndTime)
    
    ; Print test results header
    prints "\n=== TEST CASE %d ===\n", iTestCase
    prints "Analyzing time range: %.1f to %.1f\n", iStartTime, iEndTime
    
    ; Print results
    prints "Results:\n"
    prints "  Average Overlap: %.4f (Expected: %.4f)\n", iAvgOverlap, iExpAvg
    prints "  Maximum Overlap: %d (Expected: %d)\n", iMaxOverlap, iExpMax
    prints "  Density: %.4f (Expected: %.4f)\n", iDensity, iExpDensity
    prints "  Sample Count: %d (Expected: %d)\n", iCount, iExpCount
    
    ; Determine if test passed
    iAvgTolerance = 0.01
    iMaxTolerance = 0
    iDensityTolerance = 0.01
    iCountTolerance = 0
    
    iPassAvg = (abs(iAvgOverlap - iExpAvg) <= iAvgTolerance) ? 1 : 0
    iPassMax = (abs(iMaxOverlap - iExpMax) <= iMaxTolerance) ? 1 : 0
    iPassDensity = (abs(iDensity - iExpDensity) <= iDensityTolerance) ? 1 : 0
    iPassCount = (abs(iCount - iExpCount) <= iCountTolerance) ? 1 : 0
    
    iTestPassed = (iPassAvg + iPassMax + iPassDensity + iPassCount == 4) ? 1 : 0
    
    if iTestPassed == 1 then
        prints ">> TEST PASSED\n"
    else
        prints ">> TEST FAILED\n"
        if iPassAvg == 0 then
            prints "   - Average overlap out of tolerance range\n"
        endif
        if iPassMax == 0 then
            prints "   - Maximum overlap out of tolerance range\n"
        endif
        if iPassDensity == 0 then
            prints "   - Density out of tolerance range\n"
        endif
        if iPassCount == 0 then
            prints "   - Sample count out of tolerance range\n"
        endif
    endif
endin
</CsInstruments>
<CsScore>
; First populate the test data
i "PopulateTestData" 0 0.1

; Then run the test cases
i "TestAnalyzeMemory" 1 0.1 1  ; Test low density region
i "TestAnalyzeMemory" 2 0.1 2  ; Test medium density region
i "TestAnalyzeMemory" 3 0.1 3  ; Test high density region
i "TestAnalyzeMemory" 4 0.1 4  ; Test across regions
i "TestAnalyzeMemory" 5 0.1 5  ; Test out-of-bounds

e
</CsScore>
</CsoundSynthesizer>