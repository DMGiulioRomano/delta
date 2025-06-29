
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_2_sec_3_v__layer_2_scampanello.wav" -W -d -m0
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
f 0 44.585174526562525 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 3 4 2
f 1003 0 3 -2 0 1 0
f 1004 0 3 -2 2 3 5
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 1 2 3
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 8 12 8
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 6 8 10
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 7 9 12
f 1013 0 3 -2 0 1 2
f 1014 0 4 -2 3 20 5 8
f 1015 0 4 -2 0 1 2 3
f 1016 0 4 -2 2 10 4 15
f 1017 0 4 -2 0 1 2 3
f 1018 0 3 -2 1 2 1
f 1019 0 3 -2 0 1 0


i "time" 0 44.585174526562525
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "V. "
; Inizio: 0.000s, Durata: 35.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1938	13.331	1000	8.332		3.000000	7		9			7		9		1001	2917		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.1748	12.935	1000	8.084		3.000000	5		14			5		14		1001	2918		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6895	8.424	1000	6.739		3.000000	6		16			6		16		1001	2919		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.4383	13.213	1000	8.258		3.000000	7		16			7		16		1001	2920		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.2234	10.223	1000	8.178		3.000000	6		6			6		6		1001	2921		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.2093	10.383	1000	6.489		3.000000	3		7			3		7		1001	2923		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.2631	11.360	1000	7.100		3.000000	3		14			3		14		1001	2924		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.8669	10.306	1000	6.442		3.000000	6		3			6		3		1001	2925		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.6415	7.989	1000	6.391		3.000000	2		5			2		5		1001	2928		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.7252	13.165	1000	8.228		3.000000	6		13			6		13		1001	2933		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.9246	8.389	1000	6.711		3.000000	2		16			2		16		1001	2934		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2893	11.636	1000	7.272		3.000000	3		2			3		2		1001	2935		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.8540	8.689	1000	6.951		3.000000	5		14			5		14		1001	2936		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.8850	8.872	1000	7.098		3.000000	3		15			3		15		1001	2937		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7695	11.371	1000	7.107		3.000000	4		15			4		15		1001	2940		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.6503	13.359	1000	8.349		3.000000	6		3			6		3		1001	2941		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1291	9.247	1000	7.397		3.000000	8		7			8		7		1001	2946		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4146	10.530	1000	6.581		3.000000	7		4			7		4		1001	2949		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.6826	9.576	1000	7.661		3.000000	5		13			5		13		1001	2950		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.1259	12.284	1000	7.677		3.000000	7		5			7		5		1001	2951		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.5021	12.459	1000	7.787		3.000000	7		3			7		3		1001	2952		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2964	8.683	1000	6.946		3.000000	8		15			8		15		1001	2954		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.7076	11.793	1000	7.370		3.000000	4		10			4		10		1001	2955		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7499	8.170	1000	6.536		3.000000	6		17			6		17		1001	2957		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8570	8.518	1000	6.814		3.000000	6		7			6		7		1001	2959		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9646	13.073	1000	8.171		3.000000	3		10			3		10		1001	2960		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.5850	13.413	1000	8.383		3.000000	2		4			2		4		1001	2961		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3674	12.456	1000	7.785		3.000000	8		16			8		16		1001	2962		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2509	10.012	1000	8.010		3.000000	6		10			6		10		1001	2963		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2421	10.327	1000	6.454		3.000000	3		7			3		7		1001	2966		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9959	10.155	1000	6.347		3.000000	3		16			3		16		1001	2969		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.7238	10.754	1000	6.721		3.000000	4		8			4		8		1001	2970		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2456	10.292	1000	8.233		3.000000	4		16			4		16		1001	2971		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4901	12.285	1000	7.678		3.000000	4		12			4		12		1001	2972		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2792	10.571	1000	6.607		3.000000	8		9			8		9		1001	2974		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8280	7.984	1000	6.387		3.000000	6		13			6		13		1001	2975		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.5092	11.555	1000	7.222		3.000000	6		10			6		10		1001	2976		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1409	10.908	1000	6.817		3.000000	4		8			4		8		1001	2979		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9761	11.722	1000	7.326		3.000000	4		16			4		16		1001	2981		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2408	11.803	1000	7.377		3.000000	5		15			5		15		1001	2982		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.6574	8.825	1000	7.060		3.000000	5		16			5		16		1001	2983		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2402	8.289	1000	6.631		3.000000	6		18			6		18		1001	2986		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.6868	10.062	1000	8.050		3.000000	6		4			6		4		1001	2990		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.7806	8.015	1000	6.412		3.000000	2		18			2		18		1001	2991		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8765	10.116	1000	6.323		3.000000	4		8			4		8		1001	2995		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.3004	8.441	1000	6.753		3.000000	5		4			5		4		1001	2998		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9956	12.726	1000	7.954		3.000000	6		13			6		13		1001	2999		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.1768	11.489	1000	7.181		3.000000	6		6			6		6		1001	3000		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.5591	9.436	1000	7.549		3.000000	3		14			3		14		1001	3001		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7864	8.334	1000	6.667		3.000000	6		2			6		2		1001	3004		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.4058	13.072	1000	8.170		3.000000	7		6			7		6		1001	3005		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.5916	10.361	1000	8.289		3.000000	6		1			6		1		1001	3006		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.8815	12.065	1000	7.540		3.000000	5		8			5		8		1001	3007		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1727	10.545	1000	6.591		3.000000	4		10			4		10		1001	3008		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2603	8.436	1000	6.749		3.000000	6		5			6		5		1001	3010		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.0917	10.323	1000	6.452		3.000000	6		11			6		11		1001	3011		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.5313	8.220	1000	6.576		3.000000	5		16			5		16		1001	3012		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9682	8.568	1000	6.854		3.000000	4		8			4		8		1001	3013		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.7529	13.399	1000	8.374		3.000000	3		18			3		18		1001	3014		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.0565	13.095	1000	8.184		3.000000	6		11			6		11		1001	3016		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.3435	11.765	1000	7.353		3.000000	4		17			4		17		1001	3019		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9195	12.306	1000	7.691		3.000000	4		5			4		5		1001	3020		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.6041	7.882	1000	6.305		3.000000	4		4			4		4		1001	3021		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.7513	11.276	1000	7.047		3.000000	2		2			2		2		1001	3022		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4788	10.435	1000	6.522		3.000000	5		9			5		9		1001	3023		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4160	12.573	1000	7.858		3.000000	6		1			6		1		1001	3024		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.8958	11.664	1000	7.290		3.000000	7		9			7		9		1001	3025		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.8269	9.698	1000	7.758		3.000000	4		19			4		19		1001	3028		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6338	12.659	1000	7.912		3.000000	7		13			7		13		1001	3030		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4881	11.850	1000	7.406		3.000000	7		9			7		9		1001	3032		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.3014	10.661	1000	6.663		3.000000	4		13			4		13		1001	3033		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.1554	12.879	1000	8.049		3.000000	8		17			8		17		1001	3034		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.3490	12.357	1000	7.723		3.000000	8		6			8		6		1001	3035		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5562	8.368	1000	6.694		3.000000	7		6			7		6		1001	3036		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6070	9.373	1000	7.498		3.000000	3		14			3		14		1001	3037		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6571	10.635	1000	6.647		3.000000	3		15			3		15		1001	3038		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1522	9.429	1000	7.544		3.000000	2		19			2		19		1001	3039		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6439	8.389	1000	6.712		3.000000	5		9			5		9		1001	3040		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.9671	8.130	1000	6.504		3.000000	5		2			5		2		1001	3041		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2431	11.585	1000	7.241		3.000000	3		11			3		11		1001	3042		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.5914	12.690	1000	7.932		3.000000	4		10			4		10		1001	3043		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.7357	10.254	1000	6.409		3.000000	5		8			5		8		1001	3044		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9586	12.881	1000	8.050		3.000000	4		6			4		6		1001	3045		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.9707	13.438	1000	8.399		3.000000	7		11			7		11		1001	3047		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.9531	10.906	1000	6.816		3.000000	3		12			3		12		1001	3049		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3656	8.124	1000	6.499		3.222222	7		6			7		6		1001	3050		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.4317	8.397	1000	6.718		3.222222	5		6			5		6		1001	3051		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.7675	9.873	1000	7.899		3.222222	3		9			3		9		1001	3052		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.9612	8.147	1000	6.517		3.222222	4		17			4		17		1001	3054		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.4279	10.795	1000	6.747		3.222222	5		3			5		3		1001	3055		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.6664	8.008	1000	6.407		3.222222	6		7			6		7		1001	3059		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9101	8.871	1000	7.097		3.222222	5		2			5		2		1001	3060		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.9784	10.057	1000	8.045		3.222222	4		16			4		16		1001	3063		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.0420	10.049	1000	6.281		3.222222	3		2			3		2		1001	3067		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1406	10.142	1000	8.113		3.222222	2		17			2		17		1001	3068		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.0300	11.746	1000	7.341		3.222222	7		15			7		15		1001	3069		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.0484	10.093	1000	8.075		3.222222	5		16			5		16		1001	3070		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.0521	11.255	1000	7.034		3.222222	3		14			3		14		1001	3073		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.2072	11.784	1000	7.365		3.222222	3		3			3		3		1001	3074		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.8099	7.457	1000	5.966		3.222222	2		4			2		4		1001	3075		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.2825	8.381	1000	6.705		3.222222	2		7			2		7		1001	3077		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.2928	10.597	1000	6.623		3.222222	7		2			7		2		1001	3079		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.9454	10.635	1000	6.647		3.222222	6		9			6		9		1001	3080		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.7260	11.552	1000	7.220		3.222222	5		9			5		9		1001	3082		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5235	9.032	1000	7.226		3.222222	8		11			8		11		1001	3083		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.2823	11.581	1000	7.238		3.222222	5		2			5		2		1001	3084		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.3810	10.125	1000	6.328		3.222222	7		19			7		19		1001	3085		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9494	12.506	1000	7.816		3.222222	5		2			5		2		1001	3086		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.5677	9.998	1000	6.249		3.222222	7		16			7		16		1001	3089		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6386	8.667	1000	6.933		3.222222	3		10			3		10		1001	3090		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.0949	11.198	1000	6.999		3.222222	4		11			4		11		1001	3091		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.1702	8.965	1000	7.172		3.222222	4		13			4		13		1001	3092		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7701	12.821	1000	8.013		3.222222	6		9			6		9		1001	3093		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.6251	9.886	1000	6.179		3.222222	8		11			8		11		1001	3094		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.6756	11.322	1000	7.077		3.222222	4		1			4		1		1001	3096		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.1731	11.746	1000	7.341		3.222222	7		14			7		14		1001	3098		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7844	10.606	1000	6.629		3.222222	4		19			4		19		1001	3099		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.6460	10.723	1000	6.702		3.222222	2		16			2		16		1001	3100		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.9415	12.068	1000	7.542		3.222222	4		1			4		1		1001	3101		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.9098	13.028	1000	8.143		3.222222	2		15			2		15		1001	3102		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.5990	9.762	1000	6.101		3.222222	7		11			7		11		1001	3103		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.6372	7.854	1000	6.283		3.222222	7		6			7		6		1001	3104		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.3145	10.204	1000	6.378		3.222222	7		9			7		9		1001	3105		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.5665	11.489	1000	7.180		3.222222	7		19			7		19		1001	3106		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4666	9.808	1000	6.130		3.222222	4		11			4		11		1001	3107		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.7384	9.855	1000	7.884		3.222222	5		9			5		9		1001	3109		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.6761	9.386	1000	7.509		3.222222	6		1			6		1		1001	3110		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.8101	9.548	1000	7.639		3.222222	4		8			4		8		1001	3111		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.5570	10.582	1000	6.614		3.222222	2		1			2		1		1001	3112		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.0060	7.685	1000	6.148		3.222222	4		10			4		10		1001	3113		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.5395	7.955	1000	6.364		3.222222	7		16			7		16		1001	3114		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1980	9.622	1000	7.697		3.222222	3		6			3		6		1001	3115		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.0559	10.012	1000	6.257		3.222222	3		15			3		15		1001	3116		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.9865	7.596	1000	6.077		3.222222	3		14			3		14		1001	3117		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.7268	10.731	1000	6.707		3.222222	4		2			4		2		1001	3119		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6907	12.206	1000	7.629		3.222222	3		4			3		4		1001	3120		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7800	11.811	1000	7.382		3.222222	6		1			6		1		1001	3125		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3396	10.025	1000	6.266		3.222222	5		10			5		10		1001	3126		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.9569	9.876	1000	7.900		3.222222	6		9			6		9		1001	3128		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.6004	9.963	1000	7.970		3.222222	3		1			3		1		1001	3129		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.8929	12.502	1000	7.814		3.222222	6		12			6		12		1001	3130		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8717	8.646	1000	6.917		3.222222	6		3			6		3		1001	3131		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3331	9.726	1000	7.781		3.222222	5		13			5		13		1001	3135		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.7212	12.242	1000	7.651		3.222222	2		19			2		19		1001	3137		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.2349	7.624	1000	6.099		3.222222	6		1			6		1		1001	3138		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.2251	12.826	1000	8.016		3.222222	4		10			4		10		1001	3139		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.0218	9.691	1000	7.753		3.222222	6		15			6		15		1001	3140		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.1159	8.102	1000	6.482		3.222222	4		16			4		16		1001	3142		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.0630	8.268	1000	6.615		3.222222	5		18			5		18		1001	3143		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.0831	8.848	1000	7.078		3.222222	5		7			5		7		1001	3144		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.3951	9.497	1000	7.598		3.222222	5		7			5		7		1001	3147		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3516	12.376	1000	7.735		3.222222	5		18			5		18		1001	3149		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.9339	10.349	1000	6.468		3.222222	7		10			7		10		1001	3151		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1483	9.475	1000	7.580		3.222222	7		12			7		12		1001	3152		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8292	9.641	1000	7.713		3.222222	4		12			4		12		1001	3153		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5388	9.355	1000	7.484		3.222222	4		17			4		17		1001	3154		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.5481	9.748	1000	6.093		3.888889	5		6			5		6		1001	3155		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.3808	11.133	1000	6.958		3.888889	5		6			5		6		1001	3156		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.3425	11.865	1000	7.415		3.888889	4		3			4		3		1001	3157		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5295	11.683	1000	7.302		3.888889	6		9			6		9		1001	3158		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.0943	8.923	1000	5.577		3.888889	7		9			7		9		1001	3159		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.1019	9.568	1000	5.980		3.888889	7		8			7		8		1001	3160		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.5755	11.741	1000	7.338		3.888889	4		3			4		3		1001	3162		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.7142	6.301	1000	5.041		3.888889	5		6			5		6		1001	3163		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.6325	7.564	1000	6.051		3.888889	5		5			5		5		1001	3164		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.0182	10.582	1000	6.614		3.888889	3		19			3		19		1001	3165		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.5892	10.747	1000	6.717		3.888889	5		12			5		12		1001	3166		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.4443	8.805	1000	5.503		3.888889	2		4			2		4		1001	3167		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.9502	11.635	1000	7.272		3.888889	2		8			2		8		1001	3168		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.4434	7.019	1000	5.615		3.888889	6		14			6		14		1001	3169		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.5354	7.192	1000	5.754		3.888889	5		16			5		16		1001	3170		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.2912	6.394	1000	5.115		3.888889	6		7			6		7		1001	3171		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.9839	8.422	1000	5.264		3.888889	5		17			5		17		1001	3172		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.2251	7.815	1000	6.252		3.888889	6		16			6		16		1001	3174		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.0950	8.422	1000	5.264		3.888889	3		3			3		3		1001	3175		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.2952	8.402	1000	5.251		3.888889	5		1			5		1		1001	3177		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4750	7.399	1000	5.919		3.888889	3		14			3		14		1001	3178		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.2601	11.852	1000	7.408		3.888889	4		12			4		12		1001	3179		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.3383	6.162	1000	4.930		3.888889	6		8			6		8		1001	3181		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.4399	8.042	1000	6.434		3.888889	5		1			5		1		1001	3185		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.1157	9.000	1000	5.625		3.888889	6		4			6		4		1001	3186		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.0569	11.330	1000	7.081		3.888889	3		17			3		17		1001	3187		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.2370	9.691	1000	6.057		3.888889	5		18			5		18		1001	3188		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.2508	8.939	1000	5.587		3.888889	3		8			3		8		1001	3189		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.3006	6.166	1000	4.933		3.888889	6		1			6		1		1001	3190		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.0369	8.994	1000	5.622		3.888889	6		15			6		15		1001	3192		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7329	8.848	1000	5.530		3.888889	7		17			7		17		1001	3193		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5862	11.673	1000	7.295		3.888889	5		1			5		1		1001	3195		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.0062	8.172	1000	5.107		3.888889	6		5			6		5		1001	3196		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.9048	10.742	1000	6.714		3.888889	5		7			5		7		1001	3197		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.3717	10.587	1000	6.617		3.888889	3		9			3		9		1001	3198		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.5989	10.062	1000	6.289		3.888889	3		10			3		10		1001	3200		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.6368	8.928	1000	7.142		3.888889	3		7			3		7		1001	3202		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.1649	6.949	1000	5.559		3.888889	5		9			5		9		1001	3203		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.8414	7.560	1000	6.048		3.888889	2		6			2		6		1001	3204		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.3762	8.657	1000	5.411		3.888889	5		18			5		18		1001	3205		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.3858	7.454	1000	5.964		3.888889	2		3			2		3		1001	3207		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5296	9.103	1000	5.689		3.888889	3		3			3		3		1001	3209		0				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.3705	7.905	1000	6.324		3.888889	6		2			6		2		1001	3210		1				-1.0			5			20			0.0000		35.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.6925	9.909	1000	6.193		3.888889	5		5			5		5		1001	3211		1				-1.0			5			20			0.0000		35.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
