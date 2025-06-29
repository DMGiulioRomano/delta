
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
f 8 0 4096 5 0.001 128 1 3968 0.0001
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
i "Voce"	74.8978	4.560	1000	1.866		0.005075	5		4			5		2		1001	153		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.2372	4.275	1000	2.463		0.005075	6		7			6		8		1001	155		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	69.2882	9.954	1000	3.866		0.005075	7		2			7		1		1001	156		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.6462	8.347	1000	3.527		0.005075	6		1			6		1		1001	157		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.2429	8.667	1000	2.434		0.005075	5		3			5		1		1001	158		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	76.5996	4.130	1000	1.583		0.005075	5		2			5		3		1001	159		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.8123	7.478	1000	2.412		0.005075	8		1			8		1		1001	160		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.1331	6.179	1000	1.759		0.012425	6		7			6		7		1001	163		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.1774	3.241	1000	1.096		0.012425	6		6			6		8		1001	166		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.8605	7.448	1000	1.689		0.012425	5		5			5		3		1001	167		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.5513	4.749	1000	3.720		0.012425	5		1			5		1		1001	169		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.0021	3.292	1000	1.927		0.012425	8		5			8		6		1001	171		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.9542	5.849	1000	1.450		0.012425	6		9			6		9		1001	172		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.6224	4.582	1000	2.970		0.012425	5		4			5		2		1001	173		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.2222	7.962	1000	3.811		0.012425	7		1			7		1		1001	174		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.6909	3.695	1000	2.390		0.012425	8		9			8		7		1001	175		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.8795	2.688	1000	1.044		0.012425	7		7			7		3		1001	177		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.6906	6.495	1000	3.394		0.012425	8		4			8		6		1001	178		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.6507	4.823	1000	1.256		0.012935	7		3			7		6		1001	179		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.7374	3.360	1000	2.099		0.012935	6		10			6		8		1001	180		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.2206	1.499	1000	0.878		0.012935	5		1			5		1		1001	181		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.8926	4.716	1000	1.125		0.012935	8		8			8		5		1001	182		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.9325	6.590	1000	3.742		0.012935	6		9			6		6		1001	183		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.2422	7.288	1000	3.350		0.012935	7		3			7		1		1001	185		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.2424	3.224	1000	2.239		0.012935	5		1			5		1		1001	188		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.5303	7.569	1000	2.186		0.025534	8		7			8		8		1001	189		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	73.9052	3.863	1000	2.229		0.025534	6		8			6		10		1001	190		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.7771	5.960	1000	1.405		0.025534	6		8			6		5		1001	191		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.7943	3.695	1000	1.926		0.025534	5		2			5		1		1001	192		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.7112	7.638	1000	3.216		0.025534	6		8			6		11		1001	193		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.0187	5.585	1000	1.154		0.025534	7		11			7		9		1001	196		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.4107	9.035	1000	3.653		0.025534	7		1			7		1		1001	197		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.8039	8.341	1000	2.180		0.025534	7		4			7		6		1001	198		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	76.4835	1.804	1000	1.044		0.026952	6		6			6		6		1001	199		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3178	1.796	1000	1.284		0.026952	7		11			7		12		1001	201		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.8084	1.803	1000	1.409		0.026952	7		7			7		5		1001	202		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.8358	8.776	1000	3.658		0.026952	5		10			5		13		1001	203		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.5082	4.254	1000	3.118		0.026952	7		7			7		3		1001	204		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.8744	5.627	1000	3.617		0.026952	7		8			7		7		1001	206		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.4705	6.537	1000	2.101		0.026952	7		10			7		9		1001	207		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.6724	6.042	1000	3.217		0.026952	7		1			7		1		1001	209		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	72.1958	4.911	1000	2.910		0.026952	8		3			8		2		1001	211		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.9528	10.025	1000	3.395		0.026952	6		8			6		4		1001	212		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.8995	5.606	1000	1.283		0.026952	6		9			6		5		1001	213		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	74.3038	6.136	1000	1.372		0.040920	6		3			6		1		1001	214		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.0497	5.669	1000	2.869		0.040920	8		3			8		1		1001	215		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	80.5990	7.517	1000	3.509		0.040920	8		8			8		8		1001	217		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.2134	4.528	1000	3.213		0.040920	7		5			7		8		1001	218		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	71.0181	4.108	1000	0.860		0.040920	7		11			7		10		1001	219		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.7766	4.358	1000	1.657		0.040920	8		2			8		1		1001	223		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.3703	5.499	1000	3.388		0.091377	7		9			7		12		1001	224		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.3428	3.659	1000	0.913		0.091377	8		4			8		3		1001	226		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.2972	8.361	1000	3.379		0.091377	6		13			6		11		1001	227		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.1241	9.081	1000	2.823		0.091377	7		12			7		13		1001	228		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.7659	7.226	1000	2.259		0.091377	7		7			7		6		1001	229		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.5465	7.012	1000	2.776		0.091377	6		8			6		8		1001	230		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.4573	7.504	1000	3.731		0.110825	8		4			8		5		1001	231		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.2318	4.419	1000	1.028		0.110825	7		10			7		9		1001	232		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.5252	4.480	1000	2.477		0.110825	5		9			5		10		1001	234		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.8601	6.520	1000	3.151		0.110825	7		13			7		10		1001	235		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	76.1311	9.431	1000	3.691		0.110825	7		1			7		3		1001	237		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9978	10.713	1000	3.671		0.110825	8		1			8		1		1001	238		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.4349	4.153	1000	2.439		0.110825	8		8			8		6		1001	239		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.1654	6.257	1000	1.029		0.110825	6		11			6		9		1001	241		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6630	3.004	1000	1.564		0.110825	5		7			5		11		1001	242		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.8440	1.321	1000	0.803		0.110825	6		1			6		1		1001	243		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.2437	4.373	1000	3.362		0.110825	7		11			7		7		1001	244		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.7150	4.712	1000	2.450		0.110825	7		1			7		2		1001	246		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.4653	5.594	1000	2.732		0.208614	6		11			6		9		1001	248		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.3393	6.545	1000	1.476		0.208614	7		5			7		3		1001	250		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.5689	7.582	1000	3.502		0.208614	5		4			5		1		1001	251		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9317	5.576	1000	2.893		0.208614	6		5			6		2		1001	252		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0138	3.995	1000	3.084		0.208614	6		8			6		3		1001	254		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.9509	5.274	1000	1.629		0.208614	7		9			7		4		1001	255		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.6603	1.852	1000	0.809		0.208614	7		12			7		13		1001	258		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2191	8.615	1000	3.261		0.208614	6		14			6		10		1001	260		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8874	2.707	1000	1.976		0.208614	7		12			7		16		1001	264		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.0914	7.232	1000	3.298		0.208614	6		7			6		6		1001	265		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.4862	7.667	1000	3.075		0.208614	6		15			6		16		1001	266		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.1245	7.848	1000	3.213		0.208614	7		4			7		5		1001	268		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.9556	7.193	1000	2.063		0.208614	7		2			7		1		1001	271		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6573	5.373	1000	2.913		0.208614	7		16			7		14		1001	272		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.9621	7.239	1000	2.095		0.265892	7		18			7		21		1001	273		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2579	3.065	1000	1.829		0.265892	6		17			6		17		1001	274		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.9940	8.895	1000	3.575		0.265892	5		5			5		3		1001	276		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.2596	5.364	1000	3.011		0.265892	8		7			8		6		1001	277		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.2015	2.156	1000	1.483		0.265892	8		2			8		1		1001	278		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.3547	5.827	1000	1.667		0.265892	7		4			7		1		1001	279		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0304	5.127	1000	1.101		0.265892	6		12			6		9		1001	280		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8302	5.168	1000	1.813		0.265892	7		16			7		18		1001	281		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.5903	2.530	1000	1.397		0.265892	5		4			5		3		1001	282		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4284	7.772	1000	3.153		0.265892	8		2			8		1		1001	283		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.4731	4.322	1000	3.081		0.265892	6		9			6		8		1001	284		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.0455	3.293	1000	1.017		0.265892	6		5			6		2		1001	285		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.2198	9.078	1000	3.587		0.265892	5		13			5		14		1001	288		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8728	3.790	1000	1.824		0.265892	6		11			6		6		1001	290		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.8874	3.605	1000	2.811		0.265892	7		18			7		18		1001	292		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.2769	6.729	1000	3.266		0.275818	6		17			6		14		1001	293		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7817	3.753	1000	2.652		0.275818	6		18			6		15		1001	294		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.6173	6.646	1000	1.283		0.275818	6		6			6		6		1001	295		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.2255	4.256	1000	1.342		0.275818	6		15			6		11		1001	297		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.3146	6.820	1000	2.362		0.275818	6		14			6		13		1001	299		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8327	4.125	1000	1.669		0.275818	7		14			7		15		1001	300		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	81.9178	6.170	1000	2.312		0.275818	7		3			7		2		1001	302		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2274	4.587	1000	2.442		0.275818	6		17			6		13		1001	307		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.2969	5.421	1000	2.108		0.275818	7		12			7		13		1001	309		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.9496	3.507	1000	1.937		0.275818	6		11			6		10		1001	310		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.9653	5.002	1000	2.123		0.275818	6		10			6		12		1001	311		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6713	5.239	1000	1.523		0.275818	8		11			8		15		1001	312		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.1602	6.488	1000	3.445		0.275818	6		7			6		4		1001	313		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.7133	6.654	1000	1.160		0.313482	6		8			6		12		1001	314		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.6609	4.432	1000	2.915		0.313482	7		4			7		4		1001	318		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.2532	7.010	1000	2.727		0.313482	7		14			7		12		1001	319		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.3392	5.521	1000	1.284		0.313482	7		1			7		5		1001	320		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2821	7.793	1000	1.780		0.313482	8		16			8		13		1001	321		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3192	7.807	1000	2.576		0.313482	6		11			6		8		1001	322		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.2292	4.822	1000	0.823		0.313482	5		1			5		1		1001	325		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	77.6111	6.231	1000	1.505		0.313482	7		1			7		1		1001	326		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7751	3.313	1000	1.498		0.313482	6		15			6		12		1001	327		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8363	7.653	1000	2.406		0.328208	6		13			6		12		1001	328		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.3202	5.804	1000	3.076		0.328208	8		14			8		18		1001	330		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1625	3.926	1000	2.331		0.328208	8		16			8		13		1001	331		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.3212	9.203	1000	3.530		0.328208	7		16			7		20		1001	332		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	78.2261	4.877	1000	1.586		0.328208	7		11			7		12		1001	333		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.6628	5.254	1000	3.275		0.328208	8		14			8		18		1001	335		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7244	6.874	1000	1.476		0.328208	8		11			8		11		1001	338		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8120	3.180	1000	1.863		0.328208	7		3			7		1		1001	339		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.9716	3.354	1000	1.465		0.328208	6		6			6		6		1001	341		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1757	3.524	1000	0.868		0.329908	5		16			5		11		1001	342		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.3357	7.025	1000	3.187		0.329908	7		14			7		17		1001	343		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	75.3458	4.744	1000	2.873		0.329908	6		7			6		2		1001	344		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.4734	8.763	1000	2.510		0.329908	6		15			6		13		1001	346		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7723	6.073	1000	3.473		0.329908	5		6			5		3		1001	347		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.9180	4.798	1000	1.632		0.329908	7		16			7		17		1001	348		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.4370	3.646	1000	1.276		0.329908	5		7			5		9		1001	349		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	79.8998	6.927	1000	2.927		0.329908	8		1			8		4		1001	350		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.9415	5.425	1000	2.097		0.329908	7		12			7		11		1001	353		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1041	3.944	1000	1.438		0.329908	6		14			6		10		1001	354		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	83.3361	6.547	1000	3.018		0.329908	8		5			8		3		1001	355		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.0230	3.945	1000	2.417		0.329908	6		18			6		14		1001	357		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5408	6.628	1000	3.453		0.329908	6		2			6		1		1001	358		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6811	6.096	1000	2.864		0.329908	8		7			8		7		1001	363		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.3285	5.632	1000	1.774		0.371877	5		9			5		4		1001	364		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1593	8.785	1000	2.600		0.371877	8		5			8		3		1001	365		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9730	6.475	1000	2.661		0.371877	6		19			6		23		1001	368		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.8001	2.700	1000	2.158		0.371877	7		15			7		15		1001	369		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6080	1.504	1000	1.117		0.371877	8		17			8		17		1001	371		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4209	3.882	1000	2.754		0.371877	6		9			6		11		1001	372		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6166	1.803	1000	0.940		0.371877	7		15			7		16		1001	374		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9741	3.014	1000	2.356		0.371877	6		2			6		1		1001	375		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.5896	2.547	1000	1.457		0.371877	6		18			6		14		1001	376		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8175	5.098	1000	2.623		0.371877	5		9			5		7		1001	377		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.6539	8.570	1000	3.060		0.384389	6		7			6		8		1001	378		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.2531	4.431	1000	2.036		0.384389	8		7			8		11		1001	379		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0490	4.745	1000	1.287		0.384389	7		6			7		10		1001	381		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8899	2.700	1000	1.219		0.384389	5		9			5		12		1001	382		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7554	8.728	1000	3.424		0.384389	8		6			8		4		1001	383		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8666	5.526	1000	2.905		0.384389	6		8			6		4		1001	384		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7084	5.232	1000	1.349		0.384389	6		7			6		10		1001	385		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.0816	6.707	1000	2.295		0.384389	6		10			6		7		1001	386		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.1077	5.411	1000	3.203		0.384389	7		20			7		17		1001	388		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.4360	7.516	1000	1.765		0.384389	6		19			6		17		1001	389		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8501	6.402	1000	1.535		0.465165	7		20			7		17		1001	390		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9564	6.545	1000	2.847		0.465165	8		12			8		10		1001	392		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.4874	3.862	1000	2.475		0.465165	8		18			8		14		1001	393		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.5751	6.820	1000	2.316		0.465165	6		21			6		15		1001	394		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.5920	4.306	1000	1.474		0.465165	6		22			6		18		1001	395		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0442	4.756	1000	1.466		0.465165	6		13			6		9		1001	397		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.2025	4.816	1000	1.489		0.465165	6		10			6		11		1001	398		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.9543	3.318	1000	2.621		0.465165	7		7			7		1		1001	399		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.3519	5.181	1000	2.829		0.465165	6		11			6		8		1001	401		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9674	4.776	1000	1.245		0.465165	7		14			7		13		1001	402		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3236	8.972	1000	2.990		0.465165	7		19			7		13		1001	404		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	84.8834	4.021	1000	0.979		0.465165	6		12			6		10		1001	405		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3393	4.543	1000	2.642		0.465165	6		19			6		17		1001	408		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.3087	6.549	1000	3.258		0.465165	6		12			6		10		1001	410		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.5539	6.326	1000	2.397		0.465165	5		12			5		7		1001	411		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.7938	5.236	1000	1.300		0.465165	8		11			8		14		1001	413		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.9605	7.354	1000	2.871		0.489113	6		1			6		5		1001	414		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.7678	5.194	1000	2.751		0.489113	6		4			6		4		1001	416		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9562	9.265	1000	3.065		0.489113	8		19			8		21		1001	417		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	86.7061	9.666	1000	3.113		0.489113	7		21			7		24		1001	419		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.4103	4.523	1000	2.740		0.489113	8		8			8		2		1001	420		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8299	6.482	1000	1.485		0.489113	6		8			6		6		1001	421		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.4525	1.234	1000	0.935		0.489113	7		17			7		20		1001	422		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4062	3.572	1000	1.916		0.489113	8		18			8		20		1001	424		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4847	7.359	1000	2.573		0.489113	7		2			7		4		1001	427		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1027	7.427	1000	2.507		0.489113	7		5			7		8		1001	430		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.8545	4.298	1000	2.185		0.489113	5		3			5		1		1001	431		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	85.0868	2.479	1000	0.841		0.489113	6		9			6		9		1001	432		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8085	5.857	1000	2.994		0.489113	6		14			6		19		1001	433		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1004	6.363	1000	1.999		0.489113	8		5			8		1		1001	434		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0204	5.876	1000	2.757		0.489113	6		3			6		3		1001	435		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.4605	7.664	1000	2.844		0.489113	7		21			7		23		1001	436		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1627	4.132	1000	0.813		0.504165	6		15			6		12		1001	437		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	82.5798	7.188	1000	2.591		0.504165	6		22			6		20		1001	438		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9983	5.045	1000	2.455		0.504165	8		13			8		13		1001	440		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.0542	4.144	1000	2.558		0.504165	7		1			7		1		1001	442		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.1162	6.659	1000	1.954		0.504165	7		21			7		17		1001	443		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6249	5.387	1000	0.984		0.504165	8		21			8		17		1001	444		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.0295	7.225	1000	2.140		0.504165	8		2			8		1		1001	445		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.7660	4.236	1000	1.960		0.504165	7		9			7		8		1001	447		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3302	5.201	1000	2.251		0.691439	6		4			6		1		1001	448		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.9191	3.520	1000	1.505		0.691439	6		15			6		17		1001	449		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.8456	4.083	1000	1.207		0.691439	7		5			7		6		1001	450		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4635	7.546	1000	2.815		0.691439	5		24			5		18		1001	451		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3861	6.357	1000	1.138		0.691439	8		6			8		8		1001	455		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.1444	5.813	1000	2.917		0.691439	6		17			6		22		1001	456		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4092	6.761	1000	2.270		0.691439	5		2			5		5		1001	457		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9720	5.158	1000	2.520		0.691439	6		8			6		13		1001	459		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.8597	6.081	1000	2.197		0.691439	6		2			6		1		1001	460		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5946	7.785	1000	2.700		0.691439	8		8			8		11		1001	462		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4471	2.690	1000	1.561		0.691439	6		21			6		19		1001	464		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9474	2.845	1000	1.163		0.691439	5		24			5		20		1001	465		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.7615	6.547	1000	3.221		0.691439	6		5			6		7		1001	467		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1107	6.568	1000	3.076		0.714353	5		16			5		19		1001	468		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.2982	4.368	1000	1.192		0.714353	5		10			5		11		1001	471		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.6822	2.095	1000	0.968		0.714353	7		17			7		14		1001	472		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1151	7.085	1000	2.081		0.714353	5		21			5		17		1001	473		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1711	4.582	1000	1.231		0.714353	6		10			6		5		1001	475		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.6776	7.417	1000	3.004		0.714353	6		17			6		16		1001	477		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.6445	4.380	1000	1.221		0.714353	6		3			6		1		1001	481		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.1565	6.525	1000	1.088		0.714353	6		10			6		15		1001	483		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.8886	3.811	1000	1.268		0.714353	5		24			5		21		1001	485		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4666	8.090	1000	2.589		0.714353	5		18			5		23		1001	490		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.2821	4.264	1000	3.090		0.714353	5		12			5		15		1001	491		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9573	5.083	1000	2.391		0.714353	7		25			7		25		1001	492		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.9378	1.292	1000	0.959		0.714353	5		1			5		5		1001	494		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1929	7.427	1000	2.167		0.714353	6		6			6		4		1001	495		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7313	5.350	1000	2.095		0.714353	5		5			5		8		1001	496		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.9213	5.420	1000	1.157		0.714353	6		5			6		8		1001	498		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8413	4.534	1000	1.392		0.714353	8		8			8		6		1001	500		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0894	5.340	1000	3.316		0.714353	6		1			6		6		1001	502		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.8055	6.124	1000	3.155		0.714353	7		11			7		7		1001	503		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.0347	8.605	1000	2.688		0.714353	7		18			7		13		1001	504		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.7387	7.723	1000	2.086		0.892251	8		7			8		4		1001	505		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0061	6.808	1000	2.354		0.892251	6		27			6		23		1001	509		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2495	7.605	1000	3.110		0.892251	7		16			7		20		1001	511		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7182	8.110	1000	2.539		0.892251	8		22			8		24		1001	512		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1815	3.110	1000	1.144		0.892251	6		10			6		16		1001	513		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	89.4332	8.764	1000	2.546		0.892251	7		8			7		8		1001	514		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.0379	6.852	1000	1.268		0.892251	6		23			6		28		1001	517		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.4981	8.270	1000	2.303		0.892251	5		19			5		23		1001	518		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.3613	2.113	1000	0.975		0.892251	6		11			6		16		1001	522		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1320	5.335	1000	2.051		0.892251	6		8			6		13		1001	523		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9596	5.297	1000	1.177		0.892251	6		25			6		19		1001	525		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3626	3.891	1000	1.521		0.892251	7		12			7		10		1001	526		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3377	3.892	1000	2.186		0.892251	7		13			7		16		1001	527		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4639	6.141	1000	2.967		0.892251	7		26			7		22		1001	528		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9770	5.120	1000	1.272		0.892251	7		15			7		10		1001	529		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.5820	3.024	1000	1.815		0.892251	7		5			7		1		1001	530		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.9900	7.621	1000	2.264		0.892251	7		23			7		28		1001	531		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.4935	4.895	1000	1.130		0.892251	7		23			7		18		1001	532		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3558	9.231	1000	3.166		0.892251	5		21			5		21		1001	533		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.6904	6.084	1000	1.900		0.892251	8		22			8		16		1001	534		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.6944	1.743	1000	1.323		0.892251	6		5			6		7		1001	535		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.1654	3.470	1000	0.937		0.892251	6		8			6		10		1001	536		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.7237	3.769	1000	1.314		0.892251	6		21			6		23		1001	537		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.6345	6.781	1000	1.186		0.962834	8		16			8		17		1001	539		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.8046	3.022	1000	1.203		0.962834	6		12			6		14		1001	540		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0725	7.606	1000	2.672		0.962834	5		20			5		18		1001	542		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3782	7.346	1000	2.291		0.962834	7		28			7		24		1001	543		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.3595	7.755	1000	1.973		0.962834	6		12			6		11		1001	544		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.1250	7.184	1000	2.225		0.962834	8		18			8		22		1001	546		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3064	2.756	1000	1.120		0.962834	5		6			5		10		1001	547		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4673	4.115	1000	1.327		0.962834	6		26			6		19		1001	549		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5059	5.814	1000	2.125		0.962834	7		27			7		28		1001	550		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2274	2.757	1000	1.805		0.962834	6		8			6		12		1001	552		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9205	7.089	1000	2.057		0.962834	6		16			6		17		1001	554		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3355	8.815	1000	2.607		0.962834	7		7			7		8		1001	555		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4339	4.448	1000	2.528		0.964928	5		28			5		24		1001	557		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.4483	5.276	1000	2.246		0.964928	8		5			8		10		1001	558		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.1671	4.530	1000	0.781		0.964928	6		15			6		18		1001	559		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5306	6.006	1000	2.545		0.964928	6		13			6		15		1001	560		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.3317	3.027	1000	1.180		0.964928	8		5			8		2		1001	561		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8144	3.988	1000	1.087		0.964928	6		15			6		9		1001	562		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.2178	6.620	1000	2.979		0.964928	6		13			6		9		1001	563		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6521	7.214	1000	2.111		0.964928	8		21			8		18		1001	564		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3204	2.971	1000	1.615		0.964928	6		9			6		7		1001	565		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.7630	5.416	1000	2.164		0.964928	6		15			6		10		1001	567		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.3055	3.475	1000	1.438		0.964928	7		2			7		1		1001	569		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8270	5.974	1000	1.730		0.964928	5		27			5		25		1001	573		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.7900	3.513	1000	2.353		0.964928	8		7			8		1		1001	575		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6898	6.499	1000	2.850		0.964928	5		21			5		22		1001	577		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.1551	2.890	1000	1.535		0.964928	6		9			6		3		1001	578		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.9768	3.213	1000	1.733		0.964928	6		8			6		13		1001	581		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3083	4.943	1000	3.158		1.039013	8		28			8		27		1001	582		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2413	4.068	1000	3.151		1.039013	6		28			6		21		1001	583		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3238	5.783	1000	1.060		1.039013	8		10			8		7		1001	584		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9569	7.818	1000	2.772		1.039013	8		14			8		8		1001	585		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9767	6.315	1000	2.528		1.039013	7		22			7		25		1001	586		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9742	4.434	1000	2.505		1.039013	8		7			8		8		1001	588		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.2435	4.860	1000	0.872		1.039013	5		12			5		18		1001	589		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5883	4.317	1000	1.733		1.039013	7		6			7		8		1001	590		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2774	7.760	1000	1.886		1.039013	7		13			7		10		1001	591		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5475	6.465	1000	2.280		1.039013	6		15			6		19		1001	593		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9508	6.970	1000	2.885		1.039013	7		13			7		9		1001	596		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5467	5.613	1000	1.188		1.039013	6		6			6		7		1001	598		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5161	2.161	1000	0.805		1.058242	6		12			6		7		1001	599		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9718	5.722	1000	1.171		1.058242	6		1			6		1		1001	601		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.8342	1.971	1000	1.058		1.058242	7		23			7		26		1001	602		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7453	6.969	1000	2.158		1.058242	6		16			6		12		1001	605		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3736	5.143	1000	3.176		1.058242	5		14			5		14		1001	606		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.2588	7.430	1000	2.032		1.058242	7		12			7		12		1001	607		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1047	4.779	1000	0.888		1.058242	8		28			8		26		1001	608		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4689	4.690	1000	1.740		1.058242	8		14			8		7		1001	610		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.9525	6.628	1000	3.017		1.058242	7		26			7		29		1001	611		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8425	2.879	1000	2.041		1.058242	6		4			6		1		1001	612		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5616	6.832	1000	1.446		1.058242	6		22			6		21		1001	613		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.6813	6.103	1000	0.951		1.058242	7		25			7		30		1001	614		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3502	7.206	1000	2.369		1.087039	6		3			6		2		1001	615		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1049	8.447	1000	3.068		1.087039	7		4			7		8		1001	617		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0548	4.408	1000	2.904		1.087039	5		6			5		2		1001	618		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1019	3.339	1000	1.367		1.087039	6		23			6		19		1001	619		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.9854	4.778	1000	2.964		1.087039	6		10			6		10		1001	621		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.3895	3.118	1000	1.381		1.087039	6		13			6		6		1001	622		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.8648	4.204	1000	1.675		1.087039	6		4			6		8		1001	623		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.8009	5.290	1000	1.865		1.087039	6		2			6		1		1001	624		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4230	8.073	1000	2.881		1.087039	7		10			7		6		1001	625		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.2891	2.070	1000	1.069		1.087039	5		7			5		9		1001	628		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5207	6.818	1000	1.470		1.087039	6		14			6		12		1001	631		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1711	5.272	1000	2.523		1.087039	5		1			5		4		1001	632		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1436	5.305	1000	1.784		1.087039	5		10			5		5		1001	634		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9047	3.790	1000	1.139		1.087039	6		24			6		19		1001	637		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0229	4.628	1000	0.800		1.087039	6		13			6		8		1001	639		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.6208	7.678	1000	2.151		1.087039	7		19			7		25		1001	640		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	88.3593	4.963	1000	1.771		1.087039	7		20			7		17		1001	642		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.4218	4.624	1000	2.215		1.087039	6		14			6		18		1001	645		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	87.4679	7.762	1000	1.874		1.186281	7		15			7		10		1001	646		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.5510	6.442	1000	1.225		1.186281	6		29			6		26		1001	647		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.1167	7.249	1000	2.235		1.186281	8		7			8		13		1001	648		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1494	2.018	1000	1.375		1.186281	6		20			6		15		1001	649		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4363	1.615	1000	1.107		1.186281	5		21			5		16		1001	651		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3455	3.004	1000	2.298		1.186281	6		28			6		30		1001	652		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9116	4.323	1000	2.542		1.186281	7		23			7		27		1001	653		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.4525	7.278	1000	3.060		1.186281	6		21			6		22		1001	654		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8772	7.716	1000	2.451		1.186281	8		9			8		10		1001	657		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3057	5.844	1000	1.515		1.186281	5		13			5		18		1001	660		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0007	5.546	1000	1.872		1.186281	5		7			5		7		1001	661		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2129	3.253	1000	0.975		1.186281	6		22			6		25		1001	662		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5102	7.756	1000	2.966		1.186281	8		9			8		2		1001	665		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.9420	4.350	1000	3.123		1.186281	7		12			7		9		1001	666		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0536	8.211	1000	3.061		1.186281	6		2			6		1		1001	667		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1700	4.667	1000	1.633		1.186281	7		7			7		3		1001	669		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7582	1.995	1000	1.032		1.186281	8		1			8		4		1001	670		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.5795	1.300	1000	0.797		1.186281	5		29			5		35		1001	671		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.0853	8.211	1000	2.196		1.186281	7		5			7		5		1001	672		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.6012	4.222	1000	1.281		1.186281	6		13			6		11		1001	673		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9798	4.914	1000	2.359		1.186281	7		23			7		18		1001	674		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2230	3.649	1000	0.786		1.186281	7		13			7		9		1001	675		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3487	4.748	1000	2.857		1.186281	5		24			5		27		1001	679		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1828	6.541	1000	3.056		1.186281	6		17			6		16		1001	680		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3066	3.915	1000	3.092		1.186281	5		6			5		12		1001	681		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.3091	5.410	1000	2.536		1.186281	7		14			7		8		1001	685		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6616	4.497	1000	1.167		1.190511	7		25			7		30		1001	686		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6037	3.504	1000	1.728		1.190511	6		2			6		6		1001	687		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.1524	5.197	1000	1.108		1.190511	6		14			6		16		1001	691		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0330	3.784	1000	0.767		1.190511	6		18			6		11		1001	694		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4105	2.681	1000	1.926		1.190511	6		25			6		30		1001	695		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	91.2416	5.244	1000	2.071		1.190511	7		16			7		21		1001	696		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.2418	9.123	1000	3.101		1.190511	5		19			5		22		1001	697		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0416	4.001	1000	2.672		1.190511	7		8			7		5		1001	700		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0390	4.475	1000	1.801		1.190511	5		20			5		16		1001	701		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.0404	4.498	1000	0.919		1.190511	8		7			8		9		1001	703		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.5783	3.562	1000	1.578		1.190511	6		4			6		1		1001	704		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9975	7.345	1000	2.535		1.190511	6		29			6		28		1001	705		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	94.9378	5.762	1000	1.890		1.284078	6		29			6		23		1001	706		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1041	6.638	1000	2.266		1.284078	7		12			7		6		1001	709		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2960	2.326	1000	1.026		1.284078	7		14			7		18		1001	710		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.6961	2.896	1000	1.646		1.284078	7		6			7		1		1001	712		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.9696	5.945	1000	2.492		1.284078	7		4			7		8		1001	714		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.0881	5.140	1000	1.872		1.284078	6		15			6		21		1001	719		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.2374	7.394	1000	3.082		1.284078	7		30			7		23		1001	722		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5922	6.087	1000	2.303		1.284078	8		10			8		16		1001	727		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.9701	6.810	1000	1.304		1.284078	7		13			7		15		1001	728		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.1983	6.297	1000	2.125		1.284078	7		11			7		6		1001	730		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.0239	6.268	1000	2.616		1.284078	8		12			8		10		1001	731		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.2227	5.682	1000	1.126		1.284078	5		20			5		18		1001	732		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2134	4.289	1000	0.798		1.284078	7		11			7		6		1001	733		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0926	6.679	1000	2.327		1.284078	5		22			5		26		1001	735		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.4146	5.427	1000	2.341		1.284078	6		14			6		16		1001	736		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3061	6.850	1000	1.857		1.284078	7		1			7		4		1001	739		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	93.1535	5.204	1000	1.230		1.284078	7		7			7		2		1001	740		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.0950	6.197	1000	0.958		1.487587	5		10			5		12		1001	741		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9001	1.284	1000	0.960		1.487587	7		32			7		33		1001	742		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8462	8.244	1000	2.473		1.487587	7		5			7		12		1001	744		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.7622	4.106	1000	1.816		1.487587	7		5			7		6		1001	745		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3210	5.749	1000	1.882		1.487587	7		1			7		2		1001	747		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2929	4.860	1000	1.377		1.487587	5		7			5		5		1001	748		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1516	6.304	1000	1.792		1.487587	6		32			6		32		1001	749		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.5972	4.420	1000	1.140		1.487587	5		32			5		35		1001	750		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.1973	7.794	1000	2.999		1.487587	5		4			5		8		1001	751		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0803	4.234	1000	2.427		1.487587	7		32			7		26		1001	752		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.5551	4.698	1000	0.970		1.487587	8		21			8		23		1001	755		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	90.8223	5.163	1000	2.801		1.487587	7		13			7		14		1001	757		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0086	6.860	1000	2.136		1.487587	7		32			7		34		1001	758		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2775	3.260	1000	1.678		1.487587	6		20			6		25		1001	760		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0026	5.702	1000	1.143		1.487587	7		16			7		15		1001	762		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2797	1.521	1000	1.110		1.487587	7		32			7		39		1001	763		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.1546	5.477	1000	0.889		1.487587	6		30			6		31		1001	764		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2432	2.471	1000	1.653		1.622614	6		12			6		14		1001	765		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.2367	6.283	1000	2.644		1.622614	5		5			5		6		1001	766		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.7113	4.566	1000	2.548		1.622614	7		23			7		21		1001	767		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5604	5.195	1000	2.029		1.622614	8		2			8		6		1001	768		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8901	4.817	1000	2.411		1.622614	5		23			5		23		1001	769		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.8352	6.243	1000	2.914		1.622614	6		29			6		22		1001	771		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.3432	5.662	1000	2.740		1.622614	8		25			8		22		1001	774		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3860	4.283	1000	0.811		1.622614	6		28			6		24		1001	775		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.4827	8.137	1000	2.065		1.622614	5		30			5		28		1001	777		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2488	3.104	1000	1.484		1.622614	7		19			7		12		1001	779		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2774	2.753	1000	1.821		1.622614	7		11			7		13		1001	780		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9984	3.051	1000	1.439		1.622614	7		11			7		13		1001	781		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1014	6.082	1000	2.526		1.622614	6		7			6		2		1001	782		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.3202	5.193	1000	1.680		1.622614	6		32			6		32		1001	783		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6998	2.676	1000	0.937		1.622614	5		17			5		22		1001	784		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.3220	7.222	1000	1.936		1.622614	5		26			5		29		1001	785		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.8680	2.212	1000	0.958		1.622614	8		25			8		31		1001	787		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1215	6.425	1000	2.350		1.622614	7		1			7		1		1001	789		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4710	6.194	1000	1.900		1.622614	5		3			5		1		1001	790		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.1619	4.847	1000	2.182		1.622614	6		33			6		27		1001	792		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6263	6.802	1000	1.877		1.622614	7		33			7		38		1001	793		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.0538	9.241	1000	2.896		1.622614	6		21			6		20		1001	794		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6458	5.256	1000	1.566		1.622614	6		20			6		26		1001	795		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.0213	8.129	1000	2.722		1.622614	5		7			5		2		1001	798		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.2552	3.372	1000	1.295		1.622614	7		9			7		1		1001	799		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.5095	3.347	1000	1.350		1.622614	6		12			6		18		1001	800		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6383	4.985	1000	1.178		1.622614	7		6			7		5		1001	802		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2749	4.562	1000	0.910		1.797864	6		29			6		34		1001	803		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9341	4.458	1000	2.380		1.797864	7		3			7		1		1001	805		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7974	8.307	1000	2.790		1.797864	8		28			8		23		1001	807		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4282	9.034	1000	2.746		1.797864	6		19			6		16		1001	808		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3295	5.951	1000	1.681		1.797864	6		25			6		31		1001	810		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.4193	4.113	1000	0.983		1.797864	8		25			8		31		1001	811		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.0818	4.721	1000	0.962		1.797864	8		31			8		37		1001	813		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.4146	4.037	1000	2.879		1.797864	6		30			6		36		1001	814		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9493	4.698	1000	2.633		1.797864	8		9			8		6		1001	817		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6543	5.613	1000	2.188		1.797864	7		32			7		33		1001	818		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.1055	3.721	1000	1.705		1.797864	7		4			7		1		1001	820		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.6590	5.310	1000	1.088		1.797864	7		27			7		29		1001	821		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.2850	5.810	1000	2.908		1.797864	6		32			6		26		1001	822		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9394	3.911	1000	1.408		1.797864	6		27			6		32		1001	824		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.0306	4.548	1000	1.752		1.797864	6		17			6		14		1001	825		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	92.0119	4.955	1000	2.711		1.797864	7		22			7		27		1001	826		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6009	1.969	1000	1.533		1.797864	5		33			5		34		1001	827		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9442	4.294	1000	1.183		1.797864	7		22			7		26		1001	828		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.9225	6.355	1000	1.825		1.797864	5		35			5		35		1001	829		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	97.3142	8.162	1000	2.815		1.797864	7		26			7		21		1001	830		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6254	2.707	1000	0.794		1.797864	7		22			7		27		1001	831		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	96.7574	7.807	1000	2.202		1.797864	6		15			6		14		1001	832		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4131	6.374	1000	1.597		1.797864	6		17			6		11		1001	833		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.2721	4.899	1000	1.400		1.797864	8		10			8		6		1001	834		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.4480	3.380	1000	1.556		1.797864	6		13			6		7		1001	839		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5670	4.098	1000	2.360		1.797864	6		24			6		24		1001	842		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.5399	5.533	1000	2.054		1.797864	6		7			6		2		1001	843		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.0302	3.764	1000	1.369		1.911802	7		8			7		6		1001	845		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	95.6719	3.262	1000	1.371		1.911802	7		9			7		16		1001	847		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9296	6.303	1000	1.063		1.911802	7		28			7		31		1001	851		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7991	6.530	1000	2.574		1.911802	8		33			8		35		1001	852		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.9265	4.421	1000	1.885		1.911802	7		29			7		31		1001	855		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4898	5.281	1000	1.308		1.911802	6		29			6		27		1001	856		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.8275	2.544	1000	1.521		1.911802	6		36			6		38		1001	857		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	98.8697	5.759	1000	1.696		1.911802	7		21			7		25		1001	859		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3341	8.692	1000	2.821		1.911802	8		32			8		29		1001	861		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.2659	7.081	1000	2.216		1.911802	6		16			6		14		1001	862		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1859	8.014	1000	2.891		1.911802	5		20			5		12		1001	863		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.9458	5.414	1000	2.083		1.911802	7		23			7		21		1001	865		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7741	3.537	1000	1.041		1.911802	7		23			7		29		1001	866		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.1004	5.757	1000	2.249		1.911802	6		36			6		40		1001	868		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.7870	7.797	1000	2.391		1.911802	6		31			6		34		1001	870		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.6440	7.751	1000	2.877		1.911802	7		30			7		26		1001	872		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5851	4.819	1000	2.587		1.911802	7		21			7		16		1001	875		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5482	6.063	1000	1.559		1.911802	6		36			6		41		1001	876		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1880	5.360	1000	1.181		1.911802	7		32			7		35		1001	880		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.8461	7.176	1000	1.881		1.911802	5		8			5		6		1001	881		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.3677	6.077	1000	1.176		1.911802	6		29			6		30		1001	882		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9614	6.644	1000	1.158		1.911802	7		34			7		40		1001	883		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.5778	2.966	1000	1.766		1.911802	6		22			6		15		1001	885		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.8243	3.149	1000	1.387		1.911802	6		29			6		36		1001	886		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.8334	6.535	1000	1.572		1.911802	6		30			6		34		1001	889		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.7056	6.223	1000	2.118		1.911802	6		33			6		37		1001	890		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.1423	2.686	1000	1.811		1.911802	6		10			6		14		1001	891		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.6192	5.559	1000	1.384		2.031521	7		11			7		7		1001	893		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.3320	2.924	1000	2.298		2.031521	6		17			6		18		1001	894		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.5979	4.954	1000	2.538		2.031521	6		17			6		21		1001	895		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4557	6.726	1000	1.887		2.031521	7		3			7		1		1001	896		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3299	3.497	1000	2.276		2.031521	7		29			7		21		1001	897		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0353	4.112	1000	1.123		2.031521	6		37			6		40		1001	898		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.4699	7.096	1000	2.674		2.031521	8		22			8		21		1001	901		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3921	8.214	1000	2.599		2.031521	6		36			6		33		1001	902		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.9969	5.042	1000	1.226		2.031521	7		17			7		13		1001	903		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.7485	5.370	1000	2.366		2.031521	7		13			7		14		1001	906		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6877	3.173	1000	2.309		2.031521	7		5			7		11		1001	908		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2328	5.327	1000	2.403		2.031521	5		18			5		18		1001	909		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7122	2.690	1000	1.201		2.031521	5		34			5		31		1001	910		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.2275	4.763	1000	2.281		2.031521	8		13			8		17		1001	913		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8810	3.129	1000	2.258		2.253699	7		3			7		1		1001	914		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.5414	7.344	1000	2.246		2.253699	6		18			6		10		1001	916		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3749	6.282	1000	2.715		2.253699	7		32			7		35		1001	918		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3624	6.246	1000	1.411		2.253699	8		2			8		3		1001	919		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.4498	6.147	1000	2.623		2.253699	5		3			5		1		1001	921		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6742	5.010	1000	1.585		2.253699	8		20			8		20		1001	922		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2397	5.586	1000	1.654		2.253699	6		38			6		46		1001	925		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.3797	5.176	1000	0.751		2.253699	6		35			6		31		1001	926		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6585	5.131	1000	1.021		2.253699	5		3			5		1		1001	927		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8408	4.953	1000	1.716		2.253699	7		18			7		21		1001	928		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	100.6576	2.600	1000	1.276		2.253699	8		3			8		10		1001	930		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	102.8699	4.198	1000	2.203		2.253699	6		5			6		5		1001	933		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.5532	7.145	1000	1.784		2.253699	7		18			7		23		1001	935		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2083	5.576	1000	1.997		2.253699	7		29			7		29		1001	937		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1263	4.426	1000	2.336		2.253699	5		23			5		29		1001	938		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.8915	5.097	1000	2.392		2.253699	7		37			7		35		1001	939		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8628	3.109	1000	1.431		2.253699	8		19			8		23		1001	943		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.3868	4.488	1000	1.033		2.253699	7		31			7		35		1001	944		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0582	7.730	1000	2.062		2.253699	8		38			8		35		1001	945		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0693	3.326	1000	1.605		2.253699	6		5			6		1		1001	946		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.6417	3.792	1000	1.091		2.286799	6		31			6		29		1001	948		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.3683	3.694	1000	2.455		2.286799	6		17			6		19		1001	949		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.0838	3.106	1000	2.365		2.286799	6		18			6		19		1001	950		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2019	3.164	1000	1.703		2.286799	6		10			6		9		1001	952		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2312	2.957	1000	1.784		2.286799	5		29			5		34		1001	955		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6005	2.574	1000	2.029		2.286799	5		12			5		4		1001	958		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.1781	5.495	1000	1.768		2.286799	6		37			6		44		1001	959		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	101.2764	5.554	1000	1.947		2.286799	6		25			6		31		1001	960		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9342	6.528	1000	1.987		2.592751	6		17			6		21		1001	961		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.6368	4.155	1000	2.308		2.592751	5		37			5		44		1001	962		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8225	2.634	1000	0.864		2.592751	8		41			8		39		1001	963		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1668	7.279	1000	1.881		2.592751	7		11			7		17		1001	964		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.9775	1.875	1000	0.917		2.592751	7		17			7		20		1001	965		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4535	5.460	1000	2.108		2.592751	7		36			7		33		1001	971		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.2602	3.777	1000	2.016		2.592751	6		16			6		23		1001	972		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.4751	5.168	1000	2.452		2.592751	7		27			7		33		1001	974		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.8137	4.501	1000	1.555		2.592751	5		9			5		1		1001	975		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1893	5.399	1000	1.419		2.592751	6		29			6		28		1001	977		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	99.1801	4.856	1000	1.675		2.592751	6		41			6		41		1001	979		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9847	7.765	1000	2.355		2.592751	6		33			6		25		1001	980		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	103.7541	3.834	1000	1.031		2.592751	7		16			7		8		1001	982		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3959	3.031	1000	0.856		2.592751	6		14			6		12		1001	983		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0679	7.453	1000	1.960		2.592751	8		22			8		25		1001	984		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.7720	4.351	1000	0.873		2.592751	8		16			8		22		1001	985		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6239	5.134	1000	1.694		2.592751	5		19			5		21		1001	986		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.9307	5.473	1000	2.440		2.592751	6		18			6		20		1001	987		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.3606	3.162	1000	1.684		2.592751	6		13			6		18		1001	988		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3626	2.335	1000	1.561		2.592751	6		25			6		22		1001	989		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2931	3.296	1000	1.433		2.592751	6		3			6		9		1001	990		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.2251	6.554	1000	2.445		2.592751	8		12			8		8		1001	992		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5696	3.687	1000	2.194		2.592751	7		39			7		39		1001	993		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.0956	5.277	1000	2.355		2.592751	8		33			8		29		1001	996		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4629	2.203	1000	0.914		2.592751	6		9			6		4		1001	997		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8274	1.115	1000	0.838		2.592751	8		38			8		42		1001	998		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1004	4.697	1000	2.446		2.773533	6		24			6		19		1001	999		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5569	3.242	1000	1.976		2.773533	6		30			6		23		1001	1001		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.8835	4.514	1000	1.260		2.773533	6		22			6		21		1001	1002		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0323	5.256	1000	2.639		2.773533	5		21			5		24		1001	1003		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.7613	4.220	1000	0.838		2.773533	8		19			8		14		1001	1004		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3889	5.093	1000	2.572		2.773533	8		24			8		17		1001	1005		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2047	6.867	1000	1.571		2.773533	8		4			8		1		1001	1006		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6001	4.915	1000	1.295		2.773533	7		18			7		24		1001	1008		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7457	6.214	1000	1.147		2.773533	7		23			7		29		1001	1009		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.8239	7.093	1000	2.543		2.773533	6		41			6		37		1001	1010		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.3387	2.840	1000	1.700		2.773533	6		37			6		32		1001	1011		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3326	5.314	1000	1.970		2.773533	6		25			6		19		1001	1012		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5886	6.304	1000	1.242		2.773533	6		16			6		16		1001	1013		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6907	2.462	1000	1.372		2.773533	7		3			7		9		1001	1014		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7281	6.873	1000	2.539		2.773533	8		21			8		17		1001	1019		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.2797	6.071	1000	2.351		2.773533	5		1			5		7		1001	1026		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.4621	5.373	1000	0.807		2.773533	6		5			6		1		1001	1028		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1382	6.781	1000	2.561		2.773533	7		15			7		15		1001	1030		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.6383	4.098	1000	1.507		2.773533	7		9			7		4		1001	1032		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.2742	3.271	1000	1.111		2.982227	7		17			7		25		1001	1033		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.3518	5.035	1000	2.545		2.982227	6		22			6		16		1001	1034		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0116	5.408	1000	2.102		2.982227	6		26			6		21		1001	1035		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.4618	6.191	1000	1.596		2.982227	6		37			6		39		1001	1037		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7909	3.110	1000	1.868		2.982227	8		39			8		45		1001	1039		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.3010	6.573	1000	1.114		2.982227	6		37			6		33		1001	1040		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3330	3.995	1000	2.363		2.982227	5		10			5		17		1001	1042		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5948	6.123	1000	1.118		2.982227	7		5			7		1		1001	1043		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1181	5.709	1000	1.904		2.982227	8		31			8		28		1001	1044		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4509	4.014	1000	1.015		2.982227	7		28			7		32		1001	1046		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5445	4.086	1000	1.524		2.982227	6		14			6		10		1001	1049		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.7198	5.456	1000	1.992		2.982227	7		3			7		1		1001	1051		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9637	4.004	1000	1.465		2.982227	8		9			8		11		1001	1052		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.0217	3.985	1000	0.780		2.982227	8		39			8		43		1001	1053		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1441	6.210	1000	0.907		2.982227	6		3			6		1		1001	1055		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.7774	5.924	1000	1.265		2.982227	7		2			7		1		1001	1057		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.2444	3.883	1000	1.654		2.982227	6		43			6		39		1001	1059		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8604	6.131	1000	1.245		2.982227	6		3			6		1		1001	1061		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.8230	7.314	1000	2.368		2.982227	7		10			7		1		1001	1062		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.1502	2.984	1000	1.263		2.982227	8		32			8		23		1001	1063		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4627	7.228	1000	2.605		3.025614	6		20			6		19		1001	1064		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0425	6.253	1000	1.091		3.025614	5		28			5		31		1001	1065		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7593	2.876	1000	1.435		3.025614	5		32			5		33		1001	1066		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5066	6.934	1000	1.891		3.025614	5		2			5		6		1001	1067		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5739	3.703	1000	1.242		3.025614	6		39			6		45		1001	1068		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5867	1.624	1000	0.984		3.025614	6		24			6		17		1001	1069		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.7627	4.874	1000	0.957		3.025614	7		35			7		42		1001	1070		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2721	6.660	1000	1.433		3.025614	7		17			7		8		1001	1071		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5063	2.607	1000	1.433		3.025614	7		20			7		22		1001	1073		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.9990	2.724	1000	0.979		3.025614	6		36			6		34		1001	1075		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.1287	4.845	1000	1.417		3.080989	6		44			6		48		1001	1078		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.5186	5.337	1000	2.044		3.080989	7		6			7		4		1001	1079		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.1245	5.774	1000	2.377		3.080989	7		39			7		48		1001	1080		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0062	3.792	1000	0.845		3.080989	6		23			6		30		1001	1081		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.7817	7.212	1000	2.247		3.080989	7		40			7		35		1001	1082		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.5784	3.123	1000	1.322		3.080989	7		23			7		17		1001	1084		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8138	6.099	1000	1.130		3.080989	8		36			8		27		1001	1086		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0520	6.599	1000	2.111		3.080989	8		28			8		29		1001	1087		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9719	3.759	1000	2.537		3.080989	7		40			7		37		1001	1088		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8687	5.629	1000	1.318		3.080989	6		2			6		5		1001	1089		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5812	3.064	1000	1.847		3.080989	6		44			6		38		1001	1090		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	104.8377	6.759	1000	2.384		3.080989	7		35			7		42		1001	1091		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9180	7.281	1000	2.161		3.136250	7		13			7		18		1001	1092		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.3494	4.690	1000	1.310		3.136250	7		5			7		3		1001	1093		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	107.4123	7.614	1000	2.361		3.136250	8		41			8		47		1001	1094		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6234	5.121	1000	1.281		3.136250	6		29			6		31		1001	1095		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7860	5.228	1000	1.768		3.136250	8		14			8		9		1001	1097		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.2802	2.785	1000	0.884		3.136250	5		4			5		2		1001	1100		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.9036	5.935	1000	1.381		3.136250	7		30			7		27		1001	1104		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5846	7.627	1000	2.475		3.136250	7		44			7		47		1001	1107		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.0182	3.588	1000	0.952		3.136250	7		24			7		25		1001	1108		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4853	4.630	1000	0.802		3.136250	8		6			8		1		1001	1109		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4993	3.553	1000	1.157		3.136250	6		17			6		13		1001	1110		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2624	5.187	1000	0.763		3.136250	8		11			8		4		1001	1111		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.4374	3.125	1000	1.888		3.136250	6		13			6		14		1001	1112		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.0463	2.395	1000	1.821		3.136250	6		16			6		14		1001	1114		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.7817	2.783	1000	1.423		3.136250	8		43			8		47		1001	1115		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.6476	4.258	1000	2.228		3.136250	7		1			7		6		1001	1116		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.0800	1.773	1000	0.922		3.136250	8		36			8		38		1001	1118		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4171	7.570	1000	2.209		3.136250	6		38			6		36		1001	1119		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8971	2.805	1000	2.223		3.136250	8		9			8		7		1001	1121		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3971	6.914	1000	2.034		3.136250	6		7			6		9		1001	1123		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0919	5.410	1000	1.947		3.136250	7		40			7		45		1001	1124		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0754	7.449	1000	2.298		3.136250	7		43			7		43		1001	1125		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.3622	4.763	1000	0.878		3.136250	7		10			7		10		1001	1127		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.8539	4.372	1000	0.924		3.136250	6		12			6		18		1001	1128		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.4532	3.653	1000	2.194		3.136250	7		11			7		13		1001	1129		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2903	5.236	1000	0.733		3.136250	7		36			7		31		1001	1131		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.7018	5.827	1000	2.178		3.136250	7		25			7		27		1001	1132		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6208	5.213	1000	2.241		3.136250	5		31			5		28		1001	1133		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4038	3.361	1000	1.645		3.136250	5		16			5		24		1001	1134		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.5459	1.255	1000	0.794		3.136250	8		24			8		16		1001	1135		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4999	5.835	1000	1.682		3.136250	7		1			7		3		1001	1137		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.8601	7.289	1000	2.201		3.136250	6		16			6		17		1001	1138		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	105.9481	6.903	1000	2.398		3.136250	6		29			6		31		1001	1139		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4019	6.688	1000	1.738		3.242798	8		13			8		13		1001	1140		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	106.5890	6.263	1000	1.361		3.242798	5		18			5		20		1001	1141		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.2420	2.626	1000	1.364		3.242798	6		11			6		10		1001	1142		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	108.3974	5.238	1000	1.942		3.242798	8		22			8		20		1001	1144		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9693	4.991	1000	1.298		3.242798	8		39			8		33		1001	1145		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.4627	3.095	1000	1.833		3.242798	7		23			7		13		1001	1147		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.3193	4.843	1000	0.920		3.242798	6		25			6		29		1001	1148		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.6924	4.554	1000	1.201		3.242798	7		42			7		45		1001	1149		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8567	3.501	1000	1.688		3.242798	7		43			7		33		1001	1150		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.5535	4.930	1000	2.106		3.437620	7		45			7		47		1001	1153		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.0142	2.360	1000	1.384		3.437620	5		26			5		20		1001	1154		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.8114	6.250	1000	1.195		3.437620	8		15			8		21		1001	1155		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7330	7.227	1000	1.861		3.437620	7		25			7		19		1001	1156		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7974	6.044	1000	1.845		3.437620	5		31			5		23		1001	1157		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5637	5.605	1000	1.152		3.437620	5		9			5		14		1001	1159		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4098	3.655	1000	1.858		3.437620	5		41			5		45		1001	1160		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8265	5.573	1000	1.962		3.437620	6		25			6		20		1001	1163		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.8023	6.632	1000	2.441		3.437620	6		42			6		32		1001	1164		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9119	6.418	1000	1.463		3.437620	6		4			6		4		1001	1165		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.3229	5.543	1000	1.487		3.437620	8		3			8		11		1001	1166		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.2344	5.128	1000	1.878		3.437620	8		41			8		37		1001	1167		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.0654	2.866	1000	1.310		3.437620	7		17			7		15		1001	1168		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.4285	3.685	1000	2.001		3.437620	7		35			7		35		1001	1169		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6450	3.875	1000	1.075		3.437620	7		3			7		1		1001	1170		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.1004	6.894	1000	2.314		3.437620	7		32			7		22		1001	1171		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4374	2.875	1000	1.430		3.437620	7		18			7		19		1001	1172		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.9471	2.841	1000	1.255		3.437620	7		17			7		17		1001	1174		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.6312	3.913	1000	1.354		3.437620	7		11			7		7		1001	1175		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5901	2.575	1000	1.899		3.437620	5		1			5		1		1001	1177		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	109.7399	4.392	1000	2.240		3.816031	7		26			7		26		1001	1178		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5071	4.457	1000	2.435		3.816031	6		4			6		1		1001	1179		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3564	6.604	1000	2.271		3.816031	7		6			7		3		1001	1180		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0022	3.246	1000	0.929		3.816031	6		2			6		1		1001	1181		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5491	5.411	1000	2.112		3.816031	5		15			5		17		1001	1183		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4376	4.121	1000	0.807		3.816031	8		31			8		35		1001	1187		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.2543	2.041	1000	1.531		3.816031	6		34			6		36		1001	1188		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9844	4.976	1000	1.866		3.816031	8		27			8		18		1001	1189		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.1273	3.833	1000	1.989		3.816031	6		13			6		3		1001	1190		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2772	3.963	1000	1.244		3.816031	7		23			7		30		1001	1191		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.7254	3.303	1000	0.930		3.816031	7		23			7		28		1001	1194		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.9126	6.047	1000	1.513		3.816031	7		28			7		26		1001	1196		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0820	2.109	1000	0.793		3.816031	6		25			6		17		1001	1197		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3144	6.646	1000	1.651		3.884063	6		3			6		2		1001	1198		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4696	1.408	1000	0.876		3.884063	6		19			6		25		1001	1199		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4906	4.249	1000	2.400		3.884063	6		21			6		17		1001	1200		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.8002	4.386	1000	1.238		3.884063	7		33			7		30		1001	1201		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6742	5.286	1000	1.752		3.884063	7		36			7		29		1001	1206		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1582	5.802	1000	1.887		3.884063	5		32			5		24		1001	1207		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.6924	3.584	1000	1.134		3.884063	6		9			6		1		1001	1208		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5526	5.004	1000	0.792		3.884063	6		39			6		37		1001	1209		1				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.3964	4.564	1000	1.596		3.884063	7		23			7		15		1001	1210		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.3494	4.611	1000	1.470		3.884063	7		48			7		50		1001	1211		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.1381	5.489	1000	0.879		3.890059	6		41			6		32		1001	1213		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.7994	5.161	1000	2.297		3.890059	6		21			6		18		1001	1215		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0042	3.822	1000	2.206		3.890059	6		40			6		44		1001	1216		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7416	3.711	1000	1.509		3.890059	7		45			7		50		1001	1217		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.5773	2.094	1000	1.108		3.890059	7		22			7		26		1001	1218		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.5839	6.052	1000	1.586		3.890059	7		43			7		50		1001	1219		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9388	6.581	1000	1.212		3.890059	7		39			7		36		1001	1220		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5641	3.765	1000	1.172		3.890059	8		34			8		35		1001	1223		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9617	2.998	1000	2.084		3.890059	8		17			8		19		1001	1224		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1664	4.075	1000	2.287		3.890059	7		29			7		23		1001	1225		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0711	4.160	1000	1.632		3.890059	8		23			8		31		1001	1227		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.3145	3.437	1000	1.979		3.890059	7		31			7		28		1001	1231		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7982	2.044	1000	1.383		3.890059	6		7			6		3		1001	1232		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3711	3.589	1000	2.091		3.890059	5		17			5		24		1001	1233		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6266	4.486	1000	1.071		3.890059	6		8			6		5		1001	1234		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.4358	3.584	1000	1.395		3.890059	6		27			6		28		1001	1235		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.6585	1.679	1000	0.993		3.890059	6		37			6		41		1001	1236		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2437	5.716	1000	1.784		3.890059	6		36			6		27		1001	1237		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.7334	5.015	1000	1.092		3.890059	7		15			7		18		1001	1238		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.3709	4.589	1000	2.420		3.890059	6		46			6		50		1001	1240		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3138	3.646	1000	2.070		3.890059	6		46			6		50		1001	1241		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0874	4.195	1000	2.277		3.890059	8		21			8		26		1001	1242		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8091	5.400	1000	1.954		3.890059	7		21			7		12		1001	1244		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2854	3.827	1000	1.879		3.890059	5		25			5		28		1001	1245		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9141	3.046	1000	1.769		3.956486	8		29			8		21		1001	1246		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.3709	2.589	1000	0.992		3.956486	5		37			5		30		1001	1247		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4400	2.520	1000	1.717		3.956486	7		5			7		1		1001	1248		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5872	5.373	1000	1.635		3.956486	5		3			5		10		1001	1251		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0824	3.878	1000	1.066		3.956486	6		28			6		18		1001	1253		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.3567	3.068	1000	1.166		3.956486	8		10			8		9		1001	1255		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.9667	3.133	1000	0.892		3.956486	8		32			8		30		1001	1256		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.1457	1.493	1000	0.819		3.956486	6		25			6		20		1001	1257		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9687	4.947	1000	1.424		3.956486	8		12			8		3		1001	1258		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.0304	4.889	1000	1.504		3.956486	6		24			6		24		1001	1259		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.3946	3.895	1000	1.265		3.959728	7		15			7		21		1001	1260		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9023	5.058	1000	1.921		3.959728	6		5			6		14		1001	1262		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.9854	4.975	1000	1.920		3.959728	6		44			6		50		1001	1263		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8258	5.676	1000	1.852		3.959728	7		6			7		6		1001	1265		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1936	2.216	1000	1.022		3.959728	7		48			7		50		1001	1266		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4259	5.534	1000	1.757		3.959728	7		40			7		46		1001	1267		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	111.9153	6.230	1000	1.469		3.959728	8		21			8		15		1001	1272		0				1			2			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.9405	4.978	1000	2.045		3.959728	6		43			6		47		1001	1274		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0370	3.923	1000	1.557		3.959728	7		28			7		22		1001	1275		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.4255	3.535	1000	0.774		3.959728	6		32			6		40		1001	1276		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5077	2.524	1000	1.306		3.959728	6		37			6		38		1001	1277		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6640	2.252	1000	1.161		3.959728	6		3			6		6		1001	1278		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6538	5.306	1000	2.019		3.959728	5		4			5		5		1001	1279		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	110.1502	5.607	1000	1.377		3.959728	5		42			5		34		1001	1282		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.6325	4.590	1000	2.202		3.959728	7		8			7		15		1001	1284		0				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.4464	3.959	1000	1.336		3.959728	5		25			5		18		1001	1285		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0021	4.958	1000	1.942		3.959728	8		19			8		13		1001	1287		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.3533	2.607	1000	1.809		3.959728	7		23			7		32		1001	1288		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.3079	4.904	1000	2.210		3.959728	7		21			7		24		1001	1289		1				1			5			20			0.0000		154.000		5.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.0222	3.120	1000	0.738		3.959728	6		22			6		22		1001	1290		1				1			5			20			0.0000		154.000		5.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
