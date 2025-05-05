
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

; Funzioni di accesso alla matrice
opcode getMatrixValue, k, kki
  kOctave, kRegister, iTab xin
  kIdx = kOctave * $REGISTRI + kRegister
  kVal tab kIdx, iTab
  xout kVal
endop

opcode getMatrixValue, kk, kki
  kOctave, kRegister, iTab xin
  kIdx = kOctave * $REGISTRI + kRegister
  kVal tab kIdx, iTab
  xout kVal, kIdx
endop

opcode setMatrixValue, 0, kkki
  kOctave, kRegister, kValue, iTab xin
  kIdx = kOctave * $REGISTRI + kRegister
  tabw kValue, kIdx, iTab
endop

opcode setMatrixValue, 0, kki
  kIdx, kValue, iTab xin
  tabw kValue, kIdx, iTab
endop

opcode printMatrix, 0, iiiSo
    iMatrix, iRows, iCols, STitle, iPrecision xin
    
    ; Valori di default
    STitle = (strcmp(STitle, "") == 0) ? "Matrix" : STitle
    iPrecision = (iPrecision == 0) ? 2 : iPrecision
    
    ; Format string per valori
    
    ; Stampa titolo
    prints "\n=== %s ===\n", STitle
    
    ; Determina larghezza colonne basata sulla precisione
    iWidth = iPrecision + 5  ; 5 caratteri + punto decimale + cifre decimali
    
    ; Stampa header delle colonne
    prints "    |"
    iCol = 0
    while iCol < iCols do
        if iCol < 10 then
            prints "   %d   |", iCol  ; Spaziatura per numeri a singola cifra
        else
            prints "  %d   |", iCol   ; Spaziatura per numeri a doppia cifra
        endif
        iCol += 1
    od
    prints "\n"
    
    ; Stampa riga separatrice
    prints "----+"
    iCol = 0
    while iCol < iCols do
        prints "-------+"
        iCol += 1
    od
    prints "\n"
    
    ; Stampa righe della matrice
    iRow = 0
    while iRow < iRows do
        if iRow < 10 then
            prints " %d  |", iRow     ; Spaziatura per numeri a singola cifra
        else
            prints " %d |", iRow      ; Spaziatura per numeri a doppia cifra
        endif
        
        iCol = 0
        while iCol < iCols do
            ; Calcola indice nella tabella (indexing in riga maggiore)
            iIndex = iRow * iCols + iCol
            
            ; Leggi valore dalla tabella
            iValue tab_i iIndex, iMatrix
            
            ; Formatta e stampa valore con spazi fissi
            SValueStr =sprintf("%6.4f", iValue)
            
            ; Aggiusta spaziatura in base alla lunghezza del valore
            iLen strlen SValueStr
            if iLen <= 3 then
                prints "  %s  |", SValueStr
            elseif iLen == 4 then
                prints " %s  |", SValueStr
            elseif iLen == 5 then
                prints " %s |", SValueStr
            else
                prints "%s|", SValueStr
            endif
            
            iCol += 1
        od
        
        prints "\n"
        iRow += 1
    od
    
    ; Stampa riga separatrice finale
    prints "----+"
    iCol = 0
    while iCol < iCols do
        prints "-------+"
        iCol += 1
    od
    prints "\n"
endop



opcode printMatrixK, 0, kkkSo
    kMatrix, kRows, kCols, STitle, iPrecision xin

    ; default
    STitle    = (strcmp(STitle, "") == 0) ? "Matrix" : STitle
    iPrecision = (iPrecision == 0) ? 2 : iPrecision

    ; format per valori a k-rate
    Sfmt sprintfk " %%.%df ", iPrecision            ; :contentReference[oaicite:6]{index=6}

    ; titolo
    printsk "\n=== %s ===\n", STitle                  ; :contentReference[oaicite:7]{index=7}

    ; header colonne
    printsk "    |"
    kCol = 0
    while kCol < kCols do                            ; :contentReference[oaicite:8]{index=8}
        printsk "  %2d   |", kCol
        kCol += 1
    od
    printsk "\n"

    ; separatore
    kSepLen = 4 + kCols * (iPrecision + 5)
    kI = 0
    while kI < kSepLen do                            ; :contentReference[oaicite:9]{index=9}
        printsk "-"
        kI += 1
    od
    printsk "\n"

    ; righe matrice
    kRow = 0
    while kRow < kRows do
        printsk "%3d |", kRow
        kCol = 0
        while kCol < kCols do
            kdx   = kRow * kCols + kCol
            kVal  = tablekt(kdx, kMatrix)           ; :contentReference[oaicite:10]{index=10}
            Sval  sprintfk Sfmt, kVal               ; :contentReference[oaicite:11]{index=11}
            printsk "%s|", Sval
            kCol += 1
        od
        printsk "\n"
        kRow += 1
    od

    ; linea finale (stesso loop di sopra)
    kI = 0
    while kI < kSepLen do
        printsk "-"
        kI += 1
    od
    printsk "\n"
endop
