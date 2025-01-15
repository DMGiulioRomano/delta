<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento16.wav" -W
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
i1		 14.858		 0.743		 -47.481		 332.901		 24		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 15.612		 0.722		 -47.001		 333.597		 17		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.34		 0.703		 -47.244		 330.484		 11		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.042		 0.743		 -47.481		 332.901		 9		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.796		 0.722		 -47.001		 333.597		 14		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.524		 0.703		 -47.244		 330.484		 29		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.226		 0.743		 -47.481		 332.901		 7		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.98		 0.722		 -47.001		 333.597		 33		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.708		 0.703		 -47.244		 330.484		 10		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.41		 0.743		 -47.481		 332.901		 3		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.164		 0.722		 -47.001		 333.597		 14		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.892		 0.703		 -47.244		 330.484		 9		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.594		 0.743		 -47.481		 332.901		 22		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.348		 0.722		 -47.001		 333.597		 9		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.076		 0.703		 -47.244		 330.484		 14		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.778		 0.743		 -47.481		 332.901		 20		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.532		 0.722		 -47.001		 333.597		 17		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.26		 0.703		 -47.244		 330.484		 3		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.962		 0.743		 -47.481		 332.901		 7		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.716		 0.722		 -47.001		 333.597		 24		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.444		 0.703		 -47.244		 330.484		 32		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.146		 0.743		 -47.481		 332.901		 9		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.9		 0.722		 -47.001		 333.597		 34		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.628		 0.703		 -47.244		 330.484		 13		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.33		 0.743		 -47.481		 332.901		 10		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.084		 0.722		 -47.001		 333.597		 18		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.812		 0.703		 -47.244		 330.484		 18		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.514		 0.743		 -47.481		 332.901		 28		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.268		 0.722		 -47.001		 333.597		 20		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.996		 0.703		 -47.244		 330.484		 5		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.698		 0.743		 -47.481		 332.901		 21		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.452		 0.722		 -47.001		 333.597		 5		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.18		 0.703		 -47.244		 330.484		 15		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.882		 0.743		 -47.481		 332.901		 4		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.636		 0.722		 -47.001		 333.597		 35		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.364		 0.703		 -47.244		 330.484		 12		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.066		 0.743		 -47.481		 332.901		 7		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.82		 0.722		 -47.001		 333.597		 35		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.548		 0.703		 -47.244		 330.484		 10		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.25		 0.743		 -47.481		 332.901		 4		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.004		 0.722		 -47.001		 333.597		 18		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.732		 0.703		 -47.244		 330.484		 18		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.434		 0.743		 -47.481		 332.901		 18		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.188		 0.722		 -47.001		 333.597		 27		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.916		 0.703		 -47.244		 330.484		 24		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.618		 0.743		 -47.481		 332.901		 9		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.372		 0.722		 -47.001		 333.597		 23		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.1		 0.703		 -47.244		 330.484		 8		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.802		 0.743		 -47.481		 332.901		 4		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.556		 0.722		 -47.001		 333.597		 36		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.284		 0.703		 -47.244		 330.484		 23		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.986		 0.743		 -47.481		 332.901		 33		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.74		 0.722		 -47.001		 333.597		 13		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.468		 0.703		 -47.244		 330.484		 4		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.17		 0.743		 -47.481		 332.901		 33		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.924		 0.722		 -47.001		 333.597		 9		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.652		 0.703		 -47.244		 330.484		 14		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.354		 0.743		 -47.481		 332.901		 21		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.108		 0.722		 -47.001		 333.597		 20		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.836		 0.703		 -47.244		 330.484		 31		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.538		 0.743		 -47.481		 332.901		 4		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.292		 0.722		 -47.001		 333.597		 6		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.02		 0.703		 -47.244		 330.484		 18		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.722		 0.743		 -47.481		 332.901		 12		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.476		 0.722		 -47.001		 333.597		 13		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.204		 0.703		 -47.244		 330.484		 4		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.906		 0.743		 -47.481		 332.901		 17		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.66		 0.722		 -47.001		 333.597		 25		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.388		 0.703		 -47.244		 330.484		 23		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.09		 0.743		 -47.481		 332.901		 12		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.844		 0.722		 -47.001		 333.597		 4		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.572		 0.703		 -47.244		 330.484		 8		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.274		 0.743		 -47.481		 332.901		 6		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.028		 0.722		 -47.001		 333.597		 7		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.756		 0.703		 -47.244		 330.484		 19		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.458		 0.743		 -47.481		 332.901		 12		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.212		 0.722		 -47.001		 333.597		 18		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.94		 0.703		 -47.244		 330.484		 17		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.642		 0.743		 -47.481		 332.901		 8		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.396		 0.722		 -47.001		 333.597		 10		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.124		 0.703		 -47.244		 330.484		 35		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.826		 0.743		 -47.481		 332.901		 5		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.58		 0.722		 -47.001		 333.597		 31		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.308		 0.703		 -47.244		 330.484		 15		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.01		 0.743		 -47.481		 332.901		 29		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.764		 0.722		 -47.001		 333.597		 12		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.492		 0.703		 -47.244		 330.484		 14		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.194		 0.743		 -47.481		 332.901		 10		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.948		 0.722		 -47.001		 333.597		 20		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.676		 0.703		 -47.244		 330.484		 23		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.378		 0.743		 -47.481		 332.901		 8		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.132		 0.722		 -47.001		 333.597		 23		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.86		 0.703		 -47.244		 330.484		 31		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.562		 0.743		 -47.481		 332.901		 21		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.316		 0.722		 -47.001		 333.597		 17		 35		 333.597		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.044		 0.703		 -47.244		 330.484		 10		 36		 330.484		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.746		 0.743		 -47.481		 332.901		 13		 37		 332.901		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.5		 0.722		 -47.001		 333.597		 7		 35		 333.597		 2
</CsScore>
</CsoundSynthesizer>