

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

