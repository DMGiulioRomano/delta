<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Essential constants and globals
#define OTTAVE          #10#
#define NUMEVENTI       #1000#

; Debug level
gi_debug init 1
gi_NUMEVENTI init 1000
; Include just the essential utilities
#include "udos/utils.udo"
#include "udos/stateMapping.udo"

instr TestMapStateToParameter
    prints "\n=== Testing mapStateToParameter ===\n\n"
    
    ; Test mapping for density parameter
    prints "DENSITY PARAMETER MAPPING:\n"
    prints "-------------------------\n"
    prints "State | Min | Max\n"
    prints "---------------------\n"
    
    iState = 0
    while iState <= 2 do
        iMin, iMax mapStateToParameter iState, "density"
        prints "  %d   | %3d | %3d\n", iState, iMin, iMax
        iState += 1
    od
    
    ; Test mapping for register parameter
    prints "\nREGISTER PARAMETER MAPPING:\n"
    prints "-------------------------\n"
    prints "State | Min | Max\n"
    prints "---------------------\n"
    
    iState = 0
    while iState <= 2 do
        iMin, iMax mapStateToParameter iState, "register"
        prints "  %d   | %3d | %3d\n", iState, iMin, iMax
        iState += 1
    od
    
    ; Test mapping for movement parameter
    prints "\nMOVEMENT PARAMETER MAPPING:\n"
    prints "-------------------------\n"
    prints "State | Min | Max\n"
    prints "---------------------\n"
    
    iState = 0
    while iState <= 2 do
        iMin, iMax mapStateToParameter iState, "movement"
        prints "  %d   | %3d | %3d\n", iState, iMin, iMax
        iState += 1
    od
    
    ; Test edge cases
    prints "\nEDGE CASES:\n"
    prints "-------------------------\n"
    
    iMin, iMax mapStateToParameter -1, "density"
    prints "State -1 (density): Min=%d, Max=%d\n", iMin, iMax
    
    iMin, iMax mapStateToParameter 3, "register"
    prints "State 3 (register): Min=%d, Max=%d\n", iMin, iMax
    
    ; Test invalid parameter type (should default to 0,0 or handle gracefully)
    iMin, iMax mapStateToParameter 1, "invalid_type"
    prints "Invalid type: Min=%d, Max=%d\n", iMin, iMax
    
    turnoff
endin

</CsInstruments>
<CsScore>
i "TestMapStateToParameter" 0 0.1
e
</CsScore>
</CsoundSynthesizer>