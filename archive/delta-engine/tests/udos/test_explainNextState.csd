<CsoundSynthesizer>
<CsOptions>
-d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Definizione di variabili e tabelle globali necessarie
gi_debug init 2  ; Livello di debug elevato per maggiori dettagli

; -----------------------------------------------------------------------
; Tabelle e variabili necessarie per il sistema adattivo
; -----------------------------------------------------------------------
gi_asp_transition_history ftgen 0, 0, 700, -2, 0  ; 100 entries * 7 values per entry
gi_asp_context_features ftgen 0, 0, 5, -2, 0.5, 0.3, 0.7, 0.2  ; Valori di contesto di esempio
gi_asp_history_index init 5  ; Supponiamo che abbiamo già 5 transizioni
gi_asp_transition_count init 5
gi_asp_learning_rate init 0.1
gi_asp_max_overlap init 30  ; Massima sovrapposizione per normalizzazione

; Variabili per l'analisi del sistema
gi_current_overlap init 6          ; Livello di sovrapposizione attuale
gi_current_harmonic_density init 0.4    ; Densità armonica corrente
gi_current_octave_spread init 0.3       ; Dispersione ottave corrente
gi_current_spectral_centroid init 4.5   ; Centroide spettrale corrente
gi_current_spatial_movement init 0.25    ; Movimento spaziale corrente

; Matrice di transizione
gi_transition_matrix ftgen 0, 0, 27*27, -2, 0

; Stato sorgente (corrente)
gi_tc_source_density init 1
gi_tc_source_register init 0
gi_tc_source_movement init 2

; Stato target (destinazione - necessario per predictNextState)
gi_tc_target_density init 0
gi_tc_target_register init 1
gi_tc_target_movement init 1

; Stato corrente interpolato
gi_tc_current_density init 1
gi_tc_current_register init 0 
gi_tc_current_movement init 2

; Parametri di transizione
gi_tc_transition_mode init 1      ; 0.0=sudden, 1.0=gradual
gi_tc_transition_randomness init 0.2  ; Randomness factor (0.0-1.0)
gi_tc_transition_active init 0      ; Flag indicating if transition is active (0=no, 1=yes)
gi_tc_transition_progress init 0    ; Progress of current transition (0.0 to 1.0)
gi_tc_transition_duration init 0    ; Duration of current transition in seconds
gi_tc_transition_start_time init 0  ; Start time of current transition
gi_tc_transition_count init 0       ; Counter for completed transitions

; Tracciamento della qualità della transizione
gi_tc_expected_state_density ftgen 0, 0, 100, -2, 0   
gi_tc_expected_state_register ftgen 0, 0, 100, -2, 0  
gi_tc_expected_state_movement ftgen 0, 0, 100, -2, 0  
gi_tc_actual_state_density ftgen 0, 0, 100, -2, 0     
gi_tc_actual_state_register ftgen 0, 0, 100, -2, 0    
gi_tc_actual_state_movement ftgen 0, 0, 100, -2, 0    
gi_tc_deviation_density ftgen 0, 0, 100, -2, 0        
gi_tc_deviation_register ftgen 0, 0, 100, -2, 0       
gi_tc_deviation_movement ftgen 0, 0, 100, -2, 0       
gi_tc_transition_quality init 1.0                  

; Memory of past states
gi_tc_past_states ftgen 0, 0, 24, -2, 0  ; Store last 8 states (density, register, movement triplets)
gi_tc_past_states_index init 0           ; Current index in past states buffer

; Per selectNextState abbiamo bisogno di definire la funzione stessa
; Seleziona il prossimo stato in base alle probabilità di transizione
opcode selectNextState, iii, 0
    ; Calcola l'indice di base nella matrice di transizione
    iStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Genera un numero casuale
    iRand random 0, 1
    
    ; Seleziona il prossimo stato in base alla probabilità cumulativa
    iCumulativeProb = 0
    iNextStateIdx = 0
    
    iIdx = 0
    while iIdx < 27 do
        iTransProb tab_i iStateIdx*27+iIdx, gi_transition_matrix
        iCumulativeProb += iTransProb
        
        if iRand < iCumulativeProb then
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

