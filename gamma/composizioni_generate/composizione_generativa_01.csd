
<CsoundSynthesizer>
<CsOptions>
-o "composizione_generativa_01.wav" -W -d
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
f 0 136.21802013464406 ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 2 20, 28, 20
f 1001 0 3 2 0, 1, 2
f 1002 0 3 2 18, 25, 30
f 1003 0 3 2 0, 1, 2
f 1004 0 3 2 16, 20, 24
f 1005 0 3 2 0, 1, 2
f 1006 0 4 2 2, 10, 4, 15
f 1007 0 4 2 0, 1, 2, 3
f 1008 0 4 2 3, 20, 5, 8
f 1009 0 4 2 0, 1, 2, 3

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0010	72.570	1000	45.356		-33.84		1		2			1001	1		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0254	47.238	1002	47.238		-31.25		0		1			1003	2		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.0314	45.156	1000	45.156		-31.39		0		1			1001	3		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.2332	81.594	1002	50.996		-30.65		1		1			1003	4		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.8297	55.036	1000	44.029		-34.81		0		2			1001	5		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	0.9228	66.625	1004	41.640		-31.00		0		1			1005	6		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	2.0568	55.651	1004	55.651		-33.46		0		2			1005	7		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	2.0621	41.612	1000	41.612		-32.76		0		2			1001	8		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.6026	46.271	1002	46.271		-31.29		0		2			1003	10		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	3.6962	83.917	1006	52.448		-33.65		1		2			1007	9		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	5.5902	56.347	1004	56.347		-30.97		1		2			1005	11		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	5.6294	64.884	1002	51.907		-32.88		0		2			1003	12		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.1110	61.593	1000	49.275		-33.01		0		2			1001	13		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	8.1425	38.448	1000	38.448		-29.73		2		1			1001	14		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	11.0337	66.860	1000	41.788		-31.97		0		2			1001	15		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	11.0520	46.988	1004	46.988		-31.43		0		1			1005	16		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.3961	62.839	1008	50.271		-27.90		2		1			1009	18		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.4412	45.710	1000	45.710		-29.71		0		3			1001	17		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	14.4816	36.306	1006	36.306		-27.80		3		2			1007	19		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.1726	57.063	1000	35.664		-29.00		0		2			1001	21		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.2481	39.899	1002	39.899		-28.23		0		1			1003	22		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	18.2921	82.621	1002	51.638		-29.91		3		3			1003	20		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.4667	64.899	1000	40.562		-29.21		3		3			1001	24		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.4940	54.922	1004	34.326		-27.63		4		2			1005	27		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5049	47.533	1004	47.533		-29.03		0		2			1005	26		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5307	34.632	1008	34.632		-29.96		0		2			1009	23		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	22.5625	75.681	1002	47.301		-29.49		3		3			1003	25		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.2058	69.618	1002	43.511		-28.81		2		3			1003	30		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.2499	58.866	1006	47.093		-29.28		3		2			1007	29		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	27.2603	44.332	1006	35.465		-26.54		1		3			1007	28		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.3412	52.560	1006	32.850		-24.68		8		2			1007	37		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.3737	53.230	1006	42.584		-25.61		1		2			1007	31		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.3959	41.378	1000	33.103		-25.78		1		4			1001	32		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4017	58.151	1000	46.521		-26.05		3		2			1001	33		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4055	46.497	1006	37.198		-27.87		6		3			1007	35		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4442	65.260	1000	40.788		-26.28		0		2			1001	34		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	32.4528	53.269	1006	42.615		-28.86		1		3			1007	36		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	37.9442	69.372	1002	43.358		-24.22		1		2			1003	39		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	37.9632	58.354	1004	36.471		-23.69		4		2			1005	40		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	38.0977	55.130	1004	34.456		-25.79		1		2			1005	38		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0721	45.008	1006	45.008		-24.36		0		3			1007	42		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0829	60.629	1004	37.893		-25.36		2		3			1005	44		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.0995	33.249	1002	33.249		-23.53		0		4			1003	41		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	44.1384	42.426	1006	33.941		-23.75		1		2			1007	43		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5884	34.023	1006	34.023		-23.17		3		2			1007	45		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5942	52.448	1004	32.780		-24.75		0		3			1005	48		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5965	45.727	1004	36.581		-23.05		0		4			1005	50		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.5990	34.190	1008	34.190		-24.59		6		3			1009	46		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6077	42.249	1000	33.799		-21.94		0		4			1001	51		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6294	44.824	1006	35.859		-21.59		0		2			1007	52		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6637	63.146	1000	39.466		-23.26		5		5			1001	47		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	50.6992	30.593	1008	30.593		-23.70		8		3			1009	49		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.4902	51.538	1000	32.211		-20.55		3		5			1001	60		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5760	38.893	1006	24.308		-23.54		0		5			1007	56		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.5783	25.541	1002	25.541		-24.62		2		4			1003	55		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.6037	42.088	1004	26.305		-24.48		3		5			1005	53		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.6657	48.659	1006	38.927		-21.53		6		4			1007	54		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.6662	62.634	1006	39.146		-21.43		1		4			1007	57		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	57.7042	39.140	1006	39.140		-24.60		0		3			1007	58		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	64.9479	26.928	1000	26.928		-21.97		0		5			1001	66		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	64.9811	32.424	1004	32.424		-21.69		4		5			1005	63		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	64.9934	34.575	1000	27.660		-22.85		0		3			1001	67		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0187	23.370	1006	23.370		-19.62		5		4			1007	65		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0319	44.534	1008	35.627		-21.44		0		4			1009	69		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0460	61.172	1006	38.233		-22.33		3		4			1007	61		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0570	49.827	1008	31.142		-20.66		0		4			1009	64		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	65.0677	41.865	1000	33.492		-20.62		2		4			1001	62		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8284	37.520	1008	23.450		-18.29		0		5			1009	75		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8388	33.872	1006	33.872		-18.62		0		4			1007	73		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8531	35.987	1002	28.790		-19.77		6		4			1003	72		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.8618	34.585	1006	34.585		-21.95		5		4			1007	76		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9164	35.340	1006	35.340		-21.24		5		3			1007	77		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9199	50.098	1008	31.312		-19.70		0		5			1009	78		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9212	39.450	1004	31.560		-19.24		3		3			1005	70		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9334	32.873	1006	20.546		-19.97		0		4			1007	79		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	72.9446	22.914	1006	22.914		-20.14		2		6			1007	71		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.0990	28.367	1006	28.367		-21.26		6		3			1007	83		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1885	23.556	1008	23.556		-21.21		0		4			1009	92		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.1953	20.031	1002	20.031		-18.19		0		6			1003	94		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2208	28.659	1000	28.659		-17.87		0		4			1001	80		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2210	34.108	1008	27.286		-19.49		2		6			1009	88		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2228	24.511	1008	19.609		-18.13		0		5			1009	96		1
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.2835	34.272	1000	21.420		-18.21		3		3			1001	81		0
;						at		dur		tab		armonica	ampiezza	ottava	registro	niente	id_comp	nonlinearMode
i "AvviaComportamento"	81.3013	33.525	1000	20.953		-20.85		7		4			1001	82		0

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
