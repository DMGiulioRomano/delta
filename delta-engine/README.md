# Delta-Engine: Sistema di Composizione Algoritmica

Delta-Engine è un sistema di composizione algoritmica avanzato basato su Csound che utilizza un modello di transizione di stato per l'evoluzione musicale. Genera composizioni attraverso la transizione tra diversi stati musicali definiti in uno spazio parametrico multidimensionale.

## Concetti Chiave

### Sistema di Transizione basato su Stati

Il sistema concettualizza i comportamenti musicali come punti in uno spazio parametrico multidimensionale, con stati che rappresentano regioni distinte in questo spazio. La composizione evolve transitando tra questi stati seguendo regole specifiche.

### Interpretazione del Ritmo in Delta-Engine

- **Definizione di ritmo**: I numeri rappresentano rapporti temporali tra suoni successivi, non pattern ritmici convenzionali
- **Calcolo temporale**: Una sequenza ritmica [3, 4, 5] genera suoni a distanze temporali di durataArmonica/3, durataArmonica/4, durataArmonica/5
- **Doppia funzione**: I valori ritmici vengono utilizzati anche come indici per accedere alle frequenze nella tabella delle frequenze
- **Accesso alle frequenze**: Indice = Ottava×200 + Registro×20 + Valore ritmico
- **Nota importante**: Il sistema NON stabilisce relazioni tra accordi, progressioni o intervalli

### Parametri Chiave che Definiscono gli Stati

- Densità degli eventi (numero di eventi sovrapposti)
- Distribuzione dei registri (diffusione spettrale)
- Livelli RMS (energia/intensità)
- Movimento spaziale (basato sui valori ritmici)

### Tipi di Transizione

- Transizioni graduali (evoluzione fluida dei parametri)
- Transizioni contrastanti (cambiamenti improvvisi dei parametri)
- Transizioni cicliche (in fase di sviluppo)

### Considerazioni Speciali

- I valori ritmici influenzano sia la struttura temporale che le relazioni di frequenza
- Valori ritmici più alti (es. 30) creano meno movimento spaziale e texture più statiche
- Valori ritmici più bassi creano più movimento spaziale e texture dinamiche
- La relazione tra ritmo e durata armonica determina la struttura temporale effettiva

## Utilizzo del Makefile

Il Makefile fornisce comandi per renderizzare composizioni e generare analisi visualizzate.

### Comandi Disponibili

#### Comandi Base

- `make help`: Visualizza informazioni di aiuto sui comandi disponibili
- `make clean`: Rimuove i file generati e i dati temporanei
- `make cs`: Esegue Csound con il file CSD specificato
- `make venv`: Configura l'ambiente virtuale Python con le dipendenze richieste

#### Comandi di Analisi

- `make analyze`: Genera grafici che visualizzano i dati di sovrapposizione degli eventi
- `make analyze-memory`: Crea visualizzazioni della memoria compositiva
- `make analyze-harmony`: Genera grafici di analisi armonica
- `make analyze-spatial`: Visualizza i dati di movimento spaziale
- `make analyze-all`: Esegue tutti gli script di analisi per generare tutte le visualizzazioni

#### Comandi di Renderizzazione

- `make render`: Pulisce i file temporanei e renderizza la composizione in audio
- `make all`: Renderizza la composizione ed esegue tutte le analisi

## File Generati

Quando esegui i comandi di analisi, vengono generati i seguenti file:

### Analisi della Sovrapposizione (`make analyze`)
- `docs/analysis/plots/overlap_time_series.png`: Serie temporale degli eventi sovrapposti
- `docs/analysis/plots/overlap_heatmap.png`: Heatmap della sovrapposizione degli eventi
- `docs/analysis/plots/overlap_distribution.png`: Distribuzione statistica della sovrapposizione

### Analisi della Memoria (`make analyze-memory`)
- `docs/analysis/plots/memory_combined.png`: Grafico combinato di sovrapposizione ed eventi attivi
- `docs/analysis/plots/memory_heatmap.png`: Heatmap della densità della memoria nel tempo
- `docs/analysis/plots/memory_rolling_analysis.png`: Analisi a finestra mobile della densità
- `docs/analysis/plots/memory_distribution.png`: Distribuzione della densità compositiva

### Analisi Armonica (`make analyze-harmony`)
- `docs/analysis/plots/harmonic_time_series.png`: Serie temporale delle metriche armoniche
- `docs/analysis/plots/octave_distribution.png`: Distribuzione degli eventi per ottava
- `docs/analysis/plots/octave_register_matrix.png`: Heatmap della distribuzione ottava/registro
- `docs/analysis/plots/octave_register_matrix_normalized.png`: Versione normalizzata
- `docs/analysis/plots/overlap_harmony_correlation.png`: Correlazione tra sovrapposizione e densità armonica

### Analisi del Movimento Spaziale (`make analyze-spatial`)
- `docs/analysis/plots/spatial_movement_time_series.png`: Serie temporale del movimento spaziale
- `docs/analysis/plots/spatial_movement_density_correlation.png`: Correlazione con densità armonica
- `docs/analysis/plots/spatial_movement_heatmap.png`: Heatmap del movimento spaziale nel tempo
- `docs/analysis/plots/spatial_movement_distribution.png`: Distribuzione dei valori di movimento
- `docs/analysis/plots/spatial_movement_overlap_comparison.png`: Confronto con sovrapposizione eventi

### Analisi delle Transizioni (Generata automaticamente dopo la renderizzazione)
- `docs/analysis/plots/transition_matrix_heatmap.png`: Heatmap delle probabilità di transizione
- `docs/analysis/plots/density_transition_heatmap.png`: Transizioni di densità semplificate
- `docs/analysis/plots/transition_graph.png`: Grafico a rete delle transizioni di stato
- `docs/analysis/plots/high_probability_transitions.png`: Transizioni più probabili
- `docs/analysis/plots/stationary_distribution.png`: Distribuzione degli stati a lungo termine

## Esempi di Utilizzo

Renderizza una composizione e analizza tutti gli aspetti:
```
make all
```

Genera solo analisi dai dati esistenti:
```
make analyze-all
```

Genera solo l'analisi del movimento spaziale:
```
make analyze-spatial
```

Le visualizzazioni forniscono informazioni sulla struttura compositiva, i pattern di densità, la distribuzione armonica e le caratteristiche spaziali della musica generata.

## Requisiti

- Csound (versione 6.0 o superiore)
- Python 3.6 o superiore
- Librerie Python: matplotlib, numpy, pandas, scipy, seaborn, networkx

## Struttura del Progetto

- `delta-engine/` - Directory principale del progetto
  - `udos/` - User-Defined Opcodes (Opcode definiti dall'utente)
  - `orc/` - Orchestra files (definizioni di strumenti)
  - `docs/` - Script Python per l'analisi e la visualizzazione
  - `MACROS/` - Definizioni di macro Csound
  - `requirements.txt` - Dipendenze Python
  - `main.csd` - File Csound principale
  - `Makefile` - Comandi per la renderizzazione e l'analisi
