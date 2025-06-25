<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/sections/prova_part_3_sec_1_ii_tutto_il_monco_in_festa.wav" -W -d -m0
</CsOptions>
<CsInstruments>
; --- Section Assembler: prova_part_3_sec_1_ii_tutto_il_monco_in_festa ---
sr=96000
ksmps=32
nchnls=2
0dbfs=1
instr orchestrator
    S_file strget p4
    i_dur filelen S_file
    if i_dur > 0 then
        prints "Scheduling '%s' (dur: %.2fs) at time %.2fs\n", S_file, i_dur, p2
        schedule "playFile", 0, i_dur, S_file
    else
        prints "WARNING: Could not play file '%s'.\n", S_file
    endif
endin
instr playFile
    a_L, a_R diskin2 p4, 1
    outs a_L, a_R
endin
</CsInstruments>
<CsScore>
i "orchestrator" 0.0000 [60*8] "composizioni_generate/wav/layers/prova_part_3_sec_1_ii_tutto_il_monco_in_festa_layer_1_scampanello.wav"
i "orchestrator" 0.0000 [60*8] "composizioni_generate/wav/layers/prova_part_3_sec_1_ii_tutto_il_monco_in_festa_layer_2_solista.wav"
i "orchestrator" 0.0000 [60*8] "composizioni_generate/wav/layers/prova_part_3_sec_1_ii_tutto_il_monco_in_festa_layer_3_scintillii_acuti_e_stocastici.wav"

e
</CsScore>
</CsoundSynthesizer>