
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
f 0 126.999888 ; Evento f fittizio per definire la durata totale
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


i "time" 0 126.999888
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 154.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1654	8.694	1000	3.221		0.001013	5		2			5		3		1001	115		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1654	5.635	1000	3.506		0.001013	5		1			5		1		1001	117		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1654	5.786	1000	3.821		0.001013	7		6			7		7		1001	118		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1654	3.389	1000	1.638		0.001013	8		7			8		5		1001	119		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1654	7.082	1000	1.669		0.001013	7		8			7		4		1001	121		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2244	2.859	1000	1.546		0.001347	6		8			6		7		1001	122		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2244	4.021	1000	0.944		0.001347	7		5			7		6		1001	124		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2244	8.821	1000	3.872		0.001347	6		1			6		2		1001	128		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6935	4.516	1000	2.136		0.005690	7		3			7		3		1001	129		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6935	7.456	1000	3.776		0.005690	6		8			6		8		1001	131		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6935	6.262	1000	3.107		0.005690	7		4			7		6		1001	132		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8724	2.680	1000	1.939		0.008137	6		6			6		5		1001	133		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8724	5.637	1000	2.059		0.008137	8		7			8		3		1001	137		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8724	5.920	1000	0.824		0.008137	6		7			6		8		1001	138		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8724	2.740	1000	1.293		0.008137	5		8			5		8		1001	139		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0802	8.872	1000	2.698		0.011527	7		5			7		1		1001	140		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0802	7.467	1000	3.289		0.011527	8		9			8		9		1001	141		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0802	5.924	1000	3.086		0.011527	6		8			6		7		1001	143		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0802	7.972	1000	3.619		0.011527	5		1			5		1		1001	144		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0802	4.728	1000	1.502		0.011527	6		8			6		9		1001	145		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	8.041	1000	2.714		0.014264	6		10			6		11		1001	149		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	3.350	1000	1.742		0.014264	6		7			6		8		1001	150		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	5.866	1000	3.183		0.014264	6		9			6		9		1001	151		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	5.750	1000	3.874		0.014264	6		7			6		4		1001	152		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	4.617	1000	3.673		0.014264	7		3			7		5		1001	154		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	6.208	1000	1.348		0.014264	7		8			7		10		1001	156		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	4.897	1000	3.193		0.014264	7		1			7		1		1001	157		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2263	3.174	1000	1.594		0.014264	5		9			5		12		1001	158		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4141	5.557	1000	3.330		0.018208	6		3			6		1		1001	159		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4141	5.034	1000	2.087		0.018208	6		3			6		2		1001	160		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4141	6.017	1000	0.926		0.018208	6		7			6		5		1001	161		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4141	5.760	1000	3.140		0.018208	7		1			7		1		1001	162		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4141	4.988	1000	0.935		0.018208	5		5			5		8		1001	163		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7414	4.498	1000	2.862		0.026232	7		2			7		2		1001	167		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7414	4.747	1000	0.967		0.026232	7		3			7		3		1001	168		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7414	7.532	1000	2.363		0.026232	8		5			8		1		1001	169		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7414	1.896	1000	1.371		0.026232	7		11			7		7		1001	170		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	8.964	1000	3.597		0.034722	8		3			8		1		1001	173		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	6.769	1000	1.579		0.034722	6		1			6		1		1001	174		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	9.091	1000	2.629		0.034722	6		10			6		6		1001	176		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	3.521	1000	0.800		0.034722	7		5			7		4		1001	177		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	4.095	1000	1.594		0.034722	5		2			5		1		1001	178		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	5.901	1000	2.454		0.034722	8		11			8		9		1001	179		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	3.248	1000	2.187		0.034722	7		11			7		9		1001	180		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	4.060	1000	2.496		0.034722	5		1			5		1		1001	181		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	5.977	1000	1.288		0.034722	6		10			6		8		1001	182		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.0365	4.947	1000	2.325		0.034722	8		11			8		8		1001	183		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	9.350	1000	3.623		0.068912	7		1			7		3		1001	184		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	8.782	1000	3.091		0.068912	6		4			6		1		1001	185		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	6.350	1000	1.078		0.068912	8		12			8		11		1001	187		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	5.427	1000	2.711		0.068912	7		2			7		1		1001	189		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	4.841	1000	3.759		0.068912	6		13			6		13		1001	190		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	4.249	1000	1.594		0.068912	7		1			7		1		1001	192		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	4.661	1000	2.712		0.068912	6		12			6		15		1001	193		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	4.161	1000	1.759		0.068912	7		6			7		6		1001	194		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9590	3.773	1000	2.842		0.068912	7		10			7		7		1001	195		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	6.055	1000	2.486		0.170183	8		8			8		4		1001	196		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	6.878	1000	1.185		0.170183	8		7			8		7		1001	202		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	6.367	1000	1.663		0.170183	7		6			7		1		1001	205		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	2.971	1000	1.464		0.170183	6		2			6		1		1001	207		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	5.792	1000	2.957		0.170183	6		15			6		11		1001	208		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	8.708	1000	2.862		0.170183	6		13			6		11		1001	209		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	2.362	1000	1.039		0.170183	5		10			5		14		1001	211		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	7.902	1000	1.938		0.170183	7		8			7		5		1001	212		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	8.231	1000	3.193		0.170183	8		1			8		1		1001	213		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	4.955	1000	0.808		0.170183	6		7			6		7		1001	218		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	4.905	1000	1.386		0.170183	7		12			7		9		1001	219		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	6.241	1000	2.382		0.170183	5		3			5		2		1001	220		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7757	3.240	1000	1.761		0.170183	5		10			5		8		1001	221		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	6.882	1000	3.317		0.174993	5		6			5		4		1001	222		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	5.251	1000	0.938		0.174993	8		12			8		8		1001	223		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	5.080	1000	2.199		0.174993	7		2			7		1		1001	224		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	3.584	1000	2.606		0.174993	7		6			7		10		1001	225		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	6.039	1000	1.621		0.174993	5		7			5		7		1001	227		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	8.095	1000	2.615		0.174993	7		9			7		6		1001	228		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	7.635	1000	2.379		0.174993	7		1			7		1		1001	229		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	9.357	1000	3.150		0.174993	5		12			5		15		1001	231		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	5.925	1000	1.705		0.174993	7		1			7		1		1001	232		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	6.171	1000	3.060		0.174993	7		9			7		4		1001	235		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	4.858	1000	2.335		0.174993	6		7			6		7		1001	236		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	5.791	1000	1.611		0.174993	7		2			7		1		1001	238		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8458	6.188	1000	1.120		0.174993	7		16			7		13		1001	239		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	6.693	1000	2.658		0.220779	6		3			6		7		1001	240		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	8.030	1000	2.784		0.220779	7		12			7		16		1001	241		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	6.124	1000	2.871		0.220779	6		8			6		7		1001	243		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	9.830	1000	3.466		0.220779	6		8			6		10		1001	244		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	8.203	1000	3.615		0.220779	6		11			6		10		1001	246		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	8.131	1000	3.319		0.220779	6		11			6		10		1001	247		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	5.115	1000	2.688		0.220779	7		13			7		11		1001	248		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	4.992	1000	2.719		0.220779	7		7			7		6		1001	249		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	7.169	1000	1.612		0.220779	5		7			5		4		1001	250		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4701	1.983	1000	1.082		0.220779	7		7			7		6		1001	253		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	6.035	1000	1.043		0.224735	5		1			5		1		1001	254		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	5.573	1000	3.195		0.224735	6		10			6		6		1001	257		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	9.487	1000	2.871		0.224735	6		2			6		2		1001	258		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	4.721	1000	3.363		0.224735	6		5			6		7		1001	260		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	4.304	1000	0.984		0.224735	8		1			8		1		1001	261		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	4.000	1000	2.360		0.224735	6		5			6		1		1001	262		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	7.893	1000	2.378		0.224735	5		5			5		7		1001	263		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	5.535	1000	3.178		0.224735	7		12			7		13		1001	265		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	8.361	1000	3.607		0.224735	8		6			8		8		1001	266		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.5209	8.195	1000	3.508		0.224735	8		11			8		12		1001	268		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	4.988	1000	2.351		0.299177	7		2			7		1		1001	269		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	6.088	1000	1.895		0.299177	6		11			6		9		1001	270		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	5.489	1000	2.239		0.299177	6		15			6		11		1001	271		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	5.591	1000	2.447		0.299177	6		14			6		11		1001	272		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	7.303	1000	2.703		0.299177	7		18			7		17		1001	273		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	4.728	1000	3.347		0.299177	7		4			7		8		1001	274		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	5.041	1000	1.398		0.299177	7		2			7		4		1001	275		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.4038	7.783	1000	2.239		0.299177	6		1			6		4		1001	278		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	6.508	1000	1.695		0.314835	7		6			7		1		1001	279		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	5.656	1000	1.293		0.314835	6		6			6		10		1001	280		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	7.287	1000	2.837		0.314835	6		13			6		10		1001	281		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	5.159	1000	1.335		0.314835	5		10			5		9		1001	283		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	3.650	1000	1.744		0.314835	7		11			7		6		1001	284		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	4.705	1000	1.222		0.314835	7		9			7		6		1001	285		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	5.626	1000	2.635		0.314835	7		8			7		10		1001	286		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	4.698	1000	3.146		0.314835	8		10			8		7		1001	287		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	5.748	1000	3.409		0.314835	7		14			7		14		1001	288		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	3.579	1000	2.116		0.314835	8		10			8		14		1001	289		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	8.156	1000	2.199		0.314835	7		4			7		6		1001	291		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	2.073	1000	1.258		0.314835	6		18			6		19		1001	293		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	6.436	1000	1.186		0.314835	7		3			7		1		1001	294		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	2.049	1000	0.944		0.314835	7		16			7		12		1001	295		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5749	2.129	1000	0.959		0.314835	8		6			8		3		1001	296		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	1.822	1000	1.344		0.448144	5		1			5		1		1001	297		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	5.789	1000	3.130		0.448144	7		16			7		21		1001	301		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	5.552	1000	1.644		0.448144	8		6			8		5		1001	303		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	6.326	1000	1.443		0.448144	8		17			8		20		1001	304		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	8.263	1000	3.444		0.448144	6		13			6		10		1001	305		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8868	5.790	1000	1.808		0.448144	7		10			7		10		1001	308		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	5.628	1000	2.378		0.468201	8		15			8		19		1001	310		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	6.033	1000	1.735		0.468201	6		4			6		7		1001	311		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	5.670	1000	1.514		0.468201	6		15			6		10		1001	313		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	6.911	1000	3.331		0.468201	6		15			6		14		1001	314		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	6.259	1000	0.809		0.468201	7		9			7		5		1001	315		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	5.632	1000	0.956		0.468201	7		21			7		22		1001	316		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	7.088	1000	1.462		0.468201	6		10			6		5		1001	319		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	2.621	1000	1.475		0.468201	8		13			8		8		1001	320		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	9.388	1000	3.259		0.468201	7		3			7		4		1001	321		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	3.612	1000	1.514		0.468201	5		14			5		9		1001	322		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	4.672	1000	2.882		0.468201	6		2			6		2		1001	323		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0663	6.688	1000	1.160		0.468201	7		3			7		7		1001	324		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	7.003	1000	1.700		0.485485	6		21			6		25		1001	326		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	4.539	1000	1.421		0.485485	7		22			7		17		1001	330		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	6.277	1000	0.963		0.485485	8		22			8		27		1001	331		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	9.929	1000	3.239		0.485485	7		13			7		16		1001	333		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	5.042	1000	1.742		0.485485	6		6			6		7		1001	335		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	3.921	1000	2.111		0.485485	6		17			6		16		1001	338		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	7.868	1000	3.099		0.485485	7		10			7		12		1001	339		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	3.626	1000	1.656		0.485485	7		10			7		6		1001	342		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	5.403	1000	0.923		0.485485	6		20			6		20		1001	343		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	4.143	1000	2.486		0.485485	8		17			8		20		1001	345		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	4.785	1000	1.309		0.485485	5		21			5		24		1001	346		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	5.963	1000	0.994		0.485485	8		4			8		2		1001	347		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	3.543	1000	1.876		0.485485	6		7			6		9		1001	349		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	8.053	1000	1.971		0.485485	8		9			8		13		1001	351		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	6.342	1000	1.187		0.485485	6		19			6		18		1001	352		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2178	5.006	1000	1.742		0.485485	6		14			6		11		1001	353		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	5.465	1000	1.417		0.520669	5		12			5		12		1001	354		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	6.615	1000	1.191		0.520669	6		14			6		10		1001	356		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	6.522	1000	1.842		0.520669	8		4			8		8		1001	357		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	2.019	1000	1.168		0.520669	7		22			7		23		1001	358		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	5.713	1000	1.650		0.520669	8		4			8		5		1001	359		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	4.631	1000	2.669		0.520669	6		2			6		2		1001	361		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	3.797	1000	2.786		0.520669	7		11			7		13		1001	362		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	3.536	1000	1.742		0.520669	7		20			7		19		1001	363		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	8.290	1000	2.563		0.520669	8		10			8		14		1001	364		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5182	7.079	1000	1.558		0.520669	5		22			5		27		1001	365		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	1.344	1000	0.976		0.533260	6		8			6		4		1001	366		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	5.642	1000	1.963		0.533260	6		14			6		17		1001	369		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	5.908	1000	3.069		0.533260	8		14			8		16		1001	371		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	5.348	1000	1.321		0.533260	7		20			7		19		1001	372		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	4.785	1000	0.982		0.533260	6		23			6		25		1001	373		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	5.529	1000	1.078		0.533260	6		7			6		5		1001	374		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	7.895	1000	2.805		0.533260	5		21			5		25		1001	376		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	6.080	1000	2.042		0.533260	5		6			5		4		1001	377		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	5.278	1000	2.940		0.533260	7		2			7		3		1001	378		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	4.007	1000	1.951		0.533260	6		16			6		16		1001	379		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	2.639	1000	1.979		0.533260	8		2			8		1		1001	380		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	1.990	1000	0.935		0.533260	6		9			6		9		1001	381		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	4.765	1000	2.094		0.533260	7		8			7		4		1001	382		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	2.296	1000	1.006		0.533260	5		15			5		16		1001	383		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6232	3.856	1000	1.728		0.533260	5		2			5		1		1001	384		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	5.136	1000	2.000		0.638328	6		17			6		13		1001	385		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	3.297	1000	0.988		0.638328	6		4			6		3		1001	386		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	4.386	1000	0.889		0.638328	6		20			6		18		1001	388		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	4.392	1000	2.233		0.638328	8		22			8		27		1001	389		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	5.501	1000	1.697		0.638328	6		11			6		16		1001	391		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	7.896	1000	3.058		0.638328	6		6			6		10		1001	392		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	7.791	1000	2.673		0.638328	7		8			7		7		1001	393		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	1.471	1000	0.953		0.638328	8		13			8		17		1001	397		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	8.251	1000	2.523		0.638328	6		2			6		5		1001	398		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4553	2.691	1000	0.799		0.638328	7		11			7		6		1001	399		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5191	5.105	1000	1.310		0.646772	6		6			6		10		1001	401		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5191	5.297	1000	1.713		0.646772	7		15			7		13		1001	402		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5191	3.797	1000	1.934		0.646772	5		19			5		23		1001	403		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5191	3.241	1000	1.191		0.646772	6		11			6		16		1001	404		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.5191	7.231	1000	2.070		0.646772	5		18			5		20		1001	405		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	5.451	1000	3.178		0.828592	6		20			6		16		1001	406		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	4.303	1000	2.721		0.828592	7		15			7		9		1001	407		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	4.939	1000	3.066		0.828592	6		26			6		20		1001	409		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	4.726	1000	2.386		0.828592	6		11			6		12		1001	410		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	7.542	1000	3.218		0.828592	7		23			7		27		1001	411		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	8.853	1000	2.535		0.828592	6		6			6		7		1001	412		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	5.679	1000	2.034		0.828592	8		4			8		9		1001	413		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	1.972	1000	0.789		0.828592	7		4			7		1		1001	414		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8033	7.290	1000	1.950		0.828592	7		12			7		13		1001	417		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	5.663	1000	1.931		1.012734	5		26			5		29		1001	418		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	7.040	1000	2.472		1.012734	8		20			8		24		1001	419		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	4.520	1000	1.039		1.012734	5		28			5		21		1001	421		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	6.068	1000	1.617		1.012734	6		8			6		2		1001	422		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	1.470	1000	0.911		1.012734	6		2			6		5		1001	423		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	3.319	1000	1.321		1.012734	7		1			7		4		1001	424		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	4.730	1000	2.251		1.012734	6		2			6		1		1001	425		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	5.487	1000	0.862		1.012734	7		24			7		27		1001	426		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	4.786	1000	2.975		1.012734	6		2			6		3		1001	428		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9668	4.729	1000	1.932		1.012734	7		23			7		24		1001	431		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	5.023	1000	2.219		1.046487	6		24			6		29		1001	433		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.131	1000	2.027		1.046487	6		12			6		7		1001	434		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	5.423	1000	1.117		1.046487	6		13			6		11		1001	436		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.985	1000	1.932		1.046487	6		26			6		31		1001	437		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	3.660	1000	1.784		1.046487	6		22			6		20		1001	438		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	1.711	1000	0.939		1.046487	8		16			8		12		1001	443		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.677	1000	1.810		1.046487	8		25			8		18		1001	444		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	3.519	1000	1.163		1.046487	6		3			6		1		1001	445		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	3.607	1000	2.153		1.046487	6		25			6		22		1001	448		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	5.776	1000	1.646		1.046487	7		10			7		12		1001	449		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.546	1000	2.263		1.046487	5		21			5		15		1001	450		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	5.745	1000	1.091		1.046487	8		8			8		13		1001	451		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.767	1000	2.701		1.046487	7		21			7		19		1001	453		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	4.559	1000	1.729		1.046487	7		16			7		15		1001	454		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	4.175	1000	0.789		1.046487	6		25			6		30		1001	456		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	4.659	1000	1.211		1.046487	8		26			8		21		1001	457		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	2.312	1000	0.856		1.046487	6		14			6		17		1001	458		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	6.020	1000	1.919		1.046487	6		23			6		18		1001	459		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1682	3.916	1000	3.102		1.046487	5		19			5		15		1001	462		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	6.828	1000	2.350		1.104432	6		12			6		11		1001	464		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	5.719	1000	1.369		1.104432	7		9			7		15		1001	465		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	5.844	1000	1.412		1.104432	8		3			8		6		1001	467		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	7.867	1000	1.893		1.104432	8		19			8		16		1001	470		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	4.523	1000	1.494		1.104432	5		2			5		3		1001	472		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	2.305	1000	1.369		1.104432	5		21			5		23		1001	476		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	4.903	1000	2.538		1.104432	7		21			7		16		1001	479		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	9.790	1000	3.028		1.104432	7		1			7		1		1001	482		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	6.940	1000	2.917		1.104432	7		10			7		10		1001	483		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	6.894	1000	2.063		1.104432	6		10			6		7		1001	484		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	3.180	1000	0.778		1.104432	7		7			7		3		1001	485		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	3.802	1000	2.016		1.104432	8		13			8		11		1001	486		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	9.811	1000	3.068		1.104432	8		23			8		20		1001	489		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	5.671	1000	1.332		1.104432	6		1			6		1		1001	490		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	2.998	1000	1.086		1.104432	8		11			8		16		1001	491		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	5.293	1000	2.675		1.104432	5		4			5		1		1001	492		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	4.455	1000	0.890		1.104432	8		5			8		11		1001	494		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	4.805	1000	2.554		1.104432	5		22			5		16		1001	495		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	3.765	1000	2.405		1.104432	7		9			7		4		1001	497		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5066	5.404	1000	1.666		1.104432	6		11			6		9		1001	500		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	5.805	1000	2.800		1.321701	7		30			7		26		1001	501		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	4.340	1000	2.467		1.321701	6		19			6		24		1001	502		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	3.955	1000	1.963		1.321701	8		14			8		20		1001	503		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	6.604	1000	2.194		1.321701	7		10			7		4		1001	506		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	5.214	1000	1.845		1.321701	6		2			6		3		1001	507		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	8.316	1000	2.992		1.321701	7		23			7		19		1001	508		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	6.992	1000	2.602		1.321701	8		3			8		1		1001	509		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	6.120	1000	2.307		1.321701	8		3			8		9		1001	510		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	5.058	1000	0.766		1.321701	6		24			6		17		1001	511		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	2.267	1000	1.325		1.321701	6		16			6		12		1001	512		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	3.904	1000	2.154		1.321701	6		3			6		9		1001	513		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	5.860	1000	1.132		1.321701	7		3			7		1		1001	517		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7022	4.280	1000	1.994		1.321701	6		10			6		3		1001	519		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	2.806	1000	1.595		1.378279	7		14			7		7		1001	520		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	4.956	1000	1.426		1.378279	6		22			6		18		1001	521		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	4.400	1000	2.132		1.378279	8		19			8		13		1001	522		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	1.912	1000	0.955		1.378279	5		22			5		26		1001	524		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.527	1000	2.410		1.378279	8		19			8		19		1001	525		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	5.113	1000	2.025		1.378279	5		2			5		7		1001	526		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	1.778	1000	1.196		1.378279	5		10			5		7		1001	528		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	5.245	1000	1.832		1.378279	8		13			8		9		1001	529		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	1.734	1000	0.820		1.378279	5		5			5		4		1001	530		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	4.646	1000	2.307		1.378279	7		26			7		32		1001	532		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.575	1000	2.023		1.378279	6		5			6		6		1001	533		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	5.143	1000	2.722		1.378279	7		7			7		2		1001	534		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.404	1000	2.207		1.378279	7		6			7		1		1001	536		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.095	1000	2.345		1.378279	6		31			6		31		1001	537		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	4.775	1000	0.783		1.378279	7		17			7		23		1001	540		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.645	1000	1.665		1.378279	7		24			7		26		1001	541		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	8.001	1000	2.496		1.378279	7		5			7		6		1001	543		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	5.632	1000	1.820		1.378279	7		3			7		8		1001	546		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	4.679	1000	2.422		1.378279	5		12			5		9		1001	547		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	2.747	1000	1.850		1.378279	8		15			8		12		1001	548		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	3.784	1000	1.184		1.378279	5		14			5		17		1001	549		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	5.573	1000	2.606		1.378279	5		11			5		13		1001	550		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	2.385	1000	0.923		1.378279	7		9			7		10		1001	553		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	6.498	1000	1.875		1.378279	5		21			5		16		1001	554		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9971	8.362	1000	3.006		1.378279	8		3			8		5		1001	555		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	6.702	1000	1.862		1.502712	6		10			6		3		1001	556		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	8.648	1000	2.587		1.502712	6		27			6		25		1001	557		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	2.853	1000	1.280		1.502712	7		1			7		7		1001	558		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	4.658	1000	2.716		1.502712	7		17			7		17		1001	559		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	3.489	1000	2.747		1.502712	8		30			8		34		1001	560		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	7.495	1000	2.916		1.502712	5		25			5		19		1001	562		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	7.512	1000	2.627		1.502712	7		27			7		27		1001	563		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	4.468	1000	1.134		1.502712	7		8			7		13		1001	564		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	4.698	1000	0.893		1.502712	7		15			7		16		1001	565		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	2.343	1000	0.908		1.502712	5		12			5		6		1001	567		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	5.246	1000	2.791		1.502712	6		19			6		21		1001	568		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	1.812	1000	0.982		1.502712	7		23			7		26		1001	570		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6250	5.554	1000	2.313		1.502712	7		20			7		14		1001	571		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	3.949	1000	2.796		1.522405	7		23			7		22		1001	572		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	4.200	1000	1.917		1.522405	6		27			6		30		1001	574		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	2.644	1000	1.344		1.522405	8		15			8		20		1001	576		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	4.575	1000	1.628		1.522405	8		3			8		7		1001	577		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	5.379	1000	1.010		1.522405	7		2			7		1		1001	578		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	5.475	1000	1.832		1.522405	6		1			6		1		1001	579		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	3.969	1000	1.644		1.522405	7		14			7		8		1001	580		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	5.492	1000	2.514		1.522405	8		19			8		14		1001	582		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7220	1.797	1000	1.243		1.522405	5		13			5		5		1001	583		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.845	1000	2.450		2.144047	8		10			8		4		1001	584		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	1.835	1000	1.189		2.144047	7		14			7		13		1001	590		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.107	1000	2.406		2.144047	6		6			6		1		1001	592		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	4.877	1000	1.212		2.144047	8		28			8		24		1001	593		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.020	1000	1.861		2.144047	8		14			8		6		1001	598		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	4.118	1000	1.099		2.144047	6		33			6		38		1001	599		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.891	1000	2.088		2.144047	6		36			6		41		1001	604		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	5.915	1000	2.250		2.144047	6		23			6		28		1001	605		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	3.690	1000	0.756		2.144047	5		16			5		23		1001	606		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	3.959	1000	1.875		2.144047	6		18			6		15		1001	607		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	4.986	1000	2.228		2.144047	6		15			6		15		1001	608		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	7.597	1000	1.738		2.144047	7		3			7		1		1001	610		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	3.703	1000	2.720		2.144047	8		22			8		23		1001	611		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	5.972	1000	2.741		2.144047	7		21			7		13		1001	613		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	3.198	1000	1.568		2.144047	6		26			6		33		1001	614		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	4.890	1000	1.387		2.144047	7		28			7		27		1001	615		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.971	1000	1.363		2.144047	5		14			5		15		1001	616		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.886	1000	2.036		2.144047	5		29			5		28		1001	617		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	3.245	1000	0.948		2.144047	5		4			5		1		1001	618		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	7.899	1000	2.356		2.144047	8		23			8		18		1001	619		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	4.518	1000	1.480		2.144047	7		25			7		32		1001	620		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	6.967	1000	2.097		2.144047	8		35			8		35		1001	622		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5121	7.597	1000	2.701		2.144047	5		5			5		7		1001	623		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	4.469	1000	2.219		2.352674	8		16			8		9		1001	625		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	1.315	1000	0.872		2.352674	6		8			6		6		1001	626		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.143	1000	1.502		2.352674	7		33			7		34		1001	627		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.434	1000	2.364		2.352674	6		20			6		22		1001	628		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	6.088	1000	1.789		2.352674	7		1			7		7		1001	629		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	4.397	1000	1.562		2.352674	5		40			5		36		1001	630		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.798	1000	1.547		2.352674	6		26			6		18		1001	633		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	7.448	1000	1.684		2.352674	6		36			6		38		1001	636		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	6.645	1000	2.520		2.352674	5		34			5		30		1001	639		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	6.243	1000	2.372		2.352674	7		3			7		1		1001	642		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	6.571	1000	1.607		2.352674	6		11			6		5		1001	648		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.163	1000	1.917		2.352674	8		20			8		20		1001	649		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	2.498	1000	1.615		2.352674	8		23			8		30		1001	651		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	3.295	1000	2.036		2.352674	6		27			6		28		1001	652		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	4.615	1000	0.904		2.352674	7		25			7		20		1001	653		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	2.114	1000	1.036		2.352674	8		15			8		12		1001	654		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.650	1000	1.202		2.352674	7		35			7		29		1001	655		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3548	5.445	1000	2.435		2.352674	6		38			6		40		1001	656		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.812	1000	2.049		2.452740	5		20			5		18		1001	657		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	5.039	1000	2.480		2.452740	8		25			8		21		1001	658		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.218	1000	0.765		2.452740	6		12			6		19		1001	659		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	5.517	1000	1.209		2.452740	7		20			7		19		1001	661		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	5.756	1000	1.708		2.452740	6		16			6		11		1001	664		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	2.114	1000	1.550		2.452740	6		4			6		9		1001	665		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	5.289	1000	2.300		2.452740	7		39			7		38		1001	666		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	8.126	1000	2.673		2.452740	8		38			8		40		1001	667		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	6.399	1000	2.128		2.452740	5		15			5		17		1001	668		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.067	1000	1.281		2.452740	8		26			8		19		1001	673		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.869	1000	0.803		2.452740	6		15			6		19		1001	676		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	2.427	1000	0.800		2.452740	6		11			6		16		1001	677		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	2.537	1000	0.773		2.452740	6		4			6		1		1001	680		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	6.166	1000	1.705		2.452740	8		19			8		25		1001	682		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	3.718	1000	1.907		2.452740	7		25			7		18		1001	683		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	7.171	1000	1.930		2.452740	6		25			6		23		1001	684		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.405	1000	2.404		2.452740	8		10			8		8		1001	685		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	1.944	1000	0.991		2.452740	5		17			5		18		1001	686		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	3.887	1000	2.208		2.452740	8		38			8		33		1001	687		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.574	1000	0.990		2.452740	7		23			7		18		1001	688		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	5.363	1000	2.029		2.452740	7		9			7		15		1001	689		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	3.817	1000	1.352		2.452740	8		26			8		18		1001	691		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7457	4.295	1000	2.719		2.452740	5		29			5		22		1001	693		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	5.860	1000	1.703		2.472085	5		21			5		23		1001	694		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	6.294	1000	1.960		2.472085	7		5			7		1		1001	696		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	7.223	1000	2.139		2.472085	7		18			7		16		1001	698		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	6.674	1000	1.970		2.472085	7		18			7		14		1001	700		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	8.319	1000	2.340		2.472085	7		6			7		8		1001	701		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	5.373	1000	1.562		2.472085	5		21			5		19		1001	702		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	7.093	1000	1.903		2.472085	6		13			6		11		1001	703		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	2.815	1000	1.186		2.472085	8		7			8		13		1001	704		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	3.427	1000	0.758		2.472085	7		27			7		22		1001	705		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	2.740	1000	1.701		2.472085	5		22			5		19		1001	706		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	7.116	1000	2.710		2.472085	6		7			6		6		1001	707		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	3.884	1000	1.329		2.472085	7		31			7		39		1001	708		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	7.132	1000	2.249		2.472085	5		16			5		22		1001	710		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	5.496	1000	2.083		2.472085	7		11			7		6		1001	711		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	2.564	1000	0.934		2.472085	6		35			6		40		1001	712		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	6.676	1000	1.296		2.472085	6		22			6		18		1001	713		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	4.831	1000	2.671		2.472085	5		26			5		26		1001	714		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8203	3.339	1000	2.437		2.472085	8		9			8		1		1001	716		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	5.873	1000	1.529		2.783872	7		28			7		21		1001	717		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	5.694	1000	0.987		2.783872	7		29			7		21		1001	718		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	4.296	1000	2.132		2.783872	7		25			7		16		1001	719		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	5.528	1000	1.303		2.783872	8		12			8		9		1001	721		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	4.407	1000	1.824		2.783872	7		36			7		41		1001	723		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	3.817	1000	1.344		2.783872	5		24			5		15		1001	726		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	7.132	1000	2.449		2.783872	6		26			6		33		1001	727		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	5.398	1000	2.508		2.783872	8		5			8		1		1001	731		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	5.937	1000	2.088		2.783872	7		37			7		41		1001	735		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	3.386	1000	1.320		2.783872	7		9			7		6		1001	736		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	7.486	1000	2.597		2.783872	5		8			5		8		1001	738		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9854	6.034	1000	1.491		2.783872	7		18			7		11		1001	739		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	3.485	1000	1.835		2.839330	5		1			5		7		1001	740		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	2.650	1000	1.848		2.839330	8		33			8		37		1001	741		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	6.975	1000	2.321		2.839330	6		30			6		35		1001	743		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	3.392	1000	0.748		2.839330	5		4			5		1		1001	746		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	5.364	1000	1.078		2.839330	6		12			6		17		1001	747		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	3.699	1000	1.529		2.839330	7		22			7		19		1001	748		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	7.009	1000	1.460		2.839330	6		39			6		37		1001	749		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	5.667	1000	1.300		2.839330	5		2			5		1		1001	753		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	4.298	1000	1.782		2.839330	6		4			6		6		1001	754		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	6.232	1000	2.358		2.839330	7		40			7		47		1001	755		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	5.147	1000	0.793		2.839330	6		38			6		31		1001	756		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	4.656	1000	0.944		2.839330	8		4			8		9		1001	757		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1856	6.690	1000	1.466		2.839330	7		43			7		50		1001	758		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	5.084	1000	1.661		2.853296	5		16			5		7		1001	760		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	4.844	1000	1.390		2.853296	6		9			6		7		1001	761		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	2.542	1000	0.974		2.853296	7		22			7		18		1001	762		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	1.782	1000	0.788		2.853296	7		14			7		11		1001	763		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	4.448	1000	1.829		2.853296	8		25			8		19		1001	766		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	2.881	1000	1.057		2.853296	7		10			7		13		1001	768		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	3.476	1000	1.216		2.853296	6		42			6		46		1001	769		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	6.575	1000	1.359		2.853296	5		28			5		26		1001	770		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	5.357	1000	0.804		2.853296	6		29			6		26		1001	771		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	5.288	1000	2.561		2.853296	7		41			7		42		1001	774		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	7.168	1000	2.516		2.853296	6		16			6		22		1001	776		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	3.008	1000	0.967		2.853296	7		32			7		36		1001	778		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2358	4.499	1000	0.815		2.853296	5		10			5		14		1001	779		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	4.439	1000	1.198		2.943507	6		17			6		13		1001	781		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	3.724	1000	1.011		2.943507	7		32			7		36		1001	782		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	3.799	1000	2.265		2.943507	7		15			7		6		1001	785		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	3.783	1000	1.535		2.943507	7		8			7		9		1001	786		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	4.345	1000	2.570		2.943507	7		15			7		16		1001	787		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	5.081	1000	0.803		2.943507	8		28			8		29		1001	788		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	6.012	1000	2.482		2.943507	7		21			7		15		1001	789		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	5.132	1000	1.856		2.943507	8		20			8		21		1001	792		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	2.974	1000	0.968		2.943507	6		43			6		37		1001	793		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5566	2.051	1000	0.948		2.943507	6		26			6		21		1001	794		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	2.252		3.878319	6		29			6		27		1001	797		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.492	1000	0.823		3.878319	8		22			8		14		1001	798		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	3.837	1000	1.778		3.878319	5		16			5		17		1001	799		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	2.506	1000	0.838		3.878319	6		4			6		6		1001	801		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	2.599	1000	2.034		3.878319	6		24			6		16		1001	802		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	1.942		3.878319	6		48			6		50		1001	803		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	1.663		3.878319	6		10			6		5		1001	804		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.108	1000	1.523		3.878319	7		14			7		11		1001	807		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	2.274		3.878319	6		44			6		41		1001	808		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	2.286		3.878319	8		44			8		35		1001	811		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	3.935	1000	1.734		3.878319	6		43			6		40		1001	812		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	2.877	1000	2.153		3.878319	5		14			5		6		1001	813		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	1.361		3.878319	6		40			6		41		1001	814		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.918	1000	1.310		3.878319	6		25			6		30		1001	816		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	1.992		3.878319	7		32			7		23		1001	817		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	3.955	1000	2.406		3.878319	6		11			6		14		1001	818		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	2.115	1000	1.210		3.878319	8		5			8		1		1001	820		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.539	1000	1.742		3.878319	8		19			8		17		1001	821		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.856	1000	1.902		3.878319	8		13			8		11		1001	824		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	5.371	1000	2.087		3.878319	7		24			7		19		1001	825		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	3.133	1000	1.797		3.878319	6		14			6		12		1001	826		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.560	1000	2.297		3.878319	7		4			7		1		1001	828		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6287	4.453	1000	2.368		3.878319	8		11			8		12		1001	831		1				1			5			20			0.0000		154.000		5.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
