
opcode NonlinearFunc, i, i
  iX xin
  ;iPI = 3.14159
  iPI = 4*taninv(1.0)
  iResult = abs(iX*2 * sin(iX * iPI/2 + iX)+ 1/(iX+0.001))
  iResult = round(iResult)
  xout iResult
endop


instr Comportamento
   ; Input parameters
   i_debug= gi_debug
   i_CAttacco = p2
   i_Durata = p3
   i_RitmiTab = p4
   i_DurataArmonica = p5 
   i_Ampiezza = p6
   i_Ottava = p7
   i_Registro = p8
   i_PosTab = p9
   i_IdComp = p10
   $DEBUG_Comp1
   gi_comp_temp_ritmi ftgen 0, 0, ftlen(i_RitmiTab)+100, -2, 0
   i_Ritmi[]        tab2array i_RitmiTab,0, ftlen(i_RitmiTab)-1 
   i_Posizioni[]    tab2array i_PosTab,0, ftlen(i_RitmiTab)-1
   copya2ftab i_Ritmi, gi_comp_temp_ritmi
   ; debug line
   $DEBUG_Comp2
   ; Inizializza indice per i ritmi ciclici
   i_RitmoIndex = 0
   i_LenRitmi = lenarray(i_Ritmi)
   
   ; Per ogni evento sonoro
   i_Index = 0
   i_time = 0
   while i_time < i_Durata do
      ; Calcola il ritmo corrente
      if  i_Index < i_LenRitmi then
         i_RitmoCorrente tab_i i_Index, gi_comp_temp_ritmi 
         ;debug line
         $DEBUG_Comp4
         if i_Index == 0 then
         i_Vecchio_Ritmo = 1
         else
         i_Vecchio_Ritmo tab_i i_Index-1, gi_comp_temp_ritmi 
         endif
      else 
         i_Vecchio_Ritmo tab_i i_Index-1, gi_comp_temp_ritmi
         $DEBUG_Comp5
         i_RitmoCorrente NonlinearFunc i_Vecchio_Ritmo
         ;debug line
         $DEBUG_Comp4
         tabw_i i_RitmoCorrente, i_Index,gi_comp_temp_ritmi
         $DEBUG_Comp3
      endif
      if i_Index == 0 then
         i_Pfield2 = i_CAttacco
      else
      ;!!!
      ; --- arrotondare solo nel print i valori! 
      ;!!!
         iRitmoN = 1/i_Vecchio_Ritmo
         iLast_at tab_i i_Index-1, gi_eve_attacco 
         i_Pfield2 = i_DurataArmonica * iRitmoN + iLast_at
      endif

      ; Calcola ampiezza con smorzamento fisso per ora
      i_Amp = calcAmpiezza(i_Ampiezza, i_RitmoCorrente, -0.05)
      ; Calcola frequenza
      i_Freq1 = calcFrequenza(i_Ottava, i_Registro, i_RitmoCorrente, gi_Intonazione, $INTERVALLI, $REGISTRI)
      i_Freq2 = i_Freq1  ; Per ora uguale, poi si può modificare
      ; Calcola posizione
      i_Pos = int(random:i(0, i_RitmoCorrente))
      ; Durata dell'evento (per ora fissa a 1)
      i_DurEvento = i_DurataArmonica/i_RitmoCorrente
       ; Store in global tables
      tabw_i i_Pfield2,             gi_Index, gi_eve_attacco
      tabw_i i_DurEvento,           gi_Index, gi_eve_durata  
      tabw_i i_Amp,                 gi_Index, gi_eve_ampiezza
      tabw_i i_Freq1,               gi_Index, gi_eve_frequenza1
      tabw_i i_Freq2,               gi_Index, gi_eve_frequenza2 
      tabw_i i_Pos,                 gi_Index, gi_eve_posizione
      tabw_i i_RitmoCorrente,       gi_Index, gi_eve_hr
      tabw_i i_Freq2,               gi_Index, gi_eve_ifn
      ; debug line for i_Amp, i_Freq1, i_Freq2, i_DurEvento, gi_eve_posizione
      $DEBUG_Comp6
      ; Schedule evento sonoro
      schedule "eventoSonoro", i_Pfield2, i_DurEvento, i_Amp, i_Freq1, tab_i(gi_Index,gi_eve_posizione), tab_i(gi_Index,gi_eve_hr), i_Freq2, 2, gi_Index, i_IdComp
       
      ; Aggiorna indici 
      i_RitmoIndex += 1
      i_Index += 1
      gi_Index += 1
      i_time = i_Pfield2 + i_DurEvento
   od
   i_tmp_res system_i 1, "mkdir -p ./docs/tablesData", 0
   Snd sprintf "docs/tablesData/comp%d.table", i_IdComp
   ftsave Snd, 1, gi_comp_ATTACCO, gi_comp_RITMO_VAL, gi_comp_DURARMONICA, gi_comp_DURATA, gi_comp_AMPIEZZA, gi_comp_OTTAVA, gi_comp_REGISTRO, gi_comp_POSIZIONE
   Scmd sprintf "python3.11 docs/plot.py %s", Snd
   i_tmp_res system_i 1, Scmd, 0
endin
