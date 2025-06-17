<CsoundSynthesizer>
<CsOptions>
-o waveshaper.wav -W -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

#include "includes/waveshaper.orc"

</CsInstruments>
<CsScore>
; Tabella per la sinusoide di base
f 1 0 16384 10 1
f7 0 513 13 1 1 0 1 -.8 0 .6 0 0 0 .4 0 0 0 0 .1 -.2 -.3 .5
; =========================================================
; DEFINIZIONE DELLE FUNZIONI DI SHAPING (IL "CARATTERE" DEL SUONO)
; =========================================================

; Tabella 10: Distorsione leggera, quasi un soft-clipping.
f 10 0 16385 7 -1 8192 1 8192 -1

; Tabella 20: Distorsione più aspra e asimmetrica.
f 20 0 16385 7 -1 4096 1 12289 0

; Tabella 30: La "classica" con polinomi di Chebyshev.
; Aggiunge armoniche in modo controllato.
; f 30 0 16385 10 1 1 0.5 0.3 0.2 0.1
; (i coefficienti controllano le armoniche 1, 2, 3, 4, 5, 6)
f 30 0 16385 19 1 6 1 1 0.5 0.3 0.2 0.1 ; chebyshev 

; =========================================================
; ESEMPI DI NOTE
; =========================================================
;            att  dur  amp   freq  tab_shape  idx_start  idx_end  pan
; ---------------------------------------------------------------------
; Nota 1: Suono semplice, poca distorsione, usando la tabella 10
i "WaveShaper"  0   3   -12    220      7         3          1.5     0.2

; Nota 2: Stessa nota, ma con la tabella 20 (suono più aspro)
i "WaveShaper"  4   3   -12    220      20         1          1.5     0.8

; Nota 3: Usiamo la tabella 30 (Chebyshev) con un indice molto dinamico.
; Il suono partirà quasi puro e diventerà molto distorto.
i "WaveShaper"  8   4   -12    330      30         0.5        10      0.5

; Nota 4: Un suono basso e "gracchiante"
i "WaveShaper" 13   5   -9     80       20         5          15      0.5

e
</CsScore>
</CsoundSynthesizer>