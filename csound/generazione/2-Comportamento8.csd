<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione2-Comportamento8.wav" -W
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
i1		 53.0		 10.417		 -45.255		 8531.892		 10		 12
i1		 55.075		 5.0		 -47.07		 8585.507		 14		 15
i1		 56.75		 5.263		 -49.022		 8748.0		 16		 19
i1		 58.075		 6.25		 -45.255		 8531.892		 12		 12
i1		 60.15		 6.667		 -47.07		 8585.507		 11		 15
i1		 61.825		 3.947		 -49.022		 8748.0		 11		 19
i1		 63.15		 10.417		 -45.255		 8531.892		 10		 12
i1		 65.225		 10.0		 -47.07		 8585.507		 9		 15
i1		 66.9		 5.263		 -49.022		 8748.0		 19		 19
i1		 68.225		 10.417		 -45.255		 8531.892		 10		 12
i1		 70.3		 3.333		 -47.07		 8585.507		 15		 15
i1		 71.975		 3.947		 -49.022		 8748.0		 15		 19
i1		 73.3		 12.5		 -45.255		 8531.892		 12		 12
i1		 75.375		 3.333		 -47.07		 8585.507		 9		 15
i1		 77.05		 6.579		 -49.022		 8748.0		 13		 19
i1		 78.375		 10.417		 -45.255		 8531.892		 9		 12
i1		 80.45		 10.0		 -47.07		 8585.507		 10		 15
i1		 82.125		 3.947		 -49.022		 8748.0		 12		 19
i1		 83.45		 4.167		 -45.255		 8531.892		 9		 12
i1		 85.525		 3.333		 -47.07		 8585.507		 12		 15
i1		 87.2		 3.947		 -49.022		 8748.0		 14		 19
</CsScore>
</CsoundSynthesizer>