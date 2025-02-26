<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-n   ; no sound
; For Non-realtime ouput leave only the line below:
; -o system.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments> 

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 2
; Runs command in a separate thread
ires system_i 1, "mkdir -p ./docs/tablesData", 0
print ires
turnoff
endin

</CsInstruments>
<CsScore>
i 2 5 1
e
</CsScore>
</CsoundSynthesizer> 