<CsoundSynthesizer>
<CsOptions>
 -d
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1



; Costanti globali
gi_memory_resolution = 1          ; Risoluzione in secondi
gi_memory_size = 100              ; Dimensione delle tabelle di memoria

; Tabelle per la memoria compositiva
gi_memory_overlap ftgen 1, 0, gi_memory_size+1, -2, 0       ; Eventi sovrapposti
gi_memory_harmonic_density ftgen 2, 0, gi_memory_size+1, -2, 0  ; Densità armonica
gi_memory_octave_spread ftgen 3, 0, gi_memory_size+1, -2, 0     ; Dispersione ottave
gi_memory_spectral_centroid ftgen 4, 0, gi_memory_size+1, -2, 0 ; Centroide spettrale
gi_memory_spatial_movement ftgen 5, 0, gi_memory_size+1, -2, 0  ; Movimento spaziale

; Tabella per registrare eventi generati (per visualizzazione)
gi_event_start_times ftgen 10, 0, 1000, -2, 0    ; Tempi di inizio degli eventi
gi_event_durations ftgen 11, 0, 1000, -2, 0      ; Durate degli eventi
gi_event_count init 0                           ; Contatore degli eventi generati

; Simula la funzione di calcolo della durata dell'evento come nel Comportamento.orc
opcode calculateEventDuration, i, iii
    iDurataArmonica, iRitmoCorrente, iOverlapFactor xin
    
    ; Applica la formula presente nel Comportamento.orc
    iDurEvento = (iDurataArmonica/iRitmoCorrente) * iOverlapFactor
    
    xout iDurEvento
endop

#include "../udos/calcDurationFactor.udo"

; Strumento per configurare scenari di test
instr ConfigScenario
    iScenario = p4   ; Parametro: numero dello scenario di test
    
    ; Reset delle tabelle
    indx = 0
    while indx < gi_memory_size do
        tabw 0, indx, 1  ; Usa indice 1 esplicito
        indx += 1
    od
    
    ; Reset del contatore di eventi
    gi_event_count = 0
    
    if iScenario == 1 then
        ; SCENARIO 1: Densità bassa e costante (3-10 eventi)
        prints "\n=== SCENARIO 1: Densità bassa e costante (3-10 eventi) ===\n"
        indx = 10
        while indx < 40 do
            iVal = random(3, 10)
            tabw iVal, indx, 1  ; Usa indice 1 esplicito
            indx += 1
        od
    elseif iScenario == 2 then
        ; SCENARIO 2: Densità media (10-20 eventi)
        prints "\n=== SCENARIO 2: Densità media (10-20 eventi) ===\n"
        indx = 10
        while indx < 40 do
            iVal = random(10, 20)
            tabw iVal, indx, 1  ; Usa indice 1 esplicito
            indx += 1
        od
    elseif iScenario == 3 then
        ; SCENARIO 3: Densità alta (20-30 eventi)
        prints "\n=== SCENARIO 3: Densità alta (20-30 eventi) ===\n"
        indx = 10
        while indx < 40 do
            iVal = random(20, 30)
            tabw iVal, indx, 1  ; Usa indice 1 esplicito
            indx += 1
        od
    elseif iScenario == 4 then
        ; SCENARIO 4: Crescendo (densità crescente)
        prints "\n=== SCENARIO 4: Crescendo (densità crescente) ===\n"
        indx = 10
        while indx < 40 do
            iVal = 3 + (indx - 10) * 0.9  ; Cresce linearmente da 3 a ~30
            tabw iVal, indx, 1  ; Usa indice 1 esplicito
            indx += 1
        od
    elseif iScenario == 5 then
        ; SCENARIO 5: Decrescendo (densità decrescente)
        prints "\n=== SCENARIO 5: Decrescendo (densità decrescente) ===\n"
        indx = 10
        while indx < 40 do
            iVal = 30 - (indx - 10) * 0.9  ; Decresce linearmente da 30 a ~3
            tabw iVal, indx, 1  ; Usa indice 1 esplicito
            indx += 1
        od
    endif
    
    ; Attiva il test
    event_i "i", "TestDurationFactor", 0, 0.1, iScenario
endin

