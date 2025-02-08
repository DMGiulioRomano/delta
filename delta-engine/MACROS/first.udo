gi_Index init 0

; --- COMPORTAMENTO INIZIALE ---
;ritmi
gi_val_ritmi    ftgen 0, 0, 10000, -2, -3, 4, 5
gi_len_ritmi    ftgen 0, 0, 10000, -2, 3
;posizioni
gi_val_pos      ftgen 0, 0, 10000, -2, 2, 3, 4
gi_len_pos      ftgen 0, 0, 10000, -2, 3
;altri parametri
gi_val_at       ftgen 0, 0, 10000, -2, 0
gi_val_dur      ftgen 0, 0, 10000, -2, 13.0
gi_val_durArm   ftgen 0, 0, 10000, -2, 26
gi_val_amp      ftgen 0, 0, 10000, -2, -16
; questo ha sempre due parametri per volta: ottava, registro
gi_val_freq     ftgen 0, 0, 10000, -2, 3, 4
gi_len_freq     ftgen 0, 0, 10000, -2, 2

; --- MACRO DELLO SPAZIO ---
#define FONDAMENTALE    #32#      
#define OTTAVE          #10#      
#define INTERVALLI      #200#      
#define REGISTRI        #10#      



; Sistema di intonazione
gi_Intonazione ftgen 0, 0, 2001, -2, 0
; Inizializzazione delle tabelle per lo storico degli eventi
gi_TAB_attacco    ftgen 0, 0, 10000, -2, 0    
gi_TAB_durata     ftgen 0, 0, 10000, -2, 0    
gi_TAB_ampiezza   ftgen 0, 0, 10000, -2, 0    
gi_TAB_frequenza1 ftgen 0, 0, 10000, -2, 0
gi_TAB_frequenza2 ftgen 0, 0, 10000, -2, 0
gi_TAB_posizione  ftgen 0, 0, 10000, -2, 0
gi_TAB_hr         ftgen 0, 0, 10000, -2, 0
gi_TAB_ifn        ftgen 0, 0, 10000, -2, 0
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


