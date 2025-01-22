<CsoundSynthesizer>
<CsOptions>
-o "output.wav"
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; Import UDOs
#include "udos/utils.udo"
#include "udos/pfield_amp.udo"
#include "udos/pfield_at.udo"
#include "udos/pfield_freq.udo"
#include "udos/frequency_intonation.udo"
#include "MACROS/first.udo"
#include "MACROS/costants.udo"

#include "orc/eventoSonoro.orc"


; UDO principale per gestire il comportamento
opcode GenComportamento, 0, iiiiiiii[]i[]i
    ; Input parameters
    iIdComp, iCAttacco, iDurataArmonica, iDurata, iAmpiezza, iOttava, iRegistro, iRitmi[], iPosizioni[], iTabNum xin
    
    ; Calcola gli attacchi (pfield2)
    iPfield2[] calcPfield2 iCAttacco, iDurataArmonica, iDurata, iRitmi
    iNumEventi = lenarray(iPfield2)
    
    ; Inizializza indice per i ritmi ciclici
    iRitmoIndex = 0
    iLenRitmi = lenarray(iRitmi)
    
    ; Per ogni evento sonoro
    iIndex = 0
    while iIndex < iNumEventi do
        ; Calcola il ritmo corrente
        iRitmoCorrente = iRitmi[iRitmoIndex % iLenRitmi]
        
        ; Calcola ampiezza con smorzamento fisso per ora
        iAmp = calcAmpiezza(iAmpiezza, iRitmoCorrente, -0.05)
        
        ; Calcola frequenza
        iFreq1 = calcFrequenza(iOttava, iRegistro, iRitmoCorrente)
        iFreq2 = iFreq1  ; Per ora uguale, poi si può modificare
        
        ; Calcola posizione
        iPosVal = iPosizioni[iIndex % lenarray(iPosizioni)]
        iPos = iRitmoCorrente * signum(iPosVal)
        
        ; Durata dell'evento (per ora fissa a 1)
        iDurEvento = iDurata
        
        ; Schedula l'evento sonoro
        schedule "eventoSonoro", iPfield2[iIndex], iDurEvento, iAmp, iFreq1, iPos, iRitmoCorrente, iFreq2, iTabNum
        
        ; Aggiorna indici
        iRitmoIndex += 1
        iIndex += 1
    od
endop


instr 1 
iRitmi[] tab2array gi_ritmi,0,  ftlen(gi_ritmi)-1
iPos[] tab2array gi_posizioni,0,  ftlen(gi_posizioni)-1

GenComportamento 1, 0, 25, 13, -25, 3, 4, iRitmi, iPos, 1

endin

</CsInstruments>
<CsScore>

f 1 0 [2^20] 10 1

i1 0 30

</CsScore>
</CsoundSynthesizer>