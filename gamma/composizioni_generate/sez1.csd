
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/sez1.wav" -W -d -m0
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
f 0 120.5293464631157 ; Evento f fittizio per definire la durata totale
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
f 20 0 4096 7 1 2047 1 1 0 512 1 1024 1 512 0
; crescendo_lento
f 21 0 4096 7 0 4096 1
; diminuendo_rapido
f 22 0 4096 7 1 4096 0
; plateau_forte
f 23 0 4096 10 1
; crescendo_diminuendo
f 24 0 4096 7 0 2048 1 2048 0


f 1000 0 3 -2 3 4 2
f 1001 0 3 -2 0 1 0
f 1002 0 3 -2 2 3 5
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 1 2 3
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 7 9 12
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 6 8 10
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 8 12 8
f 1011 0 3 -2 0 1 2
f 1012 0 4 -2 2 10 4 15
f 1013 0 4 -2 0 1 2 3
f 1014 0 4 -2 3 20 5 8
f 1015 0 4 -2 0 1 2 3



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 15.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	12.500	1002	10.000		1			2		25			1003	7		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	12.500	1002	10.000		4			2		23			1003	3		1				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	16.000	1002	10.000		4			0		12			1003	13		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	16.000	1002	10.000		3			2		36			1003	11		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	16.000	1006	10.000		4			1		14			1007	14		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	12.500	1004	10.000		4			1		36			1005	8		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	12.500	1002	10.000		4			2		19			1003	10		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0014	10.000	1000	10.000		4			2		11			1001	9		1				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0185	16.000	1002	10.000		4			1		15			1003	5		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0197	16.000	1002	10.000		4			0		14			1003	15		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0340	12.500	1002	10.000		4			0		11			1003	12		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0405	16.000	1000	10.000		4			0		33			1001	1		0				1			2			20			0.0000		15.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0601	12.500	1002	10.000		3			0		30			1003	2		0				1			2			20			0.0000		15.000

; =============================================================================
; SEZIONE: "II. Nascita Lenta di Cluster"
; Inizio: 15.000s, Durata: 7.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8840	1.600	1000	1.000		0			2		19			1001	17		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.9624	1.000	1002	1.000		0			2		15			1003	16		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0097	1.250	1004	1.000		0			4		13			1005	20		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0146	1.250	1000	1.000		0			2		15			1001	19		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.4573	1.336	1000	1.069		0			5		16			1001	26		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.4839	1.069	1002	1.069		0			2		10			1003	23		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5061	1.069	1000	1.069		0			3		14			1001	25		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5257	1.336	1004	1.069		0			3		16			1005	21		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5263	1.336	1002	1.069		0			2		21			1003	24		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9929	1.449	1004	1.159		0			5		11			1005	34		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0703	1.449	1002	1.159		0			5		15			1003	28		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0863	1.449	1004	1.159		0			3		13			1005	29		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1026	1.854	1000	1.159		0			5		13			1001	35		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1076	1.159	1000	1.159		0			3		19			1001	32		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1153	1.854	1004	1.159		0			3		16			1005	30		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1560	1.854	1004	1.159		0			4		13			1005	38		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1580	1.854	1000	1.159		0			4		21			1001	36		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1580	1.449	1004	1.159		0			2		15			1005	39		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1773	1.854	1000	1.159		0			4		9			1001	31		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1847	1.854	1004	1.159		0			3		21			1005	33		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1892	1.854	1002	1.159		0			3		9			1003	27		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7307	2.013	1002	1.258		0			3		10			1003	57		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7367	1.258	1002	1.258		0			4		8			1003	53		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7457	1.573	1002	1.258		0			3		22			1003	51		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7570	1.258	1000	1.258		0			5		17			1001	49		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7740	1.258	1002	1.258		0			5		13			1003	50		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7877	1.258	1002	1.258		0			3		8			1003	54		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7923	1.258	1000	1.258		0			4		9			1001	41		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7957	1.573	1002	1.258		0			5		14			1003	42		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8010	2.013	1000	1.258		0			4		22			1001	46		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8027	1.258	1002	1.258		0			3		10			1003	43		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8046	1.573	1000	1.258		0			5		12			1001	47		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8048	1.573	1004	1.258		0			4		23			1005	58		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8095	2.013	1004	1.258		0			3		7			1005	40		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8349	1.573	1000	1.258		0			4		18			1001	55		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8563	1.258	1000	1.258		0			3		24			1001	48		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.9459	2.013	1000	1.258		0			4		17			1001	56		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4544	2.184	1000	1.365		0			4		15			1001	66		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4547	1.706	1004	1.365		0			4		17			1005	75		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4721	1.706	1004	1.365		0			4		23			1005	74		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4791	2.184	1002	1.365		0			4		20			1003	83		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4824	2.184	1002	1.365		0			5		12			1003	73		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5031	1.706	1000	1.365		0			4		25			1001	68		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5063	1.706	1004	1.365		0			3		12			1005	60		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5155	1.365	1002	1.365		0			6		21			1003	71		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5187	2.184	1000	1.365		0			4		26			1001	67		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5267	1.706	1002	1.365		0			6		23			1003	79		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5305	1.365	1000	1.365		0			3		27			1001	77		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5309	1.365	1002	1.365		0			4		10			1003	82		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5331	2.184	1004	1.365		0			3		11			1005	63		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5335	1.365	1002	1.365		0			3		20			1003	62		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5340	1.706	1004	1.365		0			3		7			1005	70		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5643	1.365	1000	1.365		0			3		16			1001	72		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5737	1.706	1004	1.365		0			3		11			1005	61		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5752	2.184	1000	1.365		0			4		22			1001	65		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5887	1.706	1002	1.365		0			3		20			1003	59		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6091	1.365	1002	1.365		0			4		13			1003	69		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2306	1.477	1000	1.477		0			6		14			1001	94		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2504	2.363	1004	1.477		0			3		11			1005	85		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2628	1.477	1000	1.477		0			4		28			1001	106		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2733	1.846	1004	1.477		0			5		5			1005	92		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2745	2.363	1004	1.477		0			5		24			1005	113		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2883	2.363	1000	1.477		0			5		13			1001	114		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2893	1.846	1004	1.477		0			4		25			1005	90		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3004	1.846	1002	1.477		0			5		6			1003	88		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3022	1.477	1000	1.477		0			5		25			1001	87		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3029	2.363	1002	1.477		0			5		19			1003	110		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3073	1.846	1004	1.477		0			4		18			1005	100		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3100	1.846	1000	1.477		0			4		11			1001	118		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3103	1.846	1004	1.477		0			3		21			1005	99		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3143	2.363	1002	1.477		0			3		15			1003	107		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3158	1.846	1002	1.477		0			4		17			1003	102		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3192	2.363	1002	1.477		0			4		13			1003	84		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3233	2.363	1000	1.477		0			3		22			1001	96		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3284	2.363	1000	1.477		0			3		28			1001	109		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3361	1.846	1000	1.477		0			4		21			1001	121		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3367	1.846	1002	1.477		0			3		19			1003	97		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3380	1.846	1004	1.477		0			6		7			1005	115		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3483	1.477	1002	1.477		0			5		21			1003	111		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3513	1.477	1000	1.477		0			5		12			1001	120		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3564	1.846	1004	1.477		0			4		8			1005	91		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3583	2.363	1002	1.477		0			3		20			1003	105		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3591	2.363	1000	1.477		0			5		10			1001	98		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3642	2.363	1004	1.477		0			5		27			1005	95		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3718	1.846	1004	1.477		0			6		12			1005	112		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3723	2.363	1004	1.477		0			5		26			1005	89		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3748	2.363	1002	1.477		0			4		22			1003	101		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3823	1.846	1002	1.477		0			3		16			1003	108		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3958	2.363	1000	1.477		0			5		7			1001	103		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9943	1.992	1000	1.594		0			4		31			1001	139		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0407	2.550	1004	1.594		0			4		7			1005	144		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0672	2.550	1002	1.594		0			3		11			1003	124		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0677	1.992	1002	1.594		0			5		17			1003	123		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0782	1.992	1002	1.594		0			6		14			1003	126		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0809	2.550	1004	1.594		0			3		30			1005	138		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1014	2.550	1000	1.594		0			5		27			1001	153		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1081	1.992	1002	1.594		0			4		29			1003	130		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1119	1.594	1002	1.594		0			6		23			1003	156		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1186	1.992	1000	1.594		0			6		5			1001	131		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1316	2.550	1002	1.594		0			6		23			1003	142		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1334	1.992	1000	1.594		0			4		20			1001	136		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1417	2.550	1004	1.594		0			4		24			1005	145		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1443	2.550	1004	1.594		0			5		9			1005	154		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1466	1.992	1002	1.594		0			5		12			1003	155		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1528	1.992	1000	1.594		0			6		8			1001	134		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1600	1.992	1002	1.594		0			6		30			1003	125		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1689	1.992	1004	1.594		0			6		27			1005	129		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1691	1.992	1004	1.594		0			3		17			1005	137		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1726	1.992	1004	1.594		0			3		30			1005	127		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1758	1.594	1000	1.594		0			3		12			1001	141		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1771	1.594	1000	1.594		0			6		5			1001	149		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1829	2.550	1002	1.594		0			4		5			1003	143		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1829	1.992	1002	1.594		0			4		14			1003	148		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1884	1.992	1004	1.594		0			6		6			1005	146		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1887	1.594	1000	1.594		0			5		18			1001	128		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1949	1.992	1000	1.594		0			3		18			1001	151		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1975	2.550	1002	1.594		0			5		24			1003	122		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2010	1.594	1002	1.594		0			4		19			1003	152		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2050	1.594	1000	1.594		0			5		13			1001	147		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2090	1.594	1000	1.594		0			4		5			1001	132		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2113	1.992	1000	1.594		0			3		5			1001	135		1				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2405	2.550	1000	1.594		0			6		21			1001	133		0				1			2			20			15.0000		7.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2415	2.550	1004	1.594		0			4		28			1005	157		0				1			2			20			15.0000		7.000

