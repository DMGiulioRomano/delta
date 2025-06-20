
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
f 0 148.22379250032182 ; Evento f fittizio per definire la durata totale
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
i "Voce"	0.0010	44.641	1000	27.901		5.0			1		1			1001	1		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	0.0010	39.369	1000	24.606		5.0			2		2			1001	2		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	0.0010	32.793	1000	26.234		5.0			0		2			1001	4		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	43.292	1000	27.058		5.0			2		4			1001	5		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	34.406	1000	27.525		5.0			2		3			1001	6		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	41.237	1000	25.773		5.0			2		2			1001	8		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	6.7275	30.355	1000	24.284		5.0			1		2			1001	9		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	35.134	1000	28.107		5.0			1		1			1001	10		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	41.195	1000	25.747		5.0			2		5			1001	12		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	32.452	1000	25.962		5.0			1		6			1001	13		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	13.1100	32.585	1000	20.366		5.0			1		2			1001	14		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	30.182	1000	24.145		5.0			3		2			1001	16		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	19.1475	30.885	1000	24.708		5.0			1		5			1001	20		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	37.426	1000	23.391		5.0			3		8			1001	22		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	24.8400	35.610	1000	22.256		5.0			3		6			1001	23		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	30.1875	32.809	1000	26.247		5.0			2		2			1001	24		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	30.1875	27.492	1000	21.994		5.0			4		10			1001	26		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	30.1875	32.310	1000	25.848		5.0			3		7			1001	27		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	23.833	1000	19.066		5.0			4		1			1001	29		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	38.304	1000	23.940		5.0			5		9			1001	31		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	40.368	1000	25.230		5.0			5		3			1001	32		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	35.1900	30.373	1000	18.983		5.0			4		11			1001	36		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	28.023	1000	22.419		5.0			2		2			1001	37		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	23.485	1000	18.788		5.0			2		4			1001	38		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	36.762	1000	22.977		5.0			4		11			1001	40		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	27.152	1000	21.722		5.0			2		5			1001	42		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	39.8475	24.740	1000	19.792		5.0			5		5			1001	44		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	31.494	1000	19.683		5.0			5		7			1001	45		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	35.675	1000	22.297		5.0			2		9			1001	46		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	44.1600	25.950	1000	16.218		5.0			3		8			1001	48		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	29.192	1000	23.353		5.0			6		3			1001	49		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	36.714	1000	22.946		5.0			2		2			1001	50		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	27.938	1000	22.350		5.0			3		4			1001	53		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	35.534	1000	22.209		5.0			3		5			1001	54		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	48.1275	39.233	1000	24.520		5.0			2		8			1001	56		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	22.245	1000	17.796		5.0			3		4			1001	62		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	23.374	1000	18.699		5.0			4		12			1001	63		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	51.7500	38.066	1000	23.791		5.0			5		6			1001	64		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	26.611	1000	21.289		5.0			6		4			1001	65		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	29.671	1000	23.737		5.0			4		5			1001	66		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	20.681	1000	16.545		5.0			4		4			1001	67		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	29.354	1000	18.346		5.0			5		12			1001	69		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	55.0275	19.311	1000	15.448		5.0			4		11			1001	72		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	24.046	1000	15.029		5.0			4		11			1001	75		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	26.288	1000	21.030		5.0			5		17			1001	76		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	21.248	1000	13.280		5.0			3		13			1001	79		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	31.673	1000	19.796		5.0			6		1			1001	80		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	57.9600	21.371	1000	17.097		5.0			4		8			1001	82		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	19.494	1000	15.595		5.0			3		6			1001	85		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	23.484	1000	18.787		5.0			6		14			1001	86		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	22.365	1000	17.892		5.0			6		15			1001	87		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	37.019	1000	23.137		5.0			6		2			1001	88		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	25.828	1000	20.663		5.0			5		12			1001	89		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	60.5475	26.612	1000	21.289		5.0			6		1			1001	90		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	18.205	1000	14.564		5.0			5		15			1001	93		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	24.690	1000	15.431		5.0			4		14			1001	94		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	62.7900	30.376	1000	18.985		5.0			3		7			1001	95		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	23.166	1000	18.533		5.0			7		11			1001	96		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	17.136	1000	13.708		5.0			3		2			1001	102		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	19.210	1000	12.006		5.0			5		17			1001	104		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	64.6875	32.069	1000	20.043		5.0			4		18			1001	105		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	33.851	1000	21.157		5.0			7		5			1001	106		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	26.749	1000	21.399		5.0			4		5			1001	108		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	24.711	1000	19.769		5.0			3		5			1001	109		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	23.556	1000	18.845		5.0			8		10			1001	110		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	66.2400	20.942	1000	16.754		5.0			5		8			1001	112		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	25.347	1000	20.278		5.0			3		7			1001	113		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	31.389	1000	19.618		5.0			4		13			1001	114		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	23.825	1000	19.060		5.0			5		1			1001	115		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	67.4475	31.053	1000	19.408		5.0			7		5			1001	118		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	27.649	1000	17.281		5.0			7		18			1001	119		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	29.539	1000	18.462		5.0			7		14			1001	120		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	19.507	1000	12.192		5.0			5		3			1001	121		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	18.777	1000	15.022		5.0			3		3			1001	122		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.3100	15.802	1000	12.642		5.0			6		4			1001	123		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	30.077	1000	18.798		5.0			6		3			1001	124		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	30.202	1000	18.877		5.0			4		6			1001	125		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	32.169	1000	20.106		5.0			6		12			1001	126		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	26.571	1000	16.607		5.0			4		11			1001	127		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	16.678	1000	13.342		5.0			4		7			1001	129		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	68.8275	26.472	1000	21.178		5.0			5		5			1001	130		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	4.953	1000	3.095		0.04640660780793815			7		3			1001	131		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	3.336	1000	2.085		0.04640660780793815			8		8			1001	132		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	1.018	1000	0.814		0.04640660780793815			7		5			1001	133		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	4.955	1000	3.097		0.04640660780793815			8		5			1001	135		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	2.921	1000	2.337		0.04640660780793815			6		8			1001	136		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	3.670	1000	2.936		0.04640660780793815			7		7			1001	138		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	5.412	1000	3.382		0.04640660780793815			8		4			1001	139		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	4.396	1000	3.517		0.04640660780793815			6		6			1001	140		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	1.846	1000	1.154		0.04640660780793815			8		7			1001	143		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.4037	4.122	1000	2.576		0.04640660780793815			7		8			1001	145		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	3.054	1000	1.909		0.08906402525881307			5		7			1001	146		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	3.626	1000	2.901		0.08906402525881307			8		9			1001	147		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	4.464	1000	2.790		0.08906402525881307			7		6			1001	148		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	3.173	1000	2.539		0.08906402525881307			7		2			1001	149		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	3.981	1000	3.185		0.08906402525881307			7		3			1001	151		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	1.631	1000	1.305		0.08906402525881307			6		4			1001	152		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	5.642	1000	3.526		0.08906402525881307			8		4			1001	155		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	2.893	1000	1.808		0.08906402525881307			7		1			1001	156		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	2.934	1000	2.347		0.08906402525881307			7		2			1001	157		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	4.392	1000	3.514		0.08906402525881307			7		1			1001	158		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	1.471	1000	1.177		0.08906402525881307			5		3			1001	159		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	2.580	1000	2.064		0.08906402525881307			7		4			1001	161		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	84.7749	4.140	1000	3.312		0.08906402525881307			7		9			1001	162		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.615	1000	2.892		0.2485642667304797			7		3			1001	164		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	5.638	1000	3.524		0.2485642667304797			7		4			1001	167		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.771	1000	1.107		0.2485642667304797			5		10			1001	168		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	2.641	1000	1.650		0.2485642667304797			6		10			1001	169		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.314	1000	0.821		0.2485642667304797			7		12			1001	170		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	2.654	1000	1.659		0.2485642667304797			5		12			1001	171		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	4.122	1000	2.576		0.2485642667304797			6		9			1001	172		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.768	1000	3.015		0.2485642667304797			5		5			1001	173		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	2.904	1000	2.323		0.2485642667304797			8		9			1001	174		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.393	1000	2.121		0.2485642667304797			7		12			1001	176		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.162	1000	0.930		0.2485642667304797			7		2			1001	177		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	2.199	1000	1.374		0.2485642667304797			7		5			1001	178		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.464	1000	0.915		0.2485642667304797			8		5			1001	179		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	2.407	1000	1.504		0.2485642667304797			5		11			1001	180		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	4.029	1000	3.223		0.2485642667304797			7		3			1001	181		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.379	1000	2.112		0.2485642667304797			7		11			1001	182		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.353	1000	2.096		0.2485642667304797			7		7			1001	183		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.458	1000	2.161		0.2485642667304797			5		5			1001	186		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.281	1000	2.625		0.2485642667304797			5		12			1001	187		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	5.372	1000	3.358		0.2485642667304797			6		1			1001	188		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	4.358	1000	3.487		0.2485642667304797			6		7			1001	189		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	3.096	1000	1.935		0.2485642667304797			5		7			1001	190		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	5.011	1000	3.132		0.2485642667304797			5		8			1001	192		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	4.190	1000	2.618		0.2485642667304797			8		11			1001	193		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.477	1000	1.181		0.2485642667304797			7		8			1001	194		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.739	1000	1.087		0.2485642667304797			6		4			1001	196		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.1625	1.925	1000	1.540		0.2485642667304797			7		3			1001	197		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.705	1000	1.066		0.27689053147906995			6		13			1001	198		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	4.271	1000	3.416		0.27689053147906995			6		8			1001	201		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.583	1000	1.267		0.27689053147906995			5		3			1001	206		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	3.982	1000	2.489		0.27689053147906995			6		6			1001	207		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.383	1000	0.864		0.27689053147906995			8		13			1001	209		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	2.384	1000	1.907		0.27689053147906995			8		8			1001	211		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.214	1000	0.971		0.27689053147906995			5		8			1001	212		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	2.187	1000	1.367		0.27689053147906995			6		13			1001	213		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.522	1000	1.217		0.27689053147906995			7		13			1001	214		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	1.212	1000	0.969		0.27689053147906995			6		7			1001	215		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	4.202	1000	2.626		0.27689053147906995			6		2			1001	217		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	3.874	1000	3.099		0.27689053147906995			6		7			1001	218		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	86.4089	2.292	1000	1.834		0.27689053147906995			7		11			1001	219		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.581	1000	1.264		0.3478685963250334			6		12			1001	220		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.000	1000	1.875		0.3478685963250334			6		11			1001	222		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.654	1000	1.659		0.3478685963250334			7		14			1001	223		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.970	1000	1.856		0.3478685963250334			6		7			1001	224		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.306	1000	1.045		0.3478685963250334			6		7			1001	225		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.178	1000	3.342		0.3478685963250334			6		12			1001	226		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.313	1000	3.451		0.3478685963250334			8		12			1001	228		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.805	1000	3.044		0.3478685963250334			6		1			1001	229		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.173	1000	3.339		0.3478685963250334			8		6			1001	230		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.413	1000	2.731		0.3478685963250334			7		4			1001	231		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.814	1000	3.051		0.3478685963250334			7		14			1001	232		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	5.210	1000	3.256		0.3478685963250334			6		5			1001	234		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.350	1000	0.844		0.3478685963250334			6		14			1001	235		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.233	1000	0.771		0.3478685963250334			6		4			1001	236		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.357	1000	1.085		0.3478685963250334			7		10			1001	239		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	5.575	1000	3.485		0.3478685963250334			7		14			1001	241		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.756	1000	1.097		0.3478685963250334			6		13			1001	244		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.343	1000	2.674		0.3478685963250334			5		2			1001	246		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.212	1000	0.969		0.3478685963250334			6		13			1001	247		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.468	1000	1.174		0.3478685963250334			7		5			1001	248		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	5.503	1000	3.439		0.3478685963250334			7		9			1001	250		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.223	1000	1.389		0.3478685963250334			6		7			1001	252		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.163	1000	1.352		0.3478685963250334			8		4			1001	253		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.373	1000	2.733		0.3478685963250334			8		8			1001	254		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.798	1000	2.238		0.3478685963250334			7		12			1001	257		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.391	1000	2.119		0.3478685963250334			5		2			1001	258		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.369	1000	0.856		0.3478685963250334			6		9			1001	259		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.600	1000	1.280		0.3478685963250334			7		9			1001	261		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	1.032	1000	0.826		0.3478685963250334			5		10			1001	262		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.216	1000	2.010		0.3478685963250334			6		4			1001	263		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	3.909	1000	3.127		0.3478685963250334			8		9			1001	264		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	2.655	1000	1.659		0.3478685963250334			7		14			1001	266		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.736	1000	2.960		0.3478685963250334			5		7			1001	267		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.0265	4.256	1000	2.660		0.3478685963250334			6		12			1001	269		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.512	1000	1.570		0.4179221406803506			6		10			1001	271		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	4.237	1000	3.390		0.4179221406803506			7		15			1001	272		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.793	1000	1.434		0.4179221406803506			7		10			1001	273		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.399	1000	1.119		0.4179221406803506			8		11			1001	275		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.002	1000	0.801		0.4179221406803506			8		5			1001	278		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.082	1000	0.866		0.4179221406803506			8		9			1001	279		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.192	1000	0.954		0.4179221406803506			6		3			1001	280		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.649	1000	2.119		0.4179221406803506			7		14			1001	281		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	4.234	1000	3.387		0.4179221406803506			5		7			1001	283		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.482	1000	1.551		0.4179221406803506			6		2			1001	285		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.659	1000	1.037		0.4179221406803506			5		3			1001	286		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.217	1000	0.761		0.4179221406803506			6		15			1001	287		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	4.354	1000	2.721		0.4179221406803506			5		11			1001	288		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.234	1000	1.396		0.4179221406803506			5		9			1001	289		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.740	1000	2.992		0.4179221406803506			8		1			1001	290		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.319	1000	2.075		0.4179221406803506			6		12			1001	293		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.599	1000	2.879		0.4179221406803506			7		9			1001	297		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.839	1000	1.150		0.4179221406803506			7		12			1001	298		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.992	1000	3.193		0.4179221406803506			8		13			1001	299		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.177	1000	1.360		0.4179221406803506			8		13			1001	300		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.304	1000	1.043		0.4179221406803506			5		12			1001	301		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.650	1000	1.320		0.4179221406803506			5		12			1001	302		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.629	1000	1.303		0.4179221406803506			7		6			1001	304		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	4.327	1000	2.704		0.4179221406803506			7		12			1001	305		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.344	1000	2.676		0.4179221406803506			5		9			1001	306		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.448	1000	1.959		0.4179221406803506			7		15			1001	311		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.703	1000	2.962		0.4179221406803506			7		15			1001	312		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.377	1000	2.111		0.4179221406803506			6		10			1001	313		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.977	1000	2.486		0.4179221406803506			7		14			1001	314		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.276	1000	2.621		0.4179221406803506			5		15			1001	315		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.652	1000	2.121		0.4179221406803506			5		2			1001	317		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.078	1000	1.662		0.4179221406803506			6		13			1001	318		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.075	1000	2.460		0.4179221406803506			7		5			1001	320		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.823	1000	1.764		0.4179221406803506			5		16			1001	321		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.485	1000	1.188		0.4179221406803506			6		7			1001	322		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	2.029	1000	1.268		0.4179221406803506			6		6			1001	324		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.506	1000	1.205		0.4179221406803506			7		8			1001	325		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	4.055	1000	3.244		0.4179221406803506			6		1			1001	326		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	3.415	1000	2.135		0.4179221406803506			6		14			1001	327		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6359	1.435	1000	1.148		0.4179221406803506			8		5			1001	329		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	1.430	1000	1.144		0.42272636603580604			6		9			1001	332		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	1.420	1000	1.136		0.42272636603580604			7		9			1001	333		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	1.679	1000	1.050		0.42272636603580604			8		1			1001	335		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	2.199	1000	1.374		0.42272636603580604			6		12			1001	336		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	2.838	1000	1.774		0.42272636603580604			6		10			1001	338		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	4.439	1000	2.774		0.42272636603580604			5		12			1001	339		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	3.111	1000	1.944		0.42272636603580604			5		11			1001	341		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	5.185	1000	3.241		0.42272636603580604			7		14			1001	345		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	4.285	1000	3.428		0.42272636603580604			7		8			1001	346		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	2.506	1000	1.566		0.42272636603580604			6		11			1001	347		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	1.588	1000	1.270		0.42272636603580604			7		10			1001	348		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	3.141	1000	2.512		0.42272636603580604			8		7			1001	350		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	2.664	1000	1.665		0.42272636603580604			5		16			1001	351		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.6777	4.372	1000	2.733		0.42272636603580604			6		15			1001	353		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.418	1000	2.136		0.4431742201344475			6		8			1001	354		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.357	1000	2.098		0.4431742201344475			7		3			1001	355		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	5.148	1000	3.217		0.4431742201344475			8		3			1001	356		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	1.029	1000	0.823		0.4431742201344475			7		6			1001	357		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.746	1000	2.967		0.4431742201344475			6		4			1001	358		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.758	1000	2.349		0.4431742201344475			6		13			1001	359		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.882	1000	2.305		0.4431742201344475			7		10			1001	360		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.034	1000	3.227		0.4431742201344475			6		12			1001	361		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	1.143	1000	0.915		0.4431742201344475			5		13			1001	362		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.091	1000	1.672		0.4431742201344475			7		2			1001	363		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	1.199	1000	0.959		0.4431742201344475			8		8			1001	364		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.609	1000	1.631		0.4431742201344475			6		14			1001	367		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.848	1000	3.078		0.4431742201344475			6		5			1001	368		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.217	1000	1.386		0.4431742201344475			5		13			1001	369		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	5.307	1000	3.317		0.4431742201344475			6		13			1001	370		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.561	1000	2.850		0.4431742201344475			8		3			1001	371		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.143	1000	1.339		0.4431742201344475			7		8			1001	372		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.426	1000	1.941		0.4431742201344475			5		4			1001	373		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.519	1000	1.574		0.4431742201344475			7		6			1001	374		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.261	1000	2.038		0.4431742201344475			8		16			1001	376		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.581	1000	1.613		0.4431742201344475			7		15			1001	377		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.571	1000	2.232		0.4431742201344475			5		9			1001	378		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	5.000	1000	3.125		0.4431742201344475			6		3			1001	381		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.024	1000	1.619		0.4431742201344475			6		11			1001	383		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.490	1000	2.181		0.4431742201344475			6		1			1001	384		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.865	1000	3.092		0.4431742201344475			6		5			1001	385		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	1.636	1000	1.308		0.4431742201344475			8		9			1001	386		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.455	1000	1.964		0.4431742201344475			5		14			1001	387		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.781	1000	2.988		0.4431742201344475			8		9			1001	389		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.145	1000	3.316		0.4431742201344475			8		13			1001	390		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	4.175	1000	3.340		0.4431742201344475			6		12			1001	395		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	2.776	1000	2.221		0.4431742201344475			5		5			1001	397		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8556	3.869	1000	3.095		0.4431742201344475			5		13			1001	398		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	1.620	1000	1.012		0.4474039541200854			7		12			1001	399		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	1.808	1000	1.130		0.4474039541200854			6		11			1001	400		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	1.345	1000	1.076		0.4474039541200854			5		1			1001	401		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	4.734	1000	2.959		0.4474039541200854			6		3			1001	402		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	4.279	1000	2.674		0.4474039541200854			7		11			1001	404		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	2.468	1000	1.542		0.4474039541200854			7		11			1001	405		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	3.923	1000	3.138		0.4474039541200854			7		11			1001	406		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	4.137	1000	3.310		0.4474039541200854			5		9			1001	408		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	3.469	1000	2.775		0.4474039541200854			6		13			1001	410		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	2.730	1000	2.184		0.4474039541200854			6		10			1001	411		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	4.727	1000	2.954		0.4474039541200854			6		9			1001	412		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	3.399	1000	2.124		0.4474039541200854			7		8			1001	413		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	4.351	1000	2.719		0.4474039541200854			5		10			1001	414		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	1.995	1000	1.596		0.4474039541200854			7		5			1001	415		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	87.8924	1.824	1000	1.459		0.4474039541200854			7		10			1001	416		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	2.731	1000	1.707		0.46831617797896996			8		9			1001	418		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	4.385	1000	2.741		0.46831617797896996			6		12			1001	419		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	0.956	1000	0.765		0.46831617797896996			8		2			1001	420		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	0.916	1000	0.733		0.46831617797896996			6		17			1001	422		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	1.825	1000	1.141		0.46831617797896996			8		5			1001	424		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	2.166	1000	1.732		0.46831617797896996			8		11			1001	426		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	3.673	1000	2.295		0.46831617797896996			7		8			1001	429		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	2.623	1000	1.639		0.46831617797896996			7		13			1001	430		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	1.865	1000	1.166		0.46831617797896996			7		7			1001	432		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	2.082	1000	1.301		0.46831617797896996			6		5			1001	433		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	1.746	1000	1.396		0.46831617797896996			8		16			1001	434		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	1.918	1000	1.534		0.46831617797896996			5		11			1001	439		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	1.972	1000	1.577		0.46831617797896996			6		17			1001	440		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	88.0744	3.195	1000	2.556		0.46831617797896996			6		6			1001	443		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	1.262	1000	1.009		0.7363520646777861			6		4			1001	444		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	2.047	1000	1.638		0.7363520646777861			8		20			1001	445		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	2.592	1000	2.073		0.7363520646777861			7		9			1001	446		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	2.286	1000	1.829		0.7363520646777861			7		19			1001	447		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	1.930	1000	1.544		0.7363520646777861			6		8			1001	449		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	2.851	1000	1.782		0.7363520646777861			6		18			1001	452		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	3.253	1000	2.033		0.7363520646777861			8		14			1001	453		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	4.411	1000	2.757		0.7363520646777861			6		16			1001	454		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	4.320	1000	2.700		0.7363520646777861			7		17			1001	456		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	3.156	1000	1.972		0.7363520646777861			7		15			1001	457		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	1.334	1000	1.067		0.7363520646777861			7		22			1001	458		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	1.351	1000	1.081		0.7363520646777861			8		16			1001	459		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4063	1.631	1000	1.019		0.7363520646777861			8		10			1001	460		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	4.952	1000	3.095		0.7455552993129644			7		22			1001	461		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	2.463	1000	1.970		0.7455552993129644			5		15			1001	462		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	3.018	1000	1.886		0.7455552993129644			6		22			1001	464		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	3.297	1000	2.638		0.7455552993129644			7		8			1001	465		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	3.542	1000	2.214		0.7455552993129644			5		7			1001	466		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	1.251	1000	0.782		0.7455552993129644			7		3			1001	467		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	3.410	1000	2.728		0.7455552993129644			6		15			1001	469		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	4.354	1000	2.721		0.7455552993129644			7		8			1001	470		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	1.818	1000	1.137		0.7455552993129644			7		2			1001	473		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	2.080	1000	1.664		0.7455552993129644			6		10			1001	476		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	2.394	1000	1.496		0.7455552993129644			5		7			1001	477		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.4863	3.967	1000	3.174		0.7455552993129644			8		1			1001	478		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.440	1000	2.775		0.7576822978963524			5		20			1001	481		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	1.194	1000	0.955		0.7576822978963524			5		2			1001	482		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	1.673	1000	1.339		0.7576822978963524			5		11			1001	483		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	2.321	1000	1.857		0.7576822978963524			7		16			1001	484		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	2.396	1000	1.917		0.7576822978963524			7		21			1001	485		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.395	1000	2.747		0.7576822978963524			7		3			1001	487		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	1.420	1000	1.136		0.7576822978963524			6		6			1001	488		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	3.587	1000	2.870		0.7576822978963524			5		7			1001	489		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.961	1000	3.101		0.7576822978963524			7		15			1001	491		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	3.929	1000	3.143		0.7576822978963524			8		12			1001	492		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.064	1000	2.540		0.7576822978963524			7		20			1001	495		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.866	1000	3.041		0.7576822978963524			7		23			1001	496		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	2.088	1000	1.305		0.7576822978963524			6		23			1001	498		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	2.489	1000	1.556		0.7576822978963524			5		8			1001	499		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	1.176	1000	0.940		0.7576822978963524			7		21			1001	500		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	4.970	1000	3.106		0.7576822978963524			5		21			1001	501		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.5918	1.938	1000	1.211		0.7576822978963524			8		8			1001	503		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.110	1000	1.319		0.7833083989574499			7		6			1001	504		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.497	1000	2.186		0.7833083989574499			6		19			1001	505		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.662	1000	2.289		0.7833083989574499			5		8			1001	511		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.503	1000	2.002		0.7833083989574499			6		18			1001	513		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.706	1000	2.165		0.7833083989574499			7		14			1001	515		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.982	1000	1.864		0.7833083989574499			8		17			1001	516		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.787	1000	2.229		0.7833083989574499			6		22			1001	517		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.787	1000	2.367		0.7833083989574499			7		3			1001	519		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.188	1000	2.550		0.7833083989574499			8		4			1001	520		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.181	1000	0.738		0.7833083989574499			6		22			1001	521		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.400	1000	0.875		0.7833083989574499			6		24			1001	522		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.645	1000	2.278		0.7833083989574499			7		1			1001	523		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.080	1000	1.300		0.7833083989574499			6		18			1001	524		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.192	1000	2.620		0.7833083989574499			6		21			1001	525		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.709	1000	2.943		0.7833083989574499			8		20			1001	531		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.986	1000	3.116		0.7833083989574499			6		19			1001	532		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.056	1000	0.844		0.7833083989574499			5		19			1001	533		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	0.986	1000	0.789		0.7833083989574499			6		20			1001	534		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.108	1000	0.887		0.7833083989574499			5		9			1001	535		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.716	1000	2.947		0.7833083989574499			6		1			1001	536		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.358	1000	1.886		0.7833083989574499			6		7			1001	539		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.758	1000	1.099		0.7833083989574499			7		22			1001	540		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.562	1000	2.226		0.7833083989574499			7		15			1001	541		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.657	1000	1.326		0.7833083989574499			6		20			1001	542		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.446	1000	0.904		0.7833083989574499			6		21			1001	543		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.856	1000	3.035		0.7833083989574499			5		16			1001	547		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.721	1000	1.075		0.7833083989574499			6		20			1001	548		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.916	1000	3.133		0.7833083989574499			7		1			1001	549		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.490	1000	2.792		0.7833083989574499			8		2			1001	551		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.449	1000	0.906		0.7833083989574499			6		10			1001	553		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.185	1000	1.748		0.7833083989574499			5		16			1001	554		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.142	1000	1.964		0.7833083989574499			6		12			1001	555		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.396	1000	1.917		0.7833083989574499			8		22			1001	557		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.629	1000	2.893		0.7833083989574499			7		10			1001	558		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	4.316	1000	2.698		0.7833083989574499			7		9			1001	561		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.274	1000	1.819		0.7833083989574499			8		18			1001	564		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	3.536	1000	2.210		0.7833083989574499			8		20			1001	565		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	2.206	1000	1.765		0.7833083989574499			6		24			1001	566		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.843	1000	1.474		0.7833083989574499			6		24			1001	567		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	90.8148	1.467	1000	0.917		0.7833083989574499			7		13			1001	568		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.665	1000	2.932		0.8345301279794997			7		6			1001	570		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	4.352	1000	2.720		0.8345301279794997			6		2			1001	571		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	4.556	1000	2.847		0.8345301279794997			6		17			1001	572		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.056	1000	1.285		0.8345301279794997			7		3			1001	573		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.806	1000	2.245		0.8345301279794997			6		7			1001	574		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.855	1000	2.409		0.8345301279794997			7		15			1001	577		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.744	1000	2.195		0.8345301279794997			6		4			1001	581		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.765	1000	1.412		0.8345301279794997			8		13			1001	583		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.714	1000	1.371		0.8345301279794997			6		7			1001	584		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.353	1000	2.096		0.8345301279794997			6		2			1001	586		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.198	1000	0.959		0.8345301279794997			6		16			1001	588		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.878	1000	2.302		0.8345301279794997			6		24			1001	589		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.365	1000	1.478		0.8345301279794997			6		5			1001	590		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.720	1000	1.075		0.8345301279794997			5		2			1001	591		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.934	1000	1.547		0.8345301279794997			5		9			1001	594		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.556	1000	2.845		0.8345301279794997			5		11			1001	595		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.644	1000	1.652		0.8345301279794997			8		9			1001	597		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.913	1000	1.821		0.8345301279794997			6		19			1001	598		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.480	1000	1.984		0.8345301279794997			6		15			1001	599		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	4.570	1000	2.856		0.8345301279794997			7		2			1001	601		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.713	1000	2.321		0.8345301279794997			7		20			1001	602		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.764	1000	1.727		0.8345301279794997			6		8			1001	604		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.203	1000	1.377		0.8345301279794997			8		4			1001	605		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.732	1000	1.707		0.8345301279794997			6		6			1001	607		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.796	1000	3.037		0.8345301279794997			6		12			1001	608		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.077	1000	2.461		0.8345301279794997			8		24			1001	611		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.790	1000	1.432		0.8345301279794997			6		4			1001	612		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.424	1000	1.939		0.8345301279794997			7		9			1001	613		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	2.767	1000	2.214		0.8345301279794997			8		22			1001	614		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.058	1000	0.846		0.8345301279794997			6		3			1001	615		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.306	1000	1.045		0.8345301279794997			7		15			1001	616		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.452	1000	2.157		0.8345301279794997			6		5			1001	618		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	4.930	1000	3.081		0.8345301279794997			7		12			1001	620		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.207	1000	0.754		0.8345301279794997			7		21			1001	621		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.589	1000	2.871		0.8345301279794997			6		15			1001	622		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	4.443	1000	2.777		0.8345301279794997			7		18			1001	624		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.652	1000	1.322		0.8345301279794997			7		18			1001	625		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	1.044	1000	0.835		0.8345301279794997			6		17			1001	627		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.083	1000	2.467		0.8345301279794997			7		7			1001	628		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.2604	3.387	1000	2.709		0.8345301279794997			7		2			1001	629		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.677	1000	2.923		0.8676055545387695			7		13			1001	630		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	1.978	1000	1.236		0.8676055545387695			5		3			1001	631		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.362	1000	2.726		0.8676055545387695			6		12			1001	632		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.620	1000	2.096		0.8676055545387695			6		12			1001	633		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.530	1000	2.831		0.8676055545387695			7		12			1001	634		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.713	1000	2.170		0.8676055545387695			5		7			1001	635		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.053	1000	1.283		0.8676055545387695			5		14			1001	637		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.994	1000	1.871		0.8676055545387695			6		17			1001	638		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.585	1000	1.615		0.8676055545387695			7		25			1001	639		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	3.181	1000	2.545		0.8676055545387695			8		6			1001	640		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.025	1000	2.516		0.8676055545387695			6		1			1001	641		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.464	1000	2.790		0.8676055545387695			7		2			1001	642		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.849	1000	1.781		0.8676055545387695			6		1			1001	647		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.379	1000	2.737		0.8676055545387695			6		19			1001	653		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.946	1000	2.357		0.8676055545387695			5		4			1001	655		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.907	1000	2.326		0.8676055545387695			8		9			1001	656		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.057	1000	1.286		0.8676055545387695			8		17			1001	659		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.836	1000	2.269		0.8676055545387695			5		6			1001	660		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.195	1000	1.372		0.8676055545387695			5		4			1001	661		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	4.363	1000	2.727		0.8676055545387695			7		15			1001	663		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	1.740	1000	1.088		0.8676055545387695			6		1			1001	664		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.050	1000	1.640		0.8676055545387695			7		5			1001	666		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.864	1000	1.790		0.8676055545387695			7		8			1001	668		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	1.807	1000	1.446		0.8676055545387695			8		11			1001	671		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.424	1000	1.939		0.8676055545387695			7		3			1001	672		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	1.219	1000	0.975		0.8676055545387695			7		10			1001	673		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.179	1000	1.362		0.8676055545387695			5		10			1001	674		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	2.472	1000	1.978		0.8676055545387695			8		12			1001	675		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	91.5482	3.745	1000	2.996		0.8676055545387695			6		1			1001	677		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	1.982	1000	1.239		1.005578738245915			6		11			1001	678		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	4.508	1000	2.817		1.005578738245915			6		15			1001	679		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.546	1000	2.837		1.005578738245915			6		28			1001	680		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.073	1000	1.921		1.005578738245915			6		26			1001	681		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.300	1000	2.640		1.005578738245915			7		24			1001	682		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	1.932	1000	1.545		1.005578738245915			5		3			1001	684		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	1.364	1000	1.091		1.005578738245915			5		23			1001	685		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	1.783	1000	1.426		1.005578738245915			8		7			1001	686		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.460	1000	2.768		1.005578738245915			6		16			1001	688		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.425	1000	2.141		1.005578738245915			6		12			1001	689		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	1.878	1000	1.503		1.005578738245915			7		10			1001	691		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.7485	3.427	1000	2.142		1.005578738245915			7		14			1001	692		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.628	1000	2.268		1.0121973179494417			5		18			1001	693		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.820	1000	1.456		1.0121973179494417			7		7			1001	695		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	2.502	1000	1.564		1.0121973179494417			7		4			1001	699		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.667	1000	2.292		1.0121973179494417			6		7			1001	701		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.581	1000	2.238		1.0121973179494417			7		3			1001	702		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.248	1000	0.780		1.0121973179494417			6		27			1001	704		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	0.971	1000	0.777		1.0121973179494417			8		7			1001	705		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.293	1000	1.034		1.0121973179494417			6		28			1001	706		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	4.129	1000	2.580		1.0121973179494417			6		6			1001	708		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.228	1000	0.983		1.0121973179494417			8		24			1001	712		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.366	1000	0.853		1.0121973179494417			6		15			1001	714		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.683	1000	1.052		1.0121973179494417			6		8			1001	715		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.224	1000	0.979		1.0121973179494417			6		10			1001	717		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.559	1000	0.974		1.0121973179494417			5		6			1001	719		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.725	1000	1.380		1.0121973179494417			7		17			1001	722		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	4.129	1000	2.580		1.0121973179494417			7		25			1001	723		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.334	1000	2.667		1.0121973179494417			8		19			1001	725		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.195	1000	0.747		1.0121973179494417			7		22			1001	726		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.498	1000	1.198		1.0121973179494417			6		3			1001	728		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.851	1000	1.157		1.0121973179494417			8		11			1001	729		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	2.936	1000	1.835		1.0121973179494417			8		12			1001	731		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.686	1000	2.949		1.0121973179494417			5		12			1001	732		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	2.882	1000	1.801		1.0121973179494417			7		19			1001	733		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.520	1000	2.200		1.0121973179494417			6		25			1001	734		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	3.964	1000	2.478		1.0121973179494417			6		4			1001	736		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.031	1000	0.825		1.0121973179494417			8		1			1001	737		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.569	1000	0.981		1.0121973179494417			8		7			1001	739		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	4.545	1000	2.841		1.0121973179494417			6		15			1001	740		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.175	1000	0.940		1.0121973179494417			7		24			1001	742		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	1.044	1000	0.836		1.0121973179494417			5		14			1001	743		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	4.715	1000	2.947		1.0121973179494417			5		14			1001	744		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	92.8061	2.146	1000	1.341		1.0121973179494417			5		3			1001	746		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	1.725	1000	1.380		1.0444572758075563			7		9			1001	748		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	3.595	1000	2.247		1.0444572758075563			6		1			1001	750		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	1.764	1000	1.103		1.0444572758075563			8		10			1001	752		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	3.534	1000	2.827		1.0444572758075563			7		2			1001	754		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	2.917	1000	2.334		1.0444572758075563			6		26			1001	755		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	2.086	1000	1.669		1.0444572758075563			6		17			1001	759		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	1.633	1000	1.307		1.0444572758075563			5		26			1001	760		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	4.603	1000	2.877		1.0444572758075563			6		18			1001	762		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	1.732	1000	1.083		1.0444572758075563			6		24			1001	763		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	3.203	1000	2.562		1.0444572758075563			6		19			1001	764		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.0868	3.846	1000	2.404		1.0444572758075563			7		27			1001	765		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	1.910	1000	1.194		1.0680030488921615			6		19			1001	766		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	1.553	1000	0.971		1.0680030488921615			6		4			1001	767		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	4.362	1000	2.726		1.0680030488921615			7		28			1001	768		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	1.572	1000	1.258		1.0680030488921615			6		14			1001	769		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	1.149	1000	0.919		1.0680030488921615			7		9			1001	771		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	3.541	1000	2.213		1.0680030488921615			7		14			1001	773		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	3.945	1000	2.466		1.0680030488921615			6		21			1001	774		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	4.116	1000	2.573		1.0680030488921615			7		29			1001	775		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	2.396	1000	1.917		1.0680030488921615			6		18			1001	776		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	3.374	1000	2.700		1.0680030488921615			6		16			1001	777		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.2916	3.080	1000	1.925		1.0680030488921615			6		16			1001	778		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	3.285	1000	2.628		1.0885880664847578			7		29			1001	779		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	1.717	1000	1.373		1.0885880664847578			8		15			1001	780		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.190	1000	1.369		1.0885880664847578			5		3			1001	781		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.711	1000	2.169		1.0885880664847578			8		17			1001	783		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	1.861	1000	1.163		1.0885880664847578			5		14			1001	784		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.137	1000	1.336		1.0885880664847578			7		21			1001	792		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	3.082	1000	2.466		1.0885880664847578			7		8			1001	793		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.542	1000	2.033		1.0885880664847578			6		17			1001	794		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	1.896	1000	1.517		1.0885880664847578			8		23			1001	795		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.472	1000	1.978		1.0885880664847578			8		19			1001	796		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	3.132	1000	2.506		1.0885880664847578			6		7			1001	797		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	1.622	1000	1.014		1.0885880664847578			7		1			1001	798		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	1.800	1000	1.440		1.0885880664847578			5		7			1001	799		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.4707	2.902	1000	2.321		1.0885880664847578			7		6			1001	800		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.528	1000	2.823		1.1188643689269302			8		18			1001	802		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.220	1000	1.776		1.1188643689269302			6		18			1001	803		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.233	1000	0.771		1.1188643689269302			8		15			1001	804		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.299	1000	2.062		1.1188643689269302			5		24			1001	805		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.056	1000	1.645		1.1188643689269302			6		25			1001	806		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.520	1000	2.200		1.1188643689269302			7		29			1001	808		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.102	1000	1.681		1.1188643689269302			7		8			1001	809		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.725	1000	1.703		1.1188643689269302			7		25			1001	812		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.309	1000	1.847		1.1188643689269302			6		12			1001	813		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.248	1000	1.799		1.1188643689269302			7		25			1001	814		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.346	1000	1.466		1.1188643689269302			5		7			1001	815		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.583	1000	2.866		1.1188643689269302			8		1			1001	816		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.742	1000	1.394		1.1188643689269302			7		28			1001	817		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.643	1000	2.114		1.1188643689269302			7		23			1001	818		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.141	1000	0.913		1.1188643689269302			6		17			1001	819		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.959	1000	1.567		1.1188643689269302			6		28			1001	821		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	4.477	1000	2.798		1.1188643689269302			7		24			1001	826		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	4.178	1000	2.611		1.1188643689269302			6		23			1001	827		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.272	1000	1.818		1.1188643689269302			6		26			1001	829		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.143	1000	0.915		1.1188643689269302			7		17			1001	830		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	4.563	1000	2.852		1.1188643689269302			6		20			1001	831		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.177	1000	1.741		1.1188643689269302			7		9			1001	834		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.723	1000	2.179		1.1188643689269302			7		19			1001	838		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	4.046	1000	2.528		1.1188643689269302			8		1			1001	839		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.489	1000	1.556		1.1188643689269302			6		6			1001	840		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.905	1000	1.524		1.1188643689269302			8		24			1001	842		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.579	1000	1.263		1.1188643689269302			7		5			1001	843		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.923	1000	1.538		1.1188643689269302			5		15			1001	844		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.276	1000	0.797		1.1188643689269302			7		24			1001	846		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.062	1000	2.450		1.1188643689269302			8		2			1001	849		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.176	1000	1.741		1.1188643689269302			7		6			1001	850		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.487	1000	1.554		1.1188643689269302			7		14			1001	851		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.408	1000	1.927		1.1188643689269302			8		20			1001	852		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	1.148	1000	0.918		1.1188643689269302			7		13			1001	853		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	3.027	1000	2.421		1.1188643689269302			7		14			1001	854		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.208	1000	1.766		1.1188643689269302			5		24			1001	855		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	93.7341	2.457	1000	1.536		1.1188643689269302			5		30			1001	858		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	2.896	1000	2.317		1.1633984887779238			7		24			1001	860		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	2.294	1000	1.835		1.1633984887779238			6		7			1001	861		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	2.078	1000	1.298		1.1633984887779238			7		15			1001	864		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	1.320	1000	0.825		1.1633984887779238			6		14			1001	866		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	4.510	1000	2.819		1.1633984887779238			6		27			1001	867		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	3.050	1000	2.440		1.1633984887779238			8		5			1001	868		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	3.334	1000	2.667		1.1633984887779238			6		5			1001	869		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	3.346	1000	2.091		1.1633984887779238			6		12			1001	870		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	3.644	1000	2.277		1.1633984887779238			6		15			1001	871		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	2.561	1000	2.049		1.1633984887779238			5		24			1001	873		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1216	1.493	1000	1.194		1.1633984887779238			6		17			1001	874		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.041	1000	1.901		1.1680739814416357			7		8			1001	875		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.479	1000	2.175		1.1680739814416357			8		28			1001	876		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.863	1000	1.790		1.1680739814416357			6		20			1001	878		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.728	1000	1.705		1.1680739814416357			6		14			1001	879		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.475	1000	2.780		1.1680739814416357			8		23			1001	881		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.562	1000	2.850		1.1680739814416357			7		22			1001	882		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.524	1000	2.203		1.1680739814416357			7		8			1001	884		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.815	1000	1.759		1.1680739814416357			7		28			1001	886		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	1.398	1000	1.118		1.1680739814416357			5		26			1001	887		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	1.996	1000	1.596		1.1680739814416357			5		12			1001	888		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.189	1000	1.993		1.1680739814416357			5		27			1001	889		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.351	1000	1.469		1.1680739814416357			7		16			1001	890		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	0.906	1000	0.725		1.1680739814416357			5		12			1001	891		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	3.066	1000	2.452		1.1680739814416357			7		32			1001	892		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.941	1000	2.353		1.1680739814416357			7		24			1001	893		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.1622	2.127	1000	1.329		1.1680739814416357			5		1			1001	894		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.114	1000	2.491		1.2224634174164368			6		9			1001	895		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.621	1000	2.097		1.2224634174164368			6		3			1001	896		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.835	1000	1.772		1.2224634174164368			8		4			1001	899		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.172	1000	2.538		1.2224634174164368			8		8			1001	903		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	1.909	1000	1.527		1.2224634174164368			8		33			1001	905		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.535	1000	1.585		1.2224634174164368			8		18			1001	906		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.366	1000	2.693		1.2224634174164368			6		10			1001	907		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	4.342	1000	2.714		1.2224634174164368			8		16			1001	908		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	1.450	1000	1.160		1.2224634174164368			7		23			1001	909		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.253	1000	2.033		1.2224634174164368			6		19			1001	910		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.402	1000	2.126		1.2224634174164368			6		22			1001	911		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.621	1000	2.097		1.2224634174164368			6		27			1001	913		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.392	1000	2.714		1.2224634174164368			6		2			1001	914		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.467	1000	1.542		1.2224634174164368			5		5			1001	916		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.387	1000	1.910		1.2224634174164368			8		31			1001	918		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	2.174	1000	1.740		1.2224634174164368			6		9			1001	921		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	1.521	1000	0.951		1.2224634174164368			8		32			1001	922		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	1.517	1000	1.213		1.2224634174164368			6		29			1001	924		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	1.888	1000	1.510		1.2224634174164368			6		21			1001	925		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	94.6354	3.288	1000	2.631		1.2224634174164368			6		9			1001	926		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	3.732	1000	2.333		1.2699823160789012			5		26			1001	929		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.865	1000	1.791		1.2699823160789012			6		8			1001	930		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.639	1000	1.649		1.2699823160789012			5		33			1001	931		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.614	1000	2.091		1.2699823160789012			7		16			1001	932		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.017	1000	1.261		1.2699823160789012			8		27			1001	935		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.453	1000	1.533		1.2699823160789012			8		29			1001	937		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	2.964	1000	1.852		1.2699823160789012			6		14			1001	938		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	1.937	1000	1.550		1.2699823160789012			6		28			1001	940		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	3.043	1000	2.435		1.2699823160789012			5		25			1001	941		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0488	1.307	1000	0.817		1.2699823160789012			8		10			1001	942		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.614	1000	1.291		1.2724033927481315			5		1			1001	945		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.203	1000	1.762		1.2724033927481315			8		18			1001	946		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.259	1000	2.037		1.2724033927481315			5		1			1001	949		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.300	1000	1.040		1.2724033927481315			6		1			1001	950		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	4.100	1000	2.562		1.2724033927481315			8		28			1001	952		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.933	1000	2.347		1.2724033927481315			8		17			1001	953		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.924	1000	2.339		1.2724033927481315			7		18			1001	954		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.300	1000	1.040		1.2724033927481315			6		17			1001	955		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.255	1000	0.784		1.2724033927481315			8		7			1001	956		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	4.265	1000	2.665		1.2724033927481315			7		7			1001	957		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.996	1000	1.872		1.2724033927481315			6		3			1001	959		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.476	1000	2.172		1.2724033927481315			7		29			1001	960		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.477	1000	2.173		1.2724033927481315			7		31			1001	962		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.562	1000	2.226		1.2724033927481315			6		31			1001	965		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	4.039	1000	2.524		1.2724033927481315			7		22			1001	968		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.513	1000	0.946		1.2724033927481315			7		34			1001	969		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	0.924	1000	0.739		1.2724033927481315			6		4			1001	972		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.137	1000	1.335		1.2724033927481315			7		12			1001	974		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.782	1000	1.426		1.2724033927481315			7		9			1001	975		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.591	1000	1.619		1.2724033927481315			7		2			1001	977		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	4.346	1000	2.716		1.2724033927481315			5		28			1001	978		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.623	1000	1.298		1.2724033927481315			7		27			1001	979		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.840	1000	1.472		1.2724033927481315			6		29			1001	980		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.231	1000	2.585		1.2724033927481315			6		29			1001	981		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.238	1000	1.399		1.2724033927481315			5		22			1001	982		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.896	1000	1.185		1.2724033927481315			7		5			1001	986		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	3.473	1000	2.778		1.2724033927481315			6		4			1001	988		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.711	1000	2.169		1.2724033927481315			6		21			1001	991		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.883	1000	2.306		1.2724033927481315			6		23			1001	992		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	2.868	1000	2.294		1.2724033927481315			5		30			1001	993		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.518	1000	1.214		1.2724033927481315			5		9			1001	996		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	1.214	1000	0.971		1.2724033927481315			6		21			1001	998		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.0699	4.053	1000	2.533		1.2724033927481315			8		1			1001	999		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.688	1000	1.351		1.31035668335961			7		3			1001	1000		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.898	1000	2.319		1.31035668335961			5		11			1001	1001		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	3.313	1000	2.650		1.31035668335961			6		2			1001	1002		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.511	1000	1.569		1.31035668335961			6		25			1001	1003		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.902	1000	2.321		1.31035668335961			7		21			1001	1004		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.222	1000	0.977		1.31035668335961			6		23			1001	1006		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.986	1000	1.589		1.31035668335961			5		2			1001	1007		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.824	1000	1.140		1.31035668335961			7		25			1001	1008		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.186	1000	1.748		1.31035668335961			6		16			1001	1009		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.675	1000	2.140		1.31035668335961			8		5			1001	1010		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.887	1000	2.310		1.31035668335961			8		20			1001	1013		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	4.074	1000	2.546		1.31035668335961			7		29			1001	1014		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.744	1000	1.395		1.31035668335961			6		6			1001	1015		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.364	1000	0.853		1.31035668335961			8		16			1001	1016		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	3.072	1000	1.920		1.31035668335961			6		30			1001	1021		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.267	1000	1.814		1.31035668335961			7		23			1001	1022		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.072	1000	1.657		1.31035668335961			6		1			1001	1024		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.447	1000	1.529		1.31035668335961			8		22			1001	1025		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	3.433	1000	2.746		1.31035668335961			7		9			1001	1027		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.126	1000	0.704		1.31035668335961			7		32			1001	1028		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.986	1000	1.866		1.31035668335961			8		17			1001	1030		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.882	1000	2.306		1.31035668335961			7		14			1001	1031		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.942	1000	1.214		1.31035668335961			7		1			1001	1032		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.707	1000	1.067		1.31035668335961			6		1			1001	1034		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.017	1000	1.614		1.31035668335961			7		8			1001	1035		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	1.576	1000	1.261		1.31035668335961			7		20			1001	1036		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.955	1000	1.847		1.31035668335961			6		21			1001	1038		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.4001	2.089	1000	1.306		1.31035668335961			6		32			1001	1040		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.048	1000	2.438		1.3654339006960832			6		35			1001	1043		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.827	1000	2.262		1.3654339006960832			7		23			1001	1044		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.008	1000	1.880		1.3654339006960832			5		3			1001	1045		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.695	1000	1.356		1.3654339006960832			5		9			1001	1046		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.812	1000	2.383		1.3654339006960832			6		31			1001	1047		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.625	1000	1.300		1.3654339006960832			7		10			1001	1048		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	0.964	1000	0.771		1.3654339006960832			7		12			1001	1051		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	4.335	1000	2.710		1.3654339006960832			8		29			1001	1053		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.999	1000	1.875		1.3654339006960832			6		10			1001	1054		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.324	1000	2.077		1.3654339006960832			6		26			1001	1055		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.122	1000	2.497		1.3654339006960832			7		4			1001	1056		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.888	1000	2.430		1.3654339006960832			7		18			1001	1057		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.584	1000	2.067		1.3654339006960832			5		5			1001	1058		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.137	1000	2.510		1.3654339006960832			7		22			1001	1060		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.253	1000	1.802		1.3654339006960832			7		35			1001	1062		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.042	1000	1.634		1.3654339006960832			8		1			1001	1063		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.027	1000	1.622		1.3654339006960832			6		27			1001	1065		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.286	1000	2.629		1.3654339006960832			6		19			1001	1066		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.139	1000	2.511		1.3654339006960832			7		30			1001	1067		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.251	1000	1.000		1.3654339006960832			5		34			1001	1069		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.431	1000	2.144		1.3654339006960832			5		3			1001	1070		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.674	1000	2.296		1.3654339006960832			6		30			1001	1071		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.280	1000	2.050		1.3654339006960832			8		5			1001	1074		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.871	1000	1.169		1.3654339006960832			6		9			1001	1075		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.298	1000	1.436		1.3654339006960832			5		4			1001	1078		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.791	1000	1.745		1.3654339006960832			7		18			1001	1079		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.104	1000	1.315		1.3654339006960832			8		20			1001	1081		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.906	1000	1.816		1.3654339006960832			7		11			1001	1082		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	4.066	1000	2.541		1.3654339006960832			6		34			1001	1083		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.119	1000	2.495		1.3654339006960832			6		3			1001	1087		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.251	1000	0.782		1.3654339006960832			5		24			1001	1088		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.323	1000	1.452		1.3654339006960832			7		7			1001	1090		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.555	1000	2.044		1.3654339006960832			6		17			1001	1091		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	4.230	1000	2.644		1.3654339006960832			5		9			1001	1092		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	1.433	1000	1.146		1.3654339006960832			7		21			1001	1094		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.541	1000	2.213		1.3654339006960832			6		35			1001	1095		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	3.367	1000	2.104		1.3654339006960832			6		9			1001	1096		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.547	1000	1.592		1.3654339006960832			7		19			1001	1097		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	95.8793	2.627	1000	2.101		1.3654339006960832			6		29			1001	1100		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.246	1000	1.797		1.386798091654487			6		35			1001	1103		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.984	1000	2.387		1.386798091654487			8		2			1001	1105		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.854	1000	2.283		1.386798091654487			7		13			1001	1106		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.156	1000	1.725		1.386798091654487			7		2			1001	1107		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.210	1000	2.006		1.386798091654487			7		20			1001	1109		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.928	1000	2.342		1.386798091654487			7		13			1001	1110		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.302	1000	1.042		1.386798091654487			7		5			1001	1112		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.464	1000	1.540		1.386798091654487			7		23			1001	1113		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.018	1000	1.614		1.386798091654487			8		29			1001	1114		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.214	1000	2.572		1.386798091654487			7		1			1001	1116		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.571	1000	1.257		1.386798091654487			7		9			1001	1117		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.888	1000	1.510		1.386798091654487			5		21			1001	1118		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.011	1000	2.409		1.386798091654487			7		15			1001	1119		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.631	1000	1.305		1.386798091654487			8		34			1001	1120		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.926	1000	1.829		1.386798091654487			6		29			1001	1122		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.019	1000	1.615		1.386798091654487			6		18			1001	1124		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.161	1000	1.976		1.386798091654487			6		9			1001	1125		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.007	1000	1.879		1.386798091654487			6		15			1001	1127		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.860	1000	1.488		1.386798091654487			6		19			1001	1129		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.377	1000	2.111		1.386798091654487			5		21			1001	1132		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.155	1000	1.724		1.386798091654487			7		11			1001	1133		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.270	1000	1.016		1.386798091654487			8		19			1001	1134		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.437	1000	1.523		1.386798091654487			8		14			1001	1135		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.320	1000	2.075		1.386798091654487			6		27			1001	1136		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.798	1000	2.239		1.386798091654487			6		29			1001	1139		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	0.892	1000	0.714		1.386798091654487			7		18			1001	1142		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.932	1000	1.833		1.386798091654487			6		34			1001	1146		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.292	1000	1.034		1.386798091654487			8		18			1001	1147		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.317	1000	2.653		1.386798091654487			6		5			1001	1148		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.015	1000	2.412		1.386798091654487			8		23			1001	1149		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.262	1000	1.810		1.386798091654487			7		17			1001	1151		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.878	1000	1.174		1.386798091654487			7		27			1001	1152		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	1.078	1000	0.862		1.386798091654487			8		12			1001	1153		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.249	1000	1.800		1.386798091654487			6		35			1001	1154		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	2.191	1000	1.753		1.386798091654487			8		13			1001	1155		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.854	1000	2.409		1.386798091654487			6		9			1001	1156		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0651	3.073	1000	1.921		1.386798091654487			8		8			1001	1157		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.209	1000	1.381		1.3906410817238295			6		14			1001	1158		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.797	1000	1.438		1.3906410817238295			7		35			1001	1160		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.273	1000	0.796		1.3906410817238295			7		32			1001	1161		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.540	1000	1.587		1.3906410817238295			7		20			1001	1162		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.188	1000	0.950		1.3906410817238295			6		10			1001	1163		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.807	1000	1.130		1.3906410817238295			6		12			1001	1164		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.367	1000	2.693		1.3906410817238295			8		35			1001	1165		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.308	1000	1.046		1.3906410817238295			6		29			1001	1166		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.263	1000	1.810		1.3906410817238295			7		2			1001	1167		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.817	1000	1.453		1.3906410817238295			6		26			1001	1169		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.549	1000	1.239		1.3906410817238295			6		27			1001	1171		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.375	1000	1.900		1.3906410817238295			5		16			1001	1172		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.197	1000	1.373		1.3906410817238295			6		10			1001	1173		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.313	1000	1.851		1.3906410817238295			8		17			1001	1174		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.333	1000	1.458		1.3906410817238295			7		11			1001	1178		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.366	1000	2.693		1.3906410817238295			6		3			1001	1179		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	4.245	1000	2.653		1.3906410817238295			8		32			1001	1182		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.127	1000	0.704		1.3906410817238295			8		34			1001	1183		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.631	1000	2.105		1.3906410817238295			6		23			1001	1184		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.000	1000	1.600		1.3906410817238295			7		33			1001	1185		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.696	1000	1.060		1.3906410817238295			7		22			1001	1186		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.904	1000	1.815		1.3906410817238295			6		24			1001	1187		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.215	1000	0.972		1.3906410817238295			7		2			1001	1188		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.343	1000	0.839		1.3906410817238295			8		9			1001	1189		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.888	1000	2.430		1.3906410817238295			7		18			1001	1190		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.975	1000	1.234		1.3906410817238295			5		26			1001	1191		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.591	1000	1.619		1.3906410817238295			7		27			1001	1192		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.586	1000	1.617		1.3906410817238295			6		27			1001	1193		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.908	1000	2.327		1.3906410817238295			8		1			1001	1194		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	2.612	1000	2.090		1.3906410817238295			5		35			1001	1195		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.903	1000	2.439		1.3906410817238295			8		18			1001	1196		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.088	1000	2.471		1.3906410817238295			7		29			1001	1197		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.335	1000	0.834		1.3906410817238295			7		18			1001	1199		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.046	1000	0.837		1.3906410817238295			7		4			1001	1200		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.630	1000	1.304		1.3906410817238295			5		5			1001	1202		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.457	1000	1.166		1.3906410817238295			7		31			1001	1203		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	3.834	1000	2.396		1.3906410817238295			7		17			1001	1204		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.0986	1.650	1000	1.320		1.3906410817238295			7		18			1001	1205		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.899	1000	2.319		1.4105544338635183			7		32			1001	1206		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.334	1000	1.867		1.4105544338635183			6		3			1001	1207		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.582	1000	2.066		1.4105544338635183			5		22			1001	1209		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.576	1000	2.235		1.4105544338635183			5		17			1001	1210		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.901	1000	2.321		1.4105544338635183			7		25			1001	1212		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.494	1000	0.934		1.4105544338635183			6		9			1001	1213		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.727	1000	1.079		1.4105544338635183			8		6			1001	1214		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.947	1000	2.467		1.4105544338635183			7		29			1001	1215		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.229	1000	2.583		1.4105544338635183			6		31			1001	1216		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.830	1000	2.264		1.4105544338635183			7		13			1001	1217		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.126	1000	2.501		1.4105544338635183			6		13			1001	1218		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.005	1000	2.404		1.4105544338635183			5		19			1001	1220		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.875	1000	2.422		1.4105544338635183			8		22			1001	1223		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.755	1000	1.404		1.4105544338635183			6		36			1001	1224		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.193	1000	0.746		1.4105544338635183			5		28			1001	1225		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.609	1000	2.087		1.4105544338635183			6		12			1001	1226		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	3.270	1000	2.616		1.4105544338635183			7		31			1001	1228		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.192	1000	0.954		1.4105544338635183			7		22			1001	1229		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.507	1000	2.005		1.4105544338635183			7		24			1001	1231		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	2.889	1000	1.806		1.4105544338635183			6		16			1001	1232		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.689	1000	1.351		1.4105544338635183			6		12			1001	1233		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.186	1000	0.949		1.4105544338635183			8		26			1001	1234		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.233	1000	0.987		1.4105544338635183			7		14			1001	1236		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	96.2718	1.787	1000	1.117		1.4105544338635183			6		18			1001	1238		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.318	1000	2.074		1.50530000449143			8		29			1001	1239		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.965	1000	2.372		1.50530000449143			7		39			1001	1240		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.086	1000	1.929		1.50530000449143			5		2			1001	1245		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.179	1000	1.743		1.50530000449143			5		8			1001	1246		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.823	1000	1.458		1.50530000449143			8		17			1001	1247		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.584	1000	1.615		1.50530000449143			5		9			1001	1251		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.304	1000	1.043		1.50530000449143			8		1			1001	1253		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.893	1000	1.183		1.50530000449143			6		13			1001	1255		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.903	1000	1.522		1.50530000449143			5		19			1001	1256		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.623	1000	1.298		1.50530000449143			6		3			1001	1257		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.240	1000	1.400		1.50530000449143			5		36			1001	1258		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.302	1000	1.042		1.50530000449143			8		2			1001	1262		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.109	1000	2.487		1.50530000449143			6		30			1001	1264		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.104	1000	2.483		1.50530000449143			6		12			1001	1265		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.660	1000	1.662		1.50530000449143			7		33			1001	1266		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.171	1000	1.982		1.50530000449143			6		19			1001	1267		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.805	1000	2.378		1.50530000449143			8		12			1001	1268		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.222	1000	2.013		1.50530000449143			5		3			1001	1270		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.774	1000	1.419		1.50530000449143			6		27			1001	1271		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.616	1000	2.093		1.50530000449143			7		6			1001	1273		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.109	1000	1.943		1.50530000449143			6		22			1001	1274		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.664	1000	2.290		1.50530000449143			6		18			1001	1275		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.578	1000	1.611		1.50530000449143			6		24			1001	1276		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.142	1000	0.913		1.50530000449143			7		11			1001	1277		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	1.320	1000	0.825		1.50530000449143			7		25			1001	1278		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.245	1000	1.796		1.50530000449143			6		25			1001	1279		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	2.623	1000	1.639		1.50530000449143			6		37			1001	1283		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.0961	3.086	1000	2.469		1.50530000449143			6		34			1001	1284		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	1.179	1000	0.943		1.5158287221204572			7		24			1001	1285		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.763	1000	1.727		1.5158287221204572			7		6			1001	1287		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.475	1000	1.980		1.5158287221204572			5		31			1001	1288		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	3.248	1000	2.598		1.5158287221204572			7		27			1001	1289		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	1.411	1000	1.129		1.5158287221204572			5		31			1001	1290		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.243	1000	1.402		1.5158287221204572			6		1			1001	1291		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	3.340	1000	2.087		1.5158287221204572			8		30			1001	1292		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.015	1000	1.259		1.5158287221204572			5		27			1001	1294		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.788	1000	1.742		1.5158287221204572			8		35			1001	1296		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.257	1000	1.805		1.5158287221204572			6		6			1001	1298		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.1877	2.559	1000	1.600		1.5158287221204572			7		2			1001	1300		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.926	1000	1.541		1.5552531236993752			6		22			1001	1302		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.949	1000	1.559		1.5552531236993752			7		39			1001	1303		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.121	1000	0.897		1.5552531236993752			6		23			1001	1304		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.104	1000	1.315		1.5552531236993752			7		20			1001	1305		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.604	1000	1.003		1.5552531236993752			5		19			1001	1308		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.753	1000	1.402		1.5552531236993752			7		32			1001	1309		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	3.719	1000	2.324		1.5552531236993752			6		31			1001	1310		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.826	1000	1.461		1.5552531236993752			7		22			1001	1311		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.648	1000	1.655		1.5552531236993752			7		39			1001	1312		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.729	1000	1.081		1.5552531236993752			5		2			1001	1313		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	0.950	1000	0.760		1.5552531236993752			5		19			1001	1314		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.853	1000	1.783		1.5552531236993752			6		26			1001	1317		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	3.109	1000	1.943		1.5552531236993752			5		34			1001	1318		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.768	1000	1.414		1.5552531236993752			8		21			1001	1321		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.297	1000	1.038		1.5552531236993752			6		26			1001	1323		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.036	1000	0.829		1.5552531236993752			5		17			1001	1324		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.190	1000	1.752		1.5552531236993752			8		13			1001	1325		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.200	1000	1.375		1.5552531236993752			6		3			1001	1327		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	3.309	1000	2.068		1.5552531236993752			6		15			1001	1328		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	3.112	1000	2.489		1.5552531236993752			5		37			1001	1329		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.420	1000	1.512		1.5552531236993752			6		23			1001	1331		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.995	1000	1.872		1.5552531236993752			8		26			1001	1332		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.450	1000	1.160		1.5552531236993752			5		4			1001	1333		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	1.334	1000	1.068		1.5552531236993752			8		22			1001	1335		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.647	1000	2.117		1.5552531236993752			7		12			1001	1336		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.5307	2.739	1000	2.191		1.5552531236993752			6		27			1001	1337		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.206	1000	1.765		1.5997598055110414			8		8			1001	1339		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.110	1000	1.688		1.5997598055110414			7		14			1001	1340		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.062	1000	1.289		1.5997598055110414			7		30			1001	1341		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.417	1000	2.136		1.5997598055110414			7		25			1001	1343		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	0.920	1000	0.736		1.5997598055110414			6		36			1001	1345		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.757	1000	1.723		1.5997598055110414			7		3			1001	1347		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.927	1000	2.341		1.5997598055110414			5		26			1001	1348		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.923	1000	1.827		1.5997598055110414			7		18			1001	1349		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.610	1000	1.631		1.5997598055110414			7		39			1001	1350		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.755	1000	2.347		1.5997598055110414			5		16			1001	1353		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.986	1000	1.589		1.5997598055110414			7		27			1001	1354		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.620	1000	2.263		1.5997598055110414			6		6			1001	1355		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.512	1000	0.945		1.5997598055110414			5		3			1001	1356		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.313	1000	1.050		1.5997598055110414			7		17			1001	1357		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.149	1000	0.919		1.5997598055110414			5		10			1001	1358		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.762	1000	1.101		1.5997598055110414			7		1			1001	1360		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.859	1000	2.288		1.5997598055110414			6		25			1001	1361		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.001	1000	2.401		1.5997598055110414			7		33			1001	1362		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.898	1000	2.436		1.5997598055110414			7		33			1001	1365		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.561	1000	1.249		1.5997598055110414			7		35			1001	1367		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.398	1000	1.919		1.5997598055110414			5		13			1001	1368		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	1.613	1000	1.290		1.5997598055110414			5		19			1001	1369		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.749	1000	2.199		1.5997598055110414			7		16			1001	1370		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.706	1000	2.316		1.5997598055110414			6		9			1001	1371		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.473	1000	2.171		1.5997598055110414			7		19			1001	1372		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.191	1000	1.752		1.5997598055110414			7		18			1001	1373		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.187	1000	1.992		1.5997598055110414			6		4			1001	1374		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	2.291	1000	1.432		1.5997598055110414			6		5			1001	1375		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	97.9179	3.666	1000	2.291		1.5997598055110414			6		39			1001	1376		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	2.941	1000	2.353		1.610811945947145			6		16			1001	1377		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	3.154	1000	2.523		1.610811945947145			6		27			1001	1378		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.358	1000	0.849		1.610811945947145			5		19			1001	1379		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.501	1000	1.201		1.610811945947145			5		18			1001	1380		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	2.171	1000	1.737		1.610811945947145			6		21			1001	1382		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	2.497	1000	1.998		1.610811945947145			7		18			1001	1383		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.910	1000	1.194		1.610811945947145			8		11			1001	1384		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	3.125	1000	2.500		1.610811945947145			7		14			1001	1385		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.351	1000	0.844		1.610811945947145			8		37			1001	1387		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.463	1000	0.914		1.610811945947145			7		38			1001	1388		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.797	1000	1.438		1.610811945947145			7		38			1001	1391		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	2.266	1000	1.416		1.610811945947145			6		8			1001	1392		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.707	1000	1.067		1.610811945947145			6		23			1001	1393		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.555	1000	0.972		1.610811945947145			6		8			1001	1395		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	0.902	1000	0.722		1.610811945947145			5		33			1001	1396		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	2.359	1000	1.475		1.610811945947145			6		17			1001	1397		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	3.477	1000	2.173		1.610811945947145			6		28			1001	1398		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0141	1.137	1000	0.710		1.610811945947145			7		31			1001	1399		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.617	1000	1.636		1.620139956650458			5		1			1001	1400		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	0.988	1000	0.790		1.620139956650458			6		20			1001	1401		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.126	1000	1.701		1.620139956650458			8		40			1001	1405		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.745	1000	1.396		1.620139956650458			6		39			1001	1406		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	0.956	1000	0.764		1.620139956650458			7		15			1001	1407		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.281	1000	0.801		1.620139956650458			7		23			1001	1408		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	3.142	1000	2.514		1.620139956650458			6		39			1001	1409		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.234	1000	0.771		1.620139956650458			5		22			1001	1410		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.133	1000	0.906		1.620139956650458			7		35			1001	1411		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	3.477	1000	2.173		1.620139956650458			6		9			1001	1413		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.610	1000	1.288		1.620139956650458			8		5			1001	1415		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.955	1000	1.847		1.620139956650458			6		13			1001	1416		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.133	1000	1.707		1.620139956650458			6		24			1001	1418		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.932	1000	2.346		1.620139956650458			6		8			1001	1419		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.666	1000	1.333		1.620139956650458			7		34			1001	1420		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.155	1000	0.924		1.620139956650458			8		22			1001	1422		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.942	1000	1.214		1.620139956650458			6		23			1001	1425		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.213	1000	1.770		1.620139956650458			5		33			1001	1426		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.743	1000	1.394		1.620139956650458			6		15			1001	1427		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.234	1000	0.987		1.620139956650458			6		29			1001	1429		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.326	1000	0.829		1.620139956650458			6		38			1001	1430		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	1.063	1000	0.850		1.620139956650458			7		30			1001	1431		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	3.239	1000	2.024		1.620139956650458			7		38			1001	1432		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.258	1000	1.412		1.620139956650458			5		12			1001	1433		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	98.0952	2.101	1000	1.680		1.620139956650458			8		1			1001	1435		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.671	1000	2.137		1.7402894033939844			8		32			1001	1436		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.353	1000	1.082		1.7402894033939844			6		16			1001	1437		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.820	1000	2.387		1.7402894033939844			6		25			1001	1438		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.955	1000	1.847		1.7402894033939844			6		31			1001	1439		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.869	1000	2.295		1.7402894033939844			6		9			1001	1441		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.682	1000	2.301		1.7402894033939844			8		6			1001	1442		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.372	1000	1.897		1.7402894033939844			6		27			1001	1446		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.230	1000	0.984		1.7402894033939844			6		39			1001	1448		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.850	1000	1.781		1.7402894033939844			7		17			1001	1449		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.300	1000	0.812		1.7402894033939844			6		25			1001	1450		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	0.965	1000	0.772		1.7402894033939844			6		37			1001	1452		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.293	1000	1.433		1.7402894033939844			7		26			1001	1454		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.142	1000	1.964		1.7402894033939844			8		3			1001	1455		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.698	1000	2.312		1.7402894033939844			6		5			1001	1457		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.025	1000	2.420		1.7402894033939844			8		44			1001	1458		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.549	1000	0.968		1.7402894033939844			5		28			1001	1459		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.239	1000	0.991		1.7402894033939844			5		41			1001	1460		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.412	1000	1.929		1.7402894033939844			6		43			1001	1461		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.319	1000	1.450		1.7402894033939844			7		20			1001	1463		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.260	1000	1.413		1.7402894033939844			7		11			1001	1465		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.770	1000	2.216		1.7402894033939844			6		11			1001	1466		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.771	1000	1.107		1.7402894033939844			7		31			1001	1469		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.710	1000	1.069		1.7402894033939844			6		19			1001	1470		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.504	1000	2.003		1.7402894033939844			6		30			1001	1471		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.809	1000	1.131		1.7402894033939844			6		37			1001	1472		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.028	1000	1.893		1.7402894033939844			8		14			1001	1474		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.105	1000	1.316		1.7402894033939844			7		41			1001	1475		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	2.065	1000	1.652		1.7402894033939844			6		35			1001	1476		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	3.319	1000	2.074		1.7402894033939844			6		7			1001	1478		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.226	1000	0.981		1.7402894033939844			5		21			1001	1480		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.631	1000	1.020		1.7402894033939844			7		13			1001	1481		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1405	1.969	1000	1.575		1.7402894033939844			5		38			1001	1482		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.886	1000	2.309		1.743992835552267			5		23			1001	1484		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.011	1000	1.609		1.743992835552267			7		35			1001	1485		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.116	1000	1.693		1.743992835552267			7		4			1001	1487		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.481	1000	1.185		1.743992835552267			5		41			1001	1490		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.932	1000	1.546		1.743992835552267			6		4			1001	1493		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.852	1000	2.282		1.743992835552267			7		12			1001	1495		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.906	1000	2.441		1.743992835552267			5		3			1001	1496		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.677	1000	2.298		1.743992835552267			7		22			1001	1497		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.254	1000	1.003		1.743992835552267			7		2			1001	1499		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.828	1000	1.142		1.743992835552267			7		22			1001	1500		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.781	1000	1.425		1.743992835552267			6		44			1001	1503		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.691	1000	1.353		1.743992835552267			7		23			1001	1505		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.135	1000	0.908		1.743992835552267			7		15			1001	1507		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.534	1000	0.959		1.743992835552267			7		5			1001	1508		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.815	1000	1.135		1.743992835552267			5		15			1001	1509		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.280	1000	2.050		1.743992835552267			6		39			1001	1510		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.027	1000	1.267		1.743992835552267			7		6			1001	1511		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.224	1000	0.765		1.743992835552267			6		15			1001	1512		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.667	1000	2.292		1.743992835552267			6		24			1001	1513		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.579	1000	2.237		1.743992835552267			7		39			1001	1514		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.283	1000	0.802		1.743992835552267			6		15			1001	1515		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.712	1000	1.370		1.743992835552267			6		22			1001	1516		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.987	1000	2.389		1.743992835552267			5		12			1001	1517		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.600	1000	1.000		1.743992835552267			6		10			1001	1518		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.362	1000	1.090		1.743992835552267			6		15			1001	1519		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.410	1000	2.131		1.743992835552267			8		42			1001	1520		1				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.615	1000	2.092		1.743992835552267			7		36			1001	1521		0				1			2			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	1.051	1000	0.841		1.743992835552267			7		42			1001	1522		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	0.913	1000	0.730		1.743992835552267			6		33			1001	1523		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.727	1000	2.181		1.743992835552267			8		26			1001	1526		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.641	1000	2.113		1.743992835552267			8		37			1001	1527		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.243	1000	1.402		1.743992835552267			8		14			1001	1530		0				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	2.469	1000	1.543		1.743992835552267			8		8			1001	1531		1				1			3			20			0.0000		105.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	99.1727	3.001	1000	2.401		1.743992835552267			7		33			1001	1532		0				1			3			20			0.0000		105.000		0.000

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.0782	11.910	1000	9.528		3.0			6		18			1001	1627		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	100.6112	11.661	1000	9.329		3.0			3		10			1001	1636		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.2382	18.990	1000	11.868		3.0			1		16			1001	1630		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.3736	15.712	1000	9.820		3.0			6		3			1001	1623		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.4148	15.474	1000	9.672		3.0			6		9			1001	1567		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.5079	12.778	1000	10.223		3.0			7		16			1001	1577		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.6448	12.864	1000	10.291		3.0			8		14			1001	1609		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.6506	19.181	1000	11.988		3.0			3		8			1001	1612		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.7807	17.515	1000	10.947		3.0			0		8			1001	1642		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.8411	11.766	1000	9.413		3.0			3		14			1001	1662		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.8707	15.565	1000	9.728		3.0			7		17			1001	1618		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.8900	13.434	1000	10.747		3.0			7		2			1001	1661		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	102.9512	12.051	1000	9.641		3.0			1		14			1001	1556		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.0009	11.379	1000	9.103		3.0			8		18			1001	1536		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.0230	14.971	1000	11.977		3.0			3		10			1001	1606		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.1706	14.670	1000	11.736		3.0			4		16			1001	1546		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.2252	19.097	1000	11.936		3.0			1		14			1001	1578		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.2812	18.526	1000	11.579		3.0			5		10			1001	1543		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.3543	16.921	1000	10.575		3.0			1		8			1001	1604		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.4899	14.145	1000	11.316		3.0			4		19			1001	1620		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.5307	18.570	1000	11.606		3.0			2		11			1001	1602		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.6595	13.044	1000	10.435		3.0			1		17			1001	1605		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.7445	12.857	1000	10.286		3.0			5		7			1001	1583		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.8720	12.683	1000	10.147		3.0			6		11			1001	1657		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.8766	14.109	1000	11.287		3.0			8		18			1001	1590		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.8834	16.977	1000	10.610		3.0			2		1			1001	1655		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.9032	18.067	1000	11.292		3.0			7		8			1001	1617		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	103.9465	11.688	1000	9.351		3.0			4		1			1001	1649		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.0340	17.686	1000	11.054		3.0			7		3			1001	1552		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.0513	14.953	1000	11.963		3.0			1		6			1001	1665		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.0878	17.052	1000	10.657		3.0			2		1			1001	1653		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.1130	14.790	1000	11.832		3.0			5		17			1001	1663		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.2173	13.337	1000	10.670		3.0			2		1			1001	1550		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4471	15.660	1000	9.788		3.0			7		6			1001	1542		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.4809	11.510	1000	9.208		3.0			0		19			1001	1557		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.5083	15.097	1000	9.436		3.2222222222222223			2		13			1001	1696		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.5496	19.043	1000	11.902		3.0			7		15			1001	1601		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.5565	14.032	1000	11.225		3.0			7		5			1001	1659		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.5629	16.419	1000	10.262		3.0			7		1			1001	1545		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7297	13.409	1000	10.727		3.0			5		10			1001	1600		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7303	12.893	1000	10.314		3.0			7		19			1001	1559		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7612	17.815	1000	11.134		3.0			4		14			1001	1611		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.7724	18.605	1000	11.628		3.0			3		1			1001	1616		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.8718	18.413	1000	11.508		3.0			6		9			1001	1615		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.9467	16.678	1000	10.424		3.0			5		3			1001	1570		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.9567	18.496	1000	11.560		3.0			3		3			1001	1569		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	104.9805	11.937	1000	9.550		3.0			6		12			1001	1592		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1034	14.157	1000	11.325		3.0			6		8			1001	1650		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1151	14.530	1000	11.624		3.0			2		12			1001	1582		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1178	16.038	1000	10.024		3.0			0		19			1001	1591		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1765	14.640	1000	11.712		3.0			0		15			1001	1535		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1798	14.570	1000	11.656		3.0			1		6			1001	1588		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.1986	14.810	1000	11.848		3.0			6		10			1001	1610		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2134	15.420	1000	9.638		3.2222222222222223			6		13			1001	1754		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2212	11.133	1000	8.907		3.2222222222222223			2		13			1001	1672		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2301	15.560	1000	9.725		3.2222222222222223			2		6			1001	1721		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2605	14.889	1000	11.911		3.0			0		9			1001	1572		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.2634	12.149	1000	9.719		3.0			4		3			1001	1563		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.4860	12.127	1000	9.702		3.0			8		16			1001	1629		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5270	17.197	1000	10.748		3.0			2		14			1001	1631		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5382	14.176	1000	11.341		3.0			0		19			1001	1555		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.5492	12.914	1000	10.331		3.0			7		17			1001	1637		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.6682	15.469	1000	9.668		3.0			5		18			1001	1641		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.6917	18.023	1000	11.265		3.0			0		18			1001	1652		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.7248	12.065	1000	9.652		3.0			2		16			1001	1597		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8230	13.503	1000	10.802		3.2222222222222223			4		9			1001	1690		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8396	16.515	1000	10.322		3.2222222222222223			1		6			1001	1709		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8405	12.293	1000	9.834		3.0			6		10			1001	1574		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.8945	15.405	1000	9.628		3.0			5		15			1001	1580		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	105.9293	14.422	1000	11.537		3.0			4		15			1001	1593		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.1172	15.307	1000	9.567		3.2222222222222223			6		5			1001	1705		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.1567	12.272	1000	9.817		3.0			8		19			1001	1624		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.1600	12.017	1000	9.614		3.0			4		18			1001	1571		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2275	16.236	1000	10.148		3.0			5		2			1001	1553		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2555	14.571	1000	11.657		3.0			6		14			1001	1666		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2660	18.771	1000	11.732		3.0			3		13			1001	1579		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2774	15.915	1000	9.947		3.0			2		4			1001	1539		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2897	12.365	1000	9.892		3.0			3		2			1001	1668		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2947	18.737	1000	11.711		3.0			7		5			1001	1549		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.2978	12.541	1000	10.033		3.0			1		13			1001	1541		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.3257	10.771	1000	8.617		3.2222222222222223			3		4			1001	1747		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.3267	14.086	1000	8.804		3.2222222222222223			2		4			1001	1735		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5238	12.398	1000	9.918		3.2222222222222223			5		3			1001	1697		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5258	17.518	1000	10.949		3.0			8		4			1001	1566		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5734	15.443	1000	9.652		3.2222222222222223			2		2			1001	1752		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.5805	14.678	1000	9.174		3.2222222222222223			2		19			1001	1691		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.6168	13.941	1000	11.153		3.0			0		18			1001	1651		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.6316	17.131	1000	10.707		3.0			4		11			1001	1587		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.7072	15.020	1000	9.387		3.0			1		15			1001	1562		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.7174	12.704	1000	10.163		3.2222222222222223			6		15			1001	1733		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.8915	11.785	1000	9.428		3.0			6		14			1001	1660		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.9341	14.103	1000	11.282		3.0			2		5			1001	1594		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	106.9958	15.061	1000	9.413		3.2222222222222223			4		2			1001	1768		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.0019	14.917	1000	9.323		3.2222222222222223			1		13			1001	1736		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.0295	15.517	1000	9.698		3.2222222222222223			3		7			1001	1753		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.0425	17.258	1000	10.786		3.2222222222222223			7		18			1001	1687		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.1008	15.866	1000	9.916		3.0			2		12			1001	1645		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.2823	13.424	1000	10.739		3.0			6		2			1001	1640		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.3332	10.956	1000	8.765		3.2222222222222223			4		2			1001	1726		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.3496	13.945	1000	8.716		3.2222222222222223			4		13			1001	1745		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.3614	15.116	1000	9.447		3.2222222222222223			5		17			1001	1675		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.4143	12.978	1000	10.382		3.2222222222222223			1		2			1001	1751		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5289	11.770	1000	9.416		3.2222222222222223			6		7			1001	1744		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5343	14.626	1000	11.701		3.0			1		4			1001	1595		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5705	12.083	1000	9.666		3.2222222222222223			2		3			1001	1748		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.5904	14.300	1000	8.937		3.2222222222222223			3		4			1001	1670		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.6399	15.834	1000	9.896		3.0			6		1			1001	1586		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.6493	15.754	1000	9.846		3.2222222222222223			8		12			1001	1694		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7048	13.592	1000	10.874		3.2222222222222223			6		3			1001	1763		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.7948	11.865	1000	9.492		3.2222222222222223			3		10			1001	1749		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.8314	18.605	1000	11.628		3.2222222222222223			2		16			1001	1734		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.8725	13.377	1000	10.702		3.0			1		17			1001	1613		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	107.9341	15.972	1000	9.982		3.2222222222222223			4		5			1001	1725		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.0089	16.735	1000	10.459		3.2222222222222223			5		16			1001	1737		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1035	16.528	1000	10.330		3.2222222222222223			6		10			1001	1716		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1086	13.627	1000	10.902		3.2222222222222223			2		3			1001	1750		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1545	12.086	1000	9.669		3.2222222222222223			8		18			1001	1764		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.1652	16.805	1000	10.503		3.0			3		5			1001	1585		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.3201	14.571	1000	9.107		3.2222222222222223			4		10			1001	1720		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.3754	14.091	1000	8.807		3.2222222222222223			3		15			1001	1695		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.4053	12.763	1000	10.211		3.0			7		11			1001	1547		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.4669	11.503	1000	9.202		3.2222222222222223			5		13			1001	1713		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.5433	16.955	1000	10.597		3.2222222222222223			1		12			1001	1738		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.6604	16.045	1000	10.028		3.2222222222222223			8		19			1001	1703		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.7215	16.099	1000	10.062		3.2222222222222223			3		19			1001	1688		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8203	12.681	1000	10.145		3.2222222222222223			2		3			1001	1741		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8670	11.926	1000	9.541		3.2222222222222223			3		18			1001	1742		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8702	15.651	1000	9.782		3.2222222222222223			3		10			1001	1760		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.8953	18.859	1000	11.787		3.0			6		6			1001	1551		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9036	14.916	1000	9.322		3.2222222222222223			2		3			1001	1673		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9092	13.309	1000	10.647		3.2222222222222223			3		10			1001	1719		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9542	13.137	1000	10.509		3.2222222222222223			2		7			1001	1718		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	108.9729	14.070	1000	11.256		3.2222222222222223			1		6			1001	1743		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0474	10.957	1000	8.766		3.2222222222222223			5		2			1001	1692		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0756	17.104	1000	10.690		3.2222222222222223			3		15			1001	1755		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.0940	13.122	1000	10.498		3.2222222222222223			8		18			1001	1759		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.1229	15.198	1000	9.499		3.2222222222222223			5		10			1001	1682		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.1733	14.325	1000	8.953		3.2222222222222223			4		7			1001	1669		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.2445	13.340	1000	10.672		3.0			7		3			1001	1644		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.4000	12.476	1000	9.981		3.2222222222222223			1		19			1001	1766		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.5208	11.332	1000	9.066		3.2222222222222223			7		19			1001	1756		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.6288	12.453	1000	9.962		3.2222222222222223			3		8			1001	1740		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.8227	11.884	1000	9.508		3.2222222222222223			3		12			1001	1729		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.8746	14.613	1000	9.133		3.0			8		4			1001	1633		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.9223	10.573	1000	8.458		3.888888888888889			6		18			1001	1817		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	109.9527	14.816	1000	9.260		3.2222222222222223			6		6			1001	1732		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.2797	11.382	1000	9.106		3.2222222222222223			7		12			1001	1700		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.5306	18.094	1000	11.309		3.2222222222222223			4		17			1001	1686		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.8951	14.293	1000	11.435		3.2222222222222223			6		9			1001	1701		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	110.9142	13.610	1000	10.888		3.2222222222222223			2		3			1001	1761		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.1439	14.388	1000	11.511		3.2222222222222223			5		18			1001	1679		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.2038	13.897	1000	11.118		3.2222222222222223			6		11			1001	1706		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.3899	10.077	1000	8.062		3.888888888888889			3		18			1001	1831		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	111.9002	10.577	1000	8.462		3.888888888888889			6		9			1001	1781		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	112.3823	10.864	1000	8.691		3.2222222222222223			1		17			1001	1681		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	112.3831	15.578	1000	9.736		3.2222222222222223			6		4			1001	1707		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	112.4157	13.034	1000	10.427		3.888888888888889			3		3			1001	1800		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	112.8142	16.868	1000	10.543		3.888888888888889			4		17			1001	1784		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	113.8286	11.986	1000	9.589		3.888888888888889			7		3			1001	1806		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	114.3595	15.521	1000	9.701		3.888888888888889			5		1			1001	1832		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	114.5059	14.526	1000	9.079		3.888888888888889			4		13			1001	1820		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.1563	11.522	1000	9.217		3.888888888888889			3		4			1001	1802		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.5671	15.696	1000	9.810		3.888888888888889			3		6			1001	1804		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.5913	10.696	1000	8.557		3.888888888888889			2		11			1001	1798		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.6573	8.892	1000	7.113		3.888888888888889			5		18			1001	1843		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	115.7751	9.684	1000	7.747		3.888888888888889			4		14			1001	1808		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.0628	14.233	1000	8.895		3.888888888888889			4		11			1001	1793		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.2366	8.876	1000	7.100		3.888888888888889			4		15			1001	1819		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.2903	10.215	1000	8.172		3.888888888888889			8		12			1001	1816		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.5206	14.312	1000	8.945		3.888888888888889			5		8			1001	1821		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.6222	14.385	1000	8.990		3.888888888888889			4		14			1001	1795		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.6253	10.960	1000	8.768		3.888888888888889			5		9			1001	1790		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.6915	12.765	1000	10.212		3.888888888888889			1		13			1001	1792		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.7503	11.154	1000	8.923		3.888888888888889			3		16			1001	1796		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.8137	12.190	1000	7.619		3.888888888888889			7		2			1001	1837		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.8511	14.082	1000	8.801		3.888888888888889			4		3			1001	1823		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	116.9891	15.926	1000	9.954		3.888888888888889			8		5			1001	1814		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.2660	15.277	1000	9.548		3.888888888888889			6		15			1001	1810		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.3313	15.409	1000	9.631		3.888888888888889			6		6			1001	1776		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.3794	13.205	1000	8.253		3.888888888888889			5		19			1001	1841		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.6830	9.370	1000	7.496		3.888888888888889			3		17			1001	1811		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	117.9627	9.254	1000	7.403		3.888888888888889			3		9			1001	1836		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.0546	13.182	1000	10.546		3.888888888888889			5		15			1001	1835		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.0739	12.158	1000	7.599		3.888888888888889			3		3			1001	1840		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.1946	10.434	1000	8.347		3.888888888888889			4		11			1001	1822		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.2192	16.699	1000	10.437		3.888888888888889			2		16			1001	1799		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.3080	10.029	1000	8.023		3.888888888888889			2		7			1001	1778		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.6596	11.257	1000	7.036		3.888888888888889			7		13			1001	1834		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	118.9769	9.264	1000	7.411		3.888888888888889			2		15			1001	1827		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.1409	11.801	1000	7.375		3.888888888888889			5		1			1001	1797		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.2699	14.839	1000	9.275		3.888888888888889			7		7			1001	1842		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.2975	14.628	1000	9.143		3.888888888888889			2		15			1001	1779		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.4438	14.475	1000	9.047		3.888888888888889			6		10			1001	1812		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.5170	10.761	1000	8.609		3.888888888888889			7		12			1001	1791		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.8188	11.770	1000	7.356		3.888888888888889			4		7			1001	1805		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	119.8289	15.359	1000	9.600		3.888888888888889			5		4			1001	1785		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	120.0389	16.730	1000	10.456		3.888888888888889			4		5			1001	1773		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	121.5197	16.202	1000	10.126		3.888888888888889			3		11			1001	1838		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	121.9093	14.725	1000	9.203		3.888888888888889			2		1			1001	1775		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	122.0954	14.332	1000	8.957		3.888888888888889			7		19			1001	1815		0				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	122.4506	12.873	1000	10.298		3.888888888888889			2		16			1001	1777		1				1			5			24			105.0000		42.000		0.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway
i "Voce"	125.0865	13.137	1000	8.211		3.888888888888889			4		5			1001	1771		1				1			5			24			105.0000		42.000		0.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
