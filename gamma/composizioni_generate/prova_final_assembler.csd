<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/prova_complete.wav" -W -d -m0
</CsOptions>
<CsInstruments>
; --- Final Composition Assembler ---
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
i "orchestrator" 300.0000 [60*8] "composizioni_generate/wav/sections/prova_part_6_sec_1_te_rompo_rculo.wav"
i "orchestrator" 195.0000 [60*8] "composizioni_generate/wav/sections/prova_part_5_sec_1_iv_spippoling.wav"
i "orchestrator" 155.0000 [60*8] "composizioni_generate/wav/sections/prova_part_4_sec_1_iii_ripresaglissante.wav"
i "orchestrator" 113.0000 [60*8] "composizioni_generate/wav/sections/prova_part_3_sec_1_ii_tutto_il_monco_in_festa.wav"
i "orchestrator" 112.0000 [60*8] "composizioni_generate/wav/sections/prova_part_2_sec_1_pausa.wav"
i "orchestrator" 0.0000 [60*8] "composizioni_generate/wav/sections/prova_part_1_sec_1_i_nascita_lenta_di_cluster.wav"

e
</CsScore>
</CsoundSynthesizer>