<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione1-Comportamento12.wav" -W
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
i1		 49.0		 15.0		 -37.887		 2146.377		 -2		 7
i1		 54.005		 17.5		 -35.586		 2113.07		 -4		 4
i1		 62.755		 7.0		 -32.777		 2088.987		 -3		 15
i1		 65.1		 10.5		 -40.798		 2075.941		 -3		 10
i1		 68.6		 5.0		 -37.887		 2146.377		 -2		 7
i1		 73.605		 26.25		 -35.586		 2113.07		 -3		 4
i1		 82.355		 2.333		 -32.777		 2088.987		 -10		 15
</CsScore>
</CsoundSynthesizer>