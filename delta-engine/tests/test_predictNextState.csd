<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0
seed 0
; Livello di debug (0=nessuno, 1=base, 2=dettagliato, 3=completo)
gi_debug init 2

; ------------------------------------------------------------------------------
; Inizializzazione delle variabili e tabelle globali necessarie
; ------------------------------------------------------------------------------

; Numero di ottave e registri (necessari per calcoli in determineCurrentState)
#define OTTAVE      #10#
#define REGISTRI    #10#

; Parametri musicali attuali (usati da updateContextFeatures)
gi_current_overlap init 5          ; Livello di sovrapposizione evento
gi_current_harmonic_density init 0.35   ; Densità armonica
gi_current_octave_spread init 0.4     ; Dispersione ottave 
gi_current_spectral_centroid init 3.7 ; Centroide spettrale
gi_current_spatial_movement init 0.25  ; Movimento spaziale

; Stato corrente
gi_tc_source_density init 1    ; Densità (0=sparsa, 1=media, 2=densa)
gi_tc_source_register init 0   ; Registro (0=basso, 1=medio, 2=alto)
gi_tc_source_movement init 1   ; Movimento (0=statico, 1=moderato, 2=dinamico)

; Matrice di transizione (27x27, per tutti gli stati possibili 3^3)
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Storia delle transizioni e contesto musicale per predizione adattiva
gi_asp_transition_history ftgen 0, 0, 100*7, -2, 0   ; Buffer per 100 transizioni, 7 valori per transizione
gi_asp_context_features ftgen 0, 0, 4, -2, 0         ; 4 valori per il contesto attuale
gi_asp_history_index init 10      ; Indice corrente nel buffer circolare
gi_asp_transition_count init 15   ; Numero totale di transizioni registrate
gi_asp_learning_rate init 0.1     ; Tasso di apprendimento adattivo
gi_asp_max_overlap init 30        ; Massima sovrapposizione di riferimento per normalizzazione

; ------------------------------------------------------------------------------
; Funzioni di supporto necessarie
; ------------------------------------------------------------------------------

; Compare two context vectors and return similarity score (0-1)
opcode calculateContextSimilarity, i, ii
    i_ContextBase1, i_DebugLevel xin
    
    ; Feature importance weights
    iWeightOverlap = 1.2    ; Overlap (event density) is important
    iWeightSpread = 0.8     ; Spread is less critical
    iWeightCentroid = 1.0   ; Spectral centroid has medium importance
    iWeightMovement = 1.5   ; Spatial movement is very important for transitions
    
    ; Array to store weights
    iWeights[] init 4
    iWeights[0] = iWeightOverlap
    iWeights[1] = iWeightSpread
    iWeights[2] = iWeightCentroid
    iWeights[3] = iWeightMovement
    
    ; Calculate weighted Euclidean distance between context features
    iSumSquaredDiff = 0
    iTotalWeight = 0
    iFeatureIdx = 0
    
    if (i_DebugLevel >= 3) then
        prints "calculateContextSimilarity details:\n"
        prints "---------------------------------\n"
    endif
    
    while (iFeatureIdx < 4) do
        iFeature1 tab_i (i_ContextBase1+iFeatureIdx), gi_asp_transition_history
        iFeature2 tab_i iFeatureIdx, gi_asp_context_features
        iDiff = iFeature1 - iFeature2
        
        ; Apply feature weight
        iWeight = iWeights[iFeatureIdx]
        iWeightedDiff = iDiff * iWeight
        iSumSquaredDiff += iWeightedDiff * iWeightedDiff
        iTotalWeight += iWeight
        
        if (i_DebugLevel >= 3) then
            prints "  Feature %d: %.3f vs %.3f, diff=%.3f, weight=%.1f, contribution=%.4f\n", 
                  iFeatureIdx, iFeature1, iFeature2, iDiff, iWeight, iWeightedDiff * iWeightedDiff
        endif
        
        iFeatureIdx += 1
    od
    
    ; Calculate normalized weighted distance
    iDistance = sqrt(iSumSquaredDiff) / sqrt(iTotalWeight)
    
    ; Apply sigmoid function for more nuanced similarity mapping
    iSensitivity = 6  ; Controls steepness of sigmoid
    iSigmoidArg = iSensitivity * (iDistance - 0.5)
    iSigmoid = 1 / (1 + exp(iSigmoidArg))
    
    ; Final similarity score
    i_mysimilarity = iSigmoid
    
    if (i_DebugLevel >= 2) then
        prints "Raw distance: %.4f, Sensitivity: %.1f, Final similarity: %.4f\n", 
               iDistance, iSensitivity, i_mysimilarity
    endif
    
    xout i_mysimilarity
