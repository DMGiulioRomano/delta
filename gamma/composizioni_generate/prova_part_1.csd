
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
f 0 127.0 ; Evento f fittizio per definire la durata totale
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


i "time" 0 127.0
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 112.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	32.890	1000	26.312		5.000000	2		1			2		1		1001	1		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.006	1000	29.605		5.000000	2		1			2		1		1001	2		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	48.920	1000	30.575		5.000000	1		2			1		2		1001	3		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	45.310	1000	28.319		5.000000	0		1			0		1		1001	4		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	31.642	1000	25.313		4.902500	0		1			0		1		1001	6		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	35.196	1000	28.157		4.902500	2		1			2		1		1001	7		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	49.795	1000	31.122		4.902500	2		2			2		2		1001	8		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1760	36.316	1000	29.053		4.902500	2		1			2		1		1001	9		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	45.211	1000	28.257		4.810000	1		5			1		5		1001	10		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9840	36.488	1000	22.805		4.810000	2		4			2		4		1001	11		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	32.464	1000	25.972		4.722500	0		2			0		2		1001	13		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	33.608	1000	21.005		4.722500	1		4			1		4		1001	14		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	40.580	1000	25.363		4.722500	1		5			1		5		1001	15		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.4240	32.691	1000	26.153		4.722500	1		1			1		1		1001	16		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	44.869	1000	28.043		4.640000	1		6			1		6		1001	18		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	40.075	1000	25.047		4.640000	3		1			3		1		1001	19		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	42.640	1000	26.650		4.640000	1		8			1		8		1001	21		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4960	42.723	1000	26.702		4.640000	1		5			1		5		1001	22		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	44.269	1000	27.668		4.562500	3		8			3		8		1001	23		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	31.913	1000	19.946		4.562500	1		8			1		8		1001	24		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	34.087	1000	27.270		4.562500	3		6			3		6		1001	25		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2000	30.463	1000	19.040		4.562500	2		4			2		4		1001	26		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	38.247	1000	23.904		4.490000	3		2			3		2		1001	27		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	42.172	1000	26.358		4.490000	2		6			2		6		1001	32		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5360	30.899	1000	24.720		4.490000	3		4			3		4		1001	33		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	40.408	1000	25.255		4.422500	1		11			1		11		1001	34		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	25.759	1000	20.607		4.422500	1		7			1		7		1001	36		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	27.922	1000	22.338		4.422500	1		7			1		7		1001	37		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5040	42.050	1000	26.281		4.422500	2		1			2		1		1001	38		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	21.374	1000	17.099		4.360000	4		8			4		8		1001	42		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	26.668	1000	21.335		4.360000	1		11			1		11		1001	44		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	30.097	1000	18.810		4.360000	2		6			2		6		1001	46		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1040	26.070	1000	20.856		4.360000	3		9			3		9		1001	48		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	40.990	1000	25.619		4.302500	4		9			4		9		1001	49		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	30.016	1000	24.013		4.302500	5		11			5		11		1001	51		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	25.364	1000	20.291		4.302500	3		10			3		10		1001	52		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	21.316	1000	17.053		4.302500	2		13			2		13		1001	55		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3360	31.727	1000	25.382		4.302500	5		11			5		11		1001	56		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	20.572	1000	16.458		4.250000	2		1			2		1		1001	58		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	24.031	1000	19.224		4.250000	4		15			4		15		1001	59		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	39.494	1000	24.684		4.250000	3		12			3		12		1001	60		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	20.717	1000	16.574		4.250000	4		4			4		4		1001	61		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2000	28.142	1000	22.513		4.250000	4		5			4		5		1001	62		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	22.214	1000	17.771		4.202500	5		13			5		13		1001	65		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	37.410	1000	23.382		4.202500	4		13			4		13		1001	66		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	22.511	1000	18.008		4.202500	5		16			5		16		1001	67		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	35.435	1000	22.147		4.202500	3		11			3		11		1001	68		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	21.081	1000	16.865		4.202500	3		6			3		6		1001	70		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6960	34.756	1000	21.722		4.202500	4		3			4		3		1001	71		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	28.436	1000	22.749		4.160000	2		3			2		3		1001	72		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	31.468	1000	25.174		4.160000	6		6			6		6		1001	73		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	22.373	1000	17.898		4.160000	5		9			5		9		1001	75		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.8240	23.721	1000	18.977		4.160000	3		10			3		10		1001	78		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	20.988	1000	16.790		4.122500	3		15			3		15		1001	79		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	17.010	1000	13.608		4.122500	3		4			3		4		1001	81		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	30.217	1000	24.173		4.122500	6		4			6		4		1001	82		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	38.728	1000	24.205		4.122500	6		8			6		8		1001	83		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	64.5840	37.615	1000	23.510		4.122500	3		8			3		8		1001	84		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	25.864	1000	20.691		4.090000	4		9			4		9		1001	85		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	37.745	1000	23.591		4.090000	3		12			3		12		1001	86		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	19.652	1000	15.721		4.090000	4		12			4		12		1001	88		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	66.9760	25.827	1000	16.142		4.090000	5		10			5		10		1001	89		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	27.852	1000	22.282		4.062500	3		3			3		3		1001	92		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	20.939	1000	13.087		4.062500	6		8			6		8		1001	94		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	30.113	1000	18.821		4.062500	6		14			6		14		1001	96		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	31.461	1000	19.663		4.062500	4		9			4		9		1001	97		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	16.169	1000	12.935		4.062500	6		1			6		1		1001	98		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0000	37.826	1000	23.641		4.062500	3		6			3		6		1001	99		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	27.140	1000	16.962		4.040000	7		18			7		18		1001	100		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	29.053	1000	23.243		4.040000	5		11			5		11		1001	101		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	37.855	1000	23.660		4.040000	3		3			3		3		1001	103		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6560	18.346	1000	14.676		4.040000	3		10			3		10		1001	106		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	26.298	1000	21.038		4.022500	7		7			7		7		1001	109		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	16.451	1000	13.161		4.022500	3		1			3		1		1001	111		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9440	21.520	1000	17.216		4.022500	7		15			7		15		1001	112		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	24.215	1000	15.135		4.010000	8		3			8		3		1001	113		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	21.969	1000	13.731		4.010000	7		3			7		3		1001	114		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	17.578	1000	14.062		4.010000	4		11			4		11		1001	115		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	29.997	1000	23.998		4.010000	6		1			6		1		1001	116		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8640	29.088	1000	18.180		4.010000	4		7			4		7		1001	118		1				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	26.827	1000	16.767		4.002500	3		9			3		9		1001	119		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	24.703	1000	15.439		4.002500	6		7			6		7		1001	121		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	30.592	1000	19.120		4.002500	6		3			6		3		1001	122		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.4160	24.812	1000	19.849		4.002500	6		11			6		11		1001	124		0				1			2			20			0.0000		112.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6239	5.305	1000	2.041		0.000005	6		3			6		4		1001	125		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6239	6.409	1000	3.267		0.000005	8		5			8		4		1001	127		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6239	5.175	1000	1.325		0.000005	6		3			6		5		1001	129		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6239	5.063	1000	3.881		0.000005	6		4			6		1		1001	130		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	4.566	1000	1.822		0.000040	7		3			7		1		1001	132		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	2.582	1000	1.978		0.000040	7		1			7		2		1001	133		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	4.820	1000	3.358		0.000040	6		1			6		1		1001	134		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	5.689	1000	2.135		0.000040	8		4			8		6		1001	135		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	6.335	1000	2.972		0.000040	6		5			6		2		1001	136		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6711	5.894	1000	2.766		0.000040	6		7			6		8		1001	137		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8398	6.264	1000	2.224		0.000459	7		3			7		1		1001	142		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8398	5.611	1000	1.183		0.000459	6		1			6		3		1001	143		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8398	4.971	1000	1.138		0.000459	6		5			6		8		1001	144		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1410	4.926	1000	1.749		0.002334	7		5			7		3		1001	145		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1410	4.768	1000	1.906		0.002334	6		8			6		9		1001	148		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1410	7.276	1000	1.768		0.002334	8		2			8		2		1001	149		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1410	5.423	1000	1.168		0.002334	8		8			8		8		1001	150		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	9.705	1000	3.133		0.003228	6		2			6		1		1001	151		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	2.988	1000	0.942		0.003228	5		3			5		5		1001	152		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	7.879	1000	2.800		0.003228	5		2			5		2		1001	153		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	3.142	1000	2.415		0.003228	5		1			5		3		1001	154		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	6.434	1000	3.497		0.003228	7		1			7		1		1001	155		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2364	4.879	1000	1.096		0.003228	8		5			8		2		1001	159		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	3.177	1000	1.910		0.008029	8		6			8		6		1001	163		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	8.632	1000	3.094		0.008029	8		8			8		6		1001	165		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	2.003	1000	0.852		0.008029	5		8			5		9		1001	167		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	2.508	1000	1.674		0.008029	6		5			6		5		1001	169		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	8.229	1000	3.637		0.008029	8		2			8		5		1001	170		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	5.882	1000	3.659		0.008029	8		2			8		2		1001	172		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	7.807	1000	3.452		0.008029	6		2			6		4		1001	173		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6035	6.162	1000	3.205		0.008029	6		1			6		1		1001	174		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6997	4.208	1000	3.124		0.009640	7		4			7		5		1001	175		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6997	4.497	1000	0.890		0.009640	7		6			7		3		1001	176		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6997	3.455	1000	1.199		0.009640	6		5			6		6		1001	178		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6997	2.329	1000	1.001		0.009640	6		2			6		1		1001	182		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6997	4.176	1000	1.507		0.009640	7		1			7		3		1001	183		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	5.408	1000	1.458		0.028583	6		11			6		14		1001	188		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	10.088	1000	3.405		0.028583	8		6			8		3		1001	189		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	4.908	1000	3.193		0.028583	7		4			7		2		1001	190		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	7.162	1000	3.336		0.028583	7		3			7		4		1001	191		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	6.118	1000	3.426		0.028583	7		4			7		1		1001	192		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	2.767	1000	1.645		0.028583	6		2			6		1		1001	193		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4935	3.719	1000	2.185		0.028583	8		5			8		7		1001	194		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	6.539	1000	2.083		0.044348	6		10			6		11		1001	195		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	5.135	1000	1.285		0.044348	6		6			6		6		1001	196		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	8.782	1000	2.783		0.044348	6		8			6		7		1001	197		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	6.160	1000	1.809		0.044348	6		4			6		1		1001	198		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	7.615	1000	3.596		0.044348	6		10			6		6		1001	199		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	9.380	1000	2.822		0.044348	6		11			6		10		1001	201		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	8.922	1000	3.638		0.044348	6		8			6		7		1001	204		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9586	5.344	1000	0.887		0.044348	6		3			6		4		1001	205		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	5.390	1000	2.084		0.052982	6		2			6		3		1001	206		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	5.984	1000	3.620		0.052982	7		6			7		9		1001	207		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	6.838	1000	3.689		0.052982	6		3			6		4		1001	208		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	6.739	1000	2.167		0.052982	8		6			8		3		1001	210		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	7.679	1000	3.755		0.052982	6		9			6		9		1001	211		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	4.017	1000	2.757		0.052982	8		4			8		7		1001	213		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1780	5.459	1000	1.108		0.052982	7		2			7		5		1001	214		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	7.462	1000	2.962		0.146636	8		12			8		11		1001	216		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	2.957	1000	1.166		0.146636	6		1			6		3		1001	220		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	2.782	1000	1.565		0.146636	6		9			6		8		1001	223		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	3.816	1000	2.976		0.146636	6		12			6		14		1001	225		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	2.841	1000	2.237		0.146636	5		10			5		7		1001	226		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	4.185	1000	2.615		0.146636	6		15			6		13		1001	227		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	6.813	1000	2.110		0.146636	7		13			7		10		1001	228		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	4.588	1000	1.652		0.146636	7		6			7		5		1001	229		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	2.788	1000	1.114		0.146636	8		4			8		1		1001	231		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	4.680	1000	1.240		0.146636	6		5			6		6		1001	232		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8888	8.960	1000	3.422		0.146636	7		5			7		4		1001	234		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	6.964	1000	1.836		0.173559	8		1			8		1		1001	235		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	3.919	1000	1.040		0.173559	6		14			6		15		1001	236		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	6.293	1000	0.862		0.173559	6		9			6		10		1001	237		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	4.487	1000	1.866		0.173559	6		15			6		14		1001	238		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	6.748	1000	1.295		0.173559	7		11			7		12		1001	239		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	4.568	1000	1.744		0.173559	6		14			6		14		1001	240		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	5.824	1000	2.237		0.173559	7		11			7		13		1001	241		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	8.684	1000	3.106		0.173559	6		15			6		13		1001	244		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	5.959	1000	1.219		0.173559	6		5			6		6		1001	246		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2660	6.229	1000	2.686		0.173559	5		8			5		6		1001	248		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	7.332	1000	2.438		0.192836	5		10			5		8		1001	249		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	6.753	1000	2.744		0.192836	6		1			6		1		1001	250		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	5.462	1000	0.931		0.192836	8		15			8		14		1001	251		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	3.876	1000	2.324		0.192836	6		4			6		8		1001	254		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	4.076	1000	2.159		0.192836	5		6			5		5		1001	255		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	7.312	1000	2.972		0.192836	5		6			5		5		1001	257		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	5.982	1000	1.107		0.192836	7		3			7		4		1001	258		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	4.466	1000	1.209		0.192836	5		11			5		6		1001	259		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	4.760	1000	2.676		0.192836	6		16			6		13		1001	260		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	8.707	1000	3.346		0.192836	5		11			5		12		1001	261		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5183	6.037	1000	3.355		0.192836	7		11			7		8		1001	263		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	2.511	1000	0.782		0.244679	6		4			6		2		1001	264		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	8.293	1000	2.126		0.244679	7		4			7		1		1001	265		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	7.343	1000	2.810		0.244679	7		16			7		13		1001	267		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	6.242	1000	2.254		0.244679	8		7			8		2		1001	268		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	6.601	1000	2.278		0.244679	7		13			7		15		1001	270		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1401	5.492	1000	1.230		0.244679	6		8			6		8		1001	271		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	6.239	1000	2.181		0.255309	5		8			5		4		1001	272		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	3.509	1000	2.203		0.255309	6		15			6		13		1001	273		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	6.757	1000	2.735		0.255309	8		5			8		4		1001	274		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	4.463	1000	2.866		0.255309	5		6			5		7		1001	277		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	4.908	1000	3.272		0.255309	6		1			6		1		1001	279		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	3.232	1000	1.984		0.255309	6		3			6		7		1001	281		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	4.204	1000	2.398		0.255309	5		7			5		9		1001	282		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	4.783	1000	2.561		0.255309	6		5			6		5		1001	284		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2592	2.942	1000	1.571		0.255309	7		9			7		11		1001	285		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	6.091	1000	2.230		0.380484	7		4			7		4		1001	286		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	4.931	1000	2.445		0.380484	6		11			6		12		1001	287		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	7.056	1000	2.677		0.380484	7		12			7		17		1001	288		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	4.438	1000	1.614		0.380484	7		13			7		13		1001	289		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	2.934	1000	1.466		0.380484	8		17			8		18		1001	290		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	2.268	1000	1.024		0.380484	8		16			8		16		1001	291		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	2.122	1000	0.782		0.380484	7		7			7		7		1001	292		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5085	5.159	1000	2.481		0.380484	7		5			7		1		1001	293		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	3.577	1000	0.856		0.393466	8		3			8		1		1001	295		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	5.505	1000	2.846		0.393466	5		14			5		13		1001	296		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	3.501	1000	1.148		0.393466	7		3			7		1		1001	297		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	7.135	1000	1.828		0.393466	6		15			6		10		1001	298		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	6.035	1000	3.032		0.393466	6		17			6		16		1001	300		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	3.490	1000	1.827		0.393466	5		12			5		12		1001	302		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	5.972	1000	3.028		0.393466	5		14			5		15		1001	303		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	7.778	1000	2.020		0.393466	6		16			6		12		1001	304		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	7.646	1000	1.836		0.393466	7		18			7		21		1001	306		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	2.930	1000	0.925		0.393466	7		3			7		3		1001	307		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	8.210	1000	2.013		0.393466	7		8			7		6		1001	308		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	5.348	1000	1.287		0.393466	5		10			5		11		1001	311		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	3.881	1000	1.790		0.393466	6		9			6		11		1001	312		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	7.826	1000	2.711		0.393466	7		17			7		16		1001	313		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	5.983	1000	1.875		0.393466	7		11			7		12		1001	314		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	7.561	1000	1.819		0.393466	6		12			6		17		1001	316		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6254	6.782	1000	2.429		0.393466	7		7			7		10		1001	317		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	7.014	1000	2.628		0.407709	6		14			6		15		1001	318		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	4.397	1000	2.746		0.407709	6		13			6		10		1001	319		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	4.399	1000	2.637		0.407709	6		5			6		1		1001	320		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	6.612	1000	2.117		0.407709	5		2			5		6		1001	322		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	7.956	1000	2.716		0.407709	8		11			8		12		1001	323		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	4.105	1000	3.037		0.407709	7		18			7		15		1001	327		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	5.467	1000	1.431		0.407709	5		4			5		7		1001	328		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	3.482	1000	0.879		0.407709	5		9			5		12		1001	332		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	6.964	1000	2.285		0.407709	6		1			6		1		1001	333		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	8.879	1000	3.174		0.407709	7		12			7		8		1001	334		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	4.880	1000	1.168		0.407709	6		14			6		9		1001	335		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	6.631	1000	1.378		0.407709	6		18			6		20		1001	338		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7514	4.764	1000	2.142		0.407709	7		13			7		16		1001	339		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	6.155	1000	2.533		0.578153	7		22			7		25		1001	341		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	3.962	1000	1.641		0.578153	5		13			5		16		1001	345		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	4.443	1000	0.904		0.578153	5		15			5		10		1001	346		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	4.941	1000	2.499		0.578153	7		4			7		7		1001	347		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	6.114	1000	1.473		0.578153	7		18			7		17		1001	348		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	5.610	1000	1.058		0.578153	6		22			6		21		1001	349		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	5.666	1000	3.151		0.578153	5		1			5		3		1001	350		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	5.918	1000	1.815		0.578153	5		23			5		25		1001	352		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	6.933	1000	2.823		0.578153	5		10			5		14		1001	355		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	7.759	1000	3.302		0.578153	8		1			8		2		1001	356		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	3.137	1000	2.447		0.578153	5		15			5		16		1001	357		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1161	5.743	1000	1.884		0.578153	6		6			6		1		1001	358		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	4.242	1000	2.284		0.638124	6		7			6		4		1001	359		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	8.081	1000	2.122		0.638124	8		6			8		8		1001	360		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	10.046	1000	3.160		0.638124	7		17			7		15		1001	361		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	4.296	1000	1.617		0.638124	5		17			5		13		1001	362		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	5.165	1000	2.112		0.638124	5		17			5		22		1001	364		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	3.769	1000	0.864		0.638124	6		7			6		4		1001	369		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	2.919	1000	2.149		0.638124	6		21			6		24		1001	371		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	8.993	1000	2.668		0.638124	6		1			6		4		1001	372		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	5.732	1000	3.047		0.638124	7		24			7		24		1001	373		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	8.822	1000	2.906		0.638124	7		11			7		7		1001	375		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	8.116	1000	2.978		0.638124	7		6			7		8		1001	378		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	5.280	1000	0.789		0.638124	6		22			6		22		1001	380		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	9.154	1000	3.059		0.638124	7		24			7		28		1001	381		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	9.048	1000	2.908		0.638124	6		6			6		2		1001	383		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	4.483	1000	2.515		0.638124	7		15			7		14		1001	384		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	6.052	1000	2.243		0.638124	8		5			8		6		1001	385		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	6.277	1000	1.659		0.638124	8		16			8		14		1001	386		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	2.912	1000	1.548		0.638124	6		6			6		7		1001	387		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5469	6.369	1000	3.310		0.638124	6		15			6		12		1001	390		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	5.106	1000	2.723		0.872008	6		9			6		3		1001	393		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	7.492	1000	2.660		0.872008	6		10			6		5		1001	394		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	3.377	1000	0.840		0.872008	5		25			5		21		1001	396		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	3.619	1000	1.083		0.872008	6		4			6		9		1001	397		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	2.174	1000	0.851		0.872008	6		1			6		2		1001	398		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0587	5.037	1000	3.086		0.872008	5		1			5		1		1001	400		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	6.789	1000	2.663		0.975674	5		20			5		18		1001	401		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	5.013	1000	1.398		0.975674	6		26			6		20		1001	403		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	7.325	1000	2.660		0.975674	6		15			6		9		1001	404		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	6.388	1000	3.059		0.975674	8		8			8		11		1001	405		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	6.559	1000	1.914		0.975674	8		22			8		28		1001	406		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	6.245	1000	2.525		0.975674	7		23			7		27		1001	409		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6629	5.689	1000	1.263		0.975674	8		14			8		15		1001	411		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	5.741	1000	0.851		1.040013	7		18			7		20		1001	412		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	5.154	1000	2.809		1.040013	8		19			8		18		1001	413		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	4.925	1000	2.517		1.040013	8		24			8		22		1001	415		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	3.722	1000	2.234		1.040013	6		24			6		27		1001	417		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	7.258	1000	2.606		1.040013	6		16			6		16		1001	418		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	8.781	1000	2.621		1.040013	8		17			8		22		1001	421		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	5.310	1000	1.907		1.040013	7		22			7		19		1001	423		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	3.679	1000	2.524		1.040013	7		3			7		5		1001	424		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	5.564	1000	1.402		1.040013	6		18			6		14		1001	425		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	3.830	1000	2.224		1.040013	7		18			7		12		1001	426		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	1.263	1000	0.838		1.040013	8		11			8		15		1001	427		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	3.364	1000	0.864		1.040013	5		16			5		14		1001	428		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	5.505	1000	1.182		1.040013	5		9			5		10		1001	429		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	1.683	1000	0.922		1.040013	8		16			8		11		1001	430		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0219	4.350	1000	2.464		1.040013	5		10			5		4		1001	433		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	3.137	1000	1.732		1.084517	6		25			6		25		1001	434		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.766	1000	1.887		1.084517	6		4			6		1		1001	435		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	6.113	1000	3.122		1.084517	7		12			7		10		1001	436		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.066	1000	1.935		1.084517	8		2			8		1		1001	437		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.188	1000	2.221		1.084517	5		24			5		22		1001	438		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	7.306	1000	1.741		1.084517	7		14			7		9		1001	439		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.792	1000	2.142		1.084517	8		7			8		5		1001	440		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.863	1000	2.010		1.084517	7		14			7		16		1001	441		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.564	1000	2.785		1.084517	6		18			6		15		1001	442		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2637	4.989	1000	0.993		1.084517	8		23			8		29		1001	444		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	6.971	1000	1.991		1.154258	6		23			6		22		1001	446		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	4.765	1000	2.636		1.154258	8		3			8		1		1001	447		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	5.640	1000	1.205		1.154258	6		29			6		25		1001	448		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	2.308	1000	1.054		1.154258	5		6			5		8		1001	449		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	6.012	1000	1.294		1.154258	6		6			6		7		1001	450		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	6.239	1000	1.424		1.154258	6		9			6		14		1001	453		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	7.769	1000	2.481		1.154258	7		17			7		14		1001	454		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6329	6.632	1000	2.269		1.154258	7		30			7		26		1001	455		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	8.527	1000	2.374		1.298986	5		27			5		27		1001	456		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	6.366	1000	2.003		1.298986	8		21			8		27		1001	458		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	5.809	1000	2.372		1.298986	7		26			7		26		1001	459		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	4.822	1000	2.490		1.298986	7		3			7		8		1001	460		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	7.140	1000	2.650		1.298986	6		28			6		21		1001	462		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	2.327	1000	1.528		1.298986	7		5			7		3		1001	463		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	3.499	1000	0.851		1.298986	6		1			6		2		1001	464		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	4.101	1000	2.120		1.298986	7		28			7		30		1001	466		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	1.567	1000	1.192		1.298986	7		18			7		13		1001	468		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	4.449	1000	1.593		1.298986	6		1			6		1		1001	469		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	5.272	1000	2.264		1.298986	7		9			7		15		1001	470		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	8.118	1000	2.517		1.298986	7		13			7		11		1001	475		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	7.969	1000	2.691		1.298986	6		8			6		3		1001	477		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	5.172	1000	1.002		1.298986	7		24			7		26		1001	478		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	2.522	1000	1.364		1.298986	6		27			6		26		1001	482		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	5.548	1000	1.087		1.298986	7		18			7		17		1001	485		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	7.483	1000	1.575		1.298986	8		10			8		11		1001	486		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	7.710	1000	2.362		1.298986	5		27			5		29		1001	487		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	4.264	1000	1.185		1.298986	5		26			5		19		1001	489		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3650	5.695	1000	2.298		1.298986	7		2			7		1		1001	490		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	2.944	1000	1.967		1.382368	7		28			7		23		1001	492		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	3.167	1000	1.778		1.382368	7		21			7		18		1001	493		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	5.042	1000	1.627		1.382368	6		17			6		21		1001	494		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	9.071	1000	2.761		1.382368	7		22			7		23		1001	495		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	6.162	1000	1.603		1.382368	5		20			5		19		1001	496		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	5.307	1000	0.913		1.382368	6		29			6		28		1001	497		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	5.738	1000	1.546		1.382368	7		14			7		7		1001	499		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	6.002	1000	1.737		1.382368	6		5			6		2		1001	500		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	5.480	1000	1.494		1.382368	7		15			7		17		1001	501		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	5.174	1000	1.977		1.382368	5		1			5		4		1001	504		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	6.531	1000	2.381		1.382368	8		18			8		18		1001	505		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	3.716	1000	1.008		1.382368	6		13			6		11		1001	506		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	3.657	1000	1.851		1.382368	7		2			7		1		1001	507		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	7.793	1000	1.923		1.382368	6		28			6		27		1001	508		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	4.021	1000	0.897		1.382368	6		18			6		19		1001	509		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7683	7.435	1000	2.496		1.382368	5		7			5		7		1001	511		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	1.457	1000	0.808		1.441146	8		29			8		22		1001	515		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	5.544	1000	2.285		1.441146	8		23			8		26		1001	516		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	6.275	1000	1.363		1.441146	5		10			5		5		1001	517		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	6.406	1000	1.593		1.441146	8		19			8		13		1001	519		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	3.143	1000	0.790		1.441146	7		11			7		15		1001	523		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	6.308	1000	1.018		1.441146	7		2			7		1		1001	528		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	4.165	1000	2.327		1.441146	6		25			6		26		1001	530		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	4.682	1000	1.745		1.441146	8		18			8		23		1001	533		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	3.390	1000	2.107		1.441146	7		11			7		16		1001	534		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	6.290	1000	1.862		1.441146	6		17			6		21		1001	535		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	2.410	1000	1.375		1.441146	6		20			6		13		1001	536		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	6.880	1000	2.010		1.441146	7		14			7		15		1001	541		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	2.655	1000	1.030		1.441146	5		18			5		13		1001	543		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	3.447	1000	1.972		1.441146	7		22			7		16		1001	545		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	8.938	1000	2.540		1.441146	7		12			7		6		1001	546		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	5.953	1000	1.732		1.441146	7		15			7		18		1001	547		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	7.849	1000	1.974		1.441146	7		30			7		35		1001	549		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	4.291	1000	1.672		1.441146	7		20			7		18		1001	550		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	3.844	1000	0.849		1.441146	7		20			7		13		1001	552		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	5.856	1000	0.828		1.441146	7		1			7		8		1001	553		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0453	5.133	1000	2.277		1.441146	7		4			7		10		1001	554		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	3.708	1000	2.002		1.484315	7		25			7		22		1001	555		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	2.173	1000	0.756		1.484315	7		12			7		10		1001	557		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	6.369	1000	1.477		1.484315	5		16			5		20		1001	558		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	6.161	1000	1.194		1.484315	6		4			6		6		1001	560		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	8.068	1000	2.529		1.484315	6		32			6		31		1001	562		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	2.996	1000	0.814		1.484315	7		32			7		28		1001	567		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	2.648	1000	1.615		1.484315	6		15			6		8		1001	568		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	4.837	1000	2.860		1.484315	8		20			8		15		1001	570		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	3.929	1000	1.667		1.484315	7		22			7		19		1001	571		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	4.101	1000	2.559		1.484315	7		7			7		11		1001	572		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	5.942	1000	1.836		1.484315	5		13			5		11		1001	573		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	7.846	1000	2.952		1.484315	5		4			5		8		1001	575		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2452	6.144	1000	0.791		1.484315	8		27			8		33		1001	576		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	6.547	1000	2.394		1.796228	6		23			6		20		1001	577		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	3.329	1000	1.196		1.796228	6		26			6		29		1001	578		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.590	1000	2.410		1.796228	7		13			7		8		1001	579		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	2.944	1000	1.693		1.796228	5		5			5		7		1001	580		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	6.176	1000	1.446		1.796228	7		18			7		24		1001	581		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	2.710	1000	1.043		1.796228	8		1			8		1		1001	583		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	7.951	1000	1.877		1.796228	7		3			7		1		1001	584		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	2.999	1000	0.836		1.796228	7		6			7		4		1001	585		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	6.771	1000	1.707		1.796228	6		7			6		8		1001	588		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	8.087	1000	2.742		1.796228	8		24			8		24		1001	589		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.774	1000	1.644		1.796228	7		31			7		24		1001	590		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	5.140	1000	2.033		1.796228	7		18			7		14		1001	591		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	3.550	1000	1.201		1.796228	8		34			8		37		1001	592		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	6.216	1000	2.087		1.796228	6		29			6		30		1001	596		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	7.150	1000	1.862		1.796228	7		31			7		23		1001	598		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.749	1000	2.500		1.796228	6		30			6		28		1001	599		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.770	1000	1.886		1.796228	7		26			7		33		1001	600		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	7.015	1000	2.171		1.796228	8		24			8		30		1001	601		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.678	1000	1.828		1.796228	6		10			6		16		1001	602		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	5.765	1000	1.457		1.796228	7		27			7		25		1001	605		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	6.526	1000	1.290		1.796228	8		16			8		18		1001	607		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6106	4.891	1000	1.694		1.796228	8		14			8		13		1001	608		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	3.608	1000	2.221		2.059004	5		21			5		27		1001	610		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	6.067	1000	2.017		2.059004	7		27			7		23		1001	611		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	4.650	1000	1.771		2.059004	6		32			6		28		1001	614		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	2.452	1000	0.947		2.059004	5		11			5		10		1001	616		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	3.742	1000	2.276		2.059004	6		29			6		32		1001	617		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	3.308	1000	1.794		2.059004	6		17			6		14		1001	619		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	4.695	1000	0.889		2.059004	5		10			5		8		1001	620		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	4.516	1000	1.718		2.059004	6		36			6		42		1001	621		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6711	7.086	1000	2.477		2.059004	7		6			7		5		1001	622		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	2.691	1000	1.989		2.202475	8		4			8		1		1001	623		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.082	1000	1.520		2.202475	8		24			8		23		1001	624		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.803	1000	1.977		2.202475	6		19			6		21		1001	625		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.472	1000	1.863		2.202475	6		31			6		34		1001	627		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.598	1000	1.469		2.202475	8		19			8		13		1001	628		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.498	1000	1.548		2.202475	5		14			5		16		1001	630		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.635	1000	2.790		2.202475	7		22			7		20		1001	631		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.290	1000	2.118		2.202475	7		32			7		30		1001	634		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	2.046	1000	1.353		2.202475	7		20			7		15		1001	635		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	6.885	1000	2.536		2.202475	7		4			7		1		1001	636		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.275	1000	2.515		2.202475	6		38			6		41		1001	637		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.709	1000	2.152		2.202475	8		30			8		28		1001	639		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.550	1000	2.453		2.202475	5		38			5		43		1001	641		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.903	1000	2.503		2.202475	5		18			5		16		1001	642		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.414	1000	1.353		2.202475	8		31			8		27		1001	643		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.061	1000	0.997		2.202475	5		36			5		42		1001	645		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	4.328	1000	2.700		2.202475	6		24			6		20		1001	646		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.347	1000	0.999		2.202475	5		10			5		8		1001	647		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	6.187	1000	1.750		2.202475	7		5			7		10		1001	648		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.761	1000	0.773		2.202475	5		27			5		20		1001	649		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	2.029	1000	1.604		2.202475	6		6			6		1		1001	650		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.032	1000	1.297		2.202475	7		16			7		19		1001	651		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	6.548	1000	2.696		2.202475	6		22			6		29		1001	652		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	6.387	1000	1.052		2.202475	5		9			5		5		1001	653		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.629	1000	2.022		2.202475	7		11			7		15		1001	654		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.451	1000	2.757		2.202475	8		11			8		18		1001	657		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	3.532	1000	1.739		2.202475	8		20			8		19		1001	658		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.587	1000	1.389		2.202475	7		22			7		24		1001	659		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	5.945	1000	2.137		2.202475	6		11			6		2		1001	660		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	1.214	1000	0.944		2.202475	6		27			6		34		1001	661		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2216	7.048	1000	2.113		2.202475	7		21			7		12		1001	662		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	3.763	1000	2.394		2.262051	7		8			7		7		1001	663		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	7.007	1000	1.513		2.262051	5		36			5		30		1001	664		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	1.322	1000	0.898		2.262051	7		27			7		34		1001	665		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	5.512	1000	0.871		2.262051	6		38			6		43		1001	669		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	3.918	1000	1.768		2.262051	7		35			7		40		1001	671		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	1.580	1000	0.925		2.262051	7		5			7		1		1001	672		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	2.821	1000	0.942		2.262051	7		29			7		31		1001	674		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	3.728	1000	2.153		2.262051	8		12			8		19		1001	677		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	3.195	1000	1.149		2.262051	7		27			7		20		1001	679		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4449	5.047	1000	1.909		2.262051	7		31			7		32		1001	680		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.105	1000	0.812		2.882839	6		32			6		29		1001	681		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	4.008	1000	1.035		2.882839	7		2			7		1		1001	682		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	2.152	1000	0.811		2.882839	7		6			7		10		1001	684		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	3.152	1000	1.672		2.882839	8		28			8		24		1001	688		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.864	1000	1.904		2.882839	7		37			7		37		1001	693		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.666	1000	2.111		2.882839	5		3			5		10		1001	695		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	3.186	1000	1.102		2.882839	5		3			5		1		1001	696		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.025	1000	2.007		2.882839	6		24			6		17		1001	697		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.346	1000	2.511		2.882839	8		38			8		43		1001	698		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.393	1000	1.941		2.882839	7		13			7		11		1001	699		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.648	1000	2.333		2.882839	7		27			7		35		1001	700		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	2.092	1000	1.078		2.882839	7		16			7		11		1001	701		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.960	1000	1.412		2.882839	6		32			6		25		1001	703		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	1.574	1000	1.195		2.882839	8		10			8		4		1001	704		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.388	1000	2.286		2.882839	5		1			5		1		1001	710		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	4.789	1000	0.911		2.882839	8		26			8		34		1001	711		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	3.835	1000	0.740		2.882839	7		24			7		19		1001	712		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.475	1000	1.234		2.882839	7		4			7		9		1001	713		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.366	1000	1.225		2.882839	6		19			6		15		1001	714		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.424	1000	1.346		2.882839	7		32			7		38		1001	715		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.419	1000	2.492		2.882839	6		11			6		17		1001	716		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.156	1000	1.250		2.882839	6		25			6		16		1001	717		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	8.384	1000	2.569		2.882839	6		11			6		13		1001	719		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	7.543	1000	2.372		2.882839	7		14			7		13		1001	720		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	7.115	1000	2.211		2.882839	8		40			8		48		1001	723		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.930	1000	1.504		2.882839	6		5			6		2		1001	724		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.374	1000	1.069		2.882839	6		36			6		30		1001	726		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.480	1000	2.581		2.882839	7		10			7		9		1001	728		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	6.074	1000	1.034		2.882839	6		6			6		1		1001	729		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	7.664	1000	2.366		2.882839	7		21			7		26		1001	733		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	3.068	1000	1.221		2.882839	6		15			6		9		1001	735		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	5.038	1000	1.887		2.882839	8		24			8		23		1001	737		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	4.235	1000	1.273		2.882839	6		41			6		43		1001	738		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6164	4.300	1000	2.376		2.882839	5		23			5		16		1001	739		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.108	1000	0.801		3.008622	7		34			7		25		1001	742		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.434	1000	1.372		3.008622	8		14			8		22		1001	743		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	3.679	1000	1.518		3.008622	5		33			5		32		1001	745		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	3.975	1000	1.389		3.008622	7		19			7		12		1001	746		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	2.916	1000	1.770		3.008622	6		14			6		21		1001	747		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.880	1000	2.415		3.008622	6		33			6		40		1001	748		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.993	1000	2.245		3.008622	7		44			7		43		1001	749		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.451	1000	2.445		3.008622	7		5			7		8		1001	751		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.629	1000	1.932		3.008622	6		39			6		42		1001	752		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.062	1000	2.441		3.008622	7		20			7		23		1001	753		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	1.797	1000	1.094		3.008622	5		38			5		44		1001	754		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.989	1000	1.399		3.008622	7		20			7		23		1001	755		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.030	1000	2.165		3.008622	7		22			7		27		1001	757		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.058	1000	2.460		3.008622	7		8			7		1		1001	759		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.619	1000	1.841		3.008622	7		36			7		41		1001	762		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.524	1000	2.481		3.008622	8		8			8		2		1001	763		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	4.042	1000	2.443		3.008622	7		43			7		45		1001	764		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.484	1000	1.384		3.008622	6		12			6		18		1001	765		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	1.830	1000	0.818		3.008622	7		34			7		40		1001	766		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.961	1000	2.184		3.008622	6		19			6		10		1001	768		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	7.203	1000	1.797		3.008622	6		24			6		24		1001	769		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	2.349	1000	0.868		3.008622	7		10			7		1		1001	770		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	2.645	1000	1.075		3.008622	6		16			6		13		1001	773		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	2.109	1000	1.444		3.008622	6		18			6		15		1001	774		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.447	1000	2.517		3.008622	6		31			6		35		1001	776		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.189	1000	2.313		3.008622	7		6			7		14		1001	777		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	6.930	1000	2.461		3.008622	6		26			6		21		1001	778		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.966	1000	1.795		3.008622	6		24			6		28		1001	779		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0268	5.764	1000	2.587		3.008622	6		3			6		9		1001	781		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	2.337	1000	1.012		3.101709	7		14			7		21		1001	782		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.812	1000	2.007		3.101709	6		38			6		35		1001	784		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.866	1000	0.794		3.101709	5		38			5		37		1001	785		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.363	1000	1.083		3.101709	7		18			7		24		1001	786		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.096	1000	1.341		3.101709	7		10			7		7		1001	787		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	1.207	1000	0.748		3.101709	7		20			7		23		1001	788		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.993	1000	1.270		3.101709	5		11			5		15		1001	790		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	6.110	1000	1.300		3.101709	8		17			8		21		1001	791		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.997	1000	2.390		3.101709	7		21			7		26		1001	795		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.522	1000	2.519		3.101709	5		39			5		32		1001	796		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	6.976	1000	2.115		3.101709	7		4			7		3		1001	797		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	5.415	1000	1.695		3.101709	6		41			6		35		1001	798		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.574	1000	1.946		3.101709	7		34			7		25		1001	799		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.208	1000	2.437		3.101709	6		32			6		26		1001	800		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.077	1000	2.125		3.101709	5		6			5		4		1001	801		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.480	1000	2.377		3.101709	6		28			6		21		1001	802		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.341	1000	1.074		3.101709	6		10			6		2		1001	804		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.241	1000	1.965		3.101709	6		7			6		3		1001	805		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	1.053	1000	0.732		3.101709	6		21			6		13		1001	806		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.486	1000	0.888		3.101709	6		10			6		12		1001	807		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	5.454	1000	1.232		3.101709	7		22			7		18		1001	809		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	5.364	1000	1.425		3.101709	5		37			5		36		1001	810		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.944	1000	1.985		3.101709	5		4			5		9		1001	812		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	5.186	1000	1.362		3.101709	6		4			6		1		1001	813		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.364	1000	1.963		3.101709	6		27			6		22		1001	814		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.422	1000	1.565		3.101709	7		19			7		25		1001	815		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	6.459	1000	1.974		3.101709	6		43			6		45		1001	816		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	2.332	1000	1.750		3.101709	6		11			6		4		1001	818		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	6.020	1000	1.155		3.101709	5		34			5		37		1001	819		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	3.583	1000	2.070		3.101709	5		10			5		13		1001	821		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	4.578	1000	2.475		3.101709	8		15			8		6		1001	822		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3251	6.416	1000	1.346		3.101709	8		28			8		22		1001	823		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	2.670	1000	0.753		3.190976	5		14			5		20		1001	826		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	5.498	1000	2.546		3.190976	8		9			8		13		1001	828		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	3.170	1000	1.497		3.190976	5		22			5		17		1001	829		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	3.877	1000	0.820		3.190976	5		32			5		37		1001	831		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	3.362	1000	1.302		3.190976	5		16			5		16		1001	832		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	6.970	1000	1.976		3.190976	5		31			5		24		1001	836		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	6.272	1000	2.397		3.190976	6		17			6		13		1001	837		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	5.050	1000	1.452		3.190976	7		44			7		35		1001	838		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	1.490	1000	0.929		3.190976	8		34			8		41		1001	841		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	2.770	1000	1.171		3.190976	7		40			7		34		1001	842		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	5.529	1000	1.218		3.190976	7		11			7		17		1001	846		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	4.614	1000	2.218		3.190976	7		32			7		28		1001	848		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	4.555	1000	2.516		3.190976	8		25			8		19		1001	849		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	3.996	1000	2.120		3.190976	6		12			6		3		1001	852		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	3.328	1000	1.294		3.190976	8		14			8		13		1001	853		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	7.118	1000	1.960		3.190976	7		26			7		20		1001	854		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6069	4.444	1000	2.033		3.190976	7		25			7		21		1001	857		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	4.138	1000	1.968		3.497131	6		46			6		49		1001	858		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	6.455	1000	2.296		3.497131	8		41			8		42		1001	859		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	3.840	1000	0.911		3.497131	6		45			6		41		1001	860		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	6.455	1000	2.335		3.497131	5		2			5		1		1001	863		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	3.601	1000	0.966		3.497131	6		41			6		45		1001	864		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	5.018	1000	1.032		3.497131	6		18			6		19		1001	865		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	2.629	1000	0.902		3.497131	7		32			7		28		1001	866		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	1.492	1000	0.782		3.497131	8		4			8		1		1001	867		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5447	6.455	1000	2.124		3.497131	8		2			8		9		1001	870		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	6.127	1000	0.890		3.535288	5		22			5		15		1001	872		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	2.922	1000	2.295		3.535288	5		35			5		39		1001	873		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	5.973	1000	2.122		3.535288	5		31			5		37		1001	874		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	3.081	1000	1.105		3.535288	7		31			7		30		1001	875		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	2.423	1000	1.288		3.535288	6		29			6		32		1001	876		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	4.913	1000	2.495		3.535288	7		12			7		20		1001	879		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	4.866	1000	1.143		3.535288	6		46			6		50		1001	880		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	6.292	1000	1.870		3.535288	6		2			6		1		1001	882		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	3.146	1000	2.282		3.535288	7		9			7		15		1001	883		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	3.572	1000	1.821		3.535288	7		39			7		29		1001	884		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	5.596	1000	1.328		3.535288	7		9			7		8		1001	885		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	5.562	1000	0.748		3.535288	8		20			8		21		1001	887		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	4.028	1000	1.196		3.535288	8		25			8		26		1001	888		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	4.656	1000	1.142		3.535288	6		25			6		30		1001	889		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6586	6.341	1000	1.584		3.535288	6		34			6		35		1001	890		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.761	1000	1.877		3.679868	6		31			6		28		1001	891		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	1.799		3.679868	5		7			5		6		1001	892		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	2.396		3.679868	7		14			7		14		1001	893		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.566	1000	1.508		3.679868	7		42			7		42		1001	894		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.776	1000	0.843		3.679868	5		41			5		32		1001	895		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.842	1000	2.004		3.679868	8		44			8		49		1001	896		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	2.610	1000	1.023		3.679868	5		45			5		47		1001	897		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.122	1000	1.869		3.679868	6		24			6		20		1001	898		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.764	1000	2.052		3.679868	6		39			6		30		1001	899		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	2.610	1000	0.855		3.679868	6		8			6		1		1001	900		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.012	1000	1.301		3.679868	5		18			5		11		1001	901		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	1.835		3.679868	7		41			7		47		1001	903		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.343	1000	1.364		3.679868	7		18			7		25		1001	904		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	1.643		3.679868	6		8			6		10		1001	905		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.187	1000	1.139		3.679868	7		29			7		28		1001	906		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.200	1000	1.847		3.679868	7		4			7		7		1001	907		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.588	1000	2.325		3.679868	8		31			8		22		1001	908		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.849	1000	2.346		3.679868	8		29			8		33		1001	909		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.539	1000	2.253		3.679868	6		6			6		13		1001	910		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	1.145		3.679868	5		43			5		47		1001	911		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.617	1000	1.351		3.679868	5		16			5		10		1001	912		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	2.367		3.679868	7		6			7		8		1001	914		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	2.151		3.679868	8		30			8		26		1001	915		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.474	1000	1.848		3.679868	6		38			6		42		1001	916		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.102	1000	2.455		3.679868	6		33			6		38		1001	917		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	2.096	1000	0.995		3.679868	6		43			6		37		1001	919		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.450	1000	1.111		3.679868	7		15			7		14		1001	920		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.021	1000	2.243		3.679868	8		28			8		30		1001	921		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.111	1000	1.302		3.679868	7		41			7		50		1001	923		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	2.387	1000	1.200		3.679868	7		46			7		46		1001	924		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.231	1000	1.873		3.679868	6		43			6		42		1001	925		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	1.717	1000	1.170		3.679868	7		25			7		15		1001	928		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.636	1000	2.211		3.679868	5		2			5		9		1001	930		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.172	1000	2.214		3.679868	7		2			7		1		1001	931		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.603	1000	0.818		3.679868	8		30			8		20		1001	932		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	4.828	1000	1.906		3.679868	7		4			7		7		1001	933		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	3.288	1000	1.405		3.679868	5		21			5		17		1001	934		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0849	5.915	1000	0.989		3.679868	7		45			7		45		1001	936		0				1			5			20			0.0000		112.000		5.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
