<CsoundSynthesizer>
<CsOptions>
-m0d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Define necessary global variables and tables from Delta-Engine
#define M_PI #3.14159265358979323846#
gi_memory_resolution = 1          ; Risoluzione in secondi
gi_memory_duration = 60           ; Durata massima in secondi (reduced for testing)
gi_memory_size = gi_memory_duration / gi_memory_resolution  ; Dimensione tabella

; Create memory tables for testing
gi_memory_harmonic_density ftgen 0, 0, gi_memory_size, -2, 0   ; Densità armonica
gi_memory_octave_spread ftgen 0, 0, gi_memory_size, -2, 0      ; Dispersione ottave

; Debug control
gi_debug = 1

; The opcode to test
opcode analyzeHarmonicMemory, iiii, ii
    iStartTime, iEndTime xin
    
    ; Calcola indici nella tabella di memoria
    iStartIdx = int(iStartTime / gi_memory_resolution)
    iEndIdx = int(iEndTime / gi_memory_resolution)
    
    ; Assicurati che gli indici siano entro i limiti
    iStartIdx = limit(iStartIdx, 0, gi_memory_size-1)
    iEndIdx = limit(iEndIdx, 0, gi_memory_size-1)
    
    ; Inizializza contatori
    iSumHarmonicDensity = 0
    iSumOctaveSpread = 0
    iMaxHarmonicDensity = 0
    iCount = 0
    
    ; Analizza il range temporale
    iIdx = iStartIdx
    while iIdx <= iEndIdx do
        iHarmonicDensity tab_i iIdx, gi_memory_harmonic_density
        iOctaveSpread tab_i iIdx, gi_memory_octave_spread
        
        iSumHarmonicDensity += iHarmonicDensity
        iSumOctaveSpread += iOctaveSpread
        iMaxHarmonicDensity = max(iMaxHarmonicDensity, iHarmonicDensity)
        
        iCount += 1
        iIdx += 1
    od
    
    ; Calcola valori aggregati
    iAvgHarmonicDensity = (iCount > 0) ? iSumHarmonicDensity / iCount : 0
    iAvgOctaveSpread = (iCount > 0) ? iSumOctaveSpread / iCount : 0
    
    xout iAvgHarmonicDensity, iMaxHarmonicDensity, iAvgOctaveSpread, iCount
endop

; Instrument to populate test data
instr PopulateTestData
    prints "\n=== Populating Test Data ===\n"
    
    ; CASE 1: Empty region (0-9 seconds)
    ; Leave this region with zeros to test empty data handling
    prints "Case 1: Creating empty region (0-9 seconds)\n"
    
    ; CASE 2: Constant values region (10-19 seconds)
    prints "Case 2: Creating constant values region (10-19 seconds)\n"
    iIdx = 10
    while iIdx < 20 do
        tabw_i 0.5, iIdx, gi_memory_harmonic_density  ; Constant harmonic density 0.5
        tabw_i 0.3, iIdx, gi_memory_octave_spread     ; Constant octave spread 0.3
        iIdx += 1
    od
    
    ; CASE 3: Linearly increasing region (20-29 seconds)
    prints "Case 3: Creating linearly increasing region (20-29 seconds)\n"
    iIdx = 20
    while iIdx < 30 do
        iNorm = (iIdx - 20) / 10  ; Normalized 0.0-0.9
        tabw_i iNorm, iIdx, gi_memory_harmonic_density
        tabw_i 1 - iNorm, iIdx, gi_memory_octave_spread  ; Inverse relationship
        iIdx += 1
    od
    
    ; CASE 4: Oscillating pattern (30-39 seconds)
    prints "Case 4: Creating oscillating pattern region (30-39 seconds)\n"
    iIdx = 30
    while iIdx < 40 do
        iPhase = (iIdx - 30) / 10 * 2 * $M_PI  ; 0 to 2π
        iSinVal = 0.5 + 0.5 * sin(iPhase)      ; 0.0-1.0 sinusoid
        tabw_i iSinVal, iIdx, gi_memory_harmonic_density
        tabw_i cos(iPhase) * 0.5 + 0.5, iIdx, gi_memory_octave_spread
        iIdx += 1
    od
    
    ; CASE 5: Sparse peaks region (40-49 seconds)
    prints "Case 5: Creating sparse peaks region (40-49 seconds)\n"
    iIdx = 40
    while iIdx < 50 do
        ; Mostly zeros with occasional peaks
        if (iIdx == 42) || (iIdx == 46) then
            tabw_i 0.9, iIdx, gi_memory_harmonic_density  ; High peak
            tabw_i 0.8, iIdx, gi_memory_octave_spread
        elseif (iIdx == 44) || (iIdx == 48) then
            tabw_i 0.7, iIdx, gi_memory_harmonic_density  ; Medium peak
            tabw_i 0.6, iIdx, gi_memory_octave_spread
        else
            tabw_i 0.1, iIdx, gi_memory_harmonic_density  ; Low values
            tabw_i 0.2, iIdx, gi_memory_octave_spread
        endif
        iIdx += 1
    od
    
    ; CASE 6: Edge case (last few seconds)
    prints "Case 6: Creating edge case data (last few seconds)\n"
    iIdx = gi_memory_size - 5
    while iIdx < gi_memory_size do
        tabw_i 0.75, iIdx, gi_memory_harmonic_density
        tabw_i 0.25, iIdx, gi_memory_octave_spread
        iIdx += 1
    od
    
    prints "Test data population complete.\n"
    
    ; Print summary of populated data
    prints "\nTest Data Summary:\n"
    prints "Total memory size: %d\n", gi_memory_size
    prints "Region 0-9: Empty (all zeros)\n"
    prints "Region 10-19: Constant (density=0.5, spread=0.3)\n"
    prints "Region 20-29: Linear increase (density=0.0-0.9, spread=1.0-0.1)\n"
    prints "Region 30-39: Sinusoidal pattern\n"
    prints "Region 40-49: Sparse peaks with low baseline\n"
    prints "Last 5 seconds: Edge case (density=0.75, spread=0.25)\n\n"
    
    turnoff
