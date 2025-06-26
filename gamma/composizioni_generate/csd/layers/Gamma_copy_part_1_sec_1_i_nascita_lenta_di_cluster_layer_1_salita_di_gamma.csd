
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Gamma_copy_part_1_sec_1_i_nascita_lenta_di_cluster_layer_1_salita_di_gamma.wav" -W -d -m0
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
f 0 118.58464433355098 ; Evento f fittizio per definire la durata totale
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


i "time" 0 118.58464433355098
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 112.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	40.098	1000	25.061		5.000000	1		1			1		1		1001	1		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	48.192	1000	30.120		5.000000	1		1			1		1		1001	2		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	43.661	1000	27.288		4.902500	1		1			1		1		1001	4		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	39.683	1000	24.802		4.902500	0		3			0		3		1001	5		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	27.330	1000	21.864		4.810000	1		2			1		2		1001	7		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	34.416	1000	27.533		4.810000	2		1			2		1		1001	8		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	28.407	1000	22.726		4.722500	2		1			2		1		1001	10		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	36.248	1000	28.999		4.722500	2		4			2		4		1001	12		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	33.284	1000	20.803		4.722500	0		6			0		6		1001	13		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	43.543	1000	27.215		4.722500	2		5			2		5		1001	14		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	42.888	1000	26.805		4.640000	1		3			1		3		1001	15		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	33.495	1000	26.796		4.640000	1		6			1		6		1001	16		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	27.166	1000	21.733		4.640000	2		6			2		6		1001	17		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	38.116	1000	23.823		4.640000	3		8			3		8		1001	20		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	34.699	1000	21.687		4.640000	1		3			1		3		1001	21		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	40.982	1000	25.614		4.562500	1		7			1		7		1001	23		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	30.528	1000	19.080		4.562500	2		8			2		8		1001	24		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	35.451	1000	28.360		4.562500	2		4			2		4		1001	25		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	34.766	1000	27.813		4.490000	2		4			2		4		1001	26		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	31.997	1000	19.998		4.490000	1		9			1		9		1001	27		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	33.400	1000	26.720		4.490000	2		3			2		3		1001	28		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	35.062	1000	21.914		4.490000	2		1			2		1		1001	29		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	42.521	1000	26.575		4.490000	3		5			3		5		1001	30		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	21.421	1000	17.137		4.422500	4		2			4		2		1001	31		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	39.601	1000	24.750		4.422500	4		7			4		7		1001	33		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	41.552	1000	25.970		4.422500	3		8			3		8		1001	35		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	30.779	1000	24.623		4.360000	4		3			4		3		1001	36		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	23.605	1000	18.884		4.360000	3		2			3		2		1001	38		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	42.777	1000	26.736		4.360000	2		3			2		3		1001	39		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	20.147	1000	16.118		4.302500	3		3			3		3		1001	43		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	26.407	1000	21.125		4.302500	3		12			3		12		1001	44		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	34.571	1000	21.607		4.302500	3		3			3		3		1001	45		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	21.761	1000	17.409		4.302500	2		7			2		7		1001	46		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	26.221	1000	16.388		4.302500	3		1			3		1		1001	47		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	23.185	1000	18.548		4.250000	4		1			4		1		1001	48		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	22.208	1000	17.766		4.250000	3		2			3		2		1001	49		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	32.057	1000	20.036		4.250000	5		6			5		6		1001	51		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	26.788	1000	21.431		4.250000	4		7			4		7		1001	52		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	27.184	1000	16.990		4.250000	5		11			5		11		1001	54		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	20.581	1000	16.465		4.202500	3		14			3		14		1001	55		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	30.411	1000	24.329		4.202500	5		6			5		6		1001	56		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	25.706	1000	20.565		4.202500	3		15			3		15		1001	57		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	24.475	1000	15.297		4.202500	2		13			2		13		1001	58		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	25.481	1000	20.385		4.160000	4		4			4		4		1001	59		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	22.543	1000	14.089		4.160000	3		12			3		12		1001	60		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	20.990	1000	16.792		4.160000	4		10			4		10		1001	62		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	21.819	1000	13.637		4.122500	5		9			5		9		1001	63		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	22.666	1000	14.166		4.122500	4		5			4		5		1001	65		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	21.884	1000	13.677		4.122500	4		13			4		13		1001	66		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	28.193	1000	22.555		4.122500	6		3			6		3		1001	67		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	34.509	1000	21.568		4.090000	6		14			6		14		1001	69		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	36.887	1000	23.054		4.090000	5		8			5		8		1001	70		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	28.790	1000	17.994		4.090000	3		13			3		13		1001	72		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	25.226	1000	20.180		4.090000	3		9			3		9		1001	74		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	17.824	1000	14.259		4.090000	7		12			7		12		1001	75		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	29.133	1000	18.208		4.090000	6		7			6		7		1001	76		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	21.749	1000	13.593		4.062500	3		13			3		13		1001	80		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	19.235	1000	15.388		4.062500	5		9			5		9		1001	81		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	31.212	1000	19.508		4.062500	3		17			3		17		1001	82		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	25.538	1000	20.430		4.062500	5		10			5		10		1001	85		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	35.585	1000	22.241		4.062500	4		15			4		15		1001	86		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	29.956	1000	23.965		4.040000	3		8			3		8		1001	87		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	28.134	1000	17.584		4.040000	3		2			3		2		1001	89		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	25.453	1000	15.908		4.040000	4		13			4		13		1001	91		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	20.251	1000	12.657		4.040000	4		1			4		1		1001	93		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	21.561	1000	17.249		4.040000	5		12			5		12		1001	94		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	30.370	1000	18.981		4.040000	5		13			5		13		1001	95		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	27.509	1000	22.007		4.022500	4		13			4		13		1001	97		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	16.306	1000	13.044		4.022500	5		8			5		8		1001	98		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	26.053	1000	20.843		4.022500	4		1			4		1		1001	99		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	20.232	1000	16.185		4.010000	6		12			6		12		1001	100		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	23.384	1000	18.708		4.010000	7		1			7		1		1001	101		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	32.850	1000	20.531		4.010000	4		19			4		19		1001	102		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	17.475	1000	13.980		4.002500	4		6			4		6		1001	103		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	25.324	1000	15.827		4.002500	6		19			6		19		1001	104		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	35.169	1000	21.980		4.002500	4		18			4		18		1001	106		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	31.922	1000	19.951		4.002500	4		11			4		11		1001	107		1				1			2			20			0.0000		112.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
