; =============================================================================
; debug_log.orc
; Sistema di log avanzato per Delta-Engine
; =============================================================================

; Variabili globali per la gestione dei log
gi_log_enabled init 1      ; 1 = log abilitati, 0 = disabilitati
gS_log_folder init "z-logs/" ; Cartella per i file di log
gi_log_file_open init 0    ; Flag per indicare se un file di log è aperto
gS_log_current_file init "" ; Nome del file di log corrente
gi_log_current_comp init -1 ; ID del comportamento corrente

; Strumento per creare la cartella dei log all'avvio
instr LogSystemInit
    ; Crea directory per i log se non esiste
    Svar sprintf "mkdir -p %s", gS_log_folder
    iRes system_i 1, Svar, 0
    if iRes == 0 then
        prints "Sistema di log inizializzato: directory %s creata con successo\n", gS_log_folder
    else
        prints "ATTENZIONE: impossibile creare la directory %s per i log\n", gS_log_folder
    endif
    turnoff
endin

; Opcode per chiudere il file di log corrente
opcode closeBehaviorLog,0,0

    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        igoto end
    endif
    idate date
    Sdate dates idate
    ; Aggiungi marker di fine log
    fprints gS_log_current_file, "\n=== FINE SESSIONE DI LOG: %s \n", Sdate
    ; Resetta le variabili di stato
    gi_log_file_open = 0
    gi_log_current_comp = -1
    gS_log_current_file = ""
    ; Log di debug
    if gi_debug >= 2 then
        prints "File di log chiuso\n"
    endif
    
    end:
    i_up=0
endop

; Opcode per aprire un file di log per un comportamento
opcode openBehaviorLog, 0, i
    iCompId xin
    
    ; Controlla se i log sono disabilitati
    if gi_log_enabled == 0 then
        igoto end
    endif
    
    ; Evita di aprire lo stesso file più volte
    if gi_log_current_comp == iCompId then
        igoto end
    endif
    
    ; Chiudi il file precedente se necessario
    if gi_log_file_open == 1 then
        closeBehaviorLog
    endif
    
    ; Crea il nome del file di log
    gS_log_current_file sprintf "%scomportamento%d.log", gS_log_folder, iCompId
    ; Apri il file in modalità APPEND (aggiungi al file esistente)
    idate date
    Sdate dates idate
    fprints gS_log_current_file, "\n\n=== INIZIO SESSIONE DI LOG: %s ===\n\n", Sdate

    gi_log_file_open = 1
    gi_log_current_comp = iCompId
    
    ; Log di debug
    if gi_debug >= 1 then
        prints "File di log aperto: %s\n", gS_log_current_file
    endif
    
    end:
endop

; Versione i-rate di logMessage con valore numerico
opcode logMessagei, 0, Si
    SMessage, iValue xin
    
    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        igoto end
    endif
    
    ; Ottieni il timestamp
    itime times
    
    ; Scrivi il messaggio con timestamp e valore
    fprints gS_log_current_file, "[%.3f] %s: %d\n", itime, SMessage, iValue
    
    end:
endop

; Opcode per scrivere parametri di un comportamento nel log
opcode logBehaviorParams, 0, iiiiiiii
    iCompId, iAt, iDur, iDurArm, iAmp, iOct, iReg, iRhythmTable xin
    
    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        igoto end
    endif
    
    ; Ottieni il timestamp
    itime times
    
    ; Log dei parametri principali
    fprints gS_log_current_file, "\n[%.3f] === PARAMETRI COMPORTAMENTO %d ===\n", itime, iCompId
    fprints gS_log_current_file, "Attacco: %.2f\n", iAt
    fprints gS_log_current_file, "Durata: %.2f\n", iDur
    fprints gS_log_current_file, "Durata Armonica: %.2f\n", iDurArm
    fprints gS_log_current_file, "Ampiezza: %.2f dB\n", iAmp
    fprints gS_log_current_file, "Ottava: %d\n", iOct
    fprints gS_log_current_file, "Registro: %d\n", iReg
    
    ; Log dei valori ritmici
    iNumRhythms = ftlen(iRhythmTable)
    fprints gS_log_current_file, "\nValori Ritmici (%d):\n", iNumRhythms
    
    iIdx = 0
    while iIdx < iNumRhythms do
        iRhythm tab_i iIdx, iRhythmTable
        fprints gS_log_current_file, "  [%d]: %d\n", iIdx, iRhythm
        iIdx += 1
    od
    
    fprints gS_log_current_file, "\n==================================\n\n"
    
    end:
