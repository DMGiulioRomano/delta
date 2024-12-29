<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento11.wav" -W
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
i1		 50.0		 8.333		 -49.022		 13026.732		 11		 19
i1		 51.66		 2.667		 -45.255		 13204.459		 15		 12
i1		 53.0		 1.053		 -47.07		 12878.261		 14		 15
i1		 54.06		 6.667		 -49.022		 13026.732		 10		 19
i1		 55.72		 2.667		 -45.255		 13204.459		 11		 12
i1		 57.06		 1.053		 -47.07		 12878.261		 18		 15
i1		 58.12		 6.667		 -49.022		 13026.732		 11		 19
i1		 59.78		 4.0		 -45.255		 13204.459		 13		 12
i1		 61.12		 1.053		 -47.07		 12878.261		 11		 15
i1		 62.18		 3.333		 -49.022		 13026.732		 12		 19
i1		 63.84		 6.667		 -45.255		 13204.459		 13		 12
i1		 65.18		 3.158		 -47.07		 12878.261		 10		 15
i1		 66.24		 1.667		 -49.022		 13026.732		 12		 19
i1		 67.9		 5.333		 -45.255		 13204.459		 13		 12
i1		 69.24		 4.211		 -47.07		 12878.261		 13		 15
i1		 70.3		 3.333		 -49.022		 13026.732		 12		 19
i1		 71.96		 5.333		 -45.255		 13204.459		 11		 12
i1		 73.3		 2.105		 -47.07		 12878.261		 16		 15
i1		 74.36		 1.667		 -49.022		 13026.732		 12		 19
i1		 76.02		 6.667		 -45.255		 13204.459		 14		 12
i1		 77.36		 1.053		 -47.07		 12878.261		 17		 15
i1		 78.42		 10.0		 -49.022		 13026.732		 11		 19
i1		 80.08		 6.667		 -45.255		 13204.459		 15		 12
i1		 81.42		 4.211		 -47.07		 12878.261		 16		 15
i1		 82.48		 3.333		 -49.022		 13026.732		 11		 19
i1		 84.14		 4.0		 -45.255		 13204.459		 12		 12
</CsScore>
</CsoundSynthesizer>