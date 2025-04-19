<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Costanti e variabili globali necessarie
#define M_PI #3.14159265358979323846#
#define OTTAVE #10#
#define REGISTRI #10#
#define INTERVALLI #200#

; Debug level
gi_debug init 3
gi_NUMEVENTI init 1000

; Include le UDO essenziali
#include "udos/utils.udo"
#include "udos/interpolations.udo"

; Versione semplificata isolata di generateRhythmsForState
opcode testGenerateRhythmsForState, i, i
    iDensityState xin
    
    ; Normalizza stato
    iDensityState = limit(iDensityState, 0, 2)
    
    ; Crea tabella per ritmi
    iTableSize = 5
    iTableNum ftgen 0, 0, iTableSize+1, -2, 0
    
    ; Ottieni range basato su densità
    if (iDensityState == 0) then  ; Sparse
        iMinRhythm = 1
        iMaxRhythm = 5
    elseif (iDensityState == 1) then  ; Medium
        iMinRhythm = 5
        iMaxRhythm = 12
    else  ; Dense (stato 2)
        iMinRhythm = 12
        iMaxRhythm = 35
    endif
    
    prints "Stato densità %d -> Range valori ritmici: Min=%d, Max=%d\n", 
           iDensityState, iMinRhythm, iMaxRhythm
    
    ; Genera valori ritmici
    iIdx = 0
    while iIdx < iTableSize do
        iRhythmVal random iMinRhythm, iMaxRhythm
        iRhythmVal = round(iRhythmVal)  
        iRhythmVal = max(1, iRhythmVal)
        tabw_i iRhythmVal, iIdx, iTableNum
        iIdx += 1
    od
    
    xout iTableNum
endop

; Versione semplificata isolata di generateInterpolatedRhythms
opcode testInterpolateRhythms, i, iiiii
    iSourceMin, iSourceMax, iTargetMin, iTargetMax, iProgress xin
    
    ; Assicurati che i valori min/max siano sensati
    iSourceMin = max(1, iSourceMin)
    iSourceMax = max(iSourceMin + 1, iSourceMax)
    iTargetMin = max(1, iTargetMin)
    iTargetMax = max(iTargetMin + 1, iTargetMax)
    
    ; Interpola min/max con cubicInterpolate
    iInterpolatedMin = cubicInterpolate(iSourceMin, iTargetMin, iProgress)
    iInterpolatedMax = cubicInterpolate(iSourceMax, iTargetMax, iProgress)
    
    ; Applica limiti rigidi
    iInterpolatedMin = limit(iInterpolatedMin, 1, 35)
    iInterpolatedMax = limit(iInterpolatedMax, iInterpolatedMin + 1, 35)
    
    ; Crea tabella ritmi
    iTableSize = 5
    iRhythmTable ftgen 0, 0, iTableSize+1, -2, 0
    
    ; Riempi con valori random tra min e max
    iIdx = 0
    while iIdx < iTableSize do
        iRhythmValue random iInterpolatedMin, iInterpolatedMax
        iRhythmValue = round(iRhythmValue)
        tabw_i iRhythmValue, iIdx, iRhythmTable
        iIdx += 1
    od
    
    xout iRhythmTable
endop

instr SeparateTest
    prints "\n=== TEST SEPARATO DELLE FUNZIONI DI GENERAZIONE RITMI ===\n\n"
    
    prints "PARTE 1: TEST DI generateRhythmsForState\n"
    prints "----------------------------------------\n"
    
    ; Test per ogni stato di densità
    iState = 0
    while iState <= 2 do
        iTable testGenerateRhythmsForState iState
        
        prints "Ritmi generati per stato %d: ", iState
        iIdx = 0
        while iIdx < 5 do
            iVal tab_i iIdx, iTable
            prints "%d ", iVal
            iIdx += 1
        od
        prints "\n"
        
        iState += 1
    od
    
    prints "\nPARTE 2: TEST DI INTERPOLAZIONE TRA RANGE\n"
    prints "----------------------------------------\n"
    
    ; Definisci i range per ogni stato
    iDensity0_Min = 1
    iDensity0_Max = 5
    iDensity1_Min = 5
    iDensity1_Max = 12
    iDensity2_Min = 12
    iDensity2_Max = 35
    
    prints "Range definiti:\n"
    prints "Stato 0: %d-%d\n", iDensity0_Min, iDensity0_Max
    prints "Stato 1: %d-%d\n", iDensity1_Min, iDensity1_Max
    prints "Stato 2: %d-%d\n", iDensity2_Min, iDensity2_Max
    prints "\n"
    
    ; Test interpolazione tra stati 0→2
    prints "CASO TEST: Stato 0 → Stato 2\n"
    prints "Progress | Range interpolato | Valori ritmici generati\n"
    prints "---------------------------------------------------------\n"
    
    iProgress = 0
    while iProgress <= 1 do
        iTable testInterpolateRhythms iDensity0_Min, iDensity0_Max, 
                                     iDensity2_Min, iDensity2_Max, iProgress
        
        ; Calcola range interpolato
        iIntMin = cubicInterpolate(iDensity0_Min, iDensity2_Min, iProgress)
        iIntMax = cubicInterpolate(iDensity0_Max, iDensity2_Max, iProgress)
        iIntMin = limit(iIntMin, 1, 35)
        iIntMax = limit(iIntMax, iIntMin + 1, 35)
        
        prints "  %.2f   | %2.0f-%-2.0f          | ", iProgress, iIntMin, iIntMax
        
        iIdx = 0
        while iIdx < 5 do
            iVal tab_i iIdx, iTable
            prints "%d ", iVal
            iIdx += 1
        od
        prints "\n"
        
        iProgress = iProgress + 0.25
    od
    
    prints "\nCASO TEST: Stato 2 → Stato 1\n"
    prints "Progress | Range interpolato | Valori ritmici generati\n"
    prints "---------------------------------------------------------\n"
    
    iProgress = 0
    while iProgress <= 1 do
        iTable testInterpolateRhythms iDensity2_Min, iDensity2_Max, 
                                     iDensity1_Min, iDensity1_Max, iProgress
        
        ; Calcola range interpolato
        iIntMin = cubicInterpolate(iDensity2_Min, iDensity1_Min, iProgress)
        iIntMax = cubicInterpolate(iDensity2_Max, iDensity1_Max, iProgress)
        iIntMin = limit(iIntMin, 1, 35)
        iIntMax = limit(iIntMax, iIntMin + 1, 35)
        
        prints "  %.2f   | %2.0f-%-2.0f          | ", iProgress, iIntMin, iIntMax
        
        iIdx = 0
        while iIdx < 5 do
            iVal tab_i iIdx, iTable
            prints "%d ", iVal
            iIdx += 1
        od
        prints "\n"
        
        iProgress = iProgress + 0.25
    od
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "SeparateTest" 0 0.1
e
</CsScore>
</CsoundSynthesizer>