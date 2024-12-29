<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento6.wav" -W
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
i1		 70.0		 5.0		 -40.638		 5687.928		 -8		 7
i1		 75.005		 8.75		 -53.161		 5570.631		 -5		 4
i1		 83.755		 2.333		 -49.431		 5535.844		 -3		 15
i1		 86.1		 3.5		 -46.078		 5472.749		 -14		 10
i1		 89.6		 5.0		 -40.638		 5687.928		 -2		 7
</CsScore>
</CsoundSynthesizer>