endop

; Update current context features based on musical state
opcode updateContextFeatures, 0, 0
    ; Normalize context features with safety bounds checking
    iNormOverlap = limit(gi_current_overlap / gi_asp_max_overlap, 0, 1)
    iNormSpread = limit(gi_current_octave_spread, 0, 1)
    iNormCentroid = limit(gi_current_spectral_centroid / $OTTAVE, 0, 1)
    iNormDynamism = limit(gi_current_spatial_movement, 0, 1)
    
    ; Store current context safely
    tabw_i iNormOverlap, 0, gi_asp_context_features
    tabw_i iNormSpread, 1, gi_asp_context_features
    tabw_i iNormCentroid, 2, gi_asp_context_features
    tabw_i iNormDynamism, 3, gi_asp_context_features
    
    if (gi_debug >= 3) then
        prints "Context updated: [%.2f, %.2f, %.2f, %.2f] (normalized)\n", 
               iNormOverlap, iNormSpread, iNormCentroid, iNormDynamism
    endif
endop

; Standard transition selection (base)
opcode selectNextState, iii, 0
    ; Calcola l'indice di base nella matrice di transizione
    iStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Genera un numero casuale
    iRand random 0, 1
    
    ; Seleziona il prossimo stato in base alla probabilità cumulativa
    iCumulativeProb = 0
    iNextStateIdx = 0
    
    iIdx = 0
    while (iIdx < 27) do
        iTransProb tab_i iStateIdx*27+iIdx, gi_transition_matrix
        iCumulativeProb += iTransProb
        
        if (iRand < iCumulativeProb) then
            iNextStateIdx = iIdx
            igoto found_next
        endif
        
        iIdx += 1
    od
    found_next:
    
    ; Converti l'indice nei parametri di stato
    iNextDensity = int(iNextStateIdx / 9)
    iRemainder = iNextStateIdx % 9
    iNextRegister = int(iRemainder / 3)
    iNextMovement = iRemainder % 3
    
    xout iNextDensity, iNextRegister, iNextMovement
endop

; ------------------------------------------------------------------------------
; OPCODE DA TESTARE: predictNextState
; ------------------------------------------------------------------------------