; Simuliamo alcune transizioni nella history
instr 1
    ; Popoliamo la tabella gi_asp_transition_history con alcuni dati di esempio
    
    ; Transizione 1: [1,0,2] -> [0,1,1] con qualità 0.85
    tabw_i (1*9 + 0*3 + 2), 0, gi_asp_transition_history   ; FromState
    tabw_i (0*9 + 1*3 + 1), 1, gi_asp_transition_history   ; ToState
    tabw_i 0.85, 2, gi_asp_transition_history              ; Quality
    tabw_i 0.4, 3, gi_asp_transition_history               ; Context feature 1
    tabw_i 0.3, 4, gi_asp_transition_history               ; Context feature 2
    tabw_i 0.7, 5, gi_asp_transition_history               ; Context feature 3
    tabw_i 0.5, 6, gi_asp_transition_history               ; Context feature 4
    
    ; Transizione 2: [0,1,1] -> [1,1,0] con qualità 0.75
    tabw_i (0*9 + 1*3 + 1), 7, gi_asp_transition_history   ; FromState
    tabw_i (1*9 + 1*3 + 0), 8, gi_asp_transition_history   ; ToState
    tabw_i 0.75, 9, gi_asp_transition_history              ; Quality
    tabw_i 0.3, 10, gi_asp_transition_history              ; Context feature 1
    tabw_i 0.5, 11, gi_asp_transition_history              ; Context feature 2
    tabw_i 0.6, 12, gi_asp_transition_history              ; Context feature 3
    tabw_i 0.4, 13, gi_asp_transition_history              ; Context feature 4
    
    ; Transizione 3: [1,1,0] -> [1,0,2] con qualità 0.65
    tabw_i (1*9 + 1*3 + 0), 14, gi_asp_transition_history  ; FromState
    tabw_i (1*9 + 0*3 + 2), 15, gi_asp_transition_history  ; ToState
    tabw_i 0.65, 16, gi_asp_transition_history             ; Quality
    tabw_i 0.5, 17, gi_asp_transition_history              ; Context feature 1
    tabw_i 0.6, 18, gi_asp_transition_history              ; Context feature 2
    tabw_i 0.3, 19, gi_asp_transition_history              ; Context feature 3
    tabw_i 0.7, 20, gi_asp_transition_history              ; Context feature 4
    
    ; Transizione 4: [1,0,2] -> [2,0,1] con qualità 0.90
    tabw_i (1*9 + 0*3 + 2), 21, gi_asp_transition_history  ; FromState
    tabw_i (2*9 + 0*3 + 1), 22, gi_asp_transition_history  ; ToState
    tabw_i 0.90, 23, gi_asp_transition_history             ; Quality
    tabw_i 0.6, 24, gi_asp_transition_history              ; Context feature 1
    tabw_i 0.4, 25, gi_asp_transition_history              ; Context feature 2
    tabw_i 0.5, 26, gi_asp_transition_history              ; Context feature 3
    tabw_i 0.3, 27, gi_asp_transition_history              ; Context feature 4
    
    ; Transizione 5: [2,0,1] -> [1,0,2] con qualità 0.70
    tabw_i (2*9 + 0*3 + 1), 28, gi_asp_transition_history  ; FromState
    tabw_i (1*9 + 0*3 + 2), 29, gi_asp_transition_history  ; ToState
    tabw_i 0.70, 30, gi_asp_transition_history             ; Quality
    tabw_i 0.7, 31, gi_asp_transition_history              ; Context feature 1
    tabw_i 0.3, 32, gi_asp_transition_history              ; Context feature 2
    tabw_i 0.4, 33, gi_asp_transition_history              ; Context feature 3
    tabw_i 0.6, 34, gi_asp_transition_history              ; Context feature 4
    
    ; Inizializza anche la matrice di transizione con alcune probabilità di esempio
    ; [1,0,2] -> [0,1,1] con probabilità 0.4
    tabw_i 0.4, (1*9 + 0*3 + 2)*27 + (0*9 + 1*3 + 1), gi_transition_matrix
    ; [1,0,2] -> [2,0,1] con probabilità 0.3
    tabw_i 0.3, (1*9 + 0*3 + 2)*27 + (2*9 + 0*3 + 1), gi_transition_matrix
    ; [1,0,2] -> [1,1,1] con probabilità 0.2
    tabw_i 0.2, (1*9 + 0*3 + 2)*27 + (1*9 + 1*3 + 1), gi_transition_matrix
    ; [1,0,2] -> [1,0,1] con probabilità 0.1
    tabw_i 0.1, (1*9 + 0*3 + 2)*27 + (1*9 + 0*3 + 1), gi_transition_matrix
    
    prints "\nDati di esempio inizializzati per il test\n"
    prints "-------------------------------------------\n"
    turnoff
endin

