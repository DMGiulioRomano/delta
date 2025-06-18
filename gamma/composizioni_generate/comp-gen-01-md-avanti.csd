
<CsoundSynthesizer>
<CsOptions>
-o "comp-gen-01-md-avanti.wav" -W -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

#define SQRT2 #1.4142135623730951#
#define MAX_AMP #0.999#
#define FONDAMENTALE #32#
#define OTTAVE #10#
#define INTERVALLI #200#
#define REGISTRI #50#
#define M_PI #3.141592653589793#
gSdirSco = "./sco/"
gi_Index init 1
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0
gi_debug init 2

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/eventoSonoroOld.orc"
#include "../includes/comportamento.orc"
#include "../includes/avvia_comportamento.orc"

instr Init
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 0 then
        prints "ERRORE: Inizializzazione del sistema pitagorico fallita!\n"
    endif
    ires system_i 1, sprintf("mkdir %s", gSdirSco)
    turnoff
endin

</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 2 3 5
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 1 2 3
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 3 4 2
f 1005 0 3 -2 0 1 0
f 1006 0 4 -2 2 10 4 15
f 1007 0 4 -2 0 1 2 3
f 1008 0 4 -2 3 20 5 8
f 1009 0 4 -2 0 1 2 3

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0010	53.712	1000	42.970		-34.18		1		1			1001	1	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0010	94.227	1000	58.892		-33.45		0		2			1001	2	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0166	69.415	1000	43.384		-32.09		0		1			1001	4	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0459	49.423	1002	49.423		-30.33		0		2			1003	3	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.6733	61.396	1004	49.117		-34.56		1		2			1005	5	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.6833	65.695	1004	41.059		-31.55		0		1			1005	6	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.7432	56.257	1004	45.006		-31.58		1		2			1005	7	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.7936	54.798	1006	54.798		-34.27		0		1			1007	8	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	2.8000	84.127	1004	52.579		-34.04		1		1			1005	9	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	2.8748	67.015	1000	53.612		-33.02		1		2			1001	11	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	2.8888	52.269	1004	41.815		-29.96		0		2			1005	10	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.2855	76.527	1004	47.829		-31.44		2		2			1005	12	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.3146	53.720	1000	53.720		-34.37		1		1			1001	13	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	11.1669	62.019	1000	49.615		-33.26		1		1			1001	15	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	11.1940	52.682	1002	52.682		-30.94		0		2			1003	14	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	11.2027	73.020	1004	45.638		-34.18		2		2			1005	17	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	11.2403	50.745	1008	50.745		-30.23		1		2			1009	16	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	17.4580	61.623	1004	38.515		-33.04		1		2			1005	20	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	17.4746	53.578	1000	42.862		-32.58		1		2			1001	19	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	17.4897	52.235	1006	32.647		-33.01		1		2			1007	18	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	17.5140	43.021	1008	43.021		-29.59		3		3			1009	21	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	17.6162	50.571	1004	50.571		-31.66		1		3			1005	22	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	25.1282	38.290	1002	38.290		-30.25		1		2			1003	25	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	25.1694	38.637	1002	38.637		-29.08		1		4			1003	26	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	25.1887	50.425	1004	31.515		-32.82		3		3			1005	27	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	25.2146	38.653	1006	38.653		-30.18		3		3			1007	23	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	25.2161	52.710	1000	42.168		-30.80		3		2			1001	24	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.2623	40.153	1008	32.123		-28.55		1		2			1009	28	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.3133	43.528	1000	34.822		-29.92		4		3			1001	29	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.3493	63.779	1002	39.862		-27.70		4		3			1003	30	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.3702	41.235	1008	25.772		-28.76		2		4			1009	31	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.7195	35.632	1008	35.632		-31.21		2		3			1009	33	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.7498	35.808	1008	35.808		-31.30		3		5			1009	35	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.7695	34.689	1006	27.752		-27.77		2		3			1007	38	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.7718	57.802	1008	36.126		-26.85		2		3			1009	39	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.7840	41.232	1006	25.770		-28.93		3		2			1007	36	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.8233	58.694	1004	36.684		-31.10		2		3			1005	32	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.8804	52.951	1008	33.094		-28.12		4		3			1009	34	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	44.9174	31.795	1002	25.436		-30.25		3		3			1003	37	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.6196	29.816	1000	23.853		-40.25		5		3			1001	44	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.6833	16.232	1004	16.232		-38.19		5		6			1005	45	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.6867	30.334	1008	18.959		-36.20		6		3			1009	46	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.7193	23.815	1006	19.052		-26.40		3		3			1007	41	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.7231	29.439	1008	18.399		-28.59		2		3			1009	42	2		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.7364	31.657	1000	25.326		-29.40		2		3			1001	40	1		0.0000		110.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	56.7651	34.854	1008	27.884		-36.78		6		4			1009	43	2		0.0000		110.000	7.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
