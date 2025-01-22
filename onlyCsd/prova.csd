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


instr GeneraComportamenti
  ; Parametri dello strumento
  iNumComportamenti = p4  ; Numero di comportamenti da generare
  iStartTime = p5         ; Tempo di inizio
  iTimeStep = p6          ; Passo temporale tra comportamenti
  iRitmi[] tab2array gi_ritmi, 0, ftlen(gi_ritmi)-1
  iPosizioni[] tab2array gi_posizioni,0,  ftlen(gi_posizioni)-1
  ; Indice globale per tenere traccia di dove siamo nelle tabelle
  iIndex = 0
  
  ; Ciclo principale di generazione
  while iIndex < iNumComportamenti do
    ; Calcola il tempo di attacco per questo comportamento
    iAttacco = iStartTime + (iIndex * iTimeStep)
    tablew iAttacco, iIndex, gitab_ATTACCO
    
    ; Genera e salva durata armonica (con una leggera variazione dal precedente)
    if iIndex > 0 then
      iLastDurArm tab_i iIndex-1, gitab_DURARMONICA
      iDurArm = iLastDurArm * (1 + rnd(0.1) - 0.05)  ; ±5% variazione
    else
      iDurArm = $INIT_DUR_ARM
    endif
    tablew iDurArm, iIndex, gitab_DURARMONICA
    
    ; Genera e salva durata totale
    iDurata = iDurArm * 2  ; o qualsiasi altra relazione desideri
    tablew iDurata, iIndex, gitab_DURATA
    
    ; Genera e salva ampiezza (con graduale diminuzione)
    iAmpiezza = $INIT_AMPIEZZA - (iIndex * 0.5)  ; diminuisce di 0.5 dB per ogni comportamento
    tablew iAmpiezza, iIndex, gitab_AMPIEZZA
    
    ; Genera e salva ottava e registro
    if iIndex > 0 then
      iLastOttava tab_i iIndex-1, gitab_OTTAVA
      iLastRegistro tab_i iIndex-1, gitab_REGISTRO
      iOttava = iLastOttava + round(rnd(2) - 1)  ; ±1 ottava
      iRegistro = iLastRegistro + round(rnd(2) - 1)  ; ±1 registro
    else
      iOttava = $INIT_FREQ_OCT
      iRegistro = $INIT_FREQ_REG
    endif
    ; Mantieni nei limiti
    iOttava = limit(iOttava, 0, 10)
    iRegistro = limit(iRegistro, 1, 10)
    tablew iOttava, iIndex, gitab_OTTAVA
    tablew iRegistro, iIndex, gitab_REGISTRO
    
    ; Genera e salva ritmo
    iRitmoLen = 4  ; o potrebbe variare
    tablew iRitmoLen, iIndex, gitab_RITMO_LEN
    iRitmoBaseIndex = iIndex * 1000  ; assumiamo max 1000 valori per ogni comportamento
    iRitmoIdx = 0
    while iRitmoIdx < iRitmoLen do
      iRitmoVal = round(random(3, 6))  ; genera ritmi tra 3 e 6
      tablew iRitmoVal, iRitmoBaseIndex + iRitmoIdx, gitab_RITMO_VAL
      iRitmoIdx += 1
    od
    
    ; Schedule del comportamento
    GenComportamento iIndex, iAttacco, iDurArm, iDurata, iAmpiezza, iOttava, iRegistro, iRitmi, iPosizioni, 1    
    iIndex += 1
  od
endin

instr Gestore
  ; inizializza le frequenze
  schedule "Frequencies", 0, 0.001
  
  ; Avvia il ciclo di generazione dei comportamenti
  ; Parametri: NumComportamenti, StartTime, TimeStep
  schedule "GeneraComportamenti", 0, 0.001, 10, 0, 2
endin

</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1
; Genera le frequenze pitagoriche
i "Gestore" 0 0.001 30 5 9



</CsScore>
</CsoundSynthesizer>