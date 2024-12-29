<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione1-Comportamento7.wav" -W
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
i1		 22.0		 2.857		 -33.798		 174.082		 3		 7
i1		 24.86		 1.333		 -30.887		 171.023		 6		 15
i1		 26.2		 2.0		 -25.777		 172.995		 12		 10
i1		 28.2		 5.0		 -28.586		 177.748		 9		 4
i1		 33.2		 2.857		 -33.798		 174.082		 2		 7
i1		 36.06		 1.333		 -30.887		 171.023		 7		 15
i1		 37.4		 2.0		 -25.777		 172.995		 10		 10
i1		 39.4		 5.0		 -28.586		 177.748		 8		 4
i1		 44.4		 2.857		 -33.798		 174.082		 2		 7
</CsScore>
</CsoundSynthesizer>