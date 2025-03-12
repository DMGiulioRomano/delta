; ====================================================================
; DELTA-ENGINE: FIRST.ORC
; Inizializzazione del sistema, costanti e variabili globali
; ====================================================================

; --------------------------------------------------------------------
; INDICI E CONTATORI GLOBALI
; --------------------------------------------------------------------
; Indice che rappresenta eventi sonori nelle tabelle globali
gi_Index init 0
; Condizioni iniziali
gi_init_cond init 10

; --------------------------------------------------------------------
; COSTANTI MATEMATICHE E AUDIO
; --------------------------------------------------------------------
#define SQRT2 #1.4142135623730951# ; sqrt(2) per normalizzazione
#define MAX_AMP #0.999# ; Ampiezza massima per prevenire clipping

; --------------------------------------------------------------------
; PARAMETRI DELLO SPAZIO COMPOSITIVO
; --------------------------------------------------------------------
#define FONDAMENTALE    #32#      ; Frequenza fondamentale in Hz
#define OTTAVE          #10#      ; Numero di ottave generate
#define INTERVALLI      #200#     ; Divisioni per ottava
#define REGISTRI        #10#      ; Numero di registri disponibili

; --------------------------------------------------------------------
; SISTEMA DI INTONAZIONE
; --------------------------------------------------------------------
; Tabella per memorizzare le frequenze generate dal sistema pitagorico
gi_Intonazione ftgen 0, 0, 2001, -2, 0

; --------------------------------------------------------------------
; DIMENSIONAMENTO DEL SISTEMA
; --------------------------------------------------------------------
; Numero massimo di eventi e comportamenti
gi_NUMEVENTI init 1000          ; Capacità massima di eventi sonori
gi_NUMComportamenti init 100    ; Capacità massima di comportamenti

; --------------------------------------------------------------------
; TABELLE DEGLI EVENTI SONORI
; --------------------------------------------------------------------
; Queste tabelle memorizzano i parametri di ogni evento generato dallo strumento "Comportamento"
; e vengono utilizzate da "eventoSonoro" per la sintesi sonora e da "Analizzatore" per
; monitorare l'evoluzione della composizione.
;
gi_eve_attacco    ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Tempo di attacco
gi_eve_durata     ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Durata dell'evento
gi_eve_ampiezza   ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Ampiezza in dB
gi_eve_frequenza1 ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Frequenza iniziale
gi_eve_frequenza2 ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Frequenza finale
gi_eve_posizione  ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Posizione spaziale
gi_eve_hr         ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Harmonic ratio
gi_eve_ifn        ftgen 0, 0, gi_NUMEVENTI, -2, 0     ; Indice di funzione
gi_eve_comportamento ftgen 0, 0, gi_NUMEVENTI, -2, 0  ; ID del comportamento

; --------------------------------------------------------------------
; TABELLE DEI COMPORTAMENTI
; --------------------------------------------------------------------
; Queste tabelle sono utilizzate dallo strumento "GeneraComportamenti" per definire
; i parametri che guidano la generazione degli eventi sonori. I valori vengono
; manipolati in base al sistema di transizione di stato per creare un'evoluzione
; compositiva coerente.
;
gi_comp_ATTACCO     ftgen 0, 0, gi_NUMComportamenti, -2, 0       ; Tempo di attacco
gi_comp_RITMO_LEN   ftgen 0, 0, gi_NUMComportamenti, -2, 3       ; Lunghezza array ritmi
gi_comp_RITMO_VAL   ftgen 0, 0, gi_NUMComportamenti*5, -2, 4,5,3 ; Valori ritmici
gi_comp_DURARMONICA ftgen 0, 0, gi_NUMComportamenti, -2, 10      ; Durata armonica
gi_comp_DURATA      ftgen 0, 0, gi_NUMComportamenti, -2, 20.0    ; Durata complessiva
gi_comp_AMPIEZZA    ftgen 0, 0, gi_NUMComportamenti, -2, -20     ; Ampiezza in dB
gi_comp_OTTAVA      ftgen 0, 0, gi_NUMComportamenti, -2, 3       ; Ottava
gi_comp_REGISTRO    ftgen 0, 0, gi_NUMComportamenti, -2, 4       ; Registro
gi_comp_POS_LEN     ftgen 0, 0, gi_NUMComportamenti, -2, 3       ; Lunghezza array posizioni
gi_comp_POSIZIONE   ftgen 0, 0, gi_NUMComportamenti*5, -2, 0,0,0 ; Valori posizioni

