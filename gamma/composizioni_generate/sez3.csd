
<CsoundSynthesizer>
<CsOptions>
-o "sez3.wav" -W -d
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

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/eventoSonoro.orc"
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
f 0 41.31144948640057 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 7, 9, 12
f 1001 0 3 2 0, 1, 2
f 1002 0 3 2 6, 8, 10
f 1003 0 3 2 0, 1, 2
f 1004 0 3 2 8, 12, 8
f 1005 0 3 2 0, 1, 2
f 1006 0 3 2 2, 3, 5
f 1007 0 3 2 0, 1, 2
f 1008 0 3 2 3, 4, 2
f 1009 0 3 2 0, 1, 0
f 1010 0 3 2 1, 2, 3
f 1011 0 3 2 0, 1, 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	5.583	1000	5.583		-44.29		5		34			1001	28		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	14.047	1002	8.779		-40.99		3		9			1003	56		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	10.586	1002	8.469		-44.56		5		36			1003	20		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	7.740	1000	6.192		-41.26		4		38			1001	47		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	9.502	1002	5.939		-41.23		3		16			1003	15		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	6.662	1000	6.662		-42.20		4		36			1001	48		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	13.990	1002	8.744		-44.81		8		28			1003	4		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	7.193	1006	7.193		-44.43		8		49			1007	30		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	11.095	1002	6.934		-42.78		1		16			1003	60		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	6.243	1002	6.243		-43.89		8		16			1003	26		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.047	1000	8.047		-43.72		4		5			1001	5		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	11.245	1000	8.996		-44.72		0		16			1001	54		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	9.098	1004	5.686		-42.27		7		30			1005	53		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	6.555	1002	6.555		-41.32		9		7			1003	22		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	5.658	1002	5.658		-43.13		1		18			1003	12		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	7.577	1004	7.577		-41.62		6		11			1005	35		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.859	1002	7.087		-41.59		4		16			1003	2		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	15.807	1000	9.880		-43.92		6		22			1001	32		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	11.150	1004	6.968		-41.76		1		8			1005	39		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	5.015	1004	5.015		-43.95		5		35			1005	38		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	7.072	1000	7.072		-41.56		8		37			1001	37		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.639	1002	6.911		-43.93		5		3			1003	41		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.021	1004	8.021		-43.61		2		3			1005	27		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	14.882	1000	9.301		-42.41		1		13			1001	21		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.213	1000	5.133		-42.37		4		28			1001	6		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	6.460	1002	6.460		-43.76		3		6			1003	14		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	8.530	1004	8.530		-43.62		1		38			1005	25		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	11.419	1006	9.135		-43.66		7		17			1007	36		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	12.738	1002	7.961		-40.93		8		43			1003	52		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	11.851	1004	7.407		-41.52		3		10			1005	16		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0064	7.009	1004	5.607		-43.02		0		43			1005	33		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0090	9.380	1004	9.380		-40.74		9		29			1005	17		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0101	7.570	1004	7.570		-41.07		1		10			1005	31		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0146	5.952	1002	5.952		-43.02		4		19			1003	57		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0177	13.023	1002	8.140		-41.94		7		25			1003	10		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0177	8.473	1004	8.473		-42.48		6		4			1005	3		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0179	8.835	1002	8.835		-43.96		8		33			1003	50		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0186	9.981	1002	7.985		-42.78		7		12			1003	9		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0194	8.881	1004	8.881		-41.13		3		49			1005	51		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0196	14.600	1004	9.125		-41.62		6		40			1005	19		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0199	10.052	1004	6.282		-43.43		4		15			1005	29		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0205	10.125	1000	6.328		-43.07		7		18			1001	11		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0221	7.969	1002	6.375		-43.41		3		25			1003	59		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0240	11.017	1000	8.814		-44.68		2		3			1001	49		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0274	5.056	1000	5.056		-41.26		7		19			1001	1		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0288	5.384	1004	5.384		-42.83		3		13			1005	18		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0294	15.017	1004	9.386		-42.96		2		22			1005	58		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0329	8.037	1002	6.430		-42.04		2		17			1003	34		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0348	7.533	1002	7.533		-42.89		5		2			1003	40		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0407	6.040	1002	6.040		-41.80		3		27			1003	7		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0464	6.983	1002	6.983		-43.37		7		20			1003	44		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0476	9.022	1002	9.022		-41.10		7		3			1003	13		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0485	5.781	1002	5.781		-42.87		0		13			1003	55		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0502	10.101	1004	6.313		-40.67		2		31			1005	45		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0653	5.076	1004	5.076		-42.54		6		9			1005	24		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0738	5.622	1000	5.622		-41.27		0		6			1001	43		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0749	9.746	1002	6.091		-43.13		3		40			1003	8		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.1052	9.830	1000	6.144		-42.08		6		5			1001	46		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.1414	12.548	1002	7.843		-42.01		5		9			1003	42		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8634	13.563	1000	8.477		-40.33		2		26			1001	115		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8766	9.125	1000	7.300		-42.18		0		30			1001	70		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8954	15.378	1004	9.612		-41.01		5		48			1005	83		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8969	7.826	1000	6.261		-40.77		1		10			1001	88		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9016	5.880	1004	5.880		-42.59		2		27			1005	89		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9083	8.609	1002	8.609		-44.77		3		15			1003	101		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9129	9.007	1004	7.205		-42.08		2		9			1005	123		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9129	8.317	1000	8.317		-42.75		2		18			1001	96		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9196	8.689	1004	6.951		-41.15		2		44			1005	74		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9204	6.398	1000	6.398		-42.69		3		28			1001	90		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9208	5.979	1002	5.979		-40.42		1		46			1003	62		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9223	6.419	1000	6.419		-44.59		9		45			1001	105		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9254	9.152	1000	9.152		-41.56		4		20			1001	72		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9303	9.010	1004	7.208		-43.61		3		7			1005	80		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9333	9.166	1000	9.166		-41.77		7		17			1001	122		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9333	15.969	1002	9.981		-42.13		5		21			1003	97		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9358	6.892	1002	6.892		-40.62		5		5			1003	93		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9360	15.956	1000	9.972		-42.13		1		30			1001	121		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9364	15.846	1002	9.903		-40.49		7		21			1003	86		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9403	13.020	1002	8.138		-43.90		5		7			1003	113		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9449	9.165	1004	7.332		-40.95		6		16			1005	110		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9453	11.485	1004	7.178		-41.99		1		33			1005	79		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9497	5.209	1000	5.209		-40.91		5		6			1001	76		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9527	10.136	1004	8.109		-41.91		5		29			1005	67		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9549	5.906	1004	5.906		-41.87		3		36			1005	61		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9596	7.992	1004	7.992		-44.14		3		39			1005	100		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9608	6.989	1004	5.591		-41.55		5		37			1005	114		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9612	10.931	1000	6.832		-41.19		3		41			1001	116		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9626	5.469	1002	5.469		-43.48		5		10			1003	84		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9665	6.259	1002	6.259		-43.08		9		36			1003	106		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9687	6.937	1004	6.937		-43.65		3		20			1005	92		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9710	9.712	1002	6.070		-44.87		5		33			1003	66		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9726	9.321	1000	7.457		-44.83		6		37			1001	99		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9736	10.014	1002	8.011		-42.39		4		6			1003	120		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9770	13.805	1004	8.628		-41.24		4		10			1005	75		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9811	5.622	1000	5.622		-40.03		2		29			1001	108		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9821	12.819	1000	8.012		-43.98		9		21			1001	94		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9829	11.455	1004	7.159		-44.38		3		12			1005	78		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9863	8.012	1002	8.012		-43.29		3		8			1003	77		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9875	14.536	1004	9.085		-41.72		2		7			1005	104		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9898	6.118	1002	6.118		-41.37		0		38			1003	95		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9900	11.381	1004	7.113		-43.98		2		36			1005	98		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9916	10.324	1004	8.259		-40.76		8		8			1005	65		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9945	9.543	1000	9.543		-40.84		5		23			1001	125		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9954	10.506	1004	6.566		-42.63		9		43			1005	73		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0005	5.452	1000	5.452		-43.52		6		7			1001	117		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0046	5.487	1000	5.487		-41.35		1		8			1001	71		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0058	15.938	1002	9.961		-43.19		7		33			1003	63		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0082	10.187	1002	6.367		-44.07		6		13			1003	87		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0109	7.889	1000	7.889		-42.02		8		29			1001	81		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0120	10.905	1000	8.724		-40.92		6		45			1001	118		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0170	8.528	1000	8.528		-41.10		1		27			1001	103		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0174	5.590	1004	5.590		-43.71		7		7			1005	64		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0212	6.708	1002	5.366		-43.00		2		23			1003	69		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0294	10.749	1002	6.718		-42.19		3		40			1003	112		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0343	7.915	1004	6.332		-43.83		8		6			1005	68		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0374	9.101	1008	7.281		-41.68		9		26			1009	91		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0427	13.131	1000	8.207		-42.64		2		17			1001	107		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0490	8.993	1002	8.993		-40.88		2		40			1003	102		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0524	6.119	1002	6.119		-43.22		8		47			1003	109		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0615	8.820	1000	5.512		-43.90		5		11			1001	119		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0624	7.032	1002	5.625		-44.04		1		46			1003	85		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0663	7.683	1002	6.147		-40.60		4		46			1003	111		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	1.0841	8.611	1006	6.889		-41.65		8		21			1007	82		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.6964	10.827	1000	6.767		-40.94		8		29			1001	178		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7376	13.074	1010	8.171		-44.25		4		23			1011	126		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7574	8.288	1002	6.631		-40.73		1		11			1003	157		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7612	8.751	1006	5.469		-41.68		1		5			1007	180		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7753	10.492	1008	8.394		-41.96		3		45			1009	154		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7794	11.264	1010	7.040		-40.09		4		35			1011	190		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7838	11.490	1004	7.181		-43.59		2		10			1005	151		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7869	8.632	1004	6.906		-42.86		7		15			1005	142		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7910	6.377	1000	5.101		-41.56		5		14			1001	181		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7919	15.498	1002	9.686		-40.08		3		20			1003	177		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7933	8.240	1002	5.150		-41.57		4		28			1003	162		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7963	8.860	1004	8.860		-43.67		4		36			1005	133		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.7976	6.984	1002	5.587		-40.70		3		12			1003	149		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8055	9.469	1000	9.469		-40.52		4		36			1001	128		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8069	5.890	1008	5.890		-40.13		2		3			1009	130		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8077	11.353	1002	9.083		-42.41		6		18			1003	185		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8077	11.571	1010	7.232		-42.36		4		45			1011	160		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8078	15.481	1002	9.675		-40.18		6		37			1003	164		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8084	10.208	1010	8.166		-39.58		1		39			1011	135		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8105	10.585	1002	8.468		-44.40		1		2			1003	165		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8115	11.124	1010	8.899		-43.44		5		12			1011	161		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8128	11.881	1004	9.505		-40.91		2		9			1005	176		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8172	14.175	1002	8.859		-44.29		7		7			1003	132		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8205	10.181	1004	8.145		-40.34		1		41			1005	150		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8253	14.488	1004	9.055		-41.86		6		9			1005	179		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8257	6.858	1010	5.487		-42.79		3		15			1011	188		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8260	8.305	1000	8.305		-42.13		3		21			1001	193		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8307	11.424	1000	9.139		-39.92		6		43			1001	191		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8321	10.050	1004	8.040		-40.01		3		39			1005	173		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8329	9.216	1000	9.216		-41.15		7		40			1001	158		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8338	10.128	1010	8.102		-41.73		8		15			1011	153		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8357	8.067	1000	8.067		-42.80		1		42			1001	141		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8405	8.771	1004	8.771		-40.16		1		40			1005	143		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8420	11.576	1002	7.235		-43.93		6		36			1003	184		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8430	10.399	1000	6.500		-41.33		4		9			1001	139		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8454	10.239	1000	6.399		-42.30		1		32			1001	186		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8466	9.370	1002	9.370		-42.51		1		37			1003	146		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8469	15.486	1004	9.679		-39.98		4		24			1005	155		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8477	7.241	1010	5.793		-43.23		4		43			1011	182		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8490	7.733	1002	6.186		-39.98		5		11			1003	183		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8505	7.519	1000	7.519		-44.36		7		23			1001	138		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8512	9.188	1002	7.351		-43.43		2		1			1003	174		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8540	10.468	1010	6.542		-43.36		3		26			1011	144		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8546	9.983	1000	6.239		-40.55		6		45			1001	159		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8569	9.414	1004	9.414		-43.06		3		18			1005	189		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8630	14.158	1002	8.849		-43.82		6		6			1003	137		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8644	9.693	1010	7.754		-43.01		1		42			1011	147		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8644	5.997	1000	5.997		-43.74		5		26			1001	136		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8662	10.995	1006	6.872		-40.98		5		39			1007	175		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8678	7.703	1000	7.703		-40.78		2		17			1001	194		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8704	8.860	1006	8.860		-39.99		5		18			1007	168		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8713	5.161	1000	5.161		-44.23		5		15			1001	167		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8722	8.552	1004	8.552		-39.94		7		38			1005	172		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8740	15.143	1002	9.464		-42.80		4		28			1003	187		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8747	6.830	1002	6.830		-42.78		5		3			1003	166		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8796	5.860	1000	5.860		-40.76		1		37			1001	170		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8804	5.453	1000	5.453		-39.70		8		7			1001	171		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8826	5.851	1002	5.851		-43.16		2		30			1003	127		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8834	6.472	1004	5.178		-44.15		2		5			1005	131		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8857	8.030	1008	8.030		-41.18		8		43			1009	145		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8881	7.632	1002	7.632		-43.55		3		27			1003	129		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.8899	13.921	1004	8.701		-42.83		3		16			1005	140		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9029	14.171	1002	8.857		-43.37		1		34			1003	156		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9049	11.668	1000	7.292		-41.07		4		27			1001	148		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9061	15.050	1010	9.406		-41.85		3		42			1011	152		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9169	9.644	1004	7.716		-41.66		3		16			1005	169		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9361	7.364	1002	7.364		-40.33		2		31			1003	163		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9374	10.161	1000	6.351		-42.45		7		26			1001	192		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.9548	12.737	1004	7.961		-44.29		7		23			1005	134		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.4888	9.207	1008	9.207		-43.13		6		20			1009	262		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5181	11.082	1010	8.866		-42.74		2		33			1011	217		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5561	11.223	1000	8.978		-43.58		1		34			1001	197		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5623	9.254	1000	9.254		-39.85		2		36			1001	238		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5630	9.291	1004	5.807		-41.87		6		7			1005	218		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5729	11.155	1002	6.972		-40.73		6		23			1003	196		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5731	6.697	1002	6.697		-40.52		3		3			1003	231		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5794	9.725	1004	9.725		-43.29		8		7			1005	245		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5796	8.344	1002	6.675		-43.33		6		11			1003	244		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5801	5.995	1002	5.995		-40.12		4		39			1003	221		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5817	7.292	1004	5.834		-40.06		4		25			1005	223		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5882	10.621	1000	6.638		-42.75		3		11			1001	211		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5906	7.387	1000	5.910		-39.32		6		34			1001	206		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5926	9.994	1004	7.996		-43.51		4		18			1005	219		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5975	9.819	1004	7.855		-40.92		5		25			1005	203		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.5979	6.678	1000	6.678		-39.91		7		28			1001	225		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6073	10.840	1000	8.672		-40.22		5		29			1001	256		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6084	14.275	1004	8.922		-42.27		6		37			1005	237		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6114	10.216	1000	8.173		-40.05		1		12			1001	258		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6128	15.281	1002	9.551		-43.22		5		2			1003	204		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6189	9.814	1010	7.851		-41.40		8		10			1011	260		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6201	8.141	1002	8.141		-39.45		7		15			1003	215		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6243	7.339	1002	7.339		-41.38		5		38			1003	252		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6320	6.353	1004	6.353		-41.92		4		8			1005	246		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6325	8.990	1008	8.990		-41.14		5		9			1009	255		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6327	11.077	1000	8.861		-43.15		7		4			1001	205		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6332	15.083	1006	9.427		-42.94		6		12			1007	212		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6383	8.469	1004	8.469		-42.89		6		17			1005	195		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6397	11.382	1008	7.114		-39.88		6		35			1009	235		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6415	12.333	1004	9.867		-41.12		4		15			1005	242		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6439	8.830	1002	8.830		-41.44		7		22			1003	199		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6500	12.271	1004	7.670		-40.86		7		13			1005	233		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6513	14.412	1006	9.008		-40.34		1		8			1007	241		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6557	6.616	1000	5.292		-42.36		6		19			1001	207		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6585	7.306	1002	5.845		-41.32		1		30			1003	222		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6591	9.866	1006	6.167		-39.22		4		12			1007	202		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6615	9.968	1002	7.974		-41.24		5		14			1003	224		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6621	7.252	1000	7.252		-39.63		7		8			1001	243		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6685	10.292	1004	6.432		-43.41		4		3			1005	253		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6695	6.622	1002	6.622		-41.99		4		20			1003	259		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6699	11.120	1010	8.896		-39.06		3		16			1011	220		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6700	10.264	1000	6.415		-42.84		5		12			1001	226		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6720	7.031	1002	5.625		-40.16		1		29			1003	261		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6762	9.223	1000	5.764		-43.69		7		28			1001	250		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6766	10.985	1002	8.788		-42.13		6		25			1003	216		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6774	6.826	1008	6.826		-43.00		2		22			1009	214		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6798	8.977	1000	7.182		-41.63		6		8			1001	232		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6817	8.830	1000	8.830		-41.98		7		31			1001	236		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6836	14.720	1002	9.200		-41.50		2		2			1003	200		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6858	13.495	1000	8.434		-42.29		4		24			1001	210		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6867	13.945	1000	8.715		-42.95		7		28			1001	208		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6867	9.484	1010	5.927		-42.63		5		18			1011	227		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6882	10.398	1004	8.318		-40.31		7		18			1005	230		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6925	9.394	1006	9.394		-40.30		7		11			1007	228		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6940	8.162	1000	8.162		-39.76		7		12			1001	209		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.6962	12.867	1004	8.042		-41.40		7		16			1005	248		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7093	10.639	1006	8.511		-42.20		4		7			1007	239		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7185	9.872	1006	6.170		-40.01		4		35			1007	198		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7264	10.902	1002	8.722		-43.40		4		27			1003	240		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7313	10.695	1002	6.684		-40.67		1		40			1003	234		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7348	12.876	1000	8.048		-40.51		2		6			1001	257		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7499	12.635	1004	7.897		-41.95		3		3			1005	229		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.7642	9.309	1002	5.818		-41.46		5		11			1003	254		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.2826	11.930	1010	7.456		-42.81		6		6			1011	266		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.2898	10.929	1004	8.743		-41.33		4		32			1005	309		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.2959	7.152	1002	5.722		-38.50		4		16			1003	296		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.2971	15.438	1000	9.649		-42.33		3		8			1001	281		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3001	5.700	1004	5.700		-42.94		3		25			1005	304		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3024	14.948	1004	9.342		-42.00		1		14			1005	292		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3054	10.146	1006	6.341		-38.41		5		5			1007	278		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3082	10.532	1010	6.583		-42.76		6		27			1011	307		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3145	6.383	1006	6.383		-40.43		5		23			1007	280		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3229	11.458	1002	7.161		-42.00		2		23			1003	286		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3234	9.934	1008	9.934		-41.01		5		29			1009	316		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3263	8.828	1002	7.063		-38.28		2		33			1003	269		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3269	12.110	1010	9.688		-38.12		6		16			1011	306		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3343	10.399	1000	6.499		-40.82		5		31			1001	272		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3366	15.684	1008	9.802		-40.94		4		15			1009	297		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3374	10.566	1004	8.453		-42.27		1		25			1005	289		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3399	8.954	1010	5.596		-43.06		6		13			1011	294		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3401	9.012	1004	7.210		-38.99		4		31			1005	283		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3447	7.466	1006	7.466		-38.54		4		19			1007	282		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3472	8.793	1002	8.793		-42.58		2		8			1003	271		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3504	8.175	1008	8.175		-42.20		2		29			1009	318		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3524	10.216	1000	6.385		-40.86		5		33			1001	312		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3543	11.438	1004	7.149		-41.02		5		33			1005	276		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3544	6.968	1004	5.574		-40.53		1		13			1005	279		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3576	5.826	1004	5.826		-40.00		2		29			1005	299		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3594	8.149	1002	6.519		-42.21		6		30			1003	290		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3636	8.937	1006	5.586		-42.33		6		16			1007	300		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3637	7.492	1004	7.492		-40.31		6		30			1005	267		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3651	9.517	1004	9.517		-40.09		5		19			1005	288		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3688	5.850	1006	5.850		-38.20		3		4			1007	302		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3697	9.330	1002	5.831		-38.14		6		10			1003	270		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3712	9.315	1000	7.452		-38.27		3		30			1001	308		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3733	9.420	1004	9.420		-41.74		2		27			1005	268		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3757	7.758	1004	6.206		-40.49		6		27			1005	301		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3765	10.164	1000	8.131		-39.49		2		30			1001	274		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3804	11.143	1004	8.914		-41.91		4		9			1005	287		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3821	6.209	1002	6.209		-38.62		5		8			1003	264		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3825	15.929	1002	9.956		-40.92		6		12			1003	303		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3834	9.004	1002	5.627		-40.81		4		1			1003	273		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3838	15.239	1008	9.525		-42.71		5		2			1009	284		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3893	8.263	1008	6.611		-38.13		5		13			1009	311		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3900	11.595	1000	9.276		-38.15		3		33			1001	285		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3902	5.454	1000	5.454		-39.27		2		13			1001	317		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.3923	13.705	1010	8.566		-39.90		3		22			1011	293		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4035	11.293	1006	7.058		-42.28		5		19			1007	277		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4059	6.211	1002	6.211		-42.19		4		31			1003	291		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4165	9.061	1000	5.663		-38.29		2		8			1001	314		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4208	6.673	1008	6.673		-41.67		6		17			1009	298		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4358	6.511	1004	6.511		-41.68		6		11			1005	295		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4373	5.715	1000	5.715		-39.67		5		8			1001	305		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4403	6.167	1000	6.167		-40.47		3		30			1001	313		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	15.4542	9.084	1000	5.678		-41.06		4		29			1001	275		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