; Includi gli opcode necessari per la predizione di stato
; Update current context features based on musical state
opcode updateContextFeatures, 0, 0
    ; Extract current musical context features
    
    ; Normalize context features with safety bounds checking
    iNormOverlap = limit(gi_current_overlap / gi_asp_max_overlap, 0, 1)
    iNormSpread = limit(gi_current_octave_spread, 0, 1)        ; Already 0-1
    iNormCentroid = limit(gi_current_spectral_centroid / 10, 0, 1) ; Normalized to 0-1
    iNormDynamism = limit(gi_current_spatial_movement, 0, 1)     ; Assuming 0-1 range
    
    ; Store current context safely
    tabw_i iNormOverlap, 0, gi_asp_context_features
    tabw_i iNormSpread, 1, gi_asp_context_features
    tabw_i iNormCentroid, 2, gi_asp_context_features
    tabw_i iNormDynamism, 3, gi_asp_context_features
    
    if (gi_debug >= 3) then
        prints "Context updated: [%.2f, %.2f, %.2f, %.2f] (normalized)\n", iNormOverlap, iNormSpread, iNormCentroid, iNormDynamism
    endif
endop

; Compare two context vectors and return similarity score (0-1)
opcode calculateContextSimilarity, i, ii
    i_ContextBase1, i_DebugLevel xin
    
    ; Default debug level if not provided
    i_DebugLevel = (i_DebugLevel == 0) ? gi_debug : i_DebugLevel
    
    ; Feature importance weights
    iWeightOverlap = 1.8    ; Overlap (event density) is important
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
        iDiff = 0
        if (iFeatureIdx == 0) then  ; Solo per la feature di sovrapposizione (indice 0)
            ; Trasformazione non lineare (radice quadrata) per amplificare piccole differenze
            iFeature1Transformed = sqrt(iFeature1) * 2  ; Moltiplichiamo per 2 per riportare in un range simile
            iFeature2Transformed = sqrt(iFeature2) * 2
            iDiff = iFeature1Transformed - iFeature2Transformed
        else
            iDiff = iFeature1 - iFeature2
        endif
        
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
    ; This creates a more gradual transition from "similar" to "dissimilar"
    ; with a steeper slope in the middle range
    iSensitivity = 8  ; Controls steepness of sigmoid (higher = sharper distinction)
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

; Predicts the next state based on current state and musical context
opcode predictNextState, iii, o
    iDebugLevel xin
    
    ; Set default debug level if not provided
    iDebugLevel = (iDebugLevel == 0) ? gi_debug : iDebugLevel
    
    ; Update context features from current musical state
    updateContextFeatures
    iNextDensity=0
    iNextRegister=0
    iNextMovement=0
    ; Calculate current state index (0-26)
    iCurrentStateIdx = (gi_tc_source_density * 9) + (gi_tc_source_register * 3) + gi_tc_source_movement
    
    ; Check for sufficient historical data
    if (gi_asp_transition_count < 10) then
        ; Not enough data for adaptive prediction, use standard transitions
        if (iDebugLevel >= 1) then
            prints "Not enough historical data (%d transitions), using standard transition matrix\n", gi_asp_transition_count
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
        prints "\nAnalyzing historical transitions for state %d and current context:\n", iCurrentStateIdx
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
                prints "  Transition %d: from state %d (not matching current %d) - skipped\n", iHistoryIdx+1, iFromState, iCurrentStateIdx
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
                prints "  Transition %d (%.1fs ago): similarity=%.4f, quality=%.2f, influence=%.4f on state %d\n", 
                       iHistoryIdx+1, (iHistoryIdx * 1.0), iSimilarity, 
                       iQuality, iInfluence, iToState
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
        
        prints "\nTop state candidates after normalization:\n"
    endif
    
    ; Create an array to hold top candidates
    iNumCandidates = 5  ; Track top 5 candidates
    iCandidateStateIdx[] init iNumCandidates
    iCandidateProb[] init iNumCandidates
    
    ; Initialize with zeros
    indx = 0
    while (indx < iNumCandidates) do
        iCandidateStateIdx[indx] = -1
        iCandidateProb[indx] = 0
        indx += 1
    od
    
    ; Normalize and find top candidates
    if (iSum > 0) then
        iNormIdx = 0
        while (iNormIdx < 27) do
            iProb tab_i iNormIdx, iStateProbabilities
            iNormProb = iProb / iSum
            tabw_i iNormProb, iNormIdx, iStateProbabilities
            
            ; Check if this belongs in top candidates
            indx = 0
            while (indx < iNumCandidates) do
                if (iNormProb > iCandidateProb[indx]) then
                    ; Shift down to make room
                    indx2 = iNumCandidates - 1
                    while (indx2 > indx) do
                        iCandidateStateIdx[indx2] = iCandidateStateIdx[indx2-1]
                        iCandidateProb[indx2] = iCandidateProb[indx2-1]
                        indx2 -= 1
                    od
                    
                    ; Insert new candidate
                    iCandidateStateIdx[indx] = iNormIdx
                    iCandidateProb[indx] = iNormProb
                    igoto found_position
                endif
                indx += 1
            od
            found_position:
            
            iNormIdx += 1
        od
    endif
    
    ; Display top candidates
    if (iDebugLevel >= 2) then
        indx = 0
        while (indx < iNumCandidates && iCandidateStateIdx[indx] >= 0) do
            iStateIdx = iCandidateStateIdx[indx]
            iProb = iCandidateProb[indx]
            
            ; Convert to component form
            iDens = int(iStateIdx / 9)
            iRem = iStateIdx % 9
            iReg = int(iRem / 3)
            iMov = iRem % 3
            
            prints "  Candidate %d: State [%d,%d,%d] (idx %d): probability = %.4f\n", 
                   indx+1, iDens, iReg, iMov, iStateIdx, iProb
            
            indx += 1
        od
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
    
    igoto end
    
    end:
    xout iNextDensity, iNextRegister, iNextMovement
