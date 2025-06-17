
<CsoundSynthesizer>
<CsOptions>
-o "composizione_generativa_01.wav" -W -d
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

gi_debug init 1

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/initIsoAmp.orc"
#include "../includes/eventoSonoro.orc"
#include "../includes/voce.orc"

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
f 0 171.82130621070243 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 18 25 30
f 1001 0 3 -2 0 1 2
f 1002 0 4 -2 3 20 5 8
f 1003 0 4 -2 0 1 2 3
f 1004 0 4 -2 2 10 4 15
f 1005 0 4 -2 0 1 2 3
f 1006 0 3 -2 16 20 24
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 20 28 20
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 3 4 2
f 1011 0 3 -2 0 1 0
f 1012 0 3 -2 1 2 3
f 1013 0 3 -2 0 1 2
f 1014 0 3 -2 2 3 5
f 1015 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	92.661	1008	57.913		3			2		2			1009	13		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	65.579	1000	52.463		3			0		2			1001	7		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	60.650	1004	48.520		3			1		1			1005	14		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	42.119	1006	42.119		3			1		1			1007	15		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	58.073	1006	58.073		3			0		2			1007	6		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	64.155	1008	51.324		3			0		2			1009	10		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0017	56.742	1004	56.742		3			1		2			1005	17		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0223	64.554	1006	51.643		3			0		1			1007	5		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0230	69.844	1000	43.653		3			0		1			1001	12		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0307	61.531	1006	49.224		3			1		2			1007	8		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0322	69.596	1006	55.677		3			1		2			1007	9		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0348	51.087	1008	40.870		3			2		2			1009	16		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0483	69.140	1000	55.312		3			0		1			1001	2		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0504	56.157	1002	44.926		3			2		1			1003	3		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0558	51.742	1004	51.742		3			1		1			1005	4		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0564	73.714	1004	58.971		3			1		1			1005	19		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0574	66.239	1008	52.991		3			1		2			1009	18		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0610	49.938	1008	49.938		3			1		1			1009	11		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1051	48.022	1000	48.022		3			2		1			1001	1		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.2569	70.101	1008	56.081		3			0		1			1009	20		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3202	63.104	1006	50.483		3			0		1			1007	21		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3839	91.086	1008	56.929		3			1		2			1009	22		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.6336	72.084	1006	45.053		3			0		1			1007	23		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.7464	63.297	1008	50.638		3			0		1			1009	24		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.1624	62.495	1000	49.996		3			2		2			1001	25		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.8947	72.491	1008	45.307		3			0		2			1009	28		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.9411	73.574	1004	45.984		3			2		2			1005	26		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.9799	52.227	1004	52.227		3			2		1			1005	27		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.0871	71.951	1006	44.969		3			1		1			1007	30		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.1180	55.800	1000	44.640		3			2		2			1001	29		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.2010	64.946	1008	40.591		3			2		2			1009	31		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8913	56.200	1008	44.960		3			2		2			1009	32		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.4940	62.590	1008	50.072		3			2		2			1009	34		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.5124	66.974	1006	53.580		3			1		2			1007	35		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.6129	71.625	1006	57.300		3			2		2			1007	33		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.9301	82.098	1008	51.311		3			1		3			1009	38		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.0433	44.506	1004	44.506		3			2		2			1005	37		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.0547	46.364	1008	46.364		3			1		2			1009	36		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.8143	42.323	1002	42.323		3			2		1			1003	42		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.8420	59.890	1000	37.431		3			1		2			1001	39		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.8587	64.126	1006	51.301		3			1		2			1007	40		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.9123	48.977	1008	48.977		3			2		3			1009	41		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.2353	56.132	1008	35.083		3			2		3			1009	44		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.2895	34.190	1008	34.190		3			1		3			1009	43		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.3595	52.426	1006	52.426		3			2		2			1007	46		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.3643	59.215	1000	47.372		3			3		1			1001	45		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	30.7979	70.997	1002	44.373		3			3		3			1003	47		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	30.8171	56.480	1000	35.300		3			1		4			1001	49		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	30.8547	39.924	1008	31.939		3			2		3			1009	50		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	30.8901	45.188	1006	45.188		3			2		2			1007	48		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	30.9126	48.001	1002	38.401		3			2		4			1003	51		1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.0363	12.498	1010	7.811		4			5		23			1011	52		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.2283	5.472	1014	5.472		4			8		3			1015	54		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.2927	8.213	1012	5.133		4			8		6			1013	53		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.3421	5.804	1010	3.628		4			6		11			1011	55		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.4192	5.978	1010	4.783		4			5		15			1011	57		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.6909	4.959	1014	4.959		4			6		7			1015	58		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.7340	6.076	1014	4.861		3			6		14			1015	61		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.8172	3.901	1010	3.901		4			7		27			1011	59		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	90.8701	5.156	1014	5.156		4			5		10			1015	62		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.2482	10.148	1014	6.343		4			6		32			1015	63		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.6011	5.465	1004	3.416		4			5		4			1005	64		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.7938	8.475	1012	6.780		3			9		29			1013	66		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.8100	6.716	1012	4.198		4			7		30			1013	65		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.8929	8.954	1012	5.596		3			5		11			1013	67		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	91.9784	7.200	1012	4.500		3			7		26			1013	68		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	93.6273	11.891	1012	7.432		4			6		12			1013	70		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	93.8120	12.139	1012	7.587		4			9		36			1013	71		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.1339	8.420	1010	8.420		3			8		24			1011	72		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.3884	7.998	1014	6.399		4			9		33			1015	73		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.8074	13.266	1010	8.291		4			7		8			1011	74		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.8237	10.405	1014	6.503		4			7		26			1015	76		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.9062	5.179	1002	5.179		4			5		33			1003	77		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.9284	4.783	1010	4.783		4			7		1			1011	78		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	94.9952	5.477	1010	5.477		4			6		32			1011	79		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	95.1864	5.585	1010	3.490		4			7		12			1011	80		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	95.3635	8.468	1014	8.468		4			6		17			1015	82		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	95.7650	12.477	1014	7.798		4			7		16			1015	83		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.2981	5.684	1010	4.547		3			8		4			1011	84		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.4158	11.520	1012	7.200		4			5		5			1013	86		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.4639	12.955	1012	8.097		3			6		32			1013	85		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.5874	3.882	1010	3.882		4			6		36			1011	87		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.8102	10.085	1012	6.303		4			9		30			1013	88		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.9026	4.592	1002	4.592		4			7		32			1003	90		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	96.9201	7.808	1010	6.247		3			8		25			1011	89		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.1087	5.325	1014	5.325		4			7		5			1015	91		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.1993	8.742	1010	8.742		4			8		25			1011	94		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.2699	9.896	1012	6.185		3			6		6			1013	93		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.2725	10.252	1010	8.201		4			7		35			1011	95		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.3644	7.259	1014	7.259		4			8		15			1015	96		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.4909	7.417	1010	7.417		3			5		10			1011	99		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.5145	5.506	1014	5.506		4			5		11			1015	97		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	97.7452	5.588	1012	4.471		4			9		28			1013	100		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	98.0902	9.075	1010	7.260		4			6		26			1011	101		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	98.6572	12.329	1012	7.706		3			6		4			1013	102		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	98.8614	9.107	1012	5.692		4			8		28			1013	103		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	99.4171	4.663	1002	4.663		4			7		8			1003	104		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	99.6026	6.835	1014	5.468		4			8		7			1015	105		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	99.7724	8.208	1014	6.566		4			6		24			1015	106		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	99.8369	9.834	1012	7.867		4			6		17			1013	108		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	99.8990	4.944	1014	4.944		4			8		13			1015	109		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	100.1225	7.690	1012	4.806		4			8		27			1013	110		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	100.9604	9.802	1014	6.126		4			7		2			1015	111		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	101.2660	8.233	1010	5.146		3			8		3			1011	112		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	101.3729	4.450	1014	4.450		4			7		12			1015	114		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	101.5202	7.295	1010	4.560		3			8		2			1011	115		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	101.5879	11.620	1014	9.296		4			5		16			1015	116		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	101.7941	6.328	1010	5.062		4			6		8			1011	118		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	102.3251	9.519	1012	7.615		4			7		5			1013	119		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	102.5038	8.649	1010	8.649		4			6		8			1011	120		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	102.6191	5.353	1010	4.282		4			8		29			1011	121		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	102.6381	11.839	1012	7.399		3			6		3			1013	122		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	103.2629	5.775	1014	5.775		4			6		1			1015	123		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	103.3057	7.010	1010	7.010		4			6		8			1011	124		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	103.5786	10.465	1014	8.372		4			6		26			1015	125		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	103.6071	6.039	1002	6.039		3			8		31			1003	126		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	103.7200	8.125	1010	5.078		4			7		24			1011	127		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	104.0692	10.477	1004	6.548		4			8		4			1005	128		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	104.4154	11.556	1010	9.245		3			6		30			1011	129		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	104.6223	13.235	1012	8.272		4			6		24			1013	131		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.1136	8.017	1010	6.414		3			5		4			1011	132		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.2786	8.169	1014	6.535		3			8		13			1015	133		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.4742	12.108	1004	7.568		4			5		11			1005	134		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.8005	14.832	1014	9.270		4			5		10			1015	135		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.8546	9.915	1014	6.197		4			7		13			1015	137		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	105.9027	9.592	1014	5.995		4			7		9			1015	138		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.0595	9.067	1012	5.667		4			8		2			1013	139		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.1847	11.381	1012	9.105		4			6		14			1013	140		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.4235	9.461	1002	5.913		4			6		28			1003	142		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.4444	13.993	1010	8.746		4			6		7			1011	141		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.5800	6.492	1014	6.492		4			7		4			1015	143		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.5879	7.700	1010	4.813		4			5		21			1011	145		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.6056	8.385	1002	5.241		4			5		7			1003	144		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.6672	9.836	1004	9.836		4			8		15			1005	146		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	106.9860	14.380	1004	8.988		4			4		9			1005	147		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	107.1242	7.964	1014	7.964		4			6		3			1015	148		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	107.3647	10.178	1014	8.142		4			5		19			1015	149		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	107.5839	7.456	1014	5.965		3			6		25			1015	150		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	107.9622	11.724	1012	9.379		4			7		23			1013	151		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	108.6971	15.453	1010	9.658		4			5		14			1011	152		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	109.3955	11.056	1010	8.844		4			8		12			1011	153		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	109.7373	5.129	1014	5.129		4			5		28			1015	154		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	110.1857	13.814	1010	8.634		4			8		9			1011	156		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	110.3034	8.751	1014	7.001		3			5		3			1015	155		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	110.3323	8.880	1010	7.104		4			5		26			1011	157		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	110.5619	6.314	1014	5.051		4			7		19			1015	158		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	111.1001	9.794	1010	6.121		4			5		3			1011	159		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	111.3242	15.945	1010	9.966		4			6		9			1011	160		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	111.5806	13.625	1012	8.516		3			4		14			1013	161		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	111.7502	8.849	1012	5.531		3			7		8			1013	163		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.0569	7.236	1014	5.789		4			7		9			1015	164		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.4909	7.999	1014	6.399		4			5		17			1015	167		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.5273	10.404	1012	8.323		4			8		17			1013	166		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.5633	9.545	1010	5.966		3			5		6			1011	168		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.6427	9.208	1012	5.755		3			7		2			1013	169		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.8170	11.723	1014	7.327		4			4		20			1015	170		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	112.8922	6.505	1010	6.505		3			6		13			1011	171		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	114.5100	7.065	1010	7.065		3			5		21			1011	173		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	114.6016	9.507	1014	5.942		4			7		13			1015	176		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	114.6594	8.232	1012	6.585		4			6		23			1013	174		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	114.8634	6.026	1014	6.026		4			5		7			1015	177		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	115.1843	6.136	1014	6.136		3			4		21			1015	178		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	116.0875	7.606	1012	6.085		3			5		7			1013	180		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	116.1338	13.376	1012	8.360		4			7		17			1013	179		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	116.5301	5.829	1010	5.829		3			8		7			1011	181		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	116.7907	8.476	1014	8.476		3			6		12			1015	182		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.0692	10.673	1012	8.539		4			7		16			1013	183		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.5226	7.407	1014	7.407		3			6		14			1015	184		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.8784	8.851	1010	5.532		4			5		17			1011	186		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.9035	10.362	1014	8.290		4			8		11			1015	188		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.9247	11.047	1014	8.837		4			5		11			1015	189		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.9483	8.075	1014	8.075		4			7		2			1015	187		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	117.9832	11.044	1010	6.903		4			5		24			1011	185		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	118.4244	14.601	1014	9.125		4			7		13			1015	190		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	118.4419	13.429	1014	8.393		3			7		9			1015	191		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	118.9567	6.588	1010	6.588		4			4		5			1011	193		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	118.9857	9.937	1014	6.211		4			6		8			1015	192		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	119.1400	5.524	1014	5.524		3			5		3			1015	194		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	119.6455	5.870	1010	5.870		3			6		2			1011	195		3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.0322	15.576	1014	9.735		4			4		7			1015	196		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.0773	17.254	1010	10.784		3			5		18			1011	197		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.1145	7.391	1014	7.391		4			6		23			1015	199		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.1943	8.483	1014	8.483		4			5		10			1015	200		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.4882	14.554	1010	9.096		4			6		7			1011	201		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	120.6348	6.705	1014	6.705		4			7		9			1015	202		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	121.3398	7.575	1012	6.060		3			6		13			1013	203		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	121.5510	9.774	1014	6.108		4			5		3			1015	204		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	122.5773	12.102	1012	9.681		4			6		13			1013	205		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	122.8081	10.864	1010	8.691		4			8		18			1011	206		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	122.9721	18.126	1014	11.329		4			8		2			1015	207		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	123.2953	13.894	1012	8.683		4			6		6			1013	209		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	123.3249	11.644	1014	11.644		3			6		9			1015	208		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	123.3715	14.551	1010	11.641		4			7		19			1011	210		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	123.4810	11.935	1014	9.548		4			5		2			1015	211		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	124.3631	14.266	1014	11.413		4			8		9			1015	212		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	124.7416	10.739	1014	8.591		4			8		20			1015	214		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	124.7969	10.645	1010	6.653		4			6		18			1011	213		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	125.0304	12.484	1010	7.803		4			5		2			1011	215		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	125.2662	9.974	1014	6.234		4			5		5			1015	216		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	125.5631	15.840	1012	9.900		3			4		7			1013	217		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	125.7897	10.090	1014	8.072		3			8		20			1015	218		0		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	152.7054	7.527	1012	4.704		3			6		9			1013	219		2		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	154.8248	6.997	1002	4.373		4			6		30			1003	220		3		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
