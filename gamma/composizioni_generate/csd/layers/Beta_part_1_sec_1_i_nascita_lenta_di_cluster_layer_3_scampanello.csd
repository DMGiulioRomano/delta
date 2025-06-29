
<CsoundSynthesizer>
<CsOptions>
-o "composizioni_generate/wav/layers/Beta_part_1_sec_1_i_nascita_lenta_di_cluster_layer_3_scampanello.wav" -W -d -m0
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
gi_Index init 2
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0

gi_debug init 1

#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/gamma_utils.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/pfield_comp.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/NonlinearFunc.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/GenPythagFreqs.udo"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/initIsoAmp.orc"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/eventoSonoro.orc"
#include "/Users/giuliodemattia/Github/DMGiulioRomano/delta/gamma/includes/voce.orc"

instr time
    ktime times
    if gi_debug > 1 then
    printk 1,ktime
    endif
endin

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
f 0 156.0656927252579 ; Evento f fittizio per definire la durata totale
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
; mega-impulsivo
f 8 0 4096 5 0.001 128 1 3968 0.0001
; continua
f 20 0 4096 7 1 4096 1
; crescendo_lento
f 21 0 4096 7 0 4096 1
; diminuendo_rapido
f 22 0 4096 7 1 4096 0
; plateau_forte
f 23 0 4096 10 1
; crescendo_diminuendo
f 24 0 4096 7 0 2048 1 2048 0
; impulso
f 25 0 4096 6 1 4096 0.001


f 1000 0 11 -2 3 2 4 5 3 2 4 1 3 2 4
f 1001 0 11 -2 0 1 2 3 1 1 2 0 2 1 2


i "time" 0 156.0656927252579
i "Init" 0 0.1

; --- EVENTI GENERATI ---

; =============================================================================
; SEZIONE: "I. Nascita Lenta di Cluster"
; Inizio: 0.000s, Durata: 154.000s
; =============================================================================

