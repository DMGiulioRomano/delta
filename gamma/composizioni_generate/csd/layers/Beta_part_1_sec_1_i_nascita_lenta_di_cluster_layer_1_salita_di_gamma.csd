
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_1_sec_1_i_nascita_lenta_di_cluster_layer_1_salita_di_gamma.wav" -W -d -m0
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

#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/gamma_utils.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/pfield_comp.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/NonlinearFunc.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/GenPythagFreqs.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/initIsoAmp.orc"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/eventoSonoro.orc"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/voce.orc"

instr time
    ktime times
    if gi_debug > 1 then
    printk 1,ktime
    endif
endin

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
f 0 120.18233013555772 ; Evento f fittizio per definire la durata totale
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
f 25 0 4096 6 1 4096 0.001


f 1000 0 11 -2 3 2 4 5 3 2 4 1 3 2 4
f 1001 0 11 -2 0 1 2 3 1 1 2 0 2 1 2


i "time" 0 120.18233013555772
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 154.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	47.890	1000	29.931		5.000000	0		2			0		2		1001	1		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	40.584	1000	25.365		4.902500	1		4			1		4		1001	2		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	38.038	1000	30.430		4.810000	2		3			2		3		1001	4		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	31.122	1000	24.898		4.722500	2		6			2		6		1001	5		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	40.019	1000	25.012		4.722500	1		5			1		5		1001	7		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	37.805	1000	30.244		4.640000	1		2			1		2		1001	8		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	46.626	1000	29.141		4.562500	2		8			2		8		1001	9		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	28.573	1000	22.858		4.562500	1		6			1		6		1001	13		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	30.438	1000	24.350		4.562500	1		4			1		4		1001	14		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5359	34.825	1000	21.766		4.490000	3		2			3		2		1001	16		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5359	34.274	1000	27.419		4.490000	3		1			3		1		1001	18		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5039	41.412	1000	25.883		4.422500	3		7			3		7		1001	19		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5039	35.638	1000	22.274		4.422500	3		8			3		8		1001	20		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5039	34.934	1000	27.947		4.422500	2		11			2		11		1001	21		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1039	28.226	1000	22.580		4.360000	3		10			3		10		1001	22		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1039	31.394	1000	19.621		4.360000	2		8			2		8		1001	23		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1039	32.971	1000	20.607		4.360000	1		7			1		7		1001	24		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3359	30.040	1000	24.032		4.302500	5		11			5		11		1001	26		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3359	31.937	1000	25.549		4.302500	2		13			2		13		1001	27		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3359	35.874	1000	22.421		4.302500	3		4			3		4		1001	28		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1999	33.445	1000	26.756		4.250000	3		8			3		8		1001	29		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1999	39.748	1000	24.842		4.250000	5		12			5		12		1001	30		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1999	42.513	1000	26.570		4.250000	4		9			4		9		1001	32		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1999	33.769	1000	21.106		4.250000	4		10			4		10		1001	33		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1999	40.114	1000	25.071		4.250000	2		10			2		10		1001	36		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6959	35.670	1000	22.293		4.202500	2		8			2		8		1001	37		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6959	39.579	1000	24.737		4.202500	5		4			5		4		1001	38		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6959	20.592	1000	16.474		4.202500	3		9			3		9		1001	40		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	21.286	1000	17.029		4.160000	5		12			5		12		1001	41		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	34.436	1000	21.522		4.160000	5		10			5		10		1001	42		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	24.632	1000	19.705		4.160000	3		3			3		3		1001	43		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	22.504	1000	18.004		4.160000	5		12			5		12		1001	44		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	34.183	1000	21.365		4.160000	6		14			6		14		1001	45		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8239	21.617	1000	17.293		4.160000	5		14			5		14		1001	46		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	27.775	1000	17.359		4.122500	4		2			4		2		1001	47		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	34.052	1000	21.282		4.122500	5		16			5		16		1001	49		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	32.229	1000	25.784		4.122500	3		3			3		3		1001	51		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	27.246	1000	21.797		4.122500	6		8			6		8		1001	52		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	31.529	1000	25.223		4.122500	2		10			2		10		1001	53		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5839	29.651	1000	23.721		4.122500	6		6			6		6		1001	54		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	19.717	1000	15.773		4.090000	5		14			5		14		1001	55		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	26.127	1000	20.901		4.090000	6		10			6		10		1001	56		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	27.247	1000	21.797		4.090000	6		14			6		14		1001	58		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	27.770	1000	22.216		4.090000	6		6			6		6		1001	59		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	36.479	1000	22.799		4.090000	4		4			4		4		1001	60		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9759	20.320	1000	16.256		4.090000	5		10			5		10		1001	61		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	22.743	1000	18.195		4.062500	4		11			4		11		1001	62		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	25.797	1000	20.638		4.062500	3		12			3		12		1001	65		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	28.316	1000	17.697		4.062500	6		14			6		14		1001	69		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	36.468	1000	22.792		4.062500	6		16			6		16		1001	71		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	17.631	1000	14.105		4.062500	5		8			5		8		1001	74		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.9999	28.191	1000	17.619		4.062500	7		2			7		2		1001	75		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6559	23.214	1000	14.509		4.040000	3		5			3		5		1001	77		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6559	29.344	1000	23.475		4.040000	5		7			5		7		1001	79		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6559	30.393	1000	24.314		4.040000	7		1			7		1		1001	80		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6559	18.285	1000	14.628		4.040000	3		3			3		3		1001	81		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6559	36.579	1000	22.862		4.040000	4		12			4		12		1001	84		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9439	19.481	1000	15.585		4.022500	4		8			4		8		1001	86		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9439	23.282	1000	18.626		4.022500	7		16			7		16		1001	87		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9439	29.472	1000	23.577		4.022500	4		13			4		13		1001	88		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9439	23.329	1000	18.664		4.022500	6		12			6		12		1001	90		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	25.249	1000	15.780		4.010000	7		13			7		13		1001	93		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	28.267	1000	22.613		4.010000	7		12			7		12		1001	96		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	26.977	1000	16.861		4.010000	4		1			4		1		1001	97		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	25.103	1000	15.689		4.010000	4		15			4		15		1001	98		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	20.435	1000	12.772		4.010000	8		6			8		6		1001	99		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	28.534	1000	17.834		4.010000	6		5			6		5		1001	100		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8639	26.658	1000	21.327		4.010000	7		5			7		5		1001	102		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	25.311	1000	20.249		4.002500	6		19			6		19		1001	103		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	26.184	1000	20.947		4.002500	6		3			6		3		1001	105		0				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	36.766	1000	22.979		4.002500	4		9			4		9		1001	106		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	17.312	1000	13.850		4.002500	4		9			4		9		1001	107		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	27.517	1000	22.014		4.002500	6		10			6		10		1001	110		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	25.496	1000	15.935		4.002500	7		15			7		15		1001	111		1				1			2			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4159	19.834	1000	12.397		4.002500	7		3			7		3		1001	113		0				1			2			20			0.0000		154.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
