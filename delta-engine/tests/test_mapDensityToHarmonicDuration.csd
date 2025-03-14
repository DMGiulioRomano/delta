<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio, display messages
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

#include "../udos/parameterInterpolation.udo"

; Test semplice
instr SimpleDensityTest
    prints "\n== TEST SEMPLICE mapDensityToHarmonicDuration ==\n"
    prints "Formato: Densità -> Durata Armonica (secondi)\n\n"

    ; Test valori discreti
    prints "--- Valori Discreti ---\n"
    prints "Sparse (0.0): %.2f sec\n", mapDensityToHarmonicDuration(0)
    prints "Medium (1.0): %.2f sec\n", mapDensityToHarmonicDuration(1)
    prints "Dense (2.0): %.2f sec\n\n", mapDensityToHarmonicDuration(2)
    
    ; Test valori intermedi
    prints "--- Valori Intermedi ---\n"
    prints "0.0 -> %.2f sec\n", mapDensityToHarmonicDuration(0.0)
    prints "0.5 -> %.2f sec\n", mapDensityToHarmonicDuration(0.5)
    prints "1.0 -> %.2f sec\n", mapDensityToHarmonicDuration(1.0)
    prints "1.5 -> %.2f sec\n", mapDensityToHarmonicDuration(1.5)
    prints "2.0 -> %.2f sec\n\n", mapDensityToHarmonicDuration(2.0)
    
    ; Test multipli per valutare variazione
    prints "--- Variazione per densità 0.0 (10 prove) ---\n"
    iIdx = 0
    while iIdx < 10 do
        prints "Prova %d: %.2f sec\n", iIdx+1, mapDensityToHarmonicDuration(0.0)
        iIdx += 1
    od
    
    prints "\n--- Variazione per densità 1.0 (10 prove) ---\n"
    iIdx = 0
    while iIdx < 10 do
        prints "Prova %d: %.2f sec\n", iIdx+1, mapDensityToHarmonicDuration(1.0)
        iIdx += 1
    od
    
    prints "\n--- Variazione per densità 2.0 (10 prove) ---\n"
    iIdx = 0
    while iIdx < 10 do
        prints "Prova %d: %.2f sec\n", iIdx+1, mapDensityToHarmonicDuration(2.0)
        iIdx += 1
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "SimpleDensityTest" 0 0.1
e
</CsScore>
</CsoundSynthesizer>