
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/prova_complete.wav" -W -d -m0
</CsOptions>
<CsInstruments>
sr=96000
ksmps=32
nchnls=2
0dbfs=1
instr orchestrator
    i_atk = p4
    S_file strget p5
    i_dur filelen S_file
    schedule "playFile", i_atk, i_dur, S_file
endin
instr playFile
    a_L, a_R diskin2 p4, 1
    outs a_L, a_R
endin
</CsInstruments>
<CsScore>
i "orchestrator" 0 [8*60] 0.0000 "composizioni_generate/wav/prova_part_1.wav"
i "orchestrator" 0 [8*60] 115.6872 "composizioni_generate/wav/prova_part_3.wav"
i "orchestrator" 0 [8*60] 187.6872 "composizioni_generate/wav/prova_part_5.wav"
i "orchestrator" 0 [8*60] 227.6872 "composizioni_generate/wav/prova_part_6.wav"

e
</CsScore>
</CsoundSynthesizer>
