#define DEBUG_Generatore # 
   if int(i_debug) >= 5 then
      ftprint gi_Intonazione
   endif#

#define DEBUG_Comp1 #
   if int(i_debug) >= 1 then
      prints "\n\t\t=========================================\n"
      prints "\t\t\tdentro comportamento %d\n", i_IdComp
   endif#

#define DEBUG_Comp4 #
   if int(i_debug) >= 4 then
      prints "___\nritmo corrente: %d\nad index:%d\n",i_RitmoCorrente,i_EventIdx
   endif#

#define DEBUG_Comp5 #
   if int(i_debug) >= 4 then
      prints "___\nvecchio ritmo: %d\nad index:%d\n",i_Vecchio_Ritmo,i_EventIdx
   endif#

#define DEBUG_CompEND #
   if int(i_debug) >= 1 then
      ; Print useful debug info
      prints "\tComportamento %d completed.\n\tGenerated %d events.\n", i_IdComp, i_EventIdx
      prints "=========================================\n\n"
   endif#

#define DEBUG_Evento_print_Pfields #
   if (int(i_debug) >=2) then
      Snamefile sprintf "%sComp%d.sco", gSdirSco, id_comportamento
      prints "\n\t\t\tevento sonoro %d del comportamento %d",id_evento, id_comportamento
      prints "\n\t\t\t\tattacco: %.3f\n\t\t\t\tdurata: %.3f\n\t\t\t\tamp: %.3f\n\t\t\t\tfreq1: %.3f\n\t\t\t\twz: %.3f\n\t\t\t\tdir: %.3f\n\t\t\t\tHR: %.3f\n\t\t\t\tfreq2: %.3f\n\t\t\t\tifn: %.3f\n\t\t\t\tid_evento: %.3f\n\n", p2, p3, p4, p5, p6, signum(p6),p7, p8, p9, p10    
      if (id_evento%100==0) then
      ;fprints Snamefile,"\n\t;\t\t\t\t\t\tattacco:\tdurata:\t\tamp:\t\tfreq1:\t\t\twz:\t\t\tdir:\t\tHR:\t\t\t\tfreq2:\t\tifn:\t\tid_evento:"
      endif
      fprints Snamefile,"\n\n\t;\t\t\t\t\t\tattacco:\tdurata:\t\tamp:\t\tfreq1:\t\t\twz:\t\tHR:\t\tfreq2:\t\t\tifn:\tid_evento:"
      fprints Snamefile,"\n\ti \"eventoSonoro\"\t\t%.3f\t\t%.3f\t\t%.3f\t\t%f\t\t\t%d\t\t%d\t\t%f\t\t\t%d\t\t%d", p2, p3, p4, p5, p6, p7, p8, p9, p10  
      SentireSco sprintf "%sAll.sco", gSdirSco
      fprints SentireSco,"\n\n\t; [comp %d]\t\t\t\tattacco:\tdurata:\t\tamp:\t\tfreq1:\t\t\twz:\t\tHR:\t\tfreq2:\t\t\tifn:\tid_evento:", p11
      fprints SentireSco,"\n\ti \"eventoSonoro\"\t\t%.3f\t\t%.3f\t\t%.3f\t\t%f\t\t%d\t\t%d\t\t%f\t\t%d\t\t%d", p2, p3, p4, p5, p6, p7, p8, p9, p10  
      if iLastStr ==1 then
      fprints Snamefile, "\n;---------------------------"
      endif
   endif#

