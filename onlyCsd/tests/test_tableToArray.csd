<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

#include "udos/utils.udo"
#include "MACROS/first.udo"

instr 1
  prints "\n\npunti in tabella gi_ritmi: %d\n\n", ftlen(gi_ritmi)
  ;; deco ricordare di usare il -1 perché cos' non copia il guardpoint.
  ; inoltre le gen02 devo mettere sempre un valore in piu nella grandezza della tabella
  ; per avere il guordpoint e non farmi mangiare il valore
  iRitmi[] tab2array gi_ritmi, 0, ftlen(gi_ritmi)-1
  prints "\n"
  printarray iRitmi
  prints "\n"
prints "%nFunction Table %d:%n", gi_ritmi
indx      init      0
;
; DA RICORDARE !!! quando la tabella è dispari, bisogna aggiungere un valore in più
;   e toglierlo
 while indx < (ftlen(gi_ritmi)-1) do
  ival table indx, p4
  prints "Tables"
  prints "Index %d = %f%n", indx, ival
  indx += 1
 od
 indx = 0
 while indx < (lenarray(iRitmi)) do
  ival = iRitmi[indx]
  prints "Array\n"
  prints "Index %d = %f%n", indx, ival
  indx += 1
 od
endin 



</CsInstruments>
<CsScore>

i1 0 1 999
</CsScore>
</CsoundSynthesizer>