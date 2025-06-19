
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/prova.wav" -W -d -m0
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
f 0 99.53096803650598 ; Evento f fittizio per definire la durata totale
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
f 1002 0 3 -2 3 4 2
f 1003 0 3 -2 0 1 0
f 1004 0 3 -2 2 3 5
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 1 2 3
f 1007 0 3 -2 0 1 2
f 1008 0 4 -2 2 10 4 15
f 1009 0 4 -2 0 1 2 3
f 1010 0 3 -2 6 8 10
f 1011 0 3 -2 0 1 2
f 1012 0 3 -2 7 9 12
f 1013 0 3 -2 0 1 2
f 1014 0 3 -2 8 12 8
f 1015 0 3 -2 0 1 2



i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 75.000s
; =============================================================================

;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	22.825	1000	22.825		0.00028000000000000003			2		2			1001	7		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	27.524	1000	27.524		0.0			1		1			1001	1		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	38.734	1006	24.209		0.0011200000000000001			1		1			1007	11		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0010	0.355	1014	0.355		4.0			8		22			1015	485		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0069	47.180	1002	29.488		0.0			2		1			1003	2		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0073	40.374	1002	25.234		0.0			0		1			1003	4		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0106	27.091	1004	27.091		0.0011200000000000001			1		1			1005	8		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0124	29.383	1002	23.506		0.0			0		2			1003	3		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0178	36.914	1002	23.071		0.0011200000000000001			0		1			1003	10		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0337	27.443	1002	27.443		0.00028000000000000003			1		1			1003	5		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0456	25.066	1004	25.066		0.00252			1		2			1005	12		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0498	23.060	1004	23.060		0.007000000000000002			1		2			1005	20		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0557	36.422	1004	29.138		0.0011200000000000001			0		1			1005	9		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0614	36.245	1006	28.996		0.00252			1		1			1007	14		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0659	0.676	1010	0.423		4.0			8		19			1011	483		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0761	0.218	1010	0.218		4.0			7		32			1011	481		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0845	0.760	1012	0.475		4.0			7		29			1013	482		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.0940	43.443	1002	27.152		0.01008			1		1			1003	21		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1027	32.866	1004	26.293		0.0044800000000000005			2		2			1005	17		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1415	28.308	1004	28.308		0.007000000000000002			0		2			1005	19		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1529	0.938	1014	0.586		4.0			7		24			1015	484		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1627	47.874	1004	29.921		0.007000000000000002			1		1			1005	18		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.1727	36.713	1006	22.946		0.0044800000000000005			1		2			1007	16		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2098	37.208	1006	23.255		0.01008			2		1			1007	22		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2181	45.062	1002	28.164		0.01008			1		2			1003	24		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.2431	28.390	1002	28.390		0.013720000000000001			1		2			1003	28		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3235	39.319	1004	24.575		0.017920000000000002			1		2			1005	31		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3263	35.144	1006	28.115		0.02268			1		1			1007	33		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3446	36.636	1004	29.309		0.017920000000000002			2		2			1005	29		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3644	32.480	1004	25.984		0.013720000000000001			1		1			1005	25		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.3966	26.152	1004	26.152		0.02268			1		1			1005	32		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.4978	33.368	1006	26.694		0.028000000000000008			0		2			1007	36		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5143	39.670	1006	24.794		0.028000000000000008			1		2			1007	35		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5149	29.445	1004	23.556		0.028000000000000008			0		1			1005	37		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5189	0.416	1010	0.333		4.0			7		20			1011	488		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5208	0.384	1010	0.240		4.0			8		43			1011	486		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5376	24.300	1002	24.300		0.028000000000000008			2		1			1003	34		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5632	0.412	1014	0.330		4.0			8		29			1015	487		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.5771	42.434	1008	26.521		0.03388			1		1			1009	38		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.6231	28.305	1004	28.305		0.03388			1		2			1005	39		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.6593	25.937	1002	25.937		0.04032			1		2			1003	41		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.6746	37.120	1004	23.200		0.04032			1		1			1005	42		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.6968	0.214	1010	0.171		4.0			7		33			1011	489		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.7450	37.600	1004	23.500		0.04032			0		2			1005	40		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.7627	28.770	1002	28.770		0.04032			1		2			1003	43		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8373	25.534	1000	25.534		0.04732000000000001			1		2			1001	44		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8937	39.804	1004	24.878		0.04732000000000001			1		1			1005	45		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.8946	34.246	1004	27.397		0.04732000000000001			1		2			1005	46		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	0.9942	36.013	1002	28.811		0.054880000000000005			1		2			1003	48		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0074	0.574	1010	0.574		4.0			6		24			1011	2612		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0327	23.831	1004	23.831		0.054880000000000005			2		1			1005	47		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.0788	25.168	1004	25.168		0.054880000000000005			1		2			1005	49		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1653	28.471	1004	22.777		0.063			2		2			1005	50		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.1708	42.588	1008	26.617		0.063			0		2			1009	51		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.2013	32.843	1004	26.275		0.063			1		1			1005	53		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3161	39.820	1004	24.887		0.07168000000000001			1		1			1005	54		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.3433	37.194	1006	29.755		0.07168000000000001			0		1			1007	56		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.4074	33.892	1002	27.114		0.07168000000000001			2		2			1003	55		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.5013	47.002	1004	29.376		0.08092			1		2			1005	57		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.5314	43.028	1002	26.892		0.08092			2		2			1003	58		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.5388	0.895	1014	0.559		4.0			7		33			1015	490		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.5869	0.200	1010	0.160		4.0			7		12			1011	491		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6767	30.978	1002	24.782		0.09072			1		2			1003	60		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6953	37.855	1006	23.659		0.09072			1		3			1007	59		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.6975	22.456	1002	22.456		0.09072			1		1			1003	61		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.8073	43.329	1002	27.080		0.10108			0		1			1003	62		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.8298	38.856	1002	24.285		0.10108			0		2			1003	63		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9096	40.602	1004	25.376		0.10108			2		2			1005	64		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	1.9371	29.589	1006	23.671		0.10108			0		2			1007	65		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0556	34.403	1002	27.523		0.11200000000000003			0		1			1003	68		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0609	31.535	1002	25.228		0.11200000000000003			1		2			1003	67		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.0738	47.314	1006	29.572		0.11200000000000003			2		3			1007	66		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.2422	45.309	1000	28.318		0.12347999999999999			1		1			1001	72		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3234	44.779	1004	27.987		0.12347999999999999			0		2			1005	69		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3602	44.618	1004	27.886		0.12347999999999999			0		2			1005	70		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3738	0.322	1010	0.201		4.0			7		1			1011	2613		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.3954	0.219	1010	0.219		4.0			7		18			1011	2614		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4160	47.551	1004	29.719		0.12347999999999999			1		2			1005	71		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.4934	35.530	1006	22.206		0.13552			1		2			1007	74		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5136	43.648	1006	27.280		0.13552			1		3			1007	73		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5475	0.281	1014	0.176		4.0			8		14			1015	494		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.5949	0.883	1010	0.552		4.0			8		4			1011	493		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.6200	0.427	1010	0.427		4.0			7		22			1011	492		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.6840	28.776	1006	23.020		0.14812			1		3			1007	76		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7121	0.850	1012	0.531		4.0			7		34			1013	496		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7301	0.259	1014	0.162		4.0			7		36			1015	499		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7688	0.513	1012	0.321		4.0			7		27			1013	495		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.7764	0.312	1012	0.249		4.0			8		14			1013	497		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.8506	39.581	1002	24.738		0.14812			2		2			1003	77		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.9079	0.585	1014	0.365		4.0			7		35			1015	498		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	2.9569	0.542	1014	0.542		4.0			7		36			1015	500		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.0756	35.564	1006	28.451		0.16128			2		2			1007	79		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.0857	29.504	1006	23.603		0.16128			1		1			1007	82		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1225	0.680	1010	0.425		4.0			7		18			1011	503		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1338	29.191	1006	23.353		0.16128			1		2			1007	78		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.1442	0.518	1014	0.518		4.0			7		8			1015	504		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2194	25.543	1002	25.543		0.175			2		2			1003	84		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2266	39.393	1000	24.620		0.175			1		2			1001	83		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2271	0.482	1010	0.482		4.0			7		38			1011	502		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2481	34.502	1006	27.601		0.175			1		3			1007	86		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.2597	0.411	1014	0.411		4.0			7		9			1015	501		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3384	39.654	1004	24.784		0.175			1		3			1005	85		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.3883	0.537	1014	0.335		4.0			8		22			1015	508		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4032	0.809	1010	0.506		4.0			7		20			1011	507		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4249	0.302	1010	0.242		4.0			8		23			1011	509		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4477	0.299	1014	0.239		4.0			7		21			1015	506		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4825	23.651	1004	23.651		0.18928000000000003			0		1			1005	87		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4933	0.216	1010	0.173		4.0			8		13			1011	505		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.4946	0.250	1014	0.156		4.0			5		27			1015	2616		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5010	0.911	1012	0.569		4.0			7		49			1013	2618		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5245	35.040	1004	28.032		0.18928000000000003			2		3			1005	90		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5603	0.293	1014	0.293		4.0			6		15			1015	2615		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.5835	41.486	1006	25.929		0.18928000000000003			1		3			1007	89		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.6028	0.687	1012	0.550		4.0			6		27			1013	2617		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.6116	27.662	1004	22.130		0.18928000000000003			0		2			1005	88		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7286	0.354	1014	0.221		4.0			6		12			1015	2621		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7627	0.698	1014	0.558		4.0			5		1			1015	2619		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7693	36.499	1002	29.199		0.20412000000000002			1		3			1003	92		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.7828	0.474	1010	0.296		4.0			6		26			1011	2620		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.8436	27.490	1002	27.490		0.20412000000000002			2		2			1003	93		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	3.8986	22.850	1002	22.850		0.20412000000000002			1		1			1003	91		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0251	0.723	1014	0.579		4.0			7		24			1015	513		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.0328	0.348	1014	0.348		4.0			7		13			1015	512		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1234	0.636	1014	0.398		4.0			8		32			1015	511		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1332	0.251	1010	0.251		4.0			8		24			1011	510		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1368	28.627	1002	28.627		0.21952000000000002			1		2			1003	95		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1392	31.101	1008	24.881		0.21952000000000002			1		1			1009	98		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.1441	43.469	1006	27.168		0.21952000000000002			0		2			1007	97		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.2191	31.240	1002	24.992		0.21952000000000002			2		3			1003	94		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.4181	39.110	1004	24.444		0.23547999999999997			0		3			1005	99		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.4523	25.607	1004	25.607		0.23547999999999997			1		3			1005	100		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.5547	0.477	1014	0.298		4.0			7		10			1015	515		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.6297	0.211	1012	0.211		4.0			8		37			1013	516		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.6783	0.258	1014	0.207		4.0			7		30			1015	518		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.6867	22.259	1002	22.259		0.252			2		1			1003	101		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.6898	0.564	1012	0.564		4.0			8		34			1013	514		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7050	0.487	1010	0.390		4.0			7		15			1011	2622		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7225	30.177	1006	24.142		0.252			2		1			1007	103		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7303	0.505	1014	0.505		4.0			7		34			1015	517		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	4.7325	29.302	1004	29.302		0.252			2		3			1005	102		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.0578	37.474	1002	23.422		0.26908			1		2			1003	105		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.0601	24.119	1004	24.119		0.26908			2		2			1005	107		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.0624	27.447	1002	27.447		0.26908			0		1			1003	104		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1161	0.571	1012	0.457		4.0			7		28			1013	2623		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1525	0.538	1012	0.336		4.0			5		28			1013	2627		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.1984	0.403	1010	0.252		4.0			5		29			1011	2626		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.2484	0.257	1010	0.257		4.0			5		23			1011	2624		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.2645	0.502	1012	0.502		4.0			7		23			1013	2625		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3670	31.862	1004	25.490		0.28672000000000003			2		2			1005	112		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3696	31.193	1004	24.955		0.28672000000000003			1		1			1005	111		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3817	29.394	1002	29.394		0.28672000000000003			1		4			1003	108		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.3884	0.189	1012	0.189		4.0			7		35			1013	520		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4307	0.401	1010	0.250		4.0			8		16			1011	523		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4374	0.187	1014	0.187		4.0			8		23			1015	519		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.4382	28.572	1004	28.572		0.28672000000000003			0		3			1005	110		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5045	0.530	1012	0.331		4.0			7		34			1013	525		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5248	0.320	1014	0.200		4.0			8		30			1015	527		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5311	0.289	1010	0.289		4.0			8		27			1011	526		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5486	0.368	1014	0.294		4.0			7		21			1015	521		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5539	0.246	1014	0.246		4.0			8		26			1015	522		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.5665	0.411	1012	0.411		4.0			8		14			1013	524		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.6926	28.321	1004	28.321		0.30492			1		4			1005	114		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.6954	30.805	1004	24.644		0.30492			1		1			1005	115		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7357	0.266	1010	0.266		4.0			7		21			1011	529		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7525	0.273	1010	0.218		4.0			8		33			1011	528		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7536	27.695	1002	27.695		0.30492			0		4			1003	116		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7722	0.451	1010	0.361		4.0			7		27			1011	540		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.7810	0.151	1014	0.151		4.0			7		19			1015	539		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8019	0.747	1012	0.597		4.0			7		14			1013	2630		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8037	0.425	1012	0.425		4.0			8		32			1013	532		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8084	35.654	1006	28.523		0.30492			1		3			1007	113		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8142	0.259	1014	0.162		4.0			8		41			1015	531		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8351	0.584	1014	0.584		4.0			8		41			1015	530		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8551	0.905	1014	0.565		4.0			8		43			1015	541		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8652	0.328	1010	0.263		4.0			6		50			1011	2629		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8815	0.329	1014	0.205		4.0			8		29			1015	535		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8816	0.550	1012	0.440		4.0			8		26			1013	538		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8892	0.269	1014	0.269		4.0			7		27			1015	533		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8914	0.523	1014	0.418		4.0			5		17			1015	2628		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.8956	0.310	1012	0.248		4.0			8		23			1013	542		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9050	0.191	1010	0.191		4.0			7		17			1011	543		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9204	0.385	1010	0.308		4.0			8		43			1011	536		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9283	0.429	1014	0.429		4.0			7		36			1015	534		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9412	0.585	1014	0.585		4.0			7		27			1015	537		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	5.9928	27.543	1002	27.543		0.32368			2		1			1003	119		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0057	0.245	1012	0.153		4.0			8		32			1013	544		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0127	46.949	1002	29.343		0.32368			1		3			1003	117		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0297	0.278	1012	0.174		4.0			8		41			1013	545		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.0438	28.175	1002	28.175		0.32368			2		1			1003	120		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.1210	35.972	1002	28.777		0.32368			0		2			1003	118		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.2534	0.663	1010	0.414		4.0			6		37			1011	2631		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.3103	0.264	1014	0.264		4.0			5		44			1015	2632		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5102	30.940	1008	24.752		0.3430000000000001			1		4			1009	122		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.5120	23.097	1004	23.097		0.3430000000000001			2		2			1005	121		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7379	40.163	1004	25.102		0.36288			1		1			1005	126		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.7850	29.264	1008	23.411		0.36288			2		3			1009	124		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8169	0.362	1010	0.290		4.0			6		33			1011	2638		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8195	0.491	1010	0.392		4.0			6		45			1011	2636		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8199	0.474	1010	0.296		4.0			6		9			1011	2637		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8211	31.838	1000	25.471		0.36288			1		2			1001	123		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8245	28.506	1002	22.805		0.36288			2		1			1003	127		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8250	0.256	1014	0.256		4.0			6		10			1015	2634		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8548	0.302	1010	0.302		4.0			5		6			1011	2635		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.8609	0.875	1012	0.547		4.0			6		41			1013	2633		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	6.9988	0.330	1014	0.330		4.0			8		36			1015	547		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.0721	0.374	1010	0.300		4.0			7		34			1011	546		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.1046	0.436	1014	0.349		4.0			7		30			1015	548		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.1877	45.246	1006	28.279		0.38332			2		4			1007	131		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2124	35.900	1002	28.720		0.38332			2		4			1003	129		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.2237	34.929	1004	27.943		0.38332			1		2			1005	130		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3478	0.542	1014	0.339		4.0			5		21			1015	2643		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.3782	0.732	1010	0.586		4.0			6		38			1011	2641		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4143	0.474	1012	0.474		4.0			6		36			1013	2642		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4296	0.778	1010	0.486		4.0			7		32			1011	2640		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.4939	0.946	1012	0.591		4.0			5		24			1013	2639		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5380	34.994	1004	21.871		0.40432			2		4			1005	132		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5658	0.461	1012	0.288		4.0			5		28			1013	2645		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5713	0.291	1014	0.233		4.0			6		25			1015	2644		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.5764	0.797	1012	0.498		4.0			7		22			1013	2646		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.6015	27.836	1004	22.269		0.40432			1		3			1005	133		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.7983	0.151	1012	0.151		4.0			5		13			1013	2657		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.8808	0.867	1012	0.542		4.0			6		17			1013	2648		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.8850	0.286	1012	0.179		4.0			6		30			1013	2650		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.8871	0.450	1014	0.281		4.0			6		27			1015	2654		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9150	0.489	1012	0.489		4.0			6		18			1013	2651		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9235	0.273	1012	0.273		4.0			6		30			1013	2656		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9399	0.360	1012	0.225		4.0			7		29			1013	2655		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9589	0.385	1010	0.308		4.0			6		46			1011	2647		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9593	0.621	1012	0.388		4.0			5		20			1013	2660		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9614	0.574	1012	0.574		4.0			6		26			1013	2649		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9779	0.230	1012	0.230		4.0			6		23			1013	2653		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9786	0.218	1010	0.174		4.0			7		5			1011	2659		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	7.9854	26.436	1002	26.436		0.42588000000000004			1		2			1003	134		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0144	35.428	1004	22.142		0.42588000000000004			1		3			1005	135		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0183	36.978	1006	23.111		0.42588000000000004			2		4			1007	136		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0484	0.370	1010	0.296		4.0			7		30			1011	2658		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.0529	0.239	1012	0.191		4.0			6		11			1013	2652		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.1261	0.472	1012	0.295		4.0			8		31			1013	549		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2467	0.848	1014	0.530		4.0			8		24			1015	551		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.2569	0.809	1012	0.506		4.0			7		27			1013	550		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3813	28.741	1004	28.741		0.4480000000000001			1		4			1005	138		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.3864	45.567	1004	28.480		0.4480000000000001			1		1			1005	137		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5207	0.275	1010	0.275		4.0			6		27			1011	2665		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5676	0.324	1014	0.259		4.0			7		24			1015	2663		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5709	0.428	1012	0.343		4.0			7		12			1013	559		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5723	0.228	1012	0.228		4.0			6		33			1013	2666		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5842	0.852	1012	0.533		4.0			5		33			1013	2664		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5851	0.538	1012	0.538		4.0			8		29			1013	554		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.5928	0.739	1010	0.462		4.0			8		32			1011	556		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6146	0.529	1010	0.529		4.0			6		29			1011	2662		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6177	0.191	1010	0.153		4.0			5		24			1011	2661		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6343	0.528	1010	0.422		4.0			7		25			1011	562		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.6413	0.525	1010	0.525		4.0			7		23			1011	558		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7028	0.585	1014	0.585		4.0			7		26			1015	560		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7059	0.201	1012	0.201		4.0			8		27			1013	555		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7163	0.781	1014	0.488		4.0			8		19			1015	553		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7290	0.590	1012	0.472		4.0			8		31			1013	557		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7330	0.624	1012	0.499		4.0			8		17			1013	565		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7630	36.335	1002	22.709		0.4706800000000001			1		1			1003	140		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.7973	0.339	1010	0.271		4.0			7		34			1011	552		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8012	36.292	1006	29.034		0.4706800000000001			2		3			1007	142		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8105	0.515	1010	0.322		4.0			8		24			1011	563		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8286	21.954	1002	21.954		0.4706800000000001			2		2			1003	139		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8346	0.721	1012	0.451		4.0			7		16			1013	561		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8645	35.664	1002	22.290		0.4706800000000001			3		3			1003	141		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	8.8815	30.668	1006	24.534		0.4706800000000001			0		4			1007	143		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.0137	0.540	1010	0.432		4.0			8		34			1011	564		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2332	39.021	1008	24.388		0.49391999999999997			2		3			1009	147		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2457	34.757	1000	27.805		0.49391999999999997			1		3			1001	144		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.2666	45.915	1006	28.697		0.49391999999999997			1		4			1007	145		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3265	27.416	1004	21.933		0.49391999999999997			1		4			1005	146		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.3957	0.476	1014	0.381		4.0			6		17			1015	2671		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6319	0.858	1014	0.536		4.0			6		33			1015	2668		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6321	0.672	1010	0.538		4.0			5		23			1011	2670		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6330	0.601	1014	0.481		4.0			7		14			1015	2669		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6522	0.542	1014	0.542		4.0			6		9			1015	2667		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.6699	33.325	1002	26.660		0.51772			1		1			1003	148		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7608	22.292	1000	22.292		0.51772			1		4			1001	149		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7866	0.708	1010	0.566		4.0			6		50			1011	2675		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.7925	0.392	1012	0.392		4.0			7		29			1013	2674		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8074	0.469	1010	0.469		4.0			6		27			1011	2672		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8182	0.594	1010	0.594		4.0			6		25			1011	2673		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.8614	0.230	1014	0.230		4.0			5		42			1015	2676		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	9.9119	0.567	1014	0.567		4.0			6		28			1015	2677		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0168	0.267	1014	0.267		4.0			8		25			1015	568		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0532	0.488	1010	0.488		4.0			8		18			1011	569		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0895	0.243	1010	0.194		4.0			8		16			1011	581		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.0997	0.578	1010	0.361		4.0			7		16			1011	578		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1230	0.309	1010	0.247		4.0			7		8			1011	570		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1244	0.943	1010	0.589		4.0			8		35			1011	567		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1390	0.495	1010	0.396		4.0			8		17			1011	580		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1503	38.925	1004	24.328		0.54208			1		4			1005	151		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1724	0.216	1010	0.173		4.0			8		24			1011	566		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1870	39.359	1006	24.599		0.54208			1		2			1007	150		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1910	0.310	1012	0.310		4.0			8		10			1013	577		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.1923	0.767	1010	0.480		4.0			8		35			1011	576		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2158	0.508	1012	0.407		4.0			8		27			1013	572		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2465	0.531	1010	0.531		4.0			8		38			1011	579		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2599	0.569	1010	0.455		4.0			8		27			1011	571		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.2746	0.373	1012	0.233		4.0			8		33			1013	573		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3196	0.519	1010	0.415		4.0			8		13			1011	574		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.3959	0.927	1012	0.579		4.0			8		24			1013	575		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.5592	23.402	1000	23.402		0.5670000000000001			2		3			1001	153		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	10.5852	28.004	1004	28.004		0.5670000000000001			1		3			1005	152		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.0867	30.474	1008	24.379		0.59248			1		3			1009	156		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1298	41.007	1008	25.629		0.59248			3		5			1009	155		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.1403	24.601	1000	24.601		0.59248			1		3			1001	154		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.4859	28.364	1004	22.691		0.6185200000000002			1		3			1005	159		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	11.5884	34.938	1008	27.950		0.6185200000000002			2		2			1009	158		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0521	26.324	1006	21.059		0.64512			2		2			1007	160		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.0951	25.942	1002	20.754		0.64512			3		2			1003	162		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.2625	0.311	1010	0.249		4.0			7		17			1011	582		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4179	0.484	1014	0.484		4.0			8		26			1015	583		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4329	0.750	1012	0.600		4.0			8		32			1013	584		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4529	0.365	1014	0.365		4.0			5		13			1015	2685		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4713	0.889	1010	0.556		4.0			8		26			1011	586		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.4895	0.340	1010	0.340		4.0			7		24			1011	585		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5297	0.884	1012	0.553		4.0			6		35			1013	2684		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5341	0.252	1012	0.252		4.0			6		21			1013	2681		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5674	0.547	1010	0.547		4.0			6		31			1011	2680		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5714	0.793	1010	0.495		4.0			6		10			1011	2683		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5752	0.469	1010	0.469		4.0			6		1			1011	2682		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5775	0.390	1014	0.390		4.0			8		14			1015	588		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.5811	0.471	1012	0.471		4.0			7		18			1013	2679		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6039	35.364	1006	28.292		0.6722799999999999			1		3			1007	164		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6148	0.567	1012	0.355		4.0			7		36			1013	2678		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6201	0.678	1010	0.543		4.0			8		39			1011	587		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6315	0.960	1014	0.600		4.0			7		14			1015	589		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6400	0.880	1014	0.550		4.0			6		16			1015	2686		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6419	32.767	1002	26.214		0.6722799999999999			1		5			1003	165		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.6653	25.294	1008	25.294		0.6722799999999999			1		1			1009	166		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7255	0.613	1010	0.383		4.0			6		25			1011	2687		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	12.7765	0.694	1010	0.555		4.0			8		25			1011	590		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0063	0.480	1012	0.384		4.0			6		21			1013	2688		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0431	0.417	1014	0.417		4.0			7		9			1015	2689		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0530	21.262	1004	21.262		0.7			1		4			1005	170		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.0862	28.418	1004	22.735		0.7			2		2			1005	167		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1093	35.018	1002	28.014		0.7			2		5			1003	168		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.1943	30.495	1004	24.396		0.7			1		2			1005	169		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5507	0.587	1010	0.587		4.0			6		17			1011	2692		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.5948	33.329	1002	26.663		0.72828			1		4			1003	172		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6123	23.895	1008	23.895		0.72828			2		5			1009	176		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6251	23.712	1004	23.712		0.72828			1		4			1005	171		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6267	0.484	1014	0.387		4.0			5		26			1015	2691		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6531	37.174	1000	23.234		0.72828			2		4			1001	174		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6720	0.712	1010	0.445		4.0			6		32			1011	2694		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.6917	0.905	1012	0.566		4.0			6		16			1013	2693		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.7016	26.619	1002	26.619		0.72828			1		1			1003	175		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.7242	0.375	1014	0.375		4.0			5		32			1015	2690		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.8864	0.469	1012	0.375		4.0			6		46			1013	2698		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	13.9716	0.540	1012	0.540		4.0			7		12			1013	2696		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0179	0.173	1010	0.173		4.0			6		24			1011	2699		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0186	0.574	1012	0.574		4.0			6		16			1013	2702		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0245	0.510	1012	0.319		4.0			6		20			1013	2695		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0277	0.447	1010	0.357		4.0			6		26			1011	2697		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0664	0.551	1014	0.551		4.0			5		38			1015	2701		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0677	0.454	1010	0.454		4.0			7		26			1011	2700		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0785	0.249	1010	0.249		4.0			8		21			1011	594		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.0867	0.649	1010	0.519		4.0			8		32			1011	599		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.1901	42.846	1006	26.779		0.7571200000000001			3		2			1007	177		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2083	38.833	1006	24.271		0.7571200000000001			1		1			1007	178		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2087	26.814	1000	26.814		0.7571200000000001			1		2			1001	179		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2122	0.257	1010	0.161		4.0			8		21			1011	602		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2137	0.365	1014	0.228		4.0			8		29			1015	595		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2163	0.244	1014	0.244		4.0			7		27			1015	601		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2252	0.508	1012	0.318		4.0			8		24			1013	604		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2318	0.589	1010	0.471		4.0			8		12			1011	592		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2322	0.403	1012	0.403		4.0			8		22			1013	591		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2639	0.485	1010	0.388		4.0			7		39			1011	598		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2855	0.222	1012	0.222		4.0			8		30			1013	600		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.2968	0.197	1012	0.158		4.0			7		26			1013	593		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.3130	0.198	1010	0.198		4.0			8		35			1011	597		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.3349	0.502	1010	0.314		4.0			7		12			1011	596		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.3741	0.688	1012	0.550		4.0			8		15			1013	603		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4854	0.226	1012	0.181		4.0			8		33			1013	614		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.4877	0.549	1014	0.439		4.0			8		27			1015	605		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5039	0.428	1012	0.428		4.0			8		32			1013	609		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5203	0.828	1010	0.518		4.0			8		29			1011	608		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5288	0.422	1010	0.263		4.0			8		19			1011	606		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5336	0.453	1012	0.453		4.0			5		19			1013	2703		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5736	0.525	1012	0.525		4.0			7		35			1013	612		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5841	0.157	1010	0.157		4.0			5		16			1011	2704		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.5881	0.921	1012	0.576		4.0			7		24			1013	613		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.6150	0.478	1014	0.478		4.0			8		33			1015	607		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.6279	0.691	1014	0.432		4.0			8		36			1015	611		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.6335	0.545	1012	0.341		4.0			5		18			1013	2705		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.6953	0.311	1014	0.249		4.0			8		39			1015	627		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7148	0.544	1014	0.340		4.0			8		25			1015	610		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7169	43.125	1008	26.953		0.7865200000000001			3		3			1009	180		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7395	39.722	1006	24.826		0.7865200000000001			2		6			1007	184		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7402	0.480	1010	0.480		4.0			7		29			1011	619		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7599	30.000	1006	24.000		0.7865200000000001			1		1			1007	181		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7647	0.449	1010	0.281		4.0			7		31			1011	623		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7787	34.925	1002	27.940		0.7865200000000001			3		3			1003	183		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.7964	0.274	1010	0.274		4.0			7		26			1011	621		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8134	0.304	1014	0.304		4.0			8		17			1015	616		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8201	0.355	1014	0.284		4.0			6		35			1015	2708		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8241	0.380	1014	0.238		4.0			8		27			1015	628		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8326	0.873	1010	0.546		4.0			8		15			1011	625		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8445	0.566	1014	0.354		4.0			6		25			1015	2707		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8452	0.321	1012	0.257		4.0			7		13			1013	626		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8456	0.565	1014	0.452		4.0			8		20			1015	615		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8785	0.552	1012	0.345		4.0			8		25			1013	622		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8856	0.671	1010	0.419		4.0			8		44			1011	624		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8871	0.834	1012	0.522		4.0			8		20			1013	629		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.8939	0.369	1014	0.369		4.0			8		18			1015	617		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.9120	0.359	1014	0.287		4.0			5		37			1015	2706		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	14.9909	0.535	1014	0.335		4.0			8		15			1015	618		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0531	0.430	1010	0.430		4.0			5		22			1011	2717		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0585	0.746	1012	0.597		4.0			6		4			1013	2715		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0605	0.659	1012	0.412		4.0			6		33			1013	2712		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0757	0.437	1012	0.437		4.0			6		39			1013	2713		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0902	0.411	1012	0.411		4.0			7		30			1013	620		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.0932	0.510	1012	0.510		4.0			6		16			1013	2711		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1340	0.656	1010	0.525		4.0			6		47			1011	2714		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1597	0.450	1014	0.281		4.0			5		28			1015	2710		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1650	0.506	1012	0.404		4.0			6		28			1013	2716		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1776	0.476	1012	0.476		4.0			6		50			1013	2709		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1828	0.581	1014	0.363		4.0			6		23			1015	2718		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.1937	0.922	1010	0.576		4.0			6		43			1011	2719		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3069	37.745	1006	23.591		0.8164800000000001			2		1			1007	187		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3127	42.916	1006	26.822		0.8164800000000001			1		5			1007	188		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3168	31.328	1006	25.063		0.8164800000000001			3		4			1007	189		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3195	29.662	1006	23.730		0.8164800000000001			2		5			1007	186		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3467	30.514	1006	24.412		0.8164800000000001			3		1			1007	185		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3615	0.613	1010	0.490		4.0			6		24			1011	2720		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.3824	0.905	1012	0.565		4.0			6		22			1013	2721		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.4559	0.630	1012	0.504		4.0			7		39			1013	633		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.4658	0.331	1012	0.331		4.0			7		23			1013	631		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5176	0.511	1012	0.319		4.0			8		28			1013	634		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.5874	0.696	1010	0.556		4.0			8		17			1011	632		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.6502	0.573	1010	0.573		4.0			8		19			1011	630		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.8507	25.575	1004	20.460		0.8470000000000002			3		1			1005	192		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	15.9121	36.938	1008	23.086		0.8470000000000002			1		4			1009	190		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0195	32.935	1006	20.584		0.8470000000000002			1		2			1007	193		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0310	0.616	1012	0.492		4.0			7		39			1013	637		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.0679	0.597	1010	0.597		4.0			8		18			1011	651		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1231	0.544	1010	0.436		4.0			7		34			1011	636		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1483	0.418	1012	0.334		4.0			8		17			1013	642		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1486	0.315	1010	0.315		4.0			7		23			1011	647		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1569	0.327	1010	0.205		4.0			8		31			1011	638		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1762	0.493	1014	0.308		4.0			7		43			1015	643		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1927	0.249	1014	0.249		4.0			8		14			1015	640		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1940	0.730	1010	0.584		4.0			8		12			1011	635		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.1942	0.338	1012	0.338		4.0			8		22			1013	644		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2031	0.522	1012	0.522		4.0			8		29			1013	646		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2098	0.576	1014	0.576		4.0			7		23			1015	639		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2281	0.290	1010	0.290		4.0			8		30			1011	649		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2301	0.849	1014	0.531		4.0			8		24			1015	641		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2399	0.411	1014	0.329		4.0			8		31			1015	650		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.2453	0.560	1014	0.560		4.0			7		15			1015	648		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3375	0.447	1014	0.447		4.0			8		21			1015	645		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3694	0.284	1012	0.284		4.0			8		12			1013	664		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.3917	0.227	1014	0.227		4.0			8		31			1015	653		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4012	0.509	1012	0.318		4.0			7		24			1013	661		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4318	0.241	1014	0.151		4.0			7		24			1015	654		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4423	40.258	1008	25.161		0.8780800000000001			3		5			1009	195		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4470	30.248	1002	24.198		0.8780800000000001			1		5			1003	196		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4471	0.774	1010	0.484		4.0			7		10			1011	660		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4474	0.476	1010	0.476		4.0			8		30			1011	662		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4611	26.867	1000	21.494		0.8780800000000001			1		6			1001	194		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4706	0.358	1010	0.287		4.0			8		30			1011	657		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4806	0.242	1012	0.151		4.0			8		33			1013	668		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4932	0.347	1010	0.347		4.0			7		24			1011	658		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.4973	0.216	1012	0.216		4.0			8		17			1013	656		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5577	0.615	1012	0.492		4.0			8		41			1013	659		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5601	0.733	1010	0.458		4.0			8		32			1011	655		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5713	0.301	1012	0.241		4.0			7		20			1013	667		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5835	0.593	1014	0.475		4.0			7		29			1015	665		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.5957	0.852	1010	0.532		4.0			8		41			1011	663		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6251	0.323	1012	0.323		4.0			8		18			1013	666		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	16.6504	0.622	1012	0.497		4.0			8		15			1013	652		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0123	26.802	1002	21.441		0.9097200000000002			2		2			1003	197		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0385	32.900	1004	20.563		0.9097200000000002			1		5			1005	200		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.0662	34.170	1006	21.356		0.9097200000000002			2		2			1007	198		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.1104	32.600	1006	26.080		0.9097200000000002			2		5			1007	199		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6241	23.899	1004	23.899		0.9419199999999999			3		2			1005	206		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6374	35.164	1002	28.131		0.9419199999999999			3		4			1003	204		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6684	27.442	1008	27.442		0.9419199999999999			3		1			1009	201		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6730	40.024	1004	25.015		0.9419199999999999			2		2			1005	202		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.6958	44.275	1002	27.672		0.9419199999999999			3		6			1003	203		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9428	0.474	1010	0.474		4.0			6		7			1011	2724		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9650	0.808	1010	0.505		4.0			5		22			1011	2725		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9897	0.835	1010	0.522		4.0			6		17			1011	2723		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	17.9986	0.377	1014	0.377		4.0			6		25			1015	2722		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.1970	0.561	1010	0.561		4.0			8		35			1011	676		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2001	34.592	1006	27.673		0.97468			2		3			1007	211		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2070	0.390	1012	0.390		4.0			8		13			1013	686		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2331	0.216	1010	0.173		4.0			8		14			1011	671		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2390	0.198	1010	0.158		4.0			8		23			1011	678		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2437	0.623	1010	0.498		4.0			8		20			1011	682		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2455	0.583	1012	0.467		4.0			7		29			1013	672		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2515	0.259	1012	0.259		4.0			8		25			1013	670		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2655	33.688	1006	26.951		0.97468			1		3			1007	208		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2677	0.756	1010	0.473		4.0			8		17			1011	679		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2679	28.724	1006	22.979		0.97468			1		5			1007	209		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.2923	0.565	1010	0.565		4.0			8		37			1011	669		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3130	26.109	1002	26.109		0.97468			1		3			1003	207		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3177	0.561	1010	0.449		4.0			8		14			1011	684		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3237	0.623	1010	0.499		4.0			8		33			1011	683		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3336	28.213	1002	22.570		0.97468			3		4			1003	210		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3532	0.419	1012	0.336		4.0			7		28			1013	673		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3808	0.364	1012	0.364		4.0			8		19			1013	685		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.3919	0.362	1010	0.226		4.0			8		29			1011	680		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.4096	0.320	1010	0.256		4.0			8		30			1011	674		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.4273	0.193	1014	0.193		4.0			8		28			1015	677		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.4888	0.445	1012	0.445		4.0			8		29			1013	681		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.4918	0.367	1012	0.229		4.0			7		35			1013	687		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5130	0.239	1014	0.191		4.0			8		18			1015	675		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.5452	0.769	1014	0.481		4.0			8		30			1015	693		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.6284	0.750	1010	0.469		4.0			7		26			1011	689		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.7426	0.225	1012	0.180		4.0			7		21			1013	690		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.7633	37.957	1004	23.723		1.008			3		6			1005	214		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.7638	0.546	1010	0.546		4.0			8		29			1011	692		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8154	25.837	1004	25.837		1.008			2		3			1005	213		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8234	41.953	1008	26.221		1.008			3		4			1009	215		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8300	35.050	1002	21.906		1.008			1		5			1003	212		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8372	0.920	1014	0.575		4.0			7		20			1015	688		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8499	0.858	1014	0.536		4.0			8		36			1015	694		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8799	43.234	1008	27.022		1.008			1		5			1009	216		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8969	0.250	1012	0.200		4.0			7		27			1013	698		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.8990	0.162	1012	0.162		4.0			8		16			1013	691		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9352	0.328	1014	0.205		4.0			8		19			1015	696		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9443	0.433	1012	0.346		4.0			6		29			1013	2726		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9567	0.596	1012	0.596		4.0			8		28			1013	703		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9573	0.449	1010	0.359		4.0			8		32			1011	702		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9596	0.669	1012	0.535		4.0			8		5			1013	704		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9673	0.668	1014	0.418		4.0			8		32			1015	695		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9884	0.554	1012	0.346		4.0			8		20			1013	700		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	18.9928	0.505	1012	0.505		4.0			6		25			1013	2727		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0401	0.223	1014	0.223		4.0			7		23			1015	699		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0561	0.252	1012	0.201		4.0			7		23			1013	708		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0633	0.669	1014	0.535		4.0			8		44			1015	709		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0884	0.467	1014	0.292		4.0			7		26			1015	701		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.0899	0.252	1010	0.252		4.0			8		15			1011	710		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1113	0.484	1012	0.484		4.0			7		16			1013	707		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1294	0.433	1010	0.271		4.0			8		33			1011	697		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.1754	0.540	1010	0.338		4.0			8		28			1011	705		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.2058	0.357	1012	0.357		4.0			7		38			1013	706		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4558	30.475	1008	24.380		1.04188			1		2			1009	217		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.4970	27.307	1006	21.846		1.04188			1		4			1007	218		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5158	26.046	1004	26.046		1.04188			2		5			1005	221		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5297	33.554	1004	20.971		1.04188			3		7			1005	219		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5591	33.916	1004	27.133		1.04188			1		6			1005	222		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5703	0.659	1014	0.412		4.0			7		21			1015	725		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5832	33.490	1008	26.792		1.04188			3		5			1009	220		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.5975	0.832	1010	0.520		4.0			7		27			1011	724		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6186	0.328	1012	0.263		4.0			8		27			1013	711		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6457	0.520	1014	0.416		4.0			8		33			1015	720		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6578	0.248	1012	0.155		4.0			8		13			1013	718		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6706	0.240	1014	0.150		4.0			6		22			1015	2728		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6720	0.362	1010	0.226		4.0			6		38			1011	2730		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6844	0.832	1014	0.520		4.0			5		31			1015	2729		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.6986	0.570	1014	0.356		4.0			8		40			1015	717		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7097	0.672	1010	0.420		4.0			8		19			1011	716		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7145	0.564	1010	0.564		4.0			8		13			1011	726		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7179	0.582	1012	0.582		4.0			8		22			1013	721		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7211	0.340	1012	0.272		4.0			8		26			1013	712		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7365	0.487	1012	0.305		4.0			8		34			1013	723		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7729	0.409	1014	0.409		4.0			8		38			1015	715		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7915	0.563	1014	0.563		4.0			8		10			1015	713		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.7950	0.520	1010	0.520		4.0			8		30			1011	719		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9069	0.875	1012	0.547		4.0			8		20			1013	714		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	19.9659	0.380	1012	0.237		4.0			8		13			1013	722		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1326	40.045	1002	25.028		1.07632			2		4			1003	224		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.1345	36.224	1004	22.640		1.07632			3		2			1005	226		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2020	26.000	1006	20.800		1.07632			3		4			1007	227		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2081	29.853	1006	23.883		1.07632			2		2			1007	225		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.2236	34.228	1006	27.382		1.07632			1		6			1007	223		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4377	0.405	1014	0.324		4.0			8		28			1015	730		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4419	0.198	1010	0.198		4.0			8		31			1011	727		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4622	0.514	1014	0.514		4.0			8		30			1015	728		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4695	0.450	1012	0.450		4.0			8		18			1013	731		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.4825	0.546	1014	0.546		4.0			7		17			1015	732		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.5373	0.463	1014	0.463		4.0			7		23			1015	733		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.6366	0.348	1010	0.348		4.0			8		29			1011	729		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7120	0.541	1010	0.541		4.0			8		19			1011	734		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7168	0.531	1012	0.332		4.0			8		18			1013	736		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7253	0.329	1012	0.329		4.0			5		50			1013	2733		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7775	0.312	1010	0.312		4.0			5		34			1011	2732		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7899	0.365	1010	0.365		4.0			8		35			1011	735		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7924	0.734	1012	0.587		4.0			6		48			1013	2731		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.7942	0.620	1010	0.387		4.0			5		30			1011	2739		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8002	0.577	1014	0.361		4.0			5		16			1015	2738		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8013	0.494	1012	0.494		4.0			8		17			1013	738		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8065	42.356	1002	26.473		1.11132			3		3			1003	230		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8228	28.254	1004	22.603		1.11132			2		6			1005	233		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8307	0.293	1012	0.293		4.0			6		32			1013	2734		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8445	0.346	1014	0.346		4.0			8		28			1015	737		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8490	0.803	1010	0.502		4.0			8		16			1011	739		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8538	0.194	1014	0.155		4.0			5		21			1015	2737		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8615	21.162	1000	21.162		1.11132			3		4			1001	229		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8630	0.532	1010	0.532		4.0			5		22			1011	2736		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.8763	0.566	1012	0.566		4.0			6		31			1013	2735		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9187	37.617	1004	23.510		1.11132			4		3			1005	228		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9704	0.557	1012	0.445		4.0			5		33			1013	2745		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	20.9736	0.362	1014	0.362		4.0			6		6			1015	2743		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0274	0.650	1014	0.520		4.0			6		14			1015	2744		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0420	0.174	1010	0.174		4.0			5		37			1011	2742		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0632	0.960	1012	0.600		4.0			6		6			1013	2740		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.0804	0.916	1012	0.572		4.0			5		24			1013	2741		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.4611	39.825	1002	24.890		1.1468800000000001			2		5			1003	235		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5287	42.587	1008	26.617		1.1468800000000001			1		6			1009	237		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	21.5468	38.579	1004	24.112		1.1468800000000001			3		7			1005	234		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1158	34.878	1004	21.799		1.183			2		2			1005	238		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1455	22.157	1004	22.157		1.183			2		3			1005	239		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.1669	31.186	1006	19.491		1.183			3		2			1007	240		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5267	0.554	1010	0.554		4.0			8		14			1011	743		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5526	0.683	1012	0.546		4.0			8		17			1013	747		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.5537	0.589	1014	0.471		4.0			8		20			1015	744		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6088	0.778	1014	0.486		4.0			8		26			1015	742		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6221	0.549	1010	0.549		4.0			7		17			1011	753		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6353	0.569	1010	0.569		4.0			8		16			1011	757		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6662	0.194	1010	0.194		4.0			7		32			1011	755		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.6700	0.383	1010	0.383		4.0			8		11			1011	758		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7069	0.309	1012	0.247		4.0			8		31			1013	740		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7071	0.699	1012	0.559		4.0			8		23			1013	775		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7155	0.425	1012	0.266		4.0			8		18			1013	746		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7184	0.320	1010	0.256		4.0			8		21			1011	750		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7190	0.282	1014	0.282		4.0			8		20			1015	759		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7280	0.677	1014	0.541		4.0			8		32			1015	770		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7478	0.557	1010	0.557		4.0			7		18			1011	749		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7491	0.277	1014	0.222		4.0			8		28			1015	741		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7637	0.186	1010	0.186		4.0			8		30			1011	751		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7871	0.357	1012	0.357		4.0			8		17			1013	748		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7931	0.489	1012	0.489		4.0			8		31			1013	772		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.7971	0.388	1012	0.310		4.0			8		31			1013	779		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8057	0.320	1012	0.320		4.0			7		17			1013	754		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8331	0.340	1012	0.212		4.0			8		17			1013	760		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8366	19.889	1008	19.889		1.21968			3		2			1009	242		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8379	0.394	1014	0.246		4.0			8		32			1015	764		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8490	0.239	1012	0.239		4.0			8		6			1013	756		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8691	0.587	1012	0.587		4.0			8		40			1013	771		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8753	0.592	1012	0.592		4.0			8		23			1013	761		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.8878	32.028	1008	20.018		1.21968			1		3			1009	243		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9042	32.195	1008	25.756		1.21968			4		4			1009	244		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9146	0.668	1014	0.534		4.0			8		14			1015	752		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9169	0.861	1012	0.538		4.0			8		38			1013	777		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9311	0.307	1012	0.307		4.0			8		32			1013	776		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9328	0.388	1014	0.243		4.0			8		23			1015	774		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9529	0.470	1012	0.294		4.0			8		23			1013	773		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9669	0.601	1010	0.375		4.0			8		40			1011	766		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9795	0.198	1012	0.158		4.0			8		24			1013	745		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	22.9849	0.563	1012	0.451		4.0			8		18			1013	769		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0405	0.678	1014	0.542		4.0			8		24			1015	767		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0529	0.481	1010	0.481		4.0			8		36			1011	762		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0924	0.508	1012	0.508		4.0			8		29			1013	778		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.0931	0.270	1014	0.216		4.0			8		24			1015	768		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1035	0.478	1014	0.478		4.0			8		36			1015	765		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1547	0.257	1010	0.257		4.0			8		23			1011	792		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1615	0.529	1014	0.330		4.0			8		38			1015	763		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1634	0.339	1012	0.271		4.0			8		27			1013	781		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.1912	0.470	1010	0.470		4.0			7		33			1011	789		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2025	0.521	1010	0.417		4.0			8		11			1011	795		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2171	0.231	1010	0.231		4.0			8		23			1011	783		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2250	0.586	1014	0.586		4.0			7		26			1015	784		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2481	0.463	1012	0.371		4.0			8		21			1013	796		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2601	0.221	1014	0.221		4.0			8		32			1015	780		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2634	0.591	1014	0.473		4.0			8		25			1015	793		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2658	0.464	1010	0.290		4.0			8		21			1011	790		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2729	0.266	1012	0.166		4.0			5		23			1013	2746		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2818	0.366	1014	0.366		4.0			8		32			1015	788		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.2919	0.356	1012	0.222		4.0			8		33			1013	794		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3037	0.443	1014	0.277		4.0			8		15			1015	782		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3206	0.511	1014	0.409		4.0			8		33			1015	786		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3354	0.183	1012	0.183		4.0			6		20			1013	2747		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3404	0.209	1014	0.167		4.0			6		40			1015	2751		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3407	0.308	1010	0.193		4.0			6		27			1011	2749		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3586	0.735	1012	0.588		4.0			7		26			1013	787		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3591	0.293	1014	0.293		4.0			6		38			1015	2750		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3837	0.202	1012	0.162		4.0			8		30			1013	785		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.3881	0.343	1012	0.343		4.0			8		21			1013	791		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4084	0.451	1010	0.361		4.0			5		31			1011	2748		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.4701	0.457	1014	0.286		4.0			7		35			1015	808		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5262	40.765	1008	25.478		1.2569200000000003			2		7			1009	245		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5679	0.249	1012	0.156		4.0			7		33			1013	805		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5711	24.382	1008	24.382		1.2569200000000003			3		3			1009	246		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5738	0.414	1010	0.414		4.0			8		37			1011	799		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5739	0.202	1014	0.202		4.0			8		28			1015	800		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5948	0.580	1012	0.362		4.0			8		13			1013	807		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.5958	25.353	1006	20.283		1.2569200000000003			3		7			1007	247		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6036	0.580	1012	0.464		4.0			8		17			1013	798		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6190	0.497	1010	0.497		4.0			8		27			1011	797		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6264	0.664	1012	0.531		4.0			8		27			1013	801		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6318	0.337	1010	0.270		4.0			8		18			1011	806		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6400	0.587	1012	0.367		4.0			8		29			1013	802		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.6508	0.207	1014	0.207		4.0			8		22			1015	803		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.7012	0.402	1012	0.251		4.0			8		31			1013	804		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8071	0.721	1012	0.577		4.0			6		10			1013	2754		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8209	0.476	1010	0.476		4.0			6		37			1011	2752		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	23.8519	0.759	1014	0.474		4.0			5		46			1015	2753		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1076	0.403	1012	0.403		4.0			6		35			1013	2755		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1278	0.562	1010	0.450		4.0			5		30			1011	2757		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1603	0.655	1014	0.524		4.0			6		27			1015	2758		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1614	0.684	1012	0.547		4.0			6		19			1013	2760		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1747	0.697	1014	0.558		4.0			6		50			1015	2756		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.1807	0.608	1010	0.380		4.0			6		18			1011	2759		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2306	35.950	1002	22.469		1.29472			4		5			1003	251		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2670	24.930	1002	19.944		1.29472			3		7			1003	250		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.2990	26.817	1002	21.454		1.29472			2		5			1003	249		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3107	24.734	1000	24.734		1.29472			4		6			1001	252		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3578	26.117	1000	26.117		1.29472			4		2			1001	248		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.3902	0.209	1010	0.209		4.0			5		31			1011	2764		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4186	0.546	1014	0.341		4.0			5		7			1015	2765		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4343	0.429	1010	0.429		4.0			5		36			1011	2761		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4439	0.617	1010	0.493		4.0			6		18			1011	2762		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4689	0.523	1012	0.523		4.0			6		12			1013	2763		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.4807	0.320	1010	0.256		4.0			5		32			1011	2766		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.5158	0.440	1010	0.440		4.0			6		4			1011	2767		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.8689	0.663	1014	0.530		4.0			8		9			1015	813		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9375	0.243	1014	0.152		4.0			7		22			1015	809		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9574	43.074	1004	26.921		1.3330800000000003			3		2			1005	253		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9732	0.570	1010	0.570		4.0			8		26			1011	816		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9807	24.174	1008	24.174		1.3330800000000003			1		3			1009	255		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9956	22.640	1004	22.640		1.3330800000000003			4		4			1005	256		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	24.9966	0.484	1012	0.388		4.0			8		28			1013	820		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.0064	0.642	1014	0.401		4.0			8		24			1015	815		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.0197	34.065	1006	21.291		1.3330800000000003			3		2			1007	254		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.0533	0.323	1010	0.202		4.0			7		20			1011	811		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1170	0.376	1012	0.301		4.0			8		46			1013	814		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1311	0.352	1010	0.282		4.0			8		26			1011	818		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1382	0.743	1010	0.595		4.0			8		18			1011	819		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1533	0.615	1012	0.384		4.0			8		15			1013	821		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.1579	0.645	1012	0.516		4.0			8		26			1013	817		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.2836	0.655	1010	0.524		4.0			8		26			1011	812		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.3395	0.518	1014	0.518		4.0			8		19			1015	810		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.6713	25.104	1002	25.104		1.3720000000000003			3		6			1003	261		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7077	19.778	1002	19.778		1.3720000000000003			2		7			1003	258		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7178	21.564	1008	21.564		1.3720000000000003			3		2			1009	259		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7516	0.948	1014	0.593		4.0			8		33			1015	848		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7563	21.479	1002	21.479		1.3720000000000003			3		2			1003	257		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7692	31.675	1000	25.340		1.3720000000000003			2		6			1001	260		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7756	0.267	1014	0.214		4.0			8		18			1015	837		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7764	0.562	1012	0.351		4.0			8		25			1013	841		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.7905	0.613	1010	0.491		4.0			7		35			1011	830		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8061	0.300	1010	0.300		4.0			8		35			1011	829		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8252	0.418	1014	0.418		4.0			7		26			1015	824		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8263	0.521	1014	0.417		4.0			7		27			1015	827		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8419	0.562	1014	0.562		4.0			8		21			1015	825		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8503	0.548	1010	0.548		4.0			8		19			1011	831		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8656	0.244	1014	0.244		4.0			8		22			1015	846		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8737	0.282	1010	0.225		4.0			8		21			1011	838		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8804	0.277	1010	0.222		4.0			8		25			1011	834		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.8907	0.602	1010	0.481		4.0			8		19			1011	836		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9407	0.386	1012	0.309		4.0			8		27			1013	842		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9888	0.662	1014	0.529		4.0			8		19			1015	844		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	25.9924	0.383	1010	0.239		4.0			8		25			1011	822		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0246	0.946	1012	0.591		4.0			8		24			1013	839		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0265	0.685	1014	0.548		4.0			8		22			1015	845		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0280	0.282	1012	0.282		4.0			8		16			1013	832		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0325	0.707	1010	0.442		4.0			8		19			1011	835		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0354	0.555	1012	0.444		4.0			8		22			1013	828		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0362	0.958	1012	0.599		4.0			8		10			1013	840		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0400	0.669	1014	0.535		4.0			8		32			1015	823		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0550	0.313	1014	0.313		4.0			8		28			1015	847		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0563	0.312	1012	0.312		4.0			8		28			1013	843		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.0599	0.316	1012	0.253		4.0			8		16			1013	826		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.1041	0.259	1014	0.162		4.0			6		35			1015	2771		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.1054	0.690	1012	0.552		4.0			5		31			1013	2768		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.1194	0.574	1010	0.358		4.0			5		24			1011	2769		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.2034	0.419	1014	0.419		4.0			5		37			1015	2770		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.2059	0.196	1014	0.157		4.0			8		10			1015	833		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4548	25.836	1004	20.669		1.41148			4		8			1005	262		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.4833	35.279	1000	22.049		1.41148			4		4			1001	263		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.5406	39.321	1004	24.575		1.41148			3		5			1005	264		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.5686	31.320	1002	19.575		1.41148			3		5			1003	265		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.7827	0.336	1012	0.336		4.0			8		21			1013	853		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9201	0.299	1010	0.299		4.0			7		32			1011	871		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9239	0.712	1012	0.570		4.0			8		28			1013	857		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9244	0.553	1012	0.442		4.0			8		25			1013	863		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9786	0.579	1012	0.579		4.0			8		15			1013	856		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9862	0.229	1014	0.229		4.0			8		29			1015	864		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	26.9885	0.223	1014	0.223		4.0			8		6			1015	860		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0489	0.398	1012	0.249		4.0			8		29			1013	850		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0558	0.509	1012	0.509		4.0			8		23			1013	862		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0661	0.360	1012	0.288		4.0			8		17			1013	854		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0737	0.368	1010	0.368		4.0			8		8			1011	870		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0777	0.278	1014	0.278		4.0			8		30			1015	851		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0793	0.532	1010	0.532		4.0			8		17			1011	861		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.0799	0.561	1012	0.561		4.0			8		38			1013	868		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1237	0.482	1014	0.386		4.0			7		23			1015	852		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1321	0.153	1014	0.153		4.0			8		31			1015	855		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1367	0.371	1014	0.296		4.0			8		16			1015	869		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1461	0.474	1012	0.296		4.0			7		15			1013	858		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1603	0.393	1012	0.393		4.0			8		19			1013	849		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1848	0.398	1014	0.398		4.0			7		30			1015	873		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1861	31.221	1008	24.977		1.45152			1		7			1009	268		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1875	23.956	1006	19.165		1.45152			3		7			1007	270		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.1993	24.367	1004	24.367		1.45152			1		7			1005	269		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2003	0.893	1014	0.558		4.0			8		30			1015	867		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2083	35.166	1004	21.979		1.45152			3		8			1005	266		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2327	0.628	1010	0.502		4.0			8		22			1011	875		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2330	0.541	1010	0.433		4.0			8		31			1011	859		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2659	23.828	1004	19.063		1.45152			1		3			1005	271		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2756	23.232	1008	23.232		1.45152			1		8			1009	267		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.2836	30.373	1000	24.299		1.45152			4		8			1001	272		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3191	0.877	1010	0.548		4.0			8		31			1011	877		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3265	0.204	1012	0.204		4.0			8		24			1013	865		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.3886	0.356	1012	0.356		4.0			8		19			1013	866		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.4357	0.374	1012	0.374		4.0			8		26			1013	874		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5140	0.664	1012	0.531		4.0			7		20			1013	872		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.5699	0.435	1012	0.435		4.0			8		22			1013	876		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6034	0.717	1010	0.448		4.0			8		23			1011	882		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6564	0.944	1014	0.590		4.0			7		33			1015	891		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.6988	0.507	1012	0.507		4.0			8		20			1013	886		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7302	0.501	1014	0.401		4.0			8		26			1015	880		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7368	0.500	1012	0.500		4.0			7		11			1013	889		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7472	0.430	1014	0.430		4.0			8		34			1015	878		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7723	0.504	1014	0.403		4.0			8		24			1015	884		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7765	0.414	1014	0.331		4.0			8		18			1015	892		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.7803	0.683	1010	0.546		4.0			6		35			1011	2777		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8131	0.625	1012	0.391		4.0			8		13			1013	883		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8405	0.535	1014	0.535		4.0			5		28			1015	2776		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8565	0.694	1014	0.555		4.0			6		34			1015	2773		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8621	0.689	1012	0.430		4.0			6		26			1013	2774		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8623	0.667	1012	0.534		4.0			6		26			1013	2775		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.8982	0.464	1010	0.290		4.0			6		32			1011	2772		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9110	0.556	1014	0.444		4.0			8		35			1015	887		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9142	0.731	1010	0.585		4.0			8		26			1011	904		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9211	0.375	1012	0.375		4.0			8		31			1013	881		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9348	0.524	1010	0.524		4.0			8		21			1011	895		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9366	0.294	1012	0.294		4.0			8		39			1013	890		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9382	0.738	1010	0.462		4.0			8		28			1011	879		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9493	0.494	1010	0.309		4.0			7		19			1011	885		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9500	0.240	1010	0.240		4.0			8		20			1011	903		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9591	29.323	1008	18.327		1.49212			1		7			1009	280		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9613	0.532	1012	0.333		4.0			8		22			1013	902		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9756	0.450	1010	0.450		4.0			8		32			1011	906		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9766	21.312	1000	21.312		1.49212			4		8			1001	275		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9793	21.933	1002	21.933		1.49212			2		2			1003	274		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9825	32.011	1008	20.007		1.49212			2		9			1009	278		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9928	0.532	1014	0.332		4.0			8		33			1015	909		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9950	25.610	1008	20.488		1.49212			4		3			1009	276		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	27.9983	0.909	1014	0.568		4.0			8		27			1015	888		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0138	0.322	1014	0.201		4.0			8		19			1015	901		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0353	0.939	1010	0.587		4.0			8		27			1011	897		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0487	0.852	1010	0.533		4.0			8		34			1011	915		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0500	0.478	1010	0.382		4.0			8		23			1011	923		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0516	0.395	1012	0.316		4.0			8		35			1013	907		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0635	33.876	1006	21.173		1.49212			2		6			1007	277		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0707	0.192	1010	0.192		4.0			8		32			1011	896		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.0767	38.200	1000	23.875		1.49212			1		5			1001	273		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1378	0.267	1014	0.213		4.0			8		32			1015	905		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1575	0.404	1014	0.323		4.0			8		17			1015	900		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1687	0.652	1012	0.522		4.0			8		18			1013	913		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.1980	0.715	1010	0.447		4.0			8		24			1011	898		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2009	0.341	1014	0.341		4.0			8		23			1015	899		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2087	0.359	1010	0.359		4.0			6		13			1011	2779		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2192	0.397	1014	0.318		4.0			6		23			1015	2781		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2254	0.465	1014	0.465		4.0			8		36			1015	910		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2263	0.282	1010	0.282		4.0			8		20			1011	893		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2419	0.347	1010	0.278		4.0			8		21			1011	911		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2539	0.348	1012	0.348		4.0			8		23			1013	912		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2605	0.395	1012	0.316		4.0			6		11			1013	2778		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2681	0.337	1014	0.210		4.0			6		42			1015	2780		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2859	0.528	1012	0.330		4.0			8		23			1013	917		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.2958	0.419	1010	0.335		4.0			8		35			1011	916		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3029	0.478	1010	0.382		4.0			7		33			1011	918		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3062	0.423	1010	0.264		4.0			8		32			1011	894		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3128	0.555	1012	0.555		4.0			8		23			1013	919		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3148	0.161	1010	0.161		4.0			8		28			1011	914		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3196	0.244	1010	0.152		4.0			5		20			1011	2782		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3361	0.699	1010	0.559		4.0			7		27			1011	920		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3436	0.557	1014	0.557		4.0			8		16			1015	922		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3563	0.460	1012	0.368		4.0			8		11			1013	921		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3711	0.281	1014	0.225		4.0			8		20			1015	908		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3773	0.594	1014	0.371		4.0			5		20			1015	2784		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.3872	0.312	1012	0.312		4.0			6		31			1013	2783		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6443	32.064	1004	25.651		1.53328			2		4			1005	286		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6531	36.171	1002	22.607		1.53328			1		6			1003	288		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.6531	19.502	1000	19.502		1.53328			4		4			1001	284		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7248	30.903	1008	19.314		1.53328			4		5			1009	283		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7326	0.866	1012	0.541		4.0			8		25			1013	936		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7432	27.720	1006	22.176		1.53328			4		3			1007	285		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7662	0.924	1012	0.577		4.0			8		33			1013	925		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7710	23.900	1002	23.900		1.53328			2		5			1003	281		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.7819	0.301	1012	0.241		4.0			8		34			1013	931		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8006	30.141	1006	24.112		1.53328			4		7			1007	287		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8331	40.932	1008	25.582		1.53328			2		2			1009	282		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8362	0.696	1010	0.557		4.0			8		30			1011	939		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8745	0.381	1010	0.305		4.0			8		29			1011	929		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.8873	0.376	1014	0.301		4.0			7		25			1015	937		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9027	0.218	1014	0.174		4.0			8		25			1015	932		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9049	0.689	1012	0.551		4.0			8		13			1013	930		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9250	0.487	1012	0.390		4.0			8		27			1013	938		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9574	0.731	1010	0.585		4.0			8		27			1011	928		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	28.9763	0.715	1012	0.447		4.0			7		26			1013	934		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0124	0.908	1012	0.567		4.0			8		28			1013	926		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0225	0.941	1012	0.588		4.0			8		19			1013	927		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0468	0.434	1014	0.347		4.0			8		10			1015	935		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.0530	0.426	1012	0.267		4.0			8		33			1013	933		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1007	0.303	1014	0.303		4.0			6		22			1015	2787		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1211	0.512	1010	0.409		4.0			5		23			1011	2790		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1269	0.399	1014	0.399		4.0			6		26			1015	2789		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1329	0.840	1014	0.525		4.0			6		26			1015	2786		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1376	0.695	1014	0.556		4.0			6		35			1015	2788		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.1714	0.483	1012	0.387		4.0			8		22			1013	924		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2120	0.541	1010	0.541		4.0			6		29			1011	2785		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.2926	0.287	1010	0.287		4.0			8		18			1011	960		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3403	0.268	1012	0.168		4.0			8		39			1013	947		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3455	0.176	1014	0.176		4.0			8		21			1015	940		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.3773	0.242	1012	0.151		4.0			8		27			1013	950		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4300	0.491	1010	0.393		4.0			8		30			1011	955		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4351	0.257	1014	0.257		4.0			8		34			1015	959		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4614	0.754	1012	0.471		4.0			8		26			1013	956		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4712	0.479	1012	0.383		4.0			8		20			1013	957		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4715	0.636	1012	0.398		4.0			8		25			1013	952		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4785	0.168	1014	0.168		4.0			8		32			1015	943		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4841	35.772	1002	22.358		1.575			2		8			1003	291		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4926	0.364	1010	0.364		4.0			8		29			1011	949		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.4949	31.253	1000	25.003		1.575			4		3			1001	292		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5093	27.325	1006	21.860		1.575			3		3			1007	290		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5177	0.490	1012	0.392		4.0			8		24			1013	946		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5398	29.977	1002	23.982		1.575			4		3			1003	293		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5482	0.232	1010	0.186		4.0			8		25			1011	951		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5493	24.833	1004	19.866		1.575			2		4			1005	295		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5548	24.158	1002	24.158		1.575			3		7			1003	294		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.5878	27.527	1008	22.021		1.575			3		2			1009	289		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6170	0.733	1014	0.587		4.0			8		15			1015	942		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6624	0.454	1010	0.284		4.0			7		31			1011	958		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6644	0.608	1010	0.380		4.0			8		28			1011	953		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6732	0.763	1010	0.477		4.0			8		28			1011	948		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.6867	0.521	1010	0.521		4.0			7		29			1011	941		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7113	0.810	1012	0.506		4.0			8		15			1013	945		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7730	0.766	1014	0.479		4.0			8		19			1015	954		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	29.7744	0.498	1010	0.498		4.0			8		19			1011	944		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.1688	28.339	1004	22.671		1.61728			4		4			1005	296		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2459	0.850	1010	0.531		4.0			8		15			1011	970		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2494	23.289	1000	18.632		1.61728			3		5			1001	298		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2503	0.235	1014	0.235		4.0			8		29			1015	966		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2763	37.809	1004	23.630		1.61728			4		8			1005	301		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2908	32.419	1000	20.262		1.61728			2		9			1001	304		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.2959	20.256	1008	20.256		1.61728			2		5			1009	299		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3009	0.619	1012	0.495		4.0			8		34			1013	971		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3077	0.942	1014	0.588		4.0			8		29			1015	969		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3114	41.682	1000	26.051		1.61728			3		4			1001	303		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3144	0.259	1012	0.259		4.0			7		19			1013	965		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3160	0.221	1010	0.221		4.0			8		30			1011	968		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3248	0.225	1010	0.225		4.0			8		19			1011	963		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3274	0.265	1010	0.166		4.0			8		19			1011	967		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3380	26.770	1008	21.416		1.61728			3		2			1009	297		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.3607	0.713	1010	0.570		4.0			8		18			1011	961		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4165	0.475	1010	0.380		4.0			8		20			1011	973		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4578	0.309	1010	0.193		4.0			8		20			1011	964		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4595	0.382	1012	0.239		4.0			8		26			1013	972		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.4846	40.041	1000	25.025		1.61728			4		5			1001	300		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5037	0.515	1014	0.412		4.0			8		20			1015	962		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.5046	0.242	1012	0.242		4.0			6		20			1013	2793		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6115	0.264	1010	0.211		4.0			6		12			1011	2792		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.6358	0.537	1014	0.537		4.0			6		1			1015	2791		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.7082	0.732	1012	0.458		4.0			6		35			1013	2794		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9347	0.293	1014	0.293		4.0			8		25			1015	976		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9698	0.406	1012	0.254		4.0			8		29			1013	980		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	30.9874	0.202	1010	0.202		4.0			8		18			1011	978		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0817	37.883	1006	23.677		1.66012			4		3			1007	305		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.0942	0.688	1012	0.551		4.0			8		18			1013	975		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1182	25.272	1002	20.217		1.66012			3		4			1003	307		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1580	0.294	1012	0.184		4.0			8		26			1013	997		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1674	23.219	1000	18.575		1.66012			4		6			1001	308		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1747	30.679	1002	24.543		1.66012			2		9			1003	306		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1912	0.404	1012	0.253		4.0			8		30			1013	974		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.1985	0.460	1014	0.368		4.0			8		29			1015	981		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2021	0.611	1014	0.382		4.0			8		30			1015	977		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2168	0.416	1010	0.333		4.0			8		20			1011	979		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2656	0.291	1014	0.291		4.0			8		26			1015	1008		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2767	0.305	1010	0.244		4.0			8		27			1011	996		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2834	0.338	1010	0.270		4.0			8		18			1011	987		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2866	0.850	1014	0.531		4.0			8		24			1015	988		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2877	0.250	1012	0.200		4.0			8		36			1013	984		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2959	0.285	1014	0.178		4.0			8		25			1015	998		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.2980	0.494	1012	0.494		4.0			8		32			1013	995		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3394	0.347	1010	0.347		4.0			8		24			1011	999		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3458	0.262	1010	0.262		4.0			8		29			1011	991		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3598	0.954	1012	0.596		4.0			8		13			1013	1002		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3619	0.307	1012	0.246		4.0			8		12			1013	1013		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3781	0.497	1014	0.497		4.0			8		15			1015	985		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3824	0.522	1012	0.418		4.0			8		27			1013	1009		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.3918	0.257	1012	0.257		4.0			8		20			1013	993		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4062	0.489	1010	0.306		4.0			8		26			1011	1025		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4363	0.831	1010	0.519		4.0			8		22			1011	1004		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4400	0.372	1014	0.233		4.0			8		15			1015	1001		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4418	0.393	1012	0.246		4.0			8		28			1013	1003		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4668	0.350	1012	0.218		4.0			7		18			1013	982		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4695	0.619	1014	0.387		4.0			8		34			1015	983		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4714	0.292	1010	0.292		4.0			8		23			1011	990		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4878	0.176	1014	0.176		4.0			8		23			1015	1007		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4915	0.180	1010	0.180		4.0			8		27			1011	1006		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.4969	0.936	1012	0.585		4.0			8		23			1013	1000		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5075	0.536	1014	0.536		4.0			8		24			1015	986		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5224	0.313	1010	0.250		4.0			8		25			1011	1010		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5240	0.552	1010	0.552		4.0			8		18			1011	989		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5837	0.366	1014	0.366		4.0			8		19			1015	994		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5858	0.279	1010	0.279		4.0			8		17			1011	1017		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.5967	0.621	1014	0.497		4.0			8		35			1015	1011		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6677	0.655	1014	0.409		4.0			8		21			1015	992		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6740	0.475	1010	0.475		4.0			8		12			1011	1014		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6780	0.457	1012	0.457		4.0			8		14			1013	1027		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6798	0.247	1014	0.154		4.0			8		26			1015	1024		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.6804	0.258	1010	0.206		4.0			8		27			1011	1012		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7274	0.815	1014	0.509		4.0			8		20			1015	1016		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7540	0.348	1014	0.218		4.0			8		30			1015	1005		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7638	0.491	1012	0.307		4.0			8		22			1013	1030		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7841	0.593	1014	0.474		4.0			8		25			1015	1018		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.7923	0.201	1014	0.161		4.0			8		26			1015	1020		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8181	17.905	1008	17.905		1.7035200000000001			1		4			1009	314		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8385	0.810	1014	0.506		4.0			8		31			1015	1019		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8470	0.262	1012	0.262		4.0			8		14			1013	1015		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8488	0.491	1010	0.307		4.0			7		31			1011	1021		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8801	0.220	1012	0.220		4.0			8		32			1013	1023		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.8980	0.153	1014	0.153		4.0			8		28			1015	1026		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9010	23.142	1000	18.513		1.7035200000000001			4		8			1001	312		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9224	0.585	1014	0.366		4.0			8		30			1015	1031		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9288	31.331	1004	19.582		1.7035200000000001			4		6			1005	311		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9474	38.247	1002	23.904		1.7035200000000001			2		5			1003	309		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9532	0.651	1012	0.521		4.0			8		42			1013	1028		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9551	0.478	1014	0.382		4.0			8		21			1015	1029		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9634	22.084	1004	22.084		1.7035200000000001			4		4			1005	310		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	31.9794	35.056	1008	21.910		1.7035200000000001			3		3			1009	313		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0115	0.418	1014	0.334		4.0			6		18			1015	2797		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0313	0.584	1014	0.584		4.0			5		41			1015	2795		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.0325	0.286	1014	0.286		4.0			8		17			1015	1022		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.1639	0.390	1010	0.312		4.0			6		33			1011	2796		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7046	29.918	1006	18.699		1.7474800000000001			2		9			1007	320		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7197	41.077	1008	25.673		1.7474800000000001			4		10			1009	319		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7562	0.438	1012	0.274		4.0			6		24			1013	2798		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7568	24.608	1002	19.686		1.7474800000000001			2		3			1003	318		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7627	34.050	1000	21.281		1.7474800000000001			4		2			1001	317		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.7767	28.162	1004	17.601		1.7474800000000001			2		4			1005	315		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8144	17.709	1002	17.709		1.7474800000000001			2		2			1003	316		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	32.8184	29.791	1008	23.833		1.7474800000000001			2		8			1009	321		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1153	0.488	1010	0.488		4.0			5		13			1011	2801		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1381	0.654	1012	0.524		4.0			5		5			1013	2799		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1472	0.425	1012	0.425		4.0			6		34			1013	2800		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.1901	0.620	1014	0.496		4.0			6		13			1015	2802		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2133	0.314	1012	0.251		4.0			8		20			1013	1046		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2576	0.363	1012	0.227		4.0			8		25			1013	1044		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.2613	0.292	1014	0.292		4.0			8		33			1015	1035		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3024	0.519	1014	0.415		4.0			8		33			1015	1034		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3060	0.542	1012	0.542		4.0			6		17			1013	2803		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3118	0.512	1014	0.320		4.0			8		26			1015	1032		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3324	0.594	1010	0.594		4.0			8		26			1011	1037		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3476	0.519	1010	0.325		4.0			8		23			1011	1036		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.3772	0.536	1010	0.536		4.0			8		21			1011	1043		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4007	0.610	1012	0.488		4.0			8		23			1013	1048		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4469	0.907	1014	0.567		4.0			8		20			1015	1045		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4520	0.273	1012	0.273		4.0			8		23			1013	1039		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4537	0.334	1014	0.334		4.0			8		19			1015	1041		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.4815	0.325	1014	0.325		4.0			8		29			1015	1033		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5394	0.432	1010	0.346		4.0			8		24			1011	1038		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5499	33.549	1004	20.968		1.7920000000000005			3		6			1005	327		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5502	27.421	1004	21.937		1.7920000000000005			2		9			1005	323		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5727	26.333	1008	21.067		1.7920000000000005			3		4			1009	326		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5815	21.962	1006	17.570		1.7920000000000005			3		3			1007	322		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5854	40.198	1004	25.124		1.7920000000000005			2		10			1005	325		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5890	0.332	1014	0.332		4.0			8		38			1015	1040		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.5924	0.278	1012	0.278		4.0			5		8			1013	2805		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6071	0.748	1012	0.468		4.0			6		10			1013	2804		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6133	38.755	1002	24.222		1.7920000000000005			3		8			1003	324		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.6515	0.416	1012	0.260		4.0			8		26			1013	1047		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8100	0.805	1010	0.503		4.0			8		30			1011	1050		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8111	0.246	1014	0.154		4.0			5		26			1015	2806		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	33.8367	0.921	1014	0.575		4.0			8		16			1015	1042		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0250	0.528	1014	0.330		4.0			8		28			1015	1070		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0394	0.213	1014	0.213		4.0			8		33			1015	1069		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0526	0.452	1014	0.452		4.0			7		25			1015	1053		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0564	0.485	1010	0.485		4.0			8		40			1011	1057		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0894	0.498	1010	0.498		4.0			8		24			1011	1065		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.0938	0.273	1012	0.273		4.0			8		15			1013	1062		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1162	0.276	1012	0.276		4.0			8		21			1013	1058		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1285	0.495	1012	0.396		4.0			7		20			1013	1071		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1322	0.408	1012	0.255		4.0			8		14			1013	1061		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1347	0.472	1010	0.472		4.0			8		31			1011	1067		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1359	0.423	1010	0.338		4.0			8		28			1011	1059		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1363	0.353	1014	0.282		4.0			7		32			1015	1049		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1402	0.482	1014	0.482		4.0			8		17			1015	1066		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1470	0.878	1010	0.549		4.0			8		17			1011	1060		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1483	0.188	1010	0.150		4.0			8		8			1011	1055		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.1785	0.704	1014	0.563		4.0			8		16			1015	1052		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2074	0.369	1014	0.231		4.0			8		24			1015	1068		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2093	0.659	1012	0.527		4.0			8		24			1013	1064		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2196	0.391	1012	0.244		4.0			8		13			1013	1063		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2202	0.295	1014	0.236		4.0			7		21			1015	1076		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2246	0.439	1012	0.275		4.0			8		15			1013	1054		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2479	0.498	1012	0.399		4.0			8		26			1013	1075		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2503	0.709	1010	0.443		4.0			8		22			1011	1074		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2643	0.508	1010	0.406		4.0			8		17			1011	1082		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2663	0.182	1012	0.182		4.0			8		26			1013	1072		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2734	0.410	1012	0.328		4.0			8		20			1013	1056		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2755	0.311	1010	0.195		4.0			8		29			1011	1051		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.2933	0.318	1012	0.254		4.0			8		20			1013	1093		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3176	0.495	1012	0.396		4.0			8		32			1013	1096		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3397	0.535	1012	0.535		4.0			8		23			1013	1091		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3500	0.446	1012	0.357		4.0			8		34			1013	1083		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3552	0.397	1014	0.248		4.0			7		32			1015	1079		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3682	0.455	1014	0.364		4.0			8		22			1015	1077		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3766	28.670	1002	22.936		1.8370800000000005			3		9			1003	328		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.3812	21.529	1000	21.529		1.8370800000000005			4		10			1001	329		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4141	0.503	1010	0.503		4.0			8		18			1011	1073		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4163	0.321	1010	0.201		4.0			7		23			1011	1081		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4245	0.429	1012	0.343		4.0			8		23			1013	1095		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4355	22.690	1000	22.690		1.8370800000000005			4		9			1001	332		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4499	0.712	1010	0.445		4.0			8		12			1011	1080		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4504	0.297	1014	0.237		4.0			8		25			1015	1078		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4690	0.473	1014	0.379		4.0			8		29			1015	1084		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4751	0.433	1012	0.433		4.0			7		22			1013	1100		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4778	0.304	1010	0.304		4.0			8		18			1011	1089		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.4835	0.728	1012	0.582		4.0			8		16			1013	1088		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5097	0.447	1010	0.447		4.0			8		41			1011	1098		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5109	25.604	1004	25.604		1.8370800000000005			3		7			1005	330		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5138	0.273	1014	0.218		4.0			8		24			1015	1094		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5391	0.228	1012	0.228		4.0			8		35			1013	1092		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5642	0.747	1012	0.598		4.0			8		25			1013	1101		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5691	0.510	1014	0.510		4.0			8		35			1015	1099		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.5959	0.416	1010	0.332		4.0			8		40			1011	1090		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6376	0.941	1012	0.588		4.0			8		30			1013	1102		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6504	0.470	1014	0.294		4.0			8		22			1015	1086		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.6613	0.652	1010	0.522		4.0			8		32			1011	1097		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7112	0.954	1010	0.596		4.0			8		32			1011	1085		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7220	0.418	1012	0.418		4.0			8		29			1013	1087		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	34.7660	0.735	1014	0.460		4.0			8		24			1015	1107		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.0435	0.307	1010	0.246		4.0			8		28			1011	1106		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.0833	0.865	1014	0.541		4.0			8		25			1015	1104		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.0974	0.696	1010	0.435		4.0			8		25			1011	1110		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1146	0.226	1010	0.181		4.0			8		26			1011	1134		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1389	0.287	1010	0.230		4.0			8		25			1011	1116		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1958	0.597	1010	0.597		4.0			8		15			1011	1111		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.1959	0.361	1010	0.361		4.0			8		29			1011	1103		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2460	0.235	1010	0.235		4.0			8		19			1011	1115		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2588	0.349	1010	0.349		4.0			8		25			1011	1138		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2622	0.430	1012	0.269		4.0			8		28			1013	1121		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2709	0.428	1010	0.267		4.0			8		27			1011	1113		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2720	39.140	1000	24.462		1.8827200000000004			5		7			1001	334		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2792	0.421	1010	0.421		4.0			8		32			1011	1127		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2817	0.486	1012	0.389		4.0			8		29			1013	1123		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2825	0.229	1014	0.183		4.0			8		19			1015	1135		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2852	0.454	1012	0.363		4.0			8		40			1013	1126		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.2863	0.415	1014	0.260		4.0			8		33			1015	1136		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3009	39.000	1002	24.375		1.8827200000000004			2		10			1003	333		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3045	29.102	1006	18.189		1.8827200000000004			5		3			1007	339		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3106	0.330	1014	0.264		4.0			8		22			1015	1132		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3129	0.306	1010	0.245		4.0			8		28			1011	1108		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3136	20.009	1002	20.009		1.8827200000000004			3		4			1003	335		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3234	23.783	1006	19.026		1.8827200000000004			4		3			1007	336		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3312	24.306	1002	24.306		1.8827200000000004			3		5			1003	337		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3320	0.177	1010	0.177		4.0			8		17			1011	1145		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3328	27.272	1008	21.818		1.8827200000000004			2		4			1009	338		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3337	0.199	1010	0.199		4.0			8		16			1011	1141		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3340	0.689	1010	0.431		4.0			8		12			1011	1119		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3652	0.936	1014	0.585		4.0			8		36			1015	1112		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3731	0.527	1010	0.330		4.0			8		35			1011	1124		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3736	0.281	1010	0.176		4.0			8		9			1011	1122		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3758	0.375	1012	0.300		4.0			8		18			1013	1117		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3980	0.727	1012	0.582		4.0			8		29			1013	1137		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.3987	0.610	1010	0.488		4.0			8		29			1011	1118		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4116	0.426	1014	0.426		4.0			8		28			1015	1105		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4268	0.355	1012	0.284		4.0			8		28			1013	1133		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4673	0.706	1012	0.441		4.0			8		21			1013	1129		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4829	0.160	1012	0.160		4.0			8		24			1013	1142		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4857	0.585	1012	0.468		4.0			8		17			1013	1130		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.4974	0.578	1012	0.463		4.0			8		22			1013	1109		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5065	0.574	1012	0.574		4.0			5		24			1013	2807		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5098	0.331	1014	0.207		4.0			8		15			1015	1120		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5146	0.474	1010	0.296		4.0			8		23			1011	1153		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5167	0.185	1010	0.185		4.0			5		44			1011	2809		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5180	0.598	1012	0.374		4.0			8		32			1013	1159		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5216	0.345	1012	0.276		4.0			8		22			1013	1114		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5266	0.195	1012	0.156		4.0			8		30			1013	1131		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5375	0.389	1014	0.312		4.0			8		13			1015	1146		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5384	0.381	1010	0.305		4.0			8		8			1011	1162		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5448	0.349	1014	0.349		4.0			5		41			1015	2808		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.5899	0.406	1012	0.406		4.0			8		24			1013	1125		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6037	0.482	1010	0.482		4.0			6		26			1011	2810		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6081	0.538	1012	0.538		4.0			8		19			1013	1157		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6090	0.403	1014	0.403		4.0			8		31			1015	1140		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6138	0.446	1010	0.357		4.0			8		27			1011	1148		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6198	0.284	1010	0.227		4.0			8		24			1011	1156		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6225	0.593	1012	0.474		4.0			8		24			1013	1160		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6369	0.226	1014	0.226		4.0			8		26			1015	1128		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6535	0.565	1012	0.565		4.0			8		11			1013	1149		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6598	0.213	1014	0.171		4.0			8		21			1015	1143		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6629	0.348	1012	0.278		4.0			8		29			1013	1152		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6713	0.443	1010	0.277		4.0			8		28			1011	1147		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6820	0.242	1014	0.242		4.0			8		25			1015	1139		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6872	0.807	1014	0.505		4.0			8		22			1015	1155		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.6921	0.493	1012	0.395		4.0			8		20			1013	1151		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.7252	0.742	1014	0.594		4.0			8		23			1015	1161		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.7500	0.435	1012	0.435		4.0			8		22			1013	1154		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.7537	0.340	1010	0.272		4.0			8		15			1011	1150		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.8084	0.204	1010	0.163		4.0			8		21			1011	1158		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.8127	0.723	1010	0.452		4.0			8		24			1011	1144		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.9425	0.700	1012	0.560		4.0			8		20			1013	1171		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.9442	0.428	1012	0.428		4.0			8		21			1013	1164		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.9539	0.276	1014	0.221		4.0			8		25			1015	1170		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.9616	0.193	1010	0.154		4.0			8		16			1011	1172		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	35.9921	0.663	1014	0.531		4.0			8		25			1015	1169		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.0804	0.323	1014	0.323		4.0			8		20			1015	1163		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1211	0.720	1012	0.576		4.0			8		16			1013	1165		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1324	0.358	1012	0.286		4.0			8		19			1013	1173		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1369	40.447	1004	25.279		1.9289200000000002			2		11			1005	346		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1733	26.229	1000	20.984		1.9289200000000002			2		11			1001	344		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1916	33.420	1000	20.888		1.9289200000000002			2		10			1001	342		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.1963	25.637	1000	25.637		1.9289200000000002			4		6			1001	343		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2058	29.399	1000	18.374		1.9289200000000002			2		6			1001	340		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2303	30.699	1004	19.187		1.9289200000000002			3		9			1005	341		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2438	0.658	1014	0.526		4.0			8		30			1015	1168		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2732	0.620	1014	0.496		4.0			8		25			1015	1175		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2739	0.523	1012	0.523		4.0			8		27			1013	1166		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.2788	0.260	1012	0.208		4.0			6		17			1013	2811		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.3275	0.430	1012	0.430		4.0			8		18			1013	1174		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.4221	0.841	1014	0.526		4.0			8		33			1015	1167		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.4833	0.404	1012	0.252		4.0			8		23			1013	1181		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.4911	0.384	1014	0.307		4.0			8		29			1015	1176		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.5434	0.342	1012	0.214		4.0			6		40			1013	2816		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.5563	0.734	1014	0.587		4.0			8		39			1015	1177		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.5600	0.306	1010	0.245		4.0			8		23			1011	1184		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6043	0.434	1014	0.272		4.0			8		28			1015	1189		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6078	0.449	1012	0.359		4.0			8		38			1013	1186		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6129	0.578	1010	0.578		4.0			8		16			1011	1178		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6322	0.420	1014	0.420		4.0			6		39			1015	2814		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6345	0.218	1012	0.174		4.0			8		16			1013	1180		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6370	0.351	1012	0.220		4.0			8		42			1013	1190		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6405	0.191	1010	0.153		4.0			5		24			1011	2813		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6541	0.320	1012	0.320		4.0			5		6			1013	2812		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6700	0.387	1010	0.387		4.0			5		38			1011	2818		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6846	0.856	1014	0.535		4.0			8		23			1015	1185		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.6965	0.343	1010	0.214		4.0			5		11			1011	2819		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7127	0.441	1014	0.353		4.0			6		34			1015	2817		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7238	0.325	1012	0.325		4.0			7		21			1013	1179		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7483	0.287	1014	0.230		4.0			8		12			1015	1187		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7647	0.182	1014	0.182		4.0			8		25			1015	1188		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.7833	0.712	1012	0.445		4.0			8		23			1013	1182		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8476	0.566	1010	0.566		4.0			8		23			1011	1183		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8594	0.630	1014	0.394		4.0			6		32			1015	2815		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.8977	0.376	1014	0.301		4.0			6		21			1015	2820		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.9805	39.196	1000	24.498		1.9756799999999999			3		5			1001	354		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	36.9825	18.116	1004	18.116		1.9756799999999999			3		3			1005	347		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0006	0.516	1012	0.413		4.0			8		25			1013	1194		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0033	24.946	1004	24.946		1.9756799999999999			4		5			1005	352		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0103	0.325	1014	0.325		4.0			8		27			1015	1201		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0209	32.631	1006	20.394		1.9756799999999999			5		5			1007	348		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0620	18.795	1004	18.795		1.9756799999999999			4		2			1005	351		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0711	31.269	1004	25.016		1.9756799999999999			3		2			1005	349		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.0766	0.893	1014	0.558		4.0			8		25			1015	1191		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1024	30.497	1000	19.061		1.9756799999999999			4		6			1001	353		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1145	0.413	1014	0.258		4.0			8		28			1015	1195		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1555	17.034	1000	17.034		1.9756799999999999			5		7			1001	350		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1595	0.364	1010	0.291		4.0			8		30			1011	1198		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1667	0.706	1012	0.441		4.0			8		22			1013	1204		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1782	0.274	1014	0.274		4.0			8		25			1015	1205		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1860	0.283	1012	0.283		4.0			8		27			1013	1192		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.1910	0.721	1014	0.450		4.0			8		23			1015	1199		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.2175	0.535	1014	0.535		4.0			8		26			1015	1207		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.2464	0.588	1014	0.588		4.0			8		26			1015	1197		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.3100	0.735	1010	0.459		4.0			8		22			1011	1193		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.3320	0.342	1012	0.274		4.0			8		24			1013	1202		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.3616	0.519	1012	0.325		4.0			8		27			1013	1211		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.3921	0.242	1010	0.242		4.0			8		11			1011	1200		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4245	0.233	1014	0.187		4.0			8		28			1015	1203		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4395	0.342	1010	0.342		4.0			8		21			1011	1221		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4670	0.370	1010	0.232		4.0			8		22			1011	1216		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4690	0.698	1012	0.559		4.0			8		29			1013	1213		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4750	0.611	1010	0.489		4.0			8		19			1011	1214		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4767	0.699	1012	0.559		4.0			8		20			1013	1234		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4807	0.929	1014	0.581		4.0			8		15			1015	1215		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.4902	0.520	1014	0.520		4.0			8		24			1015	1236		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5414	0.216	1012	0.173		4.0			8		21			1013	1218		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5555	0.323	1012	0.202		4.0			8		26			1013	1230		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5597	0.386	1010	0.309		4.0			8		19			1011	1225		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5611	0.439	1012	0.439		4.0			8		18			1013	1222		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5753	0.434	1012	0.434		4.0			8		20			1013	1208		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5758	0.726	1012	0.581		4.0			8		25			1013	1224		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.5834	0.416	1010	0.333		4.0			8		20			1011	1210		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6343	0.587	1012	0.587		4.0			8		21			1013	1228		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6538	0.478	1012	0.382		4.0			8		18			1013	1196		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6569	0.414	1010	0.259		4.0			8		22			1011	1235		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6582	0.873	1012	0.546		4.0			8		19			1013	1209		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6658	0.690	1010	0.552		4.0			8		31			1011	1217		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6667	0.410	1010	0.410		4.0			8		22			1011	1206		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6849	0.452	1012	0.283		4.0			8		18			1013	1219		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.6860	0.581	1012	0.363		4.0			8		28			1013	1223		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7192	0.396	1014	0.316		4.0			8		24			1015	1226		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7215	0.575	1012	0.359		4.0			8		20			1013	1237		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7662	0.744	1012	0.595		4.0			8		25			1013	1229		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.7981	0.352	1010	0.220		4.0			8		28			1011	1220		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8040	0.399	1014	0.399		4.0			8		19			1015	1231		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8130	0.737	1012	0.461		4.0			8		26			1013	1212		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8144	0.490	1014	0.392		4.0			8		33			1015	1232		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8672	0.326	1010	0.326		4.0			8		16			1011	1233		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8739	0.274	1012	0.219		4.0			8		36			1013	1227		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8870	22.078	1004	17.662		2.023			5		5			1005	355		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.8883	39.809	1002	24.881		2.023			2		5			1003	356		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9012	37.184	1006	23.240		2.023			2		11			1007	359		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9089	18.296	1008	18.296		2.023			4		9			1009	358		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	37.9581	23.120	1004	23.120		2.023			2		9			1005	357		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0132	0.600	1010	0.375		4.0			5		12			1011	2827		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0503	0.427	1010	0.342		4.0			5		19			1011	2825		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.0798	0.734	1012	0.459		4.0			6		26			1013	2823		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1020	0.295	1014	0.295		4.0			5		9			1015	2824		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1094	0.280	1010	0.224		4.0			5		20			1011	2826		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1127	0.239	1012	0.192		4.0			6		30			1013	2821		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1263	0.196	1014	0.196		4.0			5		43			1015	2822		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1291	0.713	1012	0.571		4.0			5		28			1013	2828		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1367	0.648	1012	0.405		4.0			8		20			1013	1263		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1379	0.514	1014	0.514		4.0			5		31			1015	2830		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.1424	0.498	1012	0.311		4.0			6		26			1013	2829		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3400	0.221	1012	0.221		4.0			6		13			1013	2831		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3502	0.462	1010	0.462		4.0			6		45			1011	2832		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3532	0.171	1014	0.171		4.0			8		22			1015	1264		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3616	0.355	1010	0.284		4.0			6		34			1011	2834		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3681	0.357	1014	0.357		4.0			6		28			1015	2835		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3736	0.481	1012	0.481		4.0			5		21			1013	2833		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.3937	0.463	1014	0.370		4.0			8		24			1015	1261		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4087	0.742	1010	0.594		4.0			8		33			1011	1248		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4163	0.908	1014	0.568		4.0			5		29			1015	2839		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4165	0.206	1012	0.206		4.0			8		27			1013	1238		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4336	0.388	1014	0.388		4.0			8		26			1015	1239		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4342	0.556	1010	0.445		4.0			6		11			1011	2840		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4463	0.791	1012	0.495		4.0			5		13			1013	2836		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4467	0.313	1012	0.313		4.0			5		23			1013	2837		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4590	0.280	1012	0.224		4.0			8		19			1013	1258		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4641	0.744	1010	0.465		4.0			5		28			1011	2841		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4789	0.573	1010	0.459		4.0			8		29			1011	1240		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4905	0.228	1010	0.228		4.0			6		14			1011	2838		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4947	0.724	1012	0.453		4.0			8		24			1013	1246		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4952	0.890	1010	0.556		4.0			8		30			1011	1241		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.4980	0.400	1014	0.250		4.0			8		16			1015	1251		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5000	0.510	1012	0.408		4.0			8		21			1013	1252		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5008	0.362	1010	0.289		4.0			8		24			1011	1259		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5052	0.478	1014	0.478		4.0			8		30			1015	1254		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5160	0.264	1014	0.211		4.0			8		35			1015	1266		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5218	0.770	1012	0.481		4.0			8		28			1013	1255		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5226	0.376	1010	0.301		4.0			8		22			1011	1267		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5431	0.602	1012	0.376		4.0			8		36			1013	1268		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5461	0.333	1012	0.333		4.0			8		25			1013	1265		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5650	0.398	1014	0.319		4.0			8		21			1015	1256		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5732	0.697	1014	0.436		4.0			8		22			1015	1257		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.5877	0.659	1014	0.412		4.0			8		18			1015	1244		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6062	0.391	1010	0.245		4.0			8		22			1011	1253		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6238	0.595	1010	0.595		4.0			8		26			1011	1247		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6316	0.341	1010	0.273		4.0			8		24			1011	1269		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6423	0.694	1012	0.434		4.0			8		29			1013	1242		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6577	0.683	1010	0.546		4.0			8		26			1011	1260		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6747	0.430	1010	0.269		4.0			8		23			1011	1243		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6825	0.553	1012	0.553		4.0			9		34			1013	1262		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.6990	0.293	1014	0.235		4.0			8		17			1015	1250		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7012	0.253	1010	0.202		4.0			8		20			1011	1249		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7015	0.431	1010	0.269		4.0			8		22			1011	1245		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7660	21.147	1008	16.917		2.07088			2		10			1009	361		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7790	22.618	1000	18.094		2.07088			4		11			1001	362		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7881	18.120	1008	18.120		2.07088			2		6			1009	363		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.7971	19.899	1000	19.899		2.07088			2		7			1001	364		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8022	23.017	1008	23.017		2.07088			4		5			1009	360		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8326	0.306	1012	0.245		4.0			6		29			1013	2843		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8349	0.626	1010	0.501		4.0			8		26			1011	1278		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8410	34.474	1004	21.546		2.07088			3		4			1005	365		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8727	0.486	1010	0.486		4.0			8		21			1011	1316		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8757	0.243	1012	0.243		4.0			8		32			1013	1321		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.8794	0.645	1012	0.403		4.0			8		28			1013	1305		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9091	0.932	1012	0.583		4.0			8		33			1013	1291		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9121	0.734	1012	0.459		4.0			8		35			1013	1303		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9648	0.685	1012	0.548		4.0			8		32			1013	1275		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9681	0.213	1014	0.170		4.0			5		28			1015	2842		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9709	0.512	1012	0.512		4.0			8		17			1013	1300		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	38.9848	0.328	1010	0.328		4.0			8		28			1011	1302		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0023	0.386	1012	0.386		4.0			8		29			1013	1273		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0025	0.716	1014	0.573		4.0			8		31			1015	1272		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0150	0.350	1014	0.219		4.0			8		25			1015	1276		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0281	0.254	1012	0.254		4.0			8		25			1013	1282		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0568	0.337	1014	0.337		4.0			8		24			1015	1283		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0663	0.558	1014	0.446		4.0			8		31			1015	1281		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0728	0.606	1010	0.485		4.0			8		33			1011	1324		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0731	0.486	1010	0.304		4.0			8		18			1011	1277		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0731	0.618	1012	0.495		4.0			8		23			1013	1296		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0874	0.215	1010	0.215		4.0			8		26			1011	1307		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0889	0.431	1012	0.269		4.0			8		28			1013	1271		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0898	0.312	1012	0.195		4.0			8		24			1013	1284		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.0989	0.590	1010	0.590		4.0			8		18			1011	1297		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1048	0.247	1012	0.154		4.0			8		15			1013	1290		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1176	0.675	1010	0.540		4.0			8		17			1011	1270		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1233	0.545	1014	0.340		4.0			8		25			1015	1289		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1459	0.907	1014	0.567		4.0			8		32			1015	1298		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1515	0.541	1014	0.338		4.0			8		17			1015	1279		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1529	0.549	1014	0.439		4.0			8		10			1015	1274		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.1797	0.465	1014	0.465		4.0			8		18			1015	1319		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2043	0.851	1010	0.532		4.0			8		22			1011	1328		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2094	0.537	1012	0.537		4.0			8		34			1013	1313		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2251	0.581	1010	0.363		4.0			8		22			1011	1325		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2307	0.756	1012	0.472		4.0			8		25			1013	1322		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2373	0.502	1010	0.502		4.0			8		14			1011	1286		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2462	0.599	1010	0.599		4.0			8		18			1011	1287		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2558	0.263	1010	0.263		4.0			8		28			1011	1288		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.2952	0.376	1014	0.235		4.0			8		24			1015	1315		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3033	0.410	1012	0.328		4.0			8		22			1013	1293		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3134	0.432	1010	0.345		4.0			8		18			1011	1299		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3135	0.461	1012	0.288		4.0			9		18			1013	1317		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3172	0.611	1014	0.382		4.0			8		25			1015	1285		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3213	0.596	1012	0.373		4.0			8		25			1013	1292		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3305	0.457	1014	0.457		4.0			8		28			1015	1280		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3352	0.190	1012	0.152		4.0			8		12			1013	1311		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3374	0.396	1010	0.396		4.0			8		26			1011	1327		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3445	0.478	1012	0.299		4.0			8		21			1013	1301		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3653	0.547	1010	0.342		4.0			8		24			1011	1331		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3763	0.392	1010	0.392		4.0			8		26			1011	1304		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3876	0.806	1014	0.504		4.0			8		26			1015	1326		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3882	0.814	1014	0.509		4.0			8		20			1015	1295		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.3953	0.555	1012	0.347		4.0			8		22			1013	1312		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4024	0.294	1012	0.294		4.0			8		26			1013	1329		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4050	0.662	1012	0.530		4.0			8		31			1013	1306		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4070	0.760	1012	0.475		4.0			8		24			1013	1320		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4267	0.492	1010	0.492		4.0			8		29			1011	1330		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4619	0.518	1014	0.414		4.0			8		24			1015	1352		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4661	0.917	1012	0.573		4.0			9		18			1013	1309		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.4786	0.377	1010	0.235		4.0			8		20			1011	1318		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5340	0.630	1012	0.504		4.0			8		24			1013	1314		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5364	0.436	1014	0.436		4.0			8		25			1015	1332		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5388	0.633	1012	0.506		4.0			8		36			1013	1356		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5483	0.707	1010	0.566		4.0			8		23			1011	1358		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5673	0.360	1010	0.360		4.0			8		29			1011	1308		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5744	0.308	1014	0.308		4.0			8		23			1015	1344		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5932	0.525	1012	0.525		4.0			8		10			1013	1340		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5944	0.489	1014	0.306		4.0			8		24			1015	1339		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.5988	0.366	1014	0.366		4.0			8		28			1015	1341		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6048	0.532	1012	0.333		4.0			8		11			1013	1353		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6154	0.449	1014	0.280		4.0			8		23			1015	1294		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6368	0.301	1014	0.241		4.0			8		24			1015	1323		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6430	23.839	1000	23.839		2.11932			4		2			1001	366		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6677	0.732	1010	0.457		4.0			8		23			1011	1350		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6784	0.448	1010	0.358		4.0			8		22			1011	1336		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.6870	0.212	1012	0.212		4.0			8		20			1013	1354		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7028	26.928	1004	16.830		2.11932			5		4			1005	375		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7188	32.105	1004	20.066		2.11932			4		5			1005	373		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7384	36.769	1008	22.980		2.11932			3		11			1009	369		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7464	25.096	1008	25.096		2.11932			3		9			1009	367		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7567	31.882	1002	19.926		2.11932			2		3			1003	371		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7754	0.332	1012	0.207		4.0			8		22			1013	1346		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7783	0.356	1014	0.284		4.0			8		18			1015	1335		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7787	24.360	1000	19.488		2.11932			4		11			1001	374		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7814	0.572	1010	0.572		4.0			8		29			1011	1345		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7848	0.575	1012	0.360		4.0			8		26			1013	1337		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7853	18.685	1008	18.685		2.11932			5		6			1009	370		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.7884	22.614	1008	22.614		2.11932			2		9			1009	372		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8248	0.331	1012	0.331		4.0			8		17			1013	1310		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8373	0.182	1014	0.182		4.0			8		24			1015	1355		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8381	0.307	1012	0.245		4.0			8		22			1013	1343		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8746	0.167	1012	0.167		4.0			8		21			1013	1359		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.8809	0.590	1010	0.590		4.0			8		23			1011	1357		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9156	0.285	1014	0.285		4.0			8		26			1015	1360		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9265	0.665	1010	0.415		4.0			8		24			1011	1338		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9554	0.749	1010	0.468		4.0			8		30			1011	1348		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9606	0.398	1012	0.249		4.0			8		19			1013	1351		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	39.9935	0.328	1012	0.205		4.0			8		33			1013	1342		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.0087	0.439	1010	0.439		4.0			8		24			1011	1333		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.0286	0.608	1012	0.487		4.0			8		27			1013	1334		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.0412	0.392	1014	0.245		4.0			8		22			1015	1349		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.1849	0.799	1014	0.499		4.0			5		11			1015	2849		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.2668	0.414	1014	0.414		4.0			8		25			1015	1347		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.2873	0.746	1010	0.597		4.0			6		26			1011	2845		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3253	0.556	1010	0.347		4.0			5		17			1011	2847		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3495	0.868	1014	0.542		4.0			5		25			1015	2848		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3684	0.274	1010	0.219		4.0			5		29			1011	2846		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.3869	0.681	1014	0.544		4.0			5		20			1015	2844		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.5771	31.130	1008	24.904		2.16832			3		2			1009	378		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.6159	27.430	1000	17.144		2.16832			2		11			1001	377		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.6311	40.438	1002	25.274		2.16832			5		4			1003	376		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.6402	31.079	1004	24.863		2.16832			5		3			1005	380		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.6409	39.666	1002	24.791		2.16832			2		8			1003	379		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.6798	26.112	1004	20.890		2.16832			4		2			1005	382		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.7054	0.546	1012	0.546		4.0			8		28			1013	1363		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	40.9981	0.688	1010	0.551		4.0			8		30			1011	1387		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.0261	0.330	1012	0.264		4.0			8		19			1013	1368		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.0885	0.503	1014	0.403		4.0			8		24			1015	1388		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.0965	0.288	1012	0.180		4.0			8		30			1013	1375		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1237	0.570	1010	0.570		4.0			8		29			1011	1367		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1416	0.323	1014	0.258		4.0			8		27			1015	1408		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1447	0.672	1014	0.538		4.0			8		35			1015	1396		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1723	0.805	1014	0.503		4.0			8		35			1015	1370		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1885	0.245	1014	0.245		4.0			8		14			1015	1394		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.1885	0.468	1014	0.468		4.0			8		17			1015	1399		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2104	0.205	1014	0.205		4.0			8		25			1015	1374		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2198	0.314	1014	0.196		4.0			8		20			1015	1402		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2257	0.706	1010	0.565		4.0			8		25			1011	1376		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2496	0.406	1014	0.254		4.0			9		15			1015	1384		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2518	0.252	1014	0.202		4.0			8		26			1015	1380		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2573	0.267	1012	0.167		4.0			8		28			1013	1385		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2576	0.625	1010	0.390		4.0			8		17			1011	1365		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2675	0.262	1010	0.262		4.0			8		30			1011	1379		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2820	0.418	1010	0.418		4.0			8		21			1011	1381		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.2951	0.341	1012	0.273		4.0			8		29			1013	1391		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3038	0.586	1010	0.469		4.0			8		29			1011	1378		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3085	0.340	1010	0.340		4.0			8		26			1011	1390		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3137	0.495	1012	0.396		4.0			8		20			1013	1362		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3188	0.225	1012	0.225		4.0			8		25			1013	1392		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3297	0.659	1014	0.412		4.0			8		35			1015	1410		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3334	0.269	1010	0.269		4.0			8		19			1011	1389		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3338	0.497	1010	0.397		4.0			8		28			1011	1364		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3347	0.680	1012	0.425		4.0			8		29			1013	1382		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3406	0.621	1010	0.497		4.0			8		18			1011	1377		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3480	0.450	1012	0.282		4.0			8		28			1013	1383		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3503	0.816	1012	0.510		4.0			8		30			1013	1412		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3899	0.359	1010	0.287		4.0			8		30			1011	1386		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3902	0.604	1014	0.483		4.0			8		28			1015	1409		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.3921	0.248	1014	0.248		4.0			8		28			1015	1400		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4081	0.406	1012	0.406		4.0			8		24			1013	1372		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4140	0.668	1012	0.417		4.0			8		24			1013	1404		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4297	0.275	1012	0.275		4.0			8		29			1013	1414		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4379	0.469	1014	0.293		4.0			8		31			1015	1415		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4429	0.396	1014	0.396		4.0			8		24			1015	1373		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4456	0.333	1012	0.266		4.0			8		25			1013	1401		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4687	0.271	1010	0.271		4.0			8		22			1011	1403		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4708	0.639	1012	0.400		4.0			8		20			1013	1405		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4766	34.049	1002	21.280		2.21788			4		9			1003	392		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4850	0.543	1012	0.543		4.0			8		23			1013	1361		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4881	0.365	1010	0.292		4.0			8		31			1011	1397		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4929	0.375	1010	0.300		4.0			8		31			1011	1395		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4934	26.236	1008	20.988		2.21788			3		4			1009	383		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.4997	0.589	1014	0.368		4.0			8		27			1015	1416		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5061	0.397	1012	0.248		4.0			8		31			1013	1393		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5064	0.841	1012	0.526		4.0			8		13			1013	1419		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5181	0.419	1014	0.262		4.0			8		18			1015	1413		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5212	0.525	1014	0.420		4.0			8		36			1015	1366		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5393	0.540	1012	0.540		4.0			8		17			1013	1411		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5793	0.336	1010	0.336		4.0			8		28			1011	1406		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.5909	18.836	1000	18.836		2.21788			4		9			1001	386		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6180	0.211	1012	0.211		4.0			8		26			1013	1418		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6191	20.553	1000	16.443		2.21788			5		5			1001	390		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6219	0.633	1014	0.507		4.0			8		18			1015	1371		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6297	26.453	1002	16.533		2.21788			4		7			1003	389		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6365	0.585	1014	0.585		4.0			8		16			1015	1407		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6376	39.522	1000	24.702		2.21788			5		5			1001	385		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6399	23.503	1008	23.503		2.21788			4		6			1009	384		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6403	20.330	1002	16.264		2.21788			5		10			1003	388		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6413	21.435	1006	17.148		2.21788			5		11			1007	391		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6549	0.505	1014	0.505		4.0			8		27			1015	1369		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.6692	27.589	1002	17.243		2.21788			2		8			1003	387		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7114	0.692	1014	0.554		4.0			8		18			1015	1398		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	41.7236	0.521	1012	0.521		4.0			8		21			1013	1417		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.3496	0.389	1014	0.312		4.0			5		22			1015	2850		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.3692	0.374	1010	0.299		4.0			5		19			1011	2852		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.3726	0.218	1010	0.218		4.0			5		36			1011	2854		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.3759	0.196	1010	0.157		4.0			6		8			1011	2851		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.3777	0.832	1010	0.520		4.0			5		20			1011	2853		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.4882	0.406	1014	0.325		4.0			8		26			1015	1431		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5087	26.591	1006	21.273		2.2680000000000002			2		8			1007	394		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5196	22.394	1008	17.915		2.2680000000000002			4		7			1009	393		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5212	27.717	1000	17.323		2.2680000000000002			4		2			1001	396		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5234	0.505	1014	0.505		4.0			8		23			1015	1429		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5266	0.544	1014	0.544		4.0			8		26			1015	1456		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5362	0.256	1012	0.256		4.0			9		21			1013	1465		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5482	0.822	1014	0.514		4.0			8		24			1015	1420		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5499	0.558	1014	0.349		4.0			8		18			1015	1425		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5622	0.561	1014	0.561		4.0			8		26			1015	1428		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5646	0.291	1010	0.182		4.0			5		8			1011	2858		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5683	0.488	1012	0.305		4.0			8		22			1013	1446		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5726	0.302	1014	0.188		4.0			8		23			1015	1421		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5735	0.741	1010	0.593		4.0			8		26			1011	1424		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5827	0.314	1014	0.314		4.0			8		14			1015	1458		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5886	0.757	1010	0.473		4.0			8		17			1011	1427		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5919	0.911	1010	0.569		4.0			8		33			1011	1447		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.5989	0.254	1012	0.203		4.0			8		23			1013	1422		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6084	28.134	1004	17.584		2.2680000000000002			3		8			1005	397		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6180	0.421	1010	0.421		4.0			8		18			1011	1426		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6181	0.244	1012	0.195		4.0			8		20			1013	1496		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6191	0.428	1010	0.428		4.0			8		20			1011	1445		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6273	20.400	1008	20.400		2.2680000000000002			2		4			1009	395		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6428	0.449	1012	0.359		4.0			8		14			1013	1469		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6445	0.263	1012	0.164		4.0			5		17			1013	2856		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6457	0.311	1014	0.195		4.0			8		19			1015	1448		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6458	0.588	1010	0.588		4.0			8		28			1011	1435		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6467	0.587	1010	0.587		4.0			8		20			1011	1450		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6468	0.926	1014	0.579		4.0			8		27			1015	1457		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6470	0.482	1014	0.386		4.0			8		18			1015	1434		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6484	0.201	1014	0.201		4.0			8		26			1015	1494		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6552	0.275	1012	0.275		4.0			6		20			1013	2857		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6651	0.468	1010	0.374		4.0			5		17			1011	2855		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6765	0.372	1010	0.372		4.0			8		38			1011	1462		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6773	0.464	1014	0.290		4.0			8		22			1015	1430		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6821	0.637	1010	0.398		4.0			8		22			1011	1479		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6912	0.908	1012	0.568		4.0			8		25			1013	1436		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6956	0.228	1012	0.183		4.0			8		17			1013	1433		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.6993	0.688	1010	0.550		4.0			8		32			1011	1437		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7308	0.285	1012	0.228		4.0			8		31			1013	1442		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7476	0.435	1012	0.272		4.0			8		24			1013	1480		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7530	0.728	1014	0.455		4.0			5		10			1015	2859		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7564	0.289	1010	0.231		4.0			8		28			1011	1514		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7607	0.350	1010	0.280		4.0			8		17			1011	1488		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.7748	0.315	1012	0.197		4.0			8		28			1013	1443		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8008	0.545	1014	0.436		4.0			8		31			1015	1500		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8139	0.595	1014	0.595		4.0			8		18			1015	1463		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8173	0.264	1010	0.165		4.0			8		29			1011	1482		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8193	0.300	1010	0.240		4.0			8		30			1011	1478		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8200	0.674	1014	0.421		4.0			8		27			1015	1505		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8291	0.771	1014	0.482		4.0			8		26			1015	1453		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8302	0.700	1012	0.560		4.0			9		29			1013	1459		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8303	0.425	1010	0.266		4.0			8		26			1011	1423		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8310	0.597	1010	0.478		4.0			8		32			1011	1455		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8317	0.714	1014	0.571		4.0			8		25			1015	1491		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8321	0.593	1012	0.474		4.0			8		24			1013	1470		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8344	0.269	1012	0.269		4.0			8		29			1013	1454		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8386	0.403	1014	0.252		4.0			8		24			1015	1438		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8391	0.731	1010	0.585		4.0			8		19			1011	1471		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8560	0.671	1014	0.537		4.0			8		32			1015	1440		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.8603	0.468	1012	0.374		4.0			8		22			1013	1504		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9040	0.745	1012	0.596		4.0			8		24			1013	1467		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9053	0.256	1012	0.204		4.0			8		18			1013	1468		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9162	0.613	1012	0.490		4.0			8		34			1013	1460		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9235	0.523	1014	0.523		4.0			8		22			1015	1432		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9279	0.624	1010	0.390		4.0			8		16			1011	1444		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9327	0.400	1010	0.400		4.0			8		28			1011	1441		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9415	0.306	1012	0.306		4.0			8		23			1013	1449		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9494	0.544	1014	0.544		4.0			8		28			1015	1439		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9559	0.324	1010	0.324		4.0			9		29			1011	1476		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9729	0.823	1012	0.514		4.0			8		25			1013	1503		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9741	0.562	1012	0.562		4.0			8		19			1013	1486		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9765	0.676	1014	0.541		4.0			8		35			1015	1451		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9807	0.377	1012	0.235		4.0			8		23			1013	1490		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9836	0.525	1012	0.420		4.0			8		36			1013	1499		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	42.9852	0.160	1014	0.160		4.0			8		26			1015	1498		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0011	0.338	1010	0.338		4.0			8		34			1011	1495		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0106	0.447	1012	0.447		4.0			8		12			1013	1464		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0242	0.459	1014	0.287		4.0			8		31			1015	1487		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0406	0.392	1012	0.314		4.0			8		19			1013	1483		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0564	0.545	1010	0.341		4.0			8		24			1011	1497		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0609	0.355	1012	0.355		4.0			8		26			1013	1489		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0744	0.546	1014	0.341		4.0			8		28			1015	1461		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0767	0.257	1014	0.206		4.0			8		24			1015	1501		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0921	0.765	1012	0.478		4.0			8		31			1013	1510		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.0993	0.257	1014	0.160		4.0			8		27			1015	1474		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1150	0.265	1010	0.265		4.0			8		18			1011	1472		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1158	0.460	1012	0.368		4.0			8		24			1013	1466		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1310	0.670	1010	0.536		4.0			8		25			1011	1507		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1367	0.901	1014	0.563		4.0			8		17			1015	1516		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1377	0.364	1012	0.364		4.0			8		27			1013	1485		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1429	0.666	1014	0.417		4.0			8		25			1015	1477		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1460	0.715	1014	0.572		4.0			8		24			1015	1481		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1511	0.513	1012	0.320		4.0			8		23			1013	1522		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1538	0.619	1012	0.495		4.0			8		24			1013	1502		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1597	0.329	1012	0.329		4.0			9		26			1013	1517		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1921	0.551	1014	0.441		4.0			8		30			1015	1508		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.1926	0.604	1010	0.378		4.0			8		30			1011	1492		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2123	0.305	1014	0.244		4.0			9		35			1015	1475		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2156	0.681	1014	0.545		4.0			8		20			1015	1525		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2230	0.250	1014	0.156		4.0			8		27			1015	1509		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2431	0.543	1010	0.435		4.0			9		19			1011	1511		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2477	0.632	1012	0.506		4.0			8		16			1013	1529		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2601	0.896	1010	0.560		4.0			9		16			1011	1512		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2747	0.644	1012	0.515		4.0			5		27			1013	2863		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2768	0.212	1012	0.170		4.0			8		23			1013	1506		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2772	0.634	1010	0.508		4.0			5		11			1011	2860		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2778	0.257	1014	0.257		4.0			8		23			1015	1493		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2816	0.560	1010	0.448		4.0			5		33			1011	2862		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2866	0.607	1012	0.379		4.0			8		23			1013	1513		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2990	0.243	1014	0.195		4.0			8		31			1015	1524		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.2996	0.295	1012	0.184		4.0			8		28			1013	1473		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3120	0.688	1014	0.430		4.0			8		36			1015	1520		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3324	0.410	1012	0.328		4.0			5		24			1013	2861		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3345	0.538	1010	0.430		4.0			8		27			1011	1484		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3559	0.242	1014	0.193		4.0			8		23			1015	1452		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3878	0.359	1010	0.359		4.0			8		20			1011	1531		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.3940	31.007	1008	24.805		2.31868			3		11			1009	400		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4000	0.525	1010	0.420		4.0			8		23			1011	1515		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4077	0.308	1010	0.193		4.0			8		27			1011	1532		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4395	38.223	1004	23.889		2.31868			4		11			1005	408		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4402	0.363	1010	0.363		4.0			8		24			1011	1521		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4417	0.530	1010	0.424		4.0			8		25			1011	1537		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4465	0.379	1014	0.379		4.0			8		25			1015	1528		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4482	0.255	1010	0.159		4.0			8		18			1011	1518		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4556	0.191	1010	0.153		4.0			9		25			1011	1539		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4587	0.204	1010	0.204		4.0			8		23			1011	1523		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4605	0.578	1014	0.361		4.0			8		30			1015	1543		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4626	0.269	1012	0.269		4.0			8		27			1013	1530		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4665	28.827	1006	18.017		2.31868			2		8			1007	398		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4742	21.965	1000	21.965		2.31868			4		4			1001	399		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4823	32.794	1002	20.496		2.31868			5		6			1003	407		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4858	22.227	1008	22.227		2.31868			3		4			1009	406		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4863	19.628	1002	19.628		2.31868			2		9			1003	401		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4948	21.363	1008	21.363		2.31868			5		4			1009	402		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.4999	29.766	1008	23.813		2.31868			5		6			1009	405		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5167	0.450	1010	0.450		4.0			8		22			1011	1533		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5310	0.330	1012	0.330		4.0			8		36			1013	1519		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5366	0.537	1014	0.537		4.0			8		23			1015	1534		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5728	0.817	1012	0.511		4.0			8		28			1013	1527		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5862	0.698	1010	0.437		4.0			8		32			1011	1545		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.5894	0.579	1014	0.579		4.0			8		25			1015	1552		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6011	0.777	1012	0.486		4.0			8		32			1013	1535		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6016	0.319	1010	0.319		4.0			8		27			1011	1541		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6029	0.724	1010	0.579		4.0			8		10			1011	1544		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6249	0.575	1010	0.460		4.0			8		17			1011	1540		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6627	0.577	1012	0.462		4.0			8		21			1013	1536		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6714	0.477	1012	0.382		4.0			8		21			1013	1551		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.6745	0.481	1014	0.301		4.0			8		27			1015	1526		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.7112	0.441	1010	0.276		4.0			9		33			1011	1555		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.7127	0.437	1010	0.350		4.0			8		17			1011	1538		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.7245	0.189	1012	0.152		4.0			9		27			1013	1546		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.7513	0.293	1012	0.293		4.0			8		28			1013	1553		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.7800	0.329	1014	0.329		4.0			8		20			1015	1542		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.8385	0.393	1012	0.393		4.0			8		22			1013	1550		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.8461	0.547	1010	0.438		4.0			8		21			1011	1556		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.9205	0.257	1012	0.160		4.0			8		20			1013	1549		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.9558	0.466	1010	0.373		4.0			8		20			1011	1557		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	43.9932	0.654	1014	0.409		4.0			8		23			1015	1547		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.0028	0.562	1014	0.562		4.0			8		24			1015	1554		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.0476	0.647	1010	0.518		4.0			8		20			1011	1548		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.3845	34.742	1004	21.713		2.36992			3		9			1005	410		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.3940	37.241	1008	23.276		2.36992			2		3			1009	413		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.3994	0.477	1012	0.477		4.0			5		18			1013	2864		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4023	0.321	1014	0.257		4.0			5		18			1015	2869		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4215	0.555	1014	0.555		4.0			5		9			1015	2866		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4279	20.618	1004	20.618		2.36992			2		6			1005	418		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4315	0.218	1010	0.174		4.0			6		27			1011	2865		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4371	19.460	1000	19.460		2.36992			2		12			1001	409		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4382	20.094	1002	20.094		2.36992			5		13			1003	416		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4449	0.339	1012	0.339		4.0			5		17			1013	2868		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4518	17.772	1002	17.772		2.36992			3		9			1003	417		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4550	39.757	1008	24.848		2.36992			4		7			1009	414		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4577	0.518	1012	0.518		4.0			6		34			1013	2867		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.4618	38.951	1000	24.344		2.36992			5		9			1001	412		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.5079	25.430	1008	25.430		2.36992			2		12			1009	411		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.5483	0.423	1010	0.264		4.0			8		34			1011	1564		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.5552	0.351	1010	0.351		4.0			8		21			1011	1566		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.6042	0.697	1012	0.557		4.0			9		21			1013	1568		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.6231	0.308	1012	0.308		4.0			8		34			1013	1567		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.6609	0.253	1010	0.253		4.0			8		22			1011	1561		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7017	0.290	1010	0.290		4.0			8		30			1011	1569		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7069	0.435	1014	0.435		4.0			5		21			1015	2872		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7319	0.555	1014	0.555		4.0			8		21			1015	1565		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7534	0.569	1010	0.455		4.0			8		29			1011	1562		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7562	0.223	1010	0.223		4.0			8		18			1011	1570		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.7752	0.823	1014	0.515		4.0			8		22			1015	1563		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.8580	0.283	1010	0.177		4.0			5		17			1011	2870		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.8623	0.197	1014	0.197		4.0			5		35			1015	2871		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	44.9112	0.785	1014	0.491		4.0			8		18			1015	1560		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0142	0.507	1012	0.507		4.0			8		33			1013	1559		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0209	0.528	1010	0.528		4.0			8		24			1011	1571		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.0879	0.368	1012	0.230		4.0			8		26			1013	1558		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2090	0.780	1010	0.487		4.0			5		14			1011	2878		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2348	0.684	1010	0.547		4.0			5		31			1011	2874		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2497	0.587	1010	0.587		4.0			5		22			1011	2876		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2827	0.551	1012	0.551		4.0			5		23			1013	2875		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2830	0.934	1014	0.583		4.0			5		22			1015	2877		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.2902	0.581	1012	0.465		4.0			5		11			1013	2873		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.3318	27.566	1000	17.229		2.42172			2		7			1001	428		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.3510	33.215	1008	20.760		2.42172			3		11			1009	429		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.3753	34.461	1000	21.538		2.42172			3		10			1001	426		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.3905	27.928	1000	22.342		2.42172			3		7			1001	422		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.3954	21.835	1008	17.468		2.42172			5		3			1009	419		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4205	27.058	1004	21.646		2.42172			5		4			1005	423		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4251	31.788	1000	19.867		2.42172			2		5			1001	424		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4327	21.093	1002	21.093		2.42172			4		11			1003	421		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.4537	31.891	1004	19.932		2.42172			4		7			1005	425		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.7101	0.413	1014	0.331		4.0			5		15			1015	2880		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	45.7396	0.393	1010	0.393		4.0			6		13			1011	2879		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3392	31.039	1008	24.831		2.4740800000000007			3		5			1009	431		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3550	0.723	1012	0.578		4.0			5		30			1013	2883		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3621	30.069	1004	24.056		2.4740800000000007			4		11			1005	436		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3705	20.202	1004	16.162		2.4740800000000007			4		3			1005	433		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3928	33.168	1000	20.730		2.4740800000000007			5		5			1001	437		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3950	29.412	1008	18.383		2.4740800000000007			3		10			1009	434		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3957	26.840	1002	16.775		2.4740800000000007			3		4			1003	432		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.3980	20.125	1008	20.125		2.4740800000000007			3		11			1009	430		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4298	23.106	1006	18.485		2.4740800000000007			4		5			1007	435		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4333	0.639	1010	0.512		4.0			6		20			1011	2881		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4367	0.526	1014	0.526		4.0			5		5			1015	2882		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4608	28.733	1008	17.958		2.4740800000000007			5		5			1009	438		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4710	0.765	1010	0.478		4.0			8		21			1011	1593		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.4845	0.251	1012	0.251		4.0			6		10			1013	2884		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.5092	0.335	1010	0.209		4.0			6		45			1011	2885		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.7196	0.285	1014	0.285		4.0			6		3			1015	2888		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.7733	0.562	1014	0.449		4.0			5		8			1015	2887		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.8134	0.538	1010	0.538		4.0			8		31			1011	1583		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.8287	0.434	1010	0.434		4.0			5		34			1011	2886		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9448	0.903	1014	0.564		4.0			8		29			1015	1577		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9545	0.388	1012	0.388		4.0			8		25			1013	1582		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9657	0.262	1012	0.262		4.0			8		26			1013	1590		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9688	0.436	1014	0.272		4.0			9		32			1015	1573		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9814	0.360	1012	0.360		4.0			8		22			1013	1584		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	46.9849	0.426	1010	0.341		4.0			8		25			1011	1589		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0216	0.590	1012	0.590		4.0			8		19			1013	1599		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0262	0.438	1014	0.350		4.0			8		14			1015	1600		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0536	0.344	1010	0.344		4.0			8		22			1011	1581		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0701	0.834	1012	0.521		4.0			8		24			1013	1598		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.0880	0.339	1014	0.271		4.0			9		24			1015	1607		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1306	0.726	1010	0.581		4.0			9		32			1011	1585		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1341	0.428	1014	0.267		4.0			8		26			1015	1578		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1350	0.501	1012	0.501		4.0			8		24			1013	1588		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1471	0.243	1012	0.152		4.0			9		29			1013	1592		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1856	0.278	1014	0.278		4.0			8		26			1015	1597		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.1980	0.391	1014	0.391		4.0			8		16			1015	1595		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2049	0.685	1014	0.548		4.0			9		28			1015	1576		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2200	0.640	1012	0.400		4.0			9		26			1013	1579		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2307	0.583	1010	0.583		4.0			5		19			1011	2890		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2334	0.551	1010	0.551		4.0			8		23			1011	1572		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2418	0.725	1014	0.580		4.0			5		40			1015	2892		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2434	0.531	1012	0.425		4.0			8		30			1013	1596		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2474	0.735	1012	0.459		4.0			8		30			1013	1587		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2781	0.534	1014	0.334		4.0			5		29			1015	2893		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2837	0.439	1010	0.351		4.0			8		23			1011	1594		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2872	0.632	1014	0.505		4.0			8		12			1015	1609		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2917	0.614	1010	0.491		4.0			5		22			1011	2891		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.2937	0.577	1012	0.361		4.0			8		29			1013	1580		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3157	0.567	1012	0.454		4.0			8		27			1013	1591		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3218	0.515	1012	0.322		4.0			5		38			1013	2894		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3252	0.359	1012	0.359		4.0			8		28			1013	1586		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3435	0.478	1014	0.299		4.0			8		21			1015	1574		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3606	0.337	1012	0.337		4.0			5		13			1013	2889		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.3706	0.465	1010	0.465		4.0			8		21			1011	1575		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4043	0.215	1014	0.172		4.0			8		21			1015	1611		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4061	19.540	1008	15.632		2.527			5		13			1009	441		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4098	28.028	1006	22.422		2.527			3		12			1007	439		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4114	0.435	1012	0.348		4.0			8		26			1013	1640		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4174	25.085	1004	20.068		2.527			6		11			1005	443		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4420	36.038	1000	22.524		2.527			3		8			1001	440		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4457	23.254	1008	23.254		2.527			3		7			1009	442		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4571	0.526	1010	0.526		4.0			8		23			1011	1603		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.4633	0.329	1010	0.206		4.0			8		38			1011	1613		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5005	0.556	1012	0.556		4.0			8		27			1013	1610		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5044	0.553	1012	0.346		4.0			8		19			1013	1602		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5202	0.259	1014	0.162		4.0			8		29			1015	1612		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5445	0.312	1010	0.195		4.0			9		27			1011	1654		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5506	0.654	1010	0.409		4.0			8		23			1011	1619		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5575	0.503	1014	0.503		4.0			8		23			1015	1608		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5612	0.673	1012	0.539		4.0			8		27			1013	1614		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5837	0.347	1010	0.347		4.0			8		27			1011	1630		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.5871	0.914	1012	0.571		4.0			8		22			1013	1643		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6088	0.336	1012	0.269		4.0			8		22			1013	1647		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6107	0.901	1012	0.563		4.0			8		17			1013	1657		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6188	0.614	1010	0.384		4.0			8		28			1011	1604		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6243	0.295	1012	0.236		4.0			8		22			1013	1632		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6319	0.380	1010	0.380		4.0			9		21			1011	1663		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6337	0.184	1012	0.184		4.0			8		23			1013	1626		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6409	0.554	1012	0.346		4.0			9		35			1013	1629		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.6758	0.338	1012	0.338		4.0			8		31			1013	1628		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7015	0.489	1010	0.489		4.0			8		23			1011	1616		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7058	0.373	1010	0.233		4.0			8		14			1011	1601		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7185	0.721	1012	0.577		4.0			8		26			1013	1652		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7196	0.267	1010	0.267		4.0			8		18			1011	1620		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7213	0.237	1014	0.237		4.0			8		18			1015	1653		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7234	0.555	1012	0.444		4.0			8		17			1013	1627		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7335	0.201	1014	0.161		4.0			8		26			1015	1637		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7405	0.496	1010	0.310		4.0			8		30			1011	1615		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7416	0.328	1010	0.205		4.0			9		22			1011	1623		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7433	0.710	1014	0.444		4.0			8		20			1015	1641		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7508	0.528	1010	0.422		4.0			8		21			1011	1605		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7556	0.371	1014	0.371		4.0			8		28			1015	1650		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7881	0.259	1014	0.162		4.0			8		20			1015	1617		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7904	0.220	1010	0.176		4.0			8		25			1011	1656		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.7981	0.382	1010	0.382		4.0			8		28			1011	1655		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8029	0.153	1012	0.153		4.0			8		32			1013	1624		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8161	0.269	1014	0.168		4.0			8		24			1015	1625		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8201	0.894	1010	0.559		4.0			8		18			1011	1644		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8223	0.235	1014	0.188		4.0			9		28			1015	1639		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8669	0.401	1014	0.321		4.0			8		18			1015	1645		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8676	0.522	1014	0.522		4.0			8		20			1015	1648		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8726	0.427	1014	0.267		4.0			8		18			1015	1661		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8849	0.558	1010	0.558		4.0			8		20			1011	1662		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.8974	0.510	1014	0.408		4.0			8		23			1015	1659		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9083	0.475	1014	0.380		4.0			8		20			1015	1636		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9209	0.225	1012	0.225		4.0			8		24			1013	1638		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9321	0.373	1014	0.373		4.0			8		21			1015	1618		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9332	0.775	1012	0.485		4.0			8		20			1013	1679		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9555	0.342	1012	0.342		4.0			8		30			1013	1701		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9588	0.602	1014	0.377		4.0			8		27			1015	1635		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9665	0.372	1010	0.233		4.0			5		26			1011	2899		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9880	0.206	1012	0.206		4.0			6		36			1013	2897		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	47.9908	0.214	1014	0.214		4.0			8		19			1015	1649		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0077	0.485	1010	0.485		4.0			5		47			1011	2905		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0157	0.694	1014	0.434		4.0			9		26			1015	1606		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0185	0.612	1010	0.490		4.0			5		31			1011	2900		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0251	0.213	1010	0.171		4.0			8		29			1011	1676		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0261	0.922	1012	0.576		4.0			8		25			1013	1677		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0279	0.911	1012	0.569		4.0			8		23			1013	1651		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0297	0.350	1010	0.280		4.0			5		41			1011	2895		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0416	0.568	1012	0.355		4.0			8		30			1013	1646		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0448	0.475	1014	0.380		4.0			8		25			1015	1622		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0472	0.255	1014	0.204		4.0			8		22			1015	1633		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0557	0.359	1014	0.224		4.0			8		21			1015	1621		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0646	0.283	1012	0.283		4.0			4		13			1013	2898		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0647	0.460	1010	0.460		4.0			5		24			1011	2901		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0816	0.404	1014	0.253		4.0			8		32			1015	1660		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0870	0.401	1014	0.401		4.0			5		39			1015	2908		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0909	0.432	1012	0.432		4.0			5		37			1013	2896		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.0987	0.596	1012	0.596		4.0			8		22			1013	1667		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1243	0.283	1010	0.283		4.0			8		15			1011	1631		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1250	0.503	1014	0.314		4.0			8		22			1015	1686		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1347	0.607	1010	0.486		4.0			8		25			1011	1702		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1366	0.705	1012	0.441		4.0			8		23			1013	1697		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1368	0.172	1012	0.172		4.0			8		20			1013	1642		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1379	0.522	1012	0.417		4.0			5		33			1013	2902		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1544	0.532	1010	0.426		4.0			5		39			1011	2904		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1602	0.481	1012	0.481		4.0			8		21			1013	1665		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1798	0.633	1010	0.506		4.0			5		24			1011	2907		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1822	0.505	1014	0.505		4.0			8		22			1015	1668		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1949	0.282	1014	0.226		4.0			5		26			1015	2906		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1969	0.361	1014	0.226		4.0			8		28			1015	1700		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.1997	0.436	1010	0.436		4.0			8		22			1011	1681		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2037	0.630	1010	0.504		4.0			8		35			1011	1696		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2039	0.319	1012	0.319		4.0			5		26			1013	2903		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2042	0.424	1012	0.339		4.0			9		22			1013	1678		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2099	0.891	1014	0.557		4.0			9		29			1015	1703		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2147	0.409	1012	0.255		4.0			8		26			1013	1673		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2209	0.418	1014	0.418		4.0			9		27			1015	1726		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2384	0.637	1012	0.398		4.0			8		34			1013	1675		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2497	0.392	1014	0.245		4.0			8		27			1015	1719		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2501	0.867	1010	0.542		4.0			8		15			1011	1666		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2569	0.228	1012	0.228		4.0			8		26			1013	1674		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2632	0.473	1014	0.378		4.0			8		29			1015	1688		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2747	0.564	1012	0.564		4.0			5		31			1013	2910		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2759	0.702	1012	0.439		4.0			8		28			1013	1715		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2878	0.691	1014	0.432		4.0			8		31			1015	1727		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2911	0.525	1010	0.525		4.0			8		20			1011	1680		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2926	0.958	1012	0.599		4.0			8		19			1013	1670		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.2985	0.722	1012	0.451		4.0			5		14			1013	2909		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3016	0.325	1012	0.203		4.0			8		27			1013	1695		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3154	0.425	1014	0.265		4.0			5		9			1015	2911		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3165	0.440	1014	0.275		4.0			8		31			1015	1684		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3218	0.346	1012	0.216		4.0			5		21			1013	2913		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3311	0.727	1012	0.581		4.0			8		28			1013	1693		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3415	0.644	1012	0.515		4.0			8		28			1013	1721		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3423	0.497	1012	0.310		4.0			8		15			1013	1731		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3539	0.662	1014	0.414		4.0			8		28			1015	1671		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3586	33.964	1002	21.228		2.58048			4		10			1003	448		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3587	0.578	1010	0.578		4.0			9		26			1011	1669		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3664	0.523	1012	0.419		4.0			8		17			1013	1672		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3722	19.835	1000	19.835		2.58048			2		11			1001	446		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3761	0.390	1010	0.390		4.0			8		20			1011	1634		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3784	0.165	1010	0.165		4.0			8		29			1011	1728		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3804	0.514	1012	0.321		4.0			8		35			1013	1658		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3863	0.337	1010	0.337		4.0			8		23			1011	1682		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3888	22.738	1004	22.738		2.58048			6		9			1005	452		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.3981	24.876	1006	19.901		2.58048			6		11			1007	450		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4015	29.857	1002	23.885		2.58048			3		9			1003	449		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4016	19.080	1008	15.264		2.58048			4		9			1009	447		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4027	0.335	1012	0.268		4.0			8		28			1013	1698		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4036	0.542	1012	0.542		4.0			8		24			1013	1730		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4094	0.693	1010	0.554		4.0			8		26			1011	1718		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4116	0.687	1012	0.430		4.0			9		30			1013	1683		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4194	23.358	1000	18.686		2.58048			5		5			1001	444		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4202	0.575	1014	0.575		4.0			8		29			1015	1705		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4315	0.311	1010	0.249		4.0			8		19			1011	1712		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4340	0.639	1014	0.511		4.0			8		23			1015	1692		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4389	0.407	1014	0.255		4.0			8		24			1015	1707		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4392	31.032	1002	19.395		2.58048			5		8			1003	445		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4428	0.497	1010	0.497		4.0			9		16			1011	1687		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4440	0.296	1012	0.185		4.0			8		19			1013	1710		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4510	0.832	1012	0.520		4.0			8		20			1013	1725		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4535	19.000	1000	19.000		2.58048			2		12			1001	453		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4551	0.312	1014	0.250		4.0			5		15			1015	2912		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4562	0.594	1014	0.371		4.0			8		26			1015	1664		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4699	0.336	1012	0.336		4.0			8		22			1013	1704		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4729	0.917	1012	0.573		4.0			8		32			1013	1685		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4747	0.408	1014	0.408		4.0			8		37			1015	1732		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.4877	0.483	1010	0.302		4.0			8		27			1011	1690		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5008	0.426	1014	0.340		4.0			8		33			1015	1691		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5289	0.344	1010	0.275		4.0			9		23			1011	1713		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5417	0.303	1012	0.303		4.0			8		30			1013	1706		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5424	0.416	1012	0.416		4.0			9		29			1013	1699		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5482	0.174	1012	0.174		4.0			9		29			1013	1689		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5777	0.853	1010	0.533		4.0			8		21			1011	1716		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5960	0.192	1010	0.192		4.0			8		29			1011	1708		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5964	0.408	1010	0.255		4.0			8		25			1011	1694		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.5980	0.191	1014	0.191		4.0			8		24			1015	1711		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6421	0.856	1010	0.535		4.0			8		24			1011	1717		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6460	0.421	1012	0.263		4.0			4		12			1013	2915		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6518	0.899	1014	0.562		4.0			8		21			1015	1723		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6524	0.491	1010	0.393		4.0			5		32			1011	2916		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6775	0.294	1012	0.235		4.0			8		20			1013	1714		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.6791	0.201	1014	0.201		4.0			8		30			1015	1720		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.7267	0.764	1010	0.478		4.0			8		24			1011	1709		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.7399	0.526	1010	0.526		4.0			8		16			1011	1729		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.7476	0.382	1014	0.382		4.0			8		24			1015	1722		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	48.7981	0.520	1014	0.416		4.0			5		27			1015	2914		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.0541	0.185	1012	0.185		4.0			8		17			1013	1724		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3288	23.021	1002	18.417		2.63452			4		14			1003	455		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3447	19.835	1002	19.835		2.63452			2		6			1003	456		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3619	34.480	1002	21.550		2.63452			3		12			1003	463		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3683	25.857	1000	20.686		2.63452			2		4			1001	459		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3684	25.445	1004	15.903		2.63452			4		4			1005	462		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3753	30.227	1004	24.182		2.63452			5		9			1005	454		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3829	38.094	1008	23.809		2.63452			2		4			1009	457		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.3945	26.047	1002	16.279		2.63452			5		11			1003	460		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.4421	39.186	1008	24.491		2.63452			5		7			1009	461		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.4809	21.545	1000	17.236		2.63452			2		8			1001	458		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.6744	0.609	1012	0.488		4.0			6		36			1013	2921		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.7215	0.504	1012	0.403		4.0			4		23			1013	2920		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.7341	0.597	1010	0.477		4.0			5		30			1011	2919		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.7376	0.508	1014	0.508		4.0			5		16			1015	2918		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	49.7502	0.701	1012	0.561		4.0			5		12			1013	2917		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.3077	0.594	1014	0.594		4.0			5		24			1015	2922		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.3940	0.822	1014	0.514		4.0			5		1			1015	2923		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.3964	0.358	1010	0.224		4.0			5		22			1011	2925		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4071	34.205	1008	21.378		2.6891199999999995			4		12			1009	466		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4288	32.765	1006	20.478		2.6891199999999995			3		13			1007	470		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4445	22.184	1002	17.747		2.6891199999999995			6		3			1003	464		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4488	0.776	1010	0.485		4.0			4		35			1011	2924		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4515	36.651	1004	22.907		2.6891199999999995			3		4			1005	471		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.4776	25.195	1000	15.747		2.6891199999999995			5		5			1001	465		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.5106	30.395	1008	24.316		2.6891199999999995			3		5			1009	469		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6391	0.219	1014	0.175		4.0			5		31			1015	2927		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6512	0.672	1014	0.420		4.0			5		15			1015	2926		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	50.6739	0.427	1014	0.342		4.0			5		21			1015	2928		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.1464	0.533	1012	0.427		4.0			5		13			1013	2931		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.1703	0.208	1010	0.166		4.0			5		21			1011	2930		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.1991	0.559	1012	0.559		4.0			4		16			1013	2929		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.2926	0.787	1014	0.492		4.0			5		50			1015	2934		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3158	0.692	1012	0.554		4.0			5		18			1013	2933		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3584	0.893	1014	0.558		4.0			5		18			1015	2932		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3614	38.170	1000	23.856		2.74428			4		8			1001	479		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3754	0.305	1012	0.191		4.0			5		25			1013	2935		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3862	29.622	1004	23.698		2.74428			5		11			1005	478		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.3945	24.335	1008	15.209		2.74428			2		8			1009	472		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4305	24.640	1002	19.712		2.74428			6		3			1003	480		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4467	26.782	1006	16.739		2.74428			5		6			1007	476		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4732	28.028	1004	22.422		2.74428			4		13			1005	475		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.4892	16.055	1008	16.055		2.74428			6		8			1009	473		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.5572	36.796	1004	22.998		2.74428			2		3			1005	477		2				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.5592	17.911	1000	17.911		2.74428			3		3			1001	474		1				1			2			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.8003	0.438	1012	0.438		4.0			8		23			1013	1757		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	51.8218	0.493	1014	0.394		4.0			5		18			1015	2936		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.2015	0.745	1014	0.596		4.0			8		29			1015	1759		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.2287	0.853	1012	0.533		4.0			8		21			1013	1742		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.2350	0.318	1014	0.318		4.0			8		34			1015	1735		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.2444	0.527	1012	0.422		4.0			8		24			1013	1738		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.3247	0.273	1012	0.273		4.0			8		17			1013	1739		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.3555	0.887	1012	0.555		4.0			8		25			1013	1752		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.3751	0.689	1012	0.551		4.0			8		27			1013	1755		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.3974	0.473	1014	0.296		4.0			8		24			1015	1734		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4068	0.421	1012	0.421		4.0			8		30			1013	1767		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4079	0.933	1010	0.583		4.0			9		21			1011	1753		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4626	0.740	1014	0.463		4.0			8		26			1015	1741		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4970	0.503	1012	0.402		4.0			8		28			1013	1751		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4988	0.901	1012	0.563		4.0			8		23			1013	1744		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.4996	0.708	1010	0.567		4.0			8		25			1011	1758		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5104	0.240	1014	0.240		4.0			8		27			1015	1747		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5552	0.191	1012	0.153		4.0			8		30			1013	1737		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5580	0.530	1012	0.530		4.0			8		24			1013	1756		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5730	0.337	1014	0.337		4.0			9		22			1015	1750		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5736	0.346	1014	0.346		4.0			8		22			1015	1733		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.5931	0.349	1014	0.279		4.0			8		21			1015	1743		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6019	0.229	1012	0.183		4.0			8		24			1013	1754		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6062	0.943	1010	0.589		4.0			9		23			1011	1745		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6074	0.726	1012	0.581		4.0			8		28			1013	1740		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6254	0.499	1010	0.399		4.0			8		17			1011	1761		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6421	0.558	1010	0.349		4.0			8		19			1011	1764		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6600	0.244	1014	0.244		4.0			8		17			1015	1746		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6988	0.678	1014	0.424		4.0			8		22			1015	1766		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.6999	0.707	1012	0.442		4.0			8		19			1013	1748		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7009	0.330	1010	0.206		4.0			9		23			1011	1760		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7029	0.398	1012	0.318		4.0			8		21			1013	1749		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7034	0.544	1010	0.544		4.0			8		24			1011	1763		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7141	0.252	1014	0.157		4.0			6		37			1015	2937		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7168	0.866	1014	0.541		4.0			9		18			1015	1762		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.7962	0.192	1010	0.192		4.0			8		25			1011	1736		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.8433	0.168	1014	0.168		4.0			9		19			1015	1768		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	52.9846	0.497	1014	0.497		4.0			8		25			1015	1765		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.3840	0.197	1012	0.197		4.0			8		37			1013	1789		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.4821	0.590	1014	0.368		4.0			8		26			1015	1780		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.5499	0.392	1012	0.245		4.0			9		33			1013	1776		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.5852	0.599	1012	0.599		4.0			8		27			1013	1771		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7027	0.482	1010	0.301		4.0			8		22			1011	1781		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7229	0.714	1014	0.446		4.0			9		27			1015	1779		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7248	0.304	1014	0.243		4.0			8		21			1015	1786		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7416	0.385	1012	0.241		4.0			8		24			1013	1774		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7466	0.955	1010	0.597		4.0			8		32			1011	1808		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7867	0.520	1010	0.520		4.0			8		15			1011	1769		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.7972	0.541	1010	0.433		4.0			8		25			1011	1785		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8324	0.597	1012	0.597		4.0			8		24			1013	1804		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8345	0.580	1014	0.580		4.0			8		23			1015	1825		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8496	0.687	1014	0.549		4.0			8		29			1015	1793		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8643	0.311	1014	0.311		4.0			8		19			1015	1797		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8817	0.529	1012	0.331		4.0			8		29			1013	1796		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8882	0.396	1010	0.247		4.0			8		26			1011	1792		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8906	0.411	1014	0.329		4.0			8		26			1015	1798		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.8929	0.901	1012	0.563		4.0			8		31			1013	1775		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9046	0.915	1010	0.572		4.0			8		19			1011	1794		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9100	0.643	1010	0.514		4.0			8		25			1011	1782		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9123	0.492	1010	0.393		4.0			8		22			1011	1783		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9191	0.465	1014	0.291		4.0			8		25			1015	1772		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9207	0.608	1010	0.380		4.0			8		31			1011	1799		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9245	0.207	1010	0.207		4.0			8		26			1011	1773		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9282	0.526	1010	0.329		4.0			9		22			1011	1807		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9388	0.307	1012	0.245		4.0			8		24			1013	1823		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9468	0.317	1014	0.253		4.0			8		28			1015	1829		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9634	0.717	1012	0.448		4.0			8		24			1013	1817		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9661	0.336	1014	0.210		4.0			8		35			1015	1788		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9771	0.678	1010	0.424		4.0			8		17			1011	1801		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9819	0.942	1014	0.589		4.0			9		33			1015	1806		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9828	0.297	1014	0.297		4.0			8		22			1015	1810		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9828	0.301	1010	0.241		4.0			9		22			1011	1805		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9832	0.534	1012	0.427		4.0			9		28			1013	1818		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	53.9835	0.457	1014	0.457		4.0			9		20			1015	1822		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0071	0.636	1010	0.398		4.0			8		28			1011	1821		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0108	0.416	1012	0.260		4.0			8		24			1013	1784		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0313	0.215	1012	0.172		4.0			8		28			1013	1791		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0317	0.672	1014	0.538		4.0			8		14			1015	1803		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0365	0.367	1010	0.293		4.0			9		26			1011	1800		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0398	0.709	1010	0.567		4.0			8		19			1011	1777		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0404	0.486	1012	0.304		4.0			9		25			1013	1816		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0584	0.238	1014	0.238		4.0			9		29			1015	1795		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0858	0.617	1010	0.385		4.0			9		26			1011	1826		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.0984	0.314	1014	0.314		4.0			9		30			1015	1828		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1006	0.279	1012	0.223		4.0			8		31			1013	1787		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1223	0.350	1010	0.350		4.0			8		25			1011	1812		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1349	0.912	1014	0.570		4.0			8		22			1015	1820		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1419	0.742	1014	0.594		4.0			8		23			1015	1819		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1607	0.717	1012	0.574		4.0			8		28			1013	1778		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1740	0.202	1014	0.202		4.0			8		25			1015	1830		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.1847	0.250	1012	0.157		4.0			8		31			1013	1770		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.2158	0.726	1014	0.581		4.0			8		29			1015	1827		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.2542	0.458	1010	0.458		4.0			8		28			1011	1809		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.2683	0.427	1012	0.427		4.0			8		24			1013	1790		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.3085	0.725	1014	0.453		4.0			8		31			1015	1813		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.3276	0.216	1010	0.216		4.0			8		24			1011	1802		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.3540	0.298	1012	0.298		4.0			8		28			1013	1824		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.3702	0.797	1012	0.498		4.0			9		29			1013	1815		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.3726	0.571	1010	0.357		4.0			5		10			1011	2938		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.4926	0.208	1010	0.208		4.0			8		28			1011	1814		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.5296	0.287	1012	0.179		4.0			8		28			1013	1811		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.5415	0.887	1010	0.554		4.0			4		12			1011	2939		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.6548	0.312	1014	0.249		4.0			5		30			1015	2940		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.8553	0.732	1012	0.458		4.0			8		27			1013	1839		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9246	0.335	1010	0.335		4.0			8		29			1011	1832		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9284	0.725	1014	0.453		4.0			4		34			1015	2941		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9353	0.354	1012	0.283		4.0			9		23			1013	1841		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9508	0.698	1014	0.559		4.0			5		50			1015	2943		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9521	0.449	1012	0.360		4.0			5		25			1013	2942		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	54.9755	0.474	1014	0.379		4.0			4		10			1015	2944		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0141	0.631	1012	0.505		4.0			5		38			1013	2946		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0352	0.631	1010	0.505		4.0			5		11			1011	2952		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0377	0.926	1014	0.579		4.0			5		29			1015	2947		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0396	0.579	1010	0.579		4.0			4		17			1011	2950		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0562	0.794	1010	0.496		4.0			5		1			1011	2945		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0581	0.757	1014	0.473		4.0			5		26			1015	2951		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0656	0.527	1014	0.421		4.0			5		37			1015	2949		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.0905	0.330	1010	0.264		4.0			5		36			1011	2948		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2131	0.492	1012	0.394		4.0			8		24			1013	1843		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.2788	0.857	1014	0.536		4.0			8		27			1015	1834		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3172	0.305	1012	0.191		4.0			5		21			1013	2955		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3184	0.431	1010	0.345		4.0			8		18			1011	1840		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3611	0.269	1012	0.168		4.0			8		34			1013	1836		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3859	0.813	1010	0.508		4.0			9		25			1011	1835		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.3883	0.369	1010	0.295		4.0			5		26			1011	2953		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4037	0.389	1014	0.389		4.0			4		29			1015	2954		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4133	0.842	1014	0.526		4.0			5		18			1015	2956		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4168	0.308	1010	0.247		4.0			4		25			1011	2957		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4206	0.440	1010	0.440		4.0			9		27			1011	1831		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.4225	0.409	1010	0.409		4.0			5		31			1011	2958		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.5510	0.576	1010	0.360		4.0			8		30			1011	1837		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.5613	0.930	1014	0.581		4.0			8		22			1015	1838		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.6137	0.666	1010	0.416		4.0			8		25			1011	1842		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	55.7310	0.341	1014	0.273		4.0			8		25			1015	1833		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2426	0.529	1014	0.529		4.0			5		18			1015	2960		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2521	0.607	1014	0.379		4.0			5		26			1015	2961		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2699	0.449	1014	0.449		4.0			5		11			1015	2964		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2798	0.582	1014	0.465		4.0			5		22			1015	2963		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.2877	0.375	1010	0.375		4.0			5		37			1011	2959		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.3704	0.258	1012	0.258		4.0			5		35			1013	2962		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.3972	0.709	1010	0.567		4.0			5		33			1011	2965		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.4878	0.282	1014	0.225		4.0			5		23			1015	2968		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.5347	0.222	1010	0.222		4.0			5		38			1011	2967		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.5654	0.599	1014	0.599		4.0			5		32			1015	2966		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	56.5769	0.574	1010	0.459		4.0			4		39			1011	2969		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.4369	0.479	1012	0.479		4.0			4		28			1013	2970		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.4384	0.189	1010	0.151		4.0			5		21			1011	2971		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.4686	0.365	1012	0.365		4.0			5		21			1013	2976		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5837	0.607	1012	0.380		4.0			5		18			1013	2972		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5859	0.496	1014	0.496		4.0			5		39			1015	2973		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.5981	0.678	1010	0.542		4.0			5		42			1011	2975		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	57.6370	0.259	1014	0.259		4.0			5		23			1015	2974		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0574	0.689	1012	0.430		4.0			5		18			1013	2978		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.0896	0.465	1010	0.465		4.0			5		28			1011	2977		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.1008	0.459	1010	0.367		4.0			5		37			1011	2979		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.4815	0.466	1010	0.292		4.0			5		21			1011	2980		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.6115	0.401	1012	0.401		4.0			8		23			1013	1851		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.6174	0.455	1012	0.284		4.0			8		26			1013	1847		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.6870	0.595	1014	0.476		4.0			8		22			1015	1844		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.6979	0.897	1014	0.561		4.0			9		24			1015	1845		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7040	0.388	1014	0.388		4.0			8		25			1015	1852		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7549	0.734	1010	0.587		4.0			9		27			1011	1850		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.7597	0.261	1010	0.209		4.0			8		21			1011	1846		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.8033	0.212	1012	0.170		4.0			8		22			1013	1848		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.8644	0.205	1010	0.164		4.0			8		28			1011	1849		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	58.9227	0.394	1010	0.246		4.0			9		25			1011	1861		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.0793	0.511	1014	0.511		4.0			8		22			1015	1863		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.1440	0.661	1010	0.413		4.0			9		28			1011	1859		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.1483	0.404	1012	0.404		4.0			8		24			1013	1867		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2229	0.391	1010	0.313		4.0			8		22			1011	1918		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2594	0.290	1012	0.232		4.0			8		28			1013	1907		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2732	0.299	1014	0.239		4.0			8		23			1015	1877		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2827	0.812	1010	0.508		4.0			8		26			1011	1919		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.2848	0.274	1012	0.274		4.0			9		23			1013	1916		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3041	0.432	1010	0.432		4.0			9		22			1011	1879		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3780	0.693	1010	0.433		4.0			8		27			1011	1897		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.3960	0.659	1014	0.528		4.0			9		25			1015	1860		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4039	0.334	1014	0.268		4.0			8		25			1015	1895		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4239	0.160	1010	0.160		4.0			9		23			1011	1855		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4252	0.329	1010	0.205		4.0			5		8			1011	2982		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4287	0.415	1010	0.415		4.0			5		37			1011	2981		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4491	0.288	1014	0.288		4.0			8		26			1015	1883		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4617	0.308	1010	0.247		4.0			8		24			1011	1858		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4679	0.830	1012	0.519		4.0			8		26			1013	1870		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4698	0.627	1010	0.392		4.0			8		26			1011	1856		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4764	0.700	1010	0.437		4.0			8		29			1011	1946		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4846	0.310	1014	0.310		4.0			9		23			1015	1929		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4932	0.270	1010	0.169		4.0			8		23			1011	1903		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.4980	0.225	1010	0.225		4.0			8		28			1011	1871		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5117	0.365	1010	0.365		4.0			8		30			1011	1881		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5278	0.448	1014	0.448		4.0			8		22			1015	1866		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5408	0.622	1010	0.389		4.0			8		19			1011	1922		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5513	0.501	1012	0.313		4.0			9		26			1013	1914		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5572	0.389	1014	0.311		4.0			9		20			1015	1872		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5633	0.575	1014	0.460		4.0			9		16			1015	1864		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5641	0.502	1010	0.314		4.0			8		28			1011	1920		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5668	0.487	1014	0.304		4.0			9		29			1015	1885		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5713	0.670	1010	0.419		4.0			8		20			1011	1875		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5736	0.505	1010	0.316		4.0			9		27			1011	1900		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5767	0.303	1012	0.303		4.0			8		26			1013	1857		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5789	0.309	1010	0.248		4.0			8		22			1011	1891		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5827	0.330	1014	0.330		4.0			8		22			1015	1926		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5858	0.808	1010	0.505		4.0			8		24			1011	1865		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5881	0.607	1014	0.486		4.0			9		27			1015	1931		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5957	0.739	1014	0.462		4.0			8		19			1015	1904		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.5975	0.394	1010	0.394		4.0			8		28			1011	1868		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6060	0.672	1014	0.537		4.0			8		20			1015	1909		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6142	0.288	1014	0.288		4.0			8		23			1015	1887		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6195	0.710	1010	0.568		4.0			8		24			1011	1873		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6237	0.749	1010	0.468		4.0			9		23			1011	1899		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6365	0.559	1010	0.448		4.0			8		32			1011	1927		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6436	0.688	1014	0.550		4.0			8		30			1015	1884		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6507	0.194	1010	0.156		4.0			8		27			1011	1960		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6583	0.383	1010	0.306		4.0			8		23			1011	1853		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6631	0.263	1014	0.210		4.0			9		25			1015	1888		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6727	0.412	1014	0.412		4.0			9		24			1015	1882		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6903	0.549	1012	0.439		4.0			9		28			1013	1906		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6918	0.678	1010	0.542		4.0			8		22			1011	1869		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.6940	0.499	1010	0.499		4.0			8		24			1011	1910		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7042	0.204	1012	0.204		4.0			8		21			1013	1912		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7050	0.375	1012	0.300		4.0			8		32			1013	1896		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7068	0.347	1010	0.277		4.0			8		19			1011	1941		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7091	0.336	1014	0.336		4.0			8		24			1015	1905		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7211	0.189	1010	0.151		4.0			8		27			1011	1921		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7290	0.548	1012	0.548		4.0			9		27			1013	1917		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7320	0.218	1010	0.174		4.0			8		26			1011	1930		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7542	0.338	1014	0.270		4.0			8		19			1015	1901		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7615	0.370	1012	0.370		4.0			9		26			1013	1925		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7664	0.429	1012	0.429		4.0			5		34			1013	2984		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7668	0.766	1010	0.479		4.0			4		30			1011	2983		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7710	0.360	1010	0.225		4.0			8		22			1011	1898		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7790	0.666	1014	0.533		4.0			8		26			1015	1902		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7801	0.600	1010	0.600		4.0			9		27			1011	1880		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7866	0.521	1010	0.521		4.0			8		21			1011	1894		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7887	0.450	1012	0.281		4.0			8		22			1013	1913		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.7998	0.334	1014	0.267		4.0			8		28			1015	1886		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8124	0.211	1010	0.211		4.0			9		22			1011	1923		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8144	0.779	1014	0.487		4.0			8		17			1015	1862		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8205	0.405	1010	0.324		4.0			8		25			1011	1959		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8236	0.394	1010	0.315		4.0			9		30			1011	1892		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8256	0.271	1010	0.271		4.0			9		28			1011	1924		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8391	0.444	1012	0.444		4.0			9		32			1013	1908		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8557	0.485	1014	0.388		4.0			8		21			1015	1874		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8674	0.457	1010	0.366		4.0			9		24			1011	1956		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8736	0.384	1012	0.307		4.0			8		30			1013	1915		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.8858	0.619	1014	0.495		4.0			9		21			1015	1854		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9198	0.661	1010	0.413		4.0			8		18			1011	1890		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9239	0.390	1014	0.390		4.0			9		28			1015	1889		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9276	0.381	1010	0.238		4.0			8		31			1011	1954		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9353	0.325	1010	0.260		4.0			8		20			1011	1928		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9477	0.326	1012	0.326		4.0			9		21			1013	1893		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9543	0.518	1012	0.324		4.0			8		19			1013	1943		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9622	0.397	1014	0.248		4.0			8		25			1015	1939		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9623	0.670	1012	0.536		4.0			8		27			1013	1952		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9693	0.868	1010	0.543		4.0			8		25			1011	1911		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9940	0.304	1012	0.304		4.0			8		25			1013	1878		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	59.9958	0.440	1012	0.440		4.0			8		31			1013	1935		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0288	0.703	1012	0.563		4.0			8		28			1013	1876		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0715	0.155	1014	0.155		4.0			8		25			1015	1948		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0767	0.503	1012	0.402		4.0			8		27			1013	1949		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0820	0.718	1010	0.574		4.0			8		20			1011	1950		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.0853	0.823	1010	0.514		4.0			9		22			1011	1947		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1168	0.494	1014	0.494		4.0			8		26			1015	1945		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1187	0.489	1010	0.391		4.0			8		23			1011	1955		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1390	0.434	1010	0.347		4.0			9		23			1011	1932		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1414	0.533	1014	0.533		4.0			9		32			1015	1933		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1465	0.629	1014	0.503		4.0			8		27			1015	1934		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1564	0.501	1014	0.501		4.0			8		32			1015	1942		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1598	0.487	1014	0.304		4.0			9		21			1015	1936		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1606	0.465	1014	0.372		4.0			8		25			1015	1975		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1712	0.884	1014	0.552		4.0			9		38			1015	1937		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1718	0.566	1014	0.453		4.0			8		24			1015	1998		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.1974	0.759	1014	0.474		4.0			9		30			1015	1968		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2002	0.464	1010	0.464		4.0			8		19			1011	1974		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2082	0.643	1012	0.402		4.0			9		35			1013	1958		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2375	0.427	1014	0.427		4.0			8		24			1015	1944		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2858	0.807	1014	0.504		4.0			5		34			1015	2987		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.2929	0.604	1010	0.378		4.0			8		32			1011	1953		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3138	0.356	1010	0.356		4.0			8		26			1011	1982		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3180	0.564	1012	0.451		4.0			9		18			1013	1951		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3348	0.733	1014	0.586		4.0			8		23			1015	1992		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3397	0.246	1014	0.197		4.0			8		24			1015	1981		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3437	0.591	1014	0.472		4.0			9		26			1015	1966		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3450	0.677	1010	0.423		4.0			9		27			1011	1980		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3493	0.516	1014	0.323		4.0			5		18			1015	2989		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3544	0.325	1012	0.260		4.0			4		33			1013	2990		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3570	0.525	1012	0.525		4.0			4		40			1013	2986		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3577	0.780	1010	0.488		4.0			5		36			1011	2985		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3626	0.638	1010	0.511		4.0			8		28			1011	1986		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3720	0.618	1014	0.495		4.0			9		24			1015	1991		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3857	0.946	1014	0.591		4.0			8		25			1015	1940		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3872	0.647	1010	0.404		4.0			5		21			1011	2988		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.3932	0.747	1010	0.598		4.0			8		24			1011	1961		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4050	0.430	1010	0.430		4.0			8		18			1011	1973		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4106	0.395	1014	0.395		4.0			8		17			1015	1984		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4210	0.690	1010	0.552		4.0			8		23			1011	1957		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4303	0.219	1012	0.175		4.0			8		24			1013	2000		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4410	0.318	1014	0.318		4.0			8		27			1015	1967		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4618	0.151	1010	0.151		4.0			8		25			1011	1996		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4745	0.518	1010	0.324		4.0			8		25			1011	2005		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4863	0.387	1010	0.387		4.0			8		23			1011	2007		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.4896	0.470	1010	0.470		4.0			8		22			1011	1995		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5124	0.650	1014	0.520		4.0			9		22			1015	2002		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5362	0.229	1014	0.229		4.0			8		27			1015	1972		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5452	0.919	1012	0.574		4.0			9		29			1013	1970		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5547	0.468	1014	0.468		4.0			8		29			1015	2004		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5647	0.730	1014	0.584		4.0			8		20			1015	1977		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5659	0.352	1010	0.220		4.0			8		22			1011	1983		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.5721	0.232	1014	0.186		4.0			8		28			1015	1978		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6107	0.192	1010	0.154		4.0			8		29			1011	1990		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6181	0.218	1010	0.218		4.0			8		26			1011	1963		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6567	0.617	1010	0.386		4.0			9		32			1011	1988		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6753	0.438	1010	0.438		4.0			8		24			1011	2008		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6754	0.373	1014	0.373		4.0			8		25			1015	1969		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6805	0.324	1010	0.202		4.0			8		22			1011	1994		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6872	0.283	1014	0.226		4.0			9		28			1015	1987		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6924	0.657	1014	0.411		4.0			8		24			1015	2009		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6932	0.357	1010	0.357		4.0			9		28			1011	1989		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.6939	0.526	1012	0.329		4.0			8		26			1013	2013		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7022	0.811	1012	0.507		4.0			8		26			1013	1962		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7161	0.699	1012	0.437		4.0			8		29			1013	1976		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7172	0.665	1014	0.532		4.0			8		23			1015	2006		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7391	0.518	1014	0.414		4.0			8		27			1015	2014		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7628	0.279	1012	0.279		4.0			8		30			1013	1964		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7663	0.524	1014	0.524		4.0			8		24			1015	1985		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7740	0.218	1012	0.218		4.0			8		25			1013	1999		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.7982	0.595	1010	0.595		4.0			8		25			1011	2011		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8146	0.240	1010	0.192		4.0			8		25			1011	1997		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8169	0.538	1010	0.538		4.0			8		24			1011	1965		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8175	0.247	1012	0.247		4.0			8		29			1013	2016		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8240	0.507	1014	0.507		4.0			5		29			1015	2992		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8255	0.632	1014	0.505		4.0			9		23			1015	2015		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8277	0.822	1014	0.514		4.0			8		27			1015	1979		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8370	0.890	1014	0.556		4.0			5		28			1015	2991		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8389	0.325	1010	0.325		4.0			5		14			1011	2994		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8565	0.264	1010	0.211		4.0			4		19			1011	2993		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8604	0.250	1010	0.200		4.0			8		27			1011	2001		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.8933	0.488	1014	0.305		4.0			8		29			1015	2012		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.9059	0.651	1014	0.521		4.0			8		27			1015	1993		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.9351	0.400	1010	0.320		4.0			8		30			1011	1971		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	60.9699	0.256	1010	0.256		4.0			8		23			1011	2003		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.0238	0.631	1010	0.504		4.0			8		21			1011	2010		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.1627	0.256	1014	0.256		4.0			9		29			1015	1938		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.7138	0.366	1012	0.229		4.0			9		22			1013	2043		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.8130	0.910	1014	0.569		4.0			8		22			1015	2040		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.8314	0.528	1010	0.423		4.0			8		27			1011	2018		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.8706	0.297	1014	0.238		4.0			8		29			1015	2035		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9039	0.649	1010	0.406		4.0			8		25			1011	2067		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9043	0.594	1010	0.594		4.0			8		28			1011	2050		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9172	0.347	1014	0.278		4.0			9		23			1015	2062		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9263	0.534	1014	0.427		4.0			9		27			1015	2046		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9328	0.590	1014	0.472		4.0			8		22			1015	2041		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	61.9333	0.252	1012	0.157		4.0			8		26			1013	2084		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0057	0.497	1010	0.397		4.0			8		18			1011	2036		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0366	0.194	1012	0.194		4.0			9		26			1013	2025		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0557	0.494	1014	0.494		4.0			8		26			1015	2034		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0832	0.382	1010	0.306		4.0			9		25			1011	2026		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0853	0.407	1010	0.326		4.0			9		24			1011	2047		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0914	0.444	1010	0.355		4.0			9		26			1011	2030		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.0926	0.542	1014	0.339		4.0			8		25			1015	2019		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1158	0.216	1012	0.173		4.0			8		29			1013	2068		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1262	0.373	1012	0.373		4.0			9		21			1013	2017		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1292	0.416	1014	0.416		4.0			8		25			1015	2060		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1489	0.857	1012	0.536		4.0			8		29			1013	2042		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1518	0.915	1010	0.572		4.0			8		24			1011	2021		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1557	0.859	1014	0.537		4.0			9		26			1015	2044		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1589	0.437	1014	0.273		4.0			9		20			1015	2059		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1627	0.285	1012	0.228		4.0			8		24			1013	2081		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1655	0.306	1012	0.306		4.0			8		29			1013	2033		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.1893	0.497	1010	0.397		4.0			8		22			1011	2048		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2060	0.407	1012	0.407		4.0			8		22			1013	2028		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2079	0.694	1014	0.434		4.0			8		18			1015	2065		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2081	0.189	1012	0.151		4.0			9		26			1013	2038		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2102	0.451	1014	0.451		4.0			8		16			1015	2039		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2223	0.687	1012	0.429		4.0			8		28			1013	2078		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2223	0.529	1012	0.529		4.0			9		24			1013	2061		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2268	0.448	1014	0.448		4.0			8		22			1015	2051		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2370	0.764	1010	0.477		4.0			8		23			1011	2075		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2591	0.381	1012	0.381		4.0			9		20			1013	2023		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2745	0.334	1012	0.267		4.0			9		25			1013	2076		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2899	0.641	1012	0.513		4.0			9		23			1013	2037		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.2957	0.529	1012	0.423		4.0			8		20			1013	2056		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3178	0.435	1010	0.348		4.0			8		24			1011	2071		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3207	0.233	1012	0.186		4.0			8		22			1013	2022		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3246	0.591	1012	0.473		4.0			9		26			1013	2054		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3257	0.904	1010	0.565		4.0			8		26			1011	2073		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3325	0.545	1010	0.545		4.0			8		28			1011	2024		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3432	0.156	1012	0.156		4.0			8		25			1013	2045		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3539	0.196	1012	0.196		4.0			9		27			1013	2058		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3541	0.341	1012	0.273		4.0			8		23			1013	2052		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3632	0.343	1012	0.215		4.0			8		17			1013	2057		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3683	0.406	1010	0.406		4.0			8		31			1011	2077		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3752	0.515	1012	0.412		4.0			8		30			1013	2070		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3796	0.713	1012	0.570		4.0			8		28			1013	2079		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3804	0.853	1012	0.533		4.0			8		27			1013	2083		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3812	0.289	1012	0.231		4.0			9		27			1013	2072		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.3826	0.348	1014	0.348		4.0			9		22			1015	2063		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4033	0.300	1010	0.188		4.0			9		26			1011	2087		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4110	0.266	1010	0.266		4.0			8		28			1011	2085		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4209	0.795	1012	0.497		4.0			8		22			1013	2055		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4371	0.704	1010	0.563		4.0			8		25			1011	2032		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4381	0.609	1012	0.381		4.0			8		33			1013	2029		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4494	0.308	1012	0.193		4.0			8		22			1013	2027		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4518	0.422	1012	0.337		4.0			8		32			1013	2066		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.4952	0.349	1012	0.218		4.0			8		28			1013	2074		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5127	0.501	1010	0.401		4.0			9		22			1011	2049		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5351	0.390	1012	0.244		4.0			8		20			1013	2053		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5369	0.782	1012	0.489		4.0			8		21			1013	2031		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.5673	0.472	1010	0.472		4.0			9		22			1011	2020		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6174	0.381	1012	0.381		4.0			8		21			1013	2086		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.6199	0.259	1010	0.259		4.0			9		23			1011	2064		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.7483	0.464	1010	0.371		4.0			4		17			1011	2995		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.8080	0.417	1012	0.417		4.0			8		24			1013	2069		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.8582	0.569	1014	0.455		4.0			9		22			1015	2082		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	62.8701	0.539	1012	0.337		4.0			9		30			1013	2080		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.7256	0.526	1012	0.526		4.0			8		23			1013	2099		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.7544	0.247	1014	0.198		4.0			9		20			1015	2098		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8198	0.490	1012	0.490		4.0			8		19			1013	2089		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8447	0.453	1012	0.453		4.0			5		33			1013	2998		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.8850	0.802	1010	0.501		4.0			8		27			1011	2094		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9179	0.480	1012	0.480		4.0			9		30			1013	2100		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9371	0.605	1014	0.378		4.0			5		1			1015	2997		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9569	0.585	1014	0.468		4.0			8		26			1015	2112		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	64.9617	0.348	1014	0.348		4.0			5		26			1015	2996		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.0314	0.352	1012	0.220		4.0			9		24			1013	2093		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.0384	0.806	1012	0.504		4.0			8		28			1013	2111		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.0438	0.681	1012	0.545		4.0			8		26			1013	2096		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.0544	0.357	1014	0.357		4.0			8		28			1015	2090		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.0796	0.237	1010	0.190		4.0			8		21			1011	2095		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1343	0.509	1014	0.509		4.0			8		20			1015	2097		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1414	0.209	1012	0.209		4.0			8		28			1013	2088		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1709	0.634	1012	0.507		4.0			8		32			1013	2091		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1740	0.452	1014	0.452		4.0			8		27			1015	2164		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1939	0.419	1012	0.335		4.0			8		26			1013	2181		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.1956	0.503	1012	0.503		4.0			9		24			1013	2105		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2297	0.350	1012	0.219		4.0			8		25			1013	2207		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2358	0.896	1010	0.560		4.0			9		30			1011	2122		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2574	0.367	1010	0.367		4.0			9		22			1011	2101		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2937	0.303	1010	0.303		4.0			8		22			1011	2117		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.2974	0.824	1014	0.515		4.0			8		27			1015	2219		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3296	0.187	1012	0.187		4.0			9		19			1013	2104		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3448	0.215	1010	0.215		4.0			9		26			1011	2108		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3602	0.663	1010	0.531		4.0			9		26			1011	2107		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3657	0.188	1012	0.188		4.0			8		23			1013	2128		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3842	0.901	1012	0.563		4.0			9		26			1013	2144		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3952	0.409	1010	0.255		4.0			9		24			1011	2220		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3969	0.736	1010	0.460		4.0			9		29			1011	2165		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.3972	0.562	1014	0.351		4.0			8		24			1015	2130		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4239	0.776	1012	0.485		4.0			9		27			1013	2133		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4255	0.257	1014	0.206		4.0			8		27			1015	2120		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4290	0.270	1012	0.169		4.0			9		29			1013	2127		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4380	0.319	1014	0.319		4.0			8		23			1015	2138		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4527	0.308	1014	0.192		4.0			8		27			1015	2146		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4545	0.589	1010	0.589		4.0			8		27			1011	2163		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4590	0.709	1010	0.567		4.0			9		18			1011	2116		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4591	0.227	1012	0.182		4.0			8		23			1013	2151		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4592	0.392	1014	0.313		4.0			9		25			1015	2129		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4660	0.621	1014	0.388		4.0			8		27			1015	2102		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4663	0.313	1010	0.250		4.0			8		26			1011	2092		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4690	0.605	1012	0.484		4.0			9		20			1013	2147		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4715	0.155	1010	0.155		4.0			9		26			1011	2143		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4735	0.906	1012	0.566		4.0			9		25			1013	2118		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4786	0.259	1014	0.208		4.0			8		24			1015	2152		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4908	0.409	1010	0.256		4.0			9		22			1011	2115		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4960	0.291	1012	0.291		4.0			8		15			1013	2160		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.4964	0.885	1012	0.553		4.0			8		27			1013	2142		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5053	0.512	1012	0.320		4.0			9		26			1013	2149		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5091	0.173	1010	0.173		4.0			8		23			1011	2161		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5113	0.938	1010	0.586		4.0			8		27			1011	2110		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5115	0.609	1014	0.487		4.0			8		25			1015	2217		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5127	0.794	1014	0.496		4.0			9		28			1015	2123		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5131	0.584	1014	0.584		4.0			8		31			1015	2132		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5244	0.765	1014	0.478		4.0			9		27			1015	2139		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5385	0.685	1010	0.548		4.0			9		24			1011	2136		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5429	0.479	1014	0.479		4.0			8		25			1015	2157		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5435	0.582	1012	0.466		4.0			8		23			1013	2156		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5477	0.203	1014	0.162		4.0			8		25			1015	2134		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5512	0.627	1010	0.392		4.0			9		27			1011	2155		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5554	0.215	1012	0.215		4.0			9		27			1013	2153		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5563	0.237	1010	0.237		4.0			9		25			1011	2125		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5567	0.464	1014	0.290		4.0			8		22			1015	2170		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5715	0.290	1012	0.290		4.0			8		23			1013	2113		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5829	0.718	1010	0.575		4.0			8		24			1011	2191		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5879	0.691	1012	0.552		4.0			8		21			1013	2212		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5927	0.555	1014	0.555		4.0			9		26			1015	2119		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.5983	0.600	1010	0.600		4.0			8		23			1011	2199		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6200	0.698	1012	0.436		4.0			8		26			1013	2174		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6248	0.176	1014	0.176		4.0			9		27			1015	2103		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6456	0.375	1014	0.234		4.0			8		28			1015	2124		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6507	0.781	1014	0.488		4.0			8		26			1015	2214		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6563	0.323	1014	0.323		4.0			9		18			1015	2177		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6585	0.351	1010	0.351		4.0			8		27			1011	2148		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6588	0.769	1010	0.480		4.0			8		29			1011	2204		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6617	0.210	1010	0.210		4.0			8		23			1011	2106		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6697	0.341	1014	0.341		4.0			8		24			1015	2150		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6741	0.509	1012	0.509		4.0			9		24			1013	2189		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6802	0.728	1010	0.455		4.0			8		29			1011	2172		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6825	0.420	1012	0.336		4.0			9		21			1013	2135		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.6968	0.590	1014	0.472		4.0			8		21			1015	2109		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7011	0.294	1012	0.184		4.0			9		28			1013	2179		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7144	0.366	1012	0.366		4.0			8		29			1013	2196		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7164	0.475	1014	0.380		4.0			8		25			1015	2175		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7166	0.704	1014	0.440		4.0			8		25			1015	2216		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7167	0.388	1010	0.388		4.0			8		25			1011	2126		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7347	0.686	1010	0.429		4.0			8		25			1011	2166		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7386	0.497	1014	0.497		4.0			9		24			1015	2178		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7410	0.926	1010	0.579		4.0			8		25			1011	2121		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7506	0.620	1014	0.388		4.0			8		28			1015	2158		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7600	0.557	1010	0.557		4.0			8		21			1011	2211		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7637	0.791	1012	0.494		4.0			8		28			1013	2171		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7647	0.424	1010	0.424		4.0			8		25			1011	2188		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7742	0.814	1010	0.509		4.0			9		24			1011	2193		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7743	0.598	1012	0.598		4.0			8		21			1013	2176		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7796	0.192	1010	0.192		4.0			8		23			1011	2187		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.7920	0.250	1010	0.156		4.0			9		26			1011	2167		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8039	0.398	1014	0.249		4.0			8		25			1015	2141		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8085	0.540	1010	0.540		4.0			9		27			1011	2154		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8139	0.581	1012	0.363		4.0			8		27			1013	2208		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8160	0.448	1014	0.358		4.0			9		23			1015	2192		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8213	0.758	1012	0.474		4.0			9		29			1013	2201		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8273	0.160	1014	0.160		4.0			9		25			1015	2168		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8395	0.609	1010	0.487		4.0			8		23			1011	2131		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8398	0.558	1010	0.446		4.0			8		26			1011	2213		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8462	0.644	1010	0.402		4.0			8		26			1011	2183		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8528	0.508	1012	0.406		4.0			8		24			1013	2184		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8587	0.296	1010	0.296		4.0			9		22			1011	2228		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8679	0.251	1014	0.157		4.0			8		27			1015	2114		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8894	0.351	1010	0.351		4.0			8		21			1011	2205		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.8966	0.250	1012	0.156		4.0			9		23			1013	2203		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9014	0.345	1014	0.345		4.0			9		22			1015	2202		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9098	0.517	1012	0.323		4.0			8		23			1013	2229		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9122	0.631	1012	0.394		4.0			8		25			1013	2173		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9123	0.482	1014	0.301		4.0			8		25			1015	2194		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9194	0.621	1012	0.497		4.0			9		22			1013	2218		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9209	0.203	1012	0.203		4.0			8		26			1013	2159		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9215	0.321	1012	0.201		4.0			8		19			1013	2137		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9369	0.372	1012	0.372		4.0			8		26			1013	2182		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9378	0.775	1010	0.484		4.0			8		24			1011	2210		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9622	0.499	1010	0.399		4.0			8		21			1011	2169		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9630	0.594	1012	0.594		4.0			9		27			1013	2197		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9845	0.447	1010	0.358		4.0			9		24			1011	2145		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	65.9938	0.506	1012	0.506		4.0			8		27			1013	2209		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0099	0.479	1012	0.383		4.0			9		29			1013	2180		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0185	0.269	1014	0.215		4.0			8		21			1015	2140		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0200	0.313	1010	0.250		4.0			8		26			1011	2221		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0258	0.226	1012	0.181		4.0			9		28			1013	2206		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0381	0.541	1014	0.541		4.0			8		26			1015	2237		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0433	0.282	1010	0.282		4.0			9		32			1011	2186		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0504	0.954	1010	0.596		4.0			8		21			1011	2257		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0574	0.677	1012	0.542		4.0			9		24			1013	2222		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0622	0.186	1014	0.186		4.0			9		26			1015	2195		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0781	0.748	1012	0.467		4.0			9		26			1013	2242		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.0987	0.260	1014	0.260		4.0			8		28			1015	2198		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.1471	0.412	1012	0.412		4.0			8		21			1013	2235		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.1643	0.460	1012	0.368		4.0			9		25			1013	2227		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.1734	0.571	1012	0.357		4.0			8		25			1013	2266		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.1849	0.570	1012	0.570		4.0			8		26			1013	2226		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.1952	0.896	1014	0.560		4.0			8		26			1015	2245		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2029	0.257	1012	0.205		4.0			8		22			1013	2268		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2141	0.939	1012	0.587		4.0			8		24			1013	2225		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2193	0.250	1014	0.250		4.0			9		31			1015	2250		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2223	0.371	1014	0.232		4.0			8		26			1015	2230		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2268	0.538	1012	0.538		4.0			8		25			1013	2247		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2329	0.923	1012	0.577		4.0			8		26			1013	2241		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2479	0.724	1010	0.579		4.0			8		25			1011	2185		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2669	0.358	1012	0.358		4.0			9		26			1013	2261		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2750	0.548	1010	0.548		4.0			8		28			1011	2243		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.2879	0.323	1014	0.202		4.0			8		25			1015	2190		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3041	0.866	1010	0.541		4.0			9		26			1011	2223		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3232	0.702	1010	0.439		4.0			9		21			1011	2240		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3340	0.454	1012	0.284		4.0			8		27			1013	2271		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3374	0.385	1014	0.308		4.0			8		26			1015	2215		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3432	0.476	1012	0.381		4.0			9		28			1013	2234		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3447	0.236	1014	0.236		4.0			9		27			1015	2231		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3506	0.317	1014	0.317		4.0			9		24			1015	2249		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3556	0.470	1014	0.470		4.0			8		25			1015	2162		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3559	0.283	1014	0.226		4.0			8		29			1015	2238		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3672	0.737	1012	0.590		4.0			9		31			1013	2236		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3689	0.210	1010	0.168		4.0			8		22			1011	2232		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3791	0.319	1014	0.255		4.0			9		23			1015	2259		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3800	0.646	1014	0.516		4.0			9		26			1015	2200		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.3814	0.195	1014	0.156		4.0			8		25			1015	2251		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4041	0.308	1012	0.192		4.0			9		29			1013	2239		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4070	0.695	1010	0.435		4.0			9		29			1011	2254		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4071	0.282	1010	0.282		4.0			9		28			1011	2244		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4258	0.698	1014	0.436		4.0			8		24			1015	2248		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4276	0.320	1014	0.320		4.0			8		26			1015	2260		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4287	0.262	1014	0.262		4.0			9		23			1015	2288		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4467	0.171	1010	0.171		4.0			9		22			1011	2286		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4690	0.416	1010	0.416		4.0			9		27			1011	2233		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4797	0.542	1010	0.339		4.0			8		23			1011	2252		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4874	0.711	1014	0.444		4.0			9		27			1015	2224		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4951	0.290	1014	0.232		4.0			8		25			1015	2263		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.4957	0.593	1014	0.474		4.0			8		24			1015	2279		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5002	0.254	1014	0.254		4.0			8		25			1015	2256		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5134	0.334	1010	0.334		4.0			8		21			1011	2273		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5256	0.716	1010	0.448		4.0			9		21			1011	2262		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5463	0.375	1010	0.375		4.0			8		27			1011	2246		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5556	0.339	1012	0.339		4.0			9		22			1013	2270		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5725	0.158	1010	0.158		4.0			8		25			1011	2253		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5844	0.427	1012	0.427		4.0			8		28			1013	2275		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.5957	0.326	1014	0.204		4.0			9		23			1015	2274		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6139	0.554	1012	0.443		4.0			8		21			1013	2284		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6202	0.332	1014	0.266		4.0			8		26			1015	2258		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6374	0.356	1010	0.285		4.0			8		22			1011	2278		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6744	0.292	1014	0.182		4.0			8		27			1015	2267		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6909	0.542	1012	0.542		4.0			9		29			1013	2276		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.6937	0.268	1012	0.214		4.0			9		28			1013	2269		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.7125	0.704	1012	0.564		4.0			8		24			1013	2283		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.7172	0.537	1010	0.335		4.0			9		22			1011	2272		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.7974	0.583	1014	0.467		4.0			8		25			1015	2290		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.8000	0.667	1010	0.533		4.0			8		24			1011	2289		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.8152	0.675	1010	0.540		4.0			9		21			1011	2277		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.8209	0.622	1014	0.498		4.0			8		22			1015	2264		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.8212	0.228	1012	0.228		4.0			8		27			1013	2280		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9044	0.477	1010	0.298		4.0			5		23			1011	3001		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9099	0.397	1010	0.318		4.0			8		24			1011	2285		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9110	0.927	1010	0.580		4.0			4		22			1011	3000		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9219	0.568	1012	0.568		4.0			9		25			1013	2287		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9267	0.703	1010	0.439		4.0			5		25			1011	2999		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9448	0.776	1014	0.485		4.0			8		24			1015	2282		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9493	0.920	1014	0.575		4.0			8		19			1015	2255		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	66.9790	0.564	1010	0.451		4.0			8		30			1011	2281		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.0432	0.230	1012	0.184		4.0			8		31			1013	2265		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.1213	0.285	1014	0.228		4.0			5		17			1015	3004		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.1239	0.258	1014	0.161		4.0			4		33			1015	3003		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.2069	0.440	1012	0.352		4.0			5		22			1013	3002		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.4247	0.348	1012	0.279		4.0			5		14			1013	3005		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.5313	0.579	1010	0.579		4.0			4		37			1011	3008		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.5505	0.393	1010	0.246		4.0			4		17			1011	3009		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.5664	0.789	1012	0.493		4.0			4		25			1013	3007		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.5894	0.731	1014	0.585		4.0			4		8			1015	3011		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.6301	0.154	1014	0.154		4.0			5		38			1015	3006		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.6357	0.359	1014	0.287		4.0			4		24			1015	3010		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.7714	0.596	1014	0.477		4.0			8		23			1015	2297		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.8726	0.477	1014	0.477		4.0			8		22			1015	2346		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.8927	0.446	1010	0.446		4.0			8		28			1011	2291		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.9287	0.607	1014	0.485		4.0			8		26			1015	2329		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.9477	0.336	1014	0.336		4.0			9		26			1015	2340		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	67.9988	0.537	1010	0.537		4.0			9		25			1011	2313		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0062	0.942	1014	0.589		4.0			8		23			1015	2292		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0267	0.332	1014	0.332		4.0			9		26			1015	2336		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0270	0.487	1010	0.487		4.0			8		27			1011	2317		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0489	0.285	1012	0.228		4.0			9		23			1013	2341		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0506	0.398	1012	0.398		4.0			9		24			1013	2300		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0532	0.779	1010	0.487		4.0			9		27			1011	2312		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0548	0.748	1010	0.467		4.0			8		26			1011	2365		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.0814	0.546	1014	0.546		4.0			9		22			1015	2296		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1014	0.242	1014	0.242		4.0			9		27			1015	2328		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1037	0.585	1012	0.468		4.0			8		28			1013	2295		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1061	0.368	1014	0.230		4.0			8		29			1015	2293		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1067	0.282	1012	0.226		4.0			8		22			1013	2349		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1184	0.301	1010	0.301		4.0			8		25			1011	2294		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1205	0.536	1010	0.335		4.0			8		22			1011	2298		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1467	0.555	1010	0.347		4.0			8		23			1011	2320		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1540	0.743	1010	0.465		4.0			8		19			1011	2334		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1606	0.498	1014	0.398		4.0			8		25			1015	2364		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1720	0.706	1012	0.565		4.0			8		27			1013	2322		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1722	0.570	1010	0.356		4.0			8		28			1011	2308		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1735	0.271	1012	0.271		4.0			5		34			1013	3015		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1840	0.178	1014	0.178		4.0			9		22			1015	2316		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1853	0.598	1010	0.479		4.0			8		22			1011	2321		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1862	0.329	1012	0.206		4.0			9		29			1013	2350		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.1866	0.450	1012	0.450		4.0			9		23			1013	2314		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2154	0.700	1012	0.560		4.0			8		27			1013	2306		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2372	0.359	1010	0.224		4.0			8		28			1011	2310		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2422	0.416	1010	0.333		4.0			5		28			1011	3013		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2512	0.688	1010	0.430		4.0			5		30			1011	3012		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2517	0.743	1010	0.464		4.0			9		23			1011	2337		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2568	0.868	1010	0.542		4.0			9		22			1011	2311		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2591	0.819	1010	0.512		4.0			8		20			1011	2344		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.2609	0.603	1012	0.377		4.0			8		25			1013	2323		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3093	0.226	1014	0.181		4.0			9		22			1015	2315		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3264	0.404	1014	0.404		4.0			4		33			1015	3014		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3289	0.560	1012	0.350		4.0			8		25			1013	2318		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3299	0.539	1012	0.337		4.0			8		24			1013	2352		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3327	0.572	1012	0.572		4.0			8		28			1013	2339		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3616	0.332	1012	0.332		4.0			8		25			1013	2302		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3632	0.847	1012	0.529		4.0			8		29			1013	2330		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3709	0.588	1014	0.471		4.0			9		27			1015	2301		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3772	0.535	1010	0.428		4.0			9		21			1011	2327		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3795	0.576	1010	0.461		4.0			9		20			1011	2351		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3923	0.275	1012	0.275		4.0			8		22			1013	2299		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3964	0.262	1012	0.262		4.0			9		28			1013	2338		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.3994	0.189	1014	0.189		4.0			9		19			1015	2303		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4125	0.732	1010	0.586		4.0			9		26			1011	2305		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4173	0.448	1012	0.359		4.0			8		21			1013	2347		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4187	0.410	1014	0.328		4.0			9		21			1015	2304		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4217	0.523	1012	0.418		4.0			9		26			1013	2335		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4496	0.248	1014	0.248		4.0			9		21			1015	2361		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4500	0.406	1010	0.325		4.0			9		26			1011	2357		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4615	0.569	1012	0.356		4.0			9		25			1013	2332		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4646	0.466	1012	0.372		4.0			8		24			1013	2324		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4814	0.930	1014	0.581		4.0			8		23			1015	2355		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4881	0.165	1012	0.165		4.0			8		23			1013	2348		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.4955	0.180	1010	0.180		4.0			9		28			1011	2319		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5143	0.611	1010	0.489		4.0			8		25			1011	2363		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5438	0.718	1012	0.449		4.0			8		29			1013	2307		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5465	0.563	1010	0.563		4.0			8		24			1011	2366		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5513	0.226	1012	0.181		4.0			9		29			1013	2358		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5529	0.280	1014	0.224		4.0			8		21			1015	2343		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5558	0.360	1014	0.225		4.0			9		30			1015	2333		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5569	0.792	1014	0.495		4.0			9		22			1015	2353		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5709	0.613	1014	0.383		4.0			8		23			1015	2325		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5760	0.428	1010	0.428		4.0			8		24			1011	2345		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.5803	0.596	1014	0.477		4.0			8		26			1015	2359		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6059	0.588	1010	0.470		4.0			8		27			1011	2342		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6111	0.475	1010	0.475		4.0			8		24			1011	2331		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6303	0.862	1014	0.539		4.0			8		30			1015	2362		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6483	0.551	1014	0.441		4.0			9		29			1015	2368		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6632	0.189	1010	0.189		4.0			8		26			1011	2360		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.6859	0.324	1012	0.203		4.0			8		22			1013	2356		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.7545	0.440	1012	0.440		4.0			8		25			1013	2326		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.7905	0.372	1012	0.297		4.0			8		22			1013	2309		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.8013	0.711	1014	0.569		4.0			9		23			1015	2354		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.8734	0.954	1012	0.596		4.0			9		24			1013	2367		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9338	0.687	1014	0.549		4.0			5		32			1015	3016		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	68.9833	0.268	1012	0.167		4.0			5		13			1013	3017		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1252	0.407	1010	0.326		4.0			5		11			1011	3021		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1300	0.370	1010	0.296		4.0			4		25			1011	3022		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1665	0.517	1012	0.517		4.0			9		24			1013	2403		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1768	0.448	1014	0.448		4.0			5		9			1015	3019		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.1920	0.528	1012	0.423		4.0			4		18			1013	3018		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.2147	0.424	1010	0.424		4.0			5		14			1011	3020		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.2233	0.566	1014	0.453		4.0			9		25			1015	2401		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.3157	0.268	1014	0.167		4.0			8		22			1015	2373		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.3377	0.637	1010	0.398		4.0			4		19			1011	3023		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4033	0.429	1010	0.429		4.0			9		28			1011	2375		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4420	0.721	1012	0.577		4.0			8		22			1013	2388		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4436	0.359	1012	0.288		4.0			9		20			1013	2396		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4697	0.843	1014	0.527		4.0			8		26			1015	2389		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4911	0.846	1010	0.529		4.0			9		23			1011	2390		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.4938	0.326	1014	0.326		4.0			9		22			1015	2395		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.5180	0.512	1010	0.410		4.0			8		22			1011	2369		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.5801	0.167	1012	0.167		4.0			8		27			1013	2384		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.5897	0.306	1014	0.191		4.0			9		25			1015	2378		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6284	0.486	1014	0.389		4.0			8		23			1015	2383		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6445	0.246	1014	0.246		4.0			9		16			1015	2398		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6702	0.267	1010	0.213		4.0			8		24			1011	2370		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6925	0.552	1010	0.552		4.0			8		24			1011	2377		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6926	0.434	1014	0.434		4.0			8		25			1015	2406		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.6991	0.235	1014	0.235		4.0			8		29			1015	2372		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7016	0.671	1010	0.419		4.0			8		21			1011	2380		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7574	0.319	1014	0.199		4.0			8		25			1015	2399		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7655	0.234	1012	0.234		4.0			8		23			1013	2400		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7861	0.844	1010	0.528		4.0			8		23			1011	2405		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.7966	0.703	1010	0.440		4.0			8		23			1011	2379		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8054	0.765	1014	0.478		4.0			9		27			1015	2382		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8258	0.290	1012	0.290		4.0			9		24			1013	2387		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8304	0.214	1012	0.214		4.0			8		22			1013	2381		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8474	0.274	1012	0.219		4.0			8		27			1013	2376		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8496	0.372	1010	0.298		4.0			9		23			1011	2393		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.8698	0.219	1014	0.219		4.0			9		24			1015	2394		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.9032	0.343	1012	0.215		4.0			9		25			1013	2385		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.9328	0.192	1014	0.192		4.0			9		26			1015	2402		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	69.9527	0.394	1012	0.246		4.0			9		21			1013	2374		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.0372	0.573	1010	0.573		4.0			8		21			1011	2386		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.0539	0.557	1012	0.348		4.0			9		26			1013	2392		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.1552	0.632	1012	0.395		4.0			9		20			1013	2391		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.2092	0.294	1014	0.236		4.0			9		21			1015	2397		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.2210	0.342	1010	0.214		4.0			8		24			1011	2371		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.2847	0.513	1014	0.411		4.0			8		30			1015	2421		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.2968	0.665	1012	0.416		4.0			8		33			1013	2404		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.3787	0.402	1012	0.251		4.0			9		29			1013	2427		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6431	0.574	1014	0.459		4.0			9		27			1015	2435		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.6804	0.278	1010	0.174		4.0			8		25			1011	2439		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7063	0.169	1012	0.169		4.0			8		25			1013	2444		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7097	0.259	1014	0.207		4.0			9		26			1015	2423		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7179	0.590	1012	0.590		4.0			8		26			1013	2413		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7270	0.344	1010	0.275		4.0			8		22			1011	2426		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7366	0.497	1014	0.311		4.0			9		22			1015	2418		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.7808	0.205	1012	0.164		4.0			9		25			1013	2436		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8057	0.330	1010	0.330		4.0			9		26			1011	2443		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8080	0.949	1010	0.593		4.0			8		24			1011	2411		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8249	0.569	1014	0.569		4.0			9		26			1015	2440		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8296	0.445	1010	0.356		4.0			9		23			1011	2424		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8547	0.612	1012	0.489		4.0			8		21			1013	2445		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8722	0.779	1012	0.487		4.0			8		20			1013	2416		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.8749	0.268	1010	0.268		4.0			8		23			1011	2433		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9060	0.298	1014	0.238		4.0			8		25			1015	2417		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9087	0.207	1010	0.207		4.0			9		31			1011	2414		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9472	0.729	1014	0.583		4.0			9		23			1015	2452		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9571	0.817	1012	0.511		4.0			8		22			1013	2486		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9748	0.469	1014	0.469		4.0			8		21			1015	2489		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9803	0.388	1014	0.310		4.0			8		26			1015	2409		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9872	0.283	1010	0.283		4.0			8		27			1011	2442		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9911	0.297	1014	0.238		4.0			8		25			1015	2419		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9925	0.487	1010	0.305		4.0			9		25			1011	2412		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	70.9936	0.936	1012	0.585		4.0			8		25			1013	2407		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0028	0.390	1012	0.244		4.0			9		25			1013	2434		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0076	0.484	1014	0.387		4.0			8		23			1015	2432		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0209	0.406	1010	0.406		4.0			9		29			1011	2420		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0588	0.327	1012	0.204		4.0			8		25			1013	2474		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0853	0.231	1014	0.184		4.0			9		23			1015	2471		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.0892	0.296	1010	0.296		4.0			9		21			1011	2451		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1093	0.352	1012	0.220		4.0			9		22			1013	2410		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1159	0.495	1014	0.396		4.0			9		29			1015	2408		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1220	0.391	1014	0.313		4.0			9		22			1015	2431		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1385	0.292	1010	0.182		4.0			9		27			1011	2422		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1395	0.706	1010	0.565		4.0			9		28			1011	2415		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1427	0.252	1010	0.158		4.0			9		24			1011	2479		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1448	0.579	1010	0.463		4.0			8		28			1011	2484		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1598	0.577	1012	0.577		4.0			8		27			1013	2492		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1716	0.514	1014	0.514		4.0			8		24			1015	2429		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1900	0.405	1010	0.253		4.0			9		24			1011	2425		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.1952	0.637	1010	0.510		4.0			9		23			1011	2464		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2366	0.672	1010	0.537		4.0			8		24			1011	2460		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2512	0.281	1014	0.176		4.0			9		24			1015	2450		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2562	0.589	1014	0.589		4.0			9		22			1015	2470		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2600	0.340	1010	0.272		4.0			9		28			1011	2437		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2605	0.434	1010	0.271		4.0			8		23			1011	2428		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2618	0.294	1010	0.294		4.0			9		24			1011	2468		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2627	0.595	1014	0.595		4.0			9		26			1015	2458		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2714	0.747	1014	0.598		4.0			9		23			1015	2441		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2737	0.317	1014	0.198		4.0			9		23			1015	2477		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2758	0.289	1012	0.289		4.0			9		25			1013	2454		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2844	0.599	1012	0.599		4.0			8		26			1013	2482		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2885	0.187	1012	0.187		4.0			8		26			1013	2430		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.2916	0.255	1014	0.204		4.0			8		23			1015	2447		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3040	0.827	1010	0.517		4.0			9		27			1011	2448		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3147	0.603	1012	0.483		4.0			8		22			1013	2457		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3233	0.776	1010	0.485		4.0			8		21			1011	2467		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3352	0.301	1012	0.188		4.0			8		22			1013	2466		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3373	0.502	1012	0.502		4.0			9		20			1013	2481		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3505	0.414	1014	0.414		4.0			9		22			1015	2480		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3541	0.230	1012	0.184		4.0			9		25			1013	2461		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3715	0.514	1010	0.411		4.0			8		23			1011	2459		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3769	0.256	1014	0.205		4.0			9		24			1015	2456		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.3851	0.944	1012	0.590		4.0			9		23			1013	2533		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4034	0.563	1014	0.352		4.0			9		24			1015	2446		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4044	0.196	1010	0.196		4.0			9		22			1011	2465		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4167	0.416	1014	0.260		4.0			8		28			1015	2491		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4365	0.223	1010	0.178		4.0			8		22			1011	2473		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4419	0.627	1014	0.501		4.0			8		28			1015	2472		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4480	0.373	1014	0.373		4.0			9		26			1015	2488		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.4951	0.251	1012	0.201		4.0			9		29			1013	2515		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5020	0.337	1010	0.337		4.0			8		24			1011	2519		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5279	0.409	1014	0.327		4.0			9		26			1015	2506		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5314	0.581	1010	0.581		4.0			8		30			1011	2438		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5633	0.417	1014	0.417		4.0			8		23			1015	2476		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.5666	0.710	1012	0.568		4.0			8		27			1013	2485		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6016	0.586	1012	0.586		4.0			9		27			1013	2513		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6035	0.558	1010	0.558		4.0			8		21			1011	2475		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6040	0.294	1010	0.235		4.0			9		30			1011	2462		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6085	0.479	1010	0.479		4.0			8		27			1011	2511		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6282	0.526	1010	0.329		4.0			9		23			1011	2487		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6284	0.563	1014	0.563		4.0			9		21			1015	2455		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6321	0.478	1014	0.382		4.0			9		26			1015	2469		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6383	0.509	1010	0.509		4.0			8		25			1011	2514		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6627	0.593	1010	0.593		4.0			8		26			1011	2525		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6638	0.392	1014	0.313		4.0			8		24			1015	2529		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6850	0.838	1010	0.524		4.0			8		20			1011	2497		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.6955	0.516	1014	0.322		4.0			9		22			1015	2490		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7147	0.466	1012	0.291		4.0			8		27			1013	2527		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7324	0.458	1014	0.286		4.0			9		27			1015	2518		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7378	0.718	1012	0.449		4.0			8		24			1013	2504		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7436	0.460	1012	0.288		4.0			9		25			1013	2453		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7442	0.714	1010	0.446		4.0			9		26			1011	2536		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7534	0.521	1014	0.521		4.0			9		25			1015	2499		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7538	0.290	1014	0.290		4.0			9		24			1015	2523		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7576	0.853	1012	0.533		4.0			8		24			1013	2478		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7724	0.748	1012	0.598		4.0			9		27			1013	2449		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7808	0.631	1014	0.394		4.0			9		28			1015	2498		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7871	0.666	1010	0.416		4.0			9		24			1011	2508		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.7999	0.462	1012	0.289		4.0			8		23			1013	2528		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8006	0.610	1012	0.381		4.0			8		25			1013	2516		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8008	0.293	1012	0.234		4.0			8		25			1013	2503		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8026	0.419	1014	0.335		4.0			9		22			1015	2505		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8084	0.695	1012	0.556		4.0			8		28			1013	2535		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8122	0.232	1010	0.232		4.0			8		26			1011	2507		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8410	0.865	1012	0.540		4.0			8		25			1013	2495		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8458	0.657	1010	0.525		4.0			8		22			1011	2493		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8466	0.585	1012	0.468		4.0			5		26			1013	3024		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8673	0.412	1012	0.412		4.0			8		25			1013	2520		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8794	0.162	1010	0.162		4.0			9		25			1011	2524		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.8941	0.316	1014	0.197		4.0			8		20			1015	2522		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9097	0.383	1012	0.240		4.0			9		28			1013	2532		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9166	0.601	1014	0.481		4.0			9		25			1015	2534		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9268	0.567	1012	0.567		4.0			9		21			1013	2463		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9335	0.193	1014	0.154		4.0			8		24			1015	2521		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9366	0.848	1010	0.530		4.0			8		27			1011	2512		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9498	0.154	1014	0.154		4.0			8		28			1015	2483		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9683	0.510	1014	0.408		4.0			9		24			1015	2501		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9704	0.671	1012	0.537		4.0			8		28			1013	2526		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9785	0.180	1012	0.180		4.0			9		26			1013	2494		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9852	0.734	1012	0.459		4.0			4		27			1013	3025		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9862	0.907	1014	0.567		4.0			8		21			1015	2530		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9881	0.244	1014	0.195		4.0			8		26			1015	2510		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	71.9941	0.465	1010	0.465		4.0			8		28			1011	2496		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.0020	0.239	1012	0.239		4.0			9		23			1013	2500		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.0112	0.225	1014	0.225		4.0			8		21			1015	2502		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.0923	0.553	1014	0.442		4.0			8		29			1015	2537		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.1298	0.721	1010	0.577		4.0			8		23			1011	2509		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.2998	0.269	1010	0.168		4.0			8		23			1011	2531		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3221	0.335	1014	0.335		4.0			8		23			1015	2517		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.3923	0.808	1012	0.505		4.0			5		30			1013	3027		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.4932	0.230	1014	0.184		4.0			4		22			1015	3026		3				1			3			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.5077	0.475	1014	0.475		4.0			8		25			1015	2575		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.5092	0.509	1012	0.318		4.0			9		26			1013	2538		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.5917	0.667	1012	0.533		4.0			9		26			1013	2561		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.6837	0.554	1010	0.443		4.0			8		22			1011	2576		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.6906	0.432	1010	0.346		4.0			8		26			1011	2571		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.7208	0.689	1014	0.551		4.0			8		18			1015	2568		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.7244	0.347	1010	0.278		4.0			8		26			1011	2572		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.7294	0.535	1014	0.428		4.0			8		26			1015	2557		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.8956	0.178	1010	0.178		4.0			9		24			1011	2555		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9059	0.262	1010	0.164		4.0			8		24			1011	2544		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9172	0.423	1014	0.423		4.0			9		24			1015	2567		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9365	0.255	1014	0.255		4.0			9		26			1015	2540		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9518	0.484	1010	0.387		4.0			8		25			1011	2539		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9752	0.211	1012	0.169		4.0			9		24			1013	2569		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	72.9875	0.593	1012	0.371		4.0			9		23			1013	2560		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.0081	0.264	1014	0.165		4.0			8		26			1015	2554		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.0209	0.440	1010	0.275		4.0			8		26			1011	2559		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.0464	0.322	1010	0.322		4.0			9		24			1011	2546		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.0611	0.209	1010	0.167		4.0			8		24			1011	2542		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.0917	0.230	1010	0.184		4.0			9		23			1011	2573		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1322	0.704	1010	0.563		4.0			9		26			1011	2552		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1384	0.402	1010	0.402		4.0			9		24			1011	2562		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1755	0.819	1012	0.512		4.0			8		28			1013	2541		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.1834	0.348	1014	0.278		4.0			8		23			1015	2547		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2017	0.380	1010	0.380		4.0			8		25			1011	2543		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2061	0.443	1014	0.354		4.0			9		24			1015	2574		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2096	0.530	1014	0.530		4.0			8		22			1015	2558		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2475	0.589	1014	0.471		4.0			9		23			1015	2563		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2579	0.579	1014	0.463		4.0			9		26			1015	2556		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2744	0.349	1014	0.279		4.0			9		26			1015	2565		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.2893	0.400	1010	0.400		4.0			8		23			1011	2548		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3235	0.694	1010	0.556		4.0			8		24			1011	2578		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3318	0.225	1010	0.225		4.0			9		25			1011	2570		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3401	0.461	1014	0.461		4.0			9		25			1015	2564		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3457	0.436	1012	0.349		4.0			9		23			1013	2553		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3694	0.351	1014	0.281		4.0			8		25			1015	2610		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.3701	0.931	1010	0.582		4.0			8		26			1011	2551		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.4060	0.351	1014	0.220		4.0			8		23			1015	2611		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.4230	0.453	1010	0.283		4.0			8		26			1011	2597		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.4351	0.741	1010	0.463		4.0			9		26			1011	2550		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.5236	0.536	1014	0.429		4.0			9		24			1015	2587		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.5353	0.430	1010	0.430		4.0			8		25			1011	2583		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.6412	0.216	1014	0.216		4.0			9		27			1015	2604		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.6476	0.568	1012	0.454		4.0			9		26			1013	2545		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.6721	0.533	1014	0.533		4.0			9		23			1015	2580		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.7097	0.476	1014	0.297		4.0			8		27			1015	2599		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8216	0.585	1014	0.585		4.0			8		26			1015	2566		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8307	0.330	1010	0.330		4.0			9		20			1011	2549		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8361	0.854	1010	0.534		4.0			8		24			1011	2584		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8384	0.694	1010	0.555		4.0			9		21			1011	2600		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8608	0.280	1014	0.224		4.0			9		26			1015	2586		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.8828	0.235	1012	0.188		4.0			9		23			1013	2593		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9119	0.457	1010	0.366		4.0			8		24			1011	2603		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9186	0.623	1010	0.498		4.0			9		24			1011	2582		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9540	0.306	1014	0.306		4.0			9		23			1015	2581		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9549	0.735	1012	0.460		4.0			8		27			1013	2601		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9598	0.405	1014	0.405		4.0			8		25			1015	2605		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9730	0.557	1010	0.445		4.0			8		24			1011	2598		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9792	0.340	1014	0.212		4.0			9		26			1015	2596		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	73.9914	0.189	1014	0.189		4.0			8		24			1015	2590		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0140	0.491	1012	0.491		4.0			8		25			1013	2588		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0557	0.265	1014	0.166		4.0			8		22			1015	2592		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0637	0.560	1014	0.560		4.0			8		24			1015	2606		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0702	0.202	1014	0.162		4.0			9		24			1015	2579		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.0879	0.282	1012	0.226		4.0			8		23			1013	2602		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1317	0.687	1010	0.550		4.0			9		23			1011	2591		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1419	0.846	1014	0.529		4.0			8		29			1015	2609		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1458	0.292	1012	0.292		4.0			8		22			1013	2585		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1880	0.725	1014	0.580		4.0			8		26			1015	2607		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1948	0.509	1010	0.509		4.0			8		23			1011	2594		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.1957	0.435	1014	0.435		4.0			9		23			1015	2577		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.2101	0.525	1010	0.525		4.0			8		29			1011	2589		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.2624	0.491	1014	0.307		4.0			9		22			1015	2595		3				1			5			20			0.0000		75.000
;			at		dur		tab		armonica	dinamica	ottava	registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	env_attacco	env_durata
i "Voce"	74.2861	0.584	1014	0.584		4.0			8		23			1015	2608		3				1			5			20			0.0000		75.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
