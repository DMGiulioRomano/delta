
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_2_sec_1_iii__layer_1_nubi_sparse_verso_sciame.wav" -W -d -m0
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
f 0 90.0 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 2 3 5
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 8 12 8
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 1 2 3
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 6 8 10
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 3 4 2
f 1011 0 3 -2 0 1 0
f 1012 0 3 -2 7 9 12
f 1013 0 3 -2 0 1 2
f 1014 0 4 -2 2 10 4 15
f 1015 0 4 -2 0 1 2 3
f 1016 0 4 -2 3 20 5 8
f 1017 0 4 -2 0 1 2 3


i "time" 0 90.0
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "III. "
; Inizio: 0.000s, Durata: 60.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0959	1.846	1014	0.413		0.000000	8		16			8		16		1015	2251		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0693	16.794	1016	0.542		0.000000	8		40			8		40		1017	2252		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	15.450	1014	0.567		0.000000	8		41			8		41		1015	2253		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.2559	10.218	1014	0.718		0.000000	8		35			8		35		1015	2254		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	14.460	1014	0.416		0.000000	7		41			7		41		1015	2255		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	16.488	1016	0.654		0.000000	8		29			8		29		1017	2256		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	12.732	1016	0.359		0.000000	7		35			7		35		1017	2257		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	10.163	1016	0.224		0.000000	8		25			8		25		1017	2258		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0528	19.893	1016	0.362		0.065556	8		17			8		17		1017	2259		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0241	14.615	1014	0.388		0.065556	8		40			8		40		1015	2260		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.5925	4.840	1014	0.748		0.065556	7		21			7		21		1015	2261		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.8331	20.108	1016	0.263		0.065556	8		21			8		21		1017	2262		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.7452	19.521	1014	0.368		0.065556	8		35			8		35		1015	2263		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.8839	2.311	1016	0.405		0.065556	7		12			7		12		1017	2264		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.1484	14.170	1014	0.696		0.065556	7		22			7		22		1015	2265		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9032	8.469	1014	0.353		0.065556	8		31			8		31		1015	2266		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.8077	6.794	1014	0.622		0.065556	8		20			8		20		1015	2267		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.6845	8.203	1014	0.668		0.128889	7		41			7		41		1015	2268		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.5283	15.848	1016	0.253		0.128889	8		23			8		23		1017	2269		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.5697	8.996	1016	0.225		0.128889	8		24			8		24		1017	2270		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8102	9.040	1016	0.545		0.128889	7		32			7		32		1017	2271		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.0223	10.832	1014	0.524		0.128889	8		32			8		32		1015	2272		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.6636	21.697	1016	0.690		0.128889	8		14			8		14		1017	2273		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8030	19.208	1014	0.423		0.128889	8		36			8		36		1015	2274		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8925	1.913	1014	0.553		0.128889	8		16			8		16		1015	2275		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.5983	17.901	1008	0.736		0.128889	8		12			8		12		1009	2276		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7939	9.044	1014	0.776		0.128889	8		42			8		42		1015	2277		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8480	5.826	1016	0.615		0.128889	8		27			8		27		1017	2278		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7531	6.402	1014	0.771		0.128889	8		25			8		25		1015	2279		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.4527	15.660	1004	0.259		0.190000	7		24			7		24		1005	2280		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.3340	18.939	1014	0.801		0.190000	8		35			8		35		1015	2281		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.6937	15.103	1014	0.645		0.190000	8		38			8		38		1015	2282		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.5364	21.488	1008	0.497		0.190000	7		30			7		30		1009	2283		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.2581	16.821	1014	0.521		0.190000	7		43			7		43		1015	2284		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.7319	12.406	1016	0.405		0.190000	7		34			7		34		1017	2285		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.3072	12.251	1016	0.360		0.190000	7		29			7		29		1017	2286		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.0644	11.537	1016	0.361		0.190000	7		43			7		43		1017	2287		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.2963	13.489	1016	0.800		0.190000	7		22			7		22		1017	2288		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4821	22.212	1014	0.746		0.248889	8		36			8		36		1015	2289		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8307	6.258	1004	0.632		0.248889	8		45			8		45		1005	2290		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8087	8.817	1008	0.603		0.248889	7		35			7		35		1009	2291		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9375	3.534	1012	0.731		0.248889	8		25			8		25		1013	2292		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.6742	2.301	1016	0.265		0.248889	7		21			7		21		1017	2293		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.2515	11.423	1016	0.442		0.248889	8		20			8		20		1017	2294		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5930	17.862	1012	0.812		0.248889	7		45			7		45		1013	2295		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.2341	4.088	1016	0.327		0.248889	7		33			7		33		1017	2296		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.4581	5.045	1014	0.381		0.248889	8		34			8		34		1015	2297		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8601	17.017	1016	0.612		0.248889	8		42			8		42		1017	2298		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.5481	19.780	1008	0.398		0.305556	7		40			7		40		1009	2299		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7291	6.321	1014	0.281		0.305556	7		45			7		45		1015	2300		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.9262	1.162	1004	0.710		0.305556	7		38			7		38		1005	2301		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.2382	13.788	1004	0.403		0.305556	7		45			7		45		1005	2302		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5888	6.139	1016	0.556		0.305556	7		23			7		23		1017	2303		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7835	5.031	1008	0.677		0.305556	8		42			8		42		1009	2304		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.0845	8.068	1014	0.678		0.305556	7		11			7		11		1015	2305		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.8268	7.482	1016	0.535		0.305556	7		40			7		40		1017	2306		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.0332	22.407	1016	0.783		0.305556	7		31			7		31		1017	2307		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.5553	3.780	1014	0.805		0.305556	7		46			7		46		1015	2308		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.4577	13.155	1004	0.309		0.305556	7		19			7		19		1005	2309		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.9602	12.122	1014	0.636		0.305556	8		42			8		42		1015	2310		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8276	9.258	1008	0.603		0.360000	7		39			7		39		1009	2311		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.2963	5.949	1008	0.543		0.360000	7		31			7		31		1009	2312		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.4745	6.460	1016	0.579		0.360000	7		11			7		11		1017	2313		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.7669	17.089	1014	0.661		0.360000	7		39			7		39		1015	2314		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8866	13.823	1014	0.647		0.360000	7		38			7		38		1015	2315		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.1340	16.206	1008	0.836		0.360000	7		46			7		46		1009	2316		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.5250	14.970	1008	0.266		0.360000	8		36			8		36		1009	2317		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8136	19.082	1004	0.381		0.360000	7		32			7		32		1005	2318		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.5647	7.827	1014	0.332		0.360000	7		39			7		39		1015	2319		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8161	3.441	1014	0.239		0.360000	7		38			7		38		1015	2320		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.7326	12.607	1016	0.745		0.360000	7		31			7		31		1017	2321		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.1578	9.228	1012	0.857		0.360000	7		21			7		21		1013	2322		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8052	15.048	1016	0.542		0.360000	7		24			7		24		1017	2323		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.4133	3.153	1014	0.736		0.412222	7		38			7		38		1015	2324		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.8893	10.710	1004	0.780		0.412222	7		8			7		8		1005	2325		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.3988	10.974	1014	0.459		0.412222	7		45			7		45		1015	2326		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.2388	5.354	1008	0.719		0.412222	7		19			7		19		1009	2327		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.3783	10.191	1016	0.494		0.412222	7		18			7		18		1017	2328		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.6720	6.146	1014	0.508		0.412222	7		11			7		11		1015	2329		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.5432	11.311	1014	0.408		0.412222	7		37			7		37		1015	2330		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.3850	9.327	1016	0.282		0.412222	7		31			7		31		1017	2331		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.8936	2.320	1016	0.415		0.462222	7		8			7		8		1017	2332		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.5160	13.002	1016	0.272		0.462222	7		12			7		12		1017	2333		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.7549	11.686	1014	0.888		0.462222	7		11			7		11		1015	2334		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.8715	17.832	1012	0.458		0.462222	7		41			7		41		1013	2335		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.5889	5.780	1016	0.250		0.462222	7		27			7		27		1017	2336		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.5171	12.627	1004	0.296		0.462222	7		15			7		15		1005	2337		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.7437	8.540	1012	0.601		0.462222	7		45			7		45		1013	2338		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	28.1488	11.702	1008	0.499		0.462222	7		44			7		44		1009	2339		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.7273	9.157	1016	0.410		0.510000	7		32			7		32		1017	2340		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.5025	17.961	1004	0.437		0.510000	7		19			7		19		1005	2341		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.3831	17.757	1004	0.315		0.510000	7		26			7		26		1005	2342		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1575	5.521	1014	0.410		0.510000	7		40			7		40		1015	2343		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1695	6.166	1016	0.266		0.510000	7		24			7		24		1017	2344		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1638	5.438	1012	0.380		0.510000	7		25			7		25		1013	2345		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.4997	14.010	1016	0.838		0.510000	7		37			7		37		1017	2346		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.3188	10.070	1016	0.851		0.510000	7		26			7		26		1017	2347		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.0970	0.639	1004	0.490		0.510000	7		39			7		39		1005	2348		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.1493	0.881	1012	0.806		0.510000	7		20			7		20		1013	2349		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.4384	14.136	1012	0.393		0.510000	7		23			7		23		1013	2350		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.2345	8.070	1004	0.849		0.510000	7		46			7		46		1005	2351		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.0266	19.179	1008	0.297		0.510000	7		28			7		28		1009	2352		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.9129	12.352	1012	0.300		0.510000	7		31			7		31		1013	2353		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.6301	11.351	1016	0.419		0.510000	7		25			7		25		1017	2354		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.8965	9.188	1012	0.499		0.555556	7		35			7		35		1013	2355		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.7172	12.709	1004	0.359		0.555556	7		14			7		14		1005	2356		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.3580	10.557	1016	0.903		0.555556	7		26			7		26		1017	2357		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.6638	9.013	1012	0.558		0.555556	7		43			7		43		1013	2358		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.3257	11.561	1008	0.363		0.555556	7		30			7		30		1009	2359		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.4300	2.398	1004	0.707		0.555556	7		9			7		9		1005	2360		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.4910	2.915	1016	0.679		0.555556	7		37			7		37		1017	2361		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.3124	13.509	1004	0.278		0.555556	7		45			7		45		1005	2362		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.3464	5.843	1014	0.690		0.555556	7		21			7		21		1015	2363		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.2340	19.859	1016	0.862		0.555556	7		10			7		10		1017	2364		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.9038	19.732	1008	0.872		0.555556	7		25			7		25		1009	2365		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.6710	2.961	1008	0.585		0.555556	7		31			7		31		1009	2366		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.7577	1.563	1004	0.527		0.555556	7		6			7		6		1005	2367		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.2955	12.878	1008	0.684		0.555556	7		45			7		45		1009	2368		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.8612	9.944	1008	0.319		0.555556	7		32			7		32		1009	2369		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.3161	15.205	1014	0.453		0.598889	7		37			7		37		1015	2370		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.0325	13.250	1004	0.837		0.598889	7		10			7		10		1005	2371		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.5420	12.841	1016	0.892		0.598889	7		24			7		24		1017	2372		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.4325	11.763	1012	0.762		0.598889	7		19			7		19		1013	2373		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.5784	2.382	1012	0.531		0.598889	7		16			7		16		1013	2374		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.6320	18.604	1012	0.920		0.598889	7		33			7		33		1013	2375		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.9170	12.471	1008	0.283		0.598889	7		24			7		24		1009	2376		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.5045	6.415	1016	0.797		0.598889	7		27			7		27		1017	2377		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.5645	1.086	1008	0.420		0.598889	7		13			7		13		1009	2378		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.2738	7.094	1014	0.321		0.598889	7		17			7		17		1015	2379		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.7616	18.300	1012	0.760		0.640000	7		34			7		34		1013	2380		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.3085	10.154	1004	0.268		0.640000	6		47			6		47		1005	2381		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5006	13.322	1012	0.657		0.640000	7		7			7		7		1013	2382		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.7448	3.380	1016	0.844		0.640000	7		40			7		40		1017	2383		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5673	1.662	1016	0.837		0.640000	7		46			7		46		1017	2384		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.3316	3.221	1008	0.550		0.640000	7		5			7		5		1009	2385		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.8408	7.929	1012	0.295		0.640000	7		30			7		30		1013	2386		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.4905	16.807	1016	0.425		0.640000	7		7			7		7		1017	2387		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.2930	1.765	1016	0.789		0.640000	7		37			7		37		1017	2388		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.2717	14.079	1014	0.884		0.640000	6		20			6		20		1015	2389		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.2296	12.524	1008	0.559		0.640000	7		44			7		44		1009	2390		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.2859	17.613	1016	0.273		0.640000	7		12			7		12		1017	2391		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.6835	18.216	1004	0.354		0.640000	7		23			7		23		1005	2392		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.7609	3.459	1008	0.636		0.640000	7		34			7		34		1009	2393		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.4401	12.498	1008	0.324		0.640000	6		15			6		15		1009	2394		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.0528	2.864	1004	0.836		0.640000	7		15			7		15		1005	2395		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5975	14.222	1012	0.603		0.678889	7		48			7		48		1013	2396		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.4839	3.668	1012	0.717		0.678889	7		14			7		14		1013	2397		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6963	9.589	1016	0.728		0.678889	7		33			7		33		1017	2398		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.5577	14.394	1004	0.457		0.678889	7		28			7		28		1005	2399		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6170	17.308	1016	0.458		0.678889	7		16			7		16		1017	2400		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.0106	5.974	1004	0.462		0.678889	6		40			6		40		1005	2401		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.9113	3.643	1016	0.723		0.678889	6		44			6		44		1017	2402		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6250	6.113	1004	0.556		0.678889	7		28			7		28		1005	2403		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.5704	17.882	1014	0.484		0.678889	7		18			7		18		1015	2404		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.9220	19.794	1014	0.622		0.678889	7		27			7		27		1015	2405		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.9653	16.334	1012	0.659		0.678889	7		13			7		13		1013	2406		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.3707	18.743	1016	0.567		0.678889	7		16			7		16		1017	2407		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.8964	8.101	1012	0.863		0.678889	7		9			7		9		1013	2408		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.5594	17.465	1012	0.490		0.678889	7		16			7		16		1013	2409		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.9012	2.401	1012	0.865		0.715556	6		15			6		15		1013	2410		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5787	7.141	1004	0.632		0.715556	7		19			7		19		1005	2411		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.6099	10.898	1012	0.711		0.715556	7		33			7		33		1013	2412		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.4645	19.727	1004	0.646		0.715556	7		7			7		7		1005	2413		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.8105	6.138	1004	0.902		0.715556	7		14			7		14		1005	2414		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.6631	10.695	1016	0.272		0.715556	6		33			6		33		1017	2415		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.8095	17.620	1014	0.725		0.715556	7		24			7		24		1015	2416		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.9552	2.706	1012	0.477		0.715556	6		21			6		21		1013	2417		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.5557	19.382	1008	0.727		0.715556	7		27			7		27		1009	2418		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.1584	11.445	1008	0.483		0.715556	7		24			7		24		1009	2419		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.0700	6.114	1014	0.425		0.715556	6		12			6		12		1015	2420		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.5992	11.630	1008	0.278		0.715556	7		43			7		43		1009	2421		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.4106	3.827	1008	0.325		0.750000	6		27			6		27		1009	2422		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.2932	11.347	1004	0.626		0.750000	6		25			6		25		1005	2423		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.8999	10.770	1016	0.275		0.750000	6		40			6		40		1017	2424		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.3033	2.271	1008	0.498		0.750000	6		37			6		37		1009	2425		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.7476	8.535	1004	0.757		0.750000	6		44			6		44		1005	2426		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.3065	7.462	1012	0.498		0.750000	7		6			7		6		1013	2427		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.6000	0.947	1016	0.463		0.750000	6		33			6		33		1017	2428		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.2860	17.922	1004	0.397		0.750000	7		9			7		9		1005	2429		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.8962	12.525	1012	0.595		0.750000	7		32			7		32		1013	2430		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.4110	17.477	1014	0.811		0.750000	7		11			7		11		1015	2431		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.6980	19.804	1014	0.723		0.750000	6		6			6		6		1015	2432		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.0461	3.838	1008	0.531		0.750000	7		16			7		16		1009	2433		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.8407	1.525	1008	0.446		0.750000	7		40			7		40		1009	2434		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.6927	5.097	1012	0.665		0.750000	7		7			7		7		1013	2435		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.1469	6.892	1004	0.885		0.750000	7		43			7		43		1005	2436		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.0480	4.776	1004	0.730		0.782222	7		46			7		46		1005	2437		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.7711	9.028	1008	0.301		0.782222	7		40			7		40		1009	2438		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1286	3.633	1016	0.733		0.782222	7		7			7		7		1017	2439		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.4110	3.464	1014	0.867		0.782222	7		37			7		37		1015	2440		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1418	19.396	1012	0.938		0.782222	7		11			7		11		1013	2441		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1327	11.552	1008	0.690		0.782222	6		46			6		46		1009	2442		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.3872	6.760	1016	0.312		0.782222	6		19			6		19		1017	2443		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.7251	4.739	1012	0.883		0.782222	7		3			7		3		1013	2444		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2935	9.533	1008	0.551		0.782222	7		42			7		42		1009	2445		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.4822	16.033	1014	0.296		0.782222	7		43			7		43		1015	2446		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.9267	13.268	1004	0.887		0.782222	7		30			7		30		1005	2447		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.8445	17.377	1008	0.315		0.812222	6		31			6		31		1009	2448		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1550	9.110	1008	0.377		0.812222	7		14			7		14		1009	2449		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.0662	10.621	1012	0.794		0.812222	7		41			7		41		1013	2450		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.2703	15.395	1012	0.919		0.812222	7		13			7		13		1013	2451		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5217	1.291	1014	0.301		0.812222	7		47			7		47		1015	2452		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.2542	9.452	1012	0.780		0.812222	6		22			6		22		1013	2453		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1838	7.614	1012	0.560		0.812222	7		12			7		12		1013	2454		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.8407	4.658	1014	0.613		0.812222	7		17			7		17		1015	2455		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2124	3.738	1008	0.935		0.812222	6		23			6		23		1009	2456		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.4577	9.150	1008	0.630		0.812222	7		44			7		44		1009	2457		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.9035	3.106	1008	0.286		0.812222	7		8			7		8		1009	2458		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.0692	8.340	1008	0.449		0.812222	6		30			6		30		1009	2459		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.5687	19.809	1004	0.803		0.812222	7		43			7		43		1005	2460		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1999	17.158	1008	0.866		0.812222	7		17			7		17		1009	2461		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.3989	2.525	1008	0.685		0.812222	6		6			6		6		1009	2462		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.1229	13.291	1004	0.579		0.812222	6		29			6		29		1005	2463		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1922	20.560	1008	0.911		0.812222	7		13			7		13		1009	2464		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5019	9.478	1004	0.336		0.840000	7		25			7		25		1005	2465		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.4461	3.807	1014	0.939		0.840000	7		21			7		21		1015	2466		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.4477	17.052	1008	0.899		0.840000	7		11			7		11		1009	2467		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.3863	10.558	1014	0.667		0.840000	6		20			6		20		1015	2468		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2855	8.761	1014	0.354		0.840000	6		23			6		23		1015	2469		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.2734	5.345	1012	0.662		0.840000	7		6			7		6		1013	2470		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.8048	8.722	1014	0.822		0.840000	7		44			7		44		1015	2471		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.1575	5.740	1008	0.401		0.840000	7		19			7		19		1009	2472		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.0514	13.267	1012	0.692		0.840000	7		30			7		30		1013	2473		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.3482	1.752	1012	0.584		0.840000	7		26			7		26		1013	2474		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2690	11.673	1014	0.887		0.840000	6		38			6		38		1015	2475		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.5131	3.880	1014	0.583		0.840000	7		36			7		36		1015	2476		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.0349	14.010	1008	0.386		0.840000	7		19			7		19		1009	2477		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.6229	9.784	1008	0.558		0.865556	6		31			6		31		1009	2478		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.1449	8.630	1004	0.800		0.865556	7		26			7		26		1005	2479		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.1875	15.852	1014	0.896		0.865556	6		23			6		23		1015	2480		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.9838	3.493	1012	0.898		0.865556	7		30			7		30		1013	2481		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.0994	10.355	1008	0.891		0.865556	6		38			6		38		1009	2482		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.6588	4.687	1012	0.354		0.865556	7		4			7		4		1013	2483		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.9620	14.983	1004	0.485		0.865556	7		7			7		7		1005	2484		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.1020	16.981	1012	0.669		0.865556	7		20			7		20		1013	2485		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.2393	13.686	1008	0.891		0.865556	6		2			6		2		1009	2486		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.6482	14.777	1014	0.730		0.865556	7		20			7		20		1015	2487		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.5398	13.349	1004	0.483		0.865556	6		16			6		16		1005	2488		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.2541	17.350	1008	0.533		0.865556	6		19			6		19		1009	2489		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1738	0.642	1012	0.310		0.865556	6		43			6		43		1013	2490		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.8293	15.292	1004	0.628		0.865556	7		41			7		41		1005	2491		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.2529	12.956	1008	0.746		0.865556	7		26			7		26		1009	2492		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.4417	13.149	1012	0.872		0.865556	6		44			6		44		1013	2493		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.0356	7.594	1014	0.658		0.865556	7		44			7		44		1015	2494		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.6045	15.017	1004	0.341		0.888889	7		17			7		17		1005	2495		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.1216	6.112	1014	0.930		0.888889	6		24			6		24		1015	2496		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.2499	2.868	1012	0.555		0.888889	7		38			7		38		1013	2497		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.2784	2.250	1004	0.495		0.888889	6		45			6		45		1005	2498		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.8837	10.569	1012	0.338		0.888889	7		11			7		11		1013	2499		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.3094	19.782	1016	0.830		0.888889	7		46			7		46		1017	2500		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.0500	16.825	1012	0.369		0.888889	7		26			7		26		1013	2501		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.6323	14.196	1016	0.313		0.888889	7		32			7		32		1017	2502		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.0073	10.820	1008	0.555		0.888889	6		21			6		21		1009	2503		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.3818	7.567	1012	0.689		0.888889	7		9			7		9		1013	2504		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.2409	12.746	1014	0.648		0.888889	7		26			7		26		1015	2505		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.7418	10.596	1012	0.555		0.888889	6		2			6		2		1013	2506		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.9534	11.941	1004	0.754		0.888889	7		46			7		46		1005	2507		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.3434	4.778	1016	0.861		0.888889	7		4			7		4		1017	2508		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.5386	10.061	1012	0.481		0.888889	6		35			6		35		1013	2509		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.6094	19.415	1008	0.712		0.888889	7		12			7		12		1009	2510		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.9751	10.961	1008	0.802		0.910000	7		49			7		49		1009	2511		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.0063	7.342	1016	0.958		0.910000	7		15			7		15		1017	2512		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.1139	12.011	1008	0.700		0.910000	6		21			6		21		1009	2513		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2957	1.845	1014	0.940		0.910000	7		23			7		23		1015	2514		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.1723	12.864	1004	0.713		0.910000	7		47			7		47		1005	2515		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4297	14.226	1012	0.387		0.910000	7		26			7		26		1013	2516		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.8292	15.539	1008	0.934		0.910000	7		27			7		27		1009	2517		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1706	10.244	1012	0.741		0.910000	7		15			7		15		1013	2518		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.4344	18.769	1008	0.500		0.910000	7		16			7		16		1009	2519		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.0128	9.016	1014	0.358		0.910000	7		48			7		48		1015	2520		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.1270	12.635	1012	0.394		0.910000	7		30			7		30		1013	2521		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.8022	10.083	1012	0.393		0.910000	6		44			6		44		1013	2522		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.6902	2.488	1008	0.590		0.910000	6		24			6		24		1009	2523		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.3751	20.323	1004	0.961		0.910000	6		24			6		24		1005	2524		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.5953	15.788	1008	0.702		0.910000	7		38			7		38		1009	2525		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.9663	9.105	1012	0.787		0.910000	6		18			6		18		1013	2526		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.5380	16.037	1008	0.522		0.910000	7		5			7		5		1009	2527		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.9119	18.177	1014	0.965		0.910000	7		6			7		6		1015	2528		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1939	7.771	1004	0.982		0.928889	7		47			7		47		1005	2529		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8642	1.403	1012	0.644		0.928889	7		37			7		37		1013	2530		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7113	16.667	1012	0.984		0.928889	6		46			6		46		1013	2531		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4892	2.734	1004	0.377		0.928889	7		21			7		21		1005	2532		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.5432	14.541	1004	0.433		0.928889	6		8			6		8		1005	2533		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.1781	11.098	1008	0.435		0.928889	7		15			7		15		1009	2534		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.7975	10.545	1012	0.931		0.928889	7		29			7		29		1013	2535		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4594	12.394	1016	0.700		0.928889	7		34			7		34		1017	2536		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1371	9.330	1008	0.321		0.928889	6		28			6		28		1009	2537		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.3829	3.430	1012	0.869		0.928889	7		14			7		14		1013	2538		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.9035	8.575	1016	0.598		0.928889	6		23			6		23		1017	2539		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.2638	9.148	1008	0.874		0.928889	7		18			7		18		1009	2540		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4674	7.378	1014	0.968		0.928889	6		43			6		43		1015	2541		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1374	19.257	1012	0.787		0.928889	7		37			7		37		1013	2542		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.5042	6.834	1004	0.869		0.928889	7		47			7		47		1005	2543		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.3082	11.650	1016	0.826		0.928889	7		31			7		31		1017	2544		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2923	18.313	1004	0.754		0.928889	7		15			7		15		1005	2545		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4314	6.478	1004	0.593		0.928889	6		36			6		36		1005	2546		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2631	6.053	1014	0.609		0.928889	7		21			7		21		1015	2547		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.3757	10.889	1008	0.894		0.945556	7		25			7		25		1009	2548		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.3923	4.717	1016	0.412		0.945556	6		10			6		10		1017	2549		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.9518	13.584	1016	0.622		0.945556	7		45			7		45		1017	2550		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.0041	9.898	1016	0.799		0.945556	6		42			6		42		1017	2551		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2769	19.033	1004	0.656		0.945556	7		39			7		39		1005	2552		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5169	14.233	1008	0.702		0.945556	6		38			6		38		1009	2553		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8670	0.997	1014	0.563		0.945556	7		32			7		32		1015	2554		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.8706	10.896	1004	0.905		0.945556	6		4			6		4		1005	2555		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3897	0.453	1014	0.295		0.945556	7		10			7		10		1015	2556		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.9866	10.496	1008	0.769		0.945556	6		38			6		38		1009	2557		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.0840	16.354	1012	0.708		0.945556	6		16			6		16		1013	2558		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2557	3.552	1012	0.866		0.945556	7		40			7		40		1013	2559		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.1053	14.725	1012	0.459		0.945556	7		45			7		45		1013	2560		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4366	14.456	1008	0.382		0.945556	6		6			6		6		1009	2561		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.0085	2.449	1016	0.951		0.945556	7		31			7		31		1017	2562		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2046	15.215	1004	0.967		0.945556	6		34			6		34		1005	2563		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7502	12.560	1008	0.497		0.945556	6		38			6		38		1009	2564		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4983	13.211	1004	0.542		0.960000	7		12			7		12		1005	2565		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.3167	14.640	1008	0.738		0.960000	7		37			7		37		1009	2566		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.3946	2.378	1004	0.736		0.960000	6		30			6		30		1005	2567		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2682	15.282	1016	0.484		0.960000	6		23			6		23		1017	2568		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0239	7.886	1008	0.726		0.960000	7		26			7		26		1009	2569		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.8064	9.568	1008	0.622		0.960000	6		35			6		35		1009	2570		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4803	11.492	1004	0.850		0.960000	6		19			6		19		1005	2571		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7750	7.368	1016	0.722		0.960000	7		30			7		30		1017	2572		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.6412	15.045	1008	0.517		0.960000	7		32			7		32		1009	2573		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4891	6.611	1004	0.498		0.960000	7		37			7		37		1005	2574		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2691	13.576	1008	0.659		0.960000	7		5			7		5		1009	2575		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8540	18.523	1014	0.989		0.960000	7		13			7		13		1015	2576		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0509	6.581	1016	0.518		0.960000	6		16			6		16		1017	2577		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3585	10.655	1012	0.744		0.960000	7		39			7		39		1013	2578		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.3475	12.632	1012	0.342		0.960000	7		17			7		17		1013	2579		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5124	6.449	1004	0.736		0.960000	6		43			6		43		1005	2580		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4620	15.173	1008	0.628		0.960000	7		2			7		2		1009	2581		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9878	13.392	1014	0.554		0.960000	6		20			6		20		1015	2582		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5840	20.237	1012	0.810		0.960000	6		28			6		28		1013	2583		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.4191	20.871	1012	0.960		0.972222	6		9			6		9		1013	2584		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.6780	12.826	1016	0.770		0.972222	7		10			7		10		1017	2585		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3412	13.298	1014	0.463		0.972222	6		32			6		32		1015	2586		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2071	5.195	1012	0.546		0.972222	7		22			7		22		1013	2587		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7027	5.526	1012	0.441		0.972222	7		38			7		38		1013	2588		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.1365	13.550	1016	0.801		0.972222	6		28			6		28		1017	2589		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.5281	15.109	1004	0.534		0.972222	6		14			6		14		1005	2590		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4843	15.238	1012	0.989		0.972222	6		25			6		25		1013	2591		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4900	11.880	1008	0.687		0.972222	7		3			7		3		1009	2592		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3150	2.417	1004	0.435		0.972222	7		33			7		33		1005	2593		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4771	18.660	1012	0.779		0.972222	6		15			6		15		1013	2594		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.6485	14.593	1012	0.949		0.972222	6		41			6		41		1013	2595		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3236	15.987	1004	0.304		0.972222	6		45			6		45		1005	2596		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7052	8.878	1016	0.462		0.982222	6		40			6		40		1017	2597		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.0824	17.214	1004	0.316		0.982222	6		48			6		48		1005	2598		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6986	4.192	1004	0.415		0.982222	6		22			6		22		1005	2599		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3250	3.721	1008	0.340		0.982222	6		9			6		9		1009	2600		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.8804	20.906	1004	0.958		0.982222	6		3			6		3		1005	2601		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9185	9.374	1012	0.394		0.982222	7		35			7		35		1013	2602		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.8367	1.974	1012	0.815		0.982222	6		5			6		5		1013	2603		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9918	7.539	1008	0.781		0.982222	7		44			7		44		1009	2604		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.8484	15.840	1016	0.579		0.982222	7		22			7		22		1017	2605		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.8370	10.071	1012	0.531		0.982222	6		24			6		24		1013	2606		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2305	5.994	1012	0.382		0.982222	6		46			6		46		1013	2607		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9970	16.221	1012	0.405		0.982222	6		42			6		42		1013	2608		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9325	17.541	1008	0.501		0.982222	7		38			7		38		1009	2609		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.2424	20.815	1012	0.855		0.982222	6		4			6		4		1013	2610		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.0390	9.045	1012	0.390		0.982222	6		39			6		39		1013	2611		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.4178	9.470	1008	0.630		0.982222	6		22			6		22		1009	2612		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4897	5.146	1016	0.307		0.990000	7		12			7		12		1017	2613		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.1844	13.671	1012	0.437		0.990000	7		12			7		12		1013	2614		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7651	19.983	1012	0.378		0.990000	6		20			6		20		1013	2615		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.8036	6.933	1014	0.718		0.990000	7		47			7		47		1015	2616		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.0721	2.586	1016	0.711		0.990000	7		30			7		30		1017	2617		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6526	5.899	1008	0.359		0.990000	6		9			6		9		1009	2618		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9887	3.718	1004	0.954		0.990000	7		21			7		21		1005	2619		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.4803	16.672	1004	0.540		0.990000	7		38			7		38		1005	2620		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.7678	10.968	1008	0.626		0.990000	6		7			6		7		1009	2621		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.0396	4.242	1008	0.479		0.990000	6		6			6		6		1009	2622		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	62.0729	2.725	1008	0.868		0.990000	7		15			7		15		1009	2623		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.8112	5.120	1016	0.585		0.990000	6		41			6		41		1017	2624		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6294	3.698	1008	0.728		0.990000	6		16			6		16		1009	2625		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9770	5.474	1008	0.596		0.990000	7		9			7		9		1009	2626		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9441	3.544	1012	0.444		0.990000	6		14			6		14		1013	2627		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2493	13.937	1012	0.963		0.990000	6		29			6		29		1013	2628		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9279	1.594	1012	0.745		0.990000	7		44			7		44		1013	2629		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6761	1.028	1012	0.571		0.995556	7		3			7		3		1013	2630		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.4233	14.281	1004	0.515		0.995556	7		37			7		37		1005	2631		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.1487	19.851	1004	0.901		0.995556	6		3			6		3		1005	2632		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6306	8.765	1014	0.500		0.995556	6		12			6		12		1015	2633		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.1908	10.232	1008	0.318		0.995556	7		4			7		4		1009	2634		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2740	14.409	1004	0.928		0.995556	7		16			7		16		1005	2635		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9323	20.068	1004	0.440		0.995556	6		47			6		47		1005	2636		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.2080	3.108	1008	0.648		0.995556	6		25			6		25		1009	2637		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.5062	19.540	1014	0.819		0.995556	6		29			6		29		1015	2638		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6334	10.474	1004	0.644		0.995556	7		29			7		29		1005	2639		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.2784	17.408	1012	0.897		0.995556	6		5			6		5		1013	2640		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.1955	20.209	1016	0.473		0.995556	7		7			7		7		1017	2641		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3745	17.878	1004	0.617		0.995556	6		45			6		45		1005	2642		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.0950	12.468	1012	0.991		0.995556	7		42			7		42		1013	2643		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.3058	19.694	1012	0.909		0.995556	7		39			7		39		1013	2644		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2191	12.900	1012	0.587		0.995556	6		20			6		20		1013	2645		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.0516	7.957	1012	0.827		0.995556	7		3			7		3		1013	2646		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2508	10.031	1008	0.907		0.995556	7		10			7		10		1009	2647		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.9414	5.254	1012	0.357		0.998889	6		23			6		23		1013	2648		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.3644	6.192	1008	0.984		0.998889	6		41			6		41		1009	2649		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.0350	4.861	1012	0.946		0.998889	7		25			7		25		1013	2650		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.7660	3.981	1012	0.758		0.998889	7		46			7		46		1013	2651		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.2167	10.195	1008	0.791		0.998889	7		44			7		44		1009	2652		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.5593	19.840	1008	0.646		0.998889	7		30			7		30		1009	2653		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.9965	11.576	1008	0.845		0.998889	7		3			7		3		1009	2654		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.4629	18.476	1004	0.874		0.998889	7		3			7		3		1005	2655		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.2081	18.833	1012	0.895		0.998889	7		35			7		35		1013	2656		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.8436	4.482	1014	0.331		0.998889	7		44			7		44		1015	2657		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2474	7.354	1012	0.343		0.998889	7		48			7		48		1013	2658		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.6452	14.552	1016	0.699		0.998889	7		48			7		48		1017	2659		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.3994	18.202	1014	0.649		0.998889	7		34			7		34		1015	2660		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3795	17.391	1008	0.789		0.998889	6		20			6		20		1009	2661		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.4811	16.133	1004	0.884		0.998889	7		7			7		7		1005	2662		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3165	7.185	1008	0.522		0.998889	7		27			7		27		1009	2663		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.1318	18.759	1016	0.396		0.998889	6		9			6		9		1017	2664		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9222	15.339	1004	0.822		0.998889	6		19			6		19		1005	2665		3				1			3			20			0.0000		60.000		20.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
