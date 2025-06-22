
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
f 0 261.96984508783555 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 8 12 8
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 3 4 2
f 1007 0 3 -2 0 1 0
f 1008 0 3 -2 7 9 12
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 2 3 5
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 1 2 3
f 1013 0 3 -2 0 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	0.0010	36.218	1000	28.974		5.000000	1		1			1001	2		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	0.0010	46.354	1000	28.971		5.000000	0		1			1001	3		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	0.0010	46.753	1000	29.221		5.000000	1		1			1001	5		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	0.0010	30.529	1000	24.423		5.000000	1		2			1001	6		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	6.7275	30.075	1000	24.060		5.000000	1		2			1001	7		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	6.7275	31.158	1000	24.926		5.000000	0		3			1001	10		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	13.1100	40.294	1000	25.184		5.000000	2		3			1001	11		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	13.1100	43.190	1000	26.994		5.000000	1		3			1001	12		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	19.1475	33.306	1000	26.645		5.000000	0		6			1001	13		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	19.1475	36.462	1000	22.789		5.000000	2		4			1001	14		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	24.8400	23.978	1000	19.182		5.000000	2		7			1001	15		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	24.8400	30.729	1000	24.583		5.000000	1		3			1001	17		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	24.8400	27.270	1000	21.816		5.000000	2		8			1001	19		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	24.8400	32.754	1000	20.471		5.000000	3		5			1001	21		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	30.1875	39.981	1000	24.988		5.000000	2		6			1001	22		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	30.1875	23.558	1000	18.847		5.000000	1		2			1001	25		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	30.1875	30.597	1000	19.123		5.000000	2		7			1001	28		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	30.1875	33.163	1000	20.727		5.000000	1		7			1001	31		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	30.1875	37.419	1000	23.387		5.000000	1		5			1001	34		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	35.1900	24.770	1000	19.816		5.000000	3		9			1001	36		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	35.1900	36.702	1000	22.939		5.000000	2		9			1001	37		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	35.1900	31.091	1000	24.873		5.000000	2		3			1001	38		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	39.8475	35.518	1000	22.199		5.000000	3		3			1001	39		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	39.8475	24.965	1000	19.972		5.000000	1		5			1001	40		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	39.8475	27.906	1000	17.441		5.000000	4		10			1001	41		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	39.8475	26.934	1000	16.834		5.000000	3		11			1001	44		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	44.1600	28.921	1000	23.137		5.000000	4		12			1001	46		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	44.1600	29.894	1000	18.684		5.000000	3		5			1001	47		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	44.1600	27.526	1000	17.204		5.000000	3		1			1001	48		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	44.1600	22.736	1000	18.188		5.000000	1		1			1001	50		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	44.1600	30.660	1000	19.163		5.000000	2		3			1001	51		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	48.1275	30.585	1000	24.468		5.000000	3		11			1001	52		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	48.1275	38.407	1000	24.005		5.000000	2		2			1001	53		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	48.1275	34.567	1000	21.604		5.000000	3		3			1001	56		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	48.1275	30.850	1000	24.680		5.000000	2		5			1001	58		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	51.7500	37.941	1000	23.713		5.000000	2		11			1001	61		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	51.7500	33.245	1000	20.778		5.000000	5		4			1001	62		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	51.7500	28.616	1000	22.893		5.000000	5		1			1001	63		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	18.623	1000	14.898		5.000000	5		15			1001	64		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	25.049	1000	15.656		5.000000	4		8			1001	65		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	32.587	1000	20.367		5.000000	5		8			1001	69		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	22.710	1000	18.168		5.000000	3		14			1001	70		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	27.835	1000	17.397		5.000000	4		1			1001	73		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	55.0275	21.497	1000	17.198		5.000000	2		15			1001	74		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	57.9600	26.474	1000	21.179		5.000000	3		11			1001	76		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	57.9600	18.722	1000	14.978		5.000000	2		14			1001	82		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	57.9600	22.328	1000	17.863		5.000000	6		5			1001	85		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	57.9600	22.751	1000	18.201		5.000000	6		10			1001	86		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	57.9600	27.328	1000	17.080		5.000000	5		16			1001	87		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	60.5475	35.229	1000	22.018		5.000000	5		11			1001	88		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	60.5475	28.129	1000	22.504		5.000000	3		15			1001	91		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	60.5475	31.150	1000	19.468		5.000000	3		17			1001	92		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	60.5475	24.776	1000	15.485		5.000000	3		13			1001	93		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	62.7900	20.527	1000	16.422		5.000000	4		12			1001	94		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	62.7900	27.381	1000	21.905		5.000000	6		1			1001	95		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	62.7900	25.211	1000	20.169		5.000000	5		2			1001	96		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	62.7900	25.040	1000	15.650		5.000000	6		16			1001	97		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	62.7900	17.489	1000	13.991		5.000000	5		2			1001	98		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	64.6875	26.211	1000	16.382		5.000000	4		6			1001	100		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	64.6875	22.829	1000	14.268		5.000000	5		1			1001	101		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	64.6875	26.461	1000	16.538		5.000000	6		18			1001	102		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	32.550	1000	20.343		5.000000	7		4			1001	103		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	20.700	1000	16.560		5.000000	3		18			1001	104		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	35.317	1000	22.073		5.000000	6		17			1001	105		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	22.518	1000	18.014		5.000000	6		15			1001	106		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	16.170	1000	12.936		5.000000	5		18			1001	108		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	66.2400	23.326	1000	18.661		5.000000	3		19			1001	110		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	67.4475	25.362	1000	20.289		5.000000	7		6			1001	112		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	67.4475	19.886	1000	15.909		5.000000	3		15			1001	114		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	67.4475	28.111	1000	22.489		5.000000	6		5			1001	115		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.3100	25.587	1000	15.992		5.000000	7		4			1001	116		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.3100	30.804	1000	19.252		5.000000	4		16			1001	118		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.3100	15.229	1000	12.183		5.000000	3		14			1001	119		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.3100	22.538	1000	14.087		5.000000	5		2			1001	122		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.8275	27.063	1000	21.651		5.000000	6		17			1001	123		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.8275	21.141	1000	13.213		5.000000	4		16			1001	124		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.8275	24.011	1000	15.007		5.000000	8		15			1001	125		1				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	68.8275	31.727	1000	19.829		5.000000	5		8			1001	126		0				1			2			20			0.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.878	1000	0.996		0.007260	7		3			1001	128		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	2.723	1000	1.705		0.007260	5		3			1001	130		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	8.594	1000	1.967		0.007260	7		6			1001	133		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	5.302	1000	2.816		0.007260	7		2			1001	134		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	3.897	1000	1.770		0.007260	8		8			1001	135		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	8.775	1000	1.022		0.007260	7		2			1001	138		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	9.117	1000	2.799		0.007260	6		7			1001	139		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	4.009	1000	1.319		0.007260	7		3			1001	142		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	5.083	1000	0.997		0.007260	6		1			1001	143		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	6.462	1000	2.162		0.007260	6		6			1001	145		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	13.655	1000	2.382		0.007260	8		7			1001	146		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	14.481	1000	3.710		0.007260	5		3			1001	147		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	9.887	1000	1.282		0.007260	5		3			1001	148		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.465	1000	1.802		0.007260	7		3			1001	149		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	9.061	1000	3.106		0.007260	6		6			1001	150		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	12.196	1000	3.423		0.007260	6		3			1001	151		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.386	1000	3.274		0.007260	7		6			1001	154		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	9.633	1000	3.391		0.007260	5		1			1001	155		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	9.154	1000	3.206		0.007260	8		6			1001	156		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	8.876	1000	1.689		0.007260	8		4			1001	157		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.958	1000	1.764		0.007260	6		2			1001	158		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	6.790	1000	0.922		0.007260	6		5			1001	159		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.509	1000	1.608		0.007260	6		6			1001	160		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	4.272	1000	1.312		0.007260	6		3			1001	161		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	7.616	1000	2.609		0.007260	7		1			1001	162		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	6.020	1000	2.058		0.007260	7		4			1001	163		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	14.363	1000	2.935		0.007260	7		1			1001	167		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	4.732	1000	1.325		0.007260	8		3			1001	168		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	6.400	1000	2.520		0.007260	7		1			1001	171		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	10.051	1000	2.359		0.007260	5		8			1001	172		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.0762	6.757	1000	0.928		0.007260	7		7			1001	173		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	3.135	1000	1.113		0.018933	7		6			1001	174		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	12.161	1000	3.057		0.018933	6		5			1001	176		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	10.257	1000	1.633		0.018933	8		5			1001	178		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	4.787	1000	2.792		0.018933	7		2			1001	179		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	10.098	1000	3.597		0.018933	6		2			1001	180		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	4.817	1000	3.688		0.018933	7		2			1001	181		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	6.034	1000	2.475		0.018933	6		8			1001	182		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	8.604	1000	3.403		0.018933	7		5			1001	183		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	7.638	1000	1.160		0.018933	6		5			1001	184		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	9.128	1000	3.176		0.018933	5		1			1001	186		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.1988	6.062	1000	1.029		0.018933	6		6			1001	187		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	10.629	1000	3.611		0.043528	5		2			1001	188		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	10.792	1000	2.640		0.043528	6		6			1001	189		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	8.310	1000	2.608		0.043528	7		5			1001	190		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	7.509	1000	2.540		0.043528	6		8			1001	191		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	10.069	1000	3.401		0.043528	7		8			1001	192		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	14.242	1000	3.608		0.043528	7		3			1001	197		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	11.112	1000	2.687		0.043528	7		8			1001	200		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	13.198	1000	3.173		0.043528	5		7			1001	201		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	4.353	1000	2.375		0.043528	7		2			1001	202		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	8.352	1000	1.742		0.043528	5		8			1001	203		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	1.662	1000	0.784		0.043528	6		4			1001	204		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	3.878	1000	1.755		0.043528	7		1			1001	205		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	5.126	1000	1.710		0.043528	7		5			1001	211		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	2.908	1000	1.793		0.043528	8		1			1001	214		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	6.988	1000	3.190		0.043528	5		6			1001	215		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	3.489	1000	1.133		0.043528	5		7			1001	217		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	6.874	1000	1.369		0.043528	7		5			1001	218		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	9.204	1000	2.606		0.043528	7		2			1001	220		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	6.741	1000	1.215		0.043528	7		8			1001	222		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	4.256	1000	1.987		0.043528	8		8			1001	225		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	5.153	1000	2.567		0.043528	7		1			1001	226		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	13.034	1000	3.007		0.043528	7		4			1001	228		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	6.114	1000	1.463		0.043528	5		5			1001	231		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	12.291	1000	3.406		0.043528	7		6			1001	232		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	4.119	1000	2.058		0.043528	8		2			1001	233		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	11.105	1000	1.495		0.043528	6		7			1001	234		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	8.852	1000	2.494		0.043528	7		8			1001	235		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	11.590	1000	3.361		0.043528	8		1			1001	236		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	8.868	1000	3.344		0.043528	8		2			1001	237		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.4570	10.997	1000	1.228		0.043528	8		8			1001	238		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	11.687	1000	3.679		0.070872	8		5			1001	241		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	9.011	1000	3.068		0.070872	8		3			1001	242		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	4.146	1000	1.902		0.070872	7		6			1001	243		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	2.889	1000	2.275		0.070872	6		3			1001	244		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	8.675	1000	2.624		0.070872	8		4			1001	246		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	8.842	1000	2.592		0.070872	6		5			1001	247		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	10.625	1000	2.914		0.070872	8		1			1001	248		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	5.092	1000	1.011		0.070872	8		3			1001	250		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	6.283	1000	1.848		0.070872	6		3			1001	254		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	7.485	1000	2.468		0.070872	5		3			1001	255		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	11.131	1000	2.331		0.070872	7		7			1001	256		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	14.683	1000	3.231		0.070872	7		2			1001	257		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	8.491	1000	3.693		0.070872	6		2			1001	258		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	11.272	1000	3.159		0.070872	6		5			1001	259		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	13.670	1000	2.991		0.070872	8		6			1001	260		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	7.651	1000	3.449		0.070872	7		2			1001	261		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	2.188	1000	1.686		0.070872	6		6			1001	262		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	11.183	1000	2.965		0.070872	8		7			1001	263		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	8.524	1000	1.105		0.070872	7		9			1001	264		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.7442	10.615	1000	2.136		0.070872	8		6			1001	265		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	4.564	1000	2.935		0.087826	6		3			1001	267		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	9.463	1000	2.057		0.087826	6		6			1001	268		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	5.154	1000	1.591		0.087826	6		2			1001	269		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	4.778	1000	2.656		0.087826	7		8			1001	270		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	8.511	1000	1.539		0.087826	6		7			1001	272		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	10.621	1000	2.213		0.087826	6		4			1001	274		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	3.633	1000	1.043		0.087826	6		9			1001	275		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	3.642	1000	1.135		0.087826	6		7			1001	277		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	11.965	1000	3.506		0.087826	5		2			1001	278		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	4.753	1000	2.010		0.087826	7		2			1001	279		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	14.450	1000	3.638		0.087826	5		9			1001	280		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	4.540	1000	2.026		0.087826	6		5			1001	281		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	3.688	1000	1.122		0.087826	6		9			1001	283		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	3.850	1000	1.838		0.087826	6		6			1001	284		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	11.255	1000	1.617		0.087826	8		1			1001	285		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	13.629	1000	3.211		0.087826	7		5			1001	286		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	10.811	1000	0.768		0.087826	8		5			1001	287		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	10.011	1000	2.006		0.087826	5		5			1001	289		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	7.103	1000	2.676		0.087826	7		4			1001	293		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	5.480	1000	1.970		0.087826	7		8			1001	294		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	12.030	1000	3.137		0.087826	8		3			1001	296		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	11.974	1000	3.638		0.087826	7		1			1001	298		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	7.014	1000	0.895		0.087826	6		1			1001	299		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	8.722	1000	0.747		0.087826	5		6			1001	300		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	11.767	1000	3.505		0.087826	6		2			1001	303		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	7.992	1000	1.461		0.087826	5		6			1001	304		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	3.618	1000	2.253		0.087826	6		8			1001	305		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	9.107	1000	1.702		0.087826	7		2			1001	308		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	8.758	1000	2.554		0.087826	5		3			1001	309		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	84.9222	6.317	1000	0.797		0.087826	6		4			1001	310		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	10.046	1000	2.978		0.102869	6		8			1001	311		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	4.048	1000	2.023		0.102869	7		2			1001	313		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	11.617	1000	1.880		0.102869	7		7			1001	314		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	13.559	1000	3.022		0.102869	8		9			1001	316		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.901	1000	2.090		0.102869	7		9			1001	317		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	6.900	1000	2.428		0.102869	5		5			1001	319		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.092	1000	2.233		0.102869	7		1			1001	322		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	12.289	1000	1.760		0.102869	6		1			1001	323		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	10.049	1000	1.483		0.102869	7		2			1001	324		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.875	1000	2.575		0.102869	8		6			1001	325		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.599	1000	3.433		0.102869	5		1			1001	326		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	8.958	1000	1.836		0.102869	6		3			1001	330		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	13.514	1000	3.482		0.102869	6		6			1001	331		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	10.047	1000	2.956		0.102869	8		3			1001	334		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.964	1000	1.584		0.102869	8		3			1001	335		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	9.663	1000	3.495		0.102869	5		8			1001	337		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	10.017	1000	2.337		0.102869	8		8			1001	338		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	7.714	1000	1.747		0.102869	8		3			1001	340		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	85.0801	10.809	1000	2.088		0.102869	7		8			1001	341		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	9.258	1000	3.248		0.303499	6		3			1001	342		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	6.839	1000	3.326		0.303499	5		3			1001	343		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.189	1000	0.798		0.303499	7		5			1001	345		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	6.413	1000	1.398		0.303499	5		5			1001	346		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.750	1000	3.061		0.303499	5		14			1001	347		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	12.860	1000	2.204		0.303499	6		13			1001	349		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.640	1000	2.026		0.303499	6		1			1001	350		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.795	1000	2.420		0.303499	8		10			1001	351		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	8.222	1000	0.952		0.303499	6		5			1001	352		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	8.198	1000	2.408		0.303499	6		8			1001	353		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.857	1000	1.733		0.303499	8		1			1001	354		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	8.244	1000	0.888		0.303499	5		2			1001	355		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	11.493	1000	3.311		0.303499	8		4			1001	357		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	9.731	1000	2.810		0.303499	7		6			1001	358		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	4.645	1000	2.500		0.303499	7		5			1001	359		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	8.125	1000	1.720		0.303499	5		14			1001	361		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	11.979	1000	3.355		0.303499	5		11			1001	365		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	5.422	1000	2.783		0.303499	5		7			1001	367		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	11.458	1000	3.036		0.303499	7		4			1001	369		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	7.991	1000	3.384		0.303499	7		3			1001	371		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	10.654	1000	1.972		0.303499	6		6			1001	372		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	6.638	1000	1.290		0.303499	7		4			1001	375		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	7.462	1000	3.495		0.303499	7		6			1001	378		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	8.395	1000	2.691		0.303499	6		3			1001	382		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.1867	10.322	1000	1.631		0.303499	5		5			1001	383		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	4.114	1000	1.948		0.341069	5		4			1001	384		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	14.759	1000	3.248		0.341069	7		12			1001	385		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	11.507	1000	2.073		0.341069	7		1			1001	386		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	7.894	1000	1.367		0.341069	8		6			1001	387		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	10.527	1000	3.150		0.341069	8		4			1001	388		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	4.762	1000	2.252		0.341069	8		13			1001	390		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	9.772	1000	3.289		0.341069	6		13			1001	391		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	5.430	1000	3.336		0.341069	7		6			1001	395		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	4.860	1000	2.807		0.341069	6		9			1001	396		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	11.765	1000	2.812		0.341069	6		5			1001	397		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	1.636	1000	0.970		0.341069	5		1			1001	399		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	14.485	1000	3.060		0.341069	6		8			1001	400		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	12.089	1000	1.997		0.341069	6		3			1001	401		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	11.826	1000	3.446		0.341069	6		7			1001	403		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	6.946	1000	1.640		0.341069	8		14			1001	404		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	9.792	1000	2.930		0.341069	7		12			1001	406		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	3.466	1000	2.342		0.341069	6		6			1001	407		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	12.203	1000	2.145		0.341069	7		2			1001	409		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	10.372	1000	1.763		0.341069	5		13			1001	411		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	5.122	1000	2.194		0.341069	6		6			1001	413		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	9.340	1000	1.920		0.341069	7		3			1001	414		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	8.156	1000	3.336		0.341069	5		1			1001	415		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	5.015	1000	2.851		0.341069	6		7			1001	416		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	4.870	1000	1.188		0.341069	7		10			1001	417		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	6.816	1000	1.726		0.341069	7		5			1001	418		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	8.733	1000	1.304		0.341069	5		3			1001	419		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	9.240	1000	0.738		0.341069	8		4			1001	420		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	8.173	1000	3.064		0.341069	6		11			1001	421		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	3.869	1000	1.418		0.341069	6		4			1001	422		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	6.316	1000	1.268		0.341069	7		2			1001	423		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	5.884	1000	1.094		0.341069	5		1			1001	424		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	11.300	1000	1.761		0.341069	6		9			1001	425		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	87.5812	4.855	1000	2.062		0.341069	7		2			1001	426		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	7.741	1000	1.378		0.575233	8		5			1001	429		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	5.283	1000	3.221		0.575233	5		9			1001	432		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	10.098	1000	0.801		0.575233	6		16			1001	433		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	1.693	1000	0.758		0.575233	7		16			1001	435		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	11.619	1000	1.150		0.575233	6		9			1001	436		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	4.670	1000	1.792		0.575233	5		17			1001	440		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	8.814	1000	2.955		0.575233	6		2			1001	441		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	9.912	1000	1.332		0.575233	8		6			1001	443		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	3.251	1000	1.142		0.575233	7		3			1001	444		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	6.399	1000	1.157		0.575233	5		12			1001	445		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	5.622	1000	1.739		0.575233	7		8			1001	447		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	5.821	1000	1.227		0.575233	7		16			1001	448		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	7.325	1000	2.016		0.575233	7		8			1001	449		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	9.412	1000	3.281		0.575233	7		12			1001	456		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.0399	10.430	1000	1.478		0.575233	6		17			1001	457		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	11.343	1000	2.076		0.662484	7		11			1001	461		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	6.664	1000	1.063		0.662484	5		9			1001	462		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	4.497	1000	0.773		0.662484	8		18			1001	464		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	6.994	1000	1.781		0.662484	6		20			1001	467		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	4.982	1000	2.642		0.662484	6		4			1001	468		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	4.603	1000	1.915		0.662484	6		1			1001	469		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.761	1000	1.776		0.662484	5		2			1001	470		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	10.029	1000	1.517		0.662484	6		13			1001	472		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	4.441	1000	1.497		0.662484	6		20			1001	473		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	8.237	1000	1.007		0.662484	6		17			1001	474		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	12.321	1000	2.864		0.662484	8		6			1001	475		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.939	1000	1.557		0.662484	6		15			1001	476		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	8.427	1000	1.331		0.662484	7		5			1001	477		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	5.806	1000	1.160		0.662484	5		15			1001	478		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	7.802	1000	1.515		0.662484	6		9			1001	480		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	10.263	1000	1.801		0.662484	6		18			1001	481		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	11.721	1000	1.365		0.662484	8		3			1001	483		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	5.653	1000	2.975		0.662484	6		13			1001	485		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.274	1000	2.098		0.662484	6		13			1001	486		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	4.968	1000	1.431		0.662484	6		6			1001	487		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.207	1000	1.363		0.662484	6		9			1001	488		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	6.831	1000	2.906		0.662484	7		20			1001	489		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	5.674	1000	2.877		0.662484	5		9			1001	490		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	10.014	1000	1.414		0.662484	7		3			1001	491		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	8.986	1000	2.608		0.662484	7		20			1001	492		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	8.743	1000	2.589		0.662484	7		15			1001	493		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	12.453	1000	2.217		0.662484	6		5			1001	494		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.231	1000	1.551		0.662484	6		8			1001	497		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	8.505	1000	2.964		0.662484	7		5			1001	499		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	10.415	1000	1.630		0.662484	5		14			1001	501		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	3.027	1000	1.673		0.662484	6		8			1001	502		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	90.9561	2.677	1000	0.763		0.662484	7		2			1001	504		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	5.803	1000	3.157		0.689043	5		7			1001	506		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	7.430	1000	1.307		0.689043	7		8			1001	507		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	6.395	1000	1.803		0.689043	5		2			1001	508		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	5.991	1000	2.139		0.689043	8		20			1001	509		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	6.060	1000	1.320		0.689043	5		17			1001	510		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	13.018	1000	2.629		0.689043	6		9			1001	511		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	8.750	1000	2.257		0.689043	6		20			1001	512		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	8.063	1000	2.590		0.689043	6		4			1001	513		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	11.735	1000	2.147		0.689043	7		1			1001	514		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	11.872	1000	2.614		0.689043	5		10			1001	517		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	13.420	1000	2.907		0.689043	7		6			1001	518		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	4.461	1000	1.768		0.689043	5		1			1001	519		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	9.867	1000	2.362		0.689043	8		18			1001	520		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	11.746	1000	1.829		0.689043	6		10			1001	521		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	10.035	1000	3.186		0.689043	7		14			1001	522		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	5.601	1000	1.028		0.689043	5		5			1001	525		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	13.961	1000	2.588		0.689043	5		15			1001	528		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	10.584	1000	1.349		0.689043	7		10			1001	529		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	11.457	1000	3.065		0.689043	6		14			1001	533		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	2.915	1000	2.280		0.689043	6		2			1001	534		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	11.805	1000	2.551		0.689043	7		4			1001	535		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	7.157	1000	0.974		0.689043	7		7			1001	536		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	7.709	1000	1.648		0.689043	8		13			1001	538		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	4.292	1000	2.749		0.689043	8		15			1001	539		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2349	5.561	1000	0.811		0.689043	7		17			1001	540		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	8.963	1000	2.271		0.690513	6		16			1001	541		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	3.152	1000	1.546		0.690513	7		1			1001	544		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.763	1000	1.140		0.690513	7		19			1001	545		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	11.631	1000	2.295		0.690513	7		7			1001	546		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	12.246	1000	3.151		0.690513	6		9			1001	547		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	13.108	1000	2.129		0.690513	6		20			1001	548		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.102	1000	1.828		0.690513	6		12			1001	549		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	5.083	1000	2.543		0.690513	8		4			1001	550		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.209	1000	0.803		0.690513	7		3			1001	552		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.743	1000	2.165		0.690513	7		15			1001	554		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	6.690	1000	1.412		0.690513	7		14			1001	555		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	5.412	1000	1.169		0.690513	7		15			1001	556		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	2.063	1000	1.493		0.690513	7		19			1001	557		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	3.488	1000	1.319		0.690513	7		17			1001	559		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	4.163	1000	1.373		0.690513	5		5			1001	560		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	9.888	1000	2.430		0.690513	8		19			1001	563		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.583	1000	2.207		0.690513	8		9			1001	564		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	11.573	1000	2.580		0.690513	7		8			1001	565		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	8.308	1000	2.508		0.690513	6		8			1001	569		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	13.232	1000	3.225		0.690513	7		22			1001	571		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	4.894	1000	1.263		0.690513	5		9			1001	572		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	3.050	1000	1.011		0.690513	7		5			1001	573		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	8.277	1000	2.867		0.690513	7		13			1001	576		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	12.586	1000	3.225		0.690513	8		4			1001	578		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	13.017	1000	2.806		0.690513	6		7			1001	581		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	10.413	1000	0.867		0.690513	6		18			1001	584		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	4.910	1000	2.598		0.690513	6		6			1001	585		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.2504	6.052	1000	0.831		0.690513	6		9			1001	586		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.674	1000	2.994		0.754130	8		11			1001	587		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	6.060	1000	1.534		0.754130	5		15			1001	588		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.970	1000	1.163		0.754130	6		11			1001	590		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.410	1000	2.442		0.754130	7		18			1001	591		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	4.527	1000	1.084		0.754130	7		1			1001	593		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	5.390	1000	1.887		0.754130	6		21			1001	594		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	7.307	1000	0.787		0.754130	8		1			1001	597		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	10.644	1000	1.770		0.754130	8		16			1001	598		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	7.172	1000	2.704		0.754130	5		18			1001	599		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	3.499	1000	1.807		0.754130	5		4			1001	601		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	7.349	1000	1.198		0.754130	7		7			1001	602		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.916	1000	0.933		0.754130	6		7			1001	603		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.066	1000	0.901		0.754130	8		7			1001	604		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	13.780	1000	2.584		0.754130	7		6			1001	605		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	3.897	1000	1.495		0.754130	8		13			1001	607		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	6.645	1000	1.989		0.754130	7		9			1001	608		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	2.534	1000	1.478		0.754130	7		5			1001	609		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	11.026	1000	1.909		0.754130	8		16			1001	610		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	11.759	1000	1.515		0.754130	5		16			1001	611		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.352	1000	2.744		0.754130	6		11			1001	612		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	10.734	1000	2.035		0.754130	7		15			1001	613		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	10.439	1000	0.749		0.754130	7		1			1001	615		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	10.213	1000	2.904		0.754130	6		16			1001	616		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	5.152	1000	2.456		0.754130	7		6			1001	617		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	11.321	1000	2.859		0.754130	6		21			1001	618		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	2.282	1000	1.274		0.754130	6		22			1001	620		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	5.148	1000	2.332		0.754130	5		14			1001	621		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	13.454	1000	2.863		0.754130	8		12			1001	622		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.965	1000	3.170		0.754130	6		15			1001	623		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	9.534	1000	2.609		0.754130	6		10			1001	624		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	10.950	1000	1.522		0.754130	6		5			1001	625		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	4.820	1000	2.866		0.754130	5		4			1001	626		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	6.577	1000	2.512		0.754130	7		23			1001	627		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	13.098	1000	2.292		0.754130	7		6			1001	629		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	91.9184	7.838	1000	3.031		0.754130	6		18			1001	631		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	9.867	1000	0.951		0.766000	5		1			1001	632		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	7.520	1000	1.175		0.766000	6		22			1001	633		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	13.271	1000	2.930		0.766000	6		6			1001	635		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	11.894	1000	1.835		0.766000	6		5			1001	636		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	8.854	1000	2.157		0.766000	7		19			1001	637		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	12.719	1000	3.160		0.766000	5		14			1001	638		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	6.016	1000	2.001		0.766000	6		4			1001	641		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	3.668	1000	2.841		0.766000	6		9			1001	642		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	9.506	1000	2.717		0.766000	6		19			1001	643		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	2.804	1000	2.019		0.766000	8		6			1001	644		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	3.715	1000	0.981		0.766000	6		16			1001	647		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	11.295	1000	1.406		0.766000	6		10			1001	648		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	8.392	1000	2.242		0.766000	6		17			1001	650		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	11.918	1000	1.549		0.766000	8		22			1001	651		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	4.800	1000	0.830		0.766000	6		23			1001	652		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	4.785	1000	2.546		0.766000	8		13			1001	656		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	11.098	1000	1.161		0.766000	6		3			1001	657		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	5.184	1000	1.082		0.766000	6		14			1001	658		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	8.367	1000	1.492		0.766000	5		7			1001	659		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	12.902	1000	2.775		0.766000	6		21			1001	660		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	10.235	1000	2.738		0.766000	7		16			1001	661		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	10.343	1000	1.755		0.766000	6		4			1001	662		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0430	8.049	1000	1.742		0.766000	6		10			1001	665		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	12.213	1000	1.877		0.771382	8		12			1001	666		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	10.877	1000	2.598		0.771382	7		5			1001	668		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	6.832	1000	2.519		0.771382	5		10			1001	669		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	8.335	1000	2.150		0.771382	8		12			1001	671		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	5.694	1000	2.023		0.771382	7		1			1001	672		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	10.603	1000	2.184		0.771382	8		1			1001	674		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	7.632	1000	2.574		0.771382	7		9			1001	675		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	8.032	1000	2.667		0.771382	6		4			1001	679		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	12.238	1000	1.551		0.771382	7		14			1001	680		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	7.788	1000	0.916		0.771382	7		6			1001	681		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	4.842	1000	2.324		0.771382	8		16			1001	682		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	6.257	1000	1.260		0.771382	6		8			1001	683		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	6.913	1000	3.169		0.771382	5		8			1001	685		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	4.204	1000	1.441		0.771382	7		22			1001	686		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.0995	8.453	1000	2.486		0.771382	6		2			1001	687		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	8.507	1000	1.570		0.778957	8		3			1001	688		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	2.163	1000	1.115		0.778957	7		17			1001	689		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	11.451	1000	2.383		0.778957	7		22			1001	690		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.475	1000	2.891		0.778957	6		21			1001	692		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	9.994	1000	2.785		0.778957	6		4			1001	693		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.283	1000	2.116		0.778957	5		21			1001	694		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	11.233	1000	2.451		0.778957	8		22			1001	695		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	9.387	1000	1.510		0.778957	7		16			1001	698		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	6.438	1000	2.630		0.778957	6		6			1001	699		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	6.668	1000	2.112		0.778957	5		16			1001	700		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	5.971	1000	2.417		0.778957	8		8			1001	701		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	4.027	1000	2.297		0.778957	8		11			1001	702		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	5.610	1000	3.088		0.778957	8		23			1001	703		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	6.000	1000	2.949		0.778957	8		1			1001	704		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	9.951	1000	2.334		0.778957	6		19			1001	705		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	12.082	1000	1.915		0.778957	7		1			1001	706		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	10.739	1000	1.237		0.778957	7		7			1001	707		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	9.426	1000	1.886		0.778957	6		5			1001	709		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	9.326	1000	2.334		0.778957	5		19			1001	710		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	5.867	1000	2.799		0.778957	7		22			1001	711		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	8.145	1000	1.737		0.778957	5		2			1001	712		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	11.553	1000	1.991		0.778957	7		2			1001	713		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	2.660	1000	0.827		0.778957	6		3			1001	714		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	11.916	1000	2.033		0.778957	5		9			1001	715		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	4.637	1000	1.921		0.778957	7		15			1001	716		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	5.880	1000	1.044		0.778957	6		13			1001	717		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.892	1000	3.049		0.778957	5		8			1001	718		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	8.458	1000	1.688		0.778957	8		13			1001	719		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.137	1000	0.909		0.778957	5		4			1001	721		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.753	1000	1.196		0.778957	6		11			1001	722		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	8.979	1000	3.014		0.778957	5		2			1001	724		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	12.439	1000	2.348		0.778957	5		14			1001	727		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	10.962	1000	2.360		0.778957	7		9			1001	729		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	10.704	1000	2.070		0.778957	7		10			1001	731		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	4.009	1000	2.008		0.778957	8		9			1001	732		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	6.546	1000	2.811		0.778957	5		16			1001	736		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.1791	7.541	1000	1.725		0.778957	7		23			1001	737		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	4.691	1000	2.190		0.787205	6		19			1001	738		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	8.505	1000	2.097		0.787205	8		22			1001	740		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	9.916	1000	2.927		0.787205	8		18			1001	741		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	6.458	1000	0.735		0.787205	7		10			1001	742		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	5.387	1000	1.149		0.787205	6		10			1001	743		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	12.032	1000	2.697		0.787205	7		23			1001	744		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	12.549	1000	2.409		0.787205	7		13			1001	746		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	11.587	1000	1.740		0.787205	5		13			1001	747		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	7.841	1000	0.958		0.787205	7		22			1001	748		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	8.813	1000	1.447		0.787205	5		16			1001	751		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	4.849	1000	1.937		0.787205	7		19			1001	753		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	10.711	1000	3.095		0.787205	8		1			1001	754		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	8.180	1000	2.523		0.787205	7		14			1001	756		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	5.493	1000	0.746		0.787205	8		11			1001	757		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	11.164	1000	1.242		0.787205	6		5			1001	759		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	8.764	1000	2.587		0.787205	6		6			1001	761		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	4.778	1000	1.479		0.787205	7		10			1001	762		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	9.867	1000	2.433		0.787205	7		3			1001	763		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	10.092	1000	2.121		0.787205	8		18			1001	764		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	92.2657	3.557	1000	0.897		0.787205	5		2			1001	765		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	6.456	1000	2.400		0.870101	6		17			1001	766		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	5.945	1000	1.253		0.870101	6		26			1001	767		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	2.385	1000	1.430		0.870101	8		12			1001	768		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	7.568	1000	2.345		0.870101	6		18			1001	769		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	10.927	1000	2.937		0.870101	6		5			1001	770		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	8.776	1000	0.789		0.870101	6		21			1001	771		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	11.474	1000	2.785		0.870101	6		14			1001	772		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	6.659	1000	1.146		0.870101	5		15			1001	774		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	12.730	1000	2.524		0.870101	6		15			1001	775		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	4.559	1000	1.786		0.870101	6		11			1001	776		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	12.138	1000	1.761		0.870101	7		3			1001	778		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	7.006	1000	2.731		0.870101	5		18			1001	779		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	11.208	1000	2.557		0.870101	6		7			1001	781		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	7.849	1000	1.144		0.870101	8		18			1001	783		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	6.839	1000	0.810		0.870101	6		8			1001	784		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	6.880	1000	3.081		0.870101	6		3			1001	785		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.053	1000	1.095		0.870101	8		22			1001	786		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.795	1000	2.149		0.870101	5		22			1001	788		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	8.103	1000	2.710		0.870101	7		15			1001	789		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.337	1000	2.902		0.870101	5		4			1001	790		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	10.804	1000	0.956		0.870101	8		24			1001	792		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.658	1000	2.676		0.870101	7		14			1001	793		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	5.673	1000	1.939		0.870101	7		6			1001	795		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.511	1000	0.893		0.870101	6		12			1001	796		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	4.400	1000	1.004		0.870101	8		14			1001	797		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	3.415	1000	2.684		0.870101	6		16			1001	798		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	9.400	1000	1.188		0.870101	7		24			1001	799		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	4.118	1000	0.771		0.870101	6		18			1001	801		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	8.662	1000	1.895		0.870101	7		4			1001	802		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	7.230	1000	1.566		0.870101	7		1			1001	805		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	6.640	1000	1.546		0.870101	8		6			1001	806		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	10.211	1000	1.020		0.870101	6		10			1001	809		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	93.1361	4.624	1000	2.195		0.870101	8		3			1001	810		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	6.177	1000	2.451		1.057546	6		3			1001	813		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	6.972	1000	2.203		1.057546	5		17			1001	815		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	4.628	1000	2.234		1.057546	7		8			1001	818		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	7.652	1000	1.669		1.057546	6		27			1001	819		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	9.104	1000	2.672		1.057546	5		3			1001	820		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	8.461	1000	2.776		1.057546	5		27			1001	821		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	6.938	1000	2.596		1.057546	6		16			1001	823		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	8.340	1000	1.207		1.057546	6		8			1001	824		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	12.473	1000	2.270		1.057546	6		2			1001	825		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	3.964	1000	1.566		1.057546	7		18			1001	826		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	10.170	1000	2.653		1.057546	6		19			1001	827		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	9.435	1000	1.934		1.057546	6		1			1001	828		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	10.632	1000	1.159		1.057546	7		25			1001	829		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	8.619	1000	2.311		1.057546	7		29			1001	831		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	1.327	1000	0.929		1.057546	6		12			1001	834		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	10.145	1000	2.007		1.057546	5		5			1001	835		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	8.678	1000	0.950		1.057546	7		9			1001	836		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	12.454	1000	2.154		1.057546	5		18			1001	837		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	12.005	1000	1.872		1.057546	7		7			1001	838		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	5.842	1000	1.371		1.057546	8		16			1001	840		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	8.403	1000	1.771		1.057546	7		12			1001	843		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.1042	10.330	1000	2.283		1.057546	8		6			1001	844		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.494	1000	2.176		1.079085	8		4			1001	845		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	9.662	1000	2.833		1.079085	6		10			1001	847		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	2.935	1000	0.723		1.079085	6		5			1001	850		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	3.384	1000	1.108		1.079085	6		26			1001	851		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	11.722	1000	1.510		1.079085	8		16			1001	852		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	9.418	1000	1.989		1.079085	7		26			1001	855		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.907	1000	0.913		1.079085	6		12			1001	857		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	6.388	1000	2.605		1.079085	7		10			1001	858		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.192	1000	2.600		1.079085	6		18			1001	859		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	11.724	1000	2.726		1.079085	5		5			1001	860		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	3.070	1000	1.557		1.079085	5		28			1001	862		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	6.286	1000	0.732		1.079085	7		14			1001	867		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	10.632	1000	1.986		1.079085	7		21			1001	871		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	6.057	1000	1.130		1.079085	6		15			1001	872		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	8.926	1000	2.532		1.079085	8		28			1001	873		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	11.300	1000	2.614		1.079085	7		23			1001	874		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	8.404	1000	1.687		1.079085	7		11			1001	875		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	6.823	1000	1.787		1.079085	6		18			1001	876		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	3.678	1000	1.153		1.079085	6		13			1001	877		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.732	1000	1.924		1.079085	6		14			1001	879		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	8.485	1000	0.932		1.079085	7		12			1001	882		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.969	1000	2.237		1.079085	5		18			1001	884		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	5.259	1000	0.801		1.079085	6		10			1001	889		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	12.336	1000	2.519		1.079085	8		12			1001	890		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.3304	6.488	1000	2.712		1.079085	6		12			1001	894		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	1.360	1000	1.037		1.126623	8		14			1001	895		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	6.113	1000	1.301		1.126623	6		18			1001	896		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	4.014	1000	1.286		1.126623	8		21			1001	898		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	5.542	1000	2.360		1.126623	6		9			1001	900		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	7.720	1000	2.874		1.126623	5		24			1001	901		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	9.677	1000	1.132		1.126623	5		22			1001	904		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	4.501	1000	1.957		1.126623	7		26			1001	905		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	3.850	1000	1.214		1.126623	7		27			1001	907		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	10.609	1000	2.743		1.126623	7		8			1001	908		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	11.456	1000	1.592		1.126623	7		4			1001	909		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	5.343	1000	1.805		1.126623	7		27			1001	910		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	7.504	1000	2.057		1.126623	7		4			1001	911		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	7.361	1000	1.540		1.126623	5		14			1001	912		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	5.527	1000	0.757		1.126623	7		23			1001	913		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	6.037	1000	2.356		1.126623	6		19			1001	915		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	10.900	1000	1.540		1.126623	5		8			1001	916		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	5.102	1000	1.589		1.126623	8		28			1001	917		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	12.696	1000	2.114		1.126623	6		1			1001	920		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	7.499	1000	2.741		1.126623	5		8			1001	921		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	4.342	1000	2.843		1.126623	6		17			1001	924		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	7.593	1000	1.711		1.126623	7		6			1001	925		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.8295	9.955	1000	1.750		1.126623	7		5			1001	926		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	5.348	1000	1.171		1.134800	7		31			1001	927		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	6.249	1000	2.446		1.134800	7		19			1001	931		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	10.503	1000	2.410		1.134800	7		9			1001	933		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	12.313	1000	2.385		1.134800	6		9			1001	934		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	10.442	1000	2.797		1.134800	6		10			1001	935		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	5.522	1000	1.667		1.134800	7		31			1001	937		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	7.429	1000	1.121		1.134800	5		13			1001	938		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	5.651	1000	2.172		1.134800	8		8			1001	939		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	4.662	1000	2.445		1.134800	6		3			1001	941		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	9.124	1000	1.676		1.134800	6		31			1001	943		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	13.814	1000	2.703		1.134800	8		12			1001	945		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	11.334	1000	0.939		1.134800	6		21			1001	946		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	10.457	1000	1.086		1.134800	8		29			1001	947		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	2.355	1000	1.300		1.134800	7		13			1001	948		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	10.957	1000	1.209		1.134800	5		27			1001	949		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	13.368	1000	2.560		1.134800	6		5			1001	950		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	4.645	1000	2.311		1.134800	6		21			1001	951		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	9.771	1000	2.255		1.134800	8		20			1001	952		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	8.270	1000	1.189		1.134800	7		20			1001	954		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	5.765	1000	1.474		1.134800	7		29			1001	955		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	6.952	1000	2.257		1.134800	7		4			1001	956		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	9.174	1000	1.263		1.134800	6		24			1001	958		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9154	10.472	1000	1.160		1.134800	6		8			1001	961		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	3.740	1000	2.815		1.139484	6		15			1001	962		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.990	1000	0.718		1.139484	5		8			1001	963		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	5.671	1000	1.151		1.139484	6		21			1001	964		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	9.483	1000	2.565		1.139484	6		4			1001	965		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.591	1000	1.286		1.139484	8		14			1001	966		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	12.195	1000	2.564		1.139484	8		29			1001	967		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.472	1000	1.136		1.139484	5		3			1001	969		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.814	1000	1.051		1.139484	7		9			1001	971		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	13.030	1000	2.657		1.139484	5		30			1001	972		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	11.758	1000	2.618		1.139484	6		11			1001	973		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	12.232	1000	2.101		1.139484	7		24			1001	974		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	7.227	1000	1.919		1.139484	6		4			1001	975		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	10.173	1000	1.040		1.139484	8		18			1001	978		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	10.005	1000	1.852		1.139484	6		13			1001	980		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.402	1000	2.098		1.139484	7		2			1001	982		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	5.212	1000	2.186		1.139484	6		25			1001	983		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	4.186	1000	1.483		1.139484	5		7			1001	985		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	5.463	1000	2.487		1.139484	6		24			1001	986		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.754	1000	1.559		1.139484	5		22			1001	988		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	5.780	1000	0.773		1.139484	8		14			1001	989		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.427	1000	1.114		1.139484	6		20			1001	990		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.778	1000	2.089		1.139484	8		27			1001	991		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.694	1000	2.604		1.139484	5		19			1001	996		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.021	1000	2.792		1.139484	6		2			1001	997		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.422	1000	2.589		1.139484	7		9			1001	998		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	9.667	1000	1.002		1.139484	6		27			1001	999		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.044	1000	1.718		1.139484	8		29			1001	1000		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.828	1000	1.378		1.139484	5		5			1001	1001		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	11.515	1000	1.435		1.139484	5		26			1001	1003		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.296	1000	2.107		1.139484	5		4			1001	1004		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	4.793	1000	1.621		1.139484	8		10			1001	1005		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	3.604	1000	1.443		1.139484	6		26			1001	1006		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	8.396	1000	1.980		1.139484	5		5			1001	1007		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	9.261	1000	1.572		1.139484	8		3			1001	1009		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	4.395	1000	2.514		1.139484	6		6			1001	1010		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	9.004	1000	1.085		1.139484	5		9			1001	1011		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	12.274	1000	2.853		1.139484	5		31			1001	1012		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	4.589	1000	2.004		1.139484	6		30			1001	1014		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	95.9646	6.716	1000	1.324		1.139484	6		11			1001	1015		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	13.797	1000	2.544		1.168849	8		27			1001	1016		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	9.548	1000	1.564		1.168849	7		24			1001	1017		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	7.185	1000	1.496		1.168849	7		7			1001	1020		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	3.267	1000	2.398		1.168849	8		5			1001	1022		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	11.176	1000	1.964		1.168849	6		14			1001	1023		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	8.305	1000	2.119		1.168849	6		20			1001	1024		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	9.562	1000	2.611		1.168849	7		2			1001	1026		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	5.654	1000	2.101		1.168849	7		22			1001	1027		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	4.833	1000	1.034		1.168849	8		28			1001	1028		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	9.909	1000	1.353		1.168849	7		24			1001	1030		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	12.039	1000	2.296		1.168849	7		5			1001	1033		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	5.411	1000	1.676		1.168849	6		1			1001	1035		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	10.563	1000	2.080		1.168849	8		4			1001	1036		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	5.269	1000	1.328		1.168849	6		10			1001	1039		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	96.2729	3.416	1000	0.939		1.168849	7		17			1001	1041		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	11.415	1000	1.254		1.351205	5		27			1001	1042		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	3.364	1000	1.380		1.351205	5		11			1001	1043		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	10.772	1000	2.643		1.351205	7		34			1001	1044		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	12.246	1000	1.965		1.351205	6		1			1001	1047		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	8.432	1000	1.799		1.351205	5		8			1001	1049		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	11.178	1000	2.222		1.351205	6		3			1001	1051		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	3.785	1000	0.803		1.351205	8		34			1001	1052		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	4.704	1000	2.095		1.351205	7		20			1001	1053		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	8.533	1000	1.321		1.351205	5		5			1001	1054		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	4.365	1000	2.408		1.351205	5		12			1001	1057		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	8.623	1000	0.954		1.351205	6		16			1001	1058		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.204	1000	1.764		1.351205	6		13			1001	1059		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.748	1000	0.932		1.351205	8		20			1001	1060		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	11.605	1000	2.551		1.351205	8		29			1001	1061		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	8.901	1000	1.317		1.351205	5		13			1001	1062		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	7.138	1000	0.738		1.351205	7		30			1001	1063		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.213	1000	0.966		1.351205	7		30			1001	1065		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	8.385	1000	0.760		1.351205	5		34			1001	1070		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	2.766	1000	0.710		1.351205	7		4			1001	1072		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.561	1000	1.186		1.351205	5		18			1001	1075		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	1.631	1000	0.856		1.351205	7		26			1001	1076		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	4.602	1000	2.020		1.351205	7		8			1001	1077		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.305	1000	2.548		1.351205	7		28			1001	1079		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	4.435	1000	1.746		1.351205	6		34			1001	1080		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	4.289	1000	2.170		1.351205	7		24			1001	1081		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.161	1000	1.466		1.351205	7		23			1001	1082		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	5.154	1000	0.777		1.351205	7		12			1001	1084		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.056	1000	1.310		1.351205	5		11			1001	1085		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	9.898	1000	1.501		1.351205	5		19			1001	1086		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	1.990	1000	0.786		1.351205	6		6			1001	1087		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.1876	6.142	1000	2.344		1.351205	6		8			1001	1092		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	13.059	1000	2.618		1.361491	7		12			1001	1094		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	4.438	1000	1.668		1.361491	7		17			1001	1095		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	8.263	1000	2.504		1.361491	5		27			1001	1096		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	2.077	1000	1.079		1.361491	7		36			1001	1098		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	12.950	1000	2.027		1.361491	7		9			1001	1099		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	3.524	1000	1.355		1.361491	6		6			1001	1100		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	9.271	1000	2.663		1.361491	5		17			1001	1101		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	4.829	1000	2.155		1.361491	8		21			1001	1103		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	11.142	1000	0.941		1.361491	5		19			1001	1106		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	1.626	1000	0.936		1.361491	5		3			1001	1108		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	8.973	1000	1.531		1.361491	7		35			1001	1109		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	9.796	1000	2.040		1.361491	8		29			1001	1110		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	5.805	1000	1.977		1.361491	7		36			1001	1111		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	7.942	1000	1.599		1.361491	5		7			1001	1112		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	10.557	1000	1.343		1.361491	7		29			1001	1114		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.2957	10.667	1000	0.834		1.361491	6		2			1001	1115		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	11.030	1000	1.938		1.385097	7		33			1001	1118		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	12.262	1000	2.157		1.385097	5		15			1001	1119		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	5.891	1000	1.450		1.385097	7		32			1001	1120		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	6.858	1000	0.725		1.385097	6		13			1001	1121		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	8.470	1000	1.098		1.385097	6		17			1001	1122		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	5.200	1000	1.270		1.385097	7		31			1001	1125		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	3.635	1000	1.817		1.385097	7		14			1001	1126		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	8.621	1000	2.175		1.385097	5		16			1001	1127		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	6.979	1000	0.776		1.385097	5		23			1001	1128		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	7.678	1000	2.525		1.385097	7		2			1001	1129		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.999	1000	0.726		1.385097	7		22			1001	1130		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	9.905	1000	1.081		1.385097	8		20			1001	1131		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	3.175	1000	0.809		1.385097	6		3			1001	1132		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	13.216	1000	2.549		1.385097	8		16			1001	1134		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	5.986	1000	2.197		1.385097	6		18			1001	1135		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.306	1000	1.078		1.385097	6		8			1001	1136		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	10.238	1000	1.854		1.385097	8		21			1001	1137		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	13.421	1000	2.673		1.385097	7		12			1001	1138		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	11.572	1000	2.650		1.385097	7		34			1001	1139		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	10.328	1000	2.053		1.385097	6		22			1001	1140		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	11.934	1000	1.858		1.385097	5		15			1001	1141		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.589	1000	1.770		1.385097	7		2			1001	1142		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	9.200	1000	0.861		1.385097	7		16			1001	1143		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.651	1000	2.424		1.385097	6		17			1001	1144		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	7.228	1000	1.963		1.385097	6		10			1001	1145		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	5.158	1000	1.019		1.385097	8		11			1001	1148		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	8.318	1000	0.705		1.385097	7		36			1001	1149		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	7.430	1000	2.141		1.385097	8		32			1001	1150		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	10.833	1000	2.135		1.385097	7		11			1001	1151		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.687	1000	0.751		1.385097	7		7			1001	1152		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	3.494	1000	1.267		1.385097	6		7			1001	1153		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	9.067	1000	2.009		1.385097	8		6			1001	1154		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	3.821	1000	1.048		1.385097	7		35			1001	1155		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	12.326	1000	2.543		1.385097	5		19			1001	1156		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.5435	4.877	1000	0.702		1.385097	7		14			1001	1159		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6016	14.764	1000	11.811		3.000000	5		13			1001	1666		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	3.784	1000	0.812		1.398346	7		2			1001	1161		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	3.483	1000	1.925		1.398346	8		5			1001	1162		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	10.536	1000	1.313		1.398346	8		22			1001	1163		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	10.855	1000	1.298		1.398346	7		7			1001	1164		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	10.101	1000	1.369		1.398346	8		1			1001	1166		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	11.427	1000	2.130		1.398346	6		1			1001	1168		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	11.420	1000	1.417		1.398346	8		34			1001	1169		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	6.335	1000	1.482		1.398346	6		29			1001	1172		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	9.953	1000	1.462		1.398346	6		5			1001	1173		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	6.769	1000	1.677		1.398346	6		8			1001	1174		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	1.743	1000	1.023		1.398346	8		9			1001	1175		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.6826	5.972	1000	0.937		1.398346	7		33			1001	1178		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	8.344	1000	2.182		1.425536	7		23			1001	1180		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	11.648	1000	1.241		1.425536	7		13			1001	1181		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	4.016	1000	2.152		1.425536	5		34			1001	1182		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	3.336	1000	1.717		1.425536	7		31			1001	1183		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	7.415	1000	2.597		1.425536	6		9			1001	1184		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	4.953	1000	1.970		1.425536	8		4			1001	1186		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	3.778	1000	2.091		1.425536	8		2			1001	1188		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	5.055	1000	2.224		1.425536	8		25			1001	1190		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	3.781	1000	1.579		1.425536	6		19			1001	1191		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	7.954	1000	0.731		1.425536	7		6			1001	1192		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	4.511	1000	2.276		1.425536	5		15			1001	1194		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	10.026	1000	1.536		1.425536	8		28			1001	1195		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	6.691	1000	2.008		1.425536	5		23			1001	1197		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	10.150	1000	1.848		1.425536	8		26			1001	1200		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	3.583	1000	1.008		1.425536	7		12			1001	1201		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	2.299	1000	1.426		1.425536	8		11			1001	1202		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	5.530	1000	2.656		1.425536	7		20			1001	1204		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	5.913	1000	2.267		1.425536	8		20			1001	1205		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	6.933	1000	2.489		1.425536	8		22			1001	1206		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	12.336	1000	2.415		1.425536	6		26			1001	1207		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	98.9681	4.286	1000	1.139		1.425536	6		12			1001	1208		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.3608	12.272	1000	9.817		3.000000	6		15			1001	1676		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	7.159	1000	2.195		1.591946	6		38			1001	1209		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	5.979	1000	1.951		1.591946	7		5			1001	1210		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	2.414	1000	1.400		1.591946	8		5			1001	1211		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	3.151	1000	0.951		1.591946	8		21			1001	1213		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	7.283	1000	2.316		1.591946	7		4			1001	1214		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	2.734	1000	1.439		1.591946	5		12			1001	1215		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.847	1000	1.357		1.591946	6		35			1001	1216		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.294	1000	1.302		1.591946	8		32			1001	1217		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.668	1000	1.774		1.591946	7		21			1001	1219		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.161	1000	1.153		1.591946	7		34			1001	1221		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	7.907	1000	1.562		1.591946	5		10			1001	1222		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	5.387	1000	2.165		1.591946	6		31			1001	1224		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	5.776	1000	0.996		1.591946	6		23			1001	1225		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	6.772	1000	1.994		1.591946	7		34			1001	1226		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.256	1000	0.726		1.591946	7		30			1001	1227		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.026	1000	0.990		1.591946	7		4			1001	1228		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	5.884	1000	0.730		1.591946	5		8			1001	1229		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	11.833	1000	1.760		1.591946	5		8			1001	1230		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	11.031	1000	2.380		1.591946	5		16			1001	1231		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	12.322	1000	1.625		1.591946	5		15			1001	1232		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	4.372	1000	0.695		1.591946	7		19			1001	1233		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	9.295	1000	1.981		1.591946	7		23			1001	1234		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	12.610	1000	2.031		1.591946	7		27			1001	1236		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	6.766	1000	2.417		1.591946	8		32			1001	1240		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	7.591	1000	2.089		1.591946	7		37			1001	1243		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	8.719	1000	2.240		1.591946	7		4			1001	1244		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	11.338	1000	1.921		1.591946	7		11			1001	1245		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7154	2.542	1000	1.835		1.591946	6		16			1001	1246		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	100.7977	14.816	1000	9.260		3.000000	1		15			1001	1658		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8356	12.686	1000	10.149		3.000000	7		6			1001	1690		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	3.170	1000	1.301		1.702989	6		28			1001	1248		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	3.235	1000	1.016		1.702989	6		19			1001	1250		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	5.483	1000	2.032		1.702989	6		19			1001	1251		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	1.215	1000	0.911		1.702989	6		31			1001	1252		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	7.139	1000	1.232		1.702989	5		19			1001	1254		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	9.001	1000	2.130		1.702989	5		6			1001	1255		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	10.411	1000	0.890		1.702989	7		26			1001	1259		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	7.271	1000	2.202		1.702989	7		17			1001	1260		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	4.904	1000	1.971		1.702989	7		2			1001	1261		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	11.340	1000	2.444		1.702989	8		26			1001	1262		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	12.473	1000	1.584		1.702989	8		33			1001	1263		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	3.072	1000	1.307		1.702989	8		39			1001	1265		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	4.837	1000	2.009		1.702989	6		29			1001	1268		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	3.959	1000	1.436		1.702989	5		9			1001	1269		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	4.645	1000	1.947		1.702989	7		34			1001	1270		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	7.518	1000	1.183		1.702989	7		40			1001	1271		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	11.902	1000	1.964		1.702989	6		29			1001	1272		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	9.234	1000	0.967		1.702989	7		16			1001	1273		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	8.228	1000	1.785		1.702989	6		2			1001	1274		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	9.016	1000	0.850		1.702989	6		30			1001	1275		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	101.8814	3.902	1000	1.093		1.702989	7		40			1001	1278		1				1			2			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.3064	16.180	1000	10.112		3.000000	4		12			1001	1709		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.3119	11.629	1000	9.303		3.000000	7		12			1001	1731		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.4873	17.537	1000	10.960		3.222222	1		12			1001	1777		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.549	1000	2.174		1.767650	6		39			1001	1279		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	11.526	1000	2.116		1.767650	7		43			1001	1280		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	5.607	1000	1.978		1.767650	6		40			1001	1283		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	5.605	1000	1.046		1.767650	6		6			1001	1284		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	10.117	1000	1.077		1.767650	6		11			1001	1285		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.323	1000	0.895		1.767650	5		2			1001	1286		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	5.890	1000	1.516		1.767650	7		30			1001	1287		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.148	1000	0.790		1.767650	8		28			1001	1288		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.737	1000	1.815		1.767650	7		22			1001	1289		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.119	1000	2.286		1.767650	7		8			1001	1290		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	11.264	1000	1.872		1.767650	6		25			1001	1291		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	4.685	1000	1.792		1.767650	6		36			1001	1292		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.699	1000	1.058		1.767650	7		10			1001	1293		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	6.643	1000	0.739		1.767650	6		27			1001	1298		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.914	1000	0.952		1.767650	6		40			1001	1299		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	6.563	1000	1.221		1.767650	6		7			1001	1301		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.101	1000	2.010		1.767650	6		10			1001	1302		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	6.577	1000	2.414		1.767650	5		22			1001	1303		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.095	1000	1.221		1.767650	6		8			1001	1304		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	12.342	1000	1.848		1.767650	7		20			1001	1305		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	8.229	1000	1.748		1.767650	6		42			1001	1307		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	4.439	1000	0.720		1.767650	7		1			1001	1308		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	12.150	1000	2.258		1.767650	5		11			1001	1309		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	4.474	1000	1.427		1.767650	5		21			1001	1311		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	11.309	1000	1.497		1.767650	5		17			1001	1312		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.829	1000	1.688		1.767650	6		30			1001	1313		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.002	1000	1.987		1.767650	7		42			1001	1314		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	10.067	1000	2.312		1.767650	5		34			1001	1315		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	6.322	1000	1.531		1.767650	6		22			1001	1316		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	5.325	1000	1.308		1.767650	8		24			1001	1317		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	7.302	1000	1.870		1.767650	5		29			1001	1318		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	4.094	1000	1.850		1.767650	7		9			1001	1319		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.020	1000	1.801		1.767650	8		14			1001	1322		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.075	1000	1.740		1.767650	8		38			1001	1323		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	9.326	1000	1.723		1.767650	7		15			1001	1324		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	10.320	1000	1.536		1.767650	8		2			1001	1325		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	4.507	1000	2.124		1.767650	6		30			1001	1330		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.5603	5.790	1000	1.382		1.767650	7		32			1001	1331		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7465	12.784	1000	10.227		3.222222	8		9			1001	1877		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	1.798	1000	1.192		1.789398	6		37			1001	1332		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	3.540	1000	1.300		1.789398	6		15			1001	1333		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	5.267	1000	0.973		1.789398	7		27			1001	1334		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	8.020	1000	0.711		1.789398	5		1			1001	1337		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	4.518	1000	2.034		1.789398	5		4			1001	1340		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	8.715	1000	2.051		1.789398	7		39			1001	1341		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	11.272	1000	1.576		1.789398	6		25			1001	1342		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	6.185	1000	1.122		1.789398	5		33			1001	1343		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	7.037	1000	1.380		1.789398	7		8			1001	1344		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	9.422	1000	2.139		1.789398	5		45			1001	1345		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	4.380	1000	1.593		1.789398	6		14			1001	1348		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	4.617	1000	1.847		1.789398	7		23			1001	1349		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	12.211	1000	1.958		1.789398	5		40			1001	1350		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	12.211	1000	1.619		1.789398	7		42			1001	1351		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	9.351	1000	2.099		1.789398	6		39			1001	1354		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	2.482	1000	1.263		1.789398	7		21			1001	1355		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	8.764	1000	2.123		1.789398	6		25			1001	1357		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	1.969	1000	0.731		1.789398	7		8			1001	1359		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	3.932	1000	1.131		1.789398	7		11			1001	1360		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	6.216	1000	1.368		1.789398	5		31			1001	1362		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	11.111	1000	2.178		1.789398	7		1			1001	1363		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	12.211	1000	2.400		1.789398	6		29			1001	1364		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	5.561	1000	1.431		1.789398	6		43			1001	1367		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	8.442	1000	1.668		1.789398	8		17			1001	1368		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	4.392	1000	0.919		1.789398	6		15			1001	1369		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	10.842	1000	1.512		1.789398	7		29			1001	1371		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	2.783	1000	1.431		1.789398	7		30			1001	1372		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	3.948	1000	2.263		1.789398	8		23			1001	1373		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	11.289	1000	2.382		1.789398	5		16			1001	1374		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	9.765	1000	1.226		1.789398	7		4			1001	1375		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	7.222	1000	0.979		1.789398	5		7			1001	1376		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	4.768	1000	1.711		1.789398	6		40			1001	1377		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	7.463	1000	0.768		1.789398	7		21			1001	1378		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	12.211	1000	1.926		1.789398	7		7			1001	1380		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	9.209	1000	1.308		1.789398	5		43			1001	1381		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.7887	3.805	1000	0.819		1.789398	8		23			1001	1382		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.9626	16.174	1000	10.109		3.000000	6		8			1001	1748		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	102.9701	11.921	1000	9.536		3.000000	3		9			1001	1655		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	4.744	1000	0.796		1.809999	8		34			1001	1383		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	6.597	1000	1.198		1.809999	7		7			1001	1384		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	4.239	1000	2.323		1.809999	8		2			1001	1385		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	6.274	1000	1.141		1.809999	6		11			1001	1386		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	5.281	1000	2.215		1.809999	5		38			1001	1387		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	4.261	1000	2.179		1.809999	7		19			1001	1388		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	11.982	1000	1.724		1.809999	7		25			1001	1389		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	9.365	1000	1.962		1.809999	6		38			1001	1392		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	8.702	1000	0.889		1.809999	8		20			1001	1394		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	9.931	1000	1.625		1.809999	8		20			1001	1395		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	9.292	1000	1.221		1.809999	5		36			1001	1396		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	10.842	1000	1.967		1.809999	6		33			1001	1399		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	3.792	1000	1.108		1.809999	6		1			1001	1403		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	5.478	1000	1.216		1.809999	5		17			1001	1404		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	2.965	1000	1.414		1.809999	5		14			1001	1405		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	7.935	1000	0.981		1.809999	8		5			1001	1409		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	5.958	1000	2.344		1.809999	8		12			1001	1411		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	4.804	1000	1.798		1.809999	7		37			1001	1414		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	11.995	1000	2.056		1.809999	5		32			1001	1415		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	7.029	1000	1.055		1.809999	7		41			1001	1416		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0050	6.133	1000	1.315		1.809999	6		21			1001	1417		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	3.820	1000	0.815		1.816997	8		13			1001	1418		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	2.533	1000	0.795		1.816997	7		29			1001	1420		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	3.964	1000	1.005		1.816997	7		42			1001	1423		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	2.861	1000	0.765		1.816997	7		44			1001	1425		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	10.100	1000	1.789		1.816997	7		38			1001	1426		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	6.173	1000	1.084		1.816997	5		37			1001	1431		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	5.442	1000	1.523		1.816997	8		22			1001	1433		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	10.468	1000	1.839		1.816997	6		14			1001	1435		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	6.985	1000	1.758		1.816997	5		3			1001	1438		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	6.504	1000	2.199		1.816997	5		20			1001	1442		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	7.354	1000	1.399		1.816997	8		2			1001	1445		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	3.263	1000	1.122		1.816997	6		38			1001	1448		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	11.922	1000	2.287		1.816997	7		22			1001	1451		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	4.454	1000	1.133		1.816997	7		17			1001	1452		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	7.006	1000	1.712		1.816997	6		34			1001	1454		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	11.312	1000	1.992		1.816997	7		8			1001	1455		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.0785	3.559	1000	2.018		1.816997	7		18			1001	1456		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1544	12.689	1000	10.152		3.222222	3		3			1001	1781		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	5.072	1000	1.704		1.825159	7		11			1001	1457		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	3.044	1000	1.197		1.825159	7		42			1001	1458		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.160	1000	1.382		1.825159	6		13			1001	1459		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	6.867	1000	2.049		1.825159	7		41			1001	1460		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.469	1000	1.895		1.825159	7		34			1001	1463		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	5.435	1000	2.199		1.825159	7		45			1001	1464		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	2.480	1000	1.693		1.825159	7		18			1001	1465		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.028	1000	1.957		1.825159	5		7			1001	1466		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	8.090	1000	2.248		1.825159	7		40			1001	1467		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	2.977	1000	0.995		1.825159	7		3			1001	1468		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.495	1000	1.404		1.825159	8		30			1001	1471		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	8.248	1000	1.489		1.825159	6		3			1001	1472		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.836	1000	1.596		1.825159	6		23			1001	1473		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	2.518	1000	0.869		1.825159	6		12			1001	1475		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	5.463	1000	1.096		1.825159	8		39			1001	1476		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.672	1000	1.280		1.825159	8		25			1001	1477		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.540	1000	2.296		1.825159	5		21			1001	1478		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	8.202	1000	1.046		1.825159	7		45			1001	1480		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	2.895	1000	1.524		1.825159	8		23			1001	1481		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	6.191	1000	1.607		1.825159	5		12			1001	1482		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	10.689	1000	2.120		1.825159	7		40			1001	1483		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	7.930	1000	0.827		1.825159	6		16			1001	1486		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	6.972	1000	0.702		1.825159	7		41			1001	1487		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	3.845	1000	0.715		1.825159	6		4			1001	1488		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	7.472	1000	1.294		1.825159	7		42			1001	1489		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.836	1000	1.977		1.825159	6		13			1001	1490		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.128	1000	2.135		1.825159	6		41			1001	1491		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	11.472	1000	1.526		1.825159	7		39			1001	1492		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.1642	4.102	1000	2.264		1.825159	6		16			1001	1493		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.2258	15.138	1000	9.461		3.000000	6		14			1001	1721		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.2799	12.140	1000	9.712		3.000000	7		6			1001	1713		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.2967	18.537	1000	11.586		3.000000	3		17			1001	1696		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	8.149	1000	1.248		1.839452	7		1			1001	1494		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	10.715	1000	1.301		1.839452	5		34			1001	1495		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	3.531	1000	1.139		1.839452	7		35			1001	1496		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	1.991	1000	0.937		1.839452	6		8			1001	1497		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	9.578	1000	2.148		1.839452	6		39			1001	1498		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	9.100	1000	2.139		1.839452	7		43			1001	1499		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	9.997	1000	1.891		1.839452	8		24			1001	1500		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	6.190	1000	2.182		1.839452	5		18			1001	1501		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	5.899	1000	0.963		1.839452	5		6			1001	1502		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	2.766	1000	0.863		1.839452	6		31			1001	1503		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	4.933	1000	1.611		1.839452	5		35			1001	1507		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	11.686	1000	2.181		1.839452	6		31			1001	1508		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	8.861	1000	0.786		1.839452	8		24			1001	1510		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	10.472	1000	1.459		1.839452	6		40			1001	1512		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	8.688	1000	1.327		1.839452	6		43			1001	1513		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	8.440	1000	1.820		1.839452	5		1			1001	1514		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	5.354	1000	1.206		1.839452	6		35			1001	1515		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	4.784	1000	0.820		1.839452	6		35			1001	1519		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	8.808	1000	2.051		1.839452	5		6			1001	1520		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	7.400	1000	1.310		1.839452	6		37			1001	1521		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	7.257	1000	2.298		1.839452	5		12			1001	1524		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.3142	2.730	1000	0.893		1.839452	7		7			1001	1525		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.4684	12.553	1000	10.042		3.000000	6		11			1001	1737		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.4743	18.779	1000	11.737		3.000000	5		13			1001	1679		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	6.033	1000	1.705		1.857561	7		29			1001	1526		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	3.689	1000	1.503		1.857561	6		32			1001	1527		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	11.224	1000	1.369		1.857561	5		36			1001	1529		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	9.898	1000	1.950		1.857561	8		21			1001	1530		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	10.930	1000	1.577		1.857561	6		3			1001	1531		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	2.312	1000	1.278		1.857561	5		38			1001	1533		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	10.415	1000	1.323		1.857561	6		38			1001	1534		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	7.262	1000	1.541		1.857561	7		20			1001	1538		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	8.537	1000	0.954		1.857561	7		44			1001	1541		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	7.117	1000	1.153		1.857561	5		7			1001	1542		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	3.927	1000	1.813		1.857561	6		44			1001	1543		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	4.867	1000	1.666		1.857561	8		19			1001	1544		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	6.389	1000	1.739		1.857561	7		40			1001	1545		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	11.265	1000	1.570		1.857561	7		46			1001	1546		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	3.867	1000	1.170		1.857561	8		11			1001	1548		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	7.798	1000	0.886		1.857561	6		39			1001	1549		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	7.191	1000	0.788		1.857561	7		39			1001	1551		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	11.496	1000	1.911		1.857561	7		38			1001	1552		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	3.446	1000	0.842		1.857561	6		2			1001	1553		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	11.314	1000	1.205		1.857561	6		20			1001	1554		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	6.278	1000	1.018		1.857561	5		40			1001	1555		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	11.119	1000	1.265		1.857561	5		8			1001	1556		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5044	10.093	1000	1.243		1.857561	5		28			1001	1557		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.5745	10.943	1000	8.754		3.222222	3		5			1001	1813		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6022	14.512	1000	11.609		3.000000	4		18			1001	1742		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.332	1000	1.132		1.873143	7		3			1001	1559		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	9.442	1000	0.949		1.873143	5		43			1001	1561		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	9.909	1000	1.850		1.873143	7		28			1001	1562		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.068	1000	1.818		1.873143	8		33			1001	1564		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.248	1000	1.052		1.873143	8		27			1001	1565		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	2.905	1000	1.193		1.873143	8		18			1001	1569		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.209	1000	1.556		1.873143	7		35			1001	1572		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	10.772	1000	1.062		1.873143	7		24			1001	1574		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	2.321	1000	1.782		1.873143	6		46			1001	1576		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	2.953	1000	1.353		1.873143	6		38			1001	1579		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.386	1000	1.486		1.873143	8		28			1001	1580		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	9.630	1000	1.337		1.873143	6		20			1001	1583		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	4.177	1000	1.767		1.873143	5		28			1001	1584		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.332	1000	1.766		1.873143	6		14			1001	1585		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	3.176	1000	0.740		1.873143	6		40			1001	1586		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.306	1000	1.738		1.873143	5		41			1001	1588		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.991	1000	1.117		1.873143	7		34			1001	1590		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	3.894	1000	0.825		1.873143	6		20			1001	1592		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.331	1000	1.898		1.873143	6		24			1001	1594		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	1.559	1000	0.874		1.873143	8		42			1001	1595		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	9.527	1000	2.289		1.873143	5		47			1001	1597		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	1.189	1000	0.705		1.873143	5		25			1001	1598		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.845	1000	1.081		1.873143	7		31			1001	1599		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	4.003	1000	1.724		1.873143	6		11			1001	1600		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.586	1000	2.314		1.873143	5		19			1001	1601		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.332	1000	1.564		1.873143	6		2			1001	1604		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	9.095	1000	2.256		1.873143	8		29			1001	1606		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	1.464	1000	0.748		1.873143	7		2			1001	1607		0				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.542	1000	1.954		1.873143	6		46			1001	1609		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.853	1000	2.020		1.873143	6		13			1001	1610		1				1			2			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	4.747	1000	2.109		1.873143	5		36			1001	1611		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	4.447	1000	2.207		1.873143	7		23			1001	1612		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	1.881	1000	1.128		1.873143	5		44			1001	1613		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.122	1000	2.125		1.873143	6		9			1001	1616		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	10.772	1000	2.145		1.873143	6		30			1001	1617		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	5.310	1000	1.093		1.873143	7		41			1001	1618		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	8.554	1000	1.988		1.873143	7		6			1001	1620		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	6.098	1000	2.242		1.873143	6		46			1001	1621		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6680	11.071	1000	1.240		1.873143	6		35			1001	1622		0				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6773	13.400	1000	10.720		3.000000	3		7			1001	1744		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.6987	14.661	1000	9.163		3.000000	2		18			1001	1746		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.7849	10.324	1000	8.259		3.888889	5		7			1001	1909		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.8068	17.818	1000	11.136		3.000000	5		8			1001	1754		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.8294	14.648	1000	9.155		3.000000	6		18			1001	1738		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.8481	11.778	1000	9.423		3.000000	3		13			1001	1736		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.8886	11.370	1000	9.096		3.000000	4		17			1001	1663		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.9263	19.111	1000	11.944		3.000000	5		12			1001	1661		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.9687	11.278	1000	9.022		3.000000	1		6			1001	1687		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	103.9968	13.224	1000	10.579		3.000000	6		18			1001	1763		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.1701	12.290	1000	9.832		3.000000	1		2			1001	1668		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.1762	13.699	1000	10.959		3.000000	1		14			1001	1685		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.1989	17.251	1000	10.782		3.000000	1		10			1001	1740		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2124	15.444	1000	9.652		3.000000	0		4			1001	1703		1				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	6.610	1000	1.729		1.926264	6		46			1001	1624		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	8.327	1000	2.234		1.926264	7		16			1001	1625		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	2.725	1000	1.551		1.926264	5		25			1001	1629		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	10.774	1000	1.838		1.926264	6		31			1001	1631		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	10.774	1000	1.583		1.926264	5		12			1001	1633		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	7.560	1000	1.139		1.926264	7		28			1001	1635		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	1.557	1000	0.783		1.926264	6		19			1001	1636		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	5.878	1000	1.058		1.926264	6		29			1001	1637		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	5.974	1000	2.263		1.926264	6		4			1001	1638		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	3.748	1000	1.653		1.926264	7		41			1001	1640		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	3.512	1000	1.905		1.926264	6		18			1001	1641		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	10.322	1000	1.931		1.926264	5		1			1001	1642		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	2.917	1000	1.284		1.926264	6		1			1001	1643		1				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	10.774	1000	2.220		1.926264	6		20			1001	1644		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	9.972	1000	1.955		1.926264	7		22			1001	1645		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	6.635	1000	1.701		1.926264	5		14			1001	1648		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	7.127	1000	0.718		1.926264	5		11			1001	1649		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	7.206	1000	1.261		1.926264	6		47			1001	1652		0				1			5			20			0.0000		105.000		10.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.2258	5.061	1000	2.024		1.926264	7		38			1001	1653		1				1			5			20			0.0000		105.000		10.000		1

