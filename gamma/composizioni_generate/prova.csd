
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
f 0 45.58313794333051 ; Evento f fittizio per definire la durata totale
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
; impulso
f 24 0 4096 6 0 256 1 2304 0.001


f 1000 0 3 -2 1 2 3
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 2 3 5
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 3 4 2
f 1005 0 3 -2 0 1 0
f 1006 0 4 -2 3 20 5 8
f 1007 0 4 -2 0 1 2 3
f 1008 0 4 -2 2 10 4 15
f 1009 0 4 -2 0 1 2 3
f 1010 0 3 -2 6 8 10
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 7 9 12
f 1013 0 3 -2 0 1 2
f 1014 0 3 -2 8 12 8
f 1015 0 3 -2 0 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 35.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	3.028	1002	2.422		3			5		35			1003	2761		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.376	1012	2.376		3			3		4			1013	2751		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.754	1012	1.721		3			5		18			1013	2735		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	3.516	1012	2.197		3			3		8			1013	2813		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.152	1012	2.152		3			8		26			1013	2779		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.483	1012	1.987		3			4		47			1013	2758		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.396	1012	1.917		3			9		16			1013	2807		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.680	1012	1.675		3			9		1			1013	2772		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	12.085	1000	9.668		2			0		2			1001	2		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	3.285	1010	2.053		3			7		35			1011	2770		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.434	1014	2.434		3			5		30			1015	2764		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.510	1010	1.510		3			5		24			1011	2754		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.032	1012	1.270		3			0		28			1013	2781		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.700	1010	1.688		3			5		40			1011	2760		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.407	1012	1.504		3			9		49			1013	2805		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.013	1014	1.610		3			2		1			1015	2809		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.285	1010	1.285		3			0		46			1011	2763		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	3.609	1014	2.255		3			4		26			1015	2728		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.353	1010	1.470		3			6		7			1011	2787		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.736	1014	2.189		3			8		12			1015	2784		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.144	1014	1.716		3			2		31			1015	2796		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.838	1012	1.470		3			5		36			1013	2729		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.984	1012	1.984		3			5		13			1013	2774		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.286	1010	2.286		3			0		22			1011	2808		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.152	1012	1.345		3			7		44			1013	2727		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	14.674	1000	9.171		2			2		2			1001	1		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.285	1012	2.285		3			7		3			1013	2746		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.480	1014	1.984		3			3		7			1015	2740		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.394	1014	1.394		3			6		43			1015	2759		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.846	1010	2.276		3			3		2			1011	2752		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.567	1014	1.253		3			2		45			1015	2794		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.939	1012	1.551		3			5		9			1013	2811		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.815	1012	1.759		3			6		8			1013	2793		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.016	1014	2.016		3			7		42			1015	2812		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	1.982	1014	1.586		3			9		5			1015	2790		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.528	1012	2.023		3			0		26			1013	2806		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.735	1012	2.188		3			3		6			1013	2789		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.038	1012	1.630		3			4		12			1013	2792		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.705	1012	1.691		3			9		49			1013	2753		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.056	1002	2.056		3			5		45			1003	2804		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	2.296	1014	2.296		3			10		13			1015	2744		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0030	2.442	1010	1.526		3			5		5			1011	2757		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0030	2.400	1014	1.500		3			6		39			1015	2800		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0040	2.731	1010	2.185		3			6		32			1011	2739		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0042	2.406	1012	1.504		3			0		46			1013	2775		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0050	2.926	1010	1.829		3			9		46			1011	2734		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0062	3.816	1010	2.385		3			8		6			1011	2750		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0073	1.662	1014	1.662		3			6		23			1015	2777		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0093	1.270	1012	1.270		3			6		49			1013	2810		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0103	1.813	1010	1.451		3			0		40			1011	2745		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0107	1.688	1014	1.688		3			4		7			1015	2736		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0115	3.282	1014	2.051		3			3		30			1015	2801		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0133	1.386	1014	1.386		3			7		25			1015	2802		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0138	2.100	1010	1.680		3			6		36			1011	2762		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0153	2.426	1012	1.516		3			5		13			1013	2778		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0164	1.768	1014	1.768		3			6		13			1015	2737		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0176	1.906	1010	1.906		3			8		48			1011	2767		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0183	2.654	1010	2.124		3			5		9			1011	2768		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0184	2.227	1010	1.392		3			7		9			1011	2731		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0196	2.036	1012	1.272		3			5		45			1013	2769		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0196	1.656	1010	1.656		3			0		31			1011	2788		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0200	2.724	1010	2.179		3			3		7			1011	2747		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0205	3.054	1012	2.443		3			9		32			1013	2756		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0224	1.973	1014	1.579		3			5		42			1015	2785		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0231	2.692	1014	1.683		3			2		8			1015	2738		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0232	2.000	1010	1.600		3			0		32			1011	2730		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0236	3.927	1000	2.455		3			5		35			1001	2797		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0250	3.481	1012	2.176		3			6		14			1013	2795		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0262	2.304	1010	2.304		3			1		24			1011	2773		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0277	2.373	1012	1.899		3			2		39			1013	2748		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0293	1.670	1012	1.336		3			6		19			1013	2732		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0325	2.026	1010	1.266		3			1		21			1011	2782		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0337	2.072	1014	2.072		3			4		45			1015	2798		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0337	3.345	1010	2.091		3			7		37			1011	2741		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0365	2.123	1012	2.123		3			5		30			1013	2766		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0391	2.845	1012	2.276		3			8		10			1013	2725		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0392	1.896	1010	1.896		3			4		21			1011	2783		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0401	2.242	1010	2.242		3			8		41			1011	2776		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0448	1.682	1014	1.682		3			5		29			1015	2765		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0457	2.249	1010	2.249		3			7		27			1011	2742		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0562	2.241	1012	2.241		3			6		18			1013	2799		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0574	2.034	1012	2.034		3			8		43			1013	2780		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0578	2.930	1004	2.344		3			5		18			1005	2786		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0627	3.305	1014	2.066		3			5		43			1015	2743		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0634	1.803	1010	1.442		3			2		16			1011	2771		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0730	2.880	1012	2.304		3			4		7			1013	2726		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0858	2.377	1014	1.485		3			5		1			1015	2733		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0914	2.791	1012	2.232		3			8		10			1013	2791		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0970	1.972	1012	1.577		3			5		29			1013	2803		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0993	3.530	1012	2.206		3			4		19			1013	2755		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1023	2.252	1012	1.407		3			8		24			1013	2749		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1626	0.208	1014	0.166		4.0			8		41			1015	55		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1978	0.311	1012	0.195		4.0			7		43			1013	51		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1989	0.300	1010	0.188		4.0			7		10			1011	49		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2081	0.102	1010	0.102		4.0			8		24			1011	50		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2142	0.161	1012	0.161		4.0			8		2			1013	53		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2213	0.188	1010	0.118		4.0			8		20			1011	54		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2305	15.449	1004	9.656		4			2		2			1005	5		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2330	12.454	1004	7.784		2			0		1			1005	4		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2458	0.236	1014	0.148		4.0			7		22			1015	52		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2942	8.945	1002	8.945		2			2		1			1003	3		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8708	0.165	1010	0.132		4.0			7		22			1011	2310		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8833	0.238	1012	0.191		4.0			6		24			1013	2313		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8903	0.111	1014	0.069		4.0			7		24			1015	59		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9200	0.113	1012	0.091		4.0			8		35			1013	61		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9204	0.228	1010	0.143		4.0			7		29			1011	2311		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9220	0.281	1012	0.175		4.0			6		21			1013	2312		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9610	0.196	1010	0.196		4.0			8		25			1011	56		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9661	0.117	1010	0.117		4.0			7		33			1011	65		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9676	0.176	1012	0.110		4.0			7		35			1013	60		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9763	0.254	1012	0.159		4.0			7		13			1013	62		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9982	0.193	1012	0.154		4.0			8		36			1013	58		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0084	0.137	1010	0.110		4.0			8		26			1011	63		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0144	0.250	1012	0.156		4.0			7		40			1013	57		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0301	0.200	1014	0.125		4.0			8		50			1015	64		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0464	0.128	1012	0.103		4.0			7		7			1013	2318		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0517	0.171	1012	0.171		4.0			7		32			1013	2314		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0571	9.735	1000	7.788		2			0		1			1001	9		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0841	0.109	1010	0.087		4.0			7		20			1011	2315		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0866	0.111	1012	0.069		4.0			6		41			1013	2316		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0883	8.341	1004	8.341		2			1		1			1005	7		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0885	0.142	1012	0.142		4.0			7		30			1013	2319		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0994	0.204	1012	0.128		4.0			6		19			1013	2317		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1137	15.323	1004	9.577		3			1		2			1005	8		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1139	0.054	1012	0.054		4.0			6		28			1013	2323		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1520	0.177	1012	0.141		4.0			6		18			1013	2320		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1649	0.316	1014	0.198		4.0			6		28			1015	2322		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1708	14.078	1000	8.799		2			1		1			1001	6		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2083	0.137	1014	0.109		4.0			7		26			1015	2328		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2149	0.151	1014	0.151		4.0			6		12			1015	2325		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2188	0.202	1012	0.126		4.0			5		30			1013	2321		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2266	0.147	1012	0.092		4.0			7		27			1013	2327		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2787	0.108	1010	0.086		4.0			6		45			1011	2326		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2808	0.163	1012	0.102		4.0			7		33			1013	2324		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2863	0.203	1014	0.127		4.0			8		26			1015	71		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2878	0.169	1014	0.169		4.0			8		17			1015	68		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3165	0.145	1010	0.091		4.0			8		3			1011	70		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3201	0.161	1012	0.101		4.0			8		9			1013	74		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3244	0.143	1010	0.114		4.0			8		23			1011	72		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3294	0.094	1010	0.059		4.0			8		26			1011	69		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3465	0.176	1014	0.140		4.0			8		47			1015	66		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3493	0.069	1012	0.055		4.0			7		33			1013	67		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3767	0.145	1014	0.145		4.0			7		19			1015	73		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.5386	0.196	1012	0.157		4.0			7		17			1013	81		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6033	0.122	1010	0.098		4.0			7		23			1011	82		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6350	0.211	1010	0.169		4.0			7		20			1011	79		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6664	0.143	1010	0.143		4.0			7		28			1011	80		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6694	0.116	1012	0.093		4.0			8		10			1013	78		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6952	0.167	1012	0.105		4.0			7		31			1013	75		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.7141	0.221	1014	0.177		4.0			8		36			1015	77		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.7208	0.084	1014	0.053		4.0			7		11			1015	76		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.8190	0.210	1012	0.131		4.0			8		43			1013	85		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.8526	0.142	1014	0.113		4.0			7		7			1015	84		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9296	0.122	1010	0.097		4.0			8		28			1011	83		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9654	0.096	1010	0.096		4.0			8		15			1011	94		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9745	0.159	1012	0.099		4.0			7		19			1013	87		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0013	0.177	1014	0.177		4.0			8		35			1015	86		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0675	0.149	1012	0.093		4.0			8		45			1013	90		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0809	0.081	1012	0.081		4.0			8		19			1013	92		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0829	0.188	1010	0.150		4.0			7		37			1011	95		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0933	0.067	1010	0.067		4.0			7		38			1011	96		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.1014	0.086	1014	0.069		4.0			7		32			1015	88		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.1497	0.249	1012	0.199		4.0			7		21			1013	89		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.1572	0.170	1014	0.136		4.0			8		18			1015	91		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.1655	0.065	1012	0.065		4.0			6		31			1013	2329		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.1828	0.073	1014	0.073		4.0			6		36			1015	2331		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.2012	0.133	1012	0.083		4.0			8		42			1013	93		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.2293	0.055	1010	0.055		4.0			8		22			1011	101		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3023	0.098	1010	0.061		4.0			5		9			1011	2330		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3399	0.069	1010	0.069		4.0			7		20			1011	100		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3617	0.171	1010	0.171		4.0			8		19			1011	97		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3959	11.856	1000	9.485		2			2		2			1001	11		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4027	0.101	1014	0.101		4.0			8		36			1015	104		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4168	0.136	1010	0.109		4.0			7		44			1011	98		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4193	0.215	1012	0.172		4.0			8		27			1013	103		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4292	0.180	1014	0.144		4.0			8		17			1015	111		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4330	0.142	1014	0.142		4.0			8		17			1015	102		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4361	0.312	1010	0.195		4.0			8		15			1011	99		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4423	0.158	1012	0.126		4.0			7		33			1013	107		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5017	0.185	1014	0.116		4.0			8		43			1015	110		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5203	0.093	1012	0.093		4.0			7		16			1013	105		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5230	0.093	1010	0.075		4.0			7		24			1011	108		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5397	14.905	1000	9.316		2			2		3			1001	10		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5534	0.238	1010	0.190		4.0			7		36			1011	109		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5831	0.221	1014	0.138		4.0			7		35			1015	112		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.6293	0.285	1014	0.178		4.0			8		26			1015	106		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.6973	0.080	1010	0.080		4.0			6		50			1011	2333		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7317	0.112	1012	0.112		4.0			6		14			1013	2336		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7559	0.237	1014	0.148		4.0			8		4			1015	114		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7644	0.199	1014	0.199		4.0			5		7			1015	2335		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7656	0.139	1012	0.087		4.0			7		7			1013	115		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7766	0.061	1010	0.061		4.0			7		22			1011	116		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7957	0.096	1010	0.076		4.0			5		25			1011	2332		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8108	0.199	1010	0.199		4.0			8		29			1011	113		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8217	0.161	1014	0.101		4.0			6		23			1015	2334		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8259	0.215	1012	0.134		4.0			8		27			1013	118		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8374	0.239	1014	0.191		4.0			7		19			1015	117		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8829	0.117	1012	0.117		4.0			6		27			1013	2337		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1618	0.092	1010	0.092		4.0			5		20			1011	2339		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1876	0.192	1014	0.192		4.0			8		18			1015	128		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2101	0.276	1012	0.173		4.0			5		33			1013	2338		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2177	0.185	1014	0.148		4.0			5		22			1015	2349		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2233	0.202	1010	0.162		4.0			7		35			1011	2342		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2380	0.075	1014	0.060		4.0			6		32			1015	2347		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2387	0.114	1010	0.091		4.0			5		18			1011	2351		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2411	0.183	1010	0.183		4.0			5		25			1011	2341		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2452	0.189	1014	0.118		4.0			6		39			1015	2340		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2522	0.164	1014	0.164		4.0			6		33			1015	2343		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2559	0.180	1012	0.144		4.0			5		12			1013	2345		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2698	0.081	1012	0.081		4.0			6		29			1013	2346		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2826	0.136	1010	0.136		4.0			6		21			1011	2344		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3362	0.077	1010	0.077		4.0			7		16			1011	2350		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3399	0.153	1014	0.153		4.0			6		16			1015	2348		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3503	0.208	1014	0.166		4.0			7		13			1015	127		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3616	0.193	1012	0.193		4.0			8		32			1013	119		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3847	0.078	1014	0.062		4.0			7		26			1015	130		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3886	0.152	1012	0.122		4.0			8		26			1013	125		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4050	0.188	1010	0.150		4.0			7		1			1011	123		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4144	0.080	1012	0.064		4.0			8		21			1013	124		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4296	0.134	1014	0.107		4.0			8		27			1015	120		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4330	0.203	1012	0.162		4.0			7		17			1013	131		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4363	0.153	1014	0.122		4.0			8		19			1015	126		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4441	0.207	1012	0.129		4.0			7		17			1013	122		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4641	0.161	1012	0.129		4.0			7		39			1013	132		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4839	0.114	1010	0.071		4.0			7		19			1011	121		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5296	0.300	1010	0.188		4.0			5		29			1011	2355		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5428	0.128	1014	0.080		4.0			7		22			1015	129		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5722	0.139	1012	0.139		4.0			7		18			1013	2356		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5751	0.080	1012	0.050		4.0			5		27			1013	2352		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5994	0.154	1012	0.154		4.0			6		7			1013	2354		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.6172	0.199	1012	0.159		4.0			5		15			1013	2353		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.6423	0.196	1014	0.122		4.0			7		22			1015	136		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7157	0.166	1010	0.133		4.0			8		36			1011	134		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7875	0.188	1010	0.188		4.0			8		30			1011	137		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7928	0.085	1012	0.053		4.0			8		31			1013	135		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.8164	0.142	1012	0.088		4.0			8		35			1013	138		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.8251	0.169	1014	0.135		4.0			7		41			1015	133		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.9349	0.065	1012	0.065		4.0			8		32			1013	146		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.9978	0.270	1010	0.169		4.0			8		9			1011	140		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0238	0.156	1012	0.125		4.0			6		36			1013	2357		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0571	0.173	1014	0.108		4.0			8		7			1015	147		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0696	0.206	1014	0.164		4.0			7		22			1015	143		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0715	0.240	1012	0.150		4.0			8		34			1013	153		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0781	0.052	1012	0.052		4.0			8		21			1013	142		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0861	0.113	1010	0.113		4.0			8		26			1011	148		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1143	0.196	1012	0.122		4.0			7		30			1013	141		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1269	0.057	1010	0.057		4.0			7		27			1011	152		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1350	0.319	1010	0.200		4.0			8		18			1011	145		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1403	0.276	1014	0.172		4.0			8		15			1015	149		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1467	0.311	1014	0.194		4.0			8		23			1015	150		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1775	0.219	1014	0.175		4.0			8		20			1015	139		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.2180	0.103	1014	0.065		4.0			7		25			1015	151		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.2197	0.301	1010	0.188		4.0			8		10			1011	155		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.2419	0.069	1014	0.069		4.0			8		2			1015	144		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.3124	0.102	1012	0.082		4.0			8		23			1013	154		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.3534	9.048	1006	7.238		3			1		2			1007	12		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.3740	11.660	1004	7.288		3			2		4			1005	13		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.3837	0.154	1014	0.154		4.0			6		34			1015	2358		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7566	0.190	1010	0.152		4.0			6		24			1011	2359		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7931	0.132	1014	0.132		4.0			5		18			1015	2360		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.8274	0.156	1010	0.125		4.0			6		10			1011	2363		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.8330	0.125	1012	0.125		4.0			5		28			1013	2362		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.8527	0.188	1014	0.117		4.0			8		34			1015	156		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.8999	0.154	1014	0.154		4.0			6		33			1015	2361		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1192	0.152	1010	0.095		4.0			7		33			1011	157		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1348	0.226	1012	0.141		4.0			8		19			1013	160		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1446	0.067	1012	0.067		4.0			7		25			1013	159		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1980	0.288	1012	0.180		4.0			7		15			1013	2365		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1995	0.101	1012	0.063		4.0			5		32			1013	2364		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.2249	0.214	1014	0.171		4.0			8		19			1015	158		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.2948	0.150	1012	0.150		4.0			8		27			1013	162		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3357	0.053	1010	0.053		4.0			7		19			1011	161		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.6478	0.187	1012	0.117		4.0			7		33			1013	171		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7105	0.176	1010	0.176		4.0			8		13			1011	163		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7139	0.206	1010	0.165		4.0			8		28			1011	165		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7486	0.112	1014	0.089		4.0			8		14			1015	164		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8325	0.095	1012	0.059		4.0			7		36			1013	166		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8510	0.112	1010	0.089		4.0			7		28			1011	168		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9342	0.118	1014	0.073		4.0			8		16			1015	177		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9395	0.151	1012	0.151		4.0			8		33			1013	169		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9632	0.131	1014	0.082		4.0			7		21			1015	170		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9810	0.203	1012	0.127		4.0			8		26			1013	180		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9869	0.179	1010	0.112		4.0			7		13			1011	167		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0135	0.238	1012	0.191		4.0			7		19			1013	172		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0245	0.073	1012	0.058		4.0			8		24			1013	173		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0318	0.300	1012	0.187		4.0			7		13			1013	175		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0401	0.084	1014	0.067		4.0			8		20			1015	181		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0513	0.142	1014	0.114		4.0			7		7			1015	178		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0770	0.089	1014	0.071		4.0			8		37			1015	174		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0995	0.053	1010	0.053		4.0			6		16			1011	2366		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1222	0.160	1010	0.160		4.0			7		6			1011	176		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1303	0.098	1014	0.079		4.0			8		9			1015	185		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1342	0.087	1014	0.070		4.0			8		25			1015	179		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1399	0.093	1012	0.093		4.0			8		5			1013	190		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1963	0.187	1012	0.117		4.0			7		10			1013	186		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2067	0.073	1010	0.073		4.0			8		13			1011	184		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2206	0.058	1014	0.058		4.0			8		28			1015	183		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2232	0.092	1014	0.092		4.0			8		12			1015	189		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2440	0.139	1012	0.139		4.0			8		19			1013	182		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2918	0.086	1014	0.086		4.0			7		21			1015	188		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3456	0.186	1012	0.149		4.0			8		15			1013	191		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3547	0.228	1014	0.183		4.0			8		26			1015	203		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3894	0.320	1012	0.200		4.0			8		21			1013	187		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4050	0.091	1010	0.091		4.0			5		8			1011	2370		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4172	0.188	1010	0.188		4.0			7		29			1011	201		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4342	0.194	1014	0.121		4.0			7		7			1015	192		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4730	0.154	1010	0.154		4.0			6		4			1011	2368		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4764	0.112	1010	0.112		4.0			6		15			1011	2369		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4778	0.098	1014	0.061		4.0			8		17			1015	196		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4912	0.146	1014	0.091		4.0			6		24			1015	2372		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4941	0.071	1010	0.057		4.0			8		18			1011	200		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.4958	0.093	1010	0.058		4.0			6		26			1011	2367		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5048	0.103	1014	0.083		4.0			5		25			1015	2371		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5074	0.185	1010	0.116		4.0			8		33			1011	202		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5099	0.244	1012	0.195		4.0			8		15			1013	199		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5191	0.303	1010	0.190		4.0			8		19			1011	194		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5238	0.194	1014	0.194		4.0			8		28			1015	218		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5252	0.163	1014	0.163		4.0			8		16			1015	197		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5368	0.122	1014	0.098		4.0			8		44			1015	213		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5480	0.241	1010	0.151		4.0			8		28			1011	210		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5750	0.135	1014	0.135		4.0			7		29			1015	204		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5828	0.123	1012	0.123		4.0			8		23			1013	216		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5870	0.305	1010	0.191		4.0			8		22			1011	195		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6305	0.148	1014	0.092		4.0			8		21			1015	217		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6421	0.139	1012	0.111		4.0			7		26			1013	221		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6458	0.258	1010	0.161		4.0			8		9			1011	212		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6483	0.164	1010	0.164		4.0			8		30			1011	198		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6528	0.202	1012	0.162		4.0			7		24			1013	207		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6752	0.096	1010	0.060		4.0			8		27			1011	205		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6888	0.146	1014	0.117		4.0			6		20			1015	2374		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6888	0.073	1014	0.059		4.0			8		33			1015	215		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.6937	0.103	1014	0.103		4.0			8		31			1015	220		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7010	0.120	1010	0.096		4.0			6		8			1011	2373		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7029	0.099	1014	0.099		4.0			8		25			1015	214		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7047	0.193	1014	0.193		4.0			7		18			1015	193		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7183	0.165	1010	0.132		4.0			7		28			1011	208		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7275	0.146	1014	0.091		4.0			8		27			1015	219		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7351	0.092	1012	0.092		4.0			8		33			1013	206		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7477	0.105	1010	0.105		4.0			7		28			1011	211		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7555	0.183	1014	0.115		4.0			5		22			1015	2376		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7776	0.104	1014	0.104		4.0			5		11			1015	2375		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7852	0.126	1010	0.100		4.0			6		23			1011	2378		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7954	0.145	1012	0.116		4.0			8		31			1013	222		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8054	0.093	1014	0.093		4.0			6		19			1015	2377		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8301	0.170	1014	0.106		4.0			8		25			1015	209		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8304	8.538	1002	6.830		3			1		2			1003	18		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8600	13.733	1000	8.583		2			2		5			1001	15		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8769	10.809	1002	8.647		2			2		3			1003	16		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.9337	8.493	1008	6.794		2			1		2			1009	14		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.9812	7.680	1002	7.680		3			1		4			1003	19		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.9921	7.911	1004	7.911		2			1		4			1005	17		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.1471	0.266	1010	0.166		4.0			7		29			1011	228		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2317	0.191	1014	0.153		4.0			7		19			1015	235		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2781	0.052	1010	0.052		4.0			7		24			1011	230		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2817	0.221	1010	0.177		4.0			8		27			1011	236		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2969	0.228	1010	0.183		4.0			7		26			1011	224		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2974	0.108	1012	0.108		4.0			8		8			1013	225		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3009	0.193	1012	0.193		4.0			8		35			1013	223		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3029	0.202	1014	0.162		4.0			8		30			1015	231		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3055	0.151	1010	0.151		4.0			8		26			1011	240		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3126	0.151	1014	0.151		4.0			8		25			1015	243		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3209	0.240	1012	0.192		4.0			6		20			1013	2381		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3389	0.098	1014	0.098		4.0			7		40			1015	238		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3401	0.078	1012	0.062		4.0			8		31			1013	233		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3509	0.216	1014	0.135		4.0			8		23			1015	244		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3605	0.193	1012	0.193		4.0			6		29			1013	2379		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3625	0.094	1014	0.075		4.0			8		23			1015	242		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3678	0.104	1014	0.104		4.0			8		23			1015	237		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3771	0.196	1014	0.196		4.0			7		27			1015	227		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3842	0.293	1010	0.183		4.0			7		36			1011	229		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3999	0.113	1012	0.070		4.0			5		13			1013	2383		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4036	0.289	1010	0.181		4.0			8		39			1011	232		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4188	0.106	1014	0.085		4.0			8		38			1015	226		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4312	0.054	1010	0.054		4.0			5		16			1011	2382		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4719	0.189	1010	0.189		4.0			8		27			1011	239		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4856	0.068	1012	0.054		4.0			7		36			1013	245		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4888	0.300	1012	0.188		4.0			8		26			1013	234		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4991	0.175	1010	0.140		4.0			5		35			1011	2380		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5292	0.103	1010	0.065		4.0			8		20			1011	241		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6676	0.221	1014	0.177		4.0			5		30			1015	2384		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6680	0.157	1012	0.157		4.0			6		33			1013	2387		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6880	0.215	1014	0.172		4.0			5		9			1015	2385		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6921	0.198	1010	0.198		4.0			5		21			1011	2386		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7155	0.192	1014	0.192		4.0			6		1			1015	2392		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7236	0.268	1012	0.168		4.0			6		27			1013	2389		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7850	0.186	1010	0.186		4.0			6		11			1011	2388		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.8511	0.060	1012	0.060		4.0			5		22			1013	2391		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9070	0.181	1010	0.181		4.0			6		13			1011	2390		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0092	0.111	1014	0.069		4.0			7		22			1015	269		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0238	0.235	1010	0.147		4.0			8		25			1011	258		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0313	0.195	1012	0.195		4.0			8		26			1013	272		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0370	0.197	1014	0.158		4.0			8		30			1015	260		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0663	0.270	1014	0.169		4.0			8		15			1015	248		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0713	0.149	1012	0.149		4.0			8		30			1013	262		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0787	0.190	1010	0.152		4.0			8		24			1011	266		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0824	0.182	1010	0.114		4.0			7		32			1011	278		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0874	0.147	1012	0.092		4.0			8		25			1013	254		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0914	0.164	1010	0.102		4.0			8		25			1011	271		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0982	0.175	1014	0.140		4.0			7		27			1015	267		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0982	0.166	1010	0.104		4.0			8		21			1011	264		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1245	0.099	1010	0.062		4.0			7		11			1011	253		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1393	0.079	1012	0.063		4.0			7		32			1013	273		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1413	0.157	1010	0.157		4.0			7		25			1011	251		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1613	0.154	1014	0.154		4.0			8		3			1015	250		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1727	0.148	1014	0.093		4.0			8		41			1015	246		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1765	0.084	1012	0.067		4.0			8		22			1013	249		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1789	0.164	1014	0.131		4.0			7		22			1015	255		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1810	0.074	1014	0.074		4.0			8		36			1015	265		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1826	0.239	1010	0.150		4.0			8		21			1011	283		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1828	0.081	1012	0.081		4.0			8		16			1013	247		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1832	0.056	1014	0.056		4.0			8		28			1015	257		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1840	0.248	1014	0.198		4.0			7		26			1015	256		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1998	0.100	1010	0.063		4.0			7		25			1011	274		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2001	0.249	1012	0.199		4.0			8		17			1013	280		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2196	0.188	1010	0.188		4.0			8		27			1011	259		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2204	0.135	1010	0.085		4.0			8		20			1011	281		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2247	0.124	1010	0.124		4.0			8		23			1011	268		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2281	0.210	1010	0.131		4.0			7		32			1011	282		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2488	0.181	1012	0.181		4.0			7		6			1013	252		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2529	0.300	1012	0.187		4.0			8		2			1013	285		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2718	0.226	1012	0.181		4.0			8		14			1013	279		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2979	0.200	1014	0.200		4.0			8		29			1015	276		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3002	0.281	1010	0.175		4.0			7		29			1011	263		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3332	0.074	1014	0.074		4.0			8		30			1015	270		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3382	0.197	1014	0.197		4.0			7		21			1015	298		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3596	0.111	1010	0.111		4.0			7		27			1011	277		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3722	0.097	1014	0.097		4.0			8		40			1015	288		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3819	0.111	1010	0.089		4.0			8		31			1011	284		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.4179	0.162	1010	0.129		4.0			8		44			1011	275		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.4458	0.098	1010	0.098		4.0			7		27			1011	261		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.4709	0.093	1012	0.058		4.0			8		13			1013	287		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.4747	0.174	1010	0.109		4.0			8		38			1011	292		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.4841	0.164	1014	0.103		4.0			8		25			1015	302		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5284	0.153	1010	0.096		4.0			8		28			1011	293		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5421	0.186	1012	0.186		4.0			8		13			1013	295		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5502	0.099	1010	0.099		4.0			8		18			1011	289		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5510	0.212	1010	0.170		4.0			7		22			1011	291		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5541	0.099	1012	0.062		4.0			8		16			1013	303		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5867	0.091	1010	0.091		4.0			7		21			1011	299		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5941	0.109	1010	0.109		4.0			8		13			1011	294		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6255	0.180	1012	0.144		4.0			8		29			1013	301		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6293	0.117	1012	0.117		4.0			7		31			1013	290		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6671	0.200	1010	0.125		4.0			7		29			1011	297		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6735	0.166	1012	0.104		4.0			8		35			1013	296		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7049	0.177	1010	0.177		4.0			7		29			1011	300		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7108	0.260	1010	0.162		4.0			7		26			1011	286		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7970	0.056	1014	0.056		4.0			6		38			1015	2393		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8009	0.303	1010	0.189		4.0			8		18			1011	309		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8163	0.072	1012	0.072		4.0			7		32			1013	312		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8531	0.081	1014	0.065		4.0			7		36			1015	310		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8896	0.138	1010	0.138		4.0			8		16			1011	311		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8917	0.185	1014	0.148		4.0			8		20			1015	304		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.9325	0.165	1012	0.165		4.0			8		28			1013	308		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.9332	0.179	1012	0.179		4.0			8		35			1013	314		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.9666	0.051	1012	0.051		4.0			8		20			1013	305		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.9885	0.128	1014	0.103		4.0			8		27			1015	313		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0165	0.101	1010	0.081		4.0			8		21			1011	318		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0235	0.253	1014	0.158		4.0			8		17			1015	307		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0313	0.241	1012	0.151		4.0			8		17			1013	306		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0578	0.234	1014	0.187		4.0			7		21			1015	315		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0679	0.170	1012	0.136		4.0			5		12			1013	2396		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1182	0.171	1014	0.171		4.0			8		26			1015	322		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1296	0.133	1010	0.107		4.0			8		28			1011	346		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1368	0.070	1010	0.056		4.0			6		16			1011	2398		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1662	0.092	1012	0.058		4.0			8		12			1013	342		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1691	0.245	1014	0.153		4.0			6		21			1015	2394		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1833	0.152	1010	0.122		4.0			7		17			1011	319		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1834	0.081	1010	0.065		4.0			8		18			1011	343		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1964	0.070	1014	0.070		4.0			8		33			1015	325		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.1975	0.198	1012	0.198		4.0			7		13			1013	321		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2187	0.092	1014	0.092		4.0			8		9			1015	331		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2195	0.207	1012	0.165		4.0			5		41			1013	2399		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2220	0.246	1010	0.154		4.0			8		22			1011	317		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2248	0.192	1010	0.192		4.0			6		24			1011	2401		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2319	0.068	1012	0.055		4.0			8		43			1013	326		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2373	0.073	1010	0.073		4.0			8		28			1011	347		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2383	0.199	1010	0.159		4.0			8		16			1011	320		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2445	0.156	1012	0.125		4.0			8		22			1013	339		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2452	0.308	1014	0.193		4.0			7		33			1015	349		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2553	0.163	1012	0.130		4.0			8		21			1013	316		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2618	0.163	1014	0.131		4.0			8		18			1015	324		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2733	0.283	1014	0.177		4.0			6		26			1015	2397		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2784	0.123	1010	0.123		4.0			8		29			1011	323		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2860	0.149	1014	0.149		4.0			6		27			1015	2395		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3062	0.291	1010	0.182		4.0			8		22			1011	338		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3068	0.194	1012	0.122		4.0			7		20			1013	330		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3254	0.200	1010	0.200		4.0			8		22			1011	350		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3312	0.202	1012	0.126		4.0			8		20			1013	358		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3346	0.163	1012	0.102		4.0			5		30			1013	2400		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3447	0.166	1012	0.104		4.0			8		21			1013	344		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3450	0.249	1014	0.155		4.0			8		20			1015	334		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3571	0.192	1014	0.192		4.0			7		19			1015	337		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3639	0.319	1012	0.199		4.0			8		19			1013	327		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3739	0.277	1012	0.173		4.0			8		21			1013	341		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3838	0.280	1010	0.175		4.0			7		26			1011	340		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3928	0.164	1014	0.102		4.0			7		20			1015	352		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3935	0.066	1014	0.066		4.0			8		23			1015	348		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4043	0.264	1014	0.165		4.0			7		18			1015	329		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4089	0.160	1010	0.160		4.0			8		29			1011	345		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4141	0.187	1010	0.150		4.0			8		20			1011	328		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4166	0.178	1010	0.111		4.0			8		26			1011	333		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4234	0.162	1014	0.162		4.0			7		21			1015	360		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4606	0.109	1012	0.109		4.0			8		17			1013	374		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4641	0.100	1014	0.080		4.0			8		14			1015	371		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4660	0.105	1012	0.084		4.0			8		36			1013	365		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4743	0.059	1012	0.059		4.0			8		24			1013	335		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4775	0.194	1014	0.121		4.0			8		27			1015	336		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4785	0.186	1014	0.186		4.0			7		23			1015	332		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4890	0.106	1012	0.106		4.0			8		28			1013	377		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4920	0.282	1014	0.176		4.0			8		21			1015	376		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.4973	0.149	1012	0.119		4.0			8		22			1013	373		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5050	0.084	1012	0.067		4.0			8		26			1013	379		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5253	0.151	1010	0.094		4.0			8		40			1011	363		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5257	0.082	1010	0.082		4.0			8		27			1011	368		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5303	0.179	1014	0.179		4.0			8		19			1015	356		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5336	0.078	1014	0.063		4.0			8		15			1015	359		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5363	0.243	1012	0.152		4.0			8		22			1013	375		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5477	0.182	1014	0.146		4.0			7		15			1015	357		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.5699	0.102	1012	0.082		4.0			8		27			1013	354		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6127	0.151	1014	0.120		4.0			8		31			1015	353		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6228	0.060	1014	0.060		4.0			8		23			1015	372		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6237	0.238	1012	0.149		4.0			8		38			1013	355		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6410	0.140	1010	0.087		4.0			8		23			1011	370		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6467	0.068	1010	0.068		4.0			7		5			1011	364		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6598	0.158	1012	0.158		4.0			7		34			1013	366		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6758	0.168	1012	0.168		4.0			8		20			1013	380		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6971	0.191	1010	0.191		4.0			7		25			1011	378		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7008	0.304	1010	0.190		4.0			8		25			1011	361		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7093	0.171	1012	0.107		4.0			7		29			1013	351		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7420	0.175	1014	0.109		4.0			8		15			1015	362		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7713	7.149	1006	7.149		2			2		2			1007	20		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8131	0.072	1012	0.072		4.0			7		24			1013	369		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8218	0.247	1010	0.154		4.0			8		23			1011	367		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8705	8.666	1004	8.666		3			1		7			1005	23		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8980	9.292	1002	7.434		2			1		7			1003	21		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.9258	12.924	1002	8.078		2			2		3			1003	22		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0850	0.114	1014	0.114		4.0			5		7			1015	2402		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1101	0.289	1014	0.181		4.0			6		27			1015	2403		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1186	0.189	1012	0.118		4.0			5		34			1013	2405		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1381	0.198	1012	0.159		4.0			8		20			1013	394		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1396	0.165	1014	0.165		4.0			8		30			1015	390		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1441	0.221	1012	0.177		4.0			8		16			1013	395		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1538	0.116	1014	0.116		4.0			5		19			1015	2406		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1551	0.074	1014	0.074		4.0			6		23			1015	2404		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1616	0.176	1012	0.110		4.0			5		9			1013	2407		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1796	0.190	1010	0.152		4.0			8		34			1011	389		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1946	0.186	1014	0.116		4.0			8		22			1015	391		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2035	0.120	1012	0.096		4.0			8		21			1013	386		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2718	0.117	1012	0.073		4.0			7		25			1013	383		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2840	0.088	1012	0.070		4.0			8		25			1013	384		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2939	0.304	1012	0.190		4.0			8		36			1013	381		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2951	0.114	1014	0.114		4.0			6		28			1015	2408		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2987	0.141	1010	0.088		4.0			8		29			1011	406		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3028	0.067	1012	0.067		4.0			8		26			1013	387		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3168	0.093	1012	0.093		4.0			8		27			1013	382		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3197	0.123	1012	0.077		4.0			5		39			1013	2412		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3205	0.314	1012	0.196		4.0			8		19			1013	410		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3331	0.254	1012	0.159		4.0			8		29			1013	393		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3403	0.132	1010	0.106		4.0			8		22			1011	388		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3491	0.244	1014	0.195		4.0			8		18			1015	385		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3567	0.266	1012	0.166		4.0			8		28			1013	392		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3659	0.079	1014	0.063		4.0			6		21			1015	2413		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3772	0.083	1014	0.066		4.0			6		7			1015	2409		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3928	0.199	1014	0.160		4.0			6		39			1015	2410		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3979	0.143	1014	0.115		4.0			5		30			1015	2411		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4032	0.245	1010	0.153		4.0			7		19			1011	400		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4307	0.094	1012	0.075		4.0			8		29			1013	405		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4519	0.085	1010	0.085		4.0			8		26			1011	396		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4543	0.236	1014	0.148		4.0			8		29			1015	404		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4575	0.144	1012	0.115		4.0			8		18			1013	407		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4605	0.067	1010	0.067		4.0			5		20			1011	2414		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.4968	0.129	1012	0.129		4.0			8		26			1013	398		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.5350	0.246	1012	0.154		4.0			8		12			1013	403		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.5461	0.249	1010	0.156		4.0			7		24			1011	411		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.5868	0.074	1014	0.059		4.0			8		23			1015	401		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6113	0.149	1012	0.093		4.0			8		26			1013	413		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6127	0.194	1014	0.194		4.0			8		24			1015	414		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6200	0.320	1012	0.200		4.0			8		11			1013	399		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6239	0.187	1012	0.117		4.0			7		18			1013	397		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6480	0.064	1010	0.064		4.0			8		26			1011	402		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6871	0.165	1012	0.103		4.0			8		23			1013	412		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.6982	0.129	1010	0.103		4.0			8		39			1011	420		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.7039	0.217	1014	0.173		4.0			8		24			1015	409		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.7126	0.166	1012	0.104		4.0			8		12			1013	424		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.7580	0.218	1010	0.136		4.0			8		32			1011	421		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.7592	0.280	1014	0.175		4.0			7		19			1015	408		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8155	0.261	1014	0.163		4.0			8		19			1015	423		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8293	0.307	1012	0.192		4.0			8		15			1013	439		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8350	0.240	1012	0.150		4.0			8		21			1013	429		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8456	0.204	1014	0.128		4.0			8		15			1015	437		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8561	0.076	1010	0.076		4.0			7		16			1011	427		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8962	0.139	1012	0.087		4.0			8		25			1013	430		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.8969	0.248	1014	0.155		4.0			7		35			1015	417		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9166	0.182	1014	0.146		4.0			8		38			1015	422		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9188	0.116	1012	0.072		4.0			8		22			1013	443		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9338	0.281	1014	0.176		4.0			8		16			1015	419		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9516	0.132	1012	0.083		4.0			5		26			1013	2417		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9524	0.118	1012	0.118		4.0			8		24			1013	431		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9564	0.152	1014	0.122		4.0			8		30			1015	418		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9586	0.214	1012	0.134		4.0			8		23			1013	425		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9595	0.162	1012	0.162		4.0			8		26			1013	432		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9636	0.216	1012	0.173		4.0			6		32			1013	2416		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9692	0.114	1010	0.114		4.0			6		16			1011	2418		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9853	0.102	1012	0.102		4.0			6		19			1013	2415		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9856	0.198	1012	0.158		4.0			5		18			1013	2420		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.9977	0.066	1014	0.066		4.0			8		25			1015	434		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0000	0.119	1012	0.095		4.0			8		17			1013	426		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0022	0.183	1012	0.115		4.0			6		36			1013	2419		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0154	0.141	1010	0.141		4.0			8		11			1011	416		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0194	0.054	1010	0.054		4.0			8		22			1011	428		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0236	0.165	1012	0.165		4.0			8		26			1013	440		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0270	0.103	1010	0.065		4.0			8		39			1011	435		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0364	0.193	1012	0.121		4.0			8		33			1013	477		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0512	0.200	1014	0.200		4.0			8		12			1015	415		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0521	0.078	1012	0.078		4.0			8		34			1013	444		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0959	0.166	1014	0.166		4.0			8		21			1015	457		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0964	0.286	1014	0.179		4.0			6		27			1015	2423		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1070	0.106	1012	0.085		4.0			8		30			1013	450		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1098	0.078	1012	0.078		4.0			8		26			1013	442		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1206	0.243	1010	0.152		4.0			8		36			1011	445		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1445	0.211	1010	0.169		4.0			8		27			1011	467		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1506	0.306	1012	0.191		4.0			8		20			1013	454		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1676	0.165	1012	0.165		4.0			8		25			1013	473		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1727	0.181	1014	0.145		4.0			6		35			1015	2422		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1742	0.134	1012	0.084		4.0			8		31			1013	472		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1818	0.108	1014	0.108		4.0			8		38			1015	451		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1834	0.104	1010	0.084		4.0			8		25			1011	461		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1952	0.163	1014	0.163		4.0			7		25			1015	436		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1982	0.191	1014	0.191		4.0			7		23			1015	471		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2062	0.124	1014	0.099		4.0			8		11			1015	476		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2150	0.096	1012	0.060		4.0			8		24			1013	481		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2213	0.169	1010	0.169		4.0			7		32			1011	456		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2275	0.198	1014	0.124		4.0			8		24			1015	475		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2309	0.316	1014	0.197		4.0			8		20			1015	468		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2327	0.054	1012	0.054		4.0			8		28			1013	465		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2354	0.166	1014	0.166		4.0			6		28			1015	2421		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2370	0.118	1014	0.118		4.0			8		26			1015	441		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2502	0.194	1010	0.155		4.0			8		22			1011	447		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2554	0.156	1014	0.156		4.0			8		20			1015	458		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2563	0.093	1012	0.075		4.0			8		26			1013	463		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2565	0.155	1014	0.155		4.0			8		17			1015	433		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2659	0.212	1014	0.133		4.0			8		14			1015	462		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2737	0.248	1010	0.155		4.0			8		26			1011	449		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2788	0.165	1012	0.165		4.0			8		18			1013	469		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3010	0.132	1012	0.106		4.0			8		22			1013	455		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3086	0.316	1014	0.197		4.0			8		27			1015	482		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3123	0.187	1010	0.187		4.0			8		33			1011	448		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3267	0.110	1014	0.110		4.0			8		34			1015	466		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3275	0.073	1010	0.058		4.0			8		25			1011	446		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3441	0.177	1010	0.111		4.0			8		35			1011	459		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3473	0.142	1010	0.142		4.0			8		21			1011	460		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3576	0.097	1014	0.097		4.0			8		31			1015	480		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3577	0.086	1010	0.086		4.0			8		35			1011	452		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3778	0.241	1010	0.193		4.0			8		40			1011	453		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3781	0.189	1010	0.118		4.0			8		28			1011	470		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4008	0.066	1014	0.066		4.0			7		25			1015	438		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4183	0.192	1010	0.192		4.0			8		21			1011	464		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4183	0.123	1012	0.123		4.0			7		26			1013	483		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4279	0.178	1014	0.178		4.0			8		21			1015	479		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4810	0.118	1010	0.118		4.0			8		24			1011	478		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4838	0.209	1012	0.168		4.0			8		31			1013	484		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4892	0.104	1012	0.065		4.0			7		24			1013	474		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.5548	0.075	1014	0.060		4.0			8		25			1015	485		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.5625	0.239	1014	0.191		4.0			7		25			1015	486		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.5634	0.205	1012	0.128		4.0			8		29			1013	487		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6080	2.543	1004	1.589		3			3		22			1005	2870		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6127	2.858	1002	2.286		3			4		28			1003	2855		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6146	2.068	1010	1.654		3			5		15			1011	2816		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6207	2.242	1012	2.242		3			5		33			1013	2849		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6269	3.895	1004	2.434		3			6		24			1005	2887		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6288	0.109	1010	0.087		4.0			8		24			1011	488		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6324	2.151	1012	1.345		3			7		8			1013	2884		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6351	3.728	1010	2.330		3			6		24			1011	2825		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6406	2.516	1010	2.013		3			2		18			1011	2820		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6424	2.219	1014	1.387		3			7		14			1015	2839		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6430	1.812	1000	1.449		3			6		13			1001	2877		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6524	3.430	1014	2.143		3			8		22			1015	2846		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6530	1.722	1012	1.378		3			5		29			1013	2833		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6547	2.189	1002	1.751		3			7		22			1003	2832		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6556	1.921	1004	1.537		3			5		22			1005	2850		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6590	2.953	1010	1.846		3			4		25			1011	2889		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6595	3.526	1014	2.204		3			4		23			1015	2864		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6595	2.342	1004	1.464		3			3		24			1005	2819		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6614	2.642	1000	2.113		3			4		9			1001	2863		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6639	2.624	1002	2.099		3			4		5			1003	2822		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6687	3.099	1000	1.937		3			8		25			1001	2867		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6716	2.869	1010	2.296		3			3		9			1011	2831		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6718	2.553	1002	1.596		3			6		17			1003	2830		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6726	0.086	1010	0.086		4.0			7		32			1011	495		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6747	3.572	1004	2.233		3			4		8			1005	2854		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6811	2.615	1014	2.092		3			6		33			1015	2874		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6817	2.924	1002	2.339		3			3		23			1003	2823		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6845	2.957	1014	2.366		3			7		23			1015	2842		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6847	1.362	1010	1.362		3			7		33			1011	2828		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6854	2.237	1012	1.789		3			4		26			1013	2851		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6861	2.269	1012	2.269		3			6		23			1013	2836		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6867	2.688	1010	2.150		3			5		34			1011	2844		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6874	2.990	1004	2.392		3			5		26			1005	2843		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6889	3.171	1010	1.982		3			1		16			1011	2879		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6895	2.037	1012	1.629		3			8		20			1013	2840		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6907	3.053	1012	1.908		3			4		28			1013	2835		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6946	1.473	1004	1.473		3			8		15			1005	2869		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6949	2.687	1014	2.149		3			4		30			1015	2880		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.6999	1.350	1004	1.350		3			6		14			1005	2885		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7050	2.486	1002	2.486		3			6		21			1003	2818		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7053	2.559	1012	1.600		3			3		11			1013	2857		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7065	1.893	1014	1.514		3			6		16			1015	2865		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7069	2.680	1000	1.675		3			5		23			1001	2875		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7077	2.768	1014	1.730		3			9		29			1015	2853		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7078	2.838	1014	1.774		3			6		30			1015	2841		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7084	2.442	1010	1.527		3			4		15			1011	2838		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7085	2.243	1002	1.402		3			7		30			1003	2883		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7088	1.957	1014	1.957		3			7		16			1015	2827		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7174	3.373	1014	2.108		3			3		32			1015	2817		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7212	3.040	1002	2.432		3			8		8			1003	2845		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7251	2.927	1000	1.829		3			0		24			1001	2847		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7312	3.807	1002	2.380		3			1		5			1003	2814		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7323	3.004	1004	1.877		3			3		6			1005	2859		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7329	2.878	1010	1.799		3			7		27			1011	2858		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7332	3.417	1014	2.136		3			5		32			1015	2881		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7344	2.441	1014	2.441		3			4		10			1015	2848		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7356	2.611	1000	2.089		3			4		20			1001	2861		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7358	2.899	1014	1.812		3			5		22			1015	2868		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7374	2.595	1010	2.076		3			3		35			1011	2876		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7404	3.136	1004	1.960		3			6		17			1005	2886		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7478	2.142	1012	1.338		3			4		34			1013	2872		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7537	3.180	1012	1.987		3			8		19			1013	2856		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7579	3.114	1002	2.491		3			5		15			1003	2882		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7653	1.792	1012	1.792		3			7		17			1013	2834		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7663	2.156	1010	1.348		3			4		31			1011	2837		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7692	1.517	1012	1.517		3			6		29			1013	2824		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7705	3.932	1010	2.458		3			3		31			1011	2871		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7711	3.118	1014	2.494		3			3		32			1015	2860		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7715	0.126	1012	0.101		4.0			7		27			1013	503		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7724	3.591	1012	2.245		3			2		16			1013	2821		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7726	1.474	1012	1.474		3			5		37			1013	2829		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7753	2.005	1014	2.005		3			7		31			1015	2888		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7818	1.882	1012	1.505		3			7		11			1013	2852		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7836	1.925	1002	1.925		3			2		24			1003	2862		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.7915	1.980	1000	1.584		3			4		22			1001	2815		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8147	0.291	1012	0.182		4.0			8		26			1013	494		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8232	0.142	1014	0.113		4.0			7		24			1015	501		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8261	0.067	1012	0.053		4.0			8		20			1013	506		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8379	0.197	1010	0.158		4.0			8		32			1011	509		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8387	0.069	1012	0.055		4.0			8		23			1013	498		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8437	0.184	1014	0.147		4.0			8		41			1015	507		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8492	0.096	1014	0.096		4.0			8		18			1015	512		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8500	0.087	1012	0.070		4.0			7		16			1013	493		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8612	0.130	1010	0.130		4.0			8		25			1011	490		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8716	0.112	1014	0.070		4.0			8		30			1015	497		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8738	0.205	1012	0.164		4.0			8		22			1013	502		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8753	0.236	1012	0.189		4.0			8		31			1013	496		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8776	2.109	1014	2.109		3			7		6			1015	2878		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8819	0.135	1010	0.108		4.0			8		35			1011	492		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.8924	0.173	1014	0.139		4.0			8		24			1015	491		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9078	0.158	1012	0.099		4.0			8		12			1013	499		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9141	0.080	1012	0.050		4.0			8		32			1013	504		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9155	0.154	1010	0.154		4.0			8		22			1011	518		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9213	0.252	1010	0.158		4.0			8		14			1011	522		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9218	0.141	1010	0.088		4.0			8		16			1011	505		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9345	0.136	1010	0.109		4.0			8		23			1011	489		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.9618	0.117	1014	0.117		4.0			7		22			1015	511		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0078	0.213	1014	0.170		4.0			8		21			1015	532		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0086	0.138	1014	0.086		4.0			8		32			1015	521		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0205	0.134	1014	0.134		4.0			8		23			1015	517		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0248	0.132	1014	0.106		4.0			8		19			1015	508		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0248	0.191	1010	0.119		4.0			7		28			1011	510		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0291	0.109	1014	0.109		4.0			8		29			1015	515		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0530	0.108	1012	0.108		4.0			8		30			1013	528		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0703	0.107	1010	0.067		4.0			8		15			1011	548		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0789	0.314	1014	0.196		4.0			8		32			1015	524		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0867	0.163	1014	0.163		4.0			8		16			1015	516		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0979	0.211	1012	0.169		4.0			8		21			1013	525		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1111	0.147	1010	0.092		4.0			8		18			1011	536		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1175	0.258	1014	0.161		4.0			8		24			1015	514		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1366	0.217	1010	0.174		4.0			8		29			1011	546		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1463	0.225	1010	0.140		4.0			8		30			1011	520		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1469	0.064	1012	0.052		4.0			8		7			1013	531		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1574	0.222	1012	0.178		4.0			8		40			1013	539		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1657	0.149	1010	0.149		4.0			7		10			1011	543		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1774	0.147	1010	0.147		4.0			7		18			1011	529		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1783	0.141	1012	0.088		4.0			8		21			1013	537		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1803	0.062	1012	0.062		4.0			8		25			1013	519		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1809	0.304	1010	0.190		4.0			8		30			1011	513		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1838	0.166	1014	0.104		4.0			8		30			1015	527		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1846	0.071	1010	0.057		4.0			8		21			1011	523		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.1994	0.128	1010	0.102		4.0			8		24			1011	547		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2017	0.145	1014	0.145		4.0			8		18			1015	549		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2035	0.241	1010	0.193		4.0			8		27			1011	545		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2166	0.170	1010	0.170		4.0			8		23			1011	500		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2347	0.077	1010	0.077		4.0			8		25			1011	534		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2498	0.129	1012	0.103		4.0			6		31			1013	2426		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2522	0.109	1014	0.109		4.0			6		19			1015	2424		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2530	0.106	1010	0.066		4.0			8		28			1011	533		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2614	0.185	1014	0.148		4.0			8		26			1015	538		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2617	0.174	1010	0.139		4.0			8		25			1011	530		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2768	0.166	1014	0.166		4.0			8		36			1015	542		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3111	0.215	1010	0.172		4.0			8		10			1011	540		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3342	0.071	1014	0.071		4.0			8		37			1015	544		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3397	0.311	1014	0.194		4.0			6		37			1015	2425		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3665	0.158	1012	0.099		4.0			6		13			1013	2427		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3670	0.173	1012	0.173		4.0			8		36			1013	535		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.3790	0.221	1014	0.177		4.0			8		31			1015	541		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4285	0.175	1012	0.140		4.0			8		23			1013	526		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5003	0.206	1012	0.164		4.0			5		22			1013	2431		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5368	0.091	1014	0.057		4.0			8		31			1015	554		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5466	0.068	1010	0.055		4.0			8		28			1011	568		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5690	0.240	1010	0.150		4.0			7		32			1011	561		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5711	0.060	1014	0.060		4.0			5		25			1015	2432		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5712	0.178	1010	0.142		4.0			6		38			1011	2429		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5751	0.239	1012	0.191		4.0			8		23			1013	553		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5796	0.140	1014	0.112		4.0			8		44			1015	555		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5896	0.195	1014	0.195		4.0			5		28			1015	2430		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5897	0.128	1010	0.080		4.0			8		31			1011	552		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6196	0.065	1014	0.052		4.0			6		40			1015	2428		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6451	0.176	1012	0.110		4.0			8		18			1013	551		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6467	0.312	1010	0.195		4.0			8		13			1011	562		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6541	0.173	1012	0.173		4.0			8		32			1013	550		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6652	0.062	1014	0.062		4.0			8		29			1015	559		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6709	0.198	1012	0.158		4.0			8		22			1013	557		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6883	0.122	1010	0.097		4.0			6		35			1011	2436		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6971	0.198	1014	0.198		4.0			6		34			1015	2437		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7045	0.261	1010	0.163		4.0			5		33			1011	2434		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7168	0.196	1010	0.196		4.0			7		21			1011	560		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7366	0.121	1012	0.121		4.0			8		24			1013	563		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7436	0.059	1014	0.059		4.0			6		12			1015	2433		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7868	0.180	1012	0.180		4.0			8		30			1013	556		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7877	0.134	1010	0.084		4.0			5		26			1011	2442		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8026	0.318	1012	0.199		4.0			5		23			1013	2435		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8324	0.121	1014	0.121		4.0			8		26			1015	558		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8331	0.266	1012	0.166		4.0			5		7			1013	2439		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8467	0.097	1010	0.078		4.0			6		10			1011	2443		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8573	0.074	1010	0.059		4.0			6		24			1011	2438		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8617	0.170	1014	0.136		4.0			8		21			1015	570		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.8900	0.232	1012	0.145		4.0			5		16			1013	2441		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9040	0.319	1014	0.199		4.0			7		22			1015	577		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9075	0.163	1010	0.130		4.0			8		37			1011	572		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9108	0.208	1012	0.130		4.0			8		21			1013	573		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9335	0.245	1014	0.196		4.0			8		19			1015	576		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9461	0.200	1012	0.125		4.0			5		13			1013	2440		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9481	0.146	1012	0.092		4.0			8		34			1013	574		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9867	0.120	1012	0.075		4.0			7		34			1013	578		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9893	0.289	1012	0.181		4.0			8		24			1013	571		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.9965	0.139	1014	0.111		4.0			7		23			1015	575		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0079	0.243	1010	0.152		4.0			8		29			1011	584		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0109	0.182	1014	0.146		4.0			8		27			1015	569		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0353	0.082	1010	0.082		4.0			7		20			1011	585		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0447	0.149	1014	0.149		4.0			8		22			1015	583		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0512	0.110	1012	0.110		4.0			7		28			1013	565		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0530	0.143	1010	0.143		4.0			7		33			1011	580		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0558	0.190	1014	0.152		4.0			8		32			1015	567		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0606	0.122	1012	0.097		4.0			8		25			1013	566		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0766	0.092	1012	0.092		4.0			7		22			1013	564		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0810	0.207	1014	0.165		4.0			8		29			1015	581		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1005	0.222	1010	0.139		4.0			8		8			1011	582		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1234	0.214	1010	0.134		4.0			7		13			1011	591		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1356	0.226	1014	0.141		4.0			5		20			1015	2449		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1451	0.205	1014	0.164		4.0			6		32			1015	2444		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1515	0.111	1012	0.069		4.0			6		30			1013	2445		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1611	0.075	1014	0.060		4.0			5		40			1015	2448		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1639	0.231	1012	0.144		4.0			6		15			1013	2447		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1723	0.118	1012	0.095		4.0			6		26			1013	2450		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1754	0.199	1014	0.199		4.0			5		30			1015	2451		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1821	0.186	1014	0.186		4.0			6		20			1015	2446		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1901	0.250	1010	0.156		4.0			5		15			1011	2455		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1981	0.169	1014	0.135		4.0			8		28			1015	579		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2001	0.141	1012	0.113		4.0			7		30			1013	587		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2305	0.127	1014	0.102		4.0			8		26			1015	592		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2375	0.095	1010	0.076		4.0			8		17			1011	588		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2405	0.107	1010	0.107		4.0			6		17			1011	2452		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2655	0.065	1014	0.065		4.0			7		32			1015	589		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2872	0.114	1014	0.091		4.0			5		31			1015	2454		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.2933	0.078	1010	0.063		4.0			8		17			1011	586		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.3079	0.076	1014	0.061		4.0			8		27			1015	590		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.3342	0.143	1014	0.143		4.0			8		24			1015	603		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.3441	0.095	1014	0.076		4.0			6		34			1015	2453		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.3962	0.245	1014	0.196		4.0			8		22			1015	601		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4246	8.266	1004	6.613		3			3		5			1005	29		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4263	0.090	1010	0.090		4.0			8		32			1011	599		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4438	0.092	1010	0.092		4.0			8		20			1011	606		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4489	0.198	1014	0.198		4.0			5		9			1015	2456		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4526	0.284	1014	0.178		4.0			8		30			1015	602		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4666	11.120	1008	8.896		3			4		4			1009	25		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4736	0.124	1010	0.124		4.0			8		28			1011	605		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4754	0.108	1012	0.086		4.0			8		34			1013	597		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4799	10.150	1000	8.120		2			2		9			1001	24		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4857	0.229	1012	0.184		4.0			8		27			1013	598		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.4949	8.354	1004	8.354		2			3		6			1005	28		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5012	0.169	1014	0.169		4.0			8		10			1015	596		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5020	7.670	1006	6.136		2			3		5			1007	26		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5199	0.118	1012	0.118		4.0			8		23			1013	600		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5257	0.083	1014	0.066		4.0			8		31			1015	594		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5429	0.176	1014	0.176		4.0			8		26			1015	604		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5517	14.111	1004	8.820		2			2		2			1005	27		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5730	0.164	1014	0.131		4.0			8		20			1015	595		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5769	0.089	1012	0.089		4.0			8		16			1013	593		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6403	0.063	1012	0.051		4.0			6		25			1013	2459		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6524	0.076	1012	0.061		4.0			6		20			1013	2457		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6559	0.183	1010	0.146		4.0			5		35			1011	2460		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6639	0.127	1010	0.127		4.0			6		22			1011	2458		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.8652	0.210	1014	0.168		4.0			6		28			1015	2461		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.8886	0.199	1012	0.124		4.0			5		9			1013	2463		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.9545	0.276	1012	0.173		4.0			5		30			1013	2462		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.9886	0.228	1010	0.142		4.0			5		16			1011	2464		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0600	0.106	1014	0.106		4.0			6		14			1015	2467		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0776	0.215	1012	0.135		4.0			6		29			1013	2466		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0973	0.164	1012	0.164		4.0			5		15			1013	2465		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4245	0.179	1014	0.112		4.0			5		14			1015	2468		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4541	0.200	1012	0.160		4.0			6		13			1013	2473		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4806	0.096	1014	0.077		4.0			5		31			1015	2469		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4948	0.197	1012	0.157		4.0			5		28			1013	2471		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4950	0.218	1014	0.136		4.0			5		28			1015	2472		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5816	0.245	1010	0.196		4.0			5		23			1011	2470		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1839	0.097	1012	0.061		4.0			8		39			1013	611		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1895	0.236	1014	0.147		4.0			5		9			1015	2476		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2165	0.053	1012	0.053		4.0			5		8			1013	2475		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2180	0.115	1010	0.072		4.0			8		22			1011	610		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2246	0.200	1010	0.200		4.0			6		37			1011	2479		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2267	0.171	1010	0.107		4.0			5		24			1011	2480		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2506	0.065	1010	0.052		4.0			5		20			1011	2474		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2565	0.134	1014	0.108		4.0			6		30			1015	2481		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2615	0.246	1010	0.197		4.0			6		28			1011	2482		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2718	0.075	1012	0.060		4.0			6		25			1013	2477		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.2818	0.188	1014	0.188		4.0			6		20			1015	2484		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3439	0.134	1010	0.107		4.0			6		16			1011	2483		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3631	0.164	1012	0.164		4.0			6		28			1013	2478		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5486	0.108	1014	0.108		4.0			7		19			1015	608		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5638	0.167	1012	0.104		4.0			8		22			1013	609		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.6191	0.279	1014	0.175		4.0			8		21			1015	607		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.6446	0.172	1010	0.138		4.0			5		23			1011	2486		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.7047	0.096	1012	0.077		4.0			6		13			1013	2487		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.7138	0.168	1010	0.134		4.0			5		28			1011	2485		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9110	0.054	1014	0.054		4.0			8		21			1015	623		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9216	0.111	1010	0.089		4.0			8		19			1011	650		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9569	0.284	1012	0.177		4.0			8		29			1013	627		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9628	0.134	1010	0.134		4.0			8		24			1011	641		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9661	0.197	1012	0.197		4.0			8		40			1013	675		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9670	0.246	1010	0.197		4.0			8		19			1011	630		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9697	0.108	1010	0.087		4.0			8		19			1011	618		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9827	0.204	1012	0.163		4.0			8		16			1013	619		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9832	0.080	1012	0.080		4.0			8		26			1013	640		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9893	0.191	1014	0.153		4.0			8		18			1015	621		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9927	0.189	1012	0.118		4.0			8		35			1013	651		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0111	0.227	1010	0.142		4.0			8		25			1011	633		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0183	0.115	1012	0.115		4.0			8		27			1013	617		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0493	0.245	1010	0.196		4.0			8		27			1011	622		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0508	0.174	1010	0.109		4.0			6		38			1011	2489		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0514	0.218	1010	0.136		4.0			8		19			1011	636		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0606	0.154	1014	0.154		4.0			5		38			1015	2492		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0623	0.095	1010	0.095		4.0			6		28			1011	2490		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0637	0.183	1010	0.147		4.0			8		23			1011	642		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0696	0.214	1012	0.171		4.0			8		17			1013	612		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0702	0.073	1010	0.058		4.0			5		44			1011	2491		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0706	0.084	1014	0.067		4.0			6		29			1015	2488		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0769	0.071	1010	0.071		4.0			8		29			1011	643		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0772	0.263	1014	0.164		4.0			8		13			1015	626		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0819	0.233	1014	0.187		4.0			8		20			1015	631		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0923	0.058	1014	0.058		4.0			8		15			1015	662		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0959	0.089	1012	0.071		4.0			8		32			1013	664		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0984	0.311	1010	0.194		4.0			8		27			1011	660		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1226	0.185	1010	0.148		4.0			8		19			1011	648		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1315	0.310	1014	0.194		4.0			8		30			1015	634		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1356	0.102	1012	0.102		4.0			5		10			1013	2493		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1380	0.085	1014	0.053		4.0			8		29			1015	680		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1426	0.224	1012	0.179		4.0			8		28			1013	639		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1484	0.176	1010	0.141		4.0			8		24			1011	615		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1494	0.222	1012	0.138		4.0			8		29			1013	669		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1508	0.199	1012	0.199		4.0			8		31			1013	624		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1517	0.282	1014	0.176		4.0			5		25			1015	2494		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1559	0.059	1012	0.059		4.0			8		32			1013	638		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1564	0.115	1012	0.092		4.0			6		9			1013	2498		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1573	0.081	1012	0.064		4.0			8		29			1013	616		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1675	0.174	1014	0.139		4.0			8		35			1015	688		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1742	0.115	1014	0.072		4.0			8		15			1015	652		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1760	0.156	1010	0.125		4.0			8		39			1011	637		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1846	0.172	1014	0.172		4.0			8		31			1015	653		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1881	0.161	1014	0.161		4.0			8		15			1015	647		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1946	0.141	1010	0.141		4.0			8		23			1011	635		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1993	0.172	1014	0.107		4.0			5		8			1015	2496		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2036	0.273	1014	0.171		4.0			8		21			1015	692		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2118	0.100	1014	0.080		4.0			8		31			1015	644		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2118	0.117	1014	0.073		4.0			8		20			1015	700		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2134	0.147	1014	0.118		4.0			8		26			1015	658		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2176	0.100	1012	0.063		4.0			8		36			1013	670		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2217	0.095	1014	0.095		4.0			8		19			1015	671		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2234	0.189	1014	0.189		4.0			5		26			1015	2495		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2287	0.142	1014	0.142		4.0			8		33			1015	620		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2313	0.309	1010	0.193		4.0			8		27			1011	654		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2317	0.102	1010	0.102		4.0			8		20			1011	613		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2329	0.083	1012	0.083		4.0			8		33			1013	614		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2374	0.086	1012	0.086		4.0			8		14			1013	711		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2395	0.168	1010	0.134		4.0			8		12			1011	628		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2410	0.218	1010	0.136		4.0			8		15			1011	679		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2482	0.278	1010	0.174		4.0			8		19			1011	672		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2494	0.124	1012	0.077		4.0			8		30			1013	665		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2527	0.126	1012	0.101		4.0			5		30			1013	2497		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2616	0.296	1012	0.185		4.0			8		14			1013	645		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2620	0.086	1012	0.054		4.0			8		24			1013	629		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2628	0.237	1012	0.189		4.0			8		33			1013	696		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2703	0.068	1010	0.055		4.0			7		32			1011	625		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2803	0.233	1012	0.187		4.0			8		18			1013	655		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2815	0.078	1014	0.078		4.0			8		8			1015	632		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3361	0.132	1010	0.106		4.0			8		18			1011	702		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3393	0.107	1014	0.067		4.0			8		20			1015	649		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3483	0.187	1014	0.187		4.0			8		33			1015	656		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3504	0.096	1010	0.096		4.0			8		31			1011	659		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3558	0.238	1010	0.190		4.0			8		9			1011	698		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3620	0.310	1014	0.194		4.0			8		25			1015	681		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3721	0.103	1014	0.103		4.0			8		19			1015	666		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3771	0.169	1014	0.169		4.0			8		29			1015	707		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3772	0.094	1014	0.059		4.0			8		24			1015	716		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3777	0.088	1014	0.088		4.0			8		28			1015	703		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3829	0.108	1012	0.087		4.0			7		29			1013	674		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3868	0.064	1014	0.064		4.0			8		26			1015	718		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3901	0.174	1010	0.174		4.0			8		23			1011	709		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3910	0.163	1010	0.163		4.0			8		28			1011	673		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4041	0.086	1014	0.054		4.0			8		11			1015	683		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4046	0.200	1014	0.160		4.0			8		24			1015	677		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4049	0.285	1014	0.178		4.0			8		22			1015	704		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4055	0.112	1012	0.112		4.0			8		19			1013	678		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4148	0.140	1012	0.112		4.0			8		8			1013	695		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4180	0.077	1012	0.077		4.0			8		27			1013	668		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4375	0.114	1012	0.071		4.0			8		22			1013	687		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4392	0.090	1012	0.072		4.0			8		26			1013	714		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4570	0.202	1014	0.126		4.0			8		25			1015	713		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4588	0.075	1012	0.060		4.0			8		24			1013	717		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4640	0.177	1012	0.142		4.0			8		20			1013	697		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4724	0.104	1014	0.065		4.0			8		29			1015	708		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4734	0.307	1010	0.192		4.0			8		13			1011	684		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4810	0.165	1010	0.132		4.0			8		29			1011	689		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4850	0.073	1014	0.058		4.0			8		18			1015	685		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4854	0.185	1010	0.148		4.0			7		26			1011	661		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4869	0.170	1014	0.106		4.0			8		33			1015	705		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4961	0.236	1010	0.147		4.0			8		22			1011	646		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5045	0.197	1010	0.197		4.0			8		18			1011	663		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5155	0.150	1014	0.120		4.0			8		21			1015	691		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5214	0.120	1012	0.075		4.0			8		23			1013	706		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5454	0.159	1010	0.099		4.0			8		32			1011	710		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5550	0.155	1010	0.124		4.0			8		27			1011	699		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5692	0.084	1014	0.084		4.0			8		13			1015	657		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5693	0.201	1014	0.160		4.0			8		33			1015	712		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5803	0.079	1014	0.079		4.0			8		30			1015	701		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5958	0.211	1010	0.132		4.0			8		21			1011	715		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6023	0.136	1012	0.085		4.0			8		25			1013	693		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6154	0.095	1012	0.095		4.0			8		22			1013	690		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6215	0.107	1010	0.086		4.0			8		26			1011	667		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6384	0.320	1014	0.200		4.0			8		22			1015	686		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6608	0.279	1012	0.174		4.0			8		25			1013	682		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6657	0.198	1012	0.198		4.0			8		30			1013	719		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6858	0.063	1012	0.063		4.0			5		33			1013	2503		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7117	0.157	1012	0.098		4.0			5		17			1013	2501		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7137	0.202	1010	0.162		4.0			8		27			1011	694		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7369	0.190	1014	0.119		4.0			5		38			1015	2499		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7369	0.079	1012	0.079		4.0			6		29			1013	2500		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7504	0.129	1010	0.103		4.0			6		23			1011	2505		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7695	0.209	1014	0.167		4.0			5		28			1015	2502		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7822	0.161	1014	0.161		4.0			5		20			1015	2504		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.7999	0.076	1010	0.076		4.0			8		18			1011	676		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8077	0.188	1010	0.117		4.0			5		22			1011	2506		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8521	0.134	1012	0.107		4.0			8		20			1013	721		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.8944	0.210	1012	0.131		4.0			5		36			1013	2507		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.9132	0.237	1014	0.190		4.0			8		16			1015	722		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.9386	0.178	1014	0.178		4.0			8		19			1015	727		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.9711	0.144	1010	0.144		4.0			8		18			1011	732		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.9951	0.092	1010	0.092		4.0			8		17			1011	725		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0679	0.169	1012	0.106		4.0			8		34			1013	724		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0735	0.131	1010	0.104		4.0			8		31			1011	731		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0883	0.169	1012	0.169		4.0			8		27			1013	746		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0959	0.206	1014	0.129		4.0			8		23			1015	749		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0967	0.097	1014	0.097		4.0			8		25			1015	780		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1250	0.185	1010	0.148		4.0			8		30			1011	741		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1414	0.143	1012	0.143		4.0			8		25			1013	729		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1674	0.065	1010	0.052		4.0			8		21			1011	753		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1677	0.079	1014	0.064		4.0			8		12			1015	744		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1743	0.136	1014	0.109		4.0			8		24			1015	723		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1754	0.135	1012	0.135		4.0			8		26			1013	748		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1758	0.127	1012	0.079		4.0			8		29			1013	726		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1957	0.089	1014	0.071		4.0			8		30			1015	757		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1997	0.178	1012	0.112		4.0			8		39			1013	720		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2298	0.087	1012	0.087		4.0			8		19			1013	728		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2300	0.230	1014	0.184		4.0			8		38			1015	754		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2353	0.285	1014	0.178		4.0			8		32			1015	767		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2416	0.239	1010	0.191		4.0			8		23			1011	750		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2496	0.221	1014	0.177		4.0			8		13			1015	751		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2547	0.177	1014	0.177		4.0			8		29			1015	798		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2730	0.299	1012	0.187		4.0			8		25			1013	747		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2790	0.103	1012	0.103		4.0			8		29			1013	776		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.2969	0.053	1010	0.053		4.0			8		18			1011	738		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3011	0.164	1010	0.164		4.0			8		28			1011	806		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3118	0.131	1012	0.131		4.0			8		28			1013	739		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3167	0.153	1012	0.123		4.0			8		21			1013	740		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3235	0.093	1014	0.058		4.0			8		22			1015	745		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3303	0.118	1010	0.118		4.0			8		28			1011	774		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3313	0.302	1012	0.189		4.0			8		22			1013	781		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3422	0.130	1014	0.130		4.0			8		24			1015	752		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3484	0.164	1010	0.164		4.0			8		25			1011	763		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3528	0.081	1014	0.065		4.0			8		31			1015	735		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3529	0.135	1010	0.135		4.0			8		24			1011	772		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3721	0.134	1010	0.107		4.0			8		18			1011	799		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3730	0.050	1012	0.050		4.0			8		29			1013	736		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3871	0.143	1012	0.114		4.0			8		32			1013	791		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3955	0.166	1012	0.166		4.0			8		21			1013	773		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3989	0.190	1014	0.190		4.0			8		30			1015	786		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.3991	0.228	1010	0.182		4.0			8		38			1011	818		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4042	0.082	1010	0.052		4.0			8		10			1011	737		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4176	0.126	1010	0.126		4.0			8		26			1011	775		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4241	0.119	1014	0.119		4.0			8		17			1015	770		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4250	0.089	1014	0.089		4.0			8		28			1015	730		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4296	0.085	1014	0.053		4.0			8		15			1015	734		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4330	0.276	1010	0.173		4.0			8		21			1011	797		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4396	0.193	1010	0.193		4.0			8		35			1011	784		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4457	0.282	1012	0.177		4.0			8		21			1013	743		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4474	0.054	1012	0.054		4.0			8		29			1013	795		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4500	0.104	1014	0.065		4.0			8		29			1015	769		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4539	0.122	1012	0.122		4.0			8		22			1013	733		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4626	0.103	1012	0.083		4.0			8		27			1013	760		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4637	0.104	1010	0.104		4.0			8		6			1011	792		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4787	0.184	1012	0.147		4.0			8		30			1013	801		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4791	0.089	1012	0.071		4.0			8		25			1013	793		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4806	0.290	1012	0.181		4.0			8		23			1013	766		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4819	0.054	1012	0.054		4.0			8		27			1013	785		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4826	0.290	1014	0.181		4.0			8		27			1015	782		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4833	0.177	1010	0.111		4.0			8		22			1011	764		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.4875	0.091	1012	0.072		4.0			8		25			1013	742		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5144	0.236	1014	0.189		4.0			8		23			1015	779		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5216	0.228	1012	0.142		4.0			8		23			1013	768		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5243	0.177	1010	0.177		4.0			8		19			1011	765		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5308	0.181	1014	0.181		4.0			8		25			1015	796		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5361	0.108	1014	0.108		4.0			8		25			1015	756		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5523	0.058	1012	0.058		4.0			8		27			1013	822		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5554	0.204	1010	0.163		4.0			8		19			1011	803		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5555	0.172	1010	0.137		4.0			8		29			1011	794		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5597	0.295	1010	0.185		4.0			8		20			1011	802		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5639	0.120	1012	0.096		4.0			8		31			1013	810		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5650	0.091	1014	0.091		4.0			8		21			1015	761		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5710	0.054	1012	0.054		4.0			8		25			1013	808		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5799	0.171	1012	0.137		4.0			8		13			1013	817		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5838	0.211	1010	0.132		4.0			8		25			1011	789		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5892	13.976	1000	8.735		3			2		5			1001	33		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.5992	0.100	1010	0.100		4.0			8		19			1011	758		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6008	0.185	1010	0.115		4.0			8		10			1011	809		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6017	7.082	1006	7.082		3			4		9			1007	32		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6040	0.317	1010	0.198		4.0			8		29			1011	783		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6051	9.770	1006	7.816		2			5		9			1007	37		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6278	0.162	1014	0.101		4.0			8		29			1015	777		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6286	9.645	1002	6.028		2			3		7			1003	34		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6297	0.150	1010	0.150		4.0			8		27			1011	755		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6326	6.668	1006	6.668		3			3		6			1007	30		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6547	0.137	1014	0.110		4.0			8		20			1015	800		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6549	0.176	1012	0.176		4.0			8		12			1013	813		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6601	0.143	1012	0.143		4.0			8		24			1013	804		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6635	0.199	1010	0.124		4.0			8		25			1011	759		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6679	11.242	1008	7.026		3			2		10			1009	31		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6699	0.224	1010	0.180		4.0			8		22			1011	821		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6835	11.217	1006	7.010		2			4		2			1007	35		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6979	0.153	1010	0.153		4.0			9		14			1011	815		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6991	0.124	1012	0.099		4.0			8		33			1013	819		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.7147	0.152	1014	0.095		4.0			8		18			1015	814		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.7249	0.089	1012	0.072		4.0			8		23			1013	778		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.7502	0.120	1010	0.120		4.0			8		30			1011	787		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.7771	0.090	1012	0.090		4.0			8		25			1013	771		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.7986	0.284	1012	0.177		4.0			8		32			1013	790		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8048	0.118	1012	0.094		4.0			8		23			1013	820		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8072	0.268	1014	0.168		4.0			8		21			1015	788		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8169	0.156	1012	0.125		4.0			8		16			1013	841		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8227	0.149	1010	0.149		4.0			8		17			1011	812		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8257	0.165	1014	0.165		4.0			8		33			1015	762		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.8728	0.095	1012	0.059		4.0			8		17			1013	816		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9243	0.176	1012	0.141		4.0			8		16			1013	843		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9408	0.295	1010	0.184		4.0			8		23			1011	811		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9419	0.189	1014	0.189		4.0			8		26			1015	848		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9428	0.184	1014	0.147		4.0			8		19			1015	850		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9432	0.303	1014	0.189		4.0			8		21			1015	824		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9629	0.152	1012	0.122		4.0			8		25			1013	853		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9664	0.258	1010	0.161		4.0			8		18			1011	839		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0181	0.054	1012	0.054		4.0			8		27			1013	836		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0377	0.108	1014	0.086		4.0			8		32			1015	842		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0403	0.067	1014	0.053		4.0			8		24			1015	833		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0470	0.239	1014	0.191		4.0			8		27			1015	807		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0613	0.112	1010	0.070		4.0			8		20			1011	837		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0616	0.111	1014	0.089		4.0			8		23			1015	845		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0680	0.094	1010	0.076		4.0			8		22			1011	847		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.0979	0.234	1012	0.187		4.0			8		19			1013	838		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1010	0.083	1010	0.052		4.0			8		26			1011	826		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1266	0.191	1010	0.153		4.0			8		30			1011	852		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1490	0.208	1010	0.130		4.0			8		27			1011	840		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1588	0.203	1010	0.162		4.0			8		15			1011	844		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1786	0.164	1010	0.131		4.0			8		29			1011	825		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1788	0.198	1012	0.159		4.0			8		29			1013	851		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2106	0.163	1014	0.102		4.0			8		28			1015	832		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2212	0.189	1012	0.189		4.0			8		25			1013	805		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2427	0.166	1012	0.103		4.0			8		5			1013	846		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2432	0.161	1012	0.128		4.0			8		25			1013	829		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2619	0.202	1010	0.126		4.0			8		29			1011	823		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2654	0.120	1014	0.096		4.0			8		26			1015	834		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2794	0.194	1014	0.121		4.0			8		29			1015	828		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2823	0.222	1010	0.139		4.0			8		22			1011	830		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2898	0.087	1012	0.054		4.0			8		20			1013	827		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3101	0.221	1010	0.177		4.0			8		21			1011	831		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3294	0.065	1014	0.065		4.0			8		18			1015	854		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3484	0.067	1012	0.053		4.0			8		27			1013	849		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5062	0.135	1014	0.108		4.0			8		26			1015	835		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5691	0.167	1010	0.104		4.0			5		20			1011	2509		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5768	0.089	1010	0.089		4.0			8		23			1011	872		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5830	0.177	1014	0.177		4.0			5		16			1015	2510		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6127	0.175	1012	0.175		4.0			5		26			1013	2511		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6216	0.105	1012	0.084		4.0			8		26			1013	869		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6546	0.073	1010	0.073		4.0			8		27			1011	859		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6597	0.151	1010	0.151		4.0			5		21			1011	2508		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6668	0.217	1012	0.174		4.0			8		17			1013	855		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6812	0.185	1010	0.148		4.0			8		21			1011	856		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6844	0.096	1010	0.096		4.0			8		27			1011	862		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6942	0.185	1012	0.148		4.0			8		17			1013	858		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.7020	0.100	1010	0.100		4.0			8		19			1011	865		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.7821	0.074	1014	0.074		4.0			8		17			1015	860		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8124	0.140	1010	0.112		4.0			8		26			1011	857		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8143	0.109	1010	0.087		4.0			8		17			1011	861		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8524	0.131	1012	0.082		4.0			8		19			1013	864		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8539	0.160	1010	0.160		4.0			8		13			1011	867		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8554	0.191	1014	0.153		4.0			8		21			1015	868		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9476	0.224	1014	0.179		4.0			8		20			1015	871		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0228	0.094	1012	0.094		4.0			8		28			1013	863		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0579	0.205	1012	0.128		4.0			8		25			1013	881		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0724	0.105	1012	0.084		4.0			8		20			1013	866		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0856	0.073	1014	0.059		4.0			5		20			1015	2514		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0912	0.204	1010	0.163		4.0			8		25			1011	885		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1125	0.118	1010	0.118		4.0			5		29			1011	2516		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1219	0.127	1010	0.127		4.0			5		40			1011	2512		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1326	0.108	1010	0.086		4.0			5		14			1011	2513		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1343	0.274	1010	0.171		4.0			8		20			1011	895		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1386	0.124	1012	0.077		4.0			8		32			1013	889		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1563	0.114	1010	0.092		4.0			8		25			1011	877		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1749	0.301	1010	0.188		4.0			8		18			1011	875		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1892	0.131	1012	0.131		4.0			8		22			1013	945		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2003	0.147	1014	0.118		4.0			8		21			1015	896		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2025	0.152	1012	0.152		4.0			8		37			1013	911		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2267	0.130	1014	0.104		4.0			5		23			1015	2515		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2339	0.163	1012	0.163		4.0			8		28			1013	870		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2429	0.181	1012	0.181		4.0			9		27			1013	884		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2607	0.227	1010	0.142		4.0			8		32			1011	874		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2701	0.254	1012	0.159		4.0			8		16			1013	894		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3033	0.138	1014	0.110		4.0			8		26			1015	917		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3059	0.117	1014	0.093		4.0			9		34			1015	892		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3433	0.175	1010	0.110		4.0			8		22			1011	878		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3657	0.184	1010	0.115		4.0			8		29			1011	899		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3658	0.147	1010	0.118		4.0			8		29			1011	890		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3859	0.181	1010	0.181		4.0			8		25			1011	888		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.3996	0.156	1014	0.097		4.0			8		26			1015	879		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4008	0.195	1010	0.122		4.0			8		27			1011	897		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4013	0.230	1014	0.144		4.0			8		25			1015	913		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4045	0.118	1014	0.118		4.0			8		25			1015	883		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4103	0.098	1010	0.098		4.0			9		18			1011	955		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4275	0.076	1012	0.076		4.0			8		27			1013	873		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4306	0.144	1014	0.144		4.0			8		25			1015	887		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4369	0.165	1012	0.103		4.0			8		24			1013	922		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4389	0.206	1012	0.129		4.0			8		30			1013	946		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4397	0.170	1012	0.136		4.0			9		19			1013	940		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4424	0.117	1014	0.093		4.0			8		16			1015	931		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4429	0.072	1012	0.072		4.0			8		31			1013	912		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4461	0.180	1010	0.180		4.0			8		25			1011	891		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4613	0.114	1010	0.091		4.0			8		22			1011	948		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4629	0.095	1010	0.095		4.0			8		31			1011	915		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4632	0.184	1012	0.184		4.0			8		22			1013	880		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4644	0.164	1010	0.164		4.0			8		30			1011	916		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4644	0.134	1010	0.134		4.0			8		25			1011	900		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4813	0.164	1014	0.131		4.0			8		21			1015	910		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4971	0.180	1012	0.144		4.0			8		34			1013	943		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5172	0.167	1014	0.167		4.0			8		28			1015	908		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5204	0.216	1010	0.173		4.0			8		21			1011	893		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5213	0.264	1014	0.165		4.0			8		19			1015	950		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5253	0.198	1010	0.158		4.0			5		43			1011	2521		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5271	0.221	1012	0.176		4.0			5		29			1013	2519		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5330	0.137	1012	0.137		4.0			8		20			1013	942		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5410	0.077	1010	0.077		4.0			5		23			1011	2517		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5411	0.138	1014	0.086		4.0			5		27			1015	2518		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5442	0.240	1012	0.192		4.0			8		22			1013	903		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5503	0.096	1014	0.077		4.0			8		22			1015	898		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5505	0.101	1010	0.063		4.0			8		26			1011	904		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5508	0.135	1010	0.108		4.0			8		30			1011	929		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5508	0.216	1012	0.135		4.0			8		28			1013	936		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5509	0.120	1014	0.120		4.0			5		39			1015	2520		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5605	0.083	1012	0.083		4.0			8		29			1013	925		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5692	0.211	1010	0.132		4.0			8		18			1011	930		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5718	0.149	1010	0.119		4.0			8		17			1011	906		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5722	0.145	1014	0.145		4.0			8		12			1015	882		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5732	0.072	1014	0.058		4.0			8		32			1015	944		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5750	0.130	1012	0.104		4.0			8		27			1013	939		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5789	0.146	1010	0.117		4.0			8		26			1011	953		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5840	0.236	1014	0.189		4.0			8		30			1015	947		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5851	0.205	1010	0.164		4.0			8		24			1011	923		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5890	0.101	1014	0.101		4.0			8		28			1015	938		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5983	0.121	1010	0.121		4.0			8		24			1011	924		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6176	0.290	1010	0.181		4.0			8		22			1011	902		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6255	0.304	1012	0.190		4.0			8		25			1013	920		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6278	0.231	1012	0.145		4.0			8		31			1013	907		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6331	0.240	1010	0.192		4.0			8		25			1011	886		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6334	0.174	1010	0.174		4.0			8		26			1011	934		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6340	0.113	1012	0.070		4.0			9		21			1013	914		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6417	0.082	1012	0.051		4.0			9		24			1013	926		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6510	0.266	1010	0.166		4.0			8		17			1011	928		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6602	0.269	1012	0.168		4.0			8		28			1013	901		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6614	0.123	1012	0.077		4.0			8		34			1013	927		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6668	0.187	1012	0.187		4.0			5		14			1013	2524		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6777	0.187	1010	0.187		4.0			6		40			1011	2522		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6868	0.205	1012	0.164		4.0			8		25			1013	921		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6921	0.052	1014	0.052		4.0			8		35			1015	876		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7007	0.190	1014	0.190		4.0			8		26			1015	909		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7174	0.123	1012	0.077		4.0			6		47			1013	2523		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7194	0.218	1010	0.174		4.0			8		21			1011	905		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7414	0.074	1014	0.074		4.0			8		24			1015	933		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7451	0.308	1014	0.193		4.0			8		29			1015	919		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7470	0.084	1012	0.067		4.0			8		22			1013	954		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7528	0.102	1014	0.102		4.0			8		34			1015	952		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7552	0.085	1010	0.068		4.0			8		27			1011	937		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7632	0.099	1012	0.062		4.0			8		31			1013	932		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7682	0.174	1010	0.174		4.0			8		20			1011	951		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8053	0.107	1012	0.086		4.0			8		25			1013	965		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8119	0.101	1010	0.063		4.0			9		26			1011	935		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8283	0.140	1010	0.112		4.0			5		1			1011	2526		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8424	0.310	1010	0.193		4.0			5		30			1011	2527		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8441	0.222	1012	0.177		4.0			8		28			1013	964		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8534	0.248	1010	0.155		4.0			8		39			1011	918		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8588	0.130	1014	0.104		4.0			5		22			1015	2525		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.8722	0.200	1014	0.125		4.0			5		19			1015	2528		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9185	0.306	1014	0.191		4.0			8		29			1015	963		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9239	0.115	1010	0.072		4.0			8		30			1011	961		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9272	0.142	1012	0.089		4.0			8		23			1013	941		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9469	0.187	1010	0.149		4.0			8		25			1011	958		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9748	0.204	1012	0.128		4.0			9		24			1013	967		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9767	0.074	1014	0.059		4.0			8		23			1015	987		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0025	0.125	1010	0.125		4.0			8		28			1011	970		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0055	0.202	1012	0.126		4.0			8		27			1013	1000		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0117	0.231	1012	0.144		4.0			8		26			1013	949		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0160	0.242	1010	0.194		4.0			5		32			1011	2531		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0227	0.124	1012	0.124		4.0			8		23			1013	966		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0229	0.137	1010	0.110		4.0			8		22			1011	957		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0235	0.106	1012	0.066		4.0			8		32			1013	997		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0386	0.274	1010	0.171		4.0			8		27			1011	992		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0396	0.104	1012	0.104		4.0			8		30			1013	999		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.0976	0.111	1012	0.089		4.0			8		22			1013	974		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1132	0.087	1010	0.070		4.0			8		23			1011	988		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1134	0.090	1012	0.056		4.0			8		26			1013	956		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1510	0.259	1012	0.162		4.0			9		31			1013	995		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1611	0.107	1010	0.067		4.0			8		23			1011	968		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1696	0.155	1014	0.124		4.0			8		29			1015	993		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1779	0.130	1014	0.130		4.0			8		23			1015	960		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1802	0.115	1012	0.092		4.0			8		17			1013	996		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1803	0.150	1012	0.120		4.0			8		19			1013	982		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1893	0.282	1012	0.176		4.0			8		15			1013	983		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1905	0.094	1014	0.094		4.0			5		19			1015	2530		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2057	0.194	1014	0.121		4.0			8		29			1015	986		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2065	0.141	1010	0.088		4.0			8		28			1011	973		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2103	0.062	1014	0.062		4.0			8		27			1015	998		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2153	0.119	1012	0.119		4.0			8		16			1013	991		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2192	0.188	1012	0.150		4.0			8		22			1013	959		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2205	0.075	1014	0.075		4.0			8		26			1015	978		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2260	0.155	1012	0.097		4.0			4		17			1013	2529		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2336	0.175	1014	0.140		4.0			8		29			1015	981		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2347	0.142	1014	0.142		4.0			6		34			1015	2532		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2379	0.289	1014	0.180		4.0			8		23			1015	962		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2430	0.122	1012	0.098		4.0			8		24			1013	1002		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2535	0.107	1010	0.107		4.0			8		14			1011	1001		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2627	0.070	1012	0.056		4.0			8		31			1013	989		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2635	0.144	1012	0.116		4.0			8		16			1013	994		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2691	0.167	1014	0.167		4.0			9		19			1015	984		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.3118	0.184	1010	0.184		4.0			8		16			1011	990		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.3207	0.172	1012	0.138		4.0			8		25			1013	975		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.3321	0.157	1014	0.098		4.0			8		20			1015	972		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.3572	0.193	1012	0.154		4.0			5		27			1013	2533		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4014	0.096	1014	0.096		4.0			8		21			1015	985		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4058	0.193	1012	0.154		4.0			8		23			1013	979		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4145	0.119	1010	0.119		4.0			8		25			1011	977		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4396	0.097	1014	0.097		4.0			8		27			1015	980		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4550	0.115	1010	0.115		4.0			5		13			1011	2534		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5008	0.249	1012	0.155		4.0			5		33			1013	2537		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5162	0.120	1014	0.096		4.0			8		23			1015	969		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5202	0.187	1010	0.187		4.0			5		35			1011	2536		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5281	0.294	1012	0.184		4.0			6		14			1013	2535		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5363	0.131	1012	0.105		4.0			5		15			1013	2538		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5420	0.190	1012	0.119		4.0			8		28			1013	976		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5771	0.246	1014	0.197		4.0			5		10			1015	2543		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6463	0.081	1012	0.081		4.0			5		13			1013	2540		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6465	0.145	1012	0.091		4.0			5		7			1013	2539		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6661	0.259	1014	0.162		4.0			5		27			1015	2542		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6748	0.089	1010	0.071		4.0			6		35			1011	2541		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6836	1.439	1012	1.439		3			4		24			1013	2931		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6913	2.148	1004	1.718		3			4		7			1005	2925		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7023	0.131	1010	0.131		4.0			8		21			1011	1003		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7212	1.813	1014	1.451		3			5		9			1015	2891		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7304	3.061	1010	2.449		3			6		16			1011	2933		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7410	2.310	1012	1.848		3			5		7			1013	2900		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7424	2.183	1002	1.746		3			6		18			1003	2914		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7431	3.639	1010	2.274		3			3		27			1011	2911		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7432	1.811	1004	1.449		3			5		23			1005	2906		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7433	1.663	1010	1.663		3			5		18			1011	2892		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7437	2.703	1010	2.162		3			3		11			1011	2929		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7489	2.750	1014	1.719		3			5		23			1015	2909		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7546	3.439	1000	2.150		3			7		7			1001	2908		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7573	3.684	1004	2.303		3			4		7			1005	2893		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7576	1.821	1004	1.457		3			2		7			1005	2935		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7606	2.305	1014	1.844		3			4		10			1015	2930		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7612	1.471	1014	1.471		3			3		15			1015	2905		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7653	3.161	1004	1.976		3			6		18			1005	2919		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7660	3.289	1012	2.056		3			2		13			1013	2895		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7661	2.333	1002	1.458		3			5		21			1003	2898		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7674	3.027	1004	2.422		3			6		16			1005	2928		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7767	3.604	1000	2.253		3			5		14			1001	2937		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7793	0.170	1012	0.136		4.0			5		50			1013	2544		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7827	2.237	1014	2.237		3			3		11			1015	2936		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7831	2.903	1014	2.323		3			6		6			1015	2899		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7880	2.476	1010	1.981		3			5		25			1011	2912		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7896	2.249	1014	1.405		3			5		13			1015	2897		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7923	3.892	1012	2.432		3			6		17			1013	2901		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7988	3.633	1002	2.271		3			4		24			1003	2903		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8012	1.750	1000	1.400		3			8		22			1001	2924		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8105	0.190	1012	0.190		4.0			8		27			1013	971		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8120	2.146	1010	1.716		3			7		23			1011	2910		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8130	2.488	1012	1.555		3			7		15			1013	2902		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8168	3.569	1004	2.230		3			5		22			1005	2904		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8171	1.792	1002	1.434		3			6		26			1003	2896		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8176	2.149	1010	2.149		3			6		23			1011	2932		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8188	2.279	1012	2.279		3			5		13			1013	2907		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8223	2.549	1010	1.593		3			4		8			1011	2890		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8256	2.062	1000	1.649		3			4		17			1001	2923		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8311	2.600	1004	1.625		3			6		8			1005	2917		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8397	2.670	1010	1.669		3			7		9			1011	2916		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8459	2.426	1004	1.941		3			5		12			1005	2918		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8545	2.803	1004	2.242		3			4		14			1005	2894		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8548	1.822	1000	1.457		3			5		19			1001	2927		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8590	1.412	1010	1.412		3			4		16			1011	2915		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8640	1.530	1010	1.530		3			6		21			1011	2938		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8689	3.849	1000	2.405		3			5		22			1001	2926		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8979	1.956	1012	1.956		3			6		26			1013	2913		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9076	0.190	1014	0.190		4.0			5		28			1015	2545		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9086	2.713	1012	2.170		3			5		16			1013	2934		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9216	1.825	1000	1.460		3			7		27			1001	2920		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0711	0.138	1014	0.138		4.0			8		27			1015	1009		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0748	0.194	1012	0.121		4.0			8		20			1013	1004		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.1305	0.172	1010	0.107		4.0			8		23			1011	1006		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2328	0.101	1010	0.063		4.0			5		15			1011	2546		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2577	0.078	1010	0.078		4.0			8		28			1011	1010		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2770	0.100	1014	0.080		4.0			5		17			1015	2550		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2804	0.059	1014	0.059		4.0			6		40			1015	2549		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2830	0.240	1010	0.192		4.0			9		28			1011	1005		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.2982	0.275	1014	0.172		4.0			6		30			1015	2547		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.3060	0.290	1012	0.181		4.0			6		24			1013	2548		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.3910	0.207	1014	0.165		4.0			8		32			1015	1007		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.4017	0.142	1014	0.113		4.0			9		19			1015	1008		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.4602	0.168	1014	0.168		4.0			8		22			1015	1030		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.4932	0.207	1010	0.165		4.0			8		28			1011	1011		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5243	0.160	1012	0.100		4.0			8		28			1013	1037		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5376	0.096	1012	0.077		4.0			8		21			1013	1036		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5781	0.066	1010	0.053		4.0			9		21			1011	1043		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5804	0.160	1012	0.160		4.0			8		23			1013	1023		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.6464	0.104	1014	0.083		4.0			8		28			1015	1029		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.6534	0.111	1012	0.069		4.0			8		24			1013	1032		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.6542	0.094	1012	0.094		4.0			8		23			1013	1012		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.6654	0.224	1014	0.179		4.0			8		24			1015	1024		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7043	0.074	1010	0.074		4.0			9		25			1011	1022		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7178	0.177	1010	0.177		4.0			8		22			1011	1034		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7234	0.098	1012	0.098		4.0			8		23			1013	1028		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7238	0.317	1012	0.198		4.0			5		9			1013	2552		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7446	0.134	1012	0.084		4.0			8		28			1013	1013		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7520	0.083	1012	0.083		4.0			8		27			1013	1033		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7646	0.075	1010	0.060		4.0			6		44			1011	2554		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7651	0.109	1010	0.109		4.0			9		15			1011	1038		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7660	0.204	1014	0.163		4.0			5		29			1015	2551		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7670	0.119	1014	0.074		4.0			5		26			1015	2553		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7674	0.188	1010	0.188		4.0			8		24			1011	1021		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7732	0.098	1010	0.098		4.0			8		18			1011	1020		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7733	0.136	1014	0.109		4.0			8		23			1015	1017		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7898	0.163	1010	0.131		4.0			9		20			1011	1025		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.7904	0.239	1010	0.192		4.0			8		28			1011	1041		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8014	0.178	1012	0.142		4.0			8		25			1013	1019		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8278	0.209	1010	0.131		4.0			8		13			1011	1035		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8355	0.164	1014	0.103		4.0			8		26			1015	1040		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8360	0.103	1010	0.082		4.0			9		25			1011	1044		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8428	0.135	1010	0.108		4.0			8		22			1011	1014		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8448	0.192	1010	0.154		4.0			8		20			1011	1026		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8875	0.243	1010	0.194		4.0			9		17			1011	1039		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.8955	0.220	1014	0.138		4.0			8		24			1015	1027		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9033	0.182	1010	0.145		4.0			8		27			1011	1016		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9054	0.125	1012	0.078		4.0			8		18			1013	1042		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9262	0.050	1014	0.050		4.0			8		22			1015	1031		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.9329	0.162	1010	0.130		4.0			8		25			1011	1018		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.0526	0.211	1014	0.169		4.0			8		36			1015	1067		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1272	0.057	1012	0.057		4.0			8		18			1013	1015		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1303	0.109	1010	0.109		4.0			8		28			1011	1049		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1938	0.170	1010	0.106		4.0			8		28			1011	1058		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2073	5.727	1004	5.727		3			6		4			1005	40		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2211	6.605	1002	6.605		3			3		3			1003	46		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2407	9.841	1006	7.873		2			5		9			1007	47		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2705	7.064	1006	5.651		3			5		11			1007	48		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2747	13.308	1006	8.318		2			3		5			1007	42		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2787	8.029	1006	8.029		3			3		7			1007	41		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2795	6.922	1008	6.922		4			4		3			1009	39		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2845	6.803	1002	5.442		4			5		8			1003	44		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.2984	8.139	1006	6.511		3			3		8			1007	43		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3101	10.406	1008	8.324		4			3		10			1009	45		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3216	6.427	1008	5.142		4			5		12			1009	38		2				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3744	0.125	1010	0.125		4.0			8		26			1011	1061		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3850	0.094	1010	0.094		4.0			8		24			1011	1053		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.3880	0.145	1010	0.116		4.0			8		28			1011	1073		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.4226	0.088	1012	0.071		4.0			8		26			1013	1054		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.4359	0.154	1014	0.154		4.0			8		31			1015	1062		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.4394	0.234	1010	0.187		4.0			8		24			1011	1063		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.4443	0.157	1014	0.126		4.0			8		23			1015	1052		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.4573	0.175	1014	0.140		4.0			8		26			1015	1072		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5019	0.161	1010	0.129		4.0			8		23			1011	1060		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5404	0.123	1012	0.123		4.0			8		20			1013	1050		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5419	0.120	1014	0.096		4.0			8		30			1015	1051		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5626	0.177	1014	0.142		4.0			5		20			1015	2555		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5669	0.127	1010	0.127		4.0			8		29			1011	1069		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5908	0.073	1010	0.073		4.0			9		16			1011	1071		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6197	0.138	1010	0.138		4.0			8		23			1011	1048		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6321	0.126	1010	0.126		4.0			8		16			1011	1066		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6399	0.233	1010	0.146		4.0			8		20			1011	1056		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6404	0.108	1010	0.108		4.0			9		20			1011	1057		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6431	0.290	1012	0.181		4.0			8		23			1013	1065		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6689	0.185	1010	0.148		4.0			6		28			1011	2558		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6734	0.095	1012	0.059		4.0			5		24			1013	2557		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6739	0.171	1010	0.137		4.0			8		24			1011	1059		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7048	0.180	1014	0.180		4.0			8		18			1015	1055		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7211	0.093	1014	0.074		4.0			8		22			1015	1046		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7435	0.197	1014	0.158		4.0			9		29			1015	1047		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7463	0.198	1014	0.198		4.0			8		10			1015	1064		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7909	0.163	1012	0.102		4.0			5		17			1013	2556		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8291	0.071	1010	0.071		4.0			8		31			1011	1045		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8871	0.216	1010	0.135		4.0			5		43			1011	2559		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9087	0.161	1010	0.100		4.0			8		25			1011	1068		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9309	0.197	1012	0.157		4.0			4		28			1013	2560		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9462	0.234	1012	0.187		4.0			8		22			1013	1070		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1519	0.315	1014	0.197		4.0			5		25			1015	2561		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1586	0.169	1014	0.105		4.0			8		27			1015	1092		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1658	0.060	1010	0.060		4.0			5		23			1011	2562		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2465	0.163	1014	0.163		4.0			6		16			1015	2566		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2689	0.172	1014	0.107		4.0			6		15			1015	2564		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2786	0.099	1010	0.062		4.0			5		28			1011	2565		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2824	0.166	1014	0.166		4.0			5		20			1015	2563		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2901	0.244	1012	0.195		4.0			9		32			1013	1096		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2974	0.095	1010	0.076		4.0			9		18			1011	1081		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2991	0.054	1012	0.054		4.0			5		32			1013	2567		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2991	0.061	1010	0.061		4.0			9		23			1011	1098		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3074	0.187	1012	0.187		4.0			8		22			1013	1090		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3574	0.222	1012	0.139		4.0			8		22			1013	1089		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3685	0.104	1014	0.104		4.0			8		25			1015	1083		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3782	0.075	1014	0.060		4.0			8		27			1015	1077		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3851	0.175	1014	0.140		4.0			8		26			1015	1075		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4020	0.196	1010	0.123		4.0			8		25			1011	1085		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4065	0.146	1012	0.117		4.0			8		33			1013	1087		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4325	0.259	1014	0.162		4.0			8		31			1015	1094		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4909	0.140	1010	0.112		4.0			8		19			1011	1088		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5448	0.148	1014	0.118		4.0			8		29			1015	1084		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5528	0.058	1014	0.058		4.0			8		27			1015	1100		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5530	0.205	1012	0.164		4.0			8		20			1013	1099		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5612	0.188	1012	0.151		4.0			8		23			1013	1080		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5751	0.231	1014	0.185		4.0			9		23			1015	1082		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5777	0.176	1014	0.141		4.0			9		25			1015	1086		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5901	0.150	1014	0.120		4.0			8		27			1015	1095		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5979	0.069	1012	0.055		4.0			8		29			1013	1078		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6258	0.090	1010	0.056		4.0			8		31			1011	1141		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6414	0.101	1014	0.081		4.0			8		18			1015	1097		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6449	0.102	1010	0.102		4.0			9		22			1011	1091		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6534	0.158	1012	0.158		4.0			9		28			1013	1101		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6778	0.165	1014	0.132		4.0			9		21			1015	1074		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6826	0.060	1010	0.060		4.0			8		18			1011	1093		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6835	0.079	1014	0.063		4.0			8		22			1015	1079		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6849	0.063	1014	0.063		4.0			8		23			1015	1076		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.7653	0.230	1010	0.184		4.0			8		22			1011	1143		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8223	0.193	1012	0.154		4.0			8		17			1013	1103		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8498	0.141	1010	0.113		4.0			5		23			1011	2569		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8507	0.104	1012	0.104		4.0			8		20			1013	1106		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8666	0.195	1014	0.122		4.0			5		36			1015	2568		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8778	0.183	1012	0.146		4.0			8		25			1013	1137		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8790	0.079	1010	0.079		4.0			8		20			1011	1104		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8991	0.069	1010	0.069		4.0			8		18			1011	1110		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.9171	0.236	1014	0.148		4.0			8		23			1015	1127		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.9270	0.151	1014	0.121		4.0			8		30			1015	1146		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.9322	0.269	1010	0.168		4.0			9		16			1011	1111		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.9363	0.180	1014	0.113		4.0			5		23			1015	2572		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.9906	0.145	1012	0.116		4.0			8		23			1013	1147		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0120	0.230	1014	0.184		4.0			8		27			1015	1120		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0321	0.155	1010	0.124		4.0			5		24			1011	2573		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0361	0.295	1012	0.184		4.0			8		20			1013	1115		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0490	0.188	1014	0.150		4.0			8		20			1015	1112		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0687	0.072	1010	0.072		4.0			8		30			1011	1167		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0810	0.104	1012	0.065		4.0			8		25			1013	1151		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0837	0.096	1014	0.060		4.0			8		33			1015	1126		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0893	0.131	1012	0.131		4.0			8		27			1013	1184		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0912	0.100	1010	0.100		4.0			5		22			1011	2571		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0981	0.070	1014	0.070		4.0			8		20			1015	1116		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.0983	0.313	1012	0.195		4.0			8		26			1013	1123		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1186	0.219	1012	0.175		4.0			8		32			1013	1102		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1305	0.168	1012	0.135		4.0			6		26			1013	2570		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1341	0.178	1010	0.142		4.0			9		23			1011	1125		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1525	0.095	1014	0.095		4.0			8		19			1015	1107		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1610	0.174	1012	0.174		4.0			8		22			1013	1119		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1709	0.221	1010	0.177		4.0			8		22			1011	1105		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1744	0.143	1012	0.143		4.0			9		22			1013	1118		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1745	0.172	1012	0.172		4.0			8		26			1013	1109		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1805	0.053	1012	0.053		4.0			8		11			1013	1153		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1946	0.157	1010	0.157		4.0			8		23			1011	1132		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1955	0.144	1014	0.144		4.0			8		21			1015	1157		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2016	0.285	1014	0.178		4.0			8		22			1015	1155		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2160	0.105	1014	0.105		4.0			8		25			1015	1128		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2172	0.153	1012	0.122		4.0			8		30			1013	1142		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2226	0.104	1014	0.104		4.0			8		22			1015	1133		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2248	0.105	1014	0.065		4.0			8		24			1015	1144		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2302	0.090	1010	0.072		4.0			8		33			1011	1136		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2319	0.149	1014	0.119		4.0			8		24			1015	1113		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2344	0.180	1012	0.180		4.0			8		30			1013	1135		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2349	0.088	1014	0.070		4.0			9		17			1015	1139		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2543	0.086	1010	0.086		4.0			8		19			1011	1131		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2724	0.184	1010	0.184		4.0			8		18			1011	1174		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2773	0.247	1010	0.198		4.0			8		22			1011	1134		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2865	0.077	1012	0.077		4.0			9		21			1013	1169		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2891	0.213	1014	0.171		4.0			8		25			1015	1172		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2959	0.144	1012	0.115		4.0			8		20			1013	1188		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2993	0.139	1014	0.139		4.0			9		20			1015	1207		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2996	0.113	1014	0.090		4.0			8		25			1015	1108		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3043	0.260	1012	0.163		4.0			8		26			1013	1177		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3080	0.219	1014	0.175		4.0			8		18			1015	1156		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3099	0.281	1014	0.176		4.0			8		25			1015	1122		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3127	0.183	1012	0.183		4.0			8		24			1013	1162		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3152	0.214	1014	0.134		4.0			8		21			1015	1124		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3203	0.118	1012	0.118		4.0			8		35			1013	1164		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3372	0.146	1010	0.091		4.0			8		24			1011	1179		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3615	0.070	1012	0.070		4.0			8		15			1013	1173		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3658	0.111	1012	0.111		4.0			8		23			1013	1165		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3722	0.230	1014	0.184		4.0			9		20			1015	1159		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3807	0.064	1010	0.064		4.0			8		21			1011	1117		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3936	0.081	1012	0.065		4.0			8		18			1013	1145		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4027	0.209	1014	0.130		4.0			8		26			1015	1121		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4062	0.197	1014	0.158		4.0			8		30			1015	1140		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4148	0.199	1012	0.159		4.0			5		38			1013	2574		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4352	0.175	1012	0.175		4.0			8		26			1013	1161		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4480	0.064	1010	0.064		4.0			8		25			1011	1193		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4535	0.194	1014	0.155		4.0			8		17			1015	1114		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4571	0.061	1010	0.061		4.0			8		30			1011	1190		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4622	0.155	1012	0.097		4.0			5		28			1013	2582		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4623	0.195	1010	0.122		4.0			9		22			1011	1163		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4667	0.285	1010	0.178		4.0			9		32			1011	1130		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4669	0.102	1010	0.102		4.0			5		24			1011	2575		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4756	0.190	1014	0.190		4.0			5		29			1015	2578		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4760	0.084	1014	0.067		4.0			5		23			1015	2577		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4766	0.188	1014	0.151		4.0			8		29			1015	1160		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4829	0.197	1014	0.197		4.0			8		23			1015	1129		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5008	0.209	1014	0.167		4.0			8		30			1015	1152		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5018	0.195	1014	0.195		4.0			8		37			1015	1168		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5041	0.195	1014	0.195		4.0			5		14			1015	2580		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5080	0.117	1012	0.073		4.0			8		17			1013	1166		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5120	0.145	1014	0.116		4.0			5		39			1015	2579		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5158	0.076	1012	0.076		4.0			8		25			1013	1149		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5172	0.098	1012	0.078		4.0			9		25			1013	1186		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5349	0.107	1014	0.067		4.0			5		17			1015	2581		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5353	0.079	1012	0.079		4.0			5		6			1013	2576		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5365	0.107	1012	0.085		4.0			9		17			1013	1192		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5504	0.186	1014	0.149		4.0			8		19			1015	1183		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5570	0.063	1012	0.051		4.0			9		31			1013	1181		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5734	0.195	1010	0.156		4.0			8		22			1011	1178		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5873	0.218	1012	0.174		4.0			8		25			1013	1191		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5894	0.163	1014	0.131		4.0			8		19			1015	1170		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6168	0.058	1012	0.058		4.0			8		28			1013	1154		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6217	0.067	1014	0.053		4.0			8		21			1015	1189		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6333	0.149	1014	0.093		4.0			5		29			1015	2583		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6552	0.106	1012	0.066		4.0			9		31			1013	1209		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6589	0.241	1014	0.192		4.0			8		20			1015	1199		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6591	0.108	1010	0.086		4.0			8		29			1011	1212		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6749	0.166	1012	0.166		4.0			8		30			1013	1203		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.6912	0.106	1012	0.106		4.0			8		23			1013	1219		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7024	0.135	1010	0.135		4.0			9		18			1011	1158		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7098	0.204	1010	0.128		4.0			8		20			1011	1208		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7136	0.119	1010	0.095		4.0			8		25			1011	1202		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7149	0.087	1014	0.069		4.0			8		17			1015	1218		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7195	0.097	1010	0.061		4.0			8		23			1011	1220		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7252	0.107	1010	0.107		4.0			8		18			1011	1210		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7254	0.264	1010	0.165		4.0			9		27			1011	1150		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7381	0.152	1012	0.121		4.0			8		34			1013	1211		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7462	0.156	1012	0.156		4.0			8		22			1013	1175		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7568	0.151	1014	0.120		4.0			8		30			1015	1216		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7591	0.133	1014	0.133		4.0			9		26			1015	1205		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7628	0.131	1012	0.082		4.0			9		29			1013	1171		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7677	0.160	1012	0.160		4.0			9		25			1013	1148		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7687	0.160	1014	0.128		4.0			8		35			1015	1138		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7750	0.135	1010	0.108		4.0			8		16			1011	1206		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7764	0.171	1012	0.171		4.0			8		22			1013	1187		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.7956	0.198	1010	0.198		4.0			8		28			1011	1217		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8220	0.110	1010	0.110		4.0			8		27			1011	1176		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8233	0.214	1010	0.134		4.0			9		31			1011	1180		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8250	0.158	1010	0.099		4.0			8		25			1011	1198		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8387	0.091	1012	0.057		4.0			8		23			1013	1195		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8393	0.123	1014	0.098		4.0			8		21			1015	1200		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8645	0.237	1010	0.189		4.0			8		33			1011	1196		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8778	0.113	1014	0.090		4.0			8		20			1015	1214		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8902	0.146	1012	0.091		4.0			8		28			1013	1237		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8998	0.150	1010	0.094		4.0			8		21			1011	1213		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9015	0.125	1014	0.078		4.0			8		31			1015	1279		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9362	0.113	1014	0.070		4.0			8		23			1015	1197		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9409	0.211	1012	0.169		4.0			8		24			1013	1204		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9689	0.167	1012	0.167		4.0			8		18			1013	1185		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9892	0.269	1010	0.168		4.0			8		32			1011	1230		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9956	0.076	1014	0.061		4.0			8		24			1015	1182		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.0011	0.291	1012	0.182		4.0			9		21			1013	1215		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.0046	0.248	1010	0.198		4.0			8		23			1011	1201		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1032	0.187	1010	0.187		4.0			8		32			1011	1222		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1083	0.122	1010	0.122		4.0			8		28			1011	1253		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1244	0.269	1010	0.168		4.0			8		20			1011	1194		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1440	0.292	1010	0.182		4.0			8		34			1011	1233		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1711	0.080	1010	0.050		4.0			8		29			1011	1275		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1941	0.199	1012	0.159		4.0			8		17			1013	1285		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2060	0.284	1012	0.177		4.0			8		34			1013	1267		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2092	0.213	1010	0.133		4.0			8		29			1011	1260		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2139	0.080	1012	0.080		4.0			9		25			1013	1227		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2159	0.192	1012	0.192		4.0			5		24			1013	2584		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2174	0.083	1014	0.052		4.0			8		27			1015	1296		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2178	0.148	1010	0.119		4.0			8		27			1011	1268		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2303	0.140	1012	0.140		4.0			8		24			1013	1291		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2304	0.200	1012	0.160		4.0			8		27			1013	1281		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2526	0.289	1014	0.181		4.0			8		28			1015	1242		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2599	0.250	1012	0.156		4.0			8		32			1013	1265		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2684	0.296	1010	0.185		4.0			8		27			1011	1250		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2727	0.078	1012	0.062		4.0			8		29			1013	1245		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2741	0.211	1012	0.169		4.0			8		25			1013	1239		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2789	0.166	1010	0.166		4.0			8		21			1011	1228		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2847	0.161	1014	0.161		4.0			9		24			1015	1280		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2863	0.221	1012	0.138		4.0			8		23			1013	1235		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2872	0.214	1010	0.134		4.0			8		25			1011	1248		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2942	0.110	1014	0.110		4.0			9		27			1015	1300		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2943	0.094	1012	0.075		4.0			8		26			1013	1298		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2979	0.139	1014	0.111		4.0			9		27			1015	1258		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3045	0.100	1012	0.080		4.0			8		24			1013	1299		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3096	0.126	1014	0.101		4.0			9		22			1015	1223		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3196	0.163	1010	0.130		4.0			8		12			1011	1259		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3222	0.155	1012	0.097		4.0			9		17			1013	1302		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3232	0.133	1012	0.133		4.0			8		24			1013	1241		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3243	0.215	1012	0.172		4.0			8		27			1013	1257		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3296	0.123	1010	0.077		4.0			8		28			1011	1269		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3433	0.107	1012	0.067		4.0			8		24			1013	1221		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3443	0.063	1014	0.051		4.0			8		29			1015	1232		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3515	0.138	1012	0.110		4.0			9		23			1013	1234		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3680	0.068	1010	0.068		4.0			8		29			1011	1261		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3698	0.123	1014	0.098		4.0			8		28			1015	1231		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3719	0.312	1012	0.195		4.0			8		28			1013	1225		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3724	0.175	1012	0.175		4.0			8		28			1013	1226		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3984	0.117	1014	0.094		4.0			8		22			1015	1229		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4055	0.082	1010	0.065		4.0			9		21			1011	1288		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4163	0.072	1012	0.058		4.0			8		26			1013	1255		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4231	0.113	1010	0.071		4.0			8		25			1011	1249		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4252	0.171	1014	0.171		4.0			8		25			1015	1293		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4317	0.141	1014	0.088		4.0			8		29			1015	1294		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4339	0.160	1010	0.128		4.0			8		27			1011	1295		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4340	0.176	1010	0.141		4.0			9		21			1011	1289		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4343	0.291	1014	0.182		4.0			8		16			1015	1266		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4362	0.157	1012	0.126		4.0			8		32			1013	1246		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4417	0.309	1012	0.193		4.0			8		20			1013	1277		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4494	0.248	1012	0.198		4.0			8		23			1013	1247		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4541	0.268	1012	0.167		4.0			8		22			1013	1276		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4566	0.116	1012	0.072		4.0			8		24			1013	1238		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4647	0.175	1012	0.175		4.0			8		24			1013	1256		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4680	0.189	1010	0.189		4.0			9		19			1011	1264		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4764	0.165	1012	0.132		4.0			8		22			1013	1270		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4865	0.160	1012	0.128		4.0			9		25			1013	1286		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4892	0.132	1012	0.132		4.0			8		20			1013	1273		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.4960	0.187	1012	0.149		4.0			8		26			1013	1297		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5104	0.120	1010	0.075		4.0			8		31			1011	1254		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5133	0.251	1012	0.157		4.0			9		29			1013	1271		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5188	0.221	1012	0.138		4.0			9		26			1013	1244		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5250	0.093	1010	0.093		4.0			8		25			1011	1251		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5283	0.111	1014	0.089		4.0			8		22			1015	1292		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5311	0.073	1010	0.058		4.0			8		28			1011	1272		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5386	0.171	1010	0.107		4.0			8		24			1011	1252		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5470	0.246	1014	0.197		4.0			8		27			1015	1301		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5526	0.189	1014	0.151		4.0			9		25			1015	1236		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5602	0.185	1014	0.115		4.0			8		30			1015	1263		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5755	0.245	1010	0.153		4.0			8		34			1011	1290		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.5913	0.163	1012	0.102		4.0			8		26			1013	1282		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.6133	0.267	1014	0.167		4.0			9		27			1015	1240		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7062	0.095	1012	0.095		4.0			9		22			1013	1287		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7121	0.160	1010	0.128		4.0			8		20			1011	1278		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7207	0.101	1012	0.101		4.0			9		24			1013	1274		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7290	0.188	1010	0.151		4.0			8		21			1011	1284		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7302	0.240	1012	0.150		4.0			8		22			1013	1262		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7360	0.180	1014	0.144		4.0			8		33			1015	1283		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8656	0.199	1012	0.159		4.0			8		24			1013	1224		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8747	0.063	1014	0.051		4.0			5		6			1015	2594		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9065	0.063	1012	0.063		4.0			5		25			1013	2591		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9432	0.216	1010	0.135		4.0			4		35			1011	2586		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9433	0.063	1012	0.050		4.0			5		35			1013	2589		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9453	0.211	1012	0.169		4.0			4		4			1013	2588		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9513	0.176	1010	0.110		4.0			5		21			1011	2593		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9573	0.245	1012	0.196		4.0			5		38			1013	2600		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9626	0.207	1010	0.165		4.0			5		41			1011	2592		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9733	0.111	1010	0.089		4.0			5		32			1011	2598		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9826	0.132	1014	0.082		4.0			5		14			1015	2587		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9860	0.170	1012	0.170		4.0			5		22			1013	2597		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9933	0.071	1014	0.057		4.0			5		29			1015	2585		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9985	0.073	1012	0.073		4.0			5		40			1013	2596		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0280	0.192	1014	0.192		4.0			5		33			1015	2595		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0317	0.319	1014	0.199		4.0			5		34			1015	2590		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0974	0.182	1010	0.114		4.0			4		16			1011	2599		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.1376	0.140	1012	0.087		4.0			9		35			1013	1307		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.1895	0.093	1014	0.093		4.0			9		29			1015	1303		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.2243	0.146	1014	0.146		4.0			9		23			1015	1243		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.2330	0.193	1010	0.193		4.0			8		20			1011	1308		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.2636	0.165	1012	0.165		4.0			8		23			1013	1306		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.3120	0.205	1010	0.164		4.0			8		25			1011	1310		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.3552	0.096	1014	0.096		4.0			8		23			1015	1309		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.3799	0.094	1010	0.094		4.0			8		28			1011	1318		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.3843	0.315	1012	0.197		4.0			5		30			1013	2603		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.3863	0.055	1014	0.055		4.0			8		23			1015	1319		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4002	0.108	1014	0.108		4.0			5		23			1015	2602		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4047	0.086	1014	0.068		4.0			5		23			1015	2601		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4055	0.141	1014	0.113		4.0			5		22			1015	2604		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4779	0.147	1010	0.118		4.0			8		26			1011	1304		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4782	0.312	1010	0.195		4.0			5		28			1011	2605		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.5711	0.157	1012	0.098		4.0			8		15			1013	1305		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.6292	0.137	1012	0.086		4.0			9		23			1013	1314		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.6466	0.094	1014	0.094		4.0			8		32			1015	1313		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.6752	0.167	1010	0.134		4.0			9		25			1011	1312		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7102	0.103	1012	0.103		4.0			5		26			1013	2608		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7249	0.076	1012	0.061		4.0			9		25			1013	1311		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7256	0.067	1014	0.067		4.0			8		23			1015	1354		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7380	0.174	1012	0.109		4.0			8		22			1013	1317		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7418	0.176	1010	0.176		4.0			8		27			1011	1329		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7535	0.151	1014	0.121		4.0			8		24			1015	1320		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7823	0.161	1010	0.129		4.0			5		18			1011	2606		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7903	0.063	1012	0.063		4.0			9		26			1013	1341		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7911	0.095	1010	0.095		4.0			5		25			1011	2609		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7952	0.178	1014	0.111		4.0			5		26			1015	2607		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7990	0.175	1010	0.175		4.0			5		30			1011	2610		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.8028	0.083	1012	0.052		4.0			9		22			1013	1355		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.8485	0.158	1012	0.158		4.0			8		26			1013	1316		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.8640	0.310	1014	0.194		4.0			8		24			1015	1351		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.8946	0.087	1012	0.087		4.0			8		30			1013	1321		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.8981	0.203	1014	0.127		4.0			8		22			1015	1315		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9015	0.190	1014	0.119		4.0			8		25			1015	1349		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9082	0.083	1014	0.052		4.0			9		21			1015	1326		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9175	0.209	1012	0.131		4.0			9		17			1013	1363		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9224	0.241	1012	0.192		4.0			4		41			1013	2611		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9400	0.194	1012	0.155		4.0			8		25			1013	1386		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9580	0.105	1010	0.084		4.0			8		21			1011	1393		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9583	0.102	1010	0.082		4.0			8		20			1011	1408		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9645	0.292	1010	0.183		4.0			8		26			1011	1331		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9661	0.224	1012	0.140		4.0			9		23			1013	1336		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9949	0.107	1014	0.067		4.0			9		25			1015	1358		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9953	0.135	1012	0.085		4.0			8		21			1013	1390		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0069	0.068	1012	0.068		4.0			8		30			1013	1332		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0098	0.203	1010	0.127		4.0			8		27			1011	1389		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0218	0.161	1012	0.129		4.0			8		15			1013	1398		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0232	0.086	1012	0.086		4.0			8		27			1013	1353		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0249	0.091	1010	0.091		4.0			9		19			1011	1373		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0250	0.167	1014	0.105		4.0			8		22			1015	1348		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0256	0.051	1014	0.051		4.0			9		24			1015	1356		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0289	0.066	1010	0.053		4.0			8		26			1011	1323		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0299	0.179	1010	0.144		4.0			8		28			1011	1342		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0300	0.166	1010	0.133		4.0			9		27			1011	1397		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0334	0.176	1012	0.140		4.0			8		19			1013	1409		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0344	0.247	1014	0.155		4.0			8		25			1015	1367		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0360	0.112	1010	0.112		4.0			8		24			1011	1335		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0373	0.156	1014	0.156		4.0			9		28			1015	1350		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0405	0.225	1010	0.180		4.0			8		24			1011	1407		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0801	0.139	1010	0.139		4.0			8		22			1011	1411		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0826	0.230	1010	0.184		4.0			9		20			1011	1399		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0899	0.286	1012	0.179		4.0			9		23			1013	1339		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1041	0.295	1014	0.185		4.0			8		30			1015	1366		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1206	0.177	1010	0.142		4.0			8		25			1011	1362		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1234	0.112	1014	0.090		4.0			8		27			1015	1322		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1246	0.198	1014	0.159		4.0			8		16			1015	1375		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1275	0.165	1012	0.165		4.0			8		25			1013	1325		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1289	0.093	1014	0.074		4.0			8		24			1015	1404		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1334	0.059	1014	0.059		4.0			8		21			1015	1400		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1474	0.176	1010	0.176		4.0			8		23			1011	1369		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1511	0.152	1010	0.122		4.0			8		29			1011	1395		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1563	0.051	1014	0.051		4.0			8		28			1015	1376		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1578	0.157	1012	0.098		4.0			9		26			1013	1383		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1617	0.154	1012	0.123		4.0			9		33			1013	1357		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1625	0.158	1012	0.127		4.0			9		26			1013	1414		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1653	0.183	1010	0.147		4.0			9		24			1011	1416		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1663	0.151	1012	0.095		4.0			8		29			1013	1346		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1666	0.168	1010	0.105		4.0			9		32			1011	1413		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1722	0.075	1012	0.075		4.0			8		23			1013	1360		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1722	0.120	1012	0.096		4.0			8		26			1013	1401		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1746	0.063	1012	0.050		4.0			8		23			1013	1364		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1762	0.116	1012	0.116		4.0			9		20			1013	1385		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1791	2.300	1012	1.840		3			4		15			1013	2978		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1794	0.073	1014	0.059		4.0			9		24			1015	1343		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1805	0.113	1010	0.090		4.0			9		20			1011	1384		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1856	0.120	1010	0.120		4.0			8		28			1011	1405		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1885	0.067	1010	0.067		4.0			8		21			1011	1378		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1991	0.174	1012	0.109		4.0			8		19			1013	1402		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2006	0.143	1012	0.143		4.0			9		25			1013	1340		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2012	0.058	1014	0.058		4.0			8		22			1015	1387		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2042	0.191	1010	0.119		4.0			9		28			1011	1374		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2072	0.079	1010	0.079		4.0			9		20			1011	1388		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2144	0.052	1014	0.052		4.0			9		20			1015	1372		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2154	0.140	1010	0.087		4.0			8		28			1011	1347		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2208	0.098	1012	0.098		4.0			8		25			1013	1330		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2208	0.120	1012	0.096		4.0			8		20			1013	1370		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2217	0.186	1012	0.149		4.0			8		24			1013	1361		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2218	0.187	1012	0.187		4.0			9		26			1013	1333		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2230	0.140	1010	0.087		4.0			8		23			1011	1324		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2264	2.484	1014	1.988		3			5		17			1015	2951		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2266	3.243	1002	2.027		3			6		13			1003	2949		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2286	2.575	1000	1.609		3			6		8			1001	2953		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2358	0.210	1012	0.168		4.0			8		25			1013	1334		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2378	0.124	1010	0.124		4.0			4		20			1011	2613		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2412	3.687	1004	2.304		3			5		15			1005	2975		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2497	2.842	1002	1.776		3			5		10			1003	2980		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2501	0.103	1012	0.083		4.0			8		19			1013	1441		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2503	0.145	1012	0.145		4.0			8		22			1013	1434		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2513	3.531	1004	2.207		3			5		20			1005	2940		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2519	0.181	1010	0.113		4.0			9		24			1011	1344		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2544	0.223	1010	0.140		4.0			8		20			1011	1382		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2549	0.108	1010	0.086		4.0			9		23			1011	1406		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2572	0.057	1012	0.057		4.0			5		28			1013	2615		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2598	2.315	1014	2.315		3			5		15			1015	2957		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2637	2.442	1000	1.526		3			5		18			1001	2959		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2664	0.144	1012	0.090		4.0			5		26			1013	2616		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2695	0.112	1014	0.112		4.0			5		36			1015	2617		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2732	0.132	1014	0.105		4.0			5		50			1015	2614		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2740	2.949	1000	2.359		3			5		15			1001	2952		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2746	3.061	1000	2.449		3			5		20			1001	2970		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2752	3.886	1000	2.429		3			4		16			1001	2969		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2765	0.185	1010	0.185		4.0			8		19			1011	1410		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2784	2.572	1002	2.058		3			5		13			1003	2943		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2789	0.095	1010	0.076		4.0			8		25			1011	1352		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2804	0.185	1010	0.116		4.0			8		28			1011	1377		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2837	1.504	1014	1.504		3			5		16			1015	2964		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2845	0.080	1010	0.080		4.0			4		39			1011	2612		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2864	0.139	1014	0.111		4.0			8		25			1015	1379		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2866	1.855	1000	1.484		3			5		9			1001	2939		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2911	3.084	1012	2.468		3			5		12			1013	2976		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2930	0.245	1014	0.196		4.0			8		21			1015	1423		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2935	0.146	1014	0.146		4.0			9		17			1015	1368		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2971	2.340	1014	2.340		3			5		18			1015	2981		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2998	2.404	1004	1.503		3			5		12			1005	2958		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3007	3.647	1004	2.279		3			5		10			1005	2974		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3029	3.897	1012	2.436		3			5		17			1013	2955		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3031	2.729	1010	2.183		3			5		13			1011	2948		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3036	0.146	1014	0.117		4.0			9		28			1015	1425		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3044	2.091	1002	2.091		3			4		16			1003	2961		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3062	0.155	1012	0.097		4.0			8		28			1013	1403		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3067	0.168	1012	0.105		4.0			8		31			1013	1391		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3080	2.903	1014	2.322		3			5		16			1015	2942		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3136	3.810	1004	2.381		3			5		17			1005	2962		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3138	1.977	1004	1.581		3			4		16			1005	2973		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3145	1.488	1012	1.488		3			5		14			1013	2968		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3160	0.070	1014	0.056		4.0			8		20			1015	1422		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3220	0.092	1010	0.073		4.0			8		27			1011	1437		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3250	1.838	1004	1.838		3			5		9			1005	2960		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3278	3.054	1010	1.909		3			5		10			1011	2947		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3300	0.196	1012	0.196		4.0			8		20			1013	1412		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3308	3.070	1010	2.456		3			6		11			1011	2967		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3358	1.932	1012	1.546		3			5		12			1013	2956		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3382	3.123	1002	1.952		3			5		11			1003	2966		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3413	0.123	1012	0.123		4.0			9		28			1013	1337		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3442	0.193	1014	0.193		4.0			8		25			1015	1426		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3474	2.375	1000	1.900		3			5		13			1001	2982		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3517	2.883	1002	1.802		3			5		18			1003	2972		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3520	0.302	1010	0.189		4.0			8		29			1011	1510		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3536	3.405	1002	2.128		3			6		20			1003	2965		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3587	2.544	1002	1.590		3			5		15			1003	2950		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3716	0.185	1014	0.185		4.0			9		25			1015	1327		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3732	0.113	1010	0.113		4.0			8		24			1011	1359		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3788	0.085	1014	0.085		4.0			8		21			1015	1380		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3819	0.227	1012	0.142		4.0			8		18			1013	1328		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3975	2.880	1004	1.800		3			4		14			1005	2963		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3985	2.747	1004	2.197		3			5		14			1005	2977		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4026	0.283	1014	0.177		4.0			8		32			1015	1430		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4047	0.166	1010	0.132		4.0			8		28			1011	1452		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4119	0.086	1012	0.086		4.0			8		24			1013	1371		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4146	0.116	1012	0.072		4.0			9		17			1013	1428		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4165	0.224	1012	0.140		4.0			8		26			1013	1381		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4185	0.183	1014	0.183		4.0			8		28			1015	1443		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4241	0.185	1010	0.185		4.0			8		26			1011	1482		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4252	0.296	1014	0.185		4.0			8		27			1015	1475		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4414	0.092	1012	0.092		4.0			8		19			1013	1427		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4416	0.100	1012	0.100		4.0			9		17			1013	1478		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4483	0.102	1014	0.064		4.0			9		24			1015	1418		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4649	0.150	1012	0.150		4.0			8		26			1013	1419		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4740	0.183	1010	0.115		4.0			8		22			1011	1440		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5146	0.237	1014	0.189		4.0			9		28			1015	1457		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5185	0.292	1012	0.183		4.0			9		24			1013	1497		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5270	0.080	1014	0.064		4.0			8		20			1015	1459		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5281	0.202	1010	0.161		4.0			8		28			1011	1448		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5286	0.176	1010	0.176		4.0			8		27			1011	1394		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5333	0.266	1012	0.166		4.0			8		26			1013	1421		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5388	0.120	1010	0.120		4.0			9		30			1011	1338		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5461	0.135	1012	0.085		4.0			9		33			1013	1436		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5556	0.182	1012	0.182		4.0			9		23			1013	1424		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5577	0.308	1012	0.193		4.0			8		29			1013	1433		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5600	0.168	1014	0.168		4.0			8		24			1015	1435		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5697	0.168	1010	0.135		4.0			9		34			1011	1432		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5806	0.062	1010	0.062		4.0			8		19			1011	1396		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5852	0.170	1010	0.106		4.0			8		27			1011	1345		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6013	0.096	1014	0.096		4.0			8		26			1015	1467		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6183	0.135	1010	0.108		4.0			8		31			1011	1442		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6216	0.126	1012	0.126		4.0			8		27			1013	1431		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6219	0.109	1012	0.087		4.0			8		24			1013	1501		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6317	0.117	1010	0.117		4.0			8		28			1011	1453		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6366	0.129	1010	0.081		4.0			8		19			1011	1483		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6385	0.144	1014	0.090		4.0			8		26			1015	1481		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6411	0.234	1014	0.187		4.0			8		19			1015	1365		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6461	0.117	1012	0.117		4.0			9		31			1013	1462		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6533	0.313	1012	0.196		4.0			8		20			1013	1451		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6585	0.219	1014	0.175		4.0			8		20			1015	1456		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6754	0.107	1010	0.107		4.0			9		23			1011	1417		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6767	0.193	1014	0.193		4.0			9		23			1015	1455		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6866	0.158	1012	0.099		4.0			8		28			1013	1472		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6905	0.178	1014	0.178		4.0			8		21			1015	1491		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6997	0.152	1012	0.122		4.0			8		31			1013	1473		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7019	0.162	1014	0.162		4.0			8		27			1015	1474		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7035	0.141	1012	0.088		4.0			8		33			1013	1439		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7052	0.223	1014	0.178		4.0			9		28			1015	1489		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7071	0.153	1014	0.122		4.0			9		22			1015	1438		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7080	0.065	1010	0.065		4.0			8		29			1011	1499		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7175	0.082	1012	0.082		4.0			8		22			1013	1469		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7283	0.193	1014	0.193		4.0			8		22			1015	1461		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7306	0.179	1012	0.179		4.0			8		23			1013	1494		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7316	0.221	1012	0.138		4.0			8		26			1013	1571		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7436	0.186	1012	0.186		4.0			9		25			1013	1512		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7573	0.075	1014	0.075		4.0			9		22			1015	1446		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7740	0.159	1012	0.099		4.0			9		26			1013	1420		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7760	0.225	1014	0.180		4.0			8		21			1015	1415		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7836	0.083	1010	0.067		4.0			9		30			1011	1485		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7841	0.109	1014	0.068		4.0			8		31			1015	1464		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7861	0.261	1014	0.163		4.0			8		25			1015	1488		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7954	0.142	1014	0.114		4.0			8		28			1015	1454		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7991	0.231	1014	0.185		4.0			8		26			1015	1465		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7996	0.149	1012	0.093		4.0			8		27			1013	1392		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8039	0.117	1012	0.117		4.0			8		28			1013	1463		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8218	0.092	1010	0.092		4.0			8		15			1011	1513		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8279	0.094	1010	0.094		4.0			8		33			1011	1477		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8363	0.067	1010	0.054		4.0			8		24			1011	1554		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8371	0.139	1012	0.139		4.0			8		22			1013	1445		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8689	0.126	1014	0.126		4.0			8		25			1015	1509		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8720	0.148	1012	0.148		4.0			8		26			1013	1495		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8759	0.186	1014	0.116		4.0			8		27			1015	1444		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8808	0.088	1010	0.055		4.0			9		25			1011	1468		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9018	0.132	1012	0.132		4.0			9		23			1013	1487		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9030	0.055	1014	0.055		4.0			8		23			1015	1502		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9070	0.113	1014	0.071		4.0			8		24			1015	1504		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9249	0.141	1010	0.141		4.0			5		35			1011	2618		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9330	0.135	1014	0.135		4.0			9		26			1015	1466		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9373	0.190	1014	0.190		4.0			9		29			1015	1539		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9512	0.225	1014	0.141		4.0			8		22			1015	1507		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9566	0.097	1014	0.077		4.0			9		21			1015	1490		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9577	0.120	1014	0.096		4.0			9		21			1015	1471		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9612	0.093	1014	0.074		4.0			9		29			1015	1450		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9733	0.140	1014	0.140		4.0			9		25			1015	1560		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9793	0.140	1014	0.112		4.0			8		22			1015	1500		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9794	0.129	1014	0.129		4.0			8		25			1015	1470		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9818	0.183	1012	0.183		4.0			8		36			1013	1460		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9975	0.085	1014	0.053		4.0			9		21			1015	1479		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9976	0.216	1010	0.135		4.0			8		25			1011	1514		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0051	0.195	1014	0.195		4.0			9		24			1015	1429		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0201	0.082	1012	0.051		4.0			8		31			1013	1447		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0373	0.170	1012	0.170		4.0			8		24			1013	1449		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0374	0.087	1010	0.069		4.0			9		20			1011	1484		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0836	0.296	1014	0.185		4.0			9		20			1015	1542		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0844	0.117	1012	0.094		4.0			8		19			1013	1492		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0860	0.060	1014	0.060		4.0			8		20			1015	1508		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0958	0.155	1012	0.097		4.0			8		25			1013	1550		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0975	0.108	1012	0.067		4.0			9		25			1013	1528		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1105	0.134	1014	0.084		4.0			9		21			1015	1548		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1318	0.071	1010	0.057		4.0			8		24			1011	1518		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1386	0.177	1014	0.141		4.0			9		22			1015	1476		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1429	0.077	1010	0.062		4.0			8		23			1011	1511		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1431	0.128	1010	0.128		4.0			8		24			1011	1555		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1435	0.166	1014	0.132		4.0			8		24			1015	1558		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1459	0.095	1014	0.095		4.0			8		23			1015	1505		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1463	0.068	1012	0.055		4.0			8		23			1013	1458		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1533	0.082	1012	0.065		4.0			8		22			1013	1535		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1736	0.142	1010	0.142		4.0			9		28			1011	1533		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1745	0.106	1014	0.085		4.0			9		31			1015	1534		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1835	0.068	1010	0.055		4.0			9		25			1011	1559		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1856	0.234	1012	0.146		4.0			8		21			1013	1584		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1890	0.098	1014	0.078		4.0			8		23			1015	1503		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1910	0.116	1014	0.093		4.0			5		36			1015	2621		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1914	0.261	1014	0.163		4.0			9		18			1015	1551		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2123	0.164	1010	0.103		4.0			9		32			1011	1498		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2135	0.228	1014	0.183		4.0			9		25			1015	1541		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2140	0.135	1010	0.108		4.0			8		27			1011	1556		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2227	0.127	1014	0.127		4.0			9		25			1015	1524		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2289	0.309	1014	0.193		4.0			9		24			1015	1570		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2319	0.191	1012	0.120		4.0			8		28			1013	1515		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2345	0.056	1010	0.056		4.0			8		28			1011	1553		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2379	0.113	1014	0.090		4.0			5		46			1015	2620		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2482	0.245	1010	0.196		4.0			8		21			1011	1480		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2483	0.164	1010	0.164		4.0			9		24			1011	1581		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2528	0.133	1010	0.107		4.0			8		22			1011	1567		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2576	0.112	1010	0.090		4.0			8		28			1011	1547		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2630	0.178	1010	0.178		4.0			8		27			1011	1544		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2730	0.251	1014	0.157		4.0			9		25			1015	1545		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2751	0.238	1014	0.191		4.0			8		23			1015	1526		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2762	0.200	1012	0.160		4.0			9		23			1013	1552		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2826	0.229	1010	0.143		4.0			5		32			1011	2619		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2876	0.173	1010	0.108		4.0			8		20			1011	1525		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2887	0.181	1014	0.181		4.0			8		22			1015	1523		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2908	0.134	1010	0.084		4.0			9		27			1011	1521		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3008	0.114	1014	0.114		4.0			8		25			1015	1538		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3048	0.136	1012	0.136		4.0			8		18			1013	1576		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3067	0.204	1014	0.127		4.0			8		17			1015	1486		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3079	0.155	1012	0.155		4.0			8		27			1013	1516		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3088	0.174	1010	0.139		4.0			9		24			1011	1557		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3132	0.218	1012	0.174		4.0			8		25			1013	1537		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3135	0.208	1014	0.130		4.0			9		31			1015	1613		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3145	0.242	1014	0.193		4.0			8		31			1015	1582		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3261	0.192	1010	0.120		4.0			8		27			1011	1540		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3266	0.225	1010	0.140		4.0			8		25			1011	1575		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3288	0.123	1010	0.123		4.0			8		20			1011	1543		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3366	0.109	1014	0.068		4.0			8		28			1015	1561		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3467	0.080	1014	0.080		4.0			8		32			1015	1568		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3560	0.156	1012	0.125		4.0			8		23			1013	1506		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3578	0.216	1012	0.173		4.0			9		25			1013	1531		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3620	0.051	1010	0.051		4.0			9		30			1011	1536		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3752	0.194	1012	0.121		4.0			8		21			1013	1612		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4013	0.198	1012	0.124		4.0			8		25			1013	1563		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4024	0.233	1014	0.187		4.0			8		25			1015	1520		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4071	0.138	1010	0.111		4.0			9		24			1011	1566		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4079	0.111	1012	0.111		4.0			8		24			1013	1532		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4121	0.108	1014	0.068		4.0			8		18			1015	1583		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4172	0.316	1012	0.197		4.0			9		23			1013	1527		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4301	0.168	1012	0.168		4.0			8		23			1013	1615		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4372	0.092	1012	0.058		4.0			8		18			1013	1619		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4493	0.133	1012	0.106		4.0			9		22			1013	1616		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4504	0.309	1010	0.193		4.0			9		26			1011	1618		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4511	0.105	1014	0.066		4.0			8		27			1015	1549		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4515	0.081	1014	0.051		4.0			8		22			1015	1598		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4524	0.184	1012	0.184		4.0			8		22			1013	1585		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4549	0.191	1014	0.119		4.0			8		22			1015	1564		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4586	0.117	1014	0.093		4.0			8		20			1015	1578		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4632	0.114	1010	0.091		4.0			9		26			1011	1493		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4804	0.139	1012	0.111		4.0			8		21			1013	1572		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4844	0.263	1014	0.165		4.0			4		12			1015	2622		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5026	0.194	1012	0.121		4.0			9		26			1013	1600		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5061	0.194	1012	0.121		4.0			9		28			1013	1517		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5209	0.166	1012	0.133		4.0			9		23			1013	1587		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5266	0.121	1012	0.097		4.0			8		21			1013	1580		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5367	0.197	1012	0.197		4.0			8		31			1013	1519		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5388	0.187	1012	0.150		4.0			8		26			1013	1529		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5421	0.179	1012	0.179		4.0			8		29			1013	1579		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5449	0.189	1010	0.151		4.0			5		26			1011	2624		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5556	0.132	1012	0.132		4.0			4		42			1013	2623		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5575	0.061	1012	0.061		4.0			8		32			1013	1626		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5611	0.236	1010	0.189		4.0			5		20			1011	2627		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5790	0.148	1012	0.118		4.0			5		31			1013	2625		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5961	0.260	1010	0.163		4.0			5		37			1011	2626		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5963	0.146	1014	0.092		4.0			9		26			1015	1565		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6098	0.143	1012	0.089		4.0			8		27			1013	1586		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6127	0.067	1012	0.054		4.0			8		31			1013	1617		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6170	0.243	1010	0.152		4.0			8		28			1011	1574		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6190	0.098	1010	0.062		4.0			8		25			1011	1606		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6227	0.064	1010	0.064		4.0			9		21			1011	1530		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6323	0.130	1010	0.104		4.0			9		26			1011	1569		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6409	0.117	1014	0.093		4.0			8		21			1015	1599		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6499	0.176	1010	0.176		4.0			4		29			1011	2629		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6501	0.178	1012	0.178		4.0			9		24			1013	1596		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6617	0.189	1010	0.118		4.0			8		23			1011	1546		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6785	0.089	1012	0.071		4.0			8		23			1013	1621		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6800	0.130	1012	0.130		4.0			9		20			1013	1522		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6998	0.245	1010	0.196		4.0			4		31			1011	2628		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7210	0.150	1012	0.150		4.0			8		24			1013	1597		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7261	0.118	1012	0.095		4.0			8		28			1013	1573		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7296	0.178	1014	0.178		4.0			9		27			1015	1496		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7368	0.207	1014	0.129		4.0			9		18			1015	1603		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7386	0.082	1014	0.051		4.0			8		25			1015	1624		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7440	0.293	1014	0.183		4.0			9		25			1015	1605		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7546	0.235	1012	0.147		4.0			8		22			1013	1592		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7569	0.276	1010	0.172		4.0			8		24			1011	1614		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7600	0.094	1012	0.075		4.0			8		28			1013	1602		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7658	0.180	1014	0.113		4.0			8		25			1015	1746		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7795	0.260	1014	0.162		4.0			8		28			1015	1607		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7862	0.233	1010	0.186		4.0			8		22			1011	1608		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7937	0.295	1014	0.184		4.0			4		29			1015	2639		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8156	0.156	1012	0.097		4.0			5		49			1013	2632		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8161	0.088	1010	0.070		4.0			9		27			1011	1627		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8241	0.230	1010	0.144		4.0			5		12			1011	2635		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8258	0.193	1012	0.193		4.0			8		28			1013	1591		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8278	0.176	1014	0.110		4.0			5		24			1015	2638		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8382	0.133	1010	0.133		4.0			9		25			1011	1577		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8473	0.181	1014	0.145		4.0			5		40			1015	2630		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8521	0.134	1012	0.107		4.0			9		26			1013	1590		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8548	0.182	1014	0.182		4.0			4		17			1015	2636		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8585	0.148	1014	0.148		4.0			4		26			1015	2640		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8627	0.148	1010	0.119		4.0			5		33			1011	2631		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9001	0.088	1014	0.088		4.0			5		22			1015	2633		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9046	0.164	1014	0.164		4.0			8		27			1015	1588		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9170	0.305	1014	0.190		4.0			8		27			1015	1601		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9186	0.169	1010	0.135		4.0			9		25			1011	1622		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9256	0.155	1014	0.124		4.0			8		33			1015	1620		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9274	0.061	1014	0.061		4.0			9		20			1015	1594		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9326	0.081	1012	0.065		4.0			8		24			1013	1611		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9340	0.144	1014	0.115		4.0			8		23			1015	1595		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9390	0.144	1012	0.090		4.0			8		24			1013	1727		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9478	0.071	1014	0.071		4.0			8		22			1015	1629		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0085	0.228	1012	0.142		4.0			8		20			1013	1593		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0105	0.289	1010	0.181		4.0			8		29			1011	1641		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0262	0.217	1010	0.174		4.0			8		26			1011	1604		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0263	0.142	1012	0.088		4.0			8		21			1013	1562		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0412	0.100	1014	0.080		4.0			8		19			1015	1610		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0459	0.110	1010	0.088		4.0			8		29			1011	1625		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0696	0.308	1010	0.192		4.0			9		26			1011	1589		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0713	0.096	1010	0.060		4.0			8		25			1011	1656		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0821	0.227	1012	0.142		4.0			8		23			1013	1822		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0896	0.197	1014	0.123		4.0			8		27			1015	1633		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0914	0.137	1012	0.137		4.0			9		26			1013	1644		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1048	0.230	1014	0.143		4.0			4		35			1015	2634		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1284	0.100	1010	0.063		4.0			5		17			1011	2637		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1346	0.114	1012	0.114		4.0			8		19			1013	1646		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1354	0.213	1014	0.171		4.0			9		27			1015	1623		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1372	0.096	1010	0.060		4.0			9		29			1011	1756		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1435	0.096	1014	0.077		4.0			9		23			1015	1691		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1477	0.255	1010	0.160		4.0			9		24			1011	1637		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1573	0.096	1010	0.096		4.0			8		22			1011	1630		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1689	0.304	1010	0.190		4.0			8		22			1011	1609		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1740	0.154	1010	0.123		4.0			8		30			1011	1628		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1750	0.231	1014	0.185		4.0			8		26			1015	1649		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1885	0.087	1012	0.087		4.0			8		21			1013	1647		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1934	0.124	1010	0.124		4.0			9		26			1011	1639		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2073	0.107	1010	0.067		4.0			8		22			1011	1632		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2083	0.246	1014	0.197		4.0			8		21			1015	1659		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2120	0.117	1014	0.094		4.0			8		25			1015	1657		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2210	0.145	1012	0.116		4.0			9		22			1013	1666		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2305	0.303	1010	0.190		4.0			8		28			1011	1661		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2519	0.157	1012	0.125		4.0			8		28			1013	1699		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2520	0.168	1010	0.105		4.0			8		25			1011	1681		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2720	0.221	1014	0.138		4.0			9		25			1015	1645		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2769	0.182	1014	0.145		4.0			8		26			1015	1648		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2797	0.071	1014	0.071		4.0			8		25			1015	1736		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2803	0.134	1010	0.084		4.0			9		22			1011	1654		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2820	0.190	1014	0.152		4.0			8		24			1015	1747		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2836	0.114	1010	0.114		4.0			9		20			1011	1643		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2900	0.162	1014	0.130		4.0			9		15			1015	1665		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2953	0.197	1014	0.197		4.0			8		25			1015	1655		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2981	0.134	1010	0.084		4.0			9		20			1011	1688		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3321	0.160	1014	0.160		4.0			9		27			1015	1711		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3343	0.101	1010	0.063		4.0			5		16			1011	2641		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3418	0.137	1014	0.137		4.0			8		23			1015	1652		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3422	0.105	1014	0.105		4.0			5		11			1015	2642		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3437	0.269	1012	0.168		4.0			9		21			1013	1670		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3489	0.175	1014	0.140		4.0			9		22			1015	1710		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3507	0.165	1010	0.165		4.0			9		19			1011	1651		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3525	0.310	1012	0.194		4.0			8		25			1013	1817		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3566	0.183	1014	0.114		4.0			8		26			1015	1732		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3575	0.067	1012	0.054		4.0			8		23			1013	1730		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3627	0.198	1014	0.124		4.0			8		18			1015	1631		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3643	0.206	1010	0.129		4.0			8		25			1011	1650		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3673	0.149	1010	0.119		4.0			8		28			1011	1774		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3675	0.212	1012	0.169		4.0			8		23			1013	1742		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3698	0.145	1010	0.145		4.0			9		27			1011	1664		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3712	0.206	1010	0.165		4.0			8		23			1011	1713		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3742	0.134	1014	0.134		4.0			8		24			1015	1702		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3829	0.113	1014	0.091		4.0			8		30			1015	1716		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3860	0.180	1012	0.180		4.0			9		29			1013	1752		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3900	0.236	1012	0.189		4.0			8		26			1013	1635		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3970	0.274	1014	0.171		4.0			8		21			1015	1782		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4030	0.123	1010	0.098		4.0			8		25			1011	1653		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4034	0.075	1010	0.075		4.0			9		26			1011	1757		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4050	0.182	1014	0.182		4.0			8		23			1015	1778		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4062	0.289	1014	0.181		4.0			9		30			1015	1634		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4102	0.179	1010	0.112		4.0			8		23			1011	1687		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4106	0.102	1012	0.102		4.0			8		30			1013	1679		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4118	0.182	1010	0.146		4.0			8		33			1011	1708		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4124	0.165	1012	0.132		4.0			9		21			1013	1662		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4180	0.227	1014	0.181		4.0			8		24			1015	1673		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4189	0.146	1010	0.146		4.0			8		18			1011	1749		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4264	0.311	1010	0.195		4.0			9		30			1011	1658		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4402	0.186	1010	0.186		4.0			8		25			1011	1695		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4422	0.158	1014	0.099		4.0			8		28			1015	1683		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4461	0.148	1012	0.092		4.0			8		23			1013	1741		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4477	0.093	1012	0.074		4.0			8		25			1013	1684		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4563	0.177	1010	0.142		4.0			8		19			1011	1728		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4760	0.156	1010	0.156		4.0			9		27			1011	1674		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4770	0.160	1012	0.128		4.0			9		27			1013	1745		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4786	0.175	1012	0.175		4.0			9		23			1013	1700		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4927	0.057	1012	0.057		4.0			8		26			1013	1735		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4934	0.166	1014	0.104		4.0			8		27			1015	1692		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5129	0.222	1014	0.178		4.0			9		29			1015	1725		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5155	0.132	1014	0.083		4.0			9		23			1015	1794		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5204	0.172	1012	0.172		4.0			8		25			1013	1703		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5219	0.117	1014	0.117		4.0			9		30			1015	1680		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5221	0.257	1012	0.161		4.0			8		27			1013	1792		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5231	0.170	1014	0.136		4.0			8		25			1015	1768		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5232	0.188	1012	0.188		4.0			9		21			1013	1698		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5306	0.091	1010	0.057		4.0			8		25			1011	1809		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5329	0.170	1010	0.136		4.0			8		28			1011	1754		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5356	0.085	1014	0.085		4.0			8		29			1015	1663		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5395	0.218	1014	0.175		4.0			9		28			1015	1697		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5405	0.069	1012	0.069		4.0			8		20			1013	1694		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5441	0.178	1012	0.143		4.0			9		27			1013	1738		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5452	0.172	1014	0.172		4.0			8		22			1015	1638		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5454	0.198	1010	0.198		4.0			9		24			1011	1726		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5474	0.148	1012	0.092		4.0			8		26			1013	1750		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5482	0.200	1014	0.160		4.0			8		27			1015	1839		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5495	0.094	1012	0.059		4.0			8		23			1013	1685		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5662	0.122	1014	0.097		4.0			8		23			1015	1802		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5663	0.139	1010	0.111		4.0			8		24			1011	1767		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5670	0.081	1012	0.081		4.0			9		19			1013	1788		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5764	0.176	1012	0.141		4.0			8		24			1013	1712		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5771	0.138	1010	0.138		4.0			8		28			1011	1636		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5811	0.095	1010	0.059		4.0			8		24			1011	1689		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5858	0.066	1012	0.053		4.0			8		23			1013	1740		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5878	0.117	1014	0.073		4.0			9		22			1015	1696		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5915	0.286	1010	0.179		4.0			8		27			1011	1770		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5940	0.083	1010	0.066		4.0			8		24			1011	1783		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5962	0.307	1012	0.192		4.0			8		23			1013	1785		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6124	0.102	1010	0.081		4.0			8		20			1011	1762		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6170	0.140	1012	0.140		4.0			8		16			1013	1693		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6190	0.165	1014	0.165		4.0			8		23			1015	1761		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6201	0.146	1012	0.117		4.0			8		25			1013	1690		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6246	0.176	1012	0.110		4.0			8		26			1013	1678		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6357	0.180	1012	0.113		4.0			8		22			1013	1669		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6381	0.193	1012	0.193		4.0			8		22			1013	1671		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6438	0.239	1010	0.191		4.0			9		20			1011	1714		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6462	0.130	1012	0.081		4.0			9		24			1013	1675		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6555	0.196	1010	0.196		4.0			9		29			1011	1744		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6565	0.203	1012	0.127		4.0			8		28			1013	1660		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6580	0.132	1014	0.082		4.0			8		22			1015	1836		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6585	0.172	1014	0.172		4.0			8		24			1015	1773		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6715	0.098	1010	0.061		4.0			9		23			1011	1667		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6740	0.201	1014	0.161		4.0			8		25			1015	1772		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6795	0.077	1012	0.061		4.0			8		30			1013	1779		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6874	0.112	1014	0.070		4.0			9		21			1015	1806		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6881	0.116	1012	0.116		4.0			8		22			1013	1763		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6899	0.235	1014	0.147		4.0			9		26			1015	1729		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6913	0.188	1014	0.117		4.0			8		25			1015	1789		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6962	0.217	1010	0.173		4.0			9		25			1011	1842		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6965	0.146	1010	0.117		4.0			9		24			1011	1755		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7041	0.142	1010	0.142		4.0			8		25			1011	1760		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7043	0.076	1014	0.060		4.0			8		25			1015	1682		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7125	0.103	1014	0.083		4.0			5		28			1015	2643		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7148	0.153	1014	0.122		4.0			8		26			1015	1715		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7193	0.165	1010	0.103		4.0			8		24			1011	1733		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7198	0.175	1014	0.110		4.0			8		24			1015	1748		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7224	0.093	1012	0.093		4.0			9		32			1013	1724		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7297	0.207	1014	0.165		4.0			8		24			1015	1718		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7308	0.215	1010	0.134		4.0			8		24			1011	1719		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7351	0.118	1012	0.094		4.0			9		26			1013	1722		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7402	0.178	1010	0.111		4.0			9		20			1011	1672		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7448	0.083	1014	0.083		4.0			9		27			1015	1677		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7467	0.063	1014	0.050		4.0			8		23			1015	1704		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7513	0.310	1014	0.194		4.0			8		25			1015	1799		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7529	0.118	1012	0.074		4.0			8		21			1013	1793		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7552	0.155	1010	0.124		4.0			8		23			1011	1739		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7568	0.138	1012	0.138		4.0			8		19			1013	1769		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7677	0.123	1012	0.077		4.0			9		26			1013	1705		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7743	0.055	1010	0.055		4.0			8		21			1011	1707		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7827	0.076	1014	0.076		4.0			8		27			1015	1721		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7907	0.094	1014	0.075		4.0			8		27			1015	1797		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7935	0.234	1014	0.146		4.0			8		19			1015	1766		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7962	0.106	1012	0.066		4.0			8		22			1013	1780		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7989	0.107	1010	0.107		4.0			9		24			1011	1843		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8022	0.164	1014	0.132		4.0			8		21			1015	1701		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8054	0.147	1012	0.147		4.0			9		22			1013	1786		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8081	0.182	1010	0.114		4.0			9		26			1011	1777		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8214	0.185	1014	0.148		4.0			8		25			1015	1800		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8256	0.267	1010	0.167		4.0			9		25			1011	1841		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8384	0.093	1012	0.093		4.0			8		26			1013	1810		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8407	0.190	1010	0.190		4.0			9		23			1011	1849		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8453	0.085	1012	0.085		4.0			8		18			1013	1861		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8453	0.165	1014	0.103		4.0			8		27			1015	1731		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8468	0.170	1014	0.136		4.0			9		23			1015	1820		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8497	0.103	1012	0.103		4.0			8		24			1013	1828		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8551	0.219	1014	0.137		4.0			8		21			1015	1845		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8613	0.122	1014	0.122		4.0			8		24			1015	1821		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8622	0.143	1010	0.089		4.0			8		22			1011	1668		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8626	0.085	1012	0.085		4.0			9		25			1013	1676		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8629	0.236	1014	0.189		4.0			8		28			1015	1743		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8769	0.180	1012	0.144		4.0			8		29			1013	1753		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8783	0.112	1014	0.112		4.0			8		25			1015	1815		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8804	0.172	1014	0.172		4.0			9		25			1015	1706		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8821	0.165	1010	0.103		4.0			9		23			1011	1751		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8835	0.057	1010	0.057		4.0			8		31			1011	1868		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8889	0.247	1014	0.197		4.0			8		23			1015	1787		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8897	0.148	1010	0.148		4.0			8		29			1011	1804		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8924	0.188	1010	0.117		4.0			8		26			1011	1737		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8949	0.230	1014	0.184		4.0			8		28			1015	1720		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.8979	0.108	1014	0.067		4.0			8		26			1015	1796		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9039	0.183	1014	0.183		4.0			9		22			1015	1795		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9048	0.259	1010	0.162		4.0			8		21			1011	1805		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9069	0.072	1010	0.072		4.0			8		28			1011	1823		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9094	0.201	1014	0.161		4.0			8		23			1015	1859		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9109	0.126	1012	0.126		4.0			8		23			1013	1640		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9196	0.208	1010	0.167		4.0			8		22			1011	1814		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9200	0.185	1014	0.185		4.0			8		23			1015	1830		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9204	0.098	1012	0.098		4.0			8		17			1013	1816		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9221	0.298	1012	0.186		4.0			8		24			1013	1775		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9224	0.219	1010	0.175		4.0			8		24			1011	1803		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9258	0.077	1012	0.062		4.0			8		21			1013	1717		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9259	0.194	1014	0.194		4.0			8		25			1015	1686		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9280	0.165	1012	0.132		4.0			9		26			1013	1876		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9291	0.094	1012	0.075		4.0			8		20			1013	1734		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9375	0.143	1010	0.089		4.0			8		27			1011	1784		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9388	0.271	1010	0.169		4.0			8		23			1011	1758		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9427	0.266	1014	0.166		4.0			9		23			1015	1854		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9497	0.198	1012	0.159		4.0			9		27			1013	1723		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9600	0.096	1014	0.096		4.0			8		24			1015	1848		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9726	0.194	1014	0.155		4.0			8		25			1015	1764		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9768	0.086	1010	0.068		4.0			9		26			1011	1781		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9810	0.242	1010	0.151		4.0			9		18			1011	1862		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9825	0.259	1012	0.162		4.0			9		23			1013	1829		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9878	0.146	1010	0.092		4.0			8		23			1011	1811		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9904	0.098	1012	0.098		4.0			8		22			1013	1874		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9917	0.072	1010	0.072		4.0			8		19			1011	1824		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.9927	0.184	1012	0.148		4.0			8		21			1013	1818		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0067	0.214	1014	0.171		4.0			9		32			1015	1827		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0094	0.166	1012	0.104		4.0			8		27			1013	1812		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0119	0.111	1012	0.089		4.0			8		21			1013	1863		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0186	0.192	1012	0.120		4.0			8		28			1013	1798		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0229	0.136	1014	0.085		4.0			9		20			1015	1801		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0241	0.100	1012	0.100		4.0			8		24			1013	1813		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0297	0.178	1012	0.111		4.0			9		30			1013	1858		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0315	0.231	1010	0.145		4.0			9		27			1011	1852		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0529	0.097	1014	0.060		4.0			9		27			1015	1867		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0545	0.220	1012	0.176		4.0			9		22			1013	1853		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0557	0.257	1012	0.161		4.0			8		28			1013	1834		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0710	0.128	1014	0.128		4.0			8		23			1015	1840		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0825	0.244	1010	0.153		4.0			8		20			1011	1791		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0831	0.264	1010	0.165		4.0			9		24			1011	1875		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0868	0.053	1014	0.053		4.0			9		27			1015	1808		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0872	0.262	1012	0.164		4.0			5		28			1013	2646		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0962	0.285	1012	0.178		4.0			9		22			1013	1846		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.0971	0.075	1010	0.060		4.0			8		26			1011	1860		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1042	0.183	1014	0.183		4.0			9		25			1015	1844		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1044	0.168	1014	0.168		4.0			8		24			1015	1825		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1045	0.075	1014	0.060		4.0			8		27			1015	1776		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1087	0.134	1012	0.107		4.0			4		36			1013	2648		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1088	0.225	1012	0.180		4.0			8		23			1013	1838		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1090	0.288	1014	0.180		4.0			8		24			1015	1908		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1143	0.087	1012	0.087		4.0			9		28			1013	1759		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1153	0.177	1014	0.177		4.0			9		25			1015	1833		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1222	0.246	1010	0.197		4.0			8		29			1011	1642		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1257	0.114	1012	0.114		4.0			8		23			1013	1866		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1434	0.134	1010	0.134		4.0			8		28			1011	1765		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1460	0.226	1014	0.141		4.0			8		30			1015	1790		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1498	0.232	1014	0.145		4.0			8		28			1015	1832		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1545	0.090	1012	0.072		4.0			5		1			1013	2649		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1609	0.230	1010	0.184		4.0			8		25			1011	1847		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1643	0.071	1012	0.056		4.0			5		22			1013	2645		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1682	0.086	1012	0.054		4.0			9		21			1013	1879		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1702	0.158	1012	0.099		4.0			8		27			1013	1873		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1723	0.148	1014	0.119		4.0			5		34			1015	2644		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1751	0.088	1014	0.088		4.0			5		40			1015	2647		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1756	0.285	1012	0.178		4.0			4		20			1013	2650		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1897	0.106	1014	0.106		4.0			9		25			1015	1871		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1997	0.124	1014	0.124		4.0			8		27			1015	1869		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2023	0.172	1014	0.172		4.0			8		24			1015	1709		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2030	0.105	1012	0.084		4.0			5		24			1013	2653		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2065	0.216	1010	0.173		4.0			8		24			1011	1837		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2251	0.184	1014	0.115		4.0			5		23			1015	2655		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2282	0.096	1014	0.077		4.0			4		31			1015	2654		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2290	0.118	1014	0.118		4.0			8		23			1015	1851		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2316	0.131	1012	0.131		4.0			8		30			1013	1835		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2338	0.102	1012	0.102		4.0			9		19			1013	1855		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2431	0.154	1014	0.124		4.0			5		17			1015	2651		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2440	0.135	1010	0.108		4.0			8		27			1011	1819		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2520	0.094	1014	0.075		4.0			9		27			1015	1856		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2529	0.241	1012	0.151		4.0			9		31			1013	1807		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2544	0.178	1010	0.111		4.0			9		26			1011	1857		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2650	0.125	1014	0.100		4.0			5		18			1015	2656		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2798	0.170	1012	0.170		4.0			5		22			1013	2658		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2847	0.060	1010	0.060		4.0			9		22			1011	1870		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2854	0.130	1014	0.130		4.0			5		14			1015	2652		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2876	0.110	1010	0.110		4.0			8		27			1011	1826		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2890	0.145	1012	0.116		4.0			8		20			1013	1831		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2979	0.118	1014	0.118		4.0			9		21			1015	1877		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3469	0.148	1012	0.148		4.0			8		23			1013	1771		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3924	0.135	1012	0.135		4.0			9		19			1013	1850		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3999	0.164	1014	0.164		4.0			8		26			1015	1878		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4113	0.087	1012	0.070		4.0			8		27			1013	1872		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4332	0.118	1010	0.094		4.0			9		20			1011	1920		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4728	0.263	1010	0.165		4.0			4		3			1011	2657		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4787	0.130	1012	0.081		4.0			9		28			1013	1864		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5145	0.215	1010	0.172		4.0			8		26			1011	1865		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5322	0.290	1014	0.181		4.0			9		25			1015	1881		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6553	0.089	1012	0.072		4.0			4		23			1013	2660		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6573	0.224	1010	0.140		4.0			4		25			1011	2662		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6598	0.188	1010	0.117		4.0			8		21			1011	1913		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6608	0.195	1010	0.195		4.0			8		21			1011	1928		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6840	0.234	1010	0.146		4.0			8		20			1011	1897		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7031	0.179	1010	0.143		4.0			5		16			1011	2659		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7240	0.136	1012	0.085		4.0			4		12			1013	2663		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7266	0.093	1010	0.058		4.0			9		25			1011	1884		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7537	0.080	1010	0.080		4.0			9		27			1011	1906		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7566	0.165	1012	0.103		4.0			9		26			1013	1959		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7877	0.098	1012	0.061		4.0			5		5			1013	2665		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7922	0.138	1010	0.138		4.0			5		5			1011	2661		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8108	0.065	1012	0.052		4.0			8		25			1013	1925		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8640	0.112	1010	0.070		4.0			5		16			1011	2664		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8702	0.263	1014	0.164		4.0			4		15			1015	2666		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8884	0.146	1010	0.091		4.0			9		23			1011	1891		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.8894	0.181	1012	0.181		4.0			9		22			1013	1904		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9072	0.178	1010	0.142		4.0			9		27			1011	1921		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9192	0.099	1012	0.062		4.0			8		28			1013	1883		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9218	0.074	1010	0.059		4.0			8		26			1011	1917		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9281	0.299	1010	0.187		4.0			8		21			1011	1901		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9308	0.201	1010	0.161		4.0			4		12			1011	2667		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9343	0.116	1012	0.072		4.0			8		24			1013	1880		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9403	0.167	1014	0.167		4.0			9		24			1015	1923		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9501	0.163	1014	0.130		4.0			9		22			1015	1909		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9536	0.134	1010	0.134		4.0			8		28			1011	1922		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9751	0.075	1012	0.060		4.0			9		24			1013	1983		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9809	0.107	1010	0.107		4.0			8		18			1011	1899		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9914	0.081	1010	0.064		4.0			8		27			1011	1900		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0058	0.086	1014	0.054		4.0			9		24			1015	1895		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0296	0.289	1012	0.181		4.0			9		24			1013	1916		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0312	0.099	1010	0.062		4.0			9		26			1011	2016		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0314	0.099	1010	0.062		4.0			9		26			1011	1912		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0371	0.198	1014	0.198		4.0			8		29			1015	1888		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0430	0.181	1014	0.145		4.0			8		26			1015	1931		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0437	0.145	1012	0.091		4.0			8		27			1013	1926		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0578	0.230	1010	0.184		4.0			9		24			1011	1887		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0610	0.302	1012	0.188		4.0			8		25			1013	1902		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0627	0.162	1014	0.130		4.0			9		21			1015	1976		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0629	0.154	1012	0.123		4.0			8		26			1013	1894		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0753	0.159	1014	0.127		4.0			8		26			1015	1885		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0765	0.108	1012	0.108		4.0			8		21			1013	1927		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0772	0.305	1012	0.191		4.0			8		22			1013	1898		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0805	0.080	1012	0.080		4.0			8		24			1013	1929		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0844	0.123	1010	0.098		4.0			9		26			1011	2002		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0848	0.078	1010	0.062		4.0			9		28			1011	1932		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0853	0.176	1012	0.176		4.0			8		19			1013	1907		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0973	0.238	1014	0.149		4.0			8		23			1015	1942		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0986	0.165	1014	0.165		4.0			8		28			1015	1919		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1127	0.122	1012	0.122		4.0			8		27			1013	1882		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1132	3.072	1000	2.457		3			5		12			1001	3006		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1167	0.089	1014	0.071		4.0			9		31			1015	1911		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1205	0.161	1010	0.161		4.0			9		28			1011	1975		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1254	0.140	1012	0.140		4.0			8		26			1013	2072		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1258	2.929	1004	2.343		3			5		11			1005	2990		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1261	0.183	1014	0.146		4.0			8		24			1015	1941		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1269	0.145	1010	0.145		4.0			8		21			1011	1945		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1301	0.152	1010	0.122		4.0			9		21			1011	1892		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1384	0.204	1012	0.128		4.0			8		22			1013	1890		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1405	0.223	1010	0.139		4.0			8		31			1011	1982		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1414	0.112	1010	0.090		4.0			9		25			1011	1896		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1503	2.205	1000	1.764		3			5		13			1001	3005		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1514	2.044	1000	1.635		3			5		12			1001	2995		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1542	2.515	1014	2.012		3			5		11			1015	2987		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1559	2.187	1004	2.187		3			5		10			1005	2996		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1626	2.884	1004	1.802		3			5		15			1005	2985		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1639	0.155	1012	0.097		4.0			8		23			1013	1893		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1640	0.182	1010	0.114		4.0			8		23			1011	1999		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1693	3.494	1004	2.183		3			5		11			1005	2986		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1746	3.175	1004	1.984		3			5		13			1005	2988		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1748	0.285	1010	0.178		4.0			8		30			1011	1971		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1750	3.023	1010	2.418		3			5		11			1011	2989		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1782	0.164	1010	0.164		4.0			8		19			1011	1924		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1790	0.181	1010	0.145		4.0			8		27			1011	1952		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1859	2.866	1004	2.293		3			5		13			1005	3002		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1866	2.975	1014	1.859		3			5		13			1015	3001		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1868	2.760	1002	2.208		3			5		11			1003	2984		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1904	2.416	1004	1.510		3			5		11			1005	2983		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1918	2.168	1000	1.735		3			5		14			1001	3007		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1960	2.468	1000	1.974		3			5		14			1001	2998		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1963	0.284	1012	0.177		4.0			8		24			1013	1889		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2044	1.826	1004	1.826		3			5		15			1005	2991		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2052	0.137	1014	0.137		4.0			8		27			1015	1914		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2071	1.701	1014	1.701		3			5		11			1015	2997		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2137	2.052	1002	2.052		3			5		16			1003	3003		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2450	0.189	1010	0.151		4.0			8		24			1011	1948		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2742	3.538	1002	2.211		3			5		10			1003	2994		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2752	3.939	1014	2.462		3			5		16			1015	3000		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2765	0.147	1014	0.147		4.0			9		23			1015	1943		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2773	0.255	1012	0.160		4.0			8		26			1013	1935		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2776	0.131	1014	0.131		4.0			8		24			1015	1936		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2852	2.812	1002	2.250		3			5		14			1003	2992		1				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2877	0.115	1010	0.115		4.0			9		24			1011	2001		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2914	0.111	1014	0.111		4.0			9		23			1015	1910		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2939	3.132	1010	1.957		3			4		10			1011	2999		0				1			2			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2978	0.088	1014	0.055		4.0			8		30			1015	1966		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3006	0.113	1010	0.113		4.0			9		23			1011	1955		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3024	0.154	1014	0.154		4.0			8		25			1015	1905		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3069	0.305	1010	0.191		4.0			9		28			1011	1967		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3109	0.095	1010	0.076		4.0			8		25			1011	1998		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3138	0.185	1014	0.185		4.0			8		30			1015	1962		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3149	0.107	1012	0.107		4.0			8		26			1013	1903		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3340	0.150	1010	0.150		4.0			8		23			1011	1987		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3663	0.247	1014	0.155		4.0			8		23			1015	1946		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3677	0.138	1012	0.138		4.0			8		25			1013	1996		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3684	0.173	1014	0.108		4.0			9		22			1015	1949		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3717	0.192	1010	0.192		4.0			9		24			1011	1940		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3794	0.247	1010	0.154		4.0			9		22			1011	1968		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3794	0.237	1010	0.190		4.0			8		27			1011	2030		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3865	0.261	1010	0.163		4.0			9		24			1011	1918		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3958	0.115	1010	0.115		4.0			8		24			1011	1930		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3969	0.241	1010	0.193		4.0			8		24			1011	1915		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3986	0.168	1010	0.168		4.0			8		19			1011	1886		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4039	0.102	1014	0.102		4.0			8		25			1015	1970		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4189	0.243	1014	0.194		4.0			8		24			1015	1990		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4249	0.103	1012	0.064		4.0			8		22			1013	1938		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4303	0.185	1010	0.185		4.0			8		25			1011	2046		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4339	0.194	1012	0.194		4.0			9		25			1013	2004		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4341	0.206	1014	0.165		4.0			8		27			1015	1993		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4364	0.113	1010	0.113		4.0			8		27			1011	1997		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4430	0.212	1012	0.133		4.0			9		24			1013	1947		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4515	0.130	1014	0.081		4.0			8		23			1015	2037		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4640	0.065	1012	0.052		4.0			8		27			1013	2034		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4646	0.095	1012	0.076		4.0			8		21			1013	1963		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4663	0.135	1012	0.135		4.0			8		22			1013	1933		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4788	0.177	1012	0.177		4.0			9		25			1013	2071		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4851	0.116	1012	0.093		4.0			8		23			1013	1984		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4868	0.100	1014	0.063		4.0			8		21			1015	2000		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4881	0.077	1012	0.062		4.0			9		26			1013	1977		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4904	0.182	1012	0.146		4.0			8		27			1013	1981		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4950	0.201	1010	0.125		4.0			8		21			1011	1958		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4952	0.230	1012	0.184		4.0			9		20			1013	1939		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4990	0.209	1014	0.167		4.0			8		22			1015	1956		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4999	0.246	1014	0.153		4.0			8		24			1015	1951		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5063	0.181	1014	0.181		4.0			9		29			1015	1944		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5064	0.171	1010	0.137		4.0			9		24			1011	2088		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5135	0.074	1014	0.074		4.0			8		28			1015	1957		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5167	0.123	1014	0.077		4.0			8		24			1015	1978		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5224	0.214	1012	0.134		4.0			8		27			1013	1995		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5362	0.166	1012	0.104		4.0			9		25			1013	2050		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5395	0.084	1014	0.084		4.0			8		27			1015	2033		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5410	0.174	1012	0.109		4.0			8		26			1013	1985		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5424	0.202	1010	0.162		4.0			9		22			1011	2024		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5469	0.077	1014	0.077		4.0			8		28			1015	2028		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5490	0.083	1014	0.052		4.0			8		25			1015	2104		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5532	0.091	1014	0.073		4.0			9		26			1015	2101		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5566	0.081	1012	0.050		4.0			8		24			1013	2075		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5741	0.225	1012	0.180		4.0			9		29			1013	1980		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5764	0.093	1014	0.093		4.0			9		23			1015	1965		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5784	0.317	1014	0.198		4.0			8		26			1015	2027		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5823	0.141	1012	0.112		4.0			8		24			1013	2053		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5905	0.134	1010	0.107		4.0			8		27			1011	2025		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5911	0.065	1010	0.052		4.0			8		24			1011	2018		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5946	0.167	1014	0.167		4.0			9		20			1015	2056		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5954	0.113	1012	0.091		4.0			8		23			1013	2085		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6020	0.088	1014	0.055		4.0			8		28			1015	1954		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6198	0.065	1012	0.065		4.0			9		26			1013	2093		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6205	0.056	1012	0.056		4.0			9		23			1013	2041		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6243	0.056	1012	0.056		4.0			9		21			1013	2073		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6287	0.070	1014	0.070		4.0			8		23			1015	2097		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6315	0.122	1010	0.122		4.0			8		26			1011	1979		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6337	0.245	1012	0.196		4.0			9		25			1013	1969		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6358	0.274	1010	0.171		4.0			8		24			1011	2010		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6423	0.136	1012	0.085		4.0			8		22			1013	2040		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6459	0.147	1012	0.092		4.0			8		26			1013	2080		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6470	0.134	1012	0.107		4.0			8		24			1013	1961		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6590	0.194	1012	0.194		4.0			9		22			1013	2023		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6608	0.078	1012	0.078		4.0			8		26			1013	1950		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6614	0.079	1010	0.079		4.0			8		23			1011	2022		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6634	0.117	1010	0.094		4.0			8		27			1011	1934		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6677	0.129	1014	0.103		4.0			9		23			1015	2081		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6737	0.317	1010	0.198		4.0			9		21			1011	2099		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6744	0.173	1010	0.108		4.0			8		25			1011	2077		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6753	0.158	1012	0.126		4.0			8		29			1013	1937		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6767	0.113	1012	0.090		4.0			8		25			1013	2049		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6843	0.224	1012	0.140		4.0			8		24			1013	2017		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6857	0.181	1014	0.181		4.0			9		28			1015	1986		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6921	0.126	1014	0.101		4.0			8		27			1015	1992		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6970	0.088	1014	0.070		4.0			9		31			1015	1964		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7010	0.215	1010	0.134		4.0			8		22			1011	2035		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7050	0.225	1014	0.180		4.0			9		26			1015	2026		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7103	0.090	1012	0.090		4.0			9		24			1013	2011		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7109	0.127	1014	0.102		4.0			8		28			1015	2055		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7139	0.109	1010	0.087		4.0			9		30			1011	2036		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7140	0.243	1014	0.194		4.0			9		25			1015	2100		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7170	0.208	1012	0.167		4.0			9		26			1013	2021		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7246	0.187	1012	0.187		4.0			8		23			1013	2095		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7359	0.149	1012	0.093		4.0			8		27			1013	2012		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7364	0.179	1010	0.143		4.0			9		25			1011	2029		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7365	0.081	1010	0.051		4.0			8		25			1011	2066		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7399	0.078	1010	0.062		4.0			9		29			1011	2087		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7403	0.130	1012	0.104		4.0			8		22			1013	2059		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7418	0.202	1014	0.161		4.0			9		28			1015	1988		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7437	0.155	1012	0.155		4.0			8		25			1013	2048		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7493	0.257	1010	0.161		4.0			9		28			1011	2083		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7511	0.223	1012	0.178		4.0			4		22			1013	2668		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7535	0.137	1012	0.086		4.0			9		21			1013	1994		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7552	0.202	1010	0.162		4.0			9		27			1011	2020		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7590	0.247	1012	0.197		4.0			8		29			1013	2061		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7638	0.101	1014	0.101		4.0			9		29			1015	1953		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7688	0.141	1012	0.141		4.0			8		22			1013	2068		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7700	0.073	1010	0.073		4.0			8		25			1011	2091		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7793	0.157	1012	0.157		4.0			8		22			1013	2005		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7891	0.120	1014	0.120		4.0			9		24			1015	2096		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7901	0.106	1010	0.106		4.0			8		26			1011	2014		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7902	0.076	1010	0.076		4.0			8		21			1011	2079		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7908	0.260	1012	0.163		4.0			8		24			1013	2031		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7935	0.191	1014	0.153		4.0			9		23			1015	2009		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7982	0.183	1014	0.183		4.0			8		28			1015	2078		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8004	0.090	1012	0.090		4.0			8		25			1013	2086		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8077	0.158	1012	0.158		4.0			4		20			1013	2673		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8080	0.225	1012	0.141		4.0			8		27			1013	2052		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8083	0.252	1010	0.157		4.0			8		24			1011	1973		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8094	0.084	1010	0.084		4.0			8		20			1011	2112		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8117	0.130	1012	0.104		4.0			8		24			1013	2118		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8155	0.124	1014	0.099		4.0			4		1			1015	2670		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8181	0.151	1014	0.094		4.0			9		22			1015	2098		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8191	0.073	1014	0.058		4.0			8		23			1015	2074		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8191	0.141	1014	0.141		4.0			8		27			1015	2006		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8202	0.222	1014	0.139		4.0			9		24			1015	1960		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8295	0.106	1012	0.066		4.0			8		25			1013	2019		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8334	0.299	1010	0.187		4.0			8		24			1011	2065		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8337	0.121	1014	0.076		4.0			9		24			1015	2123		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8343	0.154	1012	0.096		4.0			8		20			1013	2064		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8353	0.119	1014	0.119		4.0			8		20			1015	2063		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8356	0.155	1012	0.097		4.0			8		23			1013	1974		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8374	0.314	1014	0.196		4.0			5		11			1015	2669		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8395	0.195	1012	0.195		4.0			9		27			1013	2003		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8512	0.265	1014	0.165		4.0			8		26			1015	2032		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8554	0.179	1012	0.179		4.0			5		12			1013	2671		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8658	0.104	1014	0.084		4.0			8		28			1015	1989		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8743	0.276	1012	0.173		4.0			9		28			1013	1972		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8783	0.077	1012	0.077		4.0			5		25			1013	2672		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8786	0.109	1014	0.109		4.0			8		25			1015	2089		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8795	0.109	1014	0.068		4.0			8		25			1015	2045		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8803	0.090	1010	0.057		4.0			8		22			1011	2058		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8805	0.092	1014	0.058		4.0			8		25			1015	2113		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8828	0.174	1014	0.174		4.0			9		28			1015	2102		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8834	0.105	1010	0.105		4.0			9		26			1011	2119		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8958	0.118	1012	0.118		4.0			9		21			1013	2070		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8984	0.130	1012	0.081		4.0			8		24			1013	2007		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9037	0.231	1012	0.144		4.0			9		21			1013	2094		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9049	0.192	1010	0.192		4.0			9		26			1011	2076		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9149	0.121	1014	0.121		4.0			8		22			1015	2008		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9201	0.054	1012	0.054		4.0			8		25			1013	2013		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9206	0.162	1010	0.101		4.0			8		25			1011	1991		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9276	0.156	1014	0.156		4.0			8		31			1015	2121		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9376	0.092	1014	0.058		4.0			8		23			1015	2051		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9427	0.179	1010	0.179		4.0			8		24			1011	2108		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9472	0.107	1014	0.107		4.0			9		24			1015	2015		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9503	0.093	1012	0.093		4.0			8		28			1013	2069		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9653	0.187	1014	0.149		4.0			8		23			1015	2047		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9829	0.058	1012	0.058		4.0			9		21			1013	2105		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9856	0.127	1010	0.127		4.0			8		23			1011	2039		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9951	0.273	1012	0.170		4.0			9		24			1013	2117		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9996	0.280	1012	0.175		4.0			9		23			1013	2062		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9996	0.112	1010	0.070		4.0			8		25			1011	2106		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0017	0.124	1014	0.124		4.0			8		22			1015	2122		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0040	0.227	1012	0.142		4.0			8		28			1013	2044		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0054	0.254	1012	0.159		4.0			8		21			1013	2092		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0342	0.084	1010	0.053		4.0			8		26			1011	2043		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0887	0.098	1010	0.098		4.0			8		30			1011	2060		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1076	0.194	1010	0.121		4.0			8		28			1011	2120		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1079	0.130	1012	0.081		4.0			8		28			1013	2042		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1079	0.112	1014	0.112		4.0			9		18			1015	2103		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1404	0.158	1014	0.158		4.0			5		30			1015	2674		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1539	0.244	1014	0.195		4.0			8		28			1015	2054		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1588	0.233	1010	0.146		4.0			8		26			1011	2090		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1769	0.144	1014	0.115		4.0			9		26			1015	2111		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1957	0.158	1012	0.099		4.0			4		29			1013	2676		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2017	0.156	1014	0.156		4.0			9		22			1015	2082		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2040	0.190	1010	0.190		4.0			9		23			1011	2114		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2048	0.117	1014	0.117		4.0			5		20			1015	2681		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2234	0.179	1012	0.143		4.0			5		21			1013	2675		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2246	0.071	1014	0.071		4.0			4		1			1015	2677		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2254	0.100	1012	0.100		4.0			8		24			1013	2116		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2419	0.208	1014	0.130		4.0			8		25			1015	2067		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2448	0.108	1014	0.087		4.0			8		25			1015	2038		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2654	0.301	1014	0.188		4.0			9		24			1015	2109		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2748	0.169	1014	0.169		4.0			5		31			1015	2678		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.2843	0.087	1014	0.087		4.0			4		15			1015	2680		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3088	0.250	1014	0.156		4.0			8		19			1015	2057		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.3296	0.178	1010	0.178		4.0			8		27			1011	2115		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4252	0.149	1012	0.093		4.0			5		8			1013	2679		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4590	0.168	1012	0.168		4.0			8		26			1013	2107		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4672	0.237	1014	0.148		4.0			8		22			1015	2084		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.4901	0.195	1014	0.122		4.0			9		21			1015	2150		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.5418	0.071	1012	0.056		4.0			9		23			1013	2110		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.6366	0.226	1010	0.180		4.0			4		29			1011	2683		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.6797	0.099	1012	0.062		4.0			8		23			1013	2137		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7309	0.116	1010	0.092		4.0			8		25			1011	2149		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7559	0.210	1010	0.131		4.0			4		45			1011	2682		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7804	0.079	1010	0.079		4.0			9		23			1011	2143		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7816	0.102	1010	0.082		4.0			9		26			1011	2124		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8078	0.171	1010	0.171		4.0			8		29			1011	2134		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8097	0.312	1012	0.195		4.0			4		33			1013	2686		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8103	0.147	1012	0.092		4.0			8		24			1013	2151		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8119	0.293	1010	0.183		4.0			9		25			1011	2133		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8193	0.268	1014	0.167		4.0			8		23			1015	2138		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8280	0.118	1014	0.118		4.0			5		20			1015	2684		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8494	0.149	1014	0.149		4.0			9		23			1015	2144		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8561	0.201	1012	0.161		4.0			8		25			1013	2153		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8649	0.134	1010	0.134		4.0			8		21			1011	2152		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8901	0.184	1014	0.115		4.0			9		22			1015	2125		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8914	0.105	1010	0.065		4.0			5		24			1011	2685		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9019	0.184	1012	0.184		4.0			9		26			1013	2140		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9186	0.193	1010	0.120		4.0			9		28			1011	2146		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9231	0.086	1014	0.086		4.0			8		28			1015	2132		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9237	0.097	1014	0.061		4.0			9		24			1015	2139		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9733	0.249	1012	0.199		4.0			4		18			1013	2687		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9764	0.103	1014	0.064		4.0			9		28			1015	2135		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9853	0.130	1014	0.104		4.0			9		22			1015	2130		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.9933	0.217	1012	0.173		4.0			8		23			1013	2141		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0343	0.248	1010	0.198		4.0			4		19			1011	2688		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0463	0.243	1010	0.152		4.0			9		24			1011	2128		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0556	0.186	1014	0.116		4.0			8		25			1015	2129		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.0678	0.077	1012	0.062		4.0			8		28			1013	2147		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1141	0.161	1012	0.129		4.0			9		26			1013	2142		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1141	0.195	1014	0.195		4.0			9		25			1015	2131		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1442	0.124	1010	0.078		4.0			8		28			1011	2136		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1471	0.055	1010	0.055		4.0			8		23			1011	2156		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1508	0.111	1014	0.111		4.0			8		27			1015	2145		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1532	0.149	1012	0.149		4.0			8		24			1013	2148		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2040	0.120	1012	0.075		4.0			8		21			1013	2126		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2096	0.107	1010	0.086		4.0			8		27			1011	2127		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2496	0.163	1010	0.130		4.0			8		17			1011	2189		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2578	0.234	1014	0.146		4.0			8		26			1015	2160		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3107	0.100	1010	0.100		4.0			9		24			1011	2176		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3374	0.248	1014	0.199		4.0			9		24			1015	2158		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3794	0.125	1012	0.100		4.0			8		25			1013	2155		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3870	0.168	1014	0.168		4.0			9		25			1015	2178		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3904	0.076	1014	0.076		4.0			9		25			1015	2172		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4079	0.102	1014	0.063		4.0			9		25			1015	2175		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4234	0.178	1012	0.142		4.0			8		24			1013	2159		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4463	0.195	1014	0.195		4.0			9		29			1015	2162		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4931	0.171	1014	0.137		4.0			8		27			1015	2168		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5063	0.082	1010	0.082		4.0			8		21			1011	2171		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5091	0.123	1014	0.077		4.0			9		24			1015	2173		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6083	0.208	1010	0.130		4.0			8		27			1011	2166		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6155	0.150	1010	0.120		4.0			9		27			1011	2182		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6221	0.102	1010	0.102		4.0			5		32			1011	2689		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6423	0.086	1010	0.069		4.0			8		24			1011	2165		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6545	0.155	1014	0.155		4.0			8		24			1015	2170		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6726	0.190	1014	0.190		4.0			9		23			1015	2184		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6766	0.090	1010	0.090		4.0			5		26			1011	2693		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6781	0.108	1010	0.086		4.0			4		29			1011	2691		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6803	0.297	1010	0.186		4.0			5		31			1011	2690		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6893	0.242	1012	0.151		4.0			8		25			1013	2186		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6902	0.156	1012	0.097		4.0			8		24			1013	2219		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6997	0.233	1010	0.145		4.0			4		41			1011	2696		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7050	0.317	1014	0.198		4.0			5		17			1015	2692		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7086	0.058	1010	0.058		4.0			9		25			1011	2161		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7114	0.310	1014	0.193		4.0			8		19			1015	2185		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7133	0.141	1010	0.113		4.0			9		24			1011	2187		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7162	0.168	1014	0.168		4.0			9		25			1015	2205		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7239	0.068	1012	0.054		4.0			4		21			1013	2700		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7428	0.174	1014	0.109		4.0			4		26			1015	2695		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7489	0.152	1014	0.095		4.0			8		24			1015	2241		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7532	0.180	1010	0.180		4.0			9		24			1011	2243		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7610	0.115	1014	0.115		4.0			8		23			1015	2164		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7648	0.107	1014	0.067		4.0			8		22			1015	2183		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7700	0.169	1014	0.106		4.0			8		23			1015	2233		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7708	0.250	1012	0.156		4.0			8		23			1013	2216		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.7711	0.189	1012	0.189		4.0			9		22			1013	2157		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8061	0.114	1012	0.114		4.0			9		23			1013	2188		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8063	0.091	1014	0.073		4.0			4		35			1015	2694		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8067	0.085	1014	0.085		4.0			4		48			1015	2699		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8105	0.106	1014	0.106		4.0			4		34			1015	2703		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8137	0.156	1010	0.156		4.0			5		44			1011	2697		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8300	0.183	1014	0.146		4.0			9		27			1015	2271		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8322	0.125	1010	0.100		4.0			8		26			1011	2190		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8330	0.162	1012	0.101		4.0			9		24			1013	2214		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8432	0.114	1010	0.092		4.0			9		22			1011	2235		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8474	0.311	1014	0.194		4.0			9		23			1015	2174		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8476	0.191	1012	0.119		4.0			9		23			1013	2154		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8645	0.073	1014	0.073		4.0			9		23			1015	2229		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8704	0.234	1014	0.146		4.0			8		27			1015	2169		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8709	0.276	1014	0.172		4.0			4		14			1015	2702		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8796	0.115	1010	0.072		4.0			9		25			1011	2250		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8798	0.115	1014	0.072		4.0			9		24			1015	2179		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8921	0.126	1012	0.126		4.0			5		16			1013	2701		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8935	0.192	1012	0.120		4.0			8		22			1013	2207		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8959	0.197	1014	0.123		4.0			5		23			1015	2698		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9008	0.290	1010	0.181		4.0			9		27			1011	2254		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9091	0.094	1012	0.059		4.0			8		25			1013	2212		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9131	0.161	1010	0.101		4.0			8		25			1011	2193		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9164	0.151	1014	0.094		4.0			8		25			1015	2253		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9179	0.248	1014	0.155		4.0			9		28			1015	2192		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9194	0.109	1014	0.109		4.0			8		27			1015	2232		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9260	0.139	1012	0.139		4.0			5		19			1013	2704		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9281	0.196	1012	0.157		4.0			5		37			1013	2706		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9307	0.281	1014	0.176		4.0			4		27			1015	2711		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9386	0.084	1010	0.053		4.0			8		24			1011	2224		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9396	0.134	1012	0.134		4.0			9		24			1013	2221		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9427	0.126	1012	0.126		4.0			8		25			1013	2177		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9431	0.136	1010	0.136		4.0			8		23			1011	2163		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9490	0.168	1014	0.168		4.0			4		31			1015	2705		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9628	0.074	1014	0.059		4.0			9		25			1015	2255		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9820	0.093	1014	0.074		4.0			8		27			1015	2198		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9865	0.222	1010	0.178		4.0			9		25			1011	2248		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9991	0.051	1010	0.051		4.0			8		23			1011	2226		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.9991	0.203	1012	0.127		4.0			9		28			1013	2222		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0018	0.085	1014	0.053		4.0			8		26			1015	2220		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0070	0.215	1012	0.134		4.0			9		27			1013	2274		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0345	0.240	1012	0.150		4.0			9		26			1013	2223		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0387	0.117	1012	0.073		4.0			8		26			1013	2204		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0401	0.307	1010	0.192		4.0			8		26			1011	2209		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0441	0.244	1014	0.152		4.0			9		24			1015	2265		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0467	0.082	1014	0.065		4.0			8		21			1015	2227		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0522	0.215	1014	0.172		4.0			8		24			1015	2167		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0600	0.193	1012	0.154		4.0			9		25			1013	2244		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0682	0.133	1014	0.107		4.0			9		27			1015	2180		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0716	0.118	1012	0.094		4.0			8		26			1013	2206		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0774	0.143	1010	0.114		4.0			4		22			1011	2707		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0869	0.070	1014	0.056		4.0			9		23			1015	2194		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0981	0.113	1014	0.091		4.0			8		24			1015	2191		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1070	0.174	1014	0.174		4.0			9		25			1015	2258		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1192	0.131	1010	0.105		4.0			5		8			1011	2708		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1308	0.228	1014	0.143		4.0			9		23			1015	2237		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1318	0.181	1010	0.113		4.0			9		24			1011	2275		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1322	0.097	1012	0.078		4.0			9		28			1013	2230		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1382	0.153	1012	0.122		4.0			8		24			1013	2181		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1421	0.207	1012	0.129		4.0			9		23			1013	2261		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1436	0.248	1014	0.155		4.0			9		25			1015	2208		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1478	0.149	1012	0.149		4.0			4		39			1013	2712		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1497	0.138	1012	0.086		4.0			5		14			1013	2713		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1505	0.113	1012	0.071		4.0			9		24			1013	2196		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1516	0.136	1012	0.085		4.0			8		24			1013	2252		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1634	0.183	1010	0.147		4.0			5		25			1011	2709		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1732	0.202	1014	0.162		4.0			9		26			1015	2270		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1858	0.197	1014	0.158		4.0			4		34			1015	2710		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1886	0.116	1014	0.092		4.0			8		22			1015	2262		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1928	0.141	1014	0.141		4.0			8		24			1015	2239		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1934	0.127	1010	0.127		4.0			8		25			1011	2217		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1963	0.103	1010	0.082		4.0			8		23			1011	2215		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1968	0.135	1014	0.108		4.0			8		26			1015	2201		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1979	0.123	1012	0.123		4.0			8		27			1013	2242		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2025	0.128	1012	0.102		4.0			8		22			1013	2260		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2113	0.125	1010	0.078		4.0			8		26			1011	2257		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2180	0.074	1010	0.074		4.0			5		14			1011	2716		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2269	0.137	1010	0.137		4.0			8		23			1011	2305		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2298	0.111	1014	0.089		4.0			8		26			1015	2269		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2387	0.256	1010	0.160		4.0			5		23			1011	2714		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2479	0.142	1014	0.142		4.0			8		28			1015	2203		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2549	0.304	1010	0.190		4.0			8		25			1011	2238		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2572	0.159	1014	0.159		4.0			9		23			1015	2306		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2599	0.223	1010	0.178		4.0			5		13			1011	2717		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2604	0.129	1012	0.129		4.0			8		27			1013	2251		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2688	0.175	1014	0.140		4.0			4		32			1015	2715		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2917	0.111	1014	0.111		4.0			8		26			1015	2296		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2952	0.313	1012	0.196		4.0			8		20			1013	2272		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2973	0.177	1012	0.177		4.0			8		25			1013	2202		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3009	0.052	1014	0.052		4.0			9		29			1015	2213		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3013	0.141	1012	0.088		4.0			5		25			1013	2719		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3107	0.245	1014	0.153		4.0			8		25			1015	2247		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3197	0.240	1010	0.192		4.0			8		24			1011	2225		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3260	0.052	1012	0.052		4.0			9		21			1013	2228		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3261	0.170	1012	0.106		4.0			9		25			1013	2231		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3279	0.121	1012	0.097		4.0			8		26			1013	2249		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3308	0.162	1012	0.101		4.0			9		22			1013	2236		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3337	0.118	1014	0.118		4.0			9		29			1015	2234		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3357	0.157	1012	0.157		4.0			8		32			1013	2246		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3381	0.183	1014	0.146		4.0			9		27			1015	2266		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3481	0.173	1012	0.173		4.0			8		26			1013	2302		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3483	0.246	1010	0.197		4.0			8		28			1011	2211		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3708	0.067	1012	0.067		4.0			8		26			1013	2240		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3785	0.097	1010	0.078		4.0			8		26			1011	2197		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3964	0.085	1014	0.053		4.0			8		24			1015	2256		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3992	0.168	1014	0.105		4.0			9		24			1015	2259		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4007	0.088	1010	0.070		4.0			8		21			1011	2263		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4017	0.175	1010	0.109		4.0			9		24			1011	2303		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4027	0.110	1014	0.110		4.0			5		29			1015	2718		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4069	0.234	1010	0.187		4.0			9		27			1011	2276		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4238	0.205	1012	0.128		4.0			9		24			1013	2268		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4263	0.097	1012	0.077		4.0			9		26			1013	2264		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4692	0.241	1012	0.151		4.0			9		26			1013	2273		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4717	0.141	1010	0.113		4.0			8		28			1011	2210		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4733	0.189	1012	0.189		4.0			8		23			1013	2291		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4933	0.127	1014	0.080		4.0			9		23			1015	2245		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4994	0.131	1012	0.105		4.0			9		20			1013	2267		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5026	0.204	1014	0.127		4.0			4		32			1015	2720		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5044	0.081	1014	0.065		4.0			8		23			1015	2288		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5075	0.175	1010	0.175		4.0			9		27			1011	2297		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5093	0.094	1014	0.094		4.0			9		19			1015	2301		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5378	0.125	1012	0.125		4.0			9		28			1013	2195		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5578	0.129	1012	0.129		4.0			8		21			1013	2284		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5582	0.301	1012	0.188		4.0			9		25			1013	2295		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5615	0.165	1014	0.165		4.0			8		28			1015	2199		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5709	0.109	1010	0.109		4.0			9		25			1011	2279		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5765	0.132	1014	0.132		4.0			9		25			1015	2292		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6073	0.174	1010	0.139		4.0			9		27			1011	2299		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6117	0.168	1010	0.168		4.0			8		23			1011	2300		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6160	0.208	1010	0.167		4.0			9		25			1011	2277		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6203	0.150	1012	0.120		4.0			9		24			1013	2298		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6421	0.177	1012	0.142		4.0			8		24			1013	2286		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6574	0.155	1010	0.155		4.0			8		26			1011	2200		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6675	0.177	1014	0.177		4.0			5		15			1015	2721		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6750	0.181	1010	0.145		4.0			8		27			1011	2280		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6959	0.143	1012	0.143		4.0			8		24			1013	2307		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7132	0.272	1014	0.170		4.0			8		26			1015	2294		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7177	0.266	1012	0.166		4.0			8		24			1013	2289		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7348	0.086	1010	0.069		4.0			5		23			1011	2723		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7368	0.093	1010	0.093		4.0			8		23			1011	2308		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7431	0.126	1010	0.079		4.0			8		26			1011	2285		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7668	0.083	1014	0.083		4.0			8		29			1015	2309		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7676	0.153	1014	0.095		4.0			8		25			1015	2290		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7783	0.121	1012	0.076		4.0			9		23			1013	2281		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8075	0.121	1014	0.121		4.0			9		22			1015	2278		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8150	0.145	1014	0.116		4.0			4		21			1015	2724		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8414	0.063	1010	0.063		4.0			8		29			1011	2287		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8435	0.195	1014	0.156		4.0			8		25			1015	2282		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8464	0.129	1014	0.104		4.0			5		39			1015	2722		3				1			3			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.8495	0.083	1010	0.066		4.0			8		24			1011	2304		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1086	0.059	1012	0.059		4.0			9		23			1013	2283		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1649	0.266	1010	0.166		4.0			8		23			1011	2218		3				1			5			24			0.0000		35.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1730	0.195	1010	0.156		4.0			9		21			1011	2293		3				1			5			24			0.0000		35.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
