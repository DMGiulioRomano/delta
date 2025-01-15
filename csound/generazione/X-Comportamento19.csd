<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento19.wav" -W
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
i1		 17.973		 0.565		 -49.364		 343.478		 41		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.545		 0.553		 -49.55		 345.99		 37		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.091		 0.542		 -49.732		 346.713		 3		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.637		 0.565		 -49.364		 343.478		 26		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.209		 0.553		 -49.55		 345.99		 13		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.755		 0.542		 -49.732		 346.713		 44		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.301		 0.565		 -49.364		 343.478		 30		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.873		 0.553		 -49.55		 345.99		 24		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.419		 0.542		 -49.732		 346.713		 12		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.965		 0.565		 -49.364		 343.478		 6		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.537		 0.553		 -49.55		 345.99		 20		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.083		 0.542		 -49.732		 346.713		 26		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.629		 0.565		 -49.364		 343.478		 3		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.201		 0.553		 -49.55		 345.99		 9		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.747		 0.542		 -49.732		 346.713		 26		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.293		 0.565		 -49.364		 343.478		 12		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.865		 0.553		 -49.55		 345.99		 17		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.411		 0.542		 -49.732		 346.713		 10		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.957		 0.565		 -49.364		 343.478		 35		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.529		 0.553		 -49.55		 345.99		 36		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.075		 0.542		 -49.732		 346.713		 28		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.621		 0.565		 -49.364		 343.478		 28		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.193		 0.553		 -49.55		 345.99		 40		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.739		 0.542		 -49.732		 346.713		 24		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.285		 0.565		 -49.364		 343.478		 11		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.857		 0.553		 -49.55		 345.99		 5		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.403		 0.542		 -49.732		 346.713		 44		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.949		 0.565		 -49.364		 343.478		 37		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.521		 0.553		 -49.55		 345.99		 34		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.067		 0.542		 -49.732		 346.713		 5		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.613		 0.565		 -49.364		 343.478		 22		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.185		 0.553		 -49.55		 345.99		 13		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.731		 0.542		 -49.732		 346.713		 13		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.277		 0.565		 -49.364		 343.478		 22		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.849		 0.553		 -49.55		 345.99		 19		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.395		 0.542		 -49.732		 346.713		 17		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.941		 0.565		 -49.364		 343.478		 5		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.513		 0.553		 -49.55		 345.99		 27		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.059		 0.542		 -49.732		 346.713		 18		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.605		 0.565		 -49.364		 343.478		 28		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.177		 0.553		 -49.55		 345.99		 46		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.723		 0.542		 -49.732		 346.713		 25		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.269		 0.565		 -49.364		 343.478		 35		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.841		 0.553		 -49.55		 345.99		 27		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.387		 0.542		 -49.732		 346.713		 15		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.933		 0.565		 -49.364		 343.478		 41		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.505		 0.553		 -49.55		 345.99		 20		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.051		 0.542		 -49.732		 346.713		 47		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.597		 0.565		 -49.364		 343.478		 16		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.169		 0.553		 -49.55		 345.99		 20		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.715		 0.542		 -49.732		 346.713		 24		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.261		 0.565		 -49.364		 343.478		 15		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.833		 0.553		 -49.55		 345.99		 31		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.379		 0.542		 -49.732		 346.713		 30		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.925		 0.565		 -49.364		 343.478		 46		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.497		 0.553		 -49.55		 345.99		 19		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.043		 0.542		 -49.732		 346.713		 40		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.589		 0.565		 -49.364		 343.478		 41		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.161		 0.553		 -49.55		 345.99		 41		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.707		 0.542		 -49.732		 346.713		 24		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.253		 0.565		 -49.364		 343.478		 40		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.825		 0.553		 -49.55		 345.99		 39		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.371		 0.542		 -49.732		 346.713		 41		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.917		 0.565		 -49.364		 343.478		 33		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.489		 0.553		 -49.55		 345.99		 15		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.035		 0.542		 -49.732		 346.713		 30		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.581		 0.565		 -49.364		 343.478		 46		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.153		 0.553		 -49.55		 345.99		 42		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.699		 0.542		 -49.732		 346.713		 47		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.245		 0.565		 -49.364		 343.478		 15		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.817		 0.553		 -49.55		 345.99		 21		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.363		 0.542		 -49.732		 346.713		 31		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.909		 0.565		 -49.364		 343.478		 20		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.481		 0.553		 -49.55		 345.99		 38		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.027		 0.542		 -49.732		 346.713		 14		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.573		 0.565		 -49.364		 343.478		 15		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.145		 0.553		 -49.55		 345.99		 36		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.691		 0.542		 -49.732		 346.713		 19		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.237		 0.565		 -49.364		 343.478		 31		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.809		 0.553		 -49.55		 345.99		 20		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.355		 0.542		 -49.732		 346.713		 5		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.901		 0.565		 -49.364		 343.478		 19		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.473		 0.553		 -49.55		 345.99		 14		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.019		 0.542		 -49.732		 346.713		 17		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.565		 0.565		 -49.364		 343.478		 17		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.137		 0.553		 -49.55		 345.99		 10		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.683		 0.542		 -49.732		 346.713		 11		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.229		 0.565		 -49.364		 343.478		 17		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.801		 0.553		 -49.55		 345.99		 16		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.347		 0.542		 -49.732		 346.713		 29		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.893		 0.565		 -49.364		 343.478		 29		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.465		 0.553		 -49.55		 345.99		 44		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.011		 0.542		 -49.732		 346.713		 41		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.557		 0.565		 -49.364		 343.478		 40		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.129		 0.553		 -49.55		 345.99		 19		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.675		 0.542		 -49.732		 346.713		 6		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.221		 0.565		 -49.364		 343.478		 19		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.793		 0.553		 -49.55		 345.99		 26		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.339		 0.542		 -49.732		 346.713		 11		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.885		 0.565		 -49.364		 343.478		 42		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.457		 0.553		 -49.55		 345.99		 27		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.003		 0.542		 -49.732		 346.713		 29		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.549		 0.565		 -49.364		 343.478		 22		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.121		 0.553		 -49.55		 345.99		 26		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.667		 0.542		 -49.732		 346.713		 27		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.213		 0.565		 -49.364		 343.478		 3		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.785		 0.553		 -49.55		 345.99		 12		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.331		 0.542		 -49.732		 346.713		 35		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.877		 0.565		 -49.364		 343.478		 38		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.449		 0.553		 -49.55		 345.99		 12		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.995		 0.542		 -49.732		 346.713		 28		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.541		 0.565		 -49.364		 343.478		 37		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.113		 0.553		 -49.55		 345.99		 33		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.659		 0.542		 -49.732		 346.713		 7		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.205		 0.565		 -49.364		 343.478		 28		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.777		 0.553		 -49.55		 345.99		 38		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.323		 0.542		 -49.732		 346.713		 16		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.869		 0.565		 -49.364		 343.478		 10		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.441		 0.553		 -49.55		 345.99		 43		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.987		 0.542		 -49.732		 346.713		 7		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.533		 0.565		 -49.364		 343.478		 17		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.105		 0.553		 -49.55		 345.99		 18		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.651		 0.542		 -49.732		 346.713		 21		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.197		 0.565		 -49.364		 343.478		 45		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.769		 0.553		 -49.55		 345.99		 4		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.315		 0.542		 -49.732		 346.713		 39		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.861		 0.565		 -49.364		 343.478		 6		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.433		 0.553		 -49.55		 345.99		 16		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.979		 0.542		 -49.732		 346.713		 15		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.525		 0.565		 -49.364		 343.478		 36		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.097		 0.553		 -49.55		 345.99		 34		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.643		 0.542		 -49.732		 346.713		 41		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.189		 0.565		 -49.364		 343.478		 16		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.761		 0.553		 -49.55		 345.99		 20		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.307		 0.542		 -49.732		 346.713		 48		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.853		 0.565		 -49.364		 343.478		 7		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.425		 0.553		 -49.55		 345.99		 39		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.971		 0.542		 -49.732		 346.713		 28		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.517		 0.565		 -49.364		 343.478		 39		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.089		 0.553		 -49.55		 345.99		 36		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.635		 0.542		 -49.732		 346.713		 4		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.181		 0.565		 -49.364		 343.478		 28		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.753		 0.553		 -49.55		 345.99		 46		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.299		 0.542		 -49.732		 346.713		 45		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.845		 0.565		 -49.364		 343.478		 27		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.417		 0.553		 -49.55		 345.99		 42		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.963		 0.542		 -49.732		 346.713		 15		 48		 346.713		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.509		 0.565		 -49.364		 343.478		 27		 46		 343.478		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.081		 0.553		 -49.55		 345.99		 42		 47		 345.99		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.627		 0.542		 -49.732		 346.713		 33		 48		 346.713		 2
</CsScore>
</CsoundSynthesizer>