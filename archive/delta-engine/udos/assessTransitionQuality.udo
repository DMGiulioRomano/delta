; -----------------------------------------------------------------------
; TRANSITION QUALITY ASSESSMENT AND ADAPTATION
; -----------------------------------------------------------------------
opcode assessTransitionQuality, i, 0
    ; Initialize separate counters for each dimension
    iDensityDeviation = 0
    iRegisterDeviation = 0
    iMovementDeviation = 0
    iSamples = 0

    iAvgDensityDev = 0
    iAvgRegisterDev = 0
    iAvgMovementDev = 0

    ; Scan through transition timeline (0-100%)    
    iIndex = 0
    while (iIndex < 100) do
        ; Check if we have data at this point (non-zero values in any dimension)
        iDensityValue tab_i iIndex, gi_tc_deviation_density
        iRegisterValue tab_i iIndex, gi_tc_deviation_register
        iMovementValue tab_i iIndex, gi_tc_deviation_movement
        
        ; Only include points with actual recorded data
        if (iDensityValue > 0 || iRegisterValue > 0 || iMovementValue > 0) then
            ; Accumulate deviations in each dimension
            iDensityDeviation += iDensityValue
            iRegisterDeviation += iRegisterValue
            iMovementDeviation += iMovementValue
            iSamples += 1
        endif
        
        iIndex += 1
    od
    
    ; Calculate weighted quality score
    iQuality = 1.0  ; Default perfect score
    
    if (iSamples > 0) then
        ; Calculate average deviation in each dimension
        iAvgDensityDev = iDensityDeviation / iSamples
        iAvgRegisterDev = iRegisterDeviation / iSamples
        iAvgMovementDev = iMovementDeviation / iSamples
        
        ; Apply dimension weights (50% density, 25% register, 25% movement)
        ; These weights can be adjusted based on compositional priorities
        iWeightedDeviation = (iAvgDensityDev * 0.5) + 
                             (iAvgRegisterDev * 0.25) + 
                             (iAvgMovementDev * 0.25)
        
        ; Convert deviation to quality score (0.0-1.0)
        ; Dividing by 2 assumes max deviation per dimension is 2
        ; (difference between extreme states 0 and 2)
        iQuality = 1.0 - limit(iWeightedDeviation / 2, 0, 1)
    endif
    
    ; Debug output if needed
    if (gi_debug >= 2) then
        prints "Transition Quality Assessment: %.2f (from %d samples)\n", 
               iQuality, iSamples
        if (iSamples > 0) then
            prints "  Avg Deviations - Density: %.2f, Register: %.2f, Movement: %.2f\n",
                   iAvgDensityDev, iAvgRegisterDev, iAvgMovementDev
        endif
    endif
    
    xout iQuality
endop
