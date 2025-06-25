
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/tester_part_4_sec_1_iv_spippoling_layer_2_scampanello.wav" -W -d -m0
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
f 0 55.26608641612769 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 7 9 12
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 8 12 8
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 1 2 3
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 2 3 5
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 3 4 2
f 1013 0 3 -2 0 1 0


i "time" 0 55.26608641612769
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "IV. Spippoling"
; Inizio: 0.000s, Durata: 105.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.290	1000	24.232		3.000000	1		12			1		12		1001	259		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7241	29.748	1000	23.798		3.000000	6		15			6		15		1001	260		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.3111	40.254	1000	25.159		3.000000	1		15			1		15		1001	261		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	37.696	1000	23.560		3.000000	0		16			0		16		1001	262		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.1163	40.884	1000	28.498		3.000000	6		5			6		5		1001	263		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.4929	41.507	1000	29.162		3.000000	1		14			1		14		1001	264		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	30.243	1000	24.194		3.000000	3		6			3		6		1001	265		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.906	1000	29.805		3.000000	4		15			4		15		1001	266		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5524	29.964	1000	23.971		3.000000	5		3			5		3		1001	267		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	32.447	1000	25.958		2.777778	2		2			2		2		1001	269		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.5749	40.425	1000	26.232		2.777778	7		1			7		1		1001	270		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.7979	41.202	1000	27.501		2.777778	7		18			7		18		1001	271		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.7927	40.207	1000	26.911		2.777778	7		18			7		18		1001	272		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.2815	28.180	1000	22.544		2.777778	0		1			0		1		1001	274		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	45.265	1000	28.944		2.777778	3		18			3		18		1001	275		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0425	40.517	1000	25.323		2.777778	4		17			4		17		1001	278		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	43.468	1000	27.168		2.777778	1		16			1		16		1001	279		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6208	31.783	1000	19.864		2.111111	7		15			7		15		1001	282		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.3969	24.196	1000	19.357		2.111111	4		1			4		1		1001	284		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.3020	39.698	1000	26.476		2.111111	3		18			3		18		1001	285		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.3218	29.384	1000	23.507		2.111111	5		4			5		4		1001	286		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.5383	32.931	1000	20.582		2.111111	7		19			7		19		1001	290		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	32.582	1000	20.364		2.111111	7		19			7		19		1001	291		0				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.4313	38.569	1000	25.243		2.111111	8		8			8		8		1001	292		1				1			5			20			0.0000		105.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.5602	31.481	1000	19.675		2.111111	8		5			8		5		1001	293		1				1			5			20			0.0000		105.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
