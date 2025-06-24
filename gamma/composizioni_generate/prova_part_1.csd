
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/prova_part_1.wav" -W -d -m0
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
f 0 142.0 ; Evento f fittizio per definire la durata totale
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


i "time" 0 142.0
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 112.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	44.431	1000	27.769		5.000000	2		2			2		2		1001	7		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.117	1000	29.694		5.000000	1		2			1		2		1001	8		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	51.107	1000	31.942		5.000000	1		2			1		2		1001	9		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	38.525	1000	30.820		4.902500	2		4			2		4		1001	10		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	30.338	1000	24.270		4.902500	1		2			1		2		1001	11		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	37.962	1000	23.727		4.810000	2		1			2		1		1001	13		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	27.404	1000	21.923		4.810000	1		1			1		1		1001	14		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	30.762	1000	24.609		4.722500	2		1			2		1		1001	15		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	30.721	1000	24.577		4.722500	2		3			2		3		1001	17		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	42.825	1000	26.766		4.722500	2		4			2		4		1001	19		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	43.172	1000	26.982		4.722500	2		1			2		1		1001	21		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	45.723	1000	28.577		4.640000	1		2			1		2		1001	22		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	25.025	1000	20.020		4.640000	1		5			1		5		1001	23		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	30.589	1000	24.472		4.640000	1		3			1		3		1001	28		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	38.645	1000	24.153		4.562500	1		1			1		1		1001	29		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	32.165	1000	25.732		4.562500	1		7			1		7		1001	31		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	30.783	1000	19.239		4.562500	1		4			1		4		1001	33		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	32.757	1000	26.205		4.490000	1		8			1		8		1001	34		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	39.906	1000	24.941		4.490000	3		5			3		5		1001	35		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	30.488	1000	24.391		4.490000	4		4			4		4		1001	36		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	26.706	1000	21.365		4.422500	3		7			3		7		1001	37		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	29.135	1000	23.308		4.422500	1		12			1		12		1001	40		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	21.799	1000	17.439		4.422500	3		3			3		3		1001	41		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	36.182	1000	22.614		4.422500	3		1			3		1		1001	44		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	31.211	1000	24.969		4.422500	2		4			2		4		1001	46		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	32.015	1000	25.612		4.360000	2		9			2		9		1001	47		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	30.188	1000	24.151		4.360000	2		12			2		12		1001	48		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	32.660	1000	26.128		4.360000	3		1			3		1		1001	49		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	27.568	1000	22.055		4.360000	3		5			3		5		1001	50		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	26.140	1000	16.338		4.360000	3		4			3		4		1001	51		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	40.964	1000	25.603		4.302500	2		8			2		8		1001	52		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	37.879	1000	23.674		4.302500	4		13			4		13		1001	53		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	35.887	1000	22.430		4.302500	3		6			3		6		1001	54		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	30.770	1000	24.616		4.302500	1		6			1		6		1001	56		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	26.494	1000	21.196		4.302500	3		14			3		14		1001	57		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	25.807	1000	16.129		4.250000	2		10			2		10		1001	58		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	27.071	1000	16.920		4.250000	2		1			2		1		1001	59		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	25.154	1000	20.124		4.250000	2		11			2		11		1001	60		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	40.441	1000	25.275		4.250000	3		15			3		15		1001	61		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	27.851	1000	22.281		4.250000	3		9			3		9		1001	62		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	24.908	1000	19.927		4.250000	3		4			3		4		1001	64		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	24.372	1000	19.498		4.202500	5		4			5		4		1001	65		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	39.197	1000	24.498		4.202500	3		9			3		9		1001	68		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	30.052	1000	24.041		4.202500	2		16			2		16		1001	69		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	38.829	1000	24.268		4.202500	3		3			3		3		1001	71		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	22.434	1000	14.021		4.160000	3		4			3		4		1001	74		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	24.069	1000	15.043		4.160000	3		4			3		4		1001	75		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	31.214	1000	24.971		4.160000	6		5			6		5		1001	76		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	19.090	1000	15.272		4.122500	5		13			5		13		1001	77		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	24.535	1000	15.334		4.122500	6		3			6		3		1001	78		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	26.390	1000	16.494		4.122500	5		11			5		11		1001	80		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	21.924	1000	17.539		4.122500	3		4			3		4		1001	81		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	35.315	1000	22.072		4.122500	3		1			3		1		1001	82		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	28.797	1000	17.998		4.122500	6		11			6		11		1001	83		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	29.377	1000	23.501		4.090000	7		6			7		6		1001	84		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	19.976	1000	15.980		4.090000	5		11			5		11		1001	85		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	26.994	1000	21.595		4.090000	4		9			4		9		1001	87		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	19.191	1000	15.352		4.090000	4		14			4		14		1001	88		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	39.160	1000	24.475		4.090000	6		13			6		13		1001	89		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	25.005	1000	20.004		4.062500	4		4			4		4		1001	92		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	25.260	1000	20.208		4.062500	6		16			6		16		1001	93		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	37.555	1000	23.472		4.062500	3		17			3		17		1001	94		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	31.185	1000	19.491		4.062500	7		12			7		12		1001	95		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	23.908	1000	14.943		4.040000	4		5			4		5		1001	96		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	38.356	1000	23.973		4.040000	6		8			6		8		1001	99		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	24.731	1000	15.457		4.040000	7		6			7		6		1001	100		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	33.964	1000	21.228		4.040000	7		18			7		18		1001	101		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	31.512	1000	19.695		4.040000	5		11			5		11		1001	102		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	21.246	1000	13.279		4.022500	7		9			7		9		1001	103		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	31.580	1000	19.737		4.022500	7		13			7		13		1001	104		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	21.831	1000	17.465		4.022500	6		16			6		16		1001	106		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	19.123	1000	15.298		4.022500	4		15			4		15		1001	110		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	21.399	1000	13.375		4.022500	5		9			5		9		1001	112		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	21.009	1000	13.131		4.010000	3		4			3		4		1001	117		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	16.828	1000	13.462		4.010000	7		7			7		7		1001	118		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	18.613	1000	14.891		4.010000	4		13			4		13		1001	119		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	20.535	1000	12.834		4.010000	5		19			5		19		1001	120		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	29.030	1000	18.144		4.010000	3		1			3		1		1001	121		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	22.973	1000	14.358		4.010000	5		17			5		17		1001	122		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	22.858	1000	18.287		4.002500	5		10			5		10		1001	123		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	26.319	1000	21.055		4.002500	4		2			4		2		1001	124		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	25.966	1000	20.772		4.002500	4		13			4		13		1001	125		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	21.087	1000	13.179		4.002500	8		11			8		11		1001	126		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	8.494	1000	2.142		0.003076	7		4			7		4		1001	128		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	2.901	1000	1.552		0.003076	5		3			5		3		1001	129		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	8.616	1000	2.861		0.003076	6		6			6		6		1001	130		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	11.674	1000	2.568		0.003076	5		5			5		5		1001	131		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	12.102	1000	2.544		0.003076	5		5			5		5		1001	133		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	17.946	1000	1.560		0.003076	7		3			7		3		1001	134		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	12.482	1000	2.508		0.003076	6		3			6		3		1001	135		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	14.655	1000	1.018		0.003076	5		5			5		5		1001	136		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	6.402	1000	3.619		0.003076	6		7			6		7		1001	137		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	10.546	1000	2.340		0.003076	5		6			5		6		1001	138		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	23.121	1000	3.415		0.003076	7		4			7		4		1001	141		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	7.905	1000	3.042		0.003076	6		4			6		4		1001	142		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	15.121	1000	1.081		0.003076	7		3			7		3		1001	143		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	7.847	1000	3.244		0.003076	6		6			6		6		1001	144		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	14.709	1000	2.192		0.003076	5		6			5		6		1001	145		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	23.481	1000	3.583		0.003076	7		4			7		4		1001	146		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	7.694	1000	2.525		0.003076	6		6			6		6		1001	147		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	2.430	1000	1.245		0.003076	6		7			6		7		1001	148		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	14.320	1000	3.255		0.003076	7		4			7		4		1001	149		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	13.253	1000	3.626		0.003076	5		6			5		6		1001	150		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	12.169	1000	1.080		0.003076	7		1			7		1		1001	153		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	21.480	1000	1.437		0.003076	8		6			8		6		1001	154		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6345	10.481	1000	3.894		0.003076	7		4			7		4		1001	155		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	21.923	1000	3.078		0.018528	7		4			7		4		1001	156		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	2.985	1000	0.967		0.018528	6		1			6		1		1001	158		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	12.914	1000	2.674		0.018528	7		5			7		5		1001	159		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	11.766	1000	3.743		0.018528	7		4			7		4		1001	161		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	13.091	1000	1.201		0.018528	6		8			6		8		1001	162		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	18.507	1000	1.385		0.018528	5		7			5		7		1001	163		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	13.868	1000	0.854		0.018528	6		2			6		2		1001	164		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	22.008	1000	1.579		0.018528	6		6			6		6		1001	166		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	12.108	1000	2.893		0.018528	8		4			8		4		1001	167		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	13.711	1000	3.275		0.018528	8		5			8		5		1001	168		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	15.135	1000	1.735		0.018528	8		1			8		1		1001	169		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	19.304	1000	3.323		0.018528	6		7			6		7		1001	170		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	15.341	1000	1.696		0.018528	7		3			7		3		1001	171		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	15.949	1000	3.850		0.018528	7		3			7		3		1001	172		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	15.655	1000	3.272		0.018528	5		1			5		1		1001	173		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	5.345	1000	3.191		0.018528	6		3			6		3		1001	174		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	15.226	1000	3.816		0.018528	5		6			5		6		1001	178		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	19.243	1000	1.827		0.018528	5		6			5		6		1001	179		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	9.403	1000	3.206		0.018528	5		2			5		2		1001	180		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	12.089	1000	1.290		0.018528	6		3			6		3		1001	181		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	11.606	1000	1.017		0.018528	8		8			8		8		1001	182		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	16.951	1000	3.771		0.018528	8		2			8		2		1001	183		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	9.572	1000	1.809		0.018528	7		6			7		6		1001	184		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	7.648	1000	2.064		0.018528	8		5			8		5		1001	185		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	8.296	1000	2.528		0.018528	8		6			8		6		1001	186		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8075	16.980	1000	2.973		0.018528	7		7			7		7		1001	190		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	12.354	1000	1.020		0.088890	7		5			7		5		1001	191		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	9.979	1000	2.671		0.088890	7		6			7		6		1001	192		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	19.463	1000	2.457		0.088890	8		3			8		3		1001	193		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	3.385	1000	2.357		0.088890	7		3			7		3		1001	194		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	15.922	1000	0.850		0.088890	6		2			6		2		1001	196		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	8.762	1000	1.334		0.088890	6		3			6		3		1001	197		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	15.995	1000	1.024		0.088890	7		6			7		6		1001	198		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	15.521	1000	1.626		0.088890	7		2			7		2		1001	199		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	1.747	1000	1.319		0.088890	6		5			6		5		1001	201		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	16.656	1000	3.647		0.088890	5		4			5		4		1001	203		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	14.389	1000	3.121		0.088890	5		3			5		3		1001	204		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	20.610	1000	2.344		0.088890	7		7			7		7		1001	205		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	3.967	1000	1.836		0.088890	6		8			6		8		1001	206		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	5.916	1000	1.351		0.088890	7		3			7		3		1001	207		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	3.850	1000	3.034		0.088890	5		7			5		7		1001	208		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	3.955	1000	2.022		0.088890	5		5			5		5		1001	209		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5956	6.479	1000	2.820		0.088890	7		7			7		7		1001	210		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	21.470	1000	1.418		0.179906	7		5			7		5		1001	211		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	11.008	1000	3.282		0.179906	6		8			6		8		1001	214		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	15.871	1000	3.602		0.179906	5		9			5		9		1001	215		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	3.217	1000	1.746		0.179906	7		8			7		8		1001	216		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	15.960	1000	3.345		0.179906	6		2			6		2		1001	217		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	10.396	1000	3.307		0.179906	6		7			6		7		1001	219		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	18.757	1000	1.973		0.179906	7		5			7		5		1001	221		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	13.075	1000	2.229		0.179906	5		5			5		5		1001	222		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	8.077	1000	0.952		0.179906	6		1			6		1		1001	224		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	19.548	1000	3.318		0.179906	6		2			6		2		1001	225		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	18.765	1000	1.094		0.179906	7		9			7		9		1001	229		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	7.843	1000	2.226		0.179906	8		8			8		8		1001	230		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	8.258	1000	1.815		0.179906	8		6			8		6		1001	231		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	7.502	1000	2.553		0.179906	6		5			6		5		1001	234		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	16.263	1000	1.660		0.179906	8		2			8		2		1001	235		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	20.843	1000	2.292		0.179906	5		10			5		10		1001	240		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	21.736	1000	2.211		0.179906	7		5			7		5		1001	242		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	12.643	1000	2.998		0.179906	6		10			6		10		1001	243		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	7.723	1000	3.448		0.179906	6		1			6		1		1001	244		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	22.609	1000	2.282		0.179906	6		7			6		7		1001	245		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	15.464	1000	3.303		0.179906	8		3			8		3		1001	248		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	6.644	1000	1.021		0.179906	8		8			8		8		1001	249		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	12.788	1000	3.191		0.179906	6		8			6		8		1001	251		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	6.674	1000	0.800		0.179906	8		7			8		7		1001	252		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	21.767	1000	3.339		0.179906	6		5			6		5		1001	253		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	15.573	1000	1.969		0.179906	5		3			5		3		1001	256		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	13.965	1000	2.494		0.179906	8		5			8		5		1001	257		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	10.041	1000	2.834		0.179906	6		5			6		5		1001	259		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	13.632	1000	2.046		0.179906	6		8			6		8		1001	260		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	13.317	1000	0.845		0.179906	6		7			6		7		1001	261		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	8.675	1000	3.336		0.179906	6		1			6		1		1001	262		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	6.782	1000	1.762		0.179906	8		8			8		8		1001	265		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	2.794	1000	1.006		0.179906	6		1			6		1		1001	266		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	2.140	1000	1.266		0.179906	7		11			7		11		1001	271		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	20.886	1000	2.191		0.179906	7		5			7		5		1001	272		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	18.382	1000	1.772		0.179906	6		3			6		3		1001	276		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	21.601	1000	1.035		0.179906	6		8			6		8		1001	278		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6149	22.589	1000	2.599		0.179906	6		7			6		7		1001	280		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	17.155	1000	2.015		0.279817	5		10			5		10		1001	281		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	11.590	1000	3.138		0.279817	7		2			7		2		1001	282		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	2.388	1000	1.538		0.279817	6		8			6		8		1001	283		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	16.510	1000	3.448		0.279817	8		9			8		9		1001	284		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	13.129	1000	2.777		0.279817	5		5			5		5		1001	286		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	15.882	1000	2.451		0.279817	6		6			6		6		1001	289		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	4.161	1000	1.052		0.279817	6		11			6		11		1001	290		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	10.526	1000	1.708		0.279817	5		9			5		9		1001	293		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	17.577	1000	3.554		0.279817	6		11			6		11		1001	294		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	10.289	1000	0.999		0.279817	7		8			7		8		1001	296		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7340	15.857	1000	1.968		0.279817	6		7			6		7		1001	297		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	7.603	1000	1.768		0.302735	8		12			8		12		1001	298		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	18.303	1000	3.472		0.302735	8		1			8		1		1001	302		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	21.769	1000	1.309		0.302735	6		2			6		2		1001	303		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	2.828	1000	1.207		0.302735	7		12			7		12		1001	305		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	22.830	1000	3.511		0.302735	5		6			5		6		1001	306		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	6.757	1000	1.453		0.302735	6		3			6		3		1001	307		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	16.540	1000	1.325		0.302735	6		14			6		14		1001	308		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	12.531	1000	1.538		0.302735	6		4			6		4		1001	310		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	7.694	1000	2.319		0.302735	7		13			7		13		1001	312		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	20.287	1000	1.726		0.302735	7		12			7		12		1001	313		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9906	19.958	1000	1.884		0.302735	7		12			7		12		1001	314		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	16.834	1000	1.860		0.478274	7		3			7		3		1001	315		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	14.563	1000	1.304		0.478274	6		5			6		5		1001	316		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	20.974	1000	3.297		0.478274	6		8			6		8		1001	317		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	5.596	1000	1.387		0.478274	7		3			7		3		1001	318		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	7.850	1000	1.650		0.478274	8		4			8		4		1001	319		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	17.531	1000	3.154		0.478274	8		4			8		4		1001	321		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	11.400	1000	1.534		0.478274	6		5			6		5		1001	322		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	19.112	1000	1.060		0.478274	5		15			5		15		1001	325		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	18.228	1000	1.517		0.478274	5		15			5		15		1001	326		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	8.714	1000	2.854		0.478274	6		1			6		1		1001	327		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9567	10.961	1000	1.820		0.478274	7		1			7		1		1001	328		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	22.227	1000	2.307		0.530827	6		11			6		11		1001	329		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	2.128	1000	0.804		0.530827	6		1			6		1		1001	330		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	13.231	1000	0.924		0.530827	6		1			6		1		1001	331		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	13.078	1000	3.428		0.530827	7		8			7		8		1001	332		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	4.560	1000	0.908		0.530827	7		4			7		4		1001	334		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	5.905	1000	2.888		0.530827	6		17			6		17		1001	335		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	8.252	1000	2.841		0.530827	7		13			7		13		1001	336		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	13.198	1000	2.657		0.530827	7		13			7		13		1001	337		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	15.102	1000	1.265		0.530827	7		9			7		9		1001	339		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	7.440	1000	2.256		0.530827	7		11			7		11		1001	340		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	8.883	1000	1.118		0.530827	7		15			7		15		1001	341		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	17.546	1000	1.468		0.530827	7		8			7		8		1001	342		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	8.906	1000	2.759		0.530827	8		16			8		16		1001	343		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	17.781	1000	3.213		0.530827	5		14			5		14		1001	344		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	6.631	1000	0.901		0.530827	6		10			6		10		1001	345		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	21.448	1000	2.673		0.530827	7		2			7		2		1001	346		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	7.941	1000	0.890		0.530827	7		8			7		8		1001	347		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	11.205	1000	0.986		0.530827	8		17			8		17		1001	350		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	23.178	1000	2.971		0.530827	6		11			6		11		1001	352		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	14.933	1000	2.530		0.530827	8		8			8		8		1001	353		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	11.470	1000	2.426		0.530827	6		16			6		16		1001	354		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	11.351	1000	3.239		0.530827	5		12			5		12		1001	355		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	8.384	1000	2.095		0.530827	6		10			6		10		1001	356		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	14.282	1000	2.132		0.530827	5		17			5		17		1001	358		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	22.039	1000	1.735		0.530827	7		15			7		15		1001	359		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5453	10.943	1000	1.767		0.530827	6		8			6		8		1001	363		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	13.234	1000	3.539		0.540178	5		12			5		12		1001	364		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	23.655	1000	3.161		0.540178	8		16			8		16		1001	365		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	5.822	1000	3.414		0.540178	6		2			6		2		1001	366		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	20.798	1000	3.340		0.540178	7		9			7		9		1001	367		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	16.149	1000	1.862		0.540178	7		13			7		13		1001	369		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	6.576	1000	2.006		0.540178	6		2			6		2		1001	370		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	17.446	1000	1.894		0.540178	6		14			6		14		1001	372		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	10.833	1000	3.027		0.540178	6		5			6		5		1001	374		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	17.537	1000	1.304		0.540178	7		16			7		16		1001	375		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	16.204	1000	0.989		0.540178	6		10			6		10		1001	376		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	18.987	1000	2.054		0.540178	6		12			6		12		1001	378		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	12.254	1000	3.387		0.540178	6		3			6		3		1001	379		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	22.358	1000	2.233		0.540178	7		17			7		17		1001	380		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	9.787	1000	2.714		0.540178	7		17			7		17		1001	382		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	9.376	1000	2.245		0.540178	7		1			7		1		1001	383		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6500	3.832	1000	1.804		0.540178	5		19			5		19		1001	384		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	19.768	1000	1.620		0.547906	5		3			5		3		1001	385		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	8.620	1000	1.927		0.547906	5		2			5		2		1001	387		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	20.956	1000	0.913		0.547906	5		11			5		11		1001	388		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	7.524	1000	1.241		0.547906	5		8			5		8		1001	390		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	3.400	1000	0.975		0.547906	6		15			6		15		1001	391		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	6.540	1000	3.111		0.547906	7		7			7		7		1001	392		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	18.270	1000	1.274		0.547906	7		18			7		18		1001	393		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	9.214	1000	2.686		0.547906	6		5			6		5		1001	394		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	6.405	1000	2.506		0.547906	7		13			7		13		1001	396		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	14.385	1000	2.266		0.547906	6		2			6		2		1001	397		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	5.575	1000	1.563		0.547906	7		16			7		16		1001	398		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	7.491	1000	1.598		0.547906	7		7			7		7		1001	400		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	14.600	1000	3.334		0.547906	6		18			6		18		1001	401		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	19.985	1000	2.834		0.547906	5		10			5		10		1001	403		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	10.745	1000	3.267		0.547906	6		19			6		19		1001	404		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	22.703	1000	2.165		0.547906	6		5			6		5		1001	407		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	16.972	1000	3.509		0.547906	7		2			7		2		1001	408		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	2.473	1000	1.461		0.547906	7		3			7		3		1001	410		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	4.741	1000	2.276		0.547906	8		15			8		15		1001	414		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	19.390	1000	3.225		0.547906	6		1			6		1		1001	415		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	5.027	1000	1.396		0.547906	7		7			7		7		1001	416		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	16.123	1000	0.795		0.547906	8		16			8		16		1001	418		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	10.240	1000	1.129		0.547906	7		1			7		1		1001	420		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	9.903	1000	1.015		0.547906	8		1			8		1		1001	422		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	19.700	1000	1.664		0.547906	5		2			5		2		1001	423		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	19.139	1000	2.491		0.547906	6		8			6		8		1001	426		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	8.018	1000	3.085		0.547906	5		13			5		13		1001	427		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	11.700	1000	1.015		0.547906	6		18			6		18		1001	428		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	10.040	1000	1.481		0.547906	5		2			5		2		1001	430		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	5.673	1000	2.168		0.547906	6		2			6		2		1001	431		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	16.081	1000	1.045		0.547906	7		2			7		2		1001	432		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	12.503	1000	0.821		0.547906	7		7			7		7		1001	433		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	22.049	1000	1.723		0.547906	6		9			6		9		1001	434		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	16.806	1000	1.972		0.547906	5		8			5		8		1001	435		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	12.631	1000	2.530		0.547906	6		14			6		14		1001	436		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7366	7.803	1000	1.737		0.547906	8		16			8		16		1001	437		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	20.594	1000	2.457		0.568495	7		17			7		17		1001	438		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	21.954	1000	2.969		0.568495	6		19			6		19		1001	439		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	6.622	1000	0.894		0.568495	6		19			6		19		1001	440		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	5.927	1000	2.440		0.568495	7		13			7		13		1001	443		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	22.412	1000	2.459		0.568495	6		5			6		5		1001	444		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	7.709	1000	1.770		0.568495	7		16			7		16		1001	445		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	20.393	1000	2.140		0.568495	7		12			7		12		1001	446		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	17.200	1000	2.319		0.568495	6		18			6		18		1001	450		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	4.883	1000	1.110		0.568495	8		17			8		17		1001	451		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	18.572	1000	1.023		0.568495	7		14			7		14		1001	455		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	6.846	1000	2.199		0.568495	8		4			8		4		1001	457		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	18.247	1000	0.835		0.568495	6		6			6		6		1001	459		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	22.154	1000	2.241		0.568495	7		9			7		9		1001	461		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	9.643	1000	3.344		0.568495	7		12			7		12		1001	462		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	20.884	1000	2.439		0.568495	6		14			6		14		1001	463		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	9.975	1000	2.248		0.568495	6		17			6		17		1001	464		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	22.004	1000	3.460		0.568495	6		7			6		7		1001	466		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	11.260	1000	3.425		0.568495	6		11			6		11		1001	467		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	16.364	1000	3.243		0.568495	7		16			7		16		1001	468		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9671	16.940	1000	2.229		0.568495	7		5			7		5		1001	469		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	18.031	1000	1.475		0.657361	5		5			5		5		1001	470		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	15.572	1000	2.449		0.657361	6		8			6		8		1001	471		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	16.353	1000	2.462		0.657361	8		7			8		7		1001	475		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	20.828	1000	1.863		0.657361	5		13			5		13		1001	480		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	6.761	1000	0.922		0.657361	7		2			7		2		1001	481		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	15.913	1000	3.023		0.657361	8		8			8		8		1001	486		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	18.198	1000	2.684		0.657361	7		3			7		3		1001	488		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	14.435	1000	2.631		0.657361	6		20			6		20		1001	490		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	8.425	1000	1.470		0.657361	7		2			7		2		1001	491		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	10.647	1000	1.836		0.657361	6		13			6		13		1001	492		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	11.034	1000	3.318		0.657361	6		5			6		5		1001	493		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	7.230	1000	2.332		0.657361	6		5			6		5		1001	494		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	6.367	1000	2.807		0.657361	6		9			6		9		1001	495		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	22.410	1000	2.102		0.657361	6		1			6		1		1001	496		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	17.248	1000	2.457		0.657361	5		13			5		13		1001	497		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	11.136	1000	3.257		0.657361	7		2			7		2		1001	498		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	6.211	1000	1.062		0.657361	7		19			7		19		1001	499		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	20.284	1000	1.986		0.657361	7		16			7		16		1001	501		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	9.131	1000	1.350		0.657361	6		13			6		13		1001	502		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	22.140	1000	2.911		0.657361	6		4			6		4		1001	504		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	8.255	1000	3.441		0.657361	6		5			6		5		1001	506		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	7.742	1000	2.174		0.657361	7		4			7		4		1001	508		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	12.696	1000	2.866		0.657361	8		3			8		3		1001	509		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	23.090	1000	1.970		0.657361	8		2			8		2		1001	512		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	16.601	1000	2.647		0.657361	7		18			7		18		1001	513		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	10.301	1000	2.657		0.657361	8		7			8		7		1001	514		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	23.009	1000	1.881		0.657361	7		19			7		19		1001	515		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	19.211	1000	1.980		0.657361	7		15			7		15		1001	517		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	2.882	1000	2.148		0.657361	5		11			5		11		1001	520		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	21.671	1000	1.528		0.657361	7		19			7		19		1001	522		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	7.993	1000	2.223		0.657361	5		18			5		18		1001	523		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	18.050	1000	3.194		0.657361	7		20			7		20		1001	524		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	14.060	1000	2.007		0.657361	7		4			7		4		1001	526		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	13.385	1000	1.743		0.657361	8		10			8		10		1001	527		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	15.562	1000	3.368		0.657361	5		10			5		10		1001	528		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	20.300	1000	2.055		0.657361	5		15			5		15		1001	529		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9624	7.989	1000	0.975		0.657361	8		3			8		3		1001	530		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	17.237	1000	3.195		0.692873	7		17			7		17		1001	531		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	15.883	1000	0.774		0.692873	6		19			6		19		1001	532		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	14.891	1000	2.256		0.692873	7		4			7		4		1001	533		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.800	1000	2.422		0.692873	6		1			6		1		1001	534		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	13.235	1000	1.518		0.692873	8		8			8		8		1001	535		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.810	1000	2.386		0.692873	8		2			8		2		1001	537		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.055	1000	3.192		0.692873	6		9			6		9		1001	539		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.109	1000	2.621		0.692873	7		16			7		16		1001	541		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	9.811	1000	2.761		0.692873	6		7			6		7		1001	544		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	19.950	1000	3.139		0.692873	8		3			8		3		1001	545		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	19.305	1000	2.681		0.692873	5		21			5		21		1001	546		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	5.480	1000	2.956		0.692873	6		7			6		7		1001	547		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	21.375	1000	1.651		0.692873	8		20			8		20		1001	548		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.555	1000	2.742		0.692873	8		7			8		7		1001	550		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	3.780	1000	1.930		0.692873	5		5			5		5		1001	553		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	21.775	1000	2.534		0.692873	7		4			7		4		1001	554		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	17.510	1000	1.180		0.692873	8		3			8		3		1001	555		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	11.080	1000	1.359		0.692873	5		7			5		7		1001	560		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	10.430	1000	2.432		0.692873	7		22			7		22		1001	561		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3602	5.428	1000	1.195		0.692873	6		4			6		4		1001	564		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	12.310	1000	1.539		0.695043	6		19			6		19		1001	565		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	9.544	1000	3.309		0.695043	6		9			6		9		1001	566		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	20.468	1000	1.525		0.695043	6		2			6		2		1001	568		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	11.772	1000	1.171		0.695043	8		19			8		19		1001	569		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	18.442	1000	1.894		0.695043	8		7			8		7		1001	572		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	12.615	1000	2.964		0.695043	5		9			5		9		1001	573		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	16.155	1000	2.345		0.695043	6		2			6		2		1001	574		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	11.802	1000	0.781		0.695043	7		16			7		16		1001	575		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	13.631	1000	0.789		0.695043	5		20			5		20		1001	578		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	8.390	1000	1.077		0.695043	5		2			5		2		1001	579		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	4.190	1000	2.881		0.695043	7		6			7		6		1001	580		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	8.220	1000	2.123		0.695043	6		19			6		19		1001	581		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	6.888	1000	1.860		0.695043	8		4			8		4		1001	582		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	4.693	1000	2.908		0.695043	6		14			6		14		1001	583		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	9.392	1000	1.930		0.695043	6		11			6		11		1001	584		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	7.183	1000	2.416		0.695043	7		8			7		8		1001	588		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	23.119	1000	3.110		0.695043	6		6			6		6		1001	591		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	15.793	1000	2.571		0.695043	8		19			8		19		1001	594		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	17.654	1000	2.695		0.695043	8		4			8		4		1001	596		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3845	21.574	1000	1.514		0.695043	6		11			6		11		1001	597		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	5.377	1000	1.067		0.751672	8		13			8		13		1001	599		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	13.468	1000	1.862		0.751672	7		16			7		16		1001	600		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	7.070	1000	1.365		0.751672	7		17			7		17		1001	601		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	9.621	1000	0.987		0.751672	6		8			6		8		1001	602		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	1.500	1000	0.956		0.751672	7		16			7		16		1001	603		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	1.889	1000	0.882		0.751672	7		13			7		13		1001	606		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	3.911	1000	1.400		0.751672	7		15			7		15		1001	613		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	15.698	1000	1.344		0.751672	8		4			8		4		1001	617		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	15.433	1000	1.837		0.751672	6		7			6		7		1001	618		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	6.974	1000	3.295		0.751672	7		9			7		9		1001	619		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	16.335	1000	2.259		0.751672	7		22			7		22		1001	620		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	16.331	1000	3.105		0.751672	6		15			6		15		1001	621		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	8.471	1000	2.374		0.751672	7		3			7		3		1001	623		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	17.316	1000	1.368		0.751672	7		20			7		20		1001	624		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	6.347	1000	1.751		0.751672	6		2			6		2		1001	625		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	20.750	1000	3.268		0.751672	5		16			5		16		1001	626		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	13.249	1000	3.302		0.751672	7		9			7		9		1001	627		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	3.814	1000	2.022		0.751672	8		13			8		13		1001	628		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	3.767	1000	2.377		0.751672	6		9			6		9		1001	630		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	4.560	1000	2.706		0.751672	5		20			5		20		1001	631		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	17.220	1000	2.646		0.751672	7		22			7		22		1001	633		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	12.891	1000	1.297		0.751672	8		20			8		20		1001	636		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	11.651	1000	1.083		0.751672	6		1			6		1		1001	638		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	21.316	1000	2.130		0.751672	6		14			6		14		1001	639		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	4.572	1000	2.295		0.751672	5		16			5		16		1001	640		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	4.895	1000	1.563		0.751672	6		22			6		22		1001	641		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	5.166	1000	2.403		0.751672	8		9			8		9		1001	642		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	15.750	1000	0.871		0.751672	5		4			5		4		1001	643		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	10.072	1000	0.930		0.751672	6		22			6		22		1001	644		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	2.410	1000	1.269		0.751672	6		20			6		20		1001	645		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0187	14.974	1000	2.645		0.751672	7		1			7		1		1001	646		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	20.903	1000	1.268		0.817799	7		25			7		25		1001	647		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	18.731	1000	2.539		0.817799	7		18			7		18		1001	648		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	4.796	1000	2.196		0.817799	6		21			6		21		1001	649		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	10.933	1000	1.365		0.817799	6		19			6		19		1001	653		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	10.033	1000	2.884		0.817799	7		15			7		15		1001	654		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	18.827	1000	3.076		0.817799	7		3			7		3		1001	656		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	12.748	1000	1.898		0.817799	6		19			6		19		1001	658		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	9.498	1000	2.110		0.817799	7		5			7		5		1001	659		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	15.078	1000	3.153		0.817799	7		21			7		21		1001	661		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	9.052	1000	1.822		0.817799	6		12			6		12		1001	662		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	13.517	1000	2.002		0.817799	7		10			7		10		1001	666		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	2.929	1000	1.360		0.817799	6		12			6		12		1001	668		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7594	2.926	1000	1.361		0.817799	7		11			7		11		1001	669		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	16.177	1000	1.515		0.843451	6		14			6		14		1001	670		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	22.278	1000	1.945		0.843451	6		21			6		21		1001	671		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	4.702	1000	2.906		0.843451	7		5			7		5		1001	672		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	14.963	1000	1.511		0.843451	7		21			7		21		1001	673		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	17.857	1000	2.909		0.843451	7		24			7		24		1001	674		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	2.456	1000	0.772		0.843451	6		18			6		18		1001	675		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	13.706	1000	2.895		0.843451	6		24			6		24		1001	678		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	17.456	1000	1.446		0.843451	7		22			7		22		1001	679		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	16.721	1000	1.424		0.843451	7		13			7		13		1001	680		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	6.166	1000	1.292		0.843451	6		5			6		5		1001	681		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	21.244	1000	1.918		0.843451	6		20			6		20		1001	682		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	5.616	1000	2.203		0.843451	6		21			6		21		1001	685		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	8.511	1000	2.584		0.843451	5		1			5		1		1001	686		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0466	14.079	1000	2.762		0.843451	7		25			7		25		1001	687		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	9.450	1000	1.416		0.892062	7		11			7		11		1001	689		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	11.866	1000	2.750		0.892062	7		16			7		16		1001	690		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	16.106	1000	2.492		0.892062	7		12			7		12		1001	692		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	18.623	1000	2.544		0.892062	8		8			8		8		1001	693		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	10.520	1000	1.935		0.892062	6		11			6		11		1001	694		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	8.361	1000	1.534		0.892062	7		7			7		7		1001	695		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	11.167	1000	1.386		0.892062	7		8			7		8		1001	696		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	6.102	1000	0.765		0.892062	6		22			6		22		1001	701		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	12.004	1000	2.230		0.892062	5		12			5		12		1001	702		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	8.078	1000	1.887		0.892062	5		23			5		23		1001	703		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	4.799	1000	2.801		0.892062	7		6			7		6		1001	704		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	4.500	1000	1.816		0.892062	7		11			7		11		1001	705		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	7.891	1000	3.189		0.892062	7		1			7		1		1001	706		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	19.330	1000	2.914		0.892062	5		15			5		15		1001	707		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	17.049	1000	2.266		0.892062	8		26			8		26		1001	708		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	20.585	1000	2.327		0.892062	5		15			5		15		1001	709		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	13.111	1000	1.679		0.892062	5		17			5		17		1001	710		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	19.820	1000	2.545		0.892062	5		7			5		7		1001	712		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	8.443	1000	1.943		0.892062	6		22			6		22		1001	713		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	16.918	1000	2.126		0.892062	6		21			6		21		1001	714		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	16.600	1000	1.093		0.892062	5		3			5		3		1001	715		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	10.936	1000	1.937		0.892062	6		4			6		4		1001	716		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	18.888	1000	3.007		0.892062	7		15			7		15		1001	718		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	4.286	1000	1.338		0.892062	7		14			7		14		1001	719		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	18.155	1000	1.271		0.892062	6		20			6		20		1001	720		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	11.851	1000	2.234		0.892062	8		18			8		18		1001	723		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	15.401	1000	2.487		0.892062	6		9			6		9		1001	725		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	19.206	1000	2.091		0.892062	8		16			8		16		1001	727		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	6.587	1000	2.368		0.892062	5		22			5		22		1001	728		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	21.826	1000	2.816		0.892062	6		5			6		5		1001	729		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	4.844	1000	1.519		0.892062	5		19			5		19		1001	732		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	9.904	1000	0.981		0.892062	6		16			6		16		1001	733		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5911	7.482	1000	2.478		0.892062	7		8			7		8		1001	734		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	7.444	1000	2.888		0.927222	7		11			7		11		1001	735		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	7.872	1000	1.177		0.927222	8		8			8		8		1001	738		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	6.473	1000	3.026		0.927222	7		19			7		19		1001	739		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	8.684	1000	1.576		0.927222	6		16			6		16		1001	741		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	17.611	1000	2.450		0.927222	6		15			6		15		1001	742		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	19.707	1000	1.546		0.927222	5		11			5		11		1001	743		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	6.713	1000	2.040		0.927222	6		4			6		4		1001	744		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	3.197	1000	1.685		0.927222	6		8			6		8		1001	745		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	18.124	1000	0.922		0.927222	6		16			6		16		1001	747		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	5.233	1000	2.914		0.927222	7		10			7		10		1001	749		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	20.979	1000	2.670		0.927222	7		18			7		18		1001	750		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	10.380	1000	3.012		0.927222	6		21			6		21		1001	751		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	10.472	1000	0.964		0.927222	7		26			7		26		1001	752		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	18.641	1000	2.037		0.927222	5		13			5		13		1001	754		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	10.685	1000	2.088		0.927222	6		25			6		25		1001	755		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	13.684	1000	2.832		0.927222	5		11			5		11		1001	756		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9849	9.593	1000	1.474		0.927222	5		18			5		18		1001	758		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	4.486	1000	2.530		0.957470	6		14			6		14		1001	760		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	12.688	1000	2.916		0.957470	6		8			6		8		1001	761		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	4.506	1000	1.252		0.957470	7		9			7		9		1001	762		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	7.210	1000	2.514		0.957470	8		14			8		14		1001	763		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	17.828	1000	3.100		0.957470	6		15			6		15		1001	764		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	5.548	1000	1.635		0.957470	7		14			7		14		1001	765		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	10.945	1000	1.839		0.957470	5		5			5		5		1001	766		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	15.645	1000	2.566		0.957470	7		13			7		13		1001	768		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	19.309	1000	1.066		0.957470	5		10			5		10		1001	769		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	17.934	1000	2.968		0.957470	7		22			7		22		1001	772		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	10.155	1000	2.091		0.957470	5		1			5		1		1001	773		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	18.482	1000	1.739		0.957470	8		21			8		21		1001	774		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	15.465	1000	1.432		0.957470	7		2			7		2		1001	775		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	20.823	1000	2.636		0.957470	7		3			7		3		1001	776		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3237	23.043	1000	2.500		0.957470	7		27			7		27		1001	777		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	9.510	1000	2.530		0.960310	7		9			7		9		1001	778		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	14.982	1000	2.513		0.960310	7		16			7		16		1001	779		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	10.002	1000	2.477		0.960310	7		10			7		10		1001	781		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	14.159	1000	1.812		0.960310	6		5			6		5		1001	782		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	20.058	1000	2.981		0.960310	8		12			8		12		1001	783		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	9.076	1000	0.855		0.960310	7		9			7		9		1001	784		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	5.612	1000	1.520		0.960310	7		8			7		8		1001	786		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	14.436	1000	0.974		0.960310	5		2			5		2		1001	789		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	21.513	1000	1.298		0.960310	8		17			8		17		1001	790		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	4.347	1000	1.492		0.960310	6		27			6		27		1001	793		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	5.053	1000	2.653		0.960310	8		4			8		4		1001	794		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	3.877	1000	0.898		0.960310	5		16			5		16		1001	796		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	15.461	1000	2.082		0.960310	7		5			7		5		1001	797		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3555	17.419	1000	1.110		0.960310	8		11			8		11		1001	798		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	16.323	1000	2.937		0.982997	6		4			6		4		1001	799		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	13.464	1000	1.354		0.982997	6		8			6		8		1001	800		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	6.684	1000	3.108		0.982997	7		16			7		16		1001	801		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	14.473	1000	2.979		0.982997	5		23			5		23		1001	804		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	1.404	1000	1.050		0.982997	7		17			7		17		1001	806		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	7.616	1000	2.842		0.982997	7		15			7		15		1001	807		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	18.978	1000	0.918		0.982997	6		7			6		7		1001	809		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	21.391	1000	1.254		0.982997	8		11			8		11		1001	810		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	17.793	1000	1.533		0.982997	5		22			5		22		1001	811		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	16.653	1000	1.801		0.982997	6		23			6		23		1001	812		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	13.999	1000	2.527		0.982997	5		23			5		23		1001	814		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	19.920	1000	1.728		0.982997	6		14			6		14		1001	818		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	13.250	1000	1.683		0.982997	7		28			7		28		1001	819		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	15.579	1000	2.034		0.982997	7		14			7		14		1001	820		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	17.781	1000	3.202		0.982997	7		20			7		20		1001	821		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	9.611	1000	2.110		0.982997	5		20			5		20		1001	825		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	10.802	1000	0.936		0.982997	5		13			5		13		1001	826		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	14.170	1000	0.882		0.982997	8		5			8		5		1001	827		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	18.146	1000	2.868		0.982997	7		3			7		3		1001	828		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	3.070	1000	1.219		0.982997	6		26			6		26		1001	829		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	8.072	1000	3.037		0.982997	6		14			6		14		1001	830		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	16.236	1000	2.406		0.982997	5		26			5		26		1001	836		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	12.010	1000	2.940		0.982997	7		11			7		11		1001	837		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	11.298	1000	2.550		0.982997	7		23			7		23		1001	839		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	10.419	1000	0.929		0.982997	6		22			6		22		1001	840		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	12.245	1000	3.038		0.982997	7		16			7		16		1001	842		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	8.986	1000	1.402		0.982997	7		26			7		26		1001	846		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	6.484	1000	1.839		0.982997	6		20			6		20		1001	847		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	12.145	1000	1.123		0.982997	5		10			5		10		1001	848		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	6.218	1000	2.912		0.982997	7		24			7		24		1001	849		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	7.658	1000	1.153		0.982997	6		17			6		17		1001	851		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	3.109	1000	1.337		0.982997	7		14			7		14		1001	854		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	19.788	1000	3.026		0.982997	7		2			7		2		1001	855		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	15.950	1000	2.379		0.982997	7		9			7		9		1001	857		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6096	7.568	1000	2.742		0.982997	8		16			8		16		1001	858		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	23.077	1000	2.002		0.997644	6		22			6		22		1001	859		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	15.816	1000	2.234		0.997644	8		12			8		12		1001	861		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	7.548	1000	2.603		0.997644	6		2			6		2		1001	866		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	23.560	1000	2.666		0.997644	5		8			5		8		1001	868		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	21.593	1000	2.274		0.997644	7		22			7		22		1001	870		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	2.998	1000	1.478		0.997644	5		9			5		9		1001	871		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	14.686	1000	1.053		0.997644	6		2			6		2		1001	872		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	4.147	1000	2.117		0.997644	7		6			7		6		1001	873		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	2.783	1000	1.302		0.997644	8		7			8		7		1001	875		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	3.292	1000	0.803		0.997644	6		15			6		15		1001	876		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	19.348	1000	1.119		0.997644	5		20			5		20		1001	878		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	11.753	1000	0.877		0.997644	5		14			5		14		1001	880		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	4.962	1000	0.779		0.997644	8		17			8		17		1001	882		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7736	19.365	1000	2.719		0.997644	5		4			5		4		1001	884		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	8.034	1000	2.742		1.036517	6		21			6		21		1001	885		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	6.570	1000	2.423		1.036517	7		27			7		27		1001	886		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	5.320	1000	2.280		1.036517	7		19			7		19		1001	887		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	14.717	1000	2.163		1.036517	6		11			6		11		1001	889		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	21.809	1000	1.672		1.036517	6		20			6		20		1001	890		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	13.312	1000	2.902		1.036517	5		20			5		20		1001	891		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	24.088	1000	2.687		1.036517	7		3			7		3		1001	892		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	20.388	1000	1.486		1.036517	8		26			8		26		1001	894		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	16.782	1000	2.959		1.036517	8		28			8		28		1001	897		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	13.351	1000	1.518		1.036517	7		26			7		26		1001	899		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	14.771	1000	1.395		1.036517	5		8			5		8		1001	900		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	12.717	1000	2.741		1.036517	7		2			7		2		1001	902		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	17.589	1000	2.261		1.036517	7		2			7		2		1001	903		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	7.381	1000	0.916		1.036517	5		14			5		14		1001	906		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	23.000	1000	2.652		1.036517	6		4			6		4		1001	908		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	16.476	1000	1.971		1.036517	7		25			7		25		1001	909		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	14.775	1000	1.134		1.036517	6		28			6		28		1001	910		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	23.647	1000	2.436		1.036517	7		4			7		4		1001	911		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	3.216	1000	1.644		1.036517	5		9			5		9		1001	912		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	17.976	1000	1.217		1.036517	5		24			5		24		1001	913		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	20.531	1000	2.437		1.036517	7		7			7		7		1001	915		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	8.944	1000	2.773		1.036517	6		12			6		12		1001	918		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	9.313	1000	1.428		1.036517	6		21			6		21		1001	919		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	13.163	1000	1.014		1.036517	6		14			6		14		1001	920		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	9.583	1000	2.857		1.036517	6		23			6		23		1001	921		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	13.397	1000	1.398		1.036517	7		28			7		28		1001	922		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	4.647	1000	1.396		1.036517	7		23			7		23		1001	924		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	8.724	1000	2.596		1.036517	6		4			6		4		1001	927		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2090	22.146	1000	2.365		1.036517	6		2			6		2		1001	930		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	14.385	1000	2.373		1.036609	8		26			8		26		1001	931		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	4.656	1000	2.908		1.036609	5		1			5		1		1001	938		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	20.788	1000	2.423		1.036609	6		25			6		25		1001	940		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	14.417	1000	2.748		1.036609	7		2			7		2		1001	942		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	20.229	1000	1.849		1.036609	5		12			5		12		1001	943		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	8.460	1000	0.926		1.036609	7		5			7		5		1001	944		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	16.540	1000	1.904		1.036609	8		27			8		27		1001	945		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	19.304	1000	0.995		1.036609	8		18			8		18		1001	947		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	5.364	1000	0.977		1.036609	7		7			7		7		1001	948		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	11.141	1000	2.714		1.036609	8		17			8		17		1001	949		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	21.209	1000	1.434		1.036609	7		2			7		2		1001	950		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	21.552	1000	2.517		1.036609	5		22			5		22		1001	952		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	9.494	1000	2.568		1.036609	7		21			7		21		1001	955		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	13.147	1000	2.357		1.036609	7		19			7		19		1001	956		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	16.938	1000	1.754		1.036609	6		10			6		10		1001	957		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	22.029	1000	1.362		1.036609	6		11			6		11		1001	958		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	6.622	1000	1.648		1.036609	5		7			5		7		1001	959		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	10.365	1000	1.550		1.036609	7		26			7		26		1001	960		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	6.222	1000	1.263		1.036609	6		13			6		13		1001	961		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	17.535	1000	1.461		1.036609	5		11			5		11		1001	963		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2100	12.821	1000	2.242		1.036609	7		22			7		22		1001	964		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	8.419	1000	2.038		1.050623	5		19			5		19		1001	965		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	13.528	1000	1.820		1.050623	5		3			5		3		1001	969		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	14.901	1000	1.588		1.050623	7		4			7		4		1001	970		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	9.950	1000	1.896		1.050623	6		1			6		1		1001	971		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	18.244	1000	2.751		1.050623	7		4			7		4		1001	972		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	14.296	1000	2.630		1.050623	7		1			7		1		1001	973		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	16.908	1000	1.371		1.050623	6		14			6		14		1001	974		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	9.247	1000	1.337		1.050623	8		17			8		17		1001	975		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	13.569	1000	0.919		1.050623	6		8			6		8		1001	977		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	18.288	1000	2.318		1.050623	5		8			5		8		1001	979		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	7.283	1000	2.007		1.050623	7		9			7		9		1001	980		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	6.774	1000	0.830		1.050623	6		24			6		24		1001	983		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3670	18.009	1000	1.699		1.050623	5		7			5		7		1001	984		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	7.310	1000	0.829		1.092535	5		6			5		6		1001	985		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	9.645	1000	0.977		1.092535	6		22			6		22		1001	987		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	9.034	1000	2.008		1.092535	7		1			7		1		1001	989		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	12.044	1000	2.277		1.092535	8		19			8		19		1001	990		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	9.494	1000	2.062		1.092535	7		2			7		2		1001	991		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	2.996	1000	2.103		1.092535	5		28			5		28		1001	992		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	17.083	1000	1.801		1.092535	8		6			8		6		1001	993		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	19.629	1000	1.019		1.092535	7		3			7		3		1001	994		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	13.579	1000	1.359		1.092535	6		2			6		2		1001	995		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	6.159	1000	1.451		1.092535	5		23			5		23		1001	996		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	23.940	1000	3.010		1.092535	7		8			7		8		1001	997		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	17.687	1000	2.935		1.092535	7		1			7		1		1001	1002		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	16.776	1000	1.215		1.092535	6		15			6		15		1001	1003		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	6.643	1000	2.436		1.092535	7		19			7		19		1001	1005		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	21.411	1000	1.602		1.092535	7		25			7		25		1001	1006		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	19.586	1000	1.893		1.092535	7		2			7		2		1001	1009		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	1.859	1000	1.160		1.092535	8		6			8		6		1001	1012		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	20.597	1000	1.015		1.092535	7		15			7		15		1001	1013		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	19.888	1000	2.801		1.092535	6		8			6		8		1001	1014		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	13.209	1000	2.161		1.092535	6		16			6		16		1001	1015		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	11.077	1000	1.738		1.092535	7		28			7		28		1001	1016		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	7.384	1000	2.680		1.092535	8		24			8		24		1001	1017		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	17.597	1000	1.755		1.092535	5		19			5		19		1001	1018		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	16.656	1000	2.157		1.092535	8		18			8		18		1001	1019		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	20.159	1000	1.366		1.092535	6		15			6		15		1001	1022		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	13.189	1000	2.275		1.092535	7		17			7		17		1001	1023		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	10.678	1000	1.272		1.092535	6		11			6		11		1001	1024		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	4.130	1000	2.209		1.092535	6		24			6		24		1001	1025		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	3.666	1000	1.030		1.092535	7		14			7		14		1001	1026		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	10.216	1000	1.660		1.092535	7		17			7		17		1001	1027		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8364	6.307	1000	1.540		1.092535	6		24			6		24		1001	1028		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	19.792	1000	1.536		1.133856	8		12			8		12		1001	1030		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	7.731	1000	1.252		1.133856	5		11			5		11		1001	1031		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	9.870	1000	1.067		1.133856	8		29			8		29		1001	1035		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	8.056	1000	1.699		1.133856	5		24			5		24		1001	1037		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	10.346	1000	1.477		1.133856	8		17			8		17		1001	1038		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	24.432	1000	3.031		1.133856	7		12			7		12		1001	1044		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	13.396	1000	1.744		1.133856	8		11			8		11		1001	1045		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	13.290	1000	1.294		1.133856	5		23			5		23		1001	1046		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	7.185	1000	0.906		1.133856	7		20			7		20		1001	1050		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	8.398	1000	2.915		1.133856	8		25			8		25		1001	1051		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	19.282	1000	0.938		1.133856	6		5			6		5		1001	1052		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	9.969	1000	1.491		1.133856	6		24			6		24		1001	1053		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2992	6.377	1000	1.273		1.133856	7		21			7		21		1001	1054		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	17.836	1000	2.294		1.148473	7		31			7		31		1001	1056		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	20.017	1000	1.212		1.148473	7		27			7		27		1001	1057		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	5.360	1000	1.116		1.148473	8		2			8		2		1001	1058		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	17.566	1000	2.013		1.148473	7		12			7		12		1001	1059		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	15.922	1000	2.636		1.148473	7		2			7		2		1001	1060		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	21.490	1000	1.541		1.148473	6		19			6		19		1001	1061		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	14.184	1000	1.510		1.148473	6		30			6		30		1001	1062		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	21.348	1000	1.556		1.148473	7		16			7		16		1001	1063		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	16.749	1000	1.002		1.148473	5		31			5		31		1001	1064		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	9.502	1000	2.923		1.148473	5		3			5		3		1001	1065		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	8.026	1000	2.118		1.148473	5		18			5		18		1001	1066		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	7.383	1000	2.667		1.148473	7		23			7		23		1001	1069		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	7.397	1000	2.593		1.148473	6		3			6		3		1001	1072		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	7.727	1000	2.987		1.148473	8		5			8		5		1001	1074		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	15.499	1000	2.758		1.148473	7		5			7		5		1001	1076		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	9.607	1000	3.034		1.148473	7		26			7		26		1001	1077		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	7.646	1000	1.530		1.148473	6		27			6		27		1001	1079		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	20.376	1000	0.865		1.148473	7		14			7		14		1001	1081		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	8.069	1000	2.327		1.148473	7		23			7		23		1001	1082		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	14.308	1000	2.669		1.148473	5		6			5		6		1001	1083		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	18.843	1000	0.981		1.148473	6		16			6		16		1001	1084		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	12.246	1000	2.917		1.148473	8		2			8		2		1001	1085		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	8.110	1000	1.539		1.148473	7		1			7		1		1001	1086		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	7.313	1000	2.534		1.148473	8		25			8		25		1001	1088		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	19.853	1000	0.823		1.148473	7		30			7		30		1001	1089		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	9.321	1000	1.696		1.148473	7		10			7		10		1001	1092		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	14.092	1000	1.218		1.148473	8		19			8		19		1001	1097		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4629	19.278	1000	1.412		1.148473	7		11			7		11		1001	1098		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	14.280	1000	1.056		1.153435	6		6			6		6		1001	1099		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	4.688	1000	1.904		1.153435	6		11			6		11		1001	1100		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	23.935	1000	2.918		1.153435	6		24			6		24		1001	1102		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	13.776	1000	1.526		1.153435	6		1			6		1		1001	1103		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	3.227	1000	1.206		1.153435	7		20			7		20		1001	1105		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	12.292	1000	1.901		1.153435	6		8			6		8		1001	1106		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	6.561	1000	1.057		1.153435	7		6			7		6		1001	1109		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	11.423	1000	0.774		1.153435	8		4			8		4		1001	1110		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	11.111	1000	2.921		1.153435	6		28			6		28		1001	1111		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	17.123	1000	2.558		1.153435	6		12			6		12		1001	1118		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	5.466	1000	1.158		1.153435	5		15			5		15		1001	1119		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	7.528	1000	1.001		1.153435	8		26			8		26		1001	1120		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	6.152	1000	2.982		1.153435	7		26			7		26		1001	1121		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	21.332	1000	2.227		1.153435	8		28			8		28		1001	1124		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	7.632	1000	1.192		1.153435	8		7			8		7		1001	1126		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	7.733	1000	1.453		1.153435	6		23			6		23		1001	1127		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	14.458	1000	2.635		1.153435	6		22			6		22		1001	1128		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	16.417	1000	1.982		1.153435	7		31			7		31		1001	1129		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	15.791	1000	2.366		1.153435	6		7			6		7		1001	1134		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	10.789	1000	2.763		1.153435	7		31			7		31		1001	1137		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	3.861	1000	0.970		1.153435	7		21			7		21		1001	1139		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	13.479	1000	1.901		1.153435	5		22			5		22		1001	1140		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	11.697	1000	2.969		1.153435	5		27			5		27		1001	1141		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	20.753	1000	2.398		1.153435	6		27			6		27		1001	1142		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	5.010	1000	1.998		1.153435	7		15			7		15		1001	1143		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	2.998	1000	1.359		1.153435	7		17			7		17		1001	1144		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	20.678	1000	1.473		1.153435	5		27			5		27		1001	1146		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	14.982	1000	1.273		1.153435	7		31			7		31		1001	1147		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	7.998	1000	0.964		1.153435	8		27			8		27		1001	1148		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	18.652	1000	2.891		1.153435	6		21			6		21		1001	1150		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5185	4.585	1000	2.496		1.153435	6		31			6		31		1001	1151		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	21.786	1000	1.560		1.161520	7		1			7		1		1001	1152		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	20.549	1000	2.190		1.161520	7		5			7		5		1001	1154		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	15.990	1000	1.292		1.161520	6		11			6		11		1001	1155		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	22.047	1000	2.253		1.161520	6		8			6		8		1001	1156		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	20.133	1000	2.503		1.161520	7		7			7		7		1001	1158		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	6.381	1000	0.799		1.161520	7		16			7		16		1001	1159		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	9.290	1000	1.693		1.161520	6		3			6		3		1001	1160		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	10.641	1000	1.311		1.161520	6		8			6		8		1001	1161		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	1.725	1000	1.053		1.161520	7		7			7		7		1001	1162		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	17.996	1000	1.571		1.161520	7		18			7		18		1001	1164		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	3.790	1000	1.188		1.161520	5		31			5		31		1001	1166		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	4.091	1000	3.036		1.161520	5		30			5		30		1001	1167		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	13.170	1000	0.842		1.161520	7		32			7		32		1001	1168		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	5.560	1000	1.194		1.161520	6		28			6		28		1001	1169		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	7.327	1000	1.862		1.161520	5		15			5		15		1001	1170		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	3.781	1000	0.923		1.161520	5		16			5		16		1001	1172		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	8.432	1000	1.856		1.161520	7		1			7		1		1001	1173		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	3.433	1000	1.791		1.161520	8		1			8		1		1001	1175		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6090	17.883	1000	1.719		1.161520	8		1			8		1		1001	1176		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	9.892	1000	2.595		1.188410	6		22			6		22		1001	1177		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	10.185	1000	1.385		1.188410	8		26			8		26		1001	1178		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	15.693	1000	2.158		1.188410	5		18			5		18		1001	1179		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	1.615	1000	0.794		1.188410	5		24			5		24		1001	1182		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	11.068	1000	2.470		1.188410	7		10			7		10		1001	1183		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	22.233	1000	1.842		1.188410	6		9			6		9		1001	1186		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	21.379	1000	2.755		1.188410	8		7			8		7		1001	1189		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	3.004	1000	1.368		1.188410	7		15			7		15		1001	1190		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	19.972	1000	1.653		1.188410	8		10			8		10		1001	1191		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	20.586	1000	2.065		1.188410	7		11			7		11		1001	1192		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	14.531	1000	2.126		1.188410	7		24			7		24		1001	1196		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	20.796	1000	1.195		1.188410	6		5			6		5		1001	1197		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	15.224	1000	2.967		1.188410	5		5			5		5		1001	1198		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	8.786	1000	0.875		1.188410	8		14			8		14		1001	1200		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	14.744	1000	1.913		1.188410	5		12			5		12		1001	1202		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	16.944	1000	2.656		1.188410	7		3			7		3		1001	1204		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	22.208	1000	1.805		1.188410	8		3			8		3		1001	1206		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	14.271	1000	2.808		1.188410	7		1			7		1		1001	1207		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	4.997	1000	1.137		1.188410	7		26			7		26		1001	1211		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	14.022	1000	1.130		1.188410	7		10			7		10		1001	1212		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9102	16.397	1000	1.433		1.188410	8		30			8		30		1001	1213		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	18.579	1000	2.082		1.343673	8		17			8		17		1001	1215		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	18.849	1000	1.506		1.343673	6		30			6		30		1001	1216		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	20.440	1000	2.593		1.343673	7		5			7		5		1001	1217		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	16.184	1000	1.261		1.343673	6		20			6		20		1001	1218		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	8.649	1000	2.089		1.343673	7		14			7		14		1001	1219		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	15.775	1000	2.061		1.343673	6		14			6		14		1001	1220		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	6.653	1000	2.773		1.343673	8		10			8		10		1001	1223		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	5.318	1000	0.838		1.343673	7		33			7		33		1001	1225		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	9.076	1000	2.187		1.343673	6		28			6		28		1001	1226		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	12.707	1000	2.185		1.343673	8		29			8		29		1001	1229		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	9.548	1000	1.786		1.343673	8		18			8		18		1001	1230		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	12.033	1000	0.911		1.343673	7		35			7		35		1001	1231		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	20.843	1000	1.212		1.343673	5		28			5		28		1001	1232		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	19.503	1000	0.809		1.343673	7		16			7		16		1001	1234		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	19.466	1000	1.841		1.343673	7		2			7		2		1001	1235		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	10.316	1000	0.848		1.343673	6		27			6		27		1001	1236		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	12.541	1000	2.102		1.343673	7		1			7		1		1001	1238		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	6.697	1000	2.588		1.343673	6		6			6		6		1001	1239		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	8.602	1000	0.808		1.343673	6		22			6		22		1001	1241		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	11.184	1000	1.694		1.343673	7		35			7		35		1001	1243		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	16.757	1000	1.365		1.343673	6		16			6		16		1001	1248		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	18.144	1000	2.233		1.343673	7		2			7		2		1001	1251		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	15.302	1000	1.967		1.343673	7		23			7		23		1001	1252		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	22.282	1000	1.986		1.343673	6		23			6		23		1001	1255		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	8.066	1000	1.641		1.343673	7		16			7		16		1001	1256		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	20.420	1000	2.604		1.343673	5		7			5		7		1001	1258		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	4.055	1000	2.154		1.343673	7		18			7		18		1001	1259		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	8.369	1000	1.636		1.343673	6		10			6		10		1001	1260		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	10.555	1000	1.797		1.343673	6		31			6		31		1001	1261		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	9.286	1000	1.264		1.343673	7		17			7		17		1001	1262		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	11.412	1000	1.288		1.343673	6		5			6		5		1001	1263		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	11.967	1000	1.552		1.343673	6		15			6		15		1001	1264		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	8.067	1000	0.964		1.343673	7		20			7		20		1001	1266		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	21.228	1000	1.034		1.343673	8		19			8		19		1001	1267		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	14.634	1000	2.485		1.343673	6		20			6		20		1001	1269		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	5.300	1000	2.338		1.343673	7		35			7		35		1001	1270		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	14.018	1000	0.849		1.343673	8		11			8		11		1001	1273		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	6.353	1000	0.775		1.343673	8		35			8		35		1001	1274		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6491	12.407	1000	1.729		1.343673	8		22			8		22		1001	1275		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	4.118	1000	2.101		1.426300	7		19			7		19		1001	1277		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	14.333	1000	2.470		1.426300	5		12			5		12		1001	1278		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	20.234	1000	2.627		1.426300	6		33			6		33		1001	1279		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	10.015	1000	1.757		1.426300	6		20			6		20		1001	1281		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	5.592	1000	2.622		1.426300	7		3			7		3		1001	1282		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	16.212	1000	1.428		1.426300	6		27			6		27		1001	1283		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	13.487	1000	1.275		1.426300	5		35			5		35		1001	1284		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	3.560	1000	1.897		1.426300	6		29			6		29		1001	1286		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	12.267	1000	2.605		1.426300	6		34			6		34		1001	1288		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	18.078	1000	2.646		1.426300	6		32			6		32		1001	1290		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5746	20.055	1000	0.936		1.426300	7		3			7		3		1001	1291		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	7.619	1000	1.014		1.459608	6		13			6		13		1001	1292		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	9.917	1000	2.781		1.459608	7		5			7		5		1001	1293		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	6.351	1000	2.057		1.459608	8		13			8		13		1001	1295		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	11.236	1000	1.440		1.459608	6		31			6		31		1001	1296		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	15.001	1000	2.375		1.459608	7		18			7		18		1001	1297		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	7.471	1000	1.541		1.459608	5		6			5		6		1001	1301		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	10.009	1000	0.840		1.459608	5		27			5		27		1001	1302		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	11.243	1000	1.947		1.459608	5		28			5		28		1001	1303		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	10.265	1000	1.672		1.459608	6		18			6		18		1001	1305		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	13.561	1000	2.228		1.459608	7		1			7		1		1001	1306		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	7.228	1000	1.290		1.459608	7		8			7		8		1001	1307		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	13.677	1000	2.653		1.459608	6		25			6		25		1001	1310		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	20.693	1000	0.862		1.459608	7		23			7		23		1001	1311		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	16.316	1000	2.797		1.459608	7		17			7		17		1001	1312		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	12.425	1000	0.840		1.459608	7		17			7		17		1001	1313		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	14.261	1000	2.575		1.459608	5		26			5		26		1001	1314		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	16.580	1000	1.493		1.459608	6		8			6		8		1001	1315		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	15.519	1000	2.221		1.459608	5		37			5		37		1001	1317		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	3.546	1000	2.188		1.459608	6		37			6		37		1001	1318		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9476	15.064	1000	2.391		1.459608	7		36			7		36		1001	1319		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	12.776	1000	0.990		1.558934	6		1			6		1		1001	1320		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	11.479	1000	1.347		1.558934	6		33			6		33		1001	1321		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	18.286	1000	2.431		1.558934	5		30			5		30		1001	1322		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	22.449	1000	1.662		1.558934	5		34			5		34		1001	1323		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	21.171	1000	2.120		1.558934	6		20			6		20		1001	1324		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	12.720	1000	1.217		1.558934	6		8			6		8		1001	1327		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	21.475	1000	1.293		1.558934	6		14			6		14		1001	1328		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	17.956	1000	1.306		1.558934	5		30			5		30		1001	1329		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	14.969	1000	2.325		1.558934	7		27			7		27		1001	1331		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.680	1000	0.928		1.558934	6		20			6		20		1001	1333		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	13.186	1000	2.543		1.558934	5		5			5		5		1001	1334		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	5.669	1000	1.998		1.558934	8		16			8		16		1001	1337		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.354	1000	0.920		1.558934	8		24			8		24		1001	1340		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	6.355	1000	2.101		1.558934	8		35			8		35		1001	1341		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.189	1000	1.567		1.558934	5		25			5		25		1001	1342		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	20.272	1000	1.246		1.558934	7		25			7		25		1001	1344		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	20.864	1000	2.658		1.558934	6		32			6		32		1001	1346		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	17.242	1000	2.036		1.558934	7		37			7		37		1001	1347		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.621	1000	2.306		1.558934	6		36			6		36		1001	1348		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	4.358	1000	1.161		1.558934	6		21			6		21		1001	1349		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.603	1000	0.998		1.558934	7		3			7		3		1001	1352		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	9.519	1000	2.040		1.558934	7		22			7		22		1001	1354		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	14.479	1000	2.106		1.558934	8		12			8		12		1001	1355		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	19.583	1000	2.301		1.558934	7		30			7		30		1001	1356		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	9.602	1000	2.326		1.558934	5		33			5		33		1001	1360		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	6.256	1000	2.272		1.558934	6		23			6		23		1001	1362		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	5.271	1000	0.844		1.558934	7		21			7		21		1001	1364		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	18.141	1000	2.721		1.558934	5		13			5		13		1001	1366		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	5.940	1000	2.741		1.558934	7		32			7		32		1001	1367		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	14.024	1000	2.558		1.558934	6		6			6		6		1001	1368		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.835	1000	1.713		1.558934	7		18			7		18		1001	1369		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	9.063	1000	0.918		1.558934	7		30			7		30		1001	1370		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	21.175	1000	2.226		1.558934	8		40			8		40		1001	1371		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	4.901	1000	1.891		1.558934	5		27			5		27		1001	1372		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	13.189	1000	1.107		1.558934	7		33			7		33		1001	1373		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	16.407	1000	2.322		1.558934	8		14			8		14		1001	1374		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	4.246	1000	1.306		1.558934	7		12			7		12		1001	1375		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0601	20.402	1000	1.845		1.558934	6		36			6		36		1001	1376		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	11.052	1000	1.856		1.562857	8		6			8		6		1001	1379		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	8.006	1000	0.862		1.562857	6		11			6		11		1001	1380		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	10.971	1000	0.789		1.562857	8		17			8		17		1001	1381		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	21.064	1000	1.807		1.562857	6		15			6		15		1001	1382		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	16.172	1000	2.289		1.562857	6		2			6		2		1001	1384		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	7.173	1000	1.947		1.562857	6		34			6		34		1001	1386		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	23.070	1000	2.578		1.562857	7		24			7		24		1001	1392		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	19.301	1000	0.814		1.562857	6		30			6		30		1001	1393		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	15.513	1000	1.721		1.562857	5		5			5		5		1001	1394		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	12.740	1000	1.939		1.562857	5		32			5		32		1001	1399		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	12.094	1000	1.057		1.562857	8		33			8		33		1001	1407		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	3.175	1000	1.082		1.562857	7		9			7		9		1001	1408		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	8.660	1000	1.385		1.562857	6		10			6		10		1001	1410		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	10.459	1000	1.174		1.562857	8		9			8		9		1001	1411		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	2.787	1000	1.977		1.562857	8		27			8		27		1001	1412		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	19.107	1000	0.855		1.562857	6		34			6		34		1001	1414		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	8.659	1000	1.516		1.562857	6		6			6		6		1001	1415		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	11.373	1000	0.763		1.562857	8		26			8		26		1001	1416		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	17.504	1000	2.053		1.562857	6		8			6		8		1001	1417		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	13.207	1000	1.445		1.562857	8		19			8		19		1001	1418		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	15.571	1000	1.189		1.562857	8		32			8		32		1001	1420		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	16.019	1000	1.331		1.562857	6		5			6		5		1001	1423		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	17.850	1000	2.557		1.562857	6		22			6		22		1001	1424		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	16.054	1000	1.966		1.562857	7		8			7		8		1001	1425		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	20.399	1000	1.734		1.562857	6		1			6		1		1001	1426		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	18.090	1000	1.449		1.562857	7		16			7		16		1001	1427		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	19.454	1000	2.189		1.562857	8		26			8		26		1001	1428		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	15.607	1000	1.708		1.562857	8		20			8		20		1001	1430		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	14.005	1000	1.574		1.562857	5		33			5		33		1001	1431		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	13.075	1000	1.415		1.562857	8		1			8		1		1001	1432		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	8.827	1000	2.686		1.562857	6		6			6		6		1001	1434		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1040	12.450	1000	2.301		1.562857	8		34			8		34		1001	1436		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	1.444	1000	1.049		1.635515	7		31			7		31		1001	1437		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	20.140	1000	2.639		1.635515	5		42			5		42		1001	1438		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	19.989	1000	0.773		1.635515	6		3			6		3		1001	1441		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	10.943	1000	2.619		1.635515	6		5			6		5		1001	1442		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	4.869	1000	2.457		1.635515	8		24			8		24		1001	1443		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	20.904	1000	2.162		1.635515	7		30			7		30		1001	1445		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	23.047	1000	2.509		1.635515	6		10			6		10		1001	1446		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	19.843	1000	2.569		1.635515	6		37			6		37		1001	1447		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	20.166	1000	0.997		1.635515	6		7			6		7		1001	1448		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	4.220	1000	1.480		1.635515	5		15			5		15		1001	1449		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	13.211	1000	2.367		1.635515	8		34			8		34		1001	1450		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	18.548	1000	1.732		1.635515	7		5			7		5		1001	1452		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9178	19.779	1000	2.509		1.635515	6		4			6		4		1001	1456		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	19.870	1000	1.978		1.655702	7		31			7		31		1001	1457		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	10.294	1000	2.478		1.655702	6		42			6		42		1001	1459		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	17.407	1000	2.039		1.655702	5		40			5		40		1001	1460		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	11.696	1000	0.874		1.655702	7		42			7		42		1001	1461		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	12.472	1000	1.456		1.655702	5		4			5		4		1001	1462		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	13.537	1000	2.496		1.655702	5		8			5		8		1001	1463		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	9.487	1000	1.656		1.655702	5		21			5		21		1001	1465		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	16.187	1000	1.406		1.655702	7		9			7		9		1001	1467		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	17.587	1000	1.487		1.655702	8		26			8		26		1001	1468		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	9.473	1000	0.773		1.655702	7		15			7		15		1001	1471		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	12.909	1000	1.325		1.655702	7		32			7		32		1001	1472		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	3.433	1000	1.882		1.655702	7		39			7		39		1001	1473		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	11.401	1000	2.169		1.655702	7		17			7		17		1001	1475		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	9.665	1000	2.574		1.655702	7		9			7		9		1001	1477		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	19.718	1000	1.265		1.655702	6		34			6		34		1001	1480		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	22.228	1000	2.440		1.655702	7		7			7		7		1001	1482		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	7.937	1000	2.140		1.655702	6		15			6		15		1001	1483		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	13.881	1000	1.677		1.655702	8		15			8		15		1001	1484		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	17.279	1000	2.528		1.655702	8		8			8		8		1001	1485		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	17.297	1000	2.484		1.655702	5		29			5		29		1001	1488		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	14.016	1000	2.211		1.655702	6		25			6		25		1001	1489		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	17.727	1000	1.450		1.655702	6		19			6		19		1001	1490		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	3.476	1000	1.809		1.655702	5		15			5		15		1001	1491		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	13.243	1000	1.607		1.655702	6		7			6		7		1001	1494		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	7.137	1000	2.398		1.655702	6		15			6		15		1001	1496		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	11.175	1000	1.464		1.655702	7		25			7		25		1001	1497		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	5.245	1000	1.707		1.655702	7		27			7		27		1001	1499		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	14.534	1000	1.228		1.655702	7		29			7		29		1001	1500		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	21.286	1000	1.684		1.655702	6		17			6		17		1001	1501		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1439	18.005	1000	1.849		1.655702	5		28			5		28		1001	1503		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	19.079	1000	1.716		1.697973	8		19			8		19		1001	1504		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	21.868	1000	2.638		1.697973	7		16			7		16		1001	1506		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	19.572	1000	1.454		1.697973	7		37			7		37		1001	1507		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	2.876	1000	2.007		1.697973	6		25			6		25		1001	1508		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	12.978	1000	1.235		1.697973	8		30			8		30		1001	1509		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	19.091	1000	1.727		1.697973	6		19			6		19		1001	1510		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	17.188	1000	1.119		1.697973	7		38			7		38		1001	1514		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	4.384	1000	1.732		1.697973	7		31			7		31		1001	1515		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	11.993	1000	2.204		1.697973	5		6			5		6		1001	1516		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	7.590	1000	1.971		1.697973	6		5			6		5		1001	1518		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	11.717	1000	1.387		1.697973	7		2			7		2		1001	1519		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	20.354	1000	0.805		1.697973	6		42			6		42		1001	1521		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	16.549	1000	1.061		1.697973	6		17			6		17		1001	1522		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	16.142	1000	1.163		1.697973	8		18			8		18		1001	1526		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	15.378	1000	1.405		1.697973	7		2			7		2		1001	1528		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	14.707	1000	2.492		1.697973	6		4			6		4		1001	1529		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	20.846	1000	1.257		1.697973	5		30			5		30		1001	1530		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	10.761	1000	2.387		1.697973	7		39			7		39		1001	1532		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	3.074	1000	1.385		1.697973	7		21			7		21		1001	1534		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	7.703	1000	1.078		1.697973	7		28			7		28		1001	1537		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	8.610	1000	1.555		1.697973	5		26			5		26		1001	1538		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	9.743	1000	1.886		1.697973	5		2			5		2		1001	1539		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	20.653	1000	1.999		1.697973	6		5			6		5		1001	1540		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	4.612	1000	1.495		1.697973	7		31			7		31		1001	1541		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	21.166	1000	1.136		1.697973	6		35			6		35		1001	1542		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	12.925	1000	2.466		1.697973	8		27			8		27		1001	1543		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	21.764	1000	1.206		1.697973	8		15			8		15		1001	1544		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	8.389	1000	0.872		1.697973	5		9			5		9		1001	1547		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	4.168	1000	0.772		1.697973	7		33			7		33		1001	1548		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	19.377	1000	1.835		1.697973	5		1			5		1		1001	1549		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	15.669	1000	1.869		1.697973	5		38			5		38		1001	1552		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	18.081	1000	1.797		1.697973	7		39			7		39		1001	1554		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	9.049	1000	1.588		1.697973	8		25			8		25		1001	1555		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	18.050	1000	2.490		1.697973	7		38			7		38		1001	1556		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	10.460	1000	1.906		1.697973	5		1			5		1		1001	1557		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	19.640	1000	1.462		1.697973	5		1			5		1		1001	1559		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	12.638	1000	1.309		1.697973	8		30			8		30		1001	1563		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6173	11.685	1000	2.259		1.697973	6		22			6		22		1001	1564		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	5.285	1000	1.286		1.727093	7		35			7		35		1001	1566		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	13.750	1000	1.526		1.727093	6		19			6		19		1001	1567		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	10.702	1000	2.598		1.727093	5		21			5		21		1001	1568		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	7.793	1000	0.798		1.727093	8		16			8		16		1001	1569		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	12.507	1000	0.960		1.727093	6		41			6		41		1001	1570		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	19.986	1000	2.208		1.727093	5		10			5		10		1001	1572		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	12.627	1000	1.962		1.727093	6		28			6		28		1001	1576		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	14.260	1000	1.185		1.727093	7		29			7		29		1001	1577		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	17.682	1000	2.441		1.727093	5		22			5		22		1001	1578		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	20.652	1000	2.442		1.727093	8		22			8		22		1001	1579		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	20.104	1000	0.811		1.727093	6		20			6		20		1001	1580		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	15.483	1000	1.077		1.727093	6		26			6		26		1001	1581		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	11.080	1000	0.908		1.727093	5		32			5		32		1001	1582		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	10.320	1000	1.869		1.727093	8		37			8		37		1001	1583		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	19.127	1000	1.225		1.727093	5		27			5		27		1001	1584		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	4.335	1000	1.872		1.727093	7		22			7		22		1001	1585		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	15.925	1000	1.664		1.727093	7		36			7		36		1001	1586		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	2.279	1000	1.666		1.727093	7		44			7		44		1001	1587		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	13.499	1000	1.199		1.727093	6		13			6		13		1001	1588		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	11.378	1000	1.234		1.727093	8		32			8		32		1001	1589		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	15.374	1000	2.338		1.727093	5		34			5		34		1001	1591		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	16.043	1000	1.421		1.727093	7		38			7		38		1001	1592		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	16.668	1000	1.505		1.727093	6		25			6		25		1001	1595		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	5.595	1000	0.772		1.727093	6		14			6		14		1001	1597		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	17.912	1000	1.490		1.727093	6		18			6		18		1001	1601		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	20.888	1000	1.553		1.727093	6		37			6		37		1001	1602		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	7.420	1000	1.058		1.727093	7		18			7		18		1001	1603		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	19.993	1000	0.831		1.727093	6		31			6		31		1001	1604		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	5.089	1000	2.129		1.727093	6		19			6		19		1001	1605		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	8.993	1000	0.841		1.727093	7		18			7		18		1001	1606		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	7.445	1000	1.024		1.727093	7		17			7		17		1001	1607		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9434	13.710	1000	2.405		1.727093	6		41			6		41		1001	1608		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	6.570	1000	2.106		1.838746	8		34			8		34		1001	1609		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	15.386	1000	2.147		1.838746	6		46			6		46		1001	1610		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	14.815	1000	0.922		1.838746	5		21			5		21		1001	1612		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	8.141	1000	1.713		1.838746	6		7			6		7		1001	1615		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	8.214	1000	2.269		1.838746	6		29			6		29		1001	1616		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	16.707	1000	2.385		1.838746	6		20			6		20		1001	1617		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	10.426	1000	1.919		1.838746	5		2			5		2		1001	1618		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	8.608	1000	1.781		1.838746	5		8			5		8		1001	1619		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	16.914	1000	2.171		1.838746	8		1			8		1		1001	1620		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	16.661	1000	1.895		1.838746	8		36			8		36		1001	1624		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	12.869	1000	1.770		1.838746	6		28			6		28		1001	1625		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	13.297	1000	1.649		1.838746	6		12			6		12		1001	1626		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1940	9.119	1000	1.194		1.838746	8		13			8		13		1001	1628		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	14.423	1000	2.250		1.885335	5		28			5		28		1001	1629		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	17.820	1000	1.870		1.885335	6		24			6		24		1001	1630		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	15.509	1000	1.753		1.885335	8		27			8		27		1001	1631		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	20.712	1000	2.430		1.885335	6		25			6		25		1001	1633		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	2.821	1000	1.600		1.885335	7		33			7		33		1001	1634		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	4.297	1000	2.187		1.885335	7		15			7		15		1001	1636		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	4.500	1000	0.798		1.885335	8		19			8		19		1001	1639		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	11.981	1000	1.915		1.885335	7		3			7		3		1001	1640		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	16.952	1000	0.757		1.885335	6		34			6		34		1001	1641		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	13.313	1000	2.049		1.885335	7		5			7		5		1001	1642		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	11.876	1000	2.178		1.885335	8		33			8		33		1001	1643		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	10.697	1000	2.290		1.885335	8		12			8		12		1001	1645		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	17.152	1000	1.115		1.885335	5		5			5		5		1001	1646		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	6.091	1000	1.614		1.885335	7		21			7		21		1001	1647		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	8.163	1000	1.307		1.885335	8		29			8		29		1001	1648		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	15.744	1000	2.444		1.885335	7		35			7		35		1001	1649		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	5.844	1000	0.936		1.885335	6		6			6		6		1001	1650		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	4.681	1000	2.246		1.885335	7		26			7		26		1001	1653		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	7.526	1000	1.613		1.885335	6		9			6		9		1001	1655		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7158	19.624	1000	1.281		1.885335	6		27			6		27		1001	1656		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	11.402	1000	0.996		1.916512	7		29			7		29		1001	1659		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	10.810	1000	1.435		1.916512	8		33			8		33		1001	1660		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	20.935	1000	2.233		1.916512	5		31			5		31		1001	1662		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	5.652	1000	2.239		1.916512	7		2			7		2		1001	1663		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	18.393	1000	1.166		1.916512	6		31			6		31		1001	1664		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	10.524	1000	0.990		1.916512	7		36			7		36		1001	1668		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	14.074	1000	2.206		1.916512	8		38			8		38		1001	1669		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	11.846	1000	1.654		1.916512	7		30			7		30		1001	1671		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	9.375	1000	0.990		1.916512	6		34			6		34		1001	1672		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	10.823	1000	2.166		1.916512	5		19			5		19		1001	1674		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	15.876	1000	1.301		1.916512	5		35			5		35		1001	1675		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	13.921	1000	1.881		1.916512	6		12			6		12		1001	1677		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	17.468	1000	1.214		1.916512	5		26			5		26		1001	1678		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	19.703	1000	1.478		1.916512	5		19			5		19		1001	1679		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	16.472	1000	1.502		1.916512	6		40			6		40		1001	1682		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	18.415	1000	1.748		1.916512	7		8			7		8		1001	1683		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	11.771	1000	0.832		1.916512	6		4			6		4		1001	1684		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	3.925	1000	2.334		1.916512	7		34			7		34		1001	1685		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	14.773	1000	1.685		1.916512	8		11			8		11		1001	1686		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	4.308	1000	0.836		1.916512	7		6			7		6		1001	1689		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	1.935	1000	1.389		1.916512	5		37			5		37		1001	1690		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	15.191	1000	2.127		1.916512	5		24			5		24		1001	1691		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	6.781	1000	1.932		1.916512	8		17			8		17		1001	1694		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	11.763	1000	0.831		1.916512	8		21			8		21		1001	1695		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	19.496	1000	1.217		1.916512	8		4			8		4		1001	1696		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	17.351	1000	1.385		1.916512	5		12			5		12		1001	1697		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0649	16.341	1000	2.412		1.916512	6		37			6		37		1001	1698		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	4.044	1000	1.205		1.924926	8		25			8		25		1001	1699		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	19.256	1000	0.874		1.924926	7		9			7		9		1001	1702		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	11.097	1000	0.961		1.924926	7		32			7		32		1001	1705		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	10.005	1000	2.147		1.924926	7		27			7		27		1001	1706		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	15.378	1000	0.805		1.924926	5		32			5		32		1001	1707		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	20.841	1000	2.121		1.924926	6		4			6		4		1001	1708		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	12.244	1000	1.931		1.924926	6		41			6		41		1001	1709		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	2.217	1000	0.862		1.924926	7		9			7		9		1001	1710		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	4.050	1000	1.330		1.924926	6		20			6		20		1001	1714		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	2.734	1000	1.418		1.924926	7		12			7		12		1001	1716		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	12.324	1000	1.468		1.924926	8		2			8		2		1001	1717		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	11.305	1000	1.199		1.924926	8		11			8		11		1001	1718		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	11.592	1000	2.180		1.924926	7		47			7		47		1001	1719		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	14.611	1000	0.810		1.924926	6		13			6		13		1001	1721		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	7.451	1000	2.071		1.924926	6		39			6		39		1001	1723		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	14.791	1000	0.917		1.924926	6		36			6		36		1001	1725		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	11.273	1000	1.493		1.924926	8		2			8		2		1001	1726		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	20.778	1000	0.981		1.924926	6		7			6		7		1001	1727		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1592	20.841	1000	2.391		1.924926	6		4			6		4		1001	1728		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	2.220	1000	0.766		1.956897	6		34			6		34		1001	1729		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	10.674	1000	1.967		1.956897	7		28			7		28		1001	1730		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	10.548	1000	2.165		1.956897	7		42			7		42		1001	1731		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	4.687	1000	1.865		1.956897	5		45			5		45		1001	1733		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	8.147	1000	1.837		1.956897	5		42			5		42		1001	1734		1				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	13.182	1000	1.174		1.956897	7		18			7		18		1001	1735		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	7.892	1000	1.172		1.956897	6		48			6		48		1001	1737		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	15.771	1000	1.803		1.956897	7		30			7		30		1001	1738		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	18.355	1000	2.160		1.956897	8		8			8		8		1001	1739		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	2.212		1.956897	5		34			5		34		1001	1740		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.097	1000	1.303		1.956897	6		46			6		46		1001	1742		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	2.253		1.956897	5		4			5		4		1001	1743		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	7.696	1000	1.129		1.956897	6		25			6		25		1001	1744		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	12.245	1000	2.426		1.956897	6		34			6		34		1001	1745		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	3.018	1000	2.104		1.956897	7		3			7		3		1001	1746		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	7.798	1000	2.141		1.956897	6		48			6		48		1001	1750		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	12.017	1000	1.883		1.956897	6		31			6		31		1001	1751		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	9.680	1000	0.949		1.956897	6		20			6		20		1001	1754		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	7.476	1000	1.276		1.956897	6		14			6		14		1001	1756		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	13.483	1000	1.802		1.956897	5		20			5		20		1001	1758		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	14.790	1000	1.815		1.956897	7		29			7		29		1001	1759		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	2.280		1.956897	7		41			7		41		1001	1760		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	3.430	1000	1.166		1.956897	6		12			6		12		1001	1761		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	1.499		1.956897	8		6			8		6		1001	1763		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	14.584	1000	1.648		1.956897	5		30			5		30		1001	1765		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	12.135	1000	1.574		1.956897	7		41			7		41		1001	1766		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	19.275	1000	1.549		1.956897	6		30			6		30		1001	1767		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	2.297		1.956897	8		46			8		46		1001	1769		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	12.436	1000	2.253		1.956897	7		39			7		39		1001	1770		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	5.409	1000	2.209		1.956897	5		5			5		5		1001	1771		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	14.089	1000	2.064		1.956897	7		2			7		2		1001	1773		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	20.483	1000	1.236		1.956897	6		14			6		14		1001	1776		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	15.965	1000	1.200		1.956897	6		10			6		10		1001	1777		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	4.000	1000	1.050		1.956897	6		29			6		29		1001	1780		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	13.355	1000	1.404		1.956897	6		35			6		35		1001	1781		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	15.690	1000	1.832		1.956897	8		45			8		45		1001	1783		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	6.264	1000	2.233		1.956897	7		9			7		9		1001	1784		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	14.807	1000	2.258		1.956897	5		9			5		9		1001	1785		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	7.905	1000	0.954		1.956897	6		2			6		2		1001	1787		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5173	6.934	1000	1.587		1.956897	7		23			7		23		1001	1788		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	20.419	1000	1.213		1.960698	7		31			7		31		1001	1789		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	18.581	1000	1.555		1.960698	7		39			7		39		1001	1790		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	5.716	1000	0.847		1.960698	5		48			5		48		1001	1792		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	11.047	1000	1.895		1.960698	5		8			5		8		1001	1793		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	7.955	1000	1.132		1.960698	6		8			6		8		1001	1795		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	15.885	1000	0.997		1.960698	6		41			6		41		1001	1796		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	14.331	1000	1.158		1.960698	7		32			7		32		1001	1797		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	16.455	1000	2.367		1.960698	6		28			6		28		1001	1800		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	16.846	1000	2.056		1.960698	7		36			7		36		1001	1801		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	12.100	1000	1.430		1.960698	7		28			7		28		1001	1802		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	5.837	1000	0.990		1.960698	5		9			5		9		1001	1803		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	9.561	1000	1.227		1.960698	6		45			6		45		1001	1804		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	7.798	1000	1.457		1.960698	6		37			6		37		1001	1805		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	2.208	1000	1.216		1.960698	6		34			6		34		1001	1806		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	9.584	1000	1.359		1.960698	5		30			5		30		1001	1807		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5598	2.193	1000	0.776		1.960698	6		3			6		3		1001	1808		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	12.864	1000	1.540		1.963197	8		36			8		36		1001	1809		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	15.453	1000	1.185		1.963197	5		45			5		45		1001	1811		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	13.386	1000	1.311		1.963197	6		4			6		4		1001	1812		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	20.412	1000	0.845		1.963197	7		6			7		6		1001	1813		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	4.433	1000	2.230		1.963197	7		39			7		39		1001	1815		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	17.524	1000	2.034		1.963197	6		18			6		18		1001	1816		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	12.373	1000	1.155		1.963197	7		32			7		32		1001	1817		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	9.764	1000	1.358		1.963197	6		27			6		27		1001	1818		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	14.389	1000	1.513		1.963197	7		31			7		31		1001	1819		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	3.798	1000	1.887		1.963197	7		37			7		37		1001	1820		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	3.601	1000	0.833		1.963197	6		17			6		17		1001	1823		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	16.476	1000	1.380		1.963197	5		22			5		22		1001	1824		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	4.137	1000	1.389		1.963197	6		34			6		34		1001	1825		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	11.780	1000	1.820		1.963197	8		26			8		26		1001	1827		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	9.265	1000	2.091		1.963197	7		5			7		5		1001	1828		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	8.381	1000	1.617		1.963197	6		21			6		21		1001	1830		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	19.359	1000	1.417		1.963197	8		33			8		33		1001	1831		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	15.674	1000	1.105		1.963197	6		29			6		29		1001	1832		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5878	6.553	1000	1.080		1.963197	7		14			7		14		1001	1833		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	5.822	1000	1.815		1.970198	6		2			6		2		1001	1834		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	17.876	1000	2.330		1.970198	7		5			7		5		1001	1836		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	7.247	1000	1.586		1.970198	5		5			5		5		1001	1837		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	3.553	1000	0.749		1.970198	8		16			8		16		1001	1838		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	18.828	1000	1.678		1.970198	5		47			5		47		1001	1839		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	19.723	1000	0.990		1.970198	8		2			8		2		1001	1840		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	6.742	1000	1.676		1.970198	7		40			7		40		1001	1842		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	5.893	1000	2.248		1.970198	5		22			5		22		1001	1843		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	4.435	1000	1.632		1.970198	6		34			6		34		1001	1844		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	4.265	1000	2.415		1.970198	6		27			6		27		1001	1845		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	19.264	1000	2.238		1.970198	7		27			7		27		1001	1846		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	10.642	1000	1.769		1.970198	7		43			7		43		1001	1847		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	7.180	1000	1.923		1.970198	6		2			6		2		1001	1848		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	20.327	1000	1.668		1.970198	8		12			8		12		1001	1849		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	4.635	1000	0.806		1.970198	6		2			6		2		1001	1851		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	7.431	1000	1.666		1.970198	7		28			7		28		1001	1852		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	19.648	1000	2.337		1.970198	8		42			8		42		1001	1853		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	8.800	1000	2.277		1.970198	7		6			7		6		1001	1856		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	8.809	1000	1.926		1.970198	7		11			7		11		1001	1858		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	15.846	1000	2.306		1.970198	7		42			7		42		1001	1859		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	17.406	1000	1.287		1.970198	5		26			5		26		1001	1860		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6662	15.468	1000	1.849		1.970198	7		21			7		21		1001	1864		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	10.916	1000	0.863		1.990155	7		18			7		18		1001	1865		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	13.629	1000	1.318		1.990155	6		30			6		30		1001	1867		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	20.110	1000	1.689		1.990155	7		16			7		16		1001	1868		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	17.597	1000	2.192		1.990155	6		22			6		22		1001	1870		0				1			2			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	7.750	1000	2.372		1.990155	6		8			6		8		1001	1871		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	19.916	1000	2.183		1.990155	7		1			7		1		1001	1872		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	19.711	1000	1.660		1.990155	5		18			5		18		1001	1873		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	9.867	1000	0.821		1.990155	6		10			6		10		1001	1874		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	18.362	1000	1.254		1.990155	5		18			5		18		1001	1875		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	17.079	1000	2.118		1.990155	8		8			8		8		1001	1876		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	5.458	1000	1.514		1.990155	7		20			7		20		1001	1877		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	2.295	1000	1.136		1.990155	6		42			6		42		1001	1878		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	11.823	1000	1.392		1.990155	7		27			7		27		1001	1879		1				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	11.110	1000	1.987		1.990155	6		30			6		30		1001	1880		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	2.149	1000	1.022		1.990155	8		36			8		36		1001	1882		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	7.259	1000	1.597		1.990155	6		48			6		48		1001	1884		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	20.110	1000	0.949		1.990155	5		16			5		16		1001	1886		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	16.273	1000	2.348		1.990155	6		41			6		41		1001	1887		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	14.398	1000	0.921		1.990155	8		31			8		31		1001	1888		0				1			5			20			0.0000		112.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8897	3.797	1000	1.071		1.990155	6		11			6		11		1001	1890		1				1			5			20			0.0000		112.000		20.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
