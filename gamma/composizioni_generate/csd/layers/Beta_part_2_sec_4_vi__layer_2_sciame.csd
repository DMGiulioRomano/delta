
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_2_sec_4_vi__layer_2_sciame.wav" -W -d -m0
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
f 0 92.65595504976861 ; Evento f fittizio per definire la durata totale
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


f 1000 0 3 -2 1 2 1
f 1001 0 3 -2 0 1 0
f 1002 0 3 -2 7 9 12
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 3 4 2
f 1005 0 3 -2 0 1 0
f 1006 0 3 -2 8 12 8
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 6 8 10
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 2 3 5
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 1 2 3
f 1013 0 3 -2 0 1 2


i "time" 0 92.65595504976861
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "VI. "
; Inizio: 0.000s, Durata: 110.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0034	5.212	1002	0.418		0.000000	8		17			8		17		1003	204		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.8032	19.417	1002	0.657		0.066667	7		22			7		22		1003	205		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.7880	4.657	1004	0.495		0.066667	8		23			8		23		1005	206		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.8902	27.912	1006	0.246		0.066667	7		14			7		14		1007	207		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.8245	25.086	1006	0.270		0.066667	7		37			7		37		1007	208		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.8774	17.935	1002	0.571		0.066667	7		19			7		19		1003	209		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7704	19.106	1008	0.459		0.133333	8		14			8		14		1009	210		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.5957	23.902	1002	0.731		0.133333	7		8			7		8		1003	211		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.4965	6.985	1010	0.692		0.133333	7		20			7		20		1011	212		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7174	13.344	1008	0.706		0.133333	8		9			8		9		1009	213		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.5568	18.964	1008	0.728		0.133333	8		27			8		27		1009	214		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7366	10.198	1008	0.632		0.133333	7		10			7		10		1009	215		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.5502	15.674	1010	0.790		0.200000	7		28			7		28		1011	216		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.5847	11.631	1002	0.448		0.200000	7		38			7		38		1003	217		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.4318	7.160	1008	0.513		0.200000	8		17			8		17		1009	218		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.5736	13.005	1002	0.647		0.200000	8		25			8		25		1003	219		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	5.5404	15.866	1008	0.540		0.200000	7		24			7		24		1009	221		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.2947	28.411	1002	0.794		0.266667	8		11			8		11		1003	222		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.3316	30.190	1008	0.257		0.266667	8		16			8		16		1009	224		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.1475	6.053	1004	0.504		0.266667	8		30			8		30		1005	225		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.2069	11.172	1010	0.697		0.333333	8		22			8		22		1011	226		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.8225	11.807	1010	0.581		0.400000	8		22			8		22		1011	227		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.9628	10.117	1008	0.318		0.400000	8		35			8		35		1009	228		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.8733	15.833	1008	0.554		0.400000	7		32			7		32		1009	229		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.1032	25.557	1008	0.220		0.400000	8		37			8		37		1009	230		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.8631	8.962	1006	0.405		0.466667	8		35			8		35		1007	231		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.9529	27.024	1006	0.334		0.466667	7		17			7		17		1007	232		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.7665	13.277	1012	0.515		0.466667	8		11			8		11		1013	233		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.9131	25.483	1008	0.300		0.466667	8		35			8		35		1009	234		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.6319	14.599	1002	0.581		0.533333	8		21			8		21		1003	235		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7392	5.826	1002	0.465		0.533333	8		22			8		22		1003	236		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7077	2.511	1006	0.737		0.533333	8		28			8		28		1007	237		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4463	26.795	1004	0.484		0.533333	7		42			7		42		1005	238		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4765	14.954	1010	0.321		0.600000	7		38			7		38		1011	239		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.3612	28.945	1002	0.737		0.600000	8		30			8		30		1003	240		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.6313	25.677	1002	0.620		0.600000	8		18			8		18		1003	241		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.5762	29.326	1010	0.484		0.600000	8		25			8		25		1011	242		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4869	30.271	1006	0.667		0.600000	8		19			8		19		1007	243		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.4537	7.665	1010	0.290		0.600000	8		48			8		48		1011	244		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.2082	19.170	1010	0.305		0.666667	8		14			8		14		1011	245		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.3617	7.083	1008	0.658		0.666667	8		20			8		20		1009	246		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.2438	14.381	1008	0.701		0.666667	8		28			8		28		1009	247		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.4125	10.864	1008	0.323		0.666667	8		12			8		12		1009	248		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.5258	6.120	1008	0.550		0.666667	8		21			8		21		1009	249		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.2415	25.702	1004	0.710		0.666667	8		21			8		21		1005	250		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.1977	29.196	1004	0.279		0.733333	8		26			8		26		1005	251		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.1970	10.366	1006	0.534		0.733333	8		27			8		27		1007	252		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.3382	9.122	1004	0.708		0.733333	8		33			8		33		1005	253		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.2059	19.180	1010	0.705		0.733333	8		20			8		20		1011	254		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.3008	6.149	1010	0.526		0.733333	8		23			8		23		1011	255		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.1102	12.547	1004	0.748		0.800000	8		8			8		8		1005	256		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.7944	19.940	1002	0.692		0.800000	8		24			8		24		1003	258		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.2794	12.882	1004	0.512		0.800000	8		17			8		17		1005	259		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.0947	28.045	1006	0.210		0.800000	8		21			8		21		1007	260		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.8892	9.371	1012	0.391		0.866667	8		30			8		30		1013	262		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.7654	28.971	1006	0.759		0.866667	8		14			8		14		1007	263		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.6590	3.440	1004	0.552		0.866667	8		29			8		29		1005	264		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.8865	3.430	1010	0.277		0.933333	8		20			8		20		1011	265		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.6657	0.747	1004	0.707		0.933333	8		34			8		34		1005	266		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.6449	3.581	1010	0.428		0.933333	8		9			8		9		1011	267		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.8601	6.102	1010	0.676		0.933333	8		14			8		14		1011	269		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.7397	12.440	1002	0.241		0.933333	8		19			8		19		1003	270		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.8376	1.375	1010	0.714		0.933333	8		32			8		32		1011	271		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.7298	12.372	1006	0.318		1.000000	8		25			8		25		1007	272		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.4666	28.442	1012	0.622		1.000000	8		38			8		38		1013	273		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.3232	27.026	1002	0.663		1.000000	8		22			8		22		1003	274		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.2332	6.484	1008	0.455		1.066667	8		36			8		36		1009	275		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.4284	17.937	1006	0.574		1.066667	8		22			8		22		1007	276		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.6142	22.034	1010	0.417		1.066667	8		36			8		36		1011	277		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.3322	28.649	1002	0.216		1.066667	8		27			8		27		1003	278		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.1305	3.055	1006	0.631		1.066667	8		20			8		20		1007	279		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.1832	8.140	1004	0.788		1.066667	8		27			8		27		1005	280		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.0430	29.343	1010	0.752		1.066667	8		19			8		19		1011	281		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.5875	21.879	1008	0.791		1.066667	8		17			8		17		1009	282		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.2126	25.941	1008	0.240		1.133333	9		33			9		33		1009	283		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1174	17.528	1010	0.203		1.133333	8		20			8		20		1011	284		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1821	21.413	1010	0.704		1.133333	8		30			8		30		1011	285		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.0436	13.490	1002	0.486		1.133333	8		26			8		26		1003	286		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1245	2.607	1002	0.270		1.133333	8		28			8		28		1003	287		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.8136	9.558	1006	0.611		1.133333	8		23			8		23		1007	288		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.4507	2.233	1008	0.780		1.133333	8		15			8		15		1009	289		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.8908	27.601	1006	0.400		1.200000	9		32			9		32		1007	290		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.8128	27.612	1002	0.726		1.200000	8		34			8		34		1003	291		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.1978	25.816	1010	0.758		1.200000	8		20			8		20		1011	292		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.7101	7.323	1010	0.761		1.200000	8		31			8		31		1011	293		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.1564	7.201	1008	0.326		1.200000	8		23			8		23		1009	294		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.7537	16.439	1008	0.756		1.200000	8		32			8		32		1009	295		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.1779	8.156	1012	0.443		1.200000	9		38			9		38		1013	296		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.9738	15.528	1004	0.546		1.200000	8		19			8		19		1005	297		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.6953	8.809	1004	0.412		1.266667	8		21			8		21		1005	300		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.7943	29.486	1012	0.302		1.266667	8		18			8		18		1013	301		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.2014	6.636	1004	0.260		1.266667	8		24			8		24		1005	302		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.8059	21.789	1010	0.658		1.333333	8		25			8		25		1011	303		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.6306	21.973	1004	0.431		1.333333	8		35			8		35		1005	304		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.8005	21.236	1004	0.764		1.333333	8		31			8		31		1005	305		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.6321	25.237	1010	0.647		1.333333	8		18			8		18		1011	306		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.7971	18.866	1002	0.359		1.333333	8		26			8		26		1003	307		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.7588	22.186	1006	0.790		1.333333	8		27			8		27		1007	308		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.2717	27.404	1008	0.653		1.333333	9		28			9		28		1009	309		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.6520	26.645	1004	0.493		1.333333	8		23			8		23		1005	310		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.5113	7.419	1004	0.262		1.400000	8		12			8		12		1005	311		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.4589	16.175	1004	0.540		1.400000	8		25			8		25		1005	313		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.3281	3.713	1008	0.674		1.400000	8		29			8		29		1009	314		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.6755	12.740	1004	0.791		1.400000	8		28			8		28		1005	315		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.5517	5.853	1010	0.500		1.400000	8		28			8		28		1011	316		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.7290	17.196	1012	0.350		1.400000	8		21			8		21		1013	317		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.1897	14.382	1010	0.376		1.466667	8		16			8		16		1011	318		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.3740	5.917	1004	0.446		1.466667	8		23			8		23		1005	319		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.5423	13.270	1012	0.495		1.466667	8		22			8		22		1013	320		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.4886	26.449	1006	0.728		1.466667	8		19			8		19		1007	321		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.8410	0.898	1002	0.205		1.466667	8		31			8		31		1003	322		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.1996	20.335	1008	0.470		1.466667	9		18			9		18		1009	323		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.1193	12.936	1010	0.317		1.533333	8		31			8		31		1011	324		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.0984	12.546	1010	0.712		1.533333	8		21			8		21		1011	326		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.1651	24.370	1012	0.386		1.533333	8		18			8		18		1013	327		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.2996	6.705	1006	0.670		1.533333	9		19			9		19		1007	328		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.2348	20.942	1004	0.242		1.533333	8		27			8		27		1005	329		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.9380	17.376	1008	0.746		1.600000	8		24			8		24		1009	330		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.2645	6.186	1002	0.204		1.600000	8		28			8		28		1003	331		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.1709	3.543	1006	0.662		1.600000	9		24			9		24		1007	332		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.0732	18.317	1004	0.505		1.600000	8		19			8		19		1005	334		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.0381	19.980	1010	0.464		1.600000	8		32			8		32		1011	335		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.9729	11.934	1010	0.481		1.666667	8		20			8		20		1011	336		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.9801	3.565	1006	0.368		1.666667	8		23			8		23		1007	337		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.8411	28.615	1006	0.258		1.666667	8		25			8		25		1007	338		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.9285	17.276	1004	0.551		1.666667	8		20			8		20		1005	339		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.9529	5.524	1002	0.521		1.666667	8		29			8		29		1003	341		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.4531	25.737	1006	0.547		1.666667	8		27			8		27		1007	342		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.6431	10.243	1004	0.796		1.666667	9		26			9		26		1005	343		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.5673	24.340	1004	0.331		1.666667	8		25			8		25		1005	344		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.7315	28.303	1012	0.782		1.733333	8		23			8		23		1013	345		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.4455	10.688	1008	0.590		1.733333	8		26			8		26		1009	346		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.7895	15.240	1012	0.688		1.733333	8		23			8		23		1013	347		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.3612	9.870	1012	0.734		1.733333	9		22			9		22		1013	348		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.7679	25.691	1008	0.637		1.733333	8		25			8		25		1009	349		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5988	5.564	1006	0.744		1.800000	8		25			8		25		1007	350		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.6333	24.938	1008	0.609		1.800000	8		28			8		28		1009	351		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.6368	24.371	1006	0.291		1.800000	8		24			8		24		1007	352		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5049	19.195	1006	0.419		1.800000	9		27			9		27		1007	353		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.4638	21.053	1010	0.450		1.800000	8		24			8		24		1011	355		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5762	27.257	1004	0.575		1.800000	9		22			9		22		1005	356		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.3852	26.149	1004	0.535		1.866667	8		24			8		24		1005	357		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.4451	7.791	1004	0.729		1.866667	9		24			9		24		1005	358		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.4193	3.339	1004	0.263		1.866667	8		28			8		28		1005	360		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.6634	19.314	1010	0.516		1.866667	9		28			9		28		1011	361		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7627	16.654	1004	0.499		1.866667	8		21			8		21		1005	362		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.0773	15.978	1006	0.433		1.866667	8		24			8		24		1007	363		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.8617	11.543	1004	0.421		1.866667	9		27			9		27		1005	364		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.1579	12.325	1004	0.321		1.933333	8		25			8		25		1005	365		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.3569	26.834	1002	0.371		1.933333	9		26			9		26		1003	366		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.3127	15.221	1002	0.405		1.933333	8		24			8		24		1003	368		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.2077	24.558	1004	0.452		1.933333	9		24			9		24		1005	370		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.9590	11.496	1004	0.555		1.933333	8		25			8		25		1005	371		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.9345	29.721	1010	0.651		1.933333	9		23			9		23		1011	372		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.1649	9.426	1010	0.705		1.933333	9		28			9		28		1011	373		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.1955	11.757	1004	0.622		1.933333	9		23			9		23		1005	374		3				1			3			20			0.0000		110.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.4344	3.559	1008	0.385		1.933333	8		25			8		25		1009	375		3				1			3			20			0.0000		110.000		30.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
