
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
    S_file strget p4
    i_dur filelen S_file
    prints "i_dur: %f\tfor %s\n",i_dur, S_file
    schedule "playFile", 0, i_dur, S_file
endin
instr playFile
    a_L, a_R diskin2 p4, 1
    outs a_L, a_R
endin
</CsInstruments>
<CsScore>
i "orchestrator" 0.0000 [60*8-0.0000] "composizioni_generate/wav/prova_part_1.wav"
i "orchestrator" 114.0417 [60*8-114.0417] "composizioni_generate/wav/prova_part_2.wav"
i "orchestrator" 115.0417 [60*8-115.0417] "composizioni_generate/wav/prova_part_3.wav"
i "orchestrator" 169.8484 [60*8-169.8484] "composizioni_generate/wav/prova_part_4.wav"
i "orchestrator" 169.8484 [60*8-169.8484] "composizioni_generate/wav/prova_part_5.wav"
i "orchestrator" 209.8484 [60*8-209.8484] "composizioni_generate/wav/prova_part_6.wav"
i "orchestrator" 314.8484 [60*8-314.8484] "composizioni_generate/wav/prova_part_7.wav"

e
</CsScore>
</CsoundSynthesizer>
