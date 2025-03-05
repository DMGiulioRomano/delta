instr GeneraComportamenti
    i_debug = gi_debug
    i_which_comp init 0
    i_dur = p3
    i_tmp_Res = Validator(p5,p6,p7,p8,p9,p10,p11,i_which_comp)
    schedule "Comportamento",p4,p5,p6,p7,p8,p9,p10,p11,i_which_comp
/*
    while i_which_comp < i_dur do ; momentary
    ; Lettura dei ritmi e posizioni che divengono array.
        i_LenRitmi tab_i i_which_comp, gi_comp_RITMO_LEN
        gi_temp_ritmi ftgen 0, 0, i_LenRitmi, -2, 0
        tableicopy gi_temp_ritmi, gi_comp_RITMO_VAL
    ; Lettura delle posizioni che divengono array.
        i_LenPos tab_i i_which_comp, gi_comp_POS_LEN
        gi_temp_pos ftgen 0, 0, i_LenPos, -2, 0
        tableicopy gi_temp_pos, gi_comp_POSIZIONE
    ; Lettura degli altri parametri 
        i_Attacco tab_i i_which_comp, gi_comp_ATTACCO
        i_Durata tab_i i_which_comp, gi_comp_DURATA
        i_DurArm tab_i i_which_comp, gi_comp_DURARMONICA
        i_Amp tab_i i_which_comp, gi_comp_AMPIEZZA
        i_temp_ritmi = gi_temp_ritmi
        i_temp_pos = gi_temp_pos
        i_Oct tab_i i_which_comp, gi_comp_OTTAVA
        i_Reg tab_i i_which_comp, gi_comp_REGISTRO
    ; Checking for parameter validation
        i_Val_Res = Validator(i_Durata, i_temp_ritmi, i_DurArm, i_Amp, i_Oct, i_Reg, i_temp_pos, i_which_comp)
        schedule "Comportamento", i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp, i_Oct, i_Reg, gi_temp_pos, i_which_comp
    ; --- DEBUG STAGE ---
        if i_debug == 1 || i_debug == 2 then
            prints "\n\n\n============================================================\n"
            prints "\n\t\t\t||Comportamento numero %d||\n", i_which_comp
            prints "\n\t------------------------------------------------------------\n\n"
            prints "\t\t---|gi_temp_ritmi|-----\n"
            ftprint gi_temp_ritmi, 1, 0, i_LenRitmi
            prints "\n\t------------------------------------------------------------\n\n"
            prints "\t\t---|gi_temp_pos|-----\n\n"
            ftprint gi_temp_pos, 1, 0, i_LenPos
            prints "\n\t------------------------------------------------------------\n"
            prints "\t\t---|lettura condizioni iniziali|-----"
            prints "\n\tat: %f\n\tdur: %f\n\tdurArm: %f\n\tamp: %f\n\tOct: %d\n\tReg: %d\n\n\n", i_Attacco, i_Durata, i_DurArm, i_Amp, i_Oct, i_Reg
        endif
    ; Contatore comportamenti
        i_which_comp+=1
    od*/
endin


