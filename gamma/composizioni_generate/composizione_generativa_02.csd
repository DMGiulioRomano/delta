
<CsoundSynthesizer>
<CsOptions>
-o "composizione_generativa_02.wav" -W -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

#define SQRT2 #1.4142135623730951#
#define MAX_AMP #0.999#
#define FONDAMENTALE #32#
#define OTTAVE #10#
#define INTERVALLI #200#
#define REGISTRI #50#
#define M_PI #3.141592653589793#
gSdirSco = "./sco/"
gi_Index init 1
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/eventoSonoro.orc"
#include "../includes/comportamento.orc"
#include "../includes/avvia_comportamento.orc"

instr Init
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 0 then
        prints "ERRORE: Inizializzazione del sistema pitagorico fallita!\n"
    endif
    ires system_i 1, sprintf("mkdir %s", gSdirSco)
    turnoff
endin
</CsInstruments>
<CsScore>
f 0 117.73843628799446 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 20, 28, 20
f 1001 0 3 2 0, 1, 2
f 1002 0 4 2 2, 10, 4, 15
f 1003 0 4 2 0, 1, 2, 3
f 1004 0 3 2 16, 20, 24
f 1005 0 3 2 0, 1, 2
f 1006 0 3 2 18, 25, 30
f 1007 0 3 2 0, 1, 2
f 1008 0 4 2 3, 20, 5, 8
f 1009 0 4 2 0, 1, 2, 3

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
i "AvviaComportamento" 0.0010 51.306 1000 41.045 -31.50 0 1 1001 1 0
i "AvviaComportamento" 0.1754 56.237 1004 56.237 -33.90 0 2 1005 3 0
i "AvviaComportamento" 0.2080 57.453 1002 57.453 -33.67 1 1 1003 2 0
i "AvviaComportamento" 0.2871 67.898 1004 54.319 -30.83 0 1 1005 4 0
i "AvviaComportamento" 0.9130 44.947 1000 44.947 -34.58 0 2 1001 5 0
i "AvviaComportamento" 2.0466 91.094 1006 56.934 -32.87 1 1 1007 6 0
i "AvviaComportamento" 2.0941 50.463 1006 50.463 -29.82 2 1 1007 7 1
i "AvviaComportamento" 3.6555 69.041 1002 55.232 -32.15 0 2 1003 8 0
i "AvviaComportamento" 5.6130 56.340 1006 56.340 -31.99 2 1 1007 9 1
i "AvviaComportamento" 8.0527 57.806 1002 46.245 -30.84 0 1 1003 10 0
i "AvviaComportamento" 11.0136 79.853 1006 49.908 -28.68 1 2 1007 11 0
i "AvviaComportamento" 11.0165 52.588 1000 42.070 -30.13 2 2 1001 13 0
i "AvviaComportamento" 11.0813 45.910 1006 36.728 -29.66 3 2 1007 12 1
i "AvviaComportamento" 14.3440 63.073 1000 39.420 -28.55 1 1 1001 14 0
i "AvviaComportamento" 14.3870 59.089 1000 36.931 -27.93 0 2 1001 15 0
i "AvviaComportamento" 14.3975 54.077 1000 43.262 -30.93 0 1 1001 16 1
i "AvviaComportamento" 18.2003 77.579 1006 48.487 -29.55 0 3 1007 17 0
i "AvviaComportamento" 18.2286 78.143 1004 48.839 -28.29 0 2 1005 18 0
i "AvviaComportamento" 18.2477 41.706 1004 33.365 -31.07 0 1 1005 19 0
i "AvviaComportamento" 22.5385 37.032 1000 37.032 -27.99 1 3 1001 22 0
i "AvviaComportamento" 22.5622 50.034 1002 40.027 -28.94 1 2 1003 20 0
i "AvviaComportamento" 22.6137 54.746 1002 34.217 -28.44 0 3 1003 21 1
i "AvviaComportamento" 27.1589 31.932 1000 31.932 -29.61 0 4 1001 25 0
i "AvviaComportamento" 27.2045 66.289 1008 41.431 -25.69 0 3 1009 26 1
i "AvviaComportamento" 27.2155 38.830 1002 31.064 -28.90 1 3 1003 27 1
i "AvviaComportamento" 27.2193 30.730 1006 30.730 -27.65 2 4 1007 23 0
i "AvviaComportamento" 27.2250 37.482 1006 37.482 -28.97 0 2 1007 24 0
i "AvviaComportamento" 32.3649 48.674 1008 30.421 -28.23 0 2 1009 33 0
i "AvviaComportamento" 32.3747 36.575 1004 29.260 -25.55 6 3 1005 31 0
i "AvviaComportamento" 32.4058 60.787 1002 37.992 -24.68 4 4 1003 34 0
i "AvviaComportamento" 32.4160 37.688 1000 37.688 -27.84 4 2 1001 29 0
i "AvviaComportamento" 32.4168 36.271 1004 36.271 -25.69 1 2 1005 28 1
i "AvviaComportamento" 32.4427 30.091 1004 30.091 -24.75 6 3 1005 32 1
i "AvviaComportamento" 32.4806 35.266 1006 28.213 -26.26 0 2 1007 30 0
i "AvviaComportamento" 37.9579 45.534 1006 28.459 -26.91 2 4 1007 35 0
i "AvviaComportamento" 37.9823 38.602 1006 30.882 -25.82 0 3 1007 37 1
i "AvviaComportamento" 38.0021 47.261 1004 29.538 -24.91 4 4 1005 36 0
i "AvviaComportamento" 44.0935 34.118 1006 34.118 -24.68 3 3 1007 38 0
i "AvviaComportamento" 44.1480 39.843 1008 31.874 -27.46 4 4 1009 39 1
i "AvviaComportamento" 44.1538 50.403 1008 31.502 -24.68 2 4 1009 41 0
i "AvviaComportamento" 44.2188 30.246 1002 24.197 -22.80 2 4 1003 40 0
i "AvviaComportamento" 50.5857 37.681 1004 23.551 -25.24 2 5 1005 43 0
i "AvviaComportamento" 50.6191 35.021 1004 21.888 -25.98 3 4 1005 42 0
i "AvviaComportamento" 50.6755 37.544 1006 23.465 -24.91 5 5 1007 44 0
i "AvviaComportamento" 50.6998 34.341 1000 27.473 -23.73 4 5 1001 45 1
i "AvviaComportamento" 57.5447 39.893 1006 24.933 -21.25 3 4 1007 46 0
i "AvviaComportamento" 57.5693 33.391 1000 20.870 -22.17 3 3 1001 51 0
i "AvviaComportamento" 57.5704 43.640 1004 27.275 -24.66 0 3 1005 50 1
i "AvviaComportamento" 57.6059 26.628 1000 21.303 -20.63 6 5 1001 47 0
i "AvviaComportamento" 57.6109 40.112 1004 25.070 -25.06 7 3 1005 49 0
i "AvviaComportamento" 57.6272 36.389 1000 29.111 -23.48 6 5 1001 48 0
i "AvviaComportamento" 57.6313 23.814 1000 19.051 -22.81 0 4 1001 53 0
i "AvviaComportamento" 57.6585 28.464 1000 22.772 -25.33 0 4 1001 52 1
i "AvviaComportamento" 64.9472 20.715 1000 20.715 -19.82 0 4 1001 56 1
i "AvviaComportamento" 64.9760 29.219 1000 23.375 -23.61 7 3 1001 59 1
i "AvviaComportamento" 64.9989 27.436 1004 21.949 -23.99 6 3 1005 58 0
i "AvviaComportamento" 65.0130 32.120 1002 20.075 -22.72 0 5 1003 57 1
i "AvviaComportamento" 65.0136 27.674 1006 22.139 -22.96 0 5 1007 63 0
i "AvviaComportamento" 65.0141 29.933 1006 18.708 -19.17 0 5 1007 65 1
i "AvviaComportamento" 65.0372 20.839 1008 20.839 -22.26 3 5 1009 64 0
i "AvviaComportamento" 65.0379 26.411 1002 16.507 -23.46 2 3 1003 54 1
i "AvviaComportamento" 65.0383 26.275 1006 16.422 -22.89 0 4 1007 61 1
i "AvviaComportamento" 65.0435 32.446 1008 20.279 -21.90 7 3 1009 55 1
i "AvviaComportamento" 72.8045 28.348 1004 17.718 -20.78 0 5 1005 70 1
i "AvviaComportamento" 72.9020 18.461 1008 18.461 -22.80 4 6 1009 66 1
i "AvviaComportamento" 72.9053 22.399 1002 17.919 -18.98 2 4 1003 67 1
i "AvviaComportamento" 72.9086 27.443 1006 17.152 -21.00 0 4 1007 71 1
i "AvviaComportamento" 72.9229 22.904 1008 14.315 -21.60 2 4 1009 69 0
i "AvviaComportamento" 72.9263 27.078 1006 16.924 -19.57 0 6 1007 68 1
i "AvviaComportamento" 72.9355 28.468 1000 17.793 -22.64 0 6 1001 72 0
i "AvviaComportamento" 81.1575 20.354 1004 12.721 -20.24 4 4 1005 87 1
i "AvviaComportamento" 81.1675 12.841 1000 12.841 -18.89 4 4 1001 73 1
i "AvviaComportamento" 81.1802 10.787 1000 10.787 -20.74 0 5 1001 93 0
i "AvviaComportamento" 81.1861 21.358 1006 13.349 -17.77 0 4 1007 78 0
i "AvviaComportamento" 81.1977 11.486 1008 11.486 -17.72 0 4 1009 92 0
i "AvviaComportamento" 81.2211 19.197 1006 15.358 -17.87 0 4 1007 85 1
i "AvviaComportamento" 81.2319 12.116 1004 12.116 -20.15 0 4 1005 75 1
i "AvviaComportamento" 81.2347 10.804 1000 10.804 -20.84 0 6 1001 95 0
i "AvviaComportamento" 81.2474 26.491 1004 16.557 -19.81 0 4 1005 96 0
i "AvviaComportamento" 81.2697 20.303 1004 16.242 -20.41 0 5 1005 74 0
i "AvviaComportamento" 81.2888 17.948 1000 14.358 -18.49 4 6 1001 79 0
i "AvviaComportamento" 81.2945 17.356 1002 10.847 -19.42 0 6 1003 90 0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
