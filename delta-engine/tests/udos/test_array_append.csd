<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; UDO per estendere un array con un nuovo elemento
opcode ArrayExtend, i[], i[]i
  iOldArray[], iNewElement xin
  ; Ottieni la lunghezza del vecchio array
  iOldLen = lenarray(iOldArray)
  ; Crea il nuovo array con dimensione aumentata di 1
  iNewArray[] init iOldLen + 1
  ; Copia tutti gli elementi dal vecchio array
  indx = 0
  while indx < iOldLen do
    iNewArray[indx] = iOldArray[indx]
    indx += 1
  od
  ; Aggiungi il nuovo elemento alla fine
  iNewArray[iOldLen] = iNewElement
  xout iNewArray
endop

; Esempio di utilizzo:

instr 1
  ; Array iniziale
  iArr[] init 3
  iArr[0] = 1
  iArr[1] = 2
  iArr[2] = 3
  
  ; Nuovo elemento da aggiungere
  iNewElement = 4
  
  ; Estendi l'array
  iExtendedArr[] ArrayExtend iArr, iNewElement
  
  ; Stampa il risultato
  printarray iExtendedArr
endin

</CsInstruments>
<CsScore>
i1 0 1
e
</CsScore>
</CsoundSynthesizer>