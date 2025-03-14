<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, debug mode
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


; Variabile per il debug
gi_debug init 1

#include "../MACROS/first.orc"
#include "../udos/determineState.udo"
; Strumento di test
instr TestStateClassification
    ; Caso di test da eseguire (p4)
    iTestCase = p4
    
    ; Casi di test predefiniti
    if iTestCase == 1 then
        iDensity = 2        ; Sparse (0)
        iRegister = 0.2     ; Low (0)
        iMovement = 0.1     ; Static (0)
    elseif iTestCase == 2 then
        iDensity = 4        ; Medium (1)
        iRegister = 0.5     ; Mid (1)
        iMovement = 0.3     ; Moderate (1)
    elseif iTestCase == 3 then
        iDensity = 10       ; Dense (2)
        iRegister = 0.9     ; High (2)
        iMovement = 0.7     ; Dynamic (2)
    elseif iTestCase == 4 then
        iDensity = 3        ; Edge case - esattamente sulla soglia Medium (1)
        iRegister = 0.3     ; Edge case - esattamente sulla soglia Mid (1)
        iMovement = 0.2     ; Edge case - esattamente sulla soglia Moderate (1)
    elseif iTestCase == 5 then
        iDensity = 0        ; Edge case - valore minimo (0)
        iRegister = 0       ; Edge case - valore minimo (0)
        iMovement = 0       ; Edge case - valore minimo (0)
    elseif iTestCase == 6 then
        iDensity = 999      ; Edge case - valore massimo (2)
        iRegister = 1       ; Edge case - valore massimo (2)
        iMovement = 1       ; Edge case - valore massimo (2)
    else
        iDensity = 5        ; Valore personalizzato
        iRegister = 0.4     ; Valore personalizzato
        iMovement = 0.3     ; Valore personalizzato
    endif
    
    
    ; Chiama l'opcode da testare
    iDensityState, iRegisterState, iMovementState determineCurrentState iDensity, iRegister, iMovement
    
    ; Verifica risultati attesi
    if iTestCase == 1 then
        iExpectedDensity = 0
        iExpectedRegister = 0
        iExpectedMovement = 0
    elseif iTestCase == 2 then
        iExpectedDensity = 1
        iExpectedRegister = 1
        iExpectedMovement = 1
    elseif iTestCase == 3 then
        iExpectedDensity = 2
        iExpectedRegister = 2
        iExpectedMovement = 2
    elseif iTestCase == 4 then
        iExpectedDensity = 1
        iExpectedRegister = 1
        iExpectedMovement = 1
    elseif iTestCase == 5 then
        iExpectedDensity = 0
        iExpectedRegister = 0
        iExpectedMovement = 0
    elseif iTestCase == 6 then
        iExpectedDensity = 2
        iExpectedRegister = 2
        iExpectedMovement = 2
    else
        iExpectedDensity = 1
        iExpectedRegister = 1
        iExpectedMovement = 1
    endif
    
    
    ; Verifica se i risultati corrispondono alle aspettative
    if iDensityState == iExpectedDensity && 
       iRegisterState == iExpectedRegister && 
       iMovementState == iExpectedMovement then
        prints "TEST PASSED!\n"
    else
        ; Stampa risultati attesi
        prints "Expected: Density=%d, Register=%d, Movement=%d\n", 
            iExpectedDensity, iExpectedRegister, iExpectedMovement
        ; Stampa input
        prints "\n== TEST CASE %d ==\n", iTestCase
        prints "Input: Density=%.2f, Register=%.2f, Movement=%.2f\n", iDensity, iRegister, iMovement
        prints "TEST FAILED!\n"
        prints "Input: Density=%.2f, Register=%.2f, Movement=%.2f\n", 
               iDensity, iRegister, iMovement
        prints "Got: Density=%d, Register=%d, Movement=%d\n", 
               iDensityState, iRegisterState, iMovementState
        prints "Expected: Density=%d, Register=%d, Movement=%d\n", 
               iExpectedDensity, iExpectedRegister, iExpectedMovement
        
        ; Mostra dettagli delle soglie per il debug
        prints "\nThreshold values:\n"
        prints "Density thresholds: "
        iIdx = 0
        while iIdx < ftlen(gi_density_thresholds) do
            iVal tab_i iIdx, gi_density_thresholds
            prints "%.2f ", iVal
            iIdx += 1
        od
        prints "\n"
        
        prints "Register thresholds: "
        iIdx = 0
        while iIdx < ftlen(gi_register_thresholds) do
            iVal tab_i iIdx, gi_register_thresholds
            prints "%.2f ", iVal
            iIdx += 1
        od
        prints "\n"
        
        prints "Movement thresholds: "
        iIdx = 0
        while iIdx < ftlen(gi_movement_thresholds) do
            iVal tab_i iIdx, gi_movement_thresholds
            prints "%.2f ", iVal
            iIdx += 1
        od
        prints "\n"
        
        exitnow  ; Termina immediatamente l'esecuzione di Csound
    endif
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Esegue tutti i casi di test in sequenza
i "TestStateClassification" 0 0.1 1
i "TestStateClassification" + 0.1 2
i "TestStateClassification" + 0.1 3
i "TestStateClassification" + 0.1 4
i "TestStateClassification" + 0.1 5
i "TestStateClassification" + 0.1 6
; Test con un valore personalizzato
i "TestStateClassification" + 0.1 7
e
</CsScore>
</CsoundSynthesizer>