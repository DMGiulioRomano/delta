<CsoundSynthesizer>
<CsOptions>
; Output su file per analisi offline
-o delta_eventoSonoro_test.wav
; Opzioni per prestazioni ottimali
-d -m0
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 16
nchnls = 2
0dbfs = 1

; Definizioni delle macro necessarie
#define SQRT2 #1.4142135623730951# ; sqrt(2) per normalizzazione
#define MAX_AMP #0.999# ; Ampiezza massima per prevenire clipping
#define M_PI #3.14159265359# ; Pi

; Variabili globali necessarie
gi_debug init 3 ; Abilita debug di livello moderato per verificare comportamenti

; Crea tabella per l'oscillatore principale
gi_sine ftgen 1, 0, 16384, 10, 1                        ; Sinusoide standard

; Crea tabelle per la posizione
gi_pos_sine ftgen 10, 0, 8192, 10, 1                    ; Sinusoide
gi_pos_cos ftgen 11, 0, 8192, 11, 1                     ; Coseno
gi_pos_square ftgen 12, 0, 8192, 7, 1, 4096, 1, 0, -1, 4096, -1 ; Onda quadra
gi_pos_saw ftgen 13, 0, 8192, 7, 0, 8192, 1             ; Rampa
gi_pos_random ftgen 14, 0, 8192, 21, 1                  ; Random distribuito
gi_pos_triangle ftgen 15, 0, 8192, 7, 0, 2048, 1, 4096, -1, 2048, 0 ; Triangolare

; Tabella per la registrazione dei timestamp degli eventi attivi
gi_active_events ftgen 0, 0, 50000, -2, 0   ; Timestamp di inizio degli eventi attivi
gi_active_events_count init 0               ; Contatore per gli eventi attivi

; Strumento per generare molti eventi con parametri casuali
instr GenerateRandomEvents
    iNumEvents = p4
    iStartTime = p5
    iTimeSpan = p6
    iMaxOverlap = p7
    
    ; Array per tracciare quanti eventi iniziano in ogni istante
    iEventCounts[] init 1000
    
    ; Ciclo per generare eventi
    iEvent = 0
    while iEvent < iNumEvents do
        ; Calcola parametri casuali
        iOverlapLimit = (iMaxOverlap <= 0) ? iNumEvents : iMaxOverlap
        
        ; Distribuisci gli eventi nel tempo specificato
        if (iTimeSpan > 0) then
            ; Distribuzione uniforme o concentrata (cluster)
            if (random:i(0, 1) < 0.2) then
                ; Crea un cluster di eventi concentrati
                iClusterCenter = random:i(0, iTimeSpan)
                iStart = iStartTime + iClusterCenter + random:i(-0.5, 0.5)
            else
                ; Distribuzione uniforme
                iStart = iStartTime + random:i(0, iTimeSpan)
            endif
        else
            ; Tutti gli eventi iniziano allo stesso momento (stress massimo)
            iStart = iStartTime
        endif
        
        ; Quantizza il tempo a slot di 1/10 di secondo per conteggio sovrapposizioni
        iTimeSlot = int((iStart - iStartTime) * 10)
        if (iTimeSlot >= 0 && iTimeSlot < 1000) then
            iEventCounts[iTimeSlot] = iEventCounts[iTimeSlot] + 1
            
            ; Se troppi eventi nello stesso slot, sposta l'evento
            if (iEventCounts[iTimeSlot] > iOverlapLimit && iTimeSpan > 0) then
                iStart = iStartTime + random:i(0, iTimeSpan)
                iTimeSlot = int((iStart - iStartTime) * 10)
                iEventCounts[iTimeSlot] = iEventCounts[iTimeSlot] + 1
            endif
        endif
        
        ; Durata con distribuzione esponenziale - più probabili durate brevi
        iDur = 0.1 + int(random:i(0, 10)) * 0.2
        
        ; Random logarithmico per l'ampiezza - test più completo della dinamica
        iAmpExp = random:i(-40, 0)
        iAmp = iAmpExp
        
        ; Frequenza - distribuzione logaritmica per coprire meglio lo spettro udibile
        iOctave = random:i(3, 10)  ; da ~27Hz a ~14kHz
        iFreq1 = 27.5 * pow(2, random:i(0, iOctave))
        
        ; Due strategie per freq2: vicina o lontana da freq1
        if (random:i(0, 1) < 0.5) then
            ; Frequenza vicina: piccola variazione
            iFreq2 = iFreq1 * random:i(0.9, 1.1)
        else
            ; Frequenza lontana: grande salto
            iFreq2 = iFreq1 * pow(2, random:i(-2, 2))
        endif
        
        ; Spatial parameters con distribuzione sbilanciata per testare meglio i casi limite
        iWhichZero = int(random:i(0, 10))
        if (random:i(0, 1) < 0.2) then
            iWhichZero = 0  ; Test più frequente del caso di bordo 0
        endif
        
        iDirection = (random:i(0, 1) < 0.3) ? -1 : 1  ; 30% negativi
        
        ; Harmonic ratio - test specifico per valori critici
        iHRType = int(random:i(0, 10))
        if (iHRType < 3) then
            iHR = random:i(0.5, 1.0)  ; Test dei valori molto bassi (30%)
        elseif (iHRType < 8) then
            iHR = random:i(2, 10)     ; Valori normali (50%)
        else
            iHR = random:i(20, 50)    ; Valori alti (20%)
        endif

        ; Tabella di funzione - test distribuito tra forme d'onda
        iFn = int(random:i(10, 16))
        
        ; Schedula evento sonoro
        event_i "i", "eventoSonoro", iStart, iDur, iAmp, 
                iFreq1, iWhichZero * iDirection, iHR, iFreq2, iFn, iEvent+1000, 999
        
        iEvent += 1
    od
    
    ; Stampa statistiche sulla generazione
    prints "\nGenerated %d random events\n", iNumEvents
    prints "Start time: %.1f, Time span: %.1f\n", iStartTime, iTimeSpan
    
    ; Stampa gli slot temporali con più eventi simultanei
    iMaxSlot = 0
    iMaxCount = 0
    iSlot = 0
    while (iSlot < 1000) do
        if (iEventCounts[iSlot] > iMaxCount) then
            iMaxCount = iEventCounts[iSlot]
            iMaxSlot = iSlot
        endif
        iSlot += 1
    od
    
    prints "Maximum event density: %d events at time %.1f\n", 
           iMaxCount, iStartTime + (iMaxSlot / 10.0)
