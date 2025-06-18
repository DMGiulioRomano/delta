
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/parte1.wav" -W ;-d -m0
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

gi_debug init 2

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/initIsoAmp.orc"
#include "../includes/eventoSonoro.orc"
#include "../includes/voce.orc"

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
f 0 164.6439303263922 ; Evento f fittizio per definire la durata totale
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
f 20 0 4096 7 1 2047 1 1 0 512 1 1024 1 512 0
; crescendo_lento
f 21 0 4096 7 0 4096 1
; diminuendo_rapido
f 22 0 4096 7 1 4096 0
; plateau_forte
f 23 0 4096 10 1
; crescendo_diminuendo
f 24 0 4096 7 0 2048 1 2048 0


f 1000 0 4 -2 3 20 5 8
f 1001 0 4 -2 0 1 2 3
f 1002 0 4 -2 2 10 4 15
f 1003 0 4 -2 0 1 2 3
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 8 12 8
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 7 9 12
f 1009 0 3 -2 0 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Cluster"
; Inizio: 0.000s, Durata: 28.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3806	14.000	1002	14.000		3			5		25			1003	3		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.4614	17.500	1002	14.000		3			2		26			1003	6		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.4636	14.000	1000	14.000		3			7		19			1001	1		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5298	17.500	1000	14.000		3			2		13			1001	4		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5552	22.400	1000	14.000		3			2		40			1001	5		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5588	14.000	1002	14.000		3			7		45			1003	2		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9523	22.400	1002	14.000		3			8		37			1003	8		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9615	22.400	1002	14.000		3			5		38			1003	7		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9653	14.000	1000	14.000		3			4		24			1001	9		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0373	17.500	1002	14.000		3			3		49			1003	10		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1103	17.500	1002	14.000		3			6		16			1003	16		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1505	17.500	1000	14.000		3			8		35			1001	13		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1991	22.400	1000	14.000		3			5		24			1001	12		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2094	22.400	1002	14.000		3			4		44			1003	14		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2178	17.500	1000	14.000		3			4		16			1001	18		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2231	17.500	1000	14.000		3			6		23			1001	11		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2535	22.400	1000	14.000		3			5		16			1001	15		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2580	14.000	1000	14.000		3			2		50			1001	17		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.2319	17.500	1000	14.000		3			8		11			1001	19		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3798	22.400	1002	14.000		3			4		27			1003	23		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4031	14.000	1002	14.000		3			6		41			1003	20		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4331	17.500	1002	14.000		3			7		50			1003	24		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4468	22.400	1000	14.000		3			3		32			1001	22		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4658	17.500	1002	14.000		3			8		41			1003	25		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4727	14.000	1000	14.000		3			3		20			1001	21		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2040	17.500	1002	14.000		3			3		30			1003	27		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2118	17.500	1002	14.000		3			6		10			1003	38		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2232	14.000	1000	14.000		3			4		30			1001	28		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2326	17.500	1002	14.000		3			8		29			1003	26		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2735	22.400	1002	14.000		3			5		16			1003	36		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2859	14.000	1000	14.000		3			3		43			1001	31		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2956	17.500	1000	14.000		3			9		33			1001	29		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2995	14.000	1000	14.000		3			7		31			1001	33		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3234	14.000	1002	14.000		3			5		33			1003	37		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3244	14.000	1002	14.000		3			8		32			1003	30		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3296	14.000	1000	14.000		3			5		19			1001	32		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3335	22.400	1002	14.000		3			5		40			1003	39		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3656	17.500	1002	14.000		3			4		44			1003	35		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3918	17.500	1002	14.000		3			5		15			1003	34		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0098	17.500	1000	14.000		3			6		43			1001	40		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2284	17.500	1002	14.000		3			8		33			1003	43		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2438	14.000	1002	14.000		3			8		33			1003	45		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2668	22.400	1000	14.000		3			4		16			1001	44		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2885	14.000	1000	14.000		3			3		37			1001	41		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.2926	22.400	1000	14.000		3			4		44			1001	42		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3232	14.000	1000	14.000		3			2		10			1001	46		0				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.3387	14.000	1002	14.000		3			4		48			1003	47		1				1			2			20			0.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1394	3.750	1002	3.000		2			4		20			1003	48		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1686	3.000	1002	3.000		2			6		50			1003	49		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2314	3.000	1002	3.000		2			8		42			1003	50		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3546	4.800	1000	3.000		2			5		35			1001	51		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3969	4.800	1002	3.000		2			5		49			1003	52		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.4481	3.750	1000	3.000		2			4		30			1001	54		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5212	3.000	1000	3.000		2			8		48			1001	55		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.5313	4.800	1000	3.000		2			7		12			1001	53		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7841	3.750	1002	3.000		2			7		24			1003	59		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8660	3.750	1002	3.000		2			7		33			1003	58		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8785	3.750	1000	3.000		2			6		34			1001	57		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8896	4.800	1002	3.000		2			5		15			1003	62		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9431	3.000	1002	3.000		2			7		10			1003	60		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9533	3.000	1000	3.000		2			8		32			1001	56		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9887	3.000	1002	3.000		2			5		32			1003	61		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0421	4.800	1000	3.000		2			6		48			1001	70		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0448	4.800	1000	3.000		2			5		48			1001	63		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0465	3.750	1000	3.000		2			4		41			1001	71		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0495	4.800	1000	3.000		2			4		19			1001	69		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0504	4.800	1002	3.000		2			5		12			1003	72		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0789	3.750	1000	3.000		2			6		27			1001	68		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0907	3.750	1002	3.000		2			4		16			1003	66		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1143	4.800	1000	3.000		2			7		49			1001	67		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1170	3.750	1002	3.000		2			5		19			1003	64		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1199	3.750	1002	3.000		2			8		36			1003	65		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5265	3.750	1002	3.000		2			6		23			1003	73		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3679	4.800	1002	3.000		2			6		13			1003	74		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3817	3.750	1000	3.000		2			7		20			1001	77		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3857	3.000	1000	3.000		2			8		31			1001	76		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3870	4.800	1002	3.000		2			5		21			1003	79		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4093	3.000	1002	3.000		2			5		42			1003	75		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4111	3.000	1002	3.000		2			5		48			1003	78		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7080	3.750	1002	3.000		2			6		36			1003	84		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7324	3.750	1000	3.000		2			4		23			1001	81		1				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7413	3.750	1002	3.000		2			6		18			1003	80		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7514	3.750	1000	3.000		2			8		38			1001	83		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7914	4.800	1000	3.000		2			5		26			1001	82		0				-1			2			20			28.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8582	10.000	1002	8.000		3			6		29			1003	87		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9346	12.800	1002	8.000		3			4		31			1003	106		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9419	10.000	1002	8.000		3			7		20			1003	104		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9431	10.000	1000	8.000		3			7		36			1001	118		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9508	12.800	1000	8.000		3			2		38			1001	111		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9529	12.800	1000	8.000		3			9		47			1001	119		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9580	8.000	1000	8.000		3			7		24			1001	93		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9612	12.800	1000	8.000		3			4		48			1001	92		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9618	8.000	1000	8.000		3			4		15			1001	125		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9728	8.000	1002	8.000		3			8		24			1003	122		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9752	10.000	1002	8.000		3			9		43			1003	126		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9767	10.000	1002	8.000		3			3		18			1003	91		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9827	10.000	1002	8.000		3			3		47			1003	105		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9830	12.800	1002	8.000		3			9		28			1003	110		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9848	12.800	1000	8.000		3			7		33			1001	97		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9867	8.000	1002	8.000		3			3		15			1003	90		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9867	8.000	1002	8.000		3			4		36			1003	86		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9887	10.000	1002	8.000		3			7		21			1003	124		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9917	12.800	1000	8.000		3			8		31			1001	100		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9945	12.800	1000	8.000		3			3		47			1001	98		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9946	10.000	1000	8.000		3			5		17			1001	116		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9954	12.800	1002	8.000		3			4		39			1003	102		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0098	12.800	1002	8.000		3			9		42			1003	114		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0110	8.000	1000	8.000		3			9		50			1001	117		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0123	8.000	1000	8.000		3			7		40			1001	95		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0148	12.800	1000	8.000		3			7		44			1001	103		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0192	10.000	1002	8.000		3			5		37			1003	107		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0239	12.800	1000	8.000		3			5		43			1001	115		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0240	10.000	1000	8.000		3			4		37			1001	85		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0246	10.000	1002	8.000		3			9		34			1003	94		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0275	10.000	1000	8.000		3			3		38			1001	112		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0300	8.000	1000	8.000		3			5		48			1001	123		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0320	10.000	1002	8.000		3			5		43			1003	121		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0332	12.800	1002	8.000		3			9		39			1003	109		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0354	8.000	1002	8.000		3			3		39			1003	88		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0398	10.000	1002	8.000		3			2		18			1003	99		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0404	10.000	1002	8.000		3			7		19			1003	113		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0724	8.000	1002	8.000		3			4		14			1003	96		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0841	10.000	1002	8.000		3			8		32			1003	108		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0851	10.000	1000	8.000		3			7		17			1001	101		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0989	8.000	1000	8.000		3			2		41			1001	120		0				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1102	8.000	1000	8.000		3			5		27			1001	89		1				1			2			20			34.0000		16.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8154	14.000	1000	14.000		0			2		19			1001	138		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8354	22.400	1000	14.000		0			7		18			1001	153		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8390	22.400	1000	14.000		0			4		19			1001	185		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8421	14.000	1002	14.000		0			2		19			1003	164		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8490	22.400	1000	14.000		0			5		19			1001	148		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8496	14.000	1000	14.000		0			2		19			1001	150		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8553	17.500	1000	14.000		0			2		19			1001	169		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8618	14.000	1000	14.000		0			6		19			1001	161		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8672	17.500	1002	14.000		0			3		19			1003	142		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8754	17.500	1000	14.000		0			5		19			1001	194		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8758	17.500	1000	14.000		0			3		19			1001	146		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8764	22.400	1002	14.000		0			7		19			1003	135		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8806	22.400	1000	14.000		0			4		18			1001	195		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8809	14.000	1000	14.000		0			3		19			1001	168		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8842	14.000	1000	14.000		0			4		19			1001	193		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8858	14.000	1000	14.000		0			4		19			1001	147		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8886	14.000	1000	14.000		0			4		19			1001	162		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8930	17.500	1000	14.000		0			7		19			1001	177		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8932	17.500	1000	14.000		0			8		18			1001	140		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8940	22.400	1000	14.000		0			1		18			1001	171		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8968	22.400	1002	14.000		0			5		19			1003	143		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8980	22.400	1000	14.000		0			5		18			1001	183		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9000	22.400	1002	14.000		0			7		18			1003	165		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9001	22.400	1000	14.000		0			5		18			1001	159		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9024	17.500	1000	14.000		0			4		18			1001	156		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9075	22.400	1002	14.000		0			1		19			1003	189		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9098	17.500	1000	14.000		0			9		19			1001	187		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9105	14.000	1002	14.000		0			8		19			1003	139		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9119	22.400	1000	14.000		0			3		19			1001	166		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9137	14.000	1002	14.000		0			3		19			1003	151		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9161	22.400	1000	14.000		0			5		19			1001	192		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9204	22.400	1002	14.000		0			3		19			1003	141		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9208	14.000	1000	14.000		0			4		19			1001	178		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9218	17.500	1000	14.000		0			4		19			1001	128		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9261	17.500	1002	14.000		0			4		19			1003	136		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9262	17.500	1000	14.000		0			5		19			1001	149		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9263	17.500	1002	14.000		0			9		19			1003	155		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9281	17.500	1000	14.000		0			6		19			1001	186		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9317	22.400	1002	14.000		0			1		19			1003	131		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9318	14.000	1002	14.000		0			5		19			1003	152		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9338	17.500	1002	14.000		0			5		19			1003	175		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9340	14.000	1000	14.000		0			4		19			1001	158		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9348	22.400	1000	14.000		0			7		19			1001	174		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9354	17.500	1000	14.000		0			5		19			1001	129		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9361	22.400	1002	14.000		0			3		18			1003	137		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9363	22.400	1002	14.000		0			7		18			1003	173		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9371	17.500	1000	14.000		0			3		19			1001	144		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9387	22.400	1002	14.000		0			9		19			1003	188		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9412	17.500	1000	14.000		0			4		18			1001	130		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9427	14.000	1002	14.000		0			4		19			1003	170		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9428	14.000	1002	14.000		0			2		19			1003	191		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9439	17.500	1002	14.000		0			3		19			1003	157		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9452	22.400	1000	14.000		0			4		19			1001	133		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9471	22.400	1002	14.000		0			4		19			1003	145		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9491	22.400	1002	14.000		0			2		19			1003	184		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9607	17.500	1002	14.000		0			7		19			1003	179		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9618	14.000	1002	14.000		0			7		19			1003	176		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9631	22.400	1000	14.000		0			7		18			1001	167		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9648	22.400	1000	14.000		0			1		19			1001	182		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9655	14.000	1000	14.000		0			7		18			1001	132		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9659	17.500	1000	14.000		0			3		19			1001	154		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9682	22.400	1002	14.000		0			5		18			1003	181		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9731	17.500	1000	14.000		0			5		19			1001	172		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9822	22.400	1000	14.000		0			1		18			1001	134		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9846	17.500	1000	14.000		0			8		19			1001	127		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9867	17.500	1000	14.000		0			3		19			1001	163		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9953	17.500	1000	14.000		0			8		19			1001	180		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9960	17.500	1002	14.000		0			3		19			1003	190		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0041	17.500	1000	14.000		0			4		19			1001	160		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2026	17.500	1002	14.000		0			5		18			1003	215		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2101	14.000	1000	14.000		0			5		19			1001	267		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2267	17.500	1000	14.000		0			4		19			1001	218		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2319	17.500	1000	14.000		0			5		19			1001	285		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2324	22.400	1000	14.000		0			5		18			1001	230		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2380	14.000	1002	14.000		0			9		18			1003	260		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2386	17.500	1000	14.000		0			7		19			1001	262		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2391	14.000	1002	14.000		0			5		18			1003	263		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2408	14.000	1002	14.000		0			9		19			1003	270		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2490	22.400	1000	14.000		0			7		19			1001	234		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2505	22.400	1002	14.000		0			6		18			1003	247		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2541	14.000	1000	14.000		0			7		18			1001	284		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2599	17.500	1000	14.000		0			5		18			1001	217		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2619	22.400	1000	14.000		0			7		19			1001	245		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2619	22.400	1002	14.000		0			9		18			1003	236		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2634	22.400	1002	14.000		0			1		18			1003	275		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2653	14.000	1002	14.000		0			7		19			1003	253		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2693	17.500	1000	14.000		0			6		18			1001	208		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2693	14.000	1002	14.000		0			4		19			1003	213		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2722	17.500	1002	14.000		0			7		19			1003	280		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2789	14.000	1002	14.000		0			2		18			1003	221		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2790	22.400	1002	14.000		0			5		19			1003	205		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2799	14.000	1002	14.000		0			3		18			1003	265		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2828	14.000	1002	14.000		0			2		18			1003	223		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2830	14.000	1000	14.000		0			7		18			1001	226		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2841	14.000	1002	14.000		0			6		18			1003	271		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2857	22.400	1002	14.000		0			4		18			1003	227		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2857	22.400	1000	14.000		0			9		19			1001	201		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2879	17.500	1000	14.000		0			7		18			1001	233		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2881	14.000	1000	14.000		0			3		19			1001	252		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2896	22.400	1002	14.000		0			3		18			1003	222		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2938	22.400	1000	14.000		0			7		18			1001	266		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2970	14.000	1000	14.000		0			7		19			1001	272		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3016	22.400	1002	14.000		0			6		18			1003	251		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3038	17.500	1000	14.000		0			8		18			1001	241		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3041	14.000	1002	14.000		0			9		18			1003	202		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3056	14.000	1000	14.000		0			4		19			1001	196		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3059	14.000	1000	14.000		0			7		19			1001	220		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3088	14.000	1002	14.000		0			7		19			1003	243		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3094	22.400	1002	14.000		0			7		19			1003	242		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3117	22.400	1002	14.000		0			8		19			1003	199		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3177	14.000	1002	14.000		0			6		18			1003	207		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3183	17.500	1002	14.000		0			2		19			1003	197		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3185	17.500	1000	14.000		0			8		19			1001	212		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3190	22.400	1000	14.000		0			4		19			1001	254		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3191	22.400	1000	14.000		0			9		18			1001	249		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3223	14.000	1002	14.000		0			7		18			1003	224		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3228	22.400	1000	14.000		0			8		19			1001	225		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3255	14.000	1000	14.000		0			4		18			1001	237		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3290	17.500	1002	14.000		0			6		18			1003	255		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3297	22.400	1002	14.000		0			9		19			1003	203		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3314	17.500	1000	14.000		0			2		18			1001	259		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3318	14.000	1002	14.000		0			6		19			1003	214		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3325	14.000	1002	14.000		0			1		19			1003	256		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3332	14.000	1002	14.000		0			6		19			1003	281		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3355	22.400	1000	14.000		0			6		19			1001	228		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3361	14.000	1000	14.000		0			8		18			1001	232		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3426	17.500	1000	14.000		0			4		18			1001	282		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3429	17.500	1002	14.000		0			7		19			1003	231		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3430	14.000	1002	14.000		0			2		19			1003	209		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3480	14.000	1002	14.000		0			5		18			1003	206		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3489	14.000	1002	14.000		0			7		18			1003	286		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3512	22.400	1002	14.000		0			8		18			1003	276		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3542	14.000	1000	14.000		0			9		19			1001	273		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3546	22.400	1002	14.000		0			5		18			1003	216		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3546	17.500	1000	14.000		0			7		19			1001	274		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3570	22.400	1002	14.000		0			3		19			1003	239		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3624	14.000	1002	14.000		0			7		18			1003	240		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3628	14.000	1002	14.000		0			2		19			1003	279		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3645	14.000	1000	14.000		0			6		18			1001	244		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3670	22.400	1000	14.000		0			9		18			1001	277		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3690	14.000	1000	14.000		0			6		18			1001	283		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3695	14.000	1000	14.000		0			3		18			1001	204		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3704	14.000	1000	14.000		0			6		18			1001	268		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3720	14.000	1000	14.000		0			7		18			1001	261		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3738	14.000	1000	14.000		0			8		19			1001	238		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3745	14.000	1000	14.000		0			5		18			1001	246		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3752	22.400	1000	14.000		0			8		19			1001	258		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3758	17.500	1002	14.000		0			4		19			1003	219		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3779	14.000	1002	14.000		0			3		18			1003	264		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3794	22.400	1000	14.000		0			6		18			1001	278		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3835	17.500	1000	14.000		0			4		18			1001	248		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3841	14.000	1002	14.000		0			2		18			1003	269		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3871	22.400	1000	14.000		0			8		19			1001	257		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3905	17.500	1002	14.000		0			9		19			1003	200		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3948	17.500	1002	14.000		0			5		19			1003	198		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3981	14.000	1000	14.000		0			1		19			1001	235		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4008	14.000	1002	14.000		0			1		19			1003	229		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4110	22.400	1000	14.000		0			3		18			1001	210		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4153	17.500	1000	14.000		0			5		18			1001	211		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4248	14.000	1000	14.000		0			6		19			1001	250		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2017	22.400	1002	14.000		0			3		18			1003	326		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2063	22.400	1002	14.000		0			5		19			1003	325		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2074	22.400	1002	14.000		0			5		16			1003	305		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2120	17.500	1000	14.000		0			6		17			1001	373		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2178	17.500	1000	14.000		0			7		19			1001	315		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2180	17.500	1000	14.000		0			9		19			1001	330		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2205	22.400	1000	14.000		0			9		19			1001	358		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2227	14.000	1002	14.000		0			3		19			1003	320		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2231	14.000	1002	14.000		0			4		17			1003	355		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2303	22.400	1000	14.000		0			7		19			1001	362		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2345	17.500	1002	14.000		0			1		19			1003	324		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2391	22.400	1002	14.000		0			7		18			1003	340		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2423	14.000	1002	14.000		0			7		17			1003	321		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2466	17.500	1000	14.000		0			2		18			1001	368		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2483	22.400	1002	14.000		0			9		18			1003	374		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2491	14.000	1000	14.000		0			3		18			1001	313		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2513	14.000	1000	14.000		0			8		17			1001	369		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2535	17.500	1000	14.000		0			5		16			1001	332		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2548	14.000	1002	14.000		0			5		19			1003	334		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2578	22.400	1002	14.000		0			9		19			1003	303		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2584	14.000	1002	14.000		0			2		19			1003	309		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2594	17.500	1002	14.000		0			4		17			1003	307		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2604	22.400	1002	14.000		0			8		19			1003	290		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2618	14.000	1002	14.000		0			6		17			1003	352		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2624	17.500	1002	14.000		0			9		16			1003	365		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2637	22.400	1002	14.000		0			5		19			1003	371		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2661	22.400	1000	14.000		0			4		16			1001	333		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2673	14.000	1000	14.000		0			3		18			1001	293		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2678	17.500	1000	14.000		0			3		17			1001	363		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2679	14.000	1002	14.000		0			4		18			1003	360		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2680	17.500	1000	14.000		0			1		17			1001	297		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2710	17.500	1002	14.000		0			8		19			1003	304		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2743	22.400	1000	14.000		0			7		17			1001	318		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2748	17.500	1000	14.000		0			9		18			1001	319		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2766	14.000	1000	14.000		0			1		19			1001	311		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2775	17.500	1000	14.000		0			6		17			1001	364		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2809	14.000	1002	14.000		0			5		19			1003	366		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2835	22.400	1000	14.000		0			6		19			1001	356		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2836	17.500	1000	14.000		0			1		19			1001	367		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2853	14.000	1000	14.000		0			6		17			1001	353		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2865	22.400	1000	14.000		0			8		19			1001	342		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2866	22.400	1000	14.000		0			2		19			1001	300		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2872	22.400	1002	14.000		0			3		18			1003	299		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2893	22.400	1002	14.000		0			6		17			1003	298		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2902	17.500	1000	14.000		0			1		19			1001	341		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2936	14.000	1002	14.000		0			7		18			1003	339		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2962	14.000	1000	14.000		0			3		17			1001	337		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2964	17.500	1000	14.000		0			6		19			1001	357		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2977	14.000	1000	14.000		0			8		18			1001	350		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2982	22.400	1002	14.000		0			2		18			1003	302		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2985	22.400	1000	14.000		0			6		16			1001	328		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3022	17.500	1002	14.000		0			7		16			1003	312		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3044	22.400	1002	14.000		0			1		16			1003	317		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3056	14.000	1000	14.000		0			5		19			1001	344		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3061	22.400	1002	14.000		0			5		17			1003	372		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3079	14.000	1002	14.000		0			6		19			1003	310		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3108	17.500	1000	14.000		0			7		18			1001	343		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3109	14.000	1002	14.000		0			7		18			1003	322		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3109	14.000	1000	14.000		0			4		18			1001	292		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3132	22.400	1002	14.000		0			8		17			1003	346		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3139	22.400	1000	14.000		0			6		16			1001	288		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3141	17.500	1000	14.000		0			7		18			1001	345		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3191	22.400	1002	14.000		0			6		17			1003	301		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3205	22.400	1002	14.000		0			3		19			1003	349		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3235	22.400	1000	14.000		0			8		17			1001	294		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3249	17.500	1002	14.000		0			3		18			1003	375		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3257	14.000	1002	14.000		0			4		17			1003	354		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3262	14.000	1002	14.000		0			6		19			1003	296		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3264	17.500	1002	14.000		0			8		18			1003	351		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3270	22.400	1002	14.000		0			4		19			1003	370		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3278	14.000	1000	14.000		0			4		18			1001	289		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3297	22.400	1002	14.000		0			1		17			1003	348		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3297	22.400	1002	14.000		0			6		19			1003	314		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3327	22.400	1002	14.000		0			4		17			1003	327		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3333	17.500	1002	14.000		0			4		17			1003	338		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3376	17.500	1000	14.000		0			4		17			1001	323		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3422	14.000	1002	14.000		0			6		18			1003	308		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3436	14.000	1002	14.000		0			6		17			1003	295		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3449	17.500	1002	14.000		0			4		16			1003	329		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3458	14.000	1002	14.000		0			9		17			1003	336		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3521	17.500	1002	14.000		0			3		18			1003	347		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3552	14.000	1000	14.000		0			2		17			1001	306		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3608	22.400	1000	14.000		0			8		17			1001	316		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3622	17.500	1000	14.000		0			2		17			1001	359		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3643	17.500	1000	14.000		0			4		19			1001	335		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3652	17.500	1000	14.000		0			3		19			1001	361		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3688	17.500	1000	14.000		0			5		16			1001	291		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3698	17.500	1000	14.000		0			9		17			1001	331		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3787	22.400	1002	14.000		0			1		17			1003	287		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2694	17.500	1000	14.000		0			6		19			1001	400		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2709	14.000	1002	14.000		0			1		19			1003	464		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2773	14.000	1002	14.000		0			8		17			1003	443		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2774	22.400	1000	14.000		0			4		17			1001	395		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2823	17.500	1000	14.000		0			6		18			1001	446		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2829	17.500	1000	14.000		0			8		17			1001	442		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2935	17.500	1000	14.000		0			9		19			1001	441		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.2978	17.500	1000	14.000		0			5		18			1001	460		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3015	17.500	1000	14.000		0			3		19			1001	450		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3038	14.000	1002	14.000		0			3		19			1003	388		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3061	14.000	1000	14.000		0			4		18			1001	457		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3079	17.500	1000	14.000		0			7		18			1001	411		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3123	17.500	1002	14.000		0			7		18			1003	404		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3168	14.000	1000	14.000		0			9		18			1001	390		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3206	14.000	1002	14.000		0			7		19			1003	424		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3242	17.500	1000	14.000		0			5		19			1001	417		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3244	22.400	1002	14.000		0			2		17			1003	421		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3349	17.500	1002	14.000		0			7		16			1003	384		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3355	22.400	1002	14.000		0			5		18			1003	396		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3384	14.000	1002	14.000		0			5		16			1003	449		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3395	14.000	1000	14.000		0			3		17			1001	393		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3401	14.000	1002	14.000		0			5		17			1003	380		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3409	14.000	1000	14.000		0			6		19			1001	437		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3411	22.400	1000	14.000		0			4		16			1001	429		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3415	22.400	1000	14.000		0			4		15			1001	430		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3436	14.000	1002	14.000		0			3		19			1003	407		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3451	22.400	1002	14.000		0			4		17			1003	391		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3454	14.000	1000	14.000		0			9		18			1001	378		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3460	22.400	1002	14.000		0			3		19			1003	401		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3504	14.000	1000	14.000		0			4		18			1001	402		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3529	22.400	1002	14.000		0			8		18			1003	444		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3529	22.400	1000	14.000		0			8		17			1001	381		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3533	22.400	1000	14.000		0			8		17			1001	453		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3544	17.500	1000	14.000		0			1		19			1001	431		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3573	14.000	1002	14.000		0			3		16			1003	428		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3588	14.000	1000	14.000		0			4		16			1001	423		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3627	17.500	1000	14.000		0			3		19			1001	447		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3642	17.500	1002	14.000		0			3		18			1003	461		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3696	17.500	1000	14.000		0			4		19			1001	454		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3718	22.400	1000	14.000		0			4		19			1001	456		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3736	14.000	1000	14.000		0			2		19			1001	451		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3745	17.500	1000	14.000		0			6		18			1001	445		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3751	17.500	1000	14.000		0			6		18			1001	426		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3754	14.000	1002	14.000		0			6		19			1003	405		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3761	14.000	1002	14.000		0			3		16			1003	377		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3766	17.500	1000	14.000		0			7		18			1001	463		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3768	22.400	1002	14.000		0			3		18			1003	435		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3781	17.500	1002	14.000		0			8		18			1003	438		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3830	17.500	1000	14.000		0			2		19			1001	398		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3844	22.400	1002	14.000		0			4		18			1003	448		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3849	14.000	1002	14.000		0			2		19			1003	465		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3867	22.400	1000	14.000		0			3		16			1001	439		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3909	17.500	1000	14.000		0			6		15			1001	413		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3941	22.400	1002	14.000		0			7		16			1003	427		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3941	17.500	1000	14.000		0			8		16			1001	382		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3967	14.000	1000	14.000		0			4		19			1001	412		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.3971	22.400	1000	14.000		0			3		17			1001	434		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4001	22.400	1002	14.000		0			6		18			1003	433		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4003	17.500	1000	14.000		0			8		17			1001	414		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4019	17.500	1002	14.000		0			6		16			1003	394		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4029	17.500	1000	14.000		0			5		16			1001	415		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4044	17.500	1002	14.000		0			5		19			1003	399		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4140	22.400	1002	14.000		0			1		19			1003	383		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4147	22.400	1002	14.000		0			8		16			1003	420		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4181	17.500	1000	14.000		0			2		17			1001	418		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4184	17.500	1002	14.000		0			6		17			1003	455		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4223	22.400	1002	14.000		0			5		19			1003	410		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4242	14.000	1000	14.000		0			7		18			1001	419		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4244	17.500	1000	14.000		0			3		17			1001	403		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4255	14.000	1002	14.000		0			4		16			1003	379		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4275	22.400	1002	14.000		0			8		19			1003	406		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4278	17.500	1000	14.000		0			3		19			1001	385		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4302	14.000	1002	14.000		0			2		18			1003	386		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4306	17.500	1000	14.000		0			4		17			1001	416		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4335	22.400	1000	14.000		0			9		16			1001	436		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4340	17.500	1000	14.000		0			6		18			1001	409		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4361	22.400	1000	14.000		0			2		18			1001	392		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4386	22.400	1002	14.000		0			6		16			1003	452		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4412	22.400	1002	14.000		0			3		18			1003	462		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4430	17.500	1000	14.000		0			6		17			1001	432		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4430	17.500	1000	14.000		0			1		18			1001	389		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4613	22.400	1002	14.000		0			1		17			1003	408		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4621	14.000	1000	14.000		0			4		19			1001	387		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4627	14.000	1002	14.000		0			6		19			1003	397		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4828	22.400	1002	14.000		0			5		16			1003	440		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.4843	17.500	1000	14.000		0			5		16			1001	459		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5008	14.000	1000	14.000		0			8		17			1001	422		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5008	22.400	1002	14.000		0			6		16			1003	376		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5037	14.000	1002	14.000		0			8		16			1003	458		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.5387	14.000	1002	14.000		0			8		16			1003	425		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4631	14.000	1000	14.000		0			8		16			1001	521		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4646	17.500	1002	14.000		0			6		15			1003	487		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4712	17.500	1002	14.000		0			2		17			1003	481		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4723	22.400	1002	14.000		0			4		17			1003	501		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4777	14.000	1002	14.000		0			4		16			1003	516		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4830	22.400	1000	14.000		0			1		19			1001	491		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4957	17.500	1002	14.000		0			8		19			1003	504		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4977	22.400	1000	14.000		0			4		15			1001	497		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4984	22.400	1000	14.000		0			5		16			1001	484		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5052	17.500	1000	14.000		0			8		18			1001	473		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5085	17.500	1002	14.000		0			5		18			1003	471		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5103	14.000	1000	14.000		0			9		15			1001	485		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5172	14.000	1002	14.000		0			3		19			1003	489		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5177	22.400	1002	14.000		0			8		18			1003	506		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5186	17.500	1002	14.000		0			4		19			1003	505		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5202	17.500	1002	14.000		0			8		19			1003	510		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5250	17.500	1002	14.000		0			4		16			1003	468		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5288	22.400	1000	14.000		0			5		16			1001	507		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5306	14.000	1002	14.000		0			6		17			1003	488		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5309	22.400	1000	14.000		0			8		17			1001	518		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5318	14.000	1002	14.000		0			8		18			1003	523		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5345	14.000	1002	14.000		0			5		19			1003	499		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5363	22.400	1002	14.000		0			9		18			1003	480		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5365	22.400	1000	14.000		0			7		18			1001	467		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5376	17.500	1002	14.000		0			3		16			1003	495		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5402	14.000	1000	14.000		0			9		18			1001	513		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5411	17.500	1000	14.000		0			2		15			1001	512		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5431	22.400	1000	14.000		0			5		19			1001	469		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5440	14.000	1002	14.000		0			7		15			1003	511		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5444	14.000	1002	14.000		0			8		18			1003	486		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5514	22.400	1002	14.000		0			6		16			1003	472		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5539	17.500	1000	14.000		0			8		15			1001	525		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5554	14.000	1002	14.000		0			5		15			1003	514		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5598	22.400	1000	14.000		0			9		15			1001	524		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5607	22.400	1002	14.000		0			7		19			1003	528		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5663	17.500	1000	14.000		0			5		17			1001	478		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5682	22.400	1002	14.000		0			8		15			1003	466		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5705	17.500	1000	14.000		0			4		19			1001	483		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5715	17.500	1002	14.000		0			4		16			1003	515		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5745	22.400	1002	14.000		0			3		15			1003	503		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5749	22.400	1002	14.000		0			3		19			1003	477		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5785	22.400	1000	14.000		0			6		16			1001	526		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5795	14.000	1000	14.000		0			3		19			1001	496		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5797	22.400	1002	14.000		0			9		19			1003	522		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5801	22.400	1002	14.000		0			6		19			1003	509		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5809	17.500	1002	14.000		0			5		18			1003	479		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5815	14.000	1000	14.000		0			4		18			1001	492		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5824	17.500	1002	14.000		0			9		19			1003	494		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5829	14.000	1002	14.000		0			7		16			1003	470		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5924	14.000	1000	14.000		0			9		17			1001	493		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5933	17.500	1002	14.000		0			5		18			1003	475		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5952	14.000	1002	14.000		0			1		15			1003	520		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5957	14.000	1002	14.000		0			8		19			1003	500		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6022	14.000	1000	14.000		0			3		16			1001	517		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6061	22.400	1002	14.000		0			2		19			1003	498		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6093	17.500	1000	14.000		0			2		16			1001	502		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6128	14.000	1000	14.000		0			7		16			1001	519		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6147	17.500	1002	14.000		0			6		16			1003	527		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6186	14.000	1000	14.000		0			3		18			1001	490		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6245	17.500	1002	14.000		0			5		19			1003	482		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6449	17.500	1002	14.000		0			5		18			1003	529		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6610	22.400	1000	14.000		0			6		19			1001	474		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6693	14.000	1000	14.000		0			8		16			1001	476		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6745	17.500	1002	14.000		0			6		18			1003	508		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.6746	14.000	1000	14.000		0			2		16			1001	583		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7131	22.400	1000	14.000		0			6		16			1001	551		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7301	17.500	1000	14.000		0			1		16			1001	560		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7308	14.000	1000	14.000		0			7		19			1001	588		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7343	22.400	1002	14.000		0			7		19			1003	543		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7373	17.500	1000	14.000		0			9		17			1001	616		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7387	14.000	1002	14.000		0			3		15			1003	556		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7419	17.500	1002	14.000		0			1		16			1003	608		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7461	14.000	1000	14.000		0			6		17			1001	536		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7474	22.400	1002	14.000		0			8		15			1003	571		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7476	17.500	1002	14.000		0			2		17			1003	587		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7485	17.500	1000	14.000		0			1		18			1001	598		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7539	22.400	1002	14.000		0			2		16			1003	537		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7540	17.500	1000	14.000		0			8		16			1001	530		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7575	22.400	1000	14.000		0			7		17			1001	547		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7632	17.500	1002	14.000		0			6		16			1003	596		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7646	22.400	1002	14.000		0			6		17			1003	538		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7704	22.400	1002	14.000		0			6		15			1003	566		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7738	14.000	1000	14.000		0			5		19			1001	613		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7748	22.400	1000	14.000		0			8		19			1001	618		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7754	17.500	1002	14.000		0			9		19			1003	586		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7768	22.400	1000	14.000		0			3		16			1001	540		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7768	17.500	1002	14.000		0			7		17			1003	594		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7770	14.000	1002	14.000		0			3		18			1003	627		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7789	14.000	1002	14.000		0			6		17			1003	592		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7817	14.000	1000	14.000		0			5		19			1001	565		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7817	22.400	1000	14.000		0			5		17			1001	531		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7820	17.500	1002	14.000		0			7		15			1003	622		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7840	17.500	1000	14.000		0			8		15			1001	535		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7857	14.000	1000	14.000		0			5		15			1001	573		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7871	22.400	1000	14.000		0			8		15			1001	599		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7879	22.400	1000	14.000		0			6		16			1001	534		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7924	14.000	1002	14.000		0			5		16			1003	554		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7927	14.000	1000	14.000		0			4		16			1001	603		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7937	14.000	1002	14.000		0			2		18			1003	548		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7944	14.000	1002	14.000		0			2		17			1003	632		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7949	17.500	1002	14.000		0			4		17			1003	575		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7950	22.400	1000	14.000		0			2		19			1001	619		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7960	22.400	1002	14.000		0			4		19			1003	584		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7983	17.500	1000	14.000		0			8		17			1001	633		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.7993	14.000	1002	14.000		0			7		18			1003	609		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8017	22.400	1000	14.000		0			7		15			1001	532		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8025	22.400	1000	14.000		0			6		17			1001	568		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8030	17.500	1000	14.000		0			2		15			1001	606		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8031	17.500	1000	14.000		0			7		16			1001	549		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8031	22.400	1002	14.000		0			5		16			1003	569		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8035	22.400	1002	14.000		0			1		15			1003	533		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8082	22.400	1002	14.000		0			6		19			1003	634		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8126	17.500	1000	14.000		0			3		18			1001	624		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8131	14.000	1000	14.000		0			6		16			1001	558		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8137	22.400	1000	14.000		0			6		19			1001	626		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8140	17.500	1000	14.000		0			5		16			1001	625		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8143	17.500	1002	14.000		0			3		16			1003	563		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8147	14.000	1002	14.000		0			7		16			1003	620		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8153	22.400	1002	14.000		0			6		16			1003	631		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8154	22.400	1002	14.000		0			4		15			1003	597		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8155	17.500	1000	14.000		0			5		17			1001	623		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8166	22.400	1002	14.000		0			5		16			1003	585		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8179	22.400	1002	14.000		0			7		18			1003	615		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8188	14.000	1000	14.000		0			4		16			1001	576		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8203	22.400	1000	14.000		0			3		15			1001	546		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8203	22.400	1002	14.000		0			3		16			1003	582		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8209	17.500	1000	14.000		0			4		19			1001	579		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8229	17.500	1002	14.000		0			7		19			1003	581		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8230	17.500	1002	14.000		0			6		17			1003	557		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8241	14.000	1000	14.000		0			8		16			1001	617		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8267	22.400	1002	14.000		0			8		17			1003	601		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8279	17.500	1000	14.000		0			8		17			1001	591		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8305	22.400	1000	14.000		0			3		19			1001	580		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8305	22.400	1002	14.000		0			6		18			1003	561		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8316	22.400	1000	14.000		0			6		16			1001	550		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8316	14.000	1000	14.000		0			7		16			1001	542		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8324	22.400	1002	14.000		0			6		16			1003	612		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8343	22.400	1002	14.000		0			3		16			1003	629		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8362	22.400	1000	14.000		0			4		16			1001	539		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8371	22.400	1000	14.000		0			4		18			1001	552		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8382	14.000	1000	14.000		0			5		19			1001	562		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8398	22.400	1000	14.000		0			2		17			1001	577		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8402	14.000	1000	14.000		0			9		16			1001	602		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8405	14.000	1002	14.000		0			9		16			1003	572		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8407	14.000	1002	14.000		0			1		18			1003	555		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8425	17.500	1000	14.000		0			8		15			1001	567		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8429	22.400	1000	14.000		0			1		18			1001	574		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8447	22.400	1002	14.000		0			8		18			1003	605		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8457	17.500	1002	14.000		0			4		18			1003	545		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8477	14.000	1002	14.000		0			9		18			1003	553		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8480	17.500	1000	14.000		0			8		18			1001	611		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8495	14.000	1002	14.000		0			7		17			1003	610		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8509	22.400	1000	14.000		0			8		17			1001	578		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8576	14.000	1000	14.000		0			4		19			1001	564		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8607	22.400	1002	14.000		0			4		16			1003	541		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8616	22.400	1000	14.000		0			3		17			1001	544		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8642	14.000	1002	14.000		0			2		18			1003	595		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8663	17.500	1000	14.000		0			2		17			1001	589		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8754	17.500	1000	14.000		0			2		19			1001	614		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8756	17.500	1000	14.000		0			8		16			1001	628		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8762	17.500	1000	14.000		0			8		16			1001	590		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8768	17.500	1002	14.000		0			8		16			1003	630		3				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8782	22.400	1000	14.000		0			8		15			1001	570		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8854	17.500	1002	14.000		0			1		17			1003	604		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8893	22.400	1002	14.000		0			1		18			1003	593		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8957	22.400	1002	14.000		0			6		19			1003	600		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.8968	14.000	1002	14.000		0			5		15			1003	559		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9052	17.500	1000	14.000		0			5		15			1001	621		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	63.9075	22.400	1000	14.000		0			5		18			1001	607		2				1			2			20			50.0000		28.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9482	4.800	1000	3.000		5			8		19			1001	651		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9592	3.000	1002	3.000		5			3		19			1003	659		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9779	3.000	1000	3.000		5			8		19			1001	638		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9809	4.800	1000	3.000		5			2		19			1001	639		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9845	4.800	1000	3.000		5			4		19			1001	661		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	77.9948	4.800	1000	3.000		5			4		19			1001	644		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0009	3.750	1002	3.000		5			9		19			1003	648		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0079	3.000	1000	3.000		5			5		19			1001	649		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0206	3.000	1002	3.000		5			4		19			1003	635		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0313	3.750	1002	3.000		5			6		19			1003	636		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0320	3.000	1000	3.000		5			6		19			1001	664		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0333	3.750	1000	3.000		5			8		19			1001	657		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0425	3.000	1000	3.000		5			7		19			1001	658		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0467	3.750	1002	3.000		5			4		19			1003	662		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0538	4.800	1000	3.000		5			4		19			1001	647		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0591	3.750	1002	3.000		5			8		19			1003	655		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0622	3.000	1000	3.000		5			5		19			1001	663		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0721	3.750	1000	3.000		5			5		19			1001	650		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0727	3.750	1000	3.000		5			6		19			1001	652		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0739	3.750	1002	3.000		5			8		19			1003	643		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0930	4.800	1002	3.000		5			9		19			1003	642		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0935	4.800	1002	3.000		5			6		19			1003	654		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0937	3.000	1000	3.000		5			6		19			1001	646		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.0991	3.000	1002	3.000		5			5		19			1003	640		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1026	3.750	1000	3.000		5			6		19			1001	641		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1057	3.750	1000	3.000		5			2		19			1001	653		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1084	3.750	1002	3.000		5			8		19			1003	645		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1373	3.000	1002	3.000		5			4		19			1003	660		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1559	3.750	1000	3.000		5			5		19			1001	637		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.1811	3.000	1002	3.000		5			9		19			1003	656		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4838	3.750	1002	3.000		5			3		19			1003	666		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.4865	3.000	1002	3.000		5			7		19			1003	694		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5266	3.000	1002	3.000		5			3		19			1003	685		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5385	4.800	1002	3.000		5			2		19			1003	704		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5473	3.000	1002	3.000		5			3		19			1003	692		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5511	3.750	1000	3.000		5			7		19			1001	711		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5535	3.000	1000	3.000		5			6		19			1001	706		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5586	3.750	1002	3.000		5			6		19			1003	781		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5619	4.800	1002	3.000		5			4		19			1003	682		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5633	3.750	1000	3.000		5			9		19			1001	693		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5645	3.000	1000	3.000		5			6		19			1001	669		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5650	3.750	1000	3.000		5			8		19			1001	687		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5713	4.800	1002	3.000		5			2		19			1003	675		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5725	3.750	1000	3.000		5			6		19			1001	676		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5764	4.800	1000	3.000		5			1		19			1001	718		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5784	4.800	1002	3.000		5			7		19			1003	686		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5794	4.800	1002	3.000		5			8		19			1003	699		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5800	3.750	1000	3.000		5			6		19			1001	672		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5812	3.750	1000	3.000		5			8		19			1001	668		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5821	3.000	1000	3.000		5			5		19			1001	690		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5854	4.800	1002	3.000		5			3		19			1003	695		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5855	3.750	1002	3.000		5			9		19			1003	665		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5871	3.000	1002	3.000		5			7		19			1003	670		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5885	3.000	1000	3.000		5			3		19			1001	689		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5901	3.000	1000	3.000		5			3		19			1001	712		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5939	3.750	1000	3.000		5			3		19			1001	714		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5952	4.800	1000	3.000		5			7		19			1001	778		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5969	3.750	1002	3.000		5			8		19			1003	698		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5976	3.750	1002	3.000		5			9		19			1003	703		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.5989	4.800	1000	3.000		5			9		19			1001	701		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6000	4.800	1002	3.000		5			2		19			1003	740		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6000	3.000	1002	3.000		5			4		19			1003	709		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6016	4.800	1000	3.000		5			6		19			1001	779		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6024	4.800	1002	3.000		5			7		19			1003	696		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6092	3.000	1000	3.000		5			8		19			1001	684		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6135	4.800	1002	3.000		5			4		19			1003	674		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6175	4.800	1000	3.000		5			9		19			1001	691		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6188	3.750	1000	3.000		5			2		19			1001	697		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6201	3.750	1000	3.000		5			7		19			1001	717		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6215	4.800	1002	3.000		5			7		19			1003	715		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6215	4.800	1000	3.000		5			1		19			1001	734		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6235	3.750	1000	3.000		5			7		19			1001	716		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6249	3.750	1000	3.000		5			2		19			1001	777		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6298	4.800	1002	3.000		5			6		19			1003	678		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6301	3.000	1002	3.000		5			4		19			1003	710		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6311	3.000	1000	3.000		5			2		19			1001	671		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6320	3.750	1000	3.000		5			5		19			1001	744		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6336	4.800	1000	3.000		5			4		19			1001	705		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6367	4.800	1002	3.000		5			7		19			1003	762		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6379	4.800	1000	3.000		5			6		19			1001	728		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6383	3.000	1002	3.000		5			4		19			1003	775		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6391	3.750	1002	3.000		5			9		19			1003	770		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6395	3.000	1000	3.000		5			8		19			1001	702		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6425	4.800	1002	3.000		5			5		19			1003	743		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6469	3.750	1000	3.000		5			7		19			1001	737		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6481	4.800	1002	3.000		5			7		19			1003	681		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6490	3.000	1000	3.000		5			7		19			1001	721		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6495	4.800	1000	3.000		5			4		19			1001	679		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6504	3.750	1000	3.000		5			8		19			1001	673		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6524	3.000	1002	3.000		5			2		19			1003	683		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6527	4.800	1000	3.000		5			8		19			1001	769		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6535	3.000	1000	3.000		5			4		19			1001	708		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6538	4.800	1000	3.000		5			4		19			1001	755		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6549	3.000	1000	3.000		5			6		19			1001	736		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6656	3.750	1002	3.000		5			6		19			1003	760		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6682	4.800	1002	3.000		5			5		19			1003	700		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6684	3.000	1002	3.000		5			4		18			1003	719		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6707	3.750	1000	3.000		5			7		19			1001	667		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6728	3.000	1000	3.000		5			5		19			1001	776		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6746	3.750	1002	3.000		5			2		19			1003	677		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6762	3.750	1002	3.000		5			4		19			1003	735		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6769	4.800	1002	3.000		5			9		19			1003	759		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6774	3.000	1002	3.000		5			8		19			1003	746		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6774	4.800	1002	3.000		5			3		19			1003	742		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6794	4.800	1002	3.000		5			4		19			1003	748		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6800	3.750	1000	3.000		5			7		19			1001	757		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6807	4.800	1000	3.000		5			2		19			1001	739		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6811	4.800	1002	3.000		5			3		19			1003	727		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6837	3.750	1002	3.000		5			6		19			1003	756		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6848	4.800	1002	3.000		5			2		19			1003	750		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6850	4.800	1002	3.000		5			2		19			1003	713		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6861	3.000	1000	3.000		5			7		19			1001	707		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6865	3.000	1000	3.000		5			5		19			1001	680		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6865	3.750	1002	3.000		5			8		19			1003	765		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6867	3.000	1000	3.000		5			5		19			1001	723		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6868	4.800	1002	3.000		5			4		19			1003	688		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6882	3.750	1000	3.000		5			3		19			1001	774		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6902	4.800	1000	3.000		5			5		18			1001	767		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6912	4.800	1000	3.000		5			6		19			1001	720		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6921	3.750	1002	3.000		5			4		19			1003	722		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6928	4.800	1002	3.000		5			6		19			1003	771		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6938	4.800	1000	3.000		5			4		19			1001	725		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6939	3.000	1000	3.000		5			4		19			1001	745		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.6948	4.800	1000	3.000		5			5		19			1001	754		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7017	4.800	1002	3.000		5			2		19			1003	747		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7030	3.750	1002	3.000		5			5		19			1003	773		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7036	3.750	1000	3.000		5			4		19			1001	753		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7048	3.750	1002	3.000		5			1		19			1003	741		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7060	4.800	1000	3.000		5			8		19			1001	724		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7062	3.750	1000	3.000		5			4		18			1001	780		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7128	4.800	1002	3.000		5			6		18			1003	752		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7142	4.800	1002	3.000		5			8		19			1003	763		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7149	4.800	1002	3.000		5			4		19			1003	738		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7196	3.000	1000	3.000		5			6		19			1001	751		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7249	4.800	1000	3.000		5			2		19			1001	764		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7289	3.750	1000	3.000		5			5		19			1001	758		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7348	3.750	1000	3.000		5			8		19			1001	766		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7358	4.800	1002	3.000		5			5		19			1003	730		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7367	3.750	1000	3.000		5			7		19			1001	729		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7367	4.800	1002	3.000		5			5		19			1003	768		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7379	3.750	1000	3.000		5			3		19			1001	732		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7414	3.750	1000	3.000		5			8		18			1001	726		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7452	3.000	1002	3.000		5			7		19			1003	749		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7475	4.800	1002	3.000		5			2		19			1003	731		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7593	3.750	1002	3.000		5			8		19			1003	733		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7631	3.750	1000	3.000		5			4		19			1001	772		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	78.7686	4.800	1002	3.000		5			4		19			1003	761		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7158	3.750	1002	3.000		5			3		17			1003	846		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7199	3.000	1000	3.000		5			6		18			1001	848		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7205	3.750	1002	3.000		5			2		18			1003	828		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7218	4.800	1000	3.000		5			8		17			1001	821		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7283	4.800	1000	3.000		5			3		18			1001	803		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7304	3.000	1000	3.000		5			5		18			1001	813		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7341	3.000	1002	3.000		5			3		19			1003	837		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7354	3.750	1002	3.000		5			7		18			1003	800		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7453	3.000	1000	3.000		5			3		17			1001	825		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7471	4.800	1000	3.000		5			6		19			1001	804		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7489	3.000	1002	3.000		5			5		17			1003	836		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7503	4.800	1000	3.000		5			2		17			1001	840		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7559	3.750	1002	3.000		5			5		19			1003	852		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7561	3.750	1002	3.000		5			3		19			1003	784		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7650	4.800	1002	3.000		5			3		19			1003	843		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7672	3.000	1002	3.000		5			5		18			1003	834		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7684	4.800	1000	3.000		5			4		18			1001	822		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7685	3.750	1000	3.000		5			7		19			1001	839		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7691	4.800	1000	3.000		5			6		19			1001	827		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7699	3.750	1000	3.000		5			4		19			1001	844		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7719	3.750	1000	3.000		5			7		19			1001	854		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7766	3.750	1002	3.000		5			4		19			1003	786		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7769	3.000	1002	3.000		5			1		17			1003	841		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7772	3.000	1000	3.000		5			2		18			1001	815		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7789	4.800	1002	3.000		5			6		17			1003	850		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7818	3.750	1002	3.000		5			4		18			1003	823		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7848	3.750	1002	3.000		5			1		19			1003	795		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7849	4.800	1002	3.000		5			8		19			1003	835		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.7950	3.750	1000	3.000		5			7		19			1001	814		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8006	4.800	1000	3.000		5			2		17			1001	818		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8008	3.000	1002	3.000		5			3		18			1003	811		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8019	3.750	1002	3.000		5			7		18			1003	809		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8049	3.750	1000	3.000		5			2		17			1001	824		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8057	3.750	1002	3.000		5			7		17			1003	806		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8084	4.800	1002	3.000		5			3		19			1003	838		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8092	4.800	1000	3.000		5			6		18			1001	788		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8112	4.800	1002	3.000		5			8		19			1003	820		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8117	4.800	1002	3.000		5			5		18			1003	842		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8128	3.000	1002	3.000		5			7		17			1003	783		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8139	3.000	1002	3.000		5			4		17			1003	787		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8170	4.800	1000	3.000		5			4		18			1001	790		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8173	3.000	1000	3.000		5			4		19			1001	782		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8183	3.000	1002	3.000		5			5		17			1003	833		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8185	4.800	1000	3.000		5			2		17			1001	796		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8205	3.750	1000	3.000		5			5		17			1001	807		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8246	4.800	1002	3.000		5			8		18			1003	798		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8248	3.750	1002	3.000		5			7		18			1003	794		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8249	3.750	1000	3.000		5			2		18			1001	792		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8268	3.000	1002	3.000		5			2		18			1003	789		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8298	4.800	1002	3.000		5			4		18			1003	851		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8313	3.000	1002	3.000		5			3		18			1003	826		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8316	3.750	1002	3.000		5			3		19			1003	810		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8333	4.800	1000	3.000		5			2		17			1001	801		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8362	3.000	1002	3.000		5			5		19			1003	802		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8371	3.000	1002	3.000		5			2		18			1003	845		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8375	4.800	1002	3.000		5			7		18			1003	832		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8413	4.800	1000	3.000		5			4		18			1001	791		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8440	4.800	1002	3.000		5			3		19			1003	847		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8458	4.800	1000	3.000		5			6		19			1001	853		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8492	3.750	1002	3.000		5			1		19			1003	830		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8494	4.800	1002	3.000		5			3		17			1003	829		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8550	4.800	1002	3.000		5			3		18			1003	819		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8569	3.750	1002	3.000		5			5		18			1003	849		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8594	3.000	1002	3.000		5			2		18			1003	831		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8603	3.750	1000	3.000		5			3		19			1001	805		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8606	4.800	1000	3.000		5			5		17			1001	785		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8629	4.800	1002	3.000		5			5		18			1003	808		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8718	3.000	1000	3.000		5			3		18			1001	799		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8764	3.000	1000	3.000		5			2		19			1001	793		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8808	3.750	1000	3.000		5			8		18			1001	812		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8952	4.800	1002	3.000		5			3		18			1003	816		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.8964	4.800	1000	3.000		5			5		19			1001	817		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	79.9040	3.000	1000	3.000		5			3		17			1001	797		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2261	3.000	1002	3.000		5			1		19			1003	890		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2453	4.800	1000	3.000		5			4		18			1001	892		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2529	3.000	1000	3.000		5			2		19			1001	908		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2551	4.800	1000	3.000		5			8		17			1001	898		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2566	3.750	1000	3.000		5			8		16			1001	914		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2735	3.000	1002	3.000		5			1		17			1003	909		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2739	3.750	1000	3.000		5			9		17			1001	903		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2792	3.000	1000	3.000		5			4		16			1001	897		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2809	4.800	1002	3.000		5			5		18			1003	913		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2840	3.750	1000	3.000		5			4		18			1001	889		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2930	4.800	1002	3.000		5			7		19			1003	902		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2939	3.000	1000	3.000		5			3		17			1001	860		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2957	3.750	1000	3.000		5			7		16			1001	864		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.2976	3.000	1002	3.000		5			3		17			1003	883		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3017	3.000	1002	3.000		5			6		19			1003	906		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3038	4.800	1000	3.000		5			6		17			1001	863		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3053	3.000	1002	3.000		5			1		18			1003	856		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3113	3.750	1002	3.000		5			3		18			1003	886		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3121	3.750	1000	3.000		5			5		19			1001	894		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3144	3.000	1002	3.000		5			5		17			1003	876		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3147	3.000	1000	3.000		5			8		18			1001	901		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3150	3.000	1002	3.000		5			8		16			1003	895		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3162	4.800	1002	3.000		5			6		16			1003	868		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3174	3.000	1000	3.000		5			8		17			1001	878		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3177	3.000	1000	3.000		5			4		19			1001	882		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3177	3.750	1000	3.000		5			2		17			1001	881		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3198	3.750	1002	3.000		5			6		17			1003	910		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3260	3.750	1002	3.000		5			7		19			1003	885		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3271	3.750	1002	3.000		5			4		19			1003	877		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3275	3.750	1000	3.000		5			2		17			1001	880		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3281	3.750	1000	3.000		5			7		19			1001	915		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3285	4.800	1000	3.000		5			2		19			1001	893		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3308	4.800	1002	3.000		5			7		19			1003	905		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3331	3.750	1002	3.000		5			3		18			1003	870		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3359	4.800	1000	3.000		5			7		16			1001	872		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3386	3.000	1002	3.000		5			4		18			1003	874		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3399	3.750	1002	3.000		5			7		17			1003	875		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3403	4.800	1002	3.000		5			8		16			1003	888		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3426	4.800	1000	3.000		5			6		18			1001	858		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3440	3.000	1000	3.000		5			5		16			1001	873		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3471	4.800	1000	3.000		5			9		19			1001	899		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3478	4.800	1002	3.000		5			7		16			1003	887		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3523	4.800	1002	3.000		5			8		18			1003	879		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3535	3.000	1002	3.000		5			9		17			1003	862		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3540	3.750	1000	3.000		5			2		19			1001	884		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3549	3.000	1002	3.000		5			2		19			1003	861		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3576	3.000	1002	3.000		5			7		17			1003	857		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3605	3.750	1000	3.000		5			2		17			1001	896		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3657	3.750	1002	3.000		5			1		18			1003	855		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3658	3.000	1000	3.000		5			3		16			1001	866		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3707	3.750	1000	3.000		5			6		17			1001	891		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3794	4.800	1002	3.000		5			7		17			1003	907		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3796	4.800	1002	3.000		5			9		18			1003	912		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3822	4.800	1002	3.000		5			2		19			1003	871		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.3875	3.750	1000	3.000		5			9		17			1001	867		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4030	3.750	1002	3.000		5			9		19			1003	865		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4071	4.800	1000	3.000		5			6		18			1001	904		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4110	4.800	1002	3.000		5			1		18			1003	900		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4127	3.750	1000	3.000		5			5		19			1001	869		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4265	3.000	1002	3.000		5			6		19			1003	911		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.4295	3.750	1002	3.000		5			8		19			1003	859		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.6581	3.750	1002	3.000		5			2		18			1003	961		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.6897	4.800	1000	3.000		5			7		19			1001	1049		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7039	3.750	1002	3.000		5			7		17			1003	982		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7071	3.750	1000	3.000		5			8		15			1001	1025		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7127	4.800	1002	3.000		5			7		17			1003	1073		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7221	3.000	1002	3.000		5			4		17			1003	1006		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7300	3.000	1000	3.000		5			5		16			1001	998		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7367	4.800	1000	3.000		5			2		18			1001	955		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7382	4.800	1002	3.000		5			8		17			1003	916		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7386	3.750	1002	3.000		5			8		17			1003	1044		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7399	3.000	1000	3.000		5			8		17			1001	969		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7400	4.800	1002	3.000		5			6		17			1003	946		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7428	3.750	1002	3.000		5			4		15			1003	980		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7432	4.800	1000	3.000		5			4		17			1001	993		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7436	3.750	1002	3.000		5			7		18			1003	979		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7453	3.750	1002	3.000		5			3		18			1003	927		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7480	3.000	1002	3.000		5			9		16			1003	1066		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7513	3.750	1000	3.000		5			8		15			1001	1083		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7515	4.800	1002	3.000		5			2		18			1003	1009		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7531	3.750	1000	3.000		5			6		18			1001	1067		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7541	3.000	1002	3.000		5			6		16			1003	1031		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7551	3.750	1000	3.000		5			7		18			1001	962		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7575	4.800	1000	3.000		5			9		16			1001	937		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7591	4.800	1002	3.000		5			6		19			1003	949		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7606	3.000	1000	3.000		5			2		18			1001	951		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7645	4.800	1000	3.000		5			3		15			1001	999		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7663	3.000	1000	3.000		5			2		16			1001	1005		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7666	3.000	1002	3.000		5			5		18			1003	995		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7678	3.750	1000	3.000		5			2		16			1001	1040		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7683	3.750	1002	3.000		5			6		15			1003	1028		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7695	3.000	1002	3.000		5			1		15			1003	1060		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7700	3.000	1000	3.000		5			9		16			1001	1081		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7721	3.000	1002	3.000		5			5		17			1003	1003		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7728	4.800	1002	3.000		5			5		16			1003	958		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7736	3.000	1000	3.000		5			4		18			1001	990		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7740	3.000	1000	3.000		5			2		16			1001	1062		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7748	4.800	1000	3.000		5			6		17			1001	922		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7752	3.000	1002	3.000		5			3		19			1003	1024		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7754	3.750	1002	3.000		5			6		19			1003	964		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7765	3.000	1000	3.000		5			2		18			1001	1035		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7797	4.800	1000	3.000		5			5		17			1001	948		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7802	4.800	1002	3.000		5			7		15			1003	978		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7834	3.000	1002	3.000		5			6		16			1003	985		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7836	3.750	1002	3.000		5			6		19			1003	1084		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7854	3.000	1002	3.000		5			3		15			1003	1020		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7854	3.750	1002	3.000		5			2		19			1003	940		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7862	4.800	1000	3.000		5			6		17			1001	920		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7871	4.800	1002	3.000		5			6		19			1003	976		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7874	4.800	1002	3.000		5			8		18			1003	929		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7876	3.000	1000	3.000		5			2		17			1001	1027		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7878	3.000	1002	3.000		5			7		18			1003	1046		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7889	3.000	1000	3.000		5			8		19			1001	1017		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7890	4.800	1002	3.000		5			4		18			1003	1022		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7910	4.800	1000	3.000		5			2		17			1001	933		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7912	4.800	1000	3.000		5			6		19			1001	1068		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7934	4.800	1000	3.000		5			3		18			1001	984		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7938	3.000	1000	3.000		5			5		17			1001	1036		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7939	3.000	1002	3.000		5			2		18			1003	1004		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7944	4.800	1002	3.000		5			5		16			1003	1045		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7949	3.750	1002	3.000		5			7		15			1003	943		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7971	4.800	1002	3.000		5			5		19			1003	1015		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7984	3.000	1000	3.000		5			3		15			1001	1076		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7993	3.750	1002	3.000		5			4		16			1003	919		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.7999	3.000	1000	3.000		5			6		18			1001	970		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8000	4.800	1002	3.000		5			8		15			1003	1016		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8014	3.000	1002	3.000		5			6		17			1003	1041		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8019	4.800	1002	3.000		5			5		16			1003	963		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8022	3.000	1002	3.000		5			2		19			1003	1071		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8023	4.800	1000	3.000		5			6		19			1001	917		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8026	3.750	1002	3.000		5			8		17			1003	1070		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8032	3.000	1002	3.000		5			2		18			1003	960		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8038	3.750	1000	3.000		5			9		17			1001	1078		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8041	3.000	1002	3.000		5			4		17			1003	1014		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8042	3.750	1000	3.000		5			3		19			1001	1034		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8063	3.000	1002	3.000		5			3		15			1003	925		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8080	4.800	1000	3.000		5			5		18			1001	938		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8085	3.000	1002	3.000		5			6		19			1003	981		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8091	4.800	1002	3.000		5			9		15			1003	991		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8095	4.800	1000	3.000		5			2		18			1001	1042		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8096	3.750	1002	3.000		5			6		19			1003	1026		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8102	3.000	1000	3.000		5			3		17			1001	987		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8106	4.800	1000	3.000		5			8		16			1001	926		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8120	3.750	1000	3.000		5			6		17			1001	954		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8126	4.800	1002	3.000		5			5		19			1003	959		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8131	3.750	1002	3.000		5			7		18			1003	966		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8136	4.800	1000	3.000		5			7		17			1001	971		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8138	3.750	1002	3.000		5			3		16			1003	950		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8145	3.750	1002	3.000		5			6		17			1003	1082		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8158	4.800	1002	3.000		5			6		19			1003	953		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8172	3.750	1002	3.000		5			4		15			1003	1051		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8189	3.750	1000	3.000		5			8		19			1001	972		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8192	3.000	1002	3.000		5			6		18			1003	968		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8194	3.750	1002	3.000		5			5		18			1003	952		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8200	3.750	1002	3.000		5			4		15			1003	983		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8207	3.750	1002	3.000		5			7		19			1003	1037		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8208	4.800	1002	3.000		5			8		17			1003	1023		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8218	4.800	1002	3.000		5			3		19			1003	1054		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8218	3.750	1000	3.000		5			8		17			1001	1033		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8220	3.750	1000	3.000		5			3		17			1001	1008		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8224	3.750	1000	3.000		5			6		19			1001	1000		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8225	4.800	1000	3.000		5			6		17			1001	1021		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8227	4.800	1000	3.000		5			5		15			1001	932		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8231	4.800	1002	3.000		5			8		18			1003	1011		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8248	3.750	1000	3.000		5			9		15			1001	996		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8252	4.800	1000	3.000		5			5		15			1001	1080		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8260	4.800	1000	3.000		5			2		15			1001	967		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8276	4.800	1000	3.000		5			5		16			1001	1053		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8299	3.000	1000	3.000		5			7		19			1001	947		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8312	3.000	1000	3.000		5			8		18			1001	945		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8313	4.800	1000	3.000		5			3		17			1001	931		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8314	3.000	1000	3.000		5			5		18			1001	965		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8322	4.800	1002	3.000		5			6		19			1003	988		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8338	3.000	1000	3.000		5			8		17			1001	1018		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8345	3.000	1000	3.000		5			7		18			1001	1047		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8375	4.800	1002	3.000		5			8		16			1003	974		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8383	3.000	1002	3.000		5			2		17			1003	977		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8404	3.750	1002	3.000		5			3		19			1003	1056		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8415	4.800	1000	3.000		5			2		18			1001	1019		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8423	3.000	1002	3.000		5			6		18			1003	1077		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8423	3.750	1000	3.000		5			2		15			1001	1075		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8426	4.800	1000	3.000		5			4		19			1001	956		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8426	3.000	1002	3.000		5			7		17			1003	973		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8433	3.000	1002	3.000		5			9		16			1003	942		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8445	4.800	1002	3.000		5			3		17			1003	924		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8490	3.750	1002	3.000		5			1		16			1003	1058		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8493	3.750	1000	3.000		5			4		19			1001	1064		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8499	3.750	1000	3.000		5			7		19			1001	1072		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8514	4.800	1002	3.000		5			7		19			1003	939		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8523	3.750	1002	3.000		5			3		15			1003	1038		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8526	3.750	1000	3.000		5			7		18			1001	1079		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8534	4.800	1000	3.000		5			5		15			1001	1002		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8539	3.000	1002	3.000		5			4		17			1003	1048		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8540	3.750	1002	3.000		5			4		17			1003	989		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8547	4.800	1000	3.000		5			5		17			1001	1029		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8566	4.800	1000	3.000		5			4		18			1001	1050		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8569	3.000	1000	3.000		5			8		18			1001	1085		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8576	3.750	1000	3.000		5			5		18			1001	1052		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8585	3.750	1000	3.000		5			2		15			1001	930		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8596	3.750	1002	3.000		5			3		18			1003	1057		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8633	4.800	1000	3.000		5			4		16			1001	992		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8637	4.800	1002	3.000		5			7		16			1003	975		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8647	3.000	1002	3.000		5			7		17			1003	921		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8662	3.000	1002	3.000		5			5		18			1003	923		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8684	3.000	1002	3.000		5			3		16			1003	1074		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8686	4.800	1000	3.000		5			5		17			1001	936		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8710	3.750	1002	3.000		5			4		17			1003	1010		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8721	3.750	1000	3.000		5			2		19			1001	934		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8749	3.000	1000	3.000		5			8		18			1001	1013		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8757	4.800	1002	3.000		5			3		17			1003	986		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8766	3.750	1000	3.000		5			8		16			1001	997		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8788	4.800	1002	3.000		5			7		17			1003	941		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8800	3.000	1000	3.000		5			7		16			1001	1055		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8817	3.750	1002	3.000		5			3		19			1003	1039		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8823	3.750	1000	3.000		5			3		16			1001	1007		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8823	4.800	1002	3.000		5			2		17			1003	1069		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8824	3.750	1000	3.000		5			6		16			1001	928		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8845	4.800	1002	3.000		5			2		15			1003	1065		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8901	3.750	1002	3.000		5			9		18			1003	944		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8957	4.800	1002	3.000		5			3		17			1003	1063		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8985	3.000	1000	3.000		5			3		19			1001	1059		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.8990	4.800	1002	3.000		5			1		19			1003	935		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9092	3.750	1000	3.000		5			3		18			1001	1030		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9125	4.800	1002	3.000		5			4		16			1003	957		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9131	3.750	1002	3.000		5			3		18			1003	1032		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9185	3.750	1002	3.000		5			4		16			1003	1001		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9202	4.800	1002	3.000		5			1		19			1003	994		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9216	4.800	1002	3.000		5			4		16			1003	1061		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9226	3.000	1000	3.000		5			5		17			1001	918		3				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9409	4.800	1000	3.000		5			3		17			1001	1043		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	80.9499	3.000	1002	3.000		5			3		18			1003	1012		2				1			2			20			78.0000		6.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.1002	16.000	1002	10.000		5			3		17			1003	1086		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	90.1564	12.500	1002	10.000		5			3		19			1003	1087		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.2272	10.000	1000	10.000		5			3		16			1001	1088		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3312	10.000	1000	10.000		5			4		16			1001	1090		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	91.3925	16.000	1002	10.000		5			3		18			1003	1089		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	93.6266	16.000	1002	10.000		5			3		16			1003	1091		1				1			2			20			84.0000		20.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	93.6350	16.000	1002	10.000		5			3		15			1003	1092		1				1			2			20			84.0000		20.000

