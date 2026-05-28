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
    prints "\n========================== open eventoSonoro *INIT-PASS*\n\n"
    iCurrentTime times
    prints "\tk-cycle: %d and a-cycle: %d at abs time: %f\n", iCurrentTime*kr, iCurrentTime*sr, iCurrentTime
    id_evento=p10
    id_comportamento=p11
    i_debug=gi_debug
    ; only for score
    iLastStr=p12
    $DEBUG_Evento_print_Pfields
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
    idirection = (p6>=0 ? 1 : -1);signum(p6)
    
    ; Harmonic and temporal parameters
    iHR = max(1, abs(p7))            ; Prevent zero or negative HR
    iPeriod = $M_PI*2/iHR           ; Full period calculation
    
    ; Initial radius calculation with safety check
    iradi = (iwhichZero > 0 ? (iwhichZero-1) * iPeriod : 0)
    ;--------------------------------------------------------------
    ; Position and Envelope Generation
    ;--------------------------------------------------------------
    ; Position from table lookup
    kndx line 0, p3, 1               ; Normalized time index
    ktab tab kndx, p9,1         ; Table lookup for position
    
    ; Spatial angle calculation
    krad = iradi + (ktab * iPeriod * idirection)
    kdeg = krad*180/$M_PI
    ; Envelope generation
    kEnv = abs(sin(krad*iHR/2))    ; Basic envelope shape
    ;kEnv2 = sin(krad*iHR/2)   ; Basic envelope shape
    ktime timek
    kMinute = int((ktime/kr)/60) 
    kSeconds = ((ktime/kr)%60)
    ;printks "kEnv %.4f evento %d\n", .01, kEnv, id_evento
    ;printks "kEnv2 %.4f evento %d\n", .01, kEnv, id_evento
    if gi_debug >=6 then
    Sdir = "./docs/printEnv"
    ;i_tmp_res system_i 1, sprintf("mkdir -p %s",Sdir)
    ;Sname sprintf "%s/printEnv%d.data", Sdir,id_evento
    ;fprintks Sname, "\tkrad %.4f\n", krad
    ;fprintks Sname, "kdeg %.4f\n", kdeg
    ;fprintks Sname, "iPeriod radiants %.4f\n", iPeriod
    ;fprintks Sname, "iPeriod degrees %.4f\n", iPeriod*180/$M_PI
    ;fprintks Sname, "kEnv %.4f\n", kEnv
    ;fprintks Sname, "kEnv %f\n", kEnv
    ;fprintks Sname, "ktime %f\n", ktime
    ;fprintks Sname, "ktime/kr: %f\n", ktime/kr
    ;fprintks Sname, "minutes: %f\n", int((ktime/kr)/60)
    ;fprintks Sname ,"al tempo: %d'%.3f'' valore inviluppo: %.3f envento %d\n",kMinute,kSeconds,kEnv,id_evento
    endif
    ;--------------------------------------------------------------
    ; Sound Generation and Spatialization
    ;--------------------------------------------------------------
    ; Frequency interpolation
    kfreq =ifreq1;line ifreq1, p3, ifreq2
    
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
    
    outs aL, aR
    prints "\n========================== open eventoSonoro *INIT-PASS*\n\n"

endin
