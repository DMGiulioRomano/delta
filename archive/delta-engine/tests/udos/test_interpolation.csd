<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Definizione delle funzioni di interpolazione
#define M_PI #3.14159265358979323846#

; Linear interpolation between two values (i-rate only)
opcode linearInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Linear interpolation formula
    iResult = iStartValue + (iEndValue - iStartValue) * iProgress
    
    xout iResult
endop

; Cubic interpolation for smoother transitions (i-rate only)
opcode cubicInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Cubic interpolation formula (smoothstep)
    iSmoothed = iProgress * iProgress * (3 - 2 * iProgress)
    iResult = iStartValue + (iEndValue - iStartValue) * iSmoothed
    
    xout iResult
endop

; Exponential interpolation for parameters that need non-linear changes (i-rate only)
opcode exponentialInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Exponential interpolation formula
    iExponential = (1 - cos(iProgress * $M_PI)) / 2
    iResult = iStartValue + (iEndValue - iStartValue) * iExponential
    
    xout iResult
endop

; Strumento per il test delle interpolazioni
instr TestInterpolation
    ; Titolo del test
    prints "\n===== TEST DELLE FUNZIONI DI INTERPOLAZIONE =====\n"
    
    ; Casi di test - diversi valori iniziali e finali
    iTestCases[][] init 5, 2
    iTestCases[0][0] = 1
    iTestCases[0][1] = 10
    iTestCases[1][0] = 5
    iTestCases[1][1] = 30
    iTestCases[2][0] = 20
    iTestCases[2][1] = 1
    iTestCases[3][0] = 100
    iTestCases[3][1] = 200
    iTestCases[4][0] = 1
    iTestCases[4][1] = 100
    
    ; Intestazione tabella
    prints "START -> END   | PROGRESS | LINEAR | CUBIC | EXPONENTIAL\n"
    prints "---------------------------------------------------\n"
    
    ; Esegui test per ogni coppia di valori
    iCaseIdx = 0
    while iCaseIdx < 5 do
        iStart = iTestCases[iCaseIdx][0]
        iEnd = iTestCases[iCaseIdx][1]
        
        ; Intestazione di ogni caso
        prints "%3.0f -> %3.0f   | ", iStart, iEnd
        
        ; Test a diversi livelli di progressione
        iProgress = 0
        while iProgress <= 1.0 do
            ; Calcola i valori interpolati con tutti e tre i metodi
            iLinear = linearInterpolate(iStart, iEnd, iProgress)
            iCubic = cubicInterpolate(iStart, iEnd, iProgress)
            iExponential = exponentialInterpolate(iStart, iEnd, iProgress)
            
            ; Stampa risultati
            prints "\n            | %5.2f    | %6.2f | %6.2f | %6.2f", 
                   iProgress, iLinear, iCubic, iExponential
            
            iProgress = iProgress + 0.25
        od
        
        prints "\n---------------------------------------------------\n"
        iCaseIdx += 1
    od
    
    ; Test specifico per confrontare in dettaglio cubicInterpolate e exponentialInterpolate
    prints "\n===== CONFRONTO DETTAGLIATO =====\n"
    prints "Caso: 1 -> 100, Visualizzazione per step di 0.1\n"
    prints "PROGRESS | CUBIC | EXPONENTIAL | DIFFERENZA\n"
    prints "---------------------------------------\n"
    
    iStart = 1
    iEnd = 100
    iProgress = 0
    while iProgress <= 1.0 do
        iCubic = cubicInterpolate(iStart, iEnd, iProgress)
        iExponential = exponentialInterpolate(iStart, iEnd, iProgress)
        iDiff = iExponential - iCubic
        
        prints " %5.2f   | %6.2f | %6.2f    | %+6.2f\n", 
               iProgress, iCubic, iExponential, iDiff
        
        iProgress = iProgress + 0.1
    od
    
    ; Visualizzazione in formato di ritmi musicali (numeri interi)
    prints "\n===== SIMULAZIONE VALORI RITMICI =====\n"
    prints "Caso: 5 -> 30 (Min-Max Ritmi), arrotondati a interi\n"
    prints "PROGRESS | LINEAR | CUBIC | EXPONENTIAL\n"
    prints "---------------------------------------\n"
    
    iStart = 5
    iEnd = 30
    iProgress = 0
    while iProgress <= 1.0 do
        iLinear = round(linearInterpolate(iStart, iEnd, iProgress))
        iCubic = round(cubicInterpolate(iStart, iEnd, iProgress))
        iExponential = round(exponentialInterpolate(iStart, iEnd, iProgress))
        
        prints " %5.2f   | %6.0f | %6.0f | %6.0f\n", 
               iProgress, iLinear, iCubic, iExponential
        
        iProgress = iProgress + 0.1
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestInterpolation" 0 0.1
e
</CsScore>
</CsoundSynthesizer>