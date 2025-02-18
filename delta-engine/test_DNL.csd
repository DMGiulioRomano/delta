<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Tabella per memorizzare i ritmi iniziali
giRhythms ftgen 0, 0, -3, -2, 3, 5, 4

; Funzione non lineare implementata come UDO
opcode NonlinearFunc, i, i
  iX xin
  iPI = 3.14159
  iResult = abs(iX*2 * sin(iX * iPI/2 + iX)+ 1/(iX+0.001))
  iResult = round(iResult)
  xout iResult
endop

instr 1
  ; Parametri
  iNumIterations = 5  ; iterazioni per ogni valore
  iTableLen = ftlen(giRhythms)
  
  ; Per ogni ritmo iniziale
  iRhythmIndex = 0
  while iRhythmIndex < iTableLen do
    ; Leggi il valore iniziale
    iCurrentValue tab_i iRhythmIndex, giRhythms
    prints "\n=================================\n"
    prints "Sequenza per valore iniziale: %d\n", iCurrentValue
    prints "=================================\n"
    prints "-> %d\n", iCurrentValue
    
    ; Genera iterazioni
    iIteration = 0
    while iIteration < iNumIterations do
      iCurrentValue NonlinearFunc iCurrentValue
      prints "-> %d\n", iCurrentValue
      iIteration += 1
    od
    
    iRhythmIndex += 1
  od
  
  prints "\nGenerazione completata.\n"
  turnoff
endin

</CsInstruments>
<CsScore>
i1 0 1
e
</CsScore>
</CsoundSynthesizer>