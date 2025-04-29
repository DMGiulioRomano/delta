<CsoundSynthesizer>
<CsOptions>
-d -n ; Nessun messaggio di performance
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Includi i file di inizializzazione per avere tutte le tabelle globali definite
#include "../MACROS/init.orc"

; Dizionario dei nomi delle tabelle per una migliore leggibilità
gS_table_names[] init 40

; Inizializza i nomi delle tabelle
instr InitTableNames
    gS_table_names[0] = "gi_Intonazione"
    gS_table_names[1] = "gi_eve_attacco"
    gS_table_names[2] = "gi_eve_durata"
    gS_table_names[3] = "gi_eve_ampiezza"
    gS_table_names[4] = "gi_eve_frequenza1"
    gS_table_names[5] = "gi_eve_frequenza2"
    gS_table_names[6] = "gi_eve_posizione"
    gS_table_names[7] = "gi_eve_hr"
    gS_table_names[8] = "gi_eve_ifn"
    gS_table_names[9] = "gi_eve_comportamento"
    gS_table_names[10] = "gi_comp_RITMI"
    gS_table_names[11] = "gi_comp_POSIZIONI"
    gS_table_names[12] = "gi_comp_ATTACCO"
    gS_table_names[13] = "gi_comp_DURARMONICA"
    gS_table_names[14] = "gi_comp_DURATA"
    gS_table_names[15] = "gi_comp_AMPIEZZA"
    gS_table_names[16] = "gi_comp_OTTAVA"
    gS_table_names[17] = "gi_comp_REGISTRO"
    gS_table_names[18] = "gi_analysis_active_events"
    gS_table_names[19] = "gi_analysis_timepoints"
    gS_table_names[20] = "gi_memory_overlap"
    gS_table_names[21] = "gi_memory_events"
    gS_table_names[22] = "gi_active_octaves"
    gS_table_names[23] = "gi_active_registers"
    gS_table_names[24] = "gi_octave_register_matrix"
    gS_table_names[25] = "gi_memory_harmonic_density"
    gS_table_names[26] = "gi_memory_octave_spread"
    gS_table_names[27] = "gi_memory_spectral_centroid"
    gS_table_names[28] = "gi_memory_spatial_movement"
    gS_table_names[29] = "gi_cumulative_octave_register_matrix"
    gS_table_names[30] = "gi_density_thresholds"
    gS_table_names[31] = "gi_register_thresholds"
    gS_table_names[32] = "gi_movement_thresholds"
    gS_table_names[33] = "gi_state_history_density"
    gS_table_names[34] = "gi_state_history_register"
    gS_table_names[35] = "gi_state_history_movement"
    gS_table_names[36] = "gi_memory_state_density"
    gS_table_names[37] = "gi_memory_state_register"
    gS_table_names[38] = "gi_memory_state_movement"
    gS_table_names[39] = "gi_transition_matrix"
endin

; Strumento per analizzare una singola tabella
instr AnalyzeTable
    iTableNum = p4
    iNameIdx = p5    
    ; Trova il nome della tabella (se disponibile)
    STableName = "Sconosciuta"
        if (ftexists(iTableNum) == 1) then
            if (strcmp(gS_table_names[iNameIdx], "") != 0) then
                STableName = gS_table_names[iNameIdx]
            endif
        endif
    prints "STableName : %s\n\n\n", STableName
    ; Ottieni le informazioni di base sulla tabella
    iLen = ftlen(iTableNum)
    
    iActualLen = ftlen(iTableNum)
    
    
    ; Stampa le intestazioni
    prints "=============================================\n"
    prints "ANALISI TABELLA: %d (%s)\n", iTableNum, STableName
    prints "Lunghezza: %d elementi\n", iLen
    prints "---------------------------------------------\n"
            
    
    ; Informazioni aggiuntive per tabelle speciali
    if (strcmp(STableName, "gi_comp_RITMI") == 0 || strcmp(STableName, "gi_comp_POSIZIONI") == 0) then
        prints "NOTA: Questa tabella ha una struttura speciale con blocchi di 11 elementi\n"
        prints "Il primo elemento di ogni blocco indica la lunghezza dell'array\n"
        prints "---------------------------------------------\n"
        
        ; Analizza la struttura a blocchi
        iComportamenti = gi_NUMComportamenti
        iBlockSize = 11
        
        iCompIdx = 0
        while (iCompIdx < 12) do  ; Mostra solo i primi 5 comportamenti
            iBaseIdx = iCompIdx * iBlockSize
            iLen = tab_i(iBaseIdx, iTableNum)
            
            prints "Comportamento %d, Lunghezza dichiarata: %.0f\n", iCompIdx, iLen
            prints "  Valori: "
            
            iValIdx = 0
            while (iValIdx < iLen && iValIdx < 10) do
                iVal = tab_i(iBaseIdx + 1 + iValIdx, iTableNum)
                prints "%.0f ", iVal
                iValIdx += 1
            od
            prints "\n"
            
            iCompIdx += 1
        od
    endif
    
    prints "=============================================\n\n"
endin