endin

;==================================================================
; Strumento eventoSonoro da testare
;==================================================================
instr eventoSonoro
    id_evento=p10
    id_comportamento=p11
    i_debug=gi_debug
    
    ; Registra l'inizio dell'evento per il monitoraggio
    iEventIndex = gi_active_events_count
    gi_active_events_count += 1
    if (iEventIndex < 50000) then
        tabw_i p2, iEventIndex, gi_active_events
    endif
    
    ;--------------------------------------------------------------
    ; Parameter Initialization and Validation
    ;--------------------------------------------------------------
    ; Amplitude conversion and limiting
    iamp = ampdbfs(p4)
    iamp = limit(iamp, -$MAX_AMP, $MAX_AMP)
    
    ; Frequency parameters
    ifreq1 = limit(p5, 20, sr/2)     ; Starting frequency with bounds
    ifreq2 = limit(p8, 20, sr/2)     ; Ending frequency with bounds
    
    ; Spatial parameters
    iwhichZero = abs(p6)
    idirection = (p6>=0 ? 1 : -1);signum(p6)
    
    ; Harmonic and temporal parameters
    iHR = max(1, abs(p7))            ; Prevent zero or negative HR
    iPeriod = $M_PI*2/iHR           ; Full period calculation
    
    ; Initial radius calculation with safety check
    iradi = (iwhichZero > 0 ? (iwhichZero-1) * iPeriod : 0)
    ifn = p9
    
    ; Debug output
    if (i_debug >= 3) then
        prints "eventoSonoro[%d] - start:%.2f dur:%.2f amp:%.2f freq:%.2f→%.2f whichZero:%d dir:%d HR:%.2f\n",
               id_evento, p2, p3, p4, ifreq1, ifreq2, iwhichZero, idirection, iHR
    endif
    
    ;--------------------------------------------------------------
    ; Position and Envelope Generation
    ;--------------------------------------------------------------
    ; Position from table lookup
    kndx line 0, p3, 1               ; Normalized time index
    ktab table kndx, ifn, 1           ; Table lookup for position
    
    ; Spatial angle calculation
    krad = iradi + (ktab * iPeriod * idirection)
    
    ; Envelope generation
    kEnv = abs(sin(krad*iHR/2))     ; Basic envelope shape
    
    ;--------------------------------------------------------------
    ; Sound Generation and Spatialization
    ;--------------------------------------------------------------
    ; Frequency interpolation
    kfreq line ifreq1, p3, ifreq2
    
    ; Main oscillator
    as poscil3 iamp, kfreq, 1  ; Usa tabella 1 (sinusoide)
    asEnv = as * kEnv
    ; Spatial encoding
    kMid = cos(krad)
    kSide = sin(krad)
    
    ; Apply spatialization
    aMid = kMid * asEnv 
    aSide = kSide * asEnv
    
    ;--------------------------------------------------------------
    ; Output Stage
    ;--------------------------------------------------------------
    ; Convert to L-R with normalization
    aL = (aMid + aSide) / $SQRT2
    aR = (aMid - aSide) / $SQRT2
    
    outs aL, aR
