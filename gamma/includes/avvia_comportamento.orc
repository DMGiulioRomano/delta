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

    ; Seleziona la coppia giusta di tabelle
    if (i_TabSelector == 1000) then
        iRitmiTab = gi_RitmiTab_1000
        i_PosTab   = gi_PosTab_1001
    elseif (i_TabSelector == 1002) then
        iRitmiTab = gi_RitmiTab_1002
        i_PosTab   = gi_PosTab_1003
    elseif (i_TabSelector == 1004) then
        iRitmiTab = gi_RitmiTab_1004
        i_PosTab   = gi_PosTab_1005
    elseif (i_TabSelector == 1006) then
        iRitmiTab = gi_RitmiTab_1006
        i_PosTab   = gi_PosTab_1007
    elseif (i_TabSelector == 1008) then
        iRitmiTab = gi_RitmiTab_1008
        i_PosTab   = gi_PosTab_1009
    elseif (i_TabSelector == 1010) then
        iRitmiTab = gi_RitmiTab_1010
        i_PosTab   = gi_PosTab_1011
    elseif (i_TabSelector == 1012) then
        iRitmiTab = gi_RitmiTab_1012
        i_PosTab   = gi_PosTab_1013
    elseif (i_TabSelector == 1014) then
        iRitmiTab = gi_RitmiTab_1014
        i_PosTab   = gi_PosTab_1015
    elseif (i_TabSelector == 1016) then
        iRitmiTab = gi_RitmiTab_1016
        i_PosTab   = gi_PosTab_1017
    elseif (i_TabSelector == 1018) then
        iRitmiTab = gi_RitmiTab_1018
        i_PosTab   = gi_PosTab_1019
    elseif (i_TabSelector == 1020) then
        iRitmiTab = gi_RitmiTab_1020
        i_PosTab   = gi_PosTab_1021
    else
        ; fallback se la tabella non è riconosciuta
        iRitmiTab = -1
        i_PosTab = -1
    endif

    ; Usa schedule per chiamare il vero Comportamento,
    ; passando i numeri delle tabelle globali come p-fields.
    schedule "Comportamento", i_CAttacco, i_Durata, iRitmiTab, i_DurataArmonica, i_Ampiezza, i_Ottava, i_Registro, i_PosTab, i_IdComp, i_NonlinearMode
endin
