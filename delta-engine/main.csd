<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; =============================
;           DEBUG
; ----
;       no debug
;gi_debug init -1
; ----
;       normal debug
gi_debug init 1
; ---- 
;       verbose debug
;gi_debug init 2
;       comportamento (& pythagoric system) verbose debug 
;gi_debug init 3
;       evento verbose debug
;gi_debug init 4

; =============================

; Import MACROS
#include "MACROS/first.orc"
#include "MACROS/debug.orc"

; Import UDOs
#include "udos/utils.udo"
#include "udos/GenPythagFreqs.udo"
; - inside COMPORTAMENTO
#include "udos/pfield_amp.udo"
#include "udos/pfield_at.udo"
#include "udos/pfield_freq.udo"
; -
#include "udos/validator.udo"
#include "orc/eventoSonoro.orc"
#include "orc/Comportamento.orc"
#include "orc/GeneraComportamenti.orc"


instr Generatore
    i_debug = gi_debug
    i_Res init 0
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 1 then
        prints "\nGenPythagFreqs: Success!\n\n"
    ; Lettura dei ritmi che divengono array.
        i_LenRitmi tab_i 0, gi_comp_RITMO_LEN
        gi_temp_ritmi ftgen 0, 0, i_LenRitmi, -2, 0
        tableicopy gi_temp_ritmi, gi_comp_RITMO_VAL
    ; Lettura delle posizioni che divengono array.
        i_LenPos tab_i 0, gi_comp_POS_LEN
        gi_temp_pos ftgen 0, 0, i_LenPos, -2, 0
        tableicopy gi_temp_pos, gi_comp_POSIZIONE
    ; Lettura degli altri parametri 
        i_Attacco tab_i 0, gi_comp_ATTACCO
        i_Durata tab_i 0, gi_comp_DURATA
        i_DurArm tab_i 0, gi_comp_DURARMONICA
        i_Amp tab_i 0, gi_comp_AMPIEZZA
        i_Oct tab_i 0, gi_comp_OTTAVA
        i_Reg tab_i 0, gi_comp_REGISTRO
        $DEBUG_Generatore
        schedule "GeneraComportamenti", 0, p3, i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp,  i_Oct, i_Reg, gi_temp_pos
    else
        prints "\nGenPythagFreqs failed: %d\n", i_Res
    endif

endin

</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1
f 2 0 [2^10] 6 0 [2^9] 0.5 [2^9] 1
; Genera le frequenze pitagoriche

i "Generatore" 0 480


</CsScore>
</CsoundSynthesizer>