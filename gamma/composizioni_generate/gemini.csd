
<CsoundSynthesizer>
<CsOptions>
-o "gemini.wav" -W -d
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
f 0 31.115638475708455 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 18 25 30
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 16 20 24
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 20 28 20
f 1005 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	3.695	1002	3.695		0			2		1			1003	2		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0010	4.276	1000	4.276		0			1		1			1001	1		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0062	4.220	1004	4.220		0			1		1			1005	4		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0074	4.266	1000	4.266		0			1		1			1001	6		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0102	3.005	1000	3.005		0			2		2			1001	3		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0186	3.646	1004	3.646		0			3		2			1005	5		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0619	4.051	1000	4.051		0			2		4			1001	7		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0622	3.684	1002	3.684		0			2		2			1003	9		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0626	4.057	1004	4.057		0			3		1			1005	10		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.0644	3.199	1004	3.199		0			3		4			1005	8		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.1900	3.342	1004	3.342		0			1		4			1005	11		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.2097	3.771	1000	3.771		0			2		4			1001	12		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.2134	3.285	1004	3.285		0			2		1			1005	13		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.4909	3.608	1000	3.608		0			2		4			1001	14		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.5120	3.148	1002	3.148		0			1		3			1003	15		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.9687	4.422	1000	4.422		0			1		3			1001	17		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	0.9721	3.701	1002	3.701		0			1		1			1003	16		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.6793	3.257	1004	3.257		0			3		5			1005	19		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	1.7014	3.743	1000	3.743		0			3		5			1001	18		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.6607	4.046	1002	4.046		0			2		6			1003	20		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.6656	3.707	1004	3.707		0			3		4			1005	22		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.6718	3.320	1002	3.320		0			1		5			1003	21		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	2.6752	3.904	1000	3.904		0			0		3			1001	23		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.9789	4.056	1004	4.056		0			2		3			1005	25		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.9891	3.824	1004	3.824		0			1		3			1005	27		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.9908	2.891	1004	2.891		0			2		4			1005	28		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.9945	2.937	1002	2.937		0			1		4			1003	26		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	3.9965	2.820	1002	2.820		0			0		6			1003	29		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	4.0046	3.871	1002	3.871		0			2		2			1003	24		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	4.2962	3.837	1004	3.837		0			2		1			1005	87		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	4.3128	3.068	1004	3.068		0			3		4			1005	86		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6558	2.962	1002	2.962		0			1		1			1003	34		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6706	3.380	1000	3.380		0			1		3			1001	33		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6708	3.963	1000	3.963		0			3		7			1001	31		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6769	3.471	1004	3.471		0			3		7			1005	30		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6898	3.882	1000	3.882		0			3		6			1001	32		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	5.6970	2.836	1004	2.836		0			1		5			1005	35		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7518	2.857	1000	2.857		0			1		10			1001	38		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7691	3.243	1002	3.243		0			4		3			1003	36		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	7.7935	3.518	1004	3.518		0			1		4			1005	37		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	10.2957	3.170	1002	3.170		0			1		6			1003	40		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	10.3245	2.624	1002	2.624		0			1		3			1003	39		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	10.3954	2.987	1004	2.987		0			3		2			1005	41		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.4411	2.376	1004	2.376		0			1		9			1005	43		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.4416	3.244	1000	3.244		0			4		1			1001	46		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.4633	2.513	1004	2.513		0			3		8			1005	45		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.4842	2.780	1000	2.780		0			1		1			1001	47		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.5053	3.100	1002	3.100		0			2		7			1003	42		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	13.5362	3.472	1000	3.472		0			3		8			1001	44		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.0233	2.815	1002	2.815		0			4		5			1003	50		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.0588	2.980	1002	2.980		0			3		6			1003	48		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.0661	2.992	1002	2.992		0			2		12			1003	51		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.0851	2.296	1004	2.296		0			3		14			1005	54		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.1142	2.589	1000	2.589		0			3		13			1001	49		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.1336	2.159	1004	2.159		0			4		6			1005	53		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.1676	2.855	1002	2.855		0			4		4			1003	52		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.2113	3.043	1000	3.043		0			4		16			1001	55		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.7976	2.409	1004	2.409		0			3		12			1005	84		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8180	2.779	1000	2.779		0			4		13			1001	59		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8464	2.507	1000	2.507		0			5		17			1001	72		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8518	2.502	1004	2.502		0			3		12			1005	83		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8524	2.528	1004	2.528		0			3		15			1005	74		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8647	2.837	1004	2.837		0			3		9			1005	65		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8673	2.710	1000	2.710		0			2		18			1001	58		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8746	2.600	1002	2.600		0			2		16			1003	80		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8785	2.698	1002	2.698		0			2		3			1003	66		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8813	2.605	1004	2.605		0			2		1			1005	64		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8816	3.030	1004	3.030		0			4		17			1005	69		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8844	2.472	1000	2.472		0			2		10			1001	82		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8890	2.312	1000	2.312		0			4		15			1001	81		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8901	2.984	1004	2.984		0			2		16			1005	63		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8966	2.505	1004	2.505		0			4		16			1005	78		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.8977	2.735	1002	2.735		0			2		16			1003	75		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9018	2.871	1000	2.871		0			2		9			1001	79		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9048	2.280	1004	2.280		0			3		4			1005	73		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9071	2.638	1002	2.638		0			5		13			1003	62		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9093	3.072	1004	3.072		0			2		1			1005	71		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9101	2.170	1002	2.170		0			1		3			1003	57		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9244	2.189	1004	2.189		0			3		1			1005	70		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9260	2.619	1000	2.619		0			4		4			1001	60		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9468	2.807	1000	2.807		0			4		3			1001	67		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9517	2.131	1004	2.131		0			3		2			1005	61		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9603	2.632	1004	2.632		0			2		14			1005	85		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9623	2.554	1000	2.554		0			4		12			1001	77		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	17.9862	3.075	1004	3.075		0			5		15			1005	68		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	18.0101	3.069	1000	3.069		0			1		15			1001	76		0
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "Voce"	18.0225	3.093	1000	3.093		0			3		8			1001	56		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
