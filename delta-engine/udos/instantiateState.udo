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
