; Linear interpolation with optional curve shaping
opcode interpolateParameter, k, iikk
    iSourceValue, iTargetValue, kProgress, kCurve xin
    
    ; Apply transition curve if specified (default is linear)
    kMappedProgress = kProgress
    if (kCurve != 0) then
        ; Positive curve = slow start, fast end (ease-in)
        ; Negative curve = fast start, slow end (ease-out)
        if (kCurve > 0) then
            kMappedProgress = pow(kProgress, 1 + kCurve)
        else
            kMappedProgress = 1 - pow(1 - kProgress, 1 - kCurve)
        endif
    endif
    
    ; Perform the interpolation
    kResult = iSourceValue + (iTargetValue - iSourceValue) * kMappedProgress
    
    xout kResult
endop

