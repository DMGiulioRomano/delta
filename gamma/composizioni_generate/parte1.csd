
<CsoundSynthesizer>
<CsOptions>
-o "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/composizioni_generate/wav/parte1.wav" -W -d -m0
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

gk_SectionEnv init 1 
gi_debug init 1

#include "../includes/inviluppoSezione.orc"
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
f 0 159.0 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1


; --- TABELLE DEGLI INVILUPPI DI ATTACCO ---
; ifn | nome        | descrizione
;--------------------------------------------------------------------------------
f 2 0 [2^20] 6 0 [2^19] 0.5 [2^19] 1 ; Envelope per il suono
f 3 0 [2^12] 6 0 [2^5] 0.5 [2^12-2^5] 1.0  ; Impulsivo:   Attacco rapidissimo, decadimento lento
f 4 0 [2^20] 6 0 [2^20-2^5] .5 [2^5] 1.0 ; Lento (Swell): Attacco lento, decadimento più rapido
f 5 0 [2^20] 6 0 [2^5] 0.5 [2^20-2^6] 0.5 [2^5] 1.0 ; Sostenuto: Attacco, lungo sustain al picco, decadimento


f 20 0 4096 7 1 4096 1              ; 20: crescendo_lento (lineare da 0 a 1)
f 21 0 4096 7 1 4096 0.001              ; 21: diminuendo_rapido (lineare da 1 a 0)
f 22 0 4096 10 1                    ; 22: plateau_forte (costante a 1)
f 23 0 4096 6 0.001 2048 1 2048 0.001       ; 23: crescendo_diminuendo (triangolare)
f 24 0 4096 6 0.001 128 1 [4096-128] 0.001       ; 23: crescendo_diminuendo (triangolare)

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 4 -2 2 10 4 15
f 1001 0 4 -2 0 1 2 3
f 1002 0 4 -2 3 20 5 8
f 1003 0 4 -2 0 1 2 3
f 1004 0 3 -2 6 8 10
f 1005 0 3 -2 0 1 2
f 1006 0 3 -2 7 9 12
f 1007 0 3 -2 0 1 2
f 1008 0 3 -2 8 12 8
f 1009 0 3 -2 0 1 2

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	0.0010	28.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	2.7360	22.400	1000	14.000		3			5		31			1001	2		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	2.7503	22.400	1002	14.000		3			9		14			1003	5		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	2.7689	17.500	1000	14.000		3			4		33			1001	4		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	2.8180	14.000	1000	14.000		3			9		49			1001	1		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	2.8201	22.400	1002	14.000		3			9		17			1003	3		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.7365	17.500	1002	14.000		3			5		17			1003	8		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.7388	22.400	1000	14.000		3			5		35			1001	10		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.7963	22.400	1000	14.000		3			4		31			1001	6		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.7985	22.400	1000	14.000		3			3		18			1001	13		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.8150	22.400	1000	14.000		3			2		44			1001	12		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.8245	22.400	1000	14.000		3			8		45			1001	11		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.8489	17.500	1000	14.000		3			7		30			1001	9		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.8667	14.000	1000	14.000		3			6		34			1001	7		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	3.8984	22.400	1000	14.000		3			3		33			1001	14		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	4.9918	14.000	1000	14.000		3			9		25			1001	16		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.0496	14.000	1000	14.000		3			2		50			1001	15		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.0514	14.000	1000	14.000		3			7		33			1001	21		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.0566	22.400	1000	14.000		3			5		36			1001	18		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.0591	14.000	1000	14.000		3			8		29			1001	24		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.1054	17.500	1000	14.000		3			8		12			1001	19		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.1107	22.400	1000	14.000		3			6		48			1001	22		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.1256	17.500	1000	14.000		3			4		41			1001	23		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.1382	17.500	1000	14.000		3			3		40			1001	20		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	5.1553	22.400	1002	14.000		3			9		34			1003	17		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5378	14.000	1002	14.000		3			2		40			1003	27		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5602	17.500	1002	14.000		3			5		31			1003	29		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5636	17.500	1000	14.000		3			8		11			1001	28		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5713	14.000	1000	14.000		3			6		49			1001	26		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5915	14.000	1000	14.000		3			2		12			1001	25		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5960	22.400	1000	14.000		3			4		33			1001	31		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	8.5969	17.500	1000	14.000		3			2		17			1001	30		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	9.1833	22.400	1002	14.000		3			5		48			1003	33		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	9.1885	14.000	1000	14.000		3			3		22			1001	35		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	9.2464	14.000	1002	14.000		3			3		19			1003	36		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	9.2465	14.000	1000	14.000		3			9		46			1001	34		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	9.2538	14.000	1000	14.000		3			2		47			1001	32		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1180	17.500	1002	14.000		3			9		38			1003	46		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1209	14.000	1002	14.000		3			4		41			1003	38		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1513	14.000	1000	14.000		3			5		17			1001	42		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1538	17.500	1000	14.000		3			7		17			1001	45		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1614	17.500	1000	14.000		3			3		40			1001	41		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1852	22.400	1002	14.000		3			8		26			1003	40		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.1929	14.000	1000	14.000		3			7		38			1001	39		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.2091	22.400	1002	14.000		3			8		16			1003	43		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.2424	22.400	1000	14.000		3			5		26			1001	44		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	10.2591	17.500	1002	14.000		3			7		41			1003	37		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.8649	17.500	1000	14.000		3			8		17			1001	55		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9196	14.000	1000	14.000		3			6		13			1001	53		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9526	14.000	1000	14.000		3			9		18			1001	50		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9527	14.000	1000	14.000		3			3		36			1001	51		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9663	17.500	1000	14.000		3			6		37			1001	52		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9731	17.500	1002	14.000		3			2		45			1003	49		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9909	17.500	1002	14.000		3			9		19			1003	47		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	11.9985	17.500	1002	14.000		3			2		43			1003	56		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.0822	17.500	1000	14.000		3			5		48			1001	48		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.0840	14.000	1002	14.000		3			7		24			1003	54		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.1711	14.000	1000	14.000		3			3		26			1001	63		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.1725	22.400	1000	14.000		3			3		20			1001	60		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.1768	17.500	1000	14.000		3			3		39			1001	58		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.2321	17.500	1000	14.000		3			5		48			1001	62		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.2349	22.400	1002	14.000		3			7		49			1003	57		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.2498	14.000	1002	14.000		3			2		50			1003	64		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.2842	14.000	1002	14.000		3			5		41			1003	59		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	12.3037	14.000	1002	14.000		3			6		35			1003	61		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.3052	17.500	1000	14.000		3			8		12			1001	67		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.3138	17.500	1000	14.000		3			5		30			1001	69		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.3375	22.400	1002	14.000		3			4		44			1003	66		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.3857	14.000	1002	14.000		3			5		26			1003	65		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.4036	22.400	1002	14.000		3			8		27			1003	68		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.7805	17.500	1002	14.000		3			9		12			1003	70		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.7930	17.500	1002	14.000		3			2		24			1003	74		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.7986	17.500	1000	14.000		3			2		10			1001	71		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.8304	17.500	1002	14.000		3			9		20			1003	73		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.8418	14.000	1002	14.000		3			7		43			1003	76		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.8723	17.500	1000	14.000		3			7		41			1001	75		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	13.8931	22.400	1000	14.000		3			5		25			1001	72		0		1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	28.0000	6.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.0762	3.000	1002	3.000		2			7		37			1003	80		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.1546	3.000	1002	3.000		2			4		48			1003	78		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.1658	4.800	1000	3.000		2			7		49			1001	79		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.1742	3.000	1000	3.000		2			4		42			1001	77		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.1958	4.800	1000	3.000		2			6		41			1001	84		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2182	3.750	1000	3.000		2			7		41			1001	82		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2282	3.000	1002	3.000		2			5		12			1003	89		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2305	3.750	1000	3.000		2			5		28			1001	86		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2392	3.750	1002	3.000		2			7		19			1003	85		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2620	4.800	1000	3.000		2			8		19			1001	81		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2723	4.800	1002	3.000		2			8		41			1003	91		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2754	3.000	1002	3.000		2			7		17			1003	83		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.2880	4.800	1000	3.000		2			7		26			1001	87		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.3596	4.800	1002	3.000		2			8		47			1003	88		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.3628	3.750	1002	3.000		2			5		47			1003	93		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.3821	3.000	1002	3.000		2			4		40			1003	92		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.4228	3.750	1000	3.000		2			7		24			1001	90		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.5169	3.750	1002	3.000		2			6		20			1003	95		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.6118	4.800	1002	3.000		2			5		16			1003	94		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.6715	4.800	1000	3.000		2			8		30			1001	97		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7209	3.000	1002	3.000		2			5		27			1003	96		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7452	3.000	1002	3.000		2			4		50			1003	102		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7529	4.800	1000	3.000		2			6		20			1001	100		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7558	3.750	1000	3.000		2			8		12			1001	98		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7669	4.800	1000	3.000		2			7		36			1001	101		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	28.7701	3.750	1000	3.000		2			6		34			1001	99		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	29.9189	4.800	1002	3.000		2			7		23			1003	104		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	29.9923	3.750	1000	3.000		2			6		32			1001	103		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.3061	3.750	1002	3.000		2			6		29			1003	109		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.3440	4.800	1000	3.000		2			4		36			1001	105		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.3569	3.000	1002	3.000		2			6		49			1003	106		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.3648	3.000	1002	3.000		2			7		19			1003	110		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.3943	3.750	1002	3.000		2			5		13			1003	108		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.4184	4.800	1000	3.000		2			5		23			1001	107		1		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.5967	4.800	1000	3.000		2			7		26			1001	112		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.6314	4.800	1002	3.000		2			8		33			1003	116		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.6841	3.000	1002	3.000		2			6		25			1003	113		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.7068	3.000	1000	3.000		2			4		31			1001	115		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.7178	3.000	1002	3.000		2			7		28			1003	111		0		-1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	30.7367	3.750	1002	3.000		2			8		10			1003	114		0		-1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	34.0000	16.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.8805	8.000	1002	8.000		3			7		47			1003	165		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.8886	12.800	1002	8.000		3			8		35			1003	157		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.8980	8.000	1000	8.000		3			3		26			1001	144		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.8997	10.000	1000	8.000		3			7		44			1001	118		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9363	8.000	1002	8.000		3			8		20			1003	145		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9367	12.800	1000	8.000		3			4		49			1001	172		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9412	10.000	1002	8.000		3			6		40			1003	158		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9412	12.800	1002	8.000		3			7		10			1003	141		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9456	8.000	1000	8.000		3			8		26			1001	127		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9527	12.800	1000	8.000		3			7		42			1001	137		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9531	10.000	1000	8.000		3			9		13			1001	148		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9546	12.800	1002	8.000		3			8		31			1003	129		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9564	10.000	1000	8.000		3			9		25			1001	128		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9565	12.800	1002	8.000		3			9		18			1003	169		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9567	12.800	1002	8.000		3			8		40			1003	162		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9584	8.000	1000	8.000		3			8		22			1001	179		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9587	10.000	1002	8.000		3			8		14			1003	131		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9605	10.000	1002	8.000		3			4		25			1003	135		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9611	8.000	1000	8.000		3			5		14			1001	134		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9613	12.800	1002	8.000		3			6		50			1003	146		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9678	8.000	1000	8.000		3			2		40			1001	163		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9679	10.000	1000	8.000		3			9		13			1001	170		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9684	10.000	1000	8.000		3			9		40			1001	156		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9689	12.800	1002	8.000		3			3		31			1003	124		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9728	8.000	1002	8.000		3			9		25			1003	174		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9786	10.000	1000	8.000		3			9		45			1001	166		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9796	12.800	1000	8.000		3			4		15			1001	161		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9804	10.000	1002	8.000		3			2		27			1003	126		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9826	12.800	1002	8.000		3			5		47			1003	122		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9829	10.000	1002	8.000		3			5		30			1003	150		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9854	10.000	1002	8.000		3			4		43			1003	138		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9867	10.000	1000	8.000		3			4		35			1001	160		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9876	12.800	1000	8.000		3			9		31			1001	155		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9900	12.800	1000	8.000		3			3		45			1001	147		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	37.9907	12.800	1000	8.000		3			9		23			1001	143		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0018	8.000	1002	8.000		3			5		45			1003	149		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0023	8.000	1000	8.000		3			7		12			1001	178		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0024	12.800	1000	8.000		3			4		15			1001	132		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0043	12.800	1002	8.000		3			3		36			1003	139		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0046	8.000	1000	8.000		3			2		22			1001	180		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0061	8.000	1000	8.000		3			6		21			1001	121		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0072	12.800	1000	8.000		3			7		23			1001	153		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0082	8.000	1000	8.000		3			5		35			1001	120		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0104	12.800	1000	8.000		3			2		17			1001	159		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0120	8.000	1000	8.000		3			3		49			1001	136		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0121	10.000	1002	8.000		3			8		50			1003	175		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0124	12.800	1002	8.000		3			8		39			1003	117		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0127	8.000	1002	8.000		3			3		14			1003	125		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0163	10.000	1000	8.000		3			2		42			1001	164		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0190	8.000	1002	8.000		3			5		44			1003	140		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0217	12.800	1000	8.000		3			6		14			1001	154		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0244	10.000	1002	8.000		3			6		37			1003	152		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0278	12.800	1002	8.000		3			4		38			1003	168		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0344	8.000	1002	8.000		3			7		11			1003	171		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0354	10.000	1000	8.000		3			9		19			1001	133		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0399	8.000	1002	8.000		3			7		34			1003	130		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0462	8.000	1002	8.000		3			5		37			1003	142		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0497	12.800	1000	8.000		3			7		21			1001	183		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0576	10.000	1002	8.000		3			6		19			1003	182		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0598	8.000	1002	8.000		3			5		10			1003	119		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0673	8.000	1002	8.000		3			6		11			1003	151		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0820	8.000	1002	8.000		3			3		38			1003	167		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0874	12.800	1002	8.000		3			4		31			1003	176		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0890	12.800	1002	8.000		3			8		47			1003	181		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0954	8.000	1000	8.000		3			7		40			1001	177		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.0974	12.800	1000	8.000		3			3		38			1001	123		0		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	38.1026	10.000	1000	8.000		3			3		13			1001	173		0		1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	50.0000	28.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0138	14.000	1000	14.000		0			8		19			1001	222		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0224	17.500	1000	14.000		0			6		19			1001	185		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0375	14.000	1002	14.000		0			2		19			1003	207		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0399	22.400	1002	14.000		0			9		19			1003	193		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0610	14.000	1000	14.000		0			3		19			1001	225		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0617	17.500	1002	14.000		0			7		19			1003	210		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0627	14.000	1000	14.000		0			6		19			1001	187		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0648	17.500	1002	14.000		0			3		19			1003	216		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0701	22.400	1002	14.000		0			9		19			1003	199		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0779	22.400	1002	14.000		0			7		19			1003	220		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0800	22.400	1002	14.000		0			7		19			1003	223		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0815	22.400	1000	14.000		0			7		19			1001	226		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0870	22.400	1002	14.000		0			5		19			1003	206		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0878	14.000	1002	14.000		0			4		19			1003	209		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0946	22.400	1002	14.000		0			3		19			1003	218		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0947	22.400	1000	14.000		0			8		19			1001	196		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0953	14.000	1000	14.000		0			2		19			1001	219		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0971	17.500	1000	14.000		0			6		19			1001	208		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0973	14.000	1000	14.000		0			7		19			1001	184		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.0978	17.500	1000	14.000		0			2		19			1001	186		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1010	17.500	1000	14.000		0			3		19			1001	211		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1044	17.500	1000	14.000		0			4		19			1001	212		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1074	22.400	1000	14.000		0			7		19			1001	215		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1077	14.000	1002	14.000		0			6		19			1003	213		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1126	17.500	1002	14.000		0			5		19			1003	189		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1135	17.500	1002	14.000		0			4		19			1003	202		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1168	22.400	1000	14.000		0			5		19			1001	221		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1188	14.000	1000	14.000		0			2		19			1001	204		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1261	22.400	1000	14.000		0			2		19			1001	192		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1262	22.400	1000	14.000		0			7		19			1001	188		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1291	22.400	1002	14.000		0			7		19			1003	191		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1342	22.400	1002	14.000		0			3		19			1003	195		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1411	22.400	1002	14.000		0			3		19			1003	201		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1465	17.500	1000	14.000		0			2		19			1001	217		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1519	22.400	1000	14.000		0			2		19			1001	203		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1580	14.000	1000	14.000		0			2		19			1001	205		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1648	14.000	1000	14.000		0			7		19			1001	197		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1661	17.500	1002	14.000		0			4		19			1003	200		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.1906	22.400	1000	14.000		0			8		19			1001	194		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.2052	22.400	1002	14.000		0			3		19			1003	214		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.2064	17.500	1002	14.000		0			8		19			1003	198		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.2233	17.500	1002	14.000		0			1		19			1003	190		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	50.2595	17.500	1002	14.000		0			6		19			1003	224		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.5913	17.500	1002	14.000		0			5		19			1003	250		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6171	22.400	1000	14.000		0			4		19			1001	230		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6205	17.500	1000	14.000		0			5		19			1001	263		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6323	14.000	1002	14.000		0			9		19			1003	268		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6440	22.400	1000	14.000		0			7		19			1001	236		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6549	22.400	1002	14.000		0			7		19			1003	245		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6554	17.500	1000	14.000		0			8		19			1001	266		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6582	14.000	1002	14.000		0			4		19			1003	233		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6635	14.000	1002	14.000		0			3		19			1003	243		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6682	17.500	1000	14.000		0			3		19			1001	257		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6690	17.500	1002	14.000		0			2		19			1003	246		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6707	14.000	1002	14.000		0			2		19			1003	258		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6708	17.500	1000	14.000		0			8		19			1001	251		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6714	22.400	1000	14.000		0			4		19			1001	242		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6719	14.000	1000	14.000		0			6		19			1001	267		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6730	22.400	1002	14.000		0			5		19			1003	228		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6734	22.400	1000	14.000		0			2		19			1001	254		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6786	22.400	1000	14.000		0			3		19			1001	232		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6801	14.000	1000	14.000		0			4		19			1001	234		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6844	14.000	1002	14.000		0			5		19			1003	244		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6849	17.500	1002	14.000		0			3		19			1003	248		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6863	22.400	1002	14.000		0			3		19			1003	264		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6863	17.500	1002	14.000		0			3		19			1003	260		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6865	22.400	1000	14.000		0			3		19			1001	262		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6928	14.000	1000	14.000		0			8		19			1001	229		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6947	22.400	1002	14.000		0			6		19			1003	237		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6982	17.500	1002	14.000		0			6		19			1003	253		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.6997	17.500	1002	14.000		0			5		19			1003	227		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7002	17.500	1000	14.000		0			9		19			1001	235		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7019	14.000	1000	14.000		0			3		19			1001	249		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7051	22.400	1002	14.000		0			1		19			1003	239		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7197	22.400	1000	14.000		0			2		19			1001	241		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7253	14.000	1000	14.000		0			8		19			1001	252		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7257	22.400	1000	14.000		0			7		19			1001	240		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7301	17.500	1002	14.000		0			7		19			1003	313		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7301	22.400	1000	14.000		0			4		19			1001	259		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7342	22.400	1002	14.000		0			2		19			1003	238		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7471	17.500	1000	14.000		0			2		19			1001	255		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7514	22.400	1002	14.000		0			3		19			1003	256		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7529	14.000	1002	14.000		0			1		19			1003	265		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7536	22.400	1000	14.000		0			6		19			1001	231		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7548	14.000	1000	14.000		0			3		19			1001	247		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7668	22.400	1000	14.000		0			6		19			1001	318		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7747	17.500	1000	14.000		0			7		19			1001	261		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.7895	17.500	1000	14.000		0			6		19			1001	294		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8024	22.400	1002	14.000		0			5		19			1003	302		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8050	14.000	1002	14.000		0			7		19			1003	317		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8164	14.000	1000	14.000		0			5		19			1001	299		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8230	14.000	1002	14.000		0			8		19			1003	270		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8232	17.500	1002	14.000		0			5		19			1003	306		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8234	22.400	1002	14.000		0			2		19			1003	292		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8284	17.500	1000	14.000		0			6		19			1001	283		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8338	17.500	1002	14.000		0			6		19			1003	322		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8374	17.500	1002	14.000		0			3		19			1003	331		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8419	22.400	1002	14.000		0			8		19			1003	310		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8495	22.400	1000	14.000		0			2		19			1001	323		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8546	22.400	1000	14.000		0			5		19			1001	311		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8550	22.400	1002	14.000		0			4		19			1003	305		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8552	22.400	1000	14.000		0			4		19			1001	307		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8560	14.000	1000	14.000		0			7		19			1001	315		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8565	14.000	1000	14.000		0			4		19			1001	275		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8595	14.000	1000	14.000		0			3		19			1001	314		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8598	14.000	1002	14.000		0			5		19			1003	272		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8638	22.400	1000	14.000		0			4		19			1001	298		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8658	22.400	1002	14.000		0			4		19			1003	289		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8673	17.500	1000	14.000		0			6		19			1001	329		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8703	22.400	1000	14.000		0			3		19			1001	304		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8732	17.500	1000	14.000		0			9		19			1001	296		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8758	22.400	1002	14.000		0			7		19			1003	279		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8761	17.500	1002	14.000		0			6		19			1003	312		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8770	22.400	1000	14.000		0			7		19			1001	288		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8787	22.400	1000	14.000		0			6		19			1001	309		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8811	17.500	1002	14.000		0			2		19			1003	308		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8819	14.000	1002	14.000		0			1		19			1003	284		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8823	14.000	1000	14.000		0			4		19			1001	319		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8834	22.400	1000	14.000		0			2		19			1001	285		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8854	14.000	1000	14.000		0			2		19			1001	280		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8939	17.500	1000	14.000		0			4		19			1001	281		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8962	17.500	1002	14.000		0			2		19			1003	278		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.8995	14.000	1000	14.000		0			9		19			1001	333		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9001	14.000	1002	14.000		0			3		19			1003	301		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9008	14.000	1000	14.000		0			7		19			1001	316		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9018	14.000	1000	14.000		0			2		19			1001	282		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9022	22.400	1000	14.000		0			8		19			1001	295		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9029	14.000	1000	14.000		0			6		19			1001	297		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9066	22.400	1002	14.000		0			5		19			1003	276		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9090	17.500	1002	14.000		0			4		19			1003	334		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9095	14.000	1002	14.000		0			9		19			1003	274		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9175	17.500	1002	14.000		0			8		19			1003	303		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9176	14.000	1002	14.000		0			2		19			1003	327		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9177	22.400	1000	14.000		0			5		19			1001	300		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9193	14.000	1002	14.000		0			5		19			1003	271		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9197	17.500	1002	14.000		0			5		19			1003	287		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9229	14.000	1002	14.000		0			3		19			1003	290		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9245	22.400	1002	14.000		0			8		19			1003	277		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9264	17.500	1000	14.000		0			2		19			1001	321		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9276	14.000	1000	14.000		0			3		19			1001	320		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9299	14.000	1002	14.000		0			9		19			1003	325		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9386	14.000	1002	14.000		0			6		19			1003	330		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9392	14.000	1000	14.000		0			8		19			1001	293		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9502	17.500	1002	14.000		0			5		19			1003	332		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9565	14.000	1002	14.000		0			5		19			1003	291		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9622	14.000	1000	14.000		0			9		19			1001	324		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9629	22.400	1000	14.000		0			6		19			1001	328		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9643	14.000	1002	14.000		0			7		19			1003	269		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9705	14.000	1000	14.000		0			6		19			1001	326		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	51.9719	22.400	1000	14.000		0			7		19			1001	286		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	52.0157	17.500	1002	14.000		0			4		19			1003	273		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0034	17.500	1002	14.000		0			1		19			1003	347		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0267	14.000	1000	14.000		0			2		19			1001	379		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0436	14.000	1002	14.000		0			3		19			1003	359		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0526	22.400	1002	14.000		0			8		19			1003	370		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0624	14.000	1000	14.000		0			7		19			1001	363		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0699	17.500	1002	14.000		0			5		19			1003	343		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0716	14.000	1002	14.000		0			2		19			1003	344		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0828	22.400	1000	14.000		0			5		19			1001	384		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0878	14.000	1002	14.000		0			5		18			1003	377		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0910	14.000	1000	14.000		0			8		18			1001	376		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.0925	14.000	1002	14.000		0			8		18			1003	374		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1017	17.500	1002	14.000		0			3		19			1003	368		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1029	22.400	1002	14.000		0			3		19			1003	339		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1066	22.400	1000	14.000		0			5		19			1001	355		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1118	17.500	1002	14.000		0			7		19			1003	337		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1131	17.500	1000	14.000		0			6		19			1001	373		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1137	17.500	1000	14.000		0			5		18			1001	362		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1146	17.500	1000	14.000		0			6		19			1001	375		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1292	14.000	1002	14.000		0			9		18			1003	361		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1293	17.500	1002	14.000		0			6		19			1003	336		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1312	14.000	1000	14.000		0			5		19			1001	365		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1322	17.500	1000	14.000		0			6		19			1001	345		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1336	17.500	1002	14.000		0			8		18			1003	357		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1338	22.400	1000	14.000		0			4		19			1001	383		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1340	17.500	1000	14.000		0			6		18			1001	340		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1376	14.000	1000	14.000		0			6		18			1001	353		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1377	17.500	1000	14.000		0			5		19			1001	371		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1381	22.400	1000	14.000		0			4		19			1001	351		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1385	22.400	1000	14.000		0			5		18			1001	378		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1386	14.000	1000	14.000		0			3		18			1001	358		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1408	17.500	1002	14.000		0			8		19			1003	354		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1417	22.400	1000	14.000		0			6		19			1001	356		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1480	22.400	1002	14.000		0			6		18			1003	338		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1489	17.500	1002	14.000		0			8		18			1003	381		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1494	22.400	1002	14.000		0			8		18			1003	360		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1562	22.400	1000	14.000		0			7		18			1001	366		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1567	17.500	1002	14.000		0			7		19			1003	349		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1580	17.500	1002	14.000		0			5		19			1003	335		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1587	22.400	1002	14.000		0			8		18			1003	350		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1595	14.000	1002	14.000		0			8		18			1003	367		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1625	14.000	1002	14.000		0			6		18			1003	346		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1631	22.400	1000	14.000		0			8		18			1001	369		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1632	17.500	1000	14.000		0			7		18			1001	380		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1741	22.400	1002	14.000		0			7		18			1003	382		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1756	22.400	1000	14.000		0			2		19			1001	348		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1763	17.500	1002	14.000		0			5		19			1003	372		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.1962	17.500	1002	14.000		0			4		19			1003	342		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.2103	17.500	1000	14.000		0			3		18			1001	341		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.2145	22.400	1000	14.000		0			1		18			1001	352		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	55.2427	14.000	1002	14.000		0			8		18			1003	364		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1434	17.500	1000	14.000		0			2		17			1001	407		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1574	22.400	1000	14.000		0			9		18			1001	393		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1635	22.400	1002	14.000		0			3		19			1003	409		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1649	22.400	1002	14.000		0			5		19			1003	448		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1688	14.000	1000	14.000		0			5		18			1001	453		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1773	14.000	1000	14.000		0			7		17			1001	417		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1783	17.500	1000	14.000		0			3		18			1001	460		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1806	14.000	1000	14.000		0			4		17			1001	406		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1809	14.000	1000	14.000		0			3		18			1001	403		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1814	17.500	1002	14.000		0			6		18			1003	428		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1815	14.000	1002	14.000		0			5		19			1003	420		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1860	22.400	1000	14.000		0			5		19			1001	391		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1897	14.000	1002	14.000		0			2		18			1003	392		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1905	17.500	1002	14.000		0			5		18			1003	402		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.1953	14.000	1002	14.000		0			2		19			1003	405		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2023	14.000	1000	14.000		0			5		19			1001	458		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2034	22.400	1000	14.000		0			8		18			1001	387		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2037	17.500	1002	14.000		0			6		17			1003	424		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2152	14.000	1002	14.000		0			2		19			1003	423		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2210	14.000	1000	14.000		0			9		19			1001	426		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2261	17.500	1000	14.000		0			4		17			1001	414		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2266	17.500	1000	14.000		0			3		18			1001	396		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2274	22.400	1002	14.000		0			6		17			1003	443		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2332	17.500	1000	14.000		0			4		17			1001	437		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2340	14.000	1000	14.000		0			8		18			1001	455		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2341	22.400	1000	14.000		0			8		18			1001	395		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2342	17.500	1000	14.000		0			4		17			1001	400		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2344	22.400	1002	14.000		0			2		19			1003	457		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2350	17.500	1000	14.000		0			8		17			1001	388		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2426	22.400	1000	14.000		0			2		18			1001	412		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2435	14.000	1000	14.000		0			3		18			1001	427		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2436	22.400	1002	14.000		0			3		17			1003	401		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2439	22.400	1002	14.000		0			5		17			1003	390		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2449	17.500	1000	14.000		0			7		19			1001	385		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2457	17.500	1002	14.000		0			5		18			1003	449		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2457	22.400	1000	14.000		0			4		19			1001	434		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2460	17.500	1002	14.000		0			8		17			1003	446		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2469	14.000	1002	14.000		0			6		18			1003	389		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2526	22.400	1000	14.000		0			9		19			1001	451		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2541	14.000	1002	14.000		0			8		18			1003	441		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2555	14.000	1000	14.000		0			9		19			1001	404		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2576	22.400	1000	14.000		0			8		18			1001	422		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2590	17.500	1000	14.000		0			6		18			1001	421		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2596	17.500	1000	14.000		0			6		17			1001	408		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2601	14.000	1002	14.000		0			3		19			1003	454		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2612	22.400	1000	14.000		0			6		19			1001	411		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2616	17.500	1000	14.000		0			7		18			1001	429		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2620	14.000	1000	14.000		0			5		17			1001	397		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2620	17.500	1002	14.000		0			7		18			1003	386		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2651	14.000	1002	14.000		0			5		17			1003	439		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2651	22.400	1002	14.000		0			4		18			1003	438		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2653	14.000	1002	14.000		0			5		19			1003	440		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2694	17.500	1000	14.000		0			2		19			1001	444		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2717	17.500	1000	14.000		0			3		18			1001	425		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2738	17.500	1002	14.000		0			8		18			1003	442		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2747	22.400	1000	14.000		0			3		18			1001	435		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2750	14.000	1002	14.000		0			4		19			1003	413		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2755	22.400	1002	14.000		0			2		19			1003	418		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2779	17.500	1002	14.000		0			5		19			1003	447		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2787	17.500	1002	14.000		0			7		19			1003	450		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2791	17.500	1002	14.000		0			7		18			1003	445		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2828	22.400	1002	14.000		0			8		18			1003	436		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2831	14.000	1000	14.000		0			1		19			1001	415		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2911	14.000	1002	14.000		0			4		19			1003	430		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.2924	14.000	1002	14.000		0			2		17			1003	398		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3002	22.400	1002	14.000		0			3		19			1003	399		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3084	14.000	1000	14.000		0			6		18			1001	459		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3092	22.400	1002	14.000		0			3		17			1003	431		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3096	14.000	1000	14.000		0			4		19			1001	433		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3121	14.000	1000	14.000		0			2		18			1001	452		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3204	17.500	1002	14.000		0			8		17			1003	419		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3219	17.500	1002	14.000		0			1		19			1003	461		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3262	22.400	1002	14.000		0			7		18			1003	432		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3338	17.500	1000	14.000		0			4		18			1001	394		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3478	14.000	1000	14.000		0			1		18			1001	416		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3680	17.500	1002	14.000		0			4		19			1003	456		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	57.3712	14.000	1002	14.000		0			8		17			1003	410		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5251	17.500	1000	14.000		0			7		17			1001	514		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5712	22.400	1002	14.000		0			5		16			1003	520		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5791	17.500	1002	14.000		0			9		17			1003	582		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5828	14.000	1000	14.000		0			2		19			1001	471		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5915	17.500	1000	14.000		0			1		18			1001	515		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5964	14.000	1000	14.000		0			6		19			1001	495		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.5987	17.500	1000	14.000		0			8		16			1001	552		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6057	14.000	1000	14.000		0			6		17			1001	576		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6100	17.500	1000	14.000		0			2		17			1001	581		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6117	17.500	1000	14.000		0			4		17			1001	534		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6123	17.500	1002	14.000		0			2		16			1003	483		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6124	17.500	1000	14.000		0			5		16			1001	475		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6135	14.000	1000	14.000		0			7		15			1001	540		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6150	17.500	1002	14.000		0			4		17			1003	463		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6155	17.500	1000	14.000		0			8		18			1001	555		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6161	17.500	1000	14.000		0			9		16			1001	513		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6196	22.400	1000	14.000		0			6		18			1001	482		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6196	14.000	1000	14.000		0			4		15			1001	565		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6231	22.400	1002	14.000		0			3		19			1003	517		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6238	17.500	1002	14.000		0			3		15			1003	532		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6253	14.000	1000	14.000		0			4		15			1001	562		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6294	17.500	1000	14.000		0			3		17			1001	531		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6298	17.500	1002	14.000		0			8		15			1003	560		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6313	17.500	1002	14.000		0			1		17			1003	547		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6329	17.500	1000	14.000		0			5		17			1001	549		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6348	17.500	1000	14.000		0			2		18			1001	563		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6355	17.500	1000	14.000		0			1		18			1001	487		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6362	22.400	1002	14.000		0			3		16			1003	488		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6372	17.500	1000	14.000		0			5		15			1001	511		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6382	22.400	1002	14.000		0			4		18			1003	462		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6382	22.400	1002	14.000		0			8		19			1003	578		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6389	14.000	1000	14.000		0			5		16			1001	464		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6390	14.000	1000	14.000		0			7		16			1001	573		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6397	17.500	1000	14.000		0			4		17			1001	491		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6431	22.400	1000	14.000		0			3		15			1001	496		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6442	17.500	1002	14.000		0			5		16			1003	583		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6447	14.000	1000	14.000		0			2		15			1001	525		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6456	14.000	1000	14.000		0			6		19			1001	535		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6473	22.400	1000	14.000		0			6		15			1001	493		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6474	14.000	1002	14.000		0			6		16			1003	543		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6476	22.400	1000	14.000		0			4		15			1001	500		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6479	14.000	1000	14.000		0			7		15			1001	545		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6497	22.400	1002	14.000		0			9		17			1003	468		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6501	17.500	1002	14.000		0			3		19			1003	490		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6542	14.000	1000	14.000		0			4		19			1001	479		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6555	14.000	1000	14.000		0			5		16			1001	529		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6581	17.500	1000	14.000		0			6		17			1001	509		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6584	14.000	1000	14.000		0			5		19			1001	477		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6585	22.400	1002	14.000		0			2		15			1003	539		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6598	22.400	1000	14.000		0			9		18			1001	506		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6612	22.400	1000	14.000		0			9		16			1001	530		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6619	17.500	1000	14.000		0			7		16			1001	469		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6621	22.400	1000	14.000		0			3		16			1001	575		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6623	22.400	1002	14.000		0			2		18			1003	521		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6626	17.500	1000	14.000		0			2		19			1001	533		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6632	22.400	1002	14.000		0			8		15			1003	548		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6636	17.500	1000	14.000		0			7		19			1001	503		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6658	17.500	1002	14.000		0			3		16			1003	481		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6661	17.500	1002	14.000		0			5		17			1003	524		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6681	17.500	1002	14.000		0			2		18			1003	522		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6686	22.400	1002	14.000		0			2		17			1003	551		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6708	22.400	1000	14.000		0			4		19			1001	566		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6719	14.000	1000	14.000		0			8		15			1001	567		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6724	14.000	1002	14.000		0			5		18			1003	584		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6729	14.000	1002	14.000		0			6		19			1003	486		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6746	22.400	1002	14.000		0			5		19			1003	587		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6762	22.400	1002	14.000		0			4		17			1003	504		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6780	14.000	1002	14.000		0			3		16			1003	497		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6788	22.400	1002	14.000		0			8		17			1003	498		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6803	17.500	1000	14.000		0			3		19			1001	478		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6839	22.400	1000	14.000		0			7		19			1001	484		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6848	22.400	1000	14.000		0			6		15			1001	494		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6851	14.000	1000	14.000		0			9		17			1001	465		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6861	22.400	1000	14.000		0			8		17			1001	512		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6864	14.000	1002	14.000		0			8		15			1003	544		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6893	14.000	1002	14.000		0			2		18			1003	510		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6906	17.500	1002	14.000		0			3		18			1003	507		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6908	17.500	1000	14.000		0			8		19			1001	480		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6910	14.000	1000	14.000		0			6		15			1001	554		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6914	17.500	1002	14.000		0			1		19			1003	492		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6921	14.000	1002	14.000		0			4		16			1003	472		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6944	22.400	1000	14.000		0			2		15			1001	557		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6947	17.500	1000	14.000		0			6		18			1001	518		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6959	17.500	1000	14.000		0			2		18			1001	571		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6963	14.000	1002	14.000		0			5		17			1003	561		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6964	17.500	1002	14.000		0			5		16			1003	537		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6965	22.400	1002	14.000		0			5		15			1003	568		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6971	14.000	1002	14.000		0			2		18			1003	541		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6975	14.000	1002	14.000		0			7		15			1003	526		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6984	22.400	1002	14.000		0			8		18			1003	585		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.6999	22.400	1002	14.000		0			7		19			1003	536		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7001	14.000	1000	14.000		0			2		15			1001	502		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7006	14.000	1002	14.000		0			4		17			1003	467		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7013	22.400	1002	14.000		0			9		19			1003	559		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7024	17.500	1002	14.000		0			2		18			1003	586		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7027	22.400	1002	14.000		0			1		15			1003	558		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7036	14.000	1000	14.000		0			6		16			1001	516		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7046	14.000	1000	14.000		0			8		19			1001	580		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7063	14.000	1000	14.000		0			8		18			1001	474		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7068	14.000	1002	14.000		0			4		16			1003	476		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7077	14.000	1002	14.000		0			8		19			1003	564		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7101	17.500	1002	14.000		0			6		16			1003	542		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7139	17.500	1002	14.000		0			5		15			1003	579		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7149	22.400	1000	14.000		0			5		15			1001	489		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7153	14.000	1002	14.000		0			7		19			1003	485		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7180	14.000	1002	14.000		0			4		19			1003	523		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7181	14.000	1000	14.000		0			7		17			1001	553		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7201	17.500	1000	14.000		0			4		16			1001	528		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7206	14.000	1002	14.000		0			7		17			1003	588		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7281	22.400	1002	14.000		0			2		16			1003	519		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7289	14.000	1002	14.000		0			3		16			1003	538		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7298	14.000	1002	14.000		0			9		19			1003	556		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7299	17.500	1002	14.000		0			8		17			1003	550		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7303	22.400	1002	14.000		0			5		17			1003	574		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7328	14.000	1002	14.000		0			5		19			1003	473		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7335	22.400	1000	14.000		0			3		17			1001	572		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7345	17.500	1002	14.000		0			7		15			1003	577		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7348	22.400	1002	14.000		0			2		19			1003	505		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7439	17.500	1002	14.000		0			4		15			1003	501		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7481	14.000	1000	14.000		0			1		16			1001	569		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7486	22.400	1000	14.000		0			8		19			1001	499		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7553	22.400	1000	14.000		0			2		17			1001	508		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7747	17.500	1002	14.000		0			4		17			1003	570		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7797	17.500	1002	14.000		0			3		17			1003	527		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.7932	22.400	1000	14.000		0			3		19			1001	466		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8272	17.500	1000	14.000		0			5		17			1001	546		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8391	14.000	1000	14.000		0			5		19			1001	642		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8678	17.500	1000	14.000		0			4		18			1001	470		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8681	14.000	1002	14.000		0			3		16			1003	629		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8747	17.500	1000	14.000		0			9		18			1001	654		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8876	22.400	1000	14.000		0			7		18			1001	601		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8910	14.000	1000	14.000		0			2		15			1001	661		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8929	14.000	1000	14.000		0			2		18			1001	609		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.8961	14.000	1002	14.000		0			4		18			1003	595		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9021	17.500	1002	14.000		0			8		17			1003	627		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9025	17.500	1002	14.000		0			5		19			1003	636		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9026	14.000	1000	14.000		0			2		15			1001	594		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9051	17.500	1002	14.000		0			8		18			1003	612		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9065	14.000	1002	14.000		0			8		18			1003	655		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9088	14.000	1002	14.000		0			1		19			1003	619		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9120	17.500	1002	14.000		0			6		18			1003	672		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9126	14.000	1000	14.000		0			1		15			1001	622		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9137	17.500	1000	14.000		0			4		17			1001	618		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9160	14.000	1002	14.000		0			7		17			1003	652		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9183	17.500	1002	14.000		0			9		16			1003	593		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9199	14.000	1002	14.000		0			7		18			1003	625		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9218	14.000	1002	14.000		0			9		17			1003	673		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9234	14.000	1002	14.000		0			6		15			1003	632		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9291	14.000	1000	14.000		0			2		18			1001	664		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9292	17.500	1000	14.000		0			2		17			1001	665		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9297	17.500	1000	14.000		0			8		16			1001	616		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9306	14.000	1000	14.000		0			6		19			1001	613		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9327	22.400	1002	14.000		0			9		15			1003	671		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9333	17.500	1002	14.000		0			6		15			1003	637		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9359	22.400	1000	14.000		0			5		18			1001	605		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9400	14.000	1002	14.000		0			5		18			1003	669		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9406	14.000	1002	14.000		0			2		17			1003	630		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9433	22.400	1000	14.000		0			5		18			1001	647		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9464	14.000	1000	14.000		0			4		15			1001	650		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9495	14.000	1000	14.000		0			8		15			1001	668		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9516	17.500	1002	14.000		0			4		17			1003	634		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9528	17.500	1000	14.000		0			5		16			1001	658		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9538	22.400	1000	14.000		0			2		19			1001	656		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9610	17.500	1002	14.000		0			3		15			1003	611		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9624	14.000	1002	14.000		0			1		17			1003	641		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9627	14.000	1002	14.000		0			9		18			1003	606		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9637	17.500	1002	14.000		0			2		17			1003	635		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9637	22.400	1000	14.000		0			6		17			1001	610		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9648	14.000	1002	14.000		0			3		15			1003	615		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9667	22.400	1002	14.000		0			5		18			1003	663		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9673	17.500	1000	14.000		0			2		18			1001	591		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9674	22.400	1000	14.000		0			4		19			1001	646		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9676	22.400	1002	14.000		0			7		18			1003	592		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9733	17.500	1002	14.000		0			3		16			1003	596		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9754	22.400	1002	14.000		0			2		18			1003	604		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9756	22.400	1000	14.000		0			1		19			1001	614		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9769	22.400	1000	14.000		0			2		17			1001	589		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9801	22.400	1000	14.000		0			7		18			1001	597		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9806	14.000	1002	14.000		0			8		16			1003	602		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9824	17.500	1000	14.000		0			1		19			1001	631		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9830	17.500	1002	14.000		0			4		15			1003	643		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9832	22.400	1002	14.000		0			9		15			1003	638		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9842	17.500	1002	14.000		0			5		18			1003	640		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9848	22.400	1000	14.000		0			6		15			1001	608		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9878	14.000	1002	14.000		0			5		15			1003	620		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9880	17.500	1002	14.000		0			7		16			1003	624		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9882	17.500	1002	14.000		0			4		18			1003	639		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9887	22.400	1002	14.000		0			7		17			1003	651		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9890	22.400	1002	14.000		0			1		18			1003	659		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9895	22.400	1000	14.000		0			1		15			1001	644		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9900	17.500	1002	14.000		0			3		19			1003	674		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9938	17.500	1000	14.000		0			6		17			1001	626		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9991	14.000	1002	14.000		0			1		18			1003	645		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9992	14.000	1002	14.000		0			2		16			1003	599		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	63.9993	17.500	1000	14.000		0			3		18			1001	617		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0033	14.000	1002	14.000		0			4		17			1003	657		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0052	17.500	1002	14.000		0			5		17			1003	607		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0066	22.400	1002	14.000		0			9		15			1003	675		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0083	14.000	1000	14.000		0			3		16			1001	648		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0096	17.500	1000	14.000		0			1		16			1001	633		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0100	14.000	1000	14.000		0			2		17			1001	598		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0111	17.500	1000	14.000		0			3		16			1001	603		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0122	14.000	1002	14.000		0			4		16			1003	660		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0143	22.400	1000	14.000		0			8		17			1001	667		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0188	22.400	1002	14.000		0			5		16			1003	623		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0241	17.500	1002	14.000		0			4		15			1003	628		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0250	22.400	1002	14.000		0			5		16			1003	670		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0294	17.500	1000	14.000		0			3		15			1001	662		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0486	14.000	1000	14.000		0			8		16			1001	590		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0494	14.000	1000	14.000		0			3		17			1001	649		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0552	22.400	1002	14.000		0			4		16			1003	600		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0598	14.000	1000	14.000		0			3		16			1001	621		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0677	14.000	1002	14.000		0			6		16			1003	666		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	64.0727	14.000	1002	14.000		0			7		17			1003	653		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	77.9909	3.000	1002	3.000		5			4		19			1003	721		3		1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	78.0000	6.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0252	3.750	1002	3.000		5			5		19			1003	722		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0259	3.000	1002	3.000		5			2		19			1003	711		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0357	3.000	1000	3.000		5			7		19			1001	720		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0492	3.000	1000	3.000		5			5		19			1001	724		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0513	3.000	1002	3.000		5			4		19			1003	716		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0577	3.750	1000	3.000		5			4		19			1001	681		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0609	4.800	1000	3.000		5			6		19			1001	687		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0650	3.750	1002	3.000		5			4		19			1003	678		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0673	3.000	1000	3.000		5			7		19			1001	698		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0684	4.800	1002	3.000		5			6		19			1003	712		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0746	3.750	1002	3.000		5			4		19			1003	694		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0818	4.800	1002	3.000		5			9		19			1003	708		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0820	4.800	1002	3.000		5			6		19			1003	704		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0880	3.000	1000	3.000		5			5		19			1001	705		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0938	3.000	1000	3.000		5			9		19			1001	697		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0939	4.800	1000	3.000		5			2		19			1001	717		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.0944	3.750	1002	3.000		5			1		19			1003	700		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1040	3.000	1000	3.000		5			5		19			1001	709		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1041	3.000	1002	3.000		5			1		19			1003	688		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1053	3.000	1002	3.000		5			9		19			1003	703		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1075	4.800	1002	3.000		5			3		19			1003	701		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1118	3.750	1002	3.000		5			1		19			1003	706		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1177	4.800	1000	3.000		5			8		19			1001	719		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1185	4.800	1002	3.000		5			3		19			1003	680		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1245	3.000	1002	3.000		5			3		19			1003	702		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1246	4.800	1000	3.000		5			7		19			1001	682		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1249	3.000	1002	3.000		5			6		19			1003	684		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1304	4.800	1000	3.000		5			5		19			1001	710		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1306	4.800	1000	3.000		5			7		19			1001	696		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1332	3.750	1000	3.000		5			9		19			1001	699		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1349	3.750	1002	3.000		5			1		19			1003	691		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1381	4.800	1000	3.000		5			8		19			1001	714		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1400	4.800	1002	3.000		5			9		19			1003	695		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1402	4.800	1002	3.000		5			3		19			1003	689		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1423	4.800	1002	3.000		5			4		19			1003	679		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1441	4.800	1000	3.000		5			3		19			1001	693		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1445	3.750	1000	3.000		5			8		19			1001	715		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1481	4.800	1000	3.000		5			1		19			1001	677		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1486	3.000	1000	3.000		5			2		19			1001	713		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1576	3.000	1000	3.000		5			8		19			1001	718		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1586	3.000	1000	3.000		5			5		19			1001	686		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1621	3.750	1000	3.000		5			4		19			1001	707		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1668	4.800	1000	3.000		5			8		19			1001	725		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1914	3.000	1002	3.000		5			8		19			1003	723		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1932	4.800	1002	3.000		5			6		19			1003	692		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1972	3.750	1000	3.000		5			1		19			1001	676		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.1993	3.000	1002	3.000		5			7		19			1003	685		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.2020	4.800	1002	3.000		5			1		19			1003	690		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.2097	3.000	1002	3.000		5			7		19			1003	683		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8580	3.750	1002	3.000		5			8		19			1003	772		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8686	3.000	1002	3.000		5			5		18			1003	726		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8713	3.000	1002	3.000		5			1		19			1003	736		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8721	3.750	1002	3.000		5			9		18			1003	766		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8852	3.000	1002	3.000		5			3		18			1003	755		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8863	3.750	1000	3.000		5			8		19			1001	739		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8870	4.800	1000	3.000		5			2		19			1001	760		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8874	3.750	1000	3.000		5			6		18			1001	735		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.8905	3.750	1002	3.000		5			7		19			1003	728		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9008	3.000	1000	3.000		5			1		19			1001	777		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9045	4.800	1000	3.000		5			1		18			1001	741		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9051	4.800	1002	3.000		5			7		19			1003	737		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9052	4.800	1000	3.000		5			2		19			1001	746		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9088	4.800	1000	3.000		5			3		19			1001	774		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9114	3.750	1000	3.000		5			2		19			1001	764		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9182	4.800	1000	3.000		5			2		18			1001	729		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9283	3.750	1000	3.000		5			3		19			1001	763		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9291	3.000	1002	3.000		5			1		18			1003	742		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9327	4.800	1000	3.000		5			3		18			1001	770		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9360	3.750	1002	3.000		5			9		18			1003	769		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9381	3.750	1000	3.000		5			5		19			1001	759		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9404	3.000	1000	3.000		5			9		18			1001	782		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9428	3.750	1002	3.000		5			3		18			1003	730		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9452	3.750	1002	3.000		5			4		19			1003	753		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9478	3.750	1000	3.000		5			4		18			1001	761		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9498	3.750	1000	3.000		5			1		18			1001	767		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9503	4.800	1000	3.000		5			6		19			1001	781		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9542	3.000	1002	3.000		5			7		19			1003	749		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9568	4.800	1000	3.000		5			3		18			1001	738		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9597	3.750	1002	3.000		5			5		19			1003	747		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9607	4.800	1000	3.000		5			5		19			1001	731		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9613	4.800	1002	3.000		5			2		18			1003	756		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9616	4.800	1002	3.000		5			3		19			1003	727		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9621	3.750	1002	3.000		5			7		19			1003	765		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9638	4.800	1002	3.000		5			6		19			1003	745		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9654	3.750	1000	3.000		5			6		19			1001	757		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9682	3.000	1002	3.000		5			8		18			1003	775		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9683	4.800	1000	3.000		5			6		18			1001	768		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9726	3.750	1000	3.000		5			1		19			1001	754		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9765	4.800	1000	3.000		5			3		19			1001	743		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9927	3.750	1000	3.000		5			5		19			1001	762		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9938	4.800	1000	3.000		5			7		18			1001	750		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9941	3.750	1002	3.000		5			3		19			1003	780		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9972	3.000	1002	3.000		5			4		19			1003	732		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9974	3.750	1002	3.000		5			7		19			1003	773		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	78.9992	4.800	1000	3.000		5			5		19			1001	779		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0087	3.000	1000	3.000		5			3		18			1001	748		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0106	3.750	1000	3.000		5			5		19			1001	752		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0124	4.800	1000	3.000		5			5		19			1001	776		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0136	3.750	1000	3.000		5			8		19			1001	744		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0244	4.800	1002	3.000		5			4		19			1003	751		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0295	4.800	1002	3.000		5			8		18			1003	771		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0302	3.750	1002	3.000		5			7		19			1003	734		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0486	3.000	1000	3.000		5			9		19			1001	778		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0531	4.800	1000	3.000		5			3		19			1001	733		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0571	3.750	1002	3.000		5			7		19			1003	740		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.0610	3.000	1000	3.000		5			7		19			1001	758		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.3828	4.800	1000	3.000		5			3		17			1001	828		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.3847	3.750	1002	3.000		5			2		18			1003	791		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4150	3.000	1002	3.000		5			5		19			1003	793		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4152	4.800	1002	3.000		5			2		18			1003	816		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4181	4.800	1000	3.000		5			4		18			1001	824		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4249	3.750	1000	3.000		5			5		18			1001	814		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4295	3.000	1000	3.000		5			8		19			1001	809		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4322	3.750	1000	3.000		5			4		19			1001	825		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4324	3.000	1002	3.000		5			2		17			1003	812		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4434	3.750	1002	3.000		5			7		19			1003	821		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4443	3.000	1002	3.000		5			5		18			1003	817		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4448	4.800	1002	3.000		5			3		18			1003	787		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4498	3.000	1000	3.000		5			6		19			1001	819		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4528	3.000	1000	3.000		5			2		18			1001	792		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4566	3.750	1002	3.000		5			2		18			1003	804		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4590	3.750	1000	3.000		5			2		17			1001	823		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4601	3.750	1000	3.000		5			6		17			1001	803		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4630	3.750	1002	3.000		5			7		18			1003	789		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4640	3.750	1002	3.000		5			5		19			1003	815		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4667	3.000	1000	3.000		5			9		18			1001	835		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4685	3.750	1000	3.000		5			8		18			1001	818		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4692	3.750	1002	3.000		5			2		18			1003	783		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4696	4.800	1002	3.000		5			6		19			1003	786		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4739	3.750	1002	3.000		5			1		18			1003	802		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4845	3.750	1002	3.000		5			3		17			1003	784		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4846	3.000	1000	3.000		5			1		18			1001	832		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4879	3.750	1002	3.000		5			2		18			1003	834		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4925	3.000	1000	3.000		5			5		17			1001	808		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4982	3.000	1002	3.000		5			5		19			1003	788		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4983	3.750	1000	3.000		5			6		18			1001	837		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4989	4.800	1002	3.000		5			3		19			1003	796		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.4989	3.000	1000	3.000		5			7		18			1001	836		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5004	4.800	1000	3.000		5			3		18			1001	806		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5013	4.800	1000	3.000		5			7		18			1001	799		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5021	3.750	1000	3.000		5			6		19			1001	790		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5027	4.800	1000	3.000		5			2		19			1001	831		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5058	3.000	1000	3.000		5			7		18			1001	829		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5064	3.750	1000	3.000		5			5		18			1001	813		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5154	3.750	1000	3.000		5			7		17			1001	801		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5162	3.000	1002	3.000		5			8		17			1003	798		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5196	4.800	1000	3.000		5			7		17			1001	805		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5215	3.000	1002	3.000		5			6		19			1003	830		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5255	4.800	1002	3.000		5			6		17			1003	811		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5266	3.000	1000	3.000		5			2		18			1001	785		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5304	4.800	1000	3.000		5			5		18			1001	807		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5309	3.000	1000	3.000		5			3		18			1001	826		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5339	3.000	1000	3.000		5			4		18			1001	810		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5340	4.800	1002	3.000		5			5		19			1003	822		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5415	3.750	1002	3.000		5			8		19			1003	797		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5485	3.000	1002	3.000		5			6		18			1003	833		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5511	3.000	1000	3.000		5			8		19			1001	827		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5583	3.000	1002	3.000		5			1		19			1003	820		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5629	3.000	1000	3.000		5			6		19			1001	794		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5634	3.750	1000	3.000		5			6		18			1001	800		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.5670	4.800	1002	3.000		5			4		19			1003	795		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8537	3.750	1002	3.000		5			4		17			1003	880		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8723	3.750	1000	3.000		5			2		17			1001	866		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8758	3.000	1000	3.000		5			6		16			1001	879		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8815	3.750	1002	3.000		5			5		17			1003	878		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8851	3.000	1000	3.000		5			3		17			1001	867		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.8897	3.750	1000	3.000		5			5		17			1001	844		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9020	3.000	1000	3.000		5			9		17			1001	847		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9026	3.750	1002	3.000		5			6		17			1003	860		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9095	3.750	1002	3.000		5			2		17			1003	865		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9135	3.000	1000	3.000		5			8		18			1001	863		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9169	3.000	1002	3.000		5			3		19			1003	852		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9171	3.000	1000	3.000		5			2		18			1001	840		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9202	3.000	1002	3.000		5			8		17			1003	849		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9209	4.800	1002	3.000		5			5		18			1003	850		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9289	4.800	1000	3.000		5			3		17			1001	882		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9318	3.000	1002	3.000		5			2		17			1003	839		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9347	4.800	1002	3.000		5			3		19			1003	871		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9353	4.800	1000	3.000		5			6		17			1001	881		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9418	3.750	1002	3.000		5			2		18			1003	859		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9437	4.800	1000	3.000		5			5		17			1001	862		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9440	3.750	1002	3.000		5			4		19			1003	884		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9448	3.000	1002	3.000		5			5		18			1003	873		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9479	3.000	1002	3.000		5			9		19			1003	874		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9488	4.800	1000	3.000		5			2		18			1001	857		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9551	3.750	1000	3.000		5			4		18			1001	853		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9560	4.800	1000	3.000		5			7		18			1001	841		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9571	3.750	1002	3.000		5			8		18			1003	888		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9580	3.750	1000	3.000		5			8		17			1001	872		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9608	3.000	1002	3.000		5			7		17			1003	855		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9630	4.800	1002	3.000		5			6		17			1003	854		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9664	4.800	1002	3.000		5			8		19			1003	869		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9675	3.750	1000	3.000		5			7		19			1001	870		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9709	4.800	1002	3.000		5			5		19			1003	851		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9715	4.800	1002	3.000		5			4		18			1003	842		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9756	3.000	1000	3.000		5			7		17			1001	886		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9795	3.000	1000	3.000		5			6		18			1001	875		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9905	3.750	1000	3.000		5			3		19			1001	864		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9905	4.800	1002	3.000		5			5		17			1003	838		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9906	3.750	1002	3.000		5			7		17			1003	916		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9914	3.000	1000	3.000		5			8		19			1001	910		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9916	4.800	1000	3.000		5			9		17			1001	858		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9924	3.000	1000	3.000		5			4		16			1001	887		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9940	4.800	1000	3.000		5			3		18			1001	885		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9942	3.000	1002	3.000		5			8		18			1003	876		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9977	4.800	1000	3.000		5			5		18			1001	848		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	79.9985	4.800	1000	3.000		5			6		17			1001	918		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0016	4.800	1000	3.000		5			8		19			1001	924		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0044	3.750	1000	3.000		5			3		17			1001	938		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0047	4.800	1000	3.000		5			6		17			1001	845		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0048	4.800	1000	3.000		5			5		17			1001	920		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0051	3.750	1000	3.000		5			3		18			1001	897		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0072	3.000	1002	3.000		5			8		17			1003	883		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0108	4.800	1000	3.000		5			7		17			1001	856		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0189	3.750	1000	3.000		5			4		19			1001	861		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0189	4.800	1002	3.000		5			4		18			1003	939		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0194	4.800	1000	3.000		5			8		19			1001	936		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0211	3.000	1000	3.000		5			1		18			1001	907		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0219	3.000	1002	3.000		5			4		17			1003	877		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0223	3.750	1000	3.000		5			3		18			1001	868		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0234	3.750	1000	3.000		5			8		18			1001	899		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0270	4.800	1000	3.000		5			8		17			1001	846		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0276	3.000	1002	3.000		5			2		17			1003	927		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0300	3.000	1000	3.000		5			7		19			1001	942		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0343	3.000	1000	3.000		5			7		16			1001	893		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0347	4.800	1000	3.000		5			5		19			1001	930		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0373	3.750	1000	3.000		5			7		19			1001	912		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0465	3.000	1000	3.000		5			4		19			1001	902		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0578	3.750	1000	3.000		5			4		17			1001	923		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0585	3.750	1000	3.000		5			6		18			1001	937		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0588	4.800	1002	3.000		5			5		19			1003	946		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0598	4.800	1002	3.000		5			2		19			1003	904		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0607	3.000	1000	3.000		5			8		19			1001	905		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0664	3.000	1000	3.000		5			6		16			1001	892		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0756	4.800	1002	3.000		5			6		19			1003	935		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0767	3.000	1002	3.000		5			5		18			1003	931		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0768	3.750	1002	3.000		5			3		17			1003	926		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0782	3.000	1000	3.000		5			2		16			1001	894		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0794	3.750	1002	3.000		5			3		19			1003	906		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0819	4.800	1002	3.000		5			6		17			1003	941		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0843	4.800	1002	3.000		5			2		18			1003	943		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0878	4.800	1000	3.000		5			7		19			1001	929		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0878	3.000	1000	3.000		5			4		19			1001	934		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0890	3.750	1000	3.000		5			1		18			1001	843		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0920	3.000	1002	3.000		5			6		19			1003	891		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0936	3.000	1000	3.000		5			8		19			1001	914		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0941	4.800	1000	3.000		5			6		18			1001	933		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0961	3.000	1000	3.000		5			3		18			1001	921		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0963	4.800	1000	3.000		5			2		19			1001	909		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.0967	3.750	1002	3.000		5			7		16			1003	940		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1001	4.800	1000	3.000		5			3		16			1001	908		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1030	4.800	1002	3.000		5			8		16			1003	945		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1044	3.750	1002	3.000		5			5		17			1003	932		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1048	3.750	1000	3.000		5			6		17			1001	903		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1066	4.800	1000	3.000		5			5		18			1001	890		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1101	3.750	1000	3.000		5			5		16			1001	915		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1140	3.750	1002	3.000		5			7		17			1003	917		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1171	3.750	1002	3.000		5			4		18			1003	898		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1175	3.750	1002	3.000		5			3		18			1003	913		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1202	3.750	1002	3.000		5			9		17			1003	922		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1236	3.000	1000	3.000		5			4		18			1001	919		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1398	4.800	1000	3.000		5			6		16			1001	925		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1428	3.750	1002	3.000		5			4		18			1003	928		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1468	3.000	1000	3.000		5			4		19			1001	901		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1562	4.800	1002	3.000		5			7		18			1003	895		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1712	3.750	1002	3.000		5			4		17			1003	889		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1880	3.750	1000	3.000		5			2		18			1001	896		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1898	3.750	1002	3.000		5			7		16			1003	911		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.1910	3.750	1002	3.000		5			4		17			1003	944		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.2067	3.000	1002	3.000		5			6		18			1003	900		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.3742	3.750	1000	3.000		5			5		19			1001	994		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.3837	4.800	1000	3.000		5			2		17			1001	1008		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.3949	3.000	1000	3.000		5			7		18			1001	981		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.3988	3.000	1000	3.000		5			2		16			1001	949		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4137	3.000	1002	3.000		5			3		17			1003	1013		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4162	4.800	1002	3.000		5			9		16			1003	1004		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4162	3.000	1002	3.000		5			6		16			1003	961		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4217	4.800	1002	3.000		5			9		18			1003	973		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4268	3.750	1002	3.000		5			9		18			1003	948		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4281	3.000	1000	3.000		5			8		19			1001	965		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4283	3.750	1000	3.000		5			4		17			1001	974		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4307	3.750	1002	3.000		5			8		19			1003	950		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4309	4.800	1002	3.000		5			5		18			1003	1015		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4356	4.800	1002	3.000		5			4		16			1003	1014		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4369	3.000	1000	3.000		5			4		18			1001	1007		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4382	3.750	1000	3.000		5			4		19			1001	979		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4406	3.750	1000	3.000		5			6		19			1001	983		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4411	3.000	1000	3.000		5			9		19			1001	982		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4427	4.800	1002	3.000		5			2		19			1003	967		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4460	4.800	1000	3.000		5			4		19			1001	966		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4467	3.750	1002	3.000		5			6		17			1003	970		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4481	3.750	1002	3.000		5			1		18			1003	968		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4484	3.750	1000	3.000		5			7		17			1001	1006		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4490	3.000	1000	3.000		5			3		19			1001	964		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4491	4.800	1000	3.000		5			6		16			1001	969		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4503	4.800	1000	3.000		5			6		19			1001	959		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4536	3.000	1000	3.000		5			5		16			1001	1002		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4568	3.750	1002	3.000		5			2		18			1003	960		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4602	3.000	1002	3.000		5			7		18			1003	991		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4687	3.750	1000	3.000		5			7		17			1001	977		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4709	4.800	1002	3.000		5			2		16			1003	955		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4727	3.750	1000	3.000		5			5		17			1001	947		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4740	3.750	1000	3.000		5			9		18			1001	971		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4752	4.800	1000	3.000		5			7		16			1001	987		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4768	3.750	1000	3.000		5			6		19			1001	1012		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4807	3.000	1002	3.000		5			3		16			1003	1001		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4832	3.750	1002	3.000		5			1		16			1003	962		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4852	4.800	1002	3.000		5			4		18			1003	963		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4855	3.000	1000	3.000		5			2		17			1001	1003		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4864	3.750	1002	3.000		5			2		17			1003	999		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4886	3.000	1002	3.000		5			6		17			1003	956		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4887	3.000	1000	3.000		5			5		16			1001	975		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4907	3.750	1000	3.000		5			6		19			1001	1005		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4978	4.800	1000	3.000		5			2		18			1001	988		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4981	4.800	1002	3.000		5			2		17			1003	995		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4984	3.750	1000	3.000		5			2		18			1001	1011		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.4987	3.750	1000	3.000		5			8		19			1001	985		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5000	3.750	1002	3.000		5			2		16			1003	953		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5012	4.800	1000	3.000		5			4		18			1001	958		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5019	3.750	1002	3.000		5			7		18			1003	984		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5024	4.800	1002	3.000		5			3		15			1003	990		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5025	4.800	1000	3.000		5			6		16			1001	996		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5032	3.750	1002	3.000		5			8		16			1003	954		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5038	3.750	1000	3.000		5			7		17			1001	986		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5109	3.000	1000	3.000		5			1		19			1001	997		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5114	4.800	1000	3.000		5			8		17			1001	951		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5115	3.750	1002	3.000		5			6		18			1003	1009		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5135	3.000	1000	3.000		5			4		19			1001	1000		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5139	3.000	1002	3.000		5			4		17			1003	952		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5187	3.000	1002	3.000		5			9		17			1003	957		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5197	4.800	1002	3.000		5			4		18			1003	989		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5342	4.800	1000	3.000		5			1		17			1001	993		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5455	3.750	1002	3.000		5			3		18			1003	998		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5475	4.800	1000	3.000		5			5		18			1001	978		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5494	4.800	1002	3.000		5			4		16			1003	980		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5503	4.800	1002	3.000		5			8		18			1003	1010		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5570	4.800	1002	3.000		5			7		19			1003	976		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5776	4.800	1000	3.000		5			2		18			1001	972		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.5963	4.800	1002	3.000		5			5		18			1003	992		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7442	4.800	1000	3.000		5			7		18			1001	1077		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7524	3.750	1002	3.000		5			6		16			1003	1080		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7544	3.750	1002	3.000		5			2		19			1003	1032		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7613	3.750	1000	3.000		5			7		18			1001	1021		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7624	4.800	1002	3.000		5			2		19			1003	1048		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7644	3.750	1002	3.000		5			5		17			1003	1051		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7657	3.750	1002	3.000		5			6		16			1003	1054		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7689	3.750	1002	3.000		5			4		17			1003	1060		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7705	3.750	1000	3.000		5			8		16			1001	1040		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7748	4.800	1002	3.000		5			9		15			1003	1069		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7754	3.750	1002	3.000		5			2		19			1003	1046		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7853	3.000	1000	3.000		5			6		17			1001	1041		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7883	3.750	1002	3.000		5			5		15			1003	1026		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7935	4.800	1002	3.000		5			4		18			1003	1078		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7944	3.000	1002	3.000		5			5		16			1003	1081		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7948	4.800	1000	3.000		5			8		19			1001	1050		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.7995	4.800	1002	3.000		5			6		19			1003	1025		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8041	3.000	1002	3.000		5			4		17			1003	1037		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8045	3.000	1002	3.000		5			2		16			1003	1029		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8058	3.000	1002	3.000		5			4		17			1003	1028		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8082	4.800	1002	3.000		5			8		15			1003	1061		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8109	3.750	1000	3.000		5			8		18			1001	1070		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8134	3.750	1002	3.000		5			1		16			1003	1076		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8150	4.800	1002	3.000		5			3		19			1003	1075		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8187	3.750	1002	3.000		5			4		19			1003	1035		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8210	3.750	1000	3.000		5			4		15			1001	1034		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8219	3.750	1002	3.000		5			8		19			1003	1039		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8228	3.000	1000	3.000		5			6		19			1001	1018		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8229	4.800	1002	3.000		5			3		18			1003	1024		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8234	3.750	1000	3.000		5			4		17			1001	1072		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8243	4.800	1000	3.000		5			5		16			1001	1027		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8253	3.000	1002	3.000		5			3		17			1003	1074		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8262	4.800	1000	3.000		5			5		17			1001	1044		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8345	3.000	1002	3.000		5			7		19			1003	1063		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8354	3.000	1000	3.000		5			7		18			1001	1047		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8365	3.750	1000	3.000		5			4		16			1001	1016		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8403	4.800	1000	3.000		5			3		15			1001	1065		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8442	3.750	1000	3.000		5			6		17			1001	1049		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8442	4.800	1002	3.000		5			4		17			1003	1043		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8452	4.800	1002	3.000		5			1		19			1003	1042		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8463	3.000	1002	3.000		5			2		19			1003	1017		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8482	4.800	1002	3.000		5			9		15			1003	1019		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8509	4.800	1000	3.000		5			8		16			1001	1030		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8514	3.750	1000	3.000		5			1		18			1001	1031		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8518	3.000	1000	3.000		5			7		18			1001	1079		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8524	3.750	1002	3.000		5			8		17			1003	1082		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8563	3.750	1002	3.000		5			2		18			1003	1052		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8596	3.750	1000	3.000		5			5		19			1001	1053		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8666	3.750	1000	3.000		5			6		16			1001	1022		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8740	3.750	1000	3.000		5			6		18			1001	1023		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8763	3.000	1002	3.000		5			8		16			1003	1055		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8780	4.800	1002	3.000		5			6		18			1003	1020		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8788	3.750	1000	3.000		5			5		15			1001	1067		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8841	4.800	1002	3.000		5			5		18			1003	1083		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8863	4.800	1000	3.000		5			6		15			1001	1058		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8876	3.750	1002	3.000		5			6		16			1003	1064		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8884	3.000	1002	3.000		5			2		17			1003	1073		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8944	3.750	1000	3.000		5			3		16			1001	1071		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8956	3.000	1002	3.000		5			3		18			1003	1045		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8983	3.000	1000	3.000		5			1		16			1001	1056		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.8983	3.000	1002	3.000		5			5		18			1003	1068		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9031	3.000	1000	3.000		5			5		19			1001	1033		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9042	3.750	1000	3.000		5			6		19			1001	1062		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9089	3.750	1002	3.000		5			4		17			1003	1036		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9094	3.750	1000	3.000		5			6		17			1001	1038		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9143	3.000	1002	3.000		5			3		17			1003	1059		2		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9177	3.000	1002	3.000		5			4		16			1003	1057		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	80.9661	4.800	1000	3.000		5			4		16			1001	1066		2		1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	84.0000	20.000	20
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	84.4798	12.500	1002	10.000		5			4		19			1003	1084		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	84.5116	10.000	1002	10.000		5			4		19			1003	1085		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	84.5138	10.000	1002	10.000		5			4		19			1003	1086		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	88.8163	10.000	1000	10.000		5			4		18			1001	1087		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	88.8713	16.000	1002	10.000		5			3		18			1003	1088		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	88.8855	12.500	1002	10.000		5			4		19			1003	1089		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	92.1510	10.000	1002	10.000		5			3		19			1003	1091		1		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	92.2067	12.500	1000	10.000		5			3		17			1001	1090		1		1		2
; --- Inviluppo per la sezione ---
i "InviluppoSezione"	104.0000	45.000	23
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	104.0814	0.414	1006	0.414		2			8		22			1007	1094		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	104.2072	1.236	1004	0.772		0			7		26			1005	1093		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.0619	0.792	1004	0.634		2			9		27			1005	1096		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.1037	0.267	1008	0.214		0			9		19			1009	1099		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.1296	0.549	1008	0.439		0			9		29			1009	1097		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.1312	0.630	1004	0.630		2			7		22			1005	1095		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.1517	0.558	1008	0.558		0			9		40			1009	1098		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.3463	0.407	1008	0.407		2			9		17			1009	1101		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.3532	0.647	1006	0.517		2			8		14			1007	1100		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.3865	0.973	1008	0.778		2			8		21			1009	1102		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.6277	0.560	1006	0.560		2			9		37			1007	1104		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.6306	0.780	1006	0.780		2			7		20			1007	1107		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.6776	0.263	1006	0.263		0			8		44			1007	1108		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.6779	0.552	1004	0.345		2			9		18			1005	1105		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.7479	1.223	1004	0.764		0			7		21			1005	1103		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	105.8626	1.177	1006	0.736		0			9		37			1007	1106		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	106.0351	0.284	1004	0.284		0			9		27			1005	1109		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	106.1574	0.457	1006	0.457		2			8		43			1007	1110		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	106.5181	30.819	1004	30.819		3			0		6			1005	1092		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	106.9912	0.783	1004	0.783		0			7		11			1005	1113		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.0014	0.391	1008	0.391		2			7		23			1009	1115		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.0157	0.861	1008	0.689		0			8		31			1009	1114		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.0301	0.796	1008	0.637		2			8		20			1009	1116		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.0356	0.766	1004	0.766		0			9		36			1005	1112		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.1783	0.683	1004	0.683		0			7		19			1005	1111		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.8340	0.578	1008	0.578		0			9		22			1009	1117		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	107.8730	0.572	1004	0.457		0			8		40			1005	1118		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.2673	0.647	1008	0.518		0			9		37			1009	1119		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.2779	0.722	1004	0.722		2			7		12			1005	1120		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.2789	0.613	1006	0.613		0			9		13			1007	1123		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.2965	0.740	1006	0.740		2			8		29			1007	1122		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.3243	0.379	1004	0.379		0			8		27			1005	1121		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.7463	1.002	1004	0.626		0			8		1			1005	1124		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.7667	0.220	1004	0.220		0			7		9			1005	1125		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	108.9259	0.229	1004	0.229		2			9		26			1005	1126		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.1250	0.795	1006	0.497		2			9		30			1007	1128		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.1352	0.698	1006	0.558		0			9		26			1007	1127		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.4228	0.756	1006	0.756		0			7		39			1007	1130		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.5574	0.948	1004	0.758		2			7		6			1005	1131		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.5599	1.268	1008	0.792		0			8		6			1009	1129		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.7147	0.789	1006	0.493		2			7		6			1007	1133		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	109.8263	0.211	1004	0.211		2			7		42			1005	1132		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	110.0874	0.617	1008	0.617		2			8		36			1009	1134		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	110.0929	0.637	1008	0.510		2			7		19			1009	1135		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	110.5724	0.656	1006	0.410		0			8		44			1007	1137		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	110.6669	0.220	1006	0.220		0			9		20			1007	1136		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.6540	0.516	1004	0.516		2			8		12			1005	1147		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.6843	1.252	1008	0.783		0			7		24			1009	1139		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8172	0.235	1004	0.235		0			9		22			1005	1138		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8214	0.330	1006	0.207		0			9		30			1007	1140		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8230	0.875	1004	0.700		2			7		35			1005	1143		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8235	0.909	1004	0.727		2			7		22			1005	1144		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8255	0.358	1004	0.358		2			8		35			1005	1146		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8364	0.690	1006	0.690		2			9		20			1007	1142		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8450	0.916	1004	0.573		2			7		27			1005	1145		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8691	0.613	1008	0.613		2			8		36			1009	1141		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.8980	0.586	1004	0.586		2			9		7			1005	1150		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.9249	0.436	1006	0.349		0			9		12			1007	1148		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.9251	0.855	1008	0.684		0			7		47			1009	1152		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.9340	1.267	1004	0.792		0			7		31			1005	1151		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	111.9476	0.857	1004	0.685		0			7		27			1005	1149		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	112.1410	0.896	1006	0.717		2			9		29			1007	1153		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	112.1627	0.625	1004	0.500		0			7		31			1005	1154		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	112.1874	0.747	1006	0.597		2			9		35			1007	1156		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	112.1966	0.714	1006	0.446		2			7		40			1007	1155		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	112.1973	0.444	1008	0.444		0			7		20			1009	1157		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.0219	0.419	1004	0.262		2			8		48			1005	1160		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.1092	0.396	1004	0.396		2			8		34			1005	1159		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.1493	0.636	1008	0.636		2			7		38			1009	1158		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.1846	0.639	1004	0.512		0			8		34			1005	1161		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.1928	1.244	1008	0.778		2			7		15			1009	1162		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.4866	0.453	1004	0.363		0			8		31			1005	1163		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.4972	0.363	1004	0.291		0			9		39			1005	1166		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.5330	0.338	1004	0.338		0			7		23			1005	1164		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.5415	0.457	1004	0.286		0			8		7			1005	1165		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.6634	0.386	1008	0.386		2			9		24			1009	1170		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.7191	0.745	1004	0.745		2			8		24			1005	1169		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.7785	1.238	1004	0.774		0			8		24			1005	1167		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.7792	0.488	1008	0.391		2			7		23			1009	1171		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	113.7846	0.202	1006	0.202		2			9		12			1007	1168		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.0716	0.596	1004	0.373		2			9		19			1005	1172		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.0770	0.659	1006	0.659		0			9		36			1007	1175		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.0861	0.930	1004	0.744		2			8		29			1005	1173		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.1074	0.522	1004	0.522		0			9		17			1005	1174		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.4322	0.606	1008	0.485		0			7		35			1009	1178		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.4344	0.501	1004	0.501		2			7		26			1005	1176		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.4395	0.456	1004	0.456		2			9		28			1005	1177		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.4995	0.418	1004	0.418		2			8		27			1005	1179		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.6750	1.075	1006	0.672		0			7		18			1007	1184		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.7039	0.478	1004	0.478		0			8		11			1005	1183		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.7096	1.063	1006	0.664		2			9		23			1007	1180		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.7136	1.263	1004	0.789		0			7		15			1005	1188		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.7139	1.118	1004	0.699		0			8		28			1005	1182		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.7416	0.644	1006	0.403		2			9		32			1007	1185		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.8036	0.292	1004	0.233		0			9		31			1005	1181		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.8115	0.388	1008	0.388		0			9		2			1009	1189		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.8425	0.906	1006	0.725		2			9		14			1007	1187		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	114.8613	0.558	1008	0.558		2			8		35			1009	1186		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.6741	0.283	1008	0.226		0			8		10			1009	1193		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7057	0.475	1006	0.475		0			7		18			1007	1194		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7114	1.247	1006	0.780		0			7		26			1007	1192		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7122	0.335	1008	0.335		2			9		16			1009	1190		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7587	0.398	1008	0.398		2			8		40			1009	1198		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7618	0.576	1004	0.460		2			8		21			1005	1195		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7719	0.435	1004	0.435		0			7		24			1005	1199		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.7778	0.729	1006	0.583		0			7		37			1007	1196		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.8086	0.790	1008	0.790		2			7		24			1009	1200		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.8458	0.607	1008	0.486		0			8		10			1009	1197		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	116.8524	1.242	1004	0.776		0			9		25			1005	1191		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.2504	0.298	1008	0.298		2			9		1			1009	1206		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.3752	0.450	1008	0.450		0			8		43			1009	1205		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.3896	0.867	1008	0.694		2			9		27			1009	1201		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.4061	0.671	1008	0.537		0			9		20			1009	1204		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.4133	0.989	1006	0.791		2			7		10			1007	1202		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.4771	0.365	1008	0.365		0			7		29			1009	1210		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.5019	0.375	1004	0.375		0			9		25			1005	1203		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.5251	0.860	1008	0.537		0			9		21			1009	1208		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.5620	0.554	1008	0.346		0			8		40			1009	1207		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.5879	0.742	1004	0.742		0			7		29			1005	1209		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.6255	0.258	1008	0.206		2			8		3			1009	1212		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.6455	0.722	1008	0.451		0			9		33			1009	1211		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.8248	1.173	1006	0.733		2			9		22			1007	1213		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.8586	1.185	1006	0.741		2			7		15			1007	1218		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.8720	0.865	1008	0.692		0			7		34			1009	1215		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.8899	0.418	1006	0.335		2			9		40			1007	1216		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.9028	0.717	1008	0.717		0			8		19			1009	1219		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	117.9211	0.877	1008	0.548		2			9		16			1009	1217		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	118.0967	1.078	1004	0.674		0			8		17			1005	1214		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	118.9954	0.372	1006	0.372		2			8		45			1007	1222		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.0207	0.516	1008	0.413		2			7		25			1009	1223		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.0299	0.364	1008	0.291		2			9		18			1009	1220		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.0894	0.611	1008	0.611		0			8		8			1009	1224		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.0952	0.622	1006	0.498		2			7		22			1007	1226		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.1484	0.949	1006	0.759		0			8		24			1007	1221		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.1493	0.396	1006	0.317		0			7		29			1007	1225		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.2674	0.466	1006	0.373		2			9		27			1007	1232		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.3094	0.413	1008	0.331		0			9		7			1009	1231		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.3239	0.639	1008	0.639		2			9		25			1009	1230		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.3317	0.338	1006	0.338		0			8		28			1007	1227		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.3778	0.626	1006	0.391		0			9		3			1007	1229		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.3794	0.748	1008	0.598		0			9		13			1009	1238		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.4071	0.446	1006	0.357		2			7		15			1007	1228		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.4671	0.433	1004	0.347		0			7		4			1005	1235		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.4686	1.193	1008	0.746		0			9		22			1009	1234		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.4844	0.987	1008	0.617		0			9		19			1009	1233		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.4887	0.292	1008	0.292		0			8		5			1009	1236		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.5133	0.321	1008	0.321		2			9		30			1009	1237		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.6133	0.254	1004	0.254		0			8		14			1005	1239		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.7273	0.338	1006	0.338		0			7		37			1007	1240		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.7462	0.588	1004	0.588		2			7		28			1005	1241		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.7812	0.320	1004	0.320		0			9		27			1005	1242		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.8365	0.361	1004	0.226		2			8		43			1005	1243		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.8767	0.866	1004	0.541		0			9		38			1005	1246		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.9029	0.763	1006	0.611		2			8		27			1007	1244		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.9182	0.807	1008	0.504		2			7		12			1009	1245		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	119.9544	0.471	1008	0.377		2			9		28			1009	1247		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	120.6738	0.786	1004	0.786		0			9		21			1005	1250		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	120.6743	0.573	1004	0.458		0			8		9			1005	1249		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	120.6943	0.647	1006	0.518		2			8		47			1007	1248		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	120.7200	0.724	1008	0.724		0			8		33			1009	1252		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	120.7933	1.028	1008	0.643		2			7		27			1009	1251		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	121.0622	0.347	1006	0.347		2			7		40			1007	1253		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.0323	0.934	1004	0.747		0			9		18			1005	1255		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.0897	0.885	1004	0.708		2			8		19			1005	1254		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.0911	0.836	1008	0.668		2			7		6			1009	1256		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.4687	0.388	1004	0.388		0			8		18			1005	1262		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.5106	1.266	1008	0.791		2			7		35			1009	1259		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.5300	0.218	1006	0.218		0			8		24			1007	1257		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.5796	0.376	1004	0.376		0			8		30			1005	1261		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.6168	0.211	1004	0.211		2			7		37			1005	1260		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.6253	0.451	1004	0.451		0			7		24			1005	1258		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.7951	0.716	1008	0.716		2			8		29			1009	1265		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.8101	0.402	1004	0.402		0			9		7			1005	1266		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.8599	0.904	1004	0.723		0			8		14			1005	1267		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.8852	0.742	1006	0.464		0			8		32			1007	1264		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.8937	0.779	1008	0.623		0			8		7			1009	1268		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.9172	0.407	1006	0.407		0			8		23			1007	1263		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	122.9421	0.910	1004	0.728		0			9		29			1005	1269		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.0713	0.707	1006	0.707		0			7		31			1007	1270		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.0772	0.364	1006	0.227		0			7		27			1007	1272		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.1052	0.792	1008	0.634		2			8		25			1009	1271		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.1162	0.349	1008	0.279		2			7		20			1009	1275		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.1177	0.641	1004	0.641		0			9		10			1005	1273		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.1763	0.751	1004	0.751		2			8		39			1005	1274		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.2055	0.910	1006	0.728		2			7		30			1007	1278		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.2223	0.790	1006	0.632		0			9		17			1007	1280		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.2700	1.005	1006	0.628		2			8		22			1007	1276		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3225	0.435	1006	0.272		2			8		22			1007	1283		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3336	0.974	1006	0.609		0			9		38			1007	1277		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3645	0.447	1006	0.447		0			9		2			1007	1282		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3799	0.520	1006	0.520		0			7		18			1007	1281		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3928	0.513	1006	0.513		0			7		12			1007	1287		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.3937	0.227	1008	0.227		2			8		26			1009	1288		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.4030	0.548	1008	0.439		2			9		20			1009	1285		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.4054	0.898	1006	0.561		0			7		32			1007	1279		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.4365	0.728	1006	0.582		2			8		30			1007	1284		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.4383	0.296	1006	0.296		0			9		12			1007	1286		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.6077	0.612	1004	0.490		2			8		23			1005	1291		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.6533	1.187	1006	0.742		0			8		39			1007	1289		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	123.6826	0.573	1006	0.358		0			7		23			1007	1290		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.4488	0.575	1008	0.460		2			7		30			1009	1292		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.5406	0.455	1006	0.455		0			7		28			1007	1294		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.5440	0.287	1006	0.230		2			9		23			1007	1295		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.5492	0.950	1008	0.594		0			9		11			1009	1296		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.5673	0.618	1004	0.386		0			8		21			1005	1293		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.9444	0.669	1006	0.669		2			8		30			1007	1299		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.9634	1.230	1008	0.769		0			8		30			1009	1298		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.9677	0.575	1006	0.460		2			9		18			1007	1297		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	124.9724	0.278	1004	0.222		0			8		8			1005	1300		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.0087	0.324	1004	0.324		2			8		13			1005	1301		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.3699	0.591	1008	0.591		2			9		22			1009	1302		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.3917	0.672	1004	0.672		2			9		34			1005	1305		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.4028	0.660	1008	0.413		0			7		23			1009	1303		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.4609	0.378	1006	0.302		2			7		20			1007	1304		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.9149	1.234	1004	0.771		0			8		1			1005	1306		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	125.9767	0.279	1004	0.279		0			8		26			1005	1307		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.3536	0.425	1008	0.340		2			7		20			1009	1309		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.3914	0.482	1004	0.482		2			8		42			1005	1308		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.4338	0.377	1008	0.236		0			9		35			1009	1310		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.7209	0.560	1008	0.448		0			7		35			1009	1311		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.7550	0.584	1006	0.584		0			7		1			1007	1312		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.7717	0.418	1004	0.418		2			8		23			1005	1313		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.7892	0.521	1008	0.521		0			8		27			1009	1314		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.9355	0.913	1006	0.571		2			7		9			1007	1316		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	126.9604	0.763	1008	0.763		2			7		20			1009	1318		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.0211	0.227	1008	0.227		0			8		40			1009	1315		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.0852	0.550	1006	0.440		2			7		19			1007	1317		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.5130	1.277	1006	0.798		2			9		21			1007	1319		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.5296	0.287	1004	0.287		0			9		21			1005	1321		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.5324	0.298	1004	0.298		0			7		11			1005	1320		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.5489	0.401	1006	0.251		0			7		23			1007	1322		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.6036	0.631	1004	0.505		2			8		31			1005	1323		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.7229	0.231	1004	0.231		0			7		21			1005	1327		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.7463	0.207	1008	0.207		0			9		27			1009	1325		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.7682	0.466	1008	0.373		2			7		13			1009	1326		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	127.7771	0.855	1004	0.684		0			8		30			1005	1324		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.2083	0.255	1004	0.255		0			7		38			1005	1331		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.3419	0.628	1004	0.628		2			7		21			1005	1330		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.4328	1.022	1006	0.639		0			9		26			1007	1328		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.4528	0.894	1008	0.715		0			8		28			1009	1329		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.4961	0.665	1008	0.532		2			7		30			1009	1332		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.4995	0.457	1008	0.457		2			9		27			1009	1333		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.5263	0.538	1004	0.538		0			7		37			1005	1334		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	128.6247	0.991	1006	0.619		0			7		10			1007	1335		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	130.4652	0.703	1008	0.563		0			7		25			1009	1339		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	130.4717	0.468	1006	0.293		2			9		26			1007	1338		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	130.4813	0.891	1006	0.557		0			8		31			1007	1336		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	130.5084	0.338	1008	0.338		2			9		27			1009	1340		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	130.5169	0.437	1006	0.437		0			8		26			1007	1337		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.1542	0.462	1008	0.462		2			9		18			1009	1344		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.1548	0.701	1004	0.701		2			9		3			1005	1343		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.2066	0.287	1008	0.287		2			8		35			1009	1342		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.2877	0.234	1006	0.234		0			7		38			1007	1352		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.2967	0.756	1004	0.756		0			7		40			1005	1341		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3265	0.686	1008	0.686		0			7		24			1009	1347		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3455	0.591	1004	0.473		2			7		23			1005	1345		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3505	0.850	1004	0.680		0			8		8			1005	1350		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3578	0.484	1006	0.484		0			9		22			1007	1351		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3585	0.929	1006	0.581		0			8		37			1007	1346		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.3787	1.151	1006	0.719		2			8		15			1007	1348		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.4753	0.530	1006	0.530		0			7		43			1007	1353		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.5154	0.814	1004	0.509		2			8		31			1005	1349		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.5270	0.738	1006	0.590		0			7		8			1007	1356		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.5950	0.715	1006	0.715		0			7		35			1007	1358		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.6278	0.453	1008	0.283		2			9		28			1009	1359		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.6284	0.714	1008	0.714		2			9		21			1009	1355		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.6474	0.362	1006	0.289		2			8		20			1007	1357		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	131.6546	0.810	1004	0.506		2			8		18			1005	1354		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.3004	0.792	1004	0.634		2			8		12			1005	1362		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.3058	0.720	1004	0.720		2			9		29			1005	1361		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.3619	0.781	1006	0.781		0			9		14			1007	1360		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.8715	0.900	1006	0.720		0			7		32			1007	1365		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.8761	0.625	1006	0.391		0			8		34			1007	1364		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.8865	1.231	1006	0.770		2			8		12			1007	1363		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.9029	0.524	1008	0.524		0			9		35			1009	1366		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.9139	0.527	1006	0.329		2			7		34			1007	1369		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.9215	0.628	1008	0.502		0			8		18			1009	1368		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	132.9339	0.377	1006	0.302		0			7		11			1007	1367		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.0065	0.544	1008	0.435		2			8		24			1009	1374		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.0581	0.263	1008	0.211		0			8		14			1009	1370		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.1296	0.646	1004	0.646		0			7		15			1005	1372		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.1326	1.196	1008	0.747		2			8		40			1009	1371		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.1887	0.285	1004	0.285		0			7		20			1005	1373		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.2292	0.996	1006	0.622		0			8		29			1007	1375		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.4976	0.828	1008	0.517		0			9		26			1009	1376		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.6267	0.783	1006	0.627		2			7		25			1007	1379		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.6706	0.537	1006	0.429		0			7		14			1007	1378		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.7088	1.167	1008	0.730		2			9		10			1009	1377		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.7175	0.692	1006	0.692		2			7		11			1007	1382		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.7480	0.374	1008	0.374		0			8		24			1009	1380		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.8535	0.306	1004	0.306		0			9		23			1005	1383		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	133.8562	0.559	1008	0.349		2			8		25			1009	1381		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.1794	0.480	1006	0.480		0			7		21			1007	1384		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.2599	0.884	1008	0.707		2			9		14			1009	1385		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.2671	0.607	1006	0.485		2			7		32			1007	1387		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.2741	0.222	1006	0.222		0			8		19			1007	1388		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.3209	0.393	1008	0.314		2			8		28			1009	1386		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.7191	0.663	1006	0.663		2			7		48			1007	1392		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.8386	0.331	1008	0.207		0			8		15			1009	1390		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.8418	0.635	1006	0.635		0			9		31			1007	1391		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.8652	0.776	1008	0.621		2			9		22			1009	1389		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.8943	0.368	1004	0.368		2			8		31			1005	1397		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.8948	0.725	1004	0.580		0			7		15			1005	1393		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.9352	0.540	1008	0.432		0			9		17			1009	1395		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.9352	1.261	1004	0.788		0			7		35			1005	1396		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	134.9675	0.403	1006	0.322		2			7		22			1007	1394		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	135.9365	0.713	1006	0.713		0			9		12			1007	1399		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	135.9806	0.791	1004	0.494		2			7		46			1005	1400		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	135.9811	0.309	1008	0.247		2			9		11			1009	1401		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.0171	0.725	1006	0.453		2			9		19			1007	1404		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.0273	0.537	1006	0.336		2			9		36			1007	1407		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.0317	0.643	1008	0.402		2			9		19			1009	1398		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.0320	0.878	1008	0.549		0			8		25			1009	1402		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.1023	0.589	1008	0.589		2			9		22			1009	1403		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.1788	1.116	1006	0.698		2			8		22			1007	1406		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.2289	0.832	1004	0.520		2			9		34			1005	1405		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.3953	0.674	1006	0.674		2			8		1			1007	1411		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.3968	0.751	1004	0.751		0			7		20			1005	1412		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.3978	0.320	1004	0.256		0			8		18			1005	1410		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.3991	0.943	1006	0.754		0			8		15			1007	1413		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.4106	0.903	1006	0.564		0			7		12			1007	1409		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.4146	0.429	1006	0.429		2			9		26			1007	1414		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.4758	0.382	1004	0.382		2			7		32			1005	1415		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.4953	0.771	1008	0.771		0			9		34			1009	1408		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.7309	0.508	1006	0.406		2			7		18			1007	1419		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.7324	0.431	1004	0.431		0			9		21			1005	1418		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.7711	0.666	1008	0.666		0			8		4			1009	1416		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	136.7748	0.634	1008	0.397		0			7		18			1009	1417		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6350	0.417	1006	0.334		0			9		13			1007	1422		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6356	0.691	1008	0.691		2			9		23			1009	1420		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6454	0.657	1008	0.657		2			8		20			1009	1424		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6566	0.934	1004	0.747		2			7		25			1005	1425		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6637	1.186	1004	0.741		0			8		33			1005	1421		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.6933	0.523	1008	0.523		0			9		32			1009	1423		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.8420	0.821	1008	0.657		0			8		31			1009	1426		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	137.8570	0.684	1008	0.684		2			9		22			1009	1427		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.1851	0.689	1004	0.551		0			7		22			1005	1429		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.3188	0.325	1008	0.325		0			7		12			1009	1430		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.3524	0.751	1008	0.751		2			8		1			1009	1428		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9007	0.482	1004	0.386		0			8		13			1005	1434		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9146	0.891	1004	0.712		0			7		9			1005	1435		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9378	0.288	1008	0.288		2			7		15			1009	1431		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9396	0.937	1006	0.586		0			7		43			1007	1432		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9634	0.227	1004	0.227		0			9		16			1005	1436		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9746	0.499	1008	0.312		0			9		35			1009	1438		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9814	0.775	1006	0.620		0			8		24			1007	1441		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	138.9967	0.459	1006	0.459		0			9		24			1007	1439		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.0192	0.290	1004	0.232		0			9		32			1005	1440		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.0222	0.527	1008	0.329		0			8		37			1009	1437		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.0791	0.567	1004	0.354		0			7		13			1005	1433		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.9341	0.714	1008	0.571		2			9		12			1009	1443		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.9357	0.388	1004	0.242		0			8		21			1005	1442		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	139.9506	0.956	1008	0.765		0			8		21			1009	1444		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	140.5860	0.518	1006	0.518		2			9		29			1007	1445		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	140.6117	0.335	1004	0.209		2			9		33			1005	1448		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	140.6330	0.455	1004	0.455		2			7		14			1005	1446		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	140.7219	0.390	1006	0.312		0			9		7			1007	1447		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	140.7409	0.663	1004	0.663		0			8		18			1005	1449		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.4934	0.751	1004	0.601		0			8		27			1005	1452		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.5064	0.509	1008	0.509		0			8		23			1009	1454		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.5213	0.621	1006	0.621		2			9		28			1007	1450		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.5381	0.654	1006	0.654		2			7		24			1007	1453		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.5604	0.579	1008	0.463		2			8		25			1009	1451		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.7126	0.661	1004	0.529		0			8		37			1005	1455		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.8282	0.731	1006	0.585		2			7		5			1007	1456		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.8594	0.241	1008	0.241		2			7		16			1009	1457		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	141.9931	0.311	1008	0.311		0			9		21			1009	1460		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.0133	0.456	1004	0.456		2			7		33			1005	1458		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.0273	0.454	1006	0.454		2			8		22			1007	1459		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.0338	0.790	1008	0.790		2			7		31			1009	1461		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.1204	0.550	1004	0.550		2			8		16			1005	1463		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.1574	0.397	1008	0.248		2			8		27			1009	1462		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.2022	0.716	1008	0.573		0			8		28			1009	1464		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.2192	0.258	1006	0.258		2			8		13			1007	1465		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.3946	1.254	1004	0.784		0			7		24			1005	1466		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.4961	0.493	1006	0.308		2			8		12			1007	1471		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.5655	0.439	1008	0.351		2			7		24			1009	1468		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.5729	0.556	1006	0.445		2			7		49			1007	1470		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.5859	1.218	1004	0.761		0			9		4			1005	1469		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	142.5959	0.558	1008	0.558		0			7		23			1009	1467		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.0843	0.531	1006	0.531		2			9		21			1007	1472		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.5549	0.842	1006	0.526		2			8		29			1007	1474		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6172	0.780	1004	0.624		0			7		18			1005	1477		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6385	0.724	1004	0.579		0			7		19			1005	1476		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6449	0.472	1008	0.377		0			8		35			1009	1480		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6522	0.491	1008	0.491		0			8		30			1009	1478		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6613	0.799	1008	0.499		0			8		20			1009	1475		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6632	0.409	1008	0.409		2			8		28			1009	1481		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.6787	0.750	1008	0.469		0			7		23			1009	1473		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	143.7200	0.598	1006	0.598		0			8		30			1007	1479		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.1477	0.968	1008	0.774		2			7		43			1009	1484		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.1715	0.655	1008	0.655		0			9		22			1009	1482		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.1853	0.866	1006	0.541		2			8		27			1007	1485		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.2069	0.369	1006	0.369		2			9		24			1007	1483		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.2634	0.277	1006	0.277		0			7		24			1007	1487		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.2801	0.401	1004	0.321		2			8		25			1005	1486		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.3338	0.432	1006	0.432		0			9		20			1007	1488		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.6148	0.580	1004	0.464		0			9		10			1005	1492		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.6674	0.709	1008	0.567		0			9		25			1009	1489		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.6710	0.541	1006	0.541		2			7		33			1007	1491		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.7485	0.576	1004	0.360		0			8		34			1005	1490		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.8813	0.452	1008	0.282		0			9		23			1009	1493		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	144.9166	1.113	1008	0.696		0			7		28			1009	1494		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.2447	0.932	1008	0.746		0			8		7			1009	1496		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.2601	0.726	1004	0.726		0			9		23			1005	1495		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.5422	0.897	1006	0.717		0			7		1			1007	1499		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.5738	1.156	1004	0.722		2			8		36			1005	1500		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.5828	0.392	1008	0.314		2			9		15			1009	1501		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.6075	0.464	1008	0.371		0			8		31			1009	1498		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.6196	0.831	1004	0.520		0			7		17			1005	1497		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	145.6393	0.298	1008	0.298		2			7		30			1009	1502		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.2446	0.930	1006	0.581		0			8		19			1007	1503		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5005	0.812	1006	0.508		2			8		20			1007	1505		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5149	0.640	1008	0.512		0			7		35			1009	1507		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5298	1.051	1006	0.657		2			7		23			1007	1504		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5381	1.243	1004	0.777		0			9		36			1005	1508		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5588	0.414	1006	0.258		2			8		16			1007	1510		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.5705	1.137	1004	0.711		0			9		30			1005	1506		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.6195	0.412	1008	0.412		2			9		29			1009	1509		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.7185	0.241	1008	0.241		2			7		5			1009	1511		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	146.7403	0.478	1004	0.299		2			7		35			1005	1512		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.2320	0.968	1004	0.774		2			7		15			1005	1515		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.3103	0.762	1006	0.610		2			9		25			1007	1517		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.3130	0.384	1006	0.308		0			9		23			1007	1516		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.3421	0.639	1006	0.639		2			9		17			1007	1514		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.3426	0.276	1004	0.276		2			8		25			1005	1513		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.3991	0.423	1006	0.339		2			9		35			1007	1518		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	147.9698	0.693	1006	0.554		2			7		50			1007	1520		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.0051	0.826	1008	0.516		0			9		26			1009	1525		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.0127	0.691	1008	0.552		2			7		36			1009	1519		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.0164	0.544	1004	0.435		2			7		17			1005	1521		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.0245	0.336	1008	0.269		0			7		31			1009	1523		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.0655	0.734	1004	0.588		2			8		1			1005	1522		3		1		2
;			at		dur		tab		armonica	dinamica	ottava	registro	pos	id_comp	nonlinearMode	movimento	ifn_attacco
i "Voce"	148.1876	0.275	1008	0.220		2			8		32			1009	1524		3		1		2

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
