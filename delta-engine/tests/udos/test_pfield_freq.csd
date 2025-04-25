<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

#include "../udos/pfield_freq.udo"

; Strumento di test
instr 1
  ; Parametri di test
  iOttava = p4
  iRegione = p5
  iRitmo = p6
  iDur = p3
  iAmp = p7
  iRitmi[] fillarray 4, 3, 4,6,7,9
  iRitmiLen = lenarray(iRitmi)
  iIndx = 0 
  while (iIndx < iRitmiLen) do
  ; Calcola la frequenza usando l'UDO
  iFreq calcFrequenza iOttava, iRegione, iRitmi[iIndx]
  prints "Frequenza calcolata: %f Hz\n", iFreq
  iIndx+=1
  od
  ; Print per debug
  
endin

</CsInstruments>
<CsScore>
; Test con diversi parametri
;    start dur  ottava regione ritmo ampiezza
i1   0     .1    2      1       3     0.3
e
</CsScore>
</CsoundSynthesizer>