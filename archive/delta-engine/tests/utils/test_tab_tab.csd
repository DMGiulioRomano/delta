<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giN = 10
; Tabella per memorizzare i ritmi iniziali
giRhythms ftgen 0, 0, giN+1, -2, 3, 5, 4, 6, 2, 4, 1, 8, 4, 10


instr 1
giR2 ftgen 0, 0, giN+1, -2, 0
tableicopy giR2, giRhythms
ftprint giR2

endin

</CsInstruments>
<CsScore>
i1 0 1
e
</CsScore>
</CsoundSynthesizer>