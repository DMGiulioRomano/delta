
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

