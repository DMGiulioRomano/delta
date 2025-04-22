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