;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.7829	16.215	1000	10.134		3.000000	5		18			5		18		1001	1291		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.1331	11.994	1000	9.595		3.000000	6		19			6		19		1001	1292		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.3502	11.907	1000	9.525		3.000000	4		9			4		9		1001	1294		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.0195	12.666	1000	10.133		3.000000	3		15			3		15		1001	1295		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.8774	14.962	1000	9.352		3.000000	5		1			5		1		1001	1296		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3886	18.612	1000	11.633		3.000000	2		11			2		11		1001	1297		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6595	15.912	1000	9.945		3.000000	6		1			6		1		1001	1298		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.2447	15.568	1000	9.730		3.000000	3		10			3		10		1001	1299		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.7937	14.548	1000	9.093		3.000000	4		6			4		6		1001	1300		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.0841	18.950	1000	11.844		3.000000	8		5			8		5		1001	1301		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6192	12.211	1000	9.769		3.000000	7		15			7		15		1001	1303		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.9359	13.084	1000	10.467		3.000000	7		10			7		10		1001	1307		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.2750	15.154	1000	9.472		3.000000	3		5			3		5		1001	1308		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3071	14.732	1000	9.208		3.000000	3		15			3		15		1001	1309		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.0569	12.498	1000	9.999		3.000000	6		5			6		5		1001	1310		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.6850	13.651	1000	10.921		3.000000	4		10			4		10		1001	1312		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.5860	13.785	1000	11.028		3.000000	5		13			5		13		1001	1313		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0975	15.598	1000	9.749		3.000000	5		4			5		4		1001	1315		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.0541	13.110	1000	10.488		3.000000	8		19			8		19		1001	1316		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9651	12.314	1000	9.851		3.000000	6		19			6		19		1001	1317		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.7879	17.466	1000	10.916		3.000000	4		9			4		9		1001	1318		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.6044	14.355	1000	11.484		3.000000	3		7			3		7		1001	1319		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.5839	11.531	1000	9.225		3.000000	3		10			3		10		1001	1320		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.9172	17.978	1000	11.236		3.000000	7		18			7		18		1001	1322		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.4513	14.392	1000	11.514		3.000000	6		18			6		18		1001	1323		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5559	15.145	1000	9.465		3.000000	7		16			7		16		1001	1325		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1900	14.032	1000	11.225		3.000000	6		1			6		1		1001	1327		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.7647	18.317	1000	11.448		3.000000	8		11			8		11		1001	1328		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7986	18.940	1000	11.837		3.000000	4		16			4		16		1001	1333		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6714	13.360	1000	10.688		3.000000	6		16			6		16		1001	1335		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.5863	13.834	1000	11.067		3.000000	7		16			7		16		1001	1336		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5605	17.885	1000	11.178		3.000000	7		15			7		15		1001	1337		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.6265	16.847	1000	10.530		3.000000	8		5			8		5		1001	1339		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.2273	11.836	1000	9.469		3.000000	5		16			5		16		1001	1340		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5676	17.821	1000	11.138		3.000000	7		3			7		3		1001	1341		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1695	14.781	1000	11.825		3.000000	5		11			5		11		1001	1342		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8452	11.410	1000	9.128		3.000000	3		7			3		7		1001	1343		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.7257	17.767	1000	11.104		3.000000	6		15			6		15		1001	1344		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8559	15.104	1000	9.440		3.000000	3		2			3		2		1001	1345		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.8815	17.457	1000	10.910		3.000000	6		2			6		2		1001	1346		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2739	14.598	1000	9.124		3.000000	3		3			3		3		1001	1347		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8071	14.477	1000	9.048		3.000000	3		10			3		10		1001	1348		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4875	14.771	1000	9.232		3.000000	7		12			7		12		1001	1349		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4492	18.719	1000	11.700		3.000000	2		1			2		1		1001	1350		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.2252	13.935	1000	11.148		3.000000	6		1			6		1		1001	1352		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.4311	11.312	1000	9.050		3.000000	7		4			7		4		1001	1353		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2243	13.879	1000	11.103		3.000000	3		17			3		17		1001	1355		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.9636	11.844	1000	9.475		3.000000	6		13			6		13		1001	1356		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.7972	14.835	1000	9.272		3.000000	7		14			7		14		1001	1357		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8599	11.795	1000	9.436		3.000000	3		2			3		2		1001	1358		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0884	14.567	1000	9.104		3.000000	3		10			3		10		1001	1359		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.6103	14.715	1000	11.772		3.000000	3		9			3		9		1001	1361		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8181	13.565	1000	10.852		3.000000	3		18			3		18		1001	1363		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.1878	17.558	1000	10.974		3.000000	7		17			7		17		1001	1364		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.6332	14.792	1000	9.245		3.000000	6		16			6		16		1001	1365		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8349	15.797	1000	9.873		3.000000	3		4			3		4		1001	1366		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1108	12.310	1000	9.848		3.000000	6		1			6		1		1001	1367		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.8386	18.297	1000	11.435		3.000000	6		16			6		16		1001	1369		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.7951	13.366	1000	10.693		3.000000	8		3			8		3		1001	1370		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3100	13.269	1000	10.615		3.000000	7		6			7		6		1001	1372		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.4041	17.416	1000	10.885		3.000000	3		16			3		16		1001	1373		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.8560	17.449	1000	10.906		3.000000	6		10			6		10		1001	1377		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.6886	12.697	1000	10.157		3.000000	6		13			6		13		1001	1378		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.7193	16.692	1000	10.433		3.000000	4		12			4		12		1001	1379		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6161	12.801	1000	10.241		3.000000	6		15			6		15		1001	1380		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.6320	14.806	1000	11.845		3.000000	5		4			5		4		1001	1381		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.6335	12.612	1000	10.090		3.000000	4		14			4		14		1001	1382		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.1427	13.065	1000	10.452		3.000000	7		7			7		7		1001	1385		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0277	14.242	1000	11.393		3.000000	5		17			5		17		1001	1386		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.6645	17.533	1000	10.958		3.000000	3		7			3		7		1001	1388		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.4832	18.779	1000	11.737		3.000000	3		12			3		12		1001	1389		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.7431	17.153	1000	10.721		3.000000	5		1			5		1		1001	1390		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.5545	11.612	1000	9.290		3.000000	4		17			4		17		1001	1392		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.8823	18.749	1000	11.718		3.000000	6		12			6		12		1001	1393		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.4882	18.439	1000	11.524		3.000000	7		18			7		18		1001	1395		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.8990	18.518	1000	11.574		3.000000	8		8			8		8		1001	1397		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.6903	16.258	1000	10.161		3.000000	5		15			5		15		1001	1399		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9139	14.515	1000	9.072		3.000000	6		11			6		11		1001	1400		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.5159	13.387	1000	10.709		3.000000	7		2			7		2		1001	1401		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7380	14.654	1000	9.159		3.000000	3		3			3		3		1001	1402		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.2121	11.810	1000	9.448		3.000000	6		10			6		10		1001	1404		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4861	13.859	1000	11.088		3.000000	6		14			6		14		1001	1405		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2676	17.647	1000	11.030		3.000000	4		1			4		1		1001	1407		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.4722	12.499	1000	10.000		3.000000	8		10			8		10		1001	1408		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.3468	18.848	1000	11.780		3.000000	7		15			7		15		1001	1409		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2540	14.479	1000	11.583		3.000000	4		11			4		11		1001	1410		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.2862	15.918	1000	9.949		3.000000	7		19			7		19		1001	1411		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	112.8178	12.805	1000	10.244		3.000000	6		11			6		11		1001	1412		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3080	17.021	1000	10.638		3.000000	6		4			6		4		1001	1415		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.8584	14.362	1000	11.490		3.000000	2		6			2		6		1001	1417		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.3253	15.648	1000	9.780		3.000000	4		14			4		14		1001	1419		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.1719	14.644	1000	11.715		3.000000	3		11			3		11		1001	1421		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9782	13.582	1000	10.866		3.000000	7		8			7		8		1001	1422		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	114.4111	13.914	1000	11.131		3.000000	3		6			3		6		1001	1423		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4761	15.235	1000	9.522		3.000000	6		9			6		9		1001	1424		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	113.3990	15.389	1000	9.618		3.000000	2		16			2		16		1001	1427		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0688	14.236	1000	11.389		3.000000	6		15			6		15		1001	1428		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4003	17.517	1000	10.948		3.000000	3		15			3		15		1001	1429		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.0398	12.800	1000	10.240		3.000000	2		4			2		4		1001	1430		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4582	17.992	1000	11.245		3.000000	7		14			7		14		1001	1432		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8032	13.889	1000	11.111		3.222222	6		15			6		15		1001	1433		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.8784	11.432	1000	9.145		3.222222	4		19			4		19		1001	1435		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.3146	14.552	1000	9.095		3.222222	4		3			4		3		1001	1436		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.1548	13.389	1000	10.711		3.222222	3		8			3		8		1001	1438		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.9034	11.591	1000	9.273		3.222222	2		11			2		11		1001	1440		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.1180	16.026	1000	10.016		3.222222	2		5			2		5		1001	1441		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.3446	17.331	1000	10.832		3.222222	3		14			3		14		1001	1443		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.5389	14.899	1000	9.312		3.222222	3		2			3		2		1001	1444		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.3001	11.131	1000	8.905		3.222222	5		6			5		6		1001	1445		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.4930	17.583	1000	10.989		3.222222	5		10			5		10		1001	1446		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.8368	14.110	1000	8.819		3.222222	5		4			5		4		1001	1447		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.3002	13.707	1000	8.567		3.222222	6		6			6		6		1001	1448		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.1256	13.585	1000	10.868		3.222222	3		14			3		14		1001	1452		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.3834	17.138	1000	10.711		3.222222	4		8			4		8		1001	1455		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.7664	13.772	1000	11.018		3.222222	7		12			7		12		1001	1456		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.3113	14.224	1000	11.379		3.222222	2		19			2		19		1001	1457		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.7058	15.520	1000	9.700		3.222222	4		17			4		17		1001	1460		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8471	17.722	1000	11.076		3.222222	6		9			6		9		1001	1462		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.6372	18.538	1000	11.586		3.222222	6		11			6		11		1001	1464		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.7216	13.791	1000	11.033		3.222222	2		9			2		9		1001	1465		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.2689	13.198	1000	10.559		3.222222	4		15			4		15		1001	1466		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.9341	11.464	1000	9.171		3.222222	2		13			2		13		1001	1469		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.6872	14.390	1000	8.994		3.222222	4		19			4		19		1001	1470		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.6151	11.855	1000	9.484		3.222222	6		17			6		17		1001	1471		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.2564	12.922	1000	10.337		3.222222	3		7			3		7		1001	1472		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.5777	14.580	1000	9.112		3.222222	7		13			7		13		1001	1474		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.2364	14.159	1000	11.327		3.222222	8		18			8		18		1001	1477		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.2642	11.217	1000	8.973		3.222222	6		6			6		6		1001	1478		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	122.4802	16.838	1000	10.524		3.222222	7		18			7		18		1001	1479		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.4777	14.301	1000	8.938		3.222222	6		11			6		11		1001	1481		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.4765	11.715	1000	9.372		3.222222	4		6			4		6		1001	1482		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.5243	16.933	1000	10.583		3.222222	6		3			6		3		1001	1483		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.1404	13.822	1000	11.057		3.222222	3		18			3		18		1001	1484		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.0511	16.106	1000	10.067		3.222222	8		4			8		4		1001	1485		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.0600	17.522	1000	10.951		3.222222	5		14			5		14		1001	1486		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.4686	16.623	1000	10.389		3.222222	6		2			6		2		1001	1488		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8755	13.531	1000	10.825		3.222222	4		6			4		6		1001	1489		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.1038	12.505	1000	10.004		3.222222	3		8			3		8		1001	1491		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.3369	14.348	1000	8.968		3.222222	7		11			7		11		1001	1492		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.2307	11.075	1000	8.860		3.222222	6		18			6		18		1001	1493		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.9328	17.375	1000	10.859		3.222222	5		10			5		10		1001	1494		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.8935	17.288	1000	10.805		3.222222	2		4			2		4		1001	1496		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.9338	12.688	1000	10.150		3.222222	5		7			5		7		1001	1497		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.4385	11.307	1000	9.046		3.222222	4		5			4		5		1001	1498		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.0748	11.689	1000	9.351		3.222222	6		15			6		15		1001	1499		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.6340	16.906	1000	10.566		3.222222	3		7			3		7		1001	1500		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.4336	15.206	1000	9.504		3.222222	8		5			8		5		1001	1502		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.3321	12.186	1000	9.748		3.222222	6		1			6		1		1001	1505		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.0435	14.950	1000	9.344		3.222222	4		8			4		8		1001	1507		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.7486	13.147	1000	10.518		3.222222	3		8			3		8		1001	1513		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8038	16.978	1000	10.611		3.222222	5		15			5		15		1001	1514		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.0321	17.198	1000	10.749		3.222222	5		14			5		14		1001	1516		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.2008	11.015	1000	8.812		3.222222	4		13			4		13		1001	1518		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.7151	12.572	1000	10.057		3.222222	3		19			3		19		1001	1521		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8101	18.057	1000	11.286		3.222222	6		12			6		12		1001	1522		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.2819	15.076	1000	9.422		3.222222	2		17			2		17		1001	1525		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.1085	15.166	1000	9.479		3.222222	5		16			5		16		1001	1526		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.4881	14.580	1000	11.664		3.222222	7		12			7		12		1001	1527		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.0094	12.426	1000	9.941		3.222222	4		3			4		3		1001	1528		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.7150	14.362	1000	11.489		3.222222	5		16			5		16		1001	1529		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	121.0614	15.818	1000	9.886		3.222222	4		8			4		8		1001	1530		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.9591	11.105	1000	8.884		3.222222	3		6			3		6		1001	1531		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.0197	14.397	1000	11.517		3.222222	7		8			7		8		1001	1532		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	115.3939	13.851	1000	8.657		3.222222	6		1			6		1		1001	1533		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.2759	13.939	1000	11.152		3.222222	3		8			3		8		1001	1534		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.1881	14.964	1000	9.352		3.222222	6		16			6		16		1001	1536		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.6698	11.276	1000	9.021		3.222222	4		3			4		3		1001	1537		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.9752	11.111	1000	8.889		3.222222	6		19			6		19		1001	1539		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.8534	15.908	1000	9.942		3.222222	6		1			6		1		1001	1541		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.3492	14.008	1000	8.755		3.222222	5		2			5		2		1001	1542		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	118.2828	17.962	1000	11.226		3.222222	6		5			6		5		1001	1543		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	116.1792	17.973	1000	11.233		3.222222	3		2			3		2		1001	1548		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	117.2660	12.714	1000	10.171		3.222222	5		10			5		10		1001	1550		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	119.0576	12.223	1000	9.779		3.222222	4		5			4		5		1001	1551		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	123.9381	13.699	1000	8.562		3.888889	3		5			3		5		1001	1552		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.9806	12.652	1000	10.122		3.888889	5		2			5		2		1001	1553		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.3370	11.573	1000	9.259		3.888889	3		8			3		8		1001	1554		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.0188	9.144	1000	7.315		3.888889	4		14			4		14		1001	1555		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.3463	16.086	1000	10.054		3.888889	7		17			7		17		1001	1557		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	122.8861	11.913	1000	9.530		3.888889	3		12			3		12		1001	1560		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.0247	12.324	1000	9.859		3.888889	3		7			3		7		1001	1562		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	133.4495	12.616	1000	10.093		3.888889	4		2			4		2		1001	1563		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.2314	9.371	1000	7.497		3.888889	3		10			3		10		1001	1564		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.0191	9.402	1000	7.521		3.888889	6		8			6		8		1001	1566		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	123.0115	15.932	1000	9.957		3.888889	3		6			3		6		1001	1569		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.8098	9.408	1000	7.526		3.888889	4		13			4		13		1001	1570		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.3714	12.608	1000	7.880		3.888889	4		19			4		19		1001	1572		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.0107	10.934	1000	8.748		3.888889	4		3			4		3		1001	1573		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.7221	11.435	1000	7.147		3.888889	2		17			2		17		1001	1575		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.4824	13.189	1000	10.551		3.888889	3		7			3		7		1001	1576		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.3010	14.539	1000	9.087		3.888889	2		10			2		10		1001	1581		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.2259	14.358	1000	8.974		3.888889	5		16			5		16		1001	1582		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.6918	11.474	1000	7.171		3.888889	4		8			4		8		1001	1584		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.4455	12.201	1000	9.761		3.888889	4		19			4		19		1001	1585		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.6261	13.016	1000	10.413		3.888889	3		13			3		13		1001	1588		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.1362	15.351	1000	9.594		3.888889	2		15			2		15		1001	1589		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	131.9642	12.933	1000	10.346		3.888889	3		10			3		10		1001	1592		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.7767	11.821	1000	7.388		3.888889	6		16			6		16		1001	1593		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.1981	16.182	1000	10.114		3.888889	3		7			3		7		1001	1595		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.7180	12.793	1000	7.996		3.888889	6		7			6		7		1001	1597		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.2885	16.365	1000	10.228		3.888889	6		2			6		2		1001	1598		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.0702	10.259	1000	8.207		3.888889	7		10			7		10		1001	1599		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.5316	12.169	1000	7.606		3.888889	6		4			6		4		1001	1600		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.8305	12.880	1000	10.304		3.888889	6		15			6		15		1001	1601		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.4703	10.299	1000	8.240		3.888889	2		16			2		16		1001	1602		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	124.0527	12.542	1000	7.839		3.888889	5		10			5		10		1001	1603		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	129.0654	13.080	1000	10.464		3.888889	3		16			3		16		1001	1607		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	128.7890	9.256	1000	7.405		3.888889	4		7			4		7		1001	1608		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	126.1988	11.129	1000	8.903		3.888889	6		4			6		4		1001	1610		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.5412	10.673	1000	8.539		3.888889	5		1			5		1		1001	1611		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	123.5758	12.061	1000	9.649		3.888889	6		1			6		1		1001	1612		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	125.3638	13.195	1000	10.556		3.888889	5		14			5		14		1001	1614		1				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	127.7340	12.670	1000	10.136		3.888889	4		7			4		7		1001	1615		0				-1.0			5			20			0.0000		154.000		0.000		1
;			at			dur		tab		armonica	dinamica	ottava	registro	new_ottava	new_registro	pos		id_comp	nonlinearMode	movimento	ifn_attacco	env_sezione	sez_attacco	sez_durata	sez_leeway	 safety_buffer
i "Voce"	120.3958	16.174	1000	10.108		3.888889	4		4			4		4		1001	1616		1				-1.0			5			20			0.0000		154.000		0.000		1

; ---------------------

e
</CsScore>
</CsoundSynthesizer>
