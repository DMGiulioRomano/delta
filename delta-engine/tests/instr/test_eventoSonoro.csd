<CsoundSynthesizer>
<CsOptions>
; Output su file per analisi offline
-o eventoSonoro_test.wav
; Opzioni per prestazioni ottimali
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 16
nchnls = 2
0dbfs = 1

; Definizioni delle macro necessarie
#define SQRT2 #1.4142135623730951# ; sqrt(2) per normalizzazione
#define MAX_AMP #0.999# ; Ampiezza massima per prevenire clipping
#define M_PI #3.14159265359# ; Pi

; Variabili globali necessarie
gi_debug init 1 ; Abilita debug di livello moderato per verificare comportamenti

#include "../../MACROS/init.orc"
#include "../../MACROS/debug.orc"
#include "../../orc/eventoSonoro.orc"

</CsInstruments>
<CsScore>
; Durata totale del test
f   1   0   [2^20]  10  1
f   2   0   [2^20]  -6   0 [2^19] .5 [2^19] 1

#include "sco/All.sco"

</CsScore>
</CsoundSynthesizer>