; =============================================================================
; SEZIONE: "I. Te rompo rculo"
; Inizio: 22.000s, Durata: 8.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9221	1.850	1008	1.850		0			6		31			1009	170		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9599	2.690	1008	1.681		0			6		46			1009	165		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9624	2.706	1008	1.691		0			3		45			1009	172		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9644	1.392	1006	1.114		0			7		9			1007	161		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9657	1.842	1006	1.842		0			4		33			1007	171		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9680	2.307	1006	1.846		0			7		24			1007	177		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9710	3.032	1008	1.895		0			9		34			1009	174		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9914	2.652	1006	1.658		0			4		28			1007	167		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9942	1.577	1008	1.577		0			6		16			1009	163		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9975	2.553	1010	1.596		0			3		19			1011	164		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9991	1.966	1006	1.966		0			3		43			1007	159		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9999	1.761	1008	1.761		0			8		18			1009	173		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0124	1.964	1006	1.227		0			5		45			1007	158		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0324	1.545	1010	1.545		0			5		25			1011	162		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0470	1.380	1006	1.380		0			4		42			1007	168		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0501	1.636	1008	1.023		0			7		24			1009	160		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0531	1.573	1008	1.259		0			8		28			1009	166		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0585	1.614	1008	1.009		0			5		9			1009	169		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0690	1.791	1008	1.791		0			4		6			1009	175		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0723	1.733	1010	1.733		0			2		27			1011	176		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0750	1.414	1002	1.414		0			5		15			1003	192		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1583	2.248	1004	1.798		0			5		5			1005	191		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2034	1.568	1010	1.568		0			5		21			1011	178		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2225	1.747	1010	1.397		0			2		44			1011	186		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2240	1.736	1006	1.389		0			3		35			1007	187		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2286	2.368	1006	1.895		0			6		41			1007	184		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2309	2.363	1006	1.891		0			7		24			1007	183		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2520	1.427	1008	1.427		0			5		6			1009	181		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2590	1.936	1008	1.936		0			6		39			1009	188		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2713	1.428	1010	1.142		0			5		47			1011	179		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2721	1.670	1010	1.336		0			6		16			1011	180		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2780	2.915	1010	1.822		0			7		42			1011	190		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2799	2.449	1010	1.531		0			6		35			1011	193		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3133	1.279	1008	1.279		0			4		12			1009	189		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3504	1.147	1006	1.147		0			6		34			1007	182		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8975	1.564	1004	1.252		0			4		7			1005	198		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9128	1.678	1010	1.678		0			7		43			1011	203		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9317	1.950	1000	1.560		0			6		9			1001	204		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9343	3.142	1006	1.964		0			6		24			1007	199		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9556	2.127	1004	1.329		0			4		10			1005	194		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9637	2.720	1008	1.700		0			5		23			1009	195		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9727	1.261	1010	1.261		0			6		21			1011	202		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9844	1.750	1006	1.093		0			3		17			1007	201		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0097	1.142	1008	1.142		0			6		15			1009	206		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0222	1.582	1008	1.582		0			2		29			1009	196		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0647	2.981	1008	1.863		0			5		22			1009	200		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0872	1.590	1006	1.590		0			5		20			1007	205		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0841	2.144	1004	1.340		0			5		24			1005	218		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0990	1.364	1010	1.091		0			5		21			1011	216		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1081	1.924	1010	1.539		0			3		14			1011	220		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1188	1.671	1008	1.671		0			4		16			1009	219		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1214	2.904	1008	1.815		0			6		18			1009	221		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1325	1.117	1010	1.117		0			6		4			1011	207		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1405	1.584	1000	1.584		0			3		15			1001	215		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1442	2.245	1002	1.403		0			4		31			1003	222		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1447	2.663	1006	1.664		0			6		9			1007	223		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1495	2.119	1010	1.695		0			7		4			1011	213		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1544	2.520	1000	1.575		0			4		17			1001	214		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1575	2.088	1008	1.670		0			7		11			1009	212		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1623	2.496	1004	1.560		0			5		13			1005	211		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1670	2.806	1008	1.754		0			5		18			1009	210		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1714	3.180	1010	1.987		0			3		27			1011	209		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1837	1.868	1008	1.168		0			4		39			1009	208		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2545	1.791	1010	1.433		0			5		17			1011	217		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7124	2.582	1000	1.614		0			3		29			1001	230		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7314	1.441	1008	1.153		0			6		31			1009	228		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7491	1.448	1008	1.158		0			6		20			1009	233		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7748	1.581	1000	1.581		0			4		27			1001	226		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7780	1.602	1006	1.602		0			5		13			1007	225		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7802	1.366	1010	1.366		0			5		12			1011	234		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7857	1.986	1010	1.241		0			4		12			1011	229		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8156	1.144	1008	1.144		0			4		18			1009	235		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8263	2.300	1008	1.840		0			5		12			1009	231		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8442	1.645	1010	1.645		0			3		15			1011	237		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8460	2.037	1008	1.629		0			7		13			1009	227		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9160	1.312	1002	1.312		0			4		29			1003	232		1				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9308	2.135	1000	1.708		0			4		13			1001	224		0				1			2			20			22.0000		8.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9521	1.925	1006	1.540		0			5		24			1007	238		1				1			2			20			22.0000		8.000

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 30.000s, Durata: 67.500s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9330	45.562	1000	28.476		0			2		1			1001	246		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9364	24.782	1000	24.782		0			1		1			1001	245		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9437	36.090	1000	28.872		0			2		1			1001	240		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9445	41.722	1000	26.076		0			1		1			1001	241		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0035	23.231	1000	23.231		0			1		1			1001	250		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0065	44.132	1000	27.583		0			1		2			1001	247		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0077	41.453	1000	25.908		0			2		1			1001	254		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0162	24.245	1002	24.245		0			2		2			1003	239		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0227	30.022	1004	24.017		0			2		1			1005	243		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0389	30.304	1002	24.243		0			0		1			1003	242		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0592	47.082	1000	29.426		0			1		1			1001	244		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0752	29.971	1004	23.977		0			1		1			1005	251		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0787	29.903	1002	23.923		0			1		1			1003	252		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0822	30.298	1004	24.238		0			1		2			1005	253		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0886	44.553	1012	27.846		0			1		1			1013	249		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0904	26.005	1002	26.005		0			1		1			1003	248		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1216	33.850	1014	27.080		0			1		2			1015	256		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1238	38.411	1004	24.007		0			1		1			1005	260		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1264	29.717	1000	29.717		0			2		2			1001	255		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1319	39.312	1000	24.570		0			2		2			1001	257		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1643	31.281	1004	25.025		0			2		2			1005	259		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1774	25.556	1000	25.556		0			2		2			1001	262		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2099	36.979	1000	29.583		0			1		2			1001	264		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2229	29.112	1004	23.290		0			1		1			1005	265		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2402	28.420	1012	28.420		0			1		1			1013	263		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2422	25.898	1002	25.898		0			0		1			1003	270		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2446	31.773	1004	25.419		0			0		2			1005	267		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2761	31.327	1004	25.062		0			1		2			1005	268		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3162	39.138	1000	24.461		0			0		1			1001	271		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3689	28.418	1004	22.734		0			0		1			1005	275		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3980	28.918	1002	28.918		0			1		2			1003	279		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4037	36.713	1002	22.945		0			0		1			1003	266		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4202	43.756	1002	27.348		0			0		2			1003	274		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4328	41.871	1000	26.169		0			0		2			1001	272		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4444	28.244	1000	28.244		0			1		2			1001	277		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4582	26.714	1002	26.714		0			0		1			1003	283		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4812	37.744	1002	23.590		0			1		1			1003	284		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5140	30.169	1000	24.135		0			2		1			1001	280		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5307	37.132	1002	29.705		0			0		1			1003	281		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6516	36.187	1004	22.617		0			1		3			1005	288		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6546	36.494	1012	29.195		0			2		3			1013	286		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6908	27.031	1000	27.031		0			1		1			1001	285		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7147	31.340	1004	25.072		0			0		2			1005	290		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7322	35.411	1002	28.328		0			1		2			1003	287		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7654	25.116	1002	25.116		0			0		1			1003	289		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7934	41.699	1000	26.062		0			0		1			1001	292		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8248	28.287	1004	22.630		0			1		1			1005	293		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8662	47.842	1002	29.901		0			0		2			1003	291		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9594	35.797	1004	22.373		0			0		3			1005	296		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0600	23.173	1002	23.173		0			1		1			1003	299		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0866	37.593	1000	23.495		0			1		1			1001	295		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1021	45.029	1000	28.143		0			1		2			1001	301		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1408	46.154	1002	28.847		0			1		1			1003	298		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1485	30.577	1004	24.461		0			2		2			1005	297		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2498	27.004	1000	27.004		0			2		2			1001	302		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3178	40.665	1004	25.416		0			2		2			1005	304		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3292	23.460	1000	23.460		0			2		1			1001	305		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3416	40.683	1000	25.427		0			2		1			1001	303		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4343	29.747	1002	23.797		0			1		3			1003	308		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4944	24.445	1002	24.445		0			2		3			1003	307		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5173	34.817	1004	27.854		0			1		1			1005	310		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5476	27.069	1000	27.069		0			1		2			1001	306		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5560	0.352	1010	0.220		0			9		27			1011	721		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5704	37.297	1004	23.311		0			2		2			1005	312		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5923	27.674	1000	27.674		0			1		2			1001	311		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6436	28.209	1000	28.209		0			1		2			1001	309		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7246	24.161	1000	24.161		0			2		2			1001	315		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7742	45.599	1000	28.499		0			0		2			1001	314		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9408	0.233	1010	0.187		0			9		18			1011	722		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0193	23.805	1002	23.805		0			1		1			1003	316		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0240	42.254	1000	26.408		0			1		2			1001	318		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1516	42.536	1002	26.585		0			1		2			1003	321		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1717	34.720	1002	27.776		0			0		1			1003	320		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1851	36.614	1002	29.291		0			0		1			1003	322		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1959	30.568	1004	24.454		0			1		2			1005	319		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3265	24.113	1002	24.113		0			0		1			1003	325		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3326	0.708	1008	0.566		2			9		25			1009	731		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3519	40.756	1004	25.473		0			0		2			1005	326		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3680	22.942	1002	22.942		0			1		3			1003	323		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3888	26.537	1012	26.537		0			0		1			1013	324		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4142	0.822	1010	0.514		0			7		24			1011	727		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4383	0.236	1006	0.236		0			8		17			1007	724		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4473	0.256	1010	0.204		0			8		21			1011	726		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4636	0.172	1006	0.172		2			9		23			1007	725		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4854	0.708	1010	0.566		0			7		29			1011	728		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4938	0.565	1006	0.452		2			9		13			1007	732		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.5213	0.280	1008	0.280		2			9		15			1009	730		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.5360	0.154	1010	0.154		2			7		30			1011	729		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.6248	34.410	1000	27.528		0			1		1			1001	328		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.6291	36.629	1000	29.303		0			1		2			1001	329		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.6350	0.425	1006	0.340		0			7		26			1007	723		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7637	36.939	1012	23.087		0			0		1			1013	333		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7906	29.082	1012	29.082		0			1		3			1013	332		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7917	25.513	1000	25.513		0			2		2			1001	331		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8411	37.110	1004	23.194		0			1		1			1005	330		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8607	0.324	1006	0.259		2			8		27			1007	733		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9084	0.514	1008	0.514		2			7		21			1009	734		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9807	25.059	1000	25.059		0			2		3			1001	337		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0142	38.625	1004	24.141		0			1		3			1005	335		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0376	36.565	1004	22.853		0			2		2			1005	334		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1490	30.409	1000	24.327		0			1		3			1001	336		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2502	31.078	1000	24.862		0			2		1			1001	341		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2912	37.833	1000	23.646		0			1		1			1001	339		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3481	42.749	1002	26.718		0			2		1			1003	338		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4807	42.725	1000	26.703		0			2		2			1001	342		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5799	0.273	1006	0.218		2			9		32			1007	737		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5934	40.982	1004	25.614		0			1		3			1005	343		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6911	0.479	1010	0.384		0			9		29			1011	740		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6926	0.291	1008	0.233		0			7		44			1009	735		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6986	0.424	1006	0.424		2			9		21			1007	736		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7231	22.298	1000	22.298		0			1		2			1001	346		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7234	0.427	1006	0.427		0			7		2			1007	739		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7560	0.730	1010	0.584		2			9		21			1011	738		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7626	33.473	1000	26.778		0			0		1			1001	344		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7811	0.526	1006	0.329		2			8		23			1007	741		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7976	41.436	1002	25.897		0			1		1			1003	347		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7995	0.425	1010	0.340		0			9		30			1011	742		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8295	40.641	1002	25.400		0			1		3			1003	345		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9593	0.487	1008	0.389		0			9		6			1009	747		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0242	0.288	1010	0.288		0			7		25			1011	743		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0321	0.299	1008	0.299		0			7		26			1009	745		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0638	27.305	1000	27.305		0			2		3			1001	349		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0705	0.823	1010	0.514		0			8		19			1011	744		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0830	29.485	1000	29.485		0			2		2			1001	348		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0840	43.251	1004	27.032		0			2		1			1005	351		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0971	27.189	1014	27.189		0			1		1			1015	350		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1141	0.281	1008	0.281		0			9		19			1009	746		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1728	0.664	1010	0.415		2			7		16			1011	749		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1809	0.382	1006	0.239		2			9		31			1007	748		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2570	0.376	1006	0.376		0			9		18			1007	751		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3586	0.484	1010	0.484		2			8		11			1011	752		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3672	25.273	1014	25.273		0			2		3			1015	352		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3949	23.924	1014	23.924		0			2		2			1015	353		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4489	0.661	1006	0.413		2			7		19			1007	750		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4528	0.384	1008	0.384		2			8		27			1009	753		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5685	28.588	1014	28.588		0			2		4			1015	355		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5917	27.320	1004	21.856		0			1		2			1005	354		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7411	0.633	1010	0.506		2			8		18			1011	755		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7427	0.686	1008	0.549		0			8		16			1009	759		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7658	0.280	1006	0.175		2			8		33			1007	757		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7922	0.478	1006	0.478		0			7		37			1007	756		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8708	0.276	1008	0.276		2			9		31			1009	754		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8734	24.463	1012	24.463		0			2		1			1013	357		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8743	0.843	1006	0.527		2			9		12			1007	758		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.9210	27.215	1002	21.772		0			1		1			1003	356		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.9659	0.155	1006	0.155		0			7		4			1007	762		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.0905	0.550	1010	0.550		2			9		9			1011	765		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1064	0.673	1008	0.421		0			7		22			1009	761		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1315	0.305	1006	0.244		2			7		22			1007	763		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1487	0.478	1010	0.382		2			7		24			1011	760		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1654	0.199	1006	0.199		0			9		31			1007	764		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2295	27.878	1004	22.303		0			0		2			1005	358		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2976	32.357	1000	25.885		0			1		1			1001	359		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4817	24.466	1002	24.466		0			2		3			1003	361		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5488	35.993	1002	22.496		0			1		3			1003	362		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5755	29.346	1000	29.346		0			2		2			1001	360		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.7858	35.669	1002	28.535		0			1		1			1003	367		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.8313	36.382	1004	29.106		0			2		1			1005	366		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.8334	41.777	1004	26.111		0			2		1			1005	365		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1083	43.402	1000	27.126		0			2		1			1001	369		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1729	22.767	1014	22.767		0			2		3			1015	368		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.4358	31.828	1004	25.463		0			0		2			1005	370		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.4925	43.747	1002	27.342		0			1		1			1003	371		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7944	26.415	1000	26.415		0			1		2			1001	375		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8341	31.345	1002	25.076		0			1		1			1003	376		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8493	31.739	1000	25.391		0			2		4			1001	372		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8799	29.210	1004	23.368		0			2		3			1005	374		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8833	28.476	1000	22.781		0			1		4			1001	373		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1666	21.619	1000	21.619		0			2		1			1001	381		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1707	31.360	1004	25.088		0			2		4			1005	380		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1999	29.128	1012	29.128		0			2		2			1013	379		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.2106	24.546	1002	24.546		0			1		3			1003	378		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.2591	25.812	1012	25.812		0			2		1			1013	377		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5040	31.999	1000	25.599		0			2		4			1001	385		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5223	29.910	1004	23.928		0			1		2			1005	383		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5566	30.488	1004	24.391		0			1		3			1005	386		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5750	29.076	1002	23.261		0			0		1			1003	384		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5932	46.425	1002	29.016		0			2		3			1003	382		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7107	0.643	1010	0.515		2			7		38			1011	767		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7290	0.220	1006	0.176		2			7		11			1007	766		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7783	0.553	1006	0.553		0			8		30			1007	768		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8050	0.235	1010	0.188		0			9		20			1011	769		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8474	0.290	1006	0.181		0			7		36			1007	770		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8480	0.262	1006	0.163		2			9		23			1007	771		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8608	31.438	1000	25.150		0			3		4			1001	388		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8809	34.868	1000	27.894		0			2		2			1001	389		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9006	34.614	1014	21.634		0			1		4			1015	387		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9536	36.495	1004	22.809		0			2		1			1005	390		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9838	31.457	1002	25.165		0			1		4			1003	391		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0024	0.274	1010	0.274		2			8		14			1011	772		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.2775	34.603	1004	21.627		0			1		2			1005	392		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.2858	44.955	1002	28.097		0			3		3			1003	394		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3434	23.563	1014	23.563		0			2		3			1015	393		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6843	35.736	1004	22.335		0			3		2			1005	396		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7098	40.386	1014	25.242		0			3		2			1015	398		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7310	38.740	1000	24.212		0			1		5			1001	397		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7834	23.230	1002	23.230		0			2		3			1003	395		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0523	0.503	1006	0.402		0			8		25			1007	773		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0874	33.450	1000	26.760		0			3		3			1001	400		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0946	0.552	1008	0.442		2			7		43			1009	774		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1030	32.180	1000	25.744		0			1		4			1001	401		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1548	26.729	1002	21.383		0			0		4			1003	399		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4070	0.272	1010	0.218		0			8		31			1011	775		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4127	33.797	1002	27.038		0			1		2			1003	403		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4259	0.447	1010	0.447		2			8		18			1011	776		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4451	26.317	1002	21.054		0			3		4			1003	406		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4604	24.022	1002	24.022		0			3		3			1003	408		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4834	0.918	1006	0.574		2			7		17			1007	778		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5059	0.230	1010	0.184		0			8		17			1011	777		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5407	0.416	1010	0.416		2			9		23			1011	779		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5880	21.729	1002	21.729		0			1		5			1003	404		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8873	40.373	1002	25.233		0			3		2			1003	411		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9457	40.191	1014	25.120		0			2		3			1015	412		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.0288	31.628	1014	25.302		0			1		3			1015	409		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3258	34.611	1004	27.689		0			1		5			1005	415		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3362	44.450	1004	27.781		0			1		4			1005	413		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3504	45.863	1000	28.664		0			1		3			1001	416		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3831	38.456	1004	24.035		0			2		3			1005	418		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3911	27.108	1000	21.687		0			2		2			1001	417		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.7323	41.075	1002	25.672		0			3		2			1003	422		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.7693	0.310	1010	0.194		2			9		35			1011	782		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8004	42.061	1004	26.288		0			1		4			1005	420		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8272	0.720	1008	0.450		0			8		33			1009	781		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8391	35.538	1000	22.212		0			1		1			1001	419		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8534	24.845	1000	24.845		0			1		2			1001	423		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8549	0.507	1008	0.406		2			9		18			1009	783		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8573	0.957	1008	0.598		2			7		31			1009	780		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.8573	31.343	1004	25.074		0			2		4			1005	421		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.9439	0.882	1006	0.551		2			8		10			1007	784		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.9827	0.309	1008	0.309		2			9		23			1009	785		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.0636	0.678	1006	0.542		2			7		28			1007	786		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1342	26.623	1002	26.623		0			1		4			1003	427		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1620	43.478	1004	27.174		0			2		2			1005	425		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1957	27.885	1002	27.885		0			3		3			1003	424		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2672	33.605	1002	26.884		0			1		5			1003	426		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3040	25.533	1000	25.533		0			1		1			1001	428		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6680	43.250	1000	27.031		0			3		3			1001	430		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6826	34.304	1002	27.443		0			1		4			1003	432		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7019	0.558	1006	0.558		2			8		31			1007	787		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7199	0.387	1010	0.242		2			9		24			1011	789		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7342	0.420	1008	0.420		0			9		19			1009	790		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7377	34.952	1004	21.845		0			1		5			1005	433		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7391	0.864	1010	0.540		2			8		30			1011	788		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7465	39.016	1000	24.385		0			1		2			1001	431		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.8217	40.664	1004	25.415		0			2		1			1005	434		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.8708	0.523	1010	0.523		0			9		24			1011	791		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.9449	0.374	1006	0.234		0			9		34			1007	792		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.9758	0.378	1006	0.302		0			7		24			1007	793		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.0112	0.272	1006	0.217		2			8		17			1007	794		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.0245	0.464	1006	0.290		2			8		22			1007	795		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1054	34.340	1002	27.472		0			2		3			1003	438		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1780	28.097	1000	22.477		0			3		2			1001	437		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1985	26.676	1000	26.676		0			2		3			1001	435		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.1993	35.744	1004	28.595		0			2		2			1005	436		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6125	26.898	1004	21.518		0			2		4			1005	441		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6144	24.412	1002	24.412		0			1		2			1003	439		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6390	35.584	1004	28.467		0			2		4			1005	442		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7450	28.032	1004	22.426		0			3		3			1005	440		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9370	0.731	1010	0.585		0			9		29			1011	796		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9733	0.847	1008	0.530		2			8		35			1009	797		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9922	0.217	1010	0.217		0			8		23			1011	800		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0004	0.248	1006	0.248		2			9		38			1007	799		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0234	0.210	1010	0.168		0			8		34			1011	798		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0647	37.921	1014	23.701		0			3		4			1015	444		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0662	23.440	1002	23.440		0			2		1			1003	443		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0887	24.939	1000	24.939		0			1		5			1001	445		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5635	30.886	1004	24.709		0			2		2			1005	448		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5889	21.804	1012	21.804		0			1		3			1013	447		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6233	27.316	1002	27.316		0			1		6			1003	446		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6369	30.485	1000	24.388		0			3		2			1001	449		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.0703	38.454	1004	24.034		0			3		2			1005	450		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.0830	32.803	1004	26.242		0			2		2			1005	455		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.0859	29.818	1012	23.854		0			1		1			1013	453		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.1155	38.501	1002	24.063		0			3		5			1003	452		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.5883	37.740	1004	23.588		0			3		3			1005	460		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.5915	24.498	1002	24.498		0			2		5			1003	459		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.6079	27.977	1004	22.381		0			3		5			1005	456		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.6361	25.274	1004	20.219		0			1		4			1005	457		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0598	45.097	1002	28.186		0			2		5			1003	464		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0665	34.811	1000	21.757		0			1		2			1001	461		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0704	21.722	1002	21.722		0			2		6			1003	462		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.1406	33.880	1000	27.104		0			1		6			1001	463		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2978	0.290	1006	0.290		0			8		30			1007	802		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4139	0.585	1006	0.366		0			9		9			1007	801		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4199	0.166	1008	0.166		2			7		22			1009	803		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.6043	37.047	1000	23.154		0			3		2			1001	466		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.6508	28.296	1004	22.637		0			3		2			1005	467		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.7224	36.188	1002	22.618		0			3		2			1003	465		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.1647	36.099	1002	22.562		0			3		5			1003	469		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.1978	32.066	1002	20.041		0			2		4			1003	468		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.2104	39.576	1000	24.735		0			3		1			1001	470		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.2629	29.509	1004	23.607		0			1		6			1005	471		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4630	0.531	1008	0.531		0			7		27			1009	805		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.5132	0.268	1010	0.168		2			9		17			1011	806		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.5137	0.786	1006	0.491		2			8		19			1007	804		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.5209	0.222	1010	0.178		0			9		20			1011	807		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.7104	22.919	1012	22.919		0			1		6			1013	476		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.7318	41.005	1002	25.628		0			2		3			1003	474		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.7408	25.020	1002	25.020		0			3		4			1003	473		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.8077	34.263	1000	27.411		0			1		4			1001	472		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.8329	37.415	1000	23.384		0			3		3			1001	477		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0474	0.532	1006	0.532		0			9		19			1007	811		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0907	0.773	1008	0.483		2			7		34			1009	808		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1164	0.733	1010	0.586		2			9		18			1011	809		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1391	0.497	1008	0.397		2			7		12			1009	810		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1525	0.266	1010	0.266		0			9		17			1011	812		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2888	22.765	1002	22.765		0			1		4			1003	479		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3053	28.056	1002	28.056		0			2		6			1003	483		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3171	32.458	1000	25.966		0			2		4			1001	478		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3469	27.149	1014	21.719		0			1		5			1015	482		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3539	0.326	1010	0.326		0			7		21			1011	814		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4479	0.556	1006	0.556		2			7		21			1007	813		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6127	0.522	1008	0.417		2			8		8			1009	824		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6209	0.797	1008	0.498		2			8		30			1009	815		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6627	0.543	1006	0.543		0			7		22			1007	823		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6715	0.246	1010	0.196		0			7		24			1011	820		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6848	0.673	1008	0.539		2			7		29			1009	821		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6848	0.598	1010	0.478		0			8		30			1011	816		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6891	0.749	1006	0.599		0			7		27			1007	822		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7126	0.172	1010	0.172		2			8		33			1011	818		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7180	0.774	1008	0.484		0			9		11			1009	819		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7183	0.335	1010	0.335		0			9		31			1011	817		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8338	0.592	1008	0.592		2			8		32			1009	825		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8646	29.283	1004	23.426		0			1		2			1005	488		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8869	34.305	1002	21.441		0			2		1			1003	484		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8958	31.297	1012	19.560		0			3		6			1013	486		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9620	21.440	1000	21.440		0			3		3			1001	485		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3383	28.390	1002	22.712		0			2		6			1003	490		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3838	0.189	1008	0.189		2			7		24			1009	827		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4062	0.333	1006	0.333		0			7		17			1007	826		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4254	19.487	1000	19.487		0			3		2			1001	491		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4256	26.853	1004	21.483		0			2		7			1005	492		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4287	34.806	1002	27.845		0			2		3			1003	493		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4639	26.134	1004	20.907		0			1		5			1005	489		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6256	0.537	1010	0.537		0			8		24			1011	829		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6419	0.191	1008	0.153		0			7		37			1009	831		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6567	0.306	1008	0.306		2			8		25			1009	830		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.7168	0.665	1010	0.532		0			7		33			1011	828		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.8699	33.601	1002	21.001		0			1		5			1003	500		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.9158	28.392	1014	22.714		0			1		6			1015	495		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.9491	25.304	1000	25.304		0			1		6			1001	494		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.9700	22.814	1002	22.814		0			3		6			1003	499		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.9914	30.132	1014	24.106		0			3		3			1015	496		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.0020	22.232	1002	22.232		0			2		7			1003	497		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.0088	27.856	1000	22.285		0			2		4			1001	498		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.5712	26.525	1012	21.220		0			4		3			1013	505		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.5778	23.745	1002	23.745		0			1		4			1003	506		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.5779	0.452	1010	0.362		0			8		20			1011	833		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.6197	29.125	1004	23.300		0			3		5			1005	502		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.6376	23.457	1000	23.457		0			3		5			1001	503		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.7316	0.652	1010	0.521		2			7		7			1011	832		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.0068	0.341	1010	0.341		0			8		21			1011	834		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.0176	0.820	1010	0.512		0			9		15			1011	835		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.2282	30.737	1014	24.590		0			2		7			1015	508		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.2414	32.456	1000	25.965		0			2		8			1001	510		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.2532	29.085	1002	23.268		0			4		5			1003	509		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.5290	0.196	1008	0.157		2			8		31			1009	836		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.5347	0.192	1008	0.192		0			9		20			1009	837		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6280	0.317	1006	0.198		0			8		26			1007	840		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6523	0.398	1010	0.398		2			7		13			1011	838		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6628	0.290	1006	0.232		2			7		40			1007	839		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.7125	0.586	1010	0.586		2			9		25			1011	843		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.7149	26.381	1014	21.105		0			2		8			1015	514		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.7251	0.417	1010	0.417		2			8		37			1011	841		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.7606	39.499	1002	24.687		0			4		7			1003	512		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.8028	27.954	1012	22.363		0			3		1			1013	513		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.8314	34.124	1004	21.327		0			2		7			1005	511		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.8499	0.337	1006	0.337		0			9		6			1007	842		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.8619	29.419	1002	23.535		0			2		7			1003	515		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3380	0.708	1008	0.566		0			7		24			1009	844		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3705	19.129	1000	19.129		0			4		8			1001	519		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4084	26.893	1002	21.514		0			2		6			1003	520		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4125	31.074	1012	19.421		0			1		7			1013	518		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4509	32.385	1014	25.908		0			2		5			1015	521		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4562	42.699	1002	26.687		0			2		2			1003	517		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4857	37.551	1004	23.470		0			2		3			1005	516		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.6980	0.439	1008	0.351		2			8		32			1009	845		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0142	32.418	1000	25.935		0			4		3			1001	523		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0344	31.594	1004	25.275		0			3		8			1005	525		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0502	30.196	1004	24.157		0			3		2			1005	526		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0582	23.766	1004	19.012		0			1		5			1005	522		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0678	35.115	1014	21.947		0			1		8			1015	524		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0717	26.408	1002	21.126		0			2		7			1003	528		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.0817	24.895	1002	19.916		0			2		2			1003	527		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5438	26.303	1012	21.042		0			2		4			1013	530		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6871	41.334	1000	25.834		0			1		2			1001	532		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7234	35.728	1004	22.330		0			2		8			1005	531		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7384	37.337	1012	23.335		0			3		5			1013	529		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.3064	31.700	1000	19.812		0			3		7			1001	533		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.3494	32.822	1002	26.257		0			3		7			1003	534		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.3501	39.434	1014	24.646		0			1		5			1015	535		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.3538	35.495	1000	22.185		0			3		2			1001	536		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9441	30.470	1014	24.376		0			3		5			1015	537		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9754	25.167	1000	20.133		0			4		3			1001	539		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9963	26.142	1002	20.914		0			2		4			1003	540		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9968	29.689	1004	18.556		0			2		6			1005	538		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.5467	0.281	1006	0.225		2			7		29			1007	846		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6155	26.254	1014	21.003		0			4		8			1015	546		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6247	38.682	1002	24.177		0			2		3			1003	545		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6274	26.566	1012	26.566		0			3		3			1013	541		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6360	26.286	1012	26.286		0			2		5			1013	543		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6558	0.686	1008	0.429		2			8		21			1009	850		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6558	0.810	1006	0.506		0			7		13			1007	847		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6734	0.456	1006	0.456		2			8		34			1007	851		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6820	0.193	1010	0.193		2			7		11			1011	849		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6833	32.658	1000	26.126		0			1		7			1001	544		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6917	0.718	1008	0.574		2			9		31			1009	848		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.7501	31.628	1002	25.303		0			2		3			1003	542		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2528	26.759	1002	21.407		0			2		7			1003	550		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2839	20.651	1000	20.651		0			2		8			1001	549		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3141	22.976	1012	18.381		0			3		2			1013	547		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3254	24.983	1000	24.983		0			3		5			1001	552		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3399	19.236	1000	19.236		0			2		9			1001	551		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3576	0.532	1008	0.332		0			8		9			1009	852		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4664	0.204	1010	0.163		2			7		8			1011	853		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.8343	0.244	1010	0.244		2			7		23			1011	854		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.9812	26.030	1012	26.030		0			1		7			1013	554		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.0057	26.616	1002	21.292		0			2		5			1003	557		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.0069	37.210	1002	23.256		0			3		2			1003	556		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.0082	20.786	1012	20.786		0			2		7			1013	553		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.0112	42.528	1014	26.580		0			4		6			1015	555		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2152	0.298	1008	0.239		0			9		20			1009	860		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2581	0.570	1010	0.356		2			9		26			1011	856		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2974	0.285	1008	0.228		2			7		22			1009	862		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.3381	0.857	1008	0.536		2			9		43			1009	857		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.3615	0.486	1008	0.486		0			9		5			1009	858		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.3675	0.227	1006	0.227		0			9		22			1007	859		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.4095	0.222	1008	0.178		2			9		23			1009	855		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.4373	0.249	1008	0.155		2			9		30			1009	863		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.4608	0.280	1008	0.280		2			7		21			1009	861		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6238	32.849	1000	20.531		0			3		4			1001	560		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6316	40.648	1012	25.405		0			3		4			1013	558		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6357	26.564	1012	26.564		0			4		5			1013	559		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6373	23.789	1000	23.789		0			2		3			1001	561		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6445	19.478	1000	19.478		0			4		8			1001	562		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.6907	0.499	1006	0.312		2			9		34			1007	864		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.7021	0.303	1008	0.243		0			9		27			1009	865		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.7171	28.535	1012	22.828		0			2		3			1013	563		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.7213	23.540	1014	23.540		0			2		8			1015	564		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.7284	0.576	1010	0.460		0			9		22			1011	868		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.7353	0.486	1006	0.389		2			9		9			1007	866		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.0231	0.577	1006	0.461		2			8		38			1007	867		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.2369	0.404	1008	0.404		2			9		26			1009	869		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.2760	31.723	1002	19.827		0			3		3			1003	566		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.3441	26.018	1002	20.815		0			3		2			1003	570		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.3625	31.664	1012	25.331		0			4		6			1013	567		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.4032	29.539	1000	23.631		0			4		5			1001	569		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0126	29.955	1004	18.722		0			2		9			1005	576		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0205	36.249	1000	22.656		0			4		6			1001	578		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0709	32.264	1002	25.811		0			3		7			1003	577		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0919	22.863	1014	22.863		0			4		4			1015	571		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.1004	20.802	1014	20.802		0			3		8			1015	573		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.1657	28.722	1012	22.977		0			3		3			1013	574		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.1934	23.871	1012	19.097		0			3		7			1013	572		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7037	30.203	1000	18.877		0			3		6			1001	584		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7498	24.156	1002	19.325		0			4		9			1003	581		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7573	22.167	1002	17.734		0			3		9			1003	580		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7639	28.610	1004	22.888		0			4		7			1005	585		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.8076	31.998	1000	25.599		0			4		6			1001	579		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.8379	22.693	1002	22.693		0			4		7			1003	582		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.8525	30.475	1004	19.047		0			3		7			1005	583		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4482	40.932	1004	25.583		0			4		3			1005	590		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4700	19.929	1012	19.929		0			3		5			1013	587		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4912	17.658	1014	17.658		0			2		3			1015	591		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5094	39.627	1000	24.767		0			2		2			1001	588		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5151	26.756	1004	21.405		0			3		5			1005	589		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5843	23.331	1014	23.331		0			3		5			1015	586		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5961	19.040	1002	19.040		0			3		8			1003	592		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7018	0.776	1010	0.485		2			9		37			1011	870		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0447	0.763	1010	0.477		2			7		5			1011	874		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0542	0.899	1006	0.562		0			8		32			1007	875		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0638	0.549	1010	0.549		0			9		19			1011	873		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0787	0.466	1006	0.466		2			7		12			1007	872		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1048	0.358	1008	0.286		0			7		34			1009	871		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2145	25.580	1002	25.580		0			5		5			1003	598		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2379	35.189	1000	21.993		0			2		5			1001	593		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2469	24.690	1014	24.690		0			2		9			1015	594		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2596	19.448	1014	19.448		0			2		6			1015	597		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2629	31.093	1012	24.874		0			4		4			1013	595		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2692	26.805	1002	21.444		0			3		3			1003	596		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6261	0.428	1010	0.428		2			8		39			1011	876		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.9410	30.239	1014	24.191		0			3		3			1015	603		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.9539	18.342	1000	18.342		0			2		3			1001	599		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.0243	31.861	1012	25.489		0			5		4			1013	602		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.0426	18.674	1014	18.674		0			4		9			1015	601		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3007	0.378	1006	0.378		0			7		13			1007	880		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4270	0.443	1008	0.443		2			9		42			1009	877		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4368	0.479	1006	0.479		2			7		29			1007	883		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4711	0.355	1010	0.355		2			8		2			1011	879		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4827	0.473	1006	0.379		0			7		21			1007	878		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5112	0.485	1006	0.388		2			7		36			1007	881		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5367	0.505	1008	0.404		0			9		13			1009	882		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.6522	0.477	1006	0.477		0			7		34			1007	884		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.6792	0.403	1010	0.403		0			7		20			1011	885		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7025	18.125	1012	18.125		0			4		2			1013	608		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7031	22.846	1014	22.846		0			4		4			1015	606		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7110	40.456	1014	25.285		0			2		3			1015	610		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7158	22.587	1014	18.069		0			4		8			1015	612		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7709	18.768	1012	18.768		0			2		8			1013	604		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7788	28.058	1014	22.447		0			4		10			1015	613		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7794	25.710	1000	20.568		0			3		7			1001	605		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7813	39.903	1000	24.939		0			2		2			1001	609		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7858	24.533	1004	19.626		0			2		2			1005	611		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9891	0.323	1008	0.202		0			9		24			1009	886		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9941	0.266	1008	0.266		2			8		30			1009	889		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0691	0.546	1010	0.437		2			7		23			1011	890		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1842	0.710	1006	0.568		2			8		16			1007	887		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3504	0.251	1006	0.251		0			9		35			1007	888		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5264	28.212	1004	22.570		0			3		2			1005	614		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5369	21.415	1014	17.132		0			2		9			1015	615		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5418	28.432	1002	22.746		0			3		2			1003	618		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6307	20.355	1000	20.355		0			2		10			1001	617		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6535	21.978	1014	21.978		0			3		7			1015	616		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.2496	29.585	1012	23.668		0			3		7			1013	620		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.2618	25.104	1000	25.104		0			3		6			1001	624		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.2666	21.347	1012	21.347		0			5		10			1013	621		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.2838	42.054	1002	26.284		0			2		7			1003	619		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3140	29.134	1014	23.307		0			4		9			1015	623		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3184	0.207	1008	0.207		2			7		38			1009	893		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3258	0.582	1006	0.465		2			8		2			1007	892		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3283	0.339	1006	0.271		0			7		27			1007	891		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3434	0.557	1008	0.445		2			8		23			1009	895		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3647	0.711	1008	0.445		0			8		14			1009	896		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.3876	0.155	1010	0.155		0			9		23			1011	894		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7627	0.275	1008	0.220		2			7		35			1009	903		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7769	0.528	1008	0.528		2			9		40			1009	902		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8705	0.215	1008	0.172		0			8		12			1009	899		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8967	0.853	1008	0.533		0			7		26			1009	900		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9195	0.305	1008	0.244		0			9		32			1009	897		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9267	0.667	1006	0.417		2			9		28			1007	907		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9316	0.694	1010	0.555		2			9		20			1011	901		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9385	0.749	1010	0.600		2			7		14			1011	898		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9395	0.407	1010	0.407		2			8		28			1011	905		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9684	0.195	1010	0.156		0			8		35			1011	909		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9974	0.901	1010	0.563		0			8		25			1011	906		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0083	0.356	1008	0.356		0			9		37			1009	910		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0194	40.885	1004	25.553		0			3		8			1005	629		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0253	0.773	1008	0.483		2			8		24			1009	908		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0414	0.486	1010	0.486		2			7		17			1011	911		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0717	35.101	1012	21.938		0			3		9			1013	625		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0788	29.264	1014	18.290		0			5		7			1015	627		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.0804	0.598	1006	0.374		2			7		44			1007	904		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.1086	36.607	1000	22.879		0			3		10			1001	628		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.1117	34.709	1000	21.693		0			4		5			1001	626		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.7812	33.444	1012	20.902		0			4		3			1013	635		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.7987	18.812	1012	18.812		0			3		6			1013	632		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8240	25.543	1002	20.434		0			3		6			1003	633		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8387	22.650	1012	18.120		0			4		3			1013	636		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8645	32.378	1014	20.236		0			5		7			1015	634		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8728	0.513	1006	0.411		0			8		41			1007	914		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8807	26.733	1014	16.708		0			2		6			1015	630		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8880	0.585	1008	0.468		2			7		38			1009	915		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8917	25.917	1002	25.917		0			3		2			1003	631		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9224	0.300	1010	0.300		0			9		21			1011	913		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9356	0.602	1008	0.481		0			9		29			1009	916		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9436	27.325	1000	21.860		0			2		9			1001	637		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1468	0.943	1010	0.589		2			7		30			1011	912		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1952	0.433	1008	0.433		2			9		32			1009	917		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1993	0.298	1010	0.298		2			8		23			1011	920		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2149	0.317	1008	0.198		2			7		33			1009	918		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2586	0.367	1008	0.229		2			9		22			1009	921		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2752	0.225	1010	0.225		2			9		14			1011	919		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3056	0.167	1010	0.167		0			8		25			1011	922		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3284	0.523	1006	0.523		0			9		1			1007	923		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5473	16.806	1012	16.806		0			5		6			1013	642		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5762	24.209	1014	24.209		0			3		4			1015	641		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5848	19.567	1014	19.567		0			2		7			1015	639		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6011	37.219	1012	23.262		0			4		11			1013	644		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6228	19.926	1014	19.926		0			3		6			1015	643		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6902	0.525	1006	0.525		2			9		29			1007	924		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7224	25.963	1000	20.770		0			5		6			1001	638		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7229	23.517	1014	18.814		0			4		4			1015	640		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7434	0.316	1006	0.253		0			7		40			1007	925		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7608	0.191	1006	0.153		0			7		22			1007	926		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8639	0.542	1006	0.433		2			9		36			1007	928		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8672	0.244	1006	0.244		0			7		29			1007	929		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8694	0.160	1008	0.160		2			9		22			1009	927		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8726	0.639	1006	0.512		2			7		23			1007	930		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9356	0.373	1006	0.298		0			8		18			1007	935		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9701	0.569	1006	0.569		0			8		14			1007	932		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9808	0.542	1010	0.339		0			7		45			1011	931		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0615	0.538	1008	0.538		0			9		22			1009	934		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0761	0.520	1010	0.520		2			9		12			1011	933		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3924	30.714	1000	24.571		0			2		6			1001	648		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4034	23.837	1002	19.070		0			5		3			1003	646		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4600	27.928	1004	22.343		0			5		8			1005	645		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4679	0.597	1006	0.597		0			9		39			1007	936		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4724	0.414	1008	0.331		2			8		25			1009	938		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4854	0.515	1010	0.322		2			7		8			1011	939		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4980	0.299	1006	0.239		2			8		36			1007	937		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4999	19.449	1014	19.449		0			5		5			1015	650		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5061	30.676	1002	24.540		0			2		7			1003	647		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5075	34.693	1014	21.683		0			5		7			1015	651		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5247	30.527	1012	24.422		0			4		7			1013	649		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5704	0.511	1008	0.511		0			7		34			1009	940		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.2713	26.305	1014	16.441		0			4		11			1015	656		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.2857	25.982	1012	20.786		0			4		8			1013	653		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.3085	41.238	1014	25.774		0			5		4			1015	654		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.3111	23.117	1002	18.493		0			3		3			1003	655		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.3558	22.664	1002	18.131		0			5		3			1003	652		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.6464	0.348	1006	0.279		0			9		14			1007	941		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.6723	0.275	1008	0.275		2			7		30			1009	942		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0538	27.193	1014	16.996		0			5		8			1015	658		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0813	20.356	1004	16.285		0			2		4			1005	664		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1021	29.371	1014	18.357		0			3		9			1015	661		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1149	25.249	1012	25.249		0			3		7			1013	667		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1212	31.045	1014	24.836		0			2		8			1015	660		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1319	36.192	1012	22.620		0			2		4			1013	665		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1365	27.309	1002	17.068		0			3		4			1003	666		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1443	21.974	1002	21.974		0			3		5			1003	663		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1547	28.827	1012	23.061		0			2		12			1013	662		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2275	41.199	1004	25.750		0			4		8			1005	668		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3460	0.614	1010	0.491		2			9		34			1011	943		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3600	0.239	1008	0.239		2			8		25			1009	944		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.8377	23.698	1000	23.698		0			3		6			1001	670		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9093	25.451	1000	20.361		0			2		6			1001	671		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9480	17.485	1002	17.485		0			4		7			1003	673		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9590	19.131	1014	19.131		0			4		9			1015	669		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9788	19.830	1014	19.830		0			4		9			1015	672		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.0849	0.729	1008	0.456		0			7		14			1009	948		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.0898	0.174	1006	0.174		0			8		30			1007	949		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1169	0.590	1008	0.590		0			8		34			1009	947		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1253	0.599	1006	0.599		0			8		4			1007	945		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1343	0.469	1010	0.375		0			7		36			1011	946		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1571	0.412	1008	0.257		0			9		1			1009	950		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7142	20.439	1014	20.439		0			5		5			1015	679		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7179	27.591	1000	22.072		0			3		12			1001	675		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7378	19.876	1004	15.900		0			5		10			1005	678		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7518	25.581	1000	15.988		0			3		12			1001	674		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7776	19.879	1002	19.879		0			2		6			1003	680		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7897	27.639	1004	22.111		0			2		3			1005	677		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7920	23.990	1012	19.192		0			3		11			1013	682		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8208	0.596	1006	0.476		2			7		26			1007	955		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8252	37.377	1014	23.361		0			3		3			1015	681		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8293	0.452	1006	0.452		2			7		37			1007	953		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8408	19.229	1014	19.229		0			2		11			1015	676		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8488	0.347	1008	0.277		0			7		19			1009	951		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8642	0.557	1006	0.348		2			7		11			1007	954		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8718	0.346	1008	0.346		0			7		27			1009	952		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8755	0.308	1008	0.247		2			9		24			1009	956		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8843	0.309	1008	0.193		0			7		32			1009	959		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.9181	0.790	1006	0.494		0			9		26			1007	958		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.9361	0.741	1006	0.593		2			7		16			1007	957		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.0624	0.398	1008	0.398		0			9		15			1009	963		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.0772	0.396	1008	0.248		0			7		24			1009	960		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.0888	0.510	1008	0.319		0			8		26			1009	961		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.1034	0.224	1008	0.224		0			7		32			1009	964		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.1564	0.257	1008	0.205		2			8		30			1009	962		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.2674	0.304	1010	0.304		0			9		33			1011	966		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.3560	0.279	1008	0.224		2			8		20			1009	971		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.3668	0.604	1010	0.483		0			9		13			1011	972		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.3962	0.230	1008	0.230		2			8		16			1009	970		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.4035	0.752	1008	0.470		2			7		25			1009	969		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.4109	0.533	1008	0.533		2			8		29			1009	965		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.4166	0.240	1006	0.150		0			8		19			1007	968		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.4889	0.340	1010	0.272		0			8		27			1011	967		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.5682	36.385	1014	22.741		0			5		4			1015	684		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.5836	27.916	1004	22.333		0			2		6			1005	685		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.5911	27.984	1004	17.490		0			5		9			1005	687		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6163	28.570	1012	17.856		0			3		6			1013	686		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6215	34.316	1012	21.447		0			4		6			1013	689		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6226	31.793	1004	19.870		0			5		11			1005	683		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6745	30.189	1002	24.151		0			4		12			1003	688		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3978	35.543	1004	22.214		0			2		3			1005	692		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4240	30.000	1012	18.750		0			3		10			1013	690		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4816	22.734	1000	22.734		0			5		12			1001	693		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4918	17.915	1014	17.915		0			3		12			1015	691		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5197	29.844	1012	18.652		0			3		6			1013	695		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5263	20.032	1012	16.026		0			3		7			1013	694		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.2811	38.248	1000	23.905		0			3		8			1001	697		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.2991	20.379	1002	16.303		0			6		11			1003	702		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3604	35.078	1012	21.924		0			4		9			1013	703		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3711	21.354	1014	21.354		0			5		9			1015	704		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3903	20.690	1014	20.690		0			3		6			1015	698		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3939	26.747	1014	21.398		0			2		3			1015	701		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3959	23.319	1002	23.319		0			5		13			1003	699		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4423	22.757	1000	18.205		0			4		3			1001	700		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.6525	0.272	1006	0.170		2			9		29			1007	973		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.7006	0.938	1006	0.586		0			8		40			1007	974		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1222	22.557	1014	18.045		0			3		12			1015	708		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1851	24.800	1000	15.500		0			5		4			1001	705		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2266	26.663	1012	21.330		0			4		11			1013	707		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2371	21.171	1014	21.171		0			5		11			1015	711		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2468	28.279	1014	17.674		0			2		4			1015	709		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2711	27.368	1000	21.894		0			2		3			1001	706		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2763	0.297	1008	0.186		2			8		10			1009	979		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2879	23.252	1014	23.252		0			3		3			1015	710		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2998	0.945	1010	0.591		0			8		22			1011	977		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3145	0.348	1008	0.348		0			7		26			1009	976		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3198	0.231	1006	0.185		0			8		33			1007	975		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3796	0.608	1010	0.380		0			7		27			1011	978		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.7480	0.561	1010	0.449		0			7		30			1011	982		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.7513	0.732	1008	0.457		2			7		41			1009	981		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.7788	0.637	1010	0.509		0			7		26			1011	984		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.7854	0.402	1010	0.251		0			7		47			1011	980		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8121	0.429	1010	0.268		0			9		32			1011	985		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8238	0.566	1006	0.354		0			9		24			1007	983		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0399	30.387	1014	24.309		0			6		5			1015	715		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0532	20.111	1012	20.111		0			2		3			1013	719		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0779	24.916	1012	19.932		0			5		13			1013	718		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0839	20.790	1014	16.632		0			4		9			1015	717		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0901	24.368	1000	15.230		0			4		8			1001	716		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0918	28.829	1002	18.018		0			2		6			1003	712		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1115	25.009	1004	20.007		0			5		6			1005	720		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1133	29.446	1000	23.557		0			5		9			1001	713		1				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1579	26.348	1014	21.079		0			3		12			1015	714		2				1			2			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1757	0.517	1006	0.517		2			8		24			1007	987		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1824	0.564	1010	0.452		0			9		27			1011	991		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.2167	0.273	1008	0.171		2			8		26			1009	990		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.2545	0.289	1006	0.289		2			8		26			1007	988		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.3185	0.580	1006	0.580		0			9		10			1007	986		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.3457	0.369	1006	0.295		0			8		23			1007	989		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.4395	0.718	1010	0.449		0			7		28			1011	992		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.8408	0.412	1008	0.412		2			8		25			1009	994		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.8687	0.943	1008	0.589		2			9		17			1009	993		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.6737	0.388	1008	0.388		0			7		37			1009	997		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.7086	0.720	1008	0.576		0			7		26			1009	996		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.7142	0.264	1008	0.264		2			8		23			1009	995		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	75.7463	0.744	1006	0.465		0			8		22			1007	998		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.1254	0.437	1008	0.437		2			9		10			1009	1005		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.1432	0.292	1010	0.233		0			8		32			1011	999		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.1752	0.355	1010	0.355		0			7		29			1011	1000		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.1991	0.260	1006	0.208		0			8		15			1007	1001		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.2323	0.534	1010	0.427		0			8		28			1011	1003		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.2561	0.612	1006	0.490		2			7		12			1007	1002		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.3067	0.293	1006	0.293		2			9		35			1007	1004		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.4005	0.499	1010	0.499		2			7		7			1011	1006		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.4141	0.433	1006	0.271		2			7		22			1007	1007		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.4320	0.572	1008	0.457		0			9		28			1009	1008		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.4352	0.634	1006	0.396		2			7		18			1007	1011		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.4435	0.382	1008	0.238		2			7		24			1009	1010		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	76.5071	0.487	1010	0.305		0			9		30			1011	1009		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.4011	0.667	1010	0.533		0			7		18			1011	1013		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.4252	0.377	1006	0.377		2			7		35			1007	1012		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.4790	0.354	1008	0.221		2			7		35			1009	1014		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.6707	0.495	1006	0.396		2			8		28			1007	1016		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.7771	0.413	1008	0.413		0			8		34			1009	1017		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.7895	0.908	1008	0.568		0			9		32			1009	1018		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.7941	0.517	1008	0.517		2			8		8			1009	1020		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.7948	0.541	1010	0.541		2			9		20			1011	1015		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8135	0.208	1006	0.208		2			9		19			1007	1025		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8376	0.379	1008	0.303		0			8		18			1009	1024		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8378	0.624	1006	0.390		2			9		28			1007	1019		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8390	0.403	1006	0.403		0			8		28			1007	1026		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8645	0.382	1008	0.306		0			7		35			1009	1021		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.8771	0.718	1006	0.574		2			9		22			1007	1022		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9511	0.407	1006	0.326		0			7		31			1007	1023		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.3144	0.542	1010	0.434		0			8		5			1011	1029		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.3300	0.562	1008	0.450		0			9		24			1009	1028		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.3468	0.448	1006	0.359		0			9		36			1007	1027		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4040	0.659	1010	0.412		0			8		16			1011	1031		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4149	0.834	1010	0.521		2			9		5			1011	1030		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4640	0.289	1006	0.231		2			7		37			1007	1033		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4886	0.273	1006	0.273		0			7		32			1007	1032		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4893	0.398	1010	0.249		0			9		19			1011	1034		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5401	0.562	1006	0.562		0			8		21			1007	1035		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5539	0.835	1010	0.522		2			8		8			1011	1036		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.6637	0.595	1008	0.372		0			9		19			1009	1044		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7123	0.267	1008	0.214		2			9		31			1009	1037		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7661	0.805	1010	0.503		2			9		18			1011	1041		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7821	0.916	1006	0.572		2			8		31			1007	1039		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7991	0.508	1008	0.407		2			8		22			1009	1038		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8151	0.448	1006	0.358		0			9		30			1007	1042		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8154	0.459	1008	0.459		2			8		39			1009	1040		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.9547	0.744	1010	0.595		2			7		25			1011	1048		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.9791	0.237	1006	0.190		0			9		30			1007	1043		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.9885	0.729	1006	0.583		0			8		14			1007	1046		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.0002	0.357	1008	0.223		0			7		5			1009	1045		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.0093	0.649	1006	0.519		0			8		40			1007	1047		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.1802	0.696	1010	0.557		2			9		16			1011	1052		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2051	0.389	1008	0.389		2			9		25			1009	1049		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2112	0.726	1008	0.454		2			9		38			1009	1050		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2374	0.393	1008	0.393		2			9		26			1009	1051		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.3690	0.564	1006	0.564		0			9		25			1007	1055		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.4252	0.683	1008	0.427		0			7		36			1009	1054		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	81.5014	0.317	1010	0.198		0			9		21			1011	1053		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.6007	0.654	1008	0.523		0			9		6			1009	1058		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.6119	0.514	1010	0.514		0			8		32			1011	1056		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.6285	0.702	1008	0.439		2			9		30			1009	1059		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	82.6419	0.266	1010	0.266		2			8		10			1011	1057		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.0610	0.428	1010	0.428		0			9		44			1011	1062		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.1239	0.284	1010	0.227		2			8		19			1011	1060		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.1877	0.254	1006	0.159		2			9		19			1007	1061		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.1943	0.319	1010	0.319		0			8		25			1011	1067		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.2291	0.530	1008	0.530		0			7		35			1009	1065		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.2459	0.428	1006	0.267		0			9		20			1007	1066		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.2658	0.680	1008	0.425		0			8		49			1009	1064		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	83.3259	0.644	1006	0.515		0			9		26			1007	1063		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	84.9268	0.246	1006	0.246		2			9		16			1007	1068		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	84.9861	0.221	1008	0.221		0			7		4			1009	1070		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.0007	0.412	1010	0.412		2			7		17			1011	1069		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.8047	0.286	1010	0.179		2			8		34			1011	1072		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.8311	0.325	1010	0.325		0			9		30			1011	1074		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.8830	0.700	1008	0.560		2			7		23			1009	1071		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.9032	0.536	1006	0.536		0			8		25			1007	1073		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	85.9052	0.282	1006	0.176		0			9		19			1007	1075		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.1639	0.508	1006	0.407		2			7		24			1007	1076		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.2591	0.699	1006	0.559		0			7		27			1007	1077		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.2867	0.367	1008	0.294		2			8		16			1009	1078		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.8303	0.332	1010	0.266		2			9		32			1011	1080		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.8455	0.206	1006	0.206		2			7		50			1007	1079		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.8989	0.283	1006	0.177		2			9		33			1007	1082		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.9029	0.416	1008	0.333		2			8		20			1009	1081		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.9042	0.742	1006	0.593		2			8		16			1007	1084		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.9135	0.667	1008	0.534		0			8		33			1009	1083		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	86.9568	0.467	1010	0.373		0			7		35			1011	1085		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	87.1710	0.501	1010	0.501		2			7		31			1011	1086		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	88.5856	0.234	1008	0.234		0			8		24			1009	1087		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.2372	0.455	1006	0.455		0			8		30			1007	1091		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.2783	0.316	1010	0.316		2			9		14			1011	1092		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.2876	0.813	1008	0.508		0			8		21			1009	1090		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.3144	0.152	1010	0.152		0			8		24			1011	1093		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.3269	0.526	1006	0.526		2			8		25			1007	1089		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	89.3629	0.290	1008	0.290		0			7		23			1009	1088		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.3870	0.443	1010	0.354		0			7		27			1011	1095		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.3897	0.288	1008	0.288		0			7		35			1009	1096		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.4185	0.886	1008	0.554		2			7		11			1009	1098		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.4367	0.176	1010	0.176		2			8		20			1011	1097		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.4443	0.270	1010	0.270		2			9		33			1011	1094		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.2809	0.382	1008	0.382		0			8		12			1009	1101		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3073	0.759	1006	0.474		0			7		24			1007	1099		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3182	0.708	1010	0.443		2			7		20			1011	1100		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3778	0.381	1006	0.238		0			8		15			1007	1103		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3933	0.909	1008	0.568		0			8		34			1009	1102		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	92.1223	0.417	1006	0.334		0			8		34			1007	1105		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	92.1291	0.287	1006	0.287		2			8		37			1007	1104		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	92.3762	0.377	1008	0.235		2			7		26			1009	1108		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	92.4172	0.538	1008	0.337		0			7		25			1009	1107		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	92.4235	0.931	1006	0.582		0			8		30			1007	1106		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	95.2039	0.434	1006	0.271		0			9		14			1007	1109		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	95.2108	0.422	1010	0.422		0			8		24			1011	1110		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	95.4298	0.530	1010	0.424		0			9		32			1011	1111		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	95.8373	0.513	1010	0.513		2			7		18			1011	1112		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	96.7183	0.474	1008	0.474		2			8		35			1009	1113		3				1			5			20			30.0000		67.500
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	96.7661	0.620	1008	0.387		0			9		36			1009	1114		3				1			5			20			30.0000		67.500

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
