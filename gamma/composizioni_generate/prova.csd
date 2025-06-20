
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
f 0 146.23869817424992 ; Evento f fittizio per definire la durata totale
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
; sezioneI
f 25 0 4096 6 1 3968 1 127 0.0001 1 0.0001


f 1000 0 11 -2 3 2 4 5 3 2 4 1 3 2 4
f 1001 0 11 -2 0 1 2 3 1 1 2 0 2 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	0.0010	45.374	1000	28.359		5.0			1		2			1001	1		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	0.0010	43.062	1000	26.914		5.0			1		1			1001	8		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	35.941	1000	22.463		5.0			2		4			1001	10		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	46.254	1000	28.909		5.0			1		2			1001	11		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	29.935	1000	23.948		5.0			1		3			1001	13		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	35.219	1000	22.012		5.0			0		6			1001	16		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	33.369	1000	20.856		5.0			2		2			1001	17		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	31.768	1000	25.414		5.0			1		4			1001	20		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	26.732	1000	21.385		5.0			2		1			1001	21		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	34.884	1000	27.907		5.0			0		2			1001	22		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	42.732	1000	26.708		5.0			2		1			1001	24		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	30.531	1000	24.425		5.0			1		1			1001	26		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	26.132	1000	20.906		5.0			1		2			1001	27		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	28.322	1000	22.657		5.0			2		6			1001	28		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	38.103	1000	23.815		5.0			1		4			1001	29		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	24.102	1000	19.282		5.0			1		3			1001	31		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	30.1875	32.097	1000	25.678		5.0			1		5			1001	32		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	30.1875	34.806	1000	21.754		5.0			1		4			1001	36		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	21.994	1000	17.595		5.0			2		10			1001	38		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	39.090	1000	24.432		5.0			2		4			1001	39		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	32.174	1000	25.739		5.0			2		9			1001	40		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	28.045	1000	22.436		5.0			1		2			1001	42		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	20.083	1000	16.066		5.0			3		6			1001	44		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	34.439	1000	21.524		5.0			4		5			1001	47		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	27.708	1000	22.166		5.0			2		7			1001	50		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	27.040	1000	21.632		5.0			2		11			1001	51		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	28.328	1000	17.705		5.0			4		4			1001	53		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	30.274	1000	24.219		5.0			2		11			1001	55		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	29.521	1000	18.451		5.0			3		12			1001	56		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	39.365	1000	24.603		5.0			2		2			1001	58		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	26.631	1000	21.305		5.0			3		7			1001	59		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	27.113	1000	16.945		5.0			5		5			1001	60		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	38.196	1000	23.873		5.0			3		3			1001	62		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	35.225	1000	22.016		5.0			4		6			1001	63		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	37.138	1000	23.211		5.0			4		9			1001	65		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	23.644	1000	18.915		5.0			4		10			1001	66		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	23.131	1000	14.457		5.0			2		10			1001	68		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	17.611	1000	14.089		5.0			5		14			1001	69		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	29.385	1000	23.508		5.0			5		3			1001	70		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	26.617	1000	16.635		5.0			2		5			1001	72		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	33.700	1000	21.062		5.0			5		10			1001	73		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	36.676	1000	22.922		5.0			5		16			1001	74		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	35.111	1000	21.944		5.0			5		11			1001	76		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	22.985	1000	18.388		5.0			6		14			1001	77		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	24.979	1000	15.612		5.0			3		8			1001	78		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	19.515	1000	15.612		5.0			5		11			1001	79		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	19.191	1000	15.352		5.0			5		4			1001	81		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	26.419	1000	16.512		5.0			5		15			1001	82		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	31.141	1000	19.463		5.0			4		14			1001	84		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	19.415	1000	15.532		5.0			6		2			1001	85		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	32.385	1000	20.241		5.0			5		17			1001	86		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	25.030	1000	20.024		5.0			3		12			1001	88		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	23.433	1000	14.646		5.0			3		6			1001	89		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	25.456	1000	15.910		5.0			5		3			1001	90		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	33.175	1000	20.734		5.0			3		6			1001	91		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	25.382	1000	20.306		5.0			5		12			1001	92		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	19.283	1000	15.426		5.0			6		9			1001	93		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	25.796	1000	20.637		5.0			5		10			1001	94		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	35.512	1000	22.195		5.0			6		11			1001	96		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	16.825	1000	13.460		5.0			5		16			1001	98		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	18.929	1000	15.143		5.0			5		15			1001	99		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	32.746	1000	20.466		5.0			6		5			1001	100		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	19.225	1000	15.380		5.0			5		2			1001	101		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	26.395	1000	21.116		5.0			7		18			1001	103		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	19.712	1000	15.770		5.0			6		16			1001	104		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	18.217	1000	11.385		5.0			4		3			1001	105		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	32.881	1000	20.551		5.0			5		6			1001	106		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	24.957	1000	15.598		5.0			3		14			1001	107		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	31.955	1000	19.972		5.0			6		7			1001	108		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	28.030	1000	17.519		5.0			6		3			1001	109		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	31.418	1000	19.636		5.0			6		18			1001	111		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	18.402	1000	11.501		5.0			7		11			1001	112		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	4.358	1000	2.724		0.11700741205345765			5		1			1001	114		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	1.721	1000	1.377		0.11700741205345765			7		9			1001	115		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	4.467	1000	2.792		0.11700741205345765			6		7			1001	116		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	1.480	1000	1.184		0.11700741205345765			5		7			1001	117		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	3.627	1000	2.901		0.11700741205345765			8		10			1001	118		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	1.872	1000	1.170		0.11700741205345765			7		5			1001	119		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	3.637	1000	2.910		0.11700741205345765			6		1			1001	122		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	3.318	1000	2.074		0.11700741205345765			8		1			1001	123		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	1.056	1000	0.845		0.11700741205345765			7		3			1001	124		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.0180	3.372	1000	2.107		0.11700741205345765			7		9			1001	125		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	4.015	1000	2.509		0.1336896359661781			5		4			1001	126		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	3.946	1000	3.157		0.1336896359661781			6		1			1001	127		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	0.937	1000	0.750		0.1336896359661781			8		5			1001	129		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	5.706	1000	3.566		0.1336896359661781			5		1			1001	130		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	3.090	1000	1.931		0.1336896359661781			8		1			1001	132		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	1.676	1000	1.047		0.1336896359661781			7		2			1001	133		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	5.244	1000	3.277		0.1336896359661781			6		9			1001	134		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	2.528	1000	1.580		0.1336896359661781			6		4			1001	137		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	3.968	1000	3.175		0.1336896359661781			8		3			1001	140		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	1.553	1000	0.970		0.1336896359661781			6		7			1001	141		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	1.946	1000	1.557		0.1336896359661781			7		1			1001	143		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	2.893	1000	1.808		0.1336896359661781			6		1			1001	144		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	3.723	1000	2.978		0.1336896359661781			7		5			1001	145		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.1631	2.922	1000	1.826		0.1336896359661781			6		6			1001	146		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.242	1000	0.993		0.18826837445747224			7		1			1001	147		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.371	1000	1.482		0.18826837445747224			5		1			1001	148		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.985	1000	2.388		0.18826837445747224			5		1			1001	150		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.529	1000	2.830		0.18826837445747224			6		2			1001	151		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.010	1000	0.808		0.18826837445747224			6		10			1001	152		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.401	1000	0.875		0.18826837445747224			6		1			1001	154		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.685	1000	2.303		0.18826837445747224			6		8			1001	155		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.050	1000	1.906		0.18826837445747224			7		4			1001	157		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.556	1000	1.245		0.18826837445747224			5		1			1001	159		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.424	1000	2.140		0.18826837445747224			6		8			1001	160		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.610	1000	1.288		0.18826837445747224			6		10			1001	161		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.305	1000	2.691		0.18826837445747224			6		7			1001	162		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.684	1000	2.947		0.18826837445747224			7		1			1001	163		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.088	1000	1.670		0.18826837445747224			7		1			1001	164		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.877	1000	2.423		0.18826837445747224			7		9			1001	165		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.032	1000	1.626		0.18826837445747224			6		1			1001	167		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	5.680	1000	3.550		0.18826837445747224			6		1			1001	168		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.209	1000	2.631		0.18826837445747224			6		4			1001	169		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.102	1000	3.282		0.18826837445747224			7		1			1001	170		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.597	1000	2.078		0.18826837445747224			6		3			1001	171		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.299	1000	3.439		0.18826837445747224			8		11			1001	173		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.790	1000	2.994		0.18826837445747224			6		9			1001	175		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.926	1000	2.341		0.18826837445747224			7		6			1001	180		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.443	1000	2.755		0.18826837445747224			8		1			1001	182		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.017	1000	3.214		0.18826837445747224			7		4			1001	183		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.445	1000	2.778		0.18826837445747224			6		4			1001	184		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.765	1000	3.012		0.18826837445747224			6		11			1001	185		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.590	1000	1.619		0.18826837445747224			6		1			1001	186		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.787	1000	1.117		0.18826837445747224			7		1			1001	187		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	3.019	1000	1.887		0.18826837445747224			6		1			1001	188		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.004	1000	0.803		0.18826837445747224			6		9			1001	191		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	0.963	1000	0.770		0.18826837445747224			6		1			1001	194		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.416	1000	1.133		0.18826837445747224			6		1			1001	199		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.599	1000	2.079		0.18826837445747224			7		3			1001	202		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	1.832	1000	1.466		0.18826837445747224			7		1			1001	203		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	4.508	1000	3.607		0.18826837445747224			7		1			1001	204		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	85.6379	2.708	1000	1.692		0.18826837445747224			6		4			1001	205		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.627	1000	2.102		0.3315344611338735			6		1			1001	209		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.027	1000	1.267		0.3315344611338735			8		6			1001	211		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	4.181	1000	2.613		0.3315344611338735			7		14			1001	213		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	3.972	1000	3.178		0.3315344611338735			6		6			1001	214		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.301	1000	1.841		0.3315344611338735			5		2			1001	216		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.790	1000	2.232		0.3315344611338735			7		9			1001	217		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	1.639	1000	1.024		0.3315344611338735			8		3			1001	219		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.106	1000	1.685		0.3315344611338735			7		5			1001	223		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	1.638	1000	1.311		0.3315344611338735			6		10			1001	224		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	4.697	1000	2.936		0.3315344611338735			8		11			1001	225		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.315	1000	1.852		0.3315344611338735			6		1			1001	226		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	1.037	1000	0.829		0.3315344611338735			8		7			1001	227		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	4.120	1000	3.296		0.3315344611338735			5		11			1001	228		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	2.704	1000	2.163		0.3315344611338735			6		11			1001	230		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	3.119	1000	1.949		0.3315344611338735			6		13			1001	231		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.8843	4.136	1000	2.585		0.3315344611338735			7		14			1001	232		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	1.818	1000	1.455		0.3346691397532322			6		12			1001	235		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	5.241	1000	3.275		0.3346691397532322			7		10			1001	236		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	4.026	1000	3.221		0.3346691397532322			8		1			1001	238		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.272	1000	2.045		0.3346691397532322			6		1			1001	239		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.328	1000	1.863		0.3346691397532322			6		9			1001	240		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.757	1000	1.723		0.3346691397532322			6		1			1001	241		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.673	1000	2.138		0.3346691397532322			7		1			1001	243		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.372	1000	1.483		0.3346691397532322			6		1			1001	244		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.501	1000	2.801		0.3346691397532322			7		1			1001	245		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	1.376	1000	1.100		0.3346691397532322			5		13			1001	246		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.336	1000	2.085		0.3346691397532322			7		1			1001	247		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.662	1000	2.130		0.3346691397532322			8		1			1001	249		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.270	1000	1.419		0.3346691397532322			8		1			1001	251		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.311	1000	2.070		0.3346691397532322			6		10			1001	253		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.796	1000	1.748		0.3346691397532322			7		1			1001	254		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	4.701	1000	2.938		0.3346691397532322			7		3			1001	256		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	1.675	1000	1.340		0.3346691397532322			7		12			1001	259		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.837	1000	3.069		0.3346691397532322			7		2			1001	261		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	3.245	1000	2.596		0.3346691397532322			7		13			1001	262		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.860	1000	2.288		0.3346691397532322			6		1			1001	263		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.958	1000	2.366		0.3346691397532322			7		4			1001	264		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	4.551	1000	2.844		0.3346691397532322			6		1			1001	266		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	0.950	1000	0.760		0.3346691397532322			7		1			1001	268		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	2.327	1000	1.454		0.3346691397532322			5		8			1001	269		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.9116	1.939	1000	1.551		0.3346691397532322			6		4			1001	270		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	3.807	1000	2.380		0.44143043721123787			7		8			1001	271		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	4.584	1000	2.865		0.44143043721123787			6		14			1001	272		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	3.911	1000	3.129		0.44143043721123787			7		1			1001	275		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	2.662	1000	1.664		0.44143043721123787			6		2			1001	276		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	2.181	1000	1.745		0.44143043721123787			7		1			1001	278		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	4.908	1000	3.068		0.44143043721123787			7		1			1001	281		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	2.392	1000	1.913		0.44143043721123787			7		1			1001	282		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	4.158	1000	2.599		0.44143043721123787			6		1			1001	283		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	2.608	1000	2.087		0.44143043721123787			6		1			1001	284		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	3.309	1000	2.647		0.44143043721123787			6		14			1001	286		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	1.673	1000	1.046		0.44143043721123787			8		2			1001	288		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	1.751	1000	1.095		0.44143043721123787			8		4			1001	289		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	1.003	1000	0.803		0.44143043721123787			6		1			1001	290		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	3.639	1000	2.911		0.44143043721123787			6		16			1001	292		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	1.150	1000	0.920		0.44143043721123787			6		1			1001	293		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8404	5.468	1000	3.417		0.44143043721123787			6		16			1001	294		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.240	1000	3.392		0.4708568752723663			6		14			1001	295		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.626	1000	2.901		0.4708568752723663			5		11			1001	296		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.864	1000	1.790		0.4708568752723663			8		1			1001	297		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.331	1000	2.707		0.4708568752723663			5		4			1001	303		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.922	1000	1.202		0.4708568752723663			7		1			1001	304		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.615	1000	2.259		0.4708568752723663			6		1			1001	307		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.158	1000	1.974		0.4708568752723663			8		2			1001	312		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.990	1000	2.392		0.4708568752723663			6		1			1001	313		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.028	1000	1.623		0.4708568752723663			8		1			1001	315		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.065	1000	3.252		0.4708568752723663			8		11			1001	316		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.935	1000	3.084		0.4708568752723663			6		1			1001	317		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.917	1000	3.073		0.4708568752723663			7		11			1001	318		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.301	1000	1.041		0.4708568752723663			6		1			1001	320		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.803	1000	2.243		0.4708568752723663			7		17			1001	321		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.093	1000	2.475		0.4708568752723663			7		1			1001	322		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.017	1000	0.814		0.4708568752723663			6		1			1001	323		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.342	1000	2.714		0.4708568752723663			7		7			1001	325		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.993	1000	3.121		0.4708568752723663			5		1			1001	327		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.095	1000	1.934		0.4708568752723663			6		1			1001	328		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.257	1000	2.605		0.4708568752723663			7		1			1001	330		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.266	1000	0.791		0.4708568752723663			7		16			1001	331		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.753	1000	2.202		0.4708568752723663			6		3			1001	333		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.323	1000	1.059		0.4708568752723663			5		8			1001	334		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	2.845	1000	1.778		0.4708568752723663			7		1			1001	335		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.807	1000	2.380		0.4708568752723663			8		5			1001	336		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.907	1000	2.442		0.4708568752723663			7		11			1001	337		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	4.741	1000	2.963		0.4708568752723663			7		2			1001	338		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.950	1000	2.469		0.4708568752723663			8		11			1001	339		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.223	1000	2.578		0.4708568752723663			6		5			1001	340		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	3.359	1000	2.099		0.4708568752723663			6		17			1001	341		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	5.377	1000	3.361		0.4708568752723663			6		1			1001	342		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.527	1000	0.955		0.4708568752723663			5		1			1001	343		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0965	1.513	1000	1.210		0.4708568752723663			6		15			1001	344		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.360	1000	2.725		0.4752293066080189			7		1			1001	345		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.555	1000	1.597		0.4752293066080189			6		15			1001	346		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.684	1000	1.347		0.4752293066080189			5		2			1001	347		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.451	1000	2.782		0.4752293066080189			5		3			1001	348		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.251	1000	2.657		0.4752293066080189			5		5			1001	349		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.315	1000	1.447		0.4752293066080189			7		1			1001	350		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.351	1000	2.681		0.4752293066080189			7		1			1001	351		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.328	1000	2.705		0.4752293066080189			8		1			1001	352		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.825	1000	1.460		0.4752293066080189			6		11			1001	354		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.115	1000	2.492		0.4752293066080189			6		1			1001	357		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.704	1000	2.163		0.4752293066080189			7		1			1001	360		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.985	1000	2.388		0.4752293066080189			8		7			1001	361		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.516	1000	1.213		0.4752293066080189			6		1			1001	362		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.666	1000	1.333		0.4752293066080189			6		1			1001	363		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.073	1000	1.659		0.4752293066080189			6		1			1001	364		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.818	1000	1.136		0.4752293066080189			7		1			1001	365		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.158	1000	2.599		0.4752293066080189			7		16			1001	366		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.078	1000	2.463		0.4752293066080189			7		1			1001	367		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.091	1000	0.873		0.4752293066080189			7		1			1001	368		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.539	1000	2.212		0.4752293066080189			7		1			1001	369		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.154	1000	2.523		0.4752293066080189			5		14			1001	371		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	5.174	1000	3.234		0.4752293066080189			7		1			1001	373		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.080	1000	0.864		0.4752293066080189			8		1			1001	374		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.164	1000	3.331		0.4752293066080189			6		9			1001	375		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	3.216	1000	2.010		0.4752293066080189			6		2			1001	378		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.956	1000	2.365		0.4752293066080189			5		1			1001	379		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.892	1000	2.313		0.4752293066080189			5		14			1001	382		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.280	1000	1.024		0.4752293066080189			6		1			1001	383		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.598	1000	1.279		0.4752293066080189			8		3			1001	384		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.950	1000	1.560		0.4752293066080189			6		6			1001	388		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.074	1000	2.546		0.4752293066080189			5		2			1001	390		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.393	1000	2.746		0.4752293066080189			8		9			1001	392		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.052	1000	1.641		0.4752293066080189			7		1			1001	394		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.897	1000	1.518		0.4752293066080189			7		11			1001	395		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.415	1000	1.510		0.4752293066080189			7		11			1001	396		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	1.148	1000	0.918		0.4752293066080189			6		1			1001	398		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.453	1000	1.963		0.4752293066080189			8		1			1001	399		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.160	1000	1.728		0.4752293066080189			7		1			1001	400		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	2.044	1000	1.278		0.4752293066080189			7		13			1001	401		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.1345	4.920	1000	3.075		0.4752293066080189			6		1			1001	403		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.001	1000	1.250		0.5181814402248217			7		16			1001	404		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.241	1000	1.793		0.5181814402248217			7		6			1001	406		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.847	1000	1.779		0.5181814402248217			7		1			1001	407		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.922	1000	2.451		0.5181814402248217			7		1			1001	408		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.887	1000	1.805		0.5181814402248217			6		1			1001	409		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.141	1000	1.338		0.5181814402248217			7		10			1001	411		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	1.464	1000	0.915		0.5181814402248217			6		2			1001	412		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.650	1000	2.281		0.5181814402248217			5		1			1001	413		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.053	1000	1.283		0.5181814402248217			6		3			1001	414		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.213	1000	1.770		0.5181814402248217			5		11			1001	415		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.829	1000	2.263		0.5181814402248217			7		15			1001	417		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	1.090	1000	0.872		0.5181814402248217			8		10			1001	418		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	4.443	1000	2.777		0.5181814402248217			6		18			1001	419		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.044	1000	1.635		0.5181814402248217			5		1			1001	420		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.368	1000	2.105		0.5181814402248217			6		9			1001	422		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.064	1000	1.651		0.5181814402248217			7		10			1001	423		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.756	1000	3.005		0.5181814402248217			8		15			1001	424		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.524	1000	2.203		0.5181814402248217			8		16			1001	425		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	2.613	1000	1.633		0.5181814402248217			8		1			1001	426		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	1.249	1000	0.781		0.5181814402248217			6		1			1001	427		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.053	1000	2.442		0.5181814402248217			8		1			1001	428		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.416	1000	2.733		0.5181814402248217			7		9			1001	429		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.427	1000	2.742		0.5181814402248217			7		1			1001	430		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	1.545	1000	1.236		0.5181814402248217			7		1			1001	431		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.727	1000	2.329		0.5181814402248217			5		1			1001	432		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.5082	3.082	1000	1.926		0.5181814402248217			7		1			1001	438		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	5.233	1000	3.271		0.6247051022578198			6		1			1001	439		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.713	1000	1.696		0.6247051022578198			7		1			1001	440		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.800	1000	3.040		0.6247051022578198			7		15			1001	444		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.222	1000	0.977		0.6247051022578198			8		3			1001	446		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.718	1000	1.374		0.6247051022578198			6		1			1001	447		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.961	1000	1.569		0.6247051022578198			7		10			1001	448		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.636	1000	1.648		0.6247051022578198			6		1			1001	449		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	4.050	1000	3.240		0.6247051022578198			6		1			1001	450		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.231	1000	2.585		0.6247051022578198			6		17			1001	451		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.218	1000	2.011		0.6247051022578198			8		1			1001	452		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.958	1000	3.166		0.6247051022578198			6		17			1001	453		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.784	1000	2.227		0.6247051022578198			7		10			1001	455		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	4.902	1000	3.064		0.6247051022578198			7		1			1001	456		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.372	1000	1.483		0.6247051022578198			7		17			1001	457		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.313	1000	1.850		0.6247051022578198			7		7			1001	459		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.614	1000	2.259		0.6247051022578198			8		9			1001	460		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.485	1000	1.188		0.6247051022578198			8		1			1001	462		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.262	1000	1.414		0.6247051022578198			5		7			1001	464		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.890	1000	1.512		0.6247051022578198			6		4			1001	465		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	4.047	1000	2.529		0.6247051022578198			6		18			1001	467		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.207	1000	2.004		0.6247051022578198			6		10			1001	469		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.434	1000	2.747		0.6247051022578198			7		1			1001	471		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.264	1000	1.812		0.6247051022578198			7		1			1001	473		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	4.614	1000	2.884		0.6247051022578198			6		2			1001	474		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	3.519	1000	2.815		0.6247051022578198			7		1			1001	475		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.454	1000	0.908		0.6247051022578198			5		1			1001	476		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.942	1000	1.214		0.6247051022578198			5		1			1001	477		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	2.464	1000	1.971		0.6247051022578198			7		2			1001	479		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.4349	1.253	1000	1.002		0.6247051022578198			7		1			1001	480		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.106	1000	1.942		0.6538270189285451			7		6			1001	482		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	1.691	1000	1.353		0.6538270189285451			6		1			1001	483		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.130	1000	1.957		0.6538270189285451			6		14			1001	484		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	2.135	1000	1.708		0.6538270189285451			8		11			1001	487		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	4.950	1000	3.094		0.6538270189285451			7		8			1001	488		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.431	1000	2.745		0.6538270189285451			5		4			1001	489		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.796	1000	3.037		0.6538270189285451			6		1			1001	490		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.986	1000	2.491		0.6538270189285451			6		5			1001	492		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.958	1000	2.474		0.6538270189285451			6		20			1001	493		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	1.114	1000	0.891		0.6538270189285451			5		1			1001	495		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.819	1000	2.387		0.6538270189285451			7		13			1001	497		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.407	1000	2.129		0.6538270189285451			6		5			1001	499		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.984	1000	2.490		0.6538270189285451			7		10			1001	500		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	2.632	1000	2.105		0.6538270189285451			6		10			1001	501		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	2.080	1000	1.300		0.6538270189285451			7		1			1001	502		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	1.361	1000	0.851		0.6538270189285451			8		20			1001	503		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.6883	3.100	1000	2.480		0.6538270189285451			7		19			1001	505		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.758	1000	2.349		0.6628317540236657			8		16			1001	506		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.076	1000	1.298		0.6628317540236657			6		16			1001	507		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.909	1000	3.127		0.6628317540236657			6		1			1001	509		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.539	1000	2.031		0.6628317540236657			7		1			1001	510		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.159	1000	1.974		0.6628317540236657			5		16			1001	511		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	1.100	1000	0.880		0.6628317540236657			5		1			1001	514		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.543	1000	2.035		0.6628317540236657			6		7			1001	516		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.939	1000	2.351		0.6628317540236657			8		1			1001	518		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.865	1000	2.292		0.6628317540236657			7		1			1001	519		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	4.172	1000	2.607		0.6628317540236657			8		1			1001	520		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	4.685	1000	2.928		0.6628317540236657			6		1			1001	521		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.121	1000	1.325		0.6628317540236657			7		21			1001	522		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.264	1000	2.611		0.6628317540236657			6		9			1001	523		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.495	1000	2.185		0.6628317540236657			7		4			1001	525		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.386	1000	1.908		0.6628317540236657			6		15			1001	527		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.482	1000	2.786		0.6628317540236657			8		1			1001	528		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.692	1000	1.683		0.6628317540236657			7		17			1001	529		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	1.386	1000	1.109		0.6628317540236657			7		20			1001	530		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	4.635	1000	2.897		0.6628317540236657			7		3			1001	532		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	2.835	1000	1.772		0.6628317540236657			6		11			1001	533		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.7666	3.904	1000	2.440		0.6628317540236657			5		20			1001	535		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.592	1000	1.620		0.6878195952464701			7		1			1001	538		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.114	1000	0.891		0.6878195952464701			5		1			1001	540		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.066	1000	1.916		0.6878195952464701			6		1			1001	541		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.335	1000	2.668		0.6878195952464701			8		1			1001	543		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.201	1000	2.001		0.6878195952464701			5		11			1001	544		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.664	1000	1.040		0.6878195952464701			7		1			1001	545		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.868	1000	2.418		0.6878195952464701			8		1			1001	546		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.477	1000	1.548		0.6878195952464701			8		14			1001	547		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.104	1000	1.940		0.6878195952464701			6		17			1001	548		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.544	1000	2.215		0.6878195952464701			7		1			1001	549		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.082	1000	2.466		0.6878195952464701			7		9			1001	550		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.144	1000	1.965		0.6878195952464701			6		10			1001	552		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	5.083	1000	3.177		0.6878195952464701			7		11			1001	554		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.936	1000	1.210		0.6878195952464701			5		14			1001	556		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	4.441	1000	2.776		0.6878195952464701			6		1			1001	557		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.578	1000	0.986		0.6878195952464701			7		1			1001	559		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.509	1000	1.568		0.6878195952464701			8		20			1001	560		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.834	1000	3.067		0.6878195952464701			7		10			1001	561		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.972	1000	1.858		0.6878195952464701			6		1			1001	563		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	4.194	1000	2.621		0.6878195952464701			7		8			1001	564		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.679	1000	2.143		0.6878195952464701			6		9			1001	565		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.054	1000	2.444		0.6878195952464701			5		1			1001	567		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	4.005	1000	3.204		0.6878195952464701			6		22			1001	568		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.332	1000	0.833		0.6878195952464701			8		7			1001	569		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.375	1000	0.859		0.6878195952464701			6		1			1001	570		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	4.382	1000	2.739		0.6878195952464701			8		14			1001	573		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.924	1000	1.539		0.6878195952464701			8		1			1001	574		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	4.562	1000	2.852		0.6878195952464701			5		4			1001	576		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.149	1000	2.519		0.6878195952464701			5		1			1001	577		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.699	1000	1.687		0.6878195952464701			8		1			1001	578		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	3.511	1000	2.809		0.6878195952464701			6		6			1001	579		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	2.855	1000	2.284		0.6878195952464701			7		1			1001	580		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	89.9840	1.072	1000	0.858		0.6878195952464701			6		21			1001	581		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.333	1000	0.833		0.7035938562687802			5		8			1001	583		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.983	1000	1.240		0.7035938562687802			6		1			1001	586		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.428	1000	1.517		0.7035938562687802			6		1			1001	589		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.280	1000	2.050		0.7035938562687802			5		1			1001	590		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.619	1000	2.887		0.7035938562687802			6		1			1001	592		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.340	1000	2.672		0.7035938562687802			6		1			1001	595		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.749	1000	1.718		0.7035938562687802			8		20			1001	596		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.041	1000	2.433		0.7035938562687802			8		11			1001	598		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.925	1000	2.340		0.7035938562687802			6		20			1001	600		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.546	1000	2.036		0.7035938562687802			7		1			1001	604		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.896	1000	2.317		0.7035938562687802			8		16			1001	607		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.626	1000	2.891		0.7035938562687802			8		1			1001	611		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.138	1000	2.586		0.7035938562687802			7		9			1001	613		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.671	1000	1.044		0.7035938562687802			6		1			1001	614		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.146	1000	0.917		0.7035938562687802			8		2			1001	615		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.588	1000	1.271		0.7035938562687802			6		1			1001	617		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.584	1000	2.067		0.7035938562687802			7		1			1001	618		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.643	1000	2.277		0.7035938562687802			7		19			1001	619		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.177	1000	1.986		0.7035938562687802			5		1			1001	621		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.974	1000	2.484		0.7035938562687802			6		9			1001	623		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.444	1000	1.527		0.7035938562687802			7		14			1001	624		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.733	1000	1.708		0.7035938562687802			6		1			1001	625		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.179	1000	0.737		0.7035938562687802			6		1			1001	627		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.761	1000	3.009		0.7035938562687802			6		1			1001	629		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.395	1000	2.747		0.7035938562687802			5		6			1001	630		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.939	1000	3.087		0.7035938562687802			6		1			1001	631		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.776	1000	2.985		0.7035938562687802			5		5			1001	633		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.658	1000	2.911		0.7035938562687802			6		5			1001	635		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.975	1000	1.234		0.7035938562687802			6		1			1001	636		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.099	1000	1.312		0.7035938562687802			7		1			1001	638		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	2.877	1000	2.302		0.7035938562687802			6		8			1001	639		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	1.523	1000	1.218		0.7035938562687802			7		1			1001	640		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.472	1000	2.777		0.7035938562687802			6		19			1001	641		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	4.948	1000	3.092		0.7035938562687802			6		1			1001	642		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.1213	3.928	1000	2.455		0.7035938562687802			6		1			1001	643		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.958	1000	2.366		0.7336212034557938			8		11			1001	645		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.418	1000	1.934		0.7336212034557938			6		1			1001	648		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.892	1000	1.808		0.7336212034557938			7		19			1001	649		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.422	1000	0.889		0.7336212034557938			7		1			1001	650		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.867	1000	2.293		0.7336212034557938			6		1			1001	651		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.282	1000	2.676		0.7336212034557938			6		1			1001	652		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.743	1000	1.715		0.7336212034557938			6		1			1001	653		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.778	1000	1.422		0.7336212034557938			8		1			1001	655		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.626	1000	2.266		0.7336212034557938			8		12			1001	656		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.621	1000	2.263		0.7336212034557938			8		1			1001	657		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	0.963	1000	0.770		0.7336212034557938			6		1			1001	659		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.459	1000	2.162		0.7336212034557938			6		11			1001	661		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.172	1000	1.358		0.7336212034557938			6		1			1001	662		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.786	1000	2.228		0.7336212034557938			5		1			1001	664		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.333	1000	2.708		0.7336212034557938			8		2			1001	665		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.126	1000	0.901		0.7336212034557938			7		1			1001	666		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.282	1000	2.051		0.7336212034557938			6		8			1001	667		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.798	1000	1.749		0.7336212034557938			7		17			1001	668		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.848	1000	3.079		0.7336212034557938			8		13			1001	669		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	0.936	1000	0.749		0.7336212034557938			5		1			1001	670		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.446	1000	2.757		0.7336212034557938			7		23			1001	672		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.232	1000	2.585		0.7336212034557938			5		1			1001	673		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.965	1000	1.572		0.7336212034557938			6		20			1001	674		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.676	1000	2.922		0.7336212034557938			7		1			1001	676		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.348	1000	2.717		0.7336212034557938			7		19			1001	678		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.120	1000	2.575		0.7336212034557938			7		1			1001	680		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	3.290	1000	2.632		0.7336212034557938			5		18			1001	682		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	4.895	1000	3.060		0.7336212034557938			7		1			1001	685		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	2.747	1000	1.717		0.7336212034557938			6		8			1001	686		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.306	1000	1.045		0.7336212034557938			5		22			1001	688		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.3825	1.108	1000	0.887		0.7336212034557938			8		1			1001	689		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.994	1000	1.246		0.7394181585667123			7		1			1001	690		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.824	1000	1.140		0.7394181585667123			6		1			1001	691		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.929	1000	1.206		0.7394181585667123			7		4			1001	693		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.362	1000	0.852		0.7394181585667123			6		1			1001	694		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	5.055	1000	3.160		0.7394181585667123			6		20			1001	695		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	2.195	1000	1.372		0.7394181585667123			6		14			1001	696		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.836	1000	1.469		0.7394181585667123			6		18			1001	698		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	2.180	1000	1.744		0.7394181585667123			8		1			1001	700		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	3.228	1000	2.583		0.7394181585667123			6		1			1001	701		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	5.071	1000	3.170		0.7394181585667123			5		15			1001	702		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.560	1000	1.248		0.7394181585667123			5		21			1001	704		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	4.106	1000	2.566		0.7394181585667123			6		1			1001	705		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	2.030	1000	1.269		0.7394181585667123			7		2			1001	708		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	2.236	1000	1.789		0.7394181585667123			6		9			1001	710		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.088	1000	0.870		0.7394181585667123			6		1			1001	711		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	3.487	1000	2.789		0.7394181585667123			8		1			1001	712		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.417	1000	1.134		0.7394181585667123			7		1			1001	713		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	2.053	1000	1.283		0.7394181585667123			6		19			1001	714		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4329	1.566	1000	1.253		0.7394181585667123			6		19			1001	715		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	2.028	1000	1.623		0.7627768986562544			6		16			1001	716		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	1.627	1000	1.302		0.7627768986562544			5		1			1001	717		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	1.938	1000	1.551		0.7627768986562544			6		1			1001	718		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	2.637	1000	2.109		0.7627768986562544			7		23			1001	719		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	1.012	1000	0.810		0.7627768986562544			6		1			1001	724		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	1.506	1000	1.205		0.7627768986562544			6		12			1001	725		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	4.051	1000	2.532		0.7627768986562544			6		15			1001	726		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	2.977	1000	2.382		0.7627768986562544			7		13			1001	727		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	0.958	1000	0.766		0.7627768986562544			7		1			1001	728		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	5.032	1000	3.145		0.7627768986562544			7		1			1001	729		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	0.971	1000	0.777		0.7627768986562544			8		21			1001	731		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	3.043	1000	2.434		0.7627768986562544			6		1			1001	732		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	3.482	1000	2.177		0.7627768986562544			8		1			1001	735		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.6362	2.412	1000	1.507		0.7627768986562544			7		7			1001	737		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.989	1000	1.591		0.7724964020343956			7		1			1001	738		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.295	1000	2.636		0.7724964020343956			8		23			1001	739		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.657	1000	2.285		0.7724964020343956			6		1			1001	740		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.396	1000	1.117		0.7724964020343956			7		1			1001	741		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.716	1000	1.373		0.7724964020343956			6		1			1001	742		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.891	1000	2.432		0.7724964020343956			8		1			1001	743		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.224	1000	0.765		0.7724964020343956			7		10			1001	744		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.451	1000	1.961		0.7724964020343956			7		9			1001	745		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.528	1000	0.955		0.7724964020343956			7		1			1001	746		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	4.842	1000	3.026		0.7724964020343956			8		9			1001	747		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.181	1000	0.945		0.7724964020343956			6		16			1001	748		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	4.047	1000	2.529		0.7724964020343956			6		1			1001	749		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.505	1000	2.804		0.7724964020343956			6		22			1001	750		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	4.688	1000	2.930		0.7724964020343956			8		1			1001	751		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.695	1000	2.956		0.7724964020343956			7		20			1001	752		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.520	1000	2.016		0.7724964020343956			8		1			1001	753		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.546	1000	2.837		0.7724964020343956			5		14			1001	755		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	4.287	1000	2.679		0.7724964020343956			7		15			1001	756		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.817	1000	3.054		0.7724964020343956			6		1			1001	758		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.432	1000	0.895		0.7724964020343956			5		21			1001	760		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	3.275	1000	2.620		0.7724964020343956			7		1			1001	762		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.950	1000	2.360		0.7724964020343956			6		20			1001	764		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.407	1000	1.926		0.7724964020343956			6		1			1001	766		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.890	1000	2.312		0.7724964020343956			6		19			1001	768		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.099	1000	0.879		0.7724964020343956			7		1			1001	769		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.981	1000	1.585		0.7724964020343956			7		1			1001	770		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.976	1000	1.235		0.7724964020343956			7		8			1001	771		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.363	1000	1.477		0.7724964020343956			7		1			1001	773		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.425	1000	1.140		0.7724964020343956			5		8			1001	775		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.451	1000	1.532		0.7724964020343956			8		24			1001	776		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	2.498	1000	1.561		0.7724964020343956			7		1			1001	777		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7207	1.233	1000	0.987		0.7724964020343956			5		13			1001	778		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.630	1000	1.304		0.7791967281298524			5		23			1001	779		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	2.374	1000	1.483		0.7791967281298524			6		1			1001	780		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.798	1000	3.039		0.7791967281298524			8		1			1001	782		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.004	1000	0.803		0.7791967281298524			8		1			1001	783		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.369	1000	2.696		0.7791967281298524			6		3			1001	784		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.618	1000	2.894		0.7791967281298524			7		7			1001	787		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.986	1000	1.589		0.7791967281298524			6		1			1001	788		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.467	1000	0.917		0.7791967281298524			5		14			1001	789		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	2.965	1000	2.372		0.7791967281298524			6		3			1001	790		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.923	1000	3.139		0.7791967281298524			5		1			1001	791		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	4.448	1000	2.780		0.7791967281298524			5		22			1001	792		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	4.209	1000	2.631		0.7791967281298524			6		1			1001	793		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.777	1000	1.422		0.7791967281298524			6		15			1001	795		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.569	1000	0.981		0.7791967281298524			5		4			1001	796		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	2.863	1000	1.789		0.7791967281298524			6		1			1001	799		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.620	1000	1.012		0.7791967281298524			5		1			1001	800		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.354	1000	0.846		0.7791967281298524			6		20			1001	803		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.003	1000	2.402		0.7791967281298524			7		12			1001	804		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	5.023	1000	3.139		0.7791967281298524			7		1			1001	805		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	3.386	1000	2.116		0.7791967281298524			7		1			1001	806		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	2.744	1000	2.195		0.7791967281298524			6		1			1001	807		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	1.802	1000	1.441		0.7791967281298524			7		1			1001	808		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.7790	2.598	1000	1.624		0.7791967281298524			6		23			1001	810		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.830	1000	1.464		0.7871141992628687			8		2			1001	811		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.320	1000	0.825		0.7871141992628687			8		7			1001	812		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.587	1000	1.270		0.7871141992628687			6		16			1001	813		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.222	1000	2.578		0.7871141992628687			7		21			1001	814		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	2.780	1000	2.224		0.7871141992628687			6		1			1001	815		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	4.671	1000	2.919		0.7871141992628687			5		7			1001	816		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	2.434	1000	1.947		0.7871141992628687			7		1			1001	818		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.937	1000	2.460		0.7871141992628687			5		13			1001	819		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.945	1000	1.556		0.7871141992628687			6		20			1001	820		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.611	1000	1.289		0.7871141992628687			7		1			1001	823		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	4.702	1000	2.939		0.7871141992628687			8		20			1001	824		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.257	1000	2.606		0.7871141992628687			7		1			1001	825		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	1.366	1000	1.093		0.7871141992628687			7		1			1001	826		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	4.067	1000	2.542		0.7871141992628687			5		12			1001	827		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.829	1000	2.393		0.7871141992628687			5		1			1001	828		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.752	1000	3.001		0.7871141992628687			7		1			1001	829		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.047	1000	1.904		0.7871141992628687			8		1			1001	830		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.075	1000	1.922		0.7871141992628687			7		1			1001	832		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	2.862	1000	2.289		0.7871141992628687			6		1			1001	833		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	2.235	1000	1.397		0.7871141992628687			8		1			1001	834		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.305	1000	2.644		0.7871141992628687			5		24			1001	835		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	3.527	1000	2.821		0.7871141992628687			8		19			1001	836		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8479	2.427	1000	1.941		0.7871141992628687			7		1			1001	838		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.646	1000	2.117		0.7989781234489255			7		3			1001	840		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.187	1000	1.367		0.7989781234489255			6		14			1001	842		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.209	1000	1.380		0.7989781234489255			6		21			1001	843		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.486	1000	2.179		0.7989781234489255			8		3			1001	844		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.235	1000	1.397		0.7989781234489255			7		5			1001	845		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.417	1000	1.511		0.7989781234489255			7		1			1001	847		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.508	1000	2.806		0.7989781234489255			8		1			1001	852		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.342	1000	1.074		0.7989781234489255			7		11			1001	854		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.728	1000	2.983		0.7989781234489255			6		1			1001	855		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.405	1000	0.878		0.7989781234489255			6		2			1001	856		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.580	1000	1.264		0.7989781234489255			6		1			1001	857		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.565	1000	2.228		0.7989781234489255			6		1			1001	858		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.605	1000	1.284		0.7989781234489255			8		13			1001	861		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.086	1000	2.469		0.7989781234489255			8		1			1001	863		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.068	1000	1.654		0.7989781234489255			7		1			1001	864		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.679	1000	2.144		0.7989781234489255			8		3			1001	865		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.112	1000	1.690		0.7989781234489255			7		14			1001	866		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.728	1000	2.183		0.7989781234489255			8		9			1001	867		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.329	1000	1.456		0.7989781234489255			7		6			1001	868		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.148	1000	1.343		0.7989781234489255			5		12			1001	870		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.704	1000	1.690		0.7989781234489255			7		1			1001	871		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.736	1000	1.389		0.7989781234489255			6		1			1001	872		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.265	1000	2.041		0.7989781234489255			6		1			1001	874		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.281	1000	1.426		0.7989781234489255			7		14			1001	875		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	3.351	1000	2.680		0.7989781234489255			8		8			1001	877		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	2.285	1000	1.428		0.7989781234489255			6		23			1001	878		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.9511	1.859	1000	1.488		0.7989781234489255			7		10			1001	879		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.477	1000	1.182		0.8106723346641649			6		1			1001	880		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.057	1000	0.845		0.8106723346641649			8		1			1001	881		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.858	1000	1.487		0.8106723346641649			6		24			1001	883		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	3.164	1000	1.977		0.8106723346641649			8		1			1001	884		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	2.542	1000	1.589		0.8106723346641649			7		3			1001	885		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	2.869	1000	1.793		0.8106723346641649			6		1			1001	886		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.480	1000	1.184		0.8106723346641649			8		1			1001	887		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	3.589	1000	2.243		0.8106723346641649			6		16			1001	888		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.860	1000	1.488		0.8106723346641649			6		1			1001	890		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.728	1000	1.382		0.8106723346641649			5		8			1001	891		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	3.622	1000	2.897		0.8106723346641649			7		7			1001	894		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	3.571	1000	2.232		0.8106723346641649			6		1			1001	896		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.220	1000	0.763		0.8106723346641649			6		7			1001	897		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	2.588	1000	2.071		0.8106723346641649			8		16			1001	898		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	3.619	1000	2.262		0.8106723346641649			5		1			1001	899		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.409	1000	1.127		0.8106723346641649			5		1			1001	901		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.654	1000	1.034		0.8106723346641649			7		8			1001	902		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	2.907	1000	2.326		0.8106723346641649			8		20			1001	904		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.239	1000	0.774		0.8106723346641649			6		18			1001	906		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	2.564	1000	2.052		0.8106723346641649			8		18			1001	908		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.0528	1.229	1000	0.983		0.8106723346641649			8		7			1001	910		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	4.644	1000	2.902		0.884180022365886			7		1			1001	913		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	4.335	1000	2.710		0.884180022365886			7		22			1001	915		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	3.633	1000	2.907		0.884180022365886			6		9			1001	916		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	2.696	1000	1.685		0.884180022365886			7		7			1001	918		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	1.629	1000	1.303		0.884180022365886			6		1			1001	919		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	2.656	1000	2.124		0.884180022365886			7		1			1001	921		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	1.775	1000	1.420		0.884180022365886			6		1			1001	922		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	2.614	1000	2.091		0.884180022365886			6		3			1001	925		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	3.901	1000	2.438		0.884180022365886			8		5			1001	928		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.6924	2.009	1000	1.256		0.884180022365886			6		1			1001	929		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	4.323	1000	2.702		0.9352176222786048			6		1			1001	930		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.432	1000	2.746		0.9352176222786048			6		1			1001	931		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	4.687	1000	2.930		0.9352176222786048			6		1			1001	932		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.567	1000	2.854		0.9352176222786048			6		20			1001	933		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.059	1000	1.912		0.9352176222786048			5		1			1001	934		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.589	1000	0.993		0.9352176222786048			7		14			1001	935		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.699	1000	1.359		0.9352176222786048			6		1			1001	936		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.508	1000	0.943		0.9352176222786048			8		1			1001	938		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.944	1000	1.215		0.9352176222786048			8		1			1001	941		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.764	1000	1.102		0.9352176222786048			6		1			1001	942		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.716	1000	1.373		0.9352176222786048			6		1			1001	943		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.697	1000	2.958		0.9352176222786048			8		1			1001	947		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.616	1000	1.010		0.9352176222786048			8		10			1001	948		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.474	1000	1.546		0.9352176222786048			7		5			1001	950		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.526	1000	2.821		0.9352176222786048			6		24			1001	951		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.957	1000	1.848		0.9352176222786048			7		23			1001	952		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.075	1000	1.297		0.9352176222786048			6		9			1001	954		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.513	1000	2.196		0.9352176222786048			5		27			1001	956		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.211	1000	2.569		0.9352176222786048			6		14			1001	959		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.332	1000	2.666		0.9352176222786048			7		1			1001	960		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.317	1000	1.854		0.9352176222786048			8		27			1001	961		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.007	1000	1.605		0.9352176222786048			6		1			1001	962		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.363	1000	2.690		0.9352176222786048			6		12			1001	964		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.685	1000	1.053		0.9352176222786048			5		1			1001	965		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.025	1000	1.890		0.9352176222786048			6		1			1001	967		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.681	1000	1.345		0.9352176222786048			6		1			1001	968		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.420	1000	1.136		0.9352176222786048			6		6			1001	970		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.351	1000	2.681		0.9352176222786048			5		1			1001	973		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	3.810	1000	3.048		0.9352176222786048			7		1			1001	974		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.866	1000	1.493		0.9352176222786048			8		1			1001	975		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.451	1000	1.532		0.9352176222786048			6		1			1001	976		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	1.929	1000	1.543		0.9352176222786048			5		24			1001	977		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.843	1000	2.274		0.9352176222786048			7		26			1001	978		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.1364	2.411	1000	1.507		0.9352176222786048			7		1			1001	979		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	0.963	1000	0.770		0.9549242885936724			7		7			1001	980		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.916	1000	1.197		0.9549242885936724			7		1			1001	981		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.794	1000	1.435		0.9549242885936724			8		1			1001	982		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	4.158	1000	2.599		0.9549242885936724			8		20			1001	983		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.786	1000	1.429		0.9549242885936724			5		11			1001	984		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.978	1000	1.237		0.9549242885936724			7		1			1001	986		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.390	1000	1.912		0.9549242885936724			6		1			1001	988		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.854	1000	1.784		0.9549242885936724			5		1			1001	990		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.138	1000	2.511		0.9549242885936724			5		9			1001	991		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.943	1000	2.464		0.9549242885936724			6		1			1001	992		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.771	1000	2.357		0.9549242885936724			7		1			1001	993		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.857	1000	1.486		0.9549242885936724			7		6			1001	994		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.785	1000	3.028		0.9549242885936724			7		23			1001	998		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.046	1000	1.903		0.9549242885936724			6		1			1001	1000		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.287	1000	1.830		0.9549242885936724			7		1			1001	1001		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.201	1000	2.001		0.9549242885936724			7		20			1001	1002		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.782	1000	1.426		0.9549242885936724			5		15			1001	1004		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.840	1000	2.272		0.9549242885936724			6		1			1001	1005		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.166	1000	1.354		0.9549242885936724			6		19			1001	1007		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.537	1000	2.830		0.9549242885936724			7		1			1001	1010		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.593	1000	1.621		0.9549242885936724			5		2			1001	1011		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.255	1000	2.604		0.9549242885936724			8		1			1001	1012		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	1.355	1000	1.084		0.9549242885936724			6		16			1001	1013		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.228	1000	2.582		0.9549242885936724			7		1			1001	1015		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.110	1000	1.319		0.9549242885936724			7		1			1001	1016		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.201	1000	2.001		0.9549242885936724			8		1			1001	1018		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	4.111	1000	2.569		0.9549242885936724			6		14			1001	1019		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	3.408	1000	2.727		0.9549242885936724			7		1			1001	1020		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.595	1000	2.076		0.9549242885936724			7		1			1001	1023		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	0.909	1000	0.727		0.9549242885936724			6		20			1001	1024		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	2.746	1000	1.716		0.9549242885936724			5		16			1001	1025		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.3078	0.958	1000	0.766		0.9549242885936724			6		1			1001	1026		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.752	1000	2.202		1.081871545194223			7		1			1001	1027		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.344	1000	2.090		1.081871545194223			6		27			1001	1031		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.054	1000	2.443		1.081871545194223			6		16			1001	1033		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.453	1000	1.163		1.081871545194223			5		4			1001	1034		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.629	1000	2.103		1.081871545194223			7		1			1001	1037		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.256	1000	1.804		1.081871545194223			6		1			1001	1038		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.872	1000	2.420		1.081871545194223			6		12			1001	1039		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.015	1000	1.885		1.081871545194223			7		1			1001	1040		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.207	1000	1.766		1.081871545194223			6		14			1001	1044		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.196	1000	1.373		1.081871545194223			6		7			1001	1045		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.462	1000	0.914		1.081871545194223			6		3			1001	1046		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.522	1000	1.217		1.081871545194223			8		9			1001	1048		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.188	1000	1.750		1.081871545194223			8		9			1001	1050		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.837	1000	1.148		1.081871545194223			6		1			1001	1052		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.738	1000	1.390		1.081871545194223			7		20			1001	1053		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.064	1000	0.851		1.081871545194223			7		1			1001	1054		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.499	1000	1.562		1.081871545194223			7		1			1001	1055		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.327	1000	1.862		1.081871545194223			7		20			1001	1056		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.768	1000	1.414		1.081871545194223			7		1			1001	1058		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.492	1000	0.932		1.081871545194223			5		1			1001	1060		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.137	1000	0.711		1.081871545194223			6		1			1001	1062		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.254	1000	2.034		1.081871545194223			6		22			1001	1063		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.024	1000	0.819		1.081871545194223			6		14			1001	1064		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.218	1000	0.761		1.081871545194223			7		10			1001	1065		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.676	1000	2.141		1.081871545194223			6		11			1001	1066		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.550	1000	0.969		1.081871545194223			5		16			1001	1068		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.039	1000	1.631		1.081871545194223			7		1			1001	1069		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.248	1000	1.798		1.081871545194223			6		23			1001	1070		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.427	1000	1.141		1.081871545194223			7		28			1001	1072		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.892	1000	1.808		1.081871545194223			6		15			1001	1073		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.584	1000	2.867		1.081871545194223			5		26			1001	1078		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.947	1000	1.217		1.081871545194223			7		5			1001	1079		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.987	1000	1.590		1.081871545194223			8		1			1001	1081		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	1.319	1000	1.055		1.081871545194223			8		27			1001	1082		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	2.313	1000	1.446		1.081871545194223			7		1			1001	1083		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4123	3.911	1000	2.445		1.081871545194223			6		1			1001	1084		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.528	1000	1.222		1.1283171687088371			6		1			1001	1085		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.804	1000	1.127		1.1283171687088371			7		15			1001	1086		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.034	1000	1.896		1.1283171687088371			8		1			1001	1087		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.526	1000	2.021		1.1283171687088371			5		1			1001	1089		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.335	1000	0.834		1.1283171687088371			5		1			1001	1090		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.496	1000	2.185		1.1283171687088371			6		18			1001	1091		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.175	1000	1.740		1.1283171687088371			7		13			1001	1092		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	4.236	1000	2.647		1.1283171687088371			5		4			1001	1094		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.530	1000	1.224		1.1283171687088371			8		1			1001	1096		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.789	1000	1.743		1.1283171687088371			6		1			1001	1097		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.567	1000	2.054		1.1283171687088371			5		1			1001	1099		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.298	1000	1.436		1.1283171687088371			6		16			1001	1100		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.576	1000	2.235		1.1283171687088371			7		1			1001	1102		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.222	1000	1.389		1.1283171687088371			6		14			1001	1104		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.269	1000	1.015		1.1283171687088371			8		13			1001	1105		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.742	1000	2.193		1.1283171687088371			6		1			1001	1107		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.520	1000	2.816		1.1283171687088371			6		1			1001	1108		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.263	1000	1.010		1.1283171687088371			5		14			1001	1109		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.158	1000	2.526		1.1283171687088371			6		21			1001	1110		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.579	1000	2.064		1.1283171687088371			7		1			1001	1111		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.204	1000	0.752		1.1283171687088371			7		15			1001	1112		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.048	1000	1.638		1.1283171687088371			7		1			1001	1114		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.132	1000	1.958		1.1283171687088371			7		14			1001	1115		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	3.066	1000	1.916		1.1283171687088371			7		12			1001	1116		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.615	1000	1.292		1.1283171687088371			5		1			1001	1118		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.874	1000	1.499		1.1283171687088371			7		1			1001	1121		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.106	1000	1.316		1.1283171687088371			6		1			1001	1122		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	4.287	1000	2.680		1.1283171687088371			8		1			1001	1124		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	4.045	1000	2.528		1.1283171687088371			7		1			1001	1125		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	2.424	1000	1.515		1.1283171687088371			5		21			1001	1126		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.633	1000	1.021		1.1283171687088371			7		1			1001	1127		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.163	1000	0.930		1.1283171687088371			6		1			1001	1128		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.143	1000	0.715		1.1283171687088371			8		15			1001	1129		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.8164	1.011	1000	0.809		1.1283171687088371			7		1			1001	1130		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.285	1000	2.053		1.1564818874302836			7		11			1001	1132		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.647	1000	2.279		1.1564818874302836			6		1			1001	1133		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	1.254	1000	1.003		1.1564818874302836			5		21			1001	1135		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.363	1000	1.891		1.1564818874302836			6		25			1001	1136		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.618	1000	2.261		1.1564818874302836			7		12			1001	1137		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.519	1000	2.815		1.1564818874302836			8		1			1001	1138		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.344	1000	1.875		1.1564818874302836			7		20			1001	1139		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.867	1000	2.294		1.1564818874302836			7		1			1001	1140		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.440	1000	2.752		1.1564818874302836			6		1			1001	1141		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	1.569	1000	1.255		1.1564818874302836			7		19			1001	1142		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.024	1000	1.265		1.1564818874302836			7		11			1001	1143		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.780	1000	2.224		1.1564818874302836			5		21			1001	1146		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.364	1000	1.892		1.1564818874302836			7		1			1001	1147		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.424	1000	1.515		1.1564818874302836			5		19			1001	1148		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	4.570	1000	2.856		1.1564818874302836			6		13			1001	1150		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.434	1000	2.747		1.1564818874302836			5		25			1001	1151		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	1.966	1000	1.573		1.1564818874302836			6		25			1001	1152		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.272	1000	2.045		1.1564818874302836			5		1			1001	1155		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.095	1000	2.476		1.1564818874302836			5		1			1001	1156		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.447	1000	1.530		1.1564818874302836			7		1			1001	1157		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	1.345	1000	1.076		1.1564818874302836			7		1			1001	1159		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.265	1000	1.812		1.1564818874302836			5		1			1001	1160		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.840	1000	2.400		1.1564818874302836			8		1			1001	1161		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.185	1000	1.990		1.1564818874302836			8		1			1001	1162		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	1.577	1000	0.985		1.1564818874302836			7		1			1001	1163		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.985	1000	2.491		1.1564818874302836			6		1			1001	1165		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.990	1000	2.392		1.1564818874302836			7		25			1001	1167		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.198	1000	1.758		1.1564818874302836			6		29			1001	1168		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	2.206	1000	1.379		1.1564818874302836			6		17			1001	1169		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.466	1000	2.773		1.1564818874302836			8		13			1001	1170		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.0614	3.278	1000	2.623		1.1564818874302836			8		1			1001	1171		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.262	1000	0.789		1.1678359690100388			7		1			1001	1172		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.375	1000	1.484		1.1678359690100388			6		1			1001	1174		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.764	1000	1.728		1.1678359690100388			6		1			1001	1175		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.691	1000	1.353		1.1678359690100388			5		1			1001	1176		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.121	1000	1.326		1.1678359690100388			7		29			1001	1177		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.987	1000	1.867		1.1678359690100388			7		1			1001	1179		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.163	1000	1.730		1.1678359690100388			5		18			1001	1181		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.482	1000	2.176		1.1678359690100388			8		23			1001	1183		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.059	1000	2.447		1.1678359690100388			7		14			1001	1184		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.705	1000	1.065		1.1678359690100388			6		5			1001	1185		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.345	1000	2.676		1.1678359690100388			6		1			1001	1186		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.473	1000	0.920		1.1678359690100388			8		22			1001	1187		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.835	1000	1.147		1.1678359690100388			7		1			1001	1188		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.441	1000	2.151		1.1678359690100388			6		20			1001	1190		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.843	1000	2.402		1.1678359690100388			8		1			1001	1191		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.487	1000	1.989		1.1678359690100388			6		31			1001	1193		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.509	1000	2.007		1.1678359690100388			6		1			1001	1194		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.195	1000	1.756		1.1678359690100388			6		1			1001	1195		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.270	1000	1.816		1.1678359690100388			7		7			1001	1196		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	4.131	1000	2.582		1.1678359690100388			7		1			1001	1198		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.261	1000	1.008		1.1678359690100388			6		25			1001	1199		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	4.078	1000	2.549		1.1678359690100388			6		21			1001	1200		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	0.971	1000	0.777		1.1678359690100388			6		1			1001	1201		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	1.639	1000	1.024		1.1678359690100388			7		1			1001	1202		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.543	1000	2.215		1.1678359690100388			8		1			1001	1203		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	2.945	1000	1.840		1.1678359690100388			5		24			1001	1204		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.474	1000	2.779		1.1678359690100388			6		1			1001	1205		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.209	1000	2.006		1.1678359690100388			6		26			1001	1207		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1602	3.139	1000	2.511		1.1678359690100388			8		31			1001	1209		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	1.564	1000	1.251		1.2518522318471672			5		1			1001	1214		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	3.561	1000	2.226		1.2518522318471672			7		1			1001	1215		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	0.986	1000	0.789		1.2518522318471672			6		1			1001	1216		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	1.965	1000	1.572		1.2518522318471672			7		15			1001	1217		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	2.348	1000	1.879		1.2518522318471672			6		32			1001	1218		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	2.976	1000	1.860		1.2518522318471672			6		1			1001	1220		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	3.363	1000	2.102		1.2518522318471672			7		26			1001	1221		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	1.730	1000	1.081		1.2518522318471672			5		1			1001	1224		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	2.564	1000	1.603		1.2518522318471672			7		7			1001	1226		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	2.055	1000	1.644		1.2518522318471672			6		28			1001	1229		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.8911	1.727	1000	1.381		1.2518522318471672			7		25			1001	1230		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.118	1000	0.894		1.2928799135408169			6		1			1001	1231		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.750	1000	1.719		1.2928799135408169			5		30			1001	1232		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.001	1000	0.801		1.2928799135408169			8		1			1001	1233		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.421	1000	1.136		1.2928799135408169			6		1			1001	1234		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	0.966	1000	0.773		1.2928799135408169			6		21			1001	1235		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.840	1000	2.272		1.2928799135408169			5		1			1001	1236		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.270	1000	0.794		1.2928799135408169			7		1			1001	1238		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.043	1000	1.277		1.2928799135408169			7		19			1001	1240		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.864	1000	1.790		1.2928799135408169			8		1			1001	1241		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.139	1000	0.911		1.2928799135408169			8		15			1001	1243		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.580	1000	0.987		1.2928799135408169			8		16			1001	1244		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.794	1000	2.235		1.2928799135408169			6		1			1001	1247		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	1.566	1000	1.252		1.2928799135408169			7		10			1001	1248		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	2.904	1000	2.323		1.2928799135408169			6		1			1001	1249		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	4.016	1000	2.510		1.2928799135408169			6		1			1001	1250		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	4.252	1000	2.658		1.2928799135408169			7		11			1001	1251		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.2481	3.989	1000	2.493		1.2928799135408169			8		6			1001	1252		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	1.749	1000	1.399		1.337614727371355			5		1			1001	1253		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	4.197	1000	2.623		1.337614727371355			8		27			1001	1255		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	3.207	1000	2.565		1.337614727371355			7		1			1001	1257		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	0.909	1000	0.727		1.337614727371355			5		33			1001	1259		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	1.340	1000	0.837		1.337614727371355			7		1			1001	1261		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	1.148	1000	0.718		1.337614727371355			7		14			1001	1262		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	3.063	1000	1.915		1.337614727371355			7		1			1001	1263		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.588	1000	1.617		1.337614727371355			7		1			1001	1265		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.020	1000	1.263		1.337614727371355			7		9			1001	1266		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.089	1000	1.305		1.337614727371355			7		1			1001	1267		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.450	1000	1.960		1.337614727371355			7		34			1001	1268		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.823	1000	2.258		1.337614727371355			8		1			1001	1269		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	1.359	1000	1.087		1.337614727371355			6		1			1001	1270		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	3.397	1000	2.123		1.337614727371355			7		20			1001	1271		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.680	1000	2.144		1.337614727371355			7		1			1001	1272		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	4.261	1000	2.663		1.337614727371355			7		33			1001	1273		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	3.865	1000	2.416		1.337614727371355			7		1			1001	1275		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	2.483	1000	1.552		1.337614727371355			5		1			1001	1276		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.6372	1.704	1000	1.363		1.337614727371355			6		33			1001	1278		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.568	1000	1.605		1.737983364146006			7		4			1001	1279		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	3.034	1000	1.897		1.737983364146006			7		3			1001	1280		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.793	1000	1.434		1.737983364146006			6		1			1001	1281		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.928	1000	1.830		1.737983364146006			6		32			1001	1284		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.095	1000	1.309		1.737983364146006			7		35			1001	1285		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	3.378	1000	2.111		1.737983364146006			8		1			1001	1286		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.970	1000	1.231		1.737983364146006			7		1			1001	1288		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	3.808	1000	2.380		1.737983364146006			6		1			1001	1291		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.407	1000	0.880		1.737983364146006			5		38			1001	1292		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.531	1000	0.957		1.737983364146006			7		1			1001	1293		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.815	1000	1.452		1.737983364146006			5		1			1001	1294		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	0.995	1000	0.796		1.737983364146006			7		1			1001	1295		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.379	1000	1.103		1.737983364146006			8		39			1001	1296		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.719	1000	1.074		1.737983364146006			7		1			1001	1298		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.806	1000	2.245		1.737983364146006			7		20			1001	1299		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.609	1000	2.087		1.737983364146006			5		5			1001	1300		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.752	1000	1.720		1.737983364146006			7		1			1001	1301		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.381	1000	1.105		1.737983364146006			7		1			1001	1305		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.677	1000	1.048		1.737983364146006			7		14			1001	1306		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	3.562	1000	2.226		1.737983364146006			8		6			1001	1307		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	1.256	1000	0.785		1.737983364146006			7		1			1001	1308		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	3.825	1000	2.391		1.737983364146006			7		1			1001	1309		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.537	1000	1.586		1.737983364146006			7		1			1001	1311		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.006	1000	1.254		1.737983364146006			7		1			1001	1312		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.167	1000	1.734		1.737983364146006			8		1			1001	1313		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1205	2.888	1000	2.310		1.737983364146006			5		28			1001	1314		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.562	1000	1.601		1.7639599085965134			7		1			1001	1315		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	1.089	1000	0.871		1.7639599085965134			6		1			1001	1316		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	1.873	1000	1.171		1.7639599085965134			6		1			1001	1319		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	1.781	1000	1.424		1.7639599085965134			5		1			1001	1321		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.600	1000	2.080		1.7639599085965134			7		1			1001	1323		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.739	1000	1.712		1.7639599085965134			6		1			1001	1324		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.387	1000	1.492		1.7639599085965134			5		1			1001	1326		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	3.691	1000	2.307		1.7639599085965134			7		1			1001	1328		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.264	1000	1.415		1.7639599085965134			7		18			1001	1329		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	1.033	1000	0.827		1.7639599085965134			7		41			1001	1330		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.953	1000	2.362		1.7639599085965134			5		1			1001	1331		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	3.067	1000	1.917		1.7639599085965134			5		2			1001	1332		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.151	1000	1.721		1.7639599085965134			7		28			1001	1333		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.3465	2.632	1000	2.105		1.7639599085965134			7		1			1001	1338		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.938	1000	1.550		1.7919424051875499			7		35			1001	1339		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.427	1000	1.517		1.7919424051875499			6		8			1001	1341		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	0.973	1000	0.778		1.7919424051875499			7		20			1001	1342		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.844	1000	2.276		1.7919424051875499			6		1			1001	1343		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.052	1000	1.282		1.7919424051875499			5		1			1001	1344		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	3.378	1000	2.112		1.7919424051875499			5		42			1001	1346		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.172	1000	1.738		1.7919424051875499			6		1			1001	1350		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.259	1000	1.807		1.7919424051875499			6		25			1001	1352		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.299	1000	1.039		1.7919424051875499			7		1			1001	1353		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.213	1000	1.383		1.7919424051875499			8		1			1001	1355		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.071	1000	1.656		1.7919424051875499			6		17			1001	1357		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.573	1000	1.258		1.7919424051875499			7		1			1001	1358		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.133	1000	1.333		1.7919424051875499			7		15			1001	1359		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.710	1000	1.068		1.7919424051875499			5		1			1001	1360		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.662	1000	2.129		1.7919424051875499			8		7			1001	1362		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.032	1000	1.626		1.7919424051875499			8		5			1001	1363		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	2.437	1000	1.949		1.7919424051875499			6		11			1001	1364		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.744	1000	1.395		1.7919424051875499			8		21			1001	1365		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	3.471	1000	2.170		1.7919424051875499			6		1			1001	1366		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.002	1000	0.802		1.7919424051875499			6		1			1001	1367		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.5899	1.593	1000	1.274		1.7919424051875499			5		26			1001	1368		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.301	1000	0.813		1.9009920666167142			6		35			1001	1369		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.452	1000	1.161		1.9009920666167142			6		34			1001	1370		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.401	1000	1.921		1.9009920666167142			7		1			1001	1372		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.108	1000	0.692		1.9009920666167142			7		1			1001	1374		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.196	1000	0.957		1.9009920666167142			7		3			1001	1375		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.117	1000	0.893		1.9009920666167142			6		1			1001	1380		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.725	1000	1.078		1.9009920666167142			6		1			1001	1381		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.047	1000	0.837		1.9009920666167142			5		1			1001	1382		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.585	1000	1.268		1.9009920666167142			7		1			1001	1383		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.431	1000	1.145		1.9009920666167142			6		1			1001	1385		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.703	1000	1.362		1.9009920666167142			7		11			1001	1386		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.746	1000	1.091		1.9009920666167142			6		36			1001	1387		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.976	1000	1.235		1.9009920666167142			7		1			1001	1389		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	0.863	1000	0.691		1.9009920666167142			7		1			1001	1394		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.047	1000	0.837		1.9009920666167142			7		1			1001	1395		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	3.339	1000	2.087		1.9009920666167142			7		22			1001	1396		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	3.260	1000	2.038		1.9009920666167142			6		1			1001	1397		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.230	1000	0.984		1.9009920666167142			5		1			1001	1398		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.794	1000	1.435		1.9009920666167142			8		18			1001	1400		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.027	1000	1.622		1.9009920666167142			6		11			1001	1401		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.309	1000	1.047		1.9009920666167142			6		33			1001	1403		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	0.885	1000	0.708		1.9009920666167142			7		23			1001	1404		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.351	1000	1.470		1.9009920666167142			6		1			1001	1405		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.848	1000	1.479		1.9009920666167142			7		1			1001	1406		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.202	1000	0.962		1.9009920666167142			8		1			1001	1407		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.580	1000	1.264		1.9009920666167142			5		33			1001	1408		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	3.537	1000	2.211		1.9009920666167142			7		1			1001	1409		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.263	1000	1.010		1.9009920666167142			6		1			1001	1410		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.958	1000	1.849		1.9009920666167142			8		45			1001	1411		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.234	1000	1.397		1.9009920666167142			5		1			1001	1413		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.562	1000	2.050		1.9009920666167142			5		1			1001	1414		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	3.710	1000	2.319		1.9009920666167142			6		43			1001	1417		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.892	1000	1.514		1.9009920666167142			8		15			1001	1418		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	2.324	1000	1.859		1.9009920666167142			5		2			1001	1419		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	3.472	1000	2.170		1.9009920666167142			7		1			1001	1420		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	1.051	1000	0.841		1.9009920666167142			7		45			1001	1421		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.5386	0.907	1000	0.725		1.9009920666167142			7		13			1001	1422		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.068	1000	0.854		1.9455314812310978			6		1			1001	1424		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	0.955	1000	0.764		1.9455314812310978			5		42			1001	1426		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.668	1000	1.334		1.9455314812310978			7		46			1001	1431		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.169	1000	1.356		1.9455314812310978			7		8			1001	1432		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.695	1000	1.060		1.9455314812310978			8		19			1001	1434		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	3.176	1000	1.985		1.9455314812310978			7		15			1001	1435		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.597	1000	1.277		1.9455314812310978			5		1			1001	1437		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.117	1000	1.694		1.9455314812310978			5		47			1001	1442		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.208	1000	1.767		1.9455314812310978			8		13			1001	1443		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.881	1000	1.505		1.9455314812310978			6		9			1001	1444		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	3.527	1000	2.204		1.9455314812310978			6		21			1001	1445		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	3.622	1000	2.264		1.9455314812310978			6		9			1001	1446		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.891	1000	1.513		1.9455314812310978			5		38			1001	1447		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.024	1000	0.819		1.9455314812310978			6		24			1001	1449		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.837	1000	1.470		1.9455314812310978			8		1			1001	1452		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.877	1000	1.798		1.9455314812310978			7		4			1001	1453		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.877	1000	1.798		1.9455314812310978			5		22			1001	1454		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.968	1000	1.855		1.9455314812310978			6		1			1001	1455		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.730	1000	1.081		1.9455314812310978			6		36			1001	1457		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.578	1000	1.611		1.9455314812310978			7		21			1001	1458		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.655	1000	1.659		1.9455314812310978			8		1			1001	1459		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	2.111	1000	1.320		1.9455314812310978			7		1			1001	1460		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9261	1.109	1000	0.887		1.9455314812310978			8		12			1001	1462		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	2.216	1000	1.385		1.9490383495235983			6		25			1001	1463		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.633	1000	1.307		1.9490383495235983			8		19			1001	1465		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	2.485	1000	1.553		1.9490383495235983			6		1			1001	1468		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	2.961	1000	1.850		1.9490383495235983			7		22			1001	1469		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.309	1000	1.047		1.9490383495235983			6		30			1001	1470		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.003	1000	0.802		1.9490383495235983			6		35			1001	1471		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.991	1000	1.592		1.9490383495235983			7		1			1001	1473		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	3.224	1000	2.015		1.9490383495235983			8		1			1001	1474		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	3.066	1000	1.916		1.9490383495235983			5		1			1001	1476		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.921	1000	1.536		1.9490383495235983			6		1			1001	1477		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	2.399	1000	1.499		1.9490383495235983			6		42			1001	1478		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	2.342	1000	1.874		1.9490383495235983			5		1			1001	1479		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.9566	1.390	1000	0.869		1.9490383495235983			7		10			1001	1480		0				1			5			20			0.0000		105.000		0.000

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.0434	13.684	1000	10.947		3.0			0		6			1001	1601		1				1			5			24			105.0000		42.000		0.000

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.717	1000	2.173		1.9837566876553794			6		23			1001	1481		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.674	1000	1.671		1.9837566876553794			6		1			1001	1482		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.272	1000	0.795		1.9837566876553794			7		1			1001	1483		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.171	1000	1.737		1.9837566876553794			8		14			1001	1485		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.898	1000	1.811		1.9837566876553794			8		27			1001	1486		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.288	1000	1.030		1.9837566876553794			6		1			1001	1488		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.316	1000	1.053		1.9837566876553794			6		47			1001	1489		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.073	1000	1.921		1.9837566876553794			8		1			1001	1491		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.136	1000	0.710		1.9837566876553794			7		1			1001	1493		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	0.873	1000	0.698		1.9837566876553794			6		1			1001	1495		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.305	1000	2.066		1.9837566876553794			7		48			1001	1497		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.444	1000	2.152		1.9837566876553794			7		1			1001	1499		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.718	1000	1.699		1.9837566876553794			7		1			1001	1500		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.370	1000	1.481		1.9837566876553794			6		1			1001	1501		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.809	1000	1.131		1.9837566876553794			8		1			1001	1503		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.499	1000	1.999		1.9837566876553794			7		39			1001	1505		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.368	1000	2.105		1.9837566876553794			6		1			1001	1506		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.009	1000	1.607		1.9837566876553794			7		1			1001	1507		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.646	1000	1.317		1.9837566876553794			7		1			1001	1508		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.532	1000	0.958		1.9837566876553794			6		1			1001	1509		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.592	1000	1.273		1.9837566876553794			5		48			1001	1512		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.414	1000	1.509		1.9837566876553794			7		28			1001	1513		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.607	1000	1.004		1.9837566876553794			6		43			1001	1514		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.498	1000	2.187		1.9837566876553794			7		25			1001	1516		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.685	1000	1.678		1.9837566876553794			6		41			1001	1517		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.106	1000	1.941		1.9837566876553794			7		1			1001	1518		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.556	1000	1.245		1.9837566876553794			5		1			1001	1519		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.542	1000	2.034		1.9837566876553794			6		27			1001	1522		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.367	1000	1.893		1.9837566876553794			6		1			1001	1524		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.816	1000	2.253		1.9837566876553794			6		34			1001	1526		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.203	1000	0.752		1.9837566876553794			8		1			1001	1527		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.692	1000	1.354		1.9837566876553794			6		10			1001	1531		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.148	1000	1.967		1.9837566876553794			8		1			1001	1532		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.410	1000	1.128		1.9837566876553794			5		1			1001	1533		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.353	1000	1.083		1.9837566876553794			7		34			1001	1534		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	2.962	1000	1.851		1.9837566876553794			6		4			1001	1536		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.828	1000	1.463		1.9837566876553794			7		1			1001	1537		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	1.702	1000	1.064		1.9837566876553794			5		14			1001	1539		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2587	3.323	1000	2.077		1.9837566876553794			5		44			1001	1540		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.252	1000	0.783		1.9880476643579101			6		1			1001	1541		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.097	1000	1.311		1.9880476643579101			6		1			1001	1543		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.638	1000	1.024		1.9880476643579101			7		1			1001	1544		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	3.115	1000	1.947		1.9880476643579101			6		37			1001	1545		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.331	1000	0.832		1.9880476643579101			6		1			1001	1547		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.825	1000	1.460		1.9880476643579101			8		1			1001	1548		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.748	1000	2.198		1.9880476643579101			7		1			1001	1549		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.997	1000	1.873		1.9880476643579101			7		1			1001	1550		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.885	1000	1.508		1.9880476643579101			6		2			1001	1551		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	0.975	1000	0.780		1.9880476643579101			5		44			1001	1552		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.008	1000	1.606		1.9880476643579101			7		26			1001	1553		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.494	1000	1.559		1.9880476643579101			7		1			1001	1555		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.632	1000	1.020		1.9880476643579101			8		11			1001	1557		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.414	1000	1.931		1.9880476643579101			7		1			1001	1559		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.906	1000	1.525		1.9880476643579101			8		1			1001	1560		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.546	1000	2.037		1.9880476643579101			6		1			1001	1561		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.169	1000	1.356		1.9880476643579101			7		1			1001	1562		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	3.459	1000	2.162		1.9880476643579101			6		5			1001	1564		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.416	1000	1.933		1.9880476643579101			7		1			1001	1565		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.025	1000	1.620		1.9880476643579101			7		9			1001	1568		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	0.945	1000	0.756		1.9880476643579101			6		13			1001	1569		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.605	1000	1.003		1.9880476643579101			7		44			1001	1570		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.631	1000	2.105		1.9880476643579101			6		29			1001	1571		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	1.551	1000	1.241		1.9880476643579101			6		1			1001	1572		1				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.693	1000	2.155		1.9880476643579101			6		5			1001	1574		0				1			5			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.2960	2.903	1000	1.814		1.9880476643579101			5		17			1001	1576		0				1			5			20			0.0000		105.000		0.000

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	101.7726	13.297	1000	10.638		3.2222222222222223			2		9			1001	1828		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.2314	14.293	1000	11.434		3.0			0		6			1001	1709		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.2595	12.144	1000	9.716		3.0			4		4			1001	1714		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.3064	17.083	1000	10.677		3.0			0		13			1001	1599		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.3398	15.235	1000	9.522		3.0			5		18			1001	1639		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.4479	15.177	1000	9.486		3.0			8		8			1001	1586		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.6644	16.852	1000	10.532		3.0			3		15			1001	1592		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.8089	16.101	1000	10.063		3.0			1		10			1001	1667		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.8339	12.638	1000	10.110		3.0			2		19			1001	1720		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.9540	14.782	1000	11.826		3.0			6		17			1001	1653		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.9639	18.977	1000	11.861		3.0			4		7			1001	1712		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.0636	11.665	1000	9.332		3.0			6		12			1001	1675		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.1304	11.635	1000	9.308		3.0			5		3			1001	1688		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.1880	14.916	1000	11.933		3.0			7		11			1001	1631		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.1891	14.509	1000	9.068		3.2222222222222223			7		12			1001	1816		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.1916	11.948	1000	9.558		3.0			6		13			1001	1674		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.2988	14.569	1000	11.655		3.0			1		2			1001	1585		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.3866	12.522	1000	10.018		3.0			4		5			1001	1644		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.5755	18.998	1000	11.874		3.0			0		17			1001	1668		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.6491	16.981	1000	10.613		3.0			6		7			1001	1602		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.6648	14.282	1000	11.425		3.2222222222222223			4		8			1001	1809		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.6721	12.319	1000	9.855		3.0			0		9			1001	1678		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.6752	16.566	1000	10.354		3.0			3		4			1001	1607		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.7271	17.908	1000	11.193		3.0			5		1			1001	1649		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.7675	13.292	1000	10.634		3.0			4		13			1001	1673		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.8357	13.764	1000	11.011		3.2222222222222223			2		14			1001	1788		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.8444	14.490	1000	11.592		3.0			4		18			1001	1683		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.9237	14.067	1000	11.254		3.0			1		4			1001	1676		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.1141	13.388	1000	10.711		3.0			3		7			1001	1702		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.1987	15.356	1000	9.597		3.0			3		3			1001	1719		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.2241	14.125	1000	11.300		3.0			5		17			1001	1579		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.2861	14.758	1000	11.806		3.0			6		15			1001	1663		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3011	16.019	1000	10.012		3.0			2		7			1001	1655		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3011	16.525	1000	10.328		3.0			2		17			1001	1703		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3156	11.852	1000	9.482		3.0			8		14			1001	1721		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3276	11.356	1000	9.085		3.0			3		5			1001	1603		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3418	15.089	1000	9.431		3.0			6		11			1001	1706		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3559	14.949	1000	9.343		3.0			1		2			1001	1632		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3651	16.478	1000	10.299		3.0			6		6			1001	1642		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.3882	14.680	1000	11.744		3.0			4		9			1001	1605		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4010	17.415	1000	10.884		3.0			7		17			1001	1594		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4082	15.911	1000	9.944		3.0			7		4			1001	1623		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4464	12.573	1000	10.059		3.2222222222222223			4		8			1001	1831		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4701	15.733	1000	9.833		3.0			7		14			1001	1593		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.5485	16.891	1000	10.557		3.0			3		14			1001	1669		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.6198	11.904	1000	9.523		3.0			7		1			1001	1577		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.6404	15.232	1000	9.520		3.2222222222222223			3		6			1001	1801		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.6519	14.976	1000	11.981		3.0			3		10			1001	1619		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.6613	18.904	1000	11.815		3.0			6		7			1001	1646		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7745	18.569	1000	11.606		3.0			7		16			1001	1612		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7953	11.511	1000	9.209		3.0			0		14			1001	1697		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.9370	16.584	1000	10.365		3.0			6		13			1001	1643		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.9604	17.739	1000	11.087		3.0			7		6			1001	1627		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.0028	14.430	1000	11.544		3.2222222222222223			4		11			1001	1843		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.0318	13.067	1000	10.454		3.0			1		1			1001	1596		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.0386	19.004	1000	11.877		3.0			3		15			1001	1661		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1214	11.565	1000	9.252		3.0			2		2			1001	1580		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1219	17.348	1000	10.843		3.0			2		7			1001	1598		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1411	12.205	1000	9.764		3.0			1		16			1001	1685		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2509	13.726	1000	8.579		3.2222222222222223			5		2			1001	1803		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.3489	16.604	1000	10.377		3.0			6		16			1001	1595		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.4007	14.346	1000	11.476		3.2222222222222223			1		10			1001	1760		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.4294	16.965	1000	10.603		3.0			6		7			1001	1589		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5145	13.454	1000	10.763		3.0			3		6			1001	1617		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5336	14.579	1000	9.112		3.2222222222222223			4		2			1001	1796		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5416	14.740	1000	9.212		3.2222222222222223			6		18			1001	1772		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.6106	12.268	1000	9.814		3.0			1		19			1001	1664		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.6446	16.861	1000	10.538		3.0			4		5			1001	1624		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.6958	11.664	1000	9.331		3.0			3		8			1001	1616		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.7126	15.525	1000	9.703		3.0			3		14			1001	1645		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.7251	11.966	1000	9.573		3.0			6		6			1001	1672		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.7349	18.449	1000	11.531		3.0			2		8			1001	1582		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8120	14.133	1000	11.306		3.0			7		6			1001	1725		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8165	15.857	1000	9.910		3.0			4		8			1001	1726		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8506	11.354	1000	9.083		3.0			4		6			1001	1656		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8669	12.999	1000	10.399		3.0			3		12			1001	1693		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8995	14.186	1000	11.348		3.0			1		1			1001	1715		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.9736	14.635	1000	11.708		3.0			5		14			1001	1654		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.0248	13.501	1000	10.801		3.2222222222222223			7		6			1001	1762		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.0373	12.438	1000	9.950		3.0			0		18			1001	1633		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.0384	14.907	1000	9.317		3.2222222222222223			7		14			1001	1783		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.0539	18.553	1000	11.596		3.0			1		13			1001	1727		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.1059	14.452	1000	11.562		3.2222222222222223			0		9			1001	1856		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.1391	13.636	1000	10.909		3.0			3		7			1001	1677		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2665	14.728	1000	11.783		3.0			5		9			1001	1713		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.3005	11.850	1000	9.480		3.0			4		19			1001	1636		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.3352	11.540	1000	9.232		3.2222222222222223			1		6			1001	1784		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.3788	18.732	1000	11.707		3.0			0		6			1001	1687		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.4549	12.047	1000	9.638		3.2222222222222223			6		15			1001	1817		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.4875	11.964	1000	9.571		3.0			8		19			1001	1650		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.4886	11.855	1000	9.484		3.0			3		14			1001	1610		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5236	14.644	1000	9.153		3.0			2		6			1001	1587		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5642	15.217	1000	9.510		3.0			1		3			1001	1680		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5646	12.964	1000	10.371		3.0			5		13			1001	1717		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5727	16.900	1000	10.563		3.2222222222222223			7		11			1001	1812		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5773	16.845	1000	10.528		3.0			2		13			1001	1704		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5784	13.655	1000	10.924		3.0			8		15			1001	1701		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5791	13.948	1000	11.158		3.0			3		12			1001	1711		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5909	18.752	1000	11.720		3.0			4		18			1001	1591		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.6651	10.726	1000	8.581		3.2222222222222223			1		11			1001	1747		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.7331	13.683	1000	10.946		3.2222222222222223			5		19			1001	1802		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.7738	14.423	1000	11.538		3.2222222222222223			1		2			1001	1839		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.8357	17.276	1000	10.797		3.2222222222222223			6		8			1001	1804		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.8723	13.745	1000	10.996		3.0			7		13			1001	1588		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.8884	17.352	1000	10.845		3.0			8		5			1001	1604		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.8910	11.957	1000	9.566		3.0			6		8			1001	1679		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.9195	16.377	1000	10.236		3.2222222222222223			5		1			1001	1753		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.9483	12.373	1000	9.899		3.0			6		12			1001	1613		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.1065	13.003	1000	10.402		3.0			3		3			1001	1708		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.1947	16.880	1000	10.550		3.0			6		19			1001	1682		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.1992	10.907	1000	8.726		3.2222222222222223			1		6			1001	1787		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.2581	11.590	1000	9.272		3.0			3		19			1001	1630		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.3365	15.221	1000	9.513		3.0			7		8			1001	1611		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.3445	12.774	1000	10.219		3.2222222222222223			4		15			1001	1780		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.4144	14.222	1000	8.889		3.2222222222222223			2		6			1001	1775		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.4521	11.260	1000	9.008		3.2222222222222223			2		17			1001	1852		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5297	10.881	1000	8.705		3.2222222222222223			3		1			1001	1848		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5361	15.619	1000	9.762		3.2222222222222223			3		14			1001	1769		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5389	16.364	1000	10.228		3.0			4		4			1001	1651		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5474	18.116	1000	11.323		3.2222222222222223			8		18			1001	1832		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5629	18.548	1000	11.592		3.0			4		10			1001	1699		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.6604	14.369	1000	11.495		3.2222222222222223			0		14			1001	1795		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7003	15.207	1000	9.504		3.2222222222222223			3		16			1001	1789		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7314	14.861	1000	11.889		3.0			5		10			1001	1689		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7329	13.605	1000	10.884		3.2222222222222223			5		17			1001	1745		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7377	17.230	1000	10.769		3.2222222222222223			4		2			1001	1771		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7547	14.534	1000	9.084		3.0			4		12			1001	1707		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.8089	10.940	1000	8.752		3.2222222222222223			3		10			1001	1833		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.8880	17.207	1000	10.755		3.2222222222222223			6		14			1001	1742		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.9202	11.439	1000	9.151		3.2222222222222223			2		5			1001	1781		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.0608	13.203	1000	10.562		3.0			0		13			1001	1578		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.0920	13.665	1000	8.541		3.2222222222222223			8		10			1001	1749		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1320	11.999	1000	9.599		3.2222222222222223			1		9			1001	1765		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1417	12.761	1000	10.209		3.2222222222222223			2		9			1001	1814		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1816	12.368	1000	9.895		3.0			5		11			1001	1684		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.2708	16.679	1000	10.424		3.2222222222222223			1		14			1001	1808		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.2831	11.881	1000	9.505		3.2222222222222223			7		3			1001	1767		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.2885	18.046	1000	11.279		3.2222222222222223			5		19			1001	1850		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.3568	15.013	1000	9.383		3.2222222222222223			7		19			1001	1777		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.3667	14.103	1000	11.283		3.2222222222222223			4		7			1001	1786		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.3693	18.658	1000	11.661		3.0			5		14			1001	1690		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.4450	12.887	1000	10.310		3.2222222222222223			6		11			1001	1845		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.4472	17.253	1000	10.783		3.2222222222222223			5		7			1001	1755		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.5596	14.573	1000	9.108		3.2222222222222223			7		2			1001	1750		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6026	18.240	1000	11.400		3.2222222222222223			6		10			1001	1829		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6225	11.527	1000	9.222		3.2222222222222223			4		4			1001	1813		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6288	14.319	1000	11.455		3.2222222222222223			5		15			1001	1776		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6394	14.612	1000	9.132		3.2222222222222223			1		7			1001	1799		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6649	16.027	1000	10.017		3.2222222222222223			7		2			1001	1785		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.7486	15.793	1000	9.870		3.2222222222222223			2		7			1001	1733		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.7696	11.987	1000	9.590		3.2222222222222223			6		15			1001	1770		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.7819	15.218	1000	9.511		3.0			7		6			1001	1724		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8110	11.340	1000	9.072		3.2222222222222223			1		6			1001	1737		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8243	15.469	1000	9.668		3.2222222222222223			7		19			1001	1782		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8453	16.846	1000	10.529		3.2222222222222223			8		5			1001	1766		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8612	12.302	1000	9.841		3.2222222222222223			1		5			1001	1800		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8985	16.041	1000	10.026		3.2222222222222223			5		17			1001	1731		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9404	18.767	1000	11.729		3.0			3		13			1001	1648		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9953	16.082	1000	10.051		3.2222222222222223			3		1			1001	1738		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0070	16.856	1000	10.535		3.2222222222222223			4		8			1001	1847		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0078	12.756	1000	10.205		3.2222222222222223			2		8			1001	1746		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0281	16.462	1000	10.289		3.2222222222222223			1		12			1001	1764		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.1980	14.275	1000	11.420		3.2222222222222223			3		13			1001	1763		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.2702	15.585	1000	9.741		3.2222222222222223			8		14			1001	1761		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.3873	13.875	1000	11.100		3.2222222222222223			4		4			1001	1791		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.5899	11.816	1000	9.453		3.2222222222222223			5		10			1001	1840		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.6699	12.944	1000	10.355		3.2222222222222223			6		3			1001	1735		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.8053	14.919	1000	9.325		3.2222222222222223			1		4			1001	1774		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.8709	14.525	1000	11.620		3.2222222222222223			8		1			1001	1732		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.1911	10.852	1000	8.682		3.2222222222222223			1		9			1001	1741		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.3923	11.884	1000	9.507		3.2222222222222223			2		15			1001	1853		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.8324	14.095	1000	8.810		3.2222222222222223			5		10			1001	1752		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.3584	12.842	1000	10.274		3.2222222222222223			3		19			1001	1818		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.6381	12.470	1000	9.976		3.2222222222222223			5		11			1001	1768		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.9341	14.573	1000	11.658		3.2222222222222223			1		2			1001	1806		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	112.0379	9.102	1000	7.282		3.888888888888889			6		15			1001	1876		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	113.9320	17.202	1000	10.751		3.2222222222222223			3		9			1001	1758		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	114.4138	10.335	1000	8.268		3.888888888888889			8		3			1001	1896		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.0108	11.089	1000	8.871		3.888888888888889			7		1			1001	1889		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.2555	11.286	1000	9.029		3.2222222222222223			1		18			1001	1836		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.7576	11.994	1000	7.496		3.888888888888889			6		7			1001	1871		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.8929	9.332	1000	7.466		3.888888888888889			2		6			1001	1875		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.0476	13.328	1000	8.330		3.888888888888889			4		19			1001	1899		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.3130	13.118	1000	8.199		3.888888888888889			5		15			1001	1901		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.4243	11.495	1000	7.184		3.888888888888889			4		9			1001	1858		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.5519	14.001	1000	8.751		3.888888888888889			8		16			1001	1904		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.5741	12.039	1000	9.631		3.888888888888889			4		3			1001	1863		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.6370	11.142	1000	8.914		3.888888888888889			1		10			1001	1903		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.7309	10.471	1000	8.377		3.888888888888889			5		19			1001	1860		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.7519	8.917	1000	7.134		3.888888888888889			7		5			1001	1891		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.8569	13.763	1000	8.602		3.888888888888889			4		6			1001	1886		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.9251	16.019	1000	10.012		3.888888888888889			5		9			1001	1878		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.9656	13.914	1000	8.696		3.888888888888889			7		16			1001	1865		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.1205	9.147	1000	7.318		3.888888888888889			2		14			1001	1882		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.2169	9.370	1000	7.496		3.888888888888889			2		8			1001	1867		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.4539	10.673	1000	8.539		3.888888888888889			2		8			1001	1880		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.6120	14.457	1000	9.036		3.888888888888889			7		16			1001	1869		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.6966	10.841	1000	8.673		3.888888888888889			4		14			1001	1905		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.0056	10.576	1000	8.461		3.888888888888889			6		19			1001	1857		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.0209	14.705	1000	9.191		3.888888888888889			7		16			1001	1885		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.0746	15.485	1000	9.678		3.888888888888889			2		16			1001	1892		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.1917	14.250	1000	8.906		3.888888888888889			8		19			1001	1906		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.4364	9.293	1000	7.434		3.888888888888889			7		10			1001	1861		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.4608	14.240	1000	8.900		3.888888888888889			2		10			1001	1862		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.5434	15.437	1000	9.648		3.888888888888889			2		17			1001	1898		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.8114	10.996	1000	8.797		3.888888888888889			3		14			1001	1877		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.8539	15.876	1000	9.922		3.888888888888889			3		16			1001	1879		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.8839	12.714	1000	10.171		3.888888888888889			7		1			1001	1868		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.9759	9.490	1000	7.592		3.888888888888889			2		10			1001	1897		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.1212	12.191	1000	7.619		3.888888888888889			7		11			1001	1873		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.5692	10.608	1000	8.486		3.888888888888889			8		5			1001	1881		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.7072	16.025	1000	10.016		3.888888888888889			4		9			1001	1884		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	120.5341	15.705	1000	9.815		3.888888888888889			1		5			1001	1895		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	121.1903	12.849	1000	10.279		3.888888888888889			2		1			1001	1888		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	122.7646	11.299	1000	9.039		3.888888888888889			6		1			1001	1864		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	122.8542	12.828	1000	8.018		3.888888888888889			1		18			1001	1900		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	124.8940	10.759	1000	8.607		3.888888888888889			4		7			1001	1890		1				1			5			24			105.0000		42.000		0.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
