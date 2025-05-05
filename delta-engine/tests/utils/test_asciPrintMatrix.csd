<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
;----------------------------------------
; Impostazioni globali
;----------------------------------------
sr     = 96000
ksmps  = 1
nchnls = 2
0dbfs  = 1
#include "../../MACROS/init.orc"
#include "../../udos/stateTransition.udo"
#include "../../udos/utils.udo"
; =============================================================================
; PRINT MATRIX - Stampa una matrice in formato ASCII
; =============================================================================
; Input:
;   iMatrix     - ID della tabella contenente la matrice
;   iRows       - Numero di righe nella matrice
;   iCols       - Numero di colonne nella matrice
;   STitle      - Titolo opzionale da visualizzare (default: "Matrix")
;   iPrecision  - Precisione decimale per i valori (default: 2)
; =============================================================================


; Esempio di utilizzo di printMatrix per visualizzare la matrice di transizione
instr PrintMatrixTest
    initTransitionMatrix
    ; Stampa la matrice di transizione (3x3)
    printMatrix gi_transition_matrix, 27, 27, "Transition Matrix", 4
    ftprint       gi_transition_matrix  
    turnoff
endin

</CsInstruments>

<CsScore>
; esegui lo strumento per 3 secondi
i "PrintMatrixTest" 0 1
e
</CsScore>
</CsoundSynthesizer>
