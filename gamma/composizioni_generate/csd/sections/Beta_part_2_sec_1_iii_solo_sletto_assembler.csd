<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/sections/Beta_part_2_sec_1_iii_solo_sletto.wav" -W -d -m0
</CsOptions>
<CsInstruments>
; --- Section Assembler: Beta_part_2_sec_1_iii_solo_sletto ---
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
i "orchestrator" 0.0000 [60*8-0.0000] "composizioni_generate/wav/layers/Beta_part_2_sec_1_iii_solo_sletto_layer_1_solista.wav"

e
</CsScore>
</CsoundSynthesizer>