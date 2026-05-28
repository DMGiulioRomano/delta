# Sistema di Composizione Algoritmica Musicale

Questo progetto implementa un sistema di composizione algoritmica musicale che genera sequenze di stati musicali attraverso perturbazioni e validazioni. Il sistema è scritto in Python e utilizza un approccio basato su stati e perturbazioni per generare composizioni musicali.

## Struttura del Progetto

```
.
├── src/
│   ├── core/
│   │   ├── composition.py       # Logica principale di composizione
│   │   ├── perturbations/      # Implementazioni delle perturbazioni
│   │   │   ├── base.py
│   │   │   ├── frequency.py
│   │   │   └── rhythm.py
│   │   └── types.py
│   ├── models/
│   │   ├── musical_state.py    # Definizione dello stato musicale
│   │   └── perturbation_result.py
│   └── utils/
│       ├── constants.py        # Costanti di sistema
│       ├── decorators.py       # Decoratori per logging
│       └── yaml_utils.py       # Utility per gestione YAML
├── tests/
│   ├── conftest.py            # Configurazione test
│   └── unit/
│       └── test_musical_state.py
├── main.py                    # Entry point
├── Makefile                   # Gestione build e test
└── requirements-test.txt      # Dipendenze per testing
```

## Prerequisiti

- Python 3.11
- virtualenv (per l'ambiente virtuale)
- Make (per l'utilizzo del Makefile)

## Setup del Progetto

Il progetto utilizza un Makefile per automatizzare le operazioni comuni. Ecco i principali comandi disponibili:

1. Creazione dell'ambiente virtuale:
```bash
make venv
```

2. Installazione dipendenze di sviluppo:
```bash
make install-dev
```

3. Attivazione dell'ambiente virtuale:
```bash
source venv/bin/activate
```

## Comandi Make Disponibili

Il Makefile fornisce diversi target utili per lo sviluppo:

- `make run`: Esegue il programma principale
- `make test`: Esegue tutti i test
- `make test-unit`: Esegue solo i test unitari
- `make test-integration`: Esegue i test di integrazione
- `make test-e2e`: Esegue i test end-to-end
- `make coverage`: Genera report di coverage dei test
- `make lint`: Esegue controlli di lint e type checking
- `make format`: Formatta il codice usando black
- `make clean`: Rimuove file temporanei e cache
- `make check`: Esegue format, lint e coverage in sequenza

## Funzionamento del Sistema

Il sistema si basa su alcuni concetti chiave:

1. **Stato Musicale** (`StatoMusicale`): Rappresenta un momento musicale con proprietà come:
   - cAttacco: momento di inizio
   - durataArmonica: durata dell'armonia
   - ritmo: pattern ritmico
   - frequenza: informazioni sulla frequenza
   - ampiezza: volume
   - posizione: posizionamento spaziale

2. **Perturbazioni**: Modificano lo stato musicale secondo regole specifiche:
   - `RhythmPerturbation`: Modifica i pattern ritmici
   - `FrequencyPerturbation`: Altera le frequenze

3. **Composizione**: Il processo di composizione:
   - Parte da uno stato iniziale
   - Applica perturbazioni successive
   - Valida gli stati risultanti
   - Genera un file YAML con la sequenza di stati

## Utilizzo Base

1. Definire uno stato musicale iniziale:
```python
stato_iniziale = StatoMusicale(
    cAttacco=0.0,
    durataArmonica=26.0,
    ritmo=[3, 4, 5],
    durata=11.0,
    ampiezza=[-20.0],
    frequenza=[2, 1],
    posizione=2
)
```

2. Creare un compositore:
```python
compositore = ComposizioneAlgoritmica(
    stato_iniziale=stato_iniziale,
    dt=1.0,
    durata_totale=50.0,
    debug_level=0
)
```

3. Generare la composizione:
```python
compositore.componi()
compositore.genera_yaml('output.yaml')
```

## Testing

Il progetto include una suite di test completa. Per eseguire i test:

```bash
# Tutti i test
make test

# Solo test unitari
make test-unit

# Con coverage
make coverage
```

## Note di Sviluppo

- Il sistema usa il type checking statico con mypy
- La formattazione del codice è gestita con black
- Il linting è fatto con pylint
- I test sono scritti usando pytest

## Output

Il sistema genera file YAML che contengono la sequenza degli stati musicali. Questi file possono essere successivamente processati per generare la musica effettiva o visualizzazioni.

## Licenza

[Inserire informazioni sulla licenza]
