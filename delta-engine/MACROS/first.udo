; indice che rappresenta eventi sonori nelle tabelle globali per scrittura dati.
gi_Index init 0

gi_init_cond init 10


; --- MACRO DELLO SPAZIO ---
#define FONDAMENTALE    #32#      
#define OTTAVE          #10#      
#define INTERVALLI      #200#      
#define REGISTRI        #10#



; Sistema di intonazione
gi_Intonazione ftgen 0, 0, 2001, -2, 0


gi_NUMEVENTI init 1000
gi_NUMComportamenti init 100

; Inizializzazione delle tabelle per lo storico degli eventi
gi_eve_attacco    ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_durata     ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_ampiezza   ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_frequenza1 ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_frequenza2 ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_posizione  ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_hr         ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_ifn        ftgen 0, 0, gi_NUMEVENTI, -2, 0
; Inizializzazione delle tabelle per lo storico dei comportamenti
gi_comp_ATTACCO     ftgen 0, 0, gi_NUMComportamenti, -2, 0
gi_comp_RITMO_LEN   ftgen 0, 0, gi_NUMComportamenti, -2, 3
gi_comp_RITMO_VAL   ftgen 0, 0, gi_NUMComportamenti*5, -2,  4, 5, 3
gi_comp_DURARMONICA ftgen 0, 0, gi_NUMComportamenti, -2, 10
gi_comp_DURATA      ftgen 0, 0, gi_NUMComportamenti, -2, 20.0
gi_comp_AMPIEZZA    ftgen 0, 0, gi_NUMComportamenti, -2, -20
gi_comp_OTTAVA      ftgen 0, 0, gi_NUMComportamenti, -2, 3
gi_comp_REGISTRO    ftgen 0, 0, gi_NUMComportamenti, -2, 4
gi_comp_POS_LEN     ftgen 0, 0, gi_NUMComportamenti, -2, 3
gi_comp_POSIZIONE   ftgen 0, 0, gi_NUMComportamenti*5, -2, 0,0,0
