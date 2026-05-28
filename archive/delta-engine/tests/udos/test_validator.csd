<CsoundSynthesizer>
<CsOptions>
-odac ; "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

#include "../udos/validator.udo"
#include "../MACROS/first.udo"

instr 1
  ; Parametri in ingresso
  iDur = $INIT_DURATA
  iAmp = $INIT_AMPIEZZA
  iRhythm[] fillarray table:i(0,$INIT_RITMO),table:i(1,$INIT_RITMO), table:i(2, $INIT_RITMO)
  iPos[] fillarray 1, 2, 3
  iHarmDur = $INIT_DUR_ARM
  ; Calcola ottava e registro dalla frequenza MIDI
  iOttava = $INIT_FREQ_OCT
  iRegistro = $INIT_FREQ_REG
  ; Validazione dei parametri
  iRhythmValid validateRhythm iRhythm
  iDurValid validateDuration iDur, iHarmDur, iRhythm
  iPosValid validatePosition iPos, iRhythm, lenarray(iPos)  
  iAmpValid validateAmplitude iAmp, iOttava, iRegistro
  iFreqValid validateFrequency iOttava, iRegistro
  
  ; Se tutti i parametri sono validi, procedi con la sintesi
  if iRhythmValid == 1 && iDurValid == 1 && iPosValid == 1 && iAmpValid == 1 && iFreqValid == 1 then
    ; Converti ampiezza da dB
    iAmpLin = ampdbfs(iAmp)
    ; Converti frequenza da MIDI a Hz
    iFreq = 440 

    ; Sintesi base
    aOut poscil iAmpLin, iFreq
    outs aOut, aOut
  else
    ; Stampa messaggi di errore
    if iRhythmValid == 0 then
      prints "\nErrore: Ritmo presenta valori negativi\n\n"
    endif
    if iDurValid == 0 then
      prints "\nErrore: Durata non valida\n\n"
    endif
    if iPosValid == 0 then
      prints "Errore: Posizione non valida\n"
    endif
    if iAmpValid == 0 then
      prints "Errore: Ampiezza non valida per questa frequenza\n"
    endif
    if iFreqValid == 0 then
      prints "Errore: Frequenza fuori range\n"
    endif
  endif
endin

</CsInstruments>
<CsScore>
; Test con parametri validi
i1 0 2 
</CsScore>
</CsoundSynthesizer>