
instr Comportamento
   ; Input parameters
   i_debug= 1;gi_debug
   i_CAttacco = p2
   i_Durata = p3
   i_RitmiTab = p4
   i_DurataArmonica = p5 
   i_Ampiezza = p6
   i_Ottava = p7
   i_Registro = p8
   i_PosTab = p9
   i_IdComp = p10

   ; Get ritmi and posizioni arrays
   
   i_Ritmi[]        leggiTabArray 0, ftlen(i_RitmiTab)-1, i_RitmiTab
   i_Posizioni[]    leggiTabArray 0, ftlen(i_RitmiTab)-1, i_PosTab
   
   ; Calcola gli attacchi (pfield2)
   i_Pfield2[] calcPfield2 i_CAttacco, i_DurataArmonica, i_Durata, i_Ritmi
   i_NumEventi = lenarray(i_Pfield2)

   if i_debug == 1 || i_debug == 2 then
      prints "\n=========================================\n"
      prints "\tdentro comportamento %d\n", i_IdComp
      prints "\n\tRitmi\n"
      printarray i_Ritmi
      prints "---------------------"
      prints "\n\tPosizioni\n"
      printarray i_Posizioni
      prints "---------------------"
      prints "\n\tPfield2\n"
      printarray i_Pfield2
      prints "---------------------"
      prints "\n"
   endif

   ; Inizializza indice per i ritmi ciclici
   i_RitmoIndex = 0
   i_LenRitmi = lenarray(i_Ritmi)
   
   ; Per ogni evento sonoro
   i_Index = 0
   while i_Index < i_NumEventi do
      ; Calcola il ritmo corrente
      i_RitmoCorrente = i_Ritmi[i_RitmoIndex % i_LenRitmi]
       
      ; Calcola ampiezza con smorzamento fisso per ora
      i_Amp = calcAmpiezza(i_Ampiezza, i_RitmoCorrente, -0.05)
       
      ; Calcola frequenza
      i_Freq1 = calcFrequenza(i_Ottava, i_Registro, i_RitmoCorrente, gi_Intonazione, $INTERVALLI, $REGISTRI)
      if i_debug == 2 then 
         prints "\nampiezza: %f\nfrequenza: %f\n", i_Amp, i_Freq1
      endif
      i_Freq2 = i_Freq1  ; Per ora uguale, poi si può modificare
       
      ; Calcola posizione
      i_PosVal = i_Posizioni[i_Index % lenarray(i_Posizioni)]
      i_Pos = i_RitmoCorrente * signum(i_PosVal)
    
      ; Durata dell'evento (per ora fissa a 1)
      i_DurEvento = i_DurataArmonica/i_RitmoCorrente
      if i_debug == 2 then
         prints "\t\t\tdurata evento\n%f\n", i_DurEvento
      endif
       ; Store in global tables
      tabw_i i_Pfield2[i_Index],    gi_Index, gi_eve_attacco
      tabw_i i_DurEvento,          gi_Index, gi_eve_durata  
      tabw_i i_Amp,                gi_Index, gi_eve_ampiezza
      tabw_i i_Freq1,              gi_Index, gi_eve_frequenza1
      tabw_i i_Freq2,              gi_Index, gi_eve_frequenza2 
      tabw_i i_Pos,                gi_Index, gi_eve_posizione
      tabw_i i_RitmoCorrente,      gi_Index, gi_eve_hr
      tabw_i i_Freq2,              gi_Index, gi_eve_ifn

      ; Schedule evento sonoro
      schedule "eventoSonoro", i_Pfield2[i_Index], i_DurEvento, i_Amp, i_Freq1, i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index
       
      ; Aggiorna indici 
      i_RitmoIndex += 1
      i_Index += 1
      gi_Index += 1
   od
   if i_debug == 1 || i_debug == 2 then
      ; Print useful debug info
      prints "\tComportamento %d completed.\n\tGenerated %d events.\n", i_IdComp, i_NumEventi
      prints "=========================================\n\n"
   endif
endin
