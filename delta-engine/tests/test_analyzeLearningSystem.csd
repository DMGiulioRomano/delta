
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Imposta livello di debug
gi_debug init 2

;-------------------------------------------------------------------------
; VARIABILI GLOBALI NECESSARIE PER IL SISTEMA DI APPRENDIMENTO ADATTIVO
;-------------------------------------------------------------------------

; Stato corrente del sistema
gi_current_overlap init 5              ; Numero di eventi sovrapposti
gi_current_harmonic_density init 0.3   ; Densità armonica corrente
gi_current_octave_spread init 0.5      ; Diffusione ottava corrente
gi_current_spectral_centroid init 4    ; Centroide spettrale corrente
gi_current_spatial_movement init 0.6   ; Movimento spaziale corrente

; Sistema di memoria per stati
gi_memory_size init 480                ; Dimensione tabella di memoria
gi_memory_resolution init 1            ; Risoluzione in secondi
gi_memory_harmonic_density ftgen 0, 0, 480, -2, 0   ; Densità armonica
gi_memory_octave_spread ftgen 0, 0, 480, -2, 0      ; Diffusione ottava
gi_memory_spectral_centroid ftgen 0, 0, 480, -2, 0  ; Centroide spettrale
gi_memory_spatial_movement ftgen 0, 0, 480, -2, 0   ; Movimento spaziale

; Variabili del sistema di transizione
gi_tc_source_density init 1            ; Stato di densità sorgente (0,1,2)
gi_tc_source_register init 0           ; Stato di registro sorgente (0,1,2)
gi_tc_source_movement init 2           ; Stato di movimento sorgente (0,1,2)

gi_tc_target_density init 2            ; Stato di densità destinazione
gi_tc_target_register init 1           ; Stato di registro destinazione
gi_tc_target_movement init 1           ; Stato di movimento destinazione

gi_tc_current_density init 1           ; Stato di densità corrente
gi_tc_current_register init 0          ; Stato di registro corrente
gi_tc_current_movement init 2          ; Stato di movimento corrente

gi_tc_transition_active init 0         ; Flag per transizione attiva
gi_tc_transition_count init 12         ; Contatore di transizioni completate
gi_tc_transition_quality init 0.75     ; Qualità dell'ultima transizione

; Sistema di apprendimento adattivo
gi_asp_transition_history ftgen 0, 0, 700, -2, 0   ; 100 transizioni × 7 valori
gi_asp_context_features ftgen 0, 0, 5, -2, 0       ; 4 caratteristiche di contesto + spazio extra
gi_asp_history_index init 0                         ; Indice corrente nel buffer circolare
gi_asp_transition_count init 0                      ; Numero totale di transizioni registrate
gi_asp_learning_rate init 0.1                       ; Tasso di apprendimento
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0      ; Matrice di transizione completa
gi_asp_max_overlap init 20                          ; Limite massimo di sovrapposizione

;-------------------------------------------------------------------------
; DEFINIZIONE DELLE FUNZIONI UTILIZZATE DALL'UDO
;-------------------------------------------------------------------------
#include "../udos/adaptiveStatePrediction.udo"
#include "../udos/asp_analyzeLearningState.udo"

