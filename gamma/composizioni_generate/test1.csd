
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/test1.wav" -W ;-d -m0
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
f 0 45.81399453901159 ; Evento f fittizio per definire la durata totale
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


f 1000 0 4 -2 2 10 4 15
f 1001 0 4 -2 0 1 2 3
f 1002 0 4 -2 3 20 5 8
f 1003 0 4 -2 0 1 2 3



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Cluster"
; Inizio: 0.000s, Durata: 28.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9774	14.000	1002	14.000		3			6		19			1003	4		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0369	17.500	1002	14.000		3			3		48			1003	9		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0414	17.500	1000	14.000		1			8		32			1001	3		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0524	14.000	1002	14.000		3			8		32			1003	6		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0600	17.500	1000	14.000		3			9		41			1001	7		1				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0618	17.500	1002	14.000		3			3		34			1003	5		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0620	17.500	1002	14.000		1			8		43			1003	2		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0705	17.500	1000	14.000		3			7		39			1001	1		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0727	17.500	1002	14.000		1			8		15			1003	8		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7322	14.000	1002	14.000		3			2		15			1003	12		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7912	22.400	1000	14.000		3			8		35			1001	11		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.8358	14.000	1000	14.000		3			9		49			1001	10		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.6933	14.000	1002	14.000		1			9		49			1003	13		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7135	17.500	1000	14.000		3			2		28			1001	14		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7932	17.500	1000	14.000		3			2		47			1001	15		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.8236	14.000	1002	14.000		3			4		47			1003	16		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2882	17.500	1002	14.000		1			5		37			1003	21		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3172	22.400	1002	14.000		3			9		33			1003	20		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3419	17.500	1000	14.000		3			5		32			1001	17		1				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3444	14.000	1000	14.000		3			7		14			1001	18		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3539	17.500	1002	14.000		3			7		45			1003	19		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4923	14.000	1000	14.000		3			6		46			1001	23		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5172	17.500	1000	14.000		3			5		45			1001	27		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5181	17.500	1000	14.000		1			6		38			1001	30		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5377	14.000	1002	14.000		3			2		29			1003	25		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5538	22.400	1002	14.000		3			4		47			1003	24		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5548	14.000	1000	14.000		1			4		29			1001	26		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6023	17.500	1002	14.000		3			4		39			1003	29		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6379	14.000	1002	14.000		1			7		29			1003	28		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6783	14.000	1000	14.000		3			5		45			1001	22		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4388	14.000	1000	14.000		3			4		36			1001	33		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5254	14.000	1002	14.000		3			7		14			1003	32		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5403	17.500	1000	14.000		3			8		28			1001	37		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5409	22.400	1002	14.000		3			8		49			1003	36		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5426	17.500	1000	14.000		3			6		34			1001	39		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5597	17.500	1000	14.000		3			8		29			1001	31		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5752	22.400	1002	14.000		1			5		25			1003	34		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5863	14.000	1000	14.000		3			2		42			1001	35		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6260	14.000	1000	14.000		3			3		21			1001	38		1				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6936	22.400	1000	14.000		1			5		40			1001	40		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7080	17.500	1000	14.000		1			6		43			1001	41		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7413	17.500	1000	14.000		1			9		20			1001	42		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2618	14.000	1000	14.000		1			7		29			1001	43		1				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1461	14.000	1000	14.000		1			4		12			1001	46		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1836	17.500	1000	14.000		3			5		36			1001	49		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2170	22.400	1000	14.000		3			9		48			1001	48		0				1			5			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2976	17.500	1002	14.000		3			6		15			1003	47		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3001	14.000	1000	14.000		3			7		10			1001	44		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3154	14.000	1000	14.000		3			5		20			1001	45		0				1			3			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4140	22.400	1000	14.000		1			5		13			1001	50		0				1			5			20			0.0000		28.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
