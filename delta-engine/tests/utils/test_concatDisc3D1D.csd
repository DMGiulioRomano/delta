<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
giMaxChar init 40
  giNumStati = 13
  giNomiStati ftgen 0, 0, giNumStati, -2, 0
  giCentroidi ftgen 0, 0, giNumStati, -2, 0
  giDensita ftgen 0, 0, giNumStati, -2, 0
  giSpread ftgen 0, 0, giNumStati, -2, 0
  giStatoArmonico ftgen 0, 0, giNumStati, -2, 0
  giNomiBuffer ftgen 0, 0, giNumStati*giMaxChar, -2, 0

; Debug level globale
gi_debug = 2
  ; Macro per schedulare StoreState
  #define AddState(IDX'C'D'S'NAME)#
    schedule "StoreState", 0, 0.1, $IDX, $C, $D, $S, $NAME
  #
  

; =================================================================
; concatDisc3D1D - Riduzione dimensionale 3D a 1D tramite concatenazione discretizzata
; =================================================================
; Riduce tre parametri (centroide, densità, spread) a un singolo valore 
; mediante discretizzazione e concatenazione degli indici.
;
; INPUT:
;   iCentroide - valore del centroide spettrale (0-1)
;   iDensita   - valore della densità armonica (0-1)
;   iSpread    - valore dello spread di ottave (0-1)
;   iLivelliK  - parametro di discretizzazione (opzionale, default=50)
;
; OUTPUT:
;   iStatoArmonico - valore unico normalizzato (0-1)
; =================================================================
opcode concatDisc3D1D, i, iiio
  iCentroide, iDensita, iSpread, iLivelliK xin
  
  ; Imposta valore predefinito per iLivelliK se non specificato
  iLivelliK = (iLivelliK == 0) ? 100 : iLivelliK
  
  ; Assicura che i valori di input siano nell'intervallo [0,1]
  iCentroide = limit(iCentroide, 0, 1)
  iDensita = limit(iDensita, 0, 1)
  iSpread = limit(iSpread, 0, 1)
  
  ; Discretizza ogni parametro in 'iLivelliK' livelli (0 a K-1)
  iCentroideInt = round(iCentroide * (iLivelliK - 1))
  iDensitaInt = round(iDensita * (iLivelliK - 1))
  iSpreadInt = round(iSpread * (iLivelliK - 1))
  
  ; Limita gli indici nel range [0, K-1] per sicurezza
  iCentroideInt = limit(iCentroideInt, 0, iLivelliK - 1)
  iDensitaInt = limit(iDensitaInt, 0, iLivelliK - 1)
  iSpreadInt = limit(iSpreadInt, 0, iLivelliK - 1)
  
  ; Combina gli indici in un valore intero unico
  ; Ordine di importanza: Centroide > Densità > Spread
  iValoreUnicoInt = (iCentroideInt * (iLivelliK * iLivelliK) + 
                     iDensitaInt * iLivelliK + 
                     iSpreadInt)
  
  ; Calcola il valore massimo possibile per la normalizzazione
  iMaxValInt = ((iLivelliK - 1) * (iLivelliK * iLivelliK) + 
                (iLivelliK - 1) * iLivelliK + 
                (iLivelliK - 1))
  
  ; Normalizza il valore nell'intervallo [0, 1]
  iStatoArmonico = (iMaxValInt > 0) ? iValoreUnicoInt / iMaxValInt : 0
  
  ; Debug output se gi_debug ≥ 2
  if gi_debug >= 2 then
    prints "concatDisc3D1D: C:%.3f, D:%.3f, S:%.3f → Indici: (%d,%d,%d) → Val: %d → Stato: %f\n",
           iCentroide, iDensita, iSpread, iCentroideInt, iDensitaInt, iSpreadInt, 
           iValoreUnicoInt, iStatoArmonico
  endif
  
  xout iStatoArmonico
endop


  instr StoreState
    iIndex = p4
    iC = p5
    iD = p6
    iS = p7
    Sname strget p8
    iLivelliK = 100 ;default
    
    ; Calcola stato armonico
    iState concatDisc3D1D iC, iD, iS, iLivelliK
    
    ; Memorizza valori nelle tabelle
    tabw_i iC, iIndex, giCentroidi
    tabw_i iD, iIndex, giDensita
    tabw_i iS, iIndex, giSpread
    tabw_i iState, iIndex, giStatoArmonico
    tabw_i iIndex, iIndex, giNomiStati
    
    ; Memorizza nome nella tabella di buffer
    iBasePtr = iIndex * giMaxChar
    iIdx = 0
    iStrLen strlen Sname
    iMaxStore = min(iStrLen, giMaxChar-1)
    
    while iIdx < iMaxStore do
      iCharCode strchar Sname, iIdx
      tabw_i iCharCode, iBasePtr + iIdx, giNomiBuffer
      iIdx += 1
    od
  endin
