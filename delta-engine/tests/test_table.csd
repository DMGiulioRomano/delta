<CsoundSynthesizer>
<CsOptions>
-m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1

; Tabelle di test
giTable ftgen 1, 0, 50, -2, 0  ; Tabella con numero esplicito 1
giMyTable ftgen 0, 0, 50, -2, 0  ; Tabella con numero assegnato automaticamente

instr 1
    prints "\n=== TEST DI BASE PER FTGEN E tabw_i/TABLE ===\n"

    ; Scrivi un valore nella tabella 1 (numero esplicito)
    tabw_i 42, 10, 1
    
    ; Leggi e verifica il valore dalla tabella 1
    iVal1 table 10, 1
    prints "Tabella 1 (numero esplicito):\n"
    prints "  Valore all'indice 10: %.2f\n", iVal1
    
    ; Scrivi un valore nella tabella giMyTable
    tabw_i 123, 10, giMyTable
    
    ; Leggi e verifica il valore dalla tabella giMyTable
    iVal2 table 10, giMyTable
    prints "Tabella giMyTable (numero assegnato automaticamente):\n"
    prints "  Valore all'indice 10: %.2f\n", iVal2
    prints "  Numero di tabella assegnato: %d\n\n", giMyTable
    
    ; Stampa i primi valori della tabella giMyTable per debugging
    prints "Valori nella tabella giMyTable:\n"
    indx = 0
    while indx < 20 do
        iVal table indx, giMyTable
        if indx == 10 || iVal != 0 then
            prints "  Indice %2d: %.2f\n", indx, iVal
        endif
        indx += 1
    od
    
    ; VERIFICA CON TABLE DIRETTA
    iValDirect table 10, giMyTable
    prints "\nVerifica finale con table diretta:\n"
    prints "  giMyTable[10]: %.2f\n", iValDirect
    
    ftprint giMyTable, 1, 0, 20
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>