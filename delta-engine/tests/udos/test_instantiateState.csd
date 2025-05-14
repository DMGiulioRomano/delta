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
#include "../../udos/selectNextState.udo"
#include "../../udos/initTransitionMatrix.udo"

opcode instantiateState, kkk, kkk
    kDensityClass, kRegisterClass, kMovementClass xin
    
    ; Genera tre numeri casuali tra 0 e 0.999
    kDensityOffset random 0, 0.999
    kRegisterOffset random 0, 0.999
    kMovementOffset random 0, 0.999
    
    ; Somma i valori casuali alle classi discrete
    kDensityContinuous = kDensityClass + kDensityOffset
    kRegisterContinuous = kRegisterClass + kRegisterOffset
    kMovementContinuous = kMovementClass + kMovementOffset
    
    ; Output per debug se necessario
    if gi_debug >= 2 then
        println "instantiateState: Classe [%d,%d,%d] → Istanza [%.3f,%.3f,%.3f]",
               kDensityClass, kRegisterClass, kMovementClass,
               kDensityContinuous, kRegisterContinuous, kMovementContinuous
    endif
    
    xout kDensityContinuous, kRegisterContinuous, kMovementContinuous
endop

instr TestInstantiateState
    initTransitionMatrix
    ideno ,irego, imovo selectNextState
    ktrig metro 10
    if ktrig == 1 then
    kden, kreg, kmov instantiateState ideno,irego,imovo
    endif
endin


</CsInstruments>
<CsScore>
; Run the test instrument
i "TestInstantiateState" 0 0.1
i "TestInstantiateState" + .
i "TestInstantiateState" + .
i "TestInstantiateState" + .
i "TestInstantiateState" + .
e 1
</CsScore>
</CsoundSynthesizer>