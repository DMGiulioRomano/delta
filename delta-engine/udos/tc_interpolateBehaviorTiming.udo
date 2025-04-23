; Calculates timing between behaviors based on transition progress
opcode interpolateBehaviorTiming, i, i
    iProgress xin    
    ; Interpolate density value at current progress
    iCurrentDensity interpolateParameter gi_tc_source_density, gi_tc_target_density, iProgress, 0.3
    
    ; Map density state to behavior timing
    ; Higher density = more frequent behaviors
    iMinInterval = gi_tc_min_behavior_interval
    iMaxInterval = gi_tc_max_behavior_interval
    
    ; Exponential mapping from density (0-2) to interval
    iDensityNormalized = limit(iCurrentDensity / 2, 0, 1)
    iIntervalFactor = pow(1 - iDensityNormalized, 1.5)  ; Inverse and non-linear relationship
    
    iInterval = iMinInterval + (iMaxInterval - iMinInterval) * iIntervalFactor
    
    ; Add slight randomization
    iRandomFactor random 0.8, 1.2
    iInterval = iInterval * iRandomFactor
    
    ; Ensure we stay within reasonable bounds
    iInterval = limit(iInterval, iMinInterval, iMaxInterval)
    
    xout iInterval
endop

