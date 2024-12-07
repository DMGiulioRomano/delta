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
        iradi = $M_PI / (iHR*2) + (iwhichZero-1) * iT
        iradf = iradi + iT        
        krad line iradi,p3,iradf
        kEnv = cos(krad*iHR)

        kMid1 = cos(krad)
        kSide1=sin(krad)
        as = oscil(.8,300)
        aMid = kMid1 * as
        aSide = kSide1 * as

        a1 = (kMid1+kSide1)/sqrt(2)
        a2 = (kMid1-kSide1)/sqrt(2)
        aL = (aMid+aSide)/sqrt(2)
        aR = (aMid-aSide)/sqrt(2)
        aEnvL = aL * kEnv
        aEnvR = aR * kEnv
        ;printks "radianti = %f, Mid = %f\\n", .01, krad, kMid
        outs aEnvL,aEnvR;,a1,a2,aL,aR,aMid,aSide
    endin

    opcode MSPAN 
    endop

</CsInstruments>
<CsScore>
f1 0 4096 10 1

i1 0 12     2   2
</CsScore>
</CsoundSynthesizer>