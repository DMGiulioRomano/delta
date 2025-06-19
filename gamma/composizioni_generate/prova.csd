
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/prova.wav" -W -d -m0
</CsOptions>
<CsInstruments>
sr = 96000
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
f 0 123.43312076162864 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1


; ==============================================================================
; TABELLE DEFINITE DINAMICAMENTE
; ==============================================================================

; --- TABELLE DEGLI INVILUPPI (generate da tables.yaml) ---
; lineare
f 2 0 4096 6 0.001 2048 0.5 2048 1
; triangolo
f 3 0 4096 7 0 2048 1 2048 0
; impulsivo-ease
f 4 0 4096 6 0.001 512 1 3584 0.001
; impulsivo
f 5 0 4096 5 0.001 512 1 3584 0.0001
; lento
f 6 0 4096 7 0 3072 1 1024 0
; sostenuto
f 7 0 4096 7 0 512 1 3072 1 512 0
; continua
f 20 0 4096 7 1 4096 1
; crescendo_lento
f 21 0 4096 7 0 4096 1
; diminuendo_rapido
f 22 0 4096 7 1 4096 0
; plateau_forte
f 23 0 4096 10 1
; crescendo_diminuendo
f 24 0 4096 7 0 2048 1 2048 0
; impulso
f 24 0 4096 6 0 256 1 2304 0.001


f 1000 0 3 -2 6 8 10
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 8 12 8
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 7 9 12
f 1005 0 3 -2 0 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	33.238	1000	26.591		5.0			1		2			1001	1		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	31.550	1002	25.240		5.0			1		1			1003	3		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0226	28.485	1000	28.485		5.0			1		1			1001	2		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9702	22.665	1004	22.665		5.0			2		1			1005	7		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9795	29.793	1004	23.835		5.0			1		3			1005	4		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0639	25.145	1002	25.145		5.0			1		1			1003	6		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1146	32.792	1002	26.234		5.0			2		1			1003	5		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.6542	23.737	1000	23.737		5.0			2		3			1001	8		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.6769	45.384	1000	28.365		5.0			2		3			1001	9		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8508	25.473	1004	20.378		5.0			3		4			1005	10		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8550	22.466	1004	22.466		5.0			3		2			1005	11		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9306	25.981	1002	25.981		5.0			2		6			1003	12		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5877	25.395	1004	20.316		5.0			3		5			1005	15		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6599	34.788	1004	21.742		5.0			2		7			1005	13		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6676	27.282	1002	21.826		5.0			3		3			1003	14		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.0108	37.239	1004	23.275		5.0			4		7			1005	17		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.0155	21.722	1004	21.722		5.0			2		8			1005	19		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.0944	20.604	1004	20.604		5.0			1		7			1005	18		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1421	22.257	1002	22.257		5.0			3		3			1003	16		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.0607	28.361	1002	22.689		5.0			4		2			1003	23		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1117	24.849	1000	19.879		5.0			4		2			1001	22		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1302	32.710	1002	20.444		5.0			2		9			1003	20		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1467	25.771	1002	20.617		5.0			3		2			1003	24		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1725	18.910	1004	18.910		5.0			1		6			1005	21		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5372	33.976	1000	21.235		5.0			3		5			1001	27		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5669	21.211	1002	21.211		5.0			3		4			1003	25		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5978	25.662	1002	25.662		5.0			4		8			1003	29		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6024	20.516	1004	20.516		5.0			4		6			1005	28		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6404	24.690	1004	24.690		5.0			2		1			1005	26		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7871	30.780	1004	19.237		5.0			4		8			1005	34		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.8403	22.240	1000	22.240		5.0			2		1			1001	31		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.8438	31.661	1002	19.788		5.0			4		4			1003	30		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.8542	22.308	1004	17.846		5.0			4		4			1005	33		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.8626	27.299	1002	21.840		5.0			3		7			1003	32		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.3852	24.490	1004	19.592		5.0			2		9			1005	36		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5141	18.195	1000	18.195		5.0			3		2			1001	39		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5155	22.030	1002	22.030		5.0			4		7			1003	35		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5235	20.402	1004	20.402		5.0			3		6			1005	37		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5833	18.981	1000	18.981		5.0			2		2			1001	38		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.8435	27.832	1004	17.395		5.0			3		1			1005	41		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.8989	19.666	1004	19.666		5.0			3		1			1005	42		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9047	29.193	1002	18.245		5.0			2		9			1003	40		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7789	20.646	1004	20.646		5.0			5		10			1005	45		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7871	22.743	1000	22.743		5.0			3		11			1001	46		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8001	17.127	1004	17.127		5.0			3		4			1005	44		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9163	38.389	1000	23.993		5.0			5		7			1001	43		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1734	36.691	1004	22.932		5.0			4		5			1005	51		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.2235	22.682	1004	22.682		5.0			5		9			1005	47		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.3068	30.821	1002	24.657		5.0			2		4			1003	49		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.3137	39.759	1004	24.850		5.0			4		4			1005	48		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.3442	33.339	1004	20.837		5.0			3		1			1005	50		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3835	30.421	1000	24.337		5.0			4		2			1001	56		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4078	17.819	1004	17.819		5.0			3		7			1005	55		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4078	37.073	1002	23.171		5.0			5		8			1003	53		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4098	36.051	1000	22.532		5.0			4		9			1001	54		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4337	20.506	1002	16.405		5.0			2		10			1003	52		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.9994	29.829	1004	18.643		5.0			4		9			1005	58		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.0105	19.101	1000	19.101		5.0			5		13			1001	57		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.0500	16.673	1000	16.673		5.0			5		2			1001	59		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3021	19.794	1004	15.835		5.0			4		5			1005	63		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3245	25.744	1000	20.595		5.0			5		4			1001	62		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3450	23.022	1000	23.022		5.0			4		14			1001	60		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3554	27.143	1004	16.964		5.0			3		5			1005	64		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3695	21.891	1000	21.891		5.0			5		1			1001	65		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.3970	19.070	1002	19.070		5.0			6		3			1003	61		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.1422	18.660	1004	14.928		5.0			5		5			1005	66		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.1661	30.190	1002	24.152		5.0			4		6			1003	68		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.2428	18.954	1000	18.954		5.0			3		14			1001	70		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.2627	19.777	1000	19.777		5.0			3		1			1001	67		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.3135	20.733	1002	16.587		5.0			3		6			1003	69		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.5438	29.532	1002	23.626		5.0			2		12			1003	74		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.5664	14.542	1004	14.542		5.0			7		10			1005	71		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.6183	30.107	1000	24.085		5.0			6		8			1001	75		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.6225	22.574	1000	22.574		5.0			3		7			1001	73		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.6551	15.966	1004	15.966		5.0			3		9			1005	72		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.6269	15.711	1002	15.711		5.0			6		12			1003	76		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.6555	22.692	1004	22.692		5.0			3		7			1005	77		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.6645	21.485	1002	21.485		5.0			4		11			1003	78		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.7636	25.141	1000	20.113		5.0			6		12			1001	79		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.2133	16.998	1002	16.998		5.0			6		10			1003	81		1				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.2225	25.068	1000	20.055		5.0			3		13			1001	80		0				1			2			20			0.0000		105.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.2506	31.183	1000	19.489		5.0			2		15			1001	82		1				1			2			20			0.0000		105.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
