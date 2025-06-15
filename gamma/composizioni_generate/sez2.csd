
<CsoundSynthesizer>
<CsOptions>
-o "sez2.wav" -W -d
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
f 0 39.22280461941487 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 8, 12, 8
f 1001 0 3 2 0, 1, 2
f 1002 0 3 2 6, 8, 10
f 1003 0 3 2 0, 1, 2
f 1004 0 3 2 3, 4, 2
f 1005 0 3 2 0, 1, 0
f 1006 0 3 2 7, 9, 12
f 1007 0 3 2 0, 1, 2
f 1008 0 3 2 2, 3, 5
f 1009 0 3 2 0, 1, 2
f 1010 0 3 2 1, 2, 3
f 1011 0 3 2 0, 1, 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3023	17.866	1000	11.166		-41.96		8		43			1001	21		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3030	14.145	1004	11.316		-41.63		8		16			1005	17		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3037	18.369	1000	11.481		-39.40		8		14			1001	3		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3171	14.803	1006	11.842		-42.71		2		43			1007	78		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3233	19.665	1008	12.291		-39.43		3		34			1009	45		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3271	11.740	1002	11.740		-42.52		8		2			1003	24		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3289	10.786	1002	10.786		-42.49		4		4			1003	10		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3319	15.199	1002	12.159		-40.23		1		3			1003	71		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3381	17.483	1004	10.927		-40.13		2		29			1005	73		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3404	15.048	1006	12.039		-42.54		3		33			1007	8		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3404	13.192	1002	10.554		-43.00		4		12			1003	48		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3414	13.387	1006	10.709		-42.11		1		12			1007	79		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3492	15.592	1000	12.474		-40.68		8		5			1001	1		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3500	19.084	1008	11.927		-42.67		7		32			1009	15		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3552	11.646	1002	11.646		-42.60		4		11			1003	9		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3560	12.216	1006	12.216		-42.32		8		37			1007	34		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3617	15.317	1006	12.254		-40.88		5		25			1007	22		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3653	12.743	1002	10.194		-38.87		8		11			1003	40		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3656	10.657	1000	10.657		-41.36		1		26			1001	47		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3667	12.427	1006	12.427		-39.25		4		37			1007	27		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3682	17.972	1002	11.233		-41.69		6		33			1003	52		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3708	17.435	1002	10.897		-40.83		1		20			1003	19		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3730	13.639	1006	10.911		-42.10		7		15			1007	67		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3750	12.384	1006	12.384		-42.09		8		22			1007	72		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3772	12.217	1006	12.217		-43.36		7		7			1007	59		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3786	13.765	1004	11.012		-42.49		7		4			1005	31		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3793	19.541	1002	12.213		-39.10		3		19			1003	25		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3805	11.078	1006	11.078		-42.67		1		14			1007	23		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3819	11.658	1006	11.658		-41.28		5		25			1007	6		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3840	14.922	1000	11.937		-40.21		5		11			1001	77		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3876	19.823	1002	12.389		-43.31		4		18			1003	35		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3882	11.952	1006	11.952		-41.91		3		30			1007	26		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3894	13.372	1002	10.698		-39.09		6		27			1003	16		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3921	10.237	1002	10.237		-41.33		6		7			1003	49		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3973	18.871	1006	11.794		-41.11		6		27			1007	37		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3973	12.125	1000	12.125		-39.01		4		11			1001	28		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3974	10.876	1004	10.876		-39.64		6		23			1005	76		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.3994	17.471	1010	10.919		-42.08		3		18			1011	61		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4009	18.031	1006	11.270		-40.16		5		25			1007	53		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4052	15.498	1006	12.398		-41.19		5		14			1007	32		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4061	13.496	1002	10.797		-40.38		3		23			1003	50		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4071	19.266	1008	12.042		-42.40		2		42			1009	62		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4170	19.039	1000	11.899		-39.90		6		6			1001	80		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4183	16.046	1008	10.029		-38.77		6		37			1009	38		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4192	10.482	1002	10.482		-41.86		8		27			1003	2		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4198	16.894	1002	10.559		-39.60		8		25			1003	36		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4201	16.629	1010	10.393		-39.61		4		12			1011	13		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4205	16.728	1002	10.455		-42.29		8		16			1003	63		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4208	18.381	1004	11.488		-42.76		7		12			1005	55		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4212	19.739	1000	12.337		-42.56		5		13			1001	39		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4213	12.646	1000	10.117		-39.13		3		21			1001	41		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4215	14.649	1000	11.719		-38.86		4		21			1001	60		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4217	10.334	1006	10.334		-40.49		4		27			1007	12		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4224	18.057	1002	11.286		-41.40		4		28			1003	57		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4231	18.177	1008	11.360		-39.13		6		29			1009	7		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4285	17.604	1004	11.002		-40.06		2		34			1005	30		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4306	12.079	1004	12.079		-39.01		8		5			1005	43		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4311	12.018	1002	12.018		-40.18		2		37			1003	58		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4314	12.087	1006	12.087		-38.57		6		17			1007	33		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4319	18.856	1008	11.785		-40.37		1		37			1009	42		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4329	13.160	1000	10.528		-39.55		6		43			1001	54		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4341	15.101	1000	12.081		-40.00		3		27			1001	74		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4377	18.361	1004	11.475		-43.39		1		38			1005	11		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4444	11.873	1004	11.873		-38.63		5		27			1005	46		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4519	10.288	1002	10.288		-38.72		8		35			1003	69		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4548	10.246	1008	10.246		-41.49		6		18			1009	14		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4570	16.477	1006	10.298		-41.04		6		33			1007	66		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4590	12.013	1000	12.013		-42.25		7		9			1001	64		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4629	16.105	1000	10.065		-41.03		6		22			1001	70		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4675	11.080	1000	11.080		-38.73		6		8			1001	4		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4685	19.431	1006	12.144		-42.31		8		36			1007	65		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4716	11.157	1006	11.157		-39.73		5		28			1007	18		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4733	19.749	1006	12.343		-42.68		6		31			1007	75		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4768	13.833	1004	11.067		-39.95		3		20			1005	5		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4779	19.131	1008	11.957		-39.55		3		45			1009	51		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.4832	10.138	1002	10.138		-39.82		7		37			1003	20		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	9.5013	19.505	1010	12.191		-43.17		6		31			1011	29		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