; Predicts the next state based on current state and musical context
opcode predictNextState, iii, o
    iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Update context features from current musical state
    updateContextFeatures
    
    ; Calculate current state index (0-26)
    iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Check for sufficient historical data
    if (gi_asp_transition_count < 10) then
        ; Not enough data for adaptive prediction, use standard transitions
        if (iDebugLevel >= 1) then
            prints "Not enough historical data (%d transitions), using standard transition matrix\n", 
                   gi_asp_transition_count
        endif
        iNextDensity, iNextRegister, iNextMovement selectNextState
        igoto end
    endif
    
    ; Create distributions for state probabilities
    iStateProbabilities ftgen 0, 0, 27, -2, 0  ; Temporary table for probabilities
    
    ; Initialize with base probabilities from transition matrix
    iBaseIdx = 0
    while (iBaseIdx < 27) do
        ; Get base probability from transition matrix
        iBaseProb tab_i iCurrentStateIdx*27+iBaseIdx, gi_transition_matrix
        tabw_i iBaseProb, iBaseIdx, iStateProbabilities
        
        iBaseIdx += 1
    od
    
    ; Counters for statistical tracking
    iMatchingTransitions = 0
    iInfluentialTransitions = 0
    iHighSimilarityCount = 0
    
    ; Table for tracking all similarity scores (for advanced statistics)
    iSimilarityScores ftgen 0, 0, gi_asp_transition_count, -2, 0
    
    if (iDebugLevel >= 2) then
        prints "\nAnalyzing historical transitions for state %d and current context:\n", 
               iCurrentStateIdx
    endif
    
    ; Now adjust based on historical performance in similar contexts
    iHistoryIdx = 0
    iCount = min(gi_asp_transition_count, 100)  ; Look at up to 100 past transitions
    
    while (iHistoryIdx < iCount) do
        ; Calculate position in history buffer (circular buffer management)
        iActualIdx = (gi_asp_history_index - 1 - iHistoryIdx + 100) % 100
        
        ; Extract history entry
        iEntryBase = iActualIdx * 7
        iFromState tab_i iEntryBase, gi_asp_transition_history
        iToState tab_i iEntryBase+1, gi_asp_transition_history
        iQuality tab_i iEntryBase+2, gi_asp_transition_history
        
        ; Store similarity score for statistics, regardless of state match
        i_ContextBase = iEntryBase+3
        iSimilarity calculateContextSimilarity i_ContextBase, 0  ; Low debug level for cleaner output
        tabw_i iSimilarity, iHistoryIdx, iSimilarityScores
        
        ; Skip if not matching current state
        if (iFromState != iCurrentStateIdx) then
            if (iDebugLevel >= 3) then
                prints "  Transition %d: from state %d (not matching current %d) - skipped\n", 
                       iHistoryIdx+1, iFromState, iCurrentStateIdx
            endif
            iHistoryIdx += 1
            igoto continue
        endif
        
        iMatchingTransitions += 1
        
        ; If context is similar enough, adjust probability based on quality
        if (iSimilarity > 0.3) then  ; Similarity threshold
            ; Apply a more nuanced influence formula
            ; Higher similarities get exponentially more influence
            iInfluence = iQuality * pow(iSimilarity, 2) * gi_asp_learning_rate
            
            ; Positive reinforcement for this transition
            iCurrentProb tab_i iToState, iStateProbabilities
            iNewProb = iCurrentProb * (1 + iInfluence)
            tabw_i iNewProb, iToState, iStateProbabilities
            
            iInfluentialTransitions += 1
            if (iSimilarity > 0.7) then
                iHighSimilarityCount += 1
            endif
            
            if (iDebugLevel >= 2) then
                prints "  Transition %d: similarity=%.4f, quality=%.2f, influence=%.4f on state %d\n", 
                       iHistoryIdx+1, iSimilarity, iQuality, iInfluence, iToState
            endif
        else
            if (iDebugLevel >= 3) then
                prints "  Transition %d: similarity=%.4f (below threshold, ignored)\n", 
                       iHistoryIdx+1, iSimilarity
            endif
        endif
        
        continue:
        iHistoryIdx += 1
    od
    
    ; Add creative variance to prevent getting stuck in patterns
    ; If we have very high confidence (multiple high similarity matches),
    ; still maintain some exploration tendency
    if (iHighSimilarityCount >= 3) then
        ; Add small probability to all states to encourage exploration
        iExplorationFactor = 0.05
        
        iStateIdx = 0
        while (iStateIdx < 27) do
            iCurrentProb tab_i iStateIdx, iStateProbabilities
            iNewProb = iCurrentProb + iExplorationFactor
            tabw_i iNewProb, iStateIdx, iStateProbabilities
            iStateIdx += 1
        od
        
        if (iDebugLevel >= 2) then
            prints "  Added exploration factor of %.2f to prevent predictability\n", 
                   iExplorationFactor
        endif
    endif
    
    ; Normalize probabilities
    iSum = 0
    iNormIdx = 0
    while (iNormIdx < 27) do
        iSum += tab_i(iNormIdx, iStateProbabilities)
        iNormIdx += 1
    od
    
    if (iDebugLevel >= 2) then
        prints "\nStatistics: Found %d matching transitions, %d influential (%.1f%%), %d high similarity\n",
               iMatchingTransitions, iInfluentialTransitions, 
               (iMatchingTransitions > 0) ? (iInfluentialTransitions/iMatchingTransitions)*100 : 0,
               iHighSimilarityCount
    endif
    
    ; Normalize and prepare for selection
    if (iSum > 0) then
        iNormIdx = 0
        while (iNormIdx < 27) do
            iProb tab_i iNormIdx, iStateProbabilities
            iNormProb = iProb / iSum
            tabw_i iNormProb, iNormIdx, iStateProbabilities
            iNormIdx += 1
        od
    endif
    
    ; Display top candidates
    if (iDebugLevel >= 2) then
        prints "\nTop state candidates after normalization:\n"
        
        ; Track which states we've already displayed
        iMaxToShow = 5  ; Maximum number to show
        iShown = 0
        iStateTracker[] init 27
        iIdx = 0
        while (iIdx < 27) do
            iStateTracker[iIdx] = 1  ; 1 = available, 0 = already shown
            iIdx += 1
        od
        
        ; Show top candidates by repeatedly finding the best
        while (iShown < iMaxToShow) do
            iBestProb = -1
            iBestIdx = -1
            
            ; Find highest probability candidate
            iIdx = 0
            while (iIdx < 27) do
                if (iStateTracker[iIdx] == 1) then
                    iProb tab_i iIdx, iStateProbabilities
                    if (iProb > iBestProb) then
                        iBestProb = iProb
                        iBestIdx = iIdx
                    endif
                endif
                iIdx += 1
            od
            
            ; If we found one with non-zero probability
            if (iBestIdx >= 0 && iBestProb > 0) then
                ; Mark as shown
                iStateTracker[iBestIdx] = 0
                
                ; Calculate state components
                iDens = int(iBestIdx / 9)
                iRem = iBestIdx % 9
                iReg = int(iRem / 3)
                iMov = iRem % 3
                
                ; Display information
                prints "  Candidate %d: State [%d,%d,%d] (idx %d): probability = %.4f\n", 
                       iShown+1, iDens, iReg, iMov, iBestIdx, iBestProb
                
                iShown += 1
            else
                ; No more candidates with positive probability
                igoto show_done
            endif
        od
        show_done:
    endif
    
    ; Random weighted selection from distribution
    iRand random 0, 1
    iCumulativeProb = 0
    iSelectedStateIdx = 0
    
    iStateIdx = 0
    while (iStateIdx < 27) do
        iProb tab_i iStateIdx, iStateProbabilities
        iCumulativeProb += iProb
        
        if (iRand < iCumulativeProb) then
            iSelectedStateIdx = iStateIdx
            igoto selected_state
        endif
        
        iStateIdx += 1
    od
    
    selected_state:
    
    ; Convert state index back to components
    iNextDensity = int(iSelectedStateIdx / 9)
    iRemainder = iSelectedStateIdx % 9
    iNextRegister = int(iRemainder / 3)
    iNextMovement = iRemainder % 3
    
    if (iDebugLevel >= 1) then
        prints "Selected next state [%d,%d,%d] with probability %.4f\n", 
               iNextDensity, iNextRegister, iNextMovement, 
               tab_i(iSelectedStateIdx, iStateProbabilities)
    endif
    
    end:
    xout iNextDensity, iNextRegister, iNextMovement
