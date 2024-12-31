<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezione5-Comportamento2.wav" -W
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
i1		 6.0		 0.136		 -23.754		 565.301		 -3		 2		 565.301
i1		 6.045		 1.5		 -33.502		 610.628		 -8		 3		 610.628
i1		 6.545		 0.333		 -22.569		 556.529		 -11		 7		 556.529
i1		 6.878		 0.286		 -21.832		 578.411		 -16		 4		 578.411
i1		 7.021		 0.75		 -35.554		 555.368		 -9		 3		 555.368
i1		 7.271		 0.333		 -21.832		 579.62		 -28		 21		 579.62
i1		 7.604		 0.143		 -22.569		 554.209		 -5		 14		 554.209
i1		 7.652		 0.071		 -27.002		 550.186		 -10		 32		 550.186
i1		 7.723		 0.062		 -23.754		 591.824		 -2		 10		 591.824
i1		 7.754		 0.2		 -22.569		 550.186		 -14		 32		 550.186
i1		 7.854		 0.062		 -35.18		 554.209		 -2		 5		 554.209
i1		 7.885		 0.4		 -31.993		 561.771		 -1		 16		 561.771
i1		 8.085		 0.062		 -38.61		 555.368		 -21		 4		 555.368
</CsScore>
</CsoundSynthesizer>