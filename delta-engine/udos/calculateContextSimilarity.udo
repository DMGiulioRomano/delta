; ===========================================================================
; IMPROVED CONTEXT SIMILARITY CALCULATION
; ===========================================================================
; This version offers improved context similarity calculations with:
; 1. Feature weighting to give different importance to different aspects
; 2. Better normalization with sigmoid function for more nuanced scaling
; 3. More robust sensitivity scaling
; 4. Optional debugging output
; ===========================================================================

; Compare two context vectors and return similarity score (0-1)
opcode calculateContextSimilarity, i, io
    i_ContextBase1, i_DebugLevel xin
    
    ; Default debug level if not provided
    i_DebugLevel = (i_DebugLevel == 0) ? gi_debug : i_DebugLevel
    
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
    ; This creates a more gradual transition from "similar" to "dissimilar"
    ; with a steeper slope in the middle range
    iSensitivity = 6  ; Controls steepness of sigmoid (higher = sharper distinction)
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

; -----------------------------------------------------------------------
; A version that also returns individual feature similarities
; Useful for more detailed analysis and visualization
; -----------------------------------------------------------------------
opcode calculateContextSimilarityDetailed, i[]i, io
    i_ContextBase1, i_DebugLevel xin
    
    ; Main result vector: [overall_similarity, feat1_sim, feat2_sim, feat3_sim, feat4_sim]
    iResult[] init 5
    
    ; Calculate feature-by-feature similarities
    iFeatureIdx = 0
    while (iFeatureIdx < 4) do
        iFeature1 tab_i (i_ContextBase1+iFeatureIdx), gi_asp_transition_history
        iFeature2 tab_i iFeatureIdx, gi_asp_context_features
        iDiff = abs(iFeature1 - iFeature2)
        
        ; Individual feature similarity (1 = identical, 0 = maximally different)
        iFeatureSimilarity = 1 - limit(iDiff, 0, 1)
        iResult[iFeatureIdx+1] = iFeatureSimilarity
        
        iFeatureIdx += 1
    od
    
    ; Calculate overall similarity using the standard method
    iOverallSimilarity calculateContextSimilarity i_ContextBase1, i_DebugLevel
    iResult[0] = iOverallSimilarity
    
    xout iResult, iOverallSimilarity
endop
