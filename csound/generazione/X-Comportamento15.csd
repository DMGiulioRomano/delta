<CsoundSynthesizer>
<CsOptions>
; namefile
-o "csound/generazione/wav/sezioneX-Comportamento15.wav" -W
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
i1		 13.796		 0.812		 -46.75		 329.107		 10		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 14.602		 0.788		 -46.227		 329.795		 26		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 15.382		 0.765		 -46.493		 328.42		 18		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.136		 0.812		 -46.75		 329.107		 10		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 16.942		 0.788		 -46.227		 329.795		 25		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 17.722		 0.765		 -46.493		 328.42		 16		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 18.476		 0.812		 -46.75		 329.107		 15		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 19.282		 0.788		 -46.227		 329.795		 14		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.062		 0.765		 -46.493		 328.42		 27		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 20.816		 0.812		 -46.75		 329.107		 9		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 21.622		 0.788		 -46.227		 329.795		 7		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 22.402		 0.765		 -46.493		 328.42		 5		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.156		 0.812		 -46.75		 329.107		 10		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 23.962		 0.788		 -46.227		 329.795		 14		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 24.742		 0.765		 -46.493		 328.42		 22		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 25.496		 0.812		 -46.75		 329.107		 29		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 26.302		 0.788		 -46.227		 329.795		 19		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.082		 0.765		 -46.493		 328.42		 16		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 27.836		 0.812		 -46.75		 329.107		 21		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 28.642		 0.788		 -46.227		 329.795		 30		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 29.422		 0.765		 -46.493		 328.42		 24		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.176		 0.812		 -46.75		 329.107		 14		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 30.982		 0.788		 -46.227		 329.795		 14		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 31.762		 0.765		 -46.493		 328.42		 22		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 32.516		 0.812		 -46.75		 329.107		 20		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 33.322		 0.788		 -46.227		 329.795		 15		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.102		 0.765		 -46.493		 328.42		 10		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 34.856		 0.812		 -46.75		 329.107		 29		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 35.662		 0.788		 -46.227		 329.795		 25		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 36.442		 0.765		 -46.493		 328.42		 17		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 37.196		 0.812		 -46.75		 329.107		 23		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.002		 0.788		 -46.227		 329.795		 10		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 38.782		 0.765		 -46.493		 328.42		 20		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 39.536		 0.812		 -46.75		 329.107		 9		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 40.342		 0.788		 -46.227		 329.795		 33		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.122		 0.765		 -46.493		 328.42		 30		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 41.876		 0.812		 -46.75		 329.107		 8		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 42.682		 0.788		 -46.227		 329.795		 18		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 43.462		 0.765		 -46.493		 328.42		 29		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 44.216		 0.812		 -46.75		 329.107		 22		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.022		 0.788		 -46.227		 329.795		 19		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 45.802		 0.765		 -46.493		 328.42		 29		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 46.556		 0.812		 -46.75		 329.107		 27		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 47.362		 0.788		 -46.227		 329.795		 29		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.142		 0.765		 -46.493		 328.42		 19		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 48.896		 0.812		 -46.75		 329.107		 32		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 49.702		 0.788		 -46.227		 329.795		 21		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 50.482		 0.765		 -46.493		 328.42		 29		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 51.236		 0.812		 -46.75		 329.107		 13		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.042		 0.788		 -46.227		 329.795		 22		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 52.822		 0.765		 -46.493		 328.42		 21		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 53.576		 0.812		 -46.75		 329.107		 30		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 54.382		 0.788		 -46.227		 329.795		 32		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.162		 0.765		 -46.493		 328.42		 27		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 55.916		 0.812		 -46.75		 329.107		 3		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 56.722		 0.788		 -46.227		 329.795		 7		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 57.502		 0.765		 -46.493		 328.42		 13		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 58.256		 0.812		 -46.75		 329.107		 14		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.062		 0.788		 -46.227		 329.795		 9		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 59.842		 0.765		 -46.493		 328.42		 5		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 60.596		 0.812		 -46.75		 329.107		 25		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 61.402		 0.788		 -46.227		 329.795		 14		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.182		 0.765		 -46.493		 328.42		 12		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 62.936		 0.812		 -46.75		 329.107		 25		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 63.742		 0.788		 -46.227		 329.795		 29		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 64.522		 0.765		 -46.493		 328.42		 23		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 65.276		 0.812		 -46.75		 329.107		 30		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.082		 0.788		 -46.227		 329.795		 12		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 66.862		 0.765		 -46.493		 328.42		 5		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 67.616		 0.812		 -46.75		 329.107		 17		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 68.422		 0.788		 -46.227		 329.795		 12		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.202		 0.765		 -46.493		 328.42		 19		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 69.956		 0.812		 -46.75		 329.107		 4		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 70.762		 0.788		 -46.227		 329.795		 18		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 71.542		 0.765		 -46.493		 328.42		 31		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 72.296		 0.812		 -46.75		 329.107		 16		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.102		 0.788		 -46.227		 329.795		 30		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 73.882		 0.765		 -46.493		 328.42		 8		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 74.636		 0.812		 -46.75		 329.107		 15		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 75.442		 0.788		 -46.227		 329.795		 8		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.222		 0.765		 -46.493		 328.42		 22		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 76.976		 0.812		 -46.75		 329.107		 18		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 77.782		 0.788		 -46.227		 329.795		 8		 32		 329.795		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 78.562		 0.765		 -46.493		 328.42		 7		 33		 328.42		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 79.316		 0.812		 -46.75		 329.107		 7		 34		 329.107		 2
;i1		|at|		|dur|		|amp|			|freqi|			|wchZ|	|HR|	|freqf|			|funPos|
i1		 80.122		 0.788		 -46.227		 329.795		 13		 32		 329.795		 2
</CsScore>
</CsoundSynthesizer>