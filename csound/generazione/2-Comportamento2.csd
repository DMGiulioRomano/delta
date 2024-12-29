<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento2.wav" -W
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
i1		 55.0		 2.857		 -50.027		 2404.611		 6		 7
i1		 57.86		 1.333		 -56.07		 2470.672		 6		 15
i1		 59.2		 2.0		 -52.796		 2432.333		 7		 10
i1		 61.2		 5.0		 -46.049		 2377.204		 3		 4
i1		 66.2		 2.857		 -50.027		 2404.611		 7		 7
i1		 69.06		 1.333		 -56.07		 2470.672		 12		 15
i1		 70.4		 2.0		 -52.796		 2432.333		 8		 10
i1		 72.4		 5.0		 -46.049		 2377.204		 4		 4
</CsScore>
</CsoundSynthesizer>