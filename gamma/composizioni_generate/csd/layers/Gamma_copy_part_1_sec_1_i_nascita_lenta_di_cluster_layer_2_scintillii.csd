
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Gamma_copy_part_1_sec_1_i_nascita_lenta_di_cluster_layer_2_scintillii.wav" -W -d -m0
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
i "Voce"	90.4803	3.492	1000	1.357		0.006178	7		5			7		5		1001	1		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4803	8.137	1000	2.393		0.006178	5		9			5		10		1001	3		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4803	5.727	1000	1.719		0.006178	5		3			5		4		1001	4		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4803	5.051	1000	3.430		0.006178	6		1			6		1		1001	7		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4803	4.716	1000	2.402		0.006178	7		7			7		5		1001	11		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4803	3.346	1000	1.428		0.006178	6		9			6		9		1001	12		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	6.675	1000	2.908		0.007004	6		9			6		7		1001	13		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	2.778	1000	1.653		0.007004	6		6			6		7		1001	14		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	6.985	1000	3.681		0.007004	7		3			7		4		1001	15		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	3.771	1000	1.258		0.007004	7		2			7		1		1001	16		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	6.986	1000	1.954		0.007004	5		9			5		10		1001	19		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5373	4.875	1000	2.841		0.007004	6		8			6		6		1001	20		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	6.204	1000	2.980		0.027212	6		8			6		7		1001	21		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	2.497	1000	1.170		0.027212	6		8			6		9		1001	22		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	4.636	1000	2.225		0.027212	7		10			7		10		1001	26		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	4.891	1000	2.335		0.027212	6		10			6		12		1001	29		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	4.153	1000	2.368		0.027212	5		7			5		8		1001	31		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	9.760	1000	3.470		0.027212	6		5			6		6		1001	33		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.4476	9.763	1000	3.207		0.027212	7		1			7		2		1001	34		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	2.751	1000	1.574		0.073840	7		10			7		8		1001	35		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	6.026	1000	1.589		0.073840	5		11			5		10		1001	36		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	6.409	1000	1.196		0.073840	5		1			5		1		1001	37		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	8.549	1000	3.652		0.073840	6		1			6		3		1001	38		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	6.201	1000	3.304		0.073840	6		5			6		2		1001	42		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	9.064	1000	3.277		0.073840	6		6			6		4		1001	43		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	5.711	1000	0.991		0.073840	6		8			6		5		1001	44		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	3.235	1000	2.009		0.073840	5		9			5		7		1001	45		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6434	2.835	1000	2.099		0.073840	6		3			6		1		1001	47		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	4.514	1000	2.151		0.078884	8		13			8		9		1001	48		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	5.149	1000	2.247		0.078884	6		1			6		1		1001	49		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	4.788	1000	3.568		0.078884	6		7			6		3		1001	50		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	2.287	1000	1.367		0.078884	8		13			8		15		1001	51		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	5.588	1000	0.796		0.078884	8		1			8		1		1001	52		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	6.396	1000	3.743		0.078884	8		8			8		8		1001	54		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	4.317	1000	2.596		0.078884	7		6			7		4		1001	55		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.7457	5.528	1000	3.612		0.078884	8		1			8		2		1001	56		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	8.408	1000	2.768		0.113717	7		10			7		11		1001	59		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	8.178	1000	3.664		0.113717	7		6			7		2		1001	60		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	3.683	1000	2.444		0.113717	6		5			6		2		1001	62		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	5.876	1000	2.232		0.113717	8		2			8		5		1001	67		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	7.293	1000	2.255		0.113717	6		13			6		12		1001	70		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	6.956	1000	1.989		0.113717	7		13			7		9		1001	71		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3769	7.497	1000	2.225		0.113717	6		5			6		6		1001	76		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	6.369	1000	1.579		0.130315	6		1			6		1		1001	77		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	2.901	1000	1.774		0.130315	7		4			7		5		1001	78		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	2.821	1000	1.292		0.130315	6		11			6		9		1001	79		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	8.917	1000	3.285		0.130315	5		4			5		3		1001	80		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	4.922	1000	2.042		0.130315	8		1			8		1		1001	82		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	5.272	1000	2.319		0.130315	7		8			7		5		1001	85		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6431	6.536	1000	1.019		0.130315	5		9			5		9		1001	86		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	5.528	1000	3.103		0.219278	7		10			7		9		1001	87		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	4.396	1000	2.637		0.219278	6		15			6		17		1001	88		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	9.448	1000	2.901		0.219278	5		3			5		1		1001	89		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	6.955	1000	1.312		0.219278	6		16			6		11		1001	92		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	5.875	1000	1.243		0.219278	6		14			6		17		1001	94		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	5.634	1000	2.183		0.219278	7		15			7		16		1001	97		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	2.400	1000	1.647		0.219278	6		7			6		8		1001	98		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	1.746	1000	1.017		0.219278	7		11			7		8		1001	101		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	3.921	1000	2.267		0.219278	7		6			7		8		1001	102		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	7.730	1000	2.001		0.219278	8		12			8		13		1001	104		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	5.682	1000	2.498		0.219278	7		15			7		18		1001	108		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	6.538	1000	2.122		0.219278	7		7			7		6		1001	109		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8446	4.898	1000	3.059		0.219278	7		11			7		12		1001	110		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	4.931	1000	1.777		0.349550	5		16			5		11		1001	111		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	2.749	1000	1.511		0.349550	8		17			8		21		1001	113		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	5.428	1000	2.928		0.349550	5		9			5		9		1001	114		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	8.017	1000	3.064		0.349550	6		15			6		19		1001	115		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	4.763	1000	2.229		0.349550	8		10			8		9		1001	116		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	8.534	1000	2.810		0.349550	6		5			6		3		1001	117		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	4.425	1000	1.310		0.349550	6		6			6		4		1001	118		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	6.004	1000	2.596		0.349550	7		10			7		9		1001	120		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	8.427	1000	3.128		0.349550	6		11			6		9		1001	121		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2217	5.292	1000	2.246		0.349550	5		14			5		14		1001	122		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	8.369	1000	3.061		0.422941	6		21			6		22		1001	124		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	8.766	1000	3.377		0.422941	5		3			5		1		1001	125		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	5.427	1000	2.168		0.422941	7		20			7		16		1001	126		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	7.055	1000	3.056		0.422941	8		4			8		1		1001	128		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	7.847	1000	3.177		0.422941	6		12			6		7		1001	129		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	4.996	1000	2.077		0.422941	8		15			8		12		1001	131		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	6.441	1000	3.012		0.422941	6		11			6		8		1001	133		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	7.977	1000	3.392		0.422941	7		12			7		16		1001	137		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	4.594	1000	1.615		0.422941	5		12			5		10		1001	138		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	5.265	1000	3.441		0.422941	7		7			7		7		1001	140		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	7.666	1000	2.356		0.422941	8		11			8		10		1001	141		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	3.242	1000	2.084		0.422941	7		3			7		7		1001	142		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	3.955	1000	1.490		0.422941	6		2			6		1		1001	143		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	9.854	1000	3.264		0.422941	6		15			6		19		1001	144		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8838	4.848	1000	3.398		0.422941	6		7			6		2		1001	145		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	6.145	1000	0.944		0.448358	6		7			6		5		1001	148		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	3.342	1000	1.082		0.448358	5		1			5		1		1001	149		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	7.492	1000	2.363		0.448358	7		16			7		21		1001	150		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	5.052	1000	1.801		0.448358	6		18			6		15		1001	151		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	6.609	1000	2.894		0.448358	6		12			6		7		1001	152		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	4.958	1000	1.048		0.448358	8		4			8		6		1001	155		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	7.847	1000	1.866		0.448358	8		3			8		6		1001	159		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0995	2.074	1000	0.836		0.448358	6		7			6		6		1001	161		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	9.173	1000	3.437		0.455620	7		10			7		5		1001	162		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	3.975	1000	2.251		0.455620	7		19			7		23		1001	163		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	6.134	1000	1.124		0.455620	8		8			8		10		1001	164		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	5.848	1000	3.202		0.455620	7		12			7		14		1001	166		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	5.746	1000	1.581		0.455620	7		5			7		4		1001	168		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	2.586	1000	1.811		0.455620	7		21			7		20		1001	169		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	7.211	1000	3.084		0.455620	7		3			7		1		1001	170		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	6.024	1000	2.706		0.455620	6		5			6		5		1001	171		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	3.606	1000	1.773		0.455620	5		21			5		18		1001	173		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	3.665	1000	1.970		0.455620	5		15			5		9		1001	174		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	4.307	1000	0.822		0.455620	7		15			7		13		1001	176		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	5.820	1000	1.430		0.455620	7		14			7		19		1001	177		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	7.680	1000	2.775		0.455620	6		11			6		8		1001	178		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	5.557	1000	2.258		0.455620	7		12			7		15		1001	180		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1600	5.566	1000	1.566		0.455620	7		14			7		18		1001	182		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	6.034	1000	1.257		0.513208	5		7			5		3		1001	183		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	5.800	1000	1.833		0.513208	7		1			7		1		1001	184		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	8.145	1000	2.212		0.513208	8		9			8		10		1001	185		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	5.847	1000	1.700		0.513208	5		2			5		1		1001	186		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	4.936	1000	1.460		0.513208	7		8			7		8		1001	188		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	8.459	1000	2.865		0.513208	8		15			8		18		1001	189		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	7.327	1000	3.374		0.513208	7		12			7		12		1001	191		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	4.748	1000	1.017		0.513208	6		16			6		17		1001	193		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	7.139	1000	2.219		0.513208	8		1			8		2		1001	194		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	4.312	1000	1.709		0.513208	7		8			7		3		1001	195		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	7.949	1000	3.011		0.513208	5		12			5		13		1001	197		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	6.585	1000	1.877		0.513208	7		17			7		18		1001	199		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	3.361	1000	1.335		0.513208	7		6			7		7		1001	200		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	5.848	1000	2.891		0.513208	7		20			7		19		1001	201		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	6.811	1000	2.065		0.513208	7		13			7		16		1001	202		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6235	5.071	1000	1.318		0.513208	7		10			7		7		1001	204		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	5.602	1000	3.307		0.747484	5		15			5		11		1001	205		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	3.884	1000	0.814		0.747484	7		22			7		20		1001	206		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	3.128	1000	2.140		0.747484	6		18			6		23		1001	208		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	4.886	1000	2.272		0.747484	6		18			6		14		1001	210		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	5.112	1000	1.739		0.747484	6		17			6		11		1001	211		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	7.177	1000	2.887		0.747484	6		10			6		13		1001	212		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	8.216	1000	3.128		0.747484	5		13			5		15		1001	213		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	6.553	1000	3.269		0.747484	7		6			7		6		1001	214		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	8.401	1000	2.992		0.747484	7		24			7		26		1001	216		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2832	5.431	1000	0.786		0.747484	8		5			8		1		1001	218		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	6.875	1000	2.501		0.767546	6		1			6		2		1001	219		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	3.008	1000	1.103		0.767546	7		23			7		20		1001	220		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	6.023	1000	3.012		0.767546	6		19			6		23		1001	222		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	6.575	1000	1.459		0.767546	6		25			6		25		1001	223		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	5.004	1000	2.691		0.767546	6		12			6		16		1001	224		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	3.260	1000	2.436		0.767546	6		12			6		16		1001	225		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	5.111	1000	3.026		0.767546	8		2			8		1		1001	226		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4123	8.772	1000	2.716		0.767546	8		18			8		14		1001	232		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	2.588	1000	1.050		0.807499	6		22			6		16		1001	233		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	1.628	1000	0.931		0.807499	7		25			7		25		1001	234		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	8.052	1000	2.558		0.807499	6		9			6		6		1001	235		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	6.036	1000	1.331		0.807499	7		3			7		7		1001	236		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	4.586	1000	1.365		0.807499	6		15			6		9		1001	237		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	4.885	1000	1.394		0.807499	7		20			7		19		1001	238		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	2.786	1000	1.556		0.807499	6		6			6		9		1001	239		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	3.012	1000	0.922		0.807499	7		11			7		16		1001	240		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	7.060	1000	1.892		0.807499	5		5			5		4		1001	241		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6644	7.952	1000	2.818		0.807499	6		9			6		2		1001	242		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	6.299	1000	1.759		0.814186	7		4			7		1		1001	246		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	2.696	1000	1.060		0.814186	6		24			6		20		1001	249		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	3.298	1000	1.098		0.814186	5		14			5		16		1001	251		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	2.192	1000	1.261		0.814186	7		21			7		21		1001	253		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	6.686	1000	2.040		0.814186	6		20			6		15		1001	254		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	6.806	1000	3.006		0.814186	8		9			8		13		1001	255		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	7.792	1000	2.049		0.814186	7		3			7		1		1001	256		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	5.431	1000	1.778		0.814186	7		15			7		19		1001	257		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	7.776	1000	2.321		0.814186	7		5			7		1		1001	258		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	5.833	1000	1.956		0.814186	6		13			6		9		1001	260		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	4.062	1000	1.002		0.814186	7		16			7		14		1001	262		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	5.690	1000	2.007		0.814186	7		9			7		12		1001	263		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	2.518	1000	1.603		0.814186	7		25			7		21		1001	264		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	5.790	1000	2.933		0.814186	5		26			5		22		1001	266		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	8.727	1000	2.509		0.814186	6		13			6		12		1001	267		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	4.536	1000	1.436		0.814186	6		23			6		19		1001	268		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	4.522	1000	2.281		0.814186	7		22			7		20		1001	269		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.7060	5.997	1000	2.449		0.814186	7		21			7		17		1001	270		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	4.331	1000	1.087		0.896846	5		7			5		12		1001	271		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.302	1000	1.603		0.896846	5		7			5		6		1001	272		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.595	1000	2.633		0.896846	5		21			5		16		1001	274		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	7.687	1000	2.665		0.896846	6		25			6		27		1001	275		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	8.250	1000	2.840		0.896846	7		8			7		2		1001	277		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	5.248	1000	1.025		0.896846	8		11			8		9		1001	278		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	3.240	1000	2.215		0.896846	6		22			6		19		1001	279		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	1.985	1000	1.063		0.896846	6		27			6		29		1001	280		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	1.698	1000	1.010		0.896846	7		23			7		27		1001	281		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.875	1000	2.243		0.896846	8		20			8		25		1001	282		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.510	1000	0.989		0.896846	7		1			7		7		1001	285		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.718	1000	1.532		0.896846	7		3			7		5		1001	286		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	5.546	1000	0.800		0.896846	7		13			7		6		1001	289		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	5.168	1000	1.147		0.896846	7		22			7		22		1001	290		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	6.358	1000	2.070		0.896846	7		10			7		13		1001	291		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	1.865	1000	1.214		0.896846	6		1			6		6		1001	293		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2066	5.900	1000	0.923		0.896846	6		3			6		2		1001	294		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	4.544	1000	1.347		1.016823	6		16			6		18		1001	296		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	5.497	1000	1.161		1.016823	5		27			5		28		1001	297		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	3.092	1000	1.741		1.016823	6		24			6		20		1001	298		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	5.333	1000	2.708		1.016823	8		13			8		18		1001	299		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	3.063	1000	1.306		1.016823	6		3			6		1		1001	300		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	6.037	1000	1.339		1.016823	5		3			5		6		1001	301		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	7.168	1000	2.728		1.016823	5		20			5		19		1001	302		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	3.689	1000	1.381		1.016823	7		15			7		16		1001	303		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8938	2.267	1000	1.287		1.016823	5		14			5		13		1001	304		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	7.327	1000	3.093		1.112159	8		8			8		14		1001	305		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	5.133	1000	2.085		1.112159	7		27			7		25		1001	306		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	6.490	1000	2.645		1.112159	7		1			7		6		1001	307		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	6.316	1000	1.939		1.112159	5		1			5		1		1001	308		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	1.553	1000	1.193		1.112159	8		3			8		8		1001	309		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	6.011	1000	1.699		1.112159	7		25			7		27		1001	310		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	8.196	1000	3.067		1.112159	6		15			6		9		1001	311		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	4.569	1000	2.588		1.112159	5		2			5		4		1001	312		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	7.089	1000	2.399		1.112159	6		7			6		2		1001	313		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	3.505	1000	0.872		1.112159	7		2			7		1		1001	314		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	7.607	1000	3.150		1.112159	6		12			6		12		1001	316		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	2.344	1000	1.225		1.112159	6		28			6		30		1001	317		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	7.249	1000	2.076		1.112159	6		14			6		12		1001	319		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	5.973	1000	2.660		1.112159	5		10			5		16		1001	320		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	2.920	1000	2.213		1.112159	7		10			7		4		1001	321		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	5.547	1000	1.645		1.112159	7		16			7		10		1001	322		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	6.640	1000	2.587		1.112159	7		29			7		31		1001	323		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	9.021	1000	3.120		1.112159	8		12			8		10		1001	324		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4114	6.162	1000	1.464		1.112159	8		19			8		15		1001	327		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	7.506	1000	2.832		1.330298	6		21			6		18		1001	328		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	1.969	1000	0.933		1.330298	8		5			8		6		1001	329		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	4.920	1000	2.752		1.330298	5		18			5		19		1001	330		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	7.587	1000	1.909		1.330298	6		1			6		1		1001	331		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	2.903	1000	1.688		1.330298	5		23			5		22		1001	332		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	5.599	1000	2.481		1.330298	7		4			7		2		1001	333		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	6.478	1000	2.439		1.330298	8		24			8		20		1001	336		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	6.106	1000	2.814		1.330298	8		2			8		5		1001	337		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	4.091	1000	0.961		1.330298	8		18			8		23		1001	338		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	6.386	1000	1.645		1.330298	7		26			7		20		1001	339		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	5.861	1000	1.067		1.330298	7		27			7		23		1001	340		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	2.852	1000	1.602		1.330298	5		7			5		12		1001	342		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	1.443	1000	0.797		1.330298	5		26			5		25		1001	343		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	3.843	1000	2.701		1.330298	7		8			7		7		1001	344		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	4.227	1000	1.876		1.330298	5		11			5		8		1001	345		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5179	3.741	1000	2.185		1.330298	6		23			6		19		1001	348		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	4.748	1000	2.393		1.352458	8		11			8		5		1001	349		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	3.915	1000	1.207		1.352458	5		22			5		27		1001	350		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	6.017	1000	2.090		1.352458	6		19			6		22		1001	353		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	6.350	1000	1.238		1.352458	5		27			5		30		1001	354		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	5.300	1000	1.736		1.352458	7		22			7		23		1001	356		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	2.997	1000	1.530		1.352458	6		21			6		19		1001	357		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	3.373	1000	1.339		1.352458	6		16			6		12		1001	358		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	6.181	1000	1.126		1.352458	5		20			5		16		1001	359		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	5.780	1000	2.149		1.352458	7		28			7		25		1001	360		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	5.484	1000	2.415		1.352458	6		23			6		27		1001	363		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	7.116	1000	1.852		1.352458	6		21			6		16		1001	364		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	3.544	1000	2.067		1.352458	7		12			7		13		1001	366		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	8.077	1000	2.376		1.352458	6		21			6		21		1001	367		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	4.925	1000	1.315		1.352458	8		2			8		1		1001	368		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	3.950	1000	1.155		1.352458	7		21			7		23		1001	369		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	5.161	1000	1.146		1.352458	8		11			8		13		1001	370		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	3.028	1000	1.423		1.352458	5		19			5		17		1001	372		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	2.121	1000	1.144		1.352458	5		23			5		26		1001	375		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6251	5.694	1000	3.047		1.352458	7		28			7		28		1001	376		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	4.237	1000	1.802		1.358071	7		20			7		22		1001	381		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	5.474	1000	2.685		1.358071	7		21			7		16		1001	382		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	4.356	1000	1.978		1.358071	5		10			5		9		1001	383		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	2.711	1000	1.113		1.358071	6		27			6		26		1001	384		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	4.381	1000	1.512		1.358071	6		14			6		16		1001	387		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	8.434	1000	2.245		1.358071	6		12			6		5		1001	388		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	5.962	1000	1.478		1.358071	6		20			6		25		1001	389		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	7.766	1000	1.808		1.358071	8		22			8		15		1001	390		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	8.555	1000	3.050		1.358071	8		8			8		10		1001	392		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	5.696	1000	2.897		1.358071	7		6			7		12		1001	393		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	5.261	1000	2.260		1.358071	5		6			5		12		1001	395		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	4.210	1000	1.912		1.358071	6		20			6		21		1001	398		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	4.883	1000	3.026		1.358071	8		24			8		18		1001	399		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6521	5.072	1000	2.394		1.358071	8		25			8		22		1001	401		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	8.828	1000	2.985		1.530977	7		9			7		5		1001	402		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	6.822	1000	2.595		1.530977	7		27			7		19		1001	403		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	8.367	1000	2.109		1.530977	7		31			7		28		1001	404		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	3.694	1000	2.323		1.530977	7		7			7		2		1001	405		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	4.052	1000	2.125		1.530977	8		6			8		6		1001	406		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	4.147	1000	2.444		1.530977	6		2			6		1		1001	407		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	7.274	1000	2.394		1.530977	8		28			8		34		1001	408		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	5.429	1000	1.341		1.530977	8		19			8		12		1001	409		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	4.881	1000	0.758		1.530977	7		4			7		1		1001	410		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	7.554	1000	1.865		1.530977	6		31			6		24		1001	411		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4581	2.794	1000	1.163		1.530977	7		10			7		12		1001	412		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	2.663	1000	1.187		1.652121	7		20			7		26		1001	413		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	7.275	1000	2.945		1.652121	5		1			5		1		1001	415		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.612	1000	2.202		1.652121	5		23			5		24		1001	417		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	2.883	1000	0.868		1.652121	7		34			7		31		1001	422		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.459	1000	2.420		1.652121	8		8			8		2		1001	423		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	3.280	1000	0.794		1.652121	6		3			6		1		1001	425		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	3.455	1000	1.858		1.652121	6		9			6		14		1001	428		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	5.560	1000	1.691		1.652121	8		17			8		22		1001	430		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.888	1000	2.924		1.652121	8		6			8		1		1001	434		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	5.454	1000	2.111		1.652121	7		20			7		20		1001	435		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	7.801	1000	2.944		1.652121	8		25			8		26		1001	436		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	5.046	1000	1.987		1.652121	8		20			8		25		1001	439		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.469	1000	2.728		1.652121	6		21			6		22		1001	440		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.317	1000	0.831		1.652121	8		29			8		23		1001	441		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.157	1000	0.760		1.652121	8		14			8		12		1001	443		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.065	1000	2.245		1.652121	5		9			5		2		1001	447		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.626	1000	2.531		1.652121	8		2			8		1		1001	448		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	2.164	1000	1.580		1.652121	7		15			7		21		1001	449		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.242	1000	1.195		1.652121	8		30			8		31		1001	452		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.642	1000	1.645		1.652121	7		12			7		11		1001	453		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	2.079	1000	0.861		1.652121	7		5			7		1		1001	454		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	2.278	1000	1.417		1.652121	5		9			5		13		1001	455		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.388	1000	1.362		1.652121	5		16			5		9		1001	456		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.659	1000	1.385		1.652121	5		30			5		35		1001	458		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	3.874	1000	2.606		1.652121	5		34			5		41		1001	459		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	4.270	1000	2.184		1.652121	7		5			7		6		1001	460		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9959	6.536	1000	1.932		1.652121	7		7			7		13		1001	461		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.939	1000	2.805		1.803422	5		3			5		1		1001	462		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	7.176	1000	2.026		1.803422	7		6			7		1		1001	463		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.047	1000	2.770		1.803422	8		3			8		5		1001	464		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	3.533	1000	1.980		1.803422	7		28			7		21		1001	465		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.134	1000	1.224		1.803422	7		10			7		10		1001	466		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	2.018	1000	0.803		1.803422	6		13			6		13		1001	467		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	3.935	1000	2.111		1.803422	5		21			5		27		1001	469		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	4.482	1000	1.142		1.803422	6		7			6		7		1001	472		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	7.818	1000	1.790		1.803422	7		1			7		1		1001	473		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	6.831	1000	1.189		1.803422	7		17			7		18		1001	475		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.014	1000	0.926		1.803422	7		5			7		9		1001	476		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	6.573	1000	2.244		1.803422	7		9			7		1		1001	478		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	6.208	1000	0.889		1.803422	6		29			6		35		1001	479		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	4.011	1000	1.587		1.803422	8		15			8		10		1001	480		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	7.037	1000	1.996		1.803422	7		10			7		3		1001	481		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	8.131	1000	2.738		1.803422	7		33			7		40		1001	484		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	3.257	1000	0.964		1.803422	6		25			6		28		1001	487		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.405	1000	1.042		1.803422	6		11			6		17		1001	488		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	5.965	1000	2.774		1.803422	8		3			8		1		1001	489		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	4.665	1000	0.866		1.803422	6		4			6		1		1001	491		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	6.310	1000	2.358		1.803422	6		11			6		9		1001	492		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	3.765	1000	2.108		1.803422	8		13			8		12		1001	493		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6407	6.011	1000	1.462		1.803422	8		34			8		35		1001	494		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	6.469	1000	2.062		1.836670	5		29			5		29		1001	495		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	5.659	1000	1.308		1.836670	5		14			5		18		1001	497		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	6.662	1000	2.624		1.836670	7		14			7		8		1001	498		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	1.351	1000	1.076		1.836670	7		19			7		14		1001	500		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	4.751	1000	2.646		1.836670	8		28			8		27		1001	501		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	3.537	1000	1.779		1.836670	7		28			7		25		1001	503		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	6.183	1000	2.617		1.836670	8		16			8		23		1001	504		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	6.852	1000	2.909		1.836670	6		7			6		10		1001	505		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	5.398	1000	1.304		1.836670	7		31			7		35		1001	507		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	5.587	1000	1.490		1.836670	6		30			6		24		1001	508		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	7.674	1000	2.111		1.836670	8		24			8		24		1001	511		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	7.294	1000	2.753		1.836670	6		16			6		21		1001	512		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	2.007	1000	0.959		1.836670	7		10			7		14		1001	513		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	6.362	1000	2.276		1.836670	7		2			7		1		1001	514		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	5.189	1000	1.754		1.836670	6		18			6		24		1001	515		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	2.227	1000	1.114		1.836670	8		12			8		11		1001	516		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7787	7.904	1000	2.477		1.836670	5		19			5		19		1001	517		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.324	1000	2.696		1.862261	6		11			6		5		1001	519		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	8.326	1000	2.504		1.862261	6		15			6		8		1001	520		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	5.631	1000	2.792		1.862261	7		12			7		18		1001	521		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	5.065	1000	1.530		1.862261	7		9			7		8		1001	523		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	5.919	1000	2.545		1.862261	6		27			6		24		1001	524		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	5.897	1000	2.347		1.862261	7		24			7		27		1001	525		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.776	1000	1.199		1.862261	6		3			6		10		1001	526		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	2.475	1000	0.774		1.862261	7		25			7		26		1001	527		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.584	1000	2.554		1.862261	6		8			6		12		1001	528		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.580	1000	2.228		1.862261	7		10			7		13		1001	529		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	3.596	1000	1.088		1.862261	5		29			5		28		1001	530		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	8.256	1000	2.610		1.862261	6		25			6		28		1001	531		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.132	1000	1.273		1.862261	6		10			6		3		1001	532		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	3.578	1000	1.775		1.862261	7		24			7		19		1001	533		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	3.838	1000	2.649		1.862261	5		36			5		28		1001	534		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	3.532	1000	1.493		1.862261	7		18			7		18		1001	535		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8840	4.387	1000	1.894		1.862261	6		14			6		7		1001	537		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	1.412	1000	0.853		2.446009	7		24			7		32		1001	538		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	7.517	1000	1.957		2.446009	5		20			5		18		1001	540		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	3.544	1000	1.997		2.446009	7		30			7		34		1001	541		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.037	1000	1.278		2.446009	7		13			7		16		1001	542		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	3.267	1000	2.579		2.446009	5		20			5		24		1001	545		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	4.471	1000	1.805		2.446009	6		4			6		1		1001	547		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	2.865	1000	1.662		2.446009	7		22			7		17		1001	548		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.019	1000	2.703		2.446009	8		22			8		24		1001	549		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	1.793	1000	1.232		2.446009	6		17			6		25		1001	550		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	4.948	1000	2.690		2.446009	5		13			5		14		1001	551		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.064	1000	2.524		2.446009	6		3			6		1		1001	552		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	2.627	1000	1.866		2.446009	6		22			6		15		1001	553		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	7.310	1000	2.662		2.446009	7		26			7		31		1001	554		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.140	1000	2.714		2.446009	5		3			5		1		1001	555		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	2.467	1000	1.051		2.446009	6		18			6		25		1001	556		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	3.853	1000	1.296		2.446009	7		31			7		28		1001	557		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	7.228	1000	2.712		2.446009	5		4			5		3		1001	558		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	4.443	1000	0.906		2.446009	6		3			6		1		1001	559		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	2.843	1000	0.824		2.446009	7		24			7		28		1001	560		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	4.973	1000	1.585		2.446009	7		36			7		29		1001	561		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.063	1000	2.427		2.446009	5		37			5		31		1001	564		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	6.247	1000	2.371		2.446009	6		23			6		30		1001	565		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	5.545	1000	2.687		2.446009	6		18			6		20		1001	566		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1165	4.156	1000	0.915		2.446009	6		34			6		39		1001	568		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	6.006	1000	2.599		2.456880	6		5			6		12		1001	569		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	3.605	1000	1.837		2.456880	7		25			7		16		1001	571		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.341	1000	2.455		2.456880	5		6			5		12		1001	572		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	7.617	1000	2.145		2.456880	7		2			7		6		1001	573		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	6.300	1000	1.098		2.456880	6		40			6		38		1001	575		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	7.236	1000	1.628		2.456880	6		1			6		2		1001	576		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.371	1000	1.815		2.456880	7		4			7		1		1001	577		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	4.590	1000	1.053		2.456880	8		21			8		29		1001	578		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	2.488	1000	1.146		2.456880	7		31			7		23		1001	579		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	4.403	1000	2.021		2.456880	7		22			7		22		1001	580		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	3.158	1000	0.845		2.456880	5		28			5		25		1001	581		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.861	1000	2.739		2.456880	5		28			5		24		1001	582		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	6.136	1000	2.480		2.456880	5		3			5		1		1001	583		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	6.901	1000	2.269		2.456880	7		21			7		22		1001	584		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.830	1000	2.419		2.456880	7		37			7		34		1001	588		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.732	1000	1.713		2.456880	7		17			7		12		1001	589		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	6.069	1000	1.952		2.456880	8		15			8		11		1001	590		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	5.458	1000	1.148		2.456880	7		5			7		3		1001	592		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	1.667	1000	0.939		2.456880	6		40			6		36		1001	594		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	2.748	1000	1.701		2.456880	6		11			6		3		1001	595		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1554	2.062	1000	1.371		2.456880	7		9			7		9		1001	596		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.626	1000	1.174		2.621879	6		21			6		19		1001	597		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.748	1000	0.873		2.621879	8		29			8		30		1001	598		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	7.282	1000	1.891		2.621879	7		11			7		13		1001	600		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	7.001	1000	1.489		2.621879	6		39			6		45		1001	601		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.915	1000	1.411		2.621879	8		6			8		1		1001	605		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.894	1000	2.374		2.621879	7		10			7		2		1001	608		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.890	1000	2.019		2.621879	7		40			7		42		1001	610		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.581	1000	2.669		2.621879	6		7			6		1		1001	611		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.463	1000	2.589		2.621879	5		17			5		17		1001	612		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.326	1000	2.151		2.621879	7		38			7		32		1001	613		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	3.626	1000	1.709		2.621879	7		37			7		40		1001	614		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	2.457	1000	1.098		2.621879	6		23			6		24		1001	615		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	7.712	1000	1.925		2.621879	7		20			7		26		1001	616		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	3.551	1000	1.075		2.621879	6		34			6		33		1001	617		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.321	1000	1.224		2.621879	8		28			8		27		1001	618		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.291	1000	0.827		2.621879	8		16			8		8		1001	619		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	2.854	1000	0.975		2.621879	7		16			7		17		1001	620		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.272	1000	0.882		2.621879	8		40			8		40		1001	622		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	2.502	1000	1.266		2.621879	8		31			8		37		1001	623		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	1.987	1000	1.311		2.621879	6		29			6		36		1001	624		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.760	1000	1.946		2.621879	7		19			7		11		1001	625		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.357	1000	2.466		2.621879	7		10			7		14		1001	626		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.570	1000	1.458		2.621879	5		17			5		9		1001	627		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	6.609	1000	2.518		2.621879	8		21			8		27		1001	628		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	7.410	1000	2.678		2.621879	7		32			7		24		1001	629		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	1.084	1000	0.776		2.621879	7		27			7		19		1001	630		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	3.719	1000	1.880		2.621879	6		5			6		10		1001	631		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	4.750	1000	0.903		2.621879	8		36			8		39		1001	634		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.435	1000	2.410		2.621879	8		32			8		32		1001	635		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	6.500	1000	2.607		2.621879	5		4			5		1		1001	636		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	3.225	1000	0.818		2.621879	7		25			7		28		1001	637		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	5.974	1000	0.881		2.621879	6		37			6		36		1001	639		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7353	2.478	1000	1.293		2.621879	5		25			5		26		1001	641		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	2.386	1000	1.470		2.649168	5		6			5		2		1001	642		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	8.352	1000	2.135		2.649168	5		35			5		32		1001	643		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	4.273	1000	1.133		2.649168	7		31			7		33		1001	645		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	5.956	1000	0.776		2.649168	6		9			6		9		1001	646		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	5.901	1000	1.291		2.649168	5		35			5		42		1001	647		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	7.645	1000	1.790		2.649168	7		4			7		2		1001	648		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	5.007	1000	0.897		2.649168	6		30			6		32		1001	649		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	6.258	1000	1.431		2.649168	7		3			7		1		1001	650		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	4.012	1000	1.257		2.649168	5		29			5		30		1001	652		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	5.211	1000	1.430		2.649168	6		5			6		9		1001	657		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8294	4.547	1000	1.493		2.649168	6		39			6		39		1001	658		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	2.444	1000	1.540		2.779943	6		19			6		23		1001	659		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	3.269	1000	1.156		2.779943	7		31			7		25		1001	660		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	4.977	1000	1.651		2.779943	6		33			6		35		1001	661		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	3.201	1000	2.340		2.779943	5		25			5		26		1001	663		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	3.793	1000	1.260		2.779943	7		30			7		32		1001	664		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	3.497	1000	1.735		2.779943	8		10			8		9		1001	665		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	4.904	1000	1.996		2.779943	7		7			7		7		1001	666		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	5.779	1000	1.094		2.779943	7		7			7		1		1001	667		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2739	3.983	1000	2.335		2.779943	7		29			7		30		1001	669		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.484	1000	1.252		2.905580	7		6			7		8		1001	671		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.731	1000	2.484		2.905580	6		20			6		20		1001	672		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	5.997	1000	2.364		2.905580	6		13			6		16		1001	673		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.121	1000	1.240		2.905580	7		25			7		21		1001	674		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.138	1000	1.105		2.905580	7		11			7		5		1001	676		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	6.087	1000	0.777		2.905580	8		27			8		26		1001	677		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.885	1000	2.203		2.905580	5		24			5		27		1001	678		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	3.444	1000	1.198		2.905580	8		40			8		45		1001	681		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.874	1000	1.949		2.905580	8		30			8		21		1001	682		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	6.579	1000	1.496		2.905580	8		7			8		15		1001	683		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.699	1000	1.341		2.905580	5		24			5		20		1001	684		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.883	1000	1.716		2.905580	7		21			7		29		1001	690		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	6.917	1000	2.607		2.905580	6		13			6		9		1001	691		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	5.053	1000	1.307		2.905580	7		19			7		27		1001	692		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.453	1000	2.533		2.905580	6		17			6		17		1001	693		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	1.858	1000	0.938		2.905580	7		6			7		9		1001	694		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.183	1000	1.734		2.905580	5		1			5		6		1001	695		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.627	1000	1.441		2.905580	5		31			5		27		1001	696		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	5.463	1000	2.316		2.905580	6		26			6		34		1001	697		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	3.280	1000	0.800		2.905580	6		39			6		34		1001	698		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	5.233	1000	1.570		2.905580	5		29			5		25		1001	699		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	3.517	1000	1.577		2.905580	5		31			5		37		1001	700		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	3.332	1000	1.821		2.905580	6		10			6		5		1001	701		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.391	1000	1.799		2.905580	5		33			5		38		1001	702		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.907	1000	2.230		2.905580	7		23			7		28		1001	705		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.741	1000	1.383		2.905580	6		38			6		35		1001	706		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	4.299	1000	1.923		2.905580	7		1			7		5		1001	707		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6913	2.540	1000	1.532		2.905580	7		33			7		32		1001	708		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	3.340	1000	1.087		2.907996	7		41			7		38		1001	710		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	2.684	1000	1.692		2.907996	8		21			8		24		1001	711		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.257	1000	1.673		2.907996	5		34			5		31		1001	712		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	2.446	1000	0.990		2.907996	7		27			7		18		1001	713		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.457	1000	1.086		2.907996	5		34			5		33		1001	714		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.958	1000	1.776		2.907996	6		4			6		11		1001	716		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	6.348	1000	2.428		2.907996	6		7			6		1		1001	717		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	3.248	1000	0.968		2.907996	5		12			5		18		1001	718		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	6.171	1000	1.006		2.907996	7		9			7		9		1001	719		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.698	1000	2.571		2.907996	7		10			7		2		1001	722		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.173	1000	1.574		2.907996	6		15			6		14		1001	724		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	3.038	1000	1.910		2.907996	5		7			5		9		1001	725		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.736	1000	1.902		2.907996	8		28			8		24		1001	728		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.261	1000	2.063		2.907996	6		28			6		24		1001	730		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.224	1000	1.379		2.907996	5		15			5		6		1001	731		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	2.623	1000	1.572		2.907996	7		12			7		11		1001	732		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.838	1000	2.583		2.907996	6		22			6		29		1001	734		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.190	1000	2.254		2.907996	5		11			5		6		1001	736		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.191	1000	1.369		2.907996	6		9			6		15		1001	737		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.000	1000	1.786		2.907996	6		32			6		29		1001	738		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	3.450	1000	1.014		2.907996	5		26			5		33		1001	739		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.301	1000	0.860		2.907996	5		35			5		32		1001	740		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	2.270	1000	1.246		2.907996	6		14			6		10		1001	741		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.188	1000	1.998		2.907996	6		11			6		8		1001	742		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.773	1000	0.910		2.907996	6		3			6		1		1001	743		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	6.065	1000	0.874		2.907996	5		12			5		3		1001	744		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	6.170	1000	1.993		2.907996	7		7			7		1		1001	747		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.593	1000	1.027		2.907996	7		39			7		36		1001	748		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	3.654	1000	1.012		2.907996	6		13			6		10		1001	749		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.519	1000	2.096		2.907996	5		18			5		25		1001	750		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	4.741	1000	1.920		2.907996	6		22			6		13		1001	752		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6992	5.097	1000	2.347		2.907996	6		16			6		21		1001	753		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.984	1000	1.892		3.002569	7		20			7		11		1001	754		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	7.339	1000	2.113		3.002569	6		33			6		31		1001	755		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.165	1000	1.449		3.002569	6		26			6		20		1001	758		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	6.417	1000	2.388		3.002569	6		3			6		1		1001	759		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	2.893	1000	2.144		3.002569	6		10			6		8		1001	762		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.223	1000	1.057		3.002569	7		5			7		13		1001	763		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.989	1000	1.010		3.002569	6		16			6		8		1001	765		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	4.360	1000	0.853		3.002569	6		27			6		32		1001	766		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.937	1000	2.140		3.002569	6		35			6		27		1001	767		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.733	1000	1.836		3.002569	7		26			7		28		1001	768		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.808	1000	1.993		3.002569	6		9			6		9		1001	769		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	2.494	1000	0.827		3.002569	6		5			6		6		1001	773		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.759	1000	1.374		3.002569	7		20			7		13		1001	774		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.181	1000	2.159		3.002569	7		6			7		1		1001	775		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	6.547	1000	1.935		3.002569	6		9			6		13		1001	776		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	7.145	1000	2.534		3.002569	5		21			5		17		1001	778		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	6.398	1000	2.411		3.002569	6		17			6		21		1001	781		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	4.003	1000	2.256		3.002569	7		35			7		31		1001	782		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	4.571	1000	1.102		3.002569	7		6			7		7		1001	783		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	7.993	1000	2.224		3.002569	7		9			7		12		1001	785		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.982	1000	2.167		3.002569	7		10			7		9		1001	786		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	6.652	1000	1.566		3.002569	6		44			6		40		1001	787		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	2.673	1000	1.304		3.002569	6		9			6		11		1001	788		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	7.381	1000	2.415		3.002569	8		14			8		9		1001	789		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.597	1000	1.337		3.002569	7		3			7		1		1001	790		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	6.133	1000	1.256		3.002569	7		1			7		1		1001	791		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.561	1000	0.803		3.002569	5		27			5		28		1001	792		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	4.350	1000	1.975		3.002569	6		24			6		20		1001	794		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.706	1000	1.392		3.002569	7		16			7		20		1001	795		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.828	1000	1.798		3.002569	6		27			6		35		1001	796		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	4.833	1000	1.225		3.002569	8		30			8		22		1001	797		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	7.993	1000	2.401		3.002569	6		40			6		45		1001	798		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	5.105	1000	1.276		3.002569	8		25			8		18		1001	799		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0073	3.739	1000	1.931		3.002569	7		9			7		4		1001	803		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	4.299	1000	1.050		3.098588	8		7			8		14		1001	804		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	4.416	1000	0.919		3.098588	7		17			7		13		1001	805		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	5.906	1000	2.247		3.098588	7		39			7		44		1001	806		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	3.101	1000	2.351		3.098588	7		7			7		1		1001	807		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	2.488	1000	1.850		3.098588	7		9			7		10		1001	809		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	7.101	1000	2.418		3.098588	7		1			7		5		1001	810		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	5.686	1000	0.923		3.098588	7		19			7		16		1001	811		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	7.437	1000	2.395		3.098588	7		10			7		12		1001	813		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	3.711	1000	0.798		3.098588	6		34			6		32		1001	814		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	3.309	1000	1.297		3.098588	6		6			6		5		1001	816		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3151	6.666	1000	2.114		3.098588	5		39			5		43		1001	817		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.818	1000	1.678		3.154709	6		27			6		18		1001	818		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.891	1000	1.007		3.154709	6		17			6		17		1001	820		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	6.093	1000	2.531		3.154709	7		3			7		5		1001	821		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	6.862	1000	2.575		3.154709	5		29			5		24		1001	822		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.237	1000	0.987		3.154709	6		34			6		25		1001	824		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	7.114	1000	1.989		3.154709	6		9			6		2		1001	826		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	3.519	1000	1.039		3.154709	6		3			6		4		1001	827		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	5.985	1000	1.261		3.154709	7		35			7		36		1001	828		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	2.342	1000	1.768		3.154709	6		36			6		28		1001	829		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.041	1000	2.408		3.154709	6		34			6		25		1001	830		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.819	1000	1.584		3.154709	7		22			7		27		1001	831		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	6.169	1000	1.093		3.154709	7		4			7		8		1001	832		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	3.558	1000	1.399		3.154709	8		24			8		26		1001	833		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	2.700	1000	0.976		3.154709	6		37			6		34		1001	834		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	6.928	1000	2.340		3.154709	6		30			6		23		1001	836		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.407	1000	1.677		3.154709	6		22			6		24		1001	837		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.967	1000	0.781		3.154709	7		6			7		1		1001	839		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	5.856	1000	0.929		3.154709	5		32			5		38		1001	840		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	7.331	1000	2.575		3.154709	5		44			5		45		1001	842		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	3.838	1000	1.524		3.154709	6		28			6		36		1001	843		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	7.125	1000	2.087		3.154709	6		34			6		41		1001	844		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	7.057	1000	1.799		3.154709	6		21			6		14		1001	845		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	6.792	1000	1.576		3.154709	8		40			8		42		1001	847		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.310	1000	2.413		3.154709	7		20			7		20		1001	849		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	2.981	1000	1.505		3.154709	7		27			7		24		1001	852		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	5.376	1000	2.035		3.154709	7		29			7		33		1001	854		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.440	1000	1.122		3.154709	6		26			6		17		1001	855		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	4.924	1000	1.602		3.154709	6		20			6		14		1001	857		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	1.290	1000	0.758		3.154709	5		35			5		33		1001	859		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	1.939	1000	0.740		3.154709	6		43			6		34		1001	860		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	3.895	1000	1.372		3.154709	6		36			6		29		1001	861		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	2.596	1000	1.288		3.154709	6		21			6		21		1001	862		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	3.738	1000	2.026		3.154709	7		18			7		9		1001	864		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4929	5.787	1000	0.873		3.154709	6		37			6		43		1001	865		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.084	1000	1.103		3.345120	6		1			6		1		1001	866		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	2.153	1000	1.160		3.345120	5		22			5		23		1001	870		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.110	1000	1.341		3.345120	5		30			5		23		1001	871		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	3.942	1000	1.705		3.345120	6		41			6		43		1001	872		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.621	1000	2.173		3.345120	7		37			7		31		1001	874		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.697	1000	1.850		3.345120	7		2			7		1		1001	875		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	1.763		3.345120	6		7			6		1		1001	876		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.527	1000	1.524		3.345120	7		13			7		9		1001	880		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.212	1000	1.419		3.345120	6		39			6		36		1001	881		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	2.308		3.345120	7		27			7		26		1001	882		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	2.235		3.345120	6		38			6		32		1001	885		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.739	1000	1.628		3.345120	8		5			8		1		1001	886		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.840	1000	1.088		3.345120	7		42			7		44		1001	889		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	2.396		3.345120	6		45			6		37		1001	895		1				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.789	1000	1.929		3.345120	7		28			7		29		1001	896		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	4.374	1000	0.976		3.345120	8		10			8		18		1001	897		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	2.518		3.345120	7		6			7		3		1001	898		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	6.916	1000	2.534		3.345120	7		40			7		30		1001	899		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	2.543	1000	1.310		3.345120	7		33			7		25		1001	901		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0844	5.618	1000	2.156		3.345120	5		32			5		28		1001	903		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	2.044		3.912241	6		42			6		50		1001	904		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	3.704	1000	1.057		3.912241	6		36			6		44		1001	905		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	4.982	1000	2.353		3.912241	6		11			6		20		1001	906		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	4.244	1000	1.105		3.912241	7		41			7		45		1001	908		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	1.504		3.912241	6		6			6		1		1001	909		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	1.823		3.912241	7		23			7		31		1001	910		1				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	4.025	1000	1.416		3.912241	7		19			7		28		1001	911		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	1.192		3.912241	5		15			5		6		1001	913		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.006	1000	2.187		3.912241	8		29			8		27		1001	914		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	1.959		3.912241	5		18			5		21		1001	918		0				1			5			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	2.067		3.912241	6		45			6		40		1001	919		0				1			2			20			0.0000		112.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7529	5.247	1000	2.334		3.912241	6		34			6		42		1001	921		1				1			5			20			0.0000		112.000		5.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
