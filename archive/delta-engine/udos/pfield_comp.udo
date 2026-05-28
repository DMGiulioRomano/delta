

; Opcode per calcolare gli attacchi (pfield2)
opcode calcPfield2, i[], iiii[]
  iCAttack, iDurataArmonica, iDurata, iRitmi[] xin
  
  ; Calcolo dimensione ottimale array
  iMaxRitmo maxArray iRitmi
  iMinRitmo = 1/iMaxRitmo
  
  iMaxAttacchi = int((iDurata/(iDurataArmonica * iMinRitmo)) + 1)
  iOutArray[] init iMaxAttacchi
  iDurataRimanente = iDurata
  iNumAttacchi = 0
  iRitmoIndex = 0
  iLenRitmi = lenarray(iRitmi)
  
  ; Calcola il primo attacco
  iAttaccoN round3 iCAttack
  iOutArray[0] = iAttaccoN
  if int(iRitmi[0]) == 0 then
    goto fine
  endif
  iRitmoN round3 1/iRitmi[0]
  iNumAttacchi = 1
  
  ; Ciclo principale
  while iDurataRimanente > 0 do
    
    ; Calcola il nuovo ritmo
    iRitmoN round3 1/iRitmi[iRitmoIndex]
    
    ; Calcola il nuovo attacco
    iAttaccoN round3 iDurataArmonica * iRitmoN + iOutArray[iNumAttacchi-1]
    
    ; Salva l'attacco nell'array
    iOutArray[iNumAttacchi] = iAttaccoN
    
    ; Aggiorna contatori
    iDurataRimanente round3 iDurataRimanente - (iDurataArmonica * iRitmoN)
    iNumAttacchi += 1
    ; Aggiorna l'indice del ritmo ciclicamente
    iRitmoIndex = (iRitmoIndex + 1) % iLenRitmi
    
    ; Controllo di sicurezza
    if iNumAttacchi >= iMaxAttacchi then
      goto fine
    endif
  od
  
  fine:
  ; Crea array finale della dimensione corretta
  iResult[] init iNumAttacchi
  indx = 0
  while indx < iNumAttacchi do
    iResult[indx] = iOutArray[indx]
    indx += 1
  od
  
  xout iResult
endop

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

opcode calcFrequenza, i, iiiiii
    i_Ottava, i_Registro, i_RitmoCorrente, i_TblNum, i_Intervalli, i_Registri xin
        
    ; Calculate octave register
    i_Indice_Ottava = int(i_Ottava * i_Intervalli)
    ; Calculate interval offset within the octave
    i_OffsetIntervallo = i_Indice_Ottava + int(((i_Registro * i_Intervalli) / i_Registri))
    
    ; Get the frequency from the table using the calculated offset
    i_Freq table i_OffsetIntervallo + i_RitmoCorrente, i_TblNum
        
    xout i_Freq
endop
