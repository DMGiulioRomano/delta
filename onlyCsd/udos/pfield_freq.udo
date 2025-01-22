; UDO per calcolare la frequenza dato ottava e registro
opcode calcFrequenza, i, iii
  iOttava, iRegione, iRitmo xin
  
  ; Parametri del sistema
  iIntervalli = 12        ; Numero di intervalli per ottava (sistema pitagorico semplificato)
  iNDottava = 4          ; Divisioni per ottava
  iFondamentale = 32     ; Frequenza fondamentale di partenza
  
  ; Calcola il registro dell'ottava
  iRegistroOttava = int(iOttava * iIntervalli)
  
  ; Calcola l'offset dell'intervallo
  iOffsetIntervallo = iRegistroOttava + int(((iRegione * iIntervalli) / iNDottava) - (iIntervalli / iNDottava))
  
  ; Calcola la frequenza finale usando rapporti pitagorici semplificati
  iFreq = iFondamentale * (2 ^ (iOffsetIntervallo / iIntervalli))
  
  ; Modula per il ritmo (simile al cycledF % len)
  iFreqMod = iFreq * (1 + (iRitmo % 5) * 0.02)  ; Aggiungiamo una piccola variazione basata sul ritmo
  
  xout iFreqMod
endop
