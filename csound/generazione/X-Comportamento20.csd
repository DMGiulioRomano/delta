<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento20.wav" -W
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
i1		 19.004		 0.51		 -50.257		 350.711		 11		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.524		 0.5		 -50.425		 351.444		 45		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.018		 0.491		 -50.59		 352.178		 23		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.512		 0.51		 -50.257		 350.711		 9		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.032		 0.5		 -50.425		 351.444		 13		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.526		 0.491		 -50.59		 352.178		 26		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.02		 0.51		 -50.257		 350.711		 7		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.54		 0.5		 -50.425		 351.444		 14		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.034		 0.491		 -50.59		 352.178		 11		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.528		 0.51		 -50.257		 350.711		 50		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.048		 0.5		 -50.425		 351.444		 26		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.542		 0.491		 -50.59		 352.178		 53		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.036		 0.51		 -50.257		 350.711		 4		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.556		 0.5		 -50.425		 351.444		 51		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.05		 0.491		 -50.59		 352.178		 21		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.544		 0.51		 -50.257		 350.711		 16		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.064		 0.5		 -50.425		 351.444		 31		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.558		 0.491		 -50.59		 352.178		 11		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.052		 0.51		 -50.257		 350.711		 10		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.572		 0.5		 -50.425		 351.444		 14		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.066		 0.491		 -50.59		 352.178		 46		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.56		 0.51		 -50.257		 350.711		 33		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.08		 0.5		 -50.425		 351.444		 26		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.574		 0.491		 -50.59		 352.178		 33		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.068		 0.51		 -50.257		 350.711		 30		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.588		 0.5		 -50.425		 351.444		 28		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.082		 0.491		 -50.59		 352.178		 8		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.576		 0.51		 -50.257		 350.711		 30		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.096		 0.5		 -50.425		 351.444		 41		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.59		 0.491		 -50.59		 352.178		 42		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.084		 0.51		 -50.257		 350.711		 21		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.604		 0.5		 -50.425		 351.444		 4		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.098		 0.491		 -50.59		 352.178		 7		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.592		 0.51		 -50.257		 350.711		 8		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.112		 0.5		 -50.425		 351.444		 35		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.606		 0.491		 -50.59		 352.178		 33		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.1		 0.51		 -50.257		 350.711		 44		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.62		 0.5		 -50.425		 351.444		 36		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.114		 0.491		 -50.59		 352.178		 36		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.608		 0.51		 -50.257		 350.711		 25		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.128		 0.5		 -50.425		 351.444		 27		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.622		 0.491		 -50.59		 352.178		 46		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.116		 0.51		 -50.257		 350.711		 40		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.636		 0.5		 -50.425		 351.444		 34		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.13		 0.491		 -50.59		 352.178		 14		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.624		 0.51		 -50.257		 350.711		 49		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.144		 0.5		 -50.425		 351.444		 15		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.638		 0.491		 -50.59		 352.178		 48		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.132		 0.51		 -50.257		 350.711		 16		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.652		 0.5		 -50.425		 351.444		 30		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.146		 0.491		 -50.59		 352.178		 51		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.64		 0.51		 -50.257		 350.711		 20		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.16		 0.5		 -50.425		 351.444		 17		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.654		 0.491		 -50.59		 352.178		 53		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.148		 0.51		 -50.257		 350.711		 16		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.668		 0.5		 -50.425		 351.444		 20		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.162		 0.491		 -50.59		 352.178		 50		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.656		 0.51		 -50.257		 350.711		 34		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.176		 0.5		 -50.425		 351.444		 51		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.67		 0.491		 -50.59		 352.178		 40		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.164		 0.51		 -50.257		 350.711		 25		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.684		 0.5		 -50.425		 351.444		 25		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.178		 0.491		 -50.59		 352.178		 48		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.672		 0.51		 -50.257		 350.711		 7		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.192		 0.5		 -50.425		 351.444		 6		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.686		 0.491		 -50.59		 352.178		 39		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.18		 0.51		 -50.257		 350.711		 48		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.7		 0.5		 -50.425		 351.444		 7		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.194		 0.491		 -50.59		 352.178		 41		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.688		 0.51		 -50.257		 350.711		 16		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.208		 0.5		 -50.425		 351.444		 46		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.702		 0.491		 -50.59		 352.178		 23		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.196		 0.51		 -50.257		 350.711		 8		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.716		 0.5		 -50.425		 351.444		 25		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.21		 0.491		 -50.59		 352.178		 42		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.704		 0.51		 -50.257		 350.711		 14		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.224		 0.5		 -50.425		 351.444		 46		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.718		 0.491		 -50.59		 352.178		 9		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.212		 0.51		 -50.257		 350.711		 27		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.732		 0.5		 -50.425		 351.444		 7		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.226		 0.491		 -50.59		 352.178		 45		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.72		 0.51		 -50.257		 350.711		 14		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.24		 0.5		 -50.425		 351.444		 22		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.734		 0.491		 -50.59		 352.178		 31		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.228		 0.51		 -50.257		 350.711		 36		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.748		 0.5		 -50.425		 351.444		 33		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.242		 0.491		 -50.59		 352.178		 19		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.736		 0.51		 -50.257		 350.711		 33		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.256		 0.5		 -50.425		 351.444		 31		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.75		 0.491		 -50.59		 352.178		 24		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.244		 0.51		 -50.257		 350.711		 32		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.764		 0.5		 -50.425		 351.444		 12		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.258		 0.491		 -50.59		 352.178		 26		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.752		 0.51		 -50.257		 350.711		 15		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.272		 0.5		 -50.425		 351.444		 19		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.766		 0.491		 -50.59		 352.178		 16		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.26		 0.51		 -50.257		 350.711		 44		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.78		 0.5		 -50.425		 351.444		 7		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.274		 0.491		 -50.59		 352.178		 4		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.768		 0.51		 -50.257		 350.711		 26		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.288		 0.5		 -50.425		 351.444		 12		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.782		 0.491		 -50.59		 352.178		 41		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.276		 0.51		 -50.257		 350.711		 41		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.796		 0.5		 -50.425		 351.444		 39		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.29		 0.491		 -50.59		 352.178		 30		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.784		 0.51		 -50.257		 350.711		 33		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.304		 0.5		 -50.425		 351.444		 7		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.798		 0.491		 -50.59		 352.178		 15		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.292		 0.51		 -50.257		 350.711		 39		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.812		 0.5		 -50.425		 351.444		 41		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.306		 0.491		 -50.59		 352.178		 26		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.8		 0.51		 -50.257		 350.711		 34		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.32		 0.5		 -50.425		 351.444		 38		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.814		 0.491		 -50.59		 352.178		 49		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.308		 0.51		 -50.257		 350.711		 45		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.828		 0.5		 -50.425		 351.444		 49		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.322		 0.491		 -50.59		 352.178		 49		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.816		 0.51		 -50.257		 350.711		 15		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.336		 0.5		 -50.425		 351.444		 44		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.83		 0.491		 -50.59		 352.178		 29		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.324		 0.51		 -50.257		 350.711		 33		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.844		 0.5		 -50.425		 351.444		 50		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.338		 0.491		 -50.59		 352.178		 15		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.832		 0.51		 -50.257		 350.711		 31		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.352		 0.5		 -50.425		 351.444		 3		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.846		 0.491		 -50.59		 352.178		 9		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.34		 0.51		 -50.257		 350.711		 10		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.86		 0.5		 -50.425		 351.444		 25		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.354		 0.491		 -50.59		 352.178		 23		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.848		 0.51		 -50.257		 350.711		 45		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.368		 0.5		 -50.425		 351.444		 48		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.862		 0.491		 -50.59		 352.178		 10		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.356		 0.51		 -50.257		 350.711		 50		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.876		 0.5		 -50.425		 351.444		 6		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.37		 0.491		 -50.59		 352.178		 11		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.864		 0.51		 -50.257		 350.711		 41		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.384		 0.5		 -50.425		 351.444		 45		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.878		 0.491		 -50.59		 352.178		 37		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.372		 0.51		 -50.257		 350.711		 19		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.892		 0.5		 -50.425		 351.444		 27		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.386		 0.491		 -50.59		 352.178		 37		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.88		 0.51		 -50.257		 350.711		 30		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.4		 0.5		 -50.425		 351.444		 6		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.894		 0.491		 -50.59		 352.178		 49		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.388		 0.51		 -50.257		 350.711		 45		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.908		 0.5		 -50.425		 351.444		 11		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.402		 0.491		 -50.59		 352.178		 7		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.896		 0.51		 -50.257		 350.711		 24		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.416		 0.5		 -50.425		 351.444		 27		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.91		 0.491		 -50.59		 352.178		 8		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.404		 0.51		 -50.257		 350.711		 23		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.924		 0.5		 -50.425		 351.444		 16		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.418		 0.491		 -50.59		 352.178		 41		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.912		 0.51		 -50.257		 350.711		 39		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.432		 0.5		 -50.425		 351.444		 5		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.926		 0.491		 -50.59		 352.178		 31		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.42		 0.51		 -50.257		 350.711		 37		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.94		 0.5		 -50.425		 351.444		 40		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.434		 0.491		 -50.59		 352.178		 53		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.928		 0.51		 -50.257		 350.711		 51		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.448		 0.5		 -50.425		 351.444		 22		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.942		 0.491		 -50.59		 352.178		 34		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.436		 0.51		 -50.257		 350.711		 14		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.956		 0.5		 -50.425		 351.444		 49		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.45		 0.491		 -50.59		 352.178		 44		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.944		 0.51		 -50.257		 350.711		 38		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.464		 0.5		 -50.425		 351.444		 48		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.958		 0.491		 -50.59		 352.178		 38		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.452		 0.51		 -50.257		 350.711		 4		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.972		 0.5		 -50.425		 351.444		 15		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.466		 0.491		 -50.59		 352.178		 47		 53		 352.178		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.96		 0.51		 -50.257		 350.711		 26		 51		 350.711		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.48		 0.5		 -50.425		 351.444		 25		 52		 351.444		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.974		 0.491		 -50.59		 352.178		 28		 53		 352.178		 2
</CsScore>
</CsoundSynthesizer>