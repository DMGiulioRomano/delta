<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Variabili globali necessarie per il test
gi_current_overlap init 5        ; Sovrapposizione corrente (numero di eventi attivi)
gi_current_octave_spread init 0.6  ; Dispersione ottave (0-1)
gi_current_spectral_centroid init 4.2  ; Centroide spettrale (0-10)
gi_current_spatial_movement init 0.3  ; Movimento spaziale (0-1)

; Crea la tabella di destinazione per le feature normalizzate
gi_asp_context_features ftgen 0, 0, 4, -2, 0, 0, 0, 0  ; 4 valori inizializzati a 0
gi_asp_max_overlap init 300
; La nostra implementazione della funzione da testare
opcode updateContextFeatures, 0, 0
    ; Normalizza le caratteristiche musicali con controlli di sicurezza
    iNormOverlap = limit(gi_current_overlap / gi_asp_max_overlap, 0, 1)  ; Assumendo sovrapposizione max di 10
    iNormSpread = limit(gi_current_octave_spread, 0, 1)  ; Già in range 0-1
    iNormCentroid = limit(gi_current_spectral_centroid / 10, 0, 1) ; Normalizzato a 0-1
    iNormDynamism = limit(gi_current_spatial_movement, 0, 1)  ; Assumendo range 0-1
    
    ; Memorizza il contesto attuale
    tabw_i iNormOverlap, 0, gi_asp_context_features
    tabw_i iNormSpread, 1, gi_asp_context_features
    tabw_i iNormCentroid, 2, gi_asp_context_features
    tabw_i iNormDynamism, 3, gi_asp_context_features
    
    ; Debug output
    prints "\nContesto aggiornato: [%.2f, %.2f, %.2f, %.2f] (normalizzato)\n", 
           iNormOverlap, iNormSpread, iNormCentroid, iNormDynamism
endop

; Strumento per testare la funzione con diversi valori
instr 1
    prints "\n==== TEST UPDATECONTEXTFEATURES - CASO BASE ====\n"
    prints "Valori iniziali prima di updateContextFeatures:\n"
    prints "  overlap = %.2f, spread = %.2f, centroid = %.2f, movement = %.2f\n",
           gi_current_overlap, gi_current_octave_spread, 
           gi_current_spectral_centroid, gi_current_spatial_movement
    
    ; Verifica valori iniziali nella tabella
    iIdx = 0
    prints "Valori nella tabella prima della chiamata:\n  ["
    while iIdx < 4 do
        iVal tab_i iIdx, gi_asp_context_features
        prints "%.2f", iVal
        if iIdx < 3 then
            prints ", "
        endif
        iIdx += 1
    od
    prints "]\n"
    
    ; Chiamata alla funzione da testare
    updateContextFeatures
    
    ; Verifica i valori nella tabella dopo la chiamata
    iIdx = 0
    prints "Valori nella tabella dopo la chiamata:\n  ["
    while iIdx < 4 do
        iVal tab_i iIdx, gi_asp_context_features
        prints "%.2f", iVal
        if iIdx < 3 then
            prints ", "
        endif
        iIdx += 1
    od
    prints "]\n"
    
    prints "Valori attesi normalizzati:\n"
    prints "  overlap = %.2f, spread = %.2f, centroid = %.2f, movement = %.2f\n",
           limit(gi_current_overlap / gi_asp_max_overlap, 0, 1),
           limit(gi_current_octave_spread, 0, 1),
           limit(gi_current_spectral_centroid / 10, 0, 1),
           limit(gi_current_spatial_movement, 0, 1)
           
    prints "==== FINE TEST CASO BASE ====\n"
endin

; Strumento per testare valori estremi
instr 2
    prints "\n==== TEST UPDATECONTEXTFEATURES - VALORI ESTREMI ====\n"
    
    ; Test con valori estremamente alti
    gi_current_overlap = 20          ; Valore alto
    gi_current_octave_spread = 1.5   ; Sopra il massimo (1.0)
    gi_current_spectral_centroid = 15 ; Valore alto
    gi_current_spatial_movement = 2.0 ; Sopra il massimo (1.0)
    
    prints "Valori estremi alti:\n"
    prints "  overlap = %.2f, spread = %.2f, centroid = %.2f, movement = %.2f\n",
           gi_current_overlap, gi_current_octave_spread, 
           gi_current_spectral_centroid, gi_current_spatial_movement
    
    updateContextFeatures
    
    ; Test con valori negativi
    gi_current_overlap = -3          ; Valore negativo
    gi_current_octave_spread = -0.5  ; Valore negativo 
    gi_current_spectral_centroid = -2 ; Valore negativo
    gi_current_spatial_movement = -0.3 ; Valore negativo
    
    prints "\nValori estremi bassi:\n"
    prints "  overlap = %.2f, spread = %.2f, centroid = %.2f, movement = %.2f\n",
           gi_current_overlap, gi_current_octave_spread, 
           gi_current_spectral_centroid, gi_current_spatial_movement
    
    updateContextFeatures
    
    prints "==== FINE TEST VALORI ESTREMI ====\n"
endin

; Strumento per ripristinare i valori normali e fare test finale
instr 3
    prints "\n==== TEST FINALE ====\n"
    
    ; Ripristina valori normali
    gi_current_overlap = 3
    gi_current_octave_spread = 0.4 
    gi_current_spectral_centroid = 7
    gi_current_spatial_movement = 0.8
    
    prints "Valori finali:\n"
    prints "  overlap = %.2f, spread = %.2f, centroid = %.2f, movement = %.2f\n",
           gi_current_overlap, gi_current_octave_spread, 
           gi_current_spectral_centroid, gi_current_spatial_movement
    
    updateContextFeatures
    
    prints "==== FINE TEST ====\n"
endin

</CsInstruments>
<CsScore>
; Esegui i tre test in sequenza
i 1 0 0.1
i 2 0.2 0.1
i 3 0.4 0.1
e
</CsScore>
</CsoundSynthesizer>