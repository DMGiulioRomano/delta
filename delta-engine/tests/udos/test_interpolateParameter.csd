<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Definizione dell'UDO interpolateParameter isolato per il test
opcode interpolateParameter, i, iiii
    iSourceValue, iTargetValue, iProgress, iCurve xin
    
    ; Apply transition curve if specified (default is linear)
    iMappedProgress = iProgress
    if (iCurve != 0) then
        ; Positive curve = slow start, fast end (ease-in)
        ; Negative curve = fast start, slow end (ease-out)
        if (iCurve > 0) then
            iMappedProgress = pow(iProgress, 1 + iCurve)
        else
            iMappedProgress = 1 - pow(1 - iProgress, 1 - iCurve)
        endif
    endif
    
    ; Perform the interpolation
    iResult = iSourceValue + (iTargetValue - iSourceValue) * iMappedProgress
    
    xout iResult
endop

; Strumento per testare l'interpolazione lineare
instr TestLinear
    prints "\n=== TEST INTERPOLAZIONE LINEARE (iCurve = 0) ===\n"
    prints "Progress\tResult\n"
    
    iSource = p4
    iTarget = p5
    
    iStep = 0.1
    iProgress = 0
    while iProgress <= 1.001 do  ; 1.001 per includere l'1.0
        iResult interpolateParameter iSource, iTarget, iProgress, 0
        prints "%.1f\t\t%.4f\n", iProgress, iResult
        iProgress = iProgress + iStep
    od
endin

; Strumento per testare l'interpolazione con curva ease-in (positiva)
instr TestEaseIn
    prints "\n=== TEST INTERPOLAZIONE EASE-IN (iCurve = %.1f) ===\n", p6
    prints "Progress\tResult\n"
    
    iSource = p4
    iTarget = p5
    iCurve = p6
    
    iStep = 0.1
    iProgress = 0
    while iProgress <= 1.001 do
        iResult interpolateParameter iSource, iTarget, iProgress, iCurve
        prints "%.1f\t\t%.4f\n", iProgress, iResult
        iProgress = iProgress + iStep
    od
endin

; Strumento per testare l'interpolazione con curva ease-out (negativa)
instr TestEaseOut
    prints "\n=== TEST INTERPOLAZIONE EASE-OUT (iCurve = %.1f) ===\n", p6
    prints "Progress\tResult\n"
    
    iSource = p4
    iTarget = p5
    iCurve = p6
    
    iStep = 0.1
    iProgress = 0
    while iProgress <= 1.001 do
        iResult interpolateParameter iSource, iTarget, iProgress, iCurve
        prints "%.1f\t\t%.4f\n", iProgress, iResult
        iProgress = iProgress + iStep
    od
endin

; Strumento per testare situazioni di edge case
instr TestEdgeCases
    prints "\n=== TEST EDGE CASES ===\n"
    
    ; Test 1: Valori source e target uguali
    iResult1 interpolateParameter 5, 5, 0.5, 0
    prints "Valori uguali (5, 5, 0.5, 0): %.4f (atteso: 5.0000)\n", iResult1
    
    ; Test 2: Interpolazione a progress 0
    iResult2 interpolateParameter 0, 10, 0, 1
    prints "Progress zero (0, 10, 0, 1): %.4f (atteso: 0.0000)\n", iResult2
    
    ; Test 3: Interpolazione a progress 1
    iResult3 interpolateParameter 0, 10, 1, -1
    prints "Progress uno (0, 10, 1, -1): %.4f (atteso: 10.0000)\n", iResult3
    
    ; Test 4: Curva estrema positiva
    iResult4 interpolateParameter 0, 100, 0.5, 3
    prints "Curva estrema positiva (0, 100, 0.5, 3): %.4f\n", iResult4
    
    ; Test 5: Curva estrema negativa
    iResult5 interpolateParameter 0, 100, 0.5, -3
    prints "Curva estrema negativa (0, 100, 0.5, -3): %.4f\n", iResult5
    
    ; Test 6: Interpolazione con valori negativi
    iResult6 interpolateParameter -10, 10, 0.5, 0
    prints "Valori negativi (-10, 10, 0.5, 0): %.4f (atteso: 0.0000)\n", iResult6
    
    ; Test 7: Source > Target (direzione negativa)
    iResult7 interpolateParameter 100, 0, 0.5, 0
    prints "Direzione negativa (100, 0, 0.5, 0): %.4f (atteso: 50.0000)\n", iResult7
endin

; Strumento per confrontare diverse curve nella stessa chiamata
instr TestCompareCurves
    prints "\n=== CONFRONTO CURVE DI INTERPOLAZIONE AL 50%% DI PROGRESSO ===\n"
    prints "Curve\t\tResult\n"
    
    iSource = p4
    iTarget = p5
    iProgress = 0.5
    
    iCurve = -2
    while iCurve <= 2.001 do
        iResult interpolateParameter iSource, iTarget, iProgress, iCurve
        prints "%.1f\t\t%.4f\n", iCurve, iResult
        iCurve = iCurve + 0.5
    od
endin

; Strumento per generare dati CSV per visualizzazione
instr GenerateCSVData
    prints "\n=== GENERAZIONE DATI CSV PER CURVE DI INTERPOLAZIONE ===\n"
    
    iSource = p4
    iTarget = p5
    
    ; Crea la directory se non esiste
    ires system_i 1, "mkdir -p ./data", 0
    
    SfileName = "./data/interpolation_curves.csv"
    fprints SfileName, "progress,linear,ease_in_1,ease_in_2,ease_out_1,ease_out_2\n"
    
    iStep = 0.01
    iProgress = 0
    while iProgress <= 1.001 do
        iLinear interpolateParameter iSource, iTarget, iProgress, 0
        iEaseIn1 interpolateParameter iSource, iTarget, iProgress, 1
        iEaseIn2 interpolateParameter iSource, iTarget, iProgress, 2
        iEaseOut1 interpolateParameter iSource, iTarget, iProgress, -1
        iEaseOut2 interpolateParameter iSource, iTarget, iProgress, -2
        
        fprints SfileName, "%.2f,%.4f,%.4f,%.4f,%.4f,%.4f\n", 
               iProgress, iLinear, iEaseIn1, iEaseIn2, iEaseOut1, iEaseOut2
        
        iProgress = iProgress + iStep
    od
    
    prints "Dati CSV generati in %s\n", SfileName
    prints "Puoi visualizzare questi dati con uno script Python o Excel.\n"
endin

</CsInstruments>
<CsScore>
; Test di base con valori 0 -> 10
i "TestLinear" 0 0.1 0 10
i "TestEaseIn" 0.1 0.1 0 10 1.0
i "TestEaseOut" 0.2 0.1 0 10 -1.0

; Test con valori di densità tipici 0 -> 2
i "TestLinear" 0.3 0.1 0 2
i "TestEaseIn" 0.4 0.1 0 2 0.5
i "TestEaseOut" 0.5 0.1 0 2 -0.5

; Test casi limite
i "TestEdgeCases" 0.6 0.1

; Confronto curve
i "TestCompareCurves" 0.7 0.1 0 100

; Generazione dati CSV per visualizzazione
i "GenerateCSVData" 0.8 0.1 0 10
</CsScore>
</CsoundSynthesizer>