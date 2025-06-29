
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_1_sec_1_i_nascita_lenta_di_cluster_layer_2_scintillii.wav" -W -d -m0
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
gi_Index init 2
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
f 0 128.96 ; Evento f fittizio per definire la durata totale
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
; mega-impulsivo
f 8 0 4096 5 0.001 128 1 2048 1 1920 0.0001
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


i "time" 0 128.96
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 154.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.5629	8.365	1000	2.617		0.000772	8		5			8		3		1001	123		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.5488	5.882	1000	1.791		0.000772	8		5			8		6		1001	124		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.2547	7.089	1000	2.286		0.000772	8		7			8		8		1001	126		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.2950	3.707	1000	1.338		0.000772	7		3			7		3		1001	129		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.4316	6.971	1000	2.506		0.000772	8		4			8		4		1001	130		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.1900	2.685	1000	1.545		0.000772	6		2			6		3		1001	134		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.8924	5.154	1000	1.202		0.000772	5		2			5		3		1001	137		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.0921	10.931	1000	3.895		0.000772	7		3			7		5		1001	138		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.3687	4.578	1000	3.294		0.000863	7		5			7		3		1001	142		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9071	9.435	1000	3.773		0.000863	7		6			7		7		1001	144		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.0197	6.791	1000	2.120		0.000863	6		4			6		7		1001	150		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	76.4726	6.418	1000	2.298		0.000863	8		3			8		3		1001	151		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.6695	5.865	1000	1.324		0.000863	7		1			7		1		1001	152		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.3712	4.014	1000	1.260		0.000863	6		5			6		6		1001	154		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.2960	5.172	1000	3.359		0.002443	8		6			8		5		1001	155		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.1420	6.036	1000	0.931		0.002443	6		8			6		9		1001	156		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.9806	4.837	1000	1.197		0.002443	7		8			7		10		1001	157		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	68.8699	7.692	1000	2.686		0.002443	7		1			7		3		1001	158		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.0077	4.512	1000	0.898		0.002443	8		4			8		3		1001	159		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.7195	6.609	1000	2.951		0.002443	6		2			6		3		1001	162		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.9687	8.087	1000	2.361		0.002443	8		1			8		3		1001	163		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	70.9917	6.591	1000	1.613		0.002443	5		7			5		9		1001	166		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.8653	6.224	1000	3.765		0.002443	5		6			5		7		1001	173		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.6688	4.720	1000	2.047		0.002443	7		1			7		1		1001	174		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.2957	3.022	1000	2.166		0.003215	5		4			5		3		1001	175		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.5312	6.372	1000	1.437		0.003215	7		2			7		5		1001	177		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.0619	1.954	1000	1.545		0.003215	7		4			7		2		1001	179		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.1459	5.882	1000	3.457		0.003215	8		2			8		4		1001	180		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.8259	8.063	1000	3.586		0.003215	6		7			6		5		1001	181		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4819	3.135	1000	1.700		0.067550	5		4			5		7		1001	182		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8409	6.878	1000	3.602		0.067550	6		9			6		12		1001	184		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.2464	7.216	1000	1.809		0.067550	7		10			7		12		1001	187		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.6629	5.072	1000	0.913		0.067550	7		3			7		1		1001	189		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.8564	7.159	1000	2.819		0.067550	6		8			6		9		1001	190		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.6120	4.872	1000	1.848		0.067550	7		7			7		10		1001	192		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.4802	6.423	1000	1.882		0.067550	6		12			6		11		1001	193		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.4429	8.588	1000	3.236		0.067550	7		10			7		10		1001	195		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.5538	7.456	1000	1.571		0.067550	5		2			5		4		1001	197		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.0874	4.735	1000	2.006		0.067550	5		9			5		8		1001	198		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.5114	5.751	1000	3.188		0.067550	5		5			5		1		1001	200		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.8672	3.257	1000	1.827		0.067550	7		4			7		4		1001	201		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6160	6.750	1000	2.235		0.067550	6		9			6		12		1001	202		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.3882	1.436	1000	0.813		0.094668	5		12			5		8		1001	205		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.1497	4.121	1000	0.851		0.094668	6		5			6		5		1001	209		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.8795	5.343	1000	3.326		0.094668	6		6			6		5		1001	211		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.7267	4.027	1000	1.809		0.094668	6		1			6		1		1001	212		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.3142	5.758	1000	1.555		0.094668	8		1			8		1		1001	213		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.3277	5.957	1000	3.025		0.094668	6		1			6		1		1001	215		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.3565	5.970	1000	1.851		0.094668	8		3			8		4		1001	217		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.7859	4.736	1000	3.330		0.146230	8		2			8		3		1001	218		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.8959	3.374	1000	1.533		0.146230	7		4			7		1		1001	219		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.0246	6.110	1000	1.684		0.146230	5		9			5		7		1001	220		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.8945	4.566	1000	1.407		0.146230	6		13			6		16		1001	221		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.7692	8.686	1000	2.728		0.146230	6		1			6		1		1001	222		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.5850	1.922	1000	1.026		0.146230	6		14			6		17		1001	224		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.7261	6.593	1000	2.462		0.146230	5		11			5		12		1001	225		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.4945	3.641	1000	1.272		0.146230	6		11			6		12		1001	226		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.2114	2.559	1000	1.502		0.146230	6		14			6		11		1001	227		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2653	9.280	1000	3.538		0.146230	7		7			7		5		1001	228		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3933	6.031	1000	2.445		0.146230	8		2			8		5		1001	229		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.0968	5.718	1000	2.877		0.146230	7		7			7		6		1001	231		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.8236	6.892	1000	3.442		0.146230	6		15			6		18		1001	232		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.1947	3.713	1000	1.301		0.146230	5		11			5		9		1001	233		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.7624	7.384	1000	3.579		0.146230	7		2			7		5		1001	234		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.9721	9.546	1000	3.102		0.155263	7		3			7		3		1001	235		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.9242	6.013	1000	2.302		0.155263	6		10			6		8		1001	236		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.1553	4.502	1000	1.598		0.155263	5		4			5		4		1001	237		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.8719	8.519	1000	2.536		0.155263	7		2			7		2		1001	238		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2368	2.710	1000	1.192		0.155263	6		10			6		11		1001	240		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.1657	8.221	1000	2.713		0.155263	5		15			5		17		1001	242		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.2549	2.526	1000	0.937		0.155263	5		14			5		11		1001	243		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.6433	5.341	1000	1.081		0.155263	6		7			6		2		1001	246		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6962	4.684	1000	1.856		0.155263	5		10			5		8		1001	247		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.2410	8.080	1000	2.737		0.155263	8		15			8		14		1001	249		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6093	3.201	1000	1.853		0.155263	5		5			5		5		1001	250		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.5498	3.513	1000	2.192		0.155263	5		1			5		1		1001	251		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9103	6.024	1000	2.068		0.155263	6		14			6		16		1001	252		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1680	7.524	1000	2.672		0.155263	7		1			7		1		1001	254		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2468	2.928	1000	1.374		0.202002	7		2			7		3		1001	255		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.4510	7.924	1000	2.284		0.202002	8		10			8		12		1001	259		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.8951	6.085	1000	3.290		0.202002	7		12			7		13		1001	260		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.8261	5.134	1000	2.815		0.202002	6		5			6		4		1001	262		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2903	4.960	1000	1.183		0.202002	7		15			7		14		1001	263		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.8699	5.708	1000	3.044		0.202002	6		7			6		5		1001	264		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0330	4.908	1000	1.787		0.202002	8		11			8		13		1001	265		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.6851	8.069	1000	2.281		0.202002	6		7			6		3		1001	266		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.5137	6.359	1000	1.084		0.202002	6		1			6		1		1001	267		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.4310	3.440	1000	2.436		0.225923	6		2			6		6		1001	268		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1690	2.136	1000	0.983		0.225923	6		3			6		6		1001	269		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7366	4.735	1000	3.178		0.225923	5		15			5		12		1001	271		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.2196	6.401	1000	2.276		0.225923	6		7			6		5		1001	272		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.1124	7.018	1000	1.740		0.225923	7		17			7		13		1001	273		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2876	8.829	1000	2.956		0.225923	5		3			5		1		1001	274		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.3636	3.075	1000	1.255		0.225923	6		2			6		1		1001	275		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.1838	4.100	1000	2.152		0.228126	6		15			6		16		1001	276		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5335	5.816	1000	2.591		0.228126	7		17			7		14		1001	277		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.1186	3.426	1000	0.889		0.228126	6		5			6		9		1001	278		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.5734	1.775	1000	1.133		0.228126	6		3			6		5		1001	280		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1246	5.190	1000	2.037		0.228126	6		15			6		16		1001	282		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.1868	6.618	1000	2.281		0.228126	7		7			7		9		1001	283		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6311	5.117	1000	2.900		0.228126	5		8			5		9		1001	284		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.0745	5.428	1000	2.141		0.228126	5		1			5		1		1001	285		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.1757	7.206	1000	3.467		0.228126	6		4			6		7		1001	286		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.8513	5.374	1000	3.147		0.228126	6		9			6		6		1001	288		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.7098	4.009	1000	0.791		0.228126	7		17			7		14		1001	289		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7549	7.656	1000	2.849		0.228126	6		5			6		2		1001	290		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7538	7.644	1000	3.131		0.228126	7		3			7		4		1001	291		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2280	6.027	1000	1.139		0.228126	6		12			6		8		1001	292		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.6665	6.992	1000	2.039		0.228126	8		9			8		13		1001	293		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5397	7.840	1000	1.991		0.228126	8		1			8		1		1001	294		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1339	5.316	1000	3.510		0.245107	7		9			7		4		1001	295		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.3290	6.090	1000	1.536		0.245107	7		5			7		2		1001	296		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.2774	7.960	1000	2.780		0.245107	6		4			6		4		1001	297		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.5509	6.769	1000	1.372		0.245107	7		8			7		4		1001	298		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5712	2.452	1000	1.636		0.245107	7		11			7		7		1001	299		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.9730	5.718	1000	2.305		0.245107	7		14			7		17		1001	300		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8861	9.164	1000	3.601		0.245107	6		2			6		4		1001	301		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.4604	2.775	1000	1.339		0.254724	6		1			6		4		1001	302		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4628	6.713	1000	2.793		0.254724	6		8			6		4		1001	303		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6476	7.000	1000	2.323		0.254724	7		1			7		1		1001	304		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.6757	6.736	1000	3.007		0.254724	5		15			5		17		1001	305		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1096	1.108	1000	0.828		0.254724	6		15			6		15		1001	306		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6584	5.818	1000	3.153		0.254724	5		15			5		11		1001	308		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.4845	5.582	1000	1.458		0.254724	6		12			6		8		1001	309		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1684	7.946	1000	2.299		0.254724	7		17			7		18		1001	311		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.5521	7.979	1000	1.973		0.254724	8		3			8		4		1001	313		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.8854	5.310	1000	2.859		0.254724	6		11			6		13		1001	314		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7883	5.382	1000	3.362		0.254724	5		15			5		19		1001	316		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.9538	7.653	1000	3.411		0.254724	7		14			7		13		1001	317		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.0722	5.651	1000	2.573		0.254724	7		6			7		7		1001	318		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.7524	3.152	1000	1.762		0.254724	6		13			6		9		1001	319		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5715	6.427	1000	2.745		0.254724	8		18			8		19		1001	321		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.4187	3.904	1000	1.852		0.345446	7		5			7		7		1001	323		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8877	3.985	1000	1.124		0.345446	8		10			8		6		1001	325		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5723	4.844	1000	3.447		0.345446	6		1			6		2		1001	326		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.2457	6.512	1000	1.741		0.345446	5		5			5		2		1001	327		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1111	6.203	1000	2.494		0.345446	7		17			7		14		1001	328		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.8952	4.065	1000	1.396		0.345446	5		1			5		1		1001	329		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.6841	8.801	1000	3.445		0.345446	7		18			7		15		1001	330		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.1982	6.209	1000	1.904		0.345446	8		11			8		15		1001	331		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.5870	8.140	1000	2.161		0.345446	8		7			8		11		1001	332		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.3692	7.496	1000	2.566		0.345446	7		16			7		11		1001	333		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0744	4.507	1000	1.119		0.345446	6		19			6		22		1001	335		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9718	2.887	1000	1.761		0.345446	7		4			7		5		1001	336		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.8375	6.589	1000	2.915		0.345446	8		11			8		11		1001	337		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.9478	5.174	1000	1.872		0.345446	6		10			6		14		1001	339		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6492	6.314	1000	1.849		0.387181	8		5			8		6		1001	340		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8196	2.517	1000	1.344		0.387181	7		17			7		18		1001	341		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.8868	7.405	1000	1.621		0.387181	7		1			7		1		1001	342		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.5720	6.404	1000	2.204		0.387181	8		15			8		10		1001	343		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0409	3.540	1000	1.050		0.387181	6		11			6		9		1001	344		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.0418	8.320	1000	2.412		0.387181	8		6			8		3		1001	345		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1114	5.317	1000	3.126		0.387181	7		4			7		3		1001	347		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6530	7.315	1000	2.422		0.387181	7		1			7		1		1001	349		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3341	3.948	1000	1.370		0.387181	6		14			6		11		1001	351		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.9448	6.940	1000	1.757		0.387181	5		10			5		12		1001	352		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.9673	9.655	1000	3.237		0.387181	7		12			7		16		1001	356		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2996	7.931	1000	2.550		0.387181	7		17			7		15		1001	357		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.5087	7.072	1000	2.595		0.399972	6		1			6		4		1001	358		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4788	8.146	1000	2.128		0.399972	6		20			6		17		1001	360		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.4560	6.762	1000	2.071		0.399972	7		3			7		2		1001	361		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.8040	4.433	1000	1.615		0.399972	8		10			8		11		1001	362		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5162	8.289	1000	3.227		0.399972	5		17			5		11		1001	363		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0916	8.332	1000	3.064		0.399972	8		14			8		9		1001	364		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.3597	5.423	1000	2.420		0.399972	8		2			8		1		1001	366		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.9187	6.000	1000	0.952		0.453994	6		16			6		11		1001	367		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7303	7.903	1000	2.308		0.453994	8		12			8		10		1001	370		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.7823	5.788	1000	3.164		0.453994	8		14			8		11		1001	371		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6679	7.110	1000	2.023		0.453994	8		16			8		10		1001	373		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0334	5.335	1000	2.346		0.453994	7		10			7		4		1001	374		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.2295	5.657	1000	1.282		0.453994	7		7			7		1		1001	377		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.2159	3.335	1000	0.930		0.453994	6		3			6		5		1001	379		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0145	6.452	1000	1.198		0.453994	7		6			7		11		1001	381		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.4836	5.369	1000	1.503		0.453994	7		13			7		13		1001	382		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0043	6.490	1000	2.794		0.453994	8		10			8		5		1001	384		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8744	2.772	1000	1.344		0.453994	6		4			6		3		1001	386		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7950	6.628	1000	1.613		0.453994	6		20			6		22		1001	388		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7709	4.270	1000	2.948		0.453994	7		21			7		21		1001	389		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.2240	8.509	1000	2.903		0.453994	6		21			6		24		1001	390		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.3130	4.158	1000	1.495		0.453994	6		14			6		13		1001	393		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3127	6.092	1000	3.293		0.548210	5		8			5		3		1001	394		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8599	6.789	1000	2.166		0.548210	7		14			7		16		1001	395		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1522	5.903	1000	1.815		0.548210	8		14			8		11		1001	398		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8531	6.402	1000	3.132		0.548210	6		15			6		14		1001	400		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.4865	1.821	1000	0.999		0.548210	8		4			8		8		1001	402		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7650	1.562	1000	0.916		0.548210	6		7			6		4		1001	404		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.1958	2.926	1000	1.610		0.548210	6		20			6		18		1001	405		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0562	4.595	1000	1.170		0.548210	8		9			8		12		1001	406		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.4715	7.940	1000	3.171		0.548210	7		7			7		1		1001	407		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6662	3.608	1000	1.725		0.548210	7		1			7		2		1001	408		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7343	3.903	1000	1.286		0.548210	7		16			7		17		1001	409		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0277	2.693	1000	1.438		0.548210	6		4			6		1		1001	410		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2847	3.845	1000	0.774		0.548210	6		17			6		18		1001	411		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.7192	6.174	1000	2.723		0.548210	8		11			8		13		1001	412		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.2566	6.832	1000	3.344		0.548210	6		3			6		1		1001	413		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.3300	4.280	1000	2.392		0.548210	7		13			7		9		1001	415		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.4383	3.388	1000	1.711		0.548210	5		23			5		18		1001	416		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7216	7.062	1000	2.436		0.548210	7		20			7		15		1001	417		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6243	7.748	1000	3.270		0.548210	8		14			8		12		1001	419		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1260	7.351	1000	2.371		0.548210	8		23			8		22		1001	421		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4700	5.815	1000	2.643		0.681485	7		25			7		30		1001	422		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8783	5.264	1000	0.934		0.681485	8		21			8		24		1001	423		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1814	4.071	1000	3.100		0.681485	6		2			6		1		1001	424		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0242	3.841	1000	2.697		0.681485	5		20			5		15		1001	426		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7591	6.704	1000	3.122		0.681485	8		20			8		18		1001	427		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.5595	6.358	1000	1.909		0.681485	7		1			7		1		1001	428		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8927	2.593	1000	1.299		0.681485	7		11			7		11		1001	429		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.5355	5.260	1000	1.910		0.681485	7		22			7		17		1001	430		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4863	6.123	1000	3.107		0.681485	6		20			6		25		1001	431		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.3232	6.987	1000	1.399		0.681485	6		4			6		5		1001	432		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7880	7.071	1000	1.595		0.681485	8		4			8		7		1001	433		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1416	4.223	1000	0.987		0.681485	5		15			5		12		1001	434		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0322	5.342	1000	2.379		0.681485	6		19			6		18		1001	436		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2037	4.411	1000	3.284		0.747231	7		9			7		14		1001	438		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8414	5.398	1000	1.531		0.747231	8		19			8		24		1001	439		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2712	5.879	1000	2.687		0.747231	7		20			7		24		1001	440		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2899	1.388	1000	0.971		0.747231	8		5			8		1		1001	442		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7990	8.149	1000	3.100		0.747231	6		5			6		3		1001	443		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6211	1.540	1000	0.865		0.747231	5		25			5		21		1001	444		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8271	6.352	1000	2.738		0.747231	6		18			6		23		1001	445		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.1785	4.727	1000	1.501		0.747231	6		25			6		20		1001	446		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.7718	4.084	1000	1.361		0.747231	6		20			6		18		1001	448		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1295	5.777	1000	3.250		0.747231	8		2			8		4		1001	449		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2223	3.669	1000	1.088		0.747231	7		2			7		7		1001	451		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8589	3.715	1000	2.903		0.927693	5		20			5		19		1001	452		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3507	6.141	1000	1.441		0.927693	8		23			8		21		1001	453		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6096	3.542	1000	0.806		0.927693	7		3			7		1		1001	454		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1663	4.420	1000	1.517		0.927693	5		26			5		28		1001	457		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0322	5.706	1000	2.184		0.927693	6		6			6		7		1001	459		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.3650	4.812	1000	1.729		0.927693	5		2			5		1		1001	460		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0013	6.118	1000	3.066		0.927693	7		8			7		11		1001	461		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8585	3.549	1000	1.731		0.927693	7		18			7		24		1001	462		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6169	5.907	1000	0.834		0.927693	6		12			6		14		1001	463		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0385	4.759	1000	1.411		0.927693	8		7			8		8		1001	464		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6272	4.972	1000	1.721		0.927693	8		19			8		12		1001	466		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.1400	6.009	1000	1.189		0.927693	8		15			8		11		1001	467		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0983	3.172	1000	1.591		0.927693	8		17			8		11		1001	468		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.9791	6.692	1000	2.522		0.927693	7		19			7		20		1001	470		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6828	5.645	1000	2.028		0.927693	5		19			5		13		1001	471		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7341	3.236	1000	1.525		0.927693	6		27			6		28		1001	472		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2795	6.739	1000	1.415		0.927693	5		5			5		1		1001	474		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1799	2.760	1000	2.075		0.935656	7		23			7		28		1001	475		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3648	2.440	1000	1.616		0.935656	6		12			6		14		1001	476		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7126	6.701	1000	1.546		0.935656	7		4			7		1		1001	480		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.7057	8.074	1000	2.457		0.935656	8		11			8		15		1001	483		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0446	6.644	1000	2.749		0.935656	6		12			6		12		1001	484		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.4392	1.932	1000	1.503		0.935656	7		8			7		8		1001	485		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.4791	7.584	1000	2.389		0.935656	6		11			6		17		1001	486		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2715	5.458	1000	2.063		0.935656	5		11			5		5		1001	487		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0652	5.685	1000	1.901		0.935656	5		23			5		28		1001	488		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6296	5.027	1000	1.680		0.935656	8		7			8		5		1001	490		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6469	6.688	1000	1.858		0.935656	6		6			6		1		1001	491		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5283	5.131	1000	2.391		0.935656	7		23			7		21		1001	493		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1700	3.607	1000	0.967		0.935656	8		2			8		6		1001	496		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9200	5.330	1000	1.538		0.935656	5		18			5		19		1001	500		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8103	3.400	1000	1.531		0.935656	5		21			5		16		1001	504		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3098	6.703	1000	1.225		0.945402	6		10			6		10		1001	507		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8683	4.248	1000	2.093		0.945402	5		8			5		6		1001	508		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0614	7.525	1000	1.896		0.945402	7		5			7		11		1001	511		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1638	4.614	1000	1.047		0.945402	6		15			6		10		1001	516		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.2419	3.623	1000	0.844		0.945402	7		16			7		14		1001	518		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8108	7.222	1000	2.539		0.945402	8		5			8		4		1001	519		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5126	7.022	1000	1.607		0.945402	7		10			7		10		1001	520		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0740	3.829	1000	1.846		0.945402	8		21			8		18		1001	523		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0666	5.874	1000	2.810		0.945402	7		17			7		20		1001	524		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4229	5.073	1000	1.533		0.945402	6		11			6		7		1001	525		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5524	3.398	1000	2.500		0.945402	7		4			7		5		1001	527		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8985	8.555	1000	3.199		0.945402	8		21			8		24		1001	528		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5653	5.888	1000	2.827		0.945402	5		15			5		21		1001	531		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9273	7.841	1000	2.590		0.945402	6		23			6		23		1001	532		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1460	5.116	1000	3.166		0.945402	6		9			6		5		1001	533		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7541	9.671	1000	3.189		0.945402	5		25			5		22		1001	534		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2564	6.761	1000	2.367		0.945402	6		25			6		21		1001	535		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.4726	7.020	1000	1.796		0.945402	6		8			6		6		1001	536		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8250	6.866	1000	2.642		0.945402	8		27			8		29		1001	537		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9358	7.025	1000	3.072		0.945402	7		15			7		12		1001	538		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1019	3.466	1000	0.860		0.945402	7		13			7		10		1001	540		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5276	4.349	1000	1.136		0.956862	6		21			6		19		1001	542		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0349	8.797	1000	2.665		0.956862	6		24			6		18		1001	543		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7327	3.914	1000	1.044		0.956862	5		3			5		7		1001	546		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.8353	7.640	1000	1.838		0.956862	5		14			5		16		1001	548		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1076	8.461	1000	3.011		0.956862	7		12			7		12		1001	554		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1721	5.314	1000	1.438		0.956862	7		5			7		1		1001	555		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7342	3.066	1000	1.679		0.956862	5		20			5		21		1001	556		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4722	4.144	1000	1.967		0.956862	7		11			7		13		1001	558		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4041	5.373	1000	2.930		0.956862	7		17			7		19		1001	560		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5731	4.168	1000	1.355		0.956862	7		2			7		1		1001	562		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6667	6.513	1000	2.471		0.956862	5		26			5		31		1001	563		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5023	6.007	1000	3.208		0.956862	6		23			6		27		1001	564		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0152	4.634	1000	1.461		0.956862	5		20			5		19		1001	565		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1154	5.260	1000	2.373		0.956862	7		1			7		1		1001	567		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8842	5.656	1000	2.850		0.956862	6		15			6		13		1001	569		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1739	9.363	1000	3.034		0.956862	7		2			7		1		1001	571		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8339	6.604	1000	2.662		0.961863	7		27			7		30		1001	572		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6749	7.510	1000	2.397		0.961863	7		25			7		25		1001	573		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8574	3.330	1000	1.686		0.961863	7		16			7		19		1001	575		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9528	7.004	1000	3.104		0.961863	5		15			5		17		1001	578		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.3403	6.425	1000	2.424		0.961863	5		17			5		15		1001	580		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3171	6.500	1000	2.306		0.961863	8		5			8		5		1001	581		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0671	5.904	1000	2.911		0.961863	6		13			6		14		1001	582		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4402	3.688	1000	2.813		0.961863	5		15			5		13		1001	583		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5641	2.486	1000	1.346		0.961863	8		26			8		27		1001	584		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2996	7.941	1000	2.139		0.961863	8		8			8		6		1001	585		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9848	7.155	1000	2.156		0.961863	6		21			6		20		1001	586		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8689	3.240	1000	2.323		1.082758	6		9			6		7		1001	587		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6270	2.955	1000	2.147		1.082758	6		20			6		23		1001	588		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3701	6.781	1000	2.160		1.082758	7		29			7		27		1001	589		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4805	5.027	1000	1.679		1.082758	6		14			6		11		1001	590		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6254	3.471	1000	1.530		1.082758	5		29			5		28		1001	591		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7590	8.614	1000	2.724		1.082758	5		10			5		7		1001	592		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6915	9.251	1000	3.087		1.082758	8		26			8		31		1001	595		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4747	4.732	1000	1.076		1.082758	6		12			6		6		1001	596		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0324	5.173	1000	1.211		1.082758	5		23			5		16		1001	598		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0845	3.733	1000	2.165		1.082758	6		19			6		19		1001	599		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.4530	5.106	1000	2.399		1.082758	6		16			6		16		1001	600		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5824	2.122	1000	1.412		1.082758	8		4			8		1		1001	601		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4387	7.016	1000	2.253		1.082758	6		19			6		19		1001	602		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8136	5.774	1000	2.902		1.082758	6		9			6		8		1001	604		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9000	6.652	1000	2.478		1.082758	5		25			5		20		1001	605		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.3817	6.530	1000	1.637		1.082758	7		6			7		2		1001	607		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	5.033	1000	1.424		1.082758	7		11			7		8		1001	608		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2698	7.360	1000	3.009		1.082758	7		29			7		26		1001	609		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1221	3.804	1000	1.497		1.082758	7		29			7		23		1001	610		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1831	3.057	1000	0.832		1.082758	6		13			6		14		1001	612		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.9526	3.191	1000	1.966		1.164275	7		2			7		1		1001	613		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9875	3.500	1000	1.554		1.164275	6		5			6		5		1001	614		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.4904	7.935	1000	2.368		1.164275	6		26			6		25		1001	615		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6466	3.921	1000	1.079		1.164275	8		27			8		20		1001	616		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8937	8.933	1000	2.910		1.164275	7		17			7		16		1001	617		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3529	5.164	1000	3.054		1.164275	7		1			7		1		1001	618		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6558	4.139	1000	0.872		1.164275	6		25			6		21		1001	619		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9714	4.082	1000	1.088		1.164275	5		15			5		13		1001	620		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0702	6.001	1000	2.820		1.164275	7		25			7		31		1001	621		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0705	4.525	1000	2.061		1.164275	7		17			7		12		1001	622		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5638	7.122	1000	2.554		1.164275	6		17			6		11		1001	623		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1114	6.322	1000	1.260		1.164275	6		2			6		8		1001	626		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8481	3.722	1000	1.108		1.164275	6		26			6		31		1001	627		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.9485	7.209	1000	1.665		1.164275	8		14			8		15		1001	628		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1276	5.552	1000	1.860		1.164275	6		12			6		12		1001	629		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.5442	4.964	1000	1.198		1.164275	6		17			6		18		1001	630		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1910	2.797	1000	1.562		1.177329	7		8			7		8		1001	631		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3031	2.065	1000	0.985		1.177329	6		20			6		24		1001	634		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.1251	6.055	1000	2.648		1.177329	7		14			7		17		1001	636		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5596	7.141	1000	1.841		1.177329	6		24			6		28		1001	637		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1415	4.799	1000	2.656		1.177329	7		27			7		29		1001	638		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3856	4.369	1000	1.199		1.177329	7		11			7		17		1001	639		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5431	4.837	1000	1.645		1.177329	6		28			6		33		1001	641		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1448	3.375	1000	1.798		1.177329	8		21			8		25		1001	642		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.6080	2.441	1000	1.423		1.177329	6		23			6		19		1001	643		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8083	1.845	1000	1.141		1.177329	8		25			8		27		1001	644		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8121	4.713	1000	1.335		1.177329	7		24			7		29		1001	645		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3927	7.410	1000	2.296		1.177329	5		11			5		13		1001	646		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2087	7.300	1000	2.319		1.177329	7		3			7		5		1001	647		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8057	7.429	1000	2.093		1.177329	7		4			7		8		1001	650		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3301	1.903	1000	0.895		1.177329	8		21			8		26		1001	651		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0913	6.446	1000	2.212		1.177329	6		15			6		16		1001	652		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2724	5.628	1000	2.481		1.177329	5		29			5		25		1001	653		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0906	8.618	1000	3.024		1.177329	7		22			7		18		1001	654		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.4357	2.255	1000	1.655		1.177329	7		8			7		11		1001	655		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1886	5.884	1000	2.567		1.177329	6		2			6		1		1001	657		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7265	3.929	1000	2.945		1.341100	7		26			7		20		1001	658		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1211	3.603	1000	2.210		1.341100	6		28			6		30		1001	659		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3488	5.136	1000	1.756		1.341100	8		28			8		31		1001	660		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5053	3.370	1000	1.454		1.341100	7		1			7		3		1001	661		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1462	4.679	1000	0.773		1.341100	6		31			6		37		1001	662		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8834	3.197	1000	1.429		1.341100	5		22			5		20		1001	663		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8307	5.667	1000	2.895		1.341100	7		31			7		28		1001	664		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4168	6.678	1000	2.921		1.341100	6		26			6		22		1001	665		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1364	3.005	1000	0.898		1.341100	6		28			6		32		1001	666		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2896	6.059	1000	1.392		1.341100	6		20			6		23		1001	667		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1065	9.411	1000	3.017		1.341100	7		18			7		21		1001	669		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2811	3.113	1000	1.457		1.341100	6		13			6		7		1001	670		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5678	5.018	1000	0.892		1.341100	8		18			8		14		1001	674		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9634	5.803	1000	1.760		1.341100	7		14			7		19		1001	675		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0074	6.928	1000	2.056		1.341100	7		25			7		20		1001	676		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3065	5.295	1000	2.575		1.341100	5		3			5		7		1001	677		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0303	4.906	1000	2.949		1.341100	5		1			5		4		1001	679		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8934	5.063	1000	2.433		1.341100	6		23			6		22		1001	680		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3298	4.356	1000	1.017		1.341100	6		14			6		12		1001	681		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.3316	8.097	1000	2.316		1.341100	7		26			7		30		1001	684		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1021	5.470	1000	1.226		1.341100	7		16			7		10		1001	687		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2310	8.530	1000	2.828		1.341100	7		10			7		4		1001	689		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3604	5.845	1000	0.832		1.375531	7		18			7		13		1001	690		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8515	8.334	1000	3.055		1.375531	6		7			6		5		1001	691		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0287	6.911	1000	1.784		1.375531	7		5			7		5		1001	692		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.7535	7.750	1000	2.190		1.375531	5		25			5		30		1001	695		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1908	4.298	1000	2.533		1.375531	5		23			5		24		1001	698		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7339	6.255	1000	2.865		1.375531	8		25			8		30		1001	699		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.9895	3.953	1000	1.369		1.375531	7		23			7		27		1001	700		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7096	2.636	1000	1.027		1.375531	7		20			7		14		1001	701		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4032	6.748	1000	2.505		1.375531	7		27			7		20		1001	702		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.0443	5.031	1000	2.978		1.375531	7		28			7		22		1001	703		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6941	4.101	1000	1.996		1.375531	7		22			7		28		1001	704		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1835	4.112	1000	1.966		1.375531	8		20			8		13		1001	705		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3229	7.982	1000	2.934		1.375531	7		23			7		28		1001	707		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8045	4.339	1000	1.277		1.375531	7		10			7		10		1001	708		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.3403	1.568	1000	0.869		1.375531	8		26			8		31		1001	709		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5099	7.523	1000	2.080		1.698203	6		9			6		4		1001	710		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5763	6.033	1000	2.289		1.698203	5		31			5		37		1001	711		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0622	1.651	1000	0.954		1.698203	6		32			6		36		1001	713		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2781	5.052	1000	0.880		1.698203	6		10			6		5		1001	715		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1249	2.821	1000	1.225		1.698203	7		29			7		22		1001	716		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0537	4.083	1000	2.249		1.698203	8		34			8		31		1001	717		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0484	4.459	1000	2.825		1.698203	7		4			7		6		1001	718		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5271	7.757	1000	2.898		1.698203	8		4			8		6		1001	719		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5955	3.994	1000	2.229		1.698203	7		10			7		6		1001	721		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1799	4.627	1000	0.794		1.698203	7		27			7		24		1001	722		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2763	3.454	1000	1.513		1.698203	7		27			7		31		1001	723		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5306	4.661	1000	1.117		1.698203	6		29			6		34		1001	727		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5905	3.919	1000	2.531		1.698203	8		13			8		12		1001	728		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3648	4.092	1000	1.708		1.698203	7		26			7		26		1001	729		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4621	7.750	1000	2.378		1.698203	7		18			7		13		1001	731		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8480	6.385	1000	2.685		1.698203	5		6			5		12		1001	732		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4353	6.326	1000	1.808		1.698203	8		20			8		17		1001	733		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5940	3.920	1000	1.925		1.698203	7		9			7		3		1001	734		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.2150	4.895	1000	0.997		1.698203	6		16			6		8		1001	735		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.1202	5.629	1000	2.120		1.698203	5		29			5		30		1001	736		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8654	3.775	1000	1.912		1.698203	6		20			6		19		1001	737		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8865	6.149	1000	1.445		1.698203	8		22			8		15		1001	741		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3784	5.278	1000	2.624		1.698203	5		7			5		1		1001	742		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3611	4.098	1000	1.035		1.698203	8		34			8		37		1001	743		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2593	6.116	1000	1.479		1.698203	5		24			5		21		1001	744		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5361	4.780	1000	2.297		1.698203	8		34			8		38		1001	745		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3490	5.347	1000	1.677		1.698203	7		12			7		6		1001	746		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7354	1.871	1000	0.797		1.859938	6		35			6		33		1001	747		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1095	3.353	1000	2.535		1.859938	6		5			6		4		1001	749		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.6285	5.194	1000	2.322		1.859938	7		12			7		19		1001	751		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0549	4.909	1000	2.892		1.859938	6		6			6		7		1001	755		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9554	7.223	1000	2.823		1.859938	5		15			5		18		1001	756		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3977	6.353	1000	2.105		1.859938	6		33			6		38		1001	759		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0597	5.735	1000	1.920		1.859938	7		35			7		37		1001	760		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6917	7.706	1000	2.124		1.859938	5		4			5		10		1001	762		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6860	5.078	1000	2.581		1.859938	6		10			6		14		1001	764		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.8052	3.705	1000	2.512		1.859938	5		20			5		20		1001	766		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2525	7.064	1000	1.742		1.859938	6		5			6		1		1001	768		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0597	4.170	1000	2.055		1.859938	6		8			6		5		1001	769		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0072	5.991	1000	0.851		1.859938	5		9			5		8		1001	770		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2657	5.483	1000	1.944		1.859938	6		2			6		9		1001	771		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7968	7.160	1000	1.758		1.859938	6		20			6		15		1001	773		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4016	6.673	1000	1.718		1.859938	7		17			7		23		1001	774		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3599	8.311	1000	2.810		1.859938	8		6			8		6		1001	775		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8844	5.905	1000	2.398		1.859938	7		18			7		25		1001	778		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8500	5.670	1000	1.194		1.859938	8		18			8		15		1001	780		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0901	6.811	1000	2.906		1.859938	5		27			5		25		1001	782		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0384	3.461	1000	1.330		1.859938	6		19			6		22		1001	785		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9821	6.658	1000	1.905		1.939055	6		29			6		29		1001	786		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4820	3.724	1000	2.095		1.939055	7		24			7		19		1001	787		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2200	2.947	1000	1.407		1.939055	7		8			7		13		1001	788		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3558	5.131	1000	1.819		1.939055	7		4			7		1		1001	789		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7149	3.525	1000	2.681		1.939055	7		2			7		2		1001	790		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2750	9.538	1000	2.849		1.939055	6		24			6		19		1001	791		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2623	3.693	1000	1.836		1.939055	7		20			7		17		1001	793		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.4839	5.573	1000	1.760		1.939055	8		19			8		18		1001	794		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2684	2.383	1000	1.293		1.939055	6		8			6		6		1001	795		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8417	4.963	1000	2.423		1.939055	8		25			8		29		1001	798		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6919	7.524	1000	2.880		1.939055	5		28			5		23		1001	799		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3690	3.570	1000	1.536		1.939055	8		12			8		11		1001	800		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7728	3.642	1000	1.854		1.939055	6		34			6		29		1001	801		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5112	6.718	1000	2.296		1.939055	6		18			6		11		1001	804		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.8897	4.806	1000	2.845		1.939055	7		29			7		28		1001	807		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4200	6.257	1000	2.085		1.939055	7		23			7		22		1001	809		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5566	3.736	1000	2.303		2.011318	6		16			6		17		1001	810		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7307	6.582	1000	2.563		2.011318	8		19			8		24		1001	811		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8746	3.075	1000	1.744		2.011318	8		15			8		17		1001	813		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1354	1.718	1000	1.149		2.011318	7		10			7		13		1001	814		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8478	8.452	1000	2.641		2.011318	7		5			7		11		1001	815		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1718	1.536	1000	0.756		2.011318	8		8			8		11		1001	816		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6141	5.564	1000	0.991		2.011318	8		25			8		21		1001	817		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5994	4.110	1000	2.628		2.011318	6		24			6		30		1001	821		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6179	6.938	1000	2.624		2.011318	8		25			8		27		1001	822		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0581	6.163	1000	1.898		2.011318	7		36			7		28		1001	823		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4829	3.966	1000	0.771		2.011318	6		32			6		32		1001	825		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0469	4.044	1000	1.381		2.011318	6		14			6		6		1001	829		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.0273	8.048	1000	2.668		2.011318	7		20			7		27		1001	833		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2117	6.284	1000	2.086		2.011318	8		2			8		9		1001	835		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8089	4.731	1000	2.252		2.011318	7		7			7		12		1001	836		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5818	3.847	1000	0.989		2.011318	6		15			6		15		1001	837		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.4624	6.698	1000	2.292		2.011318	5		23			5		25		1001	838		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6568	5.162	1000	1.119		2.011318	8		15			8		14		1001	839		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.8948	4.183	1000	1.762		2.098293	8		2			8		1		1001	841		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4759	3.293	1000	1.771		2.098293	5		15			5		14		1001	842		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8445	7.043	1000	2.529		2.098293	7		10			7		12		1001	844		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8202	4.883	1000	1.598		2.098293	7		14			7		15		1001	845		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5223	6.838	1000	1.905		2.098293	6		3			6		1		1001	848		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4025	4.901	1000	1.732		2.098293	8		15			8		12		1001	850		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3218	4.405	1000	0.974		2.098293	8		32			8		38		1001	853		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8331	6.091	1000	2.164		2.098293	5		4			5		11		1001	854		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9922	3.874	1000	2.758		2.098293	7		32			7		35		1001	855		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3190	8.172	1000	2.610		2.098293	8		6			8		13		1001	858		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9481	1.708	1000	1.252		2.098293	5		26			5		19		1001	859		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1216	5.837	1000	1.732		2.098293	7		32			7		40		1001	861		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5009	4.449	1000	1.120		2.098293	6		36			6		28		1001	862		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5292	5.329	1000	2.466		2.098293	6		35			6		32		1001	863		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8644	5.062	1000	1.773		2.098293	6		27			6		23		1001	864		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7916	6.610	1000	2.385		2.098293	6		18			6		18		1001	865		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1624	3.054	1000	1.661		2.098293	7		7			7		10		1001	866		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6125	5.467	1000	2.214		2.098293	7		8			7		2		1001	869		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3979	4.155	1000	1.451		2.098293	7		16			7		14		1001	871		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6618	7.436	1000	2.390		2.098293	7		13			7		17		1001	872		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2695	6.238	1000	1.554		2.098293	7		1			7		1		1001	873		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8059	3.930	1000	1.264		2.098293	7		2			7		1		1001	874		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7976	2.019	1000	0.779		2.098293	8		27			8		23		1001	875		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8291	5.337	1000	2.616		2.098293	6		15			6		18		1001	876		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5316	6.255	1000	2.150		2.098293	5		3			5		1		1001	878		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3672	5.567	1000	2.712		2.098293	7		26			7		33		1001	880		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2372	5.459	1000	2.447		2.098293	7		9			7		15		1001	881		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9739	6.052	1000	1.733		2.098293	6		19			6		21		1001	882		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1374	4.884	1000	1.782		2.134212	6		19			6		14		1001	883		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.6978	7.213	1000	1.781		2.134212	6		26			6		22		1001	885		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.2700	4.022	1000	2.206		2.134212	6		6			6		3		1001	887		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9239	5.585	1000	0.901		2.134212	6		26			6		27		1001	888		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7552	4.812	1000	1.055		2.134212	6		24			6		26		1001	889		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8461	2.282	1000	1.361		2.134212	7		11			7		15		1001	892		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9367	1.039	1000	0.759		2.134212	6		4			6		3		1001	893		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0087	4.347	1000	2.632		2.134212	7		15			7		22		1001	894		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5873	5.311	1000	1.369		2.134212	6		8			6		1		1001	895		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5417	8.411	1000	2.711		2.134212	7		15			7		18		1001	896		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9467	5.543	1000	1.181		2.134212	6		22			6		14		1001	898		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5154	2.621	1000	1.036		2.202986	6		7			6		2		1001	899		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7391	3.319	1000	2.035		2.202986	7		2			7		1		1001	900		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7075	2.478	1000	1.384		2.202986	7		8			7		8		1001	901		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1295	3.249	1000	2.070		2.202986	7		25			7		26		1001	902		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0133	7.586	1000	2.095		2.202986	6		11			6		9		1001	903		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3231	5.855	1000	1.556		2.202986	6		37			6		37		1001	904		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8959	8.042	1000	2.706		2.202986	5		8			5		1		1001	905		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5056	8.387	1000	2.205		2.202986	8		15			8		13		1001	907		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.6497	2.913	1000	1.170		2.202986	7		8			7		8		1001	908		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8482	1.369	1000	0.784		2.202986	8		2			8		1		1001	909		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5747	4.017	1000	2.258		2.202986	6		1			6		8		1001	910		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9265	5.352	1000	1.556		2.202986	7		12			7		4		1001	911		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2889	5.788	1000	2.122		2.202986	7		18			7		23		1001	912		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3593	5.108	1000	2.791		2.202986	8		7			8		9		1001	915		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.6300	4.019	1000	2.266		2.202986	6		21			6		28		1001	916		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1393	2.477	1000	1.843		2.202986	8		38			8		40		1001	917		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8208	5.622	1000	2.057		2.202986	7		30			7		35		1001	920		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3915	3.808	1000	1.035		2.202986	8		33			8		32		1001	921		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0587	6.374	1000	2.626		2.202986	6		36			6		29		1001	922		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.0758	8.889	1000	2.513		2.202986	6		9			6		17		1001	923		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1832	3.980	1000	1.357		2.202986	5		16			5		14		1001	924		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0731	3.981	1000	1.609		2.202986	6		35			6		27		1001	926		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.6354	7.324	1000	2.163		2.202986	7		28			7		20		1001	927		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6513	5.242	1000	2.281		2.202986	6		4			6		7		1001	928		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0050	2.700	1000	1.612		2.202986	8		5			8		11		1001	931		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5140	5.595	1000	2.023		2.306170	6		5			6		1		1001	932		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7243	5.782	1000	1.711		2.306170	7		10			7		15		1001	937		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.4847	4.034	1000	2.586		2.306170	5		5			5		8		1001	938		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9804	7.682	1000	2.295		2.306170	6		14			6		11		1001	939		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5156	6.500	1000	2.129		2.306170	7		1			7		1		1001	943		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2916	2.401	1000	1.170		2.306170	6		12			6		5		1001	944		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3272	8.493	1000	2.423		2.306170	6		23			6		30		1001	946		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1726	4.262	1000	1.152		2.306170	8		31			8		31		1001	948		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8440	2.415	1000	0.748		2.306170	5		6			5		11		1001	950		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2101	7.529	1000	2.316		2.306170	7		26			7		28		1001	951		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6085	4.792	1000	2.226		2.306170	5		33			5		30		1001	954		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7521	7.082	1000	1.456		2.306170	6		27			6		27		1001	955		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7083	3.465	1000	2.163		2.306170	5		37			5		33		1001	957		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0772	5.031	1000	2.112		2.324411	6		15			6		21		1001	959		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.9783	4.150	1000	2.232		2.324411	7		2			7		1		1001	961		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4568	3.785	1000	1.160		2.324411	5		2			5		2		1001	962		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4076	4.388	1000	1.935		2.324411	7		15			7		13		1001	964		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5730	5.716	1000	2.496		2.324411	7		4			7		5		1001	968		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9913	4.176	1000	1.888		2.324411	7		33			7		36		1001	969		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.6448	3.656	1000	1.919		2.324411	5		33			5		35		1001	970		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3806	7.152	1000	2.747		2.324411	7		20			7		16		1001	973		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3814	3.790	1000	2.483		2.324411	7		18			7		13		1001	974		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1853	4.626	1000	2.374		2.324411	7		14			7		16		1001	975		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6709	7.555	1000	2.767		2.324411	6		26			6		30		1001	976		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1405	5.655	1000	1.239		2.324411	5		16			5		19		1001	977		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1739	3.991	1000	1.548		2.324411	5		15			5		22		1001	978		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8068	6.215	1000	1.990		2.324411	6		21			6		28		1001	980		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4249	3.657	1000	0.781		2.324411	5		30			5		22		1001	981		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0162	4.778	1000	1.680		2.509289	6		41			6		47		1001	982		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7048	5.949	1000	1.558		2.509289	7		28			7		23		1001	983		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3962	4.768	1000	0.818		2.509289	8		14			8		7		1001	985		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9435	5.850	1000	1.805		2.509289	7		15			7		21		1001	987		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1102	6.095	1000	1.381		2.509289	7		35			7		37		1001	988		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9161	3.594	1000	1.061		2.509289	6		40			6		43		1001	989		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.2329	6.079	1000	2.192		2.509289	7		30			7		21		1001	990		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1302	7.283	1000	2.723		2.509289	7		6			7		2		1001	991		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.6395	7.932	1000	2.437		2.509289	8		5			8		4		1001	994		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5798	7.264	1000	2.056		2.509289	5		31			5		35		1001	996		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2283	4.499	1000	1.955		2.509289	5		2			5		8		1001	998		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8002	3.115	1000	2.480		2.509289	6		11			6		3		1001	999		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8675	4.395	1000	0.739		2.509289	6		29			6		30		1001	1000		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8810	3.060	1000	1.727		2.509289	6		17			6		18		1001	1003		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3200	5.666	1000	0.944		2.509289	6		11			6		3		1001	1005		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1020	3.630	1000	0.990		2.509289	7		6			7		2		1001	1007		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9015	5.857	1000	2.223		2.509289	7		27			7		28		1001	1009		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9637	5.463	1000	2.289		2.509289	7		7			7		2		1001	1010		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3709	5.597	1000	2.376		2.509289	5		34			5		41		1001	1016		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7807	6.737	1000	1.366		2.509289	6		10			6		3		1001	1018		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5604	4.724	1000	2.602		2.509289	5		13			5		19		1001	1019		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5814	2.282	1000	1.080		2.509289	7		25			7		24		1001	1020		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9878	2.416	1000	0.821		2.509289	6		29			6		30		1001	1021		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.1958	1.830	1000	1.403		2.509289	7		17			7		9		1001	1022		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0657	8.296	1000	2.337		2.509289	5		26			5		23		1001	1023		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1669	4.757	1000	1.883		2.509289	6		20			6		18		1001	1024		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.0614	3.309	1000	2.600		2.674990	6		38			6		31		1001	1025		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0523	4.848	1000	1.095		2.674990	8		1			8		2		1001	1026		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3017	1.547	1000	0.969		2.674990	5		7			5		1		1001	1027		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.8834	4.441	1000	1.309		2.674990	7		37			7		29		1001	1028		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9149	6.446	1000	1.209		2.674990	8		16			8		7		1001	1029		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7391	7.157	1000	2.325		2.674990	6		10			6		14		1001	1030		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2127	8.113	1000	2.627		2.674990	7		10			7		4		1001	1031		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.8485	3.171	1000	2.456		2.674990	8		4			8		1		1001	1032		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6548	6.363	1000	2.511		2.674990	5		41			5		35		1001	1033		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7235	4.331	1000	0.921		2.674990	5		27			5		34		1001	1034		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5869	2.551	1000	0.803		2.674990	7		32			7		39		1001	1035		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7838	4.970	1000	1.849		2.674990	7		2			7		10		1001	1037		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9396	5.847	1000	1.256		2.674990	7		24			7		29		1001	1039		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.9159	4.629	1000	1.622		2.674990	6		34			6		27		1001	1040		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5960	3.901	1000	2.095		2.674990	7		32			7		39		1001	1041		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0920	6.420	1000	1.257		2.674990	6		32			6		32		1001	1043		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2257	6.012	1000	1.648		2.674990	8		22			8		17		1001	1044		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.9103	7.110	1000	1.521		2.674990	6		24			6		32		1001	1046		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6674	4.214	1000	1.585		2.674990	7		21			7		26		1001	1047		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6923	4.811	1000	1.247		2.674990	8		24			8		19		1001	1048		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9601	6.028	1000	1.376		2.674990	8		40			8		45		1001	1049		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2710	3.976	1000	2.434		2.674990	7		1			7		1		1001	1050		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1167	3.608	1000	2.508		2.674990	5		33			5		26		1001	1053		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2737	5.172	1000	1.793		2.674990	7		7			7		13		1001	1058		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3823	6.228	1000	1.691		2.674990	6		25			6		20		1001	1062		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9875	1.826	1000	1.140		2.674990	6		8			6		12		1001	1063		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6229	6.064	1000	2.203		2.674990	8		20			8		18		1001	1066		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3950	8.681	1000	2.539		2.674990	7		35			7		31		1001	1068		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.2270	6.882	1000	2.055		2.674990	7		14			7		20		1001	1071		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6416	6.846	1000	2.408		2.674990	7		11			7		14		1001	1072		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2037	4.877	1000	1.454		2.674990	6		12			6		12		1001	1073		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.3998	6.848	1000	1.912		2.674990	8		13			8		7		1001	1074		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8448	3.878	1000	2.163		2.674990	5		4			5		8		1001	1075		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.3273	6.809	1000	1.400		2.674990	5		30			5		27		1001	1076		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1233	2.774	1000	1.121		2.718643	6		3			6		5		1001	1077		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5143	7.639	1000	2.150		2.718643	7		38			7		33		1001	1079		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4918	7.730	1000	2.486		2.718643	6		36			6		37		1001	1080		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3911	5.510	1000	1.955		2.718643	7		24			7		27		1001	1085		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.1338	3.925	1000	2.231		2.718643	6		26			6		24		1001	1086		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3932	4.787	1000	1.705		2.718643	8		26			8		29		1001	1087		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0053	7.570	1000	2.385		2.718643	6		21			6		14		1001	1088		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.2849	3.625	1000	1.537		2.718643	7		30			7		28		1001	1090		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4257	3.825	1000	1.067		2.718643	7		6			7		1		1001	1091		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6599	6.256	1000	1.343		2.718643	7		40			7		38		1001	1093		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0796	7.678	1000	1.939		2.718643	6		19			6		13		1001	1095		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6781	4.586	1000	1.214		2.718643	6		22			6		24		1001	1097		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9407	3.300	1000	1.890		2.718643	6		22			6		14		1001	1098		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6557	6.535	1000	1.284		2.718643	6		29			6		23		1001	1099		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5817	5.569	1000	1.713		2.718643	5		8			5		1		1001	1100		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1600	5.439	1000	1.972		2.819109	7		36			7		27		1001	1102		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5868	1.246	1000	0.832		2.819109	7		1			7		2		1001	1104		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8038	2.425	1000	1.499		2.819109	5		14			5		8		1001	1105		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0867	6.838	1000	1.325		2.819109	7		36			7		32		1001	1107		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4742	6.817	1000	2.492		2.819109	7		27			7		18		1001	1109		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6159	8.772	1000	2.652		2.819109	6		26			6		27		1001	1113		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1476	3.033	1000	1.067		2.819109	6		6			6		6		1001	1114		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4035	5.624	1000	2.591		2.819109	7		19			7		17		1001	1115		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5480	5.560	1000	2.105		2.819109	8		20			8		24		1001	1117		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3617	2.074	1000	1.220		2.819109	6		12			6		13		1001	1120		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0110	4.636	1000	2.438		2.819109	7		14			7		17		1001	1122		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1955	4.274	1000	2.136		2.819109	6		2			6		5		1001	1123		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8179	4.346	1000	2.560		2.819109	6		16			6		7		1001	1124		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3527	4.711	1000	1.001		2.819109	8		6			8		6		1001	1127		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0181	7.470	1000	2.010		2.819109	5		6			5		9		1001	1129		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8548	2.868	1000	0.881		2.819109	8		14			8		6		1001	1130		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5194	5.612	1000	2.355		2.819109	6		32			6		33		1001	1131		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0922	6.136	1000	2.273		2.819109	8		8			8		7		1001	1132		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1927	6.965	1000	1.282		2.819109	6		24			6		30		1001	1133		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6614	4.535	1000	2.572		2.819109	7		12			7		16		1001	1134		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8808	3.964	1000	2.156		2.819109	7		40			7		31		1001	1136		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1790	5.111	1000	1.264		2.819109	6		36			6		34		1001	1139		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6166	6.330	1000	1.681		2.819109	7		19			7		17		1001	1140		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0071	6.469	1000	2.616		2.819109	5		31			5		32		1001	1143		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4130	3.713	1000	0.956		2.819109	5		43			5		42		1001	1144		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6914	3.993	1000	0.775		2.819109	7		17			7		19		1001	1145		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5706	6.248	1000	2.485		2.819109	8		17			8		9		1001	1146		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4936	4.584	1000	2.049		2.819109	6		31			6		37		1001	1148		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4795	3.596	1000	1.942		2.819109	7		38			7		45		1001	1151		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0867	7.391	1000	2.043		2.819109	8		40			8		43		1001	1152		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7641	5.178	1000	1.579		2.819109	7		37			7		30		1001	1153		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3083	5.982	1000	2.107		2.819109	7		20			7		26		1001	1154		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4934	8.114	1000	2.043		2.819109	7		34			7		28		1001	1155		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7898	6.973	1000	2.424		3.101276	7		18			7		11		1001	1156		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8959	6.740	1000	1.409		3.101276	7		21			7		22		1001	1157		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7365	1.878	1000	0.802		3.101276	7		14			7		19		1001	1158		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9000	4.698	1000	2.207		3.101276	7		15			7		13		1001	1159		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7569	8.106	1000	2.001		3.101276	8		5			8		1		1001	1160		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0593	2.411	1000	1.438		3.101276	5		33			5		33		1001	1161		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9657	4.871	1000	1.375		3.101276	6		11			6		11		1001	1162		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8386	3.751	1000	1.117		3.101276	7		32			7		36		1001	1165		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5981	3.824	1000	2.034		3.101276	7		6			7		1		1001	1166		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3994	2.336	1000	1.372		3.101276	5		1			5		1		1001	1167		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.0768	5.258	1000	2.560		3.101276	5		44			5		48		1001	1170		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.4436	5.645	1000	1.202		3.101276	7		38			7		43		1001	1171		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6089	5.155	1000	1.030		3.101276	7		31			7		22		1001	1173		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9930	7.333	1000	2.395		3.101276	6		18			6		21		1001	1174		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8860	5.302	1000	2.473		3.101276	7		24			7		16		1001	1176		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.3019	5.814	1000	0.732		3.101276	5		38			5		37		1001	1177		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9851	3.405	1000	1.463		3.101276	7		24			7		20		1001	1178		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4654	5.603	1000	1.476		3.101276	8		1			8		1		1001	1179		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6186	2.269	1000	0.971		3.101276	5		36			5		34		1001	1180		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2104	7.075	1000	2.292		3.101276	6		1			6		1		1001	1181		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4369	2.402	1000	1.494		3.101276	8		8			8		1		1001	1182		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0577	7.557	1000	2.504		3.291585	7		23			7		23		1001	1183		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5785	5.690	1000	1.468		3.291585	8		33			8		31		1001	1184		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1357	3.675	1000	1.149		3.291585	7		33			7		29		1001	1185		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6481	3.232	1000	1.592		3.291585	6		37			6		37		1001	1186		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.2495	5.044	1000	1.129		3.291585	8		8			8		6		1001	1187		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.4116	7.548	1000	1.907		3.291585	7		24			7		31		1001	1188		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8594	4.194	1000	0.798		3.291585	8		10			8		11		1001	1189		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1466	4.254	1000	1.979		3.291585	7		14			7		13		1001	1191		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2254	6.386	1000	1.554		3.291585	5		45			5		44		1001	1192		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2395	3.351	1000	2.390		3.291585	6		40			6		33		1001	1193		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4931	2.909	1000	0.782		3.291585	8		24			8		31		1001	1194		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8205	4.074	1000	1.043		3.291585	8		43			8		38		1001	1196		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8436	3.910	1000	1.241		3.291585	5		37			5		38		1001	1199		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1427	5.372	1000	1.165		3.291585	8		26			8		28		1001	1201		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7689	5.345	1000	0.897		3.291585	8		17			8		10		1001	1203		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8759	2.957	1000	0.774		3.291585	6		8			6		14		1001	1204		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4212	3.591	1000	1.414		3.291585	6		13			6		8		1001	1206		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6259	6.225	1000	1.505		3.291585	7		35			7		33		1001	1207		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5063	5.629	1000	1.048		3.291585	5		38			5		33		1001	1208		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.6568	6.303	1000	1.194		3.291585	8		45			8		50		1001	1211		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9354	4.612	1000	1.213		3.291585	6		25			6		15		1001	1216		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4371	6.998	1000	2.530		3.291585	6		6			6		3		1001	1218		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6724	5.945	1000	1.477		3.291585	7		9			7		2		1001	1219		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1470	3.863	1000	1.525		3.291585	5		25			5		32		1001	1220		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3919	4.925	1000	2.469		3.291585	6		37			6		41		1001	1221		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9706	4.990	1000	1.583		3.291585	6		32			6		36		1001	1222		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1302	2.753	1000	0.736		3.291585	5		14			5		21		1001	1223		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9148	5.258	1000	0.808		3.291585	6		3			6		2		1001	1224		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7652	4.128	1000	0.840		3.291585	7		12			7		3		1001	1229		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6311	4.476	1000	1.311		3.317788	7		6			7		12		1001	1231		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6162	4.169	1000	1.833		3.317788	5		21			5		17		1001	1232		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8932	4.033	1000	1.806		3.317788	6		25			6		21		1001	1234		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6235	3.545	1000	2.131		3.317788	8		2			8		1		1001	1235		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6745	1.748	1000	0.890		3.317788	7		44			7		43		1001	1236		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2180	5.492	1000	1.189		3.317788	6		23			6		14		1001	1238		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.4782	4.923	1000	1.785		3.317788	7		7			7		7		1001	1242		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3727	3.065	1000	1.528		3.317788	5		33			5		32		1001	1243		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8894	1.085	1000	0.817		3.317788	6		16			6		9		1001	1244		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4955	4.267	1000	1.459		3.317788	7		42			7		40		1001	1245		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.7339	5.226	1000	2.303		3.317788	7		6			7		6		1001	1246		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.3729	2.412	1000	0.947		3.317788	8		20			8		12		1001	1248		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4636	2.404	1000	1.019		3.317788	5		25			5		27		1001	1249		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9525	7.234	1000	1.805		3.317788	7		10			7		11		1001	1250		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6951	4.295	1000	1.013		3.317788	6		5			6		4		1001	1251		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0434	5.883	1000	2.387		3.516383	8		23			8		22		1001	1252		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6827	6.822	1000	1.846		3.516383	7		40			7		48		1001	1254		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8489	5.440	1000	1.747		3.516383	5		47			5		44		1001	1256		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6973	4.970	1000	0.952		3.516383	7		34			7		29		1001	1257		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.7634	3.789	1000	1.507		3.516383	5		32			5		40		1001	1259		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6627	5.328	1000	0.947		3.516383	7		7			7		4		1001	1260		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.4962	3.329	1000	1.076		3.516383	6		13			6		21		1001	1261		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2759	4.572	1000	2.424		3.516383	7		14			7		19		1001	1262		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0410	2.823	1000	1.782		3.516383	7		1			7		10		1001	1263		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8174	5.553	1000	2.476		3.516383	7		11			7		3		1001	1264		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7047	5.307	1000	1.613		3.516383	6		8			6		10		1001	1265		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9735	5.689	1000	2.112		3.516383	7		5			7		1		1001	1266		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.8220	5.138	1000	2.328		3.516383	5		7			5		4		1001	1267		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7105	6.250	1000	2.422		3.516383	7		28			7		29		1001	1269		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9287	2.013	1000	1.510		3.516383	7		30			7		29		1001	1270		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.9574	3.441	1000	1.325		3.649359	8		2			8		1		1001	1272		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3323	4.488	1000	1.216		3.649359	5		10			5		2		1001	1273		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.2338	6.200	1000	2.255		3.649359	7		6			7		5		1001	1275		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.1248	3.909	1000	1.147		3.649359	7		47			7		39		1001	1276		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.2609	1.536	1000	1.181		3.649359	5		41			5		40		1001	1277		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1750	5.604	1000	2.451		3.649359	7		20			7		27		1001	1278		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0229	3.541	1000	1.606		3.649359	7		35			7		28		1001	1279		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5577	5.402	1000	2.459		3.649359	7		28			7		35		1001	1280		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8040	5.468	1000	1.204		3.649359	7		3			7		1		1001	1281		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7771	3.694	1000	2.191		3.649359	5		27			5		32		1001	1283		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8723	6.037	1000	1.570		3.741844	6		39			6		30		1001	1284		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6163	4.344	1000	2.188		3.741844	5		6			5		7		1001	1288		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7788	4.218	1000	0.794		3.741844	6		7			6		13		1001	1290		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9862	4.894	1000	0.949		3.741844	5		12			5		18		1001	1291		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4549	5.505	1000	1.793		3.741844	6		2			6		2		1001	1292		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1662	2.794	1000	0.811		3.741844	6		15			6		12		1001	1293		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2897	2.318	1000	1.009		3.741844	7		35			7		31		1001	1294		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.0138	3.119	1000	0.993		3.741844	6		5			6		13		1001	1297		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2621	4.030	1000	0.942		3.741844	8		14			8		21		1001	1298		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4215	3.078	1000	1.790		3.741844	6		36			6		38		1001	1302		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.6731	5.774	1000	1.262		3.741844	7		20			7		28		1001	1304		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.3810	4.001	1000	1.232		3.741844	7		1			7		1		1001	1306		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4211	3.338	1000	1.693		3.741844	7		43			7		33		1001	1307		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2724	6.874	1000	2.129		3.741844	7		10			7		5		1001	1308		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.3586	6.386	1000	2.443		3.741844	5		37			5		39		1001	1309		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4778	3.468	1000	1.715		3.741844	7		37			7		39		1001	1310		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6991	5.635	1000	1.902		3.741844	6		20			6		15		1001	1312		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1256	3.330	1000	1.056		3.741844	5		23			5		24		1001	1313		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5018	6.153	1000	1.870		3.741844	7		30			7		22		1001	1314		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1817	4.706	1000	0.784		3.741844	7		48			7		43		1001	1315		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.5247	4.053	1000	2.168		3.741844	6		12			6		13		1001	1316		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7266	7.233	1000	1.746		3.741844	8		42			8		48		1001	1317		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.2502	6.710	1000	2.131		3.741844	6		32			6		33		1001	1318		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3863	6.269	1000	1.600		3.741844	8		30			8		33		1001	1319		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6133	2.713	1000	0.922		3.741844	5		22			5		28		1001	1320		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.2648	3.750	1000	1.749		3.741844	7		30			7		29		1001	1321		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5052	7.282	1000	2.026		3.741844	5		3			5		9		1001	1322		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4556	5.504	1000	2.068		3.741844	7		46			7		42		1001	1324		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6292	5.305	1000	1.380		3.741844	6		14			6		12		1001	1326		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6555	3.805	1000	1.174		3.883982	6		36			6		40		1001	1327		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.7074	2.813	1000	1.309		3.883982	8		40			8		47		1001	1328		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4293	4.314	1000	1.036		3.883982	8		26			8		21		1001	1329		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2187	5.419	1000	1.668		3.883982	6		16			6		21		1001	1330		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1965	5.763	1000	2.255		3.883982	8		19			8		12		1001	1331		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4346	3.727	1000	2.135		3.883982	8		32			8		24		1001	1332		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7952	6.165	1000	1.519		3.883982	7		22			7		17		1001	1335		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.2025	2.532	1000	1.481		3.883982	5		46			5		43		1001	1336		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.9610	3.042	1000	1.526		3.883982	7		23			7		17		1001	1337		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9723	4.621	1000	2.316		3.883982	8		29			8		28		1001	1338		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9686	2.882	1000	0.899		3.883982	7		42			7		34		1001	1340		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.8239	4.136	1000	1.663		3.883982	7		39			7		31		1001	1343		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4856	4.209	1000	0.725		3.883982	8		38			8		30		1001	1344		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2609	3.699	1000	2.203		3.883982	5		9			5		6		1001	1345		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.0248	4.787	1000	1.294		3.883982	6		45			6		50		1001	1346		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9684	3.223	1000	1.907		3.883982	8		28			8		19		1001	1347		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.0378	1.438	1000	0.734		3.883982	5		20			5		27		1001	1348		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3371	2.631	1000	2.032		3.883982	8		28			8		29		1001	1350		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7997	5.361	1000	1.156		3.883982	5		22			5		18		1001	1351		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1368	3.271	1000	0.768		3.883982	7		2			7		1		1001	1352		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.4703	4.045	1000	1.066		3.883982	7		14			7		5		1001	1355		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9458	4.291	1000	1.943		3.883982	5		37			5		45		1001	1356		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.3297	2.253	1000	1.019		3.883982	5		37			5		32		1001	1357		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6841	5.276	1000	1.353		3.883982	8		1			8		2		1001	1359		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6099	3.095	1000	0.995		3.883982	7		6			7		1		1001	1361		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6181	2.781	1000	1.075		3.883982	7		27			7		34		1001	1362		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.8566	3.932	1000	1.127		3.883982	6		20			6		16		1001	1363		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.2097	4.750	1000	1.789		3.883982	6		48			6		50		1001	1364		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1003	2.692	1000	1.581		3.883982	6		38			6		32		1001	1365		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5222	2.690	1000	1.393		3.883982	6		44			6		41		1001	1367		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2030	5.257	1000	0.759		3.883982	6		34			6		43		1001	1370		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.8805	3.816	1000	0.804		3.883982	6		19			6		15		1001	1371		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.3104	7.650	1000	2.367		3.883982	5		6			5		14		1001	1372		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.2413	4.100	1000	1.177		3.883982	5		26			5		21		1001	1373		0				1			5			20			0.0000		154.000		5.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
