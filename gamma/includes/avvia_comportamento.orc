; includes/avvia_comportamento.orc
instr AvviaComportamento
    ; Parametri ricevuti dallo score
    i_CAttacco      = p2
    i_Durata        = p3
    i_TabSelector   = p4
    i_DurataArmonica= p5
    i_Ampiezza      = p6
    i_Ottava        = p7
    i_Registro      = p8
    ipino = p9 ; che non serve a un cazzo 
    i_IdComp        = p10
    i_NonlinearMode = p11 ; Nuovo parametro per la modalità!

    ; Usa schedule per chiamare il vero Comportamento,
    ; passando i numeri delle tabelle globali come p-fields.
    schedule "Comportamento", i_CAttacco, i_Durata, i_TabSelector, i_DurataArmonica, i_Ampiezza, i_Ottava, i_Registro, i_TabSelector+1, i_IdComp, i_NonlinearMode
endin
