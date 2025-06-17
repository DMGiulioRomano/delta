
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/gemini.wav" -W -d -m0
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
f 0 93.93995558903988 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1


; --- TABELLE DEGLI INVILUPPI DI ATTACCO ---
; ifn | nome        | descrizione
;--------------------------------------------------------------------------------
f 2 0 [2^20] 6 0 [2^19] 0.5 [2^19] 1 ; Envelope per il suono
f 3 0 [2^12] 6 0 [2^10] 0.5 [2^12-2^10] 1.0  ; Impulsivo:   Attacco rapidissimo, decadimento lento
f 4 0 [2^20] 6 0 [2^20-2^5] .5 [2^5] 1.0 ; Lento (Swell): Attacco lento, decadimento più rapido
f 5 0 [2^20] 6 0 [2^5] 0.5 [2^20-2^6] 0.5 [2^5] 1.0 ; Sostenuto: Attacco, lungo sustain al picco, decadimento

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 18 25 30
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 20 28 20
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 16 20 24
f 1005 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0010	41.264	1000	41.264		2			3		3			1001	3		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0014	44.260	1004	44.260		0			0		4			1005	8		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0020	55.903	1004	55.903		0			3		2			1005	4		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0025	41.777	1002	41.777		0			2		4			1003	5		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0031	41.360	1002	41.360		0			2		2			1003	2		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0031	57.741	1002	57.741		0			1		1			1003	7		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0038	56.460	1004	56.460		1			1		3			1005	6		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0063	54.664	1000	54.664		0			3		3			1001	1		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0125	57.566	1004	57.566		0			2		1			1005	9		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0134	45.892	1004	45.892		0			1		3			1005	11		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0171	52.388	1002	52.388		0			1		3			1003	10		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0267	54.654	1002	54.654		0			2		1			1003	12		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0324	48.417	1000	48.417		0			2		1			1001	13		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0518	42.963	1000	42.963		0			2		1			1001	14		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0526	55.005	1000	55.005		0			1		4			1001	15		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0557	41.414	1000	41.414		0			3		3			1001	16		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0831	45.655	1004	45.655		0			3		1			1005	17		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0833	56.405	1002	56.405		0			0		3			1003	19		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.0833	54.137	1000	54.137		0			2		3			1001	18		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1069	50.388	1000	50.388		0			1		3			1001	21		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1328	41.865	1000	41.865		0			1		5			1001	22		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1340	46.387	1002	46.387		0			1		2			1003	20		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1731	48.846	1000	48.846		1			0		1			1001	23		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1789	54.030	1000	54.030		0			2		2			1001	25		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.1793	59.133	1000	59.133		0			2		1			1001	24		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.2438	56.155	1000	56.155		0			2		2			1001	26		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3229	56.305	1000	56.305		0			2		4			1001	30		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3277	45.238	1002	45.238		0			3		3			1003	27		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3288	58.422	1002	58.422		2			2		3			1003	29		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.3332	41.013	1004	41.013		0			2		2			1005	28		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.4164	41.103	1004	41.103		1			3		4			1005	32		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.4222	49.004	1002	49.004		0			2		3			1003	33		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.4238	42.805	1004	42.805		2			3		4			1005	31		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.5335	45.884	1004	45.884		0			1		2			1005	34		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.5362	57.252	1002	57.252		0			3		2			1003	35		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.5413	50.954	1000	50.954		0			2		3			1001	36		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.6598	47.559	1000	47.559		1			3		4			1001	37		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.6738	59.489	1000	59.489		1			0		1			1001	39		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.6795	46.626	1002	46.626		1			1		4			1003	38		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.8176	57.097	1000	57.097		1			1		5			1001	40		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.9735	47.138	1004	47.138		0			2		4			1005	43		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.9928	59.521	1000	59.521		0			3		5			1001	41		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.9970	57.574	1000	57.574		1			2		2			1001	44		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	0.9993	40.527	1000	40.527		0			1		4			1001	42		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.1738	47.369	1000	47.369		0			2		1			1001	47		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.1745	49.676	1000	49.676		0			3		2			1001	45		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.2113	44.636	1002	44.636		0			2		5			1003	46		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4141	40.216	1004	40.216		0			1		4			1005	49		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4158	42.697	1002	42.697		0			2		5			1003	446		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4220	47.380	1004	47.380		0			0		1			1005	48		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4374	46.657	1000	46.657		0			2		5			1001	447		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4379	56.269	1004	56.269		1			1		6			1005	445		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.4499	53.384	1004	53.384		0			1		5			1005	444		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.6793	49.321	1002	49.321		1			2		3			1003	50		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	1.9382	52.400	1000	52.400		0			3		3			1001	51		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.2486	48.829	1000	48.829		0			2		2			1001	53		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.2556	57.198	1004	57.198		0			2		1			1005	54		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.2617	58.179	1000	58.179		0			1		2			1001	56		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.2731	50.398	1004	50.398		0			1		1			1005	55		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.2780	46.650	1002	46.650		0			1		1			1003	52		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.5800	40.713	1002	40.713		1			3		5			1003	57		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	2.9887	40.154	1000	40.154		0			3		2			1001	58		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.0155	54.531	1004	54.531		0			1		4			1005	443		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.0398	54.526	1004	54.526		1			1		1			1005	442		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.3593	48.343	1002	48.343		0			2		6			1003	60		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.3844	44.920	1002	44.920		0			1		1			1003	59		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.7878	45.620	1000	45.620		0			3		5			1001	64		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.7959	42.746	1004	42.746		0			2		5			1005	62		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.8028	41.055	1002	41.055		1			3		4			1003	61		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.8356	54.002	1004	54.002		0			3		5			1005	63		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.2588	48.592	1004	48.592		2			3		7			1005	65		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.2748	58.029	1000	58.029		0			1		3			1001	66		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.2938	56.393	1004	56.393		0			0		5			1005	67		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.7830	41.776	1002	41.776		2			2		5			1003	70		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.7859	44.392	1004	44.392		0			2		4			1005	71		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.7930	43.948	1002	43.948		0			1		4			1003	68		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.7957	52.394	1000	52.394		0			2		7			1001	439		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8141	44.273	1004	44.273		0			3		2			1005	69		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8219	40.331	1002	40.331		0			0		5			1003	438		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8292	40.958	1000	40.958		0			2		6			1001	441		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8307	45.280	1004	45.280		0			2		7			1005	437		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	4.8390	49.579	1002	49.579		0			2		2			1003	440		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.3396	55.990	1002	55.990		0			1		7			1003	73		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.3471	42.718	1002	42.718		0			2		2			1003	72		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.9083	44.412	1000	44.412		0			1		8			1001	75		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.9201	42.190	1002	42.190		0			1		7			1003	74		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.9256	54.058	1000	54.058		0			4		2			1001	76		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	5.9470	49.850	1004	49.850		0			2		1			1005	77		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5491	59.257	1002	59.257		0			3		2			1003	80		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5520	55.699	1000	55.699		1			2		9			1001	83		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5638	56.721	1004	56.721		1			4		6			1005	79		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5675	40.626	1002	40.626		0			2		2			1003	81		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5738	45.638	1002	45.638		1			1		3			1003	78		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5889	50.465	1000	50.465		0			2		2			1001	84		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.5991	48.128	1000	48.128		1			4		3			1001	82		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8845	55.951	1002	55.951		0			3		7			1003	435		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8856	53.162	1002	53.162		2			2		7			1003	434		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.9034	43.997	1004	43.997		0			1		7			1005	436		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.2252	47.262	1000	47.262		0			1		3			1001	87		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.2323	40.282	1002	40.282		0			3		7			1003	85		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.2442	53.181	1000	53.181		0			3		5			1001	86		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9598	47.514	1002	47.514		0			2		10			1003	93		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9639	59.083	1000	59.083		1			1		6			1001	90		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9666	48.290	1000	48.290		2			1		1			1001	89		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9837	46.955	1002	46.955		0			4		10			1003	91		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9842	48.282	1004	48.282		1			2		5			1005	92		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9904	47.955	1004	47.955		0			1		2			1005	88		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.7601	58.751	1004	58.751		0			2		7			1005	97		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.7672	58.620	1004	58.620		0			2		5			1005	94		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.7687	40.970	1004	40.970		0			1		10			1005	95		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.7691	52.528	1000	52.528		0			1		10			1001	96		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.3960	58.870	1004	58.870		0			4		11			1005	425		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4376	55.761	1000	55.761		0			3		2			1001	428		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4457	52.408	1004	52.408		0			4		9			1005	426		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4547	58.020	1004	58.020		0			3		3			1005	431		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4548	59.032	1004	59.032		0			2		7			1005	427		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4679	45.437	1004	45.437		0			4		5			1005	430		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4734	44.560	1000	44.560		1			3		7			1001	432		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4864	52.812	1000	52.812		0			4		5			1001	433		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.4866	42.188	1000	42.188		0			2		9			1001	429		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.5460	55.026	1000	55.026		1			2		8			1001	100		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.5535	54.756	1000	54.756		1			3		11			1001	101		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.5543	57.475	1004	57.475		0			1		10			1005	98		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.5907	51.780	1004	51.780		0			1		4			1005	99		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	9.6032	46.328	1000	46.328		0			2		4			1001	102		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.4339	52.770	1000	52.770		0			4		1			1001	106		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.4351	58.734	1000	58.734		0			2		11			1001	105		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.4479	41.826	1000	41.826		0			2		6			1001	104		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.4574	42.650	1004	42.650		0			3		9			1005	103		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	10.4817	59.627	1004	59.627		0			1		4			1005	107		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.3166	56.172	1004	56.172		0			1		6			1005	110		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.3682	54.910	1002	54.910		1			4		12			1003	109		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.3684	55.035	1000	55.035		0			3		3			1001	108		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	11.3793	45.796	1000	45.796		0			1		4			1001	111		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3072	50.867	1004	50.867		1			4		9			1005	114		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3093	54.896	1000	54.896		0			4		1			1001	116		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3118	44.872	1000	44.872		0			3		7			1001	112		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3176	57.540	1000	57.540		1			4		5			1001	115		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3216	55.391	1002	55.391		0			3		11			1003	118		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3310	51.000	1004	51.000		0			3		11			1005	117		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3428	55.337	1004	55.337		0			3		9			1005	113		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3481	48.926	1002	48.926		0			4		5			1003	119		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9553	49.376	1004	49.376		1			4		7			1005	423		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9868	51.895	1004	51.895		1			1		8			1005	421		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.0234	55.639	1002	55.639		0			2		11			1003	422		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.0429	41.875	1000	41.875		0			2		1			1001	424		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.3268	53.304	1002	53.304		0			2		10			1003	122		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.3377	54.705	1002	54.705		0			3		1			1003	120		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.3533	40.724	1004	40.724		1			1		5			1005	123		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.3685	59.180	1004	59.180		1			1		10			1005	124		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.4364	52.021	1002	52.021		0			1		12			1003	125		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	13.4535	48.577	1004	48.577		0			1		14			1005	121		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	14.4199	54.579	1004	54.579		0			1		13			1005	129		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	14.4329	44.961	1002	44.961		0			5		12			1003	130		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	14.4392	51.331	1002	51.331		0			4		7			1003	127		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	14.4573	48.347	1000	48.347		0			2		6			1001	128		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	14.4633	54.584	1002	54.584		0			3		5			1003	126		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.4780	58.759	1004	58.759		0			2		5			1005	133		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.5661	54.215	1004	54.215		0			4		2			1005	138		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.5741	47.861	1000	47.861		0			2		10			1001	132		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.5797	55.371	1002	55.371		1			2		5			1003	136		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.6003	47.743	1004	47.743		0			2		12			1005	134		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.6089	48.815	1000	48.815		1			4		11			1001	135		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.6233	40.394	1000	40.394		0			3		1			1001	131		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	15.6283	58.928	1000	58.928		0			4		8			1001	137		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.7815	43.916	1002	43.916		0			4		13			1003	146		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.7889	49.009	1002	49.009		0			2		10			1003	144		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.7970	43.039	1004	43.039		0			2		11			1005	143		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.7973	41.753	1000	41.753		0			3		2			1001	142		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.8039	42.140	1000	42.140		0			2		6			1001	141		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.8050	41.132	1000	41.132		0			3		3			1001	139		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.8121	48.187	1004	48.187		1			3		3			1005	140		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	16.8336	46.409	1002	46.409		0			2		8			1003	145		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	17.9430	50.651	1002	50.651		0			1		2			1003	151		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	17.9783	43.677	1002	43.677		0			4		2			1003	156		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	17.9998	41.955	1002	41.955		2			3		18			1003	148		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0017	56.985	1000	56.985		0			4		15			1001	149		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0032	58.361	1004	58.361		1			3		11			1005	147		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0243	53.893	1004	53.893		0			3		14			1005	154		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0377	53.995	1000	53.995		0			3		3			1001	158		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0465	49.332	1004	49.332		0			3		14			1005	150		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0588	52.261	1000	52.261		0			3		6			1001	155		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0667	56.381	1000	56.381		0			4		5			1001	153		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0702	40.683	1002	40.683		2			5		8			1003	157		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.0826	52.448	1002	52.448		0			3		13			1003	152		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.2820	42.054	1000	42.054		0			2		5			1001	161		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.3083	53.401	1002	53.401		0			2		19			1003	165		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.3103	54.559	1002	54.559		0			3		2			1003	162		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.3174	55.982	1004	55.982		0			4		7			1005	163		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.3359	59.625	1002	59.625		0			4		12			1003	160		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.3746	59.179	1000	59.179		0			3		6			1001	159		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	19.4223	46.976	1002	46.976		0			5		16			1003	164		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.6425	45.484	1002	45.484		1			2		16			1003	168		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7143	51.408	1000	51.408		0			3		19			1001	171		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7264	53.019	1000	53.019		0			3		2			1001	172		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7406	44.710	1002	44.710		0			3		10			1003	167		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7504	56.399	1002	56.399		0			4		8			1003	175		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7660	52.554	1000	52.554		0			3		15			1001	173		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.7967	50.345	1000	50.345		0			2		6			1001	174		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.8004	49.276	1002	49.276		0			4		8			1003	166		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.8172	53.970	1000	53.970		0			5		9			1001	169		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	20.8359	54.555	1004	54.555		0			4		5			1005	170		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1442	40.049	1000	40.049		0			2		11			1001	183		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1563	44.138	1002	44.138		0			3		9			1003	182		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1691	44.762	1000	44.762		0			2		20			1001	179		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1692	59.755	1002	59.755		0			4		14			1003	180		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1727	47.972	1002	47.972		0			5		15			1003	186		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1735	55.263	1000	55.263		0			2		20			1001	185		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1755	57.245	1000	57.245		0			3		16			1001	178		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.1793	59.540	1004	59.540		1			3		15			1005	176		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.2004	43.301	1000	43.301		0			4		15			1001	184		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.2015	41.718	1004	41.718		0			2		6			1005	177		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	22.2175	59.006	1004	59.006		0			5		15			1005	181		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6158	55.211	1002	55.211		0			5		15			1003	195		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6341	50.635	1000	50.635		1			3		17			1001	187		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6551	45.714	1004	45.714		0			5		15			1005	193		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6767	52.390	1002	52.390		0			3		11			1003	198		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6797	40.116	1000	40.116		0			4		8			1001	192		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6807	45.786	1000	45.786		0			3		20			1001	189		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.6972	50.325	1002	50.325		0			5		9			1003	190		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7114	43.432	1000	43.432		0			5		17			1001	196		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7267	57.619	1004	57.619		0			4		6			1005	188		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7437	52.280	1002	52.280		0			2		18			1003	191		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7504	41.986	1004	41.986		0			3		14			1005	197		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7527	47.401	1002	47.401		1			3		12			1003	199		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7739	40.247	1004	40.247		0			4		18			1005	194		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.7911	55.078	1002	55.078		0			4		17			1003	220		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8046	40.604	1002	40.604		0			4		13			1003	317		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8265	52.213	1000	52.213		0			3		6			1001	420		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8307	43.543	1004	43.543		0			3		9			1005	330		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8343	44.735	1004	44.735		0			2		15			1005	279		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8464	42.950	1002	42.950		1			2		7			1003	255		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8643	50.890	1000	50.890		0			2		3			1001	202		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8760	41.305	1002	41.305		1			3		19			1003	365		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8803	50.175	1004	50.175		0			4		22			1005	396		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8812	46.763	1004	46.763		0			5		22			1005	341		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8845	52.600	1004	52.600		0			6		11			1005	258		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8872	43.778	1004	43.778		0			3		14			1005	298		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8885	43.410	1004	43.410		1			4		12			1005	385		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8909	59.150	1002	59.150		0			2		4			1003	205		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8924	46.434	1000	46.434		1			5		19			1001	343		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8946	59.642	1004	59.642		0			5		19			1005	386		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8987	44.140	1004	44.140		1			4		8			1005	253		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.8998	40.324	1004	40.324		0			4		15			1005	327		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9030	43.260	1002	43.260		0			2		16			1003	398		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9038	58.920	1002	58.920		1			5		10			1003	408		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9040	43.299	1004	43.299		0			4		4			1005	285		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9059	46.928	1000	46.928		0			4		12			1001	307		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9076	54.140	1002	54.140		0			5		5			1003	289		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9100	52.990	1004	52.990		1			5		12			1005	218		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9110	52.967	1004	52.967		0			2		14			1005	238		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9117	49.782	1002	49.782		0			2		15			1003	269		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9173	56.056	1002	56.056		0			3		7			1003	400		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9174	53.996	1004	53.996		0			3		8			1005	370		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9188	44.418	1002	44.418		0			3		5			1003	291		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9197	43.650	1000	43.650		0			5		20			1001	416		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9227	50.942	1004	50.942		0			2		13			1005	325		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9227	56.041	1002	56.041		0			5		4			1003	349		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9245	57.271	1002	57.271		0			6		20			1003	395		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9259	48.568	1002	48.568		1			5		19			1003	249		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9276	53.204	1002	53.204		2			6		8			1003	399		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9297	43.050	1004	43.050		0			5		12			1005	296		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9313	48.535	1000	48.535		0			4		19			1001	281		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9324	46.755	1002	46.755		0			6		11			1003	393		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9348	49.351	1004	49.351		1			5		22			1005	359		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9353	43.509	1000	43.509		0			5		12			1001	273		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9376	42.096	1002	42.096		0			2		11			1003	301		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9390	49.161	1002	49.161		0			2		20			1003	362		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9401	43.049	1002	43.049		0			2		18			1003	389		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9430	46.777	1002	46.777		1			3		15			1003	221		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9439	42.779	1004	42.779		1			3		8			1005	206		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9443	53.728	1000	53.728		0			5		16			1001	361		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9445	47.973	1002	47.973		0			6		19			1003	308		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9449	49.451	1000	49.451		2			3		13			1001	335		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9457	47.027	1002	47.027		1			5		22			1003	270		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9474	51.418	1004	51.418		0			3		8			1005	419		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9500	45.456	1000	45.456		0			4		6			1001	384		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9502	58.927	1000	58.927		0			4		2			1001	215		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9516	44.286	1002	44.286		0			3		17			1003	222		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9525	47.538	1004	47.538		0			4		6			1005	282		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9532	53.113	1002	53.113		0			5		9			1003	223		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9542	52.377	1000	52.377		2			6		21			1001	387		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9569	50.799	1004	50.799		1			5		2			1005	334		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9572	49.500	1002	49.500		1			2		12			1003	209		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9580	47.174	1002	47.174		1			4		1			1003	369		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9583	46.607	1002	46.607		0			4		7			1003	203		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9592	55.681	1004	55.681		0			3		20			1005	380		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9604	56.041	1000	56.041		0			2		16			1001	407		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9605	40.216	1000	40.216		0			3		14			1001	265		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9607	46.541	1002	46.541		0			4		14			1003	409		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9608	59.149	1000	59.149		1			5		14			1001	372		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9619	59.043	1002	59.043		0			3		3			1003	235		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9632	51.901	1002	51.901		0			6		20			1003	300		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9641	40.484	1002	40.484		0			4		22			1003	355		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9655	42.689	1002	42.689		0			2		11			1003	345		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9655	49.424	1004	49.424		1			3		21			1005	271		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9659	57.548	1000	57.548		2			4		6			1001	263		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9663	47.935	1000	47.935		0			4		6			1001	261		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9666	53.649	1002	53.649		0			2		8			1003	397		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9673	59.174	1000	59.174		1			4		3			1001	346		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9678	47.426	1000	47.426		2			2		16			1001	403		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9681	54.559	1000	54.559		0			4		6			1001	352		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9682	59.971	1004	59.971		0			5		4			1005	228		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9686	52.741	1002	52.741		0			4		15			1003	382		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9688	51.565	1002	51.565		0			2		14			1003	412		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9704	56.535	1004	56.535		0			4		1			1005	414		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9714	55.176	1002	55.176		0			4		18			1003	338		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9722	46.980	1000	46.980		0			2		17			1001	405		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9741	56.912	1002	56.912		1			2		5			1003	299		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9741	51.556	1002	51.556		1			3		10			1003	340		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9744	47.501	1002	47.501		0			3		21			1003	225		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9758	52.550	1002	52.550		0			4		7			1003	302		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9760	58.590	1004	58.590		0			4		16			1005	371		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9771	55.365	1004	55.365		0			5		3			1005	241		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9787	46.770	1004	46.770		1			2		5			1005	239		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9789	47.214	1002	47.214		1			3		8			1003	207		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9795	54.952	1000	54.952		0			2		21			1001	314		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9797	58.624	1004	58.624		0			3		17			1005	274		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9799	42.425	1004	42.425		0			2		6			1005	367		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9800	40.784	1000	40.784		0			4		8			1001	358		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9812	49.737	1002	49.737		1			3		19			1003	391		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9815	54.908	1002	54.908		1			5		16			1003	363		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9818	55.255	1000	55.255		0			5		3			1001	276		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9822	44.476	1004	44.476		0			4		7			1005	315		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9835	48.176	1000	48.176		0			2		10			1001	216		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9836	41.319	1000	41.319		0			4		13			1001	378		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9850	42.150	1002	42.150		0			2		12			1003	284		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9854	46.394	1000	46.394		0			5		14			1001	356		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9876	58.603	1000	58.603		0			5		4			1001	306		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9881	54.733	1000	54.733		1			2		8			1001	266		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9904	46.546	1000	46.546		0			2		22			1001	242		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9906	54.488	1004	54.488		0			5		8			1005	418		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9906	48.024	1002	48.024		1			6		3			1003	286		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9914	47.148	1004	47.148		0			6		12			1005	267		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9919	40.988	1000	40.988		0			4		22			1001	260		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9924	48.008	1000	48.008		0			2		1			1001	413		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9940	47.244	1002	47.244		1			2		2			1003	351		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9942	49.820	1004	49.820		1			5		2			1005	292		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9946	46.043	1002	46.043		0			2		22			1003	337		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9948	42.115	1000	42.115		0			5		14			1001	201		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9952	42.272	1000	42.272		0			4		7			1001	217		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9961	59.944	1002	59.944		0			2		1			1003	374		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9982	58.898	1000	58.898		0			4		13			1001	210		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	23.9982	56.785	1004	56.785		0			4		5			1005	214		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0001	44.412	1002	44.412		0			5		22			1003	331		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0003	43.367	1000	43.367		0			5		11			1001	364		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0005	48.512	1004	48.512		1			6		6			1005	313		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0042	57.503	1000	57.503		0			2		8			1001	406		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0053	44.163	1002	44.163		0			5		16			1003	213		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0086	43.401	1002	43.401		1			6		16			1003	410		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0088	54.562	1000	54.562		0			3		12			1001	319		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0093	40.222	1000	40.222		0			3		17			1001	250		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0103	53.404	1004	53.404		1			5		19			1005	268		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0104	58.996	1000	58.996		0			3		22			1001	264		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0105	52.334	1002	52.334		0			4		20			1003	247		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0111	51.359	1002	51.359		0			3		8			1003	272		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0114	57.632	1002	57.632		1			4		11			1003	415		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0117	47.756	1002	47.756		0			6		22			1003	231		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0147	47.878	1000	47.878		0			2		6			1001	280		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0150	47.632	1004	47.632		0			2		12			1005	376		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0151	43.297	1004	43.297		0			3		11			1005	275		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0158	40.758	1002	40.758		1			5		11			1003	339		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0159	58.744	1002	58.744		0			3		17			1003	304		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0169	51.402	1002	51.402		0			2		9			1003	312		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0172	42.025	1004	42.025		0			3		22			1005	316		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0175	40.841	1004	40.841		0			3		10			1005	318		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0179	50.365	1000	50.365		1			5		19			1001	360		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0183	58.414	1000	58.414		0			2		4			1001	311		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0186	41.756	1004	41.756		0			5		3			1005	411		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0192	53.437	1000	53.437		0			2		5			1001	277		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0205	42.305	1000	42.305		0			5		15			1001	232		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0206	55.851	1002	55.851		0			2		10			1003	290		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0245	50.789	1004	50.789		0			5		22			1005	243		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0257	47.091	1004	47.091		0			5		18			1005	226		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0262	43.313	1004	43.313		0			2		19			1005	320		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0290	59.034	1004	59.034		2			2		9			1005	322		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0290	58.594	1004	58.594		0			4		4			1005	254		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0293	58.181	1004	58.181		0			4		22			1005	262		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0294	49.303	1004	49.303		0			3		10			1005	259		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0308	55.053	1000	55.053		1			3		11			1001	390		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0321	56.599	1004	56.599		0			2		17			1005	348		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0328	45.242	1002	45.242		0			5		6			1003	388		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0338	46.194	1004	46.194		0			2		9			1005	224		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0339	52.688	1000	52.688		0			5		1			1001	324		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0339	58.764	1004	58.764		0			3		10			1005	394		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0342	44.917	1004	44.917		0			4		9			1005	342		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0343	45.782	1002	45.782		1			5		16			1003	404		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0362	44.608	1002	44.608		0			3		12			1003	354		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0369	59.662	1002	59.662		0			5		18			1003	200		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0377	45.410	1004	45.410		0			2		16			1005	375		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0383	43.518	1002	43.518		0			5		3			1003	381		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0394	56.351	1004	56.351		0			3		1			1005	347		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0418	45.544	1004	45.544		2			3		2			1005	357		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0421	44.533	1000	44.533		0			3		9			1001	204		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0425	49.650	1000	49.650		0			6		17			1001	246		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0431	47.914	1004	47.914		0			4		22			1005	219		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0436	49.041	1004	49.041		0			4		19			1005	323		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0451	50.790	1004	50.790		0			2		11			1005	240		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0464	50.539	1004	50.539		0			5		8			1005	333		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0465	51.537	1004	51.537		0			6		22			1005	353		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0467	53.471	1000	53.471		0			3		4			1001	295		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0468	45.354	1004	45.354		0			5		18			1005	344		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0470	50.028	1000	50.028		0			4		3			1001	402		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0470	58.537	1000	58.537		0			2		7			1001	383		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0471	40.248	1000	40.248		0			4		17			1001	230		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0487	59.198	1004	59.198		0			5		19			1005	212		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0493	53.978	1000	53.978		0			5		4			1001	256		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0499	50.529	1000	50.529		0			3		6			1001	366		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0502	52.015	1004	52.015		0			4		20			1005	332		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0510	50.765	1004	50.765		0			3		22			1005	234		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0519	47.714	1004	47.714		0			4		15			1005	257		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0543	57.441	1000	57.441		0			2		9			1001	297		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0547	40.846	1004	40.846		0			5		22			1005	305		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0552	40.855	1004	40.855		0			4		13			1005	309		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0554	45.100	1004	45.100		0			2		4			1005	208		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0557	56.453	1002	56.453		0			3		16			1003	377		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0559	41.021	1002	41.021		0			5		4			1003	211		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0560	45.257	1002	45.257		1			3		11			1003	321		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0565	43.862	1004	43.862		1			3		10			1005	379		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0586	55.303	1004	55.303		0			5		2			1005	293		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0607	50.468	1000	50.468		0			4		2			1001	251		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0609	52.586	1000	52.586		0			2		19			1001	326		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0609	43.928	1002	43.928		0			5		11			1003	368		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0638	41.364	1000	41.364		0			4		5			1001	287		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0640	42.602	1004	42.602		0			5		11			1005	236		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0666	55.919	1002	55.919		1			2		9			1003	417		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0666	42.339	1004	42.339		1			2		13			1005	237		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0697	45.602	1002	45.602		0			2		10			1003	401		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0707	50.294	1002	50.294		0			4		3			1003	329		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0724	58.954	1000	58.954		0			3		10			1001	288		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0742	48.692	1004	48.692		0			2		6			1005	328		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0752	53.163	1000	53.163		0			4		15			1001	245		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0760	46.024	1004	46.024		0			5		18			1005	248		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0777	57.150	1004	57.150		0			3		1			1005	310		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0837	52.716	1000	52.716		0			3		5			1001	303		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0897	41.545	1004	41.545		0			5		3			1005	244		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.0986	54.131	1000	54.131		1			5		16			1001	229		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1013	44.340	1000	44.340		0			5		17			1001	233		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1038	46.649	1002	46.649		0			5		1			1003	336		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1122	46.901	1004	46.901		0			5		9			1005	392		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1149	51.241	1004	51.241		0			5		10			1005	278		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1163	54.416	1002	54.416		0			2		17			1003	227		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1234	47.059	1002	47.059		1			4		8			1003	373		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1236	50.405	1004	50.405		0			4		20			1005	294		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1354	42.739	1004	42.739		1			4		1			1005	283		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1569	41.925	1000	41.925		0			5		20			1001	350		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	24.1774	48.669	1002	48.669		1			3		17			1003	252		0		1		3

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
