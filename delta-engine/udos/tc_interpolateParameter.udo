; Linear interpolation with optional curve shaping
opcode interpolateParameter, i, iiii
    iSourceValue, iTargetValue, iProgress, iCurve xin
    
    ; Apply transition curve if specified (default is linear)
    iMappedProgress = iProgress
    if (iCurve != 0) then
        ; Positive curve = slow start, fast end (ease-in)
        ; Negative curve = fast start, slow end (ease-out)
        if (iCurve > 0) then
            iMappedProgress = pow(iProgress, 1 + iCurve)
        else
            iMappedProgress = 1 - pow(1 - iProgress, 1 - iCurve)
        endif
    endif
    
    ; Perform the interpolation
    iResult = iSourceValue + (iTargetValue - iSourceValue) * iMappedProgress
    
    xout iResult
endop

