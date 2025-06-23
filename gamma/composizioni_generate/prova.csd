
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
f 0 234.8827490024519 ; Evento f fittizio per definire la durata totale
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


f 1000 0 11 -2 3 2 4 5 3 2 4 1 3 2 4
f 1001 0 11 -2 0 1 2 3 1 1 2 0 2 1 2
f 1002 0 3 -2 6 8 10
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 2 3 5
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 3 4 2
f 1007 0 3 -2 0 1 0
f 1008 0 3 -2 1 2 3
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 7 9 12
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 8 12 8
f 1013 0 3 -2 0 1 2
f 1014 0 4 -2 2 10 4 15
f 1015 0 4 -2 0 1 2 3
f 1016 0 4 -2 3 20 5 8
f 1017 0 4 -2 0 1 2 3



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.308	1000	27.068		5.000000	1		1			1		1		1001	1		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	46.409	1000	29.006		5.000000	2		2			2		2		1001	3		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	39.336	1000	24.585		5.000000	2		2			2		2		1001	4		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.7275	28.816	1000	23.053		5.000000	1		3			1		3		1001	5		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.7275	35.867	1000	22.417		5.000000	2		4			2		4		1001	7		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1100	39.696	1000	24.810		5.000000	0		2			0		2		1001	8		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1100	30.177	1000	24.142		5.000000	2		2			2		2		1001	11		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.1475	33.949	1000	27.159		5.000000	2		4			2		4		1001	12		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.1475	42.021	1000	26.263		5.000000	2		5			2		5		1001	17		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.1475	35.576	1000	22.235		5.000000	1		3			1		3		1001	18		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8400	41.134	1000	25.709		5.000000	1		8			1		8		1001	19		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8400	30.239	1000	24.191		5.000000	1		2			1		2		1001	20		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8400	23.070	1000	18.456		5.000000	1		6			1		6		1001	21		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8400	25.075	1000	20.060		5.000000	3		4			3		4		1001	22		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8400	35.824	1000	22.390		5.000000	1		6			1		6		1001	25		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.1875	33.308	1000	20.817		5.000000	2		4			2		4		1001	26		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.1875	39.273	1000	24.545		5.000000	3		1			3		1		1001	27		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.1875	25.637	1000	20.509		5.000000	2		4			2		4		1001	29		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.1875	41.710	1000	26.069		5.000000	2		4			2		4		1001	30		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.1900	33.758	1000	21.099		5.000000	1		6			1		6		1001	33		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.1900	40.615	1000	25.385		5.000000	2		10			2		10		1001	34		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.1900	31.647	1000	25.317		5.000000	1		3			1		3		1001	35		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.8475	26.236	1000	16.397		5.000000	2		11			2		11		1001	36		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.8475	30.582	1000	19.114		5.000000	3		2			3		2		1001	40		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.8475	33.660	1000	21.037		5.000000	3		1			3		1		1001	41		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.1600	24.018	1000	19.215		5.000000	3		4			3		4		1001	42		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.1600	30.474	1000	19.046		5.000000	4		12			4		12		1001	44		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.1600	20.208	1000	16.167		5.000000	2		4			2		4		1001	46		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.1600	38.539	1000	24.087		5.000000	1		6			1		6		1001	49		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1275	35.154	1000	21.971		5.000000	2		6			2		6		1001	50		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1275	34.264	1000	21.415		5.000000	4		9			4		9		1001	51		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1275	21.844	1000	17.475		5.000000	2		1			2		1		1001	52		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	21.229	1000	16.983		5.000000	4		5			4		5		1001	53		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	17.601	1000	14.081		5.000000	4		13			4		13		1001	54		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	34.255	1000	21.409		5.000000	2		11			2		11		1001	57		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	23.928	1000	19.143		5.000000	3		3			3		3		1001	58		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	33.936	1000	21.210		5.000000	5		9			5		9		1001	60		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7500	38.621	1000	24.138		5.000000	4		3			4		3		1001	62		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.0275	22.058	1000	17.647		5.000000	3		5			3		5		1001	63		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.0275	24.651	1000	15.407		5.000000	4		7			4		7		1001	64		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.0275	27.565	1000	22.052		5.000000	3		6			3		6		1001	67		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.0275	29.100	1000	18.187		5.000000	5		6			5		6		1001	68		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9600	24.700	1000	15.437		5.000000	2		5			2		5		1001	69		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9600	28.903	1000	18.065		5.000000	4		15			4		15		1001	70		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9600	17.967	1000	14.373		5.000000	6		4			6		4		1001	71		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5475	23.723	1000	14.827		5.000000	5		9			5		9		1001	72		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5475	24.141	1000	19.313		5.000000	3		17			3		17		1001	73		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5475	24.770	1000	19.816		5.000000	4		12			4		12		1001	75		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5475	17.785	1000	14.228		5.000000	5		5			5		5		1001	78		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5475	20.658	1000	16.527		5.000000	6		12			6		12		1001	80		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	18.235	1000	14.588		5.000000	7		7			7		7		1001	81		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	26.066	1000	16.291		5.000000	7		9			7		9		1001	82		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	28.052	1000	22.442		5.000000	5		17			5		17		1001	83		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	21.898	1000	17.519		5.000000	6		2			6		2		1001	86		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	28.853	1000	23.083		5.000000	6		9			6		9		1001	87		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.7900	34.279	1000	21.424		5.000000	5		3			5		3		1001	88		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.6875	34.299	1000	21.437		5.000000	5		6			5		6		1001	91		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.6875	35.428	1000	22.143		5.000000	5		4			5		4		1001	92		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.6875	21.845	1000	17.476		5.000000	4		18			4		18		1001	93		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.6875	27.944	1000	17.465		5.000000	4		12			4		12		1001	94		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.6875	16.180	1000	12.944		5.000000	3		11			3		11		1001	95		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.2400	24.343	1000	19.475		5.000000	6		3			6		3		1001	97		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.2400	18.059	1000	14.447		5.000000	4		16			4		16		1001	100		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.2400	18.409	1000	14.727		5.000000	6		5			6		5		1001	103		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.2400	24.299	1000	15.187		5.000000	7		6			7		6		1001	104		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	67.4475	24.749	1000	15.468		5.000000	5		19			5		19		1001	106		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	67.4475	22.796	1000	18.237		5.000000	6		15			6		15		1001	111		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	67.4475	26.497	1000	16.560		5.000000	6		19			6		19		1001	113		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	67.4475	24.567	1000	15.354		5.000000	6		14			6		14		1001	114		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	67.4475	16.509	1000	13.207		5.000000	4		19			4		19		1001	115		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	30.233	1000	18.896		5.000000	4		2			4		2		1001	116		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	22.426	1000	17.941		5.000000	7		19			7		19		1001	121		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	15.603	1000	12.482		5.000000	5		15			5		15		1001	124		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	29.290	1000	18.306		5.000000	5		11			5		11		1001	125		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	18.335	1000	14.668		5.000000	7		1			7		1		1001	127		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.3100	14.820	1000	11.856		5.000000	7		19			7		19		1001	129		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.8275	25.905	1000	16.191		5.000000	5		18			5		18		1001	130		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.8275	22.285	1000	13.928		5.000000	4		19			4		19		1001	131		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.8275	27.454	1000	21.963		5.000000	4		13			4		13		1001	136		1				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.8275	33.570	1000	20.981		5.000000	7		4			7		4		1001	139		0				1			2			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	1.421	1000	0.895		0.027491	5		1			5		1		1001	140		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	6.796	1000	3.182		0.027491	6		5			6		5		1001	141		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	15.102	1000	3.250		0.027491	7		4			7		4		1001	142		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	9.858	1000	1.926		0.027491	6		7			6		7		1001	143		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	7.336	1000	1.842		0.027491	7		3			7		3		1001	144		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	13.174	1000	3.557		0.027491	7		7			7		7		1001	145		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	3.691	1000	1.618		0.027491	5		5			5		5		1001	146		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	6.608	1000	2.209		0.027491	5		5			5		5		1001	147		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	8.313	1000	1.840		0.027491	8		6			8		6		1001	148		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	5.171	1000	1.781		0.027491	7		6			7		6		1001	149		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	7.340	1000	2.501		0.027491	7		1			7		1		1001	150		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	7.702	1000	2.603		0.027491	7		8			7		8		1001	151		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	3.914	1000	2.743		0.027491	6		4			6		4		1001	152		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	3.228	1000	1.182		0.027491	6		2			6		2		1001	153		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	11.184	1000	2.114		0.027491	7		7			7		7		1001	155		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	8.453	1000	1.417		0.027491	8		2			8		2		1001	158		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	12.713	1000	3.266		0.027491	7		7			7		7		1001	160		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	9.000	1000	1.720		0.027491	6		5			6		5		1001	163		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	2.756	1000	1.343		0.027491	6		2			6		2		1001	164		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2887	4.360	1000	1.673		0.027491	6		5			6		5		1001	165		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	9.034	1000	2.871		0.049310	6		5			6		5		1001	166		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.906	1000	1.057		0.049310	5		6			5		6		1001	167		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	14.208	1000	3.024		0.049310	7		7			7		7		1001	169		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.073	1000	2.975		0.049310	7		2			7		2		1001	173		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	3.895	1000	0.978		0.049310	8		5			8		5		1001	174		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.007	1000	2.195		0.049310	5		8			5		8		1001	176		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	14.200	1000	2.797		0.049310	7		5			7		5		1001	177		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	10.210	1000	1.843		0.049310	5		7			5		7		1001	179		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	2.223	1000	1.596		0.049310	7		8			7		8		1001	180		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	14.339	1000	3.680		0.049310	6		6			6		6		1001	181		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	4.739	1000	2.268		0.049310	6		6			6		6		1001	183		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	5.776	1000	1.851		0.049310	5		6			5		6		1001	186		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	6.042	1000	0.836		0.049310	6		4			6		4		1001	189		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.119	1000	0.960		0.049310	5		2			5		2		1001	190		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	12.441	1000	2.392		0.049310	7		3			7		3		1001	194		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	5.261	1000	3.233		0.049310	5		7			5		7		1001	195		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	13.364	1000	2.435		0.049310	7		2			7		2		1001	196		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	2.688	1000	1.471		0.049310	7		5			7		5		1001	197		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.396	1000	3.663		0.049310	6		4			6		4		1001	200		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	5.245	1000	0.988		0.049310	7		2			7		2		1001	201		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	6.083	1000	1.232		0.049310	8		2			8		2		1001	202		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	3.957	1000	1.229		0.049310	6		2			6		2		1001	204		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	15.540	1000	3.475		0.049310	5		5			5		5		1001	205		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.238	1000	2.666		0.049310	5		7			5		7		1001	206		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	8.222	1000	3.205		0.049310	7		7			7		7		1001	207		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	2.443	1000	1.379		0.049310	8		6			8		6		1001	209		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	5.842	1000	1.583		0.049310	7		8			7		8		1001	210		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	14.145	1000	2.600		0.049310	7		6			7		6		1001	211		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	4.564	1000	0.867		0.049310	6		5			6		5		1001	212		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	9.570	1000	3.562		0.049310	8		7			8		7		1001	213		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	6.769	1000	1.110		0.049310	8		8			8		8		1001	214		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	12.793	1000	2.779		0.049310	7		8			7		8		1001	215		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	7.543	1000	3.646		0.049310	5		3			5		3		1001	216		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.5178	9.877	1000	1.013		0.049310	6		1			6		1		1001	217		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	7.477	1000	1.519		0.190064	5		1			5		1		1001	218		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.802	1000	3.124		0.190064	7		6			7		6		1001	220		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.072	1000	1.573		0.190064	6		11			6		11		1001	221		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	13.585	1000	3.538		0.190064	6		1			6		1		1001	222		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	6.520	1000	2.561		0.190064	6		3			6		3		1001	223		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.726	1000	1.233		0.190064	8		4			8		4		1001	227		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	8.179	1000	1.749		0.190064	5		3			5		3		1001	228		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.722	1000	0.895		0.190064	6		9			6		9		1001	229		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	13.813	1000	3.278		0.190064	7		1			7		1		1001	230		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.385	1000	1.439		0.190064	6		4			6		4		1001	231		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	10.083	1000	2.351		0.190064	8		6			8		6		1001	233		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.104	1000	1.835		0.190064	8		9			8		9		1001	234		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	6.184	1000	3.337		0.190064	8		2			8		2		1001	235		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.863	1000	1.340		0.190064	7		3			7		3		1001	236		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.700	1000	1.914		0.190064	6		5			6		5		1001	237		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	4.159	1000	2.801		0.190064	6		8			6		8		1001	238		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.664	1000	3.006		0.190064	8		5			8		5		1001	239		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	8.745	1000	0.920		0.190064	8		10			8		10		1001	240		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	7.770	1000	2.020		0.190064	5		4			5		4		1001	241		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.188	1000	3.214		0.190064	6		1			6		1		1001	243		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	11.787	1000	1.527		0.190064	6		6			6		6		1001	244		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	13.867	1000	2.529		0.190064	7		9			7		9		1001	245		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	11.484	1000	0.955		0.190064	6		8			6		8		1001	247		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	8.337	1000	2.029		0.190064	7		5			7		5		1001	248		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	5.102	1000	3.340		0.190064	7		6			7		6		1001	250		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	7.305	1000	3.423		0.190064	8		1			8		1		1001	251		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	10.215	1000	2.837		0.190064	8		4			8		4		1001	252		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	10.662	1000	1.066		0.190064	7		11			7		11		1001	254		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	11.430	1000	3.573		0.190064	7		2			7		2		1001	255		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	9.433	1000	3.390		0.190064	7		1			7		1		1001	257		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9957	3.772	1000	2.477		0.190064	6		5			6		5		1001	259		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	10.500	1000	1.981		0.268570	7		11			7		11		1001	261		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.056	1000	2.511		0.268570	8		8			8		8		1001	263		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	5.516	1000	2.249		0.268570	7		8			7		8		1001	265		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	5.958	1000	0.797		0.268570	8		4			8		4		1001	266		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.216	1000	1.357		0.268570	7		8			7		8		1001	267		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	7.540	1000	1.211		0.268570	6		11			6		11		1001	268		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	2.890	1000	1.725		0.268570	7		9			7		9		1001	269		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	2.202	1000	1.079		0.268570	8		1			8		1		1001	270		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	10.005	1000	2.227		0.268570	5		4			5		4		1001	271		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.169	1000	1.805		0.268570	6		8			6		8		1001	272		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	11.801	1000	2.362		0.268570	6		12			6		12		1001	273		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	5.816	1000	2.528		0.268570	7		9			7		9		1001	274		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	7.916	1000	1.438		0.268570	6		13			6		13		1001	277		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	15.139	1000	3.457		0.268570	6		5			6		5		1001	278		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	8.030	1000	2.033		0.268570	8		4			8		4		1001	281		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	10.767	1000	2.327		0.268570	6		3			6		3		1001	282		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	5.664	1000	3.199		0.268570	8		1			8		1		1001	283		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	12.766	1000	3.421		0.268570	6		8			6		8		1001	284		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.873	1000	1.190		0.268570	7		2			7		2		1001	286		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	3.005	1000	1.883		0.268570	6		12			6		12		1001	288		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	10.215	1000	3.314		0.268570	5		11			5		11		1001	289		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	12.752	1000	2.435		0.268570	7		12			7		12		1001	290		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	3.655	1000	1.880		0.268570	5		6			5		6		1001	291		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	12.617	1000	2.821		0.268570	7		7			7		7		1001	292		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	11.916	1000	2.352		0.268570	7		6			7		6		1001	293		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	3.546	1000	2.736		0.268570	7		5			7		5		1001	294		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	8.707	1000	2.504		0.268570	8		1			8		1		1001	295		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	11.401	1000	2.547		0.268570	7		7			7		7		1001	299		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	8.192	1000	1.417		0.268570	6		7			6		7		1001	301		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	5.496	1000	3.225		0.268570	8		2			8		2		1001	302		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.397	1000	2.106		0.268570	8		2			8		2		1001	303		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	11.092	1000	0.765		0.268570	6		1			6		1		1001	304		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	9.923	1000	3.168		0.268570	7		3			7		3		1001	305		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	4.454	1000	2.760		0.268570	6		1			6		1		1001	306		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	8.124	1000	3.052		0.268570	7		5			7		5		1001	308		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	10.255	1000	2.917		0.268570	7		6			7		6		1001	309		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8200	7.277	1000	1.218		0.268570	7		11			7		11		1001	311		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	6.229	1000	3.393		0.277084	6		5			6		5		1001	312		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	11.106	1000	1.954		0.277084	7		6			7		6		1001	313		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.597	1000	3.257		0.277084	6		8			6		8		1001	316		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	11.238	1000	2.236		0.277084	6		9			6		9		1001	317		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.042	1000	3.331		0.277084	6		5			6		5		1001	320		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	4.262	1000	3.178		0.277084	7		7			7		7		1001	321		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.820	1000	2.711		0.277084	7		1			7		1		1001	322		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	6.324	1000	1.438		0.277084	6		6			6		6		1001	323		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	8.450	1000	2.823		0.277084	7		5			7		5		1001	324		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	11.792	1000	3.031		0.277084	7		1			7		1		1001	326		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	10.615	1000	1.157		0.277084	6		5			6		5		1001	327		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	14.789	1000	3.368		0.277084	8		2			8		2		1001	328		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.199	1000	0.837		0.277084	6		7			6		7		1001	329		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	3.676	1000	1.073		0.277084	7		7			7		7		1001	330		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	9.635	1000	2.363		0.277084	7		6			7		6		1001	334		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	7.213	1000	3.008		0.277084	6		8			6		8		1001	335		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	3.346	1000	1.823		0.277084	6		4			6		4		1001	336		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	9.452	1000	1.013		0.277084	6		13			6		13		1001	337		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	10.596	1000	2.154		0.277084	7		3			7		3		1001	338		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	6.961	1000	3.389		0.277084	7		1			7		1		1001	341		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	4.921	1000	2.285		0.277084	6		2			6		2		1001	342		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	13.685	1000	2.996		0.277084	6		12			6		12		1001	343		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	8.417	1000	1.164		0.277084	5		11			5		11		1001	345		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	3.067	1000	2.293		0.277084	6		11			6		11		1001	348		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	1.560	1000	0.944		0.277084	8		8			8		8		1001	349		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	8.701	1000	0.777		0.277084	6		9			6		9		1001	350		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	13.138	1000	2.885		0.277084	7		8			7		8		1001	351		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.608	1000	1.862		0.277084	6		3			6		3		1001	352		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	5.729	1000	1.998		0.277084	8		9			8		9		1001	354		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	9.850	1000	3.291		0.277084	8		8			8		8		1001	356		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	11.657	1000	1.612		0.277084	5		8			5		8		1001	358		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	2.229	1000	1.181		0.277084	7		4			7		4		1001	359		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9094	4.278	1000	0.913		0.277084	6		7			6		7		1001	360		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	9.998	1000	3.121		0.323738	7		4			7		4		1001	362		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.271	1000	2.039		0.323738	8		5			8		5		1001	363		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.944	1000	1.571		0.323738	8		13			8		13		1001	364		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	5.806	1000	2.251		0.323738	6		1			6		1		1001	366		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	7.707	1000	2.200		0.323738	8		6			8		6		1001	367		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.252	1000	1.577		0.323738	8		4			8		4		1001	369		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.017	1000	1.304		0.323738	8		1			8		1		1001	370		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	13.805	1000	3.136		0.323738	6		6			6		6		1001	373		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	7.053	1000	3.056		0.323738	6		13			6		13		1001	374		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.243	1000	1.448		0.323738	8		5			8		5		1001	375		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.361	1000	3.432		0.323738	6		8			6		8		1001	376		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.948	1000	2.489		0.323738	8		4			8		4		1001	377		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	8.638	1000	1.143		0.323738	6		9			6		9		1001	379		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	4.060	1000	1.616		0.323738	6		13			6		13		1001	381		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	4.994	1000	2.721		0.323738	8		3			8		3		1001	383		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	8.197	1000	1.335		0.323738	5		2			5		2		1001	384		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	3.563	1000	0.914		0.323738	5		14			5		14		1001	385		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	4.597	1000	2.743		0.323738	8		10			8		10		1001	392		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	8.041	1000	1.304		0.323738	6		2			6		2		1001	393		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.258	1000	0.949		0.323738	5		2			5		2		1001	394		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	8.774	1000	1.684		0.323738	8		12			8		12		1001	395		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.425	1000	1.045		0.323738	6		10			6		10		1001	398		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.237	1000	1.489		0.323738	8		6			8		6		1001	399		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	11.671	1000	1.845		0.323738	7		9			7		9		1001	402		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	13.773	1000	2.619		0.323738	7		2			7		2		1001	405		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	6.935	1000	1.883		0.323738	6		4			6		4		1001	406		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	10.464	1000	2.666		0.323738	7		9			7		9		1001	410		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3992	8.198	1000	1.444		0.323738	7		9			7		9		1001	411		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	3.360	1000	2.082		0.342166	6		3			6		3		1001	412		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	4.452	1000	1.688		0.342166	8		13			8		13		1001	415		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	8.602	1000	1.446		0.342166	6		15			6		15		1001	416		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	1.775	1000	0.894		0.342166	5		5			5		5		1001	417		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	7.866	1000	1.845		0.342166	6		14			6		14		1001	419		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	6.576	1000	2.558		0.342166	6		12			6		12		1001	421		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	9.920	1000	1.918		0.342166	6		10			6		10		1001	422		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	11.148	1000	2.028		0.342166	8		10			8		10		1001	423		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	5.944	1000	2.526		0.342166	8		6			8		6		1001	424		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	10.103	1000	2.445		0.342166	5		7			5		7		1001	425		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	12.039	1000	2.278		0.342166	5		6			5		6		1001	426		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	12.658	1000	2.986		0.342166	7		3			7		3		1001	427		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	4.533	1000	2.719		0.342166	7		11			7		11		1001	430		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	3.834	1000	1.380		0.342166	6		6			6		6		1001	431		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	11.413	1000	2.675		0.342166	6		13			6		13		1001	434		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	7.141	1000	1.752		0.342166	7		4			7		4		1001	435		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	5.390	1000	2.501		0.342166	7		10			7		10		1001	436		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	5.531	1000	1.904		0.342166	6		3			6		3		1001	438		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	5.153	1000	1.534		0.342166	8		10			8		10		1001	440		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	7.591	1000	1.195		0.342166	7		4			7		4		1001	441		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	4.444	1000	3.488		0.342166	7		10			7		10		1001	442		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	4.312	1000	1.384		0.342166	8		13			8		13		1001	443		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	4.698	1000	2.275		0.342166	7		4			7		4		1001	446		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	6.490	1000	2.532		0.342166	6		4			6		4		1001	447		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	3.469	1000	1.594		0.342166	5		12			5		12		1001	450		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	8.139	1000	3.384		0.342166	7		10			7		10		1001	452		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5927	10.981	1000	2.482		0.342166	5		2			5		2		1001	453		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	8.503	1000	1.759		0.382999	8		10			8		10		1001	455		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	4.093	1000	0.875		0.382999	8		5			8		5		1001	457		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.112	1000	2.864		0.382999	8		3			8		3		1001	458		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	5.081	1000	1.881		0.382999	7		14			7		14		1001	462		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	8.438	1000	1.280		0.382999	6		10			6		10		1001	463		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	12.442	1000	2.703		0.382999	7		10			7		10		1001	464		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	10.689	1000	1.747		0.382999	7		6			7		6		1001	465		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.884	1000	2.919		0.382999	8		6			8		6		1001	467		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	10.946	1000	1.622		0.382999	7		4			7		4		1001	469		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.114	1000	1.671		0.382999	6		14			6		14		1001	472		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.793	1000	0.942		0.382999	6		12			6		12		1001	473		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	9.278	1000	1.162		0.382999	6		1			6		1		1001	474		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.527	1000	2.218		0.382999	6		14			6		14		1001	475		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.500	1000	1.529		0.382999	6		8			6		8		1001	476		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.185	1000	2.254		0.382999	7		13			7		13		1001	482		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.546	1000	3.203		0.382999	7		14			7		14		1001	483		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	9.602	1000	0.851		0.382999	5		9			5		9		1001	484		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.012	1000	1.817		0.382999	6		12			6		12		1001	485		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	5.945	1000	2.676		0.382999	6		2			6		2		1001	486		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	11.735	1000	2.459		0.382999	6		11			6		11		1001	488		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	11.829	1000	1.305		0.382999	7		7			7		7		1001	489		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	8.722	1000	2.320		0.382999	7		11			7		11		1001	492		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.776	1000	3.251		0.382999	8		7			8		7		1001	494		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	10.529	1000	3.352		0.382999	6		13			6		13		1001	495		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.209	1000	3.416		0.382999	8		10			8		10		1001	497		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	3.145	1000	1.215		0.382999	5		4			5		4		1001	498		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	2.785	1000	1.452		0.382999	6		8			6		8		1001	499		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	6.036	1000	1.004		0.382999	6		12			6		12		1001	501		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	12.463	1000	1.854		0.382999	5		1			5		1		1001	502		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	7.327	1000	2.860		0.382999	7		7			7		7		1001	506		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	8.084	1000	2.887		0.382999	8		14			8		14		1001	507		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	5.001	1000	1.778		0.382999	6		10			6		10		1001	508		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0215	10.297	1000	1.493		0.382999	6		7			6		7		1001	509		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	12.575	1000	2.782		0.493289	5		10			5		10		1001	511		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	9.925	1000	0.733		0.493289	8		16			8		16		1001	513		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	8.970	1000	1.497		0.493289	7		3			7		3		1001	514		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	4.239	1000	1.039		0.493289	6		4			6		4		1001	515		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	9.312	1000	2.810		0.493289	5		2			5		2		1001	516		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	5.110	1000	1.341		0.493289	6		14			6		14		1001	517		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	6.338	1000	1.246		0.493289	6		6			6		6		1001	518		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	7.015	1000	1.170		0.493289	5		11			5		11		1001	521		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	4.972	1000	3.155		0.493289	8		1			8		1		1001	522		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	6.461	1000	1.398		0.493289	6		2			6		2		1001	523		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	7.762	1000	3.236		0.493289	6		18			6		18		1001	525		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	3.762	1000	1.311		0.493289	6		15			6		15		1001	526		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	10.138	1000	1.239		0.493289	7		14			7		14		1001	528		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	1.915	1000	1.387		0.493289	7		7			7		7		1001	529		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	10.513	1000	2.142		0.493289	7		15			7		15		1001	530		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	11.089	1000	3.057		0.493289	7		8			7		8		1001	533		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	3.509	1000	1.906		0.493289	7		2			7		2		1001	534		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1795	11.249	1000	1.528		0.493289	6		11			6		11		1001	535		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	8.231	1000	3.265		0.519956	7		9			7		9		1001	537		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	6.729	1000	0.891		0.519956	8		8			8		8		1001	538		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	9.269	1000	1.505		0.519956	6		6			6		6		1001	541		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	10.738	1000	1.027		0.519956	6		10			6		10		1001	543		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	9.705	1000	3.011		0.519956	5		8			5		8		1001	544		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	5.099	1000	1.983		0.519956	8		10			8		10		1001	545		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	8.141	1000	1.797		0.519956	6		18			6		18		1001	546		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	10.684	1000	2.304		0.519956	6		16			6		16		1001	547		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	5.234	1000	1.854		0.519956	5		13			5		13		1001	549		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	12.202	1000	2.160		0.519956	8		18			8		18		1001	551		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	7.577	1000	3.035		0.519956	5		16			5		16		1001	553		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	10.653	1000	1.522		0.519956	6		6			6		6		1001	554		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	8.247	1000	3.322		0.519956	7		13			7		13		1001	555		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	6.849	1000	1.712		0.519956	8		15			8		15		1001	556		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	10.034	1000	0.814		0.519956	8		14			8		14		1001	557		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	8.884	1000	2.164		0.519956	6		5			6		5		1001	558		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	3.571	1000	0.974		0.519956	8		9			8		9		1001	560		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	9.164	1000	1.163		0.519956	7		11			7		11		1001	561		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	12.127	1000	1.503		0.519956	7		7			7		7		1001	563		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	6.575	1000	2.688		0.519956	8		13			8		13		1001	564		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	6.148	1000	2.953		0.519956	8		9			8		9		1001	565		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	6.788	1000	1.156		0.519956	5		3			5		3		1001	567		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4595	10.894	1000	2.916		0.519956	5		3			5		3		1001	568		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	2.719	1000	1.774		0.650366	6		15			6		15		1001	569		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	11.134	1000	3.245		0.650366	7		11			7		11		1001	571		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	12.483	1000	3.244		0.650366	5		18			5		18		1001	572		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	11.233	1000	2.248		0.650366	6		6			6		6		1001	573		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	5.877	1000	2.567		0.650366	7		20			7		20		1001	576		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	5.852	1000	2.555		0.650366	7		8			7		8		1001	577		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	6.782	1000	2.279		0.650366	7		13			7		13		1001	578		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	4.238	1000	2.323		0.650366	8		2			8		2		1001	579		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	7.258	1000	2.647		0.650366	5		7			5		7		1001	582		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	12.214	1000	1.668		0.650366	7		10			7		10		1001	583		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	6.243	1000	3.202		0.650366	8		8			8		8		1001	584		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	2.316	1000	1.572		0.650366	6		7			6		7		1001	585		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	6.479	1000	2.610		0.650366	6		8			6		8		1001	586		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	8.442	1000	1.133		0.650366	8		16			8		16		1001	587		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	13.468	1000	2.813		0.650366	6		7			6		7		1001	588		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	8.687	1000	1.379		0.650366	6		8			6		8		1001	589		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	3.446	1000	0.812		0.650366	6		18			6		18		1001	590		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	9.064	1000	2.827		0.650366	5		8			5		8		1001	592		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	12.071	1000	2.755		0.650366	7		3			7		3		1001	593		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8288	6.656	1000	2.796		0.650366	7		19			7		19		1001	597		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	10.382	1000	2.648		0.669869	6		11			6		11		1001	598		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	12.298	1000	2.848		0.669869	8		19			8		19		1001	599		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	8.141	1000	0.834		0.669869	8		4			8		4		1001	602		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	2.296	1000	1.312		0.669869	8		8			8		8		1001	603		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	10.685	1000	2.325		0.669869	8		6			8		6		1001	604		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	8.284	1000	1.498		0.669869	6		16			6		16		1001	607		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	13.702	1000	3.124		0.669869	7		7			7		7		1001	608		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	8.864	1000	2.318		0.669869	5		12			5		12		1001	609		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	14.206	1000	2.718		0.669869	5		2			5		2		1001	610		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	13.088	1000	3.080		0.669869	6		18			6		18		1001	611		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	12.281	1000	2.879		0.669869	7		8			7		8		1001	612		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0336	4.948	1000	2.962		0.669869	6		4			6		4		1001	616		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	1.641	1000	0.816		0.701585	6		10			6		10		1001	617		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	5.753	1000	1.904		0.701585	7		8			7		8		1001	618		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	3.926	1000	0.921		0.701585	8		2			8		2		1001	619		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	2.855	1000	1.367		0.701585	6		5			6		5		1001	623		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	5.845	1000	0.737		0.701585	6		19			6		19		1001	624		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	12.398	1000	1.884		0.701585	6		2			6		2		1001	626		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	8.697	1000	1.284		0.701585	7		4			7		4		1001	627		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	5.025	1000	2.623		0.701585	8		7			8		7		1001	628		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	10.854	1000	2.891		0.701585	6		15			6		15		1001	629		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	4.161	1000	2.357		0.701585	8		4			8		4		1001	630		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	9.396	1000	1.218		0.701585	6		19			6		19		1001	631		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	4.875	1000	1.739		0.701585	5		2			5		2		1001	632		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	12.819	1000	3.081		0.701585	5		21			5		21		1001	634		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	4.917	1000	1.505		0.701585	7		6			7		6		1001	636		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	9.824	1000	1.915		0.701585	5		6			5		6		1001	637		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	9.498	1000	2.764		0.701585	6		20			6		20		1001	638		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	3.127	1000	1.888		0.701585	8		2			8		2		1001	641		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	1.412	1000	0.751		0.701585	6		8			6		8		1001	642		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	11.727	1000	2.795		0.701585	5		8			5		8		1001	645		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	2.860	1000	1.392		0.701585	7		3			7		3		1001	648		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	8.941	1000	3.187		0.701585	7		19			7		19		1001	650		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	10.133	1000	3.072		0.701585	5		3			5		3		1001	651		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	10.227	1000	2.773		0.701585	7		9			7		9		1001	653		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	4.967	1000	2.822		0.701585	6		12			6		12		1001	654		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	5.859	1000	1.942		0.701585	6		14			6		14		1001	655		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	11.201	1000	1.397		0.701585	6		8			6		8		1001	656		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	8.014	1000	1.006		0.701585	7		5			7		5		1001	659		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	8.045	1000	2.811		0.701585	6		12			6		12		1001	660		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3666	10.931	1000	1.213		0.701585	5		4			5		4		1001	661		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	5.025	1000	3.031		0.738833	6		5			6		5		1001	662		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	10.513	1000	2.510		0.738833	6		18			6		18		1001	663		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	13.729	1000	2.800		0.738833	6		11			6		11		1001	664		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	3.900	1000	0.878		0.738833	5		14			5		14		1001	665		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	6.673	1000	3.089		0.738833	7		6			7		6		1001	666		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	8.192	1000	1.363		0.738833	6		7			6		7		1001	667		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	5.307	1000	1.637		0.738833	5		11			5		11		1001	668		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	6.240	1000	3.043		0.738833	5		8			5		8		1001	669		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	9.815	1000	2.722		0.738833	6		19			6		19		1001	671		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	11.013	1000	3.094		0.738833	6		2			6		2		1001	673		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	8.069	1000	2.808		0.738833	7		12			7		12		1001	674		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	6.714	1000	1.683		0.738833	7		4			7		4		1001	675		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	1.921	1000	0.816		0.738833	7		3			7		3		1001	677		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	8.873	1000	2.581		0.738833	6		2			6		2		1001	681		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	10.451	1000	2.782		0.738833	6		12			6		12		1001	683		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	5.048	1000	3.125		0.738833	7		22			7		22		1001	684		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	2.646	1000	2.111		0.738833	7		17			7		17		1001	687		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	11.301	1000	2.671		0.738833	6		16			6		16		1001	688		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	5.151	1000	1.516		0.738833	8		17			8		17		1001	689		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	8.585	1000	1.437		0.738833	7		16			7		16		1001	690		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	11.462	1000	2.149		0.738833	7		5			7		5		1001	691		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	8.641	1000	2.888		0.738833	7		21			7		21		1001	693		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	5.351	1000	1.435		0.738833	6		1			6		1		1001	695		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	11.920	1000	3.107		0.738833	6		14			6		14		1001	696		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	11.371	1000	2.237		0.738833	5		12			5		12		1001	697		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7577	6.045	1000	1.797		0.738833	7		5			7		5		1001	698		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	5.328	1000	1.959		0.775668	5		22			5		22		1001	699		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	10.782	1000	2.120		0.775668	5		7			5		7		1001	700		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	11.750	1000	1.842		0.775668	5		6			5		6		1001	704		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	6.076	1000	1.217		0.775668	6		15			6		15		1001	705		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	13.180	1000	3.134		0.775668	6		5			6		5		1001	706		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	10.776	1000	2.528		0.775668	5		23			5		23		1001	708		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	1.719	1000	0.786		0.775668	7		9			7		9		1001	709		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	2.448	1000	1.608		0.775668	6		14			6		14		1001	710		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	11.545	1000	1.572		0.775668	6		20			6		20		1001	711		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	10.886	1000	2.843		0.775668	7		15			7		15		1001	715		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	9.258	1000	1.437		0.775668	7		22			7		22		1001	717		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	10.446	1000	1.541		0.775668	5		8			5		8		1001	719		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	1.887	1000	0.743		0.775668	8		18			8		18		1001	720		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	10.887	1000	1.301		0.775668	6		23			6		23		1001	721		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	4.345	1000	2.843		0.775668	7		16			7		16		1001	722		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	5.934	1000	0.990		0.775668	6		1			6		1		1001	723		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	11.827	1000	2.990		0.775668	6		22			6		22		1001	724		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	9.263	1000	1.078		0.775668	6		8			6		8		1001	725		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	11.380	1000	2.642		0.775668	8		11			8		11		1001	727		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1445	11.684	1000	2.959		0.775668	7		14			7		14		1001	729		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	9.704	1000	1.110		0.811954	7		6			7		6		1001	730		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	6.136	1000	0.784		0.811954	7		10			7		10		1001	731		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.847	1000	2.400		0.811954	5		22			5		22		1001	734		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	5.058	1000	1.739		0.811954	6		16			6		16		1001	736		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.512	1000	2.646		0.811954	8		21			8		21		1001	738		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	7.281	1000	1.221		0.811954	6		24			6		24		1001	739		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	2.322	1000	1.700		0.811954	8		6			8		6		1001	740		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	11.485	1000	2.090		0.811954	7		16			7		16		1001	741		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	11.698	1000	2.097		0.811954	6		22			6		22		1001	742		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.090	1000	1.974		0.811954	6		17			6		17		1001	743		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.641	1000	1.783		0.811954	6		21			6		21		1001	744		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	5.697	1000	1.558		0.811954	7		4			7		4		1001	745		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	4.915	1000	1.308		0.811954	8		10			8		10		1001	746		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	5.376	1000	1.189		0.811954	6		2			6		2		1001	747		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	7.078	1000	1.434		0.811954	8		20			8		20		1001	749		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.484	1000	2.867		0.811954	7		14			7		14		1001	753		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	8.774	1000	0.868		0.811954	7		6			7		6		1001	754		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	6.001	1000	0.732		0.811954	8		14			8		14		1001	755		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	8.863	1000	2.666		0.811954	6		5			6		5		1001	757		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	9.989	1000	1.033		0.811954	8		24			8		24		1001	758		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	13.031	1000	3.055		0.811954	6		5			6		5		1001	759		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.087	1000	0.799		0.811954	6		3			6		3		1001	761		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	6.956	1000	1.393		0.811954	8		13			8		13		1001	762		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	9.575	1000	2.175		0.811954	6		8			6		8		1001	763		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	5.196	1000	2.131		0.811954	5		24			5		24		1001	764		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	7.960	1000	0.874		0.811954	6		13			6		13		1001	767		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	11.661	1000	3.123		0.811954	7		3			7		3		1001	768		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	5.106	1000	2.959		0.811954	6		4			6		4		1001	771		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	3.714	1000	1.655		0.811954	6		11			6		11		1001	772		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	4.477	1000	2.266		0.811954	7		23			7		23		1001	773		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	3.002	1000	2.014		0.811954	6		18			6		18		1001	774		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	11.747	1000	2.406		0.811954	6		1			6		1		1001	776		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	9.637	1000	2.325		0.811954	6		12			6		12		1001	778		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	7.511	1000	1.575		0.811954	7		5			7		5		1001	779		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	6.740	1000	1.675		0.811954	5		22			5		22		1001	781		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5255	10.477	1000	2.320		0.811954	6		11			6		11		1001	782		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	12.951	1000	2.410		0.817710	5		1			5		1		1001	783		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	4.446	1000	1.246		0.817710	7		15			7		15		1001	784		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	4.563	1000	1.764		0.817710	7		18			7		18		1001	785		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	4.445	1000	0.882		0.817710	6		3			6		3		1001	786		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	9.333	1000	1.999		0.817710	8		22			8		22		1001	787		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	5.210	1000	1.490		0.817710	6		19			6		19		1001	790		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	4.390	1000	3.124		0.817710	7		23			7		23		1001	791		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	9.432	1000	2.608		0.817710	5		21			5		21		1001	792		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	5.019	1000	2.978		0.817710	5		16			5		16		1001	794		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	3.804	1000	2.096		0.817710	5		3			5		3		1001	796		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	6.883	1000	1.048		0.817710	5		24			5		24		1001	801		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	7.750	1000	2.652		0.817710	7		24			7		24		1001	804		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	10.860	1000	2.244		0.817710	5		8			5		8		1001	805		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	9.894	1000	1.250		0.817710	8		20			8		20		1001	806		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	8.120	1000	1.417		0.817710	7		10			7		10		1001	807		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	3.069	1000	2.236		0.817710	7		6			7		6		1001	808		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	12.201	1000	2.320		0.817710	6		18			6		18		1001	810		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	12.823	1000	1.845		0.817710	7		21			7		21		1001	812		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	8.742	1000	2.949		0.817710	6		2			6		2		1001	815		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	10.881	1000	2.131		0.817710	7		23			7		23		1001	816		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	9.991	1000	1.901		0.817710	7		23			7		23		1001	818		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	10.164	1000	0.730		0.817710	7		1			7		1		1001	819		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	4.036	1000	2.124		0.817710	7		14			7		14		1001	821		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	11.260	1000	0.858		0.817710	7		13			7		13		1001	825		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	6.565	1000	2.320		0.817710	6		9			6		9		1001	826		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	12.608	1000	1.934		0.817710	6		3			6		3		1001	833		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5860	7.973	1000	2.168		0.817710	5		9			5		9		1001	836		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.490	1000	2.663		0.880276	7		23			7		23		1001	839		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.202	1000	0.839		0.880276	6		11			6		11		1001	843		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	6.657	1000	1.984		0.880276	7		20			7		20		1001	845		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	6.901	1000	1.341		0.880276	6		11			6		11		1001	846		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	11.179	1000	2.080		0.880276	7		10			7		10		1001	847		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.815	1000	2.356		0.880276	7		2			7		2		1001	848		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	6.516	1000	0.757		0.880276	7		5			7		5		1001	849		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	3.690	1000	1.269		0.880276	7		18			7		18		1001	850		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	4.623	1000	1.603		0.880276	6		22			6		22		1001	851		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	12.977	1000	1.981		0.880276	6		25			6		25		1001	852		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	7.707	1000	1.235		0.880276	8		15			8		15		1001	853		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	4.170	1000	1.252		0.880276	8		1			8		1		1001	854		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	9.551	1000	2.980		0.880276	6		21			6		21		1001	856		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	7.015	1000	0.797		0.880276	6		7			6		7		1001	858		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	9.736	1000	1.779		0.880276	5		5			5		5		1001	859		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	10.507	1000	2.125		0.880276	6		21			6		21		1001	860		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	12.656	1000	2.170		0.880276	7		18			7		18		1001	863		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	10.464	1000	1.403		0.880276	7		20			7		20		1001	864		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	8.902	1000	1.399		0.880276	7		8			7		8		1001	865		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	6.975	1000	1.072		0.880276	6		26			6		26		1001	866		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	13.446	1000	2.886		0.880276	7		15			7		15		1001	867		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	10.355	1000	2.379		0.880276	7		20			7		20		1001	868		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	8.652	1000	3.011		0.880276	6		1			6		1		1001	869		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	10.680	1000	1.308		0.880276	8		15			8		15		1001	870		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	2.503	1000	1.541		0.880276	5		2			5		2		1001	872		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	12.363	1000	2.373		0.880276	5		6			5		6		1001	873		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.951	1000	2.907		0.880276	6		3			6		3		1001	874		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	11.690	1000	2.519		0.880276	7		6			7		6		1001	875		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	10.990	1000	1.550		0.880276	6		9			6		9		1001	876		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.350	1000	1.943		0.880276	5		11			5		11		1001	877		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	11.573	1000	1.456		0.880276	6		2			6		2		1001	878		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	8.826	1000	1.775		0.880276	7		12			7		12		1001	879		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2429	5.815	1000	2.958		0.880276	5		12			5		12		1001	881		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	14.469	1000	2.912		0.892491	6		6			6		6		1001	882		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	2.353	1000	1.073		0.892491	6		2			6		2		1001	883		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	12.532	1000	3.001		0.892491	7		2			7		2		1001	884		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	8.403	1000	2.237		0.892491	7		25			7		25		1001	885		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	12.154	1000	2.956		0.892491	7		22			7		22		1001	886		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	5.288	1000	2.583		0.892491	8		24			8		24		1001	888		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	6.700	1000	2.666		0.892491	8		16			8		16		1001	889		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	2.958	1000	1.649		0.892491	7		23			7		23		1001	891		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	5.516	1000	2.305		0.892491	8		3			8		3		1001	892		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	11.615	1000	1.922		0.892491	7		12			7		12		1001	893		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	7.673	1000	2.902		0.892491	8		9			8		9		1001	894		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	8.611	1000	2.349		0.892491	7		13			7		13		1001	896		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	7.098	1000	2.131		0.892491	7		3			7		3		1001	898		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	5.347	1000	2.702		0.892491	7		11			7		11		1001	899		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	5.227	1000	2.102		0.892491	6		9			6		9		1001	900		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	12.751	1000	1.854		0.892491	7		10			7		10		1001	904		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3712	6.196	1000	2.852		0.892491	8		24			8		24		1001	905		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	9.885	1000	2.483		0.894044	5		10			5		10		1001	907		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	6.340	1000	1.058		0.894044	6		14			6		14		1001	908		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	11.997	1000	2.844		0.894044	7		2			7		2		1001	909		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	7.612	1000	1.377		0.894044	7		5			7		5		1001	910		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	4.911	1000	1.052		0.894044	8		14			8		14		1001	914		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	3.821	1000	2.691		0.894044	7		13			7		13		1001	915		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	8.442	1000	1.722		0.894044	5		8			5		8		1001	916		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	10.188	1000	2.287		0.894044	7		11			7		11		1001	917		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	5.121	1000	0.880		0.894044	6		7			6		7		1001	918		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	5.218	1000	2.991		0.894044	7		18			7		18		1001	920		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	7.059	1000	0.946		0.894044	8		11			8		11		1001	921		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	7.437	1000	1.145		0.894044	7		8			7		8		1001	922		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	11.700	1000	2.523		0.894044	6		23			6		23		1001	924		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	4.926	1000	1.537		0.894044	8		9			8		9		1001	926		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	5.773	1000	3.013		0.894044	8		23			8		23		1001	927		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	11.408	1000	1.948		0.894044	6		12			6		12		1001	928		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	10.591	1000	1.100		0.894044	7		18			7		18		1001	929		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	3.593	1000	2.592		0.894044	7		4			7		4		1001	930		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	11.119	1000	1.178		0.894044	7		11			7		11		1001	931		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	4.450	1000	0.837		0.894044	5		17			5		17		1001	932		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	9.040	1000	1.009		0.894044	7		19			7		19		1001	934		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	8.659	1000	2.729		0.894044	6		16			6		16		1001	935		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	9.837	1000	2.511		0.894044	6		10			6		10		1001	936		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	5.583	1000	2.896		0.894044	5		22			5		22		1001	937		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	7.693	1000	2.915		0.894044	7		21			7		21		1001	938		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	8.614	1000	1.146		0.894044	6		13			6		13		1001	940		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	5.076	1000	3.027		0.894044	8		18			8		18		1001	941		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	6.233	1000	0.741		0.894044	7		2			7		2		1001	944		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	11.077	1000	2.786		0.894044	5		14			5		14		1001	945		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	6.959	1000	0.729		0.894044	7		10			7		10		1001	947		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	10.881	1000	2.498		0.894044	7		22			7		22		1001	948		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	7.839	1000	2.869		0.894044	8		9			8		9		1001	950		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3875	8.313	1000	1.552		0.894044	6		25			6		25		1001	951		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	10.287	1000	1.699		1.011366	7		2			7		2		1001	952		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	6.172	1000	2.271		1.011366	5		16			5		16		1001	953		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	4.274	1000	1.783		1.011366	6		16			6		16		1001	954		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	2.845	1000	1.376		1.011366	7		23			7		23		1001	955		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	4.509	1000	1.510		1.011366	7		27			7		27		1001	956		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	5.955	1000	2.451		1.011366	6		20			6		20		1001	957		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	13.504	1000	2.332		1.011366	8		7			8		7		1001	958		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	2.491	1000	0.768		1.011366	6		12			6		12		1001	959		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	7.618	1000	2.709		1.011366	6		18			6		18		1001	960		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	7.141	1000	2.618		1.011366	7		22			7		22		1001	962		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	7.672	1000	1.892		1.011366	6		5			6		5		1001	963		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	4.071	1000	1.488		1.011366	7		20			7		20		1001	964		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	6.251	1000	2.141		1.011366	7		1			7		1		1001	965		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	11.740	1000	2.378		1.011366	6		12			6		12		1001	966		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	10.560	1000	1.633		1.011366	5		22			5		22		1001	967		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	3.023	1000	1.003		1.011366	7		6			7		6		1001	968		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	3.261	1000	2.442		1.011366	5		13			5		13		1001	969		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	7.064	1000	1.975		1.011366	6		6			6		6		1001	971		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	4.003	1000	1.325		1.011366	6		27			6		27		1001	972		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	11.170	1000	2.448		1.011366	7		13			7		13		1001	974		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6193	7.981	1000	2.128		1.011366	8		26			8		26		1001	976		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	5.421	1000	1.385		1.046746	8		24			8		24		1001	977		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.970	1000	2.433		1.046746	6		4			6		4		1001	978		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	6.274	1000	1.483		1.046746	5		24			5		24		1001	979		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.945	1000	2.241		1.046746	7		19			7		19		1001	980		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.427	1000	1.965		1.046746	7		28			7		28		1001	981		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	7.437	1000	2.370		1.046746	6		6			6		6		1001	986		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.351	1000	1.772		1.046746	7		29			7		29		1001	988		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	2.338	1000	0.799		1.046746	6		15			6		15		1001	989		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	3.568	1000	1.359		1.046746	6		10			6		10		1001	990		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	11.560	1000	2.190		1.046746	7		27			7		27		1001	991		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	7.466	1000	2.656		1.046746	6		8			6		8		1001	992		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	6.097	1000	2.723		1.046746	6		29			6		29		1001	993		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	5.709	1000	2.509		1.046746	6		3			6		3		1001	995		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	2.815	1000	1.123		1.046746	6		24			6		24		1001	997		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	9.533	1000	2.939		1.046746	5		29			5		29		1001	1001		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	9.206	1000	2.180		1.046746	7		5			7		5		1001	1003		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	2.248	1000	1.043		1.046746	6		10			6		10		1001	1004		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	11.505	1000	2.222		1.046746	8		19			8		19		1001	1005		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	12.953	1000	2.572		1.046746	7		12			7		12		1001	1006		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	11.527	1000	2.924		1.046746	7		28			7		28		1001	1008		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.881	1000	1.912		1.046746	6		1			6		1		1001	1011		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	8.260	1000	1.647		1.046746	5		1			5		1		1001	1012		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	6.848	1000	2.336		1.046746	7		11			7		11		1001	1013		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.171	1000	1.731		1.046746	6		28			6		28		1001	1014		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	4.921	1000	0.720		1.046746	7		18			7		18		1001	1015		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	9.465	1000	0.922		1.046746	7		5			7		5		1001	1019		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	10.665	1000	1.355		1.046746	6		29			6		29		1001	1021		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9908	8.484	1000	1.594		1.046746	6		12			6		12		1001	1023		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	5.848	1000	2.624		1.101170	5		3			5		3		1001	1024		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.732	1000	0.845		1.101170	8		22			8		22		1001	1028		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	6.842	1000	1.775		1.101170	6		12			6		12		1001	1030		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	2.061	1000	1.585		1.101170	5		29			5		29		1001	1031		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	3.358	1000	1.901		1.101170	5		31			5		31		1001	1034		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.727	1000	0.731		1.101170	7		30			7		30		1001	1035		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.033	1000	1.879		1.101170	5		5			5		5		1001	1036		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.577	1000	1.123		1.101170	5		28			5		28		1001	1039		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	3.265	1000	0.749		1.101170	7		9			7		9		1001	1043		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	10.962	1000	1.936		1.101170	7		20			7		20		1001	1044		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	2.981	1000	1.277		1.101170	7		9			7		9		1001	1045		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	11.904	1000	1.813		1.101170	6		21			6		21		1001	1047		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	3.598	1000	1.946		1.101170	7		30			7		30		1001	1049		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	3.659	1000	2.101		1.101170	5		21			5		21		1001	1050		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	10.883	1000	2.686		1.101170	6		1			6		1		1001	1051		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	11.220	1000	2.108		1.101170	5		23			5		23		1001	1053		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	8.579	1000	1.131		1.101170	7		19			7		19		1001	1054		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	8.531	1000	0.972		1.101170	5		26			5		26		1001	1055		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	7.160	1000	1.422		1.101170	7		28			7		28		1001	1056		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	13.072	1000	2.291		1.101170	6		7			6		7		1001	1057		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	11.903	1000	2.478		1.101170	6		14			6		14		1001	1059		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.275	1000	1.641		1.101170	8		18			8		18		1001	1060		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	6.954	1000	0.976		1.101170	7		17			7		17		1001	1061		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	10.834	1000	2.319		1.101170	6		19			6		19		1001	1063		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	4.980	1000	1.212		1.101170	7		25			7		25		1001	1066		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5623	11.222	1000	2.082		1.101170	8		29			8		29		1001	1067		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	9.890	1000	2.296		1.102059	8		10			8		10		1001	1070		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	9.730	1000	1.834		1.102059	7		30			7		30		1001	1071		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	13.428	1000	2.696		1.102059	7		25			7		25		1001	1072		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	4.546	1000	1.970		1.102059	7		5			7		5		1001	1073		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	2.822	1000	1.104		1.102059	6		26			6		26		1001	1075		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	11.269	1000	1.954		1.102059	8		7			8		7		1001	1076		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	12.445	1000	2.736		1.102059	6		24			6		24		1001	1077		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	6.852	1000	1.433		1.102059	7		2			7		2		1001	1078		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	10.516	1000	1.682		1.102059	6		1			6		1		1001	1079		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	6.087	1000	2.242		1.102059	6		17			6		17		1001	1081		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	10.489	1000	1.619		1.102059	8		6			8		6		1001	1082		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	9.968	1000	0.984		1.102059	7		29			7		29		1001	1084		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5716	12.529	1000	2.056		1.102059	5		30			5		30		1001	1085		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	3.732	1000	0.949		1.151267	6		27			6		27		1001	1087		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	9.088	1000	0.807		1.151267	6		29			6		29		1001	1088		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	9.884	1000	2.173		1.151267	5		4			5		4		1001	1089		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	5.690	1000	1.082		1.151267	6		11			6		11		1001	1091		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	2.638	1000	1.439		1.151267	7		2			7		2		1001	1092		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	6.163	1000	1.529		1.151267	7		21			7		21		1001	1093		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	2.670	1000	1.777		1.151267	6		11			6		11		1001	1094		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	12.766	1000	2.826		1.151267	5		29			5		29		1001	1095		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	6.651	1000	1.482		1.151267	6		32			6		32		1001	1096		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	2.786	1000	2.144		1.151267	7		17			7		17		1001	1099		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	5.539	1000	2.416		1.151267	6		7			6		7		1001	1100		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	4.844	1000	1.015		1.151267	5		17			5		17		1001	1101		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	12.972	1000	2.189		1.151267	5		11			5		11		1001	1102		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	5.216	1000	0.717		1.151267	7		6			7		6		1001	1103		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	12.170	1000	2.003		1.151267	7		3			7		3		1001	1105		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	7.721	1000	1.813		1.151267	6		18			6		18		1001	1106		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	6.254	1000	1.208		1.151267	8		5			8		5		1001	1108		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	10.562	1000	1.814		1.151267	8		20			8		20		1001	1109		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0883	6.323	1000	1.876		1.151267	5		16			5		16		1001	1111		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	9.428	1000	2.735		1.188600	6		31			6		31		1001	1112		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.198	1000	2.486		1.188600	6		10			6		10		1001	1113		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	2.138	1000	1.420		1.188600	6		12			6		12		1001	1114		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	4.388	1000	2.468		1.188600	8		29			8		29		1001	1115		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	12.862	1000	2.737		1.188600	6		27			6		27		1001	1116		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.243	1000	2.785		1.188600	5		23			5		23		1001	1117		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	2.707	1000	1.969		1.188600	5		14			5		14		1001	1118		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	2.427	1000	1.224		1.188600	8		10			8		10		1001	1120		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	6.110	1000	2.444		1.188600	8		23			8		23		1001	1123		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	6.599	1000	1.689		1.188600	7		24			7		24		1001	1124		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	3.232	1000	0.708		1.188600	5		9			5		9		1001	1125		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	6.679	1000	2.490		1.188600	7		5			7		5		1001	1126		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	3.007	1000	0.881		1.188600	7		1			7		1		1001	1127		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	6.620	1000	2.821		1.188600	7		15			7		15		1001	1129		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	8.311	1000	1.172		1.188600	6		16			6		16		1001	1130		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.155	1000	1.198		1.188600	6		4			6		4		1001	1131		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	4.334	1000	1.708		1.188600	5		9			5		9		1001	1132		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	6.969	1000	0.825		1.188600	6		21			6		21		1001	1133		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.538	1000	2.444		1.188600	6		11			6		11		1001	1134		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	11.059	1000	1.246		1.188600	5		25			5		25		1001	1135		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.337	1000	2.437		1.188600	7		2			7		2		1001	1136		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	2.826	1000	1.646		1.188600	7		22			7		22		1001	1137		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	5.443	1000	2.453		1.188600	6		23			6		23		1001	1138		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4803	9.979	1000	1.924		1.188600	6		10			6		10		1001	1139		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	5.930	1000	1.182		1.215204	8		28			8		28		1001	1140		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	10.383	1000	1.190		1.215204	8		26			8		26		1001	1141		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	5.257	1000	1.716		1.215204	6		9			6		9		1001	1143		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	2.835	1000	1.232		1.215204	5		6			5		6		1001	1144		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	5.606	1000	2.576		1.215204	8		25			8		25		1001	1145		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	9.085	1000	0.982		1.215204	7		7			7		7		1001	1146		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	6.769	1000	2.274		1.215204	6		7			6		7		1001	1147		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	6.274	1000	1.734		1.215204	6		1			6		1		1001	1148		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	11.984	1000	2.535		1.215204	7		5			7		5		1001	1149		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	4.215	1000	1.814		1.215204	8		16			8		16		1001	1150		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	8.146	1000	1.814		1.215204	7		21			7		21		1001	1156		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	9.306	1000	1.699		1.215204	7		26			7		26		1001	1157		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	12.673	1000	2.394		1.215204	6		14			6		14		1001	1159		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	8.102	1000	2.176		1.215204	6		1			6		1		1001	1161		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	9.263	1000	1.950		1.215204	7		30			7		30		1001	1162		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	7.852	1000	1.941		1.215204	8		7			8		7		1001	1163		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	7.345	1000	1.527		1.215204	5		27			5		27		1001	1167		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7596	6.859	1000	2.290		1.215204	7		27			7		27		1001	1168		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	4.425	1000	1.234		1.232905	7		24			7		24		1001	1169		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.315	1000	1.969		1.232905	5		13			5		13		1001	1170		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	9.842	1000	1.403		1.232905	8		11			8		11		1001	1172		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	11.069	1000	2.350		1.232905	7		33			7		33		1001	1174		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	6.942	1000	1.087		1.232905	6		10			6		10		1001	1175		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	2.275	1000	0.995		1.232905	7		21			7		21		1001	1176		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.372	1000	1.353		1.232905	6		14			6		14		1001	1178		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.307	1000	1.032		1.232905	5		26			5		26		1001	1179		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	5.861	1000	0.899		1.232905	6		33			6		33		1001	1180		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	5.951	1000	2.747		1.232905	6		13			6		13		1001	1183		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.235	1000	2.796		1.232905	8		11			8		11		1001	1185		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.648	1000	2.139		1.232905	5		3			5		3		1001	1186		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.424	1000	2.529		1.232905	7		29			7		29		1001	1187		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.742	1000	2.294		1.232905	8		27			8		27		1001	1189		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	6.187	1000	1.870		1.232905	6		30			6		30		1001	1190		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	6.124	1000	2.792		1.232905	7		30			7		30		1001	1192		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	6.916	1000	2.817		1.232905	6		32			6		32		1001	1193		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	11.303	1000	2.050		1.232905	8		26			8		26		1001	1196		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.821	1000	2.393		1.232905	7		3			7		3		1001	1198		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	6.184	1000	2.712		1.232905	6		30			6		30		1001	1201		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.776	1000	2.067		1.232905	6		2			6		2		1001	1203		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	2.500	1000	1.632		1.232905	5		9			5		9		1001	1204		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	11.787	1000	2.571		1.232905	7		29			7		29		1001	1206		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.333	1000	2.637		1.232905	5		8			5		8		1001	1208		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	12.265	1000	1.824		1.232905	8		14			8		14		1001	1209		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.952	1000	1.105		1.232905	7		6			7		6		1001	1212		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.003	1000	1.908		1.232905	6		24			6		24		1001	1215		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	5.975	1000	1.135		1.232905	6		7			6		7		1001	1216		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9455	8.695	1000	1.571		1.232905	7		5			7		5		1001	1218		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	8.291	1000	2.391		1.233702	7		21			7		21		1001	1220		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	11.007	1000	1.173		1.233702	5		16			5		16		1001	1221		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	10.430	1000	1.191		1.233702	6		13			6		13		1001	1225		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	6.763	1000	2.608		1.233702	8		29			8		29		1001	1226		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	11.264	1000	1.989		1.233702	8		17			8		17		1001	1227		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	7.677	1000	2.578		1.233702	6		10			6		10		1001	1228		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.372	1000	2.163		1.233702	7		17			7		17		1001	1230		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	1.773	1000	0.851		1.233702	5		16			5		16		1001	1231		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.918	1000	2.507		1.233702	8		14			8		14		1001	1232		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	4.403	1000	2.619		1.233702	6		15			6		15		1001	1233		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	12.595	1000	2.118		1.233702	7		32			7		32		1001	1235		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	9.237	1000	0.986		1.233702	6		18			6		18		1001	1237		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	12.259	1000	2.677		1.233702	6		29			6		29		1001	1238		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	6.535	1000	0.799		1.233702	6		6			6		6		1001	1240		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	8.935	1000	1.500		1.233702	6		31			6		31		1001	1242		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	7.931	1000	1.901		1.233702	6		13			6		13		1001	1244		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.514	1000	0.707		1.233702	8		2			8		2		1001	1246		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	8.701	1000	2.014		1.233702	6		8			6		8		1001	1248		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.624	1000	1.483		1.233702	7		32			7		32		1001	1249		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	8.657	1000	1.289		1.233702	7		27			7		27		1001	1250		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.124	1000	1.828		1.233702	6		14			6		14		1001	1251		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	9.753	1000	0.850		1.233702	6		15			6		15		1001	1252		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	3.689	1000	0.763		1.233702	8		25			8		25		1001	1253		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	13.310	1000	2.434		1.233702	7		2			7		2		1001	1254		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	13.807	1000	2.612		1.233702	7		29			7		29		1001	1255		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	5.823	1000	2.422		1.233702	6		6			6		6		1001	1256		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	2.808	1000	1.294		1.233702	5		18			5		18		1001	1257		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	11.133	1000	1.180		1.233702	6		26			6		26		1001	1258		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	7.841	1000	2.337		1.233702	6		5			6		5		1001	1261		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	4.493	1000	1.492		1.233702	8		21			8		21		1001	1263		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	3.404	1000	2.245		1.233702	7		25			7		25		1001	1266		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	6.544	1000	1.374		1.233702	6		15			6		15		1001	1267		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	9.174	1000	2.599		1.233702	7		27			7		27		1001	1270		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	10.411	1000	1.897		1.233702	5		12			5		12		1001	1272		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	13.035	1000	2.502		1.233702	5		11			5		11		1001	1273		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9539	9.688	1000	2.610		1.233702	5		6			5		6		1001	1274		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	11.687	1000	2.607		1.280913	6		17			6		17		1001	1275		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	7.349	1000	2.613		1.280913	8		16			8		16		1001	1277		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	12.315	1000	2.015		1.280913	7		28			7		28		1001	1278		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	4.802	1000	1.315		1.280913	6		13			6		13		1001	1279		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	6.723	1000	2.676		1.280913	5		27			5		27		1001	1280		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	4.343	1000	0.746		1.280913	6		18			6		18		1001	1281		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	3.904	1000	2.325		1.280913	7		14			7		14		1001	1282		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	5.393	1000	1.752		1.280913	5		1			5		1		1001	1283		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.939	1000	1.675		1.280913	8		15			8		15		1001	1285		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	8.547	1000	1.421		1.280913	8		28			8		28		1001	1286		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.871	1000	2.586		1.280913	7		29			7		29		1001	1288		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.992	1000	1.528		1.280913	8		34			8		34		1001	1289		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	10.895	1000	1.526		1.280913	7		30			7		30		1001	1290		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	10.526	1000	2.527		1.280913	7		9			7		9		1001	1293		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	1.954	1000	0.843		1.280913	7		8			7		8		1001	1294		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	11.234	1000	2.749		1.280913	7		26			7		26		1001	1297		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	4.420	1000	0.742		1.280913	5		20			5		20		1001	1298		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	13.054	1000	2.272		1.280913	6		6			6		6		1001	1300		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.150	1000	1.710		1.280913	7		16			7		16		1001	1301		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	12.472	1000	2.393		1.280913	5		23			5		23		1001	1302		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	6.612	1000	1.359		1.280913	8		32			8		32		1001	1304		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	7.652	1000	1.293		1.280913	7		22			7		22		1001	1305		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	5.416	1000	2.578		1.280913	8		11			8		11		1001	1306		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	12.684	1000	2.627		1.280913	5		28			5		28		1001	1307		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	5.096	1000	2.400		1.280913	6		6			6		6		1001	1311		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	1.519	1000	0.902		1.280913	7		19			7		19		1001	1312		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	6.733	1000	1.597		1.280913	7		11			7		11		1001	1313		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	8.388	1000	1.026		1.280913	5		14			5		14		1001	1315		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	5.486	1000	2.338		1.280913	8		23			8		23		1001	1316		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	5.829	1000	2.696		1.280913	6		1			6		1		1001	1317		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	6.459	1000	0.874		1.280913	5		11			5		11		1001	1318		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	6.025	1000	0.883		1.280913	7		19			7		19		1001	1320		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	10.786	1000	2.449		1.280913	7		5			7		5		1001	1322		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	10.966	1000	1.884		1.280913	6		14			6		14		1001	1324		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	7.843	1000	2.256		1.280913	7		3			7		3		1001	1325		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.796	1000	1.770		1.280913	7		26			7		26		1001	1326		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	10.768	1000	2.455		1.280913	7		19			7		19		1001	1327		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	8.758	1000	1.239		1.280913	8		15			8		15		1001	1329		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	8.517	1000	1.434		1.280913	6		14			6		14		1001	1330		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4496	9.514	1000	1.874		1.280913	5		27			5		27		1001	1331		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	11.107	1000	2.746		1.282705	8		3			8		3		1001	1333		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	11.854	1000	2.049		1.282705	8		33			8		33		1001	1334		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	2.425	1000	0.790		1.282705	8		9			8		9		1001	1336		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	7.351	1000	2.061		1.282705	5		26			5		26		1001	1338		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	12.847	1000	2.391		1.282705	6		16			6		16		1001	1339		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	3.777	1000	1.805		1.282705	6		11			6		11		1001	1341		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	5.640	1000	1.038		1.282705	7		20			7		20		1001	1342		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	11.312	1000	1.193		1.282705	5		20			5		20		1001	1343		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	3.887	1000	2.141		1.282705	7		9			7		9		1001	1344		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	12.350	1000	1.821		1.282705	6		14			6		14		1001	1345		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	8.956	1000	1.873		1.282705	6		34			6		34		1001	1346		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4684	4.597	1000	2.072		1.282705	6		5			6		5		1001	1348		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	3.261	1000	1.874		1.293842	7		16			7		16		1001	1349		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	12.774	1000	2.333		1.293842	8		30			8		30		1001	1350		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	9.400	1000	2.695		1.293842	7		15			7		15		1001	1351		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	6.859	1000	0.934		1.293842	6		9			6		9		1001	1353		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	4.217	1000	1.948		1.293842	7		34			7		34		1001	1354		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	2.241	1000	1.224		1.293842	7		18			7		18		1001	1355		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	7.431	1000	0.942		1.293842	6		27			6		27		1001	1356		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	6.334	1000	0.976		1.293842	6		27			6		27		1001	1357		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	5.874	1000	1.651		1.293842	7		32			7		32		1001	1359		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	11.524	1000	1.381		1.293842	8		20			8		20		1001	1360		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	4.160	1000	1.908		1.293842	8		21			8		21		1001	1362		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	9.068	1000	2.633		1.293842	5		15			5		15		1001	1363		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	12.096	1000	2.378		1.293842	7		25			7		25		1001	1365		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	9.475	1000	2.172		1.293842	6		2			6		2		1001	1368		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	5.727	1000	2.252		1.293842	8		22			8		22		1001	1370		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	4.503	1000	2.626		1.293842	7		20			7		20		1001	1371		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5853	7.582	1000	2.409		1.293842	6		7			6		7		1001	1374		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	12.026	1000	2.602		1.425638	7		22			7		22		1001	1378		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	4.316	1000	2.507		1.425638	6		9			6		9		1001	1380		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	3.140	1000	0.956		1.425638	6		13			6		13		1001	1381		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	11.611	1000	1.928		1.425638	5		20			5		20		1001	1382		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	5.414	1000	1.025		1.425638	7		24			7		24		1001	1383		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	5.837	1000	2.601		1.425638	5		22			5		22		1001	1384		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	9.901	1000	2.239		1.425638	8		24			8		24		1001	1385		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	5.560	1000	2.665		1.425638	7		22			7		22		1001	1386		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	4.304	1000	1.050		1.425638	6		3			6		3		1001	1389		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	9.686	1000	1.905		1.425638	5		20			5		20		1001	1390		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	3.330	1000	1.410		1.425638	7		4			7		4		1001	1397		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	4.874	1000	2.075		1.425638	8		26			8		26		1001	1398		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	4.565	1000	2.226		1.425638	6		28			6		28		1001	1401		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	10.629	1000	1.515		1.425638	7		19			7		19		1001	1402		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	3.653	1000	0.716		1.425638	7		6			7		6		1001	1404		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	9.211	1000	2.393		1.425638	7		34			7		34		1001	1405		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	11.356	1000	1.059		1.425638	6		12			6		12		1001	1406		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	12.368	1000	2.079		1.425638	6		34			6		34		1001	1408		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	5.186	1000	2.480		1.425638	7		20			7		20		1001	1410		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	11.070	1000	2.070		1.425638	8		18			8		18		1001	1412		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	9.105	1000	0.865		1.425638	5		16			5		16		1001	1413		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	10.359	1000	1.295		1.425638	7		32			7		32		1001	1414		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	8.533	1000	1.048		1.425638	7		5			7		5		1001	1415		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	6.345	1000	1.635		1.425638	5		6			5		6		1001	1416		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	2.511	1000	1.236		1.425638	7		24			7		24		1001	1418		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	2.833	1000	1.681		1.425638	6		13			6		13		1001	1419		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	5.323	1000	0.977		1.425638	5		6			5		6		1001	1420		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	3.664	1000	1.796		1.425638	6		31			6		31		1001	1422		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9692	9.363	1000	2.106		1.425638	7		30			7		30		1001	1423		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	10.840	1000	1.972		1.455155	7		22			7		22		1001	1425		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	8.195	1000	2.573		1.455155	6		6			6		6		1001	1426		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	7.154	1000	2.388		1.455155	8		1			8		1		1001	1427		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	9.144	1000	1.150		1.455155	6		2			6		2		1001	1428		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	7.386	1000	2.423		1.455155	7		26			7		26		1001	1429		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	6.207	1000	0.867		1.455155	6		29			6		29		1001	1430		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	4.336	1000	0.723		1.455155	5		21			5		21		1001	1431		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	5.111	1000	1.331		1.455155	6		36			6		36		1001	1433		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	11.523	1000	2.576		1.455155	7		30			7		30		1001	1434		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	13.098	1000	2.330		1.455155	5		27			5		27		1001	1435		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	3.287	1000	1.958		1.455155	7		4			7		4		1001	1437		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	3.136	1000	1.574		1.455155	7		9			7		9		1001	1438		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	8.211	1000	2.269		1.455155	7		5			7		5		1001	1441		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	2.020	1000	1.021		1.455155	7		30			7		30		1001	1443		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	4.865	1000	2.001		1.455155	6		26			6		26		1001	1444		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	6.402	1000	0.934		1.455155	8		11			8		11		1001	1446		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	5.059	1000	0.824		1.455155	8		27			8		27		1001	1447		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	5.125	1000	2.258		1.455155	6		9			6		9		1001	1448		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	10.734	1000	1.874		1.455155	6		26			6		26		1001	1449		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	10.448	1000	2.340		1.455155	8		13			8		13		1001	1450		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	6.920	1000	0.971		1.455155	8		22			8		22		1001	1452		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2791	9.363	1000	1.225		1.455155	6		28			6		28		1001	1453		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	3.674	1000	1.547		1.517819	6		27			6		27		1001	1454		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	7.129	1000	1.224		1.517819	7		28			7		28		1001	1455		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	4.036	1000	1.745		1.517819	6		22			6		22		1001	1456		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	5.232	1000	2.486		1.517819	7		25			7		25		1001	1457		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	6.626	1000	2.214		1.517819	5		38			5		38		1001	1458		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	4.801	1000	0.832		1.517819	5		36			5		36		1001	1459		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	3.712	1000	2.114		1.517819	6		8			6		8		1001	1460		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	5.157	1000	2.441		1.517819	5		13			5		13		1001	1461		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	9.131	1000	2.316		1.517819	7		38			7		38		1001	1462		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	1.859	1000	1.059		1.517819	7		28			7		28		1001	1463		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	8.373	1000	2.183		1.517819	7		23			7		23		1001	1464		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	4.642	1000	0.930		1.517819	6		19			6		19		1001	1465		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	4.730	1000	0.746		1.517819	5		15			5		15		1001	1466		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	1.794	1000	1.011		1.517819	6		8			6		8		1001	1467		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9371	9.844	1000	2.096		1.517819	6		29			6		29		1001	1469		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9867	15.292	1000	9.558		3.000000	4		10			4		10		1001	1652		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2923	14.773	1000	11.819		3.000000	5		5			5		5		1001	1684		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6585	11.843	1000	9.474		3.000000	8		13			8		13		1001	1737		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2326	15.355	1000	9.597		3.000000	4		9			4		9		1001	1682		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2565	18.653	1000	11.658		3.222222	1		13			1		13		1001	1791		0				1			5			20			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	7.292	1000	1.701		1.645339	6		16			6		16		1001	1470		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	5.422	1000	1.568		1.645339	6		4			6		4		1001	1472		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	8.401	1000	1.385		1.645339	7		26			7		26		1001	1474		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	10.362	1000	1.067		1.645339	6		13			6		13		1001	1475		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	3.409	1000	0.738		1.645339	8		28			8		28		1001	1476		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	4.738	1000	0.837		1.645339	6		13			6		13		1001	1478		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	3.502	1000	0.917		1.645339	6		16			6		16		1001	1479		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	5.547	1000	1.973		1.645339	8		15			8		15		1001	1480		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	5.678	1000	1.752		1.645339	6		13			6		13		1001	1483		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	12.364	1000	2.385		1.645339	6		11			6		11		1001	1484		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	1.831	1000	1.128		1.645339	6		31			6		31		1001	1485		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	5.647	1000	1.621		1.645339	5		9			5		9		1001	1487		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	6.220	1000	1.957		1.645339	8		35			8		35		1001	1489		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	6.052	1000	1.963		1.645339	7		31			7		31		1001	1495		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	10.518	1000	2.016		1.645339	5		12			5		12		1001	1496		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	7.174	1000	1.559		1.645339	6		36			6		36		1001	1498		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	6.102	1000	1.320		1.645339	6		18			6		18		1001	1499		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	1.991	1000	1.411		1.645339	5		32			5		32		1001	1502		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	9.568	1000	2.073		1.645339	7		5			7		5		1001	1504		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	5.545	1000	2.274		1.645339	5		31			5		31		1001	1506		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	11.369	1000	1.231		1.645339	8		39			8		39		1001	1507		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	6.393	1000	0.910		1.645339	6		35			6		35		1001	1508		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	4.481	1000	2.142		1.645339	6		26			6		26		1001	1509		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	11.343	1000	1.416		1.645339	7		25			7		25		1001	1512		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	6.509	1000	0.822		1.645339	6		36			6		36		1001	1513		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	2.224	1000	1.111		1.645339	6		20			6		20		1001	1514		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	7.332	1000	2.189		1.645339	6		23			6		23		1001	1515		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2761	4.573	1000	1.491		1.645339	6		24			6		24		1001	1517		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9644	13.664	1000	10.931		3.000000	6		13			6		13		1001	1666		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2377	12.862	1000	10.289		3.000000	1		18			1		18		1001	1727		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3079	16.697	1000	10.436		3.000000	6		7			6		7		1001	1708		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4432	12.117	1000	9.693		3.000000	7		5			7		5		1001	1721		1				1			5			20			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	12.230	1000	1.836		1.771450	7		22			7		22		1001	1518		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	6.571	1000	1.555		1.771450	8		26			8		26		1001	1519		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.795	1000	1.154		1.771450	6		30			6		30		1001	1520		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.351	1000	1.475		1.771450	6		26			6		26		1001	1521		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.019	1000	2.320		1.771450	6		16			6		16		1001	1522		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	7.031	1000	2.115		1.771450	8		32			8		32		1001	1523		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	6.720	1000	1.080		1.771450	5		23			5		23		1001	1524		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	4.304	1000	0.835		1.771450	7		17			7		17		1001	1525		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.535	1000	2.409		1.771450	5		28			5		28		1001	1526		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.745	1000	1.551		1.771450	7		39			7		39		1001	1528		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	3.544	1000	1.483		1.771450	8		5			8		5		1001	1529		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.367	1000	1.725		1.771450	6		28			6		28		1001	1530		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	5.626	1000	0.884		1.771450	6		42			6		42		1001	1531		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	9.444	1000	1.669		1.771450	8		32			8		32		1001	1532		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	2.977	1000	1.469		1.771450	7		15			7		15		1001	1534		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	8.028	1000	0.900		1.771450	7		25			7		25		1001	1535		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	11.072	1000	2.408		1.771450	7		13			7		13		1001	1536		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6002	3.648	1000	2.408		1.771450	6		10			6		10		1001	1539		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9083	11.694	1000	9.355		3.000000	3		6			3		6		1001	1693		1				1			5			20			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	3.202	1000	1.039		1.805293	8		31			8		31		1001	1540		0				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	7.310	1000	2.382		1.805293	7		34			7		34		1001	1541		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	10.273	1000	1.879		1.805293	6		1			6		1		1001	1542		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	4.827	1000	1.542		1.805293	6		12			6		12		1001	1543		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	2.054	1000	0.975		1.805293	6		17			6		17		1001	1545		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	6.292	1000	2.143		1.805293	8		28			8		28		1001	1547		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	11.085	1000	2.133		1.805293	6		44			6		44		1001	1548		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	9.646	1000	0.977		1.805293	7		20			7		20		1001	1549		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	4.251	1000	1.841		1.805293	7		22			7		22		1001	1550		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	12.044	1000	2.364		1.805293	8		5			8		5		1001	1551		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	9.681	1000	2.018		1.805293	6		32			6		32		1001	1553		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	6.844	1000	0.897		1.805293	6		44			6		44		1001	1554		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	10.743	1000	2.063		1.805293	7		21			7		21		1001	1555		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	9.586	1000	1.571		1.805293	7		18			7		18		1001	1556		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	8.419	1000	2.275		1.805293	7		23			7		23		1001	1557		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	6.471	1000	1.817		1.805293	5		40			5		40		1001	1558		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	8.067	1000	1.638		1.805293	7		18			7		18		1001	1559		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9556	10.428	1000	1.330		1.805293	6		35			6		35		1001	1562		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0139	14.988	1000	9.368		3.000000	7		18			7		18		1001	1710		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0801	18.008	1000	11.255		3.000000	7		14			7		14		1001	1651		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1083	11.464	1000	9.171		3.000000	4		4			4		4		1001	1663		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3445	13.257	1000	10.606		3.000000	0		6			0		6		1001	1679		1				1			5			20			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	9.877	1000	0.933		1.855343	7		32			7		32		1001	1563		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	11.146	1000	1.619		1.855343	7		14			7		14		1001	1567		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	3.530	1000	1.184		1.855343	7		4			7		4		1001	1572		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	4.671	1000	1.594		1.855343	7		33			7		33		1001	1573		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	4.092	1000	0.884		1.855343	7		18			7		18		1001	1574		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	8.510	1000	0.958		1.855343	7		30			7		30		1001	1575		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	8.789	1000	1.136		1.855343	5		6			5		6		1001	1576		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	3.529	1000	1.355		1.855343	6		28			6		28		1001	1578		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	4.911	1000	1.886		1.855343	5		43			5		43		1001	1579		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	5.846	1000	1.226		1.855343	5		27			5		27		1001	1580		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	7.252	1000	0.993		1.855343	6		14			6		14		1001	1581		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4811	11.519	1000	2.205		1.855343	6		45			6		45		1001	1582		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.6757	15.980	1000	9.988		3.000000	8		9			8		9		1001	1673		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.8112	16.612	1000	10.382		3.000000	7		9			7		9		1001	1644		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.8173	16.600	1000	10.375		3.000000	5		4			5		4		1001	1711		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1234	12.381	1000	9.905		3.000000	1		13			1		13		1001	1700		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1761	11.505	1000	9.204		3.000000	4		2			4		2		1001	1659		1				1			5			20			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.752	1000	1.745		1.929700	7		17			7		17		1001	1583		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	4.934	1000	2.096		1.929700	6		36			6		36		1001	1585		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	9.158	1000	2.096		1.929700	6		30			6		30		1001	1586		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	1.536	1000	0.732		1.929700	7		19			7		19		1001	1590		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	10.738	1000	2.204		1.929700	5		26			5		26		1001	1592		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	5.658	1000	1.231		1.929700	6		48			6		48		1001	1594		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	6.769	1000	1.065		1.929700	6		5			6		5		1001	1595		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	6.476	1000	0.996		1.929700	8		46			8		46		1001	1597		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	4.695	1000	2.082		1.929700	5		25			5		25		1001	1598		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	8.681	1000	0.867		1.929700	7		42			7		42		1001	1599		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	5.800	1000	1.671		1.929700	6		30			6		30		1001	1600		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	2.687	1000	0.903		1.929700	7		33			7		33		1001	1601		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	5.137	1000	1.334		1.929700	8		2			8		2		1001	1603		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	9.831	1000	1.325		1.929700	5		14			5		14		1001	1604		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	4.166	1000	1.323		1.929700	7		23			7		23		1001	1605		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	8.102	1000	1.800		1.929700	6		34			6		34		1001	1607		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.854	1000	1.932		1.929700	6		3			6		3		1001	1611		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	3.973	1000	0.777		1.929700	7		3			7		3		1001	1612		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	9.567	1000	1.864		1.929700	8		45			8		45		1001	1613		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	10.632	1000	2.178		1.929700	5		13			5		13		1001	1614		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	10.738	1000	2.271		1.929700	5		24			5		24		1001	1615		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	1.760	1000	1.397		1.929700	5		2			5		2		1001	1616		1				1			2			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	10.738	1000	0.799		1.929700	5		45			5		45		1001	1618		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	8.815	1000	0.782		1.929700	6		46			6		46		1001	1619		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.476	1000	1.995		1.929700	6		8			6		8		1001	1621		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	6.401	1000	1.117		1.929700	6		47			6		47		1001	1622		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.467	1000	1.159		1.929700	6		8			6		8		1001	1623		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	6.555	1000	1.007		1.929700	5		44			5		44		1001	1624		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	10.360	1000	2.246		1.929700	7		40			7		40		1001	1626		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	9.570	1000	1.766		1.929700	6		22			6		22		1001	1627		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	4.734	1000	0.987		1.929700	7		20			7		20		1001	1628		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.370	1000	2.189		1.929700	7		33			7		33		1001	1629		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	9.750	1000	1.750		1.929700	7		33			7		33		1001	1631		1				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	6.510	1000	1.748		1.929700	6		24			6		24		1001	1632		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	8.412	1000	1.219		1.929700	6		23			6		23		1001	1633		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	4.322	1000	2.204		1.929700	7		17			7		17		1001	1634		0				1			5			20			0.0000		105.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2618	7.832	1000	1.583		1.929700	7		17			7		17		1001	1635		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. tutto il monco in festa"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3415	17.580	1000	10.987		3.000000	4		18			4		18		1001	1660		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3510	12.772	1000	10.217		3.000000	6		9			6		9		1001	1674		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4266	12.896	1000	10.317		3.000000	5		13			5		13		1001	1694		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4918	11.364	1000	9.092		3.000000	5		9			5		9		1001	1686		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4919	15.024	1000	9.390		3.000000	0		18			0		18		1001	1638		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5209	15.867	1000	9.917		3.000000	0		11			0		11		1001	1681		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5323	15.214	1000	9.509		3.000000	7		2			7		2		1001	1732		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6000	12.738	1000	10.190		3.000000	0		15			0		15		1001	1709		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6727	18.596	1000	11.623		3.000000	8		12			8		12		1001	1645		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7079	15.853	1000	9.908		3.000000	5		11			5		11		1001	1655		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7504	11.482	1000	9.186		3.000000	6		14			6		14		1001	1697		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7733	11.519	1000	9.215		3.000000	5		10			5		10		1001	1661		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8213	15.006	1000	9.379		3.000000	6		3			6		3		1001	1690		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8923	14.903	1000	9.314		3.222222	5		16			5		16		1001	1790		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9317	12.694	1000	10.155		3.222222	0		5			0		5		1001	1814		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9738	14.197	1000	11.357		3.000000	4		2			4		2		1001	1704		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0126	14.112	1000	11.289		3.222222	4		3			4		3		1001	1772		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0172	12.092	1000	9.673		3.000000	3		3			3		3		1001	1706		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0257	18.354	1000	11.471		3.000000	8		10			8		10		1001	1723		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0372	13.732	1000	10.986		3.000000	2		3			2		3		1001	1735		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0373	16.701	1000	10.438		3.000000	1		5			1		5		1001	1722		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0540	11.270	1000	9.016		3.000000	0		18			0		18		1001	1736		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0587	11.254	1000	9.003		3.222222	8		2			8		2		1001	1742		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0737	18.272	1000	11.420		3.000000	3		17			3		17		1001	1656		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0910	18.229	1000	11.393		3.000000	0		11			0		11		1001	1691		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1172	18.901	1000	11.813		3.000000	3		1			3		1		1001	1716		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1316	14.420	1000	11.536		3.000000	1		16			1		16		1001	1707		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1353	11.553	1000	9.243		3.000000	8		16			8		16		1001	1683		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1806	14.577	1000	11.662		3.000000	5		11			5		11		1001	1678		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.2313	18.626	1000	11.641		3.000000	6		10			6		10		1001	1717		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3137	13.879	1000	11.103		3.000000	1		2			1		2		1001	1649		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3167	18.693	1000	11.683		3.000000	4		10			4		10		1001	1677		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3233	18.045	1000	11.278		3.000000	4		3			4		3		1001	1667		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3590	13.961	1000	11.169		3.000000	7		16			7		16		1001	1689		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3666	15.250	1000	9.531		3.000000	6		5			6		5		1001	1685		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3790	16.243	1000	10.152		3.222222	0		11			0		11		1001	1828		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3893	14.542	1000	9.089		3.000000	8		17			8		17		1001	1698		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5061	11.544	1000	9.235		3.222222	3		16			3		16		1001	1740		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5509	18.452	1000	11.533		3.222222	3		17			3		17		1001	1799		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5735	11.730	1000	9.384		3.000000	0		14			0		14		1001	1640		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5759	14.748	1000	11.798		3.000000	2		5			2		5		1001	1650		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5808	13.374	1000	10.699		3.222222	3		7			3		7		1001	1843		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6021	14.935	1000	11.948		3.000000	8		7			8		7		1001	1688		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7645	15.315	1000	9.572		3.222222	4		6			4		6		1001	1778		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7993	13.672	1000	10.938		3.222222	2		4			2		4		1001	1788		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.8098	12.495	1000	9.996		3.000000	0		6			0		6		1001	1728		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9176	12.755	1000	10.204		3.222222	5		10			5		10		1001	1806		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9339	15.817	1000	9.886		3.000000	2		5			2		5		1001	1669		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.0862	16.817	1000	10.510		3.222222	6		15			6		15		1001	1819		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.1468	13.735	1000	10.988		3.000000	2		11			2		11		1001	1713		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2384	11.078	1000	8.862		3.222222	8		2			8		2		1001	1771		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2801	14.272	1000	11.418		3.000000	2		7			2		7		1001	1653		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3780	14.869	1000	11.895		3.000000	7		4			7		4		1001	1671		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4838	12.209	1000	9.767		3.222222	4		17			4		17		1001	1822		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.6334	18.497	1000	11.560		3.000000	7		11			7		11		1001	1670		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.6356	12.223	1000	9.778		3.222222	6		5			6		5		1001	1792		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7100	14.534	1000	11.627		3.222222	6		16			6		16		1001	1750		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7501	16.548	1000	10.343		3.000000	6		5			6		5		1001	1715		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7882	11.005	1000	8.804		3.222222	7		11			7		11		1001	1789		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8647	13.025	1000	10.420		3.000000	3		19			3		19		1001	1730		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0806	15.401	1000	9.626		3.222222	6		12			6		12		1001	1775		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0868	13.998	1000	11.198		3.222222	4		17			4		17		1001	1832		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1510	17.532	1000	10.957		3.222222	3		2			3		2		1001	1840		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1622	13.721	1000	10.977		3.222222	7		16			7		16		1001	1820		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.2069	15.021	1000	9.388		3.000000	5		10			5		10		1001	1699		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.2163	13.694	1000	10.955		3.222222	7		9			7		9		1001	1784		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.2858	11.840	1000	9.472		3.222222	7		5			7		5		1001	1812		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3254	15.615	1000	9.759		3.000000	5		10			5		10		1001	1696		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3286	13.584	1000	10.867		3.222222	7		14			7		14		1001	1787		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3832	12.211	1000	9.769		3.222222	5		8			5		8		1001	1830		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4050	17.021	1000	10.638		3.222222	5		19			5		19		1001	1779		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4298	19.191	1000	11.994		3.000000	1		17			1		17		1001	1646		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4575	13.329	1000	10.663		3.222222	2		13			2		13		1001	1810		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5357	13.583	1000	10.866		3.222222	4		14			4		14		1001	1774		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5526	11.425	1000	9.140		3.222222	6		9			6		9		1001	1773		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5799	15.425	1000	9.641		3.222222	5		3			5		3		1001	1743		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5834	10.697	1000	8.557		3.222222	7		5			7		5		1001	1841		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5894	14.396	1000	8.997		3.222222	7		2			7		2		1001	1793		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6096	15.201	1000	9.500		3.222222	6		18			6		18		1001	1762		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6187	18.164	1000	11.352		3.222222	3		2			3		2		1001	1839		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6256	13.498	1000	10.798		3.000000	2		1			2		1		1001	1662		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6468	16.999	1000	10.624		3.222222	1		18			1		18		1001	1747		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6770	14.907	1000	11.925		3.000000	2		15			2		15		1001	1654		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7982	16.294	1000	10.184		3.222222	7		7			7		7		1001	1764		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8077	11.577	1000	9.262		3.222222	3		1			3		1		1001	1842		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8470	14.277	1000	11.422		3.222222	1		18			1		18		1001	1804		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8555	13.790	1000	8.619		3.222222	5		19			5		19		1001	1838		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8985	14.289	1000	8.931		3.222222	2		4			2		4		1001	1818		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9515	14.699	1000	9.187		3.000000	6		4			6		4		1001	1664		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9898	14.019	1000	11.215		3.000000	1		15			1		15		1001	1720		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0518	16.001	1000	10.000		3.222222	7		2			7		2		1001	1845		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0581	16.780	1000	10.487		3.000000	7		19			7		19		1001	1642		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0949	12.088	1000	9.671		3.222222	3		2			3		2		1001	1823		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1574	11.751	1000	9.401		3.222222	3		11			3		11		1001	1758		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1628	16.276	1000	10.172		3.222222	4		1			4		1		1001	1755		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1639	18.610	1000	11.631		3.222222	5		6			5		6		1001	1826		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1812	12.959	1000	10.367		3.222222	5		3			5		3		1001	1746		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1899	13.759	1000	11.008		3.222222	4		16			4		16		1001	1754		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2000	15.878	1000	9.924		3.222222	3		16			3		16		1001	1817		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2482	16.073	1000	10.046		3.222222	1		7			1		7		1001	1757		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3131	14.434	1000	11.547		3.222222	7		8			7		8		1001	1767		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3189	17.127	1000	10.704		3.222222	4		15			4		15		1001	1807		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3346	16.369	1000	10.231		3.222222	7		12			7		12		1001	1837		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3859	11.549	1000	9.239		3.222222	6		11			6		11		1001	1769		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4266	11.547	1000	9.237		3.222222	4		12			4		12		1001	1801		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4271	12.455	1000	9.964		3.222222	2		16			2		16		1001	1763		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4989	14.379	1000	11.503		3.222222	7		8			7		8		1001	1759		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5148	16.755	1000	10.472		3.222222	7		7			7		7		1001	1821		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6416	14.340	1000	11.472		3.222222	3		18			3		18		1001	1768		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7202	12.230	1000	9.784		3.222222	2		19			2		19		1001	1770		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7623	12.907	1000	10.326		3.222222	2		19			2		19		1001	1741		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7985	13.749	1000	8.593		3.222222	5		6			5		6		1001	1752		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7986	11.559	1000	9.247		3.222222	1		18			1		18		1001	1786		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.8095	14.817	1000	9.260		3.222222	4		18			4		18		1001	1796		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0805	10.643	1000	8.514		3.222222	6		7			6		7		1001	1738		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1413	13.937	1000	8.710		3.222222	5		10			5		10		1001	1811		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.2499	14.734	1000	9.209		3.222222	5		15			5		15		1001	1753		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4337	11.397	1000	9.117		3.000000	1		3			1		3		1001	1724		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5581	11.174	1000	8.939		3.222222	4		5			4		5		1001	1844		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8815	13.048	1000	10.438		3.222222	0		14			0		14		1001	1809		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9023	10.629	1000	8.503		3.222222	6		9			6		9		1001	1776		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9473	14.165	1000	11.332		3.000000	5		14			5		14		1001	1639		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0837	14.163	1000	11.331		3.222222	2		4			2		4		1001	1748		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4811	18.650	1000	11.656		3.222222	3		10			3		10		1001	1761		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6572	14.000	1000	8.750		3.222222	5		15			5		15		1001	1827		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0854	18.405	1000	11.503		3.222222	1		19			1		19		1001	1777		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1452	18.613	1000	11.633		3.222222	6		17			6		17		1001	1824		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5130	14.023	1000	8.764		3.222222	7		1			7		1		1001	1744		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5800	9.407	1000	7.525		3.888889	5		6			5		6		1001	1869		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.0173	13.262	1000	10.610		3.222222	8		18			8		18		1001	1781		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1442	16.888	1000	10.555		3.222222	3		19			3		19		1001	1802		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4084	9.711	1000	7.769		3.888889	5		1			5		1		1001	1905		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.7690	9.196	1000	7.357		3.888889	4		10			4		10		1001	1895		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0608	13.912	1000	8.695		3.888889	2		11			2		11		1001	1902		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.2602	12.887	1000	8.054		3.888889	2		12			2		12		1001	1882		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.5798	11.050	1000	8.840		3.888889	2		6			2		6		1001	1876		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6169	10.294	1000	8.235		3.888889	5		5			5		5		1001	1913		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5253	12.755	1000	10.204		3.888889	3		5			3		5		1001	1896		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5810	15.460	1000	9.663		3.888889	4		15			4		15		1001	1916		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.7009	11.418	1000	7.136		3.888889	2		3			2		3		1001	1911		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.7822	10.162	1000	8.130		3.888889	4		19			4		19		1001	1859		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.0891	11.590	1000	7.244		3.888889	2		4			2		4		1001	1897		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1584	8.811	1000	7.049		3.888889	5		2			5		2		1001	1848		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4811	13.168	1000	10.535		3.888889	5		11			5		11		1001	1862		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.9086	15.217	1000	9.511		3.888889	2		7			2		7		1001	1886		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.9696	15.294	1000	9.559		3.888889	5		5			5		5		1001	1863		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0093	15.630	1000	9.769		3.888889	4		7			4		7		1001	1891		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0496	16.112	1000	10.070		3.888889	2		11			2		11		1001	1914		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0759	15.250	1000	9.531		3.888889	4		17			4		17		1001	1879		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.1135	13.145	1000	8.216		3.888889	2		1			2		1		1001	1915		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.6482	11.032	1000	8.826		3.888889	2		8			2		8		1001	1846		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.6596	14.291	1000	8.932		3.888889	6		7			6		7		1001	1871		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7082	9.867	1000	7.894		3.888889	3		7			3		7		1001	1874		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7335	9.832	1000	7.866		3.888889	2		10			2		10		1001	1850		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7761	12.203	1000	7.627		3.888889	6		6			6		6		1001	1849		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8107	9.405	1000	7.524		3.888889	6		6			6		6		1001	1852		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8284	12.994	1000	10.395		3.888889	2		11			2		11		1001	1881		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.9856	12.658	1000	7.911		3.888889	6		2			6		2		1001	1910		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.0236	14.728	1000	9.205		3.888889	2		7			2		7		1001	1880		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.3711	9.150	1000	7.320		3.888889	7		9			7		9		1001	1855		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.5296	12.526	1000	7.829		3.888889	5		17			5		17		1001	1894		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8083	9.411	1000	7.529		3.888889	6		18			6		18		1001	1898		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8616	15.989	1000	9.993		3.888889	2		9			2		9		1001	1873		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.9056	11.356	1000	7.097		3.888889	8		11			8		11		1001	1877		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.5516	13.992	1000	8.745		3.888889	6		6			6		6		1001	1889		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.7181	11.589	1000	9.271		3.888889	7		9			7		9		1001	1867		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.9441	11.710	1000	9.368		3.888889	7		15			7		15		1001	1908		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.1642	15.927	1000	9.955		3.888889	4		2			4		2		1001	1847		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.5004	9.519	1000	7.615		3.888889	7		18			7		18		1001	1912		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.2458	12.242	1000	7.651		3.888889	6		12			6		12		1001	1858		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	122.2188	12.573	1000	7.858		3.888889	6		12			6		12		1001	1899		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	122.3390	12.914	1000	8.071		3.888889	1		18			1		18		1001	1904		0				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	122.5266	12.760	1000	7.975		3.888889	7		14			7		14		1001	1890		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.1584	15.301	1000	9.563		3.888889	7		9			7		9		1001	1857		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.0011	12.004	1000	9.603		3.888889	7		4			7		4		1001	1903		1				1			5			20			105.0000		42.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.5606	39.928	1002	28.913		0.750606	3		20			3		20		1003	1917		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.5717	48.366	1004	31.728		0.750606	3		10			3		10		1005	1918		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.6323	48.366	1006	29.368		0.750606	3		36			3		36		1007	1919		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	141.6617	35.236	1006	26.142		1.643802	3		23			3		23		1007	1923		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	141.6951	35.236	1002	24.433		1.643802	3		-9			3		1		1003	1922		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	141.7047	35.236	1008	27.507		1.643802	3		10			3		10		1009	1920		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	141.7396	35.236	1006	24.377		1.643802	3		13			3		13		1007	1924		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	141.7613	35.236	1006	25.948		1.643802	3		15			3		15		1007	1921		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	143.6394	33.369	1006	23.423		1.770816	3		35			3		35		1007	1925		1				1			2			20			105.0000		42.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	143.6505	33.369	1008	24.758		1.770816	3		6			3		6		1009	1926		0				1			2			20			105.0000		42.000		30.000		1

