<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
;----------------------------------------
; Impostazioni globali
;----------------------------------------
sr     = 96000
ksmps  = 1
nchnls = 2
0dbfs  = 1

;----------------------------------------
; Creazione “tabelle sporche” con GEN02
;----------------------------------------
; GEN02: trasferisce dati dai p-fields in una function table 
gi_active_octaves            ftgen 0, 0, 8,  -2, 60,62,64,65,67,69,71,72
gi_active_registers          ftgen 0, 0, 4,  -2,  1,  2,  3,  4
gi_octave_register_matrix    ftgen 0, 0, 32, -2,  1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4

;----------------------------------------
; Strumento: pulisce le tabelle a k-rate
;----------------------------------------
; dichiariamo un UDO con 6 parametri k‑rate:
;   kfn, ktrig, kstart, kend, kstep, knumcols

instr TestKrate
    ; bang a k-rate 10 Hz
    kTrig metro p3*2                         ; metro genera un bang (0→1→0) a k-rate 
    kCurrentTime times                     ; tempo assoluto in secondi a k-rate 
    kcountHowManyIfkTrig init 0 
    ; array di numeri di tabella, k-rate
    iArr[] = fillarray(gi_active_octaves, gi_active_registers, gi_octave_register_matrix)  

    prints "\n===========================================\n"
    prints "\tlet's observe the tables at init-pass\n\n"
    prints "gi_active_octaves\n"
    ftprint gi_active_octaves
    prints "\n"
    prints "gi_active_registers\n"
    ftprint gi_active_registers
    prints "\n"
    prints "gi_octave_register_matrix\n"
    ftprint gi_octave_register_matrix
    prints "\n===========================================\n"
    prints "\tnow let's going on with the if k-rate!\n\n"
    kLenArr = lenarray(iArr)               ; conta quanti elementi (tabelle) 
    kcountHowManyIfkTrig += kTrig
    if kTrig == 1 then                     ; al primo campione di ciascun bang
        println "inside if n° %d\n",kcountHowManyIfkTrig
        kBigIdx = 0                          ; reset contatore esterno
    LoopBig:
        kfn      = iArr[kBigIdx]             ; numero di tabella corrente
        println "\tPRINTSK bigLoop at k-cycle: %d and a-cycle: %d at abs time: %f", kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
        printks "\t\t*PRINTKS bigLoop at k-cycle: %d and a-cycle: %d at abs time: %f)\n\n",0, kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
        kLenTab  = tableng(kfn)              ; lunghezza di quella tabella a k-rate 
        kIdx     = 0                         ; reset contatore interno
        LoopClear:
            println "\t\t%d. PRINTSK LoopClear at k-cycle: %d and a-cycle: %d at abs time: %f", kIdx,kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
            printks "\t\t\t*PRINTKS LoopClear at k-cycle: %d and a-cycle: %d at abs time: %f\n \t\t\t*[[questo print si ripete un sola volta ogni if k-rate]]\n", 0,kCurrentTime*kr, kCurrentTime*sr, kCurrentTime
            println "\n\t\t\t- before cleaning\n\t\t\t\tkIdx: %d, value: %d, kfn: %d\n", kIdx, tablekt(kIdx,kfn), kfn
            tablewkt 0, kIdx, kfn                ; scrive zero nella tabella kfn 
            println "\t\t\t- after cleaning\n\t\t\t\tkIdx: %d, value: %d, kfn: %d\n", kIdx, tablekt(kIdx,kfn), kfn
        loop_lt  kIdx, 1, kLenTab, LoopClear ; ripeti finché kIdx<kLenTab
    loop_lt  kBigIdx, 1, kLenArr, LoopBig ; passa alla prossima tabella
    println "finish if\n\n"  
    endif
endin

</CsInstruments>

<CsScore>
; esegui lo strumento per 3 secondi
i "TestKrate" 0 1
e
</CsScore>
</CsoundSynthesizer>
