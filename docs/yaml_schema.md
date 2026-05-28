# Schema YAML

Due livelli: `compositions/brano.yaml` (master) e `compositions/sezioni/sezioneN.yaml` (per sezione).

Delimitatore `# STOP`: tutto cio' che segue viene ignorato durante il parsing (`carica_yaml_con_delimitatore` in `src/delta/__main__.py`).

## `brano.yaml`

```yaml
brano:
  titolo: <stringa>
  attacco: <secondi>
  durata:
    minuti: <int>
    secondi: <int>
  dimensioni: <dict>          # parametri spazio (vedi Spazio.py)
  forma: [<dict>, ...]        # struttura macro (vedi Forma.py)
  sezioni: {}                 # popolato a runtime da __main__.py
```

## `sezioni/sezioneN.yaml`

```yaml
comportamenti:
  - cAttacco: <beat onset>
    durataArmonica: <durata armonica, sec>
    ritmo: [<int>, ...]                      # rapporti temporali
    durata: <sec>
    ampiezza: <dB> | [<dB>] | [<dB>, <dampening>]
    frequenza: [<ottava>, <registro>]
              | [[<ott>, <reg>], [<ott>, <reg>], <shift>]
    posizione: <int> | [<offset>, <Tabella>]
```

### Campi

| Campo | Tipo | Descrizione |
|---|---|---|
| `cAttacco` | numero | Onset del comportamento nella sezione (sec) |
| `durataArmonica` | numero | Riferimento temporale per i ritmi |
| `ritmo` | lista int | Distanze temporali = `durataArmonica / ritmo[i]`. Doppio uso: indice in tabella frequenze |
| `durata` | numero | Durata del comportamento (sec) |
| `ampiezza` | numero o lista | dB. Con lista: `[amp, dampening]` per attenuazione spaziale |
| `frequenza` | lista | `[ottava, registro]` semplice, o `[[start], [end], shift]` per glissando |
| `posizione` | int o lista | Indice spaziale; con `[offset, GEN<NN>]` usa tabella specifica (GEN05/06/07/11) |

### Convenzioni naming

YAML keys: **camelCase italiano** (DSL utente, parte del dominio compositivo). Non normalizzato in snake_case.

Codice Python: **snake_case PEP8**.
