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

; Debug level
gi_debug init 3
gi_NUMEVENTI init 1000

; Include solo le UDO necessarie
#include "udos/utils.udo"
#include "udos/interpolations.udo"
#include "udos/stateMapping.udo"
#include "udos/generateInterpolatedRhythms.udo"

instr TestGenerateInterpolatedRhythms
    prints "\n=== Test di generateInterpolatedRhythms ===\n\n"
    
    ; Test con diverse combinazioni di stati di movimento
    iSourceStates[] fillarray 0, 0, 1, 2
    iTargetStates[] fillarray 1, 2, 2, 0
    iProgressValues[] fillarray 0, 0.25, 0.5, 0.75, 1
    
    ; Dimensione della tabella ritmica
    iTableSize = 5
    
    ; Test tutte le combinazioni sorgente-target
    iTestCase = 1
    
    iSourceIdx = 0
    while iSourceIdx < lenarray(iSourceStates) do
        iSource = iSourceStates[iSourceIdx]
        iTarget = iTargetStates[iSourceIdx]
        
        prints "\nCASO DI TEST %d: Da stato %d a stato %d\n", iTestCase, iSource, iTarget
        prints "------------------------------------------------\n"
        prints "Progresso | Valori ritmici generati\n"
        prints "------------------------------------------------\n"
        
        ; Genera valori per diversi livelli di progresso
        iProgressIdx = 0
        while iProgressIdx < lenarray(iProgressValues) do
            iProgress = iProgressValues[iProgressIdx]
            
            ; Genera i ritmi interpolati
            iRhythmTable generateInterpolatedRhythms iSource, iTarget, iProgress, iTableSize
            
            ; Stampa intestazione riga
            prints "   %.2f   | ", iProgress
            
            ; Stampa i valori ritmici generati
            iIdx = 0
            while iIdx < iTableSize do
                iRhythmVal tab_i iIdx, iRhythmTable
                prints "%d ", iRhythmVal
                iIdx += 1
            od
            prints "\n"
            
            iProgressIdx += 1
        od
        
        ; Confronta con i valori non interpolati
        iSourceTable generateRhythmsForState iSource
        iTargetTable generateRhythmsForState iTarget
        
        prints "\nRitmi non interpolati:\n"
        prints "Sorgente (stato %d): ", iSource
        iIdx = 0
        while iIdx < 5 do
            iRhythmVal tab_i iIdx, iSourceTable
            prints "%d ", iRhythmVal
            iIdx += 1
        od
        prints "\n"
        
        prints "Target (stato %d):   ", iTarget
        iIdx = 0
        while iIdx < 5 do
            iRhythmVal tab_i iIdx, iTargetTable
            prints "%d ", iRhythmVal
            iIdx += 1
        od
        prints "\n\n"
        
        iSourceIdx += 1
        iTestCase += 1
    od
    
    ; Test con valori estremi
    prints "\nCASI ESTREMI\n"
    prints "------------------------------------------------\n"
    
    ; Interpolazione tra stati molto distanti
    iCaseA generateInterpolatedRhythms 0, 2, 0.5, iTableSize
    prints "Stato 0 → Stato 2 (progresso 0.5): "
    iIdx = 0
    while iIdx < iTableSize do
        iVal tab_i iIdx, iCaseA
        prints "%d ", iVal
        iIdx += 1
    od
    prints "\n"
    
    ; Interpolazione tra stati invertiti
    iCaseB generateInterpolatedRhythms 2, 0, 0.5, iTableSize
    prints "Stato 2 → Stato 0 (progresso 0.5): "
    iIdx = 0
    while iIdx < iTableSize do
        iVal tab_i iIdx, iCaseB
        prints "%d ", iVal
        iIdx += 1
    od
    prints "\n"
    
    ; Test con stato invalido
    iCaseC generateInterpolatedRhythms -1, 3, 0.5, iTableSize
    prints "Stato -1 → Stato 3 (progresso 0.5): "
    iIdx = 0
    while iIdx < iTableSize do
        iVal tab_i iIdx, iCaseC
        prints "%d ", iVal
        iIdx += 1
    od
    prints "\n"
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestGenerateInterpolatedRhythms" 0 0.1
e
</CsScore>
</CsoundSynthesizer>