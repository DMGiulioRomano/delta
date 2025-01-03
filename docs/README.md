# Documentazione del Sistema di Sintesi

## Struttura dei File YAML

### Brano
```yaml
brano:
  titolo: "nome_brano"
  attacco: 3           # Attacco globale del brano
  durata:
    minuti: 8
    secondi: 0
  forma:
    - onOff: true/false  # Attiva/disattiva il sistema di forma
    [configurazione forma...]
  dimensioni:
    frequenze:
      - "PythagoreanSystem"
      - 200               # Frequenza fondamentale
      - 10                # Divisioni per ottava
```

### Comportamenti
I comportamenti definiscono gli eventi sonori. Ogni parametro può essere configurato in modi diversi:

```yaml
comportamenti:
  - cAttacco: 0              # Tempo di attacco
    durataArmonica: 35       # Durata base degli eventi
    ritmo: [3]               # Pattern ritmico (singolo o array)
    durata:                  # Due possibili configurazioni:
      10                     # 1. Numero singolo (usa 1/ritmo)
      [35, 3]               # 2. [durata, random_max] (random(1,3)/ritmo)
    ampiezza:                # Due possibili configurazioni:
      -14                    # 1. Valore in dB (dampening default -0.65)
      [-18, -0.75]          # 2. [ampiezza_dB, dampening]
    frequenza:               # Due possibili configurazioni:
      [2, 5]                # 1. [ottava, regione]
      [[2,5], [2,5], +5]    # 2. [[ottava1,regione1], [ottava2,regione2], direzione]
    posizione:               # Configurazioni possibili:
      0                      # Centro (random 1 a ritmo)
      6                      # Positivo - offset destra
      -5                     # Negativo - offset sinistra
```

### Forma
La forma può essere configurata in due modalità:

#### 1. Modalità Manuale (onOff: false)
```yaml
forma:
  - onOff: false
# I tempi sono gestiti direttamente dai comportamenti
```

#### 2. Modalità Automatica (onOff: true)
```yaml
forma:
  - onOff: true
  - grandezza: 0.5           # Durata relativa della sezione
    punti:                   # Punti di controllo dell'inviluppo
      - [0, 0.0001, "Expon"] # [tempo_relativo, ampiezza, tipo_curva]
      - [0.4, 0.5, "Line"]
      - [0.7, 0.7, "Log"]
  - grandezza: 0.3
    punti:
      [...]
```

Tipi di curve disponibili:
- "Line": interpolazione lineare
- "Expon": curva esponenziale
- "Log": curva logaritmica

## Sistema di Pipeline

1. Lettura file YAML
2. Costruzione struttura del brano
3. Gestione della forma:
   - Se onOff false: usa tempi assoluti dai comportamenti
   - Se onOff true: calcola tempi relativi e scala le sezioni
4. Generazione eventi sonori
5. Creazione file CSD
6. Sintesi audio via Csound

## Visualizzazione Plot e Grafici

Dal main.py è possibile attivare diverse visualizzazioni decommentando le relative righe:

```python
# Visualizzazioni disponibili:
brano.spazio.genera_e_plotta_con_slider_esponente_globale()  # Plot interattivo con slider dell'esponente
brano.spazio.genera_e_plotta_funzioni()                      # Plot delle funzioni sinusoidali
brano.spazio.plot_sinusoide_smorzata()                       # Plot della sinusoide con smorzamento
brano.spazio.genera_e_plotta_polare_sine()                   # Plot polare delle funzioni seno
brano.spazio.genera_e_plotta_polare_cosine()                 # Plot polare delle funzioni coseno
```

Ogni visualizzazione fornisce:
- `genera_e_plotta_con_slider_esponente_globale()`: Grafico interattivo con slider per modificare l'esponente globale
- `genera_e_plotta_funzioni()`: Visualizza le funzioni sin(x * i / 2) per i in range(1, 11)
- `plot_sinusoide_smorzata()`: Mostra una sinusoide con coefficiente di smorzamento variabile
- `genera_e_plotta_polare_sine()`: Grafico polare delle funzioni seno con slider interattivo
- `genera_e_plotta_polare_cosine()`: Grafico polare delle funzioni coseno con slider interattivo

## Note Importanti

### Comportamenti
- Il ritmo influenza durata e posizione
- L'ampiezza viene modulata dal dampening e posizione
- Le frequenze possono evolvere nel tempo con direzione

### Forma
- In modalità automatica (onOff: true):
  - Le sezioni devono essere nominate sequenzialmente (sezione1, sezione2, ...)
  - I tempi vengono scalati in base alla durata totale
  - La somma delle grandezze non dovrebbe superare 1.0

### Debug e Visualizzazione
- Usa `plotta_funzione()` della classe Forma per visualizzare l'inviluppo
- I file CSD generati sono nella cartella csound/generazione
- Output audio in csound/generazione/wav

## Esempi
Vedi la cartella `esempi/` per configurazioni complete di:
- Comportamenti base
- Evoluzione timbrica
- Movimenti spaziali
- Strutture temporali complesse