; =============================================================================
; SEZIONE: "II. Nascita Rapida di Cluster"
; Inizio: 105.000s, Durata: 42.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.3245	12.313	1000	9.851		3.000000	7		16			1001	1671		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.3993	11.494	1000	9.195		3.000000	3		2			1001	1691		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.4260	15.659	1000	9.787		3.222222	5		8			1001	1880		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.4972	17.500	1000	10.937		3.000000	6		5			1001	1667		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.5061	14.996	1000	11.997		3.000000	6		17			1001	1730		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.5776	12.047	1000	9.637		3.000000	5		6			1001	1734		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.6172	16.756	1000	10.473		3.000000	2		18			1001	1756		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.6326	14.232	1000	11.386		3.000000	7		12			1001	1750		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.6383	17.901	1000	11.188		3.000000	7		2			1001	1705		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.6401	10.949	1000	8.759		3.222222	5		1			1001	1800		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.6435	16.263	1000	10.164		3.000000	3		9			1001	1698		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.7106	13.366	1000	10.693		3.000000	7		18			1001	1662		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.7136	14.356	1000	8.972		3.222222	8		10			1001	1773		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.7461	16.918	1000	10.574		3.222222	5		17			1001	1852		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.8357	13.851	1000	11.080		3.000000	5		9			1001	1749		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.8545	14.791	1000	9.244		3.000000	5		19			1001	1743		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.8659	18.663	1000	11.664		3.000000	0		12			1001	1720		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.9006	17.700	1000	11.063		3.000000	2		1			1001	1729		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.9406	13.831	1000	11.065		3.000000	7		4			1001	1689		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.9535	12.437	1000	9.949		3.000000	4		8			1001	1700		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.9718	14.803	1000	9.252		3.222222	4		4			1001	1859		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	104.9727	16.178	1000	10.111		3.000000	2		12			1001	1683		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.1102	16.290	1000	10.181		3.222222	8		1			1001	1882		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.1594	14.787	1000	9.242		3.000000	1		12			1001	1675		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.1833	15.281	1000	9.551		3.222222	4		14			1001	1844		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.1873	17.413	1000	10.883		3.000000	5		16			1001	1660		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.1956	17.892	1000	11.183		3.000000	0		15			1001	1688		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2184	15.735	1000	9.834		3.222222	2		12			1001	1845		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2207	16.034	1000	10.021		3.000000	3		9			1001	1759		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2347	14.842	1000	11.873		3.000000	3		5			1001	1712		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2767	16.998	1000	10.624		3.000000	1		10			1001	1714		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2812	14.015	1000	11.212		3.000000	2		8			1001	1718		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.2941	12.720	1000	10.176		3.000000	6		2			1001	1702		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.3202	13.167	1000	10.533		3.000000	4		14			1001	1697		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.4290	17.306	1000	10.816		3.000000	1		13			1001	1678		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.4360	15.999	1000	9.999		3.000000	7		19			1001	1764		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.4526	14.073	1000	11.259		3.222222	4		4			1001	1866		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.4655	17.036	1000	10.647		3.222222	8		15			1001	1887		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.5084	12.554	1000	10.044		3.000000	7		9			1001	1694		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.5187	13.177	1000	10.541		3.000000	4		3			1001	1719		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.5297	13.751	1000	11.001		3.000000	3		19			1001	1681		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.6860	16.376	1000	10.235		3.000000	2		3			1001	1695		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.7376	16.317	1000	10.198		3.000000	4		19			1001	1656		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.7702	11.498	1000	9.199		3.000000	4		19			1001	1762		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.7820	14.578	1000	9.111		3.000000	7		12			1001	1751		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.8665	14.700	1000	9.187		3.000000	7		17			1001	1659		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.8978	11.796	1000	9.437		3.000000	6		10			1001	1761		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.8992	12.204	1000	9.764		3.000000	4		14			1001	1724		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.9093	17.826	1000	11.141		3.222222	6		4			1001	1791		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.9196	12.497	1000	9.998		3.000000	0		18			1001	1672		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.9205	14.361	1000	11.489		3.000000	5		8			1001	1693		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	105.9448	11.319	1000	9.055		3.000000	3		16			1001	1725		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.0429	14.720	1000	9.200		3.000000	7		15			1001	1717		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.1021	14.241	1000	11.393		3.000000	4		2			1001	1677		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.2153	14.228	1000	11.383		3.000000	4		15			1001	1722		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.3586	14.523	1000	9.077		3.222222	5		7			1001	1786		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.3699	15.052	1000	9.407		3.222222	1		11			1001	1780		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.3767	15.933	1000	9.958		3.222222	6		10			1001	1878		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.4313	15.514	1000	9.697		3.000000	4		4			1001	1727		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.4908	13.522	1000	10.817		3.000000	5		9			1001	1674		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.4914	16.800	1000	10.500		3.000000	1		6			1001	1699		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.5071	14.369	1000	11.495		3.000000	4		15			1001	1723		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.6751	16.250	1000	10.156		3.222222	8		9			1001	1818		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.8280	11.286	1000	9.029		3.000000	6		1			1001	1708		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.8822	11.850	1000	9.480		3.222222	6		10			1001	1827		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.8926	18.200	1000	11.375		3.000000	1		2			1001	1710		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.9210	14.084	1000	11.267		3.000000	6		9			1001	1706		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	106.9359	13.206	1000	10.565		3.222222	4		14			1001	1794		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.0634	16.865	1000	10.540		3.222222	1		15			1001	1874		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.0837	16.240	1000	10.150		3.222222	7		11			1001	1853		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.1556	11.167	1000	8.933		3.222222	3		19			1001	1823		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.1589	13.871	1000	11.097		3.222222	5		4			1001	1889		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.2881	17.441	1000	10.901		3.222222	3		18			1001	1796		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.3268	14.394	1000	11.516		3.222222	4		16			1001	1776		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.3591	17.588	1000	10.993		3.222222	4		11			1001	1870		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.3603	17.908	1000	11.192		3.000000	1		19			1001	1692		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.3855	15.796	1000	9.873		3.222222	0		6			1001	1834		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.4087	15.024	1000	9.390		3.222222	4		7			1001	1784		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.4639	18.978	1000	11.861		3.000000	5		15			1001	1760		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.5403	11.526	1000	9.221		3.222222	3		7			1001	1807		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.5641	18.548	1000	11.592		3.222222	1		17			1001	1884		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.5927	17.069	1000	10.668		3.222222	5		18			1001	1851		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.6184	12.353	1000	9.883		3.222222	8		2			1001	1868		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.6807	11.865	1000	9.492		3.222222	8		5			1001	1809		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.7031	12.796	1000	10.237		3.222222	7		15			1001	1774		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.7040	16.742	1000	10.464		3.222222	2		18			1001	1783		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.7346	14.966	1000	9.354		3.222222	4		18			1001	1769		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.7444	14.316	1000	11.453		3.222222	2		18			1001	1858		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.8443	11.560	1000	9.248		3.222222	7		12			1001	1822		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.8605	13.895	1000	8.685		3.222222	3		18			1001	1846		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.8997	12.010	1000	9.608		3.222222	8		3			1001	1863		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.9039	15.658	1000	9.786		3.222222	7		4			1001	1797		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.9341	13.972	1000	8.733		3.222222	4		15			1001	1770		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.9702	11.045	1000	8.836		3.222222	7		13			1001	1821		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	107.9889	14.269	1000	8.918		3.222222	3		1			1001	1820		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.0431	11.181	1000	8.945		3.222222	6		9			1001	1768		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.0494	14.509	1000	9.068		3.000000	5		6			1001	1673		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.1059	18.087	1000	11.305		3.222222	2		12			1001	1817		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.2688	17.516	1000	10.947		3.222222	1		11			1001	1881		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.3060	13.191	1000	10.553		3.222222	4		5			1001	1842		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.3303	16.913	1000	10.570		3.222222	6		7			1001	1771		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.3643	12.284	1000	9.827		3.000000	2		4			1001	1684		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.4149	16.561	1000	10.351		3.222222	5		6			1001	1855		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.4350	13.102	1000	10.482		3.222222	3		12			1001	1864		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.4356	16.622	1000	10.389		3.222222	4		3			1001	1828		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.4365	14.157	1000	11.326		3.222222	4		3			1001	1840		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.4439	10.861	1000	8.688		3.222222	7		14			1001	1831		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.5183	18.153	1000	11.346		3.222222	3		8			1001	1772		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.5360	17.267	1000	10.792		3.222222	6		4			1001	1876		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.6290	13.354	1000	10.683		3.222222	3		16			1001	1829		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.6359	16.287	1000	10.180		3.222222	7		12			1001	1850		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.6388	18.231	1000	11.394		3.222222	3		10			1001	1875		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.6592	11.744	1000	9.396		3.222222	4		3			1001	1793		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.6700	16.218	1000	10.136		3.222222	5		8			1001	1801		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.7378	13.542	1000	10.834		3.222222	1		5			1001	1765		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.7988	14.466	1000	9.041		3.222222	4		17			1001	1766		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.8159	12.934	1000	10.347		3.222222	0		16			1001	1836		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.8696	16.573	1000	10.358		3.222222	1		14			1001	1886		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	108.9125	14.720	1000	9.200		3.222222	2		5			1001	1854		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.0133	18.306	1000	11.441		3.222222	8		10			1001	1865		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.0384	17.975	1000	11.234		3.222222	5		4			1001	1804		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.0495	13.085	1000	10.468		3.222222	4		17			1001	1795		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.0999	12.758	1000	10.207		3.222222	6		18			1001	1885		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.2935	13.749	1000	10.999		3.222222	5		17			1001	1838		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.3629	15.921	1000	9.951		3.222222	5		9			1001	1792		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.4863	17.075	1000	10.672		3.222222	1		7			1001	1767		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.9291	12.022	1000	9.618		3.222222	1		8			1001	1871		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	109.9382	17.180	1000	10.738		3.222222	5		19			1001	1843		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	110.2390	15.017	1000	9.385		3.222222	3		19			1001	1856		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	110.5541	11.596	1000	9.277		3.222222	4		13			1001	1860		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	110.5821	13.107	1000	10.486		3.222222	6		6			1001	1790		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	111.0717	13.484	1000	8.427		3.888889	7		2			1001	1969		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	111.1170	11.766	1000	9.413		3.222222	6		14			1001	1824		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	111.1199	12.576	1000	10.061		3.222222	1		14			1001	1811		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	111.5767	12.067	1000	7.542		3.888889	3		10			1001	1896		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	111.7844	16.022	1000	10.013		3.888889	4		7			1001	1922		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	112.2485	11.662	1000	9.330		3.888889	7		12			1001	1910		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	112.6051	13.045	1000	10.436		3.888889	6		3			1001	1947		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	112.6352	11.916	1000	9.533		3.888889	8		2			1001	1957		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	112.8555	17.798	1000	11.123		3.222222	5		7			1001	1867		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	113.1164	16.928	1000	10.580		3.888889	5		19			1001	1946		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	113.3360	15.696	1000	9.810		3.888889	5		1			1001	1940		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	113.4182	11.566	1000	9.252		3.888889	3		14			1001	1905		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	114.4233	9.132	1000	7.306		3.888889	5		7			1001	1960		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	114.5536	9.707	1000	7.765		3.888889	2		15			1001	1921		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	114.7887	11.785	1000	9.428		3.888889	6		17			1001	1930		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	114.7944	11.352	1000	7.095		3.888889	7		8			1001	1941		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.1792	15.873	1000	9.920		3.888889	6		17			1001	1934		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.3880	15.014	1000	9.384		3.888889	4		10			1001	1900		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.4203	11.458	1000	9.166		3.888889	6		16			1001	1918		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.7069	15.547	1000	9.717		3.888889	7		3			1001	1939		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.8252	11.133	1000	8.907		3.888889	8		14			1001	1897		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	115.9126	11.569	1000	7.231		3.888889	6		19			1001	1956		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.5855	12.618	1000	10.095		3.888889	2		10			1001	1963		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.6001	16.523	1000	10.327		3.888889	7		4			1001	1917		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.6897	13.169	1000	8.231		3.888889	5		5			1001	1898		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.6962	13.381	1000	8.363		3.888889	4		10			1001	1931		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.7331	11.942	1000	9.554		3.888889	2		7			1001	1927		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.7373	14.386	1000	8.991		3.888889	4		10			1001	1948		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.7992	15.538	1000	9.712		3.888889	5		19			1001	1926		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.8247	8.773	1000	7.018		3.888889	7		5			1001	1894		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.8366	9.889	1000	7.911		3.888889	7		11			1001	1943		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.8409	12.070	1000	9.656		3.888889	2		2			1001	1914		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.8558	11.772	1000	9.418		3.888889	6		4			1001	1933		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.9053	11.247	1000	8.998		3.888889	2		11			1001	1899		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.9211	14.777	1000	9.236		3.888889	4		17			1001	1929		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.9505	15.144	1000	9.465		3.888889	5		2			1001	1908		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	116.9921	16.385	1000	10.241		3.888889	7		4			1001	1915		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.0095	10.063	1000	8.051		3.888889	7		14			1001	1911		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.0160	8.985	1000	7.188		3.888889	7		15			1001	1942		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.1278	12.411	1000	9.929		3.888889	5		6			1001	1968		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.1950	9.827	1000	7.862		3.888889	5		6			1001	1937		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.1978	12.181	1000	7.613		3.888889	2		8			1001	1901		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.4007	16.573	1000	10.358		3.888889	7		10			1001	1892		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.5032	14.273	1000	8.921		3.888889	6		15			1001	1954		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.5408	11.702	1000	7.314		3.888889	3		6			1001	1958		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.5626	13.075	1000	10.460		3.888889	4		3			1001	1906		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.7546	12.551	1000	10.040		3.888889	8		4			1001	1952		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.7755	12.571	1000	7.857		3.888889	8		7			1001	1923		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.7962	9.215	1000	7.372		3.888889	3		12			1001	1904		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.8161	15.126	1000	9.454		3.888889	5		12			1001	1893		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	117.9664	10.443	1000	8.354		3.888889	8		5			1001	1966		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	118.0230	12.922	1000	8.076		3.888889	2		12			1001	1945		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	118.2955	16.201	1000	10.126		3.888889	6		19			1001	1951		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	118.3361	9.244	1000	7.395		3.888889	8		4			1001	1962		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	118.9008	12.111	1000	9.689		3.888889	3		15			1001	1902		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	119.3186	8.855	1000	7.084		3.888889	3		9			1001	1949		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	119.4112	8.985	1000	7.188		3.888889	3		18			1001	1920		0				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	120.8490	11.857	1000	9.486		3.888889	5		17			1001	1916		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	121.1788	16.259	1000	10.162		3.888889	5		15			1001	1890		1				1			5			24			105.0000		42.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	122.5658	11.389	1000	7.118		3.888889	2		15			1001	1936		0				1			5			24			105.0000		42.000		0.000		1

