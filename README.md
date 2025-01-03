# Sistema di Sintesi del Suono

## Panoramica del Progetto
Questo progetto implementa un sistema di sintesi del suono basato su Python e Csound. Il sistema permette di generare composizioni musicali attraverso la definizione di strutture parametriche in file YAML, che vengono poi processate per creare file audio.

## Prerequisiti
- Python 3.11
- Csound
- Reaper (per la post-produzione)
- Librerie Python richieste:
  - numpy
  - matplotlib
  - plotly
  - PyYAML

## Installazione
1. Clona il repository
2. Installa le dipendenze Python:
   ```bash
   pip install numpy matplotlib plotly pyyaml
   ```
3. Assicurati che Csound sia installato nel sistema
4. Verifica che Reaper sia installato per la post-produzione

## Struttura del Progetto
```
.
├── csound/
│   ├── comportamento2.csd
│   ├── generazione/
│   └── wav/
├── python/
│   ├── main.py
│   └── funzioni/
├── yaml_dir/
│   ├── brano.yaml
│   └── sezioni/
└── Makefile
```

## Guida all'Utilizzo

### Configurazione Base
1. Definisci la struttura del brano nel file `brano.yaml`
2. Crea le sezioni individuali in `yaml_dir/sezioni/`
3. Usa il Makefile per generare l'audio

### Comandi Make
```bash
# Genera tutto il brano
make

# Genera una sezione specifica
make YAML=brano SEZIONE=sezione1

# Pulisci i file generati
make clean
```

### Struttura YAML
Il sistema utilizza due tipi di file YAML:
- `brano.yaml`: Definisce la struttura globale del brano
- `sezioni/*.yaml`: Definisce i comportamenti specifici di ogni sezione

#### Esempio di struttura brano.yaml:
```yaml
brano:
  titolo: "nome_brano"
  attacco: <valore>
  durata:
    minuti: <valore>
    secondi: <valore>
  forma:
    - onOff: <bool>
    # altre configurazioni...
```

## Documentazione Tecnica

### Classi Principali
- `Brano`: Gestisce la struttura complessiva del brano
- `Sezione`: Implementa una sezione del brano
- `Comportamento`: Definisce i comportamenti sonori
- `EventoSonoro`: Rappresenta un singolo evento sonoro
- `Spazio`: Gestisce lo spazio sonoro
- `PythagoreanSystem`: Implementa il sistema di accordatura pitagorico

### Pipeline di Generazione
1. Parsing dei file YAML
2. Creazione della struttura del brano
3. Generazione dei file CSD
4. Sintesi audio tramite Csound
5. Post-produzione in Reaper

## Note per gli Sviluppatori
- Seguire le convenzioni di naming presenti nel codice
- Testare le modifiche su sezioni individuali prima di generare l'intero brano
- Utilizzare il flag `--sezione` per il debug di sezioni specifiche

## Contribuire al Progetto
1. Fai un fork del repository
2. Crea un branch per la tua feature
3. Committi le tue modifiche
4. Crea una Pull Request

## License
MIT LICENSE