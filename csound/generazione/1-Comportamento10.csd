<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione1-Comportamento10.wav" -W
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
i1		 49.0		 15.0		 -39.027		 2088.987		 -1		 7
i1		 54.005		 2.333		 -45.07		 2146.377		 -14		 15
i1		 56.35		 10.5		 -41.796		 2113.07		 -10		 10
i1		 59.85		 8.75		 -35.049		 2075.941		 -4		 4
i1		 68.6		 10.0		 -39.027		 2088.987		 -5		 7
i1		 73.605		 7.0		 -45.07		 2146.377		 -15		 15
i1		 75.95		 3.5		 -41.796		 2113.07		 -8		 10
i1		 79.45		 8.75		 -35.049		 2075.941		 -4		 4
</CsScore>
</CsoundSynthesizer>