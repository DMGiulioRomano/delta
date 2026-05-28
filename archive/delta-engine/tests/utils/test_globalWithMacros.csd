<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


#define FONDAMENTALE    #32#      ; Frequenza fondamentale in Hz
#define OTTAVE          #10#      ; Numero di ottave generate
#define INTERVALLI      #200#     ; Divisioni per ottava
#define REGISTRI        #10#      ; Numero di registri disponibili
gi_PythagSysSize init $OTTAVE*$INTERVALLI+1

instr 1
print gi_PythagSysSize
endin

</CsInstruments>
<CsScore>
; Avvia lo strumento che esegue tutti i test
i 1 0 1
e
</CsScore>
</CsoundSynthesizer>