instr GeneraComportamenti
    ; Input parameters - now these come from the transition system
    i_attacco = p4          ; Start time
    i_durata = p5           ; Duration
    i_ritmi_table = p6      ; Rhythm values table
    i_dur_arm = p7          ; Harmonic duration
    i_amp = p8              ; Amplitude
    i_ottava = p9           ; Octave
    i_registro = p10        ; Register
    i_pos_table = p11       ; Position values table
    i_which_comp = p12      ; Behavior ID
    ; Validate parameters (using your existing Validator code)
    i_tmp_Res = Validator(i_durata, i_ritmi_table, i_dur_arm, i_amp, i_ottava, i_registro, i_pos_table, i_which_comp)
    ; Schedule the behavior with validated parameters
    schedule "Comportamento", i_attacco, i_durata, i_ritmi_table, i_dur_arm, i_amp, i_ottava, i_registro, i_pos_table, i_which_comp
endin
