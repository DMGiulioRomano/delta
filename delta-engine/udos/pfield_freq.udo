opcode calcFrequenza, i, iiiiii
    i_Ottava, i_Registro, i_RitmoCorrente, i_TblNum, i_Intervalli, i_Registri xin
        
    ; Calculate octave register
    i_Indice_Ottava = int(i_Ottava * i_Intervalli)
    
    ; Calculate interval offset within the octave
    i_OffsetIntervallo = i_Indice_Ottava + int(((i_Registro * i_Intervalli) / i_Registri))
    
    ; Get the frequency from the table using the calculated offset
    i_Freq table i_OffsetIntervallo + i_RitmoCorrente, i_TblNum
        
    xout i_Freq
endop
