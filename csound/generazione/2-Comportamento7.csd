<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento7.wav" -W
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
        iT = ($M_PI*2)/iHR
        iradi = 0 + (iwhichZero-1) * iT
        iradf = iradi + (idirection*iT)        
        krad line iradi,p3,iradf
        kEnv = abs(sin(krad*iHR/2))
        kMid1 = cos(krad)
        kSide1=sin(krad)
    ; sintesi                  
        as poscil3 iamp, ifreq
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
i1		 60.0		 6.25		 -50.07		 6439.13		 -2		 12
i1		 62.075		 7.812		 -52.022		 6561.0		 -10		 16
i1		 63.625		 5.0		 -48.255		 6513.366		 -8		 15
i1		 65.3		 7.895		 -50.6		 6602.23		 -8		 19
i1		 66.625		 10.417		 -50.07		 6439.13		 -5		 12
i1		 68.7		 3.125		 -52.022		 6561.0		 -19		 16
i1		 70.25		 3.333		 -48.255		 6513.366		 -7		 15
i1		 71.925		 6.579		 -50.6		 6602.23		 -8		 19
i1		 73.25		 12.5		 -50.07		 6439.13		 -8		 12
i1		 75.325		 9.375		 -52.022		 6561.0		 -10		 16
i1		 76.875		 1.667		 -48.255		 6513.366		 -10		 15
i1		 78.55		 7.895		 -50.6		 6602.23		 -5		 19
i1		 79.875		 2.083		 -50.07		 6439.13		 -12		 12
i1		 81.95		 3.125		 -52.022		 6561.0		 -17		 16
i1		 83.5		 3.333		 -48.255		 6513.366		 -11		 15
i1		 85.175		 3.947		 -50.6		 6602.23		 -11		 19
i1		 86.5		 8.333		 -50.07		 6439.13		 -15		 12
i1		 88.575		 3.125		 -52.022		 6561.0		 -4		 16
</CsScore>
</CsoundSynthesizer>