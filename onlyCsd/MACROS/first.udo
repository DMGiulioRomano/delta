
; --- COMPORTAMENTO INIZIALE ---
#define INIT_C_ATTACCO   #0.0#      
#define INIT_DUR_ARM     #26.0#
#define initRitmo#999#
gi_ritmi ftgen $initRitmo,          0, 4, -2, 3, 4, 5
#define INIT_DURATA      #13.0#   
#define INIT_AMPIEZZA    #-20.0#  
#define INIT_FREQ_OCT    #5#      
#define INIT_FREQ_REG    #1#      
#define initPosizione#9999#
gi_posizioni ftgen $initPosizione,  0, 4, -2, 2, 3, 4

; --- MACRO DELLO SPAZIO ---
#define FONDAMENTALE    #32#      
#define OTTAVE          #10#      
#define INTERVALLI      #200#      
#define REGISTRI        #200#      
#define TABELLAF        #1000#      




; Sistema di intonazione
giIntonazione ftgen 0, 0, 2001, -2, 0
; Inizializzazione delle tabelle per lo storico degli eventi
giTAB_attacco    ftgen 0, 0, 10000, -2, 0    ; cAttacco
giTAB_durata     ftgen 0, 0, 10000, -2, 0    ; durata
giTAB_ampiezza   ftgen 0, 0, 10000, -2, 0    ; ampiezza
giTAB_frequenza1 ftgen 0, 0, 10000, -2, 0
giTAB_frequenza2 ftgen 0, 0, 10000, -2, 0
giTAB_posizione  ftgen 0, 0, 10000, -2, 0
giTAB_hr         ftgen 0, 0, 10000, -2, 0
giTAB_ifn        ftgen 0, 0, 10000, -2, 0
; Inizializzazione delle tabelle per lo storico dei comportamenti
gitab_ATTACCO     ftgen 0, 0, 10000, -2, 0
gitab_RITMO_LEN   ftgen 0, 0, 10000, -2, 0
gitab_RITMO_VAL   ftgen 0, 0, 90000, -2, 0
gitab_DURARMONICA ftgen 0, 0, 10000, -2, 0
gitab_DURATA      ftgen 0, 0, 10000, -2, 0
gitab_AMPIEZZA    ftgen 0, 0, 10000, -2, 0
gitab_OTTAVA      ftgen 0, 0, 10000, -2, 0
gitab_REGISTRO    ftgen 0, 0, 10000, -2, 0
gitab_POSIZIONE   ftgen 0, 0, 10000, -2, 0