; Strumento per inizializzare i dati di test
instr 1 
    prints "\n=== Inizializzazione dati di test ===\n"
    
    ; Crea directory per i file di output
    iRes system_i 1, "mkdir -p ./docs/analysis", 0
    
    ; Imposta conteggio transizioni esistenti e inizializza correttamente TUTTE le transizioni
    gi_asp_transition_count = 5  ; Ora usiamo solo le transizioni effettivamente create
    
    ; IMPORTANTE: Azzeriamo tutte le posizioni per garantire che non ci sia "spazzatura"
    iIdx = 0
    while (iIdx < 700) do 
        tabw_i 0, iIdx, gi_asp_transition_history
        iIdx += 1
    od
    
    ; Prepariamo dati di test controllati
    
    ; Transizione 1: alta qualità (0.90)
    iIdx = 0 * 7  ; Prima posizione nel buffer
    tabw_i 3, iIdx, gi_asp_transition_history     ; Stato 3 (sorgente)
    tabw_i 7, iIdx+1, gi_asp_transition_history   ; Stato 7 (destinazione)
    tabw_i 0.90, iIdx+2, gi_asp_transition_history ; Qualità
    tabw_i 0.5, iIdx+3, gi_asp_transition_history ; Overlap
    tabw_i 0.3, iIdx+4, gi_asp_transition_history ; Spread
    tabw_i 0.4, iIdx+5, gi_asp_transition_history ; Centroid
    tabw_i 0.6, iIdx+6, gi_asp_transition_history ; Movement
    
    ; Transizione 2: alta qualità (0.85)
    iIdx = 1 * 7  ; Seconda posizione
    tabw_i 3, iIdx, gi_asp_transition_history     ; Stesso stato sorgente
    tabw_i 7, iIdx+1, gi_asp_transition_history   ; Stessa destinazione (per testare conteggio più frequente)
    tabw_i 0.85, iIdx+2, gi_asp_transition_history
    tabw_i 0.55, iIdx+3, gi_asp_transition_history
    tabw_i 0.35, iIdx+4, gi_asp_transition_history
    tabw_i 0.45, iIdx+5, gi_asp_transition_history
    tabw_i 0.65, iIdx+6, gi_asp_transition_history
    
    ; Transizione 3: media qualità (0.65)
    iIdx = 2 * 7
    tabw_i 4, iIdx, gi_asp_transition_history
    tabw_i 9, iIdx+1, gi_asp_transition_history
    tabw_i 0.65, iIdx+2, gi_asp_transition_history
    tabw_i 0.45, iIdx+3, gi_asp_transition_history
    tabw_i 0.25, iIdx+4, gi_asp_transition_history
    tabw_i 0.35, iIdx+5, gi_asp_transition_history
    tabw_i 0.55, iIdx+6, gi_asp_transition_history
    
    ; Transizione 4: bassa qualità (0.30)
    iIdx = 3 * 7
    tabw_i 8, iIdx, gi_asp_transition_history
    tabw_i 2, iIdx+1, gi_asp_transition_history
    tabw_i 0.30, iIdx+2, gi_asp_transition_history
    tabw_i 0.7, iIdx+3, gi_asp_transition_history
    tabw_i 0.4, iIdx+4, gi_asp_transition_history
    tabw_i 0.5, iIdx+5, gi_asp_transition_history
    tabw_i 0.3, iIdx+6, gi_asp_transition_history
    
    ; Transizione 5: alta qualità (0.82)
    iIdx = 4 * 7
    tabw_i 3, iIdx, gi_asp_transition_history     ; Stessa coppia frequente
    tabw_i 7, iIdx+1, gi_asp_transition_history   ; Per verificare il conteggio
    tabw_i 0.82, iIdx+2, gi_asp_transition_history
    tabw_i 0.6, iIdx+3, gi_asp_transition_history
    tabw_i 0.3, iIdx+4, gi_asp_transition_history
    tabw_i 0.5, iIdx+5, gi_asp_transition_history
    tabw_i 0.4, iIdx+6, gi_asp_transition_history
    
    ; Impostiamo l'indice corrente dopo i dati di test
    gi_asp_history_index = 5
    
    ; Imposta il contesto attuale
    tabw_i 0.6, 0, gi_asp_context_features  ; Overlap
    tabw_i 0.4, 1, gi_asp_context_features  ; Spread
    tabw_i 0.5, 2, gi_asp_context_features  ; Centroid
    tabw_i 0.7, 3, gi_asp_context_features  ; Movement
    
    prints "Dati di test inizializzati con %d transizioni\n", gi_asp_transition_count
    prints "Buffer di transizione contiene %d esempi\n", gi_asp_history_index
    
    ; Chiama l'UDO da testare
    event_i "i", 2, 0.1, 0.1
endin

; Strumento per testare analyzeLearningSystem
instr 2
    prints "\n=== TEST: analyzeLearningSystem ===\n"
    
    ; Esegui l'opcode da testare
    analyzeLearningSystem 2  ; Livello di debug 2
    
    ; Verifica l'output atteso - CORRETTO LA FORMATTAZIONE DELLE PERCENTUALI
    prints "\n=== VERIFICA OUTPUT ===\n"
    prints "Risultati attesi:\n"
    prints "- Transizioni totali registrate: 5\n"
    prints "- Transizioni ad alta qualità (>=0.8): 3 (60.0%%)\n"
    prints "- Transizioni a media qualità: 1 (20.0%%)\n"
    prints "- Transizioni a bassa qualità (<=0.4): 1 (20.0%%)\n"
    prints "- Qualità media: circa 0.704\n"
    prints "- Transizione più comune: dal 3 al 7 (3 volte)\n"
    prints "\nControlla che l'output sopra sia coerente con i risultati attesi.\n"
    prints "Un file CSV dovrebbe essere stato creato in: docs/analysis/learning_statistics.csv\n"
    
    ; Verifica l'esistenza del file CSV
    iFileExists system_i 1, "test -e docs/analysis/learning_statistics.csv && echo 'File CSV creato correttamente' || echo 'ERRORE: File CSV non trovato!'", 0
endin

; Strumento bonus: test di una registrazione transizione
instr 3
    prints "\n=== BONUS: Registrazione di una nuova transizione ===\n"
    
    ; Registra una nuova transizione
    recordTransition 10, 15, 0.75, 2
    
    ; Analizza di nuovo per verificare l'aggiornamento
    analyzeLearningSystem 2
    
    prints "\nVerifica che la nuova transizione sia stata conteggiata.\n"
    prints "Ora dovrebbero esserci 6 transizioni in totale.\n"
endin

</CsInstruments>
<CsScore>
; Inizializza i dati di test
i 1 0 0.1

; Facoltativo: testa anche la registrazione di una nuova transizione
i 3 1 0.1
</CsScore>
</CsoundSynthesizer>