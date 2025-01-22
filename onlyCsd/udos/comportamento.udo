; UDO principale per gestire il comportamento
opcode GenComportamento, 0, iiiiiiii[]i[]i
    ; Input parameters
    iIdComp, iCAttacco, iDurataArmonica, iDurata, iAmpiezza, iOttava, iRegistro, iRitmi[], iPosizioni[], iTabNum xin
    
    ; Calcola gli attacchi (pfield2)
    iPfield2[] calcPfield2 iCAttacco, iDurataArmonica, iDurata, iRitmi
    iNumEventi = lenarray(iPfield2)
    
    ; Inizializza indice per i ritmi ciclici
    iRitmoIndex = 0
    iLenRitmi = lenarray(iRitmi)
    
    ; Per ogni evento sonoro
    iIndex = 0
    while iIndex < iNumEventi do
        ; Calcola il ritmo corrente
        iRitmoCorrente = iRitmi[iRitmoIndex % iLenRitmi]
        
        ; Calcola ampiezza con smorzamento fisso per ora
        iAmp = calcAmpiezza(iAmpiezza, iRitmoCorrente, -0.05)
        
        ; Calcola frequenza
        iFreq1 = calcFrequenza(iOttava, iRegistro, iRitmoCorrente)
        iFreq2 = iFreq1  ; Per ora uguale, poi si può modificare
        
        ; Calcola posizione
        iPosVal = iPosizioni[iIndex % lenarray(iPosizioni)]
        iPos = iRitmoCorrente * signum(iPosVal)
        
        ; Durata dell'evento (per ora fissa a 1)
        iDurEvento = iDurata
        
        
        ; Schedula l'evento sonoro
        schedule "eventoSonoro", iPfield2[iIndex], iDurEvento, iAmp, iFreq1, iPos, iRitmoCorrente, iFreq2, iTabNum
        
        ; Aggiorna indici
        iRitmoIndex += 1
        iIndex += 1
    od
endop