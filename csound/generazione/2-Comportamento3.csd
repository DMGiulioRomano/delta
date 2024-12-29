<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento3.wav" -W
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
i1		 49.0		 2.333		 -46.027		 2785.316		 -4		 15
i1		 51.345		 5.0		 -48.796		 2736.375		 -4		 7
i1		 56.35		 3.5		 -42.049		 2843.964		 -4		 10
i1		 59.85		 8.75		 -52.07		 2767.922		 -6		 4
i1		 68.6		 2.333		 -46.027		 2785.316		 -3		 15
</CsScore>
</CsoundSynthesizer>