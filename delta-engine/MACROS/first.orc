; indice che rappresenta eventi sonori nelle tabelle globali per scrittura dati.
;===============================
gi_Index init 0
gi_init_cond init 10

;===============================
; --- CONSTANTS ---
#define SQRT2 #1.4142135623730951# ; sqrt(2) for normalization
#define MAX_AMP #0.999# ; Maximum amplitude to prevent clipping

;===============================
; --- MACRO DELLO SPAZIO ---
#define FONDAMENTALE    #32#      
#define OTTAVE          #10#      
#define INTERVALLI      #200#      
#define REGISTRI        #10#


;===============================
; Sistema di intonazione
gi_Intonazione ftgen 0, 0, 2001, -2, 0

;===============================
gi_NUMEVENTI init 1000
gi_NUMComportamenti init 100

;===============================
; Inizializzazione delle tabelle per lo storico degli eventi
gi_eve_attacco    ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_durata     ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_ampiezza   ftgen 0, 0, gi_NUMEVENTI, -2, 0    
gi_eve_frequenza1 ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_frequenza2 ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_posizione  ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_hr         ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_ifn        ftgen 0, 0, gi_NUMEVENTI, -2, 0
gi_eve_comportamento ftgen 0, 0, gi_NUMEVENTI, -2, 0  ; Per memorizzare id_comp
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

;===============================
; Inizializzazione tabelle per l'analisi della sovrapposizione
gi_analysis_buffer_size = 100000  ; Grande buffer per rendering offline
gi_analysis_active_events ftgen 0, 0, gi_analysis_buffer_size, -2, 0
gi_analysis_timepoints ftgen 0, 0, gi_analysis_buffer_size, -2, 0
gk_analysis_index init 0
gk_current_overlap init 1      ; Livello di sovrapposizione attuale

;===============================
gi_memory_resolution = 1  ; Risoluzione in secondi per la memoria compositiva
gi_memory_duration = 480  ; Durata massima della composizione in secondi
gi_memory_size = gi_memory_duration / gi_memory_resolution  ; Dimensione della tabella di memoria

; Tabelle per memorizzare la storia compositiva
gi_memory_overlap ftgen 0, 0, gi_memory_size, -2, 0  ; Sovrapposizione nel tempo
gi_memory_events ftgen 0, 0, gi_memory_size, -2, 0   ; Numero di eventi attivi nel tempo

;===============================
; Tabelle per tracciamento armonico
gi_active_octaves ftgen 0, 0, $OTTAVE, -2, 0    ; Conteggio eventi attivi per ottava
gi_active_registers ftgen 0, 0, $REGISTRI, -2, 0  ; Conteggio eventi attivi per registro
gi_octave_register_matrix ftgen 0, 0, $OTTAVE * $REGISTRI, -2, 0  ; Matrice ottava/registro

; Tabelle per storia armonica 
gi_memory_harmonic_density ftgen 0, 0, gi_memory_size, -2, 0  ; Densità armonica nel tempo
gi_memory_octave_spread ftgen 0, 0, gi_memory_size, -2, 0  ; Dispersione delle ottave
gi_memory_spectral_centroid ftgen 0, 0, gi_memory_size, -2, 0  ; Centroide spettrale
; Tabella per tracciamento armonico cumulativo
gi_cumulative_octave_register_matrix ftgen 0, 0, $OTTAVE * $REGISTRI, -2, 0  ; Matrice cumulativa ottava/registro

; Variabili globali per tracciamento corrente
gk_current_harmonic_density init 0   ; Densità armonica corrente
gk_current_octave_spread init 0      ; Dispersione ottave corrente
gk_current_spectral_centroid init 0  ; Centroide spettrale corrente

