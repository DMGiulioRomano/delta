<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>
sr = 96000
kr = 96000
nchnls = 2
0dbfs = 1


#include "../udos/utils.udo"
#include "../udos/pfield_amp.udo"


; Strumento di test
instr 1
  ; Test con valori simili a quelli nel tuo codice Python
  iAmpDB = -12
  iRhythm = 1
  iDampening = -0.05
  
  iResult calcAmpiezza iAmpDB, iRhythm, iDampening
  
  prints "Ampiezza calcolata: %f dB\n", iResult
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>