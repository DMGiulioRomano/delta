<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento18.wav" -W
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
i1		 16.942		 0.619		 -48.98		 339.564		 24		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.566		 0.605		 -48.577		 342.047		 33		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.164		 0.591		 -48.781		 338.855		 37		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.762		 0.619		 -48.98		 339.564		 40		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.386		 0.605		 -48.577		 342.047		 27		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.984		 0.591		 -48.781		 338.855		 18		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.582		 0.619		 -48.98		 339.564		 33		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.206		 0.605		 -48.577		 342.047		 30		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.804		 0.591		 -48.781		 338.855		 4		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.402		 0.619		 -48.98		 339.564		 7		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.026		 0.605		 -48.577		 342.047		 19		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.624		 0.591		 -48.781		 338.855		 30		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.222		 0.619		 -48.98		 339.564		 40		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.846		 0.605		 -48.577		 342.047		 14		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.444		 0.591		 -48.781		 338.855		 18		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.042		 0.619		 -48.98		 339.564		 29		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.666		 0.605		 -48.577		 342.047		 19		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.264		 0.591		 -48.781		 338.855		 31		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.862		 0.619		 -48.98		 339.564		 29		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.486		 0.605		 -48.577		 342.047		 30		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.084		 0.591		 -48.781		 338.855		 13		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.682		 0.619		 -48.98		 339.564		 3		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.306		 0.605		 -48.577		 342.047		 33		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.904		 0.591		 -48.781		 338.855		 38		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.502		 0.619		 -48.98		 339.564		 18		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.126		 0.605		 -48.577		 342.047		 26		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.724		 0.591		 -48.781		 338.855		 5		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.322		 0.619		 -48.98		 339.564		 15		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.946		 0.605		 -48.577		 342.047		 25		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.544		 0.591		 -48.781		 338.855		 9		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.142		 0.619		 -48.98		 339.564		 39		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.766		 0.605		 -48.577		 342.047		 3		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.364		 0.591		 -48.781		 338.855		 30		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.962		 0.619		 -48.98		 339.564		 3		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.586		 0.605		 -48.577		 342.047		 5		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.184		 0.591		 -48.781		 338.855		 11		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.782		 0.619		 -48.98		 339.564		 21		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.406		 0.605		 -48.577		 342.047		 29		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.004		 0.591		 -48.781		 338.855		 20		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.602		 0.619		 -48.98		 339.564		 37		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.226		 0.605		 -48.577		 342.047		 21		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.824		 0.591		 -48.781		 338.855		 25		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.422		 0.619		 -48.98		 339.564		 21		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.046		 0.605		 -48.577		 342.047		 10		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.644		 0.591		 -48.781		 338.855		 27		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.242		 0.619		 -48.98		 339.564		 27		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.866		 0.605		 -48.577		 342.047		 24		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.464		 0.591		 -48.781		 338.855		 23		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.062		 0.619		 -48.98		 339.564		 23		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.686		 0.605		 -48.577		 342.047		 29		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.284		 0.591		 -48.781		 338.855		 19		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.882		 0.619		 -48.98		 339.564		 37		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.506		 0.605		 -48.577		 342.047		 8		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.104		 0.591		 -48.781		 338.855		 44		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.702		 0.619		 -48.98		 339.564		 40		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.326		 0.605		 -48.577		 342.047		 4		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.924		 0.591		 -48.781		 338.855		 17		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.522		 0.619		 -48.98		 339.564		 10		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.146		 0.605		 -48.577		 342.047		 41		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.744		 0.591		 -48.781		 338.855		 34		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.342		 0.619		 -48.98		 339.564		 21		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.966		 0.605		 -48.577		 342.047		 29		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.564		 0.591		 -48.781		 338.855		 14		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.162		 0.619		 -48.98		 339.564		 35		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.786		 0.605		 -48.577		 342.047		 20		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.384		 0.591		 -48.781		 338.855		 5		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.982		 0.619		 -48.98		 339.564		 11		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.606		 0.605		 -48.577		 342.047		 18		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.204		 0.591		 -48.781		 338.855		 6		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.802		 0.619		 -48.98		 339.564		 12		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.426		 0.605		 -48.577		 342.047		 20		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.024		 0.591		 -48.781		 338.855		 37		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.622		 0.619		 -48.98		 339.564		 27		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.246		 0.605		 -48.577		 342.047		 30		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.844		 0.591		 -48.781		 338.855		 17		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.442		 0.619		 -48.98		 339.564		 27		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.066		 0.605		 -48.577		 342.047		 17		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.664		 0.591		 -48.781		 338.855		 43		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.262		 0.619		 -48.98		 339.564		 27		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.886		 0.605		 -48.577		 342.047		 34		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.484		 0.591		 -48.781		 338.855		 40		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.082		 0.619		 -48.98		 339.564		 14		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.706		 0.605		 -48.577		 342.047		 21		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.304		 0.591		 -48.781		 338.855		 32		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.902		 0.619		 -48.98		 339.564		 4		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.526		 0.605		 -48.577		 342.047		 17		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.124		 0.591		 -48.781		 338.855		 38		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.722		 0.619		 -48.98		 339.564		 12		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.346		 0.605		 -48.577		 342.047		 19		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.944		 0.591		 -48.781		 338.855		 14		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.542		 0.619		 -48.98		 339.564		 27		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.166		 0.605		 -48.577		 342.047		 27		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.764		 0.591		 -48.781		 338.855		 34		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.362		 0.619		 -48.98		 339.564		 31		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.986		 0.605		 -48.577		 342.047		 25		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.584		 0.591		 -48.781		 338.855		 42		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.182		 0.619		 -48.98		 339.564		 34		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.806		 0.605		 -48.577		 342.047		 16		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.404		 0.591		 -48.781		 338.855		 10		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.002		 0.619		 -48.98		 339.564		 41		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.626		 0.605		 -48.577		 342.047		 6		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.224		 0.591		 -48.781		 338.855		 25		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.822		 0.619		 -48.98		 339.564		 39		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.446		 0.605		 -48.577		 342.047		 20		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.044		 0.591		 -48.781		 338.855		 16		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.642		 0.619		 -48.98		 339.564		 3		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.266		 0.605		 -48.577		 342.047		 18		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 81.864		 0.591		 -48.781		 338.855		 22		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 82.462		 0.619		 -48.98		 339.564		 40		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.086		 0.605		 -48.577		 342.047		 43		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 83.684		 0.591		 -48.781		 338.855		 13		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.282		 0.619		 -48.98		 339.564		 20		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 84.906		 0.605		 -48.577		 342.047		 9		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 85.504		 0.591		 -48.781		 338.855		 30		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.102		 0.619		 -48.98		 339.564		 22		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 86.726		 0.605		 -48.577		 342.047		 38		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.324		 0.591		 -48.781		 338.855		 16		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 87.922		 0.619		 -48.98		 339.564		 40		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 88.546		 0.605		 -48.577		 342.047		 36		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.144		 0.591		 -48.781		 338.855		 5		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 89.742		 0.619		 -48.98		 339.564		 6		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.366		 0.605		 -48.577		 342.047		 41		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 90.964		 0.591		 -48.781		 338.855		 42		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 91.562		 0.619		 -48.98		 339.564		 23		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.186		 0.605		 -48.577		 342.047		 7		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 92.784		 0.591		 -48.781		 338.855		 18		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 93.382		 0.619		 -48.98		 339.564		 26		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.006		 0.605		 -48.577		 342.047		 11		 42		 342.047		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 94.604		 0.591		 -48.781		 338.855		 36		 43		 338.855		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.202		 0.619		 -48.98		 339.564		 29		 44		 339.564		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 95.826		 0.605		 -48.577		 342.047		 12		 42		 342.047		 2
</CsScore>
</CsoundSynthesizer>