
<CsoundSynthesizer>
<CsOptions>
-o "sez1.wav" -W -d
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
f 0 88.09511888728348 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 3 4 2
f 1001 0 3 -2 0 1 0
f 1002 0 3 -2 7 9 12
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 2 3 5
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 1 2 3
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 8 12 8
f 1011 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.0266	16.000	1006	10.000		4			2		33			1007	8		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.0662	16.000	1002	10.000		4			1		30			1003	2		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1168	12.500	1004	10.000		4			1		10			1005	4		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1175	10.000	1000	10.000		4			1		13			1001	7		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1195	16.000	1006	10.000		1			1		14			1007	5		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1381	12.500	1002	10.000		4			2		10			1003	3		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1594	12.500	1000	10.000		4			2		37			1001	1		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1753	12.500	1006	10.000		4			0		30			1007	11		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1797	16.000	1000	10.000		4			2		16			1001	10		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.1967	16.000	1000	10.000		4			1		16			1001	9		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.2898	16.000	1006	10.000		3			1		18			1007	6		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8104	16.000	1006	10.000		4			1		28			1007	13		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8120	12.500	1010	10.000		4			2		12			1011	17		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8456	12.500	1006	10.000		4			2		11			1007	14		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8463	16.000	1008	10.000		4			1		10			1009	19		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8609	12.500	1000	10.000		4			3		17			1001	31		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8646	16.000	1008	10.000		1			2		19			1009	15		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8728	16.000	1006	10.000		4			1		17			1007	29		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8814	16.000	1000	10.000		4			2		10			1001	28		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8831	12.500	1006	10.000		4			1		25			1007	26		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8847	12.500	1008	10.000		1			2		29			1009	32		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9053	10.000	1000	10.000		4			2		18			1001	24		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9067	10.000	1006	10.000		3			2		20			1007	16		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9147	12.500	1000	10.000		4			1		11			1001	18		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9323	16.000	1008	10.000		4			1		15			1009	30		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9348	16.000	1008	10.000		4			2		33			1009	23		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9428	10.000	1000	10.000		4			1		20			1001	20		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9485	10.000	1006	10.000		1			1		18			1007	12		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.9903	12.500	1008	10.000		4			2		22			1009	21		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.3621	12.500	1000	10.000		4			3		14			1001	43		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.3942	12.500	1000	10.000		3			2		29			1001	36		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4014	16.000	1006	10.000		4			2		15			1007	34		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4058	16.000	1004	10.000		4			3		20			1005	50		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4132	16.000	1006	10.000		1			3		28			1007	37		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4190	16.000	1008	10.000		1			3		24			1009	39		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4256	12.500	1008	10.000		1			2		22			1009	54		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4257	16.000	1004	10.000		4			3		14			1005	33		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4302	16.000	1008	10.000		1			4		16			1009	46		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4374	10.000	1006	10.000		4			2		22			1007	41		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4671	10.000	1002	10.000		1			3		27			1003	51		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4700	12.500	1006	10.000		4			3		15			1007	38		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4732	12.500	1006	10.000		1			2		11			1007	42		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4741	10.000	1002	10.000		4			2		13			1003	48		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4796	16.000	1006	10.000		4			3		14			1007	52		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4852	12.500	1002	10.000		3			3		8			1003	49		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.4960	16.000	1008	10.000		1			3		23			1009	47		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.5029	16.000	1006	10.000		4			3		13			1007	53		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.5146	10.000	1010	10.000		1			2		26			1011	40		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.5203	16.000	1008	10.000		4			2		21			1009	35		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	15.5344	12.500	1006	10.000		4			3		24			1007	45		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.1627	16.000	1008	10.000		4			2		21			1009	64		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2264	10.000	1006	10.000		4			2		9			1007	56		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2278	10.000	1010	10.000		4			2		18			1011	70		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2292	16.000	1006	10.000		4			3		11			1007	66		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2343	16.000	1006	10.000		4			3		26			1007	63		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2382	12.500	1004	10.000		3			2		20			1005	72		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2390	16.000	1000	10.000		4			2		15			1001	62		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2443	16.000	1000	10.000		1			3		16			1001	65		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2568	12.500	1010	10.000		4			4		17			1011	61		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2641	16.000	1002	10.000		1			2		14			1003	67		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2759	12.500	1002	10.000		4			3		25			1003	57		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2780	12.500	1002	10.000		4			3		10			1003	55		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2841	12.500	1000	10.000		4			3		17			1001	58		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2848	12.500	1006	10.000		1			2		19			1007	60		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.2989	16.000	1000	10.000		4			2		18			1001	71		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.3128	16.000	1010	10.000		4			3		25			1011	59		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.3296	16.000	1002	10.000		3			3		19			1003	68		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.3556	10.000	1000	10.000		4			2		14			1001	69		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7131	12.500	1002	10.000		4			2		19			1003	75		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7236	12.500	1008	10.000		4			3		17			1009	79		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7474	12.500	1004	10.000		4			2		8			1005	85		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7622	12.500	1006	10.000		4			3		18			1007	81		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7679	12.500	1004	10.000		4			2		15			1005	92		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7854	12.500	1004	10.000		4			3		28			1005	77		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7995	16.000	1002	10.000		4			2		21			1003	88		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.7998	10.000	1000	10.000		4			3		9			1001	93		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8124	12.500	1002	10.000		1			3		25			1003	73		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8255	12.500	1000	10.000		1			2		9			1001	76		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8263	10.000	1000	10.000		4			2		15			1001	83		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8302	16.000	1006	10.000		4			2		10			1007	89		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8393	10.000	1004	10.000		4			2		16			1005	74		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8405	10.000	1006	10.000		4			3		26			1007	78		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8531	10.000	1002	10.000		1			2		19			1003	82		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.8542	16.000	1002	10.000		4			3		28			1003	80		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.9134	12.500	1000	10.000		4			3		12			1001	91		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.9162	12.500	1006	10.000		1			3		26			1007	87		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.9392	12.500	1008	10.000		4			4		10			1009	86		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	16.9435	10.000	1002	10.000		4			3		15			1003	84		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.1958	12.500	1008	10.000		4			3		25			1009	99		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.2274	16.000	1008	10.000		4			4		21			1009	106		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.2309	16.000	1006	10.000		4			3		19			1007	102		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.2541	10.000	1000	10.000		4			3		18			1001	104		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.2741	12.500	1006	10.000		4			4		22			1007	96		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.2950	16.000	1004	10.000		4			3		23			1005	105		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3033	10.000	1004	10.000		4			3		9			1005	111		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3034	12.500	1002	10.000		4			2		9			1003	110		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3131	16.000	1010	10.000		4			2		26			1011	103		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3144	12.500	1002	10.000		4			3		21			1003	95		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3161	16.000	1002	10.000		4			2		20			1003	109		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3188	12.500	1010	10.000		4			3		21			1011	94		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3328	10.000	1002	10.000		4			4		19			1003	112		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3442	12.500	1000	10.000		4			4		16			1001	97		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3449	10.000	1006	10.000		4			3		15			1007	100		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3568	10.000	1004	10.000		4			2		16			1005	101		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.3850	16.000	1002	10.000		4			2		24			1003	108		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	20.4174	10.000	1000	10.000		4			3		7			1001	107		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.6427	16.000	1002	10.000		4			4		17			1003	128		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.6593	10.000	1010	10.000		4			4		12			1011	115		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.6779	12.500	1008	10.000		3			3		20			1009	116		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.6882	10.000	1002	10.000		4			3		16			1003	121		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.6922	16.000	1002	10.000		4			4		11			1003	118		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7111	10.000	1002	10.000		4			3		13			1003	132		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7183	10.000	1002	10.000		4			3		20			1003	117		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7325	12.500	1006	10.000		4			4		16			1007	123		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7355	10.000	1004	10.000		4			4		19			1005	130		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7444	16.000	1010	10.000		4			4		11			1011	134		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7467	10.000	1000	10.000		1			4		14			1001	133		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7569	10.000	1010	10.000		4			4		8			1011	127		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7599	10.000	1010	10.000		1			4		7			1011	129		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7606	12.500	1000	10.000		4			3		17			1001	135		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7772	12.500	1004	10.000		4			4		13			1005	136		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7790	16.000	1004	10.000		4			4		17			1005	122		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7811	16.000	1000	10.000		1			3		11			1001	120		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7851	12.500	1008	10.000		4			4		20			1009	125		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.7955	16.000	1002	10.000		3			4		11			1003	113		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.8036	16.000	1006	10.000		4			4		7			1007	124		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.8077	16.000	1006	10.000		4			4		10			1007	131		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.8341	16.000	1008	10.000		4			4		10			1009	126		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	28.8352	16.000	1004	10.000		4			4		13			1005	119		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8077	10.000	1006	10.000		4			3		10			1007	156		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8162	16.000	1002	10.000		4			5		12			1003	159		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8468	10.000	1004	10.000		4			4		16			1005	140		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8547	10.000	1004	10.000		4			4		18			1005	162		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8588	16.000	1002	10.000		4			5		7			1003	170		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8621	16.000	1002	10.000		4			3		14			1003	168		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8668	10.000	1000	10.000		4			5		19			1001	142		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8714	10.000	1010	10.000		4			4		16			1011	143		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8736	16.000	1004	10.000		4			4		15			1005	160		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8739	16.000	1004	10.000		4			5		9			1005	158		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8806	16.000	1000	10.000		4			5		16			1001	144		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8828	16.000	1000	10.000		4			4		15			1001	147		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8956	16.000	1010	10.000		4			5		9			1011	137		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8956	12.500	1006	10.000		4			5		14			1007	139		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8960	16.000	1000	10.000		1			5		6			1001	149		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.8986	12.500	1010	10.000		4			4		18			1011	161		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9001	10.000	1002	10.000		4			5		12			1003	171		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9104	10.000	1002	10.000		4			5		15			1003	148		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9117	10.000	1002	10.000		4			5		11			1003	157		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9137	16.000	1010	10.000		4			4		6			1011	151		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9171	12.500	1004	10.000		4			4		9			1005	165		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9257	12.500	1006	10.000		4			4		19			1007	141		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9275	16.000	1008	10.000		4			4		12			1009	169		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9334	10.000	1004	10.000		4			4		7			1005	153		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9414	10.000	1002	10.000		4			4		20			1003	146		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9420	12.500	1002	10.000		4			5		8			1003	145		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9518	16.000	1010	10.000		4			4		10			1011	167		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9528	10.000	1000	10.000		4			5		10			1001	163		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9539	16.000	1006	10.000		4			5		14			1007	138		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9581	16.000	1006	10.000		4			3		13			1007	164		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9753	16.000	1000	10.000		4			4		10			1001	150		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	29.9805	12.500	1004	10.000		4			4		14			1005	166		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.9937	10.000	1004	10.000		4			5		7			1005	193		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0234	16.000	1002	10.000		4			3		17			1003	173		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0292	16.000	1004	10.000		4			4		18			1005	180		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0356	10.000	1002	10.000		4			5		10			1003	184		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0378	10.000	1004	10.000		4			5		13			1005	174		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0449	12.500	1004	10.000		4			5		17			1005	190		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0515	10.000	1000	10.000		4			5		12			1001	177		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0574	12.500	1000	10.000		1			4		17			1001	186		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0620	16.000	1008	10.000		1			4		12			1009	203		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0655	12.500	1004	10.000		4			5		15			1005	196		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0723	16.000	1008	10.000		4			4		13			1009	192		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0743	16.000	1002	10.000		1			5		17			1003	172		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0755	10.000	1002	10.000		1			4		19			1003	197		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0767	12.500	1006	10.000		4			4		16			1007	181		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0848	16.000	1008	10.000		4			5		6			1009	204		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0919	16.000	1010	10.000		4			3		9			1011	187		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0981	10.000	1000	10.000		4			4		13			1001	185		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.0995	12.500	1002	10.000		4			4		15			1003	179		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1006	12.500	1000	10.000		4			3		7			1001	176		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1162	12.500	1008	10.000		4			3		10			1009	195		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1207	12.500	1002	10.000		4			5		10			1003	178		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1225	16.000	1010	10.000		4			5		17			1011	200		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1275	16.000	1008	10.000		1			4		15			1009	191		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1295	10.000	1000	10.000		4			5		12			1001	194		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1371	12.500	1002	10.000		1			3		13			1003	202		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1391	16.000	1002	10.000		1			4		16			1003	188		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1399	16.000	1010	10.000		4			3		18			1011	198		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1412	10.000	1002	10.000		4			5		18			1003	201		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1481	16.000	1004	10.000		4			4		6			1005	199		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1510	16.000	1010	10.000		4			4		8			1011	182		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1591	10.000	1006	10.000		4			4		16			1007	175		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1641	16.000	1008	10.000		4			4		8			1009	189		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.1971	16.000	1004	10.000		4			3		8			1005	183		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7012	12.500	1004	10.000		4			4		17			1005	215		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7121	16.000	1000	10.000		1			4		18			1001	220		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7322	16.000	1008	10.000		1			3		17			1009	208		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7337	16.000	1010	10.000		4			5		8			1011	230		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7349	16.000	1006	10.000		4			4		8			1007	206		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7362	10.000	1004	10.000		1			3		9			1005	211		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7370	10.000	1010	10.000		4			4		10			1011	210		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7462	12.500	1000	10.000		4			4		17			1001	224		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7548	16.000	1010	10.000		1			5		7			1011	228		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7564	16.000	1004	10.000		4			4		15			1005	212		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7575	10.000	1002	10.000		1			3		15			1003	209		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7606	12.500	1008	10.000		4			4		12			1009	227		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7652	12.500	1002	10.000		4			5		12			1003	218		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7736	10.000	1002	10.000		4			5		8			1003	221		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7750	16.000	1010	10.000		1			4		17			1011	219		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7751	16.000	1004	10.000		4			4		12			1005	222		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7761	10.000	1004	10.000		4			5		17			1005	216		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7828	12.500	1004	10.000		4			5		10			1005	226		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.7955	16.000	1000	10.000		4			5		6			1001	223		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8007	12.500	1010	10.000		4			5		12			1011	205		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8043	16.000	1002	10.000		1			5		17			1003	207		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8072	16.000	1008	10.000		4			3		6			1009	213		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8285	10.000	1002	10.000		1			4		7			1003	214		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8326	10.000	1000	10.000		4			4		13			1001	229		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8579	10.000	1010	10.000		4			3		14			1011	225		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.8933	10.000	1004	10.000		4			3		6			1005	231		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	31.9382	12.500	1010	10.000		4			5		14			1011	232		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.3491	1.187	1006	1.187		0			1		19			1007	239		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.3558	1.187	1000	1.187		0			1		37			1001	233		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.3991	1.187	1006	1.187		0			2		32			1007	236		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.4139	1.484	1006	1.187		1			2		29			1007	235		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.4255	1.900	1008	1.187		1			0		39			1009	234		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	51.4667	1.484	1008	1.187		0			2		19			1009	237		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.6989	3.061	1000	2.449		1			3		37			1001	256		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.7757	3.918	1006	2.449		0			1		32			1007	255		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.7822	2.449	1000	2.449		0			2		32			1001	251		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8339	3.061	1008	2.449		0			2		36			1009	247		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8340	3.918	1000	2.449		2			3		22			1001	263		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8416	2.449	1000	2.449		0			3		28			1001	264		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8538	3.061	1000	2.449		0			4		39			1001	244		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8586	3.061	1008	2.449		1			3		19			1009	241		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8644	3.918	1008	2.449		0			4		25			1009	252		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8762	2.449	1000	2.449		0			3		20			1001	253		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8811	3.061	1008	2.449		0			2		23			1009	258		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8811	2.449	1006	2.449		0			3		33			1007	240		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8833	3.918	1008	2.449		0			3		33			1009	246		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8879	2.449	1000	2.449		0			1		16			1001	259		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8896	3.061	1000	2.449		0			3		30			1001	261		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8904	2.449	1000	2.449		0			2		30			1001	266		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8938	2.449	1000	2.449		0			3		12			1001	242		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.8941	3.918	1000	2.449		0			3		15			1001	250		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9018	3.918	1006	2.449		1			2		26			1007	243		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9036	2.449	1000	2.449		0			4		24			1001	260		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9064	3.918	1000	2.449		1			3		25			1001	245		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9108	3.918	1006	2.449		0			2		31			1007	248		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9160	2.449	1006	2.449		0			3		13			1007	254		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9451	2.449	1006	2.449		0			3		29			1007	262		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9505	3.918	1006	2.449		0			2		12			1007	257		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	60.9760	2.449	1006	2.449		0			3		12			1007	265		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	62.9735	2.740	1006	2.740		0			4		29			1007	292		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	62.9803	4.384	1000	2.740		0			3		34			1001	279		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	62.9876	3.425	1006	2.740		0			2		12			1007	281		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0084	2.740	1006	2.740		1			2		18			1007	282		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0096	3.425	1006	2.740		0			2		23			1007	280		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0114	3.425	1000	2.740		0			3		30			1001	275		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0308	4.384	1008	2.740		0			3		23			1009	278		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0337	4.384	1000	2.740		0			2		17			1001	284		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0353	4.384	1006	2.740		1			2		15			1007	291		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0409	2.740	1000	2.740		0			1		24			1001	274		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0449	3.425	1008	2.740		0			3		34			1009	287		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0452	4.384	1008	2.740		2			3		23			1009	286		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0584	3.425	1008	2.740		0			1		14			1009	271		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0590	4.384	1008	2.740		0			4		12			1009	267		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0705	4.384	1008	2.740		0			2		11			1009	288		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0722	3.425	1006	2.740		0			2		36			1007	269		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0727	4.384	1008	2.740		1			1		21			1009	268		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0795	4.384	1006	2.740		1			1		33			1007	285		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0805	2.740	1006	2.740		0			2		32			1007	290		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0872	4.384	1006	2.740		0			3		37			1007	270		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.0904	4.384	1008	2.740		0			2		38			1009	289		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.1197	2.740	1006	2.740		0			3		37			1007	277		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.1396	4.384	1000	2.740		0			4		34			1001	283		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	63.1682	3.425	1008	2.740		0			2		25			1009	276		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0522	3.942	1008	3.153		2			3		35			1009	301		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0542	5.045	1000	3.153		3			3		34			1001	312		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0607	5.045	1000	3.153		3			3		31			1001	318		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0691	3.153	1006	3.153		2			2		30			1007	294		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0803	3.153	1006	3.153		3			3		23			1007	307		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0918	3.153	1006	3.153		2			2		15			1007	311		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0933	5.045	1000	3.153		3			3		35			1001	305		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0935	3.153	1000	3.153		3			3		36			1001	314		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.0986	5.045	1000	3.153		3			2		26			1001	319		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1001	5.045	1006	3.153		3			4		27			1007	302		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1037	5.045	1000	3.153		3			3		12			1001	313		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1144	3.942	1008	3.153		2			4		26			1009	304		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1160	3.942	1008	3.153		3			2		36			1009	320		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1241	3.942	1008	3.153		2			2		39			1009	299		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1305	3.153	1000	3.153		3			4		18			1001	297		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1337	3.153	1000	3.153		3			3		14			1001	308		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1431	3.942	1006	3.153		3			3		18			1007	309		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1438	5.045	1006	3.153		3			4		20			1007	315		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1472	3.942	1006	3.153		3			3		29			1007	298		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1696	3.942	1006	3.153		3			2		21			1007	310		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1745	3.942	1000	3.153		3			2		14			1001	296		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1809	3.942	1008	3.153		2			4		17			1009	316		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1917	5.045	1000	3.153		2			5		13			1001	293		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.1949	3.153	1000	3.153		2			4		32			1001	303		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.2010	5.045	1008	3.153		3			3		21			1009	300		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	66.2382	3.942	1000	3.153		3			3		23			1001	295		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.0571	3.561	1006	3.561		2			2		22			1007	331		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1052	5.698	1006	3.561		3			4		14			1007	322		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1073	3.561	1006	3.561		2			2		17			1007	341		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1082	3.561	1000	3.561		3			2		19			1001	334		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1286	5.698	1006	3.561		3			4		35			1007	348		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1370	5.698	1000	3.561		3			4		36			1001	330		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1483	5.698	1008	3.561		3			3		39			1009	323		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1494	4.452	1000	3.561		3			4		38			1001	332		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1524	5.698	1008	3.561		3			4		32			1009	353		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1633	4.452	1008	3.561		3			3		39			1009	329		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1708	4.452	1008	3.561		3			2		18			1009	321		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1740	4.452	1008	3.561		3			4		36			1009	358		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1784	5.698	1006	3.561		3			3		39			1007	346		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1811	3.561	1000	3.561		3			3		12			1001	367		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1856	5.698	1006	3.561		2			4		35			1007	352		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1886	4.452	1000	3.561		3			4		12			1001	339		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1908	4.452	1000	3.561		2			4		36			1001	361		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1927	5.698	1000	3.561		3			2		12			1001	338		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1934	4.452	1008	3.561		3			4		33			1009	345		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1943	5.698	1008	3.561		3			2		17			1009	357		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.1998	3.561	1006	3.561		3			2		26			1007	343		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2019	4.452	1000	3.561		3			2		34			1001	337		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2026	3.561	1000	3.561		3			2		36			1001	366		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2060	5.698	1008	3.561		3			5		26			1009	328		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2073	5.698	1006	3.561		3			4		16			1007	359		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2109	3.561	1006	3.561		2			3		15			1007	325		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2222	3.561	1006	3.561		3			4		38			1007	344		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2304	5.698	1008	3.561		3			3		32			1009	324		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2359	4.452	1006	3.561		3			3		32			1007	360		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2386	4.452	1006	3.561		2			2		14			1007	350		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2398	5.698	1006	3.561		3			2		38			1007	327		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2439	5.698	1006	3.561		3			4		28			1007	335		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2466	3.561	1006	3.561		2			5		29			1007	362		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2490	3.561	1006	3.561		3			3		38			1007	368		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2518	5.698	1000	3.561		3			4		38			1001	342		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2615	5.698	1000	3.561		3			2		26			1001	340		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2621	3.561	1000	3.561		3			2		18			1001	347		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2629	4.452	1008	3.561		3			2		28			1009	364		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2634	5.698	1000	3.561		3			4		19			1001	349		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2670	3.561	1006	3.561		3			5		33			1007	356		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2739	5.698	1008	3.561		3			4		14			1009	326		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2772	5.698	1006	3.561		3			5		33			1007	351		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.2986	4.452	1000	3.561		2			4		37			1001	333		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.3028	5.698	1008	3.561		3			3		33			1009	363		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	69.3117	5.698	1006	3.561		3			4		18			1007	354		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.6508	3.902	1006	3.902		3			5		13			1007	403		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.6910	6.243	1008	3.902		3			2		17			1009	390		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7103	6.243	1008	3.902		3			4		15			1009	402		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7124	3.902	1000	3.902		3			6		25			1001	372		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7132	3.902	1000	3.902		3			5		17			1001	395		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7133	6.243	1006	3.902		3			5		24			1007	371		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7270	6.243	1008	3.902		3			4		23			1009	401		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7293	6.243	1000	3.902		3			5		19			1001	388		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7416	4.877	1000	3.902		3			5		36			1001	389		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7416	3.902	1006	3.902		3			5		24			1007	400		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7440	4.877	1008	3.902		2			6		32			1009	397		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7468	3.902	1000	3.902		2			5		15			1001	384		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7488	4.877	1008	3.902		3			5		18			1009	387		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7498	6.243	1008	3.902		2			3		33			1009	379		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7553	4.877	1000	3.902		3			4		31			1001	398		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7576	3.902	1006	3.902		2			4		28			1007	381		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7581	4.877	1000	3.902		3			5		27			1001	375		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7632	4.877	1006	3.902		3			5		20			1007	396		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7664	4.877	1008	3.902		2			5		35			1009	383		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7727	4.877	1000	3.902		2			4		39			1001	370		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7737	6.243	1008	3.902		3			4		21			1009	405		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7791	3.902	1006	3.902		3			4		14			1007	394		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7791	6.243	1000	3.902		2			4		25			1001	373		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7797	3.902	1000	3.902		3			3		13			1001	377		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7813	6.243	1008	3.902		2			4		32			1009	376		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7817	4.877	1008	3.902		3			3		13			1009	393		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7888	3.902	1006	3.902		3			5		34			1007	382		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7926	6.243	1006	3.902		3			3		28			1007	374		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7930	6.243	1006	3.902		3			3		33			1007	404		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7966	3.902	1000	3.902		2			4		25			1001	378		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.7975	3.902	1000	3.902		3			5		34			1001	369		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.8497	4.877	1000	3.902		3			5		38			1001	391		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.8507	6.243	1008	3.902		2			3		17			1009	392		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.8523	6.243	1006	3.902		2			4		35			1007	380		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	71.8675	4.877	1000	3.902		3			4		19			1001	399		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