endin

; Strumento di controllo per monitorare la CPU e gli eventi attivi
instr Monitor
    
    ; Calcola il numero di eventi attivi attraverso l'opcode active
    kActive active "eventoSonoro"
    
    ; Stampa solo ogni 0.5 secondi per ridurre l'output
    kTimer metro 2
    if (kTimer == 1) then
        printks "Time: %.1f s - Active eventoSonoro: %d\n", 0, times:k(), kActive
    endif
    
    ; Visualizzazione avanzamento test come percentuale
    kProgress = times:k() / p3 * 100
    kPct init 0
    if (kProgress % 10 < 0.05) then
        kPct += int(kProgress / 10) * 10
        if (kPct < 100) then
            printks ">>> TEST PROGRESS: %d%%\n", 0.1, kPct
        endif
    endif
endin

; Semplice strumento per riprodurre marker di riferimento
instr MarkerTone
    iFreq = p4
    iAmp = ampdbfs(p5)
    
    aOut vco2 iAmp, iFreq
    aOut *= linen:a(1, 0.01, p3, 0.01)
    
    outs aOut, aOut
    
    prints "\n=== TEST MARKER %d - TIME: %.1f ===\n", int(p4), p2
endin

; Strumento per verificare la robustezza con valori estremi
instr ExtremeTester
    iTotalTests = 10
    
    prints "\n[EXTREME VALUES TEST at %.1fs]\n", times:i()
    
    iTest = 0
    while (iTest < iTotalTests) do
        ; Genera tempi di inizio progressivi
        iStart = times:i() + (iTest * 0.2)
        
        ; Casi di test estremi
        if (iTest == 0) then
            ; Test 1: Frequenza ai limiti dell'udibile
            iFreq1 = 20
            iFreq2 = 20000
            iAmp = -6
            iWZ = 1
            iHR = 4
            prints "  Test %d: Frequency sweep %dHz to %dHz\n", iTest+1, iFreq1, iFreq2
        elseif (iTest == 1) then
            ; Test 2: Ampiezza estremamente bassa
            iFreq1 = 1000
            iFreq2 = 1000
            iAmp = -80
            iWZ = 0
            iHR = 5
            prints "  Test %d: Very low amplitude %ddB\n", iTest+1, iAmp
        elseif (iTest == 2) then
            ; Test 3: HR estremamente alto
            iFreq1 = 440
            iFreq2 = 440
            iAmp = -12
            iWZ = 2
            iHR = 100
            prints "  Test %d: Extremely high HR=%d\n", iTest+1, iHR
        elseif (iTest == 3) then
            ; Test 4: WhichZero molto grande
            iFreq1 = 220
            iFreq2 = 220
            iAmp = -12
            iWZ = 50
            iHR = 3
            prints "  Test %d: Very high whichZero=%d\n", iTest+1, iWZ
        elseif (iTest == 4) then
            ; Test 5: Durata estremamente breve
            iFreq1 = 880
            iFreq2 = 880
            iAmp = -12
            iWZ = 1
            iHR = 5
            prints "  Test %d: Extremely short duration 0.001s\n", iTest+1
            event_i "i", "eventoSonoro", iStart, 0.001, iAmp, 
                    iFreq1, iWZ, iHR, iFreq2, 10, 2000+iTest, 998
            igoto next_test
        elseif (iTest == 5) then
            ; Test 6: HR negativo (dovrebbe essere convertito in positivo)
            iFreq1 = 660
            iFreq2 = 660
            iAmp = -12
            iWZ = 1
            iHR = -3
            prints "  Test %d: Negative HR=%d\n", iTest+1, iHR
        elseif (iTest == 6) then
            ; Test 7: Direction negativa con whichZero grande
            iFreq1 = 440
            iFreq2 = 440
            iAmp = -12
            iWZ = -10
            iHR = 2
            prints "  Test %d: Negative direction with large whichZero=%d\n", iTest+1, iWZ
        elseif (iTest == 7) then
            ; Test 8: Frequenza ai limiti dello spettro (subsonica)
            iFreq1 = 8
            iFreq2 = 8
            iAmp = 0
            iWZ = 0
            iHR = 1
            prints "  Test %d: Subsonic frequency %dHz\n", iTest+1, iFreq1
        elseif (iTest == 8) then
            ; Test 9: Frequenza ai limiti dello spettro (supersonica)
            iFreq1 = 25000
            iFreq2 = 25000
            iAmp = 0
            iWZ = 0
            iHR = 1
            prints "  Test %d: Ultrasonic frequency %dHz\n", iTest+1, iFreq1
        else
            ; Test 10: Ampiezza oltre il limite
            iFreq1 = 440
            iFreq2 = 440
            iAmp = 10  ; 10dB oltre 0dbfs
            iWZ = 0
            iHR = 1
            prints "  Test %d: Amplitude beyond limit %ddB\n", iTest+1, iAmp
        endif
        
        ; Schedula l'evento con parametri estremi (standard 1s)
        event_i "i", "eventoSonoro", iStart, 1, iAmp, 
                iFreq1, iWZ, iHR, iFreq2, 10, 2000+iTest, 998
        
        next_test:
        iTest += 1
    od