; Strumento per testare suggestDurationFactor e simulare la generazione di eventi
instr TestDurationFactor
    iScenario = p4
    
    ; Parametri standard per un comportamento
    iDurataArmonica = 10       ; Durata armonica del comportamento
    iStartTime = 35            ; Tempo corrente simulato
    iLookbackTime = 5          ; Inizio della finestra di analisi
    
    ; Debug: verifica valori nella tabella
    prints "\nVerifica valori tabella (primi 5 valori):\n"
    iDbg = 10
    while iDbg < 15 do
        iVal tablei iDbg, 1
        prints "Indice %d: %.2f\n", iDbg, iVal
        iDbg += 1
    od
    
    ; Parametri per generazione di eventi
    iSequenceLength = 20       ; Quanti eventi generare
    iBaseTime = 5              ; Tempo di inizio della sequenza (ridotto per visualizzare gli eventi)

    ; Stampa analisi generale della memoria
    iAvgOverlap, iMaxOverlap, iDensity, iCount = analyzeCompositionMemory(iLookbackTime, iStartTime)
    
    prints "\nMemoria compositiva (eventi sovrapposti):\n"
    prints "Tempo    Valore\n"
    prints "--------------\n"
    indx = 5
    while indx < 40 do
        iVal tablei indx, 1  ; Usa tablei e indice 1 esplicito
        if iVal > 0 then
            prints "%d sec    %.2f\n", indx, iVal
        endif
        indx += 1
    od
    
    prints "\nAnalisi del range temporale %d-%d sec:\n", iLookbackTime, iStartTime
    prints "  Media sovrapposizione: %.2f eventi\n", iAvgOverlap
    prints "  Max sovrapposizione: %.2f eventi\n", iMaxOverlap
    prints "  Densità temporale: %.2f%%\n", iDensity * 100
    prints "  Campioni analizzati: %d\n", iCount
    
    ; Test con ritmi diversi
    iRhythms[] fillarray 3, 8, 15, 25, 40
    iNumRhythms = lenarray(iRhythms)
    
    prints "\nSimulazione generazione eventi con ritmi diversi:\n"
    prints "Ritmo    Fattore    Durata Evento    Note\n"
    prints "--------------------------------------------\n"
    
    ; Per ogni ritmo, genera una sequenza di eventi
    iRhythmIdx = 0
    while iRhythmIdx < iNumRhythms do
        iRhythm = iRhythms[iRhythmIdx]
        
        ; Calcola il fattore suggerito
        iFactor = suggestDurationFactor(iLookbackTime, iStartTime, iRhythm)
        
        ; Calcola la durata risultante dell'evento
        iDurEvento = calculateEventDuration(iDurataArmonica, iRhythm, iFactor)
        
        ; Durata base (senza fattore)
        iBaseDur = iDurataArmonica / iRhythm
        
        ; Impatto sulla sovrapposizione
        iPeriod = iDurataArmonica / iRhythm   ; Periodo tra gli eventi
        iBaseOverlap = iBaseDur / iPeriod      ; Sovrapposizione con durata base
        iActualOverlap = iDurEvento / iPeriod  ; Sovrapposizione con durata adattata
        
        prints "%-8d %-10.3f %-15.3f ", iRhythm, iFactor, iDurEvento
        
        ; Mostra l'effetto sulla sovrapposizione
        if iFactor > 1.0 then
            prints "Durata aumentata (%.2fx), sovrapposizione da %.1f a %.1f eventi\n", 
                   iFactor, iBaseOverlap, iActualOverlap
        else
            prints "Durata standard, mantiene sovrapposizione di %.1f eventi\n", 
                   iActualOverlap
        endif
        
        ; Genera una sequenza di eventi simulata
        iTimeIdx = 0
        iTime = iBaseTime
        
        ; Simula una sequenza di attacchi con intervalli basati su ritmo e durata armonica
        while iTimeIdx < iSequenceLength do
            ; Memorizza l'evento generato
            tabw iTime, gi_event_count, gi_event_start_times
            tabw iDurEvento, gi_event_count, gi_event_durations
            
            ; Incrementa contatore
            gi_event_count += 1
            
            ; Passa al prossimo timestamp
            iTime += iPeriod
            iTimeIdx += 1
        od
        
        iRhythmIdx += 1
    od
    
    ; Visualizza gli eventi generati in forma grafica
    prints "\nRappresentazione grafica degli eventi (primi 10 sec):\n"
    prints "Tempo: 0         1         2         3         4         5         6         7         8         9        10\n"
    prints "      |---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|-->\n"
    
    ; Per ogni ritmo, visualizza gli eventi
    iRhythmIdx = 0
    while iRhythmIdx < iNumRhythms do
        iRhythm = iRhythms[iRhythmIdx]
        iStartOffset = iRhythmIdx * iSequenceLength
        
        prints "R=%-2d: ", iRhythm
        
        ; Stampa una rappresentazione grafica degli eventi
        iScale = 10.0  ; 10 secondi di visualizzazione
        iGraphWidth = 100  ; Larghezza del grafico in caratteri (include l'inizio "R=XX: ")
        
        ; Per ogni punto nel grafico
        iCharIdx = 0
        while iCharIdx < iGraphWidth - 6 do
            ; Converti indice carattere in tempo
            iTimePoint = (iCharIdx / (iGraphWidth - 6)) * iScale + iBaseTime
            
            ; Verifica se in questo punto c'è un evento attivo
            iHasActiveEvent = 0
            iEventIdx = iStartOffset
            iEndIdx = iStartOffset + iSequenceLength
            while iEventIdx < iEndIdx && iEventIdx < gi_event_count do
                iEventStart = tablei(iEventIdx, 10)  ; Usa indici espliciti (10, 11)
                iEventDur = tablei(iEventIdx, 11)
                iEventEnd = iEventStart + iEventDur
                
                if iTimePoint >= iEventStart && iTimePoint < iEventEnd then
                    iHasActiveEvent = 1
                    igoto found_event
                endif
                
                iEventIdx += 1
            od
            found_event:
            
            ; Stampa un carattere appropriato
            if iHasActiveEvent == 1 then
                prints "#"
            else
                prints " "
            endif
            
            iCharIdx += 1
        od
        
        prints "\n"
        iRhythmIdx += 1
    od
    
    prints "\nLegenda: # = evento attivo, spazio = silenzio\n"
    prints "===============================================\n\n"
    
    ; Se non è l'ultimo scenario, avvia il prossimo
    if iScenario < 5 then
        event_i "i", "ConfigScenario", 0.1, 0.1, iScenario + 1
    endif
endin

</CsInstruments>
<CsScore>
; Avvia il primo scenario
i "ConfigScenario" 0 3 1
e
</CsScore>
</CsoundSynthesizer>