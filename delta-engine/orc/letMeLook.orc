instr letMeLook
        ; Stampa le variabili globali
        prints "Tutti i processi completati\n"
        ftprint gi_TAB_attacco, 1, 0, gi_Index
        ftprint gi_TAB_durata, 1, 0, gi_Index
        ftprint gi_TAB_ampiezza, 1, 0, gi_Index
        ftprint gi_TAB_frequenza1, 1, 0, gi_Index
        ftprint gi_TAB_frequenza2, 1, 0, gi_Index
        ftprint gi_TAB_posizione, 1, 0, gi_Index
        ftprint gi_TAB_hr, 1, 0, gi_Index
        ftprint gi_TAB_ifn, 1, 0, gi_Index
        prints "\n\neventi totali : %d\n" , gi_Index
        turnoff
endin