; Strumento principale per eseguire tutti i test
instr TestAllTables
    prints "\n\n========== ANALISI DELLE TABELLE GLOBALI ==========\n\n"
    prints "Sistema di analisi delle tabelle globali di delta-engine\n"
    prints "Ogni tabella verrà analizzata per dimensione, tipo e contenuto\n\n"
    
    ; Esegui lo strumento per assegnare i nomi alle tabelle
    schedule "InitTableNames", 0, 0.1
    ; Test delle tabelle principali di intonazione
    prints "\n----- TABELLE DI INTONAZIONE -----\n"
    schedule "AnalyzeTable", 0, 0.1, gi_Intonazione, gS_table_names[0]
    
    ; Test delle tabelle degli eventi sonori
    prints "\n----- TABELLE DEGLI EVENTI SONORI -----\n"
    schedule "AnalyzeTable", 0, 0.1, gi_eve_attacco, 1
    schedule "AnalyzeTable", 0, 0.1, gi_eve_durata, 2
    schedule "AnalyzeTable", 0, 0.1, gi_eve_ampiezza, 3
    schedule "AnalyzeTable", 1, 0.1, gi_eve_frequenza1, 4
    schedule "AnalyzeTable", 1, 0.1, gi_eve_frequenza2, 5
    schedule "AnalyzeTable", 1, 0.1, gi_eve_posizione, 6
    schedule "AnalyzeTable", 1, 0.1, gi_eve_hr, 7
    schedule "AnalyzeTable", 1, 0.1, gi_eve_ifn, 8
    schedule "AnalyzeTable", 1, 0.1, gi_eve_comportamento,9
    
    ; Test delle tabelle dei comportamenti
    prints "\n----- TABELLE DEI COMPORTAMENTI -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_comp_RITMI, 10
    schedule "AnalyzeTable", 1, 0.1, gi_comp_POSIZIONI,  11
    schedule "AnalyzeTable", 1, 0.1, gi_comp_ATTACCO,  12
    schedule "AnalyzeTable", 1, 0.1, gi_comp_DURARMONICA,  13
    schedule "AnalyzeTable", 1, 0.1, gi_comp_DURATA,  14
    schedule "AnalyzeTable", 1, 0.1, gi_comp_AMPIEZZA,  15
    schedule "AnalyzeTable", 1, 0.1, gi_comp_OTTAVA,  16
    schedule "AnalyzeTable", 1, 0.1, gi_comp_REGISTRO,  17
    
    
    prints "\n----- TABELLE DI cosi -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_analysis_active_events,  18
    schedule "AnalyzeTable", 1, 0.1, gi_analysis_timepoints, 19 
    schedule "AnalyzeTable", 1, 0.1, gi_memory_overlap,  20
    schedule "AnalyzeTable", 1, 0.1, gi_memory_events,  21
    schedule "AnalyzeTable", 1, 0.1, gi_active_octaves,  22
    schedule "AnalyzeTable", 1, 0.1, gi_active_registers,  23
    schedule "AnalyzeTable", 1, 0.1, gi_octave_register_matrix,  24

    ; Test delle tabelle di sistema
    prints "\n----- TABELLE DI MEMORIA -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_memory_harmonic_density,  25
    schedule "AnalyzeTable", 1, 0.1, gi_memory_octave_spread, 26
    schedule "AnalyzeTable", 1, 0.1, gi_memory_spectral_centroid,  27
    schedule "AnalyzeTable", 1, 0.1, gi_memory_spatial_movement,  28
    schedule "AnalyzeTable", 1, 0.1, gi_cumulative_octave_register_matrix,  29

    ; Test delle tabelle di sistema
    prints "\n----- TABELLE DI SISTEMA -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_density_thresholds,  30
    schedule "AnalyzeTable", 1, 0.1, gi_register_thresholds, 31
    schedule "AnalyzeTable", 1, 0.1, gi_movement_thresholds,  32
    
    ; Test delle tabelle della memoria di stato
    prints "\n----- TABELLE DELLA MEMORIA DI STATO -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_state_history_density,  33
    schedule "AnalyzeTable", 1, 0.1, gi_state_history_register,  34
    schedule "AnalyzeTable", 1, 0.1, gi_state_history_movement,  35

    prints "\n----- TABELLE DI altra memoria nme rompe rcà -----\n"
    schedule "AnalyzeTable", 1, 0.1, gi_memory_state_density,  36
    schedule "AnalyzeTable", 1, 0.1, gi_memory_state_register, 37
    schedule "AnalyzeTable", 1, 0.1, gi_memory_state_movement,  38
    schedule "AnalyzeTable", 1, 0.1, gi_transition_matrix,  39
    
    ; Test specifici su comportamenti GEN
    ; Termina l'analisi
    prints "\n======== ANALISI COMPLETATA ========\n"
    prints "Tutte le tabelle sono state analizzate per dimensione, tipo e contenuto.\n"
endin

</CsInstruments>
<CsScore>
; Avvia il test principale
i "TestAllTables" 0 100
e
</CsScore>
</CsoundSynthesizer>