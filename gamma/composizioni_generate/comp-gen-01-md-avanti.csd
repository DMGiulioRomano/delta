
<CsoundSynthesizer>
<CsOptions>
-o "comp-gen-01-md-avanti.wav" -W -d
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
#include "../includes/eventoSonoroOld.orc"
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
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
f 1000 0 3 -2 1 2 3
f 1001 0 3 -2 0 1 2
f 1002 0 3 -2 2 3 5
f 1003 0 3 -2 0 1 2
f 1004 0 3 -2 3 4 2
f 1005 0 3 -2 0 1 0
f 1006 0 4 -2 2 10 4 15
f 1007 0 4 -2 0 1 2 3
f 1008 0 4 -2 3 20 5 8
f 1009 0 4 -2 0 1 2 3

; --------------------------------------



i "Init" 0 0.1

; --- EVENTI GENERATI ---
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0010	37.255	1000	37.255		-34.84		0		2			1001	2	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.0010	52.050	1000	32.531		-33.94		1		2			1001	1	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.4261	43.406	1002	34.725		-32.95		0		1			1003	4	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.4609	56.117	1002	35.073		-33.45		0		1			1003	3	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	0.5170	53.504	1002	33.440		-34.42		0		1			1003	5	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	1.6290	37.767	1002	30.214		-31.92		1		2			1003	6	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	1.7245	36.772	1000	29.418		-32.28		0		1			1001	7	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	1.7259	45.093	1000	36.074		-30.11		1		2			1001	8	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	3.6945	33.980	1004	33.980		-32.34		0		2			1005	9	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	3.7789	52.151	1004	32.594		-31.79		2		1			1005	11	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	3.7882	33.340	1002	33.340		-31.03		2		3			1003	12	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	3.8293	56.780	1004	35.487		-32.34		0		1			1005	10	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.6604	42.525	1000	34.020		-30.60		1		3			1001	14	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.6680	47.787	1000	38.230		-30.39		2		3			1001	15	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.7046	47.696	1002	29.810		-29.27		0		2			1003	13	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	6.7180	37.709	1004	30.167		-31.85		2		1			1005	16	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	10.4732	26.687	1002	26.687		-29.15		1		4			1003	19	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	10.4926	35.362	1006	35.362		-30.38		1		3			1007	18	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	10.5025	34.010	1000	27.208		-30.75		3		4			1001	17	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	15.0261	24.963	1002	24.963		-29.54		2		3			1003	20	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	15.0947	40.101	1006	25.063		-28.98		2		4			1007	21	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	15.1358	38.423	1006	30.739		-29.56		2		5			1007	23	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	15.1918	57.360	1002	35.850		-28.30		2		2			1003	22	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.4852	39.616	1002	31.693		-27.60		3		3			1003	26	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.5405	25.243	1006	25.243		-27.61		2		5			1007	30	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.5688	33.842	1002	33.842		-27.65		2		2			1003	24	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.5718	24.400	1006	24.400		-27.57		1		4			1007	28	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.5800	27.041	1004	27.041		-27.59		2		4			1005	27	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.6261	54.489	1008	34.056		-27.55		3		5			1009	29	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	20.6353	47.064	1004	29.415		-27.56		2		4			1005	25	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.8250	46.796	1008	29.248		-25.66		2		5			1009	35	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.8773	24.750	1000	24.750		-26.26		4		4			1001	32	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.8830	23.010	1006	23.010		-26.35		4		6			1007	31	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.8896	25.266	1002	25.266		-26.03		4		6			1003	36	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.8903	30.151	1002	24.121		-26.01		2		3			1003	40	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.9039	23.854	1008	23.854		-36.65		5		3			1009	37	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.9050	31.246	1002	24.997		-36.23		5		6			1003	33	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.9195	40.986	1008	32.789		-25.70		4		5			1009	38	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.9301	25.593	1004	20.474		-36.29		5		4			1005	39	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	26.9471	24.255	1006	24.255		-25.61		3		5			1007	34	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	33.9654	34.181	1008	21.363		-24.64		3		7			1009	46	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	33.9807	30.940	1008	24.752		-34.86		5		3			1009	42	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	33.9831	35.188	1006	21.993		-23.02		3		7			1007	47	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	33.9898	26.393	1008	26.393		-22.96		2		5			1009	41	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	33.9924	35.612	1002	22.258		-24.29		2		7			1003	45	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.0308	45.756	1008	28.597		-33.40		6		6			1009	44	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.0475	20.043	1006	20.043		-34.28		6		6			1007	49	1		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.0537	37.554	1006	23.471		-34.78		6		5			1007	43	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.0574	49.819	1006	31.137		-35.63		5		6			1007	48	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	34.1034	45.149	1006	28.218		-24.06		3		8			1007	50	2		0.0000		90.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9176	10.655	1000	10.655		-33.18		4		1			1001	51	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9520	11.092	1000	11.092		-41.20		7		1			1001	61	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9726	13.912	1004	11.129		-32.37		4		1			1005	54	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9729	14.601	1000	11.681		-44.67		5		1			1001	53	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9778	17.792	1002	14.233		-30.65		4		1			1003	55	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9818	18.018	1002	14.589		-33.51		2		1			1003	59	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9841	18.016	1000	13.879		-42.16		6		1			1001	65	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	71.9858	12.593	1002	12.593		-40.90		7		2			1003	58	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0004	14.023	1006	11.218		-32.67		1		2			1007	57	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0012	10.028	1002	10.028		-40.30		5		2			1003	60	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0072	16.709	1002	13.367		-30.72		3		1			1003	56	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0115	11.120	1000	11.120		-33.15		2		2			1001	69	1		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0134	12.614	1002	10.092		-44.22		6		2			1003	68	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0223	17.538	1002	14.031		-33.68		2		1			1003	52	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0504	17.950	1008	12.147		-41.42		6		2			1009	66	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0692	17.548	1004	10.967		-42.26		6		1			1005	64	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0727	17.813	1008	11.133		-43.24		7		2			1009	62	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.0743	14.222	1000	11.377		-31.76		1		1			1001	67	1		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	72.1096	14.098	1008	14.098		-34.45		4		2			1009	63	2		72.0000		18.000	0.500
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.8711	0.000	1002	0.000		-33.23		1		1			1003	77	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9417	0.001	1000	0.000		-33.91		0		1			1001	76	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9500	0.000	1004	0.000		-34.78		0		2			1005	79	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9602	0.000	1004	0.000		-34.46		1		2			1005	93	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9639	0.003	1002	0.003		-30.16		1		2			1003	75	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9661	0.000	1000	0.000		-33.83		0		2			1001	92	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9683	0.000	1002	0.000		-30.41		1		1			1003	86	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9701	0.000	1004	0.000		-32.05		1		1			1005	98	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9701	0.000	1000	0.000		-34.98		1		1			1001	96	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9768	0.000	1004	0.000		-34.17		0		2			1005	94	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9795	0.000	1000	0.000		-31.12		0		2			1001	95	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9865	0.000	1002	0.000		-34.17		1		1			1003	80	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9891	0.012	1002	0.010		-34.91		0		2			1003	74	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9938	10.140	1004	6.337		-34.37		1		1			1005	70	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9941	0.000	1004	0.000		-33.55		0		1			1005	97	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9983	0.000	1004	0.000		-30.98		0		2			1005	90	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	89.9986	0.000	1004	0.000		-33.97		1		2			1005	99	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0019	0.000	1000	0.000		-31.70		0		1			1001	78	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0058	0.000	1000	0.000		-30.55		1		1			1001	91	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0103	0.000	1008	0.000		-33.67		0		2			1009	89	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0106	0.066	1004	0.053		-30.00		1		1			1005	73	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0112	0.000	1004	0.000		-30.15		0		2			1005	81	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0114	0.000	1002	0.000		-33.57		0		2			1003	84	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0155	0.000	1000	0.000		-32.99		0		1			1001	85	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0219	0.000	1004	0.000		-33.65		1		2			1005	88	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0275	1.653	1002	1.322		-32.36		0		1			1003	71	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0404	0.000	1000	0.000		-30.76		0		2			1001	82	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0438	0.000	1002	0.000		-34.62		0		2			1003	83	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0490	0.000	1008	0.000		-33.23		0		1			1009	87	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.0672	0.266	1000	0.266		-33.91		0		2			1001	72	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.7376	0.000	1000	0.000		-30.55		0		3			1001	110	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8044	0.000	1000	0.000		-29.86		2		1			1001	107	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8111	0.000	1002	0.000		-32.40		1		3			1003	114	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8317	0.000	1002	0.000		-30.87		0		3			1003	108	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8423	0.004	1004	0.002		-30.01		2		1			1005	105	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8429	0.000	1004	0.000		-30.16		0		3			1005	111	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8467	0.000	1004	0.000		-33.03		1		3			1005	106	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8583	2.260	1000	1.412		-32.94		1		1			1001	101	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8610	7.436	1006	5.949		-33.20		1		1			1007	100	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8690	0.000	1004	0.000		-31.51		1		1			1005	115	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8821	0.000	1000	0.000		-30.35		0		2			1001	112	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8850	0.093	1006	0.058		-30.45		0		3			1007	103	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8853	0.014	1000	0.011		-30.80		1		1			1001	104	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.8963	0.000	1002	0.000		-32.13		1		2			1003	109	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.9256	0.000	1002	0.000		-29.86		1		2			1003	113	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	90.9416	0.443	1004	0.277		-31.29		1		3			1005	102	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.5854	0.000	1002	0.000		-31.28		1		2			1003	131	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6085	0.000	1006	0.000		-29.69		0		2			1007	127	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6248	0.000	1002	0.000		-31.66		1		4			1003	125	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6341	0.018	1000	0.011		-29.68		1		2			1001	120	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6405	0.000	1000	0.000		-31.81		2		3			1001	126	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6436	0.000	1008	0.000		-31.49		2		4			1009	124	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6464	0.466	1004	0.291		-29.47		0		4			1005	118	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6647	0.000	1002	0.000		-31.93		0		2			1003	128	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6720	0.000	1000	0.000		-31.06		2		4			1001	134	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6917	8.313	1000	6.651		-31.81		1		3			1001	116	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6928	0.000	1002	0.000		-31.66		0		3			1003	132	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.6948	0.000	1000	0.000		-31.44		1		2			1001	133	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7004	0.000	1006	0.000		-31.44		1		4			1007	135	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7057	0.000	1006	0.000		-30.29		1		2			1007	129	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7153	0.002	1004	0.002		-31.84		2		1			1005	121	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7172	0.000	1006	0.000		-29.04		0		4			1007	122	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7190	0.000	1002	0.000		-31.04		1		2			1003	130	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7269	0.000	1008	0.000		-30.61		1		1			1009	123	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7419	0.079	1008	0.049		-30.98		3		2			1009	119	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.7492	1.123	1002	1.123		-29.77		2		2			1003	117	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	91.8230	0.000	1002	0.000		-29.15		1		4			1003	136	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.3944	0.011	1000	0.011		-29.57		3		4			1001	141	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4089	0.000	1008	0.000		-29.39		2		2			1009	145	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4163	0.000	1002	0.000		-29.00		3		2			1003	146	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4329	0.000	1008	0.000		-28.64		2		4			1009	151	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4450	0.287	1004	0.287		-29.21		1		3			1005	139	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4511	0.000	1000	0.000		-29.62		2		3			1001	149	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4892	0.000	1004	0.000		-29.70		2		3			1005	152	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.4896	0.000	1008	0.000		-29.88		0		2			1009	143	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5121	7.180	1008	7.180		-30.21		2		4			1009	137	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5140	0.041	1002	0.041		-30.00		2		3			1003	140	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5182	0.000	1008	0.000		-30.13		3		3			1009	153	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5539	1.097	1004	1.097		-29.51		2		3			1005	138	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5756	0.000	1004	0.000		-29.03		3		4			1005	147	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5819	0.002	1006	0.002		-28.55		1		4			1007	142	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.5874	0.000	1006	0.000		-29.93		1		4			1007	144	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.6044	0.000	1004	0.000		-29.67		1		1			1005	150	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	92.6527	0.000	1006	0.000		-29.43		2		4			1007	148	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3159	1.989	1008	1.243		-28.19		3		4			1009	155	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3184	0.000	1006	0.000		-28.38		3		2			1007	161	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3250	0.000	1002	0.000		-28.47		3		4			1003	166	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3337	0.015	1006	0.010		-28.32		1		4			1007	158	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3351	7.636	1004	6.108		-28.75		2		4			1005	154	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3428	0.000	1000	0.000		-28.30		2		3			1001	162	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3435	0.000	1008	0.000		-28.11		2		4			1009	168	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3443	0.054	1006	0.054		-28.15		3		4			1007	157	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3529	0.000	1002	0.000		-28.68		4		3			1003	169	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3531	0.000	1008	0.000		-28.30		3		4			1009	171	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3542	0.000	1008	0.000		-28.18		3		3			1009	167	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3562	0.000	1004	0.000		-28.67		2		3			1005	163	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3757	0.000	1000	0.000		-28.21		1		2			1001	160	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3784	0.000	1000	0.000		-28.43		2		4			1001	165	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3842	0.000	1006	0.000		-28.52		3		4			1007	164	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.3847	0.002	1008	0.002		-28.45		3		2			1009	159	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.4094	0.000	1006	0.000		-28.33		2		2			1007	170	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	93.4140	0.250	1002	0.250		-28.65		3		2			1003	156	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.0907	0.418	1006	0.261		-27.50		2		5			1007	174	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1072	0.000	1000	0.000		-27.50		3		2			1001	191	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1209	1.784	1000	1.115		-27.50		4		4			1001	173	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1499	0.000	1002	0.000		-27.50		2		4			1003	179	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1657	0.000	1008	0.000		-27.50		1		2			1009	185	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1715	0.000	1006	0.000		-27.50		3		3			1007	188	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1819	0.011	1002	0.009		-27.50		3		5			1003	176	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1841	0.000	1008	0.000		-27.50		4		4			1009	181	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1844	0.001	1002	0.000		-27.50		1		5			1003	178	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1866	0.000	1008	0.000		-27.50		3		5			1009	182	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.1882	0.000	1000	0.000		-27.50		2		3			1001	190	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2063	0.002	1006	0.002		-27.50		4		4			1007	177	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2109	11.170	1006	6.981		-27.50		3		2			1007	172	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2245	0.064	1008	0.051		-27.50		2		3			1009	175	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2302	0.000	1006	0.000		-27.50		4		5			1007	186	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2307	0.000	1004	0.000		-27.50		4		3			1005	184	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2506	0.000	1002	0.000		-27.50		4		5			1003	187	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2628	0.000	1004	0.000		-27.50		3		4			1005	180	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.2882	0.000	1004	0.000		-27.50		2		6			1005	189	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.3012	0.000	1002	0.000		-27.50		1		4			1003	183	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.9566	0.053	1004	0.053		-26.69		4		4			1005	195	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	94.9741	0.002	1006	0.001		-26.68		2		5			1007	197	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0110	0.211	1006	0.169		-26.81		2		5			1007	194	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0260	0.000	1004	0.000		-26.11		4		5			1005	199	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0419	0.000	1006	0.000		-26.53		3		5			1007	198	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0593	0.949	1002	0.949		-26.62		4		2			1003	193	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0605	0.014	1008	0.009		-26.46		1		5			1009	196	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0619	9.278	1008	5.799		-36.75		5		4			1009	192	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0661	0.000	1004	0.000		-26.96		4		4			1005	200	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0666	0.000	1002	0.000		-26.72		2		3			1003	201	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.0961	0.000	1004	0.000		-26.32		2		3			1005	202	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8152	0.000	1008	0.000		-34.62		5		7			1009	211	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8211	0.015	1008	0.009		-34.87		5		6			1009	207	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8485	0.000	1008	0.000		-34.98		5		7			1009	218	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8666	0.000	1008	0.000		-36.09		5		6			1009	215	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8681	0.000	1000	0.000		-34.65		5		6			1001	216	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8744	0.002	1000	0.002		-25.80		3		4			1001	208	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8795	0.214	1006	0.171		-25.86		4		5			1007	205	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.8986	1.987	1008	1.242		-35.21		5		6			1009	204	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9045	0.001	1008	0.000		-35.74		5		4			1009	209	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9055	0.000	1000	0.000		-24.91		3		5			1001	212	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9084	0.040	1008	0.032		-25.63		4		7			1009	206	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9205	0.000	1006	0.000		-34.52		5		3			1007	210	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9242	4.104	1008	4.104		-25.46		2		4			1009	203	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9337	0.000	1006	0.000		-36.03		5		3			1007	217	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9382	0.000	1008	0.000		-25.30		3		3			1009	214	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	95.9597	0.000	1004	0.000		-25.80		4		3			1005	213	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.5970	0.007	1004	0.007		-34.76		5		4			1005	223	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6200	0.000	1008	0.000		-33.66		5		5			1009	227	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6382	0.003	1004	0.002		-24.76		2		6			1005	224	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6421	0.000	1008	0.000		-23.78		4		6			1009	225	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6523	0.390	1006	0.243		-24.05		4		6			1007	221	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6538	0.000	1002	0.000		-23.35		3		6			1003	226	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6573	0.000	1008	0.000		-25.66		4		4			1009	228	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6942	0.061	1006	0.038		-24.59		3		4			1007	222	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.6946	0.000	1006	0.000		-35.20		6		5			1007	229	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7048	4.949	1006	4.949		-23.67		3		8			1007	219	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7071	0.883	1004	0.883		-24.67		3		7			1005	220	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7262	0.000	1000	0.000		-24.43		4		7			1001	232	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7404	0.000	1004	0.000		-33.82		6		4			1005	230	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7489	0.000	1008	0.000		-34.48		5		5			1009	231	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	96.7786	0.000	1002	0.000		-23.19		4		5			1003	233	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5148	0.000	1008	0.000		-32.34		5		7			1009	242	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5219	0.000	1004	0.000		-22.96		3		4			1005	241	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5255	0.238	1006	0.238		-32.74		5		8			1007	236	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5447	0.000	1008	0.000		-22.04		3		6			1009	240	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5529	1.218	1006	0.974		-31.51		7		7			1007	235	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5588	0.050	1006	0.031		-33.53		5		6			1007	237	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5706	0.002	1008	0.002		-34.99		7		4			1009	239	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.5819	0.000	1006	0.000		-22.14		3		6			1007	243	1		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.6039	0.015	1006	0.009		-23.06		4		6			1007	238	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	97.6368	6.795	1008	5.436		-33.15		6		7			1009	234	2		90.0000		18.000	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9404	0.000	1004	0.000		-32.06		0		2			1005	253	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9488	0.000	1000	0.000		-30.47		1		1			1001	248	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9541	0.000	1004	0.000		-32.67		1		2			1005	252	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9676	4.085	1006	2.553		-32.38		1		2			1007	244	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9815	0.000	1000	0.000		-33.23		0		2			1001	255	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9823	0.000	1000	0.000		-30.82		0		1			1001	254	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9894	0.000	1002	0.000		-34.14		1		2			1003	258	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	107.9987	0.000	1004	0.000		-34.51		1		2			1005	257	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0134	0.013	1004	0.013		-33.67		1		1			1005	246	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0290	0.000	1006	0.000		-33.18		1		2			1007	250	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0314	0.000	1000	0.000		-31.41		0		1			1001	251	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0336	0.176	1002	0.176		-32.09		1		1			1003	245	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0368	0.002	1008	0.001		-32.71		1		2			1009	247	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0816	0.000	1000	0.000		-32.70		0		1			1001	249	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.0908	0.000	1004	0.000		-31.59		1		2			1005	259	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.1180	0.000	1002	0.000		-34.28		1		2			1003	256	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.2761	0.000	1004	0.000		-30.52		2		3			1005	270	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.2876	0.000	1000	0.000		-30.36		2		1			1001	273	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.2936	0.000	1000	0.000		-31.71		1		3			1001	268	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.2948	0.170	1004	0.170		-30.95		2		3			1005	261	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3044	0.001	1004	0.001		-30.54		1		1			1005	263	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3059	0.000	1006	0.000		-31.25		0		1			1007	271	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3165	0.000	1000	0.000		-32.22		0		3			1001	269	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3170	0.000	1004	0.000		-30.86		1		2			1005	264	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3182	0.022	1000	0.014		-33.01		0		1			1001	262	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3271	0.000	1000	0.000		-32.21		0		2			1001	266	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3276	2.924	1000	2.924		-32.02		1		3			1001	260	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3401	0.000	1000	0.000		-30.66		2		3			1001	265	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3552	0.000	1000	0.000		-33.42		0		1			1001	272	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3567	0.000	1002	0.000		-29.57		1		2			1003	274	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.3673	0.000	1004	0.000		-30.24		1		1			1005	267	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5531	0.000	1004	0.000		-29.37		1		2			1005	285	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5646	0.000	1000	0.000		-30.92		2		3			1001	282	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5680	0.000	1000	0.000		-29.71		1		1			1001	286	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5706	0.002	1008	0.001		-29.98		1		3			1009	278	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5798	0.000	1002	0.000		-29.59		2		3			1003	281	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.5992	0.000	1002	0.000		-31.57		2		2			1003	287	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6047	0.000	1004	0.000		-31.35		1		2			1005	279	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6068	0.000	1000	0.000		-30.82		2		3			1001	290	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6106	0.000	1004	0.000		-29.53		1		4			1005	283	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6291	0.236	1002	0.189		-30.75		1		3			1003	276	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6462	0.020	1006	0.012		-29.38		2		3			1007	277	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6600	0.000	1002	0.000		-29.32		2		3			1003	289	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6619	0.000	1002	0.000		-29.67		2		1			1003	288	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.6872	2.641	1000	2.641		-29.47		0		2			1001	275	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.7043	0.000	1008	0.000		-29.58		0		2			1009	280	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.7285	0.000	1004	0.000		-30.50		2		1			1005	284	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.8025	0.000	1000	0.000		-29.01		1		4			1001	307	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.8377	0.000	1006	0.000		-29.88		1		2			1007	301	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.8977	0.000	1000	0.000		-30.49		2		3			1001	296	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9024	0.000	1008	0.000		-29.86		1		4			1009	297	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9040	0.000	1002	0.000		-30.20		3		2			1003	300	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9275	0.013	1006	0.013		-28.78		3		4			1007	293	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9289	0.000	1002	0.000		-28.75		2		3			1003	298	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9328	0.000	1002	0.000		-28.78		1		2			1003	304	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9344	4.216	1006	2.635		-28.90		2		3			1007	291	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9373	0.000	1000	0.000		-29.48		1		2			1001	306	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9733	0.000	1008	0.000		-29.84		2		3			1009	303	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9739	0.000	1000	0.000		-28.86		1		3			1001	299	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9796	0.000	1004	0.000		-30.14		2		4			1005	302	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	108.9819	0.001	1000	0.001		-30.45		3		4			1001	294	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.0115	0.155	1000	0.155		-30.16		3		2			1001	292	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.0611	0.000	1004	0.000		-30.48		3		3			1005	305	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.1015	0.000	1002	0.000		-28.97		2		4			1003	295	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.1659	1.888	1006	1.888		-28.85		3		3			1007	308	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.1732	0.137	1006	0.137		-28.94		3		5			1007	309	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2240	0.011	1002	0.011		-28.66		4		5			1003	310	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2372	0.000	1000	0.000		-28.16		3		4			1001	322	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2422	0.000	1002	0.000		-28.27		2		2			1003	321	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2456	0.000	1004	0.000		-28.27		1		2			1005	316	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2540	0.000	1004	0.000		-28.90		3		5			1005	320	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2590	0.000	1006	0.000		-28.81		2		2			1007	313	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2631	0.000	1004	0.000		-28.30		4		3			1005	315	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2665	0.000	1008	0.000		-28.23		3		5			1009	318	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2776	0.000	1004	0.000		-28.57		3		3			1005	319	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.2989	0.002	1004	0.001		-28.65		3		3			1005	311	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.3042	0.000	1000	0.000		-28.13		1		5			1001	314	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.3056	0.000	1002	0.000		-28.88		2		4			1003	317	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.3489	0.000	1002	0.000		-28.20		1		4			1003	312	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.4930	0.000	1008	0.000		-27.50		4		3			1009	334	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5262	0.001	1004	0.001		-27.50		3		5			1005	326	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5315	0.000	1004	0.000		-27.50		2		3			1005	327	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5328	0.000	1000	0.000		-27.50		4		3			1001	330	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5374	0.238	1008	0.149		-27.50		2		5			1009	324	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5405	0.014	1008	0.011		-27.50		4		4			1009	325	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5507	0.000	1002	0.000		-27.50		1		3			1003	336	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5514	0.000	1008	0.000		-27.50		3		4			1009	333	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5603	2.844	1006	2.275		-27.50		4		4			1007	323	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5796	0.000	1008	0.000		-27.50		4		5			1009	338	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5863	0.000	1006	0.000		-27.50		2		2			1007	329	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5952	0.000	1000	0.000		-27.50		2		5			1001	328	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.5975	0.000	1008	0.000		-27.50		4		3			1009	335	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.6104	0.000	1000	0.000		-27.50		4		5			1001	337	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.6124	0.000	1008	0.000		-27.50		4		5			1009	331	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.6257	0.000	1000	0.000		-27.50		3		6			1001	332	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.7831	0.000	1008	0.000		-26.32		4		5			1009	346	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.8261	0.020	1006	0.012		-26.46		2		3			1007	341	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.8282	0.000	1006	0.000		-26.23		1		6			1007	349	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.8684	0.000	1002	0.000		-36.74		5		3			1003	344	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.8799	0.000	1002	0.000		-26.49		4		5			1003	347	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.8971	2.189	1008	2.189		-26.65		3		4			1009	339	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.9228	0.000	1002	0.000		-26.95		3		5			1003	348	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.9402	0.000	1008	0.000		-26.26		2		5			1009	343	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.9517	0.183	1004	0.146		-26.13		2		5			1005	340	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	109.9679	0.000	1000	0.000		-26.98		2		4			1001	345	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.0109	0.001	1006	0.001		-26.85		3		3			1007	342	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.0803	0.022	1008	0.014		-36.15		5		6			1009	352	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.1193	0.000	1000	0.000		-26.04		3		4			1001	365	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.1796	0.000	1008	0.000		-34.93		6		7			1009	358	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2053	0.000	1006	0.000		-25.95		4		7			1007	364	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2116	0.000	1008	0.000		-25.07		4		3			1009	363	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2117	0.000	1002	0.000		-25.13		4		6			1003	361	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2162	0.000	1004	0.000		-24.83		2		5			1005	357	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2164	0.165	1000	0.132		-26.24		4		7			1001	351	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2170	0.000	1008	0.000		-34.66		6		5			1009	359	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2174	0.000	1000	0.000		-26.10		4		6			1001	354	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2225	2.809	1004	1.755		-26.12		4		6			1005	350	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2294	0.000	1002	0.000		-25.12		4		7			1003	362	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2481	0.000	1008	0.000		-25.15		3		6			1009	356	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2603	0.000	1006	0.000		-25.69		4		3			1007	360	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2798	0.000	1004	0.000		-26.07		3		3			1005	355	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.2985	0.001	1004	0.001		-26.11		3		5			1005	353	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.4757	0.000	1002	0.000		-25.63		4		6			1003	370	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.4946	0.000	1000	0.000		-23.73		4		4			1001	373	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.4984	0.000	1006	0.000		-25.34		3		7			1007	371	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5042	1.610	1002	1.610		-25.81		3		7			1003	366	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5168	0.017	1008	0.011		-25.50		4		6			1009	368	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5217	0.001	1004	0.001		-25.54		2		3			1005	369	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5477	0.000	1006	0.000		-23.74		3		8			1007	374	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5583	0.130	1006	0.130		-35.06		6		7			1007	367	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.5771	0.000	1002	0.000		-24.31		2		8			1003	375	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.7197	0.000	1008	0.000		-33.75		5		7			1009	387	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.7543	0.000	1008	0.000		-34.93		5		7			1009	372	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.7848	0.000	1006	0.000		-32.47		6		6			1007	382	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8017	0.107	1004	0.107		-34.74		6		5			1005	377	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8233	0.000	1006	0.000		-25.18		4		7			1007	389	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8317	0.000	1006	0.000		-32.97		5		4			1007	380	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8323	0.000	1002	0.000		-23.50		3		6			1003	386	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8411	2.666	1006	2.133		-32.42		6		4			1007	376	2		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8453	0.000	1006	0.000		-24.06		3		6			1007	385	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8506	0.010	1008	0.010		-25.38		3		7			1009	378	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8516	0.001	1004	0.001		-32.24		7		4			1005	379	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8518	0.000	1006	0.000		-32.53		6		8			1007	384	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8626	0.000	1006	0.000		-34.93		5		8			1007	383	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.8638	0.000	1004	0.000		-34.51		7		6			1005	388	1		108.0000		6.750	7.000
;						at		dur		ritmi	armonica	amp			ott		reg			pos		id	nonlin	sec_start	sec_dur
i "AvviaComportamento"	110.9153	0.000	1006	0.000		-35.21		5		3			1007	381	2		108.0000		6.750	7.000

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
