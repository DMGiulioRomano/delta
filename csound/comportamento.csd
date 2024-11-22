<CsoundSynthesizer>
<CsOptions>
; namefile

</CsOptions>
<CsInstruments>

sr=96000
kr=96000
0dbfs=1
nchnls=2

    instr 1

iamp  = ampdbfs(p4)                 ; AMPIEZZA 
ifreq = p5                  ; FREQUENZA

as oscili iamp, ifreq       ; OSCILLATORE
kanticlick cosseg 0, p3/20, 1, p3-p3/10, 1, p3/20,0
        outs as*kanticlick,as*kanticlick
    endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1

; "comportamento"

</CsScore>
</CsoundSynthesizer>