; --------------------------------------------------------------------
; SISTEMA DI ANALISI DELLA SOVRAPPOSIZIONE
; --------------------------------------------------------------------
; Questo sistema alimenta l'analisi in tempo reale dello strumento "Analizzatore".
; I dati raccolti influenzano la generazione dei nuovi eventi in "Comportamento" e
; costituiscono la base per le visualizzazioni generate da "AnalisiFinale".
;
gi_analysis_buffer_size = 100000  ; Dimensione buffer per rendering offline
gi_analysis_active_events ftgen 0, 0, gi_analysis_buffer_size, -2, 0  ; Eventi attivi
gi_analysis_timepoints ftgen 0, 0, gi_analysis_buffer_size, -2, 0     ; Tempi di analisi
gk_analysis_index init 0          ; Indice corrente nel buffer
gk_current_overlap init 1         ; Livello di sovrapposizione attuale

; --------------------------------------------------------------------
; MEMORIA COMPOSITIVA
; --------------------------------------------------------------------
; Questo sistema è utilizzato da "Analizzatore" per memorizzare la storia compositiva
; e da "Comportamento" per consultare il passato recente e adattare i nuovi eventi.
; "AnalisiFinale" lo utilizza per generare visualizzazioni dell'evoluzione temporale.
;
gi_memory_resolution = 1          ; Risoluzione in secondi
gi_memory_duration = 480          ; Durata massima in secondi
gi_memory_size = gi_memory_duration / gi_memory_resolution  ; Dimensione tabella

; Tabelle per la memoria compositiva
gi_memory_overlap ftgen 0, 0, gi_memory_size, -2, 0  ; Sovrapposizione nel tempo
gi_memory_events ftgen 0, 0, gi_memory_size, -2, 0   ; Numero eventi attivi

; --------------------------------------------------------------------
; SISTEMA DI TRACCIAMENTO ARMONICO
; --------------------------------------------------------------------
; Questo sistema è utilizzato da "Analizzatore" per monitorare la distribuzione
; armonica degli eventi attivi. "Comportamento" consulta queste informazioni per
; equilibrare lo spettro armonico e "AnalisiFinale" le elabora per le visualizzazioni.
;
gi_active_octaves ftgen 0, 0, $OTTAVE, -2, 0        ; Eventi per ottava
gi_active_registers ftgen 0, 0, $REGISTRI, -2, 0    ; Eventi per registro
gi_octave_register_matrix ftgen 0, 0, $OTTAVE * $REGISTRI, -2, 0  ; Matrice ottava/registro

; Memoria storica armonica utilizzata per tracciare l'evoluzione armonica nel tempo
gi_memory_harmonic_density ftgen 0, 0, gi_memory_size, -2, 0   ; Densità armonica
gi_memory_octave_spread ftgen 0, 0, gi_memory_size, -2, 0      ; Dispersione ottave
gi_memory_spectral_centroid ftgen 0, 0, gi_memory_size, -2, 0  ; Centroide spettrale
gi_memory_spatial_movement ftgen 0, 0, gi_memory_size, -2, 0   ; Movimento spaziale

; Tracciamento cumulativo per l'analisi statistica globale
gi_cumulative_octave_register_matrix ftgen 0, 0, $OTTAVE * $REGISTRI, -2, 0

; Variabili globali per accesso immediato ai valori correnti
gk_current_harmonic_density init 0    ; Densità armonica corrente
gk_current_octave_spread init 0       ; Dispersione ottave corrente
gk_current_spectral_centroid init 0   ; Centroide spettrale corrente
gk_current_spatial_movement init 0    ; Movimento spaziale corrente

; --------------------------------------------------------------------
; SISTEMA DI CLASSIFICAZIONE DEGLI STATI
; --------------------------------------------------------------------
; Questo sistema è utilizzato dal sistema di transizione di stato implementato tra
; "Analizzatore" e "GeneraComportamenti". Le tabelle di soglie definiscono i confini
; tra diversi stati musicali, mentre le tabelle di storia memorizzano l'evoluzione degli stati.
;
gi_density_thresholds ftgen 0, 0, 4, -2, 0, 3, 7, 999    ; Sparse, Medium, Dense
gi_register_thresholds ftgen 0, 0, 4, -2, 0, 0.3, 0.7, 1 ; Low, Mid, High
gi_movement_thresholds ftgen 0, 0, 4, -2, 0, 0.2, 0.5, 1 ; Static, Moderate, Dynamic

; Sistema di memoria degli stati per il controllo della transizione
gi_state_history_size = 10  ; Quanti stati ricordare
gi_state_history_density ftgen 0, 0, gi_state_history_size, -2, 0   ; Storia densità
gi_state_history_register ftgen 0, 0, gi_state_history_size, -2, 0  ; Storia registro
gi_state_history_movement ftgen 0, 0, gi_state_history_size, -2, 0  ; Storia movimento

; Memoria temporale degli stati per visualizzazione e analisi delle transizioni
gi_memory_state_density ftgen 0, 0, gi_memory_size, -2, 0    ; Stati densità nel tempo
gi_memory_state_register ftgen 0, 0, gi_memory_size, -2, 0   ; Stati registro nel tempo
gi_memory_state_movement ftgen 0, 0, gi_memory_size, -2, 0   ; Stati movimento nel tempo