endop

; Opcode per scrivere parametri di un evento nel log
opcode logEventParams, i, iiiiiiii
    iEventId, iCompId, iStart, iDur, iAmp, iFreq1, iFreq2, iPos xin
    iRes = 0
    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        gS_log_current_file sprintf "%scomportamento%d.log", gS_log_folder, iCompId
    endif
    
    ; Ottieni il timestamp
    itime times
    ; Log dei parametri dell'evento
    fprints gS_log_current_file, "[%.3f] --- EVENTO %d (Comp: %d) ---\n", itime, iEventId, iCompId
    fprints gS_log_current_file, "  Attacco: %.3f\n", iStart
    fprints gS_log_current_file, "  Durata: %.3f\n", iDur
    fprints gS_log_current_file, "  Ampiezza: %.2f dB\n", iAmp
    fprints gS_log_current_file, "  Frequenza1: %.2f Hz\n", iFreq1
    fprints gS_log_current_file, "  Frequenza2: %.2f Hz\n", iFreq2
    fprints gS_log_current_file, "  Posizione: %d\n", iPos
    fprints gS_log_current_file, "  ------------------------\n"
    iRes = 1
    xout iRes
endop

; Opcode per scrivere una tabella nel log
opcode logTable, 0, iSi
    iTable, SName, iMaxEntries xin
    
    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        igoto end
    endif
    
    ; Ottieni il timestamp
    itime times
    
    ; Determina il numero di elementi da scrivere
    iLen = ftlen(iTable)
    iEntries = (iMaxEntries > 0 && iMaxEntries < iLen) ? iMaxEntries : iLen
    
    ; Log dell'intestazione della tabella
    fprints gS_log_current_file, "\n[%.3f] === TABELLA %s (lunghezza: %d) ===\n", itime, SName, iLen
    
    ; Log dei valori della tabella
    iIdx = 0
    while iIdx < iEntries do
        iValue tab_i iIdx, iTable
        fprints gS_log_current_file, "  [%d]: %.6f\n", iIdx, iValue
        iIdx += 1
    od
    
    ; Se abbiamo limitato gli elementi, indica quanti ne sono stati omessi
    if iEntries < iLen then
        fprints gS_log_current_file, "  ... (%d elementi omessi)\n", iLen - iEntries
    endif
    
    fprints gS_log_current_file, "==================================\n\n"
    
    end:
endop

; Opcode per scrivere un array nel log
opcode logArray, 0, i[]Si
    iArray[], SName, iMaxEntries xin
    
    ; Controlla se i log sono disabilitati o se non c'è un file aperto
    if gi_log_enabled == 0 || gi_log_file_open == 0 then
        igoto end
    endif
    
    ; Ottieni il timestamp
    itime times
    
    ; Determina il numero di elementi da scrivere
    iLen = lenarray(iArray)
    iEntries = (iMaxEntries > 0 && iMaxEntries < iLen) ? iMaxEntries : iLen
    
    ; Log dell'intestazione dell'array
    fprints gS_log_current_file, "\n[%.3f] === ARRAY %s (lunghezza: %d) ===\n", itime, SName, iLen
    
    ; Log dei valori dell'array
    iIdx = 0
    while iIdx < iEntries do
        fprints gS_log_current_file, "  [%d]: %.6f\n", iIdx, iArray[iIdx]
        iIdx += 1
    od
    
    ; Se abbiamo limitato gli elementi, indica quanti ne sono stati omessi
    if iEntries < iLen then
        fprints gS_log_current_file, "  ... (%d elementi omessi)\n", iLen - iEntries
    endif
    
    fprints gS_log_current_file, "==================================\n\n"
    
    end:
endop
