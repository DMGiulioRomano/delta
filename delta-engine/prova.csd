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
gi_debug init 0
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
    i_max_comportamenti = 1
    i_debug = gi_debug

    i_which_comp init 0
    i_LenPos init 0
    i_LenRitmi init 0
    i_LenFreq init 0
    i_Offset_Ritmi = 0
    i_Offset_Pos = 0
    i_Offset_Freq = 0
    while i_which_comp < i_max_comportamenti do
    
        if i_debug == 1 || i_debug == 2 then
            prints "\n\n\n============================================================\n"
            prints "\n\t\t\t||Comportamento numero %d||\n", i_which_comp
        endif
    ; Lettura dei ritmi e posizioni che divengono array.
        i_Offset_Ritmi += i_LenRitmi          
        i_LenRitmi tab_i i_which_comp, gi_len_ritmi   
        i_Ritmi[] leggiTabArray i_Offset_Ritmi, i_LenRitmi, gi_val_ritmi
        gi_temp_ritmi ftgen 0, 0, lenarray(i_Ritmi)+1, -2, 0
        copya2ftab i_Ritmi, gi_temp_ritmi
        if i_debug == 1 || i_debug == 2 then
            prints "\n----------------------------------------------------\n"
            prints "\t\t\t|gi_temp_ritmi|\n\n"
            ftprint gi_temp_ritmi, 1, 0, i_LenRitmi
            prints "\n\niritmi\n"
            printarray i_Ritmi
            prints "\n\n\n"
        endif

        i_Offset_Pos += i_LenPos          
        i_LenPos tab_i i_which_comp, gi_len_pos   
        i_Pos[] leggiTabArray i_Offset_Pos, i_LenPos, gi_val_pos
        gi_temp_pos ftgen 0, 0, lenarray(i_Pos)+1, -2, 0
        copya2ftab i_Pos, gi_temp_pos
        if i_debug == 1 || i_debug == 2 then
            prints "\n----------------------------------------------------\n"
            prints "\t\t\t|gi_temp_pos|\n\n"
            ftprint gi_temp_pos, 1, 0, i_LenPos
            prints "\n\niPos\n"
            printarray i_Pos
            prints "\n\n\n"
        endif

    ; Lettura degli altri parametri 
        i_Attacco tab_i i_which_comp, gi_val_at
        i_Durata tab_i i_which_comp, gi_val_dur
        i_DurArm tab_i i_which_comp, gi_val_durArm
        i_Amp tab_i i_which_comp, gi_val_amp
        if i_debug == 1 || i_debug == 2 then
            prints "\n----------------------------------------------------\n"
            prints "\nat: %f\ndur: %f\ndurArm: %f\namp: %f\n", i_Attacco, i_Durata, i_DurArm, i_Amp
            prints "\n\n\n"
        endif
        i_Offset_Freq += i_LenFreq          
        i_LenFreq tab_i i_which_comp, gi_len_freq
        i_Freqs[] leggiTabArray i_Offset_Freq, i_LenFreq, gi_val_freq
        if i_debug == 1 || i_debug == 2 then
            prints "\n----------------------------------------------------\n"
            prints "\n\niFreqs\n\n"
            printarray i_Freqs
            prints "\n\n\n"
        endif
        i_Oct = i_Freqs[0]
        i_Reg = i_Freqs[1]
    ;
    ;   fin qui per raccogliere i dati dalle tabelle e passarli al comportamento.
    ;   
    ;
        i_Val_Res = Validator(i_Ritmi, i_Pos, i_Durata, i_DurArm, i_Oct, i_Reg, i_Amp)
        i_which_comp+=1
        schedule "Comportamento", i_Attacco, i_Durata, gi_temp_ritmi, i_DurArm, i_Amp, i_Oct, i_Reg, gi_temp_pos, i_which_comp
    od
endin

instr Generatore
    i_debug = 1
    iRes init 0
    iRes GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if iRes == 1 then
        schedule "GeneraComportamenti", 0, 1
    else
        prints "\nGenPythagFreqs failed: %d\n", iRes
    endif

    if i_debug == 1 then
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