<CsoundSynthesizer>
<CsOptions>
-o "test.wav"
</CsOptions>
<CsInstruments>
sr = 96000
kr = 96000
nchnls = 2
0dbfs = 1

#include "../udos/utils.udo"
#include "../udos/pfield_at.udo"
#include "../MACROS/first.udo"

; Strumento di test
instr 1
  ; Test con valori di esempio
  iCAttack = $INIT_C_ATTACCO
  iDurataArmonica = $INIT_DUR_ARM
  iDurata = $INIT_DURATA
  iRitmi[] init ftlen(gi_ritmi)
  copyf2array iRitmi, gi_ritmi
  
  ; Calcola gli attacchi
  iAttacchi[] calcPfield2 iCAttack, iDurataArmonica, iDurata, iRitmi
  
  ; Stampa i risultati
  iLen = lenarray(iAttacchi)
  indx = 0
  prints "\nAttacchi calcolati:\n"
  while indx < iLen do
    prints "Attacco %d: %f\n", indx+1, iAttacchi[indx]
    indx += 1
  od
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
</CsScore>
</CsoundSynthesizer>