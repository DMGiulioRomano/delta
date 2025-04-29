instr BehaviorWrapper
    ; Input parameters
    i_attacco = p4          ; Start time
    i_durata = p5           ; Duration
    iIdComp = p6       ; Behavior ID (ora è l'unico parametro necessario)
    
    ; Leggi i parametri dalle tabelle globali usando l'ID del comportamento
    ; Recupera i parametri principali
    i_Attacco tab_i iIdComp, gi_comp_ATTACCO       ; Tempo di attacco
    i_Durata tab_i iIdComp, gi_comp_DURATA         ; Durata complessiva
    i_DurArmonica tab_i iIdComp, gi_comp_DURARMONICA ; Durata armonica
    i_Ampiezza tab_i iIdComp, gi_comp_AMPIEZZA     ; Ampiezza in dB
    i_Ottava tab_i iIdComp, gi_comp_OTTAVA         ; Ottava
    i_Registro tab_i iIdComp, gi_comp_REGISTRO     ; Registro
    
    ; Calcola gli indici base per ritmi e posizioni (ogni blocco occupa 11 elementi)
    i_RitmiBaseIndex = iIdComp * 11
    i_PosBaseIndex = iIdComp * 11
    
    ; Leggi quanti ritmi e posizioni ci sono effettivamente
    i_NumRitmi tab_i i_RitmiBaseIndex, gi_comp_RITMI
    i_NumPos tab_i i_PosBaseIndex, gi_comp_POSIZIONI
    
    ; Crea tabelle temporanee per i ritmi e le posizioni
    i_RitmiTab ftgen 0, 0, i_NumRitmi + 1, -2, 0  ; +1 per sicurezza
    i_PosTab ftgen 0, 0, i_NumPos + 1, -2, 0      ; +1 per sicurezza
    
    ; Copia i valori nelle tabelle temporanee
    i_Idx = 0
    while (i_Idx < i_NumRitmi) do
        i_Ritmo tab_i i_RitmiBaseIndex + 1 + i_Idx, gi_comp_RITMI  ; +1 perché il primo è la lunghezza
        tabw_i i_Ritmo, i_Idx, i_RitmiTab
        i_Idx += 1
    od
    
    i_Idx = 0
    while (i_Idx < i_NumPos) do
        i_Pos tab_i i_PosBaseIndex + 1 + i_Idx, gi_comp_POSIZIONI  ; +1 perché il primo è la lunghezza
        tabw_i i_Pos, i_Idx, i_PosTab
        i_Idx += 1
    od
    
    ; Debug output se richiesto
    if (gi_debug >= 2) then
        prints "GeneraComportamenti: Comportamento %d\n", iIdComp
        prints "  Parametri: Attacco=%.2f, Durata=%.2f, DurArmonica=%.2f\n", 
               i_Attacco, i_Durata, i_DurArmonica
        prints "  Ottava=%d, Registro=%d, Ampiezza=%.2f\n", 
               i_Ottava, i_Registro, i_Ampiezza
        prints "  Numero ritmi: %d, Numero posizioni: %d\n", 
               i_NumRitmi, i_NumPos
    endif
    
    ; Verifica la validità dei parametri (usando il Validator esistente)
    ; i_Res = Validator(i_Durata, i_RitmiTab, i_DurArmonica, i_Ampiezza, i_Ottava, i_Registro, i_PosTab, iIdComp)
    
    ; Schedule del comportamento con i parametri validati
    schedule "Comportamento", i_Attacco, i_Durata, i_RitmiTab, i_DurArmonica, i_Ampiezza, i_Ottava, i_Registro, i_PosTab, iIdComp
endin