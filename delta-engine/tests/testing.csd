<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
kr = 96000
nchnls = 2
0dbfs = 1

; Test delle conversioni dB/linear

#include "../udos/utils.udo"

; Strumento per i test falliti
instr test_failed
    prints "\\n*** Test fallito! ***\\n"
    turnoff
endin


; Test delle conversioni dB/linear
instr test_conversions
    prints "\nTesting conversioni dB/linear...\n"
    
    ; Test round-trip conversion
    idb = -6
    ilin = db2linear(idb)
    idb_back = linear2db(ilin)
    
    if (abs(idb - idb_back) < 0.001) then
        prints "Test passed: La conversione dB->linear->dB è accurata\n\n"
    else
        prints "Test FAILED: La conversione dB->linear->dB NON è accurata\n\n"
        event "i", "test_failed", 0, 1
    endif
    
    turnoff
endin

; Test delle funzioni di arrotondamento
instr test_rounding
    prints "\nTesting funzioni di arrotondamento...\n"
    
    ivalue = 1.23456
    irounded = round3(ivalue)
    
    if (abs(irounded - 1.235) < 0.0001) then
        prints "Test passed: L'arrotondamento a 3 decimali è corretto\n\n"
    else
        prints "Test FAILED: L'arrotondamento a 3 decimali non è corretto\n\n"
        event "i", "test_failed", 0, 1
    endif
    
    turnoff
endin

</CsInstruments>
<CsScore>
; ==== Score per l'esecuzione dei test ====

; Tabelle necessarie per i test
f 1 0 16777216 10 1       ; Sine wave

; ==== Test Suite 1: Test base delle UDO ====
; Test delle funzioni di utilità
i "test_conversions" 0 1
i "test_rounding" 1 1

; Fine della sessione di test
e

</CsScore>
</CsoundSynthesizer>