
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Gamma_copy_part_4_sec_1_iv_spippoling_layer_2_scampanello.wav" -W -d -m0
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
f 0 55.33649415652694 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 8 12 8
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 7 9 12
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 1 2 3
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 3 4 2
f 1011 0 3 -2 0 1 0
f 1012 0 3 -2 2 3 5
f 1013 0 3 -2 0 1 2


i "time" 0 55.33649415652694
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "IV. Spippoling"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	36.653	1000	29.322		3.000000	7		12			7		12		1001	4392		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.6899	38.310	1000	25.163		3.000000	7		19			7		19		1001	4393		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3165	34.249	1000	27.400		3.000000	0		16			0		16		1001	4394		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0600	31.648	1000	25.319		3.000000	5		4			5		4		1001	4395		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.016	1000	24.013		3.000000	4		4			4		4		1001	4397		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	34.196	1000	27.357		3.000000	3		3			3		3		1001	4399		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.0021	31.739	1000	25.391		3.000000	7		11			7		11		1001	4400		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5270	34.703	1000	27.763		3.000000	7		6			7		6		1001	4403		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0207	29.499	1000	23.599		3.000000	4		15			4		15		1001	4404		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6724	35.202	1000	28.162		3.000000	8		1			8		1		1001	4405		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.6236	41.376	1000	26.388		3.000000	3		13			3		13		1001	4406		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.909	1000	26.818		3.000000	1		12			1		12		1001	4407		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	45.335	1000	29.230		3.000000	6		13			6		13		1001	4409		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3241	28.868	1000	23.094		3.000000	1		18			1		18		1001	4411		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	36.765	1000	22.978		3.000000	3		8			3		8		1001	4414		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2807	41.298	1000	25.811		3.000000	4		7			4		7		1001	4415		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	34.854	1000	27.883		3.000000	8		4			8		4		1001	4416		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.9622	31.928	1000	25.542		3.000000	7		14			7		14		1001	4417		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.100	1000	26.938		3.000000	4		2			4		2		1001	4418		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	36.672	1000	29.338		3.000000	6		5			6		5		1001	4420		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3732	32.308	1000	25.847		3.000000	4		3			4		3		1001	4421		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	28.745	1000	22.996		3.000000	1		8			1		8		1001	4422		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.8004	39.396	1000	24.623		3.000000	0		1			0		1		1001	4423		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7172	38.283	1000	25.076		3.000000	6		7			6		7		1001	4424		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.631	1000	27.178		3.000000	4		14			4		14		1001	4425		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	41.872	1000	26.170		3.000000	7		16			7		16		1001	4426		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.559	1000	24.447		3.000000	6		5			6		5		1001	4429		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	39.181	1000	24.488		3.000000	0		6			0		6		1001	4431		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	33.090	1000	26.472		3.000000	4		6			4		6		1001	4432		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	36.435	1000	29.148		3.000000	0		1			0		1		1001	4433		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.232	1000	27.998		3.000000	4		16			4		16		1001	4434		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	33.037	1000	26.430		3.000000	7		7			7		7		1001	4435		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.5231	30.792	1000	24.633		3.000000	7		16			7		16		1001	4437		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.2301	34.122	1000	27.298		3.000000	2		18			2		18		1001	4438		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.141	1000	29.713		3.000000	4		14			4		14		1001	4444		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.189	1000	23.243		3.000000	4		16			4		16		1001	4445		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.6851	29.658	1000	23.726		3.000000	6		17			6		17		1001	4446		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6959	32.457	1000	25.966		3.000000	3		7			3		7		1001	4447		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.5368	36.521	1000	29.217		3.000000	7		3			7		3		1001	4448		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	33.450	1000	26.760		3.000000	5		4			5		4		1001	4449		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9084	35.470	1000	28.376		3.000000	0		5			0		5		1001	4450		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	33.243	1000	26.595		3.000000	1		16			1		16		1001	4451		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	29.391	1000	23.513		3.000000	8		6			8		6		1001	4453		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.0776	40.922	1000	26.287		3.000000	4		1			4		1		1001	4455		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.673	1000	23.546		3.000000	4		17			4		17		1001	4456		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.692	1000	29.302		3.000000	2		17			2		17		1001	4457		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	41.518	1000	25.949		3.000000	3		4			3		4		1001	4458		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	33.934	1000	27.148		3.000000	5		3			5		3		1001	4459		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3001	38.878	1000	24.298		3.000000	1		2			1		2		1001	4462		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	32.020	1000	25.616		3.000000	7		4			7		4		1001	4464		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9212	37.709	1000	23.568		3.000000	7		1			7		1		1001	4465		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6182	39.057	1000	24.411		3.000000	5		11			5		11		1001	4468		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	28.425	1000	22.740		3.000000	7		7			7		7		1001	4469		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.1440	31.434	1000	25.147		3.000000	5		4			5		4		1001	4470		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.426	1000	29.342		3.000000	1		9			1		9		1001	4471		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.211	1000	28.009		3.000000	5		18			5		18		1001	4472		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7139	30.472	1000	24.377		3.000000	5		19			5		19		1001	4473		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9493	41.051	1000	27.260		3.000000	6		8			6		8		1001	4474		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.3215	35.287	1000	28.230		3.000000	6		8			6		8		1001	4475		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9512	38.235	1000	23.897		3.000000	3		2			3		2		1001	4476		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.9604	29.169	1000	23.336		3.000000	6		7			6		7		1001	4477		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.8156	41.184	1000	28.687		3.000000	3		17			3		17		1001	4479		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7038	28.797	1000	23.038		3.000000	3		12			3		12		1001	4483		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	36.155	1000	28.924		3.000000	2		10			2		10		1001	4484		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.929	1000	28.544		3.000000	2		9			2		9		1001	4485		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.2851	36.715	1000	24.258		3.000000	8		6			8		6		1001	4486		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.3300	39.670	1000	29.058		3.000000	4		7			4		7		1001	4487		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3717	29.459	1000	23.567		3.000000	4		5			4		5		1001	4490		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.4122	33.294	1000	26.635		3.000000	2		12			2		12		1001	4494		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	39.481	1000	24.676		3.000000	8		9			8		9		1001	4495		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.1849	41.815	1000	26.227		3.000000	4		17			4		17		1001	4498		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.5522	35.598	1000	28.479		3.000000	4		1			4		1		1001	4501		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	40.114	1000	25.071		3.000000	2		9			2		9		1001	4505		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7241	36.999	1000	29.599		3.000000	7		11			7		11		1001	4506		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	35.312	1000	28.250		2.777778	4		10			4		10		1001	4507		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.2045	38.846	1000	24.279		2.777778	1		17			1		17		1001	4510		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	27.287	1000	21.830		2.777778	6		17			6		17		1001	4511		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	35.121	1000	28.097		2.777778	1		18			1		18		1001	4512		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	34.277	1000	21.423		2.777778	7		9			7		9		1001	4513		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0766	26.794	1000	21.436		2.777778	2		2			2		2		1001	4515		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7188	41.281	1000	28.641		2.777778	5		17			5		17		1001	4518		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.562	1000	28.597		2.777778	4		11			4		11		1001	4523		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	35.992	1000	28.794		2.777778	0		11			0		11		1001	4524		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.4585	38.542	1000	26.253		2.777778	8		17			8		17		1001	4525		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4472	40.928	1000	25.580		2.777778	4		1			4		1		1001	4526		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.916	1000	23.698		2.777778	3		4			3		4		1001	4528		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2972	36.178	1000	28.942		2.777778	1		4			1		4		1001	4529		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.6574	33.961	1000	27.169		2.777778	2		19			2		19		1001	4531		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7060	38.294	1000	24.041		2.777778	2		8			2		8		1001	4532		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3709	39.698	1000	24.811		2.777778	2		14			2		14		1001	4533		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4958	31.977	1000	25.581		2.777778	6		7			6		7		1001	4535		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.884	1000	27.428		2.777778	2		2			2		2		1001	4536		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.2281	38.772	1000	29.022		2.777778	0		8			0		8		1001	4537		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.8332	33.488	1000	26.790		2.777778	8		4			8		4		1001	4539		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.793	1000	28.881		2.777778	8		5			8		5		1001	4540		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	39.673	1000	24.796		2.777778	2		13			2		13		1001	4542		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5964	27.260	1000	21.808		2.777778	8		1			8		1		1001	4544		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2576	33.799	1000	27.040		2.777778	6		15			6		15		1001	4546		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7058	40.782	1000	25.489		2.777778	2		15			2		15		1001	4551		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0064	39.399	1000	24.624		2.777778	1		11			1		11		1001	4552		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7474	31.755	1000	25.404		2.777778	5		12			5		12		1001	4553		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.3835	35.617	1000	26.475		2.777778	3		17			3		17		1001	4554		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0210	41.979	1000	26.576		2.777778	2		1			2		1		1001	4555		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.5531	37.049	1000	23.155		2.777778	1		18			1		18		1001	4557		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.1349	33.682	1000	26.946		2.777778	7		3			7		3		1001	4559		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0969	26.843	1000	21.474		2.777778	4		12			4		12		1001	4560		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.2749	40.725	1000	26.553		2.777778	5		9			5		9		1001	4561		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.1301	31.475	1000	25.180		2.777778	1		2			1		2		1001	4566		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2639	34.450	1000	27.560		2.777778	6		4			6		4		1001	4568		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	27.317	1000	21.853		2.777778	2		7			2		7		1001	4569		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.6226	29.429	1000	23.543		2.777778	6		4			6		4		1001	4570		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2536	41.746	1000	26.466		2.777778	5		16			5		16		1001	4571		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.495	1000	24.396		2.777778	5		16			5		16		1001	4573		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0222	27.060	1000	21.648		2.777778	3		6			3		6		1001	4575		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	26.592	1000	21.273		2.777778	6		14			6		14		1001	4577		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.2603	29.610	1000	23.688		2.777778	3		5			3		5		1001	4578		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.7801	32.884	1000	26.308		2.777778	5		12			5		12		1001	4581		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4759	39.292	1000	24.558		2.777778	7		4			7		4		1001	4582		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4244	33.233	1000	26.587		2.777778	5		10			5		10		1001	4583		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	29.347	1000	23.478		2.777778	8		19			8		19		1001	4586		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2431	41.274	1000	25.796		2.777778	7		11			7		11		1001	4587		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.3700	34.784	1000	27.827		2.777778	1		1			1		1		1001	4588		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9535	41.046	1000	27.018		2.777778	6		7			6		7		1001	4589		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0092	38.914	1000	24.321		2.777778	3		2			3		2		1001	4590		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	34.703	1000	21.690		2.777778	1		13			1		13		1001	4592		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.3305	36.354	1000	29.083		2.777778	7		19			7		19		1001	4593		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.9154	41.085	1000	28.230		2.777778	5		15			5		15		1001	4594		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2869	33.257	1000	26.606		2.777778	3		13			3		13		1001	4596		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.8525	41.148	1000	26.684		2.777778	4		6			4		6		1001	4597		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	31.153	1000	24.923		2.777778	3		12			3		12		1001	4598		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7247	31.370	1000	25.096		2.777778	1		1			1		1		1001	4599		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.7270	36.603	1000	22.877		2.777778	6		12			6		12		1001	4601		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.8691	29.255	1000	23.404		2.777778	8		9			8		9		1001	4604		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.8014	29.674	1000	23.739		2.777778	1		12			1		12		1001	4605		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.0608	32.379	1000	25.903		2.777778	2		5			2		5		1001	4607		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.3050	41.695	1000	27.125		2.777778	5		11			5		11		1001	4608		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6859	29.473	1000	23.579		2.777778	1		6			1		6		1001	4609		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.1994	33.183	1000	26.546		2.777778	3		11			3		11		1001	4611		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.9790	35.172	1000	28.138		2.777778	2		15			2		15		1001	4612		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.422	1000	27.848		2.777778	5		12			5		12		1001	4613		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	29.957	1000	23.965		2.777778	1		10			1		10		1001	4614		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	42.268	1000	26.523		2.777778	0		5			0		5		1001	4615		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4408	40.650	1000	25.406		2.777778	4		3			4		3		1001	4616		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.0134	35.287	1000	28.230		2.777778	7		8			7		8		1001	4617		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.2908	27.881	1000	22.305		2.777778	8		17			8		17		1001	4618		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.1748	38.825	1000	24.973		2.777778	6		14			6		14		1001	4620		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.9771	39.680	1000	24.800		2.777778	3		3			3		3		1001	4621		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.5074	35.894	1000	22.434		2.777778	2		15			2		15		1001	4624		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.0775	31.115	1000	24.892		2.111111	4		7			4		7		1001	4625		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.7350	23.833	1000	19.066		2.111111	8		1			8		1		1001	4626		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.5583	22.919	1000	18.336		2.111111	7		7			7		7		1001	4627		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7031	38.297	1000	24.931		2.111111	5		8			5		8		1001	4629		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.8415	26.703	1000	21.363		2.111111	5		7			5		7		1001	4630		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.2759	30.832	1000	24.665		2.111111	6		4			6		4		1001	4631		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.3116	31.087	1000	24.870		2.111111	4		11			4		11		1001	4632		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.2209	23.007	1000	18.405		2.111111	3		6			3		6		1001	4633		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.5483	25.384	1000	20.308		2.111111	2		17			2		17		1001	4634		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5159	37.633	1000	23.521		2.111111	3		13			3		13		1001	4635		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9156	29.637	1000	23.709		2.111111	5		6			5		6		1001	4636		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.3407	32.064	1000	20.040		2.111111	6		10			6		10		1001	4637		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.3669	35.633	1000	24.916		2.111111	6		14			6		14		1001	4638		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	26.855	1000	21.484		2.111111	7		3			7		3		1001	4639		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.8279	30.999	1000	19.374		2.111111	4		12			4		12		1001	4640		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.767	1000	24.613		2.111111	2		19			2		19		1001	4641		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8403	25.890	1000	20.712		2.111111	4		12			4		12		1001	4643		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	31.477	1000	25.182		2.111111	5		10			5		10		1001	4646		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4739	22.425	1000	17.940		2.111111	8		19			8		19		1001	4648		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.7694	32.231	1000	26.170		2.111111	4		15			4		15		1001	4649		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.9513	26.487	1000	21.190		2.111111	4		15			4		15		1001	4650		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4627	33.120	1000	20.700		2.111111	7		15			7		15		1001	4652		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	41.133	1000	25.708		2.111111	5		5			5		5		1001	4653		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.1882	24.162	1000	19.330		2.111111	2		19			2		19		1001	4656		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.0546	28.334	1000	17.709		2.111111	4		8			4		8		1001	4658		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.6929	25.022	1000	20.017		2.111111	8		11			8		11		1001	4659		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	32.211	1000	25.769		2.111111	7		10			7		10		1001	4661		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.7235	34.173	1000	21.358		2.111111	6		18			6		18		1001	4662		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.9100	24.735	1000	19.788		2.111111	2		10			2		10		1001	4663		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9128	32.958	1000	26.367		2.111111	6		19			6		19		1001	4664		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.0681	32.812	1000	20.508		2.111111	8		10			8		10		1001	4665		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.5045	39.620	1000	24.763		2.111111	7		15			7		15		1001	4670		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.2105	29.078	1000	18.174		2.111111	4		15			4		15		1001	4675		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.4231	32.727	1000	20.454		2.111111	6		16			6		16		1001	4677		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.9227	37.077	1000	25.529		2.111111	3		1			3		1		1001	4680		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.8613	32.829	1000	20.518		2.111111	8		11			8		11		1001	4683		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4460	38.857	1000	24.286		2.111111	6		14			6		14		1001	4684		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.1673	32.472	1000	25.977		2.111111	3		6			3		6		1001	4687		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.7394	29.321	1000	18.326		2.111111	3		6			3		6		1001	4688		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.4814	25.574	1000	20.459		2.111111	4		3			4		3		1001	4691		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.7734	27.465	1000	21.972		2.111111	6		7			6		7		1001	4692		1				1			5			20			0.0000		105.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