endin

; Strumento per ramp-test parametrico
instr ParametricRampTester
    iParam = p4  ; 1=freq, 2=HR, 3=whichZero
    iStart = times:i()
    
    prints "\n[PARAMETRIC RAMP TEST at %.1fs - Param: %d]\n", iStart, iParam
    
    ; Valori di base
    iFreq1 = 440
    iFreq2 = 440
    iAmp = -12
    iWZ = 1
    iHR = 4
    
    ; Genera 20 eventi in rampa per il parametro scelto
    iNumSteps = 20
    iStep = 0
    while (iStep < iNumSteps) do
        if (iParam == 1) then
            ; Rampa di frequenza (esponenziale)
            iFreq1 = 55 * pow(2, iStep / 3)  ; Da 55Hz a ~7kHz
            iFreq2 = iFreq1
            prints "  Step %d: Frequency %.1fHz\n", iStep+1, iFreq1
        elseif (iParam == 2) then
            ; Rampa di HR (lineare ma con incrementi più grandi ad HR alti)
            iHR = 1 + (iStep * iStep / 20)  ; Da 1 a ~21
            prints "  Step %d: HR %.1f\n", iStep+1, iHR
        else
            ; Rampa di whichZero (esponenziale)
            iWZ = iStep == 0 ? 0 : pow(2, iStep/4 - 1)  ; Da 0 a ~16
            prints "  Step %d: whichZero %.1f\n", iStep+1, iWZ
        endif
        
        ; Schedula l'evento con step di 0.15s
        event_i "i", "eventoSonoro", iStart + (iStep * 0.15), 1, iAmp, 
                iFreq1, iWZ, iHR, iFreq2, 10, 3000+iStep, 997
        
        iStep += 1
    od
endin

