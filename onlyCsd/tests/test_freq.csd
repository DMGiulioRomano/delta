<CsoundSynthesizer>
<CsOptions>
-o "test.wav"
</CsOptions>
<CsInstruments>
sr = 96000
kr = 96000
nchnls = 2
0dbfs = 1


#include "../udos/frequency_intonation.udo"
#include "../MACROS/first.udo"


instr TEST_FREQUENCIES
  ; Parametri
  iFund = $FONDAMENTALE   
  iNumInt = $INTERVALLI   
  iNumOct = $OTTAVE   
  iTblNum = $TABELLAF   
  iTotalLen = iNumInt * iNumOct
  
  ; Apri il file in modalità scrittura
  SHandle = "frequenze_pitagoriche.txt"
  
  ; Genera le frequenze per tutte le ottave
  GenPythagFreqs iFund, iNumInt, iNumOct, iTblNum
  
  ; Scrivi l'intestazione nel file
  fprints SHandle, "Sistema Pitagorico\n"
  fprints SHandle, "Frequenza fondamentale: %f Hz\n", iFund
  fprints SHandle, "Numero di intervalli per ottava: %d\n", iNumInt
  fprints SHandle, "Numero di ottave: %d\n\n", iNumOct
  
  ; Scrivi le frequenze nel file
  iIndx = 0
  iOctave = 0
  while (iIndx < iTotalLen) do
    if (iIndx % iNumInt == 0) then
      fprints SHandle, "\nOttava %d:\n", iOctave
      fprints SHandle, "------------------------\n"
      iOctave += 1
    endif
    fprints SHandle, "Frequenza %d:\t%f Hz\n", iIndx+1, table:i(iIndx, iTblNum)
    iIndx += 1
  od
    
endin



</CsInstruments>
<CsScore>
#include "../MACROS/first.udo"
; Crea una tabella per memorizzare le frequenze (dimensione 2000)
f $TABELLAF 0 2000 -2 0  ; Tabella vuota da riempire con le frequenze

; Genera le frequenze pitagoriche
i "TEST_FREQUENCIES" 0 0.1 
</CsScore>
</CsoundSynthesizer>