; =============================================================================
; SEZIONE: "III. Spippoling"
; Inizio: 147.000s, Durata: 105.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	147.2694	1.653	1002	0.551		0.010592	7		23			1003	1970		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	147.3928	1.814	1004	0.453		0.010592	8		34			1005	1971		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.0284	1.376	1004	0.344		0.042680	8		35			1005	1976		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.1088	0.433	1002	0.216		0.042680	8		37			1003	1975		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.1136	1.313	1008	0.438		0.042680	7		7			1009	1974		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.1244	1.756	1002	0.585		0.042680	7		31			1003	1973		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.1307	0.872	1006	0.436		0.042680	7		23			1007	1972		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.1704	1.851	1010	0.463		0.042680	8		20			1011	1977		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.8939	0.636	1002	0.318		0.074345	7		30			1003	1984		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.9262	0.950	1008	0.475		0.074345	7		15			1009	1979		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.9268	1.027	1004	0.513		0.074345	8		26			1005	1982		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.9753	0.943	1004	0.314		0.074345	8		40			1005	1978		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.9791	0.496	1004	0.248		0.074345	7		24			1005	1981		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	148.9984	1.190	1004	0.298		0.074345	8		25			1005	1980		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	149.0287	1.754	1004	0.439		0.074345	8		5			1005	1983		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	149.7852	1.161	1002	0.387		0.111355	7		37			1003	1988		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	149.8789	1.073	1002	0.358		0.111355	8		14			1003	1987		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	149.9006	1.013	1008	0.506		0.111355	8		31			1009	1986		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	149.9216	1.098	1006	0.366		0.111355	7		36			1007	1985		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.3630	1.084	1002	0.361		0.130407	7		33			1003	1990		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.3794	0.646	1010	0.215		0.130407	7		39			1011	1991		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.4751	0.612	1002	0.306		0.130407	8		23			1003	1989		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.5043	1.146	1002	0.382		0.137904	8		32			1003	1994		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.5884	0.527	1002	0.264		0.137904	8		7			1003	1993		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	150.6034	1.400	1010	0.467		0.137904	7		23			1011	1992		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	151.8799	0.531	1010	0.265		0.189457	7		11			1011	2000		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	151.8842	1.056	1004	0.528		0.189457	7		21			1005	1997		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	151.8973	0.427	1004	0.213		0.189457	7		13			1005	1995		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	151.9034	1.129	1002	0.565		0.189457	8		21			1003	1998		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	151.9223	0.927	1010	0.309		0.189457	8		35			1011	1999		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.0421	0.685	1004	0.342		0.189457	7		37			1005	1996		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.6967	0.653	1012	0.218		0.222355	8		16			1013	2008		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7306	1.340	1006	0.447		0.222355	7		24			1007	2004		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7435	1.674	1006	0.419		0.222355	7		17			1007	2001		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7461	1.679	1002	0.420		0.222355	8		21			1003	2006		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7600	0.928	1012	0.464		0.222355	7		19			1013	2005		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7770	0.706	1006	0.235		0.222355	8		27			1007	2003		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.7909	1.669	1008	0.556		0.222355	7		25			1009	2002		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	152.8084	0.556	1004	0.185		0.222355	8		25			1005	2007		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.4453	0.353	1008	0.177		0.251469	8		34			1009	2014		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.4757	1.231	1006	0.308		0.251469	8		38			1007	2012		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5020	1.719	1004	0.573		0.251469	8		32			1005	2010		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5035	0.825	1006	0.206		0.251469	7		36			1007	2011		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5281	1.072	1002	0.357		0.251469	8		19			1003	2015		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5491	1.064	1008	0.532		0.251469	8		2			1009	2016		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5530	1.713	1004	0.571		0.251469	7		63			1005	2017		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5560	0.634	1002	0.158		0.251469	7		29			1003	2009		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	153.5949	0.770	1004	0.192		0.251469	8		40			1005	2013		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.6561	1.727	1002	0.432		0.339801	8		14			1003	2020		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.7085	0.667	1004	0.333		0.339801	8		19			1005	2025		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.7128	1.753	1002	0.584		0.339801	8		-3			1003	2018		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.7500	0.917	1002	0.459		0.339801	7		21			1003	2023		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.7963	0.528	1002	0.176		0.340646	8		19			1003	2027		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8137	0.988	1002	0.329		0.339801	8		24			1003	2024		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8206	0.707	1004	0.177		0.339801	7		31			1005	2019		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8429	1.310	1004	0.437		0.339801	8		33			1005	2026		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8451	1.295	1004	0.324		0.340646	8		34			1005	2029		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8615	1.009	1002	0.504		0.339801	8		36			1003	2022		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8721	1.139	1008	0.570		0.340646	8		19			1009	2032		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8735	0.707	1004	0.236		0.340646	8		31			1005	2028		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.8844	0.346	1006	0.173		0.340646	8		39			1007	2033		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.9176	1.330	1012	0.443		0.340646	7		9			1013	2031		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.9317	1.925	1008	0.481		0.340646	7		29			1009	2030		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	155.9763	1.199	1002	0.599		0.339801	8		29			1003	2021		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.7853	1.045	1012	0.522		0.383619	8		23			1013	2044		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.8080	2.120	1002	0.530		0.379948	7		15			1003	2041		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.8101	1.564	1004	0.521		0.379948	8		24			1005	2042		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.8117	1.229	1004	0.307		0.383619	8		35			1005	2048		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.8406	1.287	1012	0.322		0.379948	8		20			1013	2040		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.8453	1.239	1004	0.413		0.379948	7		17			1005	2039		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9154	0.744	1012	0.372		0.379948	7		22			1013	2037		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9366	0.999	1006	0.500		0.379948	7		20			1007	2038		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9512	1.296	1002	0.324		0.383619	8		22			1003	2046		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9556	1.309	1004	0.436		0.379948	7		20			1005	2036		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9704	0.766	1002	0.383		0.379948	8		30			1003	2034		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9711	1.740	1010	0.580		0.379948	7		15			1011	2035		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	156.9953	0.873	1004	0.291		0.383619	8		30			1005	2045		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.0016	0.650	1004	0.325		0.383619	7		32			1005	2043		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.1333	2.232	1010	0.558		0.383619	8		29			1011	2047		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.8855	1.965	1008	0.491		0.424003	7		41			1009	2053		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.9161	1.207	1002	0.402		0.424003	7		23			1003	2051		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.9553	0.460	1010	0.153		0.424003	8		30			1011	2054		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	157.9608	1.119	1008	0.559		0.424003	7		22			1009	2055		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	158.0023	1.583	1004	0.528		0.424003	7		26			1005	2049		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	158.0721	0.962	1010	0.481		0.424003	8		36			1011	2050		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	158.1094	1.658	1004	0.415		0.424003	8		33			1005	2052		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	160.3099	1.138	1002	0.569		0.519739	8		19			1003	2060		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	160.4104	0.929	1012	0.310		0.519739	7		7			1013	2057		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	160.4185	1.561	1004	0.520		0.519739	7		35			1005	2056		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	160.4367	1.443	1008	0.481		0.519739	8		23			1009	2058		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	160.5316	0.857	1008	0.286		0.519739	8		27			1009	2059		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.6220	0.682	1010	0.170		0.569050	7		26			1011	2071		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.6630	0.627	1002	0.157		0.569050	8		22			1003	2064		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.6791	1.100	1002	0.550		0.569050	7		29			1003	2069		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.7615	0.752	1002	0.188		0.569050	7		33			1003	2062		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.7898	1.096	1008	0.548		0.569050	7		8			1009	2063		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.7951	0.806	1002	0.403		0.569050	8		18			1003	2067		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.8199	1.525	1008	0.508		0.569050	7		16			1009	2068		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.8473	0.918	1012	0.230		0.569050	8		43			1013	2065		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.8535	2.193	1004	0.548		0.569050	7		29			1005	2070		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.8540	1.017	1004	0.339		0.569050	8		26			1005	2061		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	161.8966	1.355	1004	0.339		0.569050	7		25			1005	2066		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	162.8757	1.404	1008	0.468		0.613382	8		27			1009	2072		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	162.9194	1.235	1004	0.309		0.613382	7		24			1005	2074		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	162.9584	0.549	1004	0.275		0.613382	8		19			1005	2073		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.0541	2.358	1004	0.589		0.613382	8		32			1005	2075		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.6194	1.136	1008	0.568		0.643374	7		26			1009	2082		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.6466	1.255	1002	0.314		0.643374	8		37			1003	2080		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.6686	0.834	1010	0.278		0.643374	7		4			1011	2084		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.6987	0.944	1004	0.315		0.643374	7		15			1005	2077		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7175	1.678	1004	0.559		0.643374	7		15			1005	2078		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7233	0.656	1008	0.164		0.643374	8		25			1009	2081		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7267	1.422	1004	0.356		0.643374	7		10			1005	2083		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7321	0.541	1002	0.270		0.643374	7		26			1003	2076		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7815	1.295	1004	0.432		0.652522	7		20			1005	2095		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7878	0.687	1006	0.229		0.643374	8		19			1007	2086		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.7986	0.865	1004	0.216		0.643374	8		22			1005	2079		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.8414	1.138	1006	0.379		0.652522	8		32			1007	2096		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.8546	1.706	1012	0.569		0.643374	8		28			1013	2085		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.8560	1.983	1012	0.496		0.652522	7		10			1013	2087		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.8863	0.461	1008	0.154		0.652522	8		6			1009	2093		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.8964	1.392	1004	0.464		0.652522	7		42			1005	2090		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.9338	0.772	1006	0.257		0.652522	8		26			1007	2098		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.9408	0.703	1008	0.351		0.656066	8		26			1009	2101		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.9520	0.781	1012	0.391		0.652522	7		39			1013	2089		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.9984	1.505	1004	0.502		0.656066	8		24			1005	2107		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	163.9995	1.024	1002	0.512		0.656066	7		39			1003	2100		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0049	0.359	1006	0.179		0.652522	8		18			1007	2091		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0083	1.048	1006	0.524		0.656066	8		31			1007	2099		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0093	1.072	1006	0.536		0.652522	8		16			1007	2092		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0197	1.317	1012	0.439		0.652522	8		19			1013	2097		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0261	0.799	1002	0.266		0.652522	8		27			1003	2094		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0313	1.599	1002	0.533		0.656066	7		11			1003	2105		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0392	0.637	1006	0.319		0.652522	8		27			1007	2088		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0442	1.543	1004	0.386		0.656066	8		20			1005	2104		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0580	0.565	1002	0.283		0.656066	8		24			1003	2102		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0799	0.738	1008	0.246		0.656066	7		19			1009	2106		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.0802	1.026	1004	0.342		0.656066	7		21			1005	2103		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.6209	1.172	1006	0.586		0.684703	8		31			1007	2121		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.6530	0.599	1004	0.300		0.684703	8		22			1005	2112		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.6920	1.358	1004	0.453		0.684703	8		12			1005	2110		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7081	0.940	1004	0.470		0.684703	8		26			1005	2118		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7393	1.179	1006	0.393		0.684703	8		16			1007	2117		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7441	1.272	1004	0.424		0.684703	8		9			1005	2120		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7533	0.474	1002	0.158		0.684703	8		35			1003	2119		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7695	1.776	1012	0.592		0.684703	8		13			1013	2108		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7729	2.165	1010	0.541		0.684703	8		13			1011	2113		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7784	0.970	1004	0.485		0.684703	8		24			1005	2111		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.7965	1.000	1004	0.333		0.684703	8		16			1005	2109		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.8166	0.845	1002	0.423		0.684703	8		24			1003	2115		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.8491	0.580	1006	0.290		0.684703	7		32			1007	2114		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	164.8863	1.836	1004	0.459		0.684703	7		13			1005	2116		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	165.8376	0.932	1006	0.466		0.730959	8		30			1007	2125		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	165.8972	1.590	1002	0.397		0.730959	8		26			1003	2123		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	165.9465	1.786	1008	0.595		0.730959	8		43			1009	2122		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	166.0273	0.823	1008	0.206		0.730959	8		26			1009	2127		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	166.0275	1.255	1012	0.314		0.730959	8		21			1013	2126		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	166.0995	0.980	1008	0.327		0.730959	7		24			1009	2124		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.3516	2.391	1004	0.598		0.865767	7		35			1005	2128		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.3707	0.653	1004	0.327		0.865767	8		38			1005	2135		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.4084	1.955	1002	0.489		0.865767	8		9			1003	2129		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.5085	1.100	1004	0.550		0.865767	7		13			1005	2130		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.5603	1.004	1004	0.251		0.865767	8		37			1005	2131		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.5984	0.664	1008	0.221		0.865767	8		31			1009	2134		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.6019	1.416	1002	0.472		0.865767	7		7			1003	2133		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	169.6076	0.441	1010	0.220		0.865767	7		28			1011	2132		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.5317	1.208	1008	0.302		0.913714	8		30			1009	2151		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6062	1.347	1004	0.449		0.913714	8		33			1005	2140		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6142	2.082	1010	0.520		0.913714	8		14			1011	2144		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6146	1.280	1002	0.320		0.913714	7		18			1003	2139		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6163	1.554	1006	0.388		0.913714	7		24			1007	2142		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6291	0.905	1010	0.302		0.913714	7		12			1011	2153		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6322	0.583	1002	0.291		0.913714	8		26			1003	2152		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6584	0.989	1006	0.247		0.913714	8		25			1007	2136		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6873	1.469	1002	0.490		0.913714	8		20			1003	2137		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.6885	1.316	1012	0.329		0.913714	8		14			1013	2148		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.7246	1.508	1002	0.503		0.913714	8		22			1003	2145		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.7362	1.691	1006	0.564		0.913714	8		15			1007	2149		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.7373	1.516	1012	0.505		0.913714	8		23			1013	2143		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.7454	0.434	1002	0.217		0.913714	7		27			1003	2141		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.7705	2.352	1012	0.588		0.913714	8		30			1013	2146		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.8055	0.913	1004	0.228		0.913714	8		9			1005	2150		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.8070	1.901	1012	0.475		0.913714	8		19			1013	2147		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	170.8218	0.711	1002	0.356		0.913714	8		15			1003	2138		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	171.4967	1.557	1006	0.519		0.952862	8		21			1007	2156		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	171.5281	1.522	1002	0.381		0.952862	8		37			1003	2158		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	171.6976	0.995	1004	0.498		0.952862	8		31			1005	2157		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	171.7060	0.787	1008	0.262		0.952862	8		20			1009	2154		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	171.7511	1.027	1004	0.342		0.952862	8		23			1005	2155		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.6437	0.528	1002	0.264		0.995981	7		32			1003	2163		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.7776	1.694	1004	0.565		0.995981	8		30			1005	2159		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.7974	0.344	1008	0.172		0.995981	8		31			1009	2164		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.8120	2.004	1002	0.501		0.995981	8		27			1003	2161		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.8653	0.723	1010	0.181		0.995981	8		36			1011	2165		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.8662	1.397	1004	0.466		1.003027	8		24			1005	2169		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.8977	0.783	1004	0.261		0.995981	7		20			1005	2162		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9089	0.986	1012	0.493		1.003027	8		26			1013	2174		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9129	1.486	1004	0.495		0.995981	8		21			1005	2160		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9237	0.816	1004	0.204		1.003027	8		36			1005	2176		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9483	1.080	1006	0.540		1.003027	8		27			1007	2171		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9563	0.873	1008	0.291		1.003027	8		22			1009	2168		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9657	0.980	1008	0.490		1.003027	8		30			1009	2172		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	172.9916	0.492	1004	0.164		1.003027	8		22			1005	2167		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.0248	1.410	1004	0.353		1.003027	8		27			1005	2177		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.0739	1.117	1004	0.372		1.003027	8		29			1005	2166		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.1059	0.874	1004	0.291		1.003027	8		18			1005	2175		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.1242	0.979	1012	0.245		1.003027	8		17			1013	2170		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.1540	1.173	1008	0.391		1.003027	8		11			1009	2173		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.6567	0.755	1010	0.252		1.031739	8		28			1011	2185		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7124	0.900	1004	0.450		1.031739	8		22			1005	2182		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7226	1.079	1004	0.360		1.031739	8		30			1005	2188		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7623	0.784	1006	0.261		1.031739	8		16			1007	2180		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7788	0.884	1012	0.295		1.031739	8		35			1013	2187		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7867	1.170	1010	0.390		1.031739	8		25			1011	2179		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.7955	0.710	1002	0.355		1.031739	8		5			1003	2178		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.8044	2.213	1002	0.553		1.031739	7		29			1003	2183		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.8512	0.537	1002	0.268		1.031739	8		17			1003	2184		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.9191	1.215	1006	0.405		1.031739	8		39			1007	2189		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.9354	0.884	1002	0.295		1.031739	7		22			1003	2186		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	173.9735	0.792	1002	0.198		1.031739	8		22			1003	2181		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.0806	0.765	1006	0.191		1.031739	8		12			1007	2190		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.2400	1.204	1012	0.301		1.055338	8		30			1013	2197		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.2875	1.643	1012	0.548		1.055338	8		21			1013	2201		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.2879	1.280	1004	0.427		1.055338	7		26			1005	2194		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.3269	1.992	1004	0.498		1.055338	8		6			1005	2198		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.3286	0.984	1002	0.328		1.055338	8		32			1003	2196		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.3400	1.069	1004	0.535		1.055338	8		15			1005	2195		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.4081	1.500	1012	0.500		1.055338	7		26			1013	2191		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.4243	1.011	1010	0.337		1.055338	7		21			1011	2192		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.5200	0.713	1004	0.178		1.055338	8		29			1005	2199		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.5229	1.029	1006	0.343		1.055338	8		27			1007	2193		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	174.5353	1.268	1002	0.423		1.055338	7		22			1003	2200		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.0617	0.673	1010	0.336		1.084293	7		33			1011	2207		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.0639	1.307	1006	0.436		1.084293	8		30			1007	2206		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.1274	1.169	1006	0.390		1.084293	8		28			1007	2202		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.1511	1.662	1010	0.554		1.084293	8		29			1011	2203		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.1696	1.252	1002	0.417		1.084293	8		17			1003	2205		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.3223	1.316	1002	0.439		1.084293	8		22			1003	2204		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.7063	0.574	1012	0.287		1.111953	8		23			1013	2210		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.7387	1.657	1002	0.552		1.111953	8		24			1003	2211		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.7420	1.712	1002	0.428		1.111953	8		29			1003	2212		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.8749	2.346	1004	0.587		1.111953	8		25			1005	2208		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.9373	0.689	1002	0.345		1.111953	8		28			1003	2214		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.9786	1.062	1008	0.265		1.111953	8		23			1009	2213		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	175.9847	1.133	1002	0.566		1.111953	8		25			1003	2209		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.4371	2.151	1006	0.538		1.132602	8		35			1007	2217		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.5075	0.540	1004	0.270		1.132602	8		22			1005	2218		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.5168	1.212	1002	0.404		1.132602	8		14			1003	2216		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.5675	2.145	1012	0.536		1.132602	8		29			1013	2215		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.7902	2.257	1004	0.564		1.152739	8		27			1005	2219		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.7978	1.183	1012	0.394		1.152739	8		20			1013	2221		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	176.9912	1.676	1002	0.559		1.152739	8		20			1003	2220		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.0316	0.653	1008	0.218		1.152739	8		25			1009	2222		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.6889	1.615	1010	0.538		1.189340	8		18			1011	2233		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.7660	1.297	1004	0.432		1.196261	7		23			1005	2240		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.7971	1.707	1002	0.427		1.189340	8		40			1003	2231		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8497	0.531	1012	0.266		1.189340	7		27			1013	2230		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8537	1.888	1002	0.472		1.189340	7		28			1003	2229		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8642	0.915	1002	0.305		1.189340	8		20			1003	2227		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8682	2.275	1004	0.569		1.189340	8		23			1005	2224		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8838	0.642	1010	0.321		1.196261	8		12			1011	2236		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8852	0.693	1010	0.231		1.189340	8		13			1011	2232		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.8858	0.464	1002	0.232		1.189340	8		13			1003	2226		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	177.9016	0.666	1012	0.333		1.189340	7		22			1013	2228		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.0103	2.380	1012	0.595		1.196261	7		20			1013	2238		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.0118	1.688	1004	0.563		1.196261	7		34			1005	2235		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.0810	2.056	1012	0.514		1.189340	7		26			1013	2225		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.0883	0.479	1002	0.240		1.189340	8		17			1003	2223		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.1191	0.973	1010	0.324		1.196261	8		24			1011	2237		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.1362	1.130	1006	0.565		1.196261	8		23			1007	2239		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.1693	1.782	1004	0.445		1.196261	8		28			1005	2234		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	178.2053	1.344	1006	0.448		1.196261	8		23			1007	2241		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.7825	1.172	1004	0.586		1.269973	8		27			1005	2254		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.8483	1.199	1004	0.400		1.269973	8		4			1005	2249		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.8740	0.304	1010	0.152		1.269973	7		38			1011	2257		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.8892	0.920	1002	0.460		1.269973	7		32			1003	2253		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9041	1.279	1010	0.426		1.269973	8		22			1011	2242		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9106	0.863	1012	0.432		1.269973	8		30			1013	2256		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9185	1.724	1004	0.431		1.269973	8		13			1005	2251		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9190	1.187	1006	0.396		1.269973	8		10			1007	2248		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9246	0.861	1002	0.287		1.269973	8		16			1003	2244		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9403	0.977	1002	0.244		1.269973	8		17			1003	2252		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9410	0.686	1012	0.343		1.269973	7		18			1013	2246		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9473	0.500	1008	0.167		1.269973	8		28			1009	2247		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	179.9484	2.284	1008	0.571		1.269973	8		35			1009	2245		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	180.0063	0.993	1008	0.331		1.269973	8		21			1009	2255		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	180.0624	1.012	1004	0.506		1.269973	8		16			1005	2250		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	180.1150	1.824	1002	0.456		1.269973	8		9			1003	2243		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	180.1256	1.293	1002	0.323		1.269973	8		20			1003	2258		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.0429	1.513	1002	0.504		1.357760	8		20			1003	2268		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.0803	1.489	1002	0.496		1.357760	8		25			1003	2276		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.0827	0.897	1010	0.224		1.357760	8		24			1011	2274		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.1066	1.484	1012	0.495		1.357760	8		20			1013	2260		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.1247	2.233	1008	0.558		1.357760	8		29			1009	2265		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.1687	2.323	1002	0.581		1.357760	8		15			1003	2266		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2124	0.821	1008	0.411		1.357760	7		21			1009	2279		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2251	1.393	1006	0.348		1.357760	8		20			1007	2267		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2292	1.101	1012	0.551		1.357760	8		31			1013	2264		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2379	0.648	1012	0.324		1.357760	8		17			1013	2273		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2474	0.856	1010	0.428		1.357760	8		33			1011	2277		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2504	0.741	1004	0.371		1.357760	8		24			1005	2272		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2587	0.333	1004	0.167		1.357760	8		20			1005	2269		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2739	1.458	1004	0.486		1.357760	8		8			1005	2261		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2798	0.966	1006	0.241		1.357760	8		26			1007	2263		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.2911	0.343	1010	0.171		1.357760	8		44			1011	2262		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.3055	1.134	1004	0.283		1.357760	8		34			1005	2275		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.3134	1.026	1006	0.513		1.357760	8		35			1007	2278		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.3448	1.192	1008	0.397		1.357760	8		31			1009	2259		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.3543	0.954	1004	0.318		1.357760	8		24			1005	2271		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.4797	0.372	1012	0.186		1.357760	8		23			1013	2270		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.5469	0.860	1004	0.287		1.381235	7		24			1005	2286		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.6271	1.313	1002	0.438		1.381235	8		32			1003	2280		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.6618	0.940	1012	0.235		1.381235	8		19			1013	2296		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.6711	1.002	1010	0.250		1.381235	8		42			1011	2300		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.6806	0.998	1004	0.499		1.381235	8		18			1005	2301		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.7590	1.093	1006	0.364		1.381235	8		17			1007	2294		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.7961	0.637	1010	0.319		1.381235	7		24			1011	2297		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8100	0.485	1004	0.242		1.386103	8		23			1005	2318		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8133	0.742	1012	0.371		1.381235	7		30			1013	2290		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8189	1.263	1010	0.316		1.381235	8		26			1011	2288		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8376	1.066	1006	0.533		1.386103	8		27			1007	2320		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8391	1.139	1004	0.380		1.381235	8		27			1005	2281		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8548	0.749	1008	0.250		1.381235	8		17			1009	2295		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8550	1.776	1002	0.444		1.381235	8		24			1003	2287		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8640	0.360	1008	0.180		1.386103	8		24			1009	2312		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8682	1.222	1004	0.407		1.381235	8		18			1005	2284		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8728	0.623	1002	0.208		1.381235	7		31			1003	2298		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8805	0.733	1012	0.367		1.386103	8		17			1013	2311		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8822	1.737	1006	0.434		1.381235	8		31			1007	2283		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8976	0.939	1004	0.470		1.386103	8		27			1005	2306		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.8984	1.048	1012	0.349		1.381235	8		19			1013	2292		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9032	1.018	1012	0.509		1.386103	8		24			1013	2303		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9100	1.727	1006	0.432		1.386103	8		23			1007	2314		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9143	0.480	1002	0.160		1.381235	8		30			1003	2291		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9423	2.168	1012	0.542		1.381235	8		25			1013	2302		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9424	1.721	1008	0.574		1.386103	8		25			1009	2305		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9516	1.358	1006	0.453		1.381235	8		20			1007	2293		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9528	0.581	1004	0.291		1.381235	8		14			1005	2285		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9667	0.798	1012	0.399		1.386103	8		19			1013	2321		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9829	0.670	1008	0.335		1.386103	8		30			1009	2310		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9834	1.079	1010	0.360		1.386103	8		19			1011	2308		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9974	0.686	1006	0.343		1.386103	7		28			1007	2304		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	182.9997	0.974	1012	0.243		1.381235	8		11			1013	2282		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0075	1.273	1004	0.424		1.386103	8		27			1005	2319		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0145	0.724	1008	0.181		1.386103	7		9			1009	2315		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0180	1.189	1002	0.396		1.381235	8		35			1003	2299		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0218	1.052	1012	0.351		1.381235	8		23			1013	2289		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0625	0.625	1006	0.208		1.386103	8		24			1007	2322		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0664	0.772	1004	0.257		1.386103	8		20			1005	2313		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0819	1.186	1002	0.593		1.386103	7		37			1003	2309		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0833	0.668	1012	0.334		1.386103	8		41			1013	2317		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.0915	1.109	1006	0.555		1.386103	8		25			1007	2316		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	183.1776	2.375	1006	0.594		1.386103	8		38			1007	2307		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.4921	0.706	1008	0.176		1.452708	8		19			1009	2330		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.5134	0.654	1010	0.327		1.452708	8		20			1011	2328		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.5205	0.585	1012	0.292		1.452708	8		36			1013	2334		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.5732	1.082	1002	0.541		1.452708	8		33			1003	2326		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.5804	0.619	1002	0.310		1.452708	8		28			1003	2331		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.6184	2.239	1006	0.560		1.452708	8		28			1007	2332		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.7008	1.114	1010	0.279		1.452708	8		30			1011	2323		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.7083	0.811	1002	0.405		1.452708	8		22			1003	2325		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.7833	2.375	1002	0.594		1.452708	8		31			1003	2329		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.8111	1.071	1004	0.357		1.452708	8		15			1005	2333		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.8253	1.294	1012	0.431		1.452708	8		23			1013	2324		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	184.8434	0.708	1006	0.177		1.452708	8		28			1007	2327		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.2899	0.893	1008	0.447		1.486063	8		29			1009	2348		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3466	1.158	1008	0.386		1.474246	8		28			1009	2338		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3793	0.666	1004	0.167		1.474246	8		25			1005	2336		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3803	1.351	1002	0.450		1.488268	8		25			1003	2361		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3861	0.680	1006	0.170		1.489794	8		18			1007	2369		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3889	0.541	1008	0.180		1.474246	8		21			1009	2335		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3958	1.489	1010	0.496		1.474246	8		32			1011	2337		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.3983	1.168	1004	0.584		1.486063	8		15			1005	2352		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4315	1.235	1012	0.309		1.486063	8		25			1013	2347		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4553	1.066	1010	0.533		1.486063	8		35			1011	2351		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4586	1.312	1002	0.437		1.489794	8		32			1003	2374		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4689	1.096	1006	0.548		1.486063	8		28			1007	2356		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4745	0.449	1008	0.225		1.486063	8		24			1009	2339		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4825	1.132	1004	0.566		1.486063	8		24			1005	2342		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4955	0.932	1012	0.466		1.486063	8		25			1013	2345		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.4993	2.101	1008	0.525		1.486063	8		25			1009	2349		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5050	1.918	1002	0.479		1.486063	8		11			1003	2359		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5184	0.932	1004	0.233		1.489794	8		22			1005	2368		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5365	0.357	1008	0.178		1.486063	8		17			1009	2358		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5402	0.476	1010	0.238		1.486063	7		21			1011	2350		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5447	1.228	1004	0.409		1.489794	7		25			1005	2373		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5560	1.406	1004	0.469		1.486063	8		23			1005	2346		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5737	1.594	1008	0.398		1.489794	8		10			1009	2379		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.5901	1.720	1002	0.430		1.488268	8		7			1003	2366		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6005	1.234	1010	0.308		1.486063	8		18			1011	2354		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6094	2.106	1008	0.527		1.486063	8		15			1009	2343		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6375	0.929	1004	0.464		1.486063	7		29			1005	2340		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6414	0.778	1008	0.259		1.489794	7		19			1009	2377		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6470	0.774	1004	0.258		1.486063	8		5			1005	2353		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6474	1.545	1002	0.515		1.489794	7		29			1003	2371		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6543	1.039	1004	0.260		1.488268	8		19			1005	2362		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6876	0.805	1004	0.402		1.489794	7		22			1005	2376		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6944	0.890	1006	0.297		1.488268	8		30			1007	2365		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.6988	0.648	1010	0.162		1.488268	8		32			1011	2367		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7089	0.301	1006	0.151		1.488268	8		41			1007	2360		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7108	1.053	1012	0.527		1.486063	7		26			1013	2357		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7157	1.642	1012	0.547		1.486063	8		22			1013	2341		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7176	0.803	1002	0.201		1.489794	8		30			1003	2370		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7209	1.102	1002	0.276		1.489794	8		28			1003	2378		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7268	0.732	1008	0.244		1.486063	8		21			1009	2344		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7460	0.845	1002	0.282		1.488268	8		19			1003	2364		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7650	0.971	1008	0.243		1.486063	8		17			1009	2355		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7910	0.571	1004	0.285		1.504596	8		22			1005	2380		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.7926	0.922	1008	0.461		1.488268	8		23			1009	2363		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.8574	0.753	1008	0.188		1.489794	8		6			1009	2372		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.9508	1.365	1012	0.341		1.489794	8		27			1013	2375		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	185.9652	0.724	1004	0.181		1.504596	8		21			1005	2383		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.0997	0.439	1010	0.220		1.504596	7		32			1011	2382		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.1476	1.406	1004	0.351		1.504596	7		15			1005	2381		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.2484	0.910	1004	0.455		1.520580	7		20			1005	2418		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.2574	0.962	1006	0.241		1.520549	8		27			1007	2392		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.2616	0.844	1012	0.281		1.520580	8		18			1013	2415		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.3329	1.704	1002	0.426		1.520549	8		21			1003	2388		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.3427	1.110	1012	0.370		1.520580	8		29			1013	2402		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.3977	0.975	1004	0.488		1.520580	8		29			1005	2416		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4084	2.204	1008	0.551		1.520549	8		25			1009	2386		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4099	0.739	1006	0.185		1.520549	8		21			1007	2387		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4194	0.531	1002	0.266		1.520580	8		25			1003	2413		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4347	0.862	1004	0.431		1.520580	8		18			1005	2410		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4352	1.269	1010	0.317		1.520580	8		33			1011	2397		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4415	0.550	1006	0.275		1.520580	8		9			1007	2414		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4474	0.894	1006	0.223		1.520580	7		18			1007	2403		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4564	1.051	1010	0.526		1.520580	8		21			1011	2398		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4572	0.387	1002	0.194		1.520549	8		29			1003	2394		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4621	0.955	1006	0.239		1.520580	8		27			1007	2408		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4679	0.911	1004	0.455		1.520549	8		11			1005	2396		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4768	1.173	1002	0.587		1.520549	8		23			1003	2385		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4784	1.627	1004	0.407		1.520580	7		24			1005	2409		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4862	1.309	1004	0.327		1.520549	8		21			1005	2384		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4992	1.601	1002	0.400		1.520580	7		29			1003	2406		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.4994	1.697	1006	0.424		1.520580	8		25			1007	2411		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5051	2.048	1010	0.512		1.520580	7		30			1011	2404		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5083	1.654	1010	0.414		1.520580	8		36			1011	2407		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5184	0.464	1008	0.232		1.520580	8		26			1009	2412		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5259	1.413	1012	0.471		1.528796	8		26			1013	2420		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5301	2.115	1004	0.529		1.520580	8		21			1005	2401		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5314	0.875	1002	0.292		1.520549	8		26			1003	2395		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5378	0.460	1012	0.230		1.520549	8		25			1013	2393		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5604	1.680	1006	0.560		1.534156	7		21			1007	2450		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5652	1.623	1004	0.541		1.520580	8		3			1005	2400		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.5789	1.758	1008	0.586		1.534156	8		20			1009	2432		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6009	1.540	1010	0.513		1.520549	8		31			1011	2389		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6206	0.666	1004	0.166		1.520580	8		34			1005	2405		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6216	2.284	1006	0.571		1.520549	8		29			1007	2390		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6441	0.544	1004	0.181		1.520580	8		27			1005	2417		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6543	0.506	1010	0.169		1.534156	8		16			1011	2437		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6552	0.582	1008	0.291		1.528796	8		30			1009	2423		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6703	2.294	1012	0.573		1.520580	8		23			1013	2399		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6733	1.117	1004	0.372		1.534156	8		37			1005	2444		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6848	1.003	1012	0.251		1.520549	8		25			1013	2391		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6861	0.931	1012	0.310		1.520580	8		34			1013	2419		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.6864	2.061	1012	0.515		1.534156	8		24			1013	2433		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7258	1.710	1008	0.427		1.534156	8		24			1009	2427		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7268	0.733	1006	0.244		1.534156	8		16			1007	2431		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7399	1.752	1012	0.584		1.534156	8		22			1013	2436		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7512	1.017	1006	0.508		1.534156	8		31			1007	2448		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7513	0.677	1010	0.338		1.539954	8		26			1011	2452		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7528	1.378	1004	0.344		1.534156	8		33			1005	2430		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7563	1.144	1004	0.381		1.534156	8		33			1005	2435		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7566	0.761	1006	0.380		1.539954	8		11			1007	2461		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7590	2.151	1002	0.538		1.534156	8		23			1003	2445		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7607	0.728	1004	0.364		1.528796	8		30			1005	2426		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7679	0.436	1006	0.218		1.545121	8		24			1007	2470		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7897	1.337	1012	0.334		1.539954	8		20			1013	2460		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.7960	1.209	1002	0.403		1.528796	8		30			1003	2422		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8002	0.438	1002	0.219		1.534156	7		15			1003	2449		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8092	0.993	1012	0.497		1.534156	8		24			1013	2441		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8125	0.804	1006	0.402		1.534156	8		21			1007	2446		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8175	0.465	1010	0.233		1.534156	8		22			1011	2429		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8291	0.427	1002	0.214		1.528796	8		10			1003	2421		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8328	1.074	1004	0.269		1.534156	8		25			1005	2443		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8394	1.234	1004	0.411		1.534156	8		31			1005	2447		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8437	0.514	1006	0.257		1.528796	8		43			1007	2425		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8558	1.754	1006	0.585		1.534156	8		33			1007	2428		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8625	1.428	1004	0.357		1.534156	8		13			1005	2434		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8667	0.831	1002	0.416		1.539954	8		25			1003	2465		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8679	1.174	1006	0.587		1.534156	8		16			1007	2442		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8734	1.144	1002	0.286		1.528796	8		26			1003	2424		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.8768	1.911	1010	0.478		1.534156	8		37			1011	2440		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9071	0.534	1010	0.267		1.539954	8		27			1011	2462		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9136	1.222	1008	0.306		1.539954	8		23			1009	2466		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9240	1.940	1010	0.485		1.539954	8		19			1011	2467		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9501	0.877	1008	0.292		1.539954	8		31			1009	2458		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9692	0.605	1004	0.151		1.545121	8		33			1005	2468		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	186.9783	1.001	1002	0.334		1.534156	8		26			1003	2451		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0054	1.201	1004	0.400		1.534156	8		29			1005	2439		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0143	1.141	1006	0.380		1.539954	8		14			1007	2455		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0214	1.031	1008	0.258		1.545121	8		26			1009	2476		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0422	0.595	1008	0.298		1.534156	8		16			1009	2438		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0471	0.338	1004	0.169		1.539954	8		24			1005	2463		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0501	1.644	1010	0.411		1.545121	8		21			1011	2474		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0692	0.993	1008	0.331		1.539954	8		22			1009	2454		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0764	0.907	1012	0.454		1.545121	8		34			1013	2472		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0797	1.081	1012	0.541		1.539954	8		25			1013	2464		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.0820	2.162	1008	0.540		1.539954	8		32			1009	2459		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.1129	0.309	1008	0.155		1.539954	8		27			1009	2457		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.1164	0.317	1002	0.159		1.539954	8		30			1003	2456		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.1433	0.403	1010	0.201		1.545121	8		18			1011	2471		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.1547	0.551	1004	0.276		1.545121	8		25			1005	2469		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.2017	0.889	1008	0.445		1.545121	8		19			1009	2473		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.2268	0.323	1010	0.162		1.539954	8		36			1011	2453		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	187.3112	0.832	1004	0.208		1.545121	8		31			1005	2475		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.0126	1.184	1004	0.296		1.587202	8		22			1005	2480		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.0208	1.743	1012	0.581		1.587202	8		25			1013	2479		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.0641	2.130	1006	0.533		1.587202	8		28			1007	2482		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.1758	1.678	1002	0.559		1.587202	8		8			1003	2478		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.3083	0.675	1004	0.169		1.587202	8		31			1005	2481		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	188.4072	0.471	1006	0.236		1.587202	8		32			1007	2477		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.7352	0.901	1004	0.451		1.657806	8		23			1005	2511		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.8098	1.771	1006	0.443		1.655771	8		24			1007	2484		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.8567	1.807	1010	0.452		1.655771	8		25			1011	2491		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.8654	0.891	1012	0.223		1.657806	8		35			1013	2505		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.8683	0.328	1006	0.164		1.655771	8		26			1007	2483		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9001	0.997	1002	0.332		1.657806	8		33			1003	2510		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9275	0.440	1012	0.220		1.655771	8		15			1013	2487		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9290	0.913	1006	0.457		1.655771	8		19			1007	2490		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9341	0.510	1012	0.255		1.655771	8		25			1013	2495		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9382	0.981	1002	0.490		1.655771	7		9			1003	2499		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9472	2.362	1006	0.591		1.655771	8		12			1007	2493		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9499	1.200	1012	0.400		1.657806	8		21			1013	2514		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9576	0.747	1008	0.373		1.655771	8		25			1009	2502		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9595	0.874	1004	0.219		1.655771	8		29			1005	2500		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9609	0.755	1012	0.252		1.657806	8		24			1013	2509		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	189.9735	0.725	1006	0.242		1.657806	8		22			1007	2512		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0123	1.281	1004	0.427		1.655771	8		22			1005	2486		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0204	1.109	1006	0.370		1.655771	8		23			1007	2496		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0329	2.251	1012	0.563		1.657806	8		22			1013	2513		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0521	1.157	1008	0.579		1.655771	8		22			1009	2503		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0569	1.658	1006	0.553		1.655771	8		28			1007	2501		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0614	1.754	1008	0.585		1.655771	8		21			1009	2489		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0720	0.526	1004	0.263		1.655771	8		10			1005	2492		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0772	0.941	1008	0.471		1.657806	8		28			1009	2508		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0782	0.715	1008	0.179		1.655771	8		18			1009	2498		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.0947	0.849	1010	0.425		1.655771	7		26			1011	2485		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1018	1.463	1004	0.366		1.655771	7		18			1005	2488		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1363	1.264	1006	0.421		1.655771	8		25			1007	2494		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1474	1.432	1006	0.358		1.657806	8		19			1007	2506		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1545	0.913	1004	0.457		1.655771	8		25			1005	2497		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1586	0.823	1004	0.411		1.657806	8		27			1005	2507		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1770	2.342	1004	0.585		1.657806	8		13			1005	2515		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	190.1855	1.122	1008	0.281		1.655771	8		23			1009	2504		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.5408	1.084	1010	0.361		1.727948	8		28			1011	2522		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.5987	1.090	1010	0.545		1.727948	8		20			1011	2528		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.6449	0.674	1010	0.225		1.727948	8		33			1011	2530		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.6895	1.079	1010	0.360		1.727948	8		26			1011	2536		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7177	0.683	1010	0.171		1.727948	8		40			1011	2534		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7284	1.235	1004	0.412		1.727948	8		22			1005	2519		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7446	2.381	1012	0.595		1.727948	8		17			1013	2521		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7626	0.303	1010	0.152		1.727948	8		30			1011	2533		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7726	1.849	1006	0.462		1.727948	8		18			1007	2532		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.7860	0.929	1012	0.310		1.734688	8		30			1013	2540		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.8399	1.847	1012	0.462		1.727948	7		21			1013	2523		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.8446	1.372	1004	0.343		1.727948	8		36			1005	2527		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.8597	1.679	1008	0.420		1.734688	8		25			1009	2545		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.8632	0.498	1006	0.166		1.727948	8		27			1007	2520		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.8987	0.910	1008	0.228		1.734688	8		36			1009	2546		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9073	0.742	1002	0.371		1.734688	8		16			1003	2559		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9135	0.415	1002	0.208		1.734688	8		29			1003	2541		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9178	0.356	1004	0.178		1.727948	8		30			1005	2525		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9193	0.593	1002	0.296		1.734688	8		26			1003	2543		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9345	1.093	1010	0.364		1.734688	8		26			1011	2561		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9372	1.611	1006	0.537		1.727948	8		24			1007	2516		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9523	0.539	1008	0.180		1.734688	8		26			1009	2547		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9538	0.945	1010	0.315		1.727948	8		38			1011	2531		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9614	1.776	1010	0.444		1.734688	8		27			1011	2556		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9650	0.783	1002	0.196		1.727948	8		26			1003	2518		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9792	1.126	1010	0.563		1.727948	8		30			1011	2529		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9845	0.581	1010	0.290		1.734688	8		27			1011	2553		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9878	0.730	1008	0.182		1.734688	8		17			1009	2544		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9900	1.071	1010	0.268		1.734688	8		14			1011	2558		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	191.9913	1.701	1004	0.425		1.734688	8		32			1005	2555		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0052	1.203	1010	0.401		1.727948	8		18			1011	2526		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0058	1.311	1008	0.328		1.734688	8		25			1009	2539		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0253	1.142	1002	0.286		1.734688	8		25			1003	2550		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0280	0.990	1006	0.330		1.734688	7		32			1007	2551		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0322	1.103	1002	0.551		1.734688	8		26			1003	2542		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0438	1.092	1010	0.273		1.727948	7		33			1011	2535		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0472	0.903	1008	0.301		1.734688	8		19			1009	2554		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0597	2.358	1004	0.589		1.727948	8		20			1005	2517		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0735	0.843	1004	0.211		1.734688	8		23			1005	2549		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.0821	1.668	1002	0.556		1.734688	8		23			1003	2538		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.1041	0.500	1004	0.250		1.727948	8		34			1005	2524		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.1162	1.133	1008	0.283		1.734688	7		30			1009	2560		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.1383	0.836	1006	0.209		1.734688	8		31			1007	2557		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.2124	0.913	1008	0.304		1.734688	8		25			1009	2548		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.2249	0.545	1012	0.273		1.727948	8		28			1013	2537		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	192.2818	1.012	1002	0.506		1.734688	8		30			1003	2552		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.0554	1.457	1010	0.486		1.788448	8		13			1011	2569		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.1139	1.350	1006	0.450		1.788448	8		30			1007	2581		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.1404	1.054	1006	0.264		1.788448	8		11			1007	2568		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.1764	0.472	1008	0.236		1.788448	8		34			1009	2582		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.2443	2.214	1004	0.553		1.788448	8		14			1005	2572		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.2487	2.160	1008	0.540		1.788448	8		17			1009	2566		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3427	0.480	1008	0.240		1.788448	8		27			1009	2584		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3533	0.793	1010	0.397		1.788448	8		28			1011	2564		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3569	0.826	1002	0.413		1.788448	8		32			1003	2562		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3666	0.826	1012	0.413		1.788448	8		18			1013	2585		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3735	1.829	1006	0.457		1.788448	8		16			1007	2571		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.3975	0.660	1002	0.165		1.788448	8		15			1003	2583		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4155	1.342	1004	0.447		1.788448	8		26			1005	2563		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4691	0.515	1008	0.172		1.788448	8		27			1009	2573		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4823	1.393	1002	0.464		1.788448	8		24			1003	2567		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4838	0.697	1012	0.232		1.788448	8		22			1013	2575		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4843	0.386	1006	0.193		1.788448	8		27			1007	2570		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.4906	1.715	1006	0.572		1.788448	8		5			1007	2574		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.5036	1.692	1010	0.423		1.788448	8		27			1011	2576		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.5498	2.113	1010	0.528		1.788448	8		25			1011	2577		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.6162	0.848	1002	0.212		1.788448	8		24			1003	2578		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.6402	0.623	1004	0.311		1.788448	8		16			1005	2580		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.6593	0.866	1002	0.289		1.788448	8		30			1003	2565		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.7168	2.196	1006	0.549		1.788448	8		21			1007	2579		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.7486	0.940	1008	0.313		1.814706	8		31			1009	2586		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	193.9367	2.094	1012	0.524		1.814706	8		25			1013	2592		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.0030	1.074	1008	0.358		1.814706	8		29			1009	2589		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.0490	0.773	1004	0.386		1.814706	8		30			1005	2594		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.0994	0.688	1006	0.229		1.814706	8		23			1007	2591		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.1631	2.049	1002	0.512		1.814706	8		22			1003	2588		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.1876	1.274	1002	0.425		1.814706	8		27			1003	2587		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.2606	0.903	1008	0.451		1.814706	8		27			1009	2590		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.2990	2.325	1010	0.581		1.814706	8		28			1011	2593		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.7893	1.763	1002	0.441		1.856091	8		18			1003	2610		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.9157	0.402	1012	0.201		1.856091	8		28			1013	2603		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	194.9326	0.724	1006	0.181		1.856091	8		23			1007	2611		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0279	1.042	1010	0.261		1.855883	8		21			1011	2601		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0340	1.409	1008	0.352		1.856091	8		31			1009	2608		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0689	1.537	1002	0.384		1.855883	8		31			1003	2599		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0816	0.764	1006	0.191		1.855883	8		23			1007	2597		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0862	0.735	1006	0.245		1.856091	8		9			1007	2606		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.0913	0.474	1008	0.237		1.855883	8		30			1009	2596		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.1336	1.127	1008	0.376		1.855883	8		31			1009	2600		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.1600	0.953	1004	0.238		1.856091	8		28			1005	2605		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.1623	1.051	1010	0.526		1.856091	7		31			1011	2609		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.1635	1.036	1006	0.518		1.855883	8		22			1007	2602		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.1752	1.557	1004	0.519		1.856091	8		8			1005	2607		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.2108	1.177	1002	0.392		1.855883	7		21			1003	2595		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.2271	1.743	1008	0.436		1.856091	8		20			1009	2604		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.2645	0.630	1004	0.157		1.856091	8		14			1005	2613		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.2788	0.879	1002	0.220		1.856091	8		25			1003	2612		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.4063	0.727	1010	0.364		1.855883	8		28			1011	2598		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.4775	1.850	1006	0.462		1.876120	8		29			1007	2628		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.5184	0.640	1006	0.320		1.876120	8		40			1007	2616		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.5228	1.664	1004	0.555		1.876120	8		36			1005	2621		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.5533	0.468	1008	0.234		1.876120	8		38			1009	2620		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.5952	0.863	1004	0.432		1.876120	8		22			1005	2615		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.5993	0.848	1008	0.283		1.876120	8		27			1009	2618		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.6312	0.830	1008	0.415		1.876120	8		30			1009	2624		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.6379	1.401	1008	0.467		1.876120	8		25			1009	2622		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.6793	1.452	1008	0.484		1.876120	8		29			1009	2623		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.6969	0.501	1010	0.251		1.876120	8		21			1011	2617		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.7158	0.588	1008	0.196		1.876120	8		29			1009	2626		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.7561	1.156	1002	0.289		1.876120	8		27			1003	2619		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.8503	0.502	1004	0.251		1.876120	8		32			1005	2625		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.8584	2.070	1002	0.517		1.876120	8		20			1003	2614		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	195.9441	1.461	1010	0.487		1.876120	8		29			1011	2627		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.1631	1.675	1008	0.558		1.905001	8		31			1009	2638		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2464	2.200	1006	0.550		1.905001	8		25			1007	2642		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2482	0.502	1004	0.167		1.905001	8		22			1005	2632		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2767	0.652	1008	0.326		1.905001	8		17			1009	2637		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2825	2.392	1002	0.598		1.905001	8		20			1003	2641		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2845	1.078	1004	0.539		1.905001	8		20			1005	2644		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2901	1.020	1002	0.255		1.905001	8		26			1003	2634		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.2916	1.734	1006	0.433		1.905001	8		18			1007	2643		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.3341	0.568	1004	0.284		1.905001	8		17			1005	2646		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.3562	0.999	1006	0.250		1.905001	8		21			1007	2633		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4027	2.083	1006	0.521		1.905001	8		15			1007	2640		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4102	0.502	1002	0.167		1.905001	8		27			1003	2629		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4124	0.611	1006	0.305		1.905001	8		23			1007	2639		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4193	0.625	1010	0.313		1.905001	8		15			1011	2635		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4219	2.271	1002	0.568		1.905001	8		28			1003	2631		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4628	1.746	1002	0.582		1.905001	8		29			1003	2645		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4730	0.649	1010	0.325		1.905001	8		21			1011	2636		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4734	0.830	1002	0.277		1.905001	8		18			1003	2630		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	196.4914	1.379	1004	0.460		1.905001	8		26			1005	2647		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.3704	1.850	1006	0.462		1.948393	8		16			1007	2651		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.3812	1.479	1004	0.370		1.948393	8		26			1005	2655		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.3901	0.641	1012	0.214		1.948393	8		25			1013	2659		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.4063	0.647	1002	0.323		1.951986	8		24			1003	2672		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.4273	0.678	1004	0.226		1.956933	8		25			1005	2701		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.4480	1.143	1010	0.286		1.948393	7		20			1011	2656		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.4586	1.236	1006	0.412		1.951986	8		33			1007	2668		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5059	1.307	1012	0.436		1.948393	8		20			1013	2660		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5199	1.160	1004	0.580		1.948393	8		14			1005	2658		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5345	1.177	1010	0.392		1.948393	8		28			1011	2652		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5517	0.531	1002	0.266		1.948393	8		15			1003	2662		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5640	0.508	1006	0.254		1.951986	8		18			1007	2674		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5642	1.003	1012	0.502		1.956933	8		23			1013	2699		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5705	1.296	1006	0.432		1.956933	8		26			1007	2687		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5757	0.328	1012	0.164		1.956933	8		25			1013	2707		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5762	0.989	1002	0.247		1.956933	8		19			1003	2688		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.5858	1.149	1012	0.383		1.948393	8		12			1013	2664		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6052	2.393	1002	0.598		1.956933	8		26			1003	2685		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6142	1.268	1008	0.317		1.956933	8		23			1009	2681		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6239	0.638	1012	0.213		1.948393	8		26			1013	2667		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6310	0.413	1008	0.206		1.948393	8		17			1009	2650		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6394	0.847	1004	0.423		1.948393	8		14			1005	2666		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6401	1.205	1010	0.402		1.951986	8		16			1011	2680		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6410	0.667	1006	0.222		1.956933	8		12			1007	2708		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6442	0.802	1012	0.401		1.951986	8		35			1013	2669		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6518	0.967	1006	0.322		1.951986	8		20			1007	2679		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6575	1.574	1004	0.525		1.948393	8		17			1005	2649		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6580	1.447	1010	0.362		1.956933	8		19			1011	2694		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6608	0.512	1004	0.256		1.951986	8		24			1005	2671		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6678	1.252	1006	0.417		1.956933	8		30			1007	2704		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6799	0.664	1002	0.166		1.948393	8		15			1003	2665		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6830	1.777	1002	0.444		1.956933	8		19			1003	2691		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6853	0.772	1010	0.386		1.951986	8		18			1011	2673		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6887	1.480	1006	0.493		1.956933	8		24			1007	2689		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6961	1.442	1012	0.361		1.948393	8		21			1013	2657		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.6972	0.585	1008	0.195		1.956933	8		27			1009	2703		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7074	1.870	1002	0.468		1.951986	8		24			1003	2675		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7243	0.958	1008	0.319		1.956933	8		27			1009	2705		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7262	0.718	1010	0.239		1.948393	8		19			1011	2661		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7264	1.641	1002	0.547		1.948393	8		27			1003	2663		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7301	2.078	1008	0.520		1.948393	8		19			1009	2653		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7376	1.608	1010	0.536		1.956933	8		23			1011	2684		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7381	2.238	1004	0.560		1.956933	8		30			1005	2695		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7406	1.529	1010	0.382		1.956933	8		21			1011	2698		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7447	1.427	1008	0.476		1.956933	8		23			1009	2683		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7603	0.878	1002	0.293		1.951986	8		21			1003	2677		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7996	0.606	1004	0.202		1.951986	8		20			1005	2676		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.7997	0.483	1002	0.242		1.948393	8		34			1003	2648		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8222	0.810	1008	0.405		1.948393	8		25			1009	2654		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8304	1.176	1012	0.294		1.956933	8		25			1013	2706		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8317	0.959	1002	0.240		1.951986	8		20			1003	2678		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8331	1.453	1004	0.484		1.956933	8		20			1005	2693		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8534	0.901	1010	0.450		1.956933	8		21			1011	2700		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8818	0.611	1006	0.306		1.951986	8		30			1007	2670		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8825	1.559	1008	0.520		1.956933	8		22			1009	2696		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8844	1.890	1010	0.472		1.956933	8		27			1011	2690		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.8951	1.239	1004	0.310		1.956933	8		33			1005	2702		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.9184	1.370	1008	0.342		1.956933	8		38			1009	2692		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.9198	0.808	1004	0.269		1.956933	8		30			1005	2697		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	197.9378	1.701	1010	0.567		1.956933	8		27			1011	2682		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	198.0349	0.807	1012	0.404		1.956933	8		31			1013	2686		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	198.9371	0.480	1010	0.480		2.019841	8		28			1011	2713		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3029	0.309	1002	0.309		2.019841	8		19			1003	2712		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3068	0.483	1008	0.483		2.019841	8		19			1009	2721		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3084	0.471	1008	0.236		2.019841	8		27			1009	2720		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3316	0.570	1008	0.570		2.019841	8		20			1009	2718		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3535	0.375	1004	0.375		2.019841	8		17			1005	2711		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.3540	0.642	1006	0.321		2.019841	8		31			1007	2722		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.4453	1.189	1006	0.594		2.019841	8		26			1007	2714		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.4734	0.554	1004	0.554		2.019841	8		28			1005	2716		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.5372	0.568	1012	0.284		2.019841	8		20			1013	2709		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.5958	0.440	1006	0.440		2.019841	8		22			1007	2717		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	199.6986	0.420	1010	0.420		2.019841	8		19			1011	2715		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.6129	0.492	1010	0.492		2.077189	8		21			1011	2741		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.7391	0.452	1002	0.226		2.077189	8		22			1003	2734		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.7512	0.311	1002	0.155		2.077189	8		27			1003	2736		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.7848	0.573	1002	0.573		2.077189	8		33			1003	2731		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8534	0.625	1004	0.313		2.077189	8		24			1005	2730		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8560	0.397	1006	0.397		2.077189	8		24			1007	2747		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8600	0.486	1010	0.243		2.077189	8		13			1011	2728		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8652	0.561	1006	0.561		2.077189	8		31			1007	2749		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8834	0.851	1012	0.426		2.077189	8		22			1013	2739		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8979	0.580	1004	0.290		2.077189	8		28			1005	2738		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.8987	0.336	1010	0.336		2.077189	8		27			1011	2729		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.9508	0.970	1008	0.485		2.077189	8		30			1009	2727		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.9599	0.441	1004	0.441		2.077189	8		30			1005	2733		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.9615	0.989	1010	0.495		2.077189	8		25			1011	2726		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.9692	0.419	1008	0.419		2.077189	9		24			1009	2725		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	200.9846	0.354	1010	0.354		2.077189	8		21			1011	2735		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.0140	0.387	1010	0.387		2.077189	8		13			1011	2740		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.0147	0.524	1012	0.262		2.077189	8		15			1013	2742		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.0293	0.244	1002	0.244		2.077189	8		17			1003	2723		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.0351	0.605	1010	0.302		2.077189	8		32			1011	2737		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.0398	0.631	1012	0.316		2.077189	8		21			1013	2750		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.1531	0.294	1004	0.294		2.077189	8		28			1005	2745		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	201.1577	0.925	1010	0.462		2.077189	8		25			1011	2743		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.1540	0.279	1006	0.279		2.137851	8		19			1007	2757		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.3556	0.493	1004	0.493		2.137851	8		20			1005	2782		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.3741	0.907	1004	0.454		2.137851	8		14			1005	2780		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.3823	0.831	1006	0.415		2.137851	8		36			1007	2768		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.3871	0.406	1010	0.406		2.137851	8		21			1011	2762		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.3935	0.431	1002	0.431		2.137851	8		24			1003	2756		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4130	0.565	1010	0.565		2.137851	8		40			1011	2784		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4243	0.392	1002	0.392		2.137851	8		28			1003	2758		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4245	0.841	1006	0.420		2.137851	8		17			1007	2771		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4476	0.444	1010	0.444		2.137851	8		21			1011	2760		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4572	0.230	1006	0.230		2.137851	8		13			1007	2764		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4843	0.951	1010	0.476		2.137851	8		26			1011	2775		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.4870	0.592	1006	0.592		2.137851	8		25			1007	2751		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5025	0.513	1010	0.256		2.137851	9		13			1011	2755		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5027	0.342	1002	0.171		2.137851	8		28			1003	2783		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5110	0.408	1004	0.408		2.137851	8		29			1005	2772		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5144	0.555	1010	0.555		2.137851	8		17			1011	2781		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5211	0.596	1004	0.596		2.137851	8		35			1005	2766		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5661	1.052	1004	0.526		2.137851	8		24			1005	2773		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5697	0.340	1010	0.340		2.137851	8		22			1011	2754		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5729	0.801	1004	0.400		2.137851	8		24			1005	2759		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5765	0.270	1008	0.270		2.137851	9		27			1009	2761		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5859	0.764	1002	0.382		2.137851	8		15			1003	2765		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.5981	0.829	1002	0.414		2.137851	8		19			1003	2769		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.6109	0.643	1008	0.322		2.137851	8		22			1009	2767		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.6798	0.845	1006	0.422		2.137851	8		34			1007	2763		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.6857	1.083	1002	0.541		2.137851	8		25			1003	2752		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.7296	0.773	1006	0.386		2.137851	8		12			1007	2779		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.7573	1.182	1006	0.591		2.137851	8		29			1007	2776		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.7692	0.404	1010	0.404		2.137851	8		30			1011	2777		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.7915	0.303	1006	0.303		2.137851	8		26			1007	2753		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.8167	0.418	1008	0.418		2.164504	8		21			1009	2809		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.8810	0.402	1002	0.402		2.164504	8		32			1003	2793		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.9372	0.557	1008	0.557		2.164504	8		23			1009	2790		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.9713	0.655	1010	0.328		2.164504	8		24			1011	2792		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.9719	0.800	1006	0.400		2.164504	8		26			1007	2801		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	202.9988	0.442	1006	0.442		2.164504	8		14			1007	2803		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.0160	0.384	1008	0.192		2.175653	8		30			1009	2813		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.0411	0.586	1008	0.293		2.164504	8		12			1009	2797		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.0678	0.419	1006	0.210		2.175653	9		28			1007	2827		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.0878	1.015	1008	0.508		2.164504	8		32			1009	2789		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1020	0.961	1004	0.481		2.164504	8		15			1005	2796		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1221	0.416	1006	0.208		2.175653	8		20			1007	2833		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1546	0.396	1004	0.396		2.164504	8		22			1005	2799		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1667	0.804	1004	0.402		2.164504	8		24			1005	2806		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1702	0.152	1006	0.152		2.164504	8		21			1007	2798		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.1876	0.159	1008	0.159		2.164504	8		29			1009	2800		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.2178	0.287	1010	0.287		2.164504	8		24			1011	2794		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.2537	0.229	1006	0.229		2.164504	8		26			1007	2787		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.2680	0.159	1002	0.159		2.175653	8		20			1003	2830		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3279	0.327	1006	0.163		2.175653	8		26			1007	2825		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3357	1.125	1006	0.563		2.175653	8		19			1007	2815		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3359	0.246	1002	0.246		2.164504	8		21			1003	2807		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3410	1.129	1008	0.565		2.164504	8		20			1009	2808		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3470	0.905	1008	0.453		2.164504	8		13			1009	2786		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3530	0.990	1010	0.495		2.164504	8		32			1011	2804		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3550	0.306	1004	0.153		2.164504	8		22			1005	2802		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3596	0.521	1008	0.521		2.175653	8		19			1009	2826		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3676	0.910	1012	0.455		2.164504	8		24			1013	2791		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3680	0.422	1008	0.422		2.164504	8		22			1009	2788		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.3970	0.391	1006	0.391		2.175653	8		27			1007	2829		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4004	0.411	1010	0.411		2.175653	8		22			1011	2814		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4219	0.228	1006	0.228		2.175653	8		19			1007	2818		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4336	0.191	1006	0.191		2.175653	9		21			1007	2822		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4418	0.324	1008	0.324		2.175653	8		26			1009	2820		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4543	0.447	1010	0.447		2.175653	8		30			1011	2821		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4748	1.198	1002	0.599		2.175653	8		19			1003	2832		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.4766	0.399	1006	0.199		2.164504	8		26			1007	2795		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.5139	0.570	1004	0.285		2.175653	8		23			1005	2824		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.5255	0.266	1002	0.266		2.175653	9		28			1003	2810		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.5351	0.471	1008	0.471		2.175653	8		27			1009	2816		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.5461	0.527	1008	0.527		2.175653	8		26			1009	2819		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.6815	0.377	1002	0.377		2.175653	8		26			1003	2831		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.7488	0.509	1008	0.509		2.175653	8		33			1009	2812		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	203.7907	0.362	1010	0.362		2.175653	8		23			1011	2828		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.0116	0.175	1002	0.175		2.248423	8		23			1003	2850		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.0666	0.886	1008	0.443		2.248423	8		32			1009	2856		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1261	0.312	1006	0.156		2.248423	8		26			1007	2859		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1323	1.056	1006	0.528		2.248423	8		26			1007	2864		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1355	0.374	1006	0.187		2.248423	8		22			1007	2846		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1538	0.164	1010	0.164		2.248423	8		21			1011	2834		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1653	0.259	1006	0.259		2.248423	8		36			1007	2860		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1692	0.209	1010	0.209		2.248423	8		28			1011	2847		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.1959	0.569	1012	0.285		2.248423	8		27			1013	2869		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.2074	0.475	1008	0.475		2.248423	8		22			1009	2855		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.2236	0.560	1006	0.560		2.248423	8		17			1007	2839		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.2731	0.490	1004	0.490		2.248423	8		23			1005	2862		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.2829	0.595	1002	0.595		2.248423	8		29			1003	2845		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.2931	0.243	1010	0.243		2.248423	9		25			1011	2843		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3097	0.245	1010	0.245		2.248423	8		25			1011	2868		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3134	0.338	1006	0.338		2.248423	8		25			1007	2865		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3294	0.362	1008	0.181		2.248423	8		35			1009	2848		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3356	0.671	1010	0.336		2.248423	8		14			1011	2838		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3501	0.560	1006	0.560		2.248423	8		17			1007	2844		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3626	0.176	1008	0.176		2.248423	8		29			1009	2857		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3661	0.751	1010	0.375		2.248423	8		29			1011	2840		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3666	0.571	1004	0.285		2.248423	8		18			1005	2866		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.3686	0.521	1008	0.521		2.248423	8		20			1009	2863		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4270	0.321	1010	0.160		2.248423	8		24			1011	2867		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4286	0.175	1006	0.175		2.248423	8		25			1007	2858		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4515	0.436	1004	0.436		2.248423	8		20			1005	2851		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4521	0.483	1008	0.483		2.248423	8		29			1009	2836		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4638	0.328	1006	0.164		2.248423	8		27			1007	2841		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.4903	0.331	1002	0.331		2.248423	8		31			1003	2852		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.5033	0.430	1006	0.215		2.248423	8		17			1007	2854		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.6218	0.547	1010	0.547		2.248423	9		30			1011	2861		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.6710	0.531	1006	0.531		2.248423	8		27			1007	2842		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	205.8243	0.436	1008	0.436		2.285394	8		33			1009	2889		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.0564	0.426	1002	0.426		2.285394	8		20			1003	2897		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.1138	0.319	1002	0.319		2.285394	8		18			1003	2893		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.1181	0.863	1006	0.431		2.285394	8		21			1007	2877		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.1489	0.222	1008	0.222		2.285394	8		25			1009	2906		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.1575	0.506	1004	0.506		2.285394	8		26			1005	2887		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2137	0.312	1002	0.312		2.285394	8		25			1003	2901		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2184	0.326	1010	0.326		2.285394	8		22			1011	2870		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2208	0.539	1002	0.539		2.285394	8		23			1003	2884		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2219	0.333	1004	0.333		2.285394	8		30			1005	2905		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2451	0.235	1004	0.235		2.285394	8		16			1005	2902		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2472	0.197	1004	0.197		2.285394	8		29			1005	2878		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2488	0.348	1002	0.348		2.285394	8		11			1003	2888		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2508	0.521	1012	0.260		2.285394	8		27			1013	2896		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2770	0.595	1004	0.595		2.285394	8		24			1005	2907		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.2824	0.545	1002	0.545		2.285394	8		21			1003	2894		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3005	0.484	1008	0.484		2.285394	8		21			1009	2895		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3192	0.888	1002	0.444		2.285394	8		26			1003	2873		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3403	0.496	1008	0.496		2.285394	8		24			1009	2900		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3551	0.380	1012	0.190		2.285394	8		28			1013	2898		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3689	0.801	1002	0.401		2.285394	9		25			1003	2885		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3760	0.516	1006	0.516		2.285394	8		21			1007	2883		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3910	0.572	1010	0.572		2.285394	8		16			1011	2871		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.3915	0.569	1004	0.569		2.285394	8		20			1005	2882		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.4089	0.322	1006	0.322		2.301683	8		37			1007	2915		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.4589	0.482	1008	0.482		2.285394	8		31			1009	2876		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.4679	0.211	1002	0.211		2.285394	8		22			1003	2899		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.4828	0.519	1006	0.519		2.285394	8		19			1007	2879		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.4838	0.295	1010	0.295		2.285394	8		33			1011	2880		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.5103	0.590	1006	0.590		2.285394	8		32			1007	2890		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.5367	0.347	1004	0.347		2.301683	9		21			1005	2908		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.5912	0.235	1010	0.235		2.285394	8		24			1011	2875		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.5941	1.026	1012	0.513		2.285394	8		18			1013	2904		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6119	1.155	1010	0.577		2.301683	8		16			1011	2920		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6208	0.757	1010	0.379		2.301683	8		19			1011	2914		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6314	0.596	1004	0.298		2.285394	8		14			1005	2874		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6318	0.607	1006	0.304		2.301683	8		30			1007	2923		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6498	0.788	1012	0.394		2.301683	8		31			1013	2911		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6705	0.335	1006	0.335		2.301683	8		28			1007	2925		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.6950	0.339	1002	0.339		2.301683	8		19			1003	2922		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.7154	0.748	1010	0.374		2.301683	8		25			1011	2918		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.7203	0.259	1002	0.259		2.301683	8		23			1003	2909		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.7298	0.364	1008	0.364		2.301683	8		30			1009	2921		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.7416	0.305	1004	0.152		2.301683	8		29			1005	2916		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.7635	0.753	1006	0.377		2.301683	8		22			1007	2913		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.8404	0.524	1002	0.524		2.301683	8		19			1003	2912		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	206.8472	0.578	1002	0.578		2.301683	8		32			1003	2919		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.0143	0.190	1004	0.190		2.301683	8		28			1005	2924		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.3175	0.334	1012	0.167		2.334555	8		18			1013	2934		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.3345	0.495	1010	0.495		2.334555	8		23			1011	2929		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.3622	0.367	1004	0.367		2.334555	8		24			1005	2946		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.3830	1.109	1008	0.554		2.334555	8		28			1009	2931		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.4355	0.251	1008	0.251		2.334555	8		13			1009	2936		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.4585	0.604	1010	0.302		2.334555	8		14			1011	2937		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.4667	0.855	1012	0.427		2.334555	8		25			1013	2944		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.4744	0.801	1006	0.401		2.334555	8		24			1007	2942		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5119	0.532	1002	0.532		2.334555	8		21			1003	2939		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5304	0.424	1004	0.212		2.334555	8		35			1005	2933		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5310	0.748	1010	0.374		2.334555	8		17			1011	2926		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5397	0.173	1010	0.173		2.334555	8		24			1011	2932		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5497	0.357	1008	0.179		2.334555	8		24			1009	2945		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5552	0.512	1008	0.512		2.334555	8		26			1009	2940		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5773	0.155	1008	0.155		2.343932	8		27			1009	2965		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5776	0.423	1008	0.212		2.334555	9		37			1009	2935		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.5972	0.450	1002	0.450		2.334555	8		23			1003	2928		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6338	0.359	1012	0.179		2.334555	8		21			1013	2927		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6345	0.317	1002	0.317		2.343932	8		27			1003	2963		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6538	0.301	1006	0.301		2.334555	9		30			1007	2943		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6807	0.367	1008	0.367		2.343932	9		25			1009	2960		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6965	0.653	1008	0.327		2.343932	8		22			1009	2956		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.6969	1.149	1010	0.574		2.334555	8		28			1011	2947		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.7775	0.367	1012	0.183		2.334555	8		16			1013	2930		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.7832	0.346	1004	0.346		2.334555	8		15			1005	2941		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.7992	0.840	1010	0.420		2.343932	8		17			1011	2959		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8057	0.384	1004	0.384		2.359286	8		21			1005	2982		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8090	0.471	1002	0.471		2.343932	8		32			1003	2949		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8381	0.725	1002	0.362		2.343932	8		32			1003	2962		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8451	0.493	1008	0.493		2.343932	9		28			1009	2951		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8762	0.626	1004	0.313		2.343932	8		27			1005	2948		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8831	0.507	1010	0.254		2.343932	8		18			1011	2957		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.8960	0.180	1006	0.180		2.343932	8		23			1007	2953		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.9255	0.498	1010	0.498		2.343932	9		16			1011	2954		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.9386	1.148	1002	0.574		2.343932	8		27			1003	2961		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.9544	0.284	1004	0.284		2.359286	8		34			1005	2998		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	207.9813	0.455	1002	0.455		2.343932	8		21			1003	2955		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.0036	0.596	1002	0.596		2.343932	8		26			1003	2950		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.0051	0.391	1006	0.391		2.343932	8		29			1007	2964		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.0258	0.246	1010	0.246		2.359286	8		31			1011	2974		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.0969	0.409	1006	0.204		2.359286	8		22			1007	2980		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1346	0.919	1012	0.459		2.359286	8		18			1013	2987		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1514	0.355	1006	0.355		2.359286	8		33			1007	2968		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1662	0.303	1002	0.151		2.359286	8		26			1003	2992		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1840	1.119	1006	0.560		2.359286	8		29			1007	2984		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1882	0.317	1004	0.317		2.359286	9		23			1005	2989		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.1982	0.292	1006	0.292		2.359286	8		21			1007	2969		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2078	1.018	1002	0.509		2.359286	8		27			1003	2973		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2261	0.305	1010	0.305		2.359286	8		22			1011	2983		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2494	0.344	1004	0.344		2.359286	8		28			1005	2991		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2806	0.492	1010	0.246		2.359286	8		30			1011	2988		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2831	0.373	1010	0.373		2.359286	8		22			1011	2986		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.2989	0.680	1008	0.340		2.359286	8		25			1009	2996		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3023	0.830	1002	0.415		2.359286	8		22			1003	2978		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3129	0.194	1004	0.194		2.359286	8		25			1005	2977		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3215	0.569	1008	0.569		2.359286	8		30			1009	2979		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3393	0.513	1004	0.513		2.359286	8		20			1005	2985		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3579	0.590	1010	0.590		2.359286	8		16			1011	2993		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3757	0.483	1004	0.483		2.359286	8		20			1005	2966		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3758	1.193	1004	0.596		2.359286	8		25			1005	2972		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3857	0.797	1008	0.398		2.359286	8		24			1009	2975		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.3955	0.642	1006	0.321		2.359286	8		34			1007	2990		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.4026	0.203	1008	0.203		2.359286	8		29			1009	2976		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.4170	0.244	1010	0.244		2.359286	8		22			1011	2967		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.4216	0.764	1012	0.382		2.359286	8		23			1013	2970		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	208.4924	0.476	1010	0.238		2.359286	8		30			1011	2981		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.6563	0.198	1006	0.198		2.425376	8		18			1007	3023		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.6661	0.525	1006	0.263		2.425376	8		18			1007	2999		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.7165	0.950	1002	0.475		2.425376	8		19			1003	3022		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.7499	0.319	1008	0.319		2.425376	8		21			1009	3003		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.7558	0.481	1002	0.481		2.425376	8		23			1003	3017		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.7595	1.144	1008	0.572		2.425376	8		23			1009	3013		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.8091	0.784	1004	0.392		2.425376	8		14			1005	3010		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.8132	1.155	1012	0.578		2.425376	8		35			1013	3014		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.8504	1.109	1010	0.555		2.425376	8		26			1011	3001		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.8694	0.928	1010	0.464		2.425376	8		18			1011	3008		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.8809	0.416	1010	0.416		2.425376	8		24			1011	3009		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9285	0.385	1006	0.385		2.425376	8		30			1007	3024		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9416	0.210	1004	0.210		2.425376	8		29			1005	3019		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9494	0.833	1008	0.416		2.425376	8		21			1009	3005		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9795	1.135	1012	0.568		2.425376	8		25			1013	3004		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9977	0.862	1006	0.431		2.425376	8		22			1007	3007		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	209.9981	0.669	1012	0.334		2.425376	8		24			1013	3018		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0095	0.734	1008	0.367		2.425376	8		24			1009	3025		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0139	0.721	1010	0.361		2.425376	8		22			1011	3011		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0216	0.290	1004	0.290		2.425376	9		22			1005	3016		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0231	0.379	1004	0.379		2.425376	8		21			1005	3020		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0297	0.763	1006	0.381		2.425376	8		32			1007	3006		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.0459	0.205	1004	0.205		2.425376	8		20			1005	3021		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1001	0.445	1008	0.445		2.425376	9		28			1009	3012		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1030	0.532	1010	0.532		2.442984	9		26			1011	3047		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1084	0.396	1006	0.198		2.425376	8		25			1007	3000		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1191	0.437	1004	0.437		2.442984	8		19			1005	3030		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1343	0.483	1002	0.483		2.425376	8		16			1003	3026		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1401	0.782	1012	0.391		2.442984	8		23			1013	3057		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1768	0.544	1004	0.544		2.442984	9		21			1005	3060		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.1780	0.933	1004	0.466		2.425376	8		32			1005	3002		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.2004	0.404	1012	0.202		2.442984	8		26			1013	3048		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.2179	0.194	1004	0.194		2.425376	8		27			1005	3027		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.2298	0.312	1006	0.312		2.442984	8		30			1007	3054		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.2903	0.394	1002	0.394		2.442984	8		21			1003	3049		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.2926	0.564	1010	0.564		2.442984	8		26			1011	3038		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3093	0.530	1012	0.265		2.442984	8		33			1013	3029		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3173	0.455	1010	0.455		2.442984	8		19			1011	3028		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3177	0.424	1004	0.424		2.442984	8		28			1005	3043		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3228	0.239	1008	0.239		2.442984	8		23			1009	3042		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3512	0.790	1010	0.395		2.442984	8		24			1011	3040		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3623	1.041	1006	0.521		2.442984	8		25			1007	3041		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3895	0.427	1010	0.427		2.442984	8		25			1011	3059		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3932	1.189	1002	0.595		2.442984	8		28			1003	3031		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.3960	0.934	1002	0.467		2.442984	8		25			1003	3055		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.4156	0.948	1008	0.474		2.442984	8		23			1009	3036		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.4611	0.687	1004	0.344		2.442984	8		25			1005	3061		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.4721	0.568	1010	0.568		2.442984	8		21			1011	3053		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.4839	0.348	1010	0.348		2.442984	9		26			1011	3033		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.4994	0.437	1004	0.437		2.442984	8		25			1005	3035		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.5002	0.248	1010	0.248		2.442984	8		21			1011	3044		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.5101	0.509	1010	0.255		2.442984	8		25			1011	3037		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.5595	0.389	1010	0.389		2.442984	8		21			1011	3032		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.6348	0.633	1006	0.316		2.442984	8		30			1007	3039		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.7372	0.978	1006	0.489		2.442984	8		31			1007	3056		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.7591	0.585	1010	0.293		2.442984	8		15			1011	3051		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.8933	0.527	1004	0.263		2.442984	8		27			1005	3034		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.9687	0.762	1006	0.381		2.472155	8		24			1007	3077		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	210.9837	0.464	1010	0.464		2.472155	8		25			1011	3079		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.0020	1.125	1012	0.562		2.472155	8		26			1013	3078		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.0856	0.189	1002	0.189		2.472155	8		24			1003	3066		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1118	1.097	1006	0.549		2.472155	8		26			1007	3062		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1264	0.924	1010	0.462		2.472155	8		32			1011	3076		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1609	0.400	1002	0.200		2.472155	8		21			1003	3068		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1808	0.371	1004	0.371		2.472155	9		20			1005	3075		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1896	0.210	1008	0.210		2.472155	9		29			1009	3070		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1909	0.516	1002	0.516		2.472155	8		38			1003	3064		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.1936	0.664	1012	0.332		2.472155	8		30			1013	3081		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.2066	0.415	1006	0.415		2.472155	8		23			1007	3067		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.2433	0.524	1008	0.262		2.472155	8		24			1009	3074		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.2675	0.370	1008	0.370		2.472155	8		32			1009	3069		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.3166	0.268	1006	0.268		2.472155	8		14			1007	3072		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.6644	0.174	1008	0.174		2.472155	8		24			1009	3071		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.8031	0.255	1002	0.255		2.501221	9		21			1003	3086		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.8318	0.901	1002	0.451		2.501221	8		31			1003	3087		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.8814	0.498	1006	0.498		2.501221	8		29			1007	3084		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	211.8935	0.838	1012	0.419		2.501221	8		29			1013	3083		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.1393	0.326	1012	0.163		2.501221	8		23			1013	3082		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.1435	0.260	1010	0.260		2.501221	8		22			1011	3085		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.3206	0.749	1012	0.374		2.529689	8		23			1013	3093		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.4646	0.304	1008	0.304		2.529689	9		25			1009	3094		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.5209	0.518	1004	0.518		2.541736	8		28			1005	3123		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.5702	0.281	1006	0.281		2.529689	9		31			1007	3091		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.6094	0.504	1008	0.504		2.529689	8		27			1009	3090		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.6335	0.495	1002	0.495		2.529689	8		22			1003	3092		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.6351	0.352	1002	0.352		2.541736	8		22			1003	3097		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.6594	0.554	1004	0.554		2.529689	8		30			1005	3089		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.6655	0.427	1008	0.214		2.541736	8		26			1009	3102		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.7905	0.425	1008	0.425		2.541736	8		18			1009	3135		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.7967	0.724	1002	0.362		2.541736	8		17			1003	3138		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8127	0.472	1006	0.472		2.541742	8		27			1007	3143		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8171	0.637	1002	0.318		2.541736	9		29			1003	3101		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8214	0.342	1006	0.342		2.541736	8		21			1007	3131		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8447	0.481	1006	0.481		2.541736	8		20			1007	3141		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8471	0.850	1010	0.425		2.541736	8		26			1011	3114		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8630	0.903	1006	0.452		2.529689	8		30			1007	3088		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.8714	0.527	1002	0.527		2.541742	8		19			1003	3148		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9052	0.445	1006	0.222		2.541736	8		22			1007	3128		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9128	0.196	1006	0.196		2.541736	9		23			1007	3112		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9249	0.685	1008	0.342		2.541736	8		36			1009	3111		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9346	0.947	1010	0.474		2.541736	8		29			1011	3106		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9358	0.342	1002	0.171		2.541736	8		27			1003	3098		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9442	0.158	1006	0.158		2.541736	8		37			1007	3120		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9532	0.713	1012	0.356		2.541742	8		38			1013	3147		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9641	0.399	1010	0.399		2.541736	8		23			1011	3096		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9674	0.273	1006	0.273		2.541736	8		25			1007	3117		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9701	0.312	1002	0.156		2.541736	8		19			1003	3133		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9720	0.636	1002	0.318		2.541736	8		25			1003	3116		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9771	0.293	1010	0.293		2.541742	8		26			1011	3144		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9843	1.000	1010	0.500		2.541736	8		23			1011	3136		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	212.9899	0.489	1010	0.489		2.541736	8		28			1011	3104		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0100	0.456	1006	0.456		2.541736	8		25			1007	3110		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0300	0.691	1012	0.345		2.541736	8		25			1013	3107		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0359	1.101	1010	0.551		2.541736	8		36			1011	3100		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0397	0.276	1002	0.276		2.541742	8		18			1003	3142		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0425	0.278	1006	0.278		2.541736	8		23			1007	3127		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0482	0.429	1008	0.429		2.541736	8		29			1009	3129		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0635	0.385	1004	0.385		2.541736	8		30			1005	3103		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0690	0.811	1008	0.406		2.541736	9		28			1009	3121		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0740	0.247	1002	0.247		2.541736	8		28			1003	3134		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0810	0.271	1006	0.271		2.541736	8		25			1007	3115		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.0886	0.924	1002	0.462		2.541742	8		25			1003	3145		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.1227	0.703	1006	0.351		2.541736	9		22			1007	3099		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.1245	0.320	1004	0.160		2.541736	8		21			1005	3126		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.1326	0.269	1002	0.269		2.541742	8		26			1003	3146		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.1571	0.504	1010	0.504		2.541736	8		24			1011	3130		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.1773	0.833	1012	0.417		2.541736	8		17			1013	3137		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.2710	0.290	1010	0.290		2.541736	8		24			1011	3140		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.3232	0.377	1004	0.377		2.541736	9		27			1005	3124		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.3953	0.217	1002	0.217		2.541736	8		28			1003	3132		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.5400	0.513	1002	0.513		2.573569	8		27			1003	3155		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.5638	0.469	1004	0.235		2.541736	8		23			1005	3122		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.6435	0.171	1002	0.171		2.573569	8		28			1003	3154		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.6556	0.416	1010	0.208		2.573569	9		27			1011	3157		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.7003	0.705	1012	0.353		2.573569	8		20			1013	3149		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.7579	0.511	1010	0.511		2.573569	8		23			1011	3151		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	213.9490	0.243	1010	0.243		2.573569	8		29			1011	3152		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.3480	0.402	1010	0.402		2.610974	8		33			1011	3170		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.4548	0.575	1012	0.287		2.610974	8		26			1013	3178		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.4593	0.278	1006	0.278		2.620518	9		23			1007	3220		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.5562	0.356	1006	0.178		2.613797	8		24			1007	3196		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.5704	0.397	1004	0.198		2.610974	8		25			1005	3165		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.5752	0.481	1010	0.481		2.610974	8		20			1011	3180		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6345	0.492	1006	0.492		2.610974	9		27			1007	3161		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6364	0.877	1008	0.438		2.610974	8		15			1009	3183		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6556	0.163	1004	0.163		2.610974	8		13			1005	3168		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6580	0.208	1004	0.208		2.610974	8		34			1005	3167		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6631	0.373	1010	0.373		2.613797	8		23			1011	3192		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.6934	0.366	1006	0.366		2.610974	9		30			1007	3169		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7128	0.182	1010	0.182		2.610974	8		31			1011	3184		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7289	0.792	1006	0.396		2.610974	8		23			1007	3173		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7523	0.502	1006	0.502		2.610974	8		27			1007	3158		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7568	0.162	1002	0.162		2.613797	8		27			1003	3197		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7587	0.708	1002	0.354		2.610974	8		24			1003	3166		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7736	0.281	1002	0.281		2.610974	8		21			1003	3163		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7790	1.174	1002	0.587		2.627047	8		20			1003	3237		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7875	0.296	1006	0.296		2.610974	9		32			1007	3185		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.7939	0.859	1008	0.429		2.620518	8		27			1009	3216		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8194	0.901	1006	0.450		2.610974	9		31			1007	3159		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8246	0.203	1010	0.203		2.610974	9		25			1011	3181		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8255	0.740	1010	0.370		2.613797	8		25			1011	3199		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8391	0.464	1004	0.464		2.633296	8		16			1005	3287		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8455	0.473	1012	0.236		2.610974	9		26			1013	3162		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8464	0.397	1008	0.198		2.610974	8		21			1009	3164		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8554	0.393	1008	0.196		2.610974	8		31			1009	3174		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8588	0.359	1008	0.180		2.613797	8		33			1009	3187		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8702	0.683	1002	0.341		2.613797	8		22			1003	3198		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8755	0.288	1004	0.288		2.620518	8		22			1005	3203		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8787	0.503	1004	0.503		2.627047	8		31			1005	3265		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8812	0.570	1010	0.285		2.610974	8		20			1011	3182		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8913	1.062	1004	0.531		2.620518	8		16			1005	3205		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8924	0.593	1004	0.593		2.620518	8		15			1005	3206		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8937	0.434	1006	0.434		2.620518	9		26			1007	3215		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.8938	0.558	1002	0.279		2.620518	8		24			1003	3207		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9028	0.219	1008	0.219		2.613797	8		24			1009	3195		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9117	0.371	1004	0.371		2.620518	8		27			1005	3228		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9123	0.249	1002	0.249		2.627047	9		25			1003	3256		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9134	0.472	1010	0.472		2.613797	8		23			1011	3188		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9147	0.563	1004	0.563		2.610974	9		22			1005	3160		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9199	0.391	1002	0.391		2.620518	9		30			1003	3218		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9221	0.250	1008	0.250		2.610974	8		29			1009	3172		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9323	0.585	1002	0.585		2.620518	8		21			1003	3219		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9326	0.441	1008	0.441		2.613797	8		31			1009	3191		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9330	0.831	1004	0.415		2.613797	8		22			1005	3193		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9433	0.221	1006	0.221		2.627047	8		30			1007	3276		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9444	0.560	1006	0.560		2.613797	8		26			1007	3202		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9451	0.401	1012	0.200		2.627047	8		31			1013	3240		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9475	0.209	1010	0.209		2.637359	8		22			1011	3346		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9512	0.386	1002	0.386		2.620518	8		23			1003	3213		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9697	0.528	1006	0.528		2.613797	8		28			1007	3186		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9712	0.252	1010	0.252		2.610974	8		26			1011	3176		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9883	0.962	1008	0.481		2.627047	8		30			1009	3262		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9897	0.466	1010	0.233		2.627047	9		24			1011	3278		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9916	0.430	1006	0.430		2.627047	8		26			1007	3260		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	214.9966	0.792	1010	0.396		2.627047	8		22			1011	3270		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0078	0.232	1004	0.232		2.610974	8		26			1005	3179		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0097	0.386	1010	0.193		2.620518	9		23			1011	3204		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0117	0.566	1006	0.566		2.620518	9		16			1007	3212		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0312	0.258	1010	0.258		2.610974	8		35			1011	3175		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0386	1.023	1002	0.512		2.633296	9		18			1003	3321		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0468	0.217	1004	0.217		2.627047	8		20			1005	3253		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0557	0.545	1010	0.545		2.613797	8		24			1011	3200		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0600	0.422	1008	0.422		2.620518	8		23			1009	3229		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0701	0.264	1006	0.264		2.627047	8		25			1007	3277		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0766	0.285	1004	0.285		2.620518	8		23			1005	3230		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0801	0.699	1008	0.349		2.633296	9		22			1009	3289		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0902	0.712	1002	0.356		2.627047	8		28			1003	3267		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0902	0.749	1010	0.375		2.637359	8		26			1011	3343		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.0937	0.571	1002	0.571		2.633296	8		22			1003	3309		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1103	0.229	1002	0.229		2.633296	8		24			1003	3296		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1149	0.347	1006	0.174		2.627047	8		32			1007	3241		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1219	0.588	1010	0.588		2.627047	8		29			1011	3269		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1251	0.430	1006	0.430		2.627047	8		29			1007	3233		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1289	0.445	1010	0.445		2.613797	8		25			1011	3190		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1293	0.269	1006	0.269		2.620518	8		28			1007	3223		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1295	0.434	1008	0.434		2.637359	8		27			1009	3358		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1324	0.385	1004	0.193		2.627047	8		18			1005	3242		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1430	0.297	1008	0.297		2.627047	8		26			1009	3273		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1431	0.521	1010	0.521		2.627047	8		17			1011	3261		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1434	0.461	1002	0.461		2.627047	8		29			1003	3263		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1436	0.315	1002	0.315		2.620518	8		18			1003	3225		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1474	0.426	1004	0.426		2.637359	8		27			1005	3342		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1528	0.945	1010	0.473		2.637359	8		29			1011	3339		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1561	0.563	1010	0.281		2.620518	8		14			1011	3217		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1715	0.290	1010	0.290		2.620518	8		26			1011	3209		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1852	0.466	1010	0.466		2.633296	8		17			1011	3303		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1931	0.456	1002	0.456		2.637359	8		15			1003	3330		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1949	0.541	1012	0.271		2.627047	8		23			1013	3239		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.1975	0.275	1008	0.275		2.627047	8		30			1009	3248		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2245	0.490	1002	0.490		2.637359	8		26			1003	3334		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2308	0.433	1010	0.433		2.637359	8		25			1011	3347		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2373	0.642	1008	0.321		2.633296	9		22			1009	3314		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2401	0.771	1010	0.385		2.633296	8		32			1011	3313		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2429	1.124	1006	0.562		2.627047	8		21			1007	3275		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2544	0.301	1010	0.151		2.627047	9		24			1011	3252		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2561	0.412	1012	0.206		2.637359	8		27			1013	3368		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2576	0.271	1008	0.271		2.627047	8		18			1009	3246		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2637	0.320	1008	0.320		2.627047	8		31			1009	3268		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2648	0.391	1006	0.195		2.627047	8		21			1007	3257		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2663	0.852	1008	0.426		2.633296	8		27			1009	3284		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2686	0.796	1008	0.398		2.637359	8		23			1009	3336		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2689	0.168	1004	0.168		2.627047	8		23			1005	3247		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2690	0.514	1006	0.514		2.627047	8		25			1007	3232		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2697	0.460	1006	0.230		2.633296	8		19			1007	3319		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2699	0.405	1010	0.405		2.637359	9		28			1011	3329		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2735	0.842	1002	0.421		2.633296	8		28			1003	3322		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2745	0.185	1004	0.185		2.633296	8		26			1005	3318		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2763	0.396	1002	0.396		2.620518	8		28			1003	3211		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2793	0.436	1008	0.436		2.637359	8		17			1009	3366		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2804	0.523	1010	0.261		2.627047	8		20			1011	3264		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2828	0.499	1012	0.250		2.627047	9		15			1013	3234		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2847	0.636	1004	0.318		2.637359	8		26			1005	3335		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2872	0.284	1006	0.284		2.627047	8		22			1007	3245		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2874	0.465	1006	0.465		2.627047	8		29			1007	3271		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2898	0.168	1008	0.168		2.620518	8		31			1009	3208		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2911	1.057	1012	0.528		2.637359	8		32			1013	3360		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2912	0.420	1010	0.210		2.633296	8		13			1011	3317		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2930	0.513	1010	0.513		2.633296	8		30			1011	3311		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.2983	0.474	1010	0.474		2.637359	8		27			1011	3351		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3001	1.172	1010	0.586		2.627047	8		29			1011	3236		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3013	0.391	1004	0.391		2.627047	8		21			1005	3231		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3182	0.445	1004	0.223		2.633296	9		33			1005	3286		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3299	0.544	1010	0.544		2.637359	8		27			1011	3340		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3370	0.488	1006	0.244		2.627047	8		21			1007	3274		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3405	0.191	1010	0.191		2.627047	8		24			1011	3251		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3416	0.514	1002	0.257		2.637359	8		25			1003	3348		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3444	0.153	1008	0.153		2.627047	8		24			1009	3259		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3444	0.491	1010	0.491		2.637359	8		19			1011	3357		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3493	0.960	1010	0.480		2.633296	8		26			1011	3295		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3493	0.394	1008	0.197		2.637359	8		28			1009	3331		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3557	0.267	1008	0.267		2.637359	8		21			1009	3365		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3612	0.711	1002	0.355		2.637359	8		23			1003	3356		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3744	0.312	1008	0.312		2.620518	8		31			1009	3221		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3795	0.343	1004	0.343		2.627047	8		30			1005	3254		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3811	0.337	1006	0.337		2.633296	8		23			1007	3292		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3822	0.474	1010	0.474		2.633296	8		28			1011	3283		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3894	0.348	1004	0.348		2.633296	8		28			1005	3312		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3900	0.296	1008	0.296		2.633296	8		14			1009	3298		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3969	0.348	1010	0.174		2.637359	8		26			1011	3367		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3969	0.470	1002	0.470		2.633296	8		22			1003	3304		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.3983	0.448	1008	0.448		2.637359	9		31			1009	3333		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4048	0.599	1006	0.300		2.633296	9		23			1007	3316		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4051	0.846	1012	0.423		2.633296	9		19			1013	3299		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4054	0.288	1006	0.288		2.637359	8		27			1007	3352		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4136	0.973	1006	0.487		2.627047	8		20			1007	3244		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4235	0.307	1002	0.153		2.633296	9		17			1003	3290		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4297	0.543	1002	0.543		2.637359	8		24			1003	3361		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4304	0.835	1004	0.418		2.633296	8		30			1005	3306		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4518	0.551	1008	0.276		2.633296	9		18			1009	3293		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4617	0.426	1010	0.426		2.633296	8		23			1011	3308		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4657	0.203	1006	0.203		2.633296	8		16			1007	3291		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4688	0.580	1004	0.580		2.637359	8		22			1005	3359		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4715	1.098	1010	0.549		2.633296	8		18			1011	3325		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4753	0.205	1004	0.205		2.637359	8		23			1005	3327		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4772	0.269	1004	0.269		2.637359	8		34			1005	3328		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4871	0.158	1010	0.158		2.637359	8		22			1011	3326		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.4948	0.493	1002	0.493		2.637359	8		23			1003	3353		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5051	0.321	1010	0.160		2.633296	8		21			1011	3302		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5139	0.193	1006	0.193		2.627047	9		15			1007	3250		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5262	0.594	1006	0.594		2.633296	8		21			1007	3279		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5268	0.343	1006	0.343		2.637359	8		27			1007	3354		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5318	0.760	1002	0.380		2.637359	8		25			1003	3363		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5384	0.175	1010	0.175		2.637359	8		30			1011	3332		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5393	0.901	1008	0.450		2.637359	8		30			1009	3344		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5421	0.357	1008	0.179		2.633296	8		22			1009	3301		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5478	0.369	1004	0.184		2.637359	8		23			1005	3350		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5677	0.592	1010	0.592		2.637359	9		20			1011	3349		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5747	0.370	1010	0.370		2.627047	8		27			1011	3258		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5764	0.258	1002	0.258		2.637359	8		31			1003	3338		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.5905	1.093	1002	0.546		2.637359	8		29			1003	3337		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6029	0.237	1010	0.237		2.633296	9		28			1011	3307		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6074	0.156	1008	0.156		2.633296	9		22			1009	3323		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6254	0.820	1010	0.410		2.633296	8		28			1011	3281		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6274	0.231	1004	0.231		2.633296	8		19			1005	3282		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6416	0.207	1010	0.207		2.633296	8		23			1011	3324		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6461	0.493	1008	0.493		2.637359	8		23			1009	3341		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6652	0.739	1008	0.370		2.633296	8		35			1009	3288		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6657	0.507	1006	0.507		2.633296	9		27			1007	3310		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.6806	0.915	1004	0.458		2.633296	8		18			1005	3305		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	215.7175	0.982	1002	0.491		2.633296	9		19			1003	3300		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.5059	0.553	1006	0.553		2.847629	8		37			1007	3374		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.5079	0.236	1010	0.236		2.855854	8		29			1011	3425		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.5250	0.158	1008	0.158		2.855854	8		22			1009	3410		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.5796	0.336	1006	0.336		2.847629	9		20			1007	3375		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.5844	0.164	1002	0.164		2.847629	8		23			1003	3406		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.7237	0.566	1006	0.566		2.847629	9		24			1007	3394		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.7623	0.313	1010	0.156		2.847629	9		31			1011	3380		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8016	0.344	1006	0.344		2.855854	8		18			1007	3429		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8135	0.171	1010	0.171		2.855854	9		33			1011	3411		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8158	0.366	1006	0.366		2.855854	8		22			1007	3430		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8217	0.902	1008	0.451		2.847629	9		27			1009	3389		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8338	0.512	1002	0.256		2.847629	8		25			1003	3386		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8556	0.778	1008	0.389		2.847629	8		22			1009	3401		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8593	0.864	1012	0.432		2.847629	8		20			1013	3396		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8631	0.515	1002	0.515		2.847629	8		26			1003	3373		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8692	0.427	1006	0.427		2.847629	8		22			1007	3402		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8692	0.245	1002	0.245		2.847629	8		22			1003	3391		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8703	0.455	1010	0.455		2.847629	8		18			1011	3371		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8785	0.405	1006	0.405		2.847629	8		17			1007	3403		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8786	0.412	1010	0.412		2.847629	9		26			1011	3377		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8855	1.046	1006	0.523		2.847629	9		30			1007	3382		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.8993	0.776	1012	0.388		2.847629	8		29			1013	3408		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9011	0.631	1002	0.315		2.847629	8		27			1003	3392		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9059	0.432	1008	0.432		2.847629	9		20			1009	3379		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9062	0.885	1006	0.442		2.847629	8		23			1007	3409		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9161	0.651	1008	0.325		2.855854	8		25			1009	3421		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9277	0.299	1002	0.299		2.847629	9		15			1003	3395		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9327	0.547	1010	0.547		2.847629	9		29			1011	3390		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9592	0.551	1004	0.551		2.855854	9		27			1005	3414		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9630	0.593	1010	0.593		2.847629	8		24			1011	3384		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9890	0.575	1008	0.287		2.847629	8		23			1009	3383		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9957	0.313	1002	0.313		2.847629	8		26			1003	3387		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	220.9967	0.541	1010	0.541		2.855854	8		28			1011	3437		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0050	0.457	1002	0.457		2.847629	8		34			1003	3397		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0112	0.332	1004	0.332		2.847629	9		29			1005	3407		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0153	0.247	1010	0.247		2.855854	8		32			1011	3418		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0369	0.620	1002	0.310		2.855854	8		24			1003	3420		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0392	0.549	1010	0.549		2.847629	8		23			1011	3376		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0471	0.406	1002	0.406		2.855854	8		25			1003	3415		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0504	0.233	1010	0.233		2.847629	8		20			1011	3381		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0558	0.394	1004	0.394		2.847629	8		28			1005	3405		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0701	0.363	1006	0.363		2.855854	8		26			1007	3433		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.0868	0.638	1008	0.319		2.855854	8		27			1009	3436		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1023	0.276	1004	0.276		2.855854	8		18			1005	3435		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1071	0.200	1006	0.200		2.855854	9		27			1007	3427		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1083	0.479	1010	0.479		2.847629	9		35			1011	3393		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1212	0.223	1008	0.223		2.855854	8		20			1009	3428		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1242	0.304	1004	0.304		2.855854	8		36			1005	3416		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1291	0.422	1006	0.211		2.855854	8		23			1007	3426		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1393	0.526	1004	0.526		2.855854	9		22			1005	3417		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1483	0.877	1002	0.439		2.855854	9		21			1003	3413		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1526	0.594	1002	0.594		2.847629	8		23			1003	3398		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1610	0.575	1008	0.575		2.855854	8		23			1009	3424		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1841	0.415	1006	0.208		2.855854	9		23			1007	3434		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.1881	0.577	1002	0.289		2.847629	8		22			1003	3388		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.2233	0.154	1008	0.154		2.855854	8		26			1009	3438		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.2430	1.041	1008	0.520		2.855854	8		24			1009	3431		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.2477	0.287	1008	0.287		2.847629	8		23			1009	3369		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.2569	1.017	1002	0.509		2.855854	8		19			1003	3423		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.2803	0.468	1004	0.234		2.855854	8		28			1005	3419		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.3013	0.498	1012	0.249		2.855854	8		29			1013	3422		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.3141	0.312	1002	0.312		2.855854	8		25			1003	3432		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	221.3763	1.140	1010	0.570		2.855854	8		25			1011	3412		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.1009	0.470	1006	0.235		2.913059	8		25			1007	3447		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.2429	0.434	1004	0.434		2.913059	9		25			1005	3462		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.3571	0.518	1002	0.518		2.922407	8		26			1003	3482		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4106	0.507	1004	0.507		2.913059	8		27			1005	3451		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4413	0.201	1006	0.201		2.925867	8		26			1007	3530		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4489	0.270	1008	0.270		2.913059	8		25			1009	3449		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4622	0.939	1004	0.470		2.913059	8		25			1005	3459		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4882	0.228	1010	0.228		2.913059	9		31			1011	3463		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4905	0.367	1010	0.367		2.922407	8		26			1011	3494		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4967	0.819	1012	0.410		2.913059	8		24			1013	3439		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.4970	0.249	1006	0.249		2.913059	8		15			1007	3443		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5309	0.150	1006	0.150		2.922407	8		31			1007	3496		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5368	0.425	1010	0.213		2.913059	9		27			1011	3457		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5444	0.568	1006	0.568		2.913059	8		20			1007	3442		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5492	0.212	1006	0.212		2.922407	8		30			1007	3488		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5684	0.840	1002	0.420		2.925867	9		28			1003	3522		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5708	0.572	1008	0.572		2.913059	8		26			1009	3469		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5741	0.460	1010	0.460		2.913059	8		18			1011	3467		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.5823	0.241	1006	0.241		2.913059	8		24			1007	3452		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6024	0.811	1006	0.405		2.913059	9		25			1007	3466		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6129	0.553	1010	0.277		2.922407	9		30			1011	3489		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6213	0.224	1010	0.224		2.922407	9		19			1011	3473		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6405	0.170	1006	0.170		2.925867	8		19			1007	3525		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6447	0.707	1010	0.353		2.922407	8		26			1011	3505		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6545	0.411	1010	0.411		2.922407	8		25			1011	3490		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6611	0.249	1008	0.249		2.913059	8		24			1009	3458		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6682	0.546	1006	0.273		2.922407	8		17			1007	3507		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.6707	0.371	1006	0.371		2.913059	8		27			1007	3461		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7056	1.106	1012	0.553		2.913059	9		28			1013	3450		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7068	0.957	1012	0.478		2.922407	8		24			1013	3503		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7113	0.376	1010	0.376		2.913059	9		29			1011	3465		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7161	0.491	1008	0.491		2.913059	9		22			1009	3453		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7165	0.185	1010	0.185		2.922407	8		26			1011	3476		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7268	0.509	1006	0.509		2.922407	8		16			1007	3480		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7321	0.226	1004	0.226		2.922407	8		22			1005	3509		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7405	1.186	1010	0.593		2.913059	8		19			1011	3464		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7410	0.317	1012	0.159		2.913059	8		20			1013	3445		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7635	0.593	1002	0.593		2.913059	8		22			1003	3444		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7767	0.694	1010	0.347		2.922407	8		19			1011	3504		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7779	0.509	1006	0.509		2.925867	8		28			1007	3528		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7826	1.197	1012	0.599		2.922407	8		27			1013	3497		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.7969	0.249	1010	0.249		2.922407	8		27			1011	3501		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8133	0.562	1006	0.281		2.922407	8		22			1007	3478		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8307	0.445	1006	0.445		2.922407	9		23			1007	3472		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8337	0.432	1012	0.216		2.922407	8		25			1013	3481		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8484	0.454	1008	0.454		2.913059	8		17			1009	3441		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8642	0.797	1010	0.399		2.925867	8		33			1011	3531		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8705	0.569	1010	0.569		2.925867	9		30			1011	3526		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8724	0.189	1006	0.189		2.922407	8		24			1007	3492		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8769	0.764	1006	0.382		2.913059	8		22			1007	3456		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8845	1.085	1008	0.542		2.925867	9		27			1009	3524		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8885	0.578	1006	0.578		2.922407	8		21			1007	3479		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8946	0.442	1008	0.442		2.922407	8		26			1009	3506		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.8952	1.002	1006	0.501		2.922407	9		29			1007	3514		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9176	1.132	1004	0.566		2.922407	9		26			1005	3511		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9199	0.890	1006	0.445		2.922407	8		27			1007	3484		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9201	0.391	1010	0.391		2.922407	8		24			1011	3477		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9278	0.792	1012	0.396		2.922407	8		24			1013	3491		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9291	0.402	1010	0.201		2.925867	8		31			1011	3515		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9387	0.675	1002	0.338		2.922407	9		21			1003	3470		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9588	0.191	1008	0.191		2.922407	8		22			1009	3474		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9677	0.482	1010	0.482		2.925867	8		20			1011	3521		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	222.9681	0.757	1010	0.379		2.922407	8		18			1011	3486		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0001	0.191	1002	0.191		2.913059	8		31			1003	3460		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0139	0.234	1002	0.234		2.925867	8		30			1003	3523		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0292	0.151	1006	0.151		2.913059	8		31			1007	3454		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0347	0.526	1006	0.526		2.922407	8		28			1007	3510		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0537	0.270	1010	0.270		2.922407	8		24			1011	3498		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.0670	1.146	1010	0.573		2.925867	8		19			1011	3527		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.1004	0.566	1010	0.566		2.922407	8		20			1011	3508		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.1340	0.366	1008	0.366		2.922407	8		27			1009	3513		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.1431	0.306	1010	0.306		2.922407	8		31			1011	3502		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.1775	0.429	1004	0.214		2.922407	8		21			1005	3500		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.2622	0.642	1010	0.321		2.925867	8		27			1011	3518		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.2703	0.382	1002	0.382		2.922407	9		25			1003	3512		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.3004	0.346	1002	0.346		2.957719	8		25			1003	3559		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.3318	0.526	1010	0.263		2.922407	9		23			1011	3483		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.3838	0.564	1006	0.282		2.957719	8		24			1007	3554		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.3984	0.456	1010	0.228		2.957719	9		23			1011	3542		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.4216	0.629	1006	0.314		2.957719	8		19			1007	3536		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.4276	0.449	1006	0.449		2.957719	8		27			1007	3539		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.4472	0.414	1006	0.414		2.925867	8		20			1007	3517		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.4489	0.485	1002	0.243		2.957719	8		26			1003	3548		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.5047	0.322	1010	0.161		2.957719	8		29			1011	3532		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.5295	0.253	1004	0.253		2.957719	8		19			1005	3565		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.5828	0.469	1010	0.469		2.957719	8		19			1011	3563		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.6282	0.190	1008	0.190		2.957719	9		25			1009	3560		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.6315	0.316	1012	0.158		2.957719	8		32			1013	3546		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.6885	0.247	1002	0.247		2.957719	8		20			1003	3549		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.6966	0.524	1010	0.524		2.966134	8		20			1011	3583		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.6990	0.378	1002	0.378		2.966134	9		24			1003	3594		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7136	0.550	1010	0.275		2.966134	8		28			1011	3587		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7254	0.535	1004	0.535		2.957719	8		31			1005	3552		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7261	0.706	1012	0.353		2.957719	8		25			1013	3561		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7333	0.200	1010	0.200		2.975586	8		26			1011	3617		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7625	0.477	1010	0.477		2.957719	8		27			1011	3540		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7645	0.357	1006	0.357		2.957719	8		22			1007	3533		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7734	0.558	1006	0.558		2.966134	9		24			1007	3568		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7753	0.297	1010	0.297		2.966134	8		21			1011	3593		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7805	1.176	1012	0.588		2.957719	9		19			1013	3547		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7934	0.375	1004	0.375		2.957719	8		29			1005	3556		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.7966	0.309	1010	0.309		2.957719	8		24			1011	3564		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8052	0.929	1010	0.464		2.957719	8		21			1011	3545		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8052	1.068	1010	0.534		2.957719	8		27			1011	3557		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8342	0.172	1004	0.172		2.966134	8		14			1005	3588		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8389	0.631	1002	0.315		2.957719	8		25			1003	3541		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8688	0.315	1012	0.157		2.957719	8		19			1013	3555		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8787	1.016	1002	0.508		2.975586	9		25			1003	3611		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8894	1.078	1004	0.539		2.966134	9		29			1005	3589		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8933	0.592	1012	0.296		2.972566	8		30			1013	3607		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.8973	1.093	1002	0.547		2.957719	8		29			1003	3550		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9023	0.190	1002	0.190		2.966134	8		32			1003	3578		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9045	0.729	1010	0.364		2.966134	9		27			1011	3580		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9124	1.151	1004	0.576		2.966134	8		26			1005	3581		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9140	0.750	1006	0.375		2.966134	8		24			1007	3566		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9195	0.577	1010	0.577		2.966134	8		17			1011	3573		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9401	0.225	1006	0.225		2.957719	9		26			1007	3551		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9880	0.190	1004	0.190		2.972566	8		28			1005	3602		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9907	0.851	1012	0.425		2.957719	8		27			1013	3558		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9915	0.274	1008	0.274		2.966134	8		32			1009	3590		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9927	0.212	1010	0.212		2.957719	8		26			1011	3535		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9968	0.471	1006	0.471		2.966134	8		29			1007	3577		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	223.9988	0.304	1002	0.304		2.975586	9		28			1003	3618		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0008	0.868	1006	0.434		2.966134	8		26			1007	3576		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0036	0.172	1006	0.172		2.972566	8		19			1007	3600		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0083	0.207	1006	0.207		2.957719	8		27			1007	3537		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0137	0.381	1010	0.381		2.966134	8		27			1011	3571		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0552	0.489	1008	0.489		2.966134	8		16			1009	3572		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0619	0.529	1010	0.529		2.972566	8		28			1011	3598		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0916	0.665	1010	0.332		2.972566	8		15			1011	3597		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.0930	0.231	1010	0.231		2.966134	8		25			1011	3591		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1029	0.530	1012	0.265		2.975586	8		26			1013	3623		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1195	0.454	1002	0.454		2.975586	8		19			1003	3615		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1230	0.531	1010	0.531		2.972566	8		30			1011	3606		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1306	0.854	1002	0.427		2.972566	8		23			1003	3595		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1352	0.152	1010	0.152		2.966134	8		30			1011	3579		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1437	0.564	1006	0.564		2.975586	8		18			1007	3619		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1531	0.327	1004	0.327		2.957719	9		23			1005	3538		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1653	0.998	1006	0.499		2.966134	9		26			1007	3575		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1777	0.563	1004	0.563		2.966134	8		22			1005	3586		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1905	0.417	1002	0.417		2.966134	8		25			1003	3569		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.1993	0.203	1010	0.203		2.966134	9		21			1011	3574		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2032	0.786	1012	0.393		2.966134	8		22			1013	3592		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2427	0.808	1010	0.404		2.972566	8		29			1011	3599		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2504	0.598	1006	0.598		2.972566	9		25			1007	3605		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2633	0.841	1006	0.421		2.975586	8		22			1007	3616		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2749	0.464	1006	0.464		2.972566	9		24			1007	3603		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.2881	0.838	1010	0.419		2.975586	8		20			1011	3613		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.3702	0.177	1008	0.177		2.975586	8		30			1009	3624		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.3729	0.992	1012	0.496		2.975586	8		26			1013	3614		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.3971	0.230	1006	0.230		2.975586	9		20			1007	3620		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4006	0.160	1010	0.160		2.972566	8		24			1011	3596		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4009	0.393	1008	0.196		2.972566	8		19			1009	3610		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4493	0.176	1008	0.176		2.975586	8		26			1009	3612		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4642	0.317	1008	0.317		2.972566	9		23			1009	3609		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4853	0.487	1004	0.243		2.966134	8		15			1005	3582		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.4910	0.356	1002	0.356		2.975586	8		30			1003	3622		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	224.5110	0.554	1006	0.554		2.975586	8		20			1007	3621		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.2567	1.024	1010	0.512		3.034431	8		27			1011	3654		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.2573	0.497	1002	0.497		3.034431	8		21			1003	3631		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.4149	0.162	1006	0.162		3.034431	8		26			1007	3653		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.4245	0.642	1010	0.321		3.034431	8		21			1011	3648		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.4785	0.195	1006	0.195		3.034431	9		30			1007	3651		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.4847	0.234	1008	0.234		3.034431	9		20			1009	3639		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.5539	0.183	1006	0.183		3.034431	8		25			1007	3645		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.6450	0.323	1008	0.323		3.034431	9		23			1009	3644		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.6481	0.270	1008	0.270		3.034431	9		20			1009	3647		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.6507	0.272	1004	0.272		3.034431	8		21			1005	3634		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.6628	0.405	1008	0.405		3.034431	8		24			1009	3625		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.7326	0.265	1010	0.265		3.034431	8		24			1011	3630		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.7522	0.409	1010	0.409		3.034431	8		28			1011	3636		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.7625	0.567	1002	0.567		3.034431	9		23			1003	3643		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.7789	0.422	1006	0.211		3.034431	8		25			1007	3629		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.7848	0.573	1004	0.573		3.034431	8		23			1005	3638		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.8168	0.273	1004	0.273		3.034431	8		27			1005	3635		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.8385	0.201	1010	0.201		3.034431	9		20			1011	3632		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.8395	0.570	1010	0.285		3.034431	8		24			1011	3642		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.8966	0.315	1006	0.157		3.034431	8		25			1007	3633		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.9039	0.356	1010	0.356		3.034431	8		27			1011	3652		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.9690	0.273	1006	0.273		3.034431	8		21			1007	3626		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	225.9865	0.392	1004	0.392		3.034431	9		27			1005	3628		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	226.0407	0.478	1010	0.239		3.034431	8		24			1011	3640		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	226.1028	0.416	1006	0.208		3.034431	8		20			1007	3641		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	226.2791	1.159	1010	0.580		3.034431	8		20			1011	3627		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.5634	0.565	1006	0.565		3.129461	8		27			1007	3672		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.5658	0.578	1006	0.578		3.129461	8		22			1007	3661		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.5682	0.563	1010	0.281		3.129461	8		25			1011	3658		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.6390	0.473	1010	0.473		3.129461	8		29			1011	3667		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.7728	0.588	1004	0.588		3.129461	8		26			1005	3666		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.8353	0.571	1012	0.285		3.129461	8		26			1013	3655		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.8358	0.252	1008	0.252		3.129461	9		24			1009	3662		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	227.9930	0.375	1012	0.188		3.129461	9		24			1013	3665		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.0242	0.274	1006	0.274		3.129461	9		27			1007	3679		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.0781	0.427	1006	0.427		3.129461	9		34			1007	3669		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.1229	0.422	1002	0.422		3.129461	8		23			1003	3677		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2017	0.265	1008	0.265		3.129461	8		23			1009	3673		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2162	0.552	1010	0.276		3.129461	8		30			1011	3671		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2423	0.331	1004	0.166		3.129461	8		26			1005	3674		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2628	0.319	1002	0.319		3.129461	9		28			1003	3663		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2743	1.152	1006	0.576		3.129461	8		26			1007	3656		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2893	0.189	1008	0.189		3.129461	8		28			1009	3660		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2989	0.216	1010	0.216		3.129461	8		22			1011	3680		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.2998	0.632	1002	0.316		3.129461	9		27			1003	3678		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.3743	0.377	1006	0.377		3.129461	8		21			1007	3659		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.4351	0.379	1008	0.379		3.154864	9		19			1009	3697		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.4381	0.970	1002	0.485		3.129461	9		27			1003	3668		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.4397	0.489	1010	0.489		3.129461	8		28			1011	3657		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.4465	0.377	1008	0.377		3.154864	8		18			1009	3686		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.5179	0.520	1010	0.520		3.154864	8		29			1011	3711		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.5451	0.314	1002	0.314		3.154864	9		24			1003	3684		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.5720	0.482	1006	0.241		3.129461	8		33			1007	3664		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.5743	0.396	1004	0.396		3.154864	8		15			1005	3698		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.5967	0.283	1004	0.283		3.154864	8		18			1005	3694		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.6083	0.825	1010	0.412		3.154864	8		22			1011	3719		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.6479	0.330	1002	0.330		3.154864	8		31			1003	3713		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.6661	0.536	1008	0.536		3.154864	8		31			1009	3721		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.6778	0.580	1012	0.290		3.154864	9		28			1013	3707		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.6959	0.305	1012	0.153		3.154864	8		28			1013	3724		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.7358	0.515	1010	0.258		3.154864	8		25			1011	3708		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.7519	0.233	1008	0.233		3.154864	8		26			1009	3688		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.7556	0.564	1010	0.564		3.154864	8		18			1011	3722		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.7690	0.346	1004	0.346		3.154864	9		24			1005	3728		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.7736	0.373	1010	0.373		3.154864	8		28			1011	3699		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8000	0.770	1006	0.385		3.154864	8		22			1007	3689		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8219	0.364	1010	0.182		3.154864	8		27			1011	3704		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8357	0.558	1006	0.558		3.154864	8		26			1007	3692		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8417	0.163	1006	0.163		3.154864	9		26			1007	3715		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8429	0.535	1004	0.535		3.154864	8		22			1005	3716		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8436	0.406	1006	0.406		3.154864	8		26			1007	3687		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.8730	0.485	1006	0.242		3.154864	9		28			1007	3709		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9052	0.307	1006	0.307		3.154864	9		21			1007	3681		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9122	0.191	1006	0.191		3.154864	8		27			1007	3685		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9156	0.469	1008	0.469		3.154864	9		22			1009	3710		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9408	0.461	1002	0.461		3.154864	8		21			1003	3726		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9540	0.365	1006	0.365		3.154864	8		26			1007	3705		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9554	0.486	1006	0.486		3.154864	8		26			1007	3683		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9615	1.145	1006	0.573		3.154864	9		27			1007	3703		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9804	0.956	1010	0.478		3.154864	8		18			1011	3701		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9850	0.515	1004	0.515		3.154864	9		19			1005	3714		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9874	0.442	1010	0.221		3.154864	9		29			1011	3695		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	228.9885	0.566	1010	0.566		3.154864	8		21			1011	3720		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.0320	0.353	1006	0.353		3.154864	9		21			1007	3682		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.0626	0.606	1002	0.303		3.154864	8		23			1003	3700		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.0646	0.217	1010	0.217		3.154864	8		21			1011	3690		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.1735	1.182	1010	0.591		3.154864	8		20			1011	3702		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.2135	0.346	1006	0.173		3.154864	8		27			1007	3718		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	229.9146	0.794	1002	0.397		3.210205	9		21			1003	3765		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0264	0.510	1010	0.510		3.210205	8		24			1011	3738		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0400	1.197	1002	0.598		3.211617	8		25			1003	3797		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0726	0.425	1010	0.425		3.210205	8		27			1011	3750		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0737	1.121	1002	0.560		3.210205	8		24			1003	3729		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0845	0.558	1006	0.558		3.210205	9		16			1007	3736		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.0863	0.321	1010	0.321		3.210205	8		26			1011	3737		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1162	0.649	1012	0.324		3.210205	8		25			1013	3766		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1238	0.341	1004	0.341		3.210205	8		21			1005	3767		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1347	0.941	1008	0.471		3.211617	9		28			1009	3793		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1438	0.953	1010	0.477		3.210205	8		26			1011	3746		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1465	0.415	1010	0.207		3.211617	8		33			1011	3778		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1552	0.534	1010	0.267		3.211617	8		26			1011	3777		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1857	0.470	1004	0.470		3.211617	8		26			1005	3795		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.1980	0.950	1004	0.475		3.211617	9		23			1005	3773		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2012	1.002	1006	0.501		3.210205	8		30			1007	3733		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2160	0.392	1006	0.196		3.210205	9		24			1007	3745		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2175	0.311	1002	0.156		3.210205	9		33			1003	3739		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2248	0.459	1004	0.459		3.210205	9		27			1005	3740		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2257	0.391	1002	0.391		3.211617	8		27			1003	3791		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2282	0.441	1002	0.221		3.210205	8		21			1003	3755		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2330	0.527	1002	0.263		3.210205	8		27			1003	3757		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2335	0.177	1002	0.177		3.210205	8		22			1003	3763		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2352	0.717	1010	0.359		3.211617	8		26			1011	3798		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2523	0.535	1010	0.535		3.211617	8		25			1011	3776		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2616	0.496	1006	0.496		3.210205	9		24			1007	3735		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2654	0.244	1010	0.244		3.211617	8		30			1011	3786		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2789	0.568	1010	0.284		3.210205	8		20			1011	3730		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.2882	0.183	1006	0.183		3.211617	9		29			1007	3788		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3126	0.402	1002	0.402		3.210205	9		26			1003	3743		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3147	0.181	1010	0.181		3.211617	8		31			1011	3783		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3205	0.337	1010	0.169		3.211617	8		26			1011	3794		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3336	0.205	1010	0.205		3.210205	9		24			1011	3753		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3360	0.525	1010	0.525		3.211617	9		28			1011	3789		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3462	0.552	1010	0.552		3.211617	9		19			1011	3792		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3487	0.274	1006	0.274		3.210205	8		20			1007	3744		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3559	0.906	1010	0.453		3.210205	8		20			1011	3756		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3589	0.371	1010	0.186		3.210205	8		29			1011	3731		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3763	0.402	1010	0.402		3.210205	8		24			1011	3761		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3806	0.153	1006	0.153		3.210205	9		28			1007	3748		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.3960	0.470	1006	0.470		3.211617	8		22			1007	3784		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4086	0.383	1006	0.383		3.211617	8		25			1007	3785		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4088	0.452	1008	0.452		3.211617	8		28			1009	3779		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4104	0.817	1010	0.409		3.210205	8		25			1011	3749		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4129	0.407	1002	0.407		3.236456	8		23			1003	3849		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4170	0.336	1010	0.336		3.211617	9		24			1011	3780		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4213	0.695	1006	0.348		3.211617	8		26			1007	3799		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4292	0.962	1012	0.481		3.211617	8		31			1013	3772		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4316	0.389	1006	0.389		3.210205	9		22			1007	3764		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4431	0.952	1002	0.476		3.210205	9		29			1003	3769		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4475	0.151	1006	0.151		3.211617	8		21			1007	3770		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4476	0.356	1010	0.178		3.210205	8		20			1011	3768		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4617	0.476	1002	0.476		3.210205	8		21			1003	3742		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4631	1.121	1012	0.561		3.211617	8		28			1013	3771		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4764	0.170	1006	0.170		3.210205	8		26			1007	3734		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.4969	1.055	1008	0.528		3.236456	8		26			1009	3829		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.5013	0.788	1006	0.394		3.211617	8		22			1007	3787		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.5456	0.407	1010	0.204		3.211617	8		21			1011	3774		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.6066	1.090	1012	0.545		3.211617	8		23			1013	3796		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.6770	0.224	1004	0.224		3.211617	8		22			1005	3790		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.6806	0.327	1010	0.327		3.236456	9		29			1011	3851		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.7916	0.265	1004	0.265		3.236456	9		19			1005	3839		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.7925	0.220	1006	0.220		3.236456	8		18			1007	3830		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.7927	0.556	1008	0.556		3.236456	8		21			1009	3848		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8039	0.364	1006	0.364		3.236456	8		26			1007	3803		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8224	0.427	1004	0.214		3.236456	8		32			1005	3822		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8232	0.395	1002	0.395		3.236456	8		29			1003	3824		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8265	0.179	1010	0.179		3.236456	8		24			1011	3845		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8462	0.572	1006	0.286		3.236456	8		20			1007	3844		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8511	0.355	1004	0.177		3.236456	9		28			1005	3800		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8689	0.483	1006	0.483		3.236456	8		28			1007	3852		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8713	0.415	1010	0.415		3.236456	9		25			1011	3828		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8717	0.394	1010	0.394		3.210205	8		27			1011	3732		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8767	0.305	1002	0.305		3.236456	8		23			1003	3807		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.8849	0.848	1010	0.424		3.236456	8		22			1011	3814		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9014	0.444	1010	0.444		3.236456	9		26			1011	3813		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9051	0.568	1006	0.568		3.236456	8		26			1007	3831		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9339	0.347	1010	0.347		3.211617	8		21			1011	3781		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9356	0.504	1002	0.504		3.236456	8		23			1003	3850		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9390	0.451	1010	0.226		3.236456	9		28			1011	3802		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9391	1.069	1002	0.535		3.236456	9		26			1003	3838		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9523	0.329	1010	0.329		3.236456	9		22			1011	3820		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9852	0.507	1008	0.254		3.236456	8		28			1009	3825		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	230.9994	0.533	1010	0.533		3.236456	8		30			1011	3836		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0177	0.846	1004	0.423		3.236456	8		20			1005	3806		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0374	0.217	1010	0.217		3.236456	8		24			1011	3818		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0455	0.588	1002	0.588		3.260356	8		28			1003	3873		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0462	0.586	1012	0.293		3.236456	8		27			1013	3841		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0611	0.170	1010	0.170		3.236456	8		26			1011	3805		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0777	0.543	1010	0.543		3.236456	8		26			1011	3834		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0870	0.197	1006	0.197		3.260356	9		17			1007	3871		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.0934	0.727	1010	0.363		3.236456	9		25			1011	3837		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1014	0.499	1008	0.499		3.236456	8		25			1009	3812		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1017	0.421	1006	0.421		3.236456	8		20			1007	3811		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1146	0.544	1002	0.544		3.236456	9		30			1003	3842		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1197	0.398	1012	0.199		3.236456	8		24			1013	3808		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1529	0.250	1004	0.250		3.269509	8		22			1005	3906		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1609	0.365	1006	0.365		3.236456	8		28			1007	3832		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1656	0.643	1012	0.322		3.236456	8		17			1013	3846		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1678	0.238	1004	0.238		3.236456	9		23			1005	3826		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1707	0.925	1010	0.463		3.260356	8		30			1011	3875		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1727	0.532	1010	0.532		3.236456	8		24			1011	3801		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1821	0.496	1002	0.248		3.236456	8		28			1003	3827		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1845	0.418	1006	0.209		3.236456	9		31			1007	3810		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.1877	0.222	1010	0.222		3.236456	8		23			1011	3833		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2166	0.164	1006	0.164		3.236456	8		24			1007	3835		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2273	0.331	1012	0.166		3.236456	9		23			1013	3819		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2389	0.969	1010	0.484		3.269509	8		20			1011	3952		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2454	1.198	1010	0.599		3.260356	8		31			1011	3856		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2474	0.223	1010	0.223		3.236456	9		19			1011	3840		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2684	0.491	1006	0.491		3.236456	8		30			1007	3816		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.2709	0.253	1008	0.253		3.260356	9		30			1009	3858		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.3235	0.163	1002	0.163		3.260356	9		28			1003	3884		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.3585	0.872	1002	0.436		3.269509	8		27			1003	3945		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.3794	0.343	1010	0.343		3.236456	9		25			1011	3823		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.3931	0.398	1004	0.398		3.260356	8		22			1005	3903		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4010	0.238	1008	0.238		3.260356	8		28			1009	3859		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4239	0.415	1006	0.208		3.260356	9		24			1007	3890		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4391	0.530	1010	0.530		3.260356	9		28			1011	3877		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4598	0.274	1010	0.274		3.260356	8		20			1011	3899		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4638	0.525	1010	0.262		3.269509	8		18			1011	3947		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4831	0.492	1006	0.492		3.260356	8		20			1007	3867		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.4869	0.699	1004	0.350		3.269509	8		22			1005	3948		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5007	0.352	1002	0.352		3.260356	8		23			1003	3863		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5055	0.591	1004	0.591		3.260356	9		24			1005	3887		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5075	0.422	1010	0.422		3.260356	8		26			1011	3864		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5170	0.216	1004	0.216		3.269509	9		30			1005	3923		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5177	0.320	1002	0.320		3.236456	8		26			1003	3821		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5398	0.163	1006	0.163		3.260356	8		21			1007	3889		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5418	0.691	1002	0.346		3.269509	8		29			1003	3957		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5534	0.976	1006	0.488		3.260356	8		21			1007	3874		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5619	0.906	1012	0.453		3.260356	8		28			1013	3904		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5665	0.515	1008	0.515		3.269509	9		21			1009	3954		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5697	0.879	1012	0.440		3.260356	8		20			1013	3872		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5715	0.540	1008	0.540		3.260356	9		22			1009	3885		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5857	0.363	1010	0.363		3.260356	8		31			1011	3861		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5917	0.460	1010	0.460		3.260356	8		21			1011	3880		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.5993	0.393	1004	0.393		3.269509	8		29			1005	3955		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6000	0.493	1002	0.246		3.260356	8		21			1003	3878		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6149	1.141	1006	0.570		3.260356	8		26			1007	3902		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6188	0.555	1006	0.555		3.260356	9		26			1007	3901		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6230	0.359	1010	0.180		3.269509	8		24			1011	3917		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6256	0.243	1010	0.243		3.260356	9		21			1011	3893		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6268	0.483	1010	0.241		3.269509	9		26			1011	3914		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6278	0.330	1010	0.330		3.269509	8		20			1011	3909		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6406	0.712	1002	0.356		3.269509	8		28			1003	3919		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6605	0.158	1002	0.158		3.260356	8		27			1003	3860		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6652	0.328	1006	0.328		3.260356	8		21			1007	3881		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6718	0.268	1002	0.268		3.260356	9		26			1003	3879		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6728	0.238	1002	0.238		3.269509	8		28			1003	3933		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6823	0.481	1010	0.481		3.260356	8		26			1011	3870		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6886	0.975	1006	0.488		3.269509	8		23			1007	3912		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.6921	0.623	1008	0.312		3.260356	9		29			1009	3854		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7003	0.951	1008	0.476		3.260356	8		19			1009	3883		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7047	0.433	1006	0.433		3.269509	8		22			1007	3911		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7185	0.592	1006	0.296		3.260356	8		26			1007	3855		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7392	0.400	1006	0.200		3.269509	9		30			1007	3936		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7399	0.350	1006	0.350		3.260356	8		22			1007	3853		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7467	0.390	1006	0.390		3.269509	9		25			1007	3929		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7629	0.405	1006	0.405		3.269509	8		21			1007	3916		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7660	1.108	1006	0.554		3.260356	8		20			1007	3900		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7662	0.249	1006	0.249		3.269509	8		29			1007	3934		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7664	0.393	1004	0.393		3.236456	8		22			1005	3847		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7672	0.494	1008	0.494		3.269509	8		23			1009	3941		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7836	0.337	1008	0.337		3.260356	8		15			1009	3868		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7856	0.949	1004	0.474		3.269509	9		27			1005	3907		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.7877	0.161	1004	0.161		3.260356	8		19			1005	3898		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8001	0.164	1010	0.164		3.269509	8		25			1011	3928		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8106	0.498	1006	0.498		3.269509	9		28			1007	3905		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8128	0.282	1006	0.282		3.269509	8		22			1007	3927		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8150	0.363	1008	0.363		3.269509	9		26			1009	3932		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8151	0.378	1008	0.378		3.269509	8		25			1009	3922		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8164	0.513	1012	0.257		3.260356	8		23			1013	3896		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8192	0.700	1002	0.350		3.269509	9		25			1003	3953		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8354	0.206	1010	0.206		3.269509	8		30			1011	3944		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8397	0.436	1002	0.218		3.269509	8		27			1003	3949		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8767	1.048	1004	0.524		3.269509	8		26			1005	3938		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8806	0.581	1010	0.581		3.269509	9		26			1011	3935		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.8911	0.371	1006	0.185		3.269509	8		23			1007	3950		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9120	0.432	1010	0.432		3.269509	9		18			1011	3921		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9169	1.136	1006	0.568		3.269509	9		26			1007	3908		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9305	0.215	1006	0.215		3.269509	8		24			1007	3930		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9360	0.883	1006	0.442		3.269509	8		28			1007	3918		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9443	0.439	1010	0.439		3.269509	8		27			1011	3920		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9521	0.399	1008	0.399		3.260356	8		24			1009	3876		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9552	0.260	1006	0.260		3.260356	8		18			1007	3869		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	231.9591	0.199	1010	0.199		3.260356	8		27			1011	3882		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.0033	0.681	1010	0.340		3.269509	9		20			1011	3943		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.0332	0.300	1004	0.300		3.269509	8		28			1005	3925		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.0827	0.375	1006	0.188		3.269509	8		27			1007	3942		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.0834	1.116	1002	0.558		3.269509	8		24			1003	3926		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.0867	1.041	1006	0.521		3.269509	8		19			1007	3939		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.1188	0.494	1006	0.494		3.269509	9		25			1007	3937		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.1786	0.290	1010	0.290		3.269509	9		27			1011	3940		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.1861	0.478	1008	0.239		3.260356	8		21			1009	3891		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.3068	0.331	1006	0.166		3.269509	9		22			1007	3946		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.3353	0.529	1010	0.265		3.269509	8		23			1011	3931		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.4136	0.349	1010	0.349		3.311778	9		28			1011	3971		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.4395	0.279	1010	0.279		3.269509	8		28			1011	3924		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.5903	0.519	1010	0.519		3.311778	9		30			1011	3959		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.6249	0.281	1006	0.281		3.311778	8		25			1007	3987		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.6532	0.429	1006	0.429		3.311778	9		24			1007	3963		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.6615	0.254	1002	0.254		3.311778	8		30			1003	3968		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.7331	1.071	1012	0.536		3.311778	9		20			1013	3981		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.7585	0.502	1010	0.502		3.311778	8		24			1011	3967		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.7680	0.906	1004	0.453		3.311778	8		21			1005	3973		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.8088	0.388	1006	0.194		3.311778	9		23			1007	3983		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.8571	0.624	1010	0.312		3.311778	9		22			1011	3960		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.8822	0.296	1010	0.296		3.311778	9		33			1011	3974		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.8848	0.261	1008	0.261		3.311778	9		28			1009	3980		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.8868	0.578	1006	0.289		3.311778	8		21			1007	3965		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9074	0.572	1006	0.286		3.311778	9		26			1007	3978		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9156	0.329	1010	0.329		3.311778	8		17			1011	3976		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9158	0.645	1006	0.322		3.311778	9		23			1007	3977		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9672	0.566	1012	0.283		3.311778	8		26			1013	3969		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9926	0.337	1010	0.337		3.338111	9		22			1011	4007		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	232.9936	0.853	1008	0.427		3.311778	9		23			1009	3984		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.0090	0.548	1010	0.548		3.311778	8		22			1011	3966		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.0093	0.220	1010	0.220		3.311778	8		23			1011	3986		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.0560	0.574	1002	0.574		3.311778	9		27			1003	3962		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.0700	0.445	1002	0.445		3.311778	8		24			1003	3970		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.0902	0.530	1012	0.265		3.311778	8		22			1013	3964		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.1373	0.358	1010	0.179		3.311778	8		26			1011	3972		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.1572	0.368	1010	0.368		3.311778	9		27			1011	3985		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.2494	0.356	1008	0.356		3.311778	9		24			1009	3958		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.3754	0.463	1006	0.463		3.338111	9		22			1007	3988		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.3761	0.828	1010	0.414		3.338111	9		31			1011	4003		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.3879	0.452	1010	0.452		3.311778	9		26			1011	3979		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.4212	0.402	1010	0.402		3.338111	9		27			1011	4004		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.5228	0.321	1010	0.161		3.338111	8		23			1011	4005		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.5318	0.381	1004	0.381		3.338111	8		27			1005	4001		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.5326	0.501	1004	0.501		3.338111	8		28			1005	4011		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.5570	0.325	1002	0.162		3.311778	8		24			1003	3975		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.5946	0.487	1010	0.487		3.338111	9		25			1011	3991		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.6371	0.359	1004	0.359		3.338111	8		24			1005	3998		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.6602	0.470	1010	0.470		3.338111	8		27			1011	3999		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.6604	0.477	1004	0.477		3.338111	8		22			1005	4010		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.6755	0.234	1004	0.234		3.338111	9		31			1005	4002		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.6943	0.465	1006	0.465		3.338111	8		13			1007	3992		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.7176	0.151	1010	0.151		3.338111	8		24			1011	4000		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.7310	0.766	1004	0.383		3.338111	9		23			1005	4006		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.7631	0.512	1006	0.512		3.338111	8		21			1007	3994		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.7654	0.443	1010	0.443		3.338111	8		30			1011	3995		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.8573	1.042	1012	0.521		3.338111	8		18			1013	3997		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.8996	0.742	1010	0.371		3.338111	8		22			1011	4008		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.9347	0.795	1012	0.398		3.338111	9		24			1013	3989		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	233.9669	0.225	1006	0.225		3.338111	9		24			1007	3996		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	234.3190	0.639	1012	0.319		3.338111	8		24			1013	3990		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	235.7405	0.538	1010	0.538		3.439137	8		28			1011	4016		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	235.8592	0.256	1010	0.256		3.439137	8		19			1011	4046		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	235.9726	0.593	1010	0.593		3.439137	9		28			1011	4030		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	235.9921	0.788	1012	0.394		3.439137	8		18			1013	4048		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0447	0.395	1008	0.198		3.439137	8		23			1009	4024		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0534	0.434	1012	0.217		3.439137	8		21			1013	4027		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0640	0.321	1008	0.161		3.439137	8		30			1009	4041		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0925	0.227	1008	0.227		3.439137	8		22			1009	4039		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0941	0.410	1010	0.205		3.439137	9		24			1011	4019		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.0952	0.207	1010	0.207		3.439137	9		30			1011	4018		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.1101	0.885	1012	0.443		3.439137	8		21			1013	4034		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.1118	0.241	1010	0.241		3.439137	8		29			1011	4044		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.1734	0.502	1010	0.251		3.439137	8		21			1011	4035		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2237	0.315	1002	0.158		3.439137	9		23			1003	4037		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2288	0.237	1004	0.237		3.439137	8		25			1005	4013		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2306	0.241	1006	0.241		3.439137	9		23			1007	4020		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2348	1.000	1012	0.500		3.439137	8		27			1013	4028		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2684	0.476	1012	0.238		3.439137	8		26			1013	4022		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2821	1.139	1010	0.569		3.439137	8		26			1011	4031		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2984	0.354	1006	0.354		3.439137	8		26			1007	4014		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.2997	1.058	1004	0.529		3.439137	8		20			1005	4032		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3065	0.338	1010	0.338		3.439137	9		25			1011	4052		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3270	0.319	1006	0.319		3.439137	8		17			1007	4047		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3378	0.447	1004	0.447		3.439137	9		25			1005	4043		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3384	1.125	1006	0.563		3.439137	8		18			1007	4050		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3488	0.525	1006	0.525		3.439137	8		25			1007	4021		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3550	0.339	1010	0.170		3.439137	9		27			1011	4025		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3723	0.928	1012	0.464		3.439137	9		24			1013	4017		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.3818	0.493	1006	0.493		3.439137	8		22			1007	4051		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.4355	0.308	1004	0.154		3.439137	9		19			1005	4053		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.4605	0.871	1008	0.435		3.439137	9		22			1009	4015		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.4637	0.908	1010	0.454		3.439137	9		27			1011	4036		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.5062	0.712	1012	0.356		3.439137	8		30			1013	4026		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.5608	0.941	1012	0.470		3.439137	8		23			1013	4012		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.6692	0.980	1010	0.490		3.439137	8		29			1011	4040		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	236.8508	0.268	1010	0.268		3.439137	8		20			1011	4038		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.0254	0.910	1008	0.455		3.489113	9		26			1009	4083		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.0600	0.866	1010	0.433		3.489113	9		25			1011	4072		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.1304	0.461	1006	0.461		3.489113	8		24			1007	4066		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.2906	0.354	1004	0.354		3.489113	9		32			1005	4077		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.3147	0.393	1004	0.393		3.489113	8		28			1005	4063		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.3296	1.200	1004	0.600		3.489113	9		22			1005	4068		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.3310	0.235	1008	0.235		3.489113	8		23			1009	4071		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.3605	1.071	1010	0.535		3.489113	8		22			1011	4073		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4364	0.320	1010	0.320		3.489113	8		24			1011	4086		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4386	0.611	1006	0.306		3.489113	8		28			1007	4085		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4466	0.458	1006	0.458		3.489113	8		24			1007	4056		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4466	0.237	1006	0.237		3.489113	8		25			1007	4076		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4694	0.373	1008	0.373		3.489113	8		28			1009	4059		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.4992	0.334	1004	0.334		3.489113	8		28			1005	4074		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5037	0.989	1010	0.495		3.489113	9		24			1011	4069		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5082	0.557	1008	0.279		3.489113	9		23			1009	4065		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5538	0.219	1006	0.219		3.489113	8		29			1007	4081		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5602	0.486	1008	0.486		3.489113	8		27			1009	4084		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5617	0.536	1008	0.268		3.489113	8		20			1009	4078		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.5892	0.447	1006	0.447		3.489113	9		22			1007	4055		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.6094	0.281	1008	0.281		3.489113	9		22			1009	4079		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.6411	0.534	1010	0.534		3.489113	8		27			1011	4060		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.6541	0.997	1006	0.498		3.489113	8		24			1007	4080		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.6630	0.493	1012	0.246		3.489113	8		29			1013	4082		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.7173	0.224	1010	0.224		3.489113	8		22			1011	4061		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.7335	0.635	1010	0.318		3.489113	8		21			1011	4087		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.7748	0.590	1012	0.295		3.489113	8		27			1013	4067		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.7765	0.412	1008	0.412		3.489113	8		29			1009	4064		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.8312	0.608	1004	0.304		3.489113	9		25			1005	4075		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.9058	0.549	1010	0.549		3.489113	8		23			1011	4057		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	237.9462	0.427	1006	0.427		3.489113	9		30			1007	4054		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	238.0018	0.602	1006	0.301		3.489113	9		22			1007	4070		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	238.1718	0.727	1010	0.364		3.489113	9		22			1011	4058		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	239.9288	0.560	1010	0.560		3.596777	8		24			1011	4108		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	239.9932	0.501	1004	0.251		3.596777	8		25			1005	4095		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.0145	0.304	1008	0.304		3.596777	9		26			1009	4096		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.0406	0.484	1008	0.484		3.596777	8		25			1009	4124		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.0935	0.721	1012	0.361		3.596777	8		29			1013	4100		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.1486	0.769	1006	0.384		3.596777	8		25			1007	4128		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.1855	0.196	1008	0.196		3.596777	8		23			1009	4091		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2005	0.427	1012	0.214		3.596777	8		27			1013	4123		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2039	0.840	1004	0.420		3.596777	9		24			1005	4116		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2139	0.484	1002	0.242		3.596777	9		23			1003	4114		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2176	0.317	1006	0.317		3.596777	8		22			1007	4104		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2278	0.929	1010	0.464		3.596777	8		19			1011	4121		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2322	0.572	1010	0.572		3.596777	8		29			1011	4113		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2476	0.835	1012	0.418		3.596777	8		22			1013	4106		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2516	0.386	1006	0.386		3.596777	9		22			1007	4120		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2690	0.368	1012	0.184		3.596777	8		28			1013	4094		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2819	0.439	1012	0.220		3.596777	9		29			1013	4105		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.2911	0.250	1010	0.250		3.596777	8		30			1011	4111		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.3066	0.998	1006	0.499		3.596777	8		25			1007	4126		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.3290	0.581	1006	0.581		3.596777	9		25			1007	4092		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.3445	0.206	1006	0.206		3.596777	9		24			1007	4129		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.3640	0.342	1006	0.171		3.596777	8		24			1007	4115		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4058	0.927	1006	0.464		3.596777	9		24			1007	4119		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4166	0.802	1010	0.401		3.596777	8		24			1011	4088		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4217	0.557	1002	0.557		3.596777	8		24			1003	4118		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4293	0.772	1012	0.386		3.596777	8		22			1013	4117		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4373	0.297	1002	0.297		3.596777	8		22			1003	4130		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4446	0.442	1002	0.442		3.596777	9		23			1003	4098		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4652	0.313	1010	0.313		3.596777	8		30			1011	4103		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4782	0.549	1006	0.549		3.596777	9		25			1007	4101		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.4949	0.844	1006	0.422		3.596777	8		23			1007	4093		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.5202	0.283	1006	0.283		3.596777	8		19			1007	4125		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.5462	0.562	1006	0.562		3.596777	8		25			1007	4109		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.6734	0.513	1010	0.513		3.596777	8		26			1011	4089		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.8256	0.451	1004	0.451		3.596777	8		26			1005	4090		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.8399	1.096	1006	0.548		3.596777	8		28			1007	4097		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.8776	1.009	1010	0.505		3.596777	8		22			1011	4122		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.8917	0.410	1006	0.410		3.622248	9		21			1007	4135		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.9274	0.597	1010	0.298		3.622248	9		27			1011	4132		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.9523	0.588	1010	0.294		3.622248	9		21			1011	4139		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.9786	0.512	1008	0.512		3.622248	8		22			1009	4137		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	240.9935	0.872	1010	0.436		3.622248	9		21			1011	4136		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.0269	0.528	1012	0.264		3.622248	9		23			1013	4131		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.0490	0.714	1002	0.357		3.622248	8		26			1003	4133		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.0748	0.369	1010	0.369		3.622248	8		25			1011	4134		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.2439	0.321	1006	0.321		3.622248	9		22			1007	4138		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.5808	0.717	1012	0.359		3.664529	9		29			1013	4152		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.6010	0.549	1010	0.549		3.664529	9		21			1011	4153		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.6864	0.351	1004	0.351		3.664529	9		24			1005	4148		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.7129	0.582	1010	0.582		3.664529	8		19			1011	4140		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8056	0.533	1002	0.533		3.664529	9		26			1003	4147		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8191	0.622	1006	0.311		3.664529	8		26			1007	4173		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8567	0.683	1006	0.341		3.664529	8		24			1007	4170		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8679	1.182	1006	0.591		3.664529	9		19			1007	4160		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8709	0.543	1012	0.272		3.664529	9		24			1013	4144		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.8918	0.545	1010	0.273		3.664529	8		25			1011	4166		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9238	1.026	1006	0.513		3.664529	8		26			1007	4145		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9471	0.562	1010	0.562		3.664529	8		23			1011	4167		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9489	0.573	1002	0.286		3.664529	8		26			1003	4149		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9541	0.309	1006	0.309		3.664529	9		24			1007	4141		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9580	0.705	1004	0.352		3.664529	8		21			1005	4163		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9619	0.314	1010	0.314		3.664529	8		25			1011	4154		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9831	0.496	1010	0.496		3.664529	8		24			1011	4158		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	241.9971	0.552	1004	0.552		3.664529	8		22			1005	4180		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0121	0.488	1012	0.244		3.664529	8		32			1013	4155		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0279	0.389	1010	0.389		3.664529	9		21			1011	4168		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0294	0.444	1002	0.444		3.664529	9		27			1003	4178		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0480	0.236	1010	0.236		3.664529	8		23			1011	4143		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0583	0.322	1006	0.322		3.664529	9		23			1007	4142		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0725	0.816	1010	0.408		3.678047	8		24			1011	4200		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0819	1.020	1008	0.510		3.664529	9		26			1009	4159		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0820	0.639	1004	0.319		3.664529	8		21			1005	4182		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0876	0.416	1006	0.208		3.664529	8		23			1007	4169		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.0986	1.035	1010	0.518		3.664529	9		21			1011	4150		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1026	0.508	1004	0.508		3.664529	8		30			1005	4176		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1158	0.461	1010	0.461		3.664529	8		30			1011	4157		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1270	1.077	1010	0.539		3.664529	8		21			1011	4162		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1369	0.455	1006	0.455		3.678047	9		22			1007	4215		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1417	0.735	1010	0.368		3.678047	8		26			1011	4203		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1423	0.158	1008	0.158		3.664529	8		22			1009	4161		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1464	0.607	1012	0.303		3.664529	9		33			1013	4174		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1639	0.854	1006	0.427		3.678047	8		23			1007	4221		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1727	0.536	1004	0.268		3.664529	8		22			1005	4164		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1757	0.532	1002	0.532		3.678047	8		21			1003	4188		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1762	0.211	1006	0.211		3.678047	8		25			1007	4190		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.1904	1.119	1012	0.560		3.678047	8		23			1013	4191		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2042	0.436	1002	0.218		3.678047	8		30			1003	4195		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2080	0.444	1010	0.444		3.664529	9		22			1011	4179		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2170	0.412	1012	0.206		3.678047	9		25			1013	4213		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2194	0.322	1010	0.322		3.664529	8		26			1011	4172		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2290	0.297	1010	0.297		3.664529	8		21			1011	4175		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2414	0.184	1006	0.184		3.664529	8		21			1007	4156		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2623	0.281	1006	0.281		3.678047	8		26			1007	4202		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.2855	0.381	1006	0.381		3.678047	9		20			1007	4222		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.3302	0.593	1012	0.296		3.664529	8		26			1013	4146		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.3457	0.372	1006	0.372		3.664529	9		22			1007	4171		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.3906	0.697	1002	0.348		3.678047	9		28			1003	4184		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4125	0.453	1012	0.226		3.678047	8		22			1013	4209		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4187	0.235	1010	0.235		3.678047	8		22			1011	4211		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4279	1.006	1010	0.503		3.678047	9		26			1011	4210		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4348	0.190	1010	0.190		3.678047	9		25			1011	4194		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4415	1.110	1002	0.555		3.678047	9		24			1003	4204		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4487	0.321	1002	0.321		3.678047	8		24			1003	4218		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4509	0.156	1006	0.156		3.678047	8		27			1007	4205		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4828	0.166	1010	0.166		3.678047	8		26			1011	4208		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.4875	0.466	1006	0.466		3.678047	8		27			1007	4220		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5147	0.569	1012	0.284		3.678047	9		23			1013	4193		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5168	0.329	1004	0.329		3.664529	9		24			1005	4165		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5325	0.687	1006	0.343		3.664529	9		26			1007	4177		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5408	0.318	1010	0.159		3.678047	9		27			1011	4197		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5622	0.608	1002	0.304		3.678047	8		25			1003	4199		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.5685	0.801	1006	0.400		3.678047	9		23			1007	4214		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.6074	0.519	1010	0.519		3.678047	8		25			1011	4207		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.6538	0.486	1006	0.486		3.664529	8		21			1007	4183		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.7499	0.624	1010	0.312		3.678047	8		25			1011	4185		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.7712	0.293	1002	0.293		3.678047	8		20			1003	4201		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.8161	1.134	1012	0.567		3.678047	9		20			1013	4219		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.8473	0.527	1010	0.527		3.678047	8		19			1011	4217		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.8579	0.463	1006	0.231		3.678047	8		23			1007	4212		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.8726	0.661	1012	0.330		3.678047	9		20			1013	4198		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.9489	0.981	1004	0.491		3.678047	8		25			1005	4192		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	242.9663	0.400	1004	0.400		3.678047	8		20			1005	4206		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.2527	1.068	1008	0.534		3.678047	9		22			1009	4187		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.5986	0.797	1010	0.399		3.732243	8		26			1011	4235		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.6221	1.113	1006	0.557		3.732243	8		25			1007	4245		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.6680	0.311	1010	0.156		3.732243	8		23			1011	4223		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.6811	0.808	1012	0.404		3.732243	9		24			1013	4238		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.6984	0.635	1012	0.317		3.732243	8		26			1013	4242		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.7014	0.405	1010	0.405		3.732243	8		27			1011	4253		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.7210	0.570	1006	0.570		3.732243	9		25			1007	4260		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.7446	0.324	1006	0.162		3.732243	9		22			1007	4236		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.7468	0.957	1012	0.478		3.732243	9		25			1013	4255		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.7949	0.188	1010	0.188		3.732243	8		27			1011	4240		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8033	0.193	1010	0.193		3.732243	8		24			1011	4250		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8085	0.583	1006	0.583		3.732243	9		21			1007	4247		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8385	0.231	1010	0.231		3.732243	8		25			1011	4259		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8421	0.376	1006	0.376		3.732243	8		24			1007	4229		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8432	0.505	1004	0.505		3.732243	8		28			1005	4225		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8696	0.706	1004	0.353		3.732243	8		21			1005	4231		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8715	1.079	1002	0.540		3.732243	8		21			1003	4237		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8722	0.634	1012	0.317		3.732243	9		24			1013	4239		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8744	0.334	1006	0.334		3.732243	8		21			1007	4251		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8805	0.854	1004	0.427		3.732243	8		27			1005	4244		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8875	0.879	1010	0.439		3.732243	8		24			1011	4258		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.8939	0.437	1012	0.219		3.732243	8		24			1013	4249		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.9047	0.483	1006	0.483		3.732243	8		26			1007	4224		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.9218	0.426	1008	0.426		3.732243	8		27			1009	4252		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.9758	0.868	1012	0.434		3.732243	8		19			1013	4228		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	243.9869	0.588	1006	0.588		3.732243	8		27			1007	4243		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.0079	1.089	1012	0.544		3.732243	9		24			1013	4234		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.0089	0.595	1006	0.595		3.732243	8		21			1007	4232		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.0370	1.119	1012	0.559		3.732243	9		27			1013	4248		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.1135	0.943	1010	0.471		3.732243	8		22			1011	4254		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.1174	0.306	1006	0.153		3.732243	8		22			1007	4233		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.1724	0.302	1010	0.302		3.732243	9		27			1011	4230		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.1918	0.682	1010	0.341		3.732243	9		23			1011	4241		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.2052	1.195	1004	0.597		3.732243	8		28			1005	4256		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.2135	0.265	1010	0.265		3.732243	8		26			1011	4257		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.3070	0.579	1010	0.289		3.732243	8		25			1011	4246		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.4264	0.420	1010	0.420		3.770752	8		27			1011	4301		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.4574	0.320	1006	0.320		3.770752	8		28			1007	4319		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.5230	0.205	1006	0.205		3.770752	9		26			1007	4286		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.5335	0.523	1006	0.262		3.770752	9		24			1007	4271		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.5660	0.160	1006	0.160		3.785033	8		24			1007	4348		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.5896	1.034	1008	0.517		3.770752	9		22			1009	4305		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.5981	0.490	1008	0.490		3.770752	8		21			1009	4315		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6229	0.958	1010	0.479		3.770752	8		25			1011	4281		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6290	1.153	1012	0.577		3.770752	8		23			1013	4285		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6379	0.431	1010	0.431		3.770752	8		24			1011	4264		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6522	0.894	1006	0.447		3.770752	9		24			1007	4298		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6647	0.305	1008	0.305		3.785033	9		24			1009	4326		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6811	0.661	1002	0.331		3.770752	9		25			1003	4272		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6813	1.041	1006	0.520		3.770752	9		24			1007	4270		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.6868	0.280	1006	0.280		3.770752	9		24			1007	4300		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.7488	1.159	1006	0.580		3.770752	9		24			1007	4288		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.7772	0.273	1004	0.273		3.770752	9		26			1005	4321		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.7805	0.585	1006	0.585		3.770752	8		24			1007	4292		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.7815	0.275	1010	0.275		3.770752	8		27			1011	4293		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.7928	0.439	1006	0.439		3.770752	8		26			1007	4274		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8052	0.404	1010	0.404		3.770752	8		23			1011	4277		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8071	0.643	1012	0.321		3.770752	8		27			1013	4303		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8115	0.799	1006	0.399		3.770752	8		26			1007	4265		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8250	0.312	1010	0.312		3.770752	9		22			1011	4268		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8255	0.441	1006	0.441		3.770752	9		22			1007	4269		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8343	0.293	1002	0.293		3.785033	8		22			1003	4345		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8381	0.970	1004	0.485		3.770752	8		23			1005	4296		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8466	1.152	1006	0.576		3.770752	8		24			1007	4278		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8544	0.390	1004	0.390		3.770752	9		25			1005	4276		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8576	0.597	1004	0.597		3.770752	9		26			1005	4262		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8627	0.664	1012	0.332		3.770752	9		21			1013	4302		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8753	0.226	1006	0.226		3.770752	8		28			1007	4283		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8773	1.150	1012	0.575		3.770752	8		24			1013	4314		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8913	0.561	1004	0.280		3.770752	9		20			1005	4294		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8963	0.408	1008	0.408		3.770752	8		22			1009	4289		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.8970	0.451	1010	0.226		3.770752	9		27			1011	4313		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9082	0.309	1004	0.309		3.770752	9		24			1005	4317		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9151	1.104	1006	0.552		3.770752	9		24			1007	4267		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9205	1.186	1012	0.593		3.770752	8		25			1013	4307		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9287	0.168	1006	0.168		3.770752	9		23			1007	4287		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9347	0.676	1002	0.338		3.785033	8		26			1003	4349		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9550	0.238	1006	0.238		3.770752	9		26			1007	4295		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9628	0.480	1002	0.480		3.770752	9		25			1003	4291		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9683	0.310	1002	0.310		3.770752	8		28			1003	4280		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9750	0.319	1006	0.319		3.785033	8		24			1007	4337		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9832	1.142	1010	0.571		3.770752	9		21			1011	4266		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	244.9994	0.479	1004	0.479		3.770752	8		23			1005	4310		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0012	0.340	1006	0.170		3.770752	9		22			1007	4309		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0077	0.421	1002	0.421		3.770752	9		25			1003	4261		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0094	0.277	1010	0.277		3.785033	8		24			1011	4346		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0127	0.288	1010	0.288		3.785033	9		20			1011	4323		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0361	0.671	1012	0.335		3.770752	8		23			1013	4275		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0483	0.303	1006	0.303		3.770752	8		21			1007	4316		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0649	0.424	1006	0.424		3.770752	8		24			1007	4306		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0869	0.621	1012	0.310		3.785033	8		25			1013	4324		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.0915	0.537	1002	0.537		3.770752	8		26			1003	4311		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1047	1.176	1004	0.588		3.785033	9		25			1005	4343		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1146	0.360	1006	0.180		3.785033	9		26			1007	4352		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1365	0.166	1002	0.166		3.785033	8		25			1003	4322		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1385	0.342	1006	0.342		3.785033	8		23			1007	4328		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1499	0.445	1004	0.445		3.770752	8		24			1005	4318		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1731	0.254	1010	0.254		3.785033	9		20			1011	4334		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1743	0.674	1010	0.337		3.770752	9		25			1011	4284		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.1768	0.841	1006	0.421		3.785033	9		26			1007	4350		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2011	1.102	1012	0.551		3.785033	8		24			1013	4331		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2028	0.274	1004	0.274		3.785033	8		25			1005	4335		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2116	0.222	1010	0.222		3.785033	9		23			1011	4336		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2455	0.151	1006	0.151		3.785033	8		27			1007	4329		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2634	0.886	1002	0.443		3.770752	9		24			1003	4308		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2700	0.914	1010	0.457		3.770752	8		25			1011	4282		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.2717	0.970	1006	0.485		3.785033	9		25			1007	4347		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.3127	0.355	1010	0.355		3.785033	8		23			1011	4340		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.3206	0.630	1006	0.315		3.785033	9		23			1007	4330		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.3399	0.265	1002	0.265		3.785033	8		19			1003	4354		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.3435	0.326	1010	0.326		3.770752	8		27			1011	4263		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.3626	0.591	1004	0.591		3.785033	9		30			1005	4353		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.4571	0.183	1006	0.183		3.785033	9		27			1007	4344		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.4601	0.902	1012	0.451		3.785033	9		22			1013	4351		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.4900	0.376	1006	0.376		3.819387	8		23			1007	4365		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.5321	0.449	1010	0.449		3.770752	9		22			1011	4299		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.5951	0.220	1006	0.220		3.819387	8		23			1007	4368		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.6913	0.193	1002	0.193		3.819387	8		26			1003	4393		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.7776	0.568	1006	0.568		3.819387	8		26			1007	4411		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.7937	0.497	1010	0.497		3.819387	8		29			1011	4361		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.8051	0.488	1010	0.488		3.819387	8		24			1011	4378		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.8545	1.078	1006	0.539		3.819387	9		25			1007	4385		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.8662	0.446	1010	0.446		3.819387	9		26			1011	4371		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.8808	0.534	1006	0.534		3.819387	8		21			1007	4362		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.8838	0.724	1012	0.362		3.819387	9		28			1013	4355		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9145	0.937	1012	0.468		3.819387	8		26			1013	4367		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9331	0.302	1012	0.151		3.819387	8		22			1013	4412		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9408	0.237	1006	0.237		3.819387	9		27			1007	4366		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9923	0.510	1006	0.510		3.819387	9		25			1007	4402		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9925	0.761	1012	0.380		3.819387	8		25			1013	4381		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9994	0.274	1006	0.274		3.819387	9		27			1007	4401		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	245.9996	0.585	1004	0.585		3.819387	8		23			1005	4386		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0047	0.344	1010	0.344		3.819387	9		26			1011	4388		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0258	0.269	1006	0.269		3.819387	9		23			1007	4389		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0456	0.379	1006	0.190		3.819387	8		22			1007	4379		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0460	0.230	1006	0.230		3.819387	9		26			1007	4372		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0647	0.188	1002	0.188		3.819387	9		25			1003	4406		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0679	0.450	1012	0.225		3.819387	8		23			1013	4396		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0790	0.497	1006	0.248		3.819387	8		23			1007	4363		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0831	0.271	1002	0.271		3.819387	8		25			1003	4380		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0859	0.369	1004	0.369		3.819387	9		27			1005	4390		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.0915	0.586	1002	0.586		3.819387	8		24			1003	4360		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1017	0.388	1010	0.388		3.819387	8		25			1011	4404		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1069	0.481	1010	0.481		3.819387	8		26			1011	4376		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1083	0.213	1010	0.213		3.819387	8		25			1011	4403		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1166	0.359	1006	0.359		3.819387	9		25			1007	4375		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1641	0.856	1006	0.428		3.819387	8		26			1007	4395		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.1786	0.482	1010	0.482		3.819387	9		22			1011	4374		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.2012	0.463	1006	0.463		3.819387	8		24			1007	4382		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.2307	0.542	1004	0.542		3.819387	9		26			1005	4400		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.2359	0.389	1008	0.389		3.819387	9		23			1009	4392		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.2695	0.810	1010	0.405		3.819387	9		25			1011	4383		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.2803	0.592	1006	0.592		3.819387	8		26			1007	4387		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.3100	0.718	1012	0.359		3.819387	8		23			1013	4358		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.3118	0.847	1008	0.424		3.819387	8		25			1009	4359		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.3241	0.398	1006	0.199		3.819387	8		23			1007	4397		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.3332	0.182	1010	0.182		3.819387	9		20			1011	4407		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.4015	0.363	1008	0.363		3.819387	9		22			1009	4357		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.4272	0.526	1010	0.526		3.819387	9		29			1011	4410		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.5451	0.319	1006	0.319		3.819387	8		23			1007	4373		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.5828	0.321	1002	0.321		3.819387	8		23			1003	4369		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.6589	0.172	1010	0.172		3.819387	8		23			1011	4399		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	246.9965	0.784	1010	0.392		3.819387	8		25			1011	4405		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	249.7602	0.356	1006	0.356		3.989022	8		25			1007	4415		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	249.7760	0.445	1002	0.445		3.989022	9		27			1003	4436		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	249.9856	1.009	1006	0.505		3.989022	8		23			1007	4448		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.1153	0.402	1010	0.201		3.989022	9		24			1011	4451		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.1277	0.175	1010	0.175		3.989022	8		25			1011	4434		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.1569	0.291	1002	0.291		3.989022	9		24			1003	4456		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.1910	0.733	1008	0.366		3.989022	9		24			1009	4413		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.1957	0.394	1002	0.394		3.989022	9		25			1003	4453		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.2142	0.803	1012	0.401		3.989022	8		22			1013	4440		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.2980	0.676	1006	0.338		3.989022	8		26			1007	4474		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.2995	0.264	1006	0.264		3.989022	9		28			1007	4430		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.3493	0.295	1010	0.295		3.989022	8		23			1011	4416		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.3726	1.068	1010	0.534		3.989022	9		25			1011	4476		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.3881	0.335	1010	0.335		3.989022	8		27			1011	4439		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.3905	0.977	1006	0.489		3.989022	9		25			1007	4414		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4247	0.218	1010	0.218		3.989022	9		23			1011	4417		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4297	0.385	1006	0.385		3.989022	9		23			1007	4423		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4453	0.483	1008	0.483		3.989022	9		25			1009	4460		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4463	0.240	1006	0.240		3.989022	9		26			1007	4459		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4561	0.735	1006	0.367		3.989022	8		24			1007	4429		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4585	0.676	1006	0.338		3.989022	9		24			1007	4422		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4634	0.489	1006	0.244		3.989022	9		23			1007	4484		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4672	0.841	1006	0.421		3.989022	9		27			1007	4469		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4697	0.475	1004	0.238		3.989022	8		27			1005	4477		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4703	0.342	1008	0.342		3.989022	9		24			1009	4471		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4749	0.775	1002	0.387		3.989022	8		20			1003	4467		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4871	0.378	1006	0.378		3.989022	9		25			1007	4425		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.4924	0.998	1006	0.499		3.989022	8		25			1007	4458		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.5287	0.544	1006	0.272		3.989022	8		25			1007	4419		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.5454	0.484	1010	0.484		3.989022	8		24			1011	4421		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.5503	0.598	1010	0.299		3.989022	9		23			1011	4427		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.5546	0.468	1010	0.468		3.989022	9		24			1011	4483		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.5650	1.004	1012	0.502		3.989022	9		24			1013	4420		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6204	0.489	1006	0.489		3.989022	9		24			1007	4444		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6356	0.581	1006	0.581		3.989022	8		24			1007	4428		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6362	0.207	1010	0.207		3.989022	9		28			1011	4442		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6373	0.248	1010	0.248		3.989022	9		24			1011	4473		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6573	0.226	1004	0.226		3.989022	8		24			1005	4481		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6763	0.262	1010	0.262		3.989022	9		28			1011	4466		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6865	0.362	1002	0.181		3.989022	8		24			1003	4426		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.6948	0.357	1010	0.357		3.989022	8		25			1011	4418		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7270	0.978	1012	0.489		3.989022	8		29			1013	4485		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7402	0.337	1012	0.168		3.989022	8		23			1013	4465		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7545	0.509	1012	0.255		3.989022	8		25			1013	4441		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7726	1.137	1012	0.569		3.989022	9		23			1013	4468		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7870	0.153	1004	0.153		3.989022	9		29			1005	4447		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.7874	0.222	1002	0.222		3.989022	8		23			1003	4457		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.8034	0.415	1010	0.415		3.989022	9		26			1011	4452		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.8060	1.085	1006	0.542		3.989022	8		25			1007	4446		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.8110	0.579	1006	0.579		3.989022	9		28			1007	4472		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.8907	0.896	1006	0.448		3.989022	8		23			1007	4464		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.8982	0.571	1010	0.571		3.989022	8		26			1011	4449		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	250.9299	0.706	1010	0.353		3.989022	8		26			1011	4445		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	251.0076	0.962	1012	0.481		3.989022	8		22			1013	4478		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	251.0308	0.364	1010	0.364		3.989022	8		25			1011	4433		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	251.0437	0.437	1006	0.437		3.989022	8		24			1007	4463		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	251.1289	0.259	1006	0.259		3.989022	9		29			1007	4480		3				1			5			20			147.0000		105.000		0.000		1
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata	env_leeway	 safety_buffer
i "Voce"	251.1461	0.356	1010	0.356		3.989022	9		23			1011	4450		3				1			5			20			147.0000		105.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
