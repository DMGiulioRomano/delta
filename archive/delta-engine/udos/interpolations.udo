; Linear interpolation between two values (i-rate only)
opcode linearInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Linear interpolation formula
    iResult = iStartValue + (iEndValue - iStartValue) * iProgress
    
    xout iResult
endop

; Cubic interpolation for smoother transitions (i-rate only)
opcode cubicInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Cubic interpolation formula (smoothstep)
    iSmoothed = iProgress * iProgress * (3 - 2 * iProgress)
    iResult = iStartValue + (iEndValue - iStartValue) * iSmoothed
    
    xout iResult
endop

; Exponential interpolation for parameters that need non-linear changes (i-rate only)
opcode exponentialInterpolate, i, iii
    iStartValue, iEndValue, iProgress xin
    
    ; Ensure progress is between 0 and 1
    iProgress = limit(iProgress, 0, 1)
    
    ; Exponential interpolation formula
    iExponential = (1 - cos(iProgress * $M_PI)) / 2
    iResult = iStartValue + (iEndValue - iStartValue) * iExponential
    
    xout iResult
endop

