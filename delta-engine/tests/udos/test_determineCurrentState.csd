<CsoundSynthesizer>
<CsOptions>
; Minimal output options
-o dac -d
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

; Debug level
gi_debug init 2

; State classification thresholds
gi_density_thresholds ftgen 0, 0, 4, -2, 0, 3, 7, 1000    ; Sparse, Medium, Dense
gi_register_thresholds ftgen 0, 0, 4, -2, 0, 0.3, 0.7, 1.001 ; Low, Mid, High
gi_movement_thresholds ftgen 0, 0, 4, -2, 0, 0.2, 0.5, 1.001 ; Static, Moderate, Dynamic


gi_current_overlap init 0
gi_current_octave_spread init 0
gi_current_spatial_movement init 0

; determineCurrentState opcode
opcode determineCurrentState, iii, 0    
    
    ; Print threshold tables for debugging
    prints "Density thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_density_thresholds),
           tab_i(1, gi_density_thresholds),
           tab_i(2, gi_density_thresholds),
           tab_i(3, gi_density_thresholds)
    
    prints "Register thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_register_thresholds),
           tab_i(1, gi_register_thresholds),
           tab_i(2, gi_register_thresholds),
           tab_i(3, gi_register_thresholds)
    
    prints "Movement thresholds: [%f, %f, %f, %f]\n",
           tab_i(0, gi_movement_thresholds),
           tab_i(1, gi_movement_thresholds),
           tab_i(2, gi_movement_thresholds),
           tab_i(3, gi_movement_thresholds)
        
    ; Initialize output states
    iDensityState = 0
    iRegisterState = 0
    iMovementState = 0
    
    ; Get number of threshold points (should be 4 in our case, defining 3 regions)
    iDensityThresholdLen = ftlen(gi_density_thresholds)
    iRegisterThresholdLen = ftlen(gi_register_thresholds)
    iMovementThresholdLen = ftlen(gi_movement_thresholds)
    ; IMPROVED: Check if input is below lowest threshold
    if gi_current_overlap < tab_i(0, gi_density_thresholds) then
        iDensityState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_overlap >= tab_i(iDensityThresholdLen-1, gi_density_thresholds) then
        iDensityState = iDensityThresholdLen - 2 ; Last valid state index
    else
        ; Determine density state by checking each threshold pair
        iDensityIdx = 0
        while iDensityIdx < iDensityThresholdLen-1 do
            iLowerBound tab_i iDensityIdx, gi_density_thresholds
            iUpperBound tab_i iDensityIdx+1, gi_density_thresholds
            
            if gi_current_overlap >= iLowerBound && gi_current_overlap < iUpperBound then
                iDensityState = iDensityIdx
                igoto density_done
            endif
            
            iDensityIdx += 1
        od
    endif
    density_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gi_current_octave_spread < tab_i(0, gi_register_thresholds) then
        iRegisterState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_octave_spread >= tab_i(iRegisterThresholdLen-1, gi_register_thresholds) then
        iRegisterState = iRegisterThresholdLen - 2 ; Last valid state index
    else
        ; Determine register state by checking each threshold pair
        iRegisterIdx = 0
        while iRegisterIdx < iRegisterThresholdLen-1 do
            iLowerBound tab_i iRegisterIdx, gi_register_thresholds
            iUpperBound tab_i iRegisterIdx+1, gi_register_thresholds
            
            if gi_current_octave_spread >= iLowerBound && gi_current_octave_spread < iUpperBound then
                iRegisterState = iRegisterIdx
                igoto register_done
            endif
            
            iRegisterIdx += 1
        od
    endif
    register_done:
    
    ; IMPROVED: Check if input is below lowest threshold
    if gi_current_spatial_movement < tab_i(0, gi_movement_thresholds) then
        iMovementState = 0
    ; IMPROVED: Check if input is above highest threshold
    elseif gi_current_spatial_movement >= tab_i(iMovementThresholdLen-1, gi_movement_thresholds) then
        iMovementState = iMovementThresholdLen - 2 ; Last valid state index
    else
        ; Determine movement state by checking each threshold pair
        iMovementIdx = 0
        while iMovementIdx < iMovementThresholdLen-1 do
            iLowerBound tab_i iMovementIdx, gi_movement_thresholds
            iUpperBound tab_i iMovementIdx+1, gi_movement_thresholds
            
            if gi_current_spatial_movement >= iLowerBound && gi_current_spatial_movement < iUpperBound then
                iMovementState = iMovementIdx
                igoto movement_done
            endif
            
            iMovementIdx += 1
        od
    endif
    movement_done:
    
    ; Debug output if requested
    if gi_debug >= 3 then
        prints "determineCurrentState: Input [%.2f, %.2f, %.2f] -> State [%d, %d, %d]\n",
               gi_current_overlap, gi_current_octave_spread, gi_current_spatial_movement,
               iDensityState, iRegisterState, iMovementState
    endif
    xout iDensityState, iRegisterState, iMovementState
