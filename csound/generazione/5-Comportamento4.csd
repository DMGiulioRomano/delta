<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione5-Comportamento4.wav" -W
</CsOptions>
<CsInstruments>

sr=96000
kr=96000
0dbfs=1
nchnls=2

    instr 1
    ; inizializzazioni
        iamp  = ampdbfs(p4)                 
        ifreq = p5
        iwhichZero = abs(p6)
        idirection = signum(p6)
        iHR = p7
        ifreq2 = p8
        iT = ($M_PI*2)/iHR
        iradi = 0 + (iwhichZero-1) * iT
        iradf = iradi + (idirection*iT)        
        krad line iradi,p3,iradf
        kEnv = abs(sin(krad*iHR/2))
        kMid1 = cos(krad)
        kSide1=sin(krad)
        kfreq line ifreq, p3, ifreq2
    ; sintesi                  
        as poscil3 iamp, kfreq
        aMid = ((kMid1 * as)) + (as*0)
        aSide = kSide1 * as
        aL = (aMid+aSide)/sqrt(2)
        aR = (aMid-aSide)/sqrt(2)
        aEnvL = aL * kEnv
        aEnvR = aR * kEnv
            outs aEnvL,aEnvR;,a1,a2,aL,aR,aMid,aSide
    endin

</CsInstruments>
<CsScore>
f1 0 16777216 10 1

; "comportamento"
i1		 2.0		 0.091		 -38.48		 555.368		 -2		 32		 555.368
i1		 2.09		 2.0		 -44.824		 554.209		 -3		 10		 554.209
i1		 3.09		 0.667		 -36.16		 587.528		 -4		 22		 587.528
i1		 3.756		 0.571		 -41.864		 576.0		 -4		 2		 576.0
i1		 4.042		 1.0		 -31.243		 610.628		 -3		 3		 610.628
i1		 4.542		 0.667		 -30.842		 565.301		 -17		 7		 565.301
i1		 5.208		 0.19		 -33.976		 591.824		 -10		 4		 591.824
i1		 5.304		 0.286		 -31.46		 550.186		 -13		 3		 550.186
i1		 5.446		 0.062		 -30.842		 554.209		 -10		 21		 554.209
i1		 5.508		 0.2		 -41.505		 561.771		 -18		 14		 561.771
i1		 5.708		 0.091		 -38.48		 555.368		 -2		 32		 555.368
i1		 5.798		 2.0		 -44.824		 554.209		 -3		 10		 554.209
i1		 6.798		 0.667		 -36.16		 587.528		 -3		 22		 587.528
i1		 7.464		 0.571		 -41.864		 576.0		 -3		 2		 576.0
i1		 7.75		 1.0		 -31.243		 610.628		 -3		 3		 610.628
i1		 8.25		 0.667		 -30.842		 565.301		 -17		 7		 565.301
i1		 8.916		 0.095		 -33.976		 591.824		 -13		 4		 591.824
</CsScore>
</CsoundSynthesizer>