<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione5-Comportamento3.wav" -W
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
i1		 3.0		 0.136		 -29.478		 275.093		 -8		 3		 275.093
i1		 3.045		 1.0		 -38.61		 277.105		 -5		 7		 277.105
i1		 3.545		 0.667		 -24.929		 280.885		 -5		 4		 280.885
i1		 3.878		 0.429		 -33.027		 277.684		 -3		 3		 277.684
i1		 4.021		 0.75		 -23.754		 277.105		 -8		 21		 277.105
i1		 4.271		 0.667		 -33.502		 293.764		 -2		 14		 293.764
i1		 4.604		 0.143		 -22.569		 288.0		 -1		 32		 288.0
i1		 4.652		 0.214		 -21.832		 305.314		 -7		 10		 305.314
i1		 4.723		 0.062		 -35.554		 282.65		 -2		 32		 282.65
i1		 4.754		 0.2		 -21.832		 305.314		 -3		 5		 305.314
i1		 4.854		 0.094		 -22.569		 278.264		 -5		 16		 278.264
i1		 4.885		 0.6		 -27.002		 289.205		 -3		 4		 289.205
i1		 5.085		 0.062		 -23.754		 277.684		 -3		 17		 277.684
i1		 5.147		 0.75		 -22.569		 289.81		 -21		 3		 289.81
i1		 5.397		 0.118		 -35.18		 277.105		 -14		 2		 277.105
i1		 5.456		 0.333		 -31.993		 275.093		 -30		 22		 275.093
i1		 5.789		 1.0		 -38.61		 295.912		 -7		 2		 295.912
i1		 6.289		 0.136		 -29.478		 275.093		 -32		 3		 275.093
i1		 6.334		 0.5		 -38.61		 277.105		 -5		 7		 277.105
i1		 6.834		 1.0		 -24.929		 280.885		 -16		 4		 280.885
i1		 7.167		 0.143		 -33.027		 277.684		 -3		 3		 277.684
i1		 7.31		 0.25		 -23.754		 277.105		 -17		 21		 277.105
i1		 7.56		 1.0		 -33.502		 293.764		 -3		 14		 293.764
i1		 7.893		 0.048		 -22.569		 288.0		 -2		 32		 288.0
i1		 7.941		 0.143		 -21.832		 305.314		 -20		 10		 305.314
i1		 8.012		 0.062		 -35.554		 282.65		 -2		 32		 282.65
</CsScore>
</CsoundSynthesizer>