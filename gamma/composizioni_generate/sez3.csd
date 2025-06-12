
<CsoundSynthesizer>
<CsOptions>
-o "sez3.wav" -W -d
</CsOptions>
<CsInstruments>
sr = 44100
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

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
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
f 0 119.47447699131875 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 7, 9, 12
f 1001 0 3 2 0, 1, 2
f 1002 0 3 2 6, 8, 10
f 1003 0 3 2 0, 1, 2
f 1004 0 3 2 8, 12, 8
f 1005 0 3 2 0, 1, 2
f 1006 0 3 2 1, 2, 3
f 1007 0 3 2 0, 1, 2
f 1008 0 3 2 3, 4, 2
f 1009 0 3 2 0, 1, 0
f 1010 0 3 2 2, 3, 5
f 1011 0 3 2 0, 1, 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	16.786	1000	13.429		-43.29		7		29			1001	6		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	20.337	1002	12.710		-43.09		2		23			1003	47		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	15.028	1004	15.028		-41.78		2		12			1005	22		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	21.942	1004	17.554		-43.69		1		13			1005	52		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	22.733	1004	14.208		-43.47		1		24			1005	70		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	12.895	1006	10.316		-43.62		0		3			1007	17		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	30.356	1002	18.973		-41.66		7		3			1003	54		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	16.648	1002	13.319		-42.72		1		9			1003	23		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	24.705	1002	15.441		-41.74		3		47			1003	57		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	18.043	1004	14.435		-41.22		1		19			1005	85		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	25.102	1000	15.689		-40.84		4		38			1001	18		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.090	1000	11.272		-41.32		5		45			1001	45		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	24.175	1010	19.340		-44.38		5		9			1011	30		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	11.167	1000	11.167		-41.71		3		20			1001	26		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.045	1002	14.045		-42.60		5		1			1003	65		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	22.584	1002	18.067		-44.35		1		2			1003	84		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	13.264	1004	13.264		-44.11		2		17			1005	34		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	13.640	1000	13.640		-41.46		4		7			1001	58		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	19.704	1002	12.315		-42.48		2		18			1003	76		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.639	1000	11.711		-41.33		5		41			1001	78		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	26.259	1008	16.412		-44.31		6		19			1009	81		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	16.130	1002	16.130		-41.58		8		44			1003	29		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	30.143	1000	18.840		-41.82		6		29			1001	73		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	31.550	1002	19.719		-43.08		1		35			1003	77		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	15.547	1002	15.547		-43.36		6		19			1003	24		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	13.120	1004	10.496		-42.20		4		20			1005	80		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	15.168	1002	15.168		-44.49		7		6			1003	39		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	17.157	1010	17.157		-41.04		3		30			1011	37		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.155	1010	14.155		-42.27		5		3			1011	53		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.484	1004	14.484		-43.43		1		18			1005	66		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	24.152	1008	19.321		-40.31		3		9			1009	63		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	16.640	1000	16.640		-40.70		6		43			1001	14		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	16.948	1008	13.559		-43.06		1		49			1009	61		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	19.284	1004	19.284		-41.10		4		27			1005	41		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	13.168	1004	13.168		-43.00		6		23			1005	8		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	12.441	1002	12.441		-42.06		3		28			1003	72		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	17.259	1000	17.259		-41.54		3		5			1001	9		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	17.023	1000	13.619		-40.59		1		28			1001	15		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	19.699	1000	12.312		-41.29		8		30			1001	44		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	11.175	1000	11.175		-43.94		4		41			1001	43		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	17.687	1000	11.055		-44.61		6		36			1001	35		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	13.935	1002	11.148		-42.24		6		37			1003	82		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	20.600	1000	16.480		-40.52		1		45			1001	48		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	12.743	1000	12.743		-41.95		2		14			1001	16		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	26.782	1004	16.738		-44.37		5		41			1005	88		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	26.091	1000	16.307		-42.02		0		39			1001	10		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	14.212	1004	11.370		-41.82		4		19			1005	32		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0021	24.316	1002	19.453		-44.87		4		4			1003	5		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0057	13.281	1004	13.281		-42.22		7		26			1005	25		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0072	27.239	1002	17.024		-43.67		6		31			1003	12		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0076	15.154	1000	15.154		-43.62		4		16			1001	89		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0079	12.380	1000	12.380		-43.46		5		36			1001	42		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0110	24.862	1002	15.539		-41.47		6		15			1003	68		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0119	16.686	1000	13.349		-41.58		8		46			1001	1		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0122	24.439	1000	19.551		-41.93		4		39			1001	3		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0131	24.394	1000	19.515		-43.01		4		31			1001	60		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0141	11.530	1000	11.530		-44.47		0		27			1001	79		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0143	14.589	1000	11.671		-42.72		9		44			1001	55		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0144	17.749	1000	14.199		-44.66		2		1			1001	83		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0192	15.833	1008	15.833		-41.94		3		14			1009	20		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0210	10.410	1000	10.410		-41.11		5		7			1001	27		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0227	27.820	1002	17.388		-41.97		9		10			1003	36		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0243	13.604	1000	13.604		-40.36		7		9			1001	64		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0253	29.665	1004	18.541		-42.62		2		8			1005	38		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0271	16.092	1002	10.057		-43.89		2		26			1003	50		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0289	19.196	1000	15.357		-40.01		8		17			1001	21		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0302	19.070	1000	19.070		-40.33		7		24			1001	87		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0328	28.111	1002	17.569		-41.79		1		47			1003	86		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0364	19.758	1002	19.758		-41.29		2		39			1003	71		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0416	25.002	1000	15.627		-41.69		4		46			1001	4		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0438	18.378	1004	14.702		-43.37		8		19			1005	7		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0448	22.143	1002	13.839		-41.09		8		36			1003	62		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0504	30.220	1002	18.888		-42.20		6		36			1003	13		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0531	16.062	1002	12.850		-42.43		6		31			1003	75		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0629	15.662	1000	12.529		-40.51		6		14			1001	11		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0635	14.712	1000	14.712		-40.53		6		4			1001	19		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0660	12.985	1000	12.985		-44.04		2		23			1001	31		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0700	26.514	1004	16.571		-40.99		4		4			1005	67		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0712	13.173	1000	10.538		-41.07		2		30			1001	33		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0734	31.992	1000	19.995		-44.15		6		38			1001	2		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0735	19.397	1000	15.517		-42.60		4		42			1001	56		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0748	19.043	1004	11.902		-43.10		4		44			1005	28		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0758	29.984	1004	18.740		-41.25		6		31			1005	51		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0788	18.348	1010	18.348		-40.95		8		32			1011	59		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0802	13.688	1004	13.688		-43.89		9		3			1005	49		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0862	25.060	1000	15.663		-43.38		3		17			1001	40		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0865	21.406	1000	17.125		-44.23		5		43			1001	69		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.1045	16.657	1004	16.657		-41.41		1		23			1005	46		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.1137	16.077	1002	12.861		-40.79		2		49			1003	74		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.7822	21.839	1002	17.471		-44.02		7		41			1003	156		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8092	23.211	1004	18.569		-42.88		5		25			1005	96		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8159	25.241	1000	15.775		-43.28		3		6			1001	128		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8232	15.733	1002	15.733		-42.96		7		6			1003	112		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8249	23.244	1002	18.595		-43.73		2		17			1003	140		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8310	13.388	1000	13.388		-43.84		3		46			1001	122		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8384	16.580	1000	13.264		-44.46		5		27			1001	137		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8384	19.015	1004	19.015		-44.65		1		30			1005	121		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8466	24.745	1010	19.796		-44.08		1		20			1011	151		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8647	13.605	1004	10.884		-40.32		2		30			1005	145		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8660	10.323	1004	10.323		-40.91		6		42			1005	108		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8668	21.505	1004	17.204		-42.83		2		4			1005	104		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8719	19.153	1002	15.322		-40.15		9		19			1003	143		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8751	15.785	1010	15.785		-39.97		7		7			1011	133		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8764	24.275	1004	19.420		-41.57		3		45			1005	97		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8780	18.548	1000	18.548		-42.87		3		40			1001	150		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8814	19.213	1002	12.008		-39.94		8		32			1003	131		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8817	21.828	1000	17.462		-44.45		5		47			1001	132		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8849	17.603	1002	17.603		-41.05		1		35			1003	117		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8854	23.580	1010	14.738		-44.60		7		23			1011	99		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8864	19.619	1002	12.262		-44.10		5		14			1003	106		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8897	18.891	1008	18.891		-41.06		6		40			1009	123		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8905	19.217	1000	19.217		-40.53		0		15			1001	155		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8926	12.975	1002	10.380		-44.37		2		2			1003	94		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8930	24.584	1006	15.365		-41.50		7		39			1007	135		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8957	14.034	1004	14.034		-41.24		5		31			1005	176		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8962	13.740	1002	10.992		-41.01		5		19			1003	174		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8963	14.737	1000	11.790		-44.22		8		17			1001	114		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8963	24.684	1004	19.747		-40.47		4		43			1005	159		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8967	11.161	1002	11.161		-40.04		8		4			1003	92		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8967	17.010	1004	13.608		-41.08		2		15			1005	141		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8971	15.363	1002	15.363		-44.58		2		12			1003	161		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.8989	21.336	1002	13.335		-41.94		7		5			1003	95		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9007	17.742	1004	17.742		-43.07		1		4			1005	138		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9049	22.093	1004	13.808		-40.18		4		7			1005	134		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9058	16.845	1002	16.845		-41.27		4		32			1003	158		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9080	19.019	1002	11.887		-42.66		6		29			1003	152		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9094	22.326	1004	17.861		-44.60		4		8			1005	115		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9135	17.691	1004	14.153		-43.72		5		17			1005	127		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9135	20.470	1004	16.376		-39.94		8		6			1005	149		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9148	16.142	1010	12.914		-40.71		8		40			1011	139		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9157	15.054	1004	12.043		-40.71		2		7			1005	93		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9159	27.673	1000	17.296		-43.51		3		27			1001	153		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9159	19.033	1002	19.033		-41.20		6		9			1003	129		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9162	31.492	1000	19.683		-40.25		8		3			1001	167		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9164	15.640	1004	15.640		-43.66		1		31			1005	173		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9168	13.069	1002	13.069		-41.44		8		30			1003	142		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9177	17.382	1004	10.864		-42.92		8		36			1005	125		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9202	14.122	1000	14.122		-44.75		7		5			1001	90		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9215	30.570	1004	19.106		-41.22		7		39			1005	146		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9271	11.841	1008	11.841		-43.80		1		40			1009	113		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9303	18.161	1004	14.528		-41.06		3		37			1005	91		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9361	25.864	1000	16.165		-43.98		2		47			1001	148		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9369	17.937	1004	14.349		-41.50		5		21			1005	126		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9390	18.216	1000	14.573		-43.18		0		16			1001	110		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9401	13.998	1004	13.998		-43.76		2		20			1005	175		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9415	18.405	1002	11.503		-44.10		2		30			1003	98		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9418	14.445	1008	14.445		-41.50		4		12			1009	165		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9481	17.148	1004	17.148		-43.36		2		5			1005	101		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9502	17.877	1004	14.301		-41.15		4		15			1005	109		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9509	11.242	1002	11.242		-42.70		7		25			1003	172		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9557	13.710	1002	10.968		-44.66		4		35			1003	107		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9561	16.660	1004	16.660		-41.23		8		35			1005	100		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9577	21.238	1004	16.990		-44.45		7		14			1005	170		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9585	15.897	1004	15.897		-41.20		2		21			1005	164		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9602	18.004	1002	18.004		-42.94		5		44			1003	171		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9649	19.414	1002	19.414		-44.44		7		29			1003	102		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9663	18.478	1002	14.782		-44.18		1		12			1003	119		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9673	13.867	1000	13.867		-42.67		6		35			1001	162		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9684	17.613	1010	14.090		-42.77		9		37			1011	105		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9691	31.972	1004	19.983		-43.33		2		4			1005	147		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9740	15.639	1002	12.512		-44.13		4		24			1003	157		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9754	16.889	1002	10.556		-43.61		6		5			1003	118		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9777	13.130	1002	13.130		-42.15		7		11			1003	116		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9842	11.199	1008	11.199		-40.28		3		12			1009	111		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9848	18.583	1002	11.615		-40.26		3		43			1003	130		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9896	15.285	1004	15.285		-40.78		3		27			1005	168		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9911	10.627	1002	10.627		-43.90		5		22			1003	120		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.9920	27.833	1010	17.396		-43.15		5		44			1011	136		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0020	17.376	1010	13.900		-43.07		0		29			1011	144		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0036	24.057	1000	15.036		-40.25		3		40			1001	103		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0042	24.472	1000	19.578		-43.22		3		8			1001	163		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0111	19.725	1002	19.725		-40.46		3		18			1003	169		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0119	13.049	1000	13.049		-40.75		7		18			1001	154		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0199	16.636	1002	13.309		-43.27		2		43			1003	160		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0364	18.774	1002	15.019		-41.07		1		15			1003	166		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.0722	15.458	1000	15.458		-42.66		8		23			1001	124		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5645	18.550	1000	11.594		-42.30		7		7			1001	224		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5735	27.198	1004	16.999		-39.59		4		21			1005	193		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5844	23.869	1004	19.095		-41.57		1		32			1005	217		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5869	18.631	1004	18.631		-43.61		4		3			1005	197		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5909	22.073	1004	13.796		-39.15		7		10			1005	187		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5985	18.979	1010	11.862		-43.39		3		29			1011	225		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.5994	20.162	1000	16.130		-44.04		4		36			1001	249		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6038	25.392	1010	15.870		-41.91		6		39			1011	198		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6102	12.086	1004	12.086		-39.30		7		17			1005	242		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6150	14.095	1010	14.095		-39.12		1		26			1011	221		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6197	12.286	1004	12.286		-42.92		3		20			1005	201		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6199	20.302	1002	12.689		-39.20		4		41			1003	240		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6221	13.098	1004	10.479		-39.50		3		24			1005	246		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6252	14.827	1000	14.827		-40.36		1		6			1001	218		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6253	17.868	1002	11.168		-39.61		2		14			1003	215		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6282	13.360	1010	13.360		-41.11		1		1			1011	212		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6311	17.233	1000	13.786		-41.28		4		29			1001	244		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6358	18.059	1000	18.059		-42.48		4		33			1001	247		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6392	27.308	1010	17.067		-42.22		4		25			1011	206		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6404	26.403	1000	16.502		-39.48		2		19			1001	204		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6407	20.392	1002	16.313		-40.91		2		10			1003	188		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6409	16.054	1004	16.054		-42.74		7		37			1005	196		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6436	30.184	1010	18.865		-43.59		4		19			1011	189		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6485	11.339	1000	11.339		-41.47		1		23			1001	210		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6490	18.504	1010	18.504		-39.51		5		25			1011	227		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6494	27.033	1004	16.895		-43.57		3		9			1005	241		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6505	29.874	1002	18.671		-39.59		2		11			1003	232		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6540	13.885	1002	13.885		-43.00		6		41			1003	191		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6568	18.936	1000	11.835		-41.69		7		20			1001	183		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6589	16.252	1006	13.001		-40.35		3		18			1007	222		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6601	14.590	1002	11.672		-41.52		3		38			1003	254		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6637	25.818	1002	16.136		-43.59		7		17			1003	233		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6639	20.972	1000	16.777		-39.32		6		36			1001	245		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6709	12.655	1000	12.655		-42.78		2		3			1001	238		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6729	27.942	1000	17.464		-41.78		4		16			1001	205		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6742	21.232	1004	16.986		-43.69		2		15			1005	228		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6747	29.188	1002	18.243		-43.77		1		21			1003	209		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6747	14.050	1006	11.240		-41.18		5		30			1007	208		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6850	18.887	1002	18.887		-42.85		6		20			1003	256		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6863	19.030	1004	15.224		-42.87		6		1			1005	203		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6880	14.640	1004	14.640		-40.63		2		23			1005	185		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6886	13.936	1002	13.936		-43.49		7		17			1003	219		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6891	13.391	1004	10.713		-41.83		2		34			1005	184		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6902	15.822	1004	12.658		-40.28		5		5			1005	236		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6915	30.169	1002	18.855		-41.38		5		17			1003	248		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6929	19.024	1002	19.024		-41.82		5		15			1003	252		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6937	21.785	1000	13.616		-39.65		4		16			1001	253		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6972	29.166	1004	18.229		-43.40		4		11			1005	255		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6973	20.132	1006	16.105		-41.12		4		2			1007	199		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6986	14.333	1000	14.333		-39.88		8		15			1001	239		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.6994	26.044	1000	16.278		-39.32		1		13			1001	195		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7010	31.863	1000	19.914		-42.05		5		23			1001	226		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7013	18.790	1002	15.032		-42.88		6		34			1003	251		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7020	23.728	1000	14.830		-42.17		3		15			1001	213		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7131	14.231	1004	14.231		-39.47		4		10			1005	182		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7144	22.984	1002	18.387		-41.45		8		29			1003	243		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7168	19.551	1000	19.551		-41.36		5		8			1001	257		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7180	23.201	1002	14.501		-40.14		7		19			1003	231		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7195	24.484	1000	15.302		-42.73		6		3			1001	186		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7224	14.762	1010	14.762		-42.76		3		29			1011	190		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7237	15.762	1004	12.609		-41.61		4		30			1005	177		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7251	19.614	1002	12.259		-40.65		2		33			1003	211		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7259	24.674	1010	15.421		-41.96		4		8			1011	181		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7291	11.915	1010	11.915		-40.55		2		23			1011	207		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7315	16.688	1010	16.688		-41.94		6		32			1011	178		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7350	13.749	1004	10.999		-42.18		4		11			1005	235		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7356	17.641	1004	14.113		-39.79		5		40			1005	229		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7369	16.268	1002	16.268		-40.88		2		34			1003	202		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7435	22.967	1000	18.374		-42.20		1		6			1001	192		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7435	16.490	1010	16.490		-41.50		8		1			1011	220		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7464	17.772	1002	17.772		-39.09		7		25			1003	200		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7472	21.537	1008	17.230		-41.24		6		39			1009	194		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7472	21.721	1008	13.575		-41.09		3		3			1009	180		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7475	30.269	1000	18.918		-42.19		6		8			1001	250		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7617	30.527	1010	19.079		-43.52		6		20			1011	223		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7621	15.167	1004	15.167		-41.80		2		29			1005	179		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7726	15.014	1010	15.014		-42.49		5		36			1011	237		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7869	19.590	1002	19.590		-42.62		6		16			1003	234		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7871	31.256	1006	19.535		-39.85		1		22			1007	230		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.8145	25.699	1002	16.062		-40.30		7		10			1003	216		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.1798	26.326	1010	16.453		-40.40		1		1			1011	283		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2112	21.945	1008	17.556		-39.17		2		14			1009	295		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2144	19.691	1010	19.691		-38.78		2		22			1011	278		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2254	11.584	1004	11.584		-39.70		4		23			1005	286		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2334	18.122	1002	11.326		-38.27		3		26			1003	263		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2368	18.505	1000	11.565		-39.96		3		3			1001	274		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2381	23.517	1008	18.814		-41.12		6		2			1009	261		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2423	26.812	1006	16.758		-42.50		4		31			1007	272		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2445	27.534	1004	17.209		-41.09		3		5			1005	282		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2499	22.096	1004	17.677		-42.35		4		9			1005	279		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2679	14.608	1002	14.608		-38.86		5		30			1003	273		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2707	24.237	1008	15.148		-42.26		4		32			1009	291		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2729	22.449	1010	14.031		-40.77		4		24			1011	258		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2743	17.470	1002	13.976		-40.86		4		12			1003	293		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2805	15.324	1004	15.324		-41.27		5		13			1005	289		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2830	27.560	1006	17.225		-41.54		6		22			1007	290		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2864	14.833	1006	11.866		-42.77		6		13			1007	268		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2868	13.467	1004	13.467		-40.81		5		9			1005	288		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2882	24.539	1000	15.337		-40.23		6		32			1001	276		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2887	16.686	1008	16.686		-38.33		2		10			1009	287		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2892	14.635	1002	11.708		-42.04		4		5			1003	269		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2900	24.470	1004	19.576		-38.35		6		26			1005	275		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2952	13.573	1010	13.573		-38.55		2		3			1011	270		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3018	27.343	1004	17.089		-38.61		2		11			1005	297		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3035	14.819	1002	14.819		-39.54		5		21			1003	267		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3040	14.104	1008	11.283		-42.76		3		31			1009	277		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3060	19.246	1008	19.246		-40.34		2		19			1009	262		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3088	31.240	1004	19.525		-39.22		4		15			1005	260		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3223	28.153	1006	17.596		-42.44		6		2			1007	271		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3264	22.414	1002	17.931		-41.26		5		9			1003	259		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3310	23.547	1008	14.717		-41.50		4		6			1009	280		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3319	18.358	1002	14.686		-40.07		1		26			1003	284		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3379	27.555	1002	17.222		-40.69		2		32			1003	264		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3454	31.401	1002	19.625		-39.91		6		24			1003	294		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3462	15.845	1000	12.676		-39.39		4		19			1001	265		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3523	24.601	1006	15.375		-38.57		4		31			1007	292		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3537	20.612	1004	16.490		-38.99		6		11			1005	266		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3678	15.749	1008	15.749		-37.87		4		22			1009	285		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.3709	24.226	1004	15.141		-38.06		3		4			1005	296		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6636	19.914	1010	15.931		-40.24		3		10			1011	302		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6716	18.075	1004	14.460		-36.69		4		15			1005	305		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6782	17.851	1002	17.851		-40.40		2		18			1003	299		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6815	20.086	1010	12.554		-38.39		3		4			1011	309		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6828	24.737	1008	19.789		-38.54		3		12			1009	301		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6913	16.830	1006	13.464		-39.09		3		12			1007	320		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6916	27.160	1006	16.975		-36.41		3		2			1007	321		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.6936	16.605	1002	16.605		-36.46		2		18			1003	310		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7017	22.058	1008	13.786		-39.31		3		1			1009	312		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7039	16.139	1002	12.911		-40.52		4		11			1003	308		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7073	19.331	1004	15.465		-36.29		3		9			1005	319		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7113	18.870	1006	11.793		-39.59		3		18			1007	300		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7141	15.570	1002	12.456		-37.28		2		3			1003	315		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7263	19.365	1000	15.492		-38.62		2		2			1001	317		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7374	29.945	1008	18.715		-36.65		4		3			1009	307		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7423	19.330	1010	12.081		-39.50		3		6			1011	303		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7441	13.726	1008	13.726		-40.81		4		17			1009	311		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7479	21.458	1010	13.411		-37.32		4		2			1011	306		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7491	31.041	1000	19.401		-38.34		3		2			1001	318		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7600	19.772	1004	19.772		-38.07		2		15			1005	313		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7604	22.465	1004	14.041		-36.92		3		4			1005	298		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7696	14.922	1010	11.938		-36.49		4		1			1011	314		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.7760	18.348	1008	14.678		-38.45		4		11			1009	316		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	30.8463	25.413	1006	15.883		-39.06		4		6			1007	304		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.8991	12.180	1002	9.744		-44.00		8		10			1003	347		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9109	8.529	1002	8.529		-43.00		4		19			1003	339		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9169	11.394	1002	9.115		-45.00		9		47			1003	395		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9362	15.087	1004	9.429		-44.00		9		40			1005	370		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9368	5.374	1000	5.374		-42.00		8		12			1001	323		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9446	11.211	1004	7.007		-40.00		0		1			1005	388		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9488	9.929	1000	9.929		-45.00		5		10			1001	333		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9491	6.310	1004	6.310		-42.00		7		27			1005	382		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9583	8.041	1004	6.433		-44.00		9		1			1005	361		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9609	7.294	1002	7.294		-45.00		3		15			1003	380		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9629	10.932	1000	6.833		-44.00		4		16			1001	351		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9661	8.766	1004	8.766		-42.00		1		3			1005	385		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9703	6.692	1004	5.353		-43.00		3		20			1005	354		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9724	6.693	1002	5.354		-40.00		7		16			1003	376		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9725	9.311	1002	5.819		-41.00		9		39			1003	322		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9742	14.265	1000	8.916		-43.00		1		35			1001	360		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9748	9.978	1000	9.978		-45.00		0		20			1001	342		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9802	7.561	1000	6.048		-42.00		1		47			1001	383		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9830	13.614	1010	8.509		-41.00		9		5			1011	348		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9842	15.600	1004	9.750		-40.00		3		14			1005	325		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9847	10.647	1000	6.654		-44.00		1		41			1001	338		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9866	11.075	1000	6.922		-43.00		1		14			1001	349		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9878	8.431	1004	6.744		-41.00		1		16			1005	331		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9887	8.834	1002	8.834		-45.00		5		12			1003	352		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9910	11.838	1004	7.399		-41.00		4		15			1005	369		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9921	7.386	1000	5.909		-43.00		1		7			1001	363		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9922	5.305	1004	5.305		-41.00		4		10			1005	346		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9943	11.331	1000	7.082		-42.00		7		37			1001	374		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9957	5.608	1002	5.608		-40.00		3		39			1003	389		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9963	10.017	1000	6.261		-42.00		6		17			1001	393		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9965	10.430	1000	8.344		-42.00		3		15			1001	379		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9982	6.843	1000	6.843		-40.00		3		38			1001	336		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	79.9983	9.177	1010	5.736		-40.00		3		7			1011	394		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0004	13.175	1010	8.234		-43.00		7		8			1011	324		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0022	6.375	1002	5.100		-42.00		1		22			1003	387		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0027	11.844	1002	9.475		-43.00		5		44			1003	357		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0031	8.307	1002	8.307		-43.00		4		19			1003	350		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0037	6.666	1000	6.666		-40.00		5		46			1001	356		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0038	9.621	1004	6.013		-41.00		3		17			1005	345		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0045	14.181	1004	8.863		-40.00		5		37			1005	329		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0049	12.102	1004	9.682		-42.00		8		31			1005	378		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0050	10.588	1002	6.618		-45.00		7		8			1003	384		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0059	8.620	1000	8.620		-44.00		9		12			1001	335		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0085	8.714	1004	6.972		-44.00		9		46			1005	362		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0110	10.648	1002	8.519		-44.00		7		6			1003	390		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0114	11.191	1002	6.994		-44.00		3		27			1003	337		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0123	12.138	1002	7.586		-45.00		4		18			1003	355		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0157	10.604	1002	6.627		-43.00		8		44			1003	386		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0198	7.055	1000	7.055		-45.00		9		6			1001	340		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0213	5.148	1002	5.148		-43.00		8		23			1003	366		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0232	11.519	1004	9.215		-40.00		0		45			1005	332		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0232	7.977	1000	6.381		-41.00		5		10			1001	375		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0236	9.063	1002	9.063		-45.00		6		5			1003	373		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0241	10.612	1004	8.490		-41.00		9		18			1005	328		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0257	14.651	1004	9.157		-42.00		5		10			1005	334		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0260	10.137	1002	8.110		-42.00		4		32			1003	343		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0338	8.234	1004	6.587		-45.00		9		26			1005	327		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0342	8.302	1004	5.189		-43.00		2		37			1005	359		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0348	8.347	1002	6.677		-40.00		5		18			1003	364		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0354	13.926	1000	8.704		-43.00		2		9			1001	368		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0358	10.709	1004	8.567		-44.00		2		25			1005	377		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0393	11.812	1000	7.383		-42.00		1		38			1001	392		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0466	11.793	1004	7.370		-40.00		0		45			1005	365		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0492	12.244	1000	9.795		-43.00		1		15			1001	358		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0586	8.745	1004	8.745		-43.00		4		26			1005	381		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0589	5.133	1002	5.133		-43.00		5		42			1003	372		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0655	13.700	1000	8.563		-44.00		6		33			1001	326		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0708	9.174	1000	9.174		-40.00		2		46			1001	344		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0752	7.471	1000	7.471		-41.00		9		30			1001	367		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0780	6.357	1010	6.357		-45.00		3		48			1011	353		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0785	5.839	1002	5.839		-44.00		6		23			1003	371		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.0817	9.213	1000	9.213		-42.00		4		20			1001	341		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.1005	9.834	1006	6.146		-41.00		7		29			1007	330		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.1026	10.428	1002	6.517		-40.00		6		32			1003	391		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8483	5.111	1000	5.111		-40.00		6		49			1001	408		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8507	5.005	1002	5.005		-43.00		8		12			1003	411		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8544	6.963	1002	6.963		-45.00		1		14			1003	421		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8613	8.190	1004	8.190		-42.00		0		19			1005	413		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8633	8.507	1002	5.317		-45.00		6		19			1003	451		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8724	11.559	1004	9.247		-40.00		9		3			1005	403		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8780	8.871	1000	8.871		-44.00		9		29			1001	450		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8936	5.956	1002	5.956		-44.00		0		36			1003	396		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8940	10.018	1000	6.261		-41.00		1		16			1001	429		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8941	9.732	1002	6.082		-43.00		7		47			1003	419		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8948	13.717	1002	8.573		-40.00		4		28			1003	418		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.8997	6.960	1000	6.960		-44.00		9		18			1001	447		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9008	5.450	1002	5.450		-44.00		5		14			1003	438		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9024	11.640	1004	9.312		-40.00		2		35			1005	397		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9080	6.958	1002	5.566		-45.00		6		29			1003	398		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9082	6.531	1000	6.531		-40.00		6		32			1001	422		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9091	10.938	1000	6.836		-44.00		0		3			1001	434		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9149	9.533	1004	7.626		-44.00		5		15			1005	420		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9189	15.940	1006	9.963		-41.00		2		9			1007	409		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9236	10.868	1002	8.694		-44.00		0		26			1003	424		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9303	10.153	1000	8.122		-45.00		3		26			1001	425		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9358	7.064	1004	5.651		-43.00		4		10			1005	442		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9381	12.177	1000	9.741		-42.00		5		10			1001	432		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9412	6.612	1010	5.290		-41.00		1		10			1011	435		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9439	6.972	1002	6.972		-43.00		7		27			1003	444		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9446	10.634	1000	8.507		-44.00		8		36			1001	433		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9463	10.996	1004	8.797		-42.00		2		48			1005	437		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9487	6.522	1008	6.522		-40.00		5		30			1009	440		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9487	11.989	1004	7.493		-43.00		0		20			1005	431		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9489	15.859	1004	9.912		-42.00		4		15			1005	426		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9492	8.972	1004	8.972		-44.00		3		31			1005	449		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9494	14.861	1004	9.288		-41.00		9		1			1005	407		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9555	13.290	1004	8.307		-45.00		2		29			1005	427		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9595	11.218	1004	7.011		-43.00		8		2			1005	430		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9628	6.736	1000	6.736		-42.00		4		36			1001	446		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9633	9.006	1002	5.629		-45.00		6		10			1003	412		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9642	6.763	1004	5.410		-44.00		1		33			1005	404		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9691	7.586	1004	6.069		-43.00		0		46			1005	410		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9709	10.180	1004	8.144		-40.00		2		3			1005	417		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9710	12.416	1000	9.933		-43.00		3		28			1001	415		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9726	7.236	1000	7.236		-40.00		3		9			1001	439		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9769	6.372	1002	5.098		-44.00		4		26			1003	416		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9777	10.484	1004	6.552		-45.00		7		47			1005	445		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9788	8.133	1000	6.506		-40.00		2		5			1001	443		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9789	11.189	1000	8.951		-44.00		6		14			1001	414		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9893	12.493	1000	7.808		-41.00		4		32			1001	448		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9902	8.148	1000	6.518		-40.00		0		12			1001	399		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	80.9908	6.212	1002	6.212		-43.00		0		26			1003	441		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0033	12.534	1004	7.834		-42.00		7		3			1005	401		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0048	15.147	1010	9.467		-44.00		7		41			1011	400		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0173	9.598	1008	9.598		-41.00		2		6			1009	405		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0238	5.609	1010	5.609		-45.00		6		7			1011	428		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0333	7.737	1010	6.189		-40.00		5		12			1011	423		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0348	14.225	1004	8.890		-44.00		4		35			1005	402		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0348	10.237	1000	8.189		-40.00		1		29			1001	406		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	81.0628	5.472	1002	5.472		-44.00		7		23			1003	436		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7400	5.091	1008	5.091		-41.00		0		1			1009	487		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7408	7.147	1000	5.718		-42.00		6		35			1001	514		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7553	12.002	1002	9.601		-45.00		6		48			1003	503		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7661	6.293	1002	5.034		-42.00		3		15			1003	485		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7679	14.124	1008	8.828		-45.00		7		45			1009	476		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7766	9.163	1000	9.163		-41.00		5		29			1001	490		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7815	5.831	1002	5.831		-42.00		3		27			1003	455		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7930	7.602	1000	6.082		-43.00		7		15			1001	459		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7952	12.775	1002	7.984		-40.00		8		30			1003	501		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7977	7.819	1004	7.819		-42.00		6		13			1005	479		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.7995	14.597	1002	9.123		-42.00		6		17			1003	452		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8037	7.830	1004	6.264		-43.00		9		12			1005	509		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8044	9.669	1000	6.043		-41.00		1		33			1001	463		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8085	8.981	1002	8.981		-40.00		7		39			1003	484		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8126	5.865	1002	5.865		-41.00		4		22			1003	486		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8168	13.138	1004	8.212		-42.00		9		18			1005	502		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8169	7.383	1004	7.383		-40.00		1		4			1005	473		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8173	10.385	1002	6.491		-41.00		2		48			1003	495		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8185	9.950	1000	9.950		-44.00		0		36			1001	457		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8188	10.312	1002	8.249		-43.00		3		19			1003	460		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8190	12.423	1004	7.764		-42.00		9		16			1005	474		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8223	9.026	1002	9.026		-45.00		5		43			1003	468		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8230	11.378	1004	7.111		-40.00		8		41			1005	500		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8277	6.994	1002	5.595		-41.00		8		48			1003	465		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8284	6.705	1000	6.705		-43.00		0		33			1001	507		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8287	10.728	1000	6.705		-42.00		4		31			1001	466		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8297	13.369	1004	8.355		-45.00		3		21			1005	489		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8318	11.029	1004	6.893		-42.00		5		42			1005	498		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8320	8.639	1002	6.911		-44.00		2		6			1003	506		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8331	14.470	1010	9.044		-44.00		8		42			1011	516		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8339	11.503	1004	9.203		-42.00		2		8			1005	464		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8380	14.352	1004	8.970		-41.00		9		35			1005	510		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8382	11.877	1002	9.502		-43.00		7		12			1003	521		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8407	15.815	1000	9.884		-44.00		5		50			1001	458		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8421	8.950	1004	8.950		-42.00		3		3			1005	470		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8422	8.466	1002	8.466		-40.00		7		45			1003	453		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8438	11.519	1004	7.199		-40.00		9		13			1005	483		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8439	12.771	1006	7.982		-41.00		0		20			1007	492		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8453	11.894	1010	9.515		-43.00		9		29			1011	520		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8453	11.938	1000	7.461		-45.00		5		17			1001	505		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8467	6.284	1004	5.028		-43.00		6		1			1005	511		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8471	6.875	1008	5.500		-44.00		8		50			1009	454		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8471	10.644	1000	8.516		-42.00		2		48			1001	493		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8484	8.597	1000	5.373		-45.00		4		13			1001	488		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8490	8.625	1010	5.391		-43.00		4		38			1011	504		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8495	13.687	1004	8.554		-41.00		7		7			1005	475		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8502	11.649	1000	7.281		-44.00		6		9			1001	480		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8517	15.552	1004	9.720		-45.00		6		44			1005	477		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8530	5.240	1000	5.240		-41.00		7		38			1001	469		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8533	8.104	1002	5.065		-45.00		2		36			1003	467		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8534	5.643	1008	5.643		-42.00		0		44			1009	513		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8541	9.828	1000	7.863		-41.00		2		12			1001	512		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8559	6.348	1004	6.348		-43.00		2		37			1005	472		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8571	13.359	1004	8.350		-44.00		7		11			1005	517		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8601	10.759	1000	8.607		-40.00		2		1			1001	456		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8628	11.778	1010	9.422		-43.00		2		35			1011	494		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8661	10.440	1004	8.352		-45.00		4		17			1005	471		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8676	12.851	1006	8.032		-40.00		8		40			1007	482		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8695	10.089	1008	6.306		-41.00		7		40			1009	462		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8724	12.606	1000	7.879		-40.00		1		16			1001	481		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8799	9.560	1004	9.560		-41.00		2		28			1005	461		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8855	8.571	1002	8.571		-45.00		7		45			1003	515		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8866	11.644	1002	7.277		-41.00		0		7			1003	499		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8910	9.514	1000	5.946		-44.00		5		46			1001	496		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.8983	6.664	1002	6.664		-43.00		8		28			1003	478		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.9013	5.485	1002	5.485		-45.00		2		13			1003	497		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.9015	15.431	1002	9.644		-45.00		8		13			1003	518		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.9031	11.501	1000	7.188		-45.00		9		9			1001	519		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.9083	8.689	1004	8.689		-44.00		1		40			1005	508		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	83.9302	7.240	1010	7.240		-45.00		3		11			1011	491		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5393	9.772	1002	9.772		-45.00		1		39			1003	549		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5546	8.336	1000	8.336		-41.00		4		43			1001	575		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5674	12.852	1000	8.033		-45.00		8		43			1001	563		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5757	8.618	1004	8.618		-43.00		5		28			1005	562		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5776	7.280	1000	7.280		-45.00		5		8			1001	551		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5833	7.135	1002	5.708		-44.00		4		21			1003	586		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5860	10.085	1000	6.303		-40.00		6		20			1001	593		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5863	5.671	1004	5.671		-43.00		9		47			1005	581		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5933	12.210	1002	7.631		-44.00		3		36			1003	592		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5964	8.129	1000	6.503		-44.00		2		8			1001	570		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5979	6.681	1000	6.681		-42.00		5		31			1001	585		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5980	8.522	1002	8.522		-45.00		3		19			1003	582		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5980	7.365	1002	7.365		-41.00		3		5			1003	560		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.5981	12.800	1000	8.000		-40.00		4		40			1001	529		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6004	8.442	1002	8.442		-43.00		5		37			1003	527		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6068	6.885	1002	5.508		-45.00		0		11			1003	532		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6074	5.520	1010	5.520		-42.00		4		3			1011	588		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6106	8.949	1000	8.949		-42.00		8		49			1001	547		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6117	14.002	1000	8.751		-41.00		8		20			1001	576		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6129	12.978	1004	8.111		-44.00		0		50			1005	537		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6144	12.178	1002	9.742		-44.00		7		33			1003	566		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6153	10.892	1004	6.808		-42.00		1		48			1005	598		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6175	6.768	1002	6.768		-41.00		5		35			1003	587		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6184	10.968	1002	8.775		-43.00		2		20			1003	567		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6203	13.253	1000	8.283		-42.00		4		8			1001	596		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6253	8.987	1002	8.987		-42.00		1		37			1003	544		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6262	8.051	1008	8.051		-41.00		0		28			1009	548		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6271	12.430	1004	9.944		-41.00		3		45			1005	523		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6310	12.918	1004	8.074		-40.00		3		43			1005	526		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6316	5.664	1004	5.664		-43.00		0		2			1005	535		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6322	13.372	1000	8.357		-43.00		9		43			1001	565		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6328	9.450	1002	9.450		-43.00		0		27			1003	558		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6343	14.266	1002	8.916		-43.00		2		45			1003	541		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6380	9.960	1004	7.968		-42.00		0		21			1005	559		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6385	6.097	1004	6.097		-44.00		7		41			1005	595		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6403	7.499	1000	7.499		-41.00		3		10			1001	571		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6425	14.713	1006	9.196		-42.00		6		45			1007	546		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6442	9.746	1004	9.746		-42.00		8		39			1005	569		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6444	8.619	1004	8.619		-45.00		0		34			1005	583		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6472	10.181	1002	8.145		-43.00		6		42			1003	574		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6477	6.389	1000	5.111		-41.00		7		37			1001	572		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6520	9.713	1000	9.713		-40.00		0		2			1001	525		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6522	9.661	1002	7.729		-41.00		3		21			1003	545		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6543	8.215	1002	6.572		-42.00		6		21			1003	578		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6568	7.869	1004	6.295		-40.00		6		50			1005	543		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6578	10.926	1002	8.741		-42.00		1		33			1003	531		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6586	12.480	1002	9.984		-41.00		6		4			1003	528		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6599	11.175	1010	8.940		-44.00		3		39			1011	554		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6614	8.129	1002	6.503		-41.00		2		35			1003	553		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6615	7.249	1000	7.249		-42.00		9		20			1001	534		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6643	5.945	1000	5.945		-44.00		3		17			1001	533		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6645	5.521	1004	5.521		-43.00		6		19			1005	591		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6667	14.435	1000	9.022		-45.00		4		15			1001	522		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6678	12.284	1004	7.678		-43.00		1		27			1005	561		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6710	9.133	1004	9.133		-42.00		5		35			1005	599		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6755	7.693	1002	6.154		-42.00		3		25			1003	536		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6766	5.987	1002	5.987		-43.00		1		42			1003	555		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6772	11.374	1000	7.109		-40.00		3		50			1001	540		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6775	12.341	1002	7.713		-45.00		0		40			1003	557		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6820	7.762	1004	7.762		-40.00		1		34			1005	584		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6845	14.638	1000	9.149		-40.00		4		41			1001	573		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6870	9.575	1002	9.575		-43.00		1		13			1003	568		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6894	13.885	1006	8.678		-40.00		9		26			1007	597		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6906	9.765	1004	9.765		-44.00		0		50			1005	539		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6932	9.684	1000	6.052		-41.00		1		12			1001	530		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6960	8.313	1004	6.651		-42.00		1		29			1005	542		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6965	12.535	1002	7.834		-45.00		9		20			1003	556		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6973	11.199	1004	7.000		-40.00		4		2			1005	589		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6980	8.549	1000	8.549		-44.00		3		50			1001	590		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.6996	6.517	1000	5.213		-43.00		6		43			1001	538		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7020	11.660	1000	7.287		-43.00		9		26			1001	577		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7046	7.681	1010	6.145		-44.00		0		38			1011	579		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7063	11.089	1000	6.931		-42.00		4		1			1001	524		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7096	7.722	1004	6.178		-45.00		3		6			1005	594		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7156	6.966	1002	5.573		-42.00		0		23			1003	552		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7174	10.960	1004	8.768		-43.00		2		44			1005	580		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	88.7259	8.959	1006	7.167		-45.00		9		4			1007	564		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2712	8.457	1002	6.765		-40.00		6		25			1003	652		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2793	8.734	1000	8.734		-45.00		6		21			1001	608		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2808	10.513	1000	8.410		-43.00		9		44			1001	645		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2898	7.374	1002	7.374		-42.00		5		3			1003	651		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2940	7.578	1000	6.063		-40.00		8		44			1001	647		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.2953	8.964	1002	8.964		-41.00		2		44			1003	655		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3007	14.174	1002	8.859		-44.00		9		50			1003	625		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3084	5.397	1002	5.397		-40.00		5		13			1003	603		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3118	8.744	1002	6.995		-42.00		9		50			1003	619		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3137	12.473	1002	9.978		-44.00		6		22			1003	646		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3156	8.344	1002	8.344		-45.00		8		28			1003	639		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3216	7.504	1002	7.504		-42.00		5		31			1003	613		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3216	8.493	1002	8.493		-44.00		7		15			1003	648		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3221	12.102	1000	9.682		-45.00		8		46			1001	653		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3258	5.986	1002	5.986		-45.00		5		18			1003	601		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3271	6.895	1002	6.895		-44.00		3		3			1003	660		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3280	7.632	1004	7.632		-40.00		6		41			1005	606		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3312	11.538	1004	9.231		-42.00		8		16			1005	618		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3325	11.722	1002	9.378		-44.00		0		2			1003	650		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3332	11.064	1004	8.851		-43.00		5		45			1005	656		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3364	12.024	1000	9.619		-42.00		8		4			1001	600		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3367	9.336	1000	9.336		-40.00		3		31			1001	630		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3377	10.160	1002	8.128		-40.00		0		22			1003	657		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3380	8.595	1002	5.372		-43.00		3		9			1003	614		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3380	12.435	1004	7.772		-44.00		7		15			1005	615		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3395	6.337	1006	5.069		-43.00		4		49			1007	642		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3403	12.381	1004	7.738		-43.00		7		39			1005	602		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3468	8.652	1004	8.652		-41.00		1		31			1005	632		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3531	11.537	1004	9.230		-41.00		9		34			1005	617		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3533	13.323	1000	8.327		-41.00		3		20			1001	659		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3534	6.765	1000	5.412		-44.00		9		26			1001	636		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3575	7.436	1010	5.949		-40.00		5		7			1011	620		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3596	8.691	1004	6.953		-43.00		4		32			1005	649		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3598	7.615	1004	6.092		-43.00		4		14			1005	612		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3602	6.792	1004	6.792		-44.00		6		20			1005	604		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3638	8.524	1004	8.524		-45.00		5		16			1005	629		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3722	8.026	1002	8.026		-45.00		7		2			1003	631		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3743	11.854	1004	9.483		-44.00		8		19			1005	662		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3758	12.047	1000	9.638		-43.00		7		49			1001	663		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3788	6.685	1004	5.348		-43.00		9		42			1005	610		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3806	5.963	1000	5.963		-43.00		5		49			1001	624		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3815	9.458	1000	5.911		-43.00		0		10			1001	654		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3817	11.344	1004	9.076		-43.00		0		11			1005	605		1
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3844	11.394	1002	9.116		-40.00		7		23			1003	640		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3851	9.819	1004	6.137		-40.00		4		42			1005	623		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3896	8.126	1002	5.078		-42.00		3		3			1003	658		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3932	8.280	1002	6.624		-41.00		9		20			1003	644		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.3990	7.665	1000	7.665		-45.00		4		12			1001	661		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4042	8.660	1000	6.928		-40.00		1		12			1001	609		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4046	10.501	1002	8.401		-43.00		8		32			1003	635		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4057	9.702	1004	9.702		-45.00		1		44			1005	628		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4065	7.455	1000	5.964		-41.00		0		16			1001	621		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4092	11.730	1010	7.331		-43.00		7		16			1011	634		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4093	6.336	1004	6.336		-44.00		8		37			1005	611		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4114	8.786	1004	8.786		-42.00		9		20			1005	622		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4159	9.199	1004	7.359		-45.00		8		10			1005	626		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4170	7.778	1004	7.778		-42.00		8		35			1005	627		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4171	8.037	1000	8.037		-43.00		8		31			1001	643		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4210	5.749	1002	5.749		-41.00		4		19			1003	616		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4226	10.814	1002	6.759		-45.00		4		18			1003	607		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4227	5.218	1000	5.218		-43.00		9		48			1001	638		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4233	9.456	1004	9.456		-42.00		9		45			1005	637		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4242	9.143	1004	7.315		-43.00		3		1			1005	641		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	95.4364	9.335	1004	7.468		-41.00		9		46			1005	633		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
