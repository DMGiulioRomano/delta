<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione5-Comportamento1.wav" -W
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
        ifreq2 = p8
        iT = ($M_PI*2)/iHR
        iradi = 0 + (iwhichZero-1) * iT
        iradf = iradi + (idirection*iT)        
        krad line iradi,p3,iradf
        kEnv = abs(sin(krad*iHR/2))
        kMid1 = cos(krad)
        kSide1=sin(krad)
        kfreq line ifreq, p3, ifreq2
    ; sintesi                  
        as poscil3 iamp, kfreq
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
i1		 0.0		 0.136		 -29.478		 169.428		 -5		 3		 169.428
i1		 0.045		 1.5		 -38.61		 169.782		 -5		 7		 169.782
i1		 0.545		 1.0		 -24.929		 172.995		 -14		 4		 172.995
i1		 0.878		 0.143		 -33.027		 171.023		 -3		 3		 171.023
i1		 1.021		 0.5		 -23.754		 169.782		 -12		 21		 169.782
i1		 1.271		 0.667		 -33.502		 180.927		 -2		 14		 180.927
i1		 1.604		 0.143		 -22.569		 176.457		 -1		 32		 176.457
i1		 1.652		 0.214		 -21.832		 188.041		 -17		 10		 188.041
i1		 1.723		 0.094		 -35.554		 174.082		 -2		 32		 174.082
i1		 1.754		 0.2		 -21.832		 188.041		 -3		 5		 188.041
i1		 1.854		 0.094		 -22.569		 171.381		 -7		 16		 171.381
i1		 1.885		 0.4		 -27.002		 178.119		 -2		 4		 178.119
i1		 2.085		 0.188		 -23.754		 171.023		 -2		 17		 171.023
i1		 2.147		 0.75		 -22.569		 178.492		 -11		 3		 178.492
i1		 2.397		 0.059		 -35.18		 169.782		 -5		 2		 169.782
i1		 2.456		 1.0		 -31.993		 169.428		 -14		 22		 169.428
i1		 2.789		 1.5		 -38.61		 182.25		 -8		 2		 182.25
i1		 3.289		 0.045		 -29.478		 169.428		 -8		 3		 169.428
i1		 3.334		 1.5		 -38.61		 169.782		 -5		 7		 169.782
i1		 3.834		 0.333		 -24.929		 172.995		 -13		 4		 172.995
i1		 4.167		 0.429		 -33.027		 171.023		 -2		 3		 171.023
i1		 4.31		 0.75		 -23.754		 169.782		 -5		 21		 169.782
i1		 4.56		 1.0		 -33.502		 180.927		 -2		 14		 180.927
i1		 4.893		 0.143		 -22.569		 176.457		 -1		 32		 176.457
i1		 4.941		 0.143		 -21.832		 188.041		 -7		 10		 188.041
i1		 5.012		 0.062		 -35.554		 174.082		 -1		 32		 174.082
</CsScore>
</CsoundSynthesizer>