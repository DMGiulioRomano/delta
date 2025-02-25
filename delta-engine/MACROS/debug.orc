#define DEBUG_Generatore # 
    if i_Res == 1 then
        if i_debug == 3 then
            prints "%d %d %d %d %d %d %d %d\n",i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp,  i_Oct, i_Reg, gi_temp_pos
        endif
    endif
    if i_debug == 3 then
        ftprint gi_Intonazione
    endif#

#define DEBUG_Comp1 #
   if i_debug == 1 || i_debug == 2 then
      prints "\n\t\t=========================================\n"
      prints "\t\t\tdentro comportamento %d\n", i_IdComp
   endif#

#define DEBUG_Comp2 #
   if i_debug == 2 then
      prints "\n\t\t\tRitmi (Array copiato)\n"
      printarray i_Ritmi
      prints "---------------------"
      prints "\n\t\t\tRitmi tabella\n"
      ftprint gi_comp_temp_ritmi, 1, 0, gi_Index+1
      prints "---------------------"
      prints "\n\t\t\tPosizioni\n"
      printarray i_Posizioni
      prints "---------------------"
      prints "\n"
   endif#

#define DEBUG_Comp3 #
   if i_debug == 3 then
      prints "\t\t---------------------"
      prints "\n\t\t\tRitmi tabella\n per gi_Index = %d\n", gi_Index
      ftprint gi_comp_temp_ritmi, 1, 0, gi_Index+1
   endif#

#define DEBUG_Comp4 #
   if i_debug == 3 then
      prints "___\nritmo corrente: %d\nad index:%d\n",i_RitmoCorrente,i_Index
   endif#

#define DEBUG_Comp5 #
   if i_debug == 3 then
      prints "___\nvecchio ritmo: %d\nad index:%d\n",i_Vecchio_Ritmo,i_Index
   endif#


#define DEBUG_Comp6 #
      if i_debug == 3 then 
         prints "___\nad attacco:%f\nampiezza: %f\nfrequenza: %f\ndurata evento:%f\nposizione:%d\n\n", i_time, round3(i_Amp), round3(i_Freq1), round3(i_DurEvento), i_Pos
         ftprint gi_eve_posizione, 1, 0, gi_Index+1
      endif#

#define DEBUG_CompEND #
   if i_debug == 1 || i_debug == 2 || i_debug ==3 || i_debug == 4 then
      ; Print useful debug info
      prints "\tComportamento %d completed.\n\tGenerated %d events.\n", i_IdComp, i_Index
      prints "=========================================\n\n"
   endif#

#define DEBUG_Evento1 #
    if i_debug == 1 || i_debug == 2 then
        prints "\n\t\t\tevento sonoro %d del comportamento %d",id_evento, id_comportamento
        prints "\n\t\t\t\tattacco: %f\n\t\t\t\tdurata: %f\n\t\t\t\tamp: %f\n\t\t\t\tfreq1: %f\n\t\t\t\twz: %f\n\t\t\t\tdir: %f\n\t\t\t\tHR: %f\n\t\t\t\tfreq2: %f\n\t\t\t\tifn: %f\n\t\t\t\tid_evento: %f\n\n", p2, p3, p4, p5, p6, signum(p6),p7, p8, p9, p10    
        fprints "sco.sco", "\n%f\t\t%f\t\t%f\t\t%f\t\t %f\t\t%f\t\t%f\t\t%f\t\t%f\t\t%f", p2, p3, p4, p5, p6, p7, p8, p9, p10    
    endif#

#define DEBUG_Evento2 #
    ktim timeinsts				;read time 
    if i_debug == 4 then
      printks "\ninviluppo: %f della funzione: %d instr: %d, tempo: %f\n", 0.5, kEnv, ifn, id_evento, ktim 
    endif#
