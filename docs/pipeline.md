# Pipeline

Due stadi:

```
[1] generator      compositions/sezioni/sezioneX.yaml   (algoritmico)
        |
        v
[2] builder        csound/generazione/*.csd             (renderer)
        |
        v
[3] csound         csound/generazione/wav/*.wav
        |
        v
[4] reaper         post-produzione
```

## Comandi

| Target | Cosa fa |
|---|---|
| `make py YAML=brano SEZIONE=sezione1` | Renderizza una sezione: YAML -> CSD |
| `make py YAML=brano` | Tutte le sezioni del brano |
| `make csound` | Esegue Csound su ogni `.csd` in `csound/generazione/` |
| `make run` | Apre cartella WAV + Reaper |
| `make all` | `py csound run` in sequenza |
| `make clean` | Rimuove output + `__pycache__` |

## Generator (opzionale, sperimentale)

`src/delta/generator/` produce YAML algoritmicamente da uno stato iniziale + perturbazioni (frequency, rhythm). Non collegato al `Makefile` root: invocare manualmente.

```bash
python3.11 -m delta.generator.main
```

Output: `compositions/sezioni/sezioneX.yaml`. Poi `make py SEZIONE=sezioneX`.

## Setup

```bash
pip install -e .
make py
```
