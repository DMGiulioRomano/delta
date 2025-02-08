<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; Import MACROS
#include "MACROS/first.udo"
#include "MACROS/costants.udo"


; Import UDOs
#include "udos/utils.udo"
#include "udos/pfield_amp.udo"
#include "udos/pfield_at.udo"
#include "udos/pfield_freq.udo"
#include "udos/frequency_intonation.udo"
#include "orc/eventoSonoro.orc"
#include "udos/comportamento.udo"



instr Frequencies
  ; parameters --> iFund, iNumIntervals, iNumOctaves, iTblNum 
  GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, giIntonazione
  ;prints "\n\ntest freq %d\n\n\n" , table:i(0, 1000)
endin



instr Gestore
  ; inizializza le frequenze
  schedule "Frequencies", 0, 0.001
  iRitmi[] tab2array gi_ritmi, 0, ftlen(gi_ritmi)-1
  iPosizioni[] tab2array gi_posizioni, 0 , ftlen(gi_posizioni)-1
  GenComportamento 1, $INIT_C_ATTACCO, $INIT_DUR_ARM, $INIT_DURATA, $INIT_AMPIEZZA, $INIT_FREQ_OCT, $INIT_FREQ_REG, iRitmi, iPosizioni, 1, giIndex
endin



</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1
; Genera le frequenze pitagoriche
i "Gestore" 0 0.001 



</CsScore>
</CsoundSynthesizer>