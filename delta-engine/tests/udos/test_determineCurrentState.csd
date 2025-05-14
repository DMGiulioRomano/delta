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

#include "../../MACROS/init.orc"

opcode determineCurrentState, kkk, 0
    println "\t\t\t--- open determineCurrentState"
    
    ; Inizializzazione variabili di output
    kDensityState = 0
    kRegisterState = 0
    kMovementState = 0
    
    ; CALCOLO STATO DENSITÀ (CONTINUO, LOGARITMICO)
    ; ----------------------------------------------
    kMinOverlap = 3          ; Valore minimo significativo
    kMaxOverlap = 3*$OTTAVE*$REGISTRI        ; Valore massimo di overlap
    
    ; Applica trasformazione logaritmica sicura
    kSafeOverlap = max(kMinOverlap, gk_current_overlap)
    
    ; Mappiamo log(kSafeOverlap) al range [0,3)
    kLogMin = log(kMinOverlap)
    kLogMax = log(kMaxOverlap)
    kLogRange = kLogMax - kLogMin
    kDensityState = (log(kSafeOverlap) - kLogMin) / kLogRange * 2.999
    kDensityState = limit(kDensityState, 0, 2.999)
    
    ; CALCOLO STATO REGISTRO (CONTINUO, LOGARITMICO CON RIMAPPATURA)
    ; ----------------------------------------------
    ; INVERSIONE DEL VALORE DI SPREAD (alto->basso, basso->alto)
    kInvertedSpread = 1 - gk_current_octave_spread
    
    ;octave spread va da .1 a .9 poerché è ott_attive/$OTTAVE
    kMinRegMap = 10           ; Minimo valore rimappato
    kMaxRegMap = 90         ; Massimo valore rimappato
    
    ; Rimappa octave_spread invertito da [0,1] a [kMinRegMap,kMaxRegMap]
    kMappedSpread = kMinRegMap + kInvertedSpread * (kMaxRegMap - kMinRegMap)
    
    ; Applica trasformazione logaritmica al valore rimappato
    kLogMin = log(kMinRegMap)
    kLogMax = log(kMaxRegMap)
    kLogRange = kLogMax - kLogMin
    kRegisterState = (log(kMappedSpread) - kLogMin) / kLogRange * 2.999
    
/*    ; CALCOLO STATO MOVIMENTO (CONTINUO, LOGARITMICO MODIFICATO)
    ; ----------------------------------------------
    kExponent = 0.3          ; Stesso approccio per il movimento
    
    ; Funzione potenza con esponente < 1
    kMovementState = pow(gk_current_spatial_movement, kExponent) * 2.999
    kMovementState = limit(kMovementState, 0, 2.999)
*/
    ; CALCOLO STATO MOVIMENTO (CONTINUO, LOGARITMICO CON RIMAPPATURA)
    ; ----------------------------------------------
    kMinMovMap = 1           ; Minimo valore rimappato
    kMaxMovMap = 35         ; Massimo valore rimappato
    
    ; Rimappa spatial_movement da [0,1] a [kMinMovMap,kMaxMovMap]
    kMappedMovement = kMinMovMap + gk_current_spatial_movement * (kMaxMovMap - kMinMovMap)
    
    ; Applica trasformazione logaritmica al valore rimappato
    kLogMin = log(kMinMovMap)
    kLogMax = log(kMaxMovMap)
    kLogRange = kLogMax - kLogMin
    kMovementState = (log(kMappedMovement) - kLogMin) / kLogRange * 2.999
    
    ; Limita tutti i valori al range [0,2.999]
    kDensityState = limit(kDensityState, 0, 2.999)
    kRegisterState = limit(kRegisterState, 0, 2.999)
    kMovementState = limit(kMovementState, 0, 2.999)


    ; Debug output
    if gi_debug >= 3 then
        printsk "\t\t\t\tdetermineCurrentState: Input [%.2f, %.2f, %.2f] -> Stati [%.3f, %.3f, %.3f]\n",
               gk_current_overlap, gk_current_octave_spread, gk_current_spatial_movement,
               kDensityState, kRegisterState, kMovementState
    endif
    
    println "\t\t\t--- close determineCurrentState"
    xout kDensityState, kRegisterState, kMovementState
endop

instr TestDetermineCurrentState
    if gk_tc_transition_active == 0 then
        gk_current_overlap = 15
        gk_current_octave_spread = .1
        gk_current_spatial_movement = .5
        kden, kreg, kmov determineCurrentState
        printsk "kden %f kreg %f kmov %f\n", kden, kreg, kmov
        gk_tc_transition_active = 1
    endif
endin


</CsInstruments>
<CsScore>
; Run the test instrument
i "TestDetermineCurrentState" 0 0.1
e 1
</CsScore>
</CsoundSynthesizer>