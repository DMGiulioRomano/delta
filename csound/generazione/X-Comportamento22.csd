<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento22.wav" -W
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
i1		 21.154		 0.481		 -51.067		 355.496		 11		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.648		 0.473		 -50.752		 356.239		 10		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.116		 0.464		 -50.911		 352.915		 27		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.584		 0.481		 -51.067		 355.496		 7		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.078		 0.473		 -50.752		 356.239		 11		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.546		 0.464		 -50.911		 352.915		 48		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.014		 0.481		 -51.067		 355.496		 41		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.508		 0.473		 -50.752		 356.239		 12		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.976		 0.464		 -50.911		 352.915		 47		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.444		 0.481		 -51.067		 355.496		 17		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.938		 0.473		 -50.752		 356.239		 6		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.406		 0.464		 -50.911		 352.915		 39		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.874		 0.481		 -51.067		 355.496		 38		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.368		 0.473		 -50.752		 356.239		 37		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.836		 0.464		 -50.911		 352.915		 40		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.304		 0.481		 -51.067		 355.496		 3		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.798		 0.473		 -50.752		 356.239		 26		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.266		 0.464		 -50.911		 352.915		 10		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.734		 0.481		 -51.067		 355.496		 40		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.228		 0.473		 -50.752		 356.239		 25		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.696		 0.464		 -50.911		 352.915		 54		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.164		 0.481		 -51.067		 355.496		 46		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.658		 0.473		 -50.752		 356.239		 55		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.126		 0.464		 -50.911		 352.915		 22		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.594		 0.481		 -51.067		 355.496		 39		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.088		 0.473		 -50.752		 356.239		 42		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.556		 0.464		 -50.911		 352.915		 4		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.024		 0.481		 -51.067		 355.496		 46		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.518		 0.473		 -50.752		 356.239		 20		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.986		 0.464		 -50.911		 352.915		 19		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.454		 0.481		 -51.067		 355.496		 40		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.948		 0.473		 -50.752		 356.239		 11		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.416		 0.464		 -50.911		 352.915		 23		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.884		 0.481		 -51.067		 355.496		 54		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.378		 0.473		 -50.752		 356.239		 7		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.846		 0.464		 -50.911		 352.915		 29		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.314		 0.481		 -51.067		 355.496		 50		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.808		 0.473		 -50.752		 356.239		 30		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.276		 0.464		 -50.911		 352.915		 48		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.744		 0.481		 -51.067		 355.496		 11		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.238		 0.473		 -50.752		 356.239		 38		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.706		 0.464		 -50.911		 352.915		 5		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.174		 0.481		 -51.067		 355.496		 15		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.668		 0.473		 -50.752		 356.239		 32		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.136		 0.464		 -50.911		 352.915		 5		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.604		 0.481		 -51.067		 355.496		 44		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.098		 0.473		 -50.752		 356.239		 42		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.566		 0.464		 -50.911		 352.915		 52		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.034		 0.481		 -51.067		 355.496		 25		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.528		 0.473		 -50.752		 356.239		 40		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.996		 0.464		 -50.911		 352.915		 54		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.464		 0.481		 -51.067		 355.496		 34		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.958		 0.473		 -50.752		 356.239		 54		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.426		 0.464		 -50.911		 352.915		 53		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.894		 0.481		 -51.067		 355.496		 15		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.388		 0.473		 -50.752		 356.239		 41		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.856		 0.464		 -50.911		 352.915		 18		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.324		 0.481		 -51.067		 355.496		 13		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.818		 0.473		 -50.752		 356.239		 51		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.286		 0.464		 -50.911		 352.915		 26		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.754		 0.481		 -51.067		 355.496		 11		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.248		 0.473		 -50.752		 356.239		 3		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.716		 0.464		 -50.911		 352.915		 23		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.184		 0.481		 -51.067		 355.496		 20		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.678		 0.473		 -50.752		 356.239		 18		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.146		 0.464		 -50.911		 352.915		 9		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.614		 0.481		 -51.067		 355.496		 52		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.108		 0.473		 -50.752		 356.239		 41		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.576		 0.464		 -50.911		 352.915		 23		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.044		 0.481		 -51.067		 355.496		 27		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.538		 0.473		 -50.752		 356.239		 46		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.006		 0.464		 -50.911		 352.915		 20		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.474		 0.481		 -51.067		 355.496		 32		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.968		 0.473		 -50.752		 356.239		 9		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.436		 0.464		 -50.911		 352.915		 6		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.904		 0.481		 -51.067		 355.496		 23		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.398		 0.473		 -50.752		 356.239		 23		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.866		 0.464		 -50.911		 352.915		 54		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.334		 0.481		 -51.067		 355.496		 12		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.828		 0.473		 -50.752		 356.239		 23		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.296		 0.464		 -50.911		 352.915		 44		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.764		 0.481		 -51.067		 355.496		 24		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.258		 0.473		 -50.752		 356.239		 6		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.726		 0.464		 -50.911		 352.915		 55		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.194		 0.481		 -51.067		 355.496		 52		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.688		 0.473		 -50.752		 356.239		 22		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.156		 0.464		 -50.911		 352.915		 13		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.624		 0.481		 -51.067		 355.496		 4		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.118		 0.473		 -50.752		 356.239		 16		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.586		 0.464		 -50.911		 352.915		 16		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.054		 0.481		 -51.067		 355.496		 7		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.548		 0.473		 -50.752		 356.239		 27		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.016		 0.464		 -50.911		 352.915		 20		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.484		 0.481		 -51.067		 355.496		 54		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.978		 0.473		 -50.752		 356.239		 37		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.446		 0.464		 -50.911		 352.915		 25		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.914		 0.481		 -51.067		 355.496		 41		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.408		 0.473		 -50.752		 356.239		 36		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.876		 0.464		 -50.911		 352.915		 14		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.344		 0.481		 -51.067		 355.496		 18		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.838		 0.473		 -50.752		 356.239		 8		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.306		 0.464		 -50.911		 352.915		 39		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.774		 0.481		 -51.067		 355.496		 32		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.268		 0.473		 -50.752		 356.239		 36		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.736		 0.464		 -50.911		 352.915		 30		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.204		 0.481		 -51.067		 355.496		 47		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.698		 0.473		 -50.752		 356.239		 25		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.166		 0.464		 -50.911		 352.915		 29		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.634		 0.481		 -51.067		 355.496		 14		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.128		 0.473		 -50.752		 356.239		 31		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.596		 0.464		 -50.911		 352.915		 49		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.064		 0.481		 -51.067		 355.496		 14		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.558		 0.473		 -50.752		 356.239		 24		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.026		 0.464		 -50.911		 352.915		 9		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.494		 0.481		 -51.067		 355.496		 47		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.988		 0.473		 -50.752		 356.239		 44		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.456		 0.464		 -50.911		 352.915		 17		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.924		 0.481		 -51.067		 355.496		 36		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.418		 0.473		 -50.752		 356.239		 3		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.886		 0.464		 -50.911		 352.915		 5		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.354		 0.481		 -51.067		 355.496		 43		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.848		 0.473		 -50.752		 356.239		 21		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.316		 0.464		 -50.911		 352.915		 19		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.784		 0.481		 -51.067		 355.496		 42		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.278		 0.473		 -50.752		 356.239		 3		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.746		 0.464		 -50.911		 352.915		 39		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.214		 0.481		 -51.067		 355.496		 30		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.708		 0.473		 -50.752		 356.239		 8		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.176		 0.464		 -50.911		 352.915		 36		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.644		 0.481		 -51.067		 355.496		 45		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.138		 0.473		 -50.752		 356.239		 31		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.606		 0.464		 -50.911		 352.915		 15		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.074		 0.481		 -51.067		 355.496		 24		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.568		 0.473		 -50.752		 356.239		 46		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.036		 0.464		 -50.911		 352.915		 20		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.504		 0.481		 -51.067		 355.496		 12		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.998		 0.473		 -50.752		 356.239		 32		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.466		 0.464		 -50.911		 352.915		 49		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.934		 0.481		 -51.067		 355.496		 4		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.428		 0.473		 -50.752		 356.239		 3		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.896		 0.464		 -50.911		 352.915		 25		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.364		 0.481		 -51.067		 355.496		 42		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.858		 0.473		 -50.752		 356.239		 21		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.326		 0.464		 -50.911		 352.915		 42		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.794		 0.481		 -51.067		 355.496		 24		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.288		 0.473		 -50.752		 356.239		 55		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.756		 0.464		 -50.911		 352.915		 38		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.224		 0.481		 -51.067		 355.496		 36		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.718		 0.473		 -50.752		 356.239		 52		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.186		 0.464		 -50.911		 352.915		 50		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.654		 0.481		 -51.067		 355.496		 29		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.148		 0.473		 -50.752		 356.239		 4		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.616		 0.464		 -50.911		 352.915		 32		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.084		 0.481		 -51.067		 355.496		 43		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.578		 0.473		 -50.752		 356.239		 14		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.046		 0.464		 -50.911		 352.915		 16		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.514		 0.481		 -51.067		 355.496		 53		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.008		 0.473		 -50.752		 356.239		 27		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.476		 0.464		 -50.911		 352.915		 27		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.944		 0.481		 -51.067		 355.496		 53		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.438		 0.473		 -50.752		 356.239		 39		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.906		 0.464		 -50.911		 352.915		 6		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.374		 0.481		 -51.067		 355.496		 49		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.868		 0.473		 -50.752		 356.239		 36		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.336		 0.464		 -50.911		 352.915		 6		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.804		 0.481		 -51.067		 355.496		 38		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.298		 0.473		 -50.752		 356.239		 47		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.766		 0.464		 -50.911		 352.915		 37		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.234		 0.481		 -51.067		 355.496		 45		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.728		 0.473		 -50.752		 356.239		 52		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.196		 0.464		 -50.911		 352.915		 19		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.664		 0.481		 -51.067		 355.496		 41		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.158		 0.473		 -50.752		 356.239		 32		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.626		 0.464		 -50.911		 352.915		 16		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.094		 0.481		 -51.067		 355.496		 40		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.588		 0.473		 -50.752		 356.239		 47		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.056		 0.464		 -50.911		 352.915		 12		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.524		 0.481		 -51.067		 355.496		 7		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.018		 0.473		 -50.752		 356.239		 17		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.486		 0.464		 -50.911		 352.915		 34		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.954		 0.481		 -51.067		 355.496		 51		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.448		 0.473		 -50.752		 356.239		 18		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.916		 0.464		 -50.911		 352.915		 8		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.384		 0.481		 -51.067		 355.496		 38		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.878		 0.473		 -50.752		 356.239		 37		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.346		 0.464		 -50.911		 352.915		 12		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.814		 0.481		 -51.067		 355.496		 14		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.308		 0.473		 -50.752		 356.239		 21		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.776		 0.464		 -50.911		 352.915		 47		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 111.244		 0.481		 -51.067		 355.496		 23		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 111.738		 0.473		 -50.752		 356.239		 23		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 112.206		 0.464		 -50.911		 352.915		 31		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 112.674		 0.481		 -51.067		 355.496		 28		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 113.168		 0.473		 -50.752		 356.239		 24		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 113.636		 0.464		 -50.911		 352.915		 6		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 114.104		 0.481		 -51.067		 355.496		 15		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 114.598		 0.473		 -50.752		 356.239		 12		 54		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 115.066		 0.464		 -50.911		 352.915		 42		 55		 352.915		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 115.534		 0.481		 -51.067		 355.496		 22		 56		 355.496		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 116.028		 0.473		 -50.752		 356.239		 16		 54		 356.239		 2
</CsScore>
</CsoundSynthesizer>