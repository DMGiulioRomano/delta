
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


i "time" 0 90.0
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "III. "
; Inizio: 0.000s, Durata: 60.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	14.647	1014	0.592		0.000000	8		18			8		18		1015	2190		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	6.173	1012	0.547		0.000000	8		25			8		25		1013	2191		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	8.646	1014	0.444		0.000000	8		38			8		38		1015	2192		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.1565	4.864	1014	0.268		0.000000	7		13			7		13		1015	2193		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.1930	1.528	1008	0.508		0.000000	7		33			7		33		1009	2194		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0912	15.145	1014	0.606		0.000000	8		18			8		18		1015	2195		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	16.660	1016	0.362		0.000000	8		22			8		22		1017	2196		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0713	3.300	1016	0.286		0.000000	7		21			7		21		1017	2197		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	20.134	1016	0.602		0.000000	7		24			7		24		1017	2198		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	2.403	1014	0.400		0.000000	7		22			7		22		1015	2199		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0010	10.970	1014	0.719		0.000000	7		38			7		38		1015	2200		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0908	7.982	1008	0.564		0.065556	8		35			8		35		1009	2201		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9475	4.255	1014	0.415		0.065556	8		23			8		23		1015	2202		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.5693	22.281	1014	0.806		0.065556	7		16			7		16		1015	2203		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.5467	7.856	1016	0.298		0.065556	7		14			7		14		1017	2204		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.8728	10.328	1016	0.475		0.065556	8		18			8		18		1017	2205		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9763	13.540	1014	0.710		0.065556	7		18			7		18		1015	2206		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0749	19.540	1014	0.290		0.065556	8		35			8		35		1015	2207		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	3.9138	4.500	1008	0.787		0.065556	7		26			7		26		1009	2208		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0363	15.195	1014	0.296		0.065556	8		15			8		15		1015	2209		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	4.0188	8.299	1014	0.323		0.065556	7		39			7		39		1015	2210		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8790	10.839	1016	0.451		0.128889	8		16			8		16		1017	2211		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7000	11.343	1014	0.583		0.128889	7		17			7		17		1015	2212		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.9013	10.041	1014	0.788		0.128889	7		26			7		26		1015	2213		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7291	7.892	1016	0.394		0.128889	7		21			7		21		1017	2214		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.3872	15.251	1012	0.441		0.128889	7		24			7		24		1013	2215		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7146	18.096	1014	0.477		0.128889	7		38			7		38		1015	2216		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8094	14.930	1014	0.497		0.128889	8		44			8		44		1015	2217		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.9350	2.543	1014	0.561		0.128889	8		16			8		16		1015	2218		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.0610	18.738	1008	0.685		0.128889	7		37			7		37		1009	2219		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.6979	1.337	1016	0.773		0.128889	7		18			7		18		1017	2220		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7071	7.938	1014	0.536		0.128889	8		31			8		31		1015	2221		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.6320	19.098	1014	0.462		0.128889	7		29			7		29		1015	2222		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.3363	11.484	1016	0.747		0.128889	7		40			7		40		1017	2223		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.5110	18.934	1014	0.402		0.190000	7		32			7		32		1015	2224		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.2345	17.800	1016	0.718		0.190000	7		31			7		31		1017	2225		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.4435	15.272	1010	0.671		0.190000	7		29			7		29		1011	2226		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.2260	2.229	1016	0.335		0.190000	8		31			8		31		1017	2227		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.3066	10.122	1014	0.262		0.190000	7		38			7		38		1015	2228		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.7984	20.750	1014	0.420		0.190000	7		15			7		15		1015	2229		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.6854	13.886	1014	0.745		0.190000	7		26			7		26		1015	2230		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.3849	5.410	1016	0.461		0.190000	7		32			7		32		1017	2231		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.9627	9.198	1014	0.563		0.190000	8		42			8		42		1015	2232		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.5916	12.745	1016	0.755		0.190000	7		21			7		21		1017	2233		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7733	13.509	1016	0.413		0.248889	7		30			7		30		1017	2234		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.1980	5.245	1012	0.340		0.248889	7		16			7		16		1013	2235		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9736	22.041	1016	0.615		0.248889	7		13			7		13		1017	2236		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.7750	19.309	1016	0.749		0.248889	7		33			7		33		1017	2237		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.0002	9.155	1014	0.345		0.248889	8		19			8		19		1015	2238		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.9282	10.109	1016	0.381		0.248889	8		32			8		32		1017	2239		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.3062	11.009	1014	0.307		0.248889	7		40			7		40		1015	2240		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	15.0586	16.327	1012	0.383		0.248889	7		18			7		18		1013	2241		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8109	15.066	1010	0.567		0.248889	7		38			7		38		1011	2242		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.8037	17.304	1008	0.477		0.248889	7		27			7		27		1009	2243		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5020	14.659	1014	0.263		0.248889	7		29			7		29		1015	2244		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.6390	8.664	1014	0.429		0.248889	8		22			8		22		1015	2245		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.8981	6.610	1010	0.783		0.305556	7		45			7		45		1011	2246		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5983	15.124	1016	0.763		0.305556	8		33			8		33		1017	2247		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.3172	7.941	1012	0.513		0.305556	7		20			7		20		1013	2248		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.0919	2.132	1014	0.266		0.305556	8		23			8		23		1015	2249		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.8756	20.954	1008	0.494		0.305556	7		10			7		10		1009	2250		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.8507	18.267	1012	0.615		0.305556	7		16			7		16		1013	2251		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.3457	19.892	1012	0.580		0.305556	7		38			7		38		1013	2252		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7730	16.509	1014	0.324		0.305556	7		20			7		20		1015	2253		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.1630	11.429	1012	0.764		0.305556	7		14			7		14		1013	2254		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.3144	19.286	1012	0.433		0.360000	7		21			7		21		1013	2255		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.8058	21.444	1008	0.855		0.360000	7		35			7		35		1009	2256		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.4088	6.745	1010	0.849		0.360000	7		34			7		34		1011	2257		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.0881	18.842	1010	0.390		0.360000	7		26			7		26		1011	2258		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.7022	5.798	1016	0.471		0.360000	7		43			7		43		1017	2259		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	22.2525	15.264	1014	0.565		0.360000	7		10			7		10		1015	2260		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.6227	14.642	1014	0.841		0.360000	7		12			7		12		1015	2261		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	21.5791	10.967	1012	0.511		0.360000	7		23			7		23		1013	2262		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	20.6960	6.389	1014	0.799		0.360000	7		9			7		9		1015	2263		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8934	8.923	1016	0.424		0.412222	7		36			7		36		1017	2264		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.4382	6.693	1016	0.404		0.412222	7		12			7		12		1017	2265		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.9209	16.906	1014	0.688		0.412222	7		46			7		46		1015	2266		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.9783	22.005	1010	0.879		0.412222	8		42			8		42		1011	2267		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.0723	19.221	1008	0.592		0.412222	8		24			8		24		1009	2268		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.4984	18.854	1008	0.354		0.412222	7		17			7		17		1009	2269		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.4722	17.765	1008	0.291		0.412222	7		18			7		18		1009	2270		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.8009	2.836	1014	0.788		0.412222	8		26			8		26		1015	2271		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	25.0489	5.845	1014	0.746		0.412222	7		24			7		24		1015	2272		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	23.4853	9.663	1008	0.578		0.412222	7		29			7		29		1009	2273		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.1060	7.952	1016	0.616		0.412222	7		25			7		25		1017	2274		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.6576	9.848	1012	0.775		0.462222	7		24			7		24		1013	2275		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.3713	4.778	1008	0.348		0.462222	7		9			7		9		1009	2276		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	28.0791	5.444	1014	0.788		0.462222	7		30			7		30		1015	2277		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.8111	4.844	1016	0.871		0.462222	7		30			7		30		1017	2278		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	28.5315	9.363	1008	0.761		0.462222	7		30			7		30		1009	2279		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	28.0751	9.598	1010	0.738		0.462222	7		16			7		16		1011	2280		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	27.6166	7.794	1016	0.722		0.462222	7		15			7		15		1017	2281		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	26.9752	6.556	1012	0.424		0.462222	7		23			7		23		1013	2282		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.2247	18.580	1014	0.743		0.462222	7		37			7		37		1015	2283		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.4143	13.948	1016	0.735		0.510000	7		10			7		10		1017	2284		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.6564	19.047	1014	0.562		0.510000	7		44			7		44		1015	2285		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.2606	9.965	1014	0.609		0.510000	7		18			7		18		1015	2286		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.3455	20.495	1008	0.591		0.510000	7		40			7		40		1009	2287		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.4236	14.785	1008	0.735		0.510000	7		42			7		42		1009	2288		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.9467	11.669	1014	0.537		0.510000	7		41			7		41		1015	2289		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	29.3841	15.826	1010	0.505		0.510000	7		32			7		32		1011	2290		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.8574	9.730	1010	0.727		0.510000	7		15			7		15		1011	2291		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.1332	17.626	1016	0.724		0.510000	7		22			7		22		1017	2292		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.7068	19.981	1012	0.415		0.510000	7		7			7		7		1013	2293		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	31.2738	1.535	1014	0.658		0.510000	7		34			7		34		1015	2294		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.6291	10.156	1008	0.679		0.555556	7		46			7		46		1009	2295		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.9623	19.803	1014	0.411		0.555556	7		19			7		19		1015	2296		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.0583	4.408	1008	0.360		0.555556	7		5			7		5		1009	2297		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.9646	14.552	1016	0.569		0.555556	7		43			7		43		1017	2298		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.0288	1.092	1012	0.850		0.555556	7		46			7		46		1013	2299		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.9624	5.240	1014	0.469		0.555556	7		31			7		31		1015	2300		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.8818	4.440	1008	0.866		0.555556	7		39			7		39		1009	2301		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	32.8896	9.135	1012	0.606		0.555556	7		14			7		14		1013	2302		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	33.5013	16.601	1014	0.390		0.555556	7		11			7		11		1015	2303		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.3111	10.247	1008	0.334		0.598889	7		12			7		12		1009	2304		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.8061	9.602	1016	0.702		0.598889	7		30			7		30		1017	2305		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.5689	3.451	1010	0.584		0.598889	7		12			7		12		1011	2306		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.0060	18.603	1012	0.691		0.598889	7		11			7		11		1013	2307		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.5855	15.748	1012	0.605		0.598889	7		22			7		22		1013	2308		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.7215	16.849	1012	0.552		0.598889	7		9			7		9		1013	2309		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.9439	18.120	1014	0.910		0.598889	7		23			7		23		1015	2310		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.8396	20.287	1014	0.543		0.598889	7		28			7		28		1015	2311		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.6133	15.539	1010	0.272		0.598889	7		47			7		47		1011	2312		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.8841	10.661	1008	0.817		0.598889	7		44			7		44		1009	2313		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	35.9703	20.270	1016	0.905		0.598889	7		32			7		32		1017	2314		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.4572	7.588	1012	0.582		0.598889	7		31			7		31		1013	2315		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.0330	11.861	1016	0.291		0.640000	7		9			7		9		1017	2316		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.1008	19.473	1012	0.283		0.640000	7		24			7		24		1013	2317		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.6502	20.321	1016	0.513		0.640000	7		15			7		15		1017	2318		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.0243	8.997	1014	0.911		0.640000	7		20			7		20		1015	2319		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.7438	1.303	1010	0.810		0.640000	7		35			7		35		1011	2320		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.7794	13.041	1014	0.328		0.640000	7		27			7		27		1015	2321		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.3851	7.822	1012	0.622		0.640000	7		33			7		33		1013	2322		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	36.5048	10.620	1010	0.277		0.640000	7		47			7		47		1011	2323		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.0857	15.285	1010	0.571		0.640000	7		9			7		9		1011	2324		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.2423	18.752	1012	0.381		0.640000	6		10			6		10		1013	2325		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	38.5115	12.243	1008	0.470		0.640000	7		18			7		18		1009	2326		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.7428	18.088	1008	0.580		0.678889	7		18			7		18		1009	2327		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.6056	12.482	1016	0.924		0.678889	7		41			7		41		1017	2328		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.9553	3.842	1010	0.685		0.678889	6		17			6		17		1011	2329		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6177	2.468	1016	0.534		0.678889	7		9			7		9		1017	2330		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6723	18.233	1008	0.709		0.678889	7		11			7		11		1009	2331		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.7974	11.024	1008	0.710		0.678889	7		9			7		9		1009	2332		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.3120	5.687	1012	0.530		0.678889	7		11			7		11		1013	2333		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.0264	9.395	1008	0.390		0.678889	7		37			7		37		1009	2334		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.4321	4.398	1008	0.852		0.678889	7		20			7		20		1009	2335		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	40.6254	3.839	1008	0.739		0.678889	7		10			7		10		1009	2336		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5658	10.100	1014	0.852		0.678889	7		16			7		16		1015	2337		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.6247	17.478	1010	0.566		0.715556	7		47			7		47		1011	2338		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.4388	15.652	1010	0.566		0.715556	7		35			7		35		1011	2339		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.9218	6.889	1016	0.539		0.715556	7		4			7		4		1017	2340		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.5427	7.277	1016	0.730		0.715556	7		20			7		20		1017	2341		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.8515	7.513	1012	0.916		0.715556	7		32			7		32		1013	2342		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.2230	12.982	1010	0.622		0.715556	7		11			7		11		1011	2343		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.7629	12.866	1008	0.614		0.715556	6		32			6		32		1009	2344		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.2010	12.335	1012	0.666		0.715556	7		33			7		33		1013	2345		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.7254	14.283	1008	0.433		0.715556	6		25			6		25		1009	2346		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.1636	10.406	1016	0.452		0.715556	7		25			7		25		1017	2347		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	42.7991	17.700	1012	0.717		0.715556	6		35			6		35		1013	2348		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	41.6084	6.646	1010	0.417		0.715556	6		25			6		25		1011	2349		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.6440	2.319	1008	0.861		0.715556	7		25			7		25		1009	2350		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.6831	0.659	1012	0.311		0.715556	7		5			7		5		1013	2351		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.5858	12.081	1014	0.757		0.750000	6		10			6		10		1015	2352		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.8523	17.810	1012	0.501		0.750000	7		30			7		30		1013	2353		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.4038	13.395	1010	0.541		0.750000	7		32			7		32		1011	2354		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.2982	14.298	1010	0.521		0.750000	6		17			6		17		1011	2355		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.6293	1.117	1012	0.582		0.750000	7		37			7		37		1013	2356		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.6680	13.023	1008	0.920		0.750000	7		29			7		29		1009	2357		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.9597	1.837	1010	0.812		0.750000	7		21			7		21		1011	2358		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.5543	5.103	1016	0.692		0.750000	7		27			7		27		1017	2359		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	43.6262	15.471	1014	0.365		0.750000	7		36			7		36		1015	2360		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.2741	14.044	1012	0.501		0.750000	7		26			7		26		1013	2361		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.8216	6.464	1010	0.375		0.750000	7		47			7		47		1011	2362		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.2474	5.051	1008	0.498		0.750000	7		46			7		46		1009	2363		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.0417	19.661	1014	0.540		0.750000	7		21			7		21		1015	2364		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.7902	13.435	1012	0.346		0.750000	7		13			7		13		1013	2365		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.0249	16.601	1014	0.821		0.750000	7		9			7		9		1015	2366		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.3860	11.794	1008	0.912		0.750000	6		23			6		23		1009	2367		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	44.7185	4.089	1010	0.306		0.750000	6		43			6		43		1011	2368		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.2396	15.910	1008	0.747		0.782222	7		34			7		34		1009	2369		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.9943	4.928	1016	0.756		0.782222	7		40			7		40		1017	2370		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.5278	10.903	1008	0.623		0.782222	7		25			7		25		1009	2371		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.1095	14.445	1014	0.436		0.782222	7		6			7		6		1015	2372		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.7441	15.957	1010	0.490		0.782222	6		10			6		10		1011	2373		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.9233	2.146	1008	0.579		0.782222	6		31			6		31		1009	2374		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.0830	5.216	1016	0.306		0.782222	6		30			6		30		1017	2375		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.0377	5.709	1016	0.438		0.782222	7		30			7		30		1017	2376		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.6733	19.717	1016	0.391		0.782222	7		21			7		21		1017	2377		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.2640	13.703	1016	0.938		0.782222	6		40			6		40		1017	2378		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.4076	9.537	1010	0.502		0.782222	7		14			7		14		1011	2379		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.2088	12.290	1016	0.665		0.782222	7		5			7		5		1017	2380		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.8677	19.187	1014	0.525		0.782222	7		24			7		24		1015	2381		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.6053	2.134	1016	0.433		0.782222	6		36			6		36		1017	2382		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.8853	1.578	1008	0.614		0.782222	7		18			7		18		1009	2383		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.9224	13.097	1010	0.904		0.812222	7		8			7		8		1011	2384		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.0736	10.288	1008	0.755		0.812222	6		7			6		7		1009	2385		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.2124	3.948	1008	0.472		0.812222	7		22			7		22		1009	2386		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	46.6848	6.766	1008	0.568		0.812222	7		30			7		30		1009	2387		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.0848	7.263	1014	0.806		0.812222	7		26			7		26		1015	2388		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.3400	16.495	1008	0.365		0.812222	7		21			7		21		1009	2389		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.3192	4.991	1008	0.566		0.812222	7		47			7		47		1009	2390		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.2863	7.019	1008	0.892		0.812222	7		48			7		48		1009	2391		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.6294	3.842	1010	0.637		0.812222	6		12			6		12		1011	2392		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.6202	18.884	1012	0.874		0.812222	7		8			7		8		1013	2393		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.1602	5.388	1014	0.681		0.812222	6		7			6		7		1015	2394		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.3815	9.198	1012	0.581		0.812222	7		19			7		19		1013	2395		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	45.2520	13.488	1010	0.413		0.812222	7		29			7		29		1011	2396		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2896	15.389	1014	0.687		0.812222	7		44			7		44		1015	2397		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.3673	3.810	1010	0.315		0.812222	6		11			6		11		1011	2398		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.4651	17.809	1010	0.497		0.812222	7		17			7		17		1011	2399		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.8192	14.334	1010	0.660		0.812222	6		17			6		17		1011	2400		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	47.8749	17.091	1012	0.836		0.812222	7		11			7		11		1013	2401		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.5663	10.439	1014	0.617		0.840000	7		41			7		41		1015	2402		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.5740	6.433	1016	0.948		0.840000	7		37			7		37		1017	2403		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.7449	13.161	1010	0.662		0.840000	7		4			7		4		1011	2404		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.8720	2.791	1008	0.687		0.840000	7		39			7		39		1009	2405		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.2022	9.983	1010	0.725		0.840000	7		31			7		31		1011	2406		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	49.5674	2.285	1008	0.821		0.840000	7		48			7		48		1009	2407		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.2730	11.242	1016	0.454		0.840000	7		3			7		3		1017	2408		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.4289	10.652	1010	0.395		0.840000	7		29			7		29		1011	2409		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.7780	16.466	1012	0.364		0.840000	6		4			6		4		1013	2410		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.9119	8.416	1016	0.603		0.840000	7		23			7		23		1017	2411		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	48.4097	2.770	1012	0.840		0.840000	7		45			7		45		1013	2412		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.6719	11.692	1014	0.684		0.840000	6		13			6		13		1015	2413		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.5643	7.694	1016	0.436		0.865556	7		40			7		40		1017	2414		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.8979	4.670	1014	0.611		0.865556	6		40			6		40		1015	2415		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.4852	11.466	1010	0.404		0.865556	6		14			6		14		1011	2416		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.5547	8.992	1008	0.757		0.865556	7		41			7		41		1009	2417		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.1093	14.021	1008	0.510		0.865556	6		5			6		5		1009	2418		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.9838	18.768	1010	0.655		0.865556	6		24			6		24		1011	2419		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.0530	11.522	1008	0.387		0.865556	6		40			6		40		1009	2420		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.7891	10.329	1016	0.377		0.865556	6		6			6		6		1017	2421		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.0860	19.272	1012	0.720		0.865556	7		38			7		38		1013	2422		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	51.9616	9.623	1016	0.887		0.865556	7		37			7		37		1017	2423		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.6879	13.521	1012	0.862		0.865556	7		41			7		41		1013	2424		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.2867	20.296	1010	0.677		0.865556	6		8			6		8		1011	2425		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.3678	17.650	1010	0.798		0.865556	6		24			6		24		1011	2426		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.9321	14.865	1012	0.592		0.888889	7		8			7		8		1013	2427		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.1435	13.774	1010	0.537		0.888889	7		42			7		42		1011	2428		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.2970	19.924	1016	0.580		0.888889	7		14			7		14		1017	2429		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.0743	13.501	1016	0.370		0.888889	6		16			6		16		1017	2430		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.3992	13.556	1008	0.607		0.888889	7		23			7		23		1009	2431		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.2532	19.770	1016	0.936		0.888889	7		12			7		12		1017	2432		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	50.7024	3.874	1010	0.303		0.888889	7		14			7		14		1011	2433		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.8040	4.880	1012	0.760		0.888889	7		7			7		7		1013	2434		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.6430	2.196	1012	0.401		0.888889	7		29			7		29		1013	2435		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.7103	18.926	1010	0.712		0.888889	6		37			6		37		1011	2436		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.7481	14.451	1008	0.441		0.888889	6		40			6		40		1009	2437		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4733	4.463	1010	0.297		0.888889	6		19			6		19		1011	2438		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	52.3523	17.322	1010	0.496		0.888889	7		19			7		19		1011	2439		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.8120	12.130	1010	0.720		0.888889	6		26			6		26		1011	2440		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.3639	18.289	1010	0.528		0.910000	6		18			6		18		1011	2441		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.9116	6.509	1010	0.894		0.910000	6		25			6		25		1011	2442		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7371	2.820	1010	0.891		0.910000	7		13			7		13		1011	2443		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.5814	16.618	1008	0.294		0.910000	6		25			6		25		1009	2444		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2492	15.508	1012	0.851		0.910000	6		14			6		14		1013	2445		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.8160	18.902	1010	0.510		0.910000	6		46			6		46		1011	2446		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.2654	17.035	1008	0.390		0.910000	7		17			7		17		1009	2447		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.3792	0.970	1012	0.840		0.910000	7		32			7		32		1013	2448		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.1607	6.973	1008	0.378		0.910000	7		28			7		28		1009	2449		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.1122	10.913	1008	0.878		0.910000	6		8			6		8		1009	2450		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.6057	0.990	1010	0.628		0.910000	7		40			7		40		1011	2451		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.5689	18.482	1010	0.568		0.910000	7		35			7		35		1011	2452		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.3599	1.709	1008	0.927		0.910000	6		5			6		5		1009	2453		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4015	20.256	1016	0.371		0.928889	7		20			7		20		1017	2454		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8574	7.532	1014	0.937		0.928889	7		30			7		30		1015	2455		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.4592	4.844	1012	0.955		0.928889	6		5			6		5		1013	2456		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	53.9400	7.190	1012	0.572		0.928889	6		5			6		5		1013	2457		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.2176	13.120	1010	0.540		0.928889	7		24			7		24		1011	2458		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.6277	18.837	1016	0.522		0.928889	7		10			7		10		1017	2459		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.7060	1.082	1016	0.487		0.928889	7		38			7		38		1017	2460		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.5576	2.645	1012	0.829		0.928889	7		13			7		13		1013	2461		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8111	2.483	1008	0.492		0.928889	6		31			6		31		1009	2462		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.8782	6.584	1008	0.914		0.928889	7		28			7		28		1009	2463		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.6167	13.328	1016	0.651		0.928889	6		45			6		45		1017	2464		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.0008	1.045	1014	0.298		0.928889	7		5			7		5		1015	2465		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.0054	3.748	1010	0.520		0.928889	7		5			7		5		1011	2466		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	54.2676	13.215	1012	0.360		0.928889	6		41			6		41		1013	2467		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1472	2.397	1008	0.514		0.928889	6		19			6		19		1009	2468		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1571	3.578	1008	0.512		0.928889	6		11			6		11		1009	2469		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.7288	1.423	1012	0.715		0.928889	7		15			7		15		1013	2470		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.6962	19.238	1008	0.389		0.945556	6		16			6		16		1009	2471		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4475	0.652	1010	0.351		0.945556	6		41			6		41		1011	2472		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.4179	13.444	1012	0.749		0.945556	6		23			6		23		1013	2473		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.0675	16.062	1010	0.950		0.945556	6		2			6		2		1011	2474		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.2267	13.075	1012	0.569		0.945556	7		32			7		32		1013	2475		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1125	20.466	1008	0.493		0.945556	7		40			7		40		1009	2476		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.9394	15.118	1016	0.617		0.945556	6		25			6		25		1017	2477		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.0502	12.971	1012	0.299		0.945556	7		30			7		30		1013	2478		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3835	4.925	1008	0.366		0.945556	7		7			7		7		1009	2479		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.6649	12.854	1012	0.737		0.945556	7		37			7		37		1013	2480		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.7896	11.063	1010	0.371		0.945556	6		14			6		14		1011	2481		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.1142	20.740	1016	0.881		0.945556	6		37			6		37		1017	2482		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.3384	7.788	1014	0.671		0.945556	7		31			7		31		1015	2483		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5266	6.444	1008	0.788		0.945556	7		30			7		30		1009	2484		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.2070	20.288	1012	0.715		0.960000	7		23			7		23		1013	2485		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.7847	12.225	1008	0.563		0.960000	6		17			6		17		1009	2486		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1403	5.185	1010	0.583		0.960000	7		4			7		4		1011	2487		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.4172	1.523	1014	0.461		0.960000	7		37			7		37		1015	2488		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4909	4.530	1010	0.372		0.960000	6		32			6		32		1011	2489		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2489	15.116	1010	0.639		0.960000	7		2			7		2		1011	2490		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.9545	11.717	1016	0.789		0.960000	6		44			6		44		1017	2491		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7234	5.039	1010	0.776		0.960000	7		33			7		33		1011	2492		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.1267	10.195	1012	0.514		0.960000	7		37			7		37		1013	2493		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0600	8.254	1008	0.466		0.960000	6		37			6		37		1009	2494		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.7063	8.447	1012	0.637		0.960000	7		11			7		11		1013	2495		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0041	3.950	1012	0.377		0.960000	6		6			6		6		1013	2496		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.6368	9.808	1014	0.750		0.960000	7		44			7		44		1015	2497		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.6567	9.171	1014	0.865		0.960000	6		8			6		8		1015	2498		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4523	7.555	1016	0.720		0.960000	6		26			6		26		1017	2499		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3101	1.260	1010	0.413		0.972222	7		14			7		14		1011	2500		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0662	13.450	1010	0.970		0.972222	7		32			7		32		1011	2501		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2738	7.687	1012	0.992		0.972222	7		48			7		48		1013	2502		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7364	19.851	1010	0.497		0.972222	7		31			7		31		1011	2503		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2750	10.379	1008	0.748		0.972222	7		12			7		12		1009	2504		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	55.1450	9.861	1008	0.328		0.972222	6		48			6		48		1009	2505		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.0634	15.672	1012	0.485		0.972222	7		11			7		11		1013	2506		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.1131	9.308	1008	0.324		0.972222	6		39			6		39		1009	2507		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9138	7.636	1012	0.436		0.972222	7		18			7		18		1013	2508		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.1168	5.602	1010	0.686		0.972222	6		16			6		16		1011	2509		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9740	2.391	1008	0.431		0.972222	6		21			6		21		1009	2510		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4616	3.919	1014	0.416		0.972222	7		3			7		3		1015	2511		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.2182	14.453	1008	0.940		0.972222	7		35			7		35		1009	2512		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.7180	4.995	1014	0.615		0.972222	7		11			7		11		1015	2513		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5467	20.570	1012	0.830		0.982222	7		13			7		13		1013	2514		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.5983	4.975	1010	0.393		0.982222	7		46			7		46		1011	2515		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.5206	15.496	1016	0.395		0.982222	7		7			7		7		1017	2516		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.6567	12.077	1008	0.388		0.982222	7		7			7		7		1009	2517		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9410	15.417	1008	0.626		0.982222	7		36			7		36		1009	2518		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.8398	14.183	1012	0.348		0.982222	6		28			6		28		1013	2519		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	56.6885	0.777	1012	0.483		0.982222	7		46			7		46		1013	2520		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7561	17.436	1012	0.804		0.982222	7		31			7		31		1013	2521		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.2833	5.180	1010	0.917		0.982222	7		18			7		18		1011	2522		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.1274	3.450	1010	0.536		0.982222	7		15			7		15		1011	2523		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7401	11.222	1008	0.753		0.982222	6		45			6		45		1009	2524		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5319	5.362	1016	0.925		0.982222	7		8			7		8		1017	2525		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.3661	8.450	1008	0.438		0.982222	7		21			7		21		1009	2526		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.3591	1.157	1012	0.708		0.982222	7		2			7		2		1013	2527		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.9334	5.630	1016	0.422		0.982222	6		24			6		24		1017	2528		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.7124	14.041	1010	0.674		0.982222	6		48			6		48		1011	2529		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4898	17.177	1008	0.376		0.982222	7		8			7		8		1009	2530		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7055	5.384	1014	0.981		0.990000	7		24			7		24		1015	2531		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.9919	8.951	1010	0.789		0.990000	7		34			7		34		1011	2532		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.0637	20.344	1010	0.552		0.990000	6		47			6		47		1011	2533		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6007	6.296	1012	0.746		0.990000	6		15			6		15		1013	2534		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3458	1.233	1008	0.565		0.990000	7		43			7		43		1009	2535		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5839	19.357	1012	0.356		0.990000	7		12			7		12		1013	2536		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.7942	10.850	1016	0.400		0.990000	6		2			6		2		1017	2537		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6816	14.763	1016	0.905		0.990000	6		11			6		11		1017	2538		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.9921	16.202	1008	0.321		0.990000	7		46			7		46		1009	2539		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.9727	9.935	1016	0.949		0.990000	7		39			7		39		1017	2540		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.4231	14.823	1008	0.619		0.990000	6		21			6		21		1009	2541		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.7790	0.587	1010	0.340		0.990000	7		41			7		41		1011	2542		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	57.5731	5.525	1008	0.615		0.990000	7		31			7		31		1009	2543		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.5115	12.037	1008	0.608		0.990000	6		18			6		18		1009	2544		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.6996	1.549	1016	0.753		0.990000	6		45			6		45		1017	2545		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2970	17.450	1014	0.875		0.990000	6		26			6		26		1015	2546		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9721	15.551	1014	0.418		0.995556	6		26			6		26		1015	2547		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4282	18.244	1008	0.641		0.995556	7		36			7		36		1009	2548		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.7442	3.602	1016	0.507		0.995556	6		45			6		45		1017	2549		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.3067	17.974	1010	0.419		0.995556	7		15			7		15		1011	2550		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6146	18.686	1008	0.679		0.995556	7		26			7		26		1009	2551		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.9478	1.266	1008	0.495		0.995556	7		8			7		8		1009	2552		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.9443	10.434	1010	0.388		0.995556	6		44			6		44		1011	2553		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.6977	19.739	1010	0.627		0.995556	6		39			6		39		1011	2554		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.1312	18.066	1010	0.662		0.995556	6		1			6		1		1011	2555		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.6236	18.376	1012	0.666		0.995556	6		47			6		47		1013	2556		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.1771	2.502	1016	0.855		0.995556	7		23			7		23		1017	2557		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.8681	12.282	1016	0.505		0.995556	7		6			7		6		1017	2558		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4551	6.977	1012	0.848		0.995556	7		14			7		14		1013	2559		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.4567	19.543	1016	0.854		0.995556	6		48			6		48		1017	2560		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.4922	9.334	1014	0.892		0.998889	7		33			7		33		1015	2561		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.8283	3.445	1010	0.952		0.998889	6		12			6		12		1011	2562		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.8822	20.576	1012	0.974		0.998889	6		25			6		25		1013	2563		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5588	0.592	1014	0.540		0.998889	7		17			7		17		1015	2564		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.2396	9.380	1014	0.469		0.998889	6		39			6		39		1015	2565		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.4433	3.868	1010	0.778		0.998889	6		42			6		42		1011	2566		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	61.3250	1.545	1010	0.535		0.998889	7		36			7		36		1011	2567		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.5570	7.773	1010	0.369		0.998889	6		4			6		4		1011	2568		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.3632	3.513	1008	0.571		0.998889	7		35			7		35		1009	2569		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	63.8434	16.157	1014	0.637		0.998889	7		12			7		12		1015	2570		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.8362	8.744	1014	0.645		0.998889	7		13			7		13		1015	2571		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	58.1055	10.594	1010	0.380		0.998889	7		25			7		25		1011	2572		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	59.3177	14.394	1010	0.579		0.998889	6		22			6		22		1011	2573		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.0555	15.665	1008	0.485		0.998889	6		41			6		41		1009	2574		3				1			3			20			0.0000		60.000		20.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	60.4540	8.309	1008	0.546		0.998889	7		9			7		9		1009	2575		3				1			3			20			0.0000		60.000		20.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
