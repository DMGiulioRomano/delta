<CsoundSynthesizer>
<CsOptions>
; Impostazioni per output di testo e disabilitazione dell'audio
-m0d -n
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; -----------------------------------------------------------------------
; VARIABILI GLOBALI NECESSARIE PER IL TEST
; -----------------------------------------------------------------------

; Stati di densità globali
gi_tc_source_density init 0
gi_tc_target_density init 0

; Intervalli di comportamento
gi_tc_min_behavior_interval init 3
gi_tc_max_behavior_interval init 10

; -----------------------------------------------------------------------
; IMPLEMENTAZIONE DI OPCODE NECESSARI
; -----------------------------------------------------------------------

; Implementazione semplificata di interpolateParameter per il test
opcode interpolateParameter, i, iiii
    iSourceValue, iTargetValue, iProgress, iCurve xin
    
    ; Applica la curva di transizione se specificata (default è lineare)
    iMappedProgress = iProgress
    if (iCurve != 0) then
        ; Curva positiva = inizio lento, fine veloce (ease-in)
        ; Curva negativa = inizio veloce, fine lenta (ease-out)
        if (iCurve > 0) then
            iMappedProgress = pow(iProgress, 1 + iCurve)
        else
            iMappedProgress = 1 - pow(1 - iProgress, 1 - iCurve)
        endif
    endif
    
    ; Esegui l'interpolazione
    iResult = iSourceValue + (iTargetValue - iSourceValue) * iMappedProgress
    
    xout iResult
endop

; Implementazione dell'UDO da testare
opcode interpolateBehaviorTiming, i, i
    iProgress xin    
    ; Interpola il valore di densità al progresso corrente
    iCurrentDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    
    ; Mappa stato di densità alla tempistica dei comportamenti
    ; Densità più alta = comportamenti più frequenti
    iMinInterval = gi_tc_min_behavior_interval
    iMaxInterval = gi_tc_max_behavior_interval
    
    ; Mappatura esponenziale dalla densità (0-2) all'intervallo
    iDensityNormalized = limit(iCurrentDensity / 2, 0, 1)
    iIntervalFactor = pow(1 - iDensityNormalized, 1.5)  ; Relazione inversa e non lineare
    
    iInterval = iMinInterval + (iMaxInterval - iMinInterval) * iIntervalFactor
    
    ; Aggiungi leggera randomizzazione
    iRandomFactor random 0.8, 1.2
    iInterval = iInterval * iRandomFactor
    
    ; Assicurati che rimaniamo entro limiti ragionevoli
    iInterval = limit(iInterval, iMinInterval, iMaxInterval)
    
    xout iInterval
endop

; -----------------------------------------------------------------------
; STRUMENTO DI TEST
; -----------------------------------------------------------------------
instr TestInterpolateBehaviorTiming
    iTestNumber = p4
    
    prints "\n========================================\n"
    prints "TEST #%d: interpolateBehaviorTiming\n", iTestNumber
    prints "----------------------------------------\n"
    
    ; Configura stati sorgente e destinazione in base al numero di test
    if (iTestNumber == 1) then
        gi_tc_source_density = 0  ; Sparso
        gi_tc_target_density = 2  ; Denso
        prints "Test con transizione da stato SPARSO (0) a DENSO (2)\n"
    elseif (iTestNumber == 2) then
        gi_tc_source_density = 2  ; Denso
        gi_tc_target_density = 0  ; Sparso
        prints "Test con transizione da stato DENSO (2) a SPARSO (0)\n"
    elseif (iTestNumber == 3) then
        gi_tc_source_density = 1  ; Medio
        gi_tc_target_density = 2  ; Denso
        prints "Test con transizione da stato MEDIO (1) a DENSO (2)\n"
    elseif (iTestNumber == 4) then
        gi_tc_source_density = 1  ; Medio
        gi_tc_target_density = 0  ; Sparso
        prints "Test con transizione da stato MEDIO (1) a SPARSO (0)\n"
    elseif (iTestNumber == 5) then
        gi_tc_source_density = 1  ; Medio
        gi_tc_target_density = 1  ; Medio
        prints "Test con stati identici MEDIO (1) - Nessuna transizione\n"
    elseif (iTestNumber == 6) then
        gi_tc_source_density = 0  ; Sparso
        gi_tc_target_density = 2  ; Denso
        gi_tc_min_behavior_interval = 1
        gi_tc_max_behavior_interval = 5
        prints "Test con intervalli comportamento ridotti (Min=1, Max=5)\n"
    elseif (iTestNumber == 7) then
        gi_tc_source_density = 0  ; Sparso
        gi_tc_target_density = 2  ; Denso
        gi_tc_min_behavior_interval = 8
        gi_tc_max_behavior_interval = 20
        prints "Test con intervalli comportamento estesi (Min=8, Max=20)\n"
    endif
    
    prints "Densità sorgente: %d, Densità destinazione: %d\n", gi_tc_source_density, gi_tc_target_density
    prints "Intervallo min: %.1f, Intervallo max: %.1f\n", gi_tc_min_behavior_interval, gi_tc_max_behavior_interval
    prints "----------------------------------------\n"
    
    ; Test con vari valori di progresso
    iPrintCount = 0
    while (iPrintCount < 10) do
        iProgress = iPrintCount / 9  ; Da 0.0 a 1.0 in 10 steps
        
        ; Disabilita temporaneamente la randomizzazione per determinismo (solo per test)
        iOrigMinInterval = gi_tc_min_behavior_interval
        iOrigMaxInterval = gi_tc_max_behavior_interval
        
        ; Raccogliamo 5 valori per mostrare l'effetto della randomizzazione
        prints "Progresso %.2f - Valori calcolati: ", iProgress
        iSampleIdx = 0
        while (iSampleIdx < 5) do
            ; Chiama l'UDO da testare
            iInterval interpolateBehaviorTiming iProgress
            
            prints "%.2f  ", iInterval
            iSampleIdx += 1
        od
        prints "\n"
        
        iPrintCount += 1
    od
    
    prints "----------------------------------------\n"
    prints "Test #%d completato\n", iTestNumber
    prints "========================================\n\n"
endin

; -----------------------------------------------------------------------
; RESET DELLE VARIABILI TRA I TEST
; -----------------------------------------------------------------------
instr ResetConfig
    ; Ripristina valori predefiniti
    gi_tc_min_behavior_interval = 3
    gi_tc_max_behavior_interval = 10
endin

</CsInstruments>
<CsScore>
; Esegui i test separatamente con una breve pausa tra di loro
i "TestInterpolateBehaviorTiming" 0 0.1 1
i "ResetConfig" 1 0.01
i "TestInterpolateBehaviorTiming" 2 0.1 2
i "ResetConfig" 3 0.01
i "TestInterpolateBehaviorTiming" 4 0.1 3
i "ResetConfig" 5 0.01
i "TestInterpolateBehaviorTiming" 6 0.1 4
i "ResetConfig" 7 0.01
i "TestInterpolateBehaviorTiming" 8 0.1 5
i "ResetConfig" 9 0.01
i "TestInterpolateBehaviorTiming" 10 0.1 6
i "ResetConfig" 11 0.01
i "TestInterpolateBehaviorTiming" 12 0.1 7
</CsScore>
</CsoundSynthesizer>