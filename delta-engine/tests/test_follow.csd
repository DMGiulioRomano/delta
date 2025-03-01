<CsoundSynthesizer>
<CsOptions>
-o "test.wav"
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1

    al,ar diskin2 "output.wav"

    aLenv follow al,0.01
    aRenv follow ar,0.01
    outs aLenv, aRenv
endin

instr 2
    al,ar diskin2 "output.wav"
    kLenv rms al
    kRenv rms ar
    outs a(kLenv), a(kRenv)

endin

</CsInstruments>
<CsScore>
i1 0 10
i2 10 10
</CsScore>
</CsoundSynthesizer>