; Strumento per test surround virtuale
instr SurroundTest
    prints "\n[SURROUND VIRTUALIZATION TEST at %.1fs]\n", times:k()
    
    ; Crea 8 eventi posizionati tutto intorno all'ascoltatore
    iBaseDur = 2
    iBaseTime = times:i()
    iFreq = 440
    iAmp = -12
    iHR = 4
    
    ; 8 posizioni
    iPosIdx = 0
    while (iPosIdx < 8) do
        ; Calcola angolo in radianti (da 0 a 2π)
        iAngle = iPosIdx * (2 * $M_PI / 8)
        
        ; Converti in coordinate whichZero e direction
        if (iPosIdx == 0) then
            ; Centro destra
            iWZ = 0
            iDir = 1
        elseif (iPosIdx == 4) then
            ; Centro sinistra
            iWZ = 0
            iDir = -1
        else
            ; Altre posizioni
            iWZ = 1 + (iPosIdx % 4)
            iDir = (iPosIdx < 4) ? 1 : -1
        endif
        
        ; Chiaro segnale della posizione (piccola variazione di frequenza)
        iFreqVar = iFreq * (1 + (iPosIdx * 0.05))
        
        ; Nome della posizione per debug
        SPosition = ""
        if (iPosIdx == 0) then
            SPosition = "Right"
        elseif (iPosIdx == 1) then
            SPosition = "Front-Right"
        elseif (iPosIdx == 2) then
            SPosition = "Front"
        elseif (iPosIdx == 3) then
            SPosition = "Front-Left"
        elseif (iPosIdx == 4) then
            SPosition = "Left"
        elseif (iPosIdx == 5) then
            SPosition = "Rear-Left"
        elseif (iPosIdx == 6) then
            SPosition = "Rear"
        else
            SPosition = "Rear-Right"
        endif
        
        prints "  Position %d: %s (whichZero=%d, direction=%d)\n", 
               iPosIdx+1, SPosition, iWZ, iDir
        
        ; Schedula l'evento
        event_i "i", "eventoSonoro", iBaseTime + (iPosIdx * 0.3), iBaseDur, iAmp, 
                iFreqVar, iWZ * iDir, iHR, iFreqVar, 10, 4000+iPosIdx, 996
        
        iPosIdx += 1
    od
endin

; Strumento per test di oscillatore "glissato"
instr GlissandoTest
    prints "\n[GLISSANDO TEST at %.1fs]\n", times()
    
    ; Test di glissandi con diversi fattori di intervallo
    iIntervals[] fillarray 2, 1.5, 1.33333, 1.25, 3, 4  ; ottava, quinta, quarta, terza, dodicesima, doppia ottava
    SIntervalNames[] fillarray "octave", "fifth", "fourth", "major third", "twelfth", "double octave"
    
    iBaseFreq = 220
    iBaseDur = 1.5
    iBaseTime = times:i()
    iAmp = -12
    iHR = 4
    iWZ = 1
    
    ; Genera un glissando per ogni intervallo
    iIdx = 0
    while (iIdx < lenarray(iIntervals)) do
        iInterval = iIntervals[iIdx]
        iFreq1 = iBaseFreq
        iFreq2 = iBaseFreq * iInterval
        
        ; Alterna direzione
        if (iIdx % 2 == 1) then
            iTemp = iFreq1
            iFreq1 = iFreq2
            iFreq2 = iTemp
        endif
        
        prints "  Glissando %d: %s (%.1fHz → %.1fHz)\n", 
               iIdx+1, SIntervalNames[iIdx], iFreq1, iFreq2
        
        ; Schedula l'evento
        event_i "i", "eventoSonoro", iBaseTime + (iIdx * 2), iBaseDur, iAmp, 
                iFreq1, iWZ, iHR, iFreq2, 10, 5000+iIdx, 995
        
        iIdx += 1
    od
endin

; Strumento per test parallelo di tutti i tipi di tabella
instr TableFormTest
    prints "\n[TABLE FORM TEST at %.1fs]\n", times:k()
    
    STableNames[] fillarray "sine", "cosine", "square", "saw", "random", "triangle"
    iTableNums[] fillarray 10, 11, 12, 13, 14, 15
    
    iBaseFreq = 330
    iBaseDur = 4
    iBaseTime = times:i()
    iAmp = -12
    iHR = 4
    iWZ = 2
    
    ; Genera un evento per ciascuna forma d'onda
    iIdx = 0
    while (iIdx < lenarray(iTableNums)) do
        iTableNum = iTableNums[iIdx]
        
        prints "  Table %d: %s\n", iIdx+1, STableNames[iIdx]
        
        ; Schedula l'evento
        event_i "i", "eventoSonoro", iBaseTime, iBaseDur, iAmp, 
                iBaseFreq, iWZ, iHR, iBaseFreq, iTableNum, 6000+iIdx, 994
        
        iIdx += 1
    od