; =================================================================
; Strumento di test per concatDisc3D1D
; =================================================================

instr TestConcatDisc
  ; Parametri di test
    iLivelliK = 100 ; default
  ; Valori B,M,A per i test (equivalenti a quelli del codice Python)
  iValB = 0.1
  iValM = 0.5
  iValA = 0.9
  
  ; Crea una tabella per memorizzare risultati: nome, C, D, S, stato_armonico
  
  ; Buffer per stringhe
  giMaxChar = 40
  
  ; ---- Definisci nomi degli stati e crea una funzione per memorizzarli ----
  iStCount = 0
  
  ; Funzione per memorizzare stato

  
  ; ---- Definisci stati simili al codice Python ----
  
  $AddState(0' 0.0' 0.0' 0.0' "Minimo (0,0,0)")
  $AddState(1' iValB' iValB' iValB' "B-B-B (D:0.1,S:0.1,C:0.1)")
  $AddState(2' iValM' iValM' iValM' "M-M-M (D:0.5,S:0.5,C:0.5)")
  $AddState(3' iValA' iValA' iValA' "A-A-A (D:0.9,S:0.9,C:0.9)")
  $AddState(4' 1.0' 1.0' 1.0' "Massimo (1,1,1)")
  
  $AddState(5' 0.0' 0.0' 1.0' "Solo Centroide Alto (D:0,S:0,C:1)")
  $AddState(6' 1.0' 0.0' 0.0' "Solo Densita Alta (D:1,S:0,C:0)")
  $AddState(7' 0.0' 1.0' 0.0' "Solo Spread Alto (D:0,S:1,C:0)")
  
  $AddState(8' 0.5' 0.5' 0.78' "Quasi Uguali 1a (D:0.5,S:0.5,C:0.78)")
  $AddState(9' 0.5' 0.5' 0.81' "Quasi Uguali 1b (D:0.5,S:0.5,C:0.81)")
  
  $AddState(10' 0.5' 0.23' 0.5' "Quasi Uguali 2a (D:0.5,S:0.23,C:0.5)")
  $AddState(11' 0.5' 0.28' 0.5' "Quasi Uguali 2b (D:0.5,S:0.28,C:0.5)")
  
  
  ; ---- Stampa risultati ----
  prints "\n--- Calcolo Stati Armonici Unici (k=%d) ---\n", iLivelliK
  
  iIdx = 0
  while iIdx < giNumStati do
    ; Ottieni parametri
    iC tab_i iIdx, giCentroidi
    iD tab_i iIdx, giDensita
    iS tab_i iIdx, giSpread
    iSA tab_i iIdx, giStatoArmonico
    
    ; Ottieni nome
    iBasePtr = iIdx * giMaxChar
    SName = ""
    iCharIdx = 0
    while iCharIdx < giMaxChar-1 do
      iCharCode tab_i iBasePtr + iCharIdx, giNomiBuffer
      if iCharCode != 0 then
        SName strcat SName, sprintf("%c", iCharCode)
      endif
      iCharIdx += 1
    od
    
    ; Calcola indici discreti per debug
    iC_int = round(iC * (iLivelliK - 1))
    iD_int = round(iD * (iLivelliK - 1))
    iS_int = round(iS * (iLivelliK - 1))
    iC_int = limit(iC_int, 0, iLivelliK - 1)
    iD_int = limit(iD_int, 0, iLivelliK - 1)
    iS_int = limit(iS_int, 0, iLivelliK - 1)
    iVal_int = (iC_int * (iLivelliK * iLivelliK) + iD_int * iLivelliK + iS_int)
    
    ; Stampa informazioni
    prints "%-40s | C,D,S: (%.2f,%.2f,%.2f) -> Cds_int: (%d,%d,%d) -> Val_int: %d -> SA_unico: %f\n",
           SName, iC, iD, iS, iC_int, iD_int, iS_int, iVal_int, iSA
    
    iIdx += 1
  od
  
  ; ---- Analisi conflitti di discretizzazione ----
  prints "\n--- Analisi 'Conflitti di Discretizzazione' (Stati Definiti con stesso SA_unico) ---\n"
  
  ; Crea una mappa per raggruppare gli stati per valore armonico arrotondato
  iPrecisionGrouping = 8  ; Precisione di arrotondamento per il confronto
  giNumBuckets = 100
  giBuckets ftgen 0, 0, giNumBuckets, -2, 0  ; Tabella per tenere traccia dei gruppi
  
  ; Inizializza giBuckets a -1 (vuoto)
  iBucketIdx = 0
  while iBucketIdx < giNumBuckets do
    tabw_i -1, iBucketIdx, giBuckets
    iBucketIdx += 1
  od
  
  ; Raggruppa stati per valore SA arrotondato
  iIdx = 0
  giNumConflicts = 0
  
  while iIdx < giNumStati do
    iSA tab_i iIdx, giStatoArmonico
    iSARounded = round(iSA * 10^iPrecisionGrouping) / 10^iPrecisionGrouping
    
    ; Cerca un bucket per questo valore arrotondato
    iBucketIdx = 0
    iBucketFound = 0
    iBucketUsedIdx = -1
    
    while iBucketIdx < giNumBuckets && iBucketFound == 0 do
      iBucketVal tab_i iBucketIdx, giBuckets
      
      if iBucketVal == -1 then
        ; Bucket libero, crea nuovo gruppo
        tabw_i iSARounded, iBucketIdx, giBuckets
        iBucketFound = 1
        iBucketUsedIdx = iBucketIdx
      elseif iBucketVal == iSARounded then
        ; Bucket esistente per questo valore
        iBucketFound = 1
        iBucketUsedIdx = iBucketIdx
        giNumConflicts += 1
      endif
      
      iBucketIdx += 1
    od
    
    ; Se non abbiamo trovato un bucket, ne creiamo uno nuovo
    if iBucketFound == 0 then
      prints "ERRORE: Non è stato possibile trovare un bucket libero per %.8f\n", iSARounded
    endif
    
    iIdx += 1
  od
  
  ; Ora stampa i conflitti
  if giNumConflicts > 0 then
    ; Stampa dettagli dei conflitti
    iBucketIdx = 0
    while iBucketIdx < giNumBuckets do
      iBucketVal tab_i iBucketIdx, giBuckets
      
      if iBucketVal != -1 then
        ; Conta quanti stati hanno questo valore
        iCount = 0
        iStateIdx = 0
        while iStateIdx < giNumStati do
          iSA tab_i iStateIdx, giStatoArmonico
          iSARounded = round(iSA * 10^iPrecisionGrouping) / 10^iPrecisionGrouping
          
          if iSARounded == iBucketVal then
            iCount += 1
          endif
          
          iStateIdx += 1
        od
        
        ; Se più di uno stato ha questo valore, è un conflitto
        if iCount > 1 then
          prints "SA_unico: %.4f generato da %d stati:\n", iBucketVal, iCount
          
          ; Stampa dettagli di ogni stato in conflitto
          iStateIdx = 0
          while iStateIdx < giNumStati do
            iSA tab_i iStateIdx, giStatoArmonico
            iSARounded = round(iSA * 10^iPrecisionGrouping) / 10^iPrecisionGrouping
            
            if iSARounded == iBucketVal then
              ; Ottieni parametri
              iC tab_i iStateIdx, giCentroidi
              iD tab_i iStateIdx, giDensita
              iS tab_i iStateIdx, giSpread
              
              ; Calcola indici discreti per debug
              iC_int = round(iC * (iLivelliK - 1))
              iD_int = round(iD * (iLivelliK - 1))
              iS_int = round(iS * (iLivelliK - 1))
              iC_int = limit(iC_int, 0, iLivelliK - 1)
              iD_int = limit(iD_int, 0, iLivelliK - 1)
              iS_int = limit(iS_int, 0, iLivelliK - 1)
              
              ; Ottieni nome
              iBasePtr = iStateIdx * giMaxChar
              SName = ""
              iCharIdx = 0
              while iCharIdx < giMaxChar-1 do
                iCharCode tab_i iBasePtr + iCharIdx, giNomiBuffer
                if iCharCode != 0 then
                  SName strcat SName, sprintf("%c", iCharCode)
                endif
                iCharIdx += 1
              od
              
              prints "  - %s (C:%.2f, D:%.2f, S:%.2f) -> Indici C,D,S: (%d,%d,%d)\n",
                     SName, iC, iD, iS, iC_int, iD_int, iS_int
            endif
            
            iStateIdx += 1
          od
        endif
      endif
      
      iBucketIdx += 1
    od
  else
    prints "Nessuno degli stati definiti ha prodotto lo stesso SA_unico con k = %d\n", iLivelliK
  endif
  
  turnoff
endin

; =====================================================
; Strumento principale per avviare tutti i test
; =====================================================
instr RunTests
  ; Testa con diversi valori di k
  schedule "TestConcatDisc", 0, 1  ; Test con k=10
  schedule "TestConcatDisc", 1, 1  ; Test con k=50 (default)
  schedule "TestConcatDisc", 2, 1 ; Test con k=100
  turnoff
endin

</CsInstruments>
<CsScore>
i "RunTests" 0 10
e
</CsScore>
</CsoundSynthesizer>