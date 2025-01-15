<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento17.wav" -W
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
i1		 15.9		 0.684		 -48.155		 334.993		 13		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.576		 0.667		 -47.712		 337.443		 33		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.252		 0.65		 -47.936		 334.294		 19		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.902		 0.684		 -48.155		 334.993		 33		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.578		 0.667		 -47.712		 337.443		 38		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.254		 0.65		 -47.936		 334.294		 20		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.904		 0.684		 -48.155		 334.993		 10		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.58		 0.667		 -47.712		 337.443		 28		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.256		 0.65		 -47.936		 334.294		 15		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.906		 0.684		 -48.155		 334.993		 14		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.582		 0.667		 -47.712		 337.443		 36		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.258		 0.65		 -47.936		 334.294		 26		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.908		 0.684		 -48.155		 334.993		 13		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.584		 0.667		 -47.712		 337.443		 32		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.26		 0.65		 -47.936		 334.294		 10		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.91		 0.684		 -48.155		 334.993		 33		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.586		 0.667		 -47.712		 337.443		 21		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.262		 0.65		 -47.936		 334.294		 39		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.912		 0.684		 -48.155		 334.993		 35		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.588		 0.667		 -47.712		 337.443		 23		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.264		 0.65		 -47.936		 334.294		 4		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.914		 0.684		 -48.155		 334.993		 10		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.59		 0.667		 -47.712		 337.443		 31		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.266		 0.65		 -47.936		 334.294		 33		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.916		 0.684		 -48.155		 334.993		 37		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.592		 0.667		 -47.712		 337.443		 19		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.268		 0.65		 -47.936		 334.294		 3		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.918		 0.684		 -48.155		 334.993		 5		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.594		 0.667		 -47.712		 337.443		 4		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.27		 0.65		 -47.936		 334.294		 6		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.92		 0.684		 -48.155		 334.993		 18		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.596		 0.667		 -47.712		 337.443		 10		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.272		 0.65		 -47.936		 334.294		 8		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.922		 0.684		 -48.155		 334.993		 37		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.598		 0.667		 -47.712		 337.443		 21		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.274		 0.65		 -47.936		 334.294		 28		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.924		 0.684		 -48.155		 334.993		 37		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.6		 0.667		 -47.712		 337.443		 18		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.276		 0.65		 -47.936		 334.294		 14		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.926		 0.684		 -48.155		 334.993		 22		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.602		 0.667		 -47.712		 337.443		 9		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.278		 0.65		 -47.936		 334.294		 35		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.928		 0.684		 -48.155		 334.993		 5		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.604		 0.667		 -47.712		 337.443		 8		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.28		 0.65		 -47.936		 334.294		 40		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.93		 0.684		 -48.155		 334.993		 23		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.606		 0.667		 -47.712		 337.443		 8		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.282		 0.65		 -47.936		 334.294		 5		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.932		 0.684		 -48.155		 334.993		 12		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.608		 0.667		 -47.712		 337.443		 26		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.284		 0.65		 -47.936		 334.294		 5		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.934		 0.684		 -48.155		 334.993		 27		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.61		 0.667		 -47.712		 337.443		 28		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.286		 0.65		 -47.936		 334.294		 6		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.936		 0.684		 -48.155		 334.993		 14		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.612		 0.667		 -47.712		 337.443		 24		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.288		 0.65		 -47.936		 334.294		 35		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.938		 0.684		 -48.155		 334.993		 37		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.614		 0.667		 -47.712		 337.443		 28		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.29		 0.65		 -47.936		 334.294		 29		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.94		 0.684		 -48.155		 334.993		 23		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.616		 0.667		 -47.712		 337.443		 22		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.292		 0.65		 -47.936		 334.294		 31		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.942		 0.684		 -48.155		 334.993		 5		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.618		 0.667		 -47.712		 337.443		 10		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.294		 0.65		 -47.936		 334.294		 29		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.944		 0.684		 -48.155		 334.993		 14		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.62		 0.667		 -47.712		 337.443		 37		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.296		 0.65		 -47.936		 334.294		 13		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.946		 0.684		 -48.155		 334.993		 11		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.622		 0.667		 -47.712		 337.443		 13		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.298		 0.65		 -47.936		 334.294		 18		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.948		 0.684		 -48.155		 334.993		 8		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.624		 0.667		 -47.712		 337.443		 8		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.3		 0.65		 -47.936		 334.294		 35		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.95		 0.684		 -48.155		 334.993		 9		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.626		 0.667		 -47.712		 337.443		 10		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.302		 0.65		 -47.936		 334.294		 15		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.952		 0.684		 -48.155		 334.993		 14		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.628		 0.667		 -47.712		 337.443		 11		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.304		 0.65		 -47.936		 334.294		 24		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.954		 0.684		 -48.155		 334.993		 29		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.63		 0.667		 -47.712		 337.443		 5		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.306		 0.65		 -47.936		 334.294		 26		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.956		 0.684		 -48.155		 334.993		 30		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.632		 0.667		 -47.712		 337.443		 31		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.308		 0.65		 -47.936		 334.294		 35		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.958		 0.684		 -48.155		 334.993		 3		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.634		 0.667		 -47.712		 337.443		 30		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.31		 0.65		 -47.936		 334.294		 7		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.96		 0.684		 -48.155		 334.993		 23		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.636		 0.667		 -47.712		 337.443		 6		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.312		 0.65		 -47.936		 334.294		 38		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.962		 0.684		 -48.155		 334.993		 17		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.638		 0.667		 -47.712		 337.443		 6		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.314		 0.65		 -47.936		 334.294		 25		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.964		 0.684		 -48.155		 334.993		 12		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.64		 0.667		 -47.712		 337.443		 27		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.316		 0.65		 -47.936		 334.294		 24		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.966		 0.684		 -48.155		 334.993		 27		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.642		 0.667		 -47.712		 337.443		 12		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.318		 0.65		 -47.936		 334.294		 30		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.968		 0.684		 -48.155		 334.993		 26		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.644		 0.667		 -47.712		 337.443		 36		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.32		 0.65		 -47.936		 334.294		 30		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.97		 0.684		 -48.155		 334.993		 7		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.646		 0.667		 -47.712		 337.443		 22		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.322		 0.65		 -47.936		 334.294		 33		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.972		 0.684		 -48.155		 334.993		 23		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.648		 0.667		 -47.712		 337.443		 5		 38		 337.443		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.324		 0.65		 -47.936		 334.294		 38		 39		 334.294		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.974		 0.684		 -48.155		 334.993		 13		 40		 334.993		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.65		 0.667		 -47.712		 337.443		 31		 38		 337.443		 2
</CsScore>
</CsoundSynthesizer>