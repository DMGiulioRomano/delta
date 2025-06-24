
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/prova_part_5.wav" -W -d -m0
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

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/initIsoAmp.orc"
#include "../includes/eventoSonoro.orc"
#include "../includes/voce.orc"

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
f 0 60.0 ; Evento f fittizio per definire la durata totale
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


f 1000 0 3 -2 3 4 2
f 1001 0 3 -2 0 1 0
f 1002 0 3 -2 8 12 8
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 7 9 12
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 1 2 3
f 1009 0 3 -2 0 1 2
f 1010 0 3 -2 2 3 5
f 1011 0 3 -2 0 1 2


i "time" 0 60.0
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "III. ripresaglissante"
; Inizio: 0.000s, Durata: 40.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	0.0472	33.244	1000	24.111		0.000000	4		10			4		13		1001	1		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.3604	39.898	1000	22.946		0.468750	4		10			4		19		1001	3		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.3416	37.755	1002	19.282		0.468750	5		19			5		10		1003	4		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.5496	32.450	1004	24.678		0.875000	4		22			4		7		1005	5		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.4561	25.544	1004	14.408		1.218750	4		8			4		1		1005	6		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.2861	25.714	1006	15.565		1.218750	4		15			4		22		1007	7		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.3559	24.628	1006	14.871		1.218750	4		16			4		1		1007	8		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.3004	24.428	1008	17.411		1.218750	3		9			3		4		1009	9		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	24.3377	24.916	1010	22.350		1.218750	3		15			3		1		1011	10		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.0715	19.928	1000	20.258		1.500000	4		28			4		50		1001	11		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	30.0262	19.974	1004	19.570		1.500000	4		-28			4		1		1005	12		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.3527	15.647	1010	17.627		1.718750	4		32			4		50		1011	14		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.2922	15.708	1008	11.581		1.718750	5		-1			5		1		1009	15		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.4117	15.588	1010	18.600		1.718750	4		19			4		19		1011	17		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	34.4000	15.600	1000	20.991		1.718750	4		9			4		1		1001	18		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.4987	12.501	1010	13.433		1.875000	4		16			4		1		1011	19		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5178	12.482	1000	13.599		1.875000	3		15			3		38		1001	20		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5131	12.487	1010	14.560		1.875000	4		3			4		1		1011	22		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.5056	12.494	1010	17.387		1.875000	4		24			4		39		1011	23		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.4674	12.533	1010	12.419		1.875000	4		11			4		2		1011	25		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	37.4565	12.543	1006	18.267		1.875000	4		-4			4		27		1007	26		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.3738	10.626	1010	15.917		1.968750	4		0			4		1		1011	27		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.3692	10.631	1008	16.644		1.968750	4		31			4		1		1009	28		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.2967	10.703	1010	12.948		1.968750	4		27			4		1		1011	29		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.3044	10.696	1008	16.514		1.968750	5		-12			5		1		1009	30		1				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	39.4296	10.570	1000	12.374		1.968750	4		30			4		8		1001	31		0				1			2			20			0.0000		40.000		10.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.6880	12.704	1010	0.273		1.750647	9		27			9		27		1011	33		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.6115	1.208	1004	0.246		1.750647	9		27			9		27		1005	34		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.0323	30.898	1008	0.736		1.750647	8		21			8		21		1009	35		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	1.6458	7.388	1010	0.364		1.750647	8		23			8		23		1011	37		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5574	26.663	1010	0.218		1.750647	8		28			8		28		1011	39		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.8594	7.262	1010	0.584		1.750647	8		27			8		27		1011	40		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.9104	12.283	1010	0.240		1.750647	8		25			8		25		1011	41		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.4464	8.384	1010	0.386		1.750647	9		23			9		23		1011	44		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	2.5288	16.248	1000	0.262		1.750647	9		27			9		27		1001	45		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.4213	14.216	1010	0.505		1.384454	8		13			8		13		1011	46		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.9581	13.441	1000	0.703		1.384454	8		26			8		26		1001	47		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.7023	18.639	1010	0.798		1.384454	8		30			8		30		1011	48		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	6.2551	9.709	1010	0.437		1.384454	9		26			9		26		1011	49		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.4329	9.424	1010	0.697		1.314557	8		31			8		31		1011	50		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.8333	7.691	1000	0.426		1.314557	8		25			8		25		1001	51		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.6297	23.043	1002	0.771		1.314557	8		28			8		28		1003	53		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.8959	12.509	1000	0.597		1.314557	8		28			8		28		1001	54		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	7.9342	13.744	1006	0.653		1.314557	9		22			9		22		1007	55		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	8.4203	3.341	1002	0.341		1.314557	8		23			8		23		1003	56		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.8103	19.664	1002	0.763		1.195016	8		21			8		21		1003	57		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.9140	19.391	1010	0.762		1.195016	8		15			8		15		1011	58		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.5140	3.415	1000	0.445		1.195016	8		22			8		22		1001	59		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.9071	25.971	1010	0.625		1.195016	8		35			8		35		1011	60		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.2123	13.963	1010	0.219		1.195016	8		17			8		17		1011	61		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	9.9246	10.567	1010	0.327		1.195016	8		20			8		20		1011	62		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.5784	0.902	1000	0.679		1.195016	8		32			8		32		1001	63		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.3230	4.781	1000	0.633		1.144483	8		35			8		35		1001	64		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.3726	8.488	1010	0.264		1.144483	8		15			8		15		1011	65		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.2220	26.542	1004	0.576		1.144483	8		21			8		21		1005	66		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	10.7605	8.804	1006	0.348		1.144483	8		29			8		29		1007	68		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.2951	13.421	1000	0.489		0.986922	8		23			8		23		1001	69		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.9765	21.699	1002	0.280		0.986922	8		21			8		21		1003	70		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	12.1386	26.244	1008	0.795		0.986922	8		12			8		12		1009	71		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	11.7701	1.327	1000	0.323		0.986922	8		16			8		16		1001	72		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	14.5769	27.365	1000	0.283		0.794646	8		34			8		34		1001	73		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	13.4297	27.359	1010	0.795		0.794646	8		33			8		33		1011	74		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.8784	10.851	1002	0.793		0.595973	7		14			7		14		1003	75		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.0013	2.460	1002	0.450		0.595973	8		28			8		28		1003	76		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.7346	27.221	1008	0.761		0.595973	8		8			8		8		1009	77		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.7342	17.648	1002	0.495		0.595973	8		27			8		27		1003	78		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	17.0343	28.036	1008	0.773		0.595973	7		27			7		27		1009	79		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	16.9590	7.164	1004	0.316		0.595973	8		26			8		26		1005	80		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7410	19.924	1004	0.627		0.421971	8		38			8		38		1005	81		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	18.7236	27.900	1002	0.300		0.421971	8		29			8		29		1003	82		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.1871	14.055	1008	0.406		0.386230	8		3			8		3		1009	83		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.4737	10.234	1004	0.669		0.386230	8		47			8		47		1005	84		3				1			5			20			0.0000		40.000		30.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	19.2223	6.861	1004	0.301		0.386230	8		24			8		24		1005	85		3				1			5			20			0.0000		40.000		30.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
