; UDO per validare il ritmo
; Restituisce 1 se valido, 0 se non valido
opcode validateRhythm, i, i[]
  iRhythm[] xin
  
  iLen = lenarray(iRhythm)  
  ; Verifica che tutti i valori siano positivi
  iIndex = 0
  iRes = 1
  while iIndex < iLen do
    if iRhythm[iIndex] <= 0 then
      iRes = 0
      goto end
    endif
    iIndex += 1
  od
  
  end:
  xout iRes
endop


; UDO per validare durata e durata armonica
; Restituisce 1 se valido, 0 se non valido
opcode validateDuration, i, iii[]
  iDur, iHarmDur, iRhythm[] xin
  
  ; Verifica che le durate siano positive
  if iDur <= 0 || iHarmDur <= 0 then
    iRes = 0
    goto end
  endif
  
  ; Trova il minimo del ritmo
  iMinRhythm = iRhythm[0]
  iIndex = 1
  while iIndex < lenarray(iRhythm) do
    iMinRhythm = iMinRhythm < iRhythm[iIndex] ? iMinRhythm : iRhythm[iIndex]
    iIndex += 1
  od
  
  ; Verifica la relazione tra durata armonica e ritmo
  iMinDuration = iHarmDur / iMinRhythm
  iRes = iDur > iMinDuration ? 1 : 0
  
  end:
  xout iRes
endop

; UDO per validare la posizione
; Restituisce 1 se valido, 0 se non valido
opcode validatePosition, i, i[]i[]i
  iPos[], iRhythm[], iLen xin
  
  iRes = 1
  
  ; Verifica che le liste abbiano la stessa lunghezza
  if lenarray(iPos) != lenarray(iRhythm) then
    iRes = 0
    goto end
  endif
  
  ; Verifica che ogni posizione sia valida per il suo ritmo
  iIndex = 0
  while iIndex < iLen do
    if iPos[iIndex] < 0 || iPos[iIndex] > iRhythm[iIndex] then
      iRes = 0
      goto end
    endif
    iIndex += 1
  od
  
  end:
  xout iRes
endop

; UDO per calcolare l'ampiezza massima consentita data una frequenza
; Implementa le regole di scala dell'ampiezza basate su ottava e registro
opcode calculateMaxAmplitude, i, ii
  iOttava, iRegistro xin
  
  if iOttava == 0 then
    iMaxAmp = -6
  elseif iOttava <= 3 then
    iSlope = (-12 - (-6)) / (3 - 1)
    iMaxAmp = -6 + iSlope * (iOttava - 1) - (iRegistro - 1) * 0.3
  else
    iProgress = (iOttava - 3) / (10 - 3)
    iSmoothProgress = (1 - cos(iProgress * $M_PI)) / 2
    iBaseAmp = -12 + (-25 - (-12)) * iSmoothProgress
    iRegisterInfluence = (iRegistro - 1) * 0.2
    iMaxAmp = iBaseAmp - iRegisterInfluence < -12 ? iBaseAmp - iRegisterInfluence : -12
  endif
  
  xout iMaxAmp
endop

; UDO per validare l'ampiezza
opcode validateAmplitude, i, iii
  iAmp, iOttava, iRegistro xin
  
  iMaxAmp = calculateMaxAmplitude(iOttava, iRegistro)
  iRes = iAmp <= iMaxAmp ? 1 : 0
  
  xout iRes
endop

; UDO per validare la frequenza
opcode validateFrequency, i, ii
  iOttava, iRegistro xin
  
  ; Verifica range ottava e registro
  if iOttava < 0 || iOttava > 10 || iRegistro < 1 || iRegistro > 10 then
    iRes = 0
  else
    iRes = 1
  endif
  
  xout iRes
endop

