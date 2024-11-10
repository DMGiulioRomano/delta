<CsoundSynthesizer>
<CsOptions>
-o "test.wav" -W
</CsOptions>
<CsInstruments>

sr=96000
kr=96000
0dbfs=1
nchnls=2

    instr 1

iamp  = p4                  ; AMPIEZZA 
ifreq = p5                  ; FREQUENZA

as oscili iamp, ifreq       ; OSCILLATORE

        outs as,as
    endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1

"comportamento"

</CsScore>
</CsoundSynthesizer>