endop

; Make a prediction with explanation
opcode explainNextState, iii, i
    iDebugLevel xin
    
    ; Force detailed debug for explanation
    iNextDensity, iNextRegister, iNextMovement predictNextState (iDebugLevel > 0 ? iDebugLevel : 2)
    
    ; Convert prediction to state names for more meaningful explanation
    SdensityName = "unknown"
    if (iNextDensity == 0) then 
        SdensityName = "sparse"
    elseif (iNextDensity == 1) then
        SdensityName = "medium"
    elseif (iNextDensity == 2) then
        SdensityName = "dense"
    endif
    
    SregisterName = "unknown" 
    if (iNextRegister == 0) then
        SregisterName = "low"
    elseif (iNextRegister == 1) then
        SregisterName = "mid"
    elseif (iNextRegister == 2) then
        SregisterName = "high"
    endif
    
    SmovementName = "unknown"
    if (iNextMovement == 0) then
        SmovementName = "static"
    elseif (iNextMovement == 1) then
        SmovementName = "moderate" 
    elseif (iNextMovement == 2) then
        SmovementName = "dynamic"
    endif
    
    prints "\nAdaptive system suggestion: %s density, %s register, %s movement\n",
           SdensityName, SregisterName, SmovementName
    prints "  Based on %d past transitions and current musical context\n", 
           gi_asp_transition_count
    
    xout iNextDensity, iNextRegister, iNextMovement
endop

; Test dell'opcode explainNextState
instr 2
    prints "\nTest dell'opcode explainNextState\n"
    prints "-------------------------------------------\n"
    
    ; Imposta il contesto attuale
    tabw_i 0.5, 0, gi_asp_context_features  ; Overlap (densità)
    tabw_i 0.4, 1, gi_asp_context_features  ; Spread (dispersione)
    tabw_i 0.6, 2, gi_asp_context_features  ; Centroid (centroide)
    tabw_i 0.3, 3, gi_asp_context_features  ; Movement (movimento)
    
    prints "Contesto musicale attuale:\n"
    prints "  Overlap (densità): %.2f\n", tab_i(0, gi_asp_context_features)
    prints "  Spread (dispersione): %.2f\n", tab_i(1, gi_asp_context_features)
    prints "  Centroid (centroide): %.2f\n", tab_i(2, gi_asp_context_features)
    prints "  Movement (movimento): %.2f\n", tab_i(3, gi_asp_context_features)
    prints "\n"
    
    ; Stato attuale
    prints "Stato attuale: [%d,%d,%d]\n", gi_tc_source_density, gi_tc_source_register, gi_tc_source_movement
    prints "\n"
    
; Chiama explainNextState con un livello di debug elevato
    iNextDensity, iNextRegister, iNextMovement explainNextState 3
    
    prints "\nRisultato della predizione:\n"
    prints "  Next Density: %d\n", iNextDensity
    prints "  Next Register: %d\n", iNextRegister
    prints "  Next Movement: %d\n", iNextMovement
    
    turnoff
endin

</CsInstruments>
<CsScore>
i1 0 0.1  ; Inizializza i dati di esempio
i2 0.2 0.1 ; Testa explainNextState
</CsScore>
</CsoundSynthesizer>