
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/sez1.wav" -W -d
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
f 0 76.80500551262386 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1


; --- TABELLE DEGLI INVILUPPI DI ATTACCO ---
; ifn | nome        | descrizione
;--------------------------------------------------------------------------------
f 2 0 [2^20] 6 0 [2^19] 0.5 [2^19] 1 ; Envelope per il suono
f 3 0 [2^20] 6 0 [2^5] 0.5 [2^20-2^5] 1.0  ; Impulsivo:   Attacco rapidissimo, decadimento lento
f 4 0 [2^20] 6 0 [2^20-2^5] .5 [2^5] 1.0 ; Lento (Swell): Attacco lento, decadimento più rapido
f 5 0 [2^20] 6 0 [2^5] 0.5 [2^20-2^6] 0.5 [2^5] 1.0 ; Sostenuto: Attacco, lungo sustain al picco, decadimento

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 1 2 3
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 8 12 8
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 2 3 5
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 7 9 12
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 3 4 2
f 1009 0 3 -2 0 1 0
f 1010 0 3 -2 6 8 10
f 1011 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.5563	16.000	1008	10.000		1			1		33			1009	7		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.5752	10.000	1008	10.000		4			1		30			1009	11		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.5840	16.000	1004	10.000		4			1		14			1005	10		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.5915	16.000	1006	10.000		4			2		28			1007	6		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6002	12.500	1000	10.000		4			1		15			1001	3		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6143	12.500	1004	10.000		4			1		15			1005	5		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6155	12.500	1002	10.000		4			1		31			1003	2		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6334	16.000	1000	10.000		1			1		30			1001	8		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6684	16.000	1000	10.000		4			2		23			1001	9		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	3.6766	16.000	1000	10.000		4			2		18			1001	1		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.7352	16.000	1000	10.000		1			2		15			1001	14		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.7830	16.000	1000	10.000		4			2		23			1001	15		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8003	12.500	1010	10.000		4			1		22			1011	23		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8077	10.000	1008	10.000		4			1		30			1009	16		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8143	10.000	1004	10.000		4			2		22			1005	17		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8177	10.000	1008	10.000		4			2		10			1009	22		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8245	12.500	1004	10.000		4			2		11			1005	12		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8257	16.000	1000	10.000		4			2		17			1001	18		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8674	16.000	1004	10.000		4			1		20			1005	19		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8705	12.500	1004	10.000		4			1		34			1005	21		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8763	12.500	1008	10.000		4			1		13			1009	13		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	6.8799	12.500	1004	10.000		4			2		25			1005	20		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	7.9961	12.500	1004	10.000		4			2		15			1005	33		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0499	10.000	1008	10.000		4			2		17			1009	32		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0504	12.500	1002	10.000		4			2		22			1003	26		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0511	10.000	1004	10.000		4			2		28			1005	27		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0526	16.000	1000	10.000		4			3		19			1001	35		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0583	10.000	1008	10.000		4			1		21			1009	25		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.0940	16.000	1008	10.000		4			1		10			1009	34		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1195	10.000	1008	10.000		4			2		32			1009	37		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1264	12.500	1004	10.000		4			2		17			1005	24		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1365	16.000	1010	10.000		4			1		17			1011	29		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1389	16.000	1008	10.000		4			1		28			1009	31		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1405	10.000	1010	10.000		4			2		14			1011	36		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1469	12.500	1000	10.000		3			1		12			1001	28		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	8.1724	12.500	1000	10.000		4			2		10			1001	30		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1502	12.500	1004	10.000		4			2		22			1005	48		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1564	12.500	1004	10.000		4			1		16			1005	57		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1648	10.000	1010	10.000		4			2		26			1011	44		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1650	16.000	1006	10.000		4			3		12			1007	56		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1687	12.500	1004	10.000		1			3		15			1005	38		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1698	16.000	1002	10.000		4			2		12			1003	50		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1818	12.500	1004	10.000		4			2		16			1005	40		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1883	10.000	1004	10.000		4			3		12			1005	53		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1923	16.000	1002	10.000		4			2		15			1003	43		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.1991	10.000	1002	10.000		4			3		16			1003	54		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2070	12.500	1004	10.000		4			2		29			1005	49		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2073	16.000	1002	10.000		4			3		18			1003	51		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2294	16.000	1010	10.000		1			1		13			1011	42		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2368	16.000	1004	10.000		4			3		22			1005	45		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2464	10.000	1008	10.000		4			3		20			1009	55		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2592	16.000	1004	10.000		4			2		9			1005	41		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2662	12.500	1008	10.000		4			2		21			1009	59		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2673	16.000	1008	10.000		4			3		28			1009	39		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.2865	16.000	1008	10.000		4			2		11			1009	46		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.3014	10.000	1004	10.000		4			2		15			1005	58		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8086	12.500	1004	10.000		3			3		15			1005	63		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8094	10.000	1002	10.000		4			2		24			1003	66		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8229	16.000	1008	10.000		4			3		30			1009	74		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8343	10.000	1010	10.000		4			3		10			1011	68		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8421	12.500	1004	10.000		4			3		15			1005	67		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8466	10.000	1002	10.000		4			3		16			1003	64		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8769	12.500	1008	10.000		3			3		23			1009	62		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8921	16.000	1006	10.000		4			3		20			1007	60		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.8982	12.500	1000	10.000		4			3		22			1001	61		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9110	10.000	1006	10.000		4			2		18			1007	71		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9252	16.000	1008	10.000		4			2		20			1009	72		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9442	10.000	1006	10.000		4			3		28			1007	70		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9488	12.500	1004	10.000		4			2		17			1005	75		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9764	12.500	1008	10.000		1			2		31			1009	69		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	12.9788	16.000	1010	10.000		4			3		14			1011	76		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.1871	10.000	1004	10.000		4			3		14			1005	85		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2085	10.000	1004	10.000		1			2		22			1005	87		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2322	10.000	1004	10.000		4			4		11			1005	94		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2363	16.000	1010	10.000		4			3		26			1011	91		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2527	12.500	1004	10.000		4			3		15			1005	78		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2622	16.000	1000	10.000		4			4		15			1001	90		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2668	12.500	1006	10.000		4			3		14			1007	80		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2698	10.000	1006	10.000		4			3		15			1007	84		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2725	10.000	1008	10.000		4			3		14			1009	93		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2812	16.000	1010	10.000		4			4		9			1011	81		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2829	12.500	1006	10.000		3			3		8			1007	88		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2847	12.500	1006	10.000		3			3		12			1007	95		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2867	10.000	1006	10.000		4			2		25			1007	79		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2875	10.000	1008	10.000		1			3		21			1009	89		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2910	10.000	1006	10.000		4			4		23			1007	83		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.2937	10.000	1008	10.000		4			3		23			1009	77		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.3130	12.500	1008	10.000		1			4		10			1009	96		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.3235	16.000	1008	10.000		4			4		8			1009	92		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.3270	16.000	1004	10.000		4			3		26			1005	82		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	18.3342	16.000	1000	10.000		4			3		16			1001	86		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.7630	12.500	1000	10.000		4			4		12			1001	123		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.7689	10.000	1010	10.000		4			3		8			1011	102		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8069	12.500	1004	10.000		4			4		21			1005	116		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8100	16.000	1006	10.000		4			4		18			1007	122		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8167	16.000	1010	10.000		4			4		19			1011	105		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8212	10.000	1008	10.000		4			4		10			1009	104		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8318	16.000	1008	10.000		4			5		7			1009	128		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8359	16.000	1008	10.000		3			3		7			1009	126		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8481	10.000	1006	10.000		4			5		20			1007	117		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8483	12.500	1006	10.000		1			4		9			1007	112		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8501	16.000	1006	10.000		4			5		7			1007	115		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8531	10.000	1008	10.000		4			4		16			1009	110		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8556	12.500	1002	10.000		4			4		10			1003	107		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8627	12.500	1004	10.000		4			3		13			1005	119		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8630	16.000	1008	10.000		3			4		8			1009	103		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8662	12.500	1006	10.000		4			3		15			1007	109		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8677	12.500	1010	10.000		4			3		7			1011	97		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8704	16.000	1004	10.000		4			3		9			1005	124		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8779	16.000	1008	10.000		4			4		19			1009	111		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8865	16.000	1008	10.000		4			4		15			1009	108		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8874	16.000	1000	10.000		1			4		13			1001	125		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8881	12.500	1006	10.000		4			3		15			1007	114		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8936	10.000	1002	10.000		4			4		11			1003	118		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8962	12.500	1010	10.000		4			3		11			1011	129		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.8998	12.500	1002	10.000		1			3		13			1003	127		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9035	16.000	1000	10.000		4			3		9			1001	121		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9163	12.500	1004	10.000		4			4		7			1005	113		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9222	10.000	1004	10.000		4			3		14			1005	130		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9597	12.500	1000	10.000		4			4		10			1001	99		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9638	16.000	1010	10.000		4			4		13			1011	98		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9666	10.000	1006	10.000		4			3		21			1007	106		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	26.9809	12.500	1010	10.000		4			3		11			1011	101		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.0289	16.000	1010	10.000		4			3		21			1011	120		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.0689	16.000	1002	10.000		4			4		18			1003	139		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.0836	10.000	1004	10.000		4			4		18			1005	136		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.0943	12.500	1002	10.000		4			4		15			1003	148		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1277	16.000	1008	10.000		4			3		9			1009	131		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1291	12.500	1010	10.000		4			4		20			1011	164		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1373	16.000	1006	10.000		4			3		19			1007	154		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1423	12.500	1002	10.000		4			5		12			1003	140		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1460	12.500	1010	10.000		3			4		19			1011	146		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1543	10.000	1004	10.000		4			3		8			1005	151		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1584	16.000	1002	10.000		4			3		20			1003	161		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1586	10.000	1010	10.000		4			4		20			1011	150		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1646	16.000	1000	10.000		4			3		7			1001	144		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1660	10.000	1006	10.000		4			4		9			1007	137		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1663	12.500	1000	10.000		4			5		17			1001	157		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1753	10.000	1010	10.000		4			3		13			1011	152		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1789	16.000	1008	10.000		1			3		14			1009	138		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1827	12.500	1002	10.000		4			4		16			1003	158		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1860	16.000	1004	10.000		4			3		11			1005	135		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1866	16.000	1006	10.000		4			3		10			1007	162		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.1987	16.000	1006	10.000		4			3		7			1007	155		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2015	16.000	1006	10.000		4			5		17			1007	147		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2027	10.000	1008	10.000		1			3		14			1009	153		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2067	10.000	1006	10.000		4			4		7			1007	132		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2126	16.000	1006	10.000		4			4		18			1007	163		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2143	10.000	1002	10.000		4			4		19			1003	141		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2303	10.000	1010	10.000		1			3		15			1011	149		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2368	16.000	1002	10.000		4			3		14			1003	133		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2407	10.000	1006	10.000		4			4		12			1007	143		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2437	16.000	1002	10.000		4			4		8			1003	156		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2653	16.000	1002	10.000		4			3		9			1003	145		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	27.2761	16.000	1002	10.000		3			3		10			1003	165		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6294	16.000	1002	10.000		4			5		7			1003	166		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6340	16.000	1008	10.000		1			4		17			1009	181		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6387	12.500	1010	10.000		4			3		11			1011	176		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6422	12.500	1004	10.000		3			5		13			1005	185		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6508	16.000	1002	10.000		4			4		14			1003	182		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6540	10.000	1002	10.000		4			4		6			1003	177		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6581	12.500	1004	10.000		4			3		14			1005	171		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6811	12.500	1006	10.000		4			4		8			1007	173		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.6835	12.500	1004	10.000		4			5		16			1005	167		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7016	10.000	1010	10.000		4			3		16			1011	169		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7016	16.000	1004	10.000		4			4		10			1005	172		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7044	12.500	1006	10.000		4			3		19			1007	175		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7045	12.500	1010	10.000		3			3		20			1011	187		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7062	12.500	1004	10.000		1			3		19			1005	186		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7104	16.000	1010	10.000		4			3		9			1011	184		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7213	16.000	1010	10.000		4			5		15			1011	168		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7235	12.500	1010	10.000		1			3		9			1011	178		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7374	10.000	1004	10.000		4			4		19			1005	170		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7642	10.000	1010	10.000		4			4		7			1011	183		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7659	16.000	1006	10.000		4			3		8			1007	180		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.7810	16.000	1000	10.000		4			3		10			1001	188		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9538	16.000	1004	10.000		1			3		15			1005	199		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9591	12.500	1002	10.000		1			4		14			1003	191		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9595	16.000	1008	10.000		4			5		14			1009	200		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9713	10.000	1008	10.000		1			5		16			1009	201		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9840	10.000	1008	10.000		4			4		15			1009	197		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	28.9962	12.500	1010	10.000		4			3		16			1011	206		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0036	12.500	1010	10.000		1			4		13			1011	189		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0141	10.000	1008	10.000		4			3		18			1009	195		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0290	16.000	1004	10.000		4			3		11			1005	196		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0292	16.000	1002	10.000		4			4		13			1003	194		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0364	12.500	1000	10.000		4			4		18			1001	192		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0412	12.500	1004	10.000		4			4		9			1005	190		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0503	16.000	1006	10.000		4			3		12			1007	202		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0560	10.000	1004	10.000		4			5		20			1005	208		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0587	16.000	1004	10.000		4			5		16			1005	198		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0660	12.500	1008	10.000		4			4		20			1009	204		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0673	16.000	1006	10.000		4			4		9			1007	203		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0695	10.000	1004	10.000		4			4		14			1005	193		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0713	16.000	1004	10.000		4			3		10			1005	205		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	29.0805	12.500	1004	10.000		1			4		7			1005	207		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	49.9424	1.000	1004	1.000		0			3		14			1005	209		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	49.9751	1.600	1000	1.000		0			4		15			1001	211		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	50.0144	1.000	1008	1.000		0			2		14			1009	210		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7035	1.824	1000	1.140		0			2		9			1001	218		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7301	1.824	1008	1.140		0			5		19			1009	220		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7355	1.824	1000	1.140		0			2		14			1001	214		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7847	1.425	1008	1.140		0			3		18			1009	216		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7855	1.140	1004	1.140		0			3		21			1005	221		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7907	1.425	1004	1.140		0			4		20			1005	212		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.7920	1.425	1000	1.140		0			2		11			1001	222		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.8346	1.824	1008	1.140		0			4		9			1009	215		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.8403	1.824	1004	1.140		0			4		17			1005	213		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	52.8454	1.824	1008	1.140		0			3		11			1009	217		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5265	2.048	1000	1.280		0			4		24			1001	229		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5405	1.280	1004	1.280		0			3		8			1005	237		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5505	1.280	1008	1.280		0			2		14			1009	235		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5812	2.048	1000	1.280		0			2		11			1001	231		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5852	1.280	1004	1.280		0			4		17			1005	226		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5893	1.600	1008	1.280		0			4		16			1009	240		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.5920	1.280	1008	1.280		0			4		20			1009	233		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6027	1.280	1004	1.280		0			5		20			1005	236		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6095	1.600	1004	1.280		0			3		20			1005	245		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6181	2.048	1004	1.280		0			3		12			1005	242		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6204	2.048	1008	1.280		0			3		19			1009	223		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6205	1.280	1004	1.280		0			3		8			1005	228		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6206	1.600	1008	1.280		0			2		17			1009	238		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6265	1.600	1008	1.280		0			2		20			1009	239		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6332	1.600	1004	1.280		0			4		25			1005	244		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6358	1.600	1004	1.280		0			4		24			1005	227		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6470	2.048	1000	1.280		0			5		13			1001	225		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6761	2.048	1004	1.280		0			3		24			1005	232		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.6897	1.280	1008	1.280		0			3		25			1009	243		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	55.7027	1.600	1004	1.280		0			2		13			1005	246		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.3411	1.420	1004	1.420		0			4		25			1005	248		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.3508	1.420	1008	1.420		0			3		24			1009	258		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.3596	1.775	1000	1.420		0			2		20			1001	257		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.3624	2.272	1008	1.420		0			4		17			1009	254		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.3680	1.775	1000	1.420		0			3		22			1001	255		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4045	1.420	1004	1.420		0			4		19			1005	251		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4077	1.775	1008	1.420		0			2		22			1009	259		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4088	1.775	1004	1.420		0			3		21			1005	262		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4126	2.272	1000	1.420		0			4		8			1001	267		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4127	2.272	1004	1.420		0			3		27			1005	256		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4148	1.420	1004	1.420		0			4		16			1005	252		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4158	2.272	1000	1.420		0			2		11			1001	268		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4312	1.420	1008	1.420		0			5		20			1009	253		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4399	2.272	1000	1.420		0			4		18			1001	261		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4462	1.420	1004	1.420		0			2		20			1005	249		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4488	1.420	1004	1.420		0			3		16			1005	263		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4492	1.775	1004	1.420		0			4		9			1005	260		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4520	1.775	1000	1.420		0			4		25			1001	266		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4870	1.775	1004	1.420		0			2		24			1005	265		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	58.4964	1.775	1008	1.420		0			3		13			1009	264		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1179	1.950	1008	1.560		0			2		22			1009	305		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1218	2.496	1004	1.560		0			3		16			1005	271		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1272	2.496	1008	1.560		0			3		28			1009	303		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1307	1.560	1004	1.560		0			2		19			1005	275		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1311	1.560	1008	1.560		0			3		12			1009	276		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1317	2.496	1008	1.560		0			4		30			1009	308		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1389	1.950	1008	1.560		0			5		18			1009	289		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1505	2.496	1000	1.560		0			3		25			1001	290		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1543	1.950	1004	1.560		0			4		30			1005	304		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1599	1.950	1000	1.560		0			3		19			1001	270		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1601	2.496	1000	1.560		0			5		24			1001	291		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1623	1.560	1004	1.560		0			2		27			1005	294		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1656	2.496	1008	1.560		0			5		25			1009	281		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1709	1.560	1008	1.560		0			4		28			1009	298		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1797	1.950	1008	1.560		0			3		12			1009	285		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1812	2.496	1008	1.560		0			4		8			1009	301		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1886	1.950	1004	1.560		0			4		23			1005	288		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.1903	2.496	1008	1.560		0			3		8			1009	296		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2011	2.496	1000	1.560		0			5		13			1001	278		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2062	2.496	1000	1.560		0			4		29			1001	274		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2069	2.496	1004	1.560		0			3		31			1005	286		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2098	1.950	1004	1.560		0			4		22			1005	297		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2107	1.560	1004	1.560		0			5		17			1005	284		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2144	1.950	1004	1.560		0			5		20			1005	269		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2180	1.950	1000	1.560		0			3		9			1001	282		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2196	1.560	1008	1.560		0			4		19			1009	306		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2202	1.950	1000	1.560		0			4		22			1001	280		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2225	2.496	1000	1.560		0			4		23			1001	293		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2286	1.950	1000	1.560		0			3		9			1001	272		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2370	1.560	1008	1.560		0			2		17			1009	283		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2386	2.496	1008	1.560		0			3		11			1009	295		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2477	2.496	1000	1.560		0			3		27			1001	273		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2601	2.496	1000	1.560		0			2		19			1001	287		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2626	1.950	1000	1.560		0			3		16			1001	300		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2662	2.496	1000	1.560		0			2		11			1001	299		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.2920	2.496	1000	1.560		0			4		19			1001	307		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	61.3444	2.496	1000	1.560		0			3		6			1001	279		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9012	2.125	1008	1.700		0			5		9			1009	340		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9404	2.720	1008	1.700		0			5		10			1009	324		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9468	1.700	1008	1.700		0			4		17			1009	334		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9490	1.700	1004	1.700		0			3		15			1005	344		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9514	2.720	1008	1.700		0			4		11			1009	327		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9539	1.700	1004	1.700		0			3		21			1005	326		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9548	2.720	1008	1.700		0			3		31			1009	317		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9636	2.720	1000	1.700		0			3		8			1001	323		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9705	1.700	1004	1.700		0			5		31			1005	342		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9706	2.125	1008	1.700		0			3		12			1009	319		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9744	1.700	1004	1.700		0			4		33			1005	313		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9781	1.700	1008	1.700		0			4		22			1009	315		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9873	2.125	1000	1.700		0			5		28			1001	341		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9920	1.700	1008	1.700		0			4		10			1009	335		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	63.9947	2.720	1008	1.700		0			3		29			1009	331		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0001	1.700	1008	1.700		0			5		23			1009	322		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0118	2.125	1004	1.700		0			5		33			1005	343		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0128	2.125	1008	1.700		0			3		21			1009	328		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0165	1.700	1008	1.700		0			3		13			1009	316		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0320	2.720	1000	1.700		0			3		15			1001	321		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0326	2.125	1004	1.700		0			3		14			1005	336		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0327	1.700	1004	1.700		0			2		26			1005	310		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0333	1.700	1004	1.700		0			3		31			1005	329		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0348	2.125	1004	1.700		0			3		5			1005	332		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0354	2.125	1004	1.700		0			4		9			1005	309		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0370	2.720	1000	1.700		0			5		19			1001	318		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0452	1.700	1004	1.700		0			3		20			1005	330		0		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0470	1.700	1004	1.700		0			3		13			1005	337		0		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0486	1.700	1004	1.700		0			5		10			1005	320		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0528	2.125	1000	1.700		0			4		11			1001	325		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0730	1.700	1008	1.700		0			5		6			1009	311		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0734	2.125	1004	1.700		0			5		13			1005	338		1		1		2
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0797	2.125	1000	1.700		0			3		31			1001	314		1		1		3
;			at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode	movimento
i "Voce"	64.0850	2.720	1008	1.700		0			2		26			1009	333		1		1		2

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
