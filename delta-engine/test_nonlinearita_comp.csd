
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



; Tabelle per la comunicazione tra i due strumenti
gi_EvolvedRitmi ftgen 0, 0, 16384, -2, 0    ; ritmi evoluti
gi_LogisticState ftgen 0, 0, 8192, -7, 0, 8192, 1  ; stato della funzione logistica
gi_Evolution_Index init 0



instr ComportamentoEvolution
    ; Input parameters
    i_debug = p1
    i_CAttacco = p2
    i_Durata = p3
    i_RitmiTab = p4
    i_DurataArmonica = p5 
    i_Ampiezza = p6
    i_Ottava = p7
    i_Registro = p8
    i_PosTab = p9
    i_IdComp = p10

    ; Get ritmi usando offset e lunghezza
    i_LenRitmi tab_i i_IdComp, gi_len_ritmi
    i_Offset_Ritmi = 0
    i_Ritmi[] leggiTabArray i_Offset_Ritmi, i_LenRitmi, gi_val_ritmi
    i_Offset_Pos = 0       
    i_LenPos tab_i i_IdComp, gi_len_pos   
    i_Pos[] leggiTabArray i_Offset_Pos, i_LenPos, gi_val_pos

    if i_debug == 1 then
        prints "\nComportamentoEvolution %d\n", i_IdComp
        prints "Offset: %d, Len: %d\n", i_Offset_Ritmi, i_LenRitmi
        prints "Ritmi: \n"
        printarray i_Ritmi
    endif
    ; Parametri per evoluzione logistica
    ir = 3.7    ; parametro di controllo 
    kx init 0.5 ; stato iniziale
    
    ; Contatore per k-rate
    ktim init 0
    
    ; Loop a k-rate
    if ktim < i_Durata then
        ; Calcola nuovo stato logistico
        kx = ir * kx * (1 - kx)
        
        ; Indice corrente nel ciclo dei ritmi
        kidx = int(ktim / i_DurataArmonica) % i_LenRitmi
        
        ; Ritmo base
        kRitmoBase = i_Ritmi[kidx]
        
        ; Modifica non lineare del ritmo (mantiene valori interi)
        kRitmoMod = int(kRitmoBase * (1 + (kx - 0.5)))
        
        ; Salva il ritmo evoluto
        tabw kRitmoMod, gi_Evolution_Index, gi_EvolvedRitmi
        
        ; Incrementa contatori
        ktim += 1/kr
        gi_Evolution_Index += 1
    endif
endin


instr ComportamentoScheduler
    ; Input parameters (come prima)
    i_debug = p1
    i_CAttacco = p2
    i_Durata = p3
    i_RitmiTab = p4
    i_DurataArmonica = p5 
    i_Ampiezza = p6
    i_Ottava = p7
    i_Registro = p8
    i_PosTab = p9
    i_IdComp = p10

    ; Get arrays
    i_Ritmi[] leggiTabArray 0, ftlen(i_RitmiTab)-1, i_RitmiTab
    i_Posizioni[] leggiTabArray 0, ftlen(i_PosTab)-1, i_PosTab
    
    ; Calcola gli attacchi usando i ritmi evoluti
    i_Index = 0
    i_RitmoIndex = 0
    i_LenRitmi = lenarray(i_Ritmi)
    
    while i_Index < gi_Evolution_Index do
        ; Leggi il ritmo evoluto
        i_RitmoCorrente table i_Index, gi_EvolvedRitmi
        
        ; Calcoli come nel comportamento originale
        i_Amp = calcAmpiezza(i_Ampiezza, i_RitmoCorrente, -0.05)
        i_Freq1 = calcFrequenza(i_Ottava, i_Registro, i_RitmoCorrente, gi_Intonazione, $INTERVALLI, $REGISTRI)
        
        ; Il resto dei calcoli come prima
        i_Freq2 = i_Freq1
        i_PosVal = i_Posizioni[i_Index % lenarray(i_Posizioni)]
        i_Pos = i_RitmoCorrente * signum(i_PosVal)
        i_DurEvento = i_DurataArmonica/i_RitmoCorrente
        
        ; Schedule evento
        schedule "eventoSonoro", i_Pfield2[i_Index], i_DurEvento, i_Amp, i_Freq1, i_Pos, i_RitmoCorrente, i_Freq2, 2, gi_Index
        
        i_Index += 1
    od
endin



</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1
f 2 0 [2^10] 6 0 [2^9] 0.5 [2^9] 1
; Genera le frequenze pitagoriche

i "Comportamento" 0 30


</CsScore>
</CsoundSynthesizer>