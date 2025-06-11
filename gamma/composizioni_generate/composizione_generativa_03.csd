
<CsoundSynthesizer>
<CsOptions>
-o "composizione_generativa_03.wav" -W -d
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
#include "../includes/comportamento.orc"
#include "../includes/avvia_comportamento.orc"

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
f 0 115.0257466727211 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 20, 28, 20
f 1001 0 3 2 0, 1, 2
f 1002 0 3 2 18, 25, 30
f 1003 0 3 2 0, 1, 2
f 1004 0 3 2 16, 20, 24
f 1005 0 3 2 0, 1, 2
f 1006 0 4 2 3, 20, 5, 8
f 1007 0 4 2 0, 1, 2, 3
f 1008 0 4 2 2, 10, 4, 15
f 1009 0 4 2 0, 1, 2, 3

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0554	46.252	1000	46.252		-31.05		0		2			1001	1		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.2184	64.422	1002	40.264		-32.15		0		1			1003	2		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8885	50.024	1000	40.019		-31.37		0		1			1001	3		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	2.0321	49.133	1004	39.306		-32.78		0		3			1005	4		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.5394	42.389	1002	42.389		-33.88		0		2			1003	5		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.5853	43.746	1002	43.746		-31.32		2		1			1003	6		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	5.5321	51.748	1000	51.748		-30.28		0		2			1001	7		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.0892	40.306	1004	40.306		-28.93		0		2			1005	9		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.1177	69.485	1000	55.588		-31.90		0		3			1001	8		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	10.9893	85.661	1006	53.538		-29.19		1		1			1007	12		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	11.0497	61.147	1000	48.917		-30.38		0		2			1001	10		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	11.1233	51.389	1000	51.389		-31.88		0		2			1001	11		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.3546	58.642	1006	36.651		-29.00		0		3			1007	14		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.4182	47.849	1000	47.849		-30.79		0		3			1001	15		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.4465	62.390	1004	49.912		-32.08		0		3			1005	13		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.1561	62.100	1008	49.680		-31.61		2		2			1009	17		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.2538	38.947	1000	38.947		-31.55		0		2			1001	16		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.2727	37.739	1002	37.739		-29.68		3		2			1003	18		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.2993	40.675	1002	40.675		-28.18		0		3			1003	20		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.3442	68.651	1004	42.907		-27.33		0		1			1005	19		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.4206	51.021	1004	40.817		-29.58		2		3			1005	22		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.4789	59.968	1002	47.974		-27.25		1		2			1003	21		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5108	55.478	1002	44.382		-28.43		0		1			1003	23		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5175	50.321	1000	40.257		-28.27		0		2			1001	25		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5531	50.534	1002	40.427		-27.58		3		3			1003	24		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.2069	42.298	1002	42.298		-25.93		0		2			1003	26		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.2190	66.531	1000	41.582		-29.95		0		3			1001	28		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.3345	39.190	1006	31.352		-25.64		1		2			1007	27		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.3315	60.804	1002	38.002		-26.81		4		4			1003	32		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.3743	34.795	1004	34.795		-26.29		1		4			1005	29		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4471	42.401	1000	33.921		-28.26		3		3			1001	31		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4772	58.681	1002	36.676		-26.49		1		2			1003	30		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	37.9677	34.809	1002	34.809		-24.56		1		3			1003	33		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	37.9927	33.376	1000	33.376		-28.10		0		3			1001	36		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	38.0239	44.529	1008	35.624		-24.49		2		3			1009	34		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	38.0240	56.157	1002	35.098		-24.94		0		4			1003	35		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0741	39.931	1000	31.945		-24.04		3		3			1001	38		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0785	30.880	1002	30.880		-27.42		6		2			1003	40		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0852	26.239	1000	26.239		-24.83		0		3			1001	41		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0987	28.638	1000	28.638		-23.26		1		4			1001	39		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.1689	35.678	1008	35.678		-26.91		3		2			1009	37		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5519	48.677	1000	30.423		-25.20		2		3			1001	42		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5884	44.929	1004	28.080		-24.55		1		4			1005	47		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5949	32.630	1006	26.104		-25.04		6		3			1007	44		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5980	38.516	1008	30.813		-23.99		0		3			1009	45		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5991	45.449	1002	28.406		-25.54		2		5			1003	43		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6369	35.320	1002	28.256		-24.26		7		3			1003	48		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6576	31.412	1002	25.130		-22.72		4		5			1003	46		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5725	27.172	1004	27.172		-24.81		5		3			1005	50		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5809	25.681	1004	20.545		-22.45		0		5			1005	53		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5819	33.850	1000	27.080		-21.13		1		3			1001	52		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5850	25.452	1006	25.452		-20.57		2		4			1007	49		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.6378	21.397	1008	21.397		-21.88		3		2			1009	51		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	64.9736	28.648	1004	17.905		-20.09		0		3			1005	56		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	64.9832	28.217	1006	17.636		-20.47		0		4			1007	58		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0461	24.355	1000	24.355		-23.86		3		4			1001	54		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0472	20.525	1002	20.525		-19.42		0		5			1003	57		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0542	21.286	1000	17.029		-21.78		2		3			1001	55		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0774	36.849	1006	23.030		-22.93		0		4			1007	59		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8732	18.073	1004	18.073		-21.55		3		5			1005	65		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8755	20.547	1002	16.437		-21.06		0		5			1003	61		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8818	21.607	1002	13.504		-18.29		1		5			1003	66		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8860	17.369	1002	17.369		-19.54		0		4			1003	67		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8905	22.795	1000	18.236		-19.28		6		6			1001	62		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9000	26.142	1002	16.338		-18.22		6		4			1003	63		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9169	23.322	1006	18.657		-22.37		0		3			1007	68		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9783	26.632	1000	16.645		-19.87		0		6			1001	60		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9785	19.053	1008	15.242		-22.00		0		4			1009	64		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1616	20.539	1004	12.837		-20.43		6		4			1005	78		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1734	16.671	1006	13.337		-17.40		0		5			1007	79		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1766	14.338	1000	14.338		-16.79		1		4			1001	69		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1848	15.566	1004	12.453		-20.72		0		4			1005	80		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1926	22.465	1008	14.041		-20.55		0		4			1009	72		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1975	20.715	1000	12.947		-19.30		5		3			1001	74		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1985	14.025	1002	11.220		-21.44		5		6			1003	70		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2016	16.430	1006	16.430		-18.30		0		5			1007	81		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2253	23.800	1002	14.875		-17.45		3		5			1003	71		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2257	19.426	1000	15.541		-20.28		5		4			1001	73		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2568	15.108	1002	15.108		-20.48		6		4			1003	76		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
