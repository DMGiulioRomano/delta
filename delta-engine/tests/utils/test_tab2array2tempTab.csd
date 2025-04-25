<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; -------------------------------------------------
; Import UDOs
#include "udos/utils.udo"
#include "udos/frequency_intonation.udo"

; --- MACRO DELLO SPAZIO ---
#define FONDAMENTALE    #32#      
#define OTTAVE          #10#      
#define INTERVALLI      #200#      
#define REGISTRI        #200#      
#define TABELLAF        #1000#      
giIntonazione ftgen 0, 0, 2001, -2, 0
; --- COMPORTAMENTO INIZIALE ---
;ritmi
gi_val_ritmi    ftgen 0, 0, 10000, -2, 3, 4, 5, 7, 9
gi_len_ritmi    ftgen 0, 0, 10000, -2, 3, 1, 1
;posizioni
gi_val_pos      ftgen 0, 0, 10000, -2, 2, 3, 4, 5, 8
gi_len_pos      ftgen 0, 0, 10000, -2, 3, 1, 1
;altri parametri
gi_val_at       ftgen 0, 0, 10000, -2, 0, 2,3
gi_val_dur      ftgen 0, 0, 10000, -2, 13.0,1,2
gi_val_durArm   ftgen 0, 0, 10000, -2, 26,3,4
gi_val_amp      ftgen 0, 0, 10000, -2, -12,-1,-2
; questo ha sempre due parametri per volta: ottava, registro
gi_val_freq     ftgen 0, 0, 10000, -2, 3, 4, 5,6,7,8
gi_len_freq     ftgen 0, 0, 10000, -2, 2,2,2
; -------------------------------------------------


;#include "udos/comportamento.udo"

instr Frequencies
  ; parameters --> iFund, iNumIntervals, iNumOctaves, iTblNum 
  GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, giIntonazione
  ;prints "\n\ntest freq %d\n\n\n" , table:i(0, 1000)
endin

instr GeneraComportamenti
    idebug = p4
    i_which_comp = 0
    imax_comportamenti = 3
    iLenPos init 0
    iLenRitmi init 0
    iLenFreq init 0
    iOffset_Ritmi = 0
    iOffset_Pos = 0
    iOffset_Freq = 0
    while i_which_comp < imax_comportamenti do
    if idebug == 1 then
        prints "\n\n\n============================================================\n"
        prints "\n\t\t\t||Comportamento numero %d||\n", i_which_comp
    endif
    ; Lettura dei ritmi e posizioni che divengono array.
        iOffset_Ritmi += iLenRitmi          
        iLenRitmi tab_i i_which_comp, gi_len_ritmi   
        iRitmi[] leggiTabArray iOffset_Ritmi, iLenRitmi, gi_val_ritmi
        gi_temp_ritmi ftgen 0, 0, 100, -2, 0
        copya2ftab iRitmi, gi_temp_ritmi
        if idebug == 1 then
            prints "\n----------------------------------------------------\n"
            prints "\t\t\t|gi_temp_ritmi|\n\n"
            ftprint gi_temp_ritmi, 1, 0, iLenRitmi
            prints "\n\niritmi\n"
            printarray iRitmi
            prints "\n\n\n"
        endif

        iOffset_Pos += iLenPos          
        iLenPos tab_i i_which_comp, gi_len_pos   
        iPos[] leggiTabArray iOffset_Pos, iLenPos, gi_val_pos
        gi_temp_pos ftgen 0, 0, 100, -2, 0
        copya2ftab iPos, gi_temp_pos
        if idebug == 1 then
            prints "\n----------------------------------------------------\n"
            prints "\t\t\t|gi_temp_pos|\n\n"
            ftprint gi_temp_pos, 1, 0, iLenPos
            prints "\n\niPos\n"
            printarray iPos
            prints "\n\n\n"
        endif

    ; Lettura degli altri parametri 
        iAttacco tab_i i_which_comp, gi_val_at
        iDurata tab_i i_which_comp, gi_val_dur
        iDurArm tab_i i_which_comp, gi_val_durArm
        iAmp tab_i i_which_comp, gi_val_amp
        if idebug == 1 then
            prints "\n----------------------------------------------------\n"
            prints "\nat: %f\ndur: %f\ndurArm: %f\namp: %f\n", iAttacco, iDurata, iDurArm, iAmp
            prints "\n\n\n"
        endif
        iOffset_Freq += iLenFreq          
        iLenFreq tab_i i_which_comp, gi_len_freq
        iFreqs[] leggiTabArray iOffset_Freq, iLenFreq, gi_val_freq
        if idebug == 1 then
            prints "\n----------------------------------------------------\n"
            prints "\n\niFreqs\n\n"
            printarray iFreqs
            prints "\n\n\n"
        endif
        iValFreq tab_i i_which_comp, gi_len_freq



        i_which_comp+=1
    od
endin

</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1
f 2 0 [2^10] 6 0 [2^9] 0.5 [2^9] 1
; Genera le frequenze pitagoriche

i "GeneraComportamenti" 0 .1 1


</CsScore>
</CsoundSynthesizer>