endin
</CsInstruments>
<CsScore>
; Durata totale del test
f 0 60

; Avvia il monitor per tutta la durata del test
i "Monitor" 0 60

; ========================================================
; TEST 1: Eventi Base - comportamento standard
; ========================================================
; i "eventoSonoro" start dur amp freq1 whichZero HR freq2 ifn id_evento id_comp
i "MarkerTone" 0 0.2 100 -12
i "eventoSonoro" 0.5 2 -12 440 0 4 880 10 1 1
i "eventoSonoro" 3 2 -12 660 1 3 330 10 2 1
i "eventoSonoro" 5.5 2 -12 880 2 2 220 10 3 1

; ========================================================
; TEST 2: Sovrapposizione - eventi simultanei con diverse durate
; ========================================================
i "MarkerTone" 8 0.2 200 -12
i "eventoSonoro" 8.5 0.5 -24 100 0 1 110 10 4 2
i "eventoSonoro" 8.5 1.0 -24 200 1 2 220 10 5 2
i "eventoSonoro" 8.5 1.5 -24 300 2 3 330 10 6 2
i "eventoSonoro" 8.5 2.0 -24 400 0 4 440 10 7 2
i "eventoSonoro" 8.5 2.5 -24 500 1 5 550 10 8 2
i "eventoSonoro" 8.5 3.0 -24 600 2 6 660 10 9 2
i "eventoSonoro" 8.5 3.5 -24 700 0 7 770 10 10 2
i "eventoSonoro" 8.5 4.0 -24 800 1 8 880 10 11 2
i "eventoSonoro" 8.5 4.5 -24 900 2 9 990 10 12 2
i "eventoSonoro" 8.5 5.0 -24 1000 0 10 1100 10 13 2

; ========================================================
; TEST 3: Valori Estremi - Test dei limiti parametrici
; ========================================================
i "MarkerTone" 13 0.2 300 -12
i "ExtremeTester" 13.5 5 0

; ========================================================
; TEST 4: Test Rampa di Frequenza
; ========================================================
i "MarkerTone" 18 0.2 400 -12
i "ParametricRampTester" 18.5 5 1

; ========================================================
; TEST 5: Test Rampa di Harmonic Ratio
; ========================================================
i "MarkerTone" 23 0.2 500 -12
i "ParametricRampTester" 23.5 5 2

; ========================================================
; TEST 6: Test Rampa di WhichZero
; ========================================================
i "MarkerTone" 28 0.2 600 -12
i "ParametricRampTester" 28.5 5 3

; ========================================================
; TEST 7: Test di Spazializzazione
; ========================================================
i "MarkerTone" 33 0.2 700 -12
i "SurroundTest" 33.5 5 0

; ========================================================
; TEST 8: Test di Glissando
; ========================================================
i "MarkerTone" 38 0.2 800 -12
i "GlissandoTest" 38.5 5 0

; ========================================================
; TEST 9: Test Forme d'Onda
; ========================================================
i "MarkerTone" 43 0.2 900 -12
i "TableFormTest" 43.5 5 0

; ========================================================
; TEST 10: STRESS TEST - molti eventi in rapida successione
; ========================================================
i "MarkerTone" 48 0.2 1000 -12
; Genera 300 eventi in 3 secondi, max 30 sovrapposizioni
i "GenerateRandomEvents" 48.5 5 300 49 3 30

; ========================================================
; TEST 11: CARICO ESTREMO - 100 eventi simultanei
; ========================================================
i "MarkerTone" 53 0.2 1100 -12
; Genera 100 eventi che iniziano esattamente allo stesso tempo
i "GenerateRandomEvents" 53.5 5 100 54 0 0
</CsScore>
</CsoundSynthesizer>