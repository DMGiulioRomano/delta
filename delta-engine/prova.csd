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
;       normal debug
gi_debug init 2
; ---- 
;       verbose debug
;gi_debug init 2
; =============================

; Import MACROS
#include "MACROS/first.udo"
#include "MACROS/costants.udo"

; Import UDOs
#include "udos/utils.udo"
#include "udos/GenPythagFreqs.udo"
; - inside COMPORTAMENTO
#include "udos/pfield_amp.udo"
#include "udos/pfield_at.udo"
#include "udos/pfield_freq.udo"
; -
#include "orc/letMeLook.orc"
#include "udos/validator.udo"
#include "orc/eventoSonoro.orc"
#include "orc/Comportamento.orc"


instr GeneraComportamenti
    i_tmp_attacco = 
    idur = 1 ; momentary 
    i_debug = gi_debug
    i_which_comp init 0

    while i_which_comp < idur do ; momentary
    ; Lettura dei ritmi e posizioni che divengono array.
        i_LenRitmi tab_i i_which_comp, gi_comp_RITMO_LEN
        gi_temp_ritmi ftgen 0, 0, i_LenRitmi, -2, 0
        tableicopy gi_temp_ritmi, gi_comp_RITMO_VAL
    ; Lettura delle posizioni che divengono array.
        i_LenPos tab_i i_which_comp, gi_comp_POS_LEN
        gi_temp_pos ftgen 0, 0, i_LenPos, -2, 0
        tableicopy gi_temp_pos, gi_comp_POSIZIONE
    ; Lettura degli altri parametri 
        i_Attacco tab_i i_which_comp, gi_comp_ATTACCO
        i_Durata tab_i i_which_comp, gi_comp_DURATA
        i_DurArm tab_i i_which_comp, gi_comp_DURARMONICA
        i_Amp tab_i i_which_comp, gi_comp_AMPIEZZA
        i_temp_ritmi = gi_temp_ritmi
        i_temp_pos = gi_temp_pos
    ; Checking for parameter validation
        i_Val_Res = Validator(i_temp_pos, i_temp_ritmi, i_Durata, i_DurArm, i_Oct, i_Reg, i_Amp, i_which_comp)
        schedule "Comportamento", i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp, i_Oct, i_Reg, gi_temp_pos, i_which_comp
    ; --- DEBUG STAGE ---
        if i_debug == 1 || i_debug == 2 then
            prints "\n\n\n============================================================\n"
            prints "\n\t\t\t||Comportamento numero %d||\n", i_which_comp
            prints "\n\t------------------------------------------------------------\n\n"
            prints "\t\t---|gi_temp_ritmi|-----\n"
            ftprint gi_temp_ritmi, 1, 0, i_LenRitmi
            prints "\n\t------------------------------------------------------------\n\n"
            prints "\t\t---|gi_temp_pos|-----\n\n"
            ftprint gi_temp_pos, 1, 0, i_LenPos
            prints "\n\t------------------------------------------------------------\n"
            prints "\t\t---|lettura condizioni iniziali|-----"
            prints "\n\tat: %f\n\tdur: %f\n\tdurArm: %f\n\tamp: %f\n\tOct: %d\n\tReg: %d\n\n\n", i_Attacco, i_Durata, i_DurArm, i_Amp, i_Oct, i_Reg
        endif
    ; Contatore comportamenti
        i_which_comp+=1
    od
endin

instr Generatore
    i_debug = gi_debug
    iRes init 0
    iRes GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if iRes == 1 then
        ; Lettura dei ritmi e posizioni che divengono array.
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
        schedule "GeneraComportamenti", 0, 1, i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp,  i_Oct, i_Reg, gi_temp_pos
    else
        prints "\nGenPythagFreqs failed: %d\n", iRes
    endif

    if i_debug == 1 || i_debug == 2 then
      ;schedule "letMeLook", 30, 1
      prints "\nGenPythagFreqs: Success!\n"
      ftprint gi_Intonazione
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