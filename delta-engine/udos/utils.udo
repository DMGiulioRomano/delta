
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

opcode printMatrixI, 0, iiiSiS
    ; iMatrix, iRows, iCols, STitle, iPrec, SIndent
    iMatrix, iRows, iCols, STitle, iPrecision, SIndent xin

    ; default title
    STitle    = (strcmp(STitle, "") == 0) ? "Matrix" : STitle
    iPrecision = (iPrecision == 0) ? 2 : iPrecision    ; default precision

    ; default indent
    SIndent = (strcmp(SIndent, "") == 0) ? "" : SIndent

    ; format string for numbers
    Sfmt sprintf  " %%.%df ", iPrecision

    ; print title
    prints "%s=== %s ===\n", SIndent, STitle

    ; header row
    prints "%s    |", SIndent
    iCol = 0
    while iCol < iCols do
        prints "  %2d   |", SIndent, iCol
        iCol += 1
    od
    prints "\n"
    ; separator
    iSepLen = 4 + iCols * (iPrecision + 5)
    iIdx = 0
    while iIdx < iSepLen do
        Ssep = "-"
        prints(iIdx != 0? Ssep : strcat(SIndent,Ssep))
;        prints "%s-", SIndent
        iIdx += 1
    od
    prints "\n"

    ; each matrix row
    iRow = 0
    while iRow < iRows do
        prints "%s%3d |", SIndent, iRow
        iCol = 0
        while iCol < iCols do
            iDx  = iRow * iCols + iCol
            iVal = table(iDx, iMatrix)         ; init‑time table read
            Sval = sprintf(Sfmt, iVal)
            prints "%s|", Sval
            iCol += 1
        od
        prints "\n"
        iRow += 1
    od

    ; final separator
    iIdx = 0
    while iIdx < iSepLen do
        Ssep = "-"
        prints(iIdx != 0? Ssep : strcat(SIndent,Ssep))
;        prints "%s-", SIndent
        iIdx += 1
    od
    prints "\n"
endop


opcode printMatrixK, 0, kkkSiS
    kMatrix, kRows, kCols, STitle, iPrecision, SIndent xin

    ; default
    STitle    = (strcmp(STitle, "") == 0) ? "Matrix" : STitle
    iPrecision = (iPrecision == 0) ? 2 : iPrecision

    ; default indent
    SIndent = (strcmp(SIndent, "") == 0) ? "" : SIndent
    
    ; format per valori a k-rate
    Sfmt sprintfk " %%.%df ", iPrecision            
    SHeader = ""
    kCount init 0
    while kCount < ((kCols)*(iPrecision+5)/2) do
      SHeader strcatk SHeader,"="
      kCount+=1
    od 
    SsubHeader strsubk SHeader, 0, strlenk(SHeader)-int(strlenk(STitle)/2)
    println "%s%s %s %s", SIndent, SsubHeader,STitle,SsubHeader

    ; header colonne
    printsk "%s    |", SIndent
    kCol = 0
    while kCol < kCols do                            
        printsk "  %2d   |", kCol
        kCol += 1
    od
    printsk "\n"

    ; separatore
    kSepLen = 4 + kCols * (iPrecision + 5)
    kI = 0
    while kI < kSepLen do                            
        Ssep = "-"
        printsk(kI != 0? Ssep : strcat(SIndent,Ssep))
        kI += 1
    od
    printsk "\n"

    ; righe matrice
    kRow = 0
    while kRow < kRows do
        printsk "%s%3d |", SIndent, kRow
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
        Ssep = "-"
        printsk(kI != 0? Ssep : strcat(SIndent,Ssep))
        kI += 1
    od
    printsk "\n"
endop

opcode PrintOctReg2x2, 0,S
    Ssep xin
    ; Header ASCII
    printsk  "%s           registro →\n",Ssep
    printsk  "%s          ┌─────────┬─────────┐\n",Ssep
    printsk  "%s ottava 1 │ reg 0   │ reg 1   │\n",Ssep
    printsk  "%s ↓        ├─────────┼─────────┤\n",Ssep
    printsk  "%s          │ reg 0   │ reg 1   │\n",Ssep
    printsk  "%s          └─────────┴─────────┘\n",Ssep
endop


opcode CURR2CSV, 0, 0
    Sfile = "docs/current_var.csv"
    kArr[] fillarray gk_current_overlap, gk_current_harmonic_density, gk_current_octave_spread, gk_current_spectral_centroid, gk_current_spatial_movement
    SArr[] = fillarray("timepoint","curr_overlap", "curr_harm_dens", "curr_oct_spread", "curr_spect_centr", "curr_spat_mov")  
    i_idx = 0
    while i_idx < lenarray(SArr) do
        Svar strcpy (i_idx+1!=lenarray(SArr)?"%s,":"%s\n")
        fprints Sfile, (i_idx+1!=lenarray(SArr)?"%s,":"%s\n"), SArr[i_idx]
        i_idx+=1
    od
    k_idx=0
    klen = lenarray:k(kArr)
    while k_idx < klen+1 do
        kval = k_idx<1?tab:k(gk_analysis_index,gi_analysis_timepoints):kArr[k_idx-1]
        if k_idx!=klen then 
            fprintks Sfile,"%f,",kval
        else
            fprintks Sfile,"%f\n",kval
        endif
        k_idx+=1
    od 
endop

opcode STATE_MEM_2CSV, 0, k
    kCurrentTime xin
    kMemIdx = int(kCurrentTime / gi_memory_resolution)
    Sfile = "docs/mem_state.csv"
    kArr[] = fillarray(gi_memory_state_density, gi_memory_state_register, gi_memory_state_movement)
    SArr[] = fillarray("timepoint","mem_state_dens", "mem_state_reg", "mem_state_mov")  
    i_idx = 0
    while i_idx < lenarray(SArr) do
        Svar strcpy (i_idx+1!=lenarray(SArr)?"%s,":"%s\n")
        fprints Sfile, (i_idx+1!=lenarray(SArr)?"%s,":"%s\n"), SArr[i_idx]
        i_idx+=1
    od
    k_idx=0
    klen = lenarray:k(kArr)
    while k_idx < klen+1 do
        kval = k_idx<1?kCurrentTime:tablekt:k(kMemIdx,kArr[k_idx-1])
        if k_idx!=klen then 
            fprintks Sfile,"%f,",kval
        else
            fprintks Sfile,"%f\n",kval
        endif
        k_idx+=1
    od 

endop


; Opcode per trovare tutti gli indici con un valore specifico
; Restituisce una tabella con gli indici trovati e il conteggio
opcode findIndices, i, ik
    iTableNum, kValueToFind xin
    ; Crea una tabella temporanea per memorizzare gli indici trovati
    iOutputTable ftgen 0, 0, 100, -2, 0
    kCount = 0
    ; Cerca in tutta la tabella
    kindex = 0
    iTableSize = ftlen(iOutputTable)
    while kindex < iTableSize do
        kValue tab kindex, iTableNum
        if kValue == kValueToFind then
        ; Memorizza l'indice trovato nella tabella di output
        tabw kindex, kCount, iOutputTable
        kCount += 1
        endif
        kindex += 1
    od
    if gi_debug >= 5 then
        println "\t\t\tfor comportamento %d", kValueToFind
        printMatrixK iOutputTable, 10, 10, "iOutputTable", 3, "\t\t\t"
    endif
    xout iOutputTable
endop
