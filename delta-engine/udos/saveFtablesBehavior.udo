opcode saveFtablesBehavior, 0, 0
    if gi_debug>=4 then 
        i_tmp_res system_i 1, sprintf("mkdir -p %s",gSdirTables)
        i_tmp_res system_i 1, sprintf("mkdir -p %s",gSdirResults)
        ; Genera il nome del file
        StableData sprintf "%s/compParams.table",gSdirTables
        StableName sprintf "%s/compParams.docs",gSdirTables
        ; Salva i dati del comportamento per analisi
        fprints StableName, "gi_comp_ATTACCO: %d\ngi_comp_RITMI: %d\ngi_comp_DURARMONICA: %d\ngi_comp_DURATA: %d\ngi_comp_AMPIEZZA: %d\ngi_comp_OTTAVA: %d\ngi_comp_REGISTRO: %d\ngi_comp_POSIZIONI: %d", gi_comp_ATTACCO, gi_comp_RITMI, gi_comp_DURARMONICA, 
               gi_comp_DURATA, gi_comp_AMPIEZZA, gi_comp_OTTAVA, gi_comp_REGISTRO, gi_comp_POSIZIONI
        ftsave StableData, 1, gi_comp_ATTACCO, gi_comp_RITMI, gi_comp_DURARMONICA, 
               gi_comp_DURATA, gi_comp_AMPIEZZA, gi_comp_OTTAVA, gi_comp_REGISTRO, gi_comp_POSIZIONI
        ; Esegui lo script Python di visualizzazione
        i_tmp_res system_i 1, sprintf("python3.11 docs/plot_all_params_memory.py %s %s %s behaviorAll %d", StableData, StableName, gSdirResults, gi_NUMComportamenti)
    endif
endop

opcode saveFtablesEvents, 0, 0
    if gi_debug>=4 then 
        i_tmp_res system_i 1, sprintf("mkdir -p %s",gSdirTables)
        i_tmp_res system_i 1, sprintf("mkdir -p %s",gSdirResults)
        ; Genera il nome del file
        StableData sprintf "%s/eveParams.table",gSdirTables
        StableName sprintf "%s/eveParams.docs",gSdirTables
        ; Salva i dati del comportamento per analisi
        fprints StableName, "gi_eve_attacco: %d\ngi_eve_durata: %d\ngi_eve_ampiezza: %d\ngi_eve_frequenza1: %d\ngi_eve_posizione: %d\ngi_eve_hr: %d\ngi_eve_frequenza2: %d\ngi_eve_ifn: %d\ngi_eve_comportamento: %d", gi_eve_attacco, gi_eve_durata, gi_eve_ampiezza, 
               gi_eve_frequenza1, gi_eve_posizione, gi_eve_hr, gi_eve_frequenza2, gi_eve_ifn, gi_eve_comportamento
        ftsave StableData, 1, gi_eve_attacco, gi_eve_durata, gi_eve_ampiezza, 
               gi_eve_frequenza1, gi_eve_posizione, gi_eve_hr, gi_eve_frequenza2, gi_eve_ifn, gi_eve_comportamento
        ; Esegui lo script Python di visualizzazione
        i_tmp_res system_i 1, sprintf("python3.11 docs/plot_all_params_memory.py %s %s %s eventAll %d", StableData, StableName, gSdirResults, 100)
    endif
endop
