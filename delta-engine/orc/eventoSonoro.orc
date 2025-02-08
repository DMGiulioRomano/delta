;==================================================================
; Spatialized Synthesis Instrument
;==================================================================
; p1 - instrument number (1)
; p2 - start time
; p3 - duration
; p4 - amplitude (dB)
; p5 - starting frequency 
; p6 - spatial position (whichZero * direction)
; p7 - harmonic ratio (HR)
; p8 - ending frequency
; p9 - function table number for position
;==================================================================

instr eventoSonoro
    i_debug = gi_debug
    ktim timeinsts				;read time 
    if i_debug == 1 || i_debug == 2 then
        prints "\n\t\t\tevento sonoro"   
        prints "\nattacco: %f\ndurata: %f\namp: %f\nfreq1: %f\nwz: %f\ndir: %f\nHR: %f\nfreq2: %f\nifn: %f\nid_evento: %f\n\n", p2, p3, p4, p5, p6, signum(p6),p7, p8, p9, p10    
    endif
    ;--------------------------------------------------------------
    ; Parameter Initialization and Validation
    ;--------------------------------------------------------------
    ; Amplitude conversion and limiting
    iamp = ampdbfs(p4)
    iamp = limit(iamp, -$MAX_AMP, $MAX_AMP)
    
    ; Frequency parameters
    ifreq1 = limit(p5, 20, sr/2)     ; Starting frequency with bounds
    ifreq2 = limit(p8, 20, sr/2)     ; Ending frequency with bounds
    
    ; Spatial parameters
    iwhichZero = abs(p6)
    idirection = signum(p6)
    
    ; Harmonic and temporal parameters
    iHR = max(1, abs(p7))            ; Prevent zero or negative HR
    iPeriod = $M_PI*2/iHR           ; Full period calculation
    
    ; Initial radius calculation with safety check
    iradi = (iwhichZero > 0 ? (iwhichZero-1) * iPeriod : 0)
    ifn = p9
    id_evento=p10
    ;--------------------------------------------------------------
    ; Position and Envelope Generation
    ;--------------------------------------------------------------
    ; Position from table lookup
    kndx line 0, p3, 1               ; Normalized time index
    ktab table kndx, ifn, 1           ; Table lookup for position
    
    ; Spatial angle calculation
    krad = iradi + (ktab * iPeriod * idirection)
    
    ; Envelope generation
    kEnv = abs(sin(krad*iHR/2))     ; Basic envelope shape
    if i_debug == 2 then
      printks "\ninviluppo: %f della funzione: %d instr: %d, tempo: %f\n", 0.5, kEnv, ifn, id_evento, ktim 
    endif
    ;--------------------------------------------------------------
    ; Sound Generation and Spatialization
    ;--------------------------------------------------------------
    ; Frequency interpolation
    kfreq line ifreq1, p3, ifreq2
    
    ; Main oscillator
    as poscil3 iamp, kfreq
    asEnv = as * kEnv
    ; Spatial encoding
    kMid = cos(krad)
    kSide = sin(krad)
    
    ; Apply spatialization
    aMid = kMid * asEnv 
    aSide = kSide * asEnv
    
    ;--------------------------------------------------------------
    ; Output Stage
    ;--------------------------------------------------------------
    ; Convert to L-R with normalization
    aL = (aMid + aSide) / $SQRT2
    aR = (aMid - aSide) / $SQRT2
    
    ; Safety limiting
    ;aL = limit(aL, -$MAX_AMP, $MAX_AMP)
    ;aR = limit(aR, -$MAX_AMP, $MAX_AMP)
    
    outs aL, aR
endin
