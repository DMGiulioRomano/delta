<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione1-Comportamento11.wav" -W
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
i1		 49.0		 2.333		 -33.976		 2113.07		 -4		 15
i1		 51.345		 15.0		 -36.16		 2075.941		 -10		 7
i1		 56.35		 10.5		 -31.46		 2146.377		 -5		 10
i1		 59.85		 17.5		 -38.98		 2088.987		 -5		 4
i1		 68.6		 7.0		 -33.976		 2113.07		 -4		 15
i1		 70.945		 5.0		 -36.16		 2075.941		 -8		 7
i1		 75.95		 7.0		 -31.46		 2146.377		 -6		 10
i1		 79.45		 8.75		 -38.98		 2088.987		 -8		 4
i1		 88.2		 4.667		 -33.976		 2113.07		 -3		 15
</CsScore>
</CsoundSynthesizer>