endop

instr TestDetermineCurrentState
    prints "\n=== TESTING determineCurrentState with global k-rate values OPCODE ===\n"

    ; Test case 1: Low values (should be state 0)
    gi_current_overlap = 0.5
    gi_current_octave_spread = 0.1
    gi_current_spatial_movement = 0.1
    prints "\nTest case 1: Low values\n"
    iDensityState1, iRegisterState1, iMovementState1 determineCurrentState
    prints "Test case 1 (Low): [%d, %d, %d]\n",iDensityState1, iRegisterState1, iMovementState1
    
    ; Test case 2: Medium values (should be state 1)
    gi_current_overlap = 5
    gi_current_octave_spread = 0.5
    gi_current_spatial_movement = 0.3
    prints "\nTest case 2: Medium values\n"
    iDensityState2, iRegisterState2, iMovementState2 determineCurrentState
    prints "Test case 2 (Med): [%d, %d, %d]\n",iDensityState2, iRegisterState2, iMovementState2
    
    ; Test case 3: High values (should be state 2)
    gi_current_overlap = 10
    gi_current_octave_spread = 0.9
    gi_current_spatial_movement = 0.7
    prints "\nTest case 3: High values\n"
    iDensityState3, iRegisterState3, iMovementState3 determineCurrentState
    prints "Test case 3 (High): [%d, %d, %d]\n", iDensityState3, iRegisterState3, iMovementState3
    
    ; Test case 4: Edge values
    gi_current_overlap = 3    ; Exactly at boundary between states 0 and 1
    gi_current_octave_spread = 0.3 ; Exactly at boundary between states 0 and 1
    gi_current_spatial_movement = 0.5 ; Exactly at boundary between states 1 and 2
    prints "\nTest case 4: Edge values\n"
    iDensityState4, iRegisterState4, iMovementState4 determineCurrentState
    prints "Test case 4 (Edge): [%d, %d, %d]\n", iDensityState4, iRegisterState4, iMovementState4
    
    ; Test case 5: Out of range high values
    gi_current_overlap = 2000
    gi_current_octave_spread = 2.0
    gi_current_spatial_movement = 2.0
    prints "\nTest case 5: Out of range high values\n"
    iDensityState5, iRegisterState5, iMovementState5 determineCurrentState 
    prints "Test case 5 (Over): [%d, %d, %d]\n", iDensityState5, iRegisterState5, iMovementState5
    
    ; Test case 6: Negative values (shouldn't happen but test anyway)
    gi_current_overlap = -5
    gi_current_octave_spread = -0.1
    gi_current_spatial_movement = -0.2
    prints "\nTest case 6: Negative values\n"
    iDensityState6, iRegisterState6, iMovementState6 determineCurrentState 
    prints "Test case 6 (Neg): [%d, %d, %d]\n", iDensityState6, iRegisterState6, iMovementState6
    
    turnoff
endin

</CsInstruments>
<CsScore>
; Run the test instrument
i "TestDetermineCurrentState" 0 0.1
e 1
</CsScore>
</CsoundSynthesizer>