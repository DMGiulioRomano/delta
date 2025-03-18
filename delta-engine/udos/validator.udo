
; VALIDATOR WORKS WITH GLOBAL TABLES

; UDO per validare il ritmo
; Restituisce 1 se valido, 0 se non valido
opcode validateRhythm, i, i
  i_Rhythm xin
  i_Len = ftlen(i_Rhythm)
  i_Index = 0
  i_Res = 1
  while i_Index < i_Len do
    i_Val tab_i i_Index, i_Rhythm
    i_IntVal = int(i_Val)
    if abs(i_Val - i_IntVal) > 0 then
      i_Res = abs(i_Val - i_IntVal)
      goto end  
    endif
    i_Index += 1
  od
  end:
  xout i_Res
endop

; UDO per validare durata e durata armonica
; Restituisce 1 se valido, 0 se non valido
opcode validateDuration, i, iii
  i_Dur, iHarmDur, i_Rhythm xin
  
  ; Verifica che le durate siano positive
  if i_Dur <= 0 || iHarmDur <= 0 then
    i_Res = 0
    goto end
  endif
  
  iMinRhythm minTableNonZero i_Rhythm

  ; Verifica la relazione tra durata armonica e ritmo
  iMinDuration = iHarmDur / iMinRhythm
  i_Res = i_Dur > iMinDuration ? 1 : iMinDuration
  
  end:
  xout i_Res
endop

; UDO per validare la posizione
; Restituisce 1 se valido, 0 se non valido
opcode validatePosition, i, ii
  i_Pos, i_Rhythm xin
  i_Len = ftlen(i_Pos)
  i_Res = 1
  
  ; Verifica che le liste abbiano la stessa lunghezza
  if (i_Len) != (ftlen(i_Rhythm)) then
    i_Res = 0
    goto end
  endif
  
  ; Verifica che ogni posizione sia valida per il suo ritmo
  i_Index = 0
  while i_Index < i_Len-1 do
    if tab_i(i_Index,i_Pos) < 0 || tab_i(i_Index,i_Pos) > abs(tab_i(i_Index,i_Rhythm)) then
      i_Res = 0
      goto end
    endif
    i_Index += 1
  od
  
  end:
  xout i_Res
endop

; UDO per calcolare l'ampiezza massima consentita data una frequenza
; Implementa le regole di scala dell'ampiezza basate su ottava e registro
opcode calculateMaxAmplitude, i, ii
  i_Ottava, i_Registro xin
  
  if i_Ottava == 0 then
    i_MaxAmp = -6
  elseif i_Ottava <= 3 then
    i_Slope = (-12 - (-6)) / (3 - 1)
    i_MaxAmp = -6 + i_Slope * (i_Ottava - 1) - (i_Registro - 1) * 0.3
  else
    i_Progress = (i_Ottava - 3) / (10 - 3)
    i_SmoothProgress = (1 - cos(i_Progress * $M_PI)) / 2
    i_BaseAmp = -12 + (-25 - (-12)) * i_SmoothProgress
    i_RegisterInfluence = (i_Registro - 1) * 0.2
    i_MaxAmp = i_BaseAmp - i_RegisterInfluence < -12 ? i_BaseAmp - i_RegisterInfluence : -12
  endif
  
  xout i_MaxAmp
endop

; UDO per validare l'ampiezza
opcode validateAmplitude, i, iii
  i_Amp, i_Ottava, i_Registro xin
  
  i_MaxAmp = calculateMaxAmplitude(i_Ottava, i_Registro)
  i_Res = i_Amp <= i_MaxAmp ? 1 : 0
  
  xout i_Res
endop

; UDO per validare la frequenza
opcode validateFrequency, i, ii
  i_Ottava, i_Registro xin
  
  ; Verifica range ottava e registro
  if i_Ottava < 0 || i_Ottava > 10 || i_Registro < 1 || i_Registro > 10 then
    i_Res = 0
  else
    i_Res = 1
  endif
  
  xout i_Res
endop


opcode Validator, i, iiiiiiii
  i_Dur, i_Rhythm, i_DurArm, i_Amp, i_Oct, i_Reg, i_Pos, i_which_comp  xin
  i_RhythmValid validateRhythm i_Rhythm
  i_DurValid validateDuration i_Dur, i_DurArm, i_Rhythm
  i_PosValid validatePosition i_Pos, i_Rhythm  
  i_AmpValid validateAmplitude i_Amp, i_Oct, i_Reg
  i_FreqValid validateFrequency i_Oct, i_Reg
  if i_RhythmValid == 1 && i_DurValid == 1 && i_PosValid == 1 && i_AmpValid == 1 && i_FreqValid == 1 then
  i_Res = 1
  else
      prints "\n\n\nArresto al comportamento %d\n", i_which_comp
      prints "\n\t---!!! ERRORE DI VALIDAZIONE !!!---\n\n"
      ; Stampa messaggi di errore
      if i_RhythmValid == 0 then
        prints "\nErrore: Ritmo presenta valori negativi. %d\n\n",i_RhythmValid
      endif
      if i_DurValid == 0 then
        prints "\nErrore: Durata non valida. %d\n\n", i_DurValid
      endif
      if i_PosValid == 0 then
        prints "Errore: Posizione non valida. %d\n\n", i_PosValid
      endif
      if i_AmpValid == 0 then
        prints "Errore: Ampiezza non valida per questa frequenza. %d \n\n", i_Amp
      endif
      if i_FreqValid == 0 then
        prints "Errore: Frequenza fuori range.  %d per ottava %d e registro %d\n\n", i_FreqValid, i_Oct, i_Reg
      endif
  prints "\n\n"
  exitnow
  endif
  xout i_Res
endop
