<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento23.wav" -W
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
i1		 22.217		 0.464		 -51.067		 356.239		 11		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.685		 0.456		 -51.22		 356.983		 52		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.153		 0.448		 -51.371		 357.729		 22		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.595		 0.464		 -51.067		 356.239		 41		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.063		 0.456		 -51.22		 356.983		 10		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.531		 0.448		 -51.371		 357.729		 18		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.973		 0.464		 -51.067		 356.239		 13		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.441		 0.456		 -51.22		 356.983		 43		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.909		 0.448		 -51.371		 357.729		 51		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.351		 0.464		 -51.067		 356.239		 35		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.819		 0.456		 -51.22		 356.983		 26		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.287		 0.448		 -51.371		 357.729		 9		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.729		 0.464		 -51.067		 356.239		 25		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.197		 0.456		 -51.22		 356.983		 40		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.665		 0.448		 -51.371		 357.729		 12		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.107		 0.464		 -51.067		 356.239		 9		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.575		 0.456		 -51.22		 356.983		 55		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.043		 0.448		 -51.371		 357.729		 32		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.485		 0.464		 -51.067		 356.239		 45		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.953		 0.456		 -51.22		 356.983		 55		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.421		 0.448		 -51.371		 357.729		 32		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.863		 0.464		 -51.067		 356.239		 51		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.331		 0.456		 -51.22		 356.983		 28		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.799		 0.448		 -51.371		 357.729		 11		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.241		 0.464		 -51.067		 356.239		 53		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.709		 0.456		 -51.22		 356.983		 26		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.177		 0.448		 -51.371		 357.729		 39		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.619		 0.464		 -51.067		 356.239		 34		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.087		 0.456		 -51.22		 356.983		 6		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.555		 0.448		 -51.371		 357.729		 57		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.997		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.465		 0.456		 -51.22		 356.983		 31		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.933		 0.448		 -51.371		 357.729		 27		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.375		 0.464		 -51.067		 356.239		 15		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.843		 0.456		 -51.22		 356.983		 37		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.311		 0.448		 -51.371		 357.729		 54		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.753		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.221		 0.456		 -51.22		 356.983		 45		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.689		 0.448		 -51.371		 357.729		 53		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.131		 0.464		 -51.067		 356.239		 53		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.599		 0.456		 -51.22		 356.983		 52		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.067		 0.448		 -51.371		 357.729		 58		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.509		 0.464		 -51.067		 356.239		 36		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.977		 0.456		 -51.22		 356.983		 3		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.445		 0.448		 -51.371		 357.729		 50		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.887		 0.464		 -51.067		 356.239		 33		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.355		 0.456		 -51.22		 356.983		 47		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.823		 0.448		 -51.371		 357.729		 53		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.265		 0.464		 -51.067		 356.239		 55		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.733		 0.456		 -51.22		 356.983		 52		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.201		 0.448		 -51.371		 357.729		 7		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.643		 0.464		 -51.067		 356.239		 56		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.111		 0.456		 -51.22		 356.983		 32		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.579		 0.448		 -51.371		 357.729		 30		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.021		 0.464		 -51.067		 356.239		 5		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.489		 0.456		 -51.22		 356.983		 40		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.957		 0.448		 -51.371		 357.729		 40		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.399		 0.464		 -51.067		 356.239		 18		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.867		 0.456		 -51.22		 356.983		 19		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.335		 0.448		 -51.371		 357.729		 16		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.777		 0.464		 -51.067		 356.239		 18		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.245		 0.456		 -51.22		 356.983		 29		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.713		 0.448		 -51.371		 357.729		 26		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.155		 0.464		 -51.067		 356.239		 23		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.623		 0.456		 -51.22		 356.983		 49		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.091		 0.448		 -51.371		 357.729		 55		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.533		 0.464		 -51.067		 356.239		 18		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.001		 0.456		 -51.22		 356.983		 56		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.469		 0.448		 -51.371		 357.729		 42		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.911		 0.464		 -51.067		 356.239		 46		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.379		 0.456		 -51.22		 356.983		 14		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.847		 0.448		 -51.371		 357.729		 31		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.289		 0.464		 -51.067		 356.239		 11		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.757		 0.456		 -51.22		 356.983		 52		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.225		 0.448		 -51.371		 357.729		 40		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.667		 0.464		 -51.067		 356.239		 14		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.135		 0.456		 -51.22		 356.983		 9		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.603		 0.448		 -51.371		 357.729		 58		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.045		 0.464		 -51.067		 356.239		 8		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.513		 0.456		 -51.22		 356.983		 27		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.981		 0.448		 -51.371		 357.729		 7		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.423		 0.464		 -51.067		 356.239		 5		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.891		 0.456		 -51.22		 356.983		 47		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.359		 0.448		 -51.371		 357.729		 46		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.801		 0.464		 -51.067		 356.239		 31		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.269		 0.456		 -51.22		 356.983		 27		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.737		 0.448		 -51.371		 357.729		 23		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.179		 0.464		 -51.067		 356.239		 48		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.647		 0.456		 -51.22		 356.983		 33		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.115		 0.448		 -51.371		 357.729		 30		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.557		 0.464		 -51.067		 356.239		 53		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.025		 0.456		 -51.22		 356.983		 45		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.493		 0.448		 -51.371		 357.729		 56		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.935		 0.464		 -51.067		 356.239		 8		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.403		 0.456		 -51.22		 356.983		 50		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.871		 0.448		 -51.371		 357.729		 37		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.313		 0.464		 -51.067		 356.239		 46		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.781		 0.456		 -51.22		 356.983		 27		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.249		 0.448		 -51.371		 357.729		 37		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.691		 0.464		 -51.067		 356.239		 39		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.159		 0.456		 -51.22		 356.983		 8		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.627		 0.448		 -51.371		 357.729		 21		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.069		 0.464		 -51.067		 356.239		 23		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.537		 0.456		 -51.22		 356.983		 33		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.005		 0.448		 -51.371		 357.729		 54		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.447		 0.464		 -51.067		 356.239		 50		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.915		 0.456		 -51.22		 356.983		 19		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.383		 0.448		 -51.371		 357.729		 44		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.825		 0.464		 -51.067		 356.239		 47		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.293		 0.456		 -51.22		 356.983		 23		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.761		 0.448		 -51.371		 357.729		 44		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.203		 0.464		 -51.067		 356.239		 52		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.671		 0.456		 -51.22		 356.983		 9		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.139		 0.448		 -51.371		 357.729		 11		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.581		 0.464		 -51.067		 356.239		 33		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.049		 0.456		 -51.22		 356.983		 55		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.517		 0.448		 -51.371		 357.729		 26		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.959		 0.464		 -51.067		 356.239		 53		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.427		 0.456		 -51.22		 356.983		 16		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.895		 0.448		 -51.371		 357.729		 34		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.337		 0.464		 -51.067		 356.239		 18		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.805		 0.456		 -51.22		 356.983		 55		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.273		 0.448		 -51.371		 357.729		 19		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.715		 0.464		 -51.067		 356.239		 17		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.183		 0.456		 -51.22		 356.983		 7		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.651		 0.448		 -51.371		 357.729		 20		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.093		 0.464		 -51.067		 356.239		 8		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.561		 0.456		 -51.22		 356.983		 45		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.029		 0.448		 -51.371		 357.729		 18		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.471		 0.464		 -51.067		 356.239		 9		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.939		 0.456		 -51.22		 356.983		 14		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.407		 0.448		 -51.371		 357.729		 35		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.849		 0.464		 -51.067		 356.239		 43		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.317		 0.456		 -51.22		 356.983		 22		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.785		 0.448		 -51.371		 357.729		 27		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.227		 0.464		 -51.067		 356.239		 6		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.695		 0.456		 -51.22		 356.983		 10		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.163		 0.448		 -51.371		 357.729		 7		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.605		 0.464		 -51.067		 356.239		 36		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.073		 0.456		 -51.22		 356.983		 4		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.541		 0.448		 -51.371		 357.729		 22		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.983		 0.464		 -51.067		 356.239		 25		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.451		 0.456		 -51.22		 356.983		 41		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.919		 0.448		 -51.371		 357.729		 7		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.361		 0.464		 -51.067		 356.239		 12		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.829		 0.456		 -51.22		 356.983		 23		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.297		 0.448		 -51.371		 357.729		 54		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.739		 0.464		 -51.067		 356.239		 7		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.207		 0.456		 -51.22		 356.983		 20		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.675		 0.448		 -51.371		 357.729		 34		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.117		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.585		 0.456		 -51.22		 356.983		 46		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.053		 0.448		 -51.371		 357.729		 33		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.495		 0.464		 -51.067		 356.239		 7		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.963		 0.456		 -51.22		 356.983		 17		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.431		 0.448		 -51.371		 357.729		 28		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.873		 0.464		 -51.067		 356.239		 43		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.341		 0.456		 -51.22		 356.983		 41		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.809		 0.448		 -51.371		 357.729		 37		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.251		 0.464		 -51.067		 356.239		 7		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.719		 0.456		 -51.22		 356.983		 28		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.187		 0.448		 -51.371		 357.729		 41		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 96.629		 0.464		 -51.067		 356.239		 31		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.097		 0.456		 -51.22		 356.983		 33		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 97.565		 0.448		 -51.371		 357.729		 48		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.007		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.475		 0.456		 -51.22		 356.983		 57		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 98.943		 0.448		 -51.371		 357.729		 4		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.385		 0.464		 -51.067		 356.239		 26		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 99.853		 0.456		 -51.22		 356.983		 53		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.321		 0.448		 -51.371		 357.729		 37		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 100.763		 0.464		 -51.067		 356.239		 13		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.231		 0.456		 -51.22		 356.983		 49		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 101.699		 0.448		 -51.371		 357.729		 23		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.141		 0.464		 -51.067		 356.239		 36		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 102.609		 0.456		 -51.22		 356.983		 33		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.077		 0.448		 -51.371		 357.729		 27		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.519		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 103.987		 0.456		 -51.22		 356.983		 15		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.455		 0.448		 -51.371		 357.729		 37		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 104.897		 0.464		 -51.067		 356.239		 5		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.365		 0.456		 -51.22		 356.983		 52		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 105.833		 0.448		 -51.371		 357.729		 17		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.275		 0.464		 -51.067		 356.239		 17		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 106.743		 0.456		 -51.22		 356.983		 34		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.211		 0.448		 -51.371		 357.729		 22		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 107.653		 0.464		 -51.067		 356.239		 6		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.121		 0.456		 -51.22		 356.983		 55		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 108.589		 0.448		 -51.371		 357.729		 34		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.031		 0.464		 -51.067		 356.239		 33		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.499		 0.456		 -51.22		 356.983		 32		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 109.967		 0.448		 -51.371		 357.729		 23		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.409		 0.464		 -51.067		 356.239		 38		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 110.877		 0.456		 -51.22		 356.983		 7		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 111.345		 0.448		 -51.371		 357.729		 29		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 111.787		 0.464		 -51.067		 356.239		 27		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 112.255		 0.456		 -51.22		 356.983		 33		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 112.723		 0.448		 -51.371		 357.729		 48		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 113.165		 0.464		 -51.067		 356.239		 23		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 113.633		 0.456		 -51.22		 356.983		 29		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 114.101		 0.448		 -51.371		 357.729		 54		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 114.543		 0.464		 -51.067		 356.239		 37		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 115.011		 0.456		 -51.22		 356.983		 27		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 115.479		 0.448		 -51.371		 357.729		 5		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 115.921		 0.464		 -51.067		 356.239		 20		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 116.389		 0.456		 -51.22		 356.983		 10		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 116.857		 0.448		 -51.371		 357.729		 19		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 117.299		 0.464		 -51.067		 356.239		 42		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 117.767		 0.456		 -51.22		 356.983		 39		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 118.235		 0.448		 -51.371		 357.729		 21		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 118.677		 0.464		 -51.067		 356.239		 29		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 119.145		 0.456		 -51.22		 356.983		 49		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 119.613		 0.448		 -51.371		 357.729		 8		 58		 357.729		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 120.055		 0.464		 -51.067		 356.239		 30		 56		 356.239		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 120.523		 0.456		 -51.22		 356.983		 21		 57		 356.983		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 120.991		 0.448		 -51.371		 357.729		 41		 58		 357.729		 2
</CsScore>
</CsoundSynthesizer>