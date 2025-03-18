
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

; Opcode che trova il valore minimo non-zero in una tabella
opcode minTableNonZero, i, i
    iTableNum xin
    
    ; Ottieni la dimensione della tabella
    iSize = ftlen(iTableNum)
    
    ; Inizializza con un valore molto grande
    iMin = 1e10  ; Un valore molto grande come inizializzazione
    iFoundNonZero = 0  ; Flag per verificare se abbiamo trovato almeno un valore non-zero
    
    ; Itera attraverso la tabella
    indx = 0
    while indx < iSize do
        iVal = tab_i(indx, iTableNum)
        if iVal != 0 && iVal < iMin then
            iMin = iVal
            iFoundNonZero = 1
        endif
        indx += 1
    od
    
    ; Se non abbiamo trovato alcun valore non-zero, restituisci 0
    if iFoundNonZero == 0 then
        prints "nel cercare un valore minimo nella tabella dei ritmi"
        prints "è stato riscontrato che tutti i valori sono 0"
        prints "uscita forzata dal sistema - minTableNonZero"
        exitnow
    endif
    
    xout iMin
endop
