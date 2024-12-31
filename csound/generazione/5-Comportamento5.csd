<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione5-Comportamento5.wav" -W
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
i1		 8.0		 0.091		 -33.976		 274.519		 -9		 3		 274.519
i1		 8.09		 1.0		 -31.46		 267.737		 -9		 7		 267.737
i1		 9.09		 0.667		 -30.842		 285.313		 -1		 4		 285.313
i1		 9.756		 0.286		 -41.505		 264.134		 -3		 3		 264.134
i1		 10.042		 1.0		 -38.48		 275.093		 -3		 21		 275.093
i1		 10.542		 1.333		 -44.824		 257.071		 -3		 14		 257.071
i1		 11.208		 0.19		 -36.16		 257.609		 -3		 32		 257.609
i1		 11.304		 0.286		 -41.864		 261.123		 -16		 10		 261.123
i1		 11.446		 0.125		 -31.243		 259.493		 -9		 22		 259.493
i1		 11.508		 0.2		 -30.842		 257.609		 -16		 2		 257.609
i1		 11.708		 0.182		 -33.976		 274.519		 -10		 3		 274.519
i1		 11.798		 2.0		 -31.46		 267.737		 -22		 7		 267.737
i1		 12.798		 0.667		 -30.842		 285.313		 -1		 4		 285.313
</CsScore>
</CsoundSynthesizer>