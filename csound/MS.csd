<CsoundSynthesizer>
<CsOptions>
; namefile
-o "testMidSide.wav" -W
</CsOptions>
<CsInstruments>

sr=96000
kr=96000
0dbfs=1
nchnls=2

    instr 1
        iHR = p4
        iwhichZero = p5
        ;kgradi line 45, p3, 0
        ;krad = kgradi * $M_PI / 180
        iT = $M_PI/iHR
        ; zeros
        iradi = $M_PI / (iHR*2) + (iwhichZero-1) * iT
        iradf = iradi + iT
                
        krad line iradi,p3,iradf
        kEnv = sin(krad*iHR)
        printk 1,krad
        ; segnale di test
        as = oscil(1,300)
        kMid1 = cos(krad)
        kSide1=sin(krad)
        aMid = kMid1 * as
        aSide = kSide1 * as
        aL = (aMid+aSide)/sqrt(2)
        aR = (aMid-aSide)/sqrt(2)
        aEnvL = aL * kEnv
        aEnvR = aR * kEnv
        ;printks "radianti = %f, Mid = %f\\n", .01, krad, kMid
        outs aEnvL,aEnvR;,a1,a2,aL,aR,aMid,aSide
    endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1

i1 0 12     1  1
</CsScore>
</CsoundSynthesizer>