<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-o "pino.wav"      -W     ;-iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o ftsave.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
; Initialize the global variables.
sr = 96000
kr = 96000
nchnls = 2
0dbfs =1

zakinit 1,1

instr 1
as oscil p5*linseg:k(0,p3/2,1,p3/2,0),p4,1
zawm as, 1
;outs as,as
endin

instr 2
    a_gelo zar 1
;    a_gelo chnget "pino"
    printk 1, k(a_gelo)
    outs a_gelo, a_gelo
    zacl 1
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
; Play Instrument #1 for 1 second.
i 1 0 1 300 .2
i 1 .1 1 400 .3
i 1 .3 1 500 .5
i 1 0 10 900  .1
i 1 .1 3 1000 .2
i 1 .3 7 3000 .3
; Play Instrument #2 for 1 second.
i 2 0 20

</CsScore>
</CsoundSynthesizer>
