; Update current context features based on musical state
opcode updateContextFeatures, 0, 0
    ; Extract current musical context features
    
    ; Normalize context features with safety bounds checking
    iNormOverlap = limit(gi_current_overlap / 10, 0, 1)  ; Assuming max overlap of 10
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

