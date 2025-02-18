instr letMeLook
        ; Stampa le variabili globali
        prints "Tutti i processi completati\n"
        ftprint gi_eve_attacco, 1, 0, gi_Index
        ftprint gi_eve_durata, 1, 0, gi_Index
        ftprint gi_eve_ampiezza, 1, 0, gi_Index
        ftprint gi_eve_frequenza1, 1, 0, gi_Index
        ftprint gi_eve_frequenza2, 1, 0, gi_Index
        ftprint gi_eve_posizione, 1, 0, gi_Index
        ftprint gi_eve_hr, 1, 0, gi_Index
        ftprint gi_eve_ifn, 1, 0, gi_Index
        prints "\n\neventi totali : %d\n" , gi_Index
        turnoff
endin