; =============================================================================
; SEZIONE: "I. Contrappunto di Texture"
; Inizio: 104.000s, Durata: 45.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	104.4863	0.760	1008	0.475		2			8		15			1009	1098		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	104.5518	1.183	1006	0.740		2			7		14			1007	1095		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	104.5664	0.838	1006	0.671		0			7		13			1007	1099		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	104.5669	0.985	1004	0.788		0			7		33			1005	1096		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	104.5785	1.047	1006	0.654		2			7		12			1007	1097		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.0021	0.331	1006	0.331		0			7		20			1007	1101		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.0170	1.231	1004	0.770		2			7		18			1005	1100		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1197	0.328	1008	0.263		2			7		16			1009	1102		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1317	0.586	1004	0.469		2			8		43			1005	1103		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1318	0.657	1008	0.411		2			9		29			1009	1107		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1472	0.519	1004	0.416		2			9		21			1005	1105		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1939	0.917	1008	0.734		2			8		34			1009	1114		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.1943	0.537	1006	0.335		0			8		27			1007	1112		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2049	0.563	1004	0.563		2			9		25			1005	1106		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2158	0.467	1006	0.467		0			8		18			1007	1104		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2175	0.467	1006	0.467		0			7		21			1007	1109		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2267	0.403	1006	0.322		0			9		28			1007	1110		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2523	0.854	1006	0.683		0			7		24			1007	1115		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2701	0.663	1008	0.530		2			9		12			1009	1108		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.2751	0.862	1004	0.539		0			8		24			1005	1113		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	105.3569	0.638	1008	0.638		0			7		20			1009	1111		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.4758	48.168	1004	38.535		3			1		6			1005	1094		3				1			2			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.6076	37.367	1004	37.367		3			1		1			1005	1093		3				1			2			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.7642	0.744	1008	0.465		2			8		43			1009	1120		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.7725	0.830	1008	0.664		2			7		18			1009	1116		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.7738	0.698	1006	0.558		0			9		43			1007	1117		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.8072	0.252	1006	0.202		2			9		31			1007	1118		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	106.8543	0.523	1004	0.418		2			8		18			1005	1119		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.0167	0.754	1008	0.754		0			9		16			1009	1121		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.0240	0.926	1006	0.741		2			9		27			1007	1122		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.0504	0.364	1008	0.228		2			7		28			1009	1123		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.1909	0.634	1004	0.507		0			9		39			1005	1124		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.2299	0.619	1004	0.495		2			8		22			1005	1125		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.4750	0.664	1006	0.664		2			8		9			1007	1126		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.6256	0.556	1004	0.348		2			9		36			1005	1129		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.6395	0.422	1008	0.338		2			8		26			1009	1131		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.7019	0.375	1008	0.300		0			8		5			1009	1128		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.7132	0.981	1008	0.613		0			8		17			1009	1130		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.7501	0.693	1006	0.693		2			9		30			1007	1127		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.8558	0.801	1004	0.500		0			9		13			1005	1137		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.9441	0.348	1008	0.348		0			7		20			1009	1135		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.9524	0.297	1008	0.297		2			9		26			1009	1141		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.9733	0.923	1008	0.738		0			9		12			1009	1133		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.9886	0.771	1008	0.771		2			9		12			1009	1140		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	107.9927	0.534	1006	0.334		2			9		14			1007	1134		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.0049	0.370	1004	0.296		0			7		24			1005	1139		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.0064	0.603	1004	0.603		2			7		31			1005	1132		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.0621	1.040	1006	0.650		0			9		38			1007	1136		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.1012	0.746	1008	0.596		0			7		25			1009	1138		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.3077	0.248	1004	0.248		0			7		30			1005	1142		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.3605	0.794	1006	0.794		0			9		18			1007	1144		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.3807	0.403	1008	0.322		0			9		28			1009	1143		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.3846	0.260	1008	0.260		0			9		12			1009	1145		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	108.7238	0.224	1008	0.224		0			9		18			1009	1146		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.2031	0.928	1008	0.742		2			7		15			1009	1148		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.2784	0.488	1006	0.488		2			7		23			1007	1147		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.3667	0.660	1006	0.660		2			9		3			1007	1152		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.3804	0.229	1006	0.229		2			8		20			1007	1151		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.4303	1.186	1004	0.741		0			8		21			1005	1150		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.4554	0.601	1004	0.601		2			9		37			1005	1154		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.4735	0.551	1006	0.441		0			9		29			1007	1153		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.4759	0.792	1008	0.792		2			8		25			1009	1149		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.5831	0.507	1008	0.507		2			8		38			1009	1156		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.5952	0.885	1004	0.553		0			7		25			1005	1155		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.5968	0.334	1008	0.268		0			7		41			1009	1160		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.5984	0.465	1004	0.290		2			9		21			1005	1158		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.6005	0.292	1004	0.292		0			7		13			1005	1159		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	109.6318	0.650	1004	0.650		2			9		33			1005	1157		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.1764	0.827	1008	0.517		0			9		7			1009	1161		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.1785	0.588	1008	0.588		2			7		41			1009	1163		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.2084	0.392	1006	0.245		2			8		40			1007	1164		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.2217	1.015	1004	0.634		2			7		39			1005	1162		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.2311	0.569	1006	0.456		0			9		30			1007	1165		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.2598	0.839	1004	0.671		0			8		27			1005	1166		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4180	0.715	1004	0.572		2			8		19			1005	1168		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4216	0.688	1008	0.688		0			9		17			1009	1167		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4227	0.513	1008	0.410		2			9		9			1009	1175		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4254	1.109	1006	0.693		2			7		14			1007	1171		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4430	0.355	1006	0.222		2			9		37			1007	1170		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4523	0.495	1008	0.495		0			8		18			1009	1172		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4561	0.818	1004	0.654		2			8		21			1005	1173		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.4569	0.647	1004	0.647		0			8		23			1005	1174		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	112.5030	0.553	1006	0.553		0			9		37			1007	1169		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0195	0.259	1006	0.259		2			7		31			1007	1186		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0491	0.687	1008	0.687		2			8		17			1009	1181		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0506	0.497	1004	0.311		2			9		33			1005	1179		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0556	0.501	1008	0.400		0			9		12			1009	1176		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0678	0.950	1008	0.760		2			7		10			1009	1178		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.0851	0.315	1008	0.252		0			9		10			1009	1180		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1020	0.754	1006	0.754		2			9		25			1007	1183		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1088	0.561	1004	0.449		0			7		21			1005	1185		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1235	0.445	1006	0.278		0			7		31			1007	1184		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1296	0.441	1004	0.275		2			9		11			1005	1182		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1308	0.852	1008	0.682		0			7		19			1009	1177		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.1467	0.272	1004	0.218		0			7		35			1005	1187		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.4751	0.544	1006	0.435		2			8		28			1007	1188		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.5039	0.654	1004	0.654		2			7		8			1005	1189		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.6174	0.601	1004	0.601		2			9		3			1005	1190		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.7518	0.691	1008	0.691		0			7		25			1009	1192		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	114.7557	1.125	1006	0.703		2			9		35			1007	1191		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.1189	0.748	1008	0.468		2			8		16			1009	1194		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.2734	0.398	1008	0.398		0			9		30			1009	1193		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.2821	0.466	1006	0.373		2			9		25			1007	1195		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.3882	0.490	1008	0.306		0			9		41			1009	1197		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.4609	0.954	1004	0.763		2			8		30			1005	1196		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.5678	0.829	1004	0.663		0			7		19			1005	1200		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.5906	0.844	1004	0.675		2			9		26			1005	1199		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.6145	1.180	1006	0.738		2			9		16			1007	1201		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.6210	0.247	1006	0.247		0			7		34			1007	1202		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	115.6719	0.847	1008	0.677		2			9		26			1009	1198		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.1423	1.048	1006	0.655		2			9		20			1007	1203		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.1464	0.412	1008	0.330		0			8		25			1009	1207		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.1648	0.648	1004	0.405		2			8		22			1005	1205		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.1748	0.452	1006	0.282		2			7		16			1007	1204		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.2191	0.616	1006	0.616		2			7		10			1007	1208		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	116.2217	0.904	1006	0.565		2			7		16			1007	1206		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.1520	0.553	1006	0.443		0			7		33			1007	1210		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.1540	0.532	1008	0.425		2			8		12			1009	1216		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.1913	0.479	1008	0.479		0			8		25			1009	1217		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2001	0.506	1006	0.405		0			7		35			1007	1215		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2100	0.889	1006	0.556		0			9		17			1007	1211		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2113	0.716	1004	0.448		0			9		24			1005	1209		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2168	0.322	1008	0.201		2			7		30			1009	1218		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2172	0.669	1004	0.535		0			7		15			1005	1212		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.2656	0.925	1004	0.578		2			8		21			1005	1213		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.3212	0.241	1004	0.241		2			7		33			1005	1219		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	117.3341	0.816	1006	0.653		2			9		23			1007	1214		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.0444	0.730	1006	0.584		0			8		38			1007	1222		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.0580	0.490	1006	0.392		2			7		20			1007	1221		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.0652	0.666	1006	0.416		2			9		25			1007	1220		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.1997	0.672	1008	0.420		2			7		17			1009	1223		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.3703	0.797	1004	0.638		0			7		27			1005	1225		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.3943	0.422	1004	0.422		0			7		41			1005	1224		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.4132	1.263	1004	0.789		0			8		27			1005	1226		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.8923	0.990	1006	0.792		2			7		5			1007	1228		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	118.9983	0.730	1006	0.730		0			9		14			1007	1227		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	119.1778	0.664	1006	0.664		2			7		24			1007	1229		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	119.5527	0.992	1004	0.793		2			7		30			1005	1230		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	120.0515	0.374	1004	0.299		2			9		11			1005	1231		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	120.0682	0.740	1006	0.740		0			8		37			1007	1232		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.1979	0.447	1008	0.447		0			7		7			1009	1233		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.4642	0.338	1006	0.338		2			8		21			1007	1234		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.4782	0.417	1004	0.260		2			8		18			1005	1235		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.8402	0.509	1008	0.509		0			7		11			1009	1236		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.9544	0.574	1006	0.460		0			7		27			1007	1238		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.9766	1.234	1004	0.771		2			7		43			1005	1239		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	121.9891	0.481	1008	0.385		2			9		33			1009	1237		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.0056	0.707	1008	0.707		2			9		25			1009	1240		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.0098	0.490	1008	0.392		0			7		30			1009	1241		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.0647	0.981	1008	0.613		0			8		20			1009	1245		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.0768	0.418	1004	0.261		0			7		10			1005	1246		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.1276	0.386	1004	0.386		0			8		27			1005	1244		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.1301	0.978	1006	0.611		0			7		6			1007	1242		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	122.1514	0.734	1008	0.587		0			8		30			1009	1243		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	123.5395	1.231	1006	0.770		2			7		50			1007	1247		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	123.5827	0.382	1008	0.382		2			7		16			1009	1250		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	123.5933	0.413	1008	0.330		0			7		5			1009	1248		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	123.6536	1.194	1004	0.746		0			8		45			1005	1249		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	124.9088	0.411	1008	0.329		2			7		7			1009	1251		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.0456	0.666	1004	0.666		0			7		19			1005	1254		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.0721	0.574	1004	0.359		0			8		21			1005	1252		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.0899	0.596	1004	0.596		0			7		28			1005	1253		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.1690	0.394	1008	0.315		2			7		36			1009	1255		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.3278	0.993	1004	0.794		2			7		34			1005	1259		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.3467	0.655	1004	0.409		0			9		27			1005	1263		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4001	0.330	1004	0.206		0			7		23			1005	1261		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4136	0.733	1006	0.586		0			8		21			1007	1256		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4326	0.325	1008	0.203		2			9		43			1009	1260		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4339	0.618	1008	0.618		2			7		21			1009	1258		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4401	0.418	1006	0.334		2			8		16			1007	1264		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4415	0.525	1006	0.525		0			7		22			1007	1257		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.4710	0.250	1006	0.200		2			8		35			1007	1262		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.9405	0.492	1008	0.308		2			8		11			1009	1267		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	125.9811	0.618	1006	0.618		2			9		44			1007	1266		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.0176	0.830	1008	0.664		2			7		21			1009	1265		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.0190	0.541	1004	0.433		2			8		29			1005	1268		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4423	0.438	1006	0.350		0			7		24			1007	1274		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4610	0.693	1004	0.554		0			9		22			1005	1270		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4676	0.739	1004	0.462		0			7		21			1005	1272		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4852	0.377	1004	0.377		2			8		29			1005	1269		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4894	0.964	1008	0.602		0			9		31			1009	1271		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4904	0.773	1004	0.619		0			9		27			1005	1275		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.4916	0.426	1008	0.341		2			9		40			1009	1276		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	126.6406	0.333	1008	0.208		2			9		21			1009	1273		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.1645	0.667	1004	0.417		0			7		37			1005	1277		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.4594	0.646	1006	0.404		2			8		24			1007	1279		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.4785	0.983	1008	0.786		0			8		25			1009	1287		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.4894	1.210	1004	0.756		0			7		19			1005	1283		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.4952	0.351	1006	0.280		0			8		31			1007	1288		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.4981	0.573	1008	0.358		0			8		42			1009	1286		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5068	1.272	1006	0.795		0			8		23			1007	1285		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5130	0.882	1004	0.706		2			7		28			1005	1278		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5158	0.639	1008	0.639		0			7		22			1009	1284		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5371	0.650	1008	0.406		0			9		20			1009	1282		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5481	0.621	1008	0.621		2			8		15			1009	1280		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.5801	0.521	1006	0.521		2			8		14			1007	1289		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.6101	0.689	1004	0.689		0			8		17			1005	1281		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.7530	0.934	1004	0.748		2			9		29			1005	1291		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.8566	0.613	1006	0.491		2			9		50			1007	1292		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.8797	0.761	1006	0.476		2			7		22			1007	1295		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.8803	0.735	1006	0.588		2			7		17			1007	1293		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.8981	0.675	1004	0.540		0			8		21			1005	1290		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9232	0.908	1004	0.727		2			9		24			1005	1297		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9249	0.794	1006	0.496		0			7		25			1007	1294		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9359	0.963	1008	0.602		2			8		49			1009	1298		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9409	0.306	1006	0.244		2			8		28			1007	1296		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9459	0.761	1006	0.761		0			7		23			1007	1299		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9483	0.780	1006	0.780		0			7		33			1007	1300		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	127.9847	0.369	1006	0.369		2			8		29			1007	1301		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.1120	0.413	1008	0.413		0			7		32			1009	1305		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.1940	0.770	1004	0.616		0			9		46			1005	1303		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.2431	0.738	1008	0.738		2			8		20			1009	1302		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.2511	0.650	1008	0.650		0			7		23			1009	1307		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.2619	0.487	1004	0.389		0			7		31			1005	1306		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.2771	0.251	1004	0.251		2			7		29			1005	1304		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.2943	0.703	1004	0.703		2			8		17			1005	1314		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.3126	0.818	1008	0.654		2			8		27			1009	1309		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.3370	1.040	1008	0.650		2			7		27			1009	1308		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.3437	0.531	1004	0.332		2			8		39			1005	1310		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.3723	0.684	1008	0.684		2			9		17			1009	1316		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.3850	0.389	1008	0.311		2			9		12			1009	1315		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.4010	0.229	1004	0.229		0			8		30			1005	1313		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.4146	0.680	1006	0.680		0			7		18			1007	1311		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.4273	0.552	1004	0.345		2			9		35			1005	1312		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.5030	0.398	1006	0.249		0			9		38			1007	1321		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.6346	0.356	1004	0.356		0			9		20			1005	1320		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.6529	0.905	1004	0.724		0			9		14			1005	1317		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.6860	0.725	1004	0.580		2			9		36			1005	1319		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.6863	1.198	1008	0.749		2			9		27			1009	1318		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.7713	0.653	1004	0.653		0			8		33			1005	1323		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.7749	0.647	1006	0.517		2			8		28			1007	1322		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	128.8704	0.833	1008	0.521		2			8		31			1009	1324		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0008	0.320	1008	0.320		2			7		11			1009	1328		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0063	0.525	1008	0.525		2			7		19			1009	1325		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0123	0.706	1004	0.565		2			9		32			1005	1327		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0511	0.389	1006	0.311		0			8		24			1007	1326		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0522	0.282	1006	0.226		0			7		37			1007	1330		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.0603	1.106	1006	0.691		2			7		22			1007	1329		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	129.2972	0.489	1004	0.391		2			9		30			1005	1331		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.3485	0.897	1006	0.718		0			9		38			1007	1334		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.3529	0.271	1008	0.271		0			8		29			1009	1333		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.3619	0.521	1008	0.521		2			8		38			1009	1332		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.4347	0.696	1008	0.557		0			9		22			1009	1335		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.6768	0.798	1004	0.638		2			8		10			1005	1336		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	130.7707	0.727	1006	0.727		0			7		35			1007	1337		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.0838	0.778	1008	0.622		0			8		19			1009	1338		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.1222	1.219	1006	0.762		2			7		26			1007	1339		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.1252	0.707	1004	0.707		0			9		20			1005	1342		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.1262	0.364	1006	0.364		2			9		11			1007	1340		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.2217	0.571	1004	0.571		2			7		27			1005	1341		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.7555	0.573	1006	0.458		0			7		48			1007	1344		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.8145	0.448	1004	0.358		2			9		24			1005	1347		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.8613	0.931	1006	0.745		2			8		31			1007	1343		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.8742	0.438	1008	0.438		0			9		30			1009	1345		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	131.9151	0.529	1004	0.423		2			7		16			1005	1346		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.4694	0.348	1008	0.348		0			7		22			1009	1350		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.5090	0.365	1008	0.365		0			8		15			1009	1351		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.5137	0.788	1004	0.630		0			7		16			1005	1352		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.5403	0.202	1008	0.202		2			9		7			1009	1349		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.5576	0.975	1008	0.609		2			8		1			1009	1348		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.5954	0.447	1008	0.447		0			7		32			1009	1353		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.8443	0.615	1004	0.384		0			8		24			1005	1357		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.8936	0.792	1008	0.634		2			8		30			1009	1355		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.9072	0.913	1006	0.731		0			8		41			1007	1362		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.9465	0.479	1004	0.383		2			9		33			1005	1358		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.9550	0.673	1004	0.673		2			7		5			1005	1356		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	132.9585	0.344	1004	0.344		0			7		11			1005	1359		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.0031	0.735	1006	0.735		0			7		36			1007	1354		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.0298	0.736	1008	0.589		0			9		16			1009	1364		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.0751	0.561	1006	0.351		0			8		13			1007	1360		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.1800	0.833	1004	0.666		2			9		31			1005	1361		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2050	0.510	1004	0.319		2			9		34			1005	1368		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2051	0.564	1008	0.353		0			9		22			1009	1363		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2088	0.743	1008	0.743		2			9		25			1009	1365		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2729	0.516	1004	0.516		2			8		25			1005	1370		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2865	0.430	1006	0.269		0			9		11			1007	1369		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.2923	0.345	1006	0.216		2			7		15			1007	1367		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.3566	0.820	1006	0.512		2			9		20			1007	1366		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.3944	0.501	1004	0.501		2			8		12			1005	1372		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.4087	0.739	1008	0.592		2			7		22			1009	1371		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	133.5187	0.543	1006	0.543		2			9		11			1007	1373		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.0480	0.672	1008	0.672		2			9		24			1009	1376		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1222	0.370	1008	0.370		2			9		24			1009	1374		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1282	0.627	1008	0.627		0			8		17			1009	1375		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1283	0.619	1008	0.495		2			9		16			1009	1378		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1334	0.671	1006	0.419		2			7		9			1007	1377		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1741	0.739	1008	0.739		0			9		9			1009	1381		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1792	0.458	1006	0.286		0			9		39			1007	1382		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.1859	0.662	1004	0.414		2			7		25			1005	1383		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.2024	0.504	1004	0.403		2			9		32			1005	1379		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.2199	0.305	1006	0.244		0			7		26			1007	1380		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.4212	0.722	1004	0.722		2			7		24			1005	1384		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.7449	0.753	1006	0.471		2			7		30			1007	1386		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.7587	0.285	1004	0.228		2			9		39			1005	1388		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.7620	0.787	1004	0.492		0			8		16			1005	1389		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.7899	0.545	1004	0.545		2			9		30			1005	1387		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.7921	0.557	1004	0.557		2			9		18			1005	1385		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.8176	0.975	1008	0.780		2			8		21			1009	1390		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	134.9483	0.739	1006	0.739		0			7		36			1007	1396		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.0308	0.471	1006	0.295		2			9		20			1007	1391		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.0423	0.615	1008	0.385		2			8		23			1009	1395		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.0441	0.570	1004	0.570		2			7		18			1005	1394		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.0483	0.696	1006	0.435		2			7		40			1007	1392		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.0998	0.355	1008	0.222		2			8		16			1009	1393		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.1087	0.753	1004	0.753		0			8		15			1005	1400		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.1132	1.049	1004	0.655		0			9		40			1005	1397		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.1170	0.769	1008	0.481		2			7		29			1009	1398		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.1680	0.599	1004	0.479		0			8		23			1005	1399		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.3502	0.458	1004	0.286		0			8		33			1005	1404		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.3743	0.602	1004	0.376		2			9		23			1005	1401		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.3860	0.909	1008	0.727		0			8		25			1009	1403		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.4469	0.647	1004	0.517		0			8		24			1005	1405		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.4823	0.508	1006	0.508		0			7		11			1007	1402		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.5604	0.423	1006	0.423		0			9		26			1007	1407		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	135.6205	0.465	1006	0.372		0			9		48			1007	1406		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	136.0456	0.682	1004	0.426		2			8		7			1005	1410		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	136.0760	0.386	1006	0.308		0			9		11			1007	1408		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	136.1630	0.283	1008	0.226		0			9		26			1009	1409		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.6094	0.634	1006	0.634		0			7		38			1007	1412		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.6187	0.589	1004	0.471		0			9		34			1005	1415		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.6634	0.331	1004	0.265		2			9		16			1005	1411		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.6746	1.031	1004	0.644		0			9		32			1005	1414		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.7154	0.797	1006	0.498		2			7		36			1007	1413		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	137.7428	0.799	1008	0.499		2			7		27			1009	1416		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.3038	0.467	1006	0.292		0			7		19			1007	1417		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.5661	0.656	1008	0.656		0			8		13			1009	1420		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.5859	0.662	1006	0.414		2			9		33			1007	1418		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.6000	0.708	1008	0.708		2			8		15			1009	1419		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.7753	0.780	1004	0.624		0			9		28			1005	1425		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8005	0.760	1004	0.608		2			7		37			1005	1421		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8153	0.577	1008	0.577		0			9		16			1009	1422		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8174	0.257	1006	0.257		2			8		14			1007	1424		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8246	0.523	1006	0.419		0			7		29			1007	1423		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8634	0.569	1004	0.355		2			7		32			1005	1427		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.8934	0.720	1004	0.450		2			9		30			1005	1428		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.9137	0.550	1008	0.440		2			7		22			1009	1430		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.9345	0.878	1004	0.703		0			7		22			1005	1426		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	138.9585	0.748	1004	0.599		2			7		24			1005	1429		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	139.1192	0.733	1004	0.587		0			8		13			1005	1433		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	139.1199	1.151	1004	0.719		2			7		22			1005	1432		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	139.1314	0.732	1006	0.458		2			9		44			1007	1431		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	139.1726	0.957	1008	0.766		0			9		22			1009	1434		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	139.9421	0.551	1004	0.441		2			9		21			1005	1435		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.0213	0.289	1006	0.231		0			9		26			1007	1436		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.0232	0.671	1006	0.671		0			9		21			1007	1437		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.2951	1.108	1004	0.693		0			7		34			1005	1438		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.6800	0.771	1006	0.771		2			9		9			1007	1439		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.9749	1.094	1006	0.684		2			9		14			1007	1443		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.9860	0.285	1004	0.228		0			9		16			1005	1442		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	140.9878	0.742	1006	0.742		2			9		30			1007	1440		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.0071	0.376	1004	0.301		2			7		39			1005	1441		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.3283	0.861	1008	0.538		2			8		11			1009	1444		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.4104	1.104	1006	0.690		0			8		17			1007	1446		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.4192	0.420	1006	0.420		0			9		36			1007	1445		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.4499	0.522	1008	0.522		2			9		22			1009	1449		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.4638	0.499	1004	0.499		0			7		16			1005	1447		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.4801	0.414	1006	0.331		0			7		15			1007	1448		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.7213	0.963	1004	0.602		0			9		34			1005	1452		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.7965	0.933	1006	0.583		2			8		14			1007	1450		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.8144	0.722	1006	0.451		2			9		36			1007	1451		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.8296	0.434	1006	0.347		0			7		28			1007	1454		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	141.8786	0.265	1008	0.265		2			9		32			1009	1453		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	142.0236	1.204	1006	0.753		2			7		4			1007	1457		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	142.0841	0.251	1004	0.251		2			9		21			1005	1456		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	142.1762	0.561	1008	0.561		0			9		28			1009	1455		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	142.1913	0.617	1006	0.386		0			9		32			1007	1458		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	143.6057	0.243	1004	0.243		0			8		2			1005	1459		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	144.6542	1.140	1004	0.712		0			8		14			1005	1460		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	144.7063	0.891	1004	0.557		0			8		28			1005	1461		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	144.7093	0.546	1004	0.437		2			9		26			1005	1463		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	144.7297	0.801	1004	0.501		0			7		27			1005	1462		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	145.1785	0.489	1006	0.489		0			9		17			1007	1464		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.1935	0.872	1006	0.698		0			7		42			1007	1470		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.2314	0.682	1008	0.546		2			7		14			1009	1467		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.2443	0.689	1004	0.689		2			7		17			1005	1468		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.2784	0.507	1008	0.507		0			7		37			1009	1466		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.2805	0.777	1006	0.777		0			9		21			1007	1465		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.2962	0.315	1006	0.315		2			9		23			1007	1472		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.3251	0.279	1006	0.279		2			8		22			1007	1469		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.4187	0.496	1004	0.496		2			8		36			1005	1474		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.4441	0.417	1004	0.417		0			7		22			1005	1471		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.5441	0.441	1004	0.276		0			7		21			1005	1473		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6252	0.450	1006	0.360		2			7		15			1007	1479		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6331	0.885	1008	0.553		2			8		29			1009	1478		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6612	0.651	1006	0.651		2			7		27			1007	1475		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6801	0.549	1004	0.439		0			7		35			1005	1481		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6938	0.512	1008	0.410		2			7		13			1009	1480		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.6969	0.543	1008	0.340		0			8		29			1009	1476		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.7314	0.526	1008	0.526		2			9		32			1009	1477		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8014	0.942	1004	0.754		2			7		41			1005	1482		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8041	0.880	1006	0.550		2			7		30			1007	1483		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8136	0.885	1006	0.708		2			9		29			1007	1487		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8368	1.212	1008	0.757		2			9		22			1009	1485		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8444	1.080	1008	0.675		0			9		24			1009	1488		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8561	1.036	1008	0.648		2			9		25			1009	1484		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	146.8642	0.585	1006	0.585		0			7		47			1007	1486		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.0208	0.849	1006	0.531		2			8		16			1007	1490		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.0323	0.784	1008	0.784		2			9		16			1009	1489		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.0507	1.057	1008	0.661		0			9		31			1009	1492		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.0970	0.584	1006	0.365		0			8		39			1007	1491		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.1485	1.187	1004	0.742		0			7		24			1005	1493		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.1741	0.293	1004	0.293		2			7		28			1005	1494		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.2145	1.154	1008	0.722		0			9		19			1009	1495		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.3023	0.627	1004	0.627		0			8		20			1005	1498		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.3471	1.026	1004	0.641		0			9		1			1005	1496		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.3593	0.818	1008	0.654		0			9		34			1009	1497		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.3620	0.581	1006	0.581		2			9		29			1007	1499		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	147.9896	0.539	1006	0.539		0			8		34			1007	1503		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.0971	0.913	1004	0.730		0			9		12			1005	1504		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.1023	0.505	1006	0.505		0			8		19			1007	1501		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.1132	0.328	1008	0.205		0			8		11			1009	1505		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.1913	0.613	1008	0.383		2			8		35			1009	1502		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.1935	0.269	1008	0.269		2			9		24			1009	1507		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.1966	0.575	1006	0.360		0			7		6			1007	1508		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.2036	0.573	1004	0.573		0			9		30			1005	1500		3				1			5			20			104.0000		45.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	148.2283	0.341	1008	0.341		0			7		34			1009	1506		3				1			5			20			104.0000		45.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
