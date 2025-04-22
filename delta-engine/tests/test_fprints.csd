<CsoundSynthesizer>
<CsOptions>
-odac
-d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Directory di test
gS_test_dir = "./test_output"

; Test di base per scrittura file
instr TestBasicFileWrite
    prints "\n=== TEST DI SCRITTURA FILE DI BASE ===\n"
    
    ; Crea la directory di test
    iRes system_i 1, sprintf("mkdir -p %s", gS_test_dir)
    prints "Directory creata: %s\n risultato %d\n", gS_test_dir, iRes

    ; Test 1: Scrivere un file semplice
    SOutputFile = sprintf("%s/test_simple.txt", gS_test_dir)
    prints "Tentativo di scrittura su: %s\n", SOutputFile

    ; Scrivi contenuto di base
    fprints SOutputFile, "Questo è un test\n"
    
    ; Verifica se il file esiste
    iExists system_i 1, sprintf("test -f %s && echo 1 || echo 0", SOutputFile)
    prints "File esiste? %d\n", iExists
    
    ; Test 2: Prova con percorso assoluto
    iCurrentDir system_i 1, "pwd"

    SAbsPath sprintf("%s/%s/test_absolute.txt", strsub(SCurrentDir, 0, strlen(SCurrentDir)-1), gS_test_dir)
    prints "Tentativo di scrittura con percorso assoluto: %s\n", SAbsPath
    
    ; Scrivi contenuto
    fprints SAbsPath, "Test con percorso assoluto\n"
    
    ; Verifica
    iExists2 system_i 1, sprintf("test -f %s && echo 1 || echo 0", SAbsPath)
    prints "File con percorso assoluto esiste? %d\n", iExists2
    
    ; Test 3: Usa system_i per creare un file
    SSystemFile = sprintf("%s/test_system.txt", gS_test_dir)
    iRes3 system_i 1, sprintf("echo 'File creato con system_i' > %s", SSystemFile)
    
    ; Verifica
    iExists3 system_i 1, sprintf("test -f %s && echo 1 || echo 0", SSystemFile)
    prints "File creato con system_i esiste? %d\n", iExists3
    
    ; Test 4: Verifica permessi directory
    iIsWritable system_i 1, sprintf("test -w %s && echo 1 || echo 0", gS_test_dir)
    prints "La directory è scrivibile? %d\n", iIsWritable
    
    prints "=== FINE TEST DI BASE ===\n"*/
endin
</CsInstruments>
<CsScore>
; Esegui il test di base
i "TestBasicFileWrite" 0 0.1
f 0 2
</CsScore>
</CsoundSynthesizer>