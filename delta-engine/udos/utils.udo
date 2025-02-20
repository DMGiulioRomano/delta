
; Opcode per convertire da linear a dB
opcode linear2db, i, i
  iLinear xin
  iDB = 20 * log10(iLinear)
  xout iDB
endop

; Opcode per convertire da dB a linear
opcode db2linear, i, i
  iDB xin
  iLinear = 10 ^ (iDB / 20)
  xout iLinear
endop

; Opcode per arrotondare a 3 decimali
opcode round3, i, i
  iValue xin
  iMultiplier = 1000
  iRounded = int(iValue * iMultiplier + 0.5) / iMultiplier
  xout iRounded
endop

; Opcode per trovare il massimo valore in un array
opcode maxArray, i, i[]
  iArr[] xin
  iMax = iArr[0]
  indx = 1
  iLen = lenarray(iArr)
  while indx < iLen do
    if iArr[indx] > iMax then
      iMax = iArr[indx]
    endif
    indx += 1
  od
  xout iMax
endop


; Funzione per leggere un numero specifico di valori da un offset
opcode leggiTabArray, i[], iii
    iOffset, iLen, iTableNum xin
    iResult[] init iLen
    
    indx = 0
    while indx < iLen do
        iResult[indx] = tab_i(iOffset + indx, iTableNum)
        indx += 1
    od

    xout iResult
endop

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


; Opcode per sommare tutti gli elementi di una ftable
opcode sumFTable, i, i
    iTableNum xin
    iSize = ftlen(iTableNum)
    iSum = 0
    indx = 0
    while indx < iSize do
        iVal = tab_i(indx, iTableNum)
        iSum = iSum + iVal
        indx += 1
    od
    xout iSum
endop
