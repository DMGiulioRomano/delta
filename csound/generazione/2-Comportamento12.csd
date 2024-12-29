<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento12.wav" -W
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
i1		 53.0		 6.667		 -49.022		 14994.934		 12		 19
i1		 54.66		 1.333		 -45.255		 15199.514		 10		 12
i1		 56.0		 1.053		 -47.07		 14824.03		 18		 15
i1		 57.06		 6.667		 -49.022		 14994.934		 12		 19
i1		 58.72		 5.333		 -45.255		 15199.514		 11		 12
i1		 60.06		 5.263		 -47.07		 14824.03		 11		 15
i1		 61.12		 10.0		 -49.022		 14994.934		 10		 19
i1		 62.78		 6.667		 -45.255		 15199.514		 12		 12
i1		 64.12		 2.105		 -47.07		 14824.03		 13		 15
i1		 65.18		 5.0		 -49.022		 14994.934		 10		 19
i1		 66.84		 5.333		 -45.255		 15199.514		 12		 12
i1		 68.18		 4.211		 -47.07		 14824.03		 10		 15
i1		 69.24		 5.0		 -49.022		 14994.934		 12		 19
i1		 70.9		 5.333		 -45.255		 15199.514		 15		 12
i1		 72.24		 2.105		 -47.07		 14824.03		 18		 15
i1		 73.3		 10.0		 -49.022		 14994.934		 10		 19
i1		 74.96		 2.667		 -45.255		 15199.514		 11		 12
i1		 76.3		 6.316		 -47.07		 14824.03		 10		 15
i1		 77.36		 10.0		 -49.022		 14994.934		 10		 19
i1		 79.02		 1.333		 -45.255		 15199.514		 15		 12
i1		 80.36		 5.263		 -47.07		 14824.03		 17		 15
i1		 81.42		 8.333		 -49.022		 14994.934		 10		 19
i1		 83.08		 4.0		 -45.255		 15199.514		 10		 12
i1		 84.42		 1.053		 -47.07		 14824.03		 12		 15
i1		 85.48		 8.333		 -49.022		 14994.934		 11		 19
i1		 87.14		 8.0		 -45.255		 15199.514		 12		 12
</CsScore>
</CsoundSynthesizer>