endop

; ------------------------------------------------------------------------------
; STRUMENTO DI TEST
; ------------------------------------------------------------------------------
instr 1
    prints "\n======= TEST DI predictNextState =======\n"
    
    ; Inizializza la matrice di transizione con valori base
    prints "\nInizializzazione della matrice di transizione...\n"
    
    ; Inizializziamo la matrice con più probabilità per transizioni graduali
    iStateIdx = 0
    while (iStateIdx < 27) do
        ; Scomponiamo l'indice nei suoi componenti
        iCurrentDensity = int(iStateIdx / 9)
        iRemainder = iStateIdx % 9
        iCurrentRegister = int(iRemainder / 3)
        iCurrentMovement = iRemainder % 3
        
        ; Per ogni possibile stato successivo
        iNextStateIdx = 0
        while (iNextStateIdx < 27) do
            ; Scomponiamo l'indice del prossimo stato
            iNextDensity = int(iNextStateIdx / 9)
            iNextRemainder = iNextStateIdx % 9
            iNextRegister = int(iNextRemainder / 3)
            iNextMovement = iNextRemainder % 3
            
            ; Calcoliamo la "distanza" tra stati (quanti parametri cambiano)
            iChanges = 0
            if (iCurrentDensity != iNextDensity) then
                iChanges += 1
            endif
            if (iCurrentRegister != iNextRegister) then
                iChanges += 1
            endif
            if (iCurrentMovement != iNextMovement) then
                iChanges += 1
            endif
            
            ; Assegniamo probabilità basate sulla distanza
            iProb = 0
            if (iChanges == 0) then
                iProb = 0.4  ; 40% probabilità di rimanere nello stesso stato
            elseif (iChanges == 1) then
                iProb = 0.3  ; 30% probabilità di cambiare un solo parametro
            elseif (iChanges == 2) then
                iProb = 0.2  ; 20% probabilità di cambiare due parametri
            else
                iProb = 0.1  ; 10% probabilità di cambiare tutti i parametri
            endif
            
            ; Salva la probabilità nella matrice
            tabw_i iProb, iStateIdx*27+iNextStateIdx, gi_transition_matrix
            
            iNextStateIdx += 1
        od
        
        ; Normalizza le probabilità per assicurarsi che sommino a 1
        iSum = 0
        iNextIdx = 0
        while (iNextIdx < 27) do
            iProb tab_i iStateIdx*27+iNextIdx, gi_transition_matrix
            iSum += iProb
            iNextIdx += 1
        od
        
        if (iSum > 0) then
            iNextIdx = 0
            while (iNextIdx < 27) do
                iProb tab_i iStateIdx*27+iNextIdx, gi_transition_matrix
                iNormProb = iProb / iSum
                tabw_i iNormProb, iStateIdx*27+iNextIdx, gi_transition_matrix
                iNextIdx += 1
            od
        endif
        
        iStateIdx += 1
    od
    
    prints "Matrice di transizione inizializzata.\n"
    
    ; Popola il buffer di storia delle transizioni con alcuni dati di esempio
    prints "\nPopolamento della storia delle transizioni...\n"
    
    ; Stato attuale (da cui stiamo transizionando)
    iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Inizializza alcune transizioni storiche
    ; Formato: [da_stato, a_stato, qualità, cont1, cont2, cont3, cont4]
    
    ; Esempio 1: Transizione simile allo stato attuale con alta qualità
    iHistIdx = 0
    tabw_i iCurrentStateIdx, iHistIdx*7, gi_asp_transition_history
    tabw_i 13, iHistIdx*7+1, gi_asp_transition_history         ; Stato target [1,1,1]
    tabw_i 0.9, iHistIdx*7+2, gi_asp_transition_history        ; Alta qualità
    tabw_i 0.18, iHistIdx*7+3, gi_asp_transition_history       ; Contesto simile a quello attuale
    tabw_i 0.4, iHistIdx*7+4, gi_asp_transition_history
    tabw_i 0.35, iHistIdx*7+5, gi_asp_transition_history
    tabw_i 0.22, iHistIdx*7+6, gi_asp_transition_history
    
    ; Esempio 2: Transizione simile allo stato attuale con qualità media
    iHistIdx = 1
    tabw_i iCurrentStateIdx, iHistIdx*7, gi_asp_transition_history
    tabw_i 10, iHistIdx*7+1, gi_asp_transition_history         ; Stato target [1,0,1]
    tabw_i 0.6, iHistIdx*7+2, gi_asp_transition_history        ; Qualità media
    tabw_i 0.15, iHistIdx*7+3, gi_asp_transition_history       ; Contesto abbastanza simile
    tabw_i 0.35, iHistIdx*7+4, gi_asp_transition_history
    tabw_i 0.4, iHistIdx*7+5, gi_asp_transition_history
    tabw_i 0.3, iHistIdx*7+6, gi_asp_transition_history
    
    ; Esempio 3: Transizione da uno stato diverso
    iHistIdx = 2
    tabw_i 0, iHistIdx*7, gi_asp_transition_history            ; Stato diverso [0,0,0]
    tabw_i 13, iHistIdx*7+1, gi_asp_transition_history         ; Stato target [1,1,1]
    tabw_i 0.8, iHistIdx*7+2, gi_asp_transition_history        ; Alta qualità
    tabw_i 0.1, iHistIdx*7+3, gi_asp_transition_history        ; Contesto qualsiasi
    tabw_i 0.2, iHistIdx*7+4, gi_asp_transition_history
    tabw_i 0.3, iHistIdx*7+5, gi_asp_transition_history
    tabw_i 0.4, iHistIdx*7+6, gi_asp_transition_history
    
    ; Altre transizioni storiche con varie qualità
    iIdx = 3
    while (iIdx < 15) do
        iRandomFromState = int(random(0, 27))
        iRandomToState = int(random(0, 27))
        iRandomQuality = random(0.3, 0.9)
        
        tabw_i iRandomFromState, iIdx*7, gi_asp_transition_history
        tabw_i iRandomToState, iIdx*7+1, gi_asp_transition_history
        tabw_i iRandomQuality, iIdx*7+2, gi_asp_transition_history
        
        ; Contesto casuale
        tabw_i random(0, 1), iIdx*7+3, gi_asp_transition_history
        tabw_i random(0, 1), iIdx*7+4, gi_asp_transition_history
        tabw_i random(0, 1), iIdx*7+5, gi_asp_transition_history
        tabw_i random(0, 1), iIdx*7+6, gi_asp_transition_history
        
        iIdx += 1
    od
    
    prints "Buffer di storia popolato con %d transizioni.\n", gi_asp_transition_count
    prints "Stato corrente: [%d,%d,%d] (indice %d)\n", 
           gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement, iCurrentStateIdx
    
    ; Test 1: Esecuzione con dati di storia
    prints "\nTEST 1: Predizione basata su storia e similarità di contesto\n"
    prints "---------------------------------------------------------\n"
    
    iNextDensity, iNextRegister, iNextMovement predictNextState 2
    
    prints "\nStato predetto: [%d,%d,%d]\n", iNextDensity, iNextRegister, iNextMovement
    
    ; Test 2: Esecuzione con meno dati storici (per verificare il fallback)
    prints "\nTEST 2: Predizione con dati storici insufficienti\n"
    prints "-----------------------------------------------\n"
    
    ; Temporaneamente impostiamo un conteggio inferiore
    iOriginalCount = gi_asp_transition_count
    gi_asp_transition_count = 5
    
    iNextDensity2, iNextRegister2, iNextMovement2 predictNextState 2
    
    prints "\nStato predetto (con pochi dati): [%d,%d,%d]\n", 
           iNextDensity2, iNextRegister2, iNextMovement2
    
    ; Ripristina il conteggio originale
    gi_asp_transition_count = iOriginalCount
    
    ; Test 3: Esecuzione con diverso contesto musicale
    prints "\nTEST 3: Predizione con diverso contesto musicale\n"
    prints "-----------------------------------------------\n"
    
    ; Modifica temporaneamente il contesto corrente
    gi_current_overlap = 15        ; Aumento significativo della densità
    gi_current_octave_spread = 0.7 ; Maggiore dispersione delle ottave
    
    iNextDensity3, iNextRegister3, iNextMovement3 predictNextState 2
    
    prints "\nStato predetto (con contesto diverso): [%d,%d,%d]\n", 
           iNextDensity3, iNextRegister3, iNextMovement3
    
    prints "\n======= TEST COMPLETATO =======\n"
endin

</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>