endin

; Instrument to test the opcode
instr TestHarmonicMemory
    prints "\n=== Testing analyzeHarmonicMemory opcode ===\n"
    
    ; Regular test cases
    
    ; CASE 1: Empty region test
    prints "\nTEST CASE 1: Empty region (0-9 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(0, 9)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 2: Constant values region
    prints "\nTEST CASE 2: Constant values region (10-19 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(10, 19)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
           
    ; Verify expected values (should be close to the constants we set)
    if abs(iAvgDensity - 0.5) < 0.01 && abs(iAvgSpread - 0.3) < 0.01 then
        prints "✓ Constant values test PASSED\n"
    else
        prints "✗ Constant values test FAILED - Expected ~0.5/0.3, got %.4f/%.4f\n", 
               iAvgDensity, iAvgSpread
    endif
    
    ; CASE 3: Linearly increasing region
    prints "\nTEST CASE 3: Linearly increasing region (20-29 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(20, 29)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 4: Oscillating pattern
    prints "\nTEST CASE 4: Oscillating pattern region (30-39 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(30, 39)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 5: Sparse peaks region
    prints "\nTEST CASE 5: Sparse peaks region (40-49 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(40, 49)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; Edge and stress cases
    
    ; CASE 6: Zero-length range
    prints "\nTEST CASE 6: Zero-length range (15-15 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(15, 15)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 7: Negative time range
    prints "\nTEST CASE 7: Negative time range (20-10 seconds)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(20, 10)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 8: Out of bounds (negative start)
    prints "\nTEST CASE 8: Out of bounds (negative start time)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(-10, 5)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 9: Out of bounds (beyond memory end)
    prints "\nTEST CASE 9: Out of bounds (beyond memory end)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(55, 70)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 10: Entire memory span
    prints "\nTEST CASE a10: Entire memory span (0 to max)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(0, gi_memory_duration)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    ; CASE 11: Extremely short span
    prints "\nTEST CASE 11: Extremely short span (with peak value)\n"
    iAvgDensity, iMaxDensity, iAvgSpread, iCount = analyzeHarmonicMemory(46, 46.5)
    prints "Results: AvgDensity=%.4f, MaxDensity=%.4f, AvgSpread=%.4f, Count=%d\n", 
           iAvgDensity, iMaxDensity, iAvgSpread, iCount
    
    prints "\n=== Test completed ===\n"
    turnoff
endin

</CsInstruments>
<CsScore>
; Populate test data first
i "PopulateTestData" 0 0.1

; Then run tests after a short delay
i "TestHarmonicMemory" 0.2 0.1
</CsScore>
</CsoundSynthesizer>