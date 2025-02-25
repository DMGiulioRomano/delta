<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o ftsave.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1
; Table #1, make a sine wave using the GEN10 routine.
gitmp1 ftgen 1, 0, 10, 10, 1
; Table #2, create an empty table.
gitmp2 ftgen 2, 0, 10, 7, 0, 10, 1
gitmp2 ftgen 3, 0, 10, 7, 1, 10, 0
; Instrument #1 - a basic oscillator.

opcode PRINTXPLOT, 0,i
icomp xin
  Sdst sprintf "table%d.table", icomp
  ftsave Sdst, 1, icomp+1
endop


instr 1
  kamp = 20000
  kcps = 440
  ; Use Table #1.
  ifn = 1
endin
; Instrument #2 - Load Table #1 into Table #2.
instr 2
  icomp=0
  ; Save Table #1 to a file called "table1.ftsave".
  while icomp<3 do
    PRINTXPLOT icomp
  icomp+=1
  od
endin


</CsInstruments>
<CsScore>
; Play Instrument #1 for 1 second.
i 1 0 1
; Play Instrument #2 for 1 second.
i 2 2 1
e
</CsScore>
</CsoundSynthesizer>