; =============================================================================
; SEZIONE: "Te rompo rculo"
; Inizio: 187.000s, Durata: 40.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8357	14.540	1010	9.087		3.000000	5		44			5		44		1011	2154		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8395	8.312	1012	6.650		3.000000	4		11			4		11		1013	1952		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8605	5.573	1002	5.573		3.000000	1		13			1		13		1003	1971		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8884	11.518	1002	9.214		3.000000	1		40			1		40		1003	2183		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8920	8.940	1010	7.152		3.000000	5		14			5		14		1011	2010		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.8936	12.127	1002	9.701		3.000000	7		10			7		10		1003	2224		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9036	7.947	1010	6.358		3.000000	6		41			6		41		1011	2020		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9039	8.929	1002	7.144		3.000000	0		25			0		25		1003	2207		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9041	9.141	1010	9.141		3.000000	0		31			0		31		1011	2117		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9046	9.697	1010	9.697		3.000000	7		10			7		10		1011	2001		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9055	7.640	1010	6.112		3.000000	1		8			1		8		1011	2083		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9056	9.828	1010	7.862		3.000000	2		11			2		11		1011	2162		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9069	7.480	1012	5.984		3.000000	4		28			4		28		1013	2065		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9112	7.635	1010	7.635		3.000000	2		20			2		20		1011	2000		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9124	6.992	1002	6.992		3.000000	6		36			6		36		1003	2125		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9125	11.374	1002	9.099		3.000000	4		18			4		18		1003	2151		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9133	10.881	1002	6.801		3.000000	6		47			6		47		1003	2159		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9137	10.442	1002	8.353		3.000000	1		3			1		3		1003	1998		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9167	14.086	1002	8.804		3.000000	8		8			8		8		1003	2018		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9191	9.087	1002	9.087		3.000000	6		16			6		16		1003	2129		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9199	6.867	1002	5.494		3.000000	2		10			2		10		1003	2190		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9204	14.323	1002	8.952		3.000000	3		24			3		24		1003	1945		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9218	8.492	1012	6.794		3.000000	6		40			6		40		1013	2176		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9223	10.005	1012	8.004		3.000000	8		14			8		14		1013	2161		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9230	9.924	1002	7.940		3.000000	4		24			4		24		1003	2209		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9238	7.212	1002	5.770		3.000000	3		7			3		7		1003	2081		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9251	10.582	1002	8.466		3.000000	4		39			4		39		1003	2096		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9281	5.890	1012	5.890		3.000000	6		1			6		1		1013	2005		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9285	12.395	1012	9.916		3.000000	1		32			1		32		1013	2165		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9292	15.569	1010	9.731		3.000000	2		29			2		29		1011	1979		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9299	6.119	1010	6.119		3.000000	4		19			4		19		1011	2021		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9304	7.877	1002	6.301		3.000000	3		48			3		48		1003	2116		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9326	7.579	1002	7.579		3.000000	5		21			5		21		1003	2198		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9337	8.423	1010	6.739		3.000000	8		6			8		6		1011	2098		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9342	8.643	1002	8.643		3.000000	7		18			7		18		1003	2084		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9348	9.018	1012	7.215		3.000000	5		2			5		2		1013	2102		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9351	8.712	1012	5.445		3.000000	7		20			7		20		1013	2032		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9351	8.077	1012	8.077		3.000000	5		35			5		35		1013	2153		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9354	9.004	1012	5.627		3.000000	2		49			2		49		1013	2038		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9359	7.870	1012	6.296		3.000000	6		43			6		43		1013	2053		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9360	8.531	1012	6.825		3.000000	1		26			1		26		1013	2075		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9366	12.397	1012	9.917		3.000000	1		28			1		28		1013	2185		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9378	5.973	1002	5.973		3.000000	5		16			5		16		1003	2105		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9382	12.085	1002	7.553		3.000000	2		29			2		29		1003	2040		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9408	5.746	1006	5.746		3.000000	2		41			2		41		1007	1987		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9411	8.176	1010	8.176		3.000000	1		18			1		18		1011	1949		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9413	7.300	1010	7.300		3.000000	5		27			5		27		1011	2122		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9421	14.076	1002	8.798		3.000000	7		39			7		39		1003	2227		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9439	8.349	1002	6.679		3.000000	4		7			4		7		1003	1934		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9440	8.575	1012	5.359		3.000000	8		45			8		45		1013	1958		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9440	9.157	1012	7.326		3.000000	7		29			7		29		1013	1932		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9453	6.442	1002	5.154		3.000000	5		49			5		49		1003	2155		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9456	6.963	1010	6.963		3.000000	2		24			2		24		1011	2080		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9466	15.915	1002	9.947		3.000000	3		1			3		1		1003	2111		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9478	10.090	1012	8.072		3.000000	7		43			7		43		1013	2043		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9488	6.032	1010	6.032		3.000000	6		29			6		29		1011	1982		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9493	5.309	1012	5.309		3.000000	3		44			3		44		1013	1990		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9514	8.289	1012	6.631		3.000000	5		34			5		34		1013	1951		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9525	8.978	1010	8.978		3.000000	4		39			4		39		1011	2087		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9545	9.688	1012	7.750		3.000000	9		30			9		30		1013	2131		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9545	8.315	1012	8.315		3.000000	7		40			7		40		1013	2082		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9546	9.059	1010	7.247		3.000000	4		45			4		45		1011	2170		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9552	12.725	1012	7.953		3.000000	5		42			5		42		1013	2094		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9561	9.424	1012	9.424		3.000000	9		46			9		46		1013	1942		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9567	8.947	1012	5.592		3.000000	3		17			3		17		1013	2177		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9569	5.545	1010	5.545		3.000000	6		18			6		18		1011	2015		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9572	5.295	1012	5.295		3.000000	8		17			8		17		1013	1936		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9583	15.040	1012	9.400		3.000000	5		14			5		14		1013	2056		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9593	9.580	1002	9.580		3.000000	1		7			1		7		1003	2228		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9605	8.347	1002	8.347		3.000000	8		14			8		14		1003	1996		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9607	10.842	1012	6.776		3.000000	5		15			5		15		1013	1946		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9620	9.612	1012	9.612		3.000000	8		29			8		29		1013	2214		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9621	12.031	1012	9.624		3.000000	3		35			3		35		1013	1965		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9625	13.700	1002	8.562		3.000000	4		24			4		24		1003	2233		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9632	10.881	1012	6.801		3.000000	3		12			3		12		1013	1976		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9645	5.059	1006	5.059		3.000000	9		18			9		18		1007	2033		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9649	6.555	1002	6.555		3.000000	1		8			1		8		1003	1981		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9653	9.040	1004	5.650		3.000000	2		19			2		19		1005	2139		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9660	8.010	1002	8.010		3.000000	9		1			9		1		1003	2019		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9667	9.978	1002	9.978		3.000000	2		20			2		20		1003	2057		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9673	10.994	1010	6.871		3.000000	5		5			5		5		1011	1964		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9674	11.688	1002	9.351		3.000000	5		30			5		30		1003	2046		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9692	10.543	1012	6.590		3.000000	0		20			0		20		1013	2174		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9695	9.640	1012	7.712		3.000000	0		33			0		33		1013	2063		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9696	6.152	1012	6.152		3.000000	1		30			1		30		1013	2229		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9699	11.889	1002	7.430		3.000000	9		8			9		8		1003	1992		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9702	8.216	1012	8.216		3.000000	4		5			4		5		1013	2147		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9704	5.468	1002	5.468		3.000000	8		18			8		18		1003	2156		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9712	8.657	1008	6.925		3.000000	3		30			3		30		1009	2206		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9715	7.321	1010	5.857		3.000000	7		22			7		22		1011	1970		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9724	6.291	1012	5.033		3.000000	4		5			4		5		1013	1957		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9725	8.959	1012	7.167		3.000000	9		18			9		18		1013	2035		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9734	8.641	1010	6.913		3.000000	3		36			3		36		1011	1941		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9739	9.515	1002	5.947		3.000000	1		13			1		13		1003	2130		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9755	10.904	1002	6.815		3.000000	1		11			1		11		1003	2167		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9766	14.390	1010	8.994		3.000000	2		37			2		37		1011	2012		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9771	10.412	1004	8.330		3.000000	5		41			5		41		1005	2186		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9775	6.912	1002	6.912		3.000000	1		28			1		28		1003	2097		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9792	13.939	1010	8.712		3.000000	9		9			9		9		1011	2199		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9794	10.634	1010	6.647		3.000000	2		26			2		26		1011	2050		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9797	5.068	1002	5.068		3.000000	1		4			1		4		1003	1953		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9816	9.700	1002	7.760		3.000000	3		22			3		22		1003	2145		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9816	13.671	1012	8.544		3.000000	3		5			3		5		1013	1960		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9821	6.638	1010	5.311		3.000000	7		32			7		32		1011	1974		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9828	10.700	1002	8.560		3.000000	8		40			8		40		1003	2133		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9834	9.880	1002	9.880		3.000000	7		24			7		24		1003	2234		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9839	9.194	1012	9.194		3.000000	2		10			2		10		1013	2039		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9848	11.282	1012	7.052		3.000000	5		39			5		39		1013	2008		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9859	8.840	1002	5.525		3.000000	3		47			3		47		1003	2044		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9860	7.194	1002	7.194		3.000000	2		40			2		40		1003	2196		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9860	7.345	1012	5.876		3.000000	1		49			1		49		1013	2052		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9862	8.673	1010	5.421		3.000000	7		43			7		43		1011	2195		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9868	6.014	1002	6.014		3.000000	2		27			2		27		1003	2009		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9874	6.754	1012	5.403		3.000000	6		36			6		36		1013	2163		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9876	6.588	1002	6.588		3.000000	1		1			1		1		1003	2022		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9889	9.548	1012	7.639		3.000000	3		22			3		22		1013	2197		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9889	7.758	1010	7.758		3.000000	1		12			1		12		1011	2157		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9897	6.846	1002	6.846		3.000000	5		26			5		26		1003	2172		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9899	7.098	1002	5.679		3.000000	6		12			6		12		1003	2202		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9902	9.490	1002	9.490		3.000000	4		9			4		9		1003	2060		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9902	8.917	1004	7.134		3.000000	2		43			2		43		1005	2062		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9903	12.713	1010	7.945		3.000000	1		8			1		8		1011	2069		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9906	5.095	1010	5.095		3.000000	4		12			4		12		1011	2023		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9910	11.184	1002	6.990		3.000000	1		40			1		40		1003	1931		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9911	11.925	1012	9.540		3.000000	6		16			6		16		1013	2042		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9915	12.464	1002	9.971		3.000000	7		48			7		48		1003	2128		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9918	12.897	1010	8.061		3.000000	8		11			8		11		1011	1955		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9922	12.983	1002	8.114		3.000000	4		41			4		41		1003	1963		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9927	15.203	1002	9.502		3.000000	9		16			9		16		1003	1928		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9928	12.098	1012	7.561		3.000000	5		3			5		3		1013	2004		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9930	5.299	1010	5.299		3.000000	6		43			6		43		1011	1927		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9938	12.295	1012	9.836		3.000000	4		16			4		16		1013	2168		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9946	11.039	1012	6.899		3.000000	0		49			0		49		1013	2071		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9948	6.183	1002	6.183		3.000000	4		1			4		1		1003	2138		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9948	7.122	1002	7.122		3.000000	4		10			4		10		1003	2095		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9956	9.283	1012	9.283		3.000000	9		24			9		24		1013	2221		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9956	12.176	1010	9.741		3.000000	6		27			6		27		1011	1978		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9970	8.946	1012	7.156		3.000000	2		24			2		24		1013	2048		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9970	11.843	1006	7.402		3.000000	4		32			4		32		1007	2171		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9973	12.081	1002	7.551		3.000000	6		30			6		30		1003	2134		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9973	5.787	1010	5.787		3.000000	5		38			5		38		1011	2226		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9980	11.102	1010	6.939		3.000000	1		10			1		10		1011	2119		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9981	7.948	1006	6.359		3.000000	9		16			9		16		1007	2092		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9982	9.354	1006	7.483		3.000000	5		4			5		4		1007	2061		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9983	9.897	1012	7.918		3.000000	5		35			5		35		1013	2126		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9988	8.156	1006	5.098		3.000000	7		49			7		49		1007	1969		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	186.9999	6.447	1012	5.158		3.000000	6		19			6		19		1013	2230		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0002	7.935	1002	6.348		3.000000	7		11			7		11		1003	2217		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0011	13.454	1010	8.409		3.000000	5		2			5		2		1011	2219		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0013	7.790	1010	6.232		3.000000	4		40			4		40		1011	2160		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0018	10.520	1006	6.575		3.000000	1		22			1		22		1007	2090		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0039	15.125	1010	9.453		3.000000	1		12			1		12		1011	2068		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0040	8.151	1010	6.521		3.000000	5		22			5		22		1011	2136		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0044	10.499	1004	6.562		3.000000	4		45			4		45		1005	2007		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0044	9.213	1012	5.758		3.000000	7		8			7		8		1013	2085		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0045	12.198	1006	7.624		3.000000	8		18			8		18		1007	2216		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0045	5.487	1012	5.487		3.000000	7		46			7		46		1013	2142		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0046	5.993	1012	5.993		3.000000	5		20			5		20		1013	2076		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0050	8.427	1010	8.427		3.000000	8		30			8		30		1011	2211		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0054	10.972	1010	8.778		3.000000	7		34			7		34		1011	2146		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0060	9.017	1002	9.017		3.000000	7		19			7		19		1003	2205		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0061	13.295	1002	8.310		3.000000	6		28			6		28		1003	1993		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0066	5.295	1012	5.295		3.000000	0		13			0		13		1013	2045		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0066	7.787	1012	6.230		3.000000	9		41			9		41		1013	1950		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0067	15.596	1010	9.747		3.000000	2		20			2		20		1011	2120		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0074	6.126	1010	6.126		3.000000	7		41			7		41		1011	2222		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0083	11.570	1012	9.256		3.000000	2		5			2		5		1013	1940		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0092	14.423	1012	9.015		3.000000	6		22			6		22		1013	2099		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0099	8.307	1010	6.645		3.000000	6		23			6		23		1011	1980		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0100	9.536	1012	9.536		3.000000	7		29			7		29		1013	2137		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0103	5.615	1012	5.615		3.000000	6		38			6		38		1013	2041		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0105	8.204	1002	5.128		3.000000	5		39			5		39		1003	1943		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0106	12.586	1008	7.866		3.000000	8		33			8		33		1009	2215		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0110	11.066	1012	8.853		3.000000	6		41			6		41		1013	2184		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0115	15.469	1002	9.668		3.000000	8		1			8		1		1003	2123		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0119	10.692	1012	6.683		3.000000	1		35			1		35		1013	2025		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0124	15.480	1010	9.675		3.000000	7		13			7		13		1011	2181		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0126	10.823	1010	6.764		3.000000	1		7			1		7		1011	2210		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0130	7.671	1012	7.671		3.000000	6		28			6		28		1013	2178		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0134	6.749	1002	6.749		3.000000	1		31			1		31		1003	2201		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0135	8.041	1002	6.433		3.000000	3		34			3		34		1003	2037		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0155	5.054	1012	5.054		3.000000	1		40			1		40		1013	1984		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0165	6.807	1010	6.807		3.000000	8		23			8		23		1011	2179		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0179	14.158	1012	8.849		3.000000	2		35			2		35		1013	2114		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0204	8.297	1002	8.297		3.000000	8		38			8		38		1003	2017		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0207	9.123	1002	5.702		3.000000	0		47			0		47		1003	2029		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0210	15.474	1010	9.671		3.000000	0		38			0		38		1011	2169		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0212	10.646	1012	8.517		3.000000	1		40			1		40		1013	2047		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0221	12.724	1010	7.952		3.000000	7		22			7		22		1011	1973		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0222	9.184	1012	9.184		3.000000	6		34			6		34		1013	1948		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0231	14.596	1012	9.123		3.000000	8		37			8		37		1013	2132		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0235	12.424	1012	7.765		3.000000	5		25			5		25		1013	1967		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0255	8.170	1012	6.536		3.000000	5		6			5		6		1013	2036		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0256	7.393	1010	7.393		3.000000	4		48			4		48		1011	2030		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0257	10.191	1010	6.369		3.000000	6		49			6		49		1011	2086		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0265	9.179	1002	7.343		3.000000	5		21			5		21		1003	1937		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0266	10.212	1010	8.170		3.000000	1		26			1		26		1011	2074		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0272	9.555	1012	7.644		3.000000	6		37			6		37		1013	2051		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0274	14.694	1012	9.184		3.000000	4		36			4		36		1013	2078		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0285	15.552	1004	9.720		3.000000	6		35			6		35		1005	2223		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0285	8.436	1012	8.436		3.000000	2		3			2		3		1013	2091		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0286	5.323	1002	5.323		3.000000	3		20			3		20		1003	1986		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0288	9.724	1012	9.724		3.000000	5		3			5		3		1013	1962		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0290	10.374	1010	6.484		3.000000	2		2			2		2		1011	2055		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0294	7.465	1002	5.972		3.000000	9		8			9		8		1003	2014		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0299	7.289	1012	5.831		3.000000	5		26			5		26		1013	1995		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0301	10.874	1004	6.796		3.000000	6		30			6		30		1005	2104		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0307	8.638	1010	8.638		3.000000	8		10			8		10		1011	2049		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0308	9.759	1012	7.807		3.000000	2		20			2		20		1013	2164		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0310	6.763	1010	6.763		3.000000	0		9			0		9		1011	2107		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0312	14.288	1002	8.930		3.000000	4		35			4		35		1003	2192		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0313	8.948	1010	7.159		3.000000	4		46			4		46		1011	2208		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0314	10.991	1006	8.792		3.000000	6		11			6		11		1007	2204		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0322	12.132	1010	7.583		3.000000	5		4			5		4		1011	2203		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0324	12.040	1010	9.632		3.000000	1		20			1		20		1011	2180		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0327	7.692	1010	7.692		3.000000	4		33			4		33		1011	1968		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0329	8.812	1012	5.508		3.000000	6		18			6		18		1013	2127		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0338	9.279	1002	7.423		3.000000	6		6			6		6		1003	1959		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0341	8.708	1012	8.708		3.000000	2		25			2		25		1013	2218		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0342	11.904	1010	7.440		3.000000	6		21			6		21		1011	1935		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0342	11.934	1002	9.547		3.000000	9		19			9		19		1003	1930		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0351	9.212	1002	5.758		3.000000	9		1			9		1		1003	2064		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0354	7.787	1002	7.787		3.000000	0		28			0		28		1003	2108		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0354	5.696	1002	5.696		3.000000	2		33			2		33		1003	2027		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0358	8.450	1002	6.760		3.000000	7		48			7		48		1003	1939		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0368	6.366	1002	6.366		3.000000	7		10			7		10		1003	2026		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0385	9.838	1002	9.838		3.000000	8		8			8		8		1003	1985		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0391	10.843	1002	6.777		3.000000	5		5			5		5		1003	1956		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0395	14.558	1002	9.099		3.000000	1		47			1		47		1003	2013		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0395	7.833	1012	7.833		3.000000	7		11			7		11		1013	2002		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0399	9.625	1002	9.625		3.000000	8		43			8		43		1003	2124		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0410	12.172	1010	9.737		3.000000	0		34			0		34		1011	2213		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0414	7.383	1010	7.383		3.000000	6		6			6		6		1011	2188		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0417	9.916	1004	9.916		3.000000	7		5			7		5		1005	1933		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0422	9.884	1002	9.884		3.000000	7		21			7		21		1003	2225		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0422	13.955	1002	8.722		3.000000	0		9			0		9		1003	2232		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0423	10.423	1012	6.515		3.000000	3		1			3		1		1013	1991		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0424	15.260	1012	9.538		3.000000	5		45			5		45		1013	2034		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0427	9.930	1012	9.930		3.000000	7		1			7		1		1013	2016		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0434	13.449	1002	8.406		3.000000	6		31			6		31		1003	2166		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0440	15.650	1004	9.781		3.000000	3		2			3		2		1005	2110		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0448	12.731	1012	7.957		3.000000	1		48			1		48		1013	1988		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0449	13.544	1002	8.465		3.000000	3		40			3		40		1003	2220		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0451	9.433	1012	9.433		3.000000	6		47			6		47		1013	2011		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0453	11.478	1002	9.183		3.000000	0		2			0		2		1003	2106		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0456	9.238	1010	9.238		3.000000	0		23			0		23		1011	2175		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0458	10.524	1002	8.419		3.000000	8		32			8		32		1003	2028		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0460	8.690	1012	8.690		3.000000	3		43			3		43		1013	2143		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0466	7.888	1012	7.888		3.000000	6		20			6		20		1013	1997		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0466	10.775	1002	8.620		3.000000	2		8			2		8		1003	2100		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0490	6.273	1012	5.019		3.000000	4		45			4		45		1013	2200		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0490	13.364	1002	8.353		3.000000	6		33			6		33		1003	2235		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0499	8.024	1004	8.024		3.000000	6		14			6		14		1005	2158		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0503	14.908	1002	9.318		3.000000	5		1			5		1		1003	2173		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0506	8.977	1010	8.977		3.000000	4		47			4		47		1011	1966		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0507	9.916	1010	6.198		3.000000	2		13			2		13		1011	2101		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0521	8.517	1010	8.517		3.000000	3		8			3		8		1011	2152		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0523	5.591	1012	5.591		3.000000	1		5			1		5		1013	2103		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0530	8.619	1012	6.895		3.000000	3		41			3		41		1013	1999		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0543	8.148	1002	8.148		3.000000	7		27			7		27		1003	2150		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0557	9.623	1012	7.698		3.000000	5		18			5		18		1013	2089		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0559	14.109	1002	8.818		3.000000	4		43			4		43		1003	2093		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0569	11.895	1006	9.516		3.000000	1		42			1		42		1007	2113		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0580	8.660	1008	6.928		3.000000	5		17			5		17		1009	2121		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0582	10.601	1010	8.481		3.000000	7		20			7		20		1011	2189		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0582	6.291	1010	5.033		3.000000	7		2			7		2		1011	2194		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0617	9.468	1012	9.468		3.000000	2		13			2		13		1013	2079		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0630	13.215	1010	8.260		3.000000	3		21			3		21		1011	1929		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0644	6.147	1012	6.147		3.000000	5		22			5		22		1013	2231		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0668	8.145	1002	8.145		3.000000	4		14			4		14		1003	1961		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0670	6.861	1002	6.861		3.000000	2		33			2		33		1003	2077		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0678	8.850	1010	5.531		3.000000	4		23			4		23		1011	1944		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0689	10.238	1012	8.190		3.000000	5		33			5		33		1013	2140		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0713	10.948	1004	6.843		3.000000	7		6			7		6		1005	1938		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0718	15.470	1012	9.669		3.000000	1		36			1		36		1013	2066		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0726	15.732	1012	9.832		3.000000	1		49			1		49		1013	2193		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0728	12.293	1012	9.834		3.000000	4		11			4		11		1013	2070		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0747	7.334	1012	7.334		3.000000	2		21			2		21		1013	2024		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0751	6.305	1012	5.044		3.000000	9		32			9		32		1013	2135		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0767	7.080	1012	7.080		3.000000	1		45			1		45		1013	2003		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0776	6.865	1010	6.865		3.000000	6		26			6		26		1011	2067		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0789	5.167	1010	5.167		3.000000	5		11			5		11		1011	2088		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0794	9.342	1012	9.342		3.000000	5		48			5		48		1013	2072		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0808	10.673	1002	8.539		3.000000	5		13			5		13		1003	1994		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0809	10.821	1012	6.763		3.000000	4		17			4		17		1013	2031		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0810	15.251	1012	9.532		3.000000	6		22			6		22		1013	2212		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0821	10.946	1008	6.841		3.000000	5		21			5		21		1009	2115		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0829	9.590	1002	7.672		3.000000	4		35			4		35		1003	2006		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0868	6.929	1002	5.543		3.000000	6		24			6		24		1003	2073		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0878	10.720	1002	6.700		3.000000	8		24			8		24		1003	1954		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0889	13.758	1012	8.599		3.000000	6		4			6		4		1013	1947		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0937	13.142	1010	8.214		3.000000	6		19			6		19		1011	2144		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0939	12.294	1010	7.684		3.000000	8		19			8		19		1011	2058		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0949	10.815	1002	8.652		3.000000	8		36			8		36		1003	2112		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0954	9.684	1002	6.053		3.000000	2		24			2		24		1003	1983		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0976	5.065	1012	5.065		3.000000	5		4			5		4		1013	2187		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0978	12.270	1002	7.669		3.000000	1		24			1		24		1003	2191		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.0986	9.114	1012	5.696		3.000000	4		40			4		40		1013	2118		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1103	6.870	1012	6.870		3.000000	4		43			4		43		1013	2182		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1106	9.647	1008	6.030		3.000000	1		37			1		37		1009	1975		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1182	7.103	1010	5.683		3.000000	5		19			5		19		1011	1977		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1306	15.478	1002	9.674		3.000000	2		47			2		47		1003	2059		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1462	12.378	1002	9.902		3.000000	5		8			5		8		1003	2109		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1484	7.410	1002	5.928		3.000000	6		48			6		48		1003	1989		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	187.1663	7.871	1010	6.297		3.000000	4		46			4		46		1011	1972		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5319	10.493	1010	8.395		2.640000	1		35			1		35		1011	2381		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5370	11.963	1010	9.571		2.640000	4		31			4		31		1011	2266		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5389	6.884	1010	5.507		2.640000	5		34			5		34		1011	2320		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5426	14.949	1012	9.343		2.640000	6		25			6		25		1013	2396		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5457	7.962	1002	6.370		2.640000	5		18			5		18		1003	2390		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5476	15.289	1010	9.555		2.640000	6		34			6		34		1011	2293		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5559	9.945	1006	9.945		2.640000	3		9			3		9		1007	2338		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5568	6.348	1010	6.348		2.640000	1		19			1		19		1011	2422		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5655	9.501	1006	9.501		2.640000	6		32			6		32		1007	2334		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5667	11.209	1010	8.967		2.640000	5		27			5		27		1011	2437		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5684	12.011	1002	7.507		2.640000	6		23			6		23		1003	2375		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5691	12.553	1010	7.845		2.640000	6		29			6		29		1011	2343		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5704	8.038	1012	8.038		2.640000	6		15			6		15		1013	2384		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5707	5.928	1002	5.928		2.640000	1		25			1		25		1003	2345		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5715	12.194	1012	9.755		2.640000	2		23			2		23		1013	2309		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5721	10.403	1002	6.502		2.640000	5		8			5		8		1003	2298		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5762	9.131	1010	9.131		2.640000	6		35			6		35		1011	2321		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5769	10.667	1002	8.533		2.640000	3		33			3		33		1003	2270		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5781	7.063	1010	7.063		2.640000	6		1			6		1		1011	2335		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5785	10.393	1012	8.314		2.640000	5		8			5		8		1013	2290		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5798	10.314	1002	8.252		2.640000	2		34			2		34		1003	2315		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5810	8.856	1002	7.085		2.640000	4		15			4		15		1003	2272		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5870	10.833	1002	8.667		2.640000	2		14			2		14		1003	2421		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5885	10.528	1002	6.580		2.640000	5		5			5		5		1003	2448		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5894	5.891	1012	5.891		2.640000	2		12			2		12		1013	2354		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5946	10.158	1002	8.127		2.640000	3		33			3		33		1003	2287		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5959	7.157	1012	7.157		2.640000	6		9			6		9		1013	2358		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5961	8.117	1012	6.493		2.640000	4		4			4		4		1013	2414		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5964	11.884	1012	7.427		2.640000	4		4			4		4		1013	2346		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5965	10.765	1010	8.612		2.640000	1		5			1		5		1011	2267		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5992	9.588	1010	9.588		2.640000	5		15			5		15		1011	2332		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.5996	12.065	1002	7.541		2.640000	6		31			6		31		1003	2257		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6001	9.103	1010	7.282		2.640000	1		8			1		8		1011	2382		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6002	9.216	1012	5.760		2.640000	1		13			1		13		1013	2313		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6003	12.207	1012	9.766		2.640000	3		24			3		24		1013	2359		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6004	6.695	1012	6.695		2.640000	5		29			5		29		1013	2253		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6005	5.852	1012	5.852		2.640000	1		22			1		22		1013	2282		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6008	14.954	1008	9.346		2.640000	2		34			2		34		1009	2249		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6044	10.567	1002	8.453		2.640000	3		32			3		32		1003	2261		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6044	10.180	1012	8.144		2.640000	6		35			6		35		1013	2433		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6053	6.989	1002	6.989		2.640000	4		29			4		29		1003	2387		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6064	8.212	1012	8.212		2.640000	4		34			4		34		1013	2428		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6074	5.868	1010	5.868		2.640000	2		19			2		19		1011	2311		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6082	8.376	1010	8.376		2.640000	4		12			4		12		1011	2373		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6083	13.587	1010	8.492		2.640000	3		8			3		8		1011	2237		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6089	7.981	1010	6.385		2.640000	4		28			4		28		1011	2327		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6090	12.262	1010	9.810		2.640000	2		24			2		24		1011	2355		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6103	7.783	1006	6.227		2.640000	6		25			6		25		1007	2431		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6104	8.889	1002	7.111		2.640000	5		15			5		15		1003	2380		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6111	8.524	1010	6.819		2.640000	4		8			4		8		1011	2317		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6123	8.742	1002	8.742		2.640000	1		5			1		5		1003	2291		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6131	6.912	1002	5.530		2.640000	6		19			6		19		1003	2383		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6136	10.533	1010	6.583		2.640000	5		25			5		25		1011	2314		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6139	10.620	1010	8.496		2.640000	4		2			4		2		1011	2420		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6142	9.809	1006	7.847		2.640000	4		31			4		31		1007	2405		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6146	11.392	1010	9.114		2.640000	1		6			1		6		1011	2325		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6152	8.135	1002	6.508		2.640000	2		20			2		20		1003	2439		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6157	11.596	1010	9.277		2.640000	5		20			5		20		1011	2447		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6164	10.351	1012	8.280		2.640000	6		12			6		12		1013	2427		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6175	8.085	1010	6.468		2.640000	2		20			2		20		1011	2300		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6188	9.145	1010	9.145		2.640000	5		25			5		25		1011	2434		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6191	15.564	1004	9.728		2.640000	3		20			3		20		1005	2430		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6196	11.299	1012	7.062		2.640000	4		34			4		34		1013	2268		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6208	8.123	1010	8.123		2.640000	4		11			4		11		1011	2247		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6210	11.657	1010	7.286		2.640000	5		7			5		7		1011	2278		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6211	11.571	1012	9.257		2.640000	4		35			4		35		1013	2368		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6223	11.699	1002	9.359		2.640000	2		11			2		11		1003	2363		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6224	7.050	1010	7.050		2.640000	3		25			3		25		1011	2357		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6231	13.762	1010	8.601		2.640000	5		30			5		30		1011	2426		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6239	11.366	1012	9.093		2.640000	4		20			4		20		1013	2263		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6243	9.082	1010	9.082		2.640000	6		5			6		5		1011	2306		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6264	8.478	1010	8.478		2.640000	3		16			3		16		1011	2245		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6265	12.035	1012	9.628		2.640000	5		13			5		13		1013	2379		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6271	8.454	1010	8.454		2.640000	4		8			4		8		1011	2339		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6272	11.297	1010	7.061		2.640000	3		21			3		21		1011	2239		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6279	6.880	1010	6.880		2.640000	2		33			2		33		1011	2254		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6279	13.219	1002	8.262		2.640000	3		1			3		1		1003	2250		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6287	8.622	1010	8.622		2.640000	5		33			5		33		1011	2243		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6298	8.566	1010	6.853		2.640000	3		26			3		26		1011	2419		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6302	11.944	1012	9.555		2.640000	3		7			3		7		1013	2398		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6306	12.945	1010	8.090		2.640000	2		14			2		14		1011	2411		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6311	9.587	1012	5.992		2.640000	6		19			6		19		1013	2406		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6312	13.571	1002	8.482		2.640000	1		2			1		2		1003	2403		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6316	11.020	1002	6.887		2.640000	4		11			4		11		1003	2280		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6320	10.681	1010	6.676		2.640000	6		31			6		31		1011	2417		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6324	7.012	1002	5.609		2.640000	6		27			6		27		1003	2329		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6324	10.562	1010	6.601		2.640000	2		11			2		11		1011	2435		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6327	5.565	1010	5.565		2.640000	6		23			6		23		1011	2348		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6329	9.881	1002	7.905		2.640000	2		21			2		21		1003	2352		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6338	9.013	1002	9.013		2.640000	4		9			4		9		1003	2353		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6342	7.411	1012	5.929		2.640000	2		17			2		17		1013	2238		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6346	7.148	1002	5.718		2.640000	3		22			3		22		1003	2258		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6349	9.956	1010	9.956		2.640000	6		20			6		20		1011	2318		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6360	10.526	1010	8.421		2.640000	4		30			4		30		1011	2333		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6362	8.719	1006	6.975		2.640000	4		14			4		14		1007	2392		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6372	8.798	1006	7.038		2.640000	3		13			3		13		1007	2305		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6375	8.176	1010	6.541		2.640000	4		24			4		24		1011	2262		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6380	11.996	1012	7.497		2.640000	4		11			4		11		1013	2442		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6381	15.539	1002	9.712		2.640000	4		21			4		21		1003	2389		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6388	5.930	1002	5.930		2.640000	6		34			6		34		1003	2408		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6391	8.757	1010	8.757		2.640000	2		22			2		22		1011	2319		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6392	9.094	1010	7.276		2.640000	2		12			2		12		1011	2288		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6393	15.751	1012	9.845		2.640000	1		19			1		19		1013	2307		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6397	11.812	1012	7.383		2.640000	4		35			4		35		1013	2302		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6406	15.169	1002	9.481		2.640000	4		35			4		35		1003	2401		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6408	14.402	1012	9.001		2.640000	2		24			2		24		1013	2350		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6410	9.767	1012	7.814		2.640000	3		29			3		29		1013	2386		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6418	9.937	1012	9.937		2.640000	2		30			2		30		1013	2255		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6422	15.007	1012	9.380		2.640000	4		13			4		13		1013	2271		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6432	8.018	1010	6.414		2.640000	2		33			2		33		1011	2449		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6436	6.947	1010	6.947		2.640000	2		19			2		19		1011	2323		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6441	8.301	1012	6.641		2.640000	5		11			5		11		1013	2322		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6446	13.068	1006	8.168		2.640000	5		10			5		10		1007	2283		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6455	9.021	1002	7.216		2.640000	4		13			4		13		1003	2450		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6455	12.198	1010	7.624		2.640000	7		21			7		21		1011	2276		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6456	5.534	1010	5.534		2.640000	6		15			6		15		1011	2404		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6470	7.226	1012	5.781		2.640000	1		34			1		34		1013	2395		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6481	11.601	1010	9.281		2.640000	3		10			3		10		1011	2277		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6485	7.177	1002	7.177		2.640000	5		29			5		29		1003	2304		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6489	11.153	1010	6.971		2.640000	1		17			1		17		1011	2330		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6494	13.162	1010	8.227		2.640000	4		16			4		16		1011	2410		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6499	14.798	1010	9.249		2.640000	4		23			4		23		1011	2377		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6507	14.459	1002	9.037		2.640000	5		21			5		21		1003	2361		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6513	5.481	1002	5.481		2.640000	2		4			2		4		1003	2342		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6517	9.289	1006	5.805		2.640000	4		13			4		13		1007	2289		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6517	10.084	1002	8.067		2.640000	6		13			6		13		1003	2252		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6518	6.756	1012	5.404		2.640000	2		15			2		15		1013	2326		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6540	9.352	1002	9.352		2.640000	1		8			1		8		1003	2402		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6541	7.484	1002	7.484		2.640000	3		16			3		16		1003	2356		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6542	7.660	1002	6.128		2.640000	5		1			5		1		1003	2364		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6543	15.199	1012	9.499		2.640000	7		34			7		34		1013	2407		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6549	15.510	1010	9.693		2.640000	4		34			4		34		1011	2336		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6549	10.701	1010	8.561		2.640000	4		3			4		3		1011	2432		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6557	10.438	1012	8.351		2.640000	2		18			2		18		1013	2344		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6561	9.863	1012	9.863		2.640000	3		21			3		21		1013	2331		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6577	6.291	1002	6.291		2.640000	4		12			4		12		1003	2436		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6583	8.992	1010	8.992		2.640000	5		33			5		33		1011	2409		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6591	8.519	1008	6.815		2.640000	3		32			3		32		1009	2360		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6595	15.678	1010	9.799		2.640000	2		30			2		30		1011	2397		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6609	15.334	1012	9.583		2.640000	5		26			5		26		1013	2299		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6610	9.225	1002	9.225		2.640000	3		4			3		4		1003	2349		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6624	7.227	1012	5.781		2.640000	3		8			3		8		1013	2424		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6624	9.175	1010	9.175		2.640000	4		25			4		25		1011	2301		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6626	8.599	1012	5.375		2.640000	6		32			6		32		1013	2429		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6647	7.458	1010	7.458		2.640000	1		10			1		10		1011	2292		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6647	15.465	1006	9.666		2.640000	4		14			4		14		1007	2337		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6655	5.724	1010	5.724		2.640000	6		31			6		31		1011	2242		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6657	15.778	1010	9.861		2.640000	5		13			5		13		1011	2248		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6661	10.073	1012	6.296		2.640000	3		34			3		34		1013	2324		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6664	9.483	1010	9.483		2.640000	4		25			4		25		1011	2285		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6665	9.081	1010	9.081		2.640000	7		22			7		22		1011	2279		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6666	8.904	1012	7.123		2.640000	3		14			3		14		1013	2378		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6672	7.981	1010	7.981		2.640000	1		11			1		11		1011	2400		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6682	15.851	1012	9.907		2.640000	2		22			2		22		1013	2275		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6687	9.557	1004	9.557		2.640000	3		21			3		21		1005	2416		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6687	11.678	1002	7.299		2.640000	2		19			2		19		1003	2351		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6720	5.911	1002	5.911		2.640000	6		31			6		31		1003	2371		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6721	7.100	1002	7.100		2.640000	6		18			6		18		1003	2415		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6723	7.064	1002	7.064		2.640000	4		18			4		18		1003	2341		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6729	9.386	1010	7.509		2.640000	5		32			5		32		1011	2413		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6735	11.043	1002	6.902		2.640000	4		28			4		28		1003	2236		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6749	10.523	1010	8.419		2.640000	4		12			4		12		1011	2297		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6751	5.582	1010	5.582		2.640000	2		5			2		5		1011	2273		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6755	7.558	1010	7.558		2.640000	3		18			3		18		1011	2366		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6760	8.335	1008	6.668		2.640000	3		11			3		11		1009	2391		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6771	12.036	1010	7.523		2.640000	6		28			6		28		1011	2347		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6773	12.406	1008	7.754		2.640000	4		4			4		4		1009	2451		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6774	9.161	1012	5.725		2.640000	7		32			7		32		1013	2281		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6787	7.461	1012	7.461		2.640000	1		2			1		2		1013	2251		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6790	14.371	1010	8.982		2.640000	6		7			6		7		1011	2393		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6798	7.823	1012	7.823		2.640000	5		34			5		34		1013	2369		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6799	7.665	1012	6.132		2.640000	2		22			2		22		1013	2370		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6799	8.552	1010	8.552		2.640000	2		24			2		24		1011	2244		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6810	14.194	1002	8.872		2.640000	6		27			6		27		1003	2444		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6821	9.871	1010	9.871		2.640000	6		32			6		32		1011	2328		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6834	14.740	1002	9.212		2.640000	6		4			6		4		1003	2240		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6839	5.521	1010	5.521		2.640000	4		9			4		9		1011	2374		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6861	6.510	1010	6.510		2.640000	3		19			3		19		1011	2265		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6867	8.866	1012	8.866		2.640000	6		8			6		8		1013	2260		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6869	9.885	1010	6.178		2.640000	2		11			2		11		1011	2388		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6882	7.971	1002	7.971		2.640000	6		15			6		15		1003	2425		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6887	10.965	1008	6.853		2.640000	6		31			6		31		1009	2246		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6888	8.597	1010	8.597		2.640000	6		13			6		13		1011	2362		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6901	9.082	1002	9.082		2.640000	4		26			4		26		1003	2446		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6910	12.380	1004	9.904		2.640000	3		25			3		25		1005	2340		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6913	11.427	1012	7.142		2.640000	3		25			3		25		1013	2367		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6923	11.654	1010	9.323		2.640000	5		18			5		18		1011	2441		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6927	5.936	1010	5.936		2.640000	5		27			5		27		1011	2372		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6942	6.784	1012	6.784		2.640000	1		2			1		2		1013	2399		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6949	10.746	1012	6.716		2.640000	4		30			4		30		1013	2316		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6951	7.279	1012	5.823		2.640000	5		32			5		32		1013	2418		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6970	9.131	1012	9.131		2.640000	3		14			3		14		1013	2284		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6972	8.235	1002	6.588		2.640000	3		17			3		17		1003	2412		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.6972	11.048	1012	8.838		2.640000	2		18			2		18		1013	2241		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7017	7.804	1002	7.804		2.640000	3		2			3		2		1003	2296		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7021	10.886	1010	6.804		2.640000	5		15			5		15		1011	2443		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7039	8.861	1010	7.089		2.640000	6		28			6		28		1011	2310		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7066	5.590	1012	5.590		2.640000	3		2			3		2		1013	2376		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7072	11.423	1004	9.138		2.640000	3		25			3		25		1005	2385		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7080	15.668	1010	9.792		2.640000	4		33			4		33		1011	2394		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7112	5.874	1012	5.874		2.640000	5		2			5		2		1013	2312		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7120	13.692	1002	8.557		2.640000	2		28			2		28		1003	2274		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7127	9.574	1012	9.574		2.640000	2		6			2		6		1013	2259		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7232	15.035	1002	9.397		2.640000	5		29			5		29		1003	2365		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7282	7.600	1012	7.600		2.640000	1		33			1		33		1013	2445		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7311	15.279	1012	9.549		2.640000	3		3			3		3		1013	2294		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7396	8.100	1010	6.480		2.640000	5		15			5		15		1011	2286		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7400	5.776	1012	5.776		2.640000	4		25			4		25		1013	2269		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7430	9.338	1002	9.338		2.640000	1		20			1		20		1003	2303		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7432	8.666	1002	6.932		2.640000	5		14			5		14		1003	2423		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7446	14.640	1010	9.150		2.640000	2		23			2		23		1011	2308		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7527	10.724	1002	8.579		2.640000	3		3			3		3		1003	2256		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7614	10.741	1010	6.713		2.640000	5		26			5		26		1011	2264		0				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7639	9.664	1010	9.664		2.640000	4		11			4		11		1011	2440		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	195.7868	11.696	1008	7.310		2.640000	5		1			5		1		1009	2295		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2553	9.716	1014	7.772		2.360000	4		20			4		20		1015	2546		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2644	11.936	1012	7.460		2.360000	4		14			4		14		1013	2558		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2681	6.744	1016	6.744		2.360000	5		10			5		10		1017	2514		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2720	8.302	1014	6.641		2.360000	4		11			4		11		1015	2526		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2748	7.373	1014	7.373		2.360000	2		14			2		14		1015	2494		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2765	8.819	1002	8.819		2.360000	4		21			4		21		1003	2587		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2774	7.609	1014	7.609		2.360000	2		20			2		20		1015	2472		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2787	15.494	1016	9.684		2.360000	2		1			2		1		1017	2505		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2804	7.710	1014	6.168		2.360000	3		14			3		14		1015	2566		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2809	9.651	1016	7.721		2.360000	4		10			4		10		1017	2513		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2819	11.664	1016	9.331		2.360000	3		2			3		2		1017	2521		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2843	14.732	1010	9.207		2.360000	3		20			3		20		1011	2500		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2850	15.976	1014	9.985		2.360000	3		18			3		18		1015	2471		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2892	11.474	1014	7.171		2.360000	3		4			3		4		1015	2538		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2920	8.233	1012	8.233		2.360000	3		9			3		9		1013	2537		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2925	14.116	1016	8.822		2.360000	3		3			3		3		1017	2491		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2944	9.805	1014	9.805		2.360000	4		8			4		8		1015	2569		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2963	10.450	1016	8.360		2.360000	4		14			4		14		1017	2486		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.2971	15.325	1016	9.578		2.360000	4		15			4		15		1017	2524		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3029	11.495	1012	9.196		2.360000	5		8			5		8		1013	2543		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3082	9.085	1014	5.678		2.360000	4		10			4		10		1015	2539		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3108	8.825	1012	8.825		2.360000	2		15			2		15		1013	2452		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3134	12.250	1014	7.656		2.360000	4		4			4		4		1015	2542		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3139	7.307	1016	7.307		2.360000	4		10			4		10		1017	2459		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3155	14.497	1014	9.060		2.360000	2		5			2		5		1015	2501		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3194	11.711	1016	7.319		2.360000	5		19			5		19		1017	2469		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3194	10.516	1014	8.413		2.360000	5		21			5		21		1015	2462		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3197	13.257	1014	8.285		2.360000	5		17			5		17		1015	2517		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3200	9.927	1012	7.942		2.360000	3		2			3		2		1013	2559		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3215	10.201	1014	6.376		2.360000	2		23			2		23		1015	2545		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3235	10.063	1016	6.289		2.360000	4		13			4		13		1017	2571		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3249	15.553	1012	9.721		2.360000	3		17			3		17		1013	2518		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3250	12.149	1014	9.719		2.360000	2		19			2		19		1015	2466		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3263	10.034	1016	8.028		2.360000	2		17			2		17		1017	2467		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3272	14.834	1014	9.271		2.360000	4		20			4		20		1015	2470		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3284	7.352	1014	7.352		2.360000	5		12			5		12		1015	2567		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3286	10.931	1014	6.832		2.360000	2		7			2		7		1015	2454		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3298	6.039	1014	6.039		2.360000	4		11			4		11		1015	2534		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3315	9.930	1016	9.930		2.360000	2		11			2		11		1017	2464		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3333	7.340	1014	7.340		2.360000	5		19			5		19		1015	2548		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3342	6.050	1014	6.050		2.360000	3		4			3		4		1015	2565		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3344	10.200	1014	6.375		2.360000	5		5			5		5		1015	2540		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3367	13.166	1014	8.229		2.360000	2		14			2		14		1015	2593		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3368	9.236	1016	7.389		2.360000	5		17			5		17		1017	2555		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3374	9.101	1014	7.280		2.360000	2		18			2		18		1015	2554		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3375	11.900	1016	7.437		2.360000	2		22			2		22		1017	2468		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3380	9.175	1016	9.175		2.360000	3		15			3		15		1017	2496		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3386	10.916	1014	6.823		2.360000	5		15			5		15		1015	2477		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3393	9.824	1016	7.859		2.360000	3		4			3		4		1017	2575		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3411	6.828	1014	6.828		2.360000	2		3			2		3		1015	2461		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3412	9.895	1010	6.184		2.360000	3		11			3		11		1011	2527		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3415	13.271	1010	8.294		2.360000	2		4			2		4		1011	2511		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3438	9.119	1016	9.119		2.360000	4		4			4		4		1017	2503		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3441	12.287	1016	7.679		2.360000	2		3			2		3		1017	2457		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3445	6.019	1014	6.019		2.360000	3		22			3		22		1015	2497		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3446	11.749	1014	7.343		2.360000	2		10			2		10		1015	2588		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3447	11.405	1014	7.128		2.360000	3		3			3		3		1015	2498		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3463	6.281	1014	6.281		2.360000	4		16			4		16		1015	2490		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3469	9.172	1014	9.172		2.360000	3		17			3		17		1015	2592		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3479	8.640	1016	8.640		2.360000	3		18			3		18		1017	2577		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3479	12.614	1014	7.884		2.360000	3		18			3		18		1015	2557		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3492	8.700	1016	8.700		2.360000	2		16			2		16		1017	2556		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3495	7.456	1016	5.965		2.360000	4		16			4		16		1017	2473		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3502	9.854	1016	7.883		2.360000	2		14			2		14		1017	2573		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3510	15.189	1016	9.493		2.360000	3		7			3		7		1017	2502		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3521	15.489	1014	9.680		2.360000	3		19			3		19		1015	2589		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3528	15.031	1014	9.394		2.360000	3		13			3		13		1015	2552		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3545	12.248	1014	7.655		2.360000	4		10			4		10		1015	2519		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3560	14.481	1016	9.051		2.360000	3		10			3		10		1017	2596		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3570	7.036	1016	7.036		2.360000	3		12			3		12		1017	2564		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3583	9.505	1014	9.505		2.360000	5		17			5		17		1015	2475		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3587	8.601	1014	8.601		2.360000	3		11			3		11		1015	2578		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3597	14.669	1016	9.168		2.360000	3		9			3		9		1017	2580		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3619	15.336	1010	9.585		2.360000	2		23			2		23		1011	2495		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3633	8.872	1016	7.098		2.360000	3		21			3		21		1017	2476		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3648	9.877	1014	7.902		2.360000	3		2			3		2		1015	2551		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3651	14.137	1014	8.836		2.360000	5		6			5		6		1015	2523		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3652	7.930	1014	7.930		2.360000	5		17			5		17		1015	2522		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3655	13.703	1002	8.565		2.360000	3		23			3		23		1003	2482		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3674	8.445	1016	8.445		2.360000	3		18			3		18		1017	2574		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3674	14.742	1014	9.214		2.360000	5		12			5		12		1015	2532		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3687	8.616	1012	6.893		2.360000	4		22			4		22		1013	2489		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3700	15.949	1012	9.968		2.360000	5		10			5		10		1013	2525		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3710	6.061	1014	6.061		2.360000	2		1			2		1		1015	2576		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3730	12.741	1014	7.963		2.360000	4		11			4		11		1015	2560		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3731	11.263	1014	9.011		2.360000	4		9			4		9		1015	2570		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3749	11.818	1014	9.455		2.360000	3		12			3		12		1015	2512		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3753	9.143	1016	9.143		2.360000	3		4			3		4		1017	2488		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3754	14.397	1014	8.998		2.360000	5		8			5		8		1015	2480		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3768	10.691	1016	6.682		2.360000	4		2			4		2		1017	2568		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3786	7.178	1014	7.178		2.360000	2		21			2		21		1015	2547		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3791	6.710	1014	6.710		2.360000	2		19			2		19		1015	2562		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3796	9.315	1014	7.452		2.360000	2		22			2		22		1015	2549		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3801	11.498	1010	7.186		2.360000	4		17			4		17		1011	2479		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3813	7.389	1016	7.389		2.360000	5		7			5		7		1017	2583		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3841	9.471	1012	5.920		2.360000	4		2			4		2		1013	2478		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3895	8.360	1014	6.688		2.360000	3		18			3		18		1015	2536		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3898	6.842	1002	6.842		2.360000	4		22			4		22		1003	2453		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3907	6.171	1012	6.171		2.360000	5		21			5		21		1013	2508		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3907	11.516	1014	7.197		2.360000	3		20			3		20		1015	2485		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3936	7.258	1014	5.807		2.360000	2		17			2		17		1015	2530		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3941	8.271	1010	8.271		2.360000	5		17			5		17		1011	2579		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3944	9.281	1014	9.281		2.360000	3		6			3		6		1015	2590		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3956	10.269	1016	8.215		2.360000	3		4			3		4		1017	2572		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3994	8.107	1016	8.107		2.360000	4		11			4		11		1017	2510		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.3996	15.807	1014	9.879		2.360000	2		18			2		18		1015	2463		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4012	7.505	1014	6.004		2.360000	3		4			3		4		1015	2584		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4022	8.683	1014	8.683		2.360000	3		3			3		3		1015	2516		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4027	9.261	1016	9.261		2.360000	3		17			3		17		1017	2550		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4044	10.496	1010	8.397		2.360000	3		14			3		14		1011	2483		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4046	6.997	1016	6.997		2.360000	3		20			3		20		1017	2504		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4052	8.985	1016	8.985		2.360000	3		14			3		14		1017	2481		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4062	8.830	1014	8.830		2.360000	3		3			3		3		1015	2553		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4080	8.286	1010	8.286		2.360000	4		5			4		5		1011	2586		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4082	5.975	1016	5.975		2.360000	4		4			4		4		1017	2509		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4090	8.011	1016	6.409		2.360000	5		4			5		4		1017	2493		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4123	14.503	1012	9.064		2.360000	4		7			4		7		1013	2515		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4132	9.240	1016	9.240		2.360000	2		13			2		13		1017	2531		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4147	8.341	1014	6.673		2.360000	3		2			3		2		1015	2582		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4149	7.062	1016	7.062		2.360000	3		12			3		12		1017	2581		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4151	5.695	1014	5.695		2.360000	3		2			3		2		1015	2529		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4166	7.937	1014	7.937		2.360000	4		23			4		23		1015	2594		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4206	9.600	1014	9.600		2.360000	4		24			4		24		1015	2520		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4215	10.367	1012	8.294		2.360000	4		12			4		12		1013	2563		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4218	5.658	1010	5.658		2.360000	3		15			3		15		1011	2474		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4235	11.256	1014	7.035		2.360000	2		19			2		19		1015	2541		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4274	7.739	1014	7.739		2.360000	5		20			5		20		1015	2487		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4291	6.681	1014	6.681		2.360000	4		10			4		10		1015	2561		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4293	8.488	1014	8.488		2.360000	2		14			2		14		1015	2591		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4310	7.229	1016	7.229		2.360000	2		7			2		7		1017	2507		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4316	7.663	1014	7.663		2.360000	4		15			4		15		1015	2456		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4318	7.593	1014	6.074		2.360000	5		17			5		17		1015	2458		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4318	5.659	1016	5.659		2.360000	3		21			3		21		1017	2465		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4326	9.338	1014	7.470		2.360000	2		19			2		19		1015	2484		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4401	13.509	1014	8.443		2.360000	3		11			3		11		1015	2595		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4434	12.177	1016	9.741		2.360000	5		4			5		4		1017	2544		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4460	11.076	1012	6.922		2.360000	4		15			4		15		1013	2533		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4568	7.563	1014	7.563		2.360000	3		10			3		10		1015	2460		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4596	11.428	1012	7.142		2.360000	5		23			5		23		1013	2528		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4606	8.063	1014	6.451		2.360000	3		11			3		11		1015	2535		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4637	14.261	1010	8.913		2.360000	5		20			5		20		1011	2585		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4638	8.488	1016	8.488		2.360000	2		10			2		10		1017	2499		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4769	8.645	1012	8.645		2.360000	3		20			3		20		1013	2506		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4789	9.159	1016	5.724		2.360000	2		10			2		10		1017	2455		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	202.4819	8.936	1014	8.936		2.360000	4		6			4		6		1015	2492		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0103	7.152	1014	7.152		2.160000	3		12			3		12		1015	2633		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0167	8.555	1014	6.844		2.160000	4		15			4		15		1015	2665		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0631	9.097	1014	9.097		2.160000	3		2			3		2		1015	2654		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0801	14.794	1016	9.246		2.160000	4		15			4		15		1017	2636		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0859	8.293	1012	8.293		2.160000	4		10			4		10		1013	2639		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.0905	8.147	1014	6.518		2.160000	3		1			3		1		1015	2619		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1005	11.059	1016	6.912		2.160000	3		14			3		14		1017	2655		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1007	11.318	1014	7.074		2.160000	4		7			4		7		1015	2635		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1030	10.993	1014	8.794		2.160000	3		7			3		7		1015	2629		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1037	6.677	1010	6.677		2.160000	3		7			3		7		1011	2626		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1043	7.671	1014	7.671		2.160000	3		6			3		6		1015	2673		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1060	6.280	1016	6.280		2.160000	3		7			3		7		1017	2615		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1074	14.730	1016	9.206		2.160000	3		12			3		12		1017	2672		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1097	10.092	1016	8.073		2.160000	3		4			3		4		1017	2637		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1130	13.409	1016	8.381		2.160000	4		10			4		10		1017	2628		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1135	9.565	1014	5.978		2.160000	3		14			3		14		1015	2669		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1151	7.697	1016	7.697		2.160000	3		7			3		7		1017	2611		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1168	10.020	1016	8.016		2.160000	4		13			4		13		1017	2656		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1194	12.784	1014	7.990		2.160000	4		15			4		15		1015	2605		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1205	10.423	1002	8.339		2.160000	3		12			3		12		1003	2627		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1218	8.716	1014	8.716		2.160000	4		11			4		11		1015	2630		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1248	11.341	1014	7.088		2.160000	3		6			3		6		1015	2601		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1252	10.492	1014	8.394		2.160000	4		2			4		2		1015	2608		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1292	12.385	1012	9.908		2.160000	3		10			3		10		1013	2603		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1332	15.161	1016	9.475		2.160000	3		14			3		14		1017	2621		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1346	9.758	1016	6.099		2.160000	3		11			3		11		1017	2617		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1363	7.870	1016	6.296		2.160000	3		14			3		14		1017	2641		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1395	15.753	1016	9.845		2.160000	4		1			4		1		1017	2613		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1396	13.605	1016	8.503		2.160000	3		6			3		6		1017	2640		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1409	7.823	1014	7.823		2.160000	3		12			3		12		1015	2644		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1465	8.876	1014	8.876		2.160000	4		12			4		12		1015	2662		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1497	8.023	1002	8.023		2.160000	3		6			3		6		1003	2648		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1497	11.188	1014	8.950		2.160000	3		8			3		8		1015	2652		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1504	8.246	1016	8.246		2.160000	3		11			3		11		1017	2612		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1515	11.037	1016	8.830		2.160000	3		16			3		16		1017	2650		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1517	13.324	1014	8.328		2.160000	4		15			4		15		1015	2638		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1528	11.677	1016	9.342		2.160000	3		3			3		3		1017	2663		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1534	9.675	1014	9.675		2.160000	3		6			3		6		1015	2658		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1544	14.513	1014	9.071		2.160000	3		13			3		13		1015	2604		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1571	14.775	1016	9.234		2.160000	4		6			4		6		1017	2674		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1573	6.057	1016	6.057		2.160000	3		15			3		15		1017	2667		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1579	11.140	1010	8.912		2.160000	3		12			3		12		1011	2660		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1583	10.768	1016	8.614		2.160000	3		9			3		9		1017	2645		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1590	8.671	1016	8.671		2.160000	4		15			4		15		1017	2666		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1597	9.711	1016	6.070		2.160000	3		1			3		1		1017	2664		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1609	12.045	1016	7.528		2.160000	4		14			4		14		1017	2620		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1640	8.308	1014	6.647		2.160000	3		7			3		7		1015	2609		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1652	15.135	1010	9.459		2.160000	3		6			3		6		1011	2657		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1653	8.765	1014	8.765		2.160000	3		1			3		1		1015	2597		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1656	12.705	1014	7.940		2.160000	3		14			3		14		1015	2614		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1667	8.351	1016	6.681		2.160000	3		12			3		12		1017	2649		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1703	12.484	1016	9.988		2.160000	3		11			3		11		1017	2610		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1730	8.270	1016	8.270		2.160000	4		6			4		6		1017	2599		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1829	8.702	1016	6.961		2.160000	3		5			3		5		1017	2659		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1832	14.543	1014	9.089		2.160000	3		6			3		6		1015	2606		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1838	6.615	1014	6.615		2.160000	3		14			3		14		1015	2671		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1849	8.325	1016	8.325		2.160000	3		10			3		10		1017	2600		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1868	9.688	1012	7.750		2.160000	3		2			3		2		1013	2646		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1870	8.569	1014	6.856		2.160000	4		7			4		7		1015	2598		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1914	9.069	1002	7.255		2.160000	4		9			4		9		1003	2607		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1961	11.797	1016	7.373		2.160000	3		8			3		8		1017	2602		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.1981	8.911	1016	8.911		2.160000	3		15			3		15		1017	2670		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2008	12.081	1010	7.551		2.160000	4		10			4		10		1011	2623		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2014	8.757	1016	8.757		2.160000	3		7			3		7		1017	2616		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2036	9.894	1010	7.915		2.160000	4		2			4		2		1011	2647		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2142	12.514	1012	7.821		2.160000	3		9			3		9		1013	2625		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2143	8.373	1016	6.698		2.160000	3		7			3		7		1017	2668		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2164	8.147	1014	6.518		2.160000	3		10			3		10		1015	2632		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2194	10.017	1014	6.260		2.160000	3		1			3		1		1015	2642		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2221	8.584	1014	8.584		2.160000	3		5			3		5		1015	2653		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2315	7.209	1016	7.209		2.160000	3		10			3		10		1017	2643		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2335	11.824	1014	9.459		2.160000	3		7			3		7		1015	2618		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2389	6.763	1012	6.763		2.160000	3		14			3		14		1013	2651		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2419	13.107	1014	8.192		2.160000	3		11			3		11		1015	2624		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2422	5.886	1014	5.886		2.160000	4		1			4		1		1015	2631		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2450	11.945	1014	7.466		2.160000	3		12			3		12		1015	2661		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2482	12.043	1014	9.634		2.160000	3		10			3		10		1015	2634		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	207.2672	13.080	1016	8.175		2.160000	4		9			4		9		1017	2622		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	209.9816	7.581	1016	7.581		2.040000	3		8			3		8		1017	2681		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	209.9876	6.876	1016	6.876		2.040000	3		2			3		2		1017	2694		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	209.9939	8.327	1016	8.327		2.040000	3		1			3		1		1017	2689		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	209.9980	13.640	1014	8.525		2.040000	3		8			3		8		1015	2682		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	209.9993	8.426	1014	8.426		2.040000	3		1			3		1		1015	2698		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0037	11.790	1014	7.369		2.040000	3		7			3		7		1015	2685		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0053	9.750	1014	7.800		2.040000	3		1			3		1		1015	2675		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0084	8.259	1016	8.259		2.040000	3		10			3		10		1017	2678		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0144	10.201	1014	6.376		2.040000	3		3			3		3		1015	2680		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0152	12.879	1014	8.050		2.040000	3		1			3		1		1015	2690		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0388	6.262	1016	6.262		2.040000	3		5			3		5		1017	2676		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0433	12.621	1016	7.888		2.040000	3		7			3		7		1017	2686		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0465	14.836	1016	9.273		2.040000	3		3			3		3		1017	2687		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0477	7.914	1016	7.914		2.040000	3		5			3		5		1017	2697		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0511	8.693	1014	8.693		2.040000	3		7			3		7		1015	2677		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0540	10.912	1016	6.820		2.040000	3		3			3		3		1017	2699		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0566	10.658	1016	8.526		2.040000	3		9			3		9		1017	2700		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0567	11.965	1016	7.478		2.040000	3		9			3		9		1017	2692		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0591	11.871	1014	9.497		2.040000	3		4			3		4		1015	2691		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0646	11.005	1014	8.804		2.040000	3		1			3		1		1015	2693		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0776	7.792	1014	7.792		2.040000	3		2			3		2		1015	2701		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0795	6.350	1012	6.350		2.040000	3		5			3		5		1013	2679		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0837	11.525	1014	9.220		2.040000	3		8			3		8		1015	2695		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0890	10.618	1016	6.636		2.040000	3		9			3		9		1017	2684		1				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.0992	9.833	1010	9.833		2.040000	3		2			3		2		1011	2696		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.1107	11.210	1016	7.006		2.040000	3		9			3		9		1017	2688		2				1			2			20			187.0000		40.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	210.1717	13.960	1016	8.725		2.040000	3		9			3		9		1017	2683		2				1			2			20			187.0000		40.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
