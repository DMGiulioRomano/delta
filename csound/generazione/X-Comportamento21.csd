<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento21.wav" -W
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
i1		 20.029		 0.5		 -50.752		 352.178		 24		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.523		 0.491		 -50.425		 352.915		 40		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.017		 0.481		 -50.59		 351.444		 49		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.511		 0.5		 -50.752		 352.178		 41		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.005		 0.491		 -50.425		 352.915		 35		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.499		 0.481		 -50.59		 351.444		 36		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.993		 0.5		 -50.752		 352.178		 31		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.487		 0.491		 -50.425		 352.915		 40		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.981		 0.481		 -50.59		 351.444		 54		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.475		 0.5		 -50.752		 352.178		 10		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.969		 0.491		 -50.425		 352.915		 3		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.463		 0.481		 -50.59		 351.444		 23		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.957		 0.5		 -50.752		 352.178		 44		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.451		 0.491		 -50.425		 352.915		 22		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.945		 0.481		 -50.59		 351.444		 26		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.439		 0.5		 -50.752		 352.178		 44		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.933		 0.491		 -50.425		 352.915		 23		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.427		 0.481		 -50.59		 351.444		 45		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.921		 0.5		 -50.752		 352.178		 37		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.415		 0.491		 -50.425		 352.915		 35		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.909		 0.481		 -50.59		 351.444		 14		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.403		 0.5		 -50.752		 352.178		 42		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.897		 0.491		 -50.425		 352.915		 20		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.391		 0.481		 -50.59		 351.444		 51		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.885		 0.5		 -50.752		 352.178		 39		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.379		 0.491		 -50.425		 352.915		 45		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.873		 0.481		 -50.59		 351.444		 42		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.367		 0.5		 -50.752		 352.178		 5		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.861		 0.491		 -50.425		 352.915		 28		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.355		 0.481		 -50.59		 351.444		 19		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.849		 0.5		 -50.752		 352.178		 7		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.343		 0.491		 -50.425		 352.915		 40		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.837		 0.481		 -50.59		 351.444		 33		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.331		 0.5		 -50.752		 352.178		 34		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.825		 0.491		 -50.425		 352.915		 22		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.319		 0.481		 -50.59		 351.444		 10		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.813		 0.5		 -50.752		 352.178		 39		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.307		 0.491		 -50.425		 352.915		 26		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.801		 0.481		 -50.59		 351.444		 6		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.295		 0.5		 -50.752		 352.178		 35		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.789		 0.491		 -50.425		 352.915		 36		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.283		 0.481		 -50.59		 351.444		 38		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.777		 0.5		 -50.752		 352.178		 38		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.271		 0.491		 -50.425		 352.915		 18		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.765		 0.481		 -50.59		 351.444		 45		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.259		 0.5		 -50.752		 352.178		 24		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.753		 0.491		 -50.425		 352.915		 27		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.247		 0.481		 -50.59		 351.444		 40		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.741		 0.5		 -50.752		 352.178		 37		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.235		 0.491		 -50.425		 352.915		 16		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.729		 0.481		 -50.59		 351.444		 41		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.223		 0.5		 -50.752		 352.178		 9		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.717		 0.491		 -50.425		 352.915		 11		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.211		 0.481		 -50.59		 351.444		 31		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.705		 0.5		 -50.752		 352.178		 41		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.199		 0.491		 -50.425		 352.915		 38		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.693		 0.481		 -50.59		 351.444		 14		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.187		 0.5		 -50.752		 352.178		 26		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.681		 0.491		 -50.425		 352.915		 19		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.175		 0.481		 -50.59		 351.444		 14		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.669		 0.5		 -50.752		 352.178		 39		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.163		 0.491		 -50.425		 352.915		 43		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.657		 0.481		 -50.59		 351.444		 46		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.151		 0.5		 -50.752		 352.178		 31		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.645		 0.491		 -50.425		 352.915		 31		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.139		 0.481		 -50.59		 351.444		 51		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.633		 0.5		 -50.752		 352.178		 50		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.127		 0.491		 -50.425		 352.915		 33		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.621		 0.481		 -50.59		 351.444		 34		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.115		 0.5		 -50.752		 352.178		 27		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.609		 0.491		 -50.425		 352.915		 28		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.103		 0.481		 -50.59		 351.444		 12		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.597		 0.5		 -50.752		 352.178		 14		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.091		 0.491		 -50.425		 352.915		 3		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.585		 0.481		 -50.59		 351.444		 44		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.079		 0.5		 -50.752		 352.178		 29		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.573		 0.491		 -50.425		 352.915		 42		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.067		 0.481		 -50.59		 351.444		 7		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.561		 0.5		 -50.752		 352.178		 42		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.055		 0.491		 -50.425		 352.915		 7		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.549		 0.481		 -50.59		 351.444		 29		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.043		 0.5		 -50.752		 352.178		 40		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.537		 0.491		 -50.425		 352.915		 18		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.031		 0.481		 -50.59		 351.444		 33		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.525		 0.5		 -50.752		 352.178		 17		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.019		 0.491		 -50.425		 352.915		 15		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.513		 0.481		 -50.59		 351.444		 50		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.007		 0.5		 -50.752		 352.178		 34		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.501		 0.491		 -50.425		 352.915		 52		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.995		 0.481		 -50.59		 351.444		 44		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.489		 0.5		 -50.752		 352.178		 15		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.983		 0.491		 -50.425		 352.915		 3		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.477		 0.481		 -50.59		 351.444		 27		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.971		 0.5		 -50.752		 352.178		 35		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.465		 0.491		 -50.425		 352.915		 47		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.959		 0.481		 -50.59		 351.444		 49		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.453		 0.5		 -50.752		 352.178		 30		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.947		 0.491		 -50.425		 352.915		 27		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.441		 0.481		 -50.59		 351.444		 9		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.935		 0.5		 -50.752		 352.178		 19		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.429		 0.491		 -50.425		 352.915		 31		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.923		 0.481		 -50.59		 351.444		 29		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.417		 0.5		 -50.752		 352.178		 21		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.911		 0.491		 -50.425		 352.915		 42		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.405		 0.481		 -50.59		 351.444		 43		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.899		 0.5		 -50.752		 352.178		 19		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.393		 0.491		 -50.425		 352.915		 32		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.887		 0.481		 -50.59		 351.444		 6		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.381		 0.5		 -50.752		 352.178		 6		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.875		 0.491		 -50.425		 352.915		 47		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.369		 0.481		 -50.59		 351.444		 8		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.863		 0.5		 -50.752		 352.178		 10		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.357		 0.491		 -50.425		 352.915		 44		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.851		 0.481		 -50.59		 351.444		 16		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.345		 0.5		 -50.752		 352.178		 5		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.839		 0.491		 -50.425		 352.915		 23		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.333		 0.481		 -50.59		 351.444		 28		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.827		 0.5		 -50.752		 352.178		 37		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.321		 0.491		 -50.425		 352.915		 30		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.815		 0.481		 -50.59		 351.444		 41		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.309		 0.5		 -50.752		 352.178		 34		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.803		 0.491		 -50.425		 352.915		 26		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.297		 0.481		 -50.59		 351.444		 30		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.791		 0.5		 -50.752		 352.178		 7		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.285		 0.491		 -50.425		 352.915		 48		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.779		 0.481		 -50.59		 351.444		 44		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.273		 0.5		 -50.752		 352.178		 17		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.767		 0.491		 -50.425		 352.915		 4		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.261		 0.481		 -50.59		 351.444		 54		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.755		 0.5		 -50.752		 352.178		 24		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.249		 0.491		 -50.425		 352.915		 37		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.743		 0.481		 -50.59		 351.444		 20		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.237		 0.5		 -50.752		 352.178		 29		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.731		 0.491		 -50.425		 352.915		 44		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.225		 0.481		 -50.59		 351.444		 32		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.719		 0.5		 -50.752		 352.178		 26		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.213		 0.491		 -50.425		 352.915		 7		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.707		 0.481		 -50.59		 351.444		 23		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.201		 0.5		 -50.752		 352.178		 13		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.695		 0.491		 -50.425		 352.915		 22		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.189		 0.481		 -50.59		 351.444		 39		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.683		 0.5		 -50.752		 352.178		 46		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.177		 0.491		 -50.425		 352.915		 28		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.671		 0.481		 -50.59		 351.444		 34		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.165		 0.5		 -50.752		 352.178		 22		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.659		 0.491		 -50.425		 352.915		 21		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.153		 0.481		 -50.59		 351.444		 44		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.647		 0.5		 -50.752		 352.178		 25		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.141		 0.491		 -50.425		 352.915		 21		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.635		 0.481		 -50.59		 351.444		 20		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.129		 0.5		 -50.752		 352.178		 12		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.623		 0.491		 -50.425		 352.915		 51		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.117		 0.481		 -50.59		 351.444		 17		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.611		 0.5		 -50.752		 352.178		 4		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.105		 0.491		 -50.425		 352.915		 19		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.599		 0.481		 -50.59		 351.444		 24		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.093		 0.5		 -50.752		 352.178		 43		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.587		 0.491		 -50.425		 352.915		 52		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.081		 0.481		 -50.59		 351.444		 15		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.575		 0.5		 -50.752		 352.178		 39		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.069		 0.491		 -50.425		 352.915		 45		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.563		 0.481		 -50.59		 351.444		 48		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.057		 0.5		 -50.752		 352.178		 12		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.551		 0.491		 -50.425		 352.915		 20		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.045		 0.481		 -50.59		 351.444		 12		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.539		 0.5		 -50.752		 352.178		 46		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.033		 0.491		 -50.425		 352.915		 21		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.527		 0.481		 -50.59		 351.444		 29		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.021		 0.5		 -50.752		 352.178		 31		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.515		 0.491		 -50.425		 352.915		 43		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.009		 0.481		 -50.59		 351.444		 31		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.503		 0.5		 -50.752		 352.178		 26		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.997		 0.491		 -50.425		 352.915		 45		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.491		 0.481		 -50.59		 351.444		 29		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.985		 0.5		 -50.752		 352.178		 46		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.479		 0.491		 -50.425		 352.915		 49		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.973		 0.481		 -50.59		 351.444		 21		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.467		 0.5		 -50.752		 352.178		 23		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.961		 0.491		 -50.425		 352.915		 47		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.455		 0.481		 -50.59		 351.444		 19		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.949		 0.5		 -50.752		 352.178		 25		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.443		 0.491		 -50.425		 352.915		 42		 52		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.937		 0.481		 -50.59		 351.444		 44		 53		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.431		 0.5		 -50.752		 352.178		 44		 54		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.925		 0.491		 -50.425		 352.915		 42		 52		 352.915		 2
</CsScore>
</CsoundSynthesizer>