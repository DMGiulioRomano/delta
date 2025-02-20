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


gi_NUMEVENTI init 100

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
gi_comp_ATTACCO     ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_comp_RITMO_LEN   ftgen 0, 0, gi_NUMEVENTI, -2, 3
gi_comp_RITMO_VAL   ftgen 0, 0, 90000, -2,  4, 5, 3
gi_comp_DURARMONICA ftgen 0, 0, gi_NUMEVENTI, -2, 10
gi_comp_DURATA      ftgen 0, 0, gi_NUMEVENTI, -2, 20.0
gi_comp_AMPIEZZA    ftgen 0, 0, gi_NUMEVENTI, -2, -16
gi_comp_OTTAVA      ftgen 0, 0, gi_NUMEVENTI, -2, 3
gi_comp_REGISTRO    ftgen 0, 0, gi_NUMEVENTI, -2, 4
gi_comp_POSIZIONE   ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_comp_POS_LEN     ftgen 0, 0, gi_NUMEVENTI, -2, 0


; --- COMPORTAMENTO INIZIALE ---
;ritmi
gi_val_ritmi    ftgen 0, 0, gi_init_cond, -2, 
gi_len_ritmi    ftgen 0, 0, gi_init_cond, -2,
;posizioni
gi_val_pos      ftgen 0, 0, gi_init_cond, -2, 2, 3, 4
gi_len_pos      ftgen 0, 0, gi_init_cond, -2, 3
;altri parametri
gi_val_at       ftgen 0, 0, gi_init_cond, -2, 0
gi_val_dur      ftgen 0, 0, gi_init_cond, -2, 
gi_val_durArm   ftgen 0, 0, gi_init_cond, -2, 
gi_val_amp      ftgen 0, 0, gi_init_cond, -2, -16
; questo ha sempre due parametri per volta: ottava, registro
gi_val_freq     ftgen 0, 0, gi_init_cond, -2, 3, 4
gi_len_freq     ftgen 0, 0, gi_init_cond, -2, 2
