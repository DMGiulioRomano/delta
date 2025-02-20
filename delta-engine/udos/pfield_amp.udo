; Opcode per calcolare l'ampiezza spaziale
opcode calcAmpiezza, i, iii
  iAmpDB, iRhythm, iDampening xin
  
  ; Converti da dB a linear
  iAmpLinear db2linear iAmpDB
  ;!!!
  ; ampdbfs - usare opcode già fatto per ottimizzazione in init time
  ;!!!
  
  ; Calcola il tempo basato sul ritmo (t = π/rhythm)
  iTime = $M_PI / iRhythm
  
  ; Calcola l'ampiezza usando la formula della sinusoide smorzata
  ; amp * sin(0.5 * t) * exp(gamma * t)
  iSine = sin(0.5 * iTime)
  iExp = exp(iDampening * iTime)
  iResult = iAmpLinear * iSine * iExp
  
  ; Converti il risultato in dB e arrotonda a 3 decimali
  iResultDB = linear2db(iResult)
  ;!!!
  ; dbfsamp - usare opcode già fatto per ottimizzazione in init time
  ;!!!
  
  iResultRounded round3 iResultDB
  
  xout iResultRounded
endop
