<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento13.wav" -W
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
        ifn = p9
        iT = ($M_PI*2)/iHR
        iradi = 0 + (iwhichZero-1) * iT
    ; lettura tabella fasore
        kndx line 0, p3, 1                  ; Vary our index linearly from 0 to 1.
        ktab table kndx, ifn, 1
        krad = iradi + (ktab * iT * idirection)
        kEnv = abs(sin(krad*iHR/2))
        kMid1 = cos(krad)
        kSide1=sin(krad)
        kfreq line ifreq, p3, ifreq2
    ; sintesi                  
        as poscil3 iamp*kEnv, kfreq
        aMid = kMid1 * as
        aSide = kSide1 * as
        aL = (aMid+aSide)/sqrt(2)
        aR = (aMid-aSide)/sqrt(2)
        aEnvL = aL ;* kEnv
        aEnvR = aR ;* kEnv
            outs aEnvL,aEnvR;,a1,a2,aL,aR,aMid,aSide
    endin

</CsInstruments>
<CsScore>
f1 0 16777216 10 1

; "comportamento"
; ---- GEN07 (spezzata di rette) pfields: ----
; number, start, size, 		GEN07,   p5/p6/p7...=valore/segmenti
f 2		  0 	 16777216	7		0 16777216 1
; ---- Eventi sonori ----
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 11.608		 0.929		 -45.377		 325.356		 23		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 12.544		 0.897		 -45.669		 324.0		 29		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 13.428		 0.867		 -45.074		 324.677		 9		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 14.286		 0.929		 -45.377		 325.356		 4		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 15.222		 0.897		 -45.669		 324.0		 20		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.106		 0.867		 -45.074		 324.677		 11		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.964		 0.929		 -45.377		 325.356		 14		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.9		 0.897		 -45.669		 324.0		 23		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.784		 0.867		 -45.074		 324.677		 16		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.642		 0.929		 -45.377		 325.356		 11		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.578		 0.897		 -45.669		 324.0		 4		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.462		 0.867		 -45.074		 324.677		 30		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.32		 0.929		 -45.377		 325.356		 7		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.256		 0.897		 -45.669		 324.0		 29		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.14		 0.867		 -45.074		 324.677		 22		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.998		 0.929		 -45.377		 325.356		 17		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.934		 0.897		 -45.669		 324.0		 26		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.818		 0.867		 -45.074		 324.677		 27		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.676		 0.929		 -45.377		 325.356		 5		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.612		 0.897		 -45.669		 324.0		 12		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.496		 0.867		 -45.074		 324.677		 14		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.354		 0.929		 -45.377		 325.356		 18		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.29		 0.897		 -45.669		 324.0		 8		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.174		 0.867		 -45.074		 324.677		 12		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.032		 0.929		 -45.377		 325.356		 13		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.968		 0.897		 -45.669		 324.0		 8		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.852		 0.867		 -45.074		 324.677		 12		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.71		 0.929		 -45.377		 325.356		 13		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.646		 0.897		 -45.669		 324.0		 6		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.53		 0.867		 -45.074		 324.677		 4		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.388		 0.929		 -45.377		 325.356		 24		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.324		 0.897		 -45.669		 324.0		 6		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.208		 0.867		 -45.074		 324.677		 14		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.066		 0.929		 -45.377		 325.356		 19		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.002		 0.897		 -45.669		 324.0		 11		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.886		 0.867		 -45.074		 324.677		 9		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.744		 0.929		 -45.377		 325.356		 21		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.68		 0.897		 -45.669		 324.0		 19		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.564		 0.867		 -45.074		 324.677		 6		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.422		 0.929		 -45.377		 325.356		 23		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.358		 0.897		 -45.669		 324.0		 9		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.242		 0.867		 -45.074		 324.677		 25		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.1		 0.929		 -45.377		 325.356		 10		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.036		 0.897		 -45.669		 324.0		 11		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.92		 0.867		 -45.074		 324.677		 6		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.778		 0.929		 -45.377		 325.356		 14		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.714		 0.897		 -45.669		 324.0		 19		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.598		 0.867		 -45.074		 324.677		 28		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.456		 0.929		 -45.377		 325.356		 20		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.392		 0.897		 -45.669		 324.0		 7		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.276		 0.867		 -45.074		 324.677		 15		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.134		 0.929		 -45.377		 325.356		 7		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.07		 0.897		 -45.669		 324.0		 20		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.954		 0.867		 -45.074		 324.677		 21		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.812		 0.929		 -45.377		 325.356		 17		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.748		 0.897		 -45.669		 324.0		 9		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.632		 0.867		 -45.074		 324.677		 10		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.49		 0.929		 -45.377		 325.356		 18		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.426		 0.897		 -45.669		 324.0		 5		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.31		 0.867		 -45.074		 324.677		 13		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.168		 0.929		 -45.377		 325.356		 16		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.104		 0.897		 -45.669		 324.0		 3		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.988		 0.867		 -45.074		 324.677		 13		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.846		 0.929		 -45.377		 325.356		 25		 29		 325.356		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.782		 0.897		 -45.669		 324.0		 25		 30		 324.0		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.666		 0.867		 -45.074		 324.677		 30		 28		 324.677		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.524		 0.929		 -45.377		 325.356		 28		 29		 325.356		 2
</CsScore>
</CsoundSynthesizer>