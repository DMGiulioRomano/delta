<CsoundSynthesizer>
<CsOptions>
-n -d ; No audio output, debug mode only
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gi_tab ftgen 0, 0, 10, -2, 0


opcode myopcode, 0, 0

tabw_i 100, 0, gi_tab 

endop


instr 1 
ftprint gi_tab, 1
myopcode
ftprint gi_tab, 1
endin

</CsInstruments>
<CsScore>
; Schedule test instruments in sequence

i 1 0 0.1

e
</CsScore>
</CsoundSynthesizer>