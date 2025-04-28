; ===========================================================================
; OPCODE PER GENERAZIONE RITMI VERAMENTE CAOTICI
; ===========================================================================
; Genera valori ritmici con comportamento controllabile dal deterministico al caotico
; Input:
;   iX          - Valore precedente (seme iniziale)
;   iMode       - Modalità di comportamento:
;                 0 = convergente (tende a stabilizzarsi su pochi valori)
;                 1 = periodico (cicla tra pochi valori)
;                 2 = caotico (comportamento irregolare ma con pattern)
;                 3 = caotico vero (completamente imprevedibile ma controllato)
;   iMinVal     - Valore minimo di output (default = 1)
;   iMaxVal     - Valore massimo di output (default = 35)
; Output:
;   iResult     - Nuovo valore ritmico generato (intero tra iMinVal e iMaxVal)
; ===========================================================================
opcode NonlinearFunc, i, ipoo
  iX, iMode, iMinVal, iMaxVal xin
  
  ; Valori di default per min/max se non specificati
  iMinVal = (iMinVal == 0) ? 1 : iMinVal
  iMaxVal = (iMaxVal == 0) ? 35 : iMaxVal
  
  ; Assicurati che iX sia entro limiti sensati
  iX = limit(iX, 1, 100)
  
  ; Pi greco per calcoli trigonometrici
  iPI = 4 * taninv(1.0)  
  
  ; Risultato temporaneo
  iTemp = 0
  
  if iMode == 0 then
    ; ===================================================================
    ; MODALITÀ 0: CONVERGENTE
    ; ===================================================================
    iR = 2.8
    ; Formula logistica con parametri moderati
    iTemp = iR * iX * (1 - iX/40)
    
  elseif iMode == 1 then
    ; ===================================================================
    ; MODALITÀ 1: PERIODICA
    ; ===================================================================
    ; Mappa non lineare che genera cicli prevedibili
    iP1 = sin(iX * iPI/18)
    iP2 = cos(iX * iPI/10)
    iTemp = abs(iP1 * iP2) * 20 + 10
    
  elseif iMode == 2 then
    ; ===================================================================
    ; MODALITÀ 2: CAOTICA DETERMINISTICA
    ; ===================================================================
    ; Mappa logistica in regime caotico
    iR = 3.99
    
    ; Normalizza iX per la mappa logistica
    iNormX = (iX % 100) / 100
    iNormX = limit(iNormX, 0.01, 0.99)  ; Evita i bordi
    
    ; Calcola il prossimo valore con la mappa logistica
    iLogistic = iR * iNormX * (1 - iNormX)
    
    ; Aggiungi una piccola componente di rumore controllato (5%)
    iNoise = random:i(-0.05, 0.05)
    iLogistic = limit(iLogistic + iNoise, 0, 1)
    
    ; Mappa al range di output
    iRange = iMaxVal - iMinVal + 1
    iTemp = iMinVal + (iLogistic * iRange)
    
  else
    ; ===================================================================
    ; MODALITÀ 3: CAOS VERO (STOCASTICO)
    ; ===================================================================
    
    ; Combina determinismo con casualità in proporzioni controllate
    
    ; 1. COMPONENTE DETERMINISTICA (60%)
    ; Utilizzo di una formula caotica complessa
    iSeed1 = (iX * 1.3) % 10
    iSeed2 = (iX * 0.7) % 10
    iSeed3 = (iX * 2.5) % 10
    
    iNonlinear1 = abs(sin(iSeed1 * iPI/5 + iSeed2))
    iNonlinear2 = abs(cos(iSeed2 * iPI/3 + iSeed3))
    iNonlinear3 = abs(tan(iSeed3 * iPI/7 + iSeed1) % 1)
    
    iDeterministic = (iNonlinear1 + iNonlinear2 + iNonlinear3) / 3
    
    ; 2. COMPONENTE CASUALE (40%)
    iRandom = random:i(0, 1)
    
    ; 3. COMBINA LE DUE COMPONENTI
    iMixRatio = 0.6  ; 60% deterministico, 40% casuale
    iCombined = (iDeterministic * iMixRatio) + (iRandom * (1 - iMixRatio))
    
    ; 4. PERTURBAZIONE BASATA SU VALORI PASSATI
    iPerturbation = 0
    if (iX % 7 == 0) then 
      ; Ogni 7 valori, introduci una variazione importante
      iPerturbation = random:i(-0.3, 0.3)
    endif
    
    ; 5. RISULTATO FINALE MAPPATO AL RANGE RICHIESTO
    iRange = iMaxVal - iMinVal + 1
    iTemp = iMinVal + (iCombined * iRange) + (iPerturbation * iRange)
  endif
  
  ; Garantisci che il risultato sia sempre un intero nell'intervallo [iMinVal, iMaxVal]
  iResult = max(iMinVal, min(iMaxVal, round(iTemp)))
  
  xout iResult
endop
