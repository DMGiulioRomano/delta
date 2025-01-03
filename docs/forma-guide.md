# Guida alla Configurazione della Forma

La forma nel sistema di sintesi determina la struttura temporale del brano. Può essere utilizzata in due modi distinti: manuale (onOff: false) o automatico (onOff: true).

## Modalità di Funzionamento

### 1. Modalità Manuale (onOff: false)

In questa modalità, la struttura temporale è definita direttamente nei comportamenti di ogni sezione.

```yaml
forma:
  - onOff: false
# Il resto della forma viene ignorato

sezioni:
  sezione1:
    comportamenti:
      - cAttacco: 0     # Tempo assoluto
        durataArmonica: 35
        # altri parametri...
      - cAttacco: 14    # Tempo assoluto
        durataArmonica: 35
        # altri parametri...
```

Caratteristiche:
- Gli attacchi sono tempi assoluti
- Non c'è scaling temporale automatico
- Le sezioni possono sovrapporsi liberamente
- I comportamenti mantengono i loro tempi esatti

### 2. Modalità Automatica (onOff: true)

In questa modalità, la forma definisce la struttura temporale globale del brano.

```yaml
forma:
  - onOff: true
  - grandezza: 0.5    # Occupa 50% del tempo disponibile
    punti:
      - [0, 0.0001, "Expon"]    # [tempo, ampiezza, tipo curva]
      - [0.4, 0.5, "Line"]
      - [0.7, 0.7, "Log"]
      - [0.99, 0.001, "Expon"]
  - grandezza: 0.3    # Occupa 30% del tempo disponibile
    punti:
      - [0.01, 0.01, "Line"]
      - [0.5, 0.6, "Line"]
      # altri punti...
```

Caratteristiche:
- Le sezioni vengono scalate automaticamente
- I tempi sono relativi alla durata totale del brano
- Le sezioni devono essere nominate sequenzialmente (sezione1, sezione2, etc.)
- Ogni sezione ha una grandezza relativa che determina la sua durata

## Struttura della Forma

### 1. Definizione delle Sezioni
Ogni sezione nella forma automatica richiede:

```yaml
- grandezza: 0.5    # Proporzione della durata totale
  punti:
    - [tempo_relativo, ampiezza, tipo_curva]
```

Dove:
- `tempo_relativo`: valore tra 0 e 1
- `ampiezza`: valore dell'inviluppo in quel punto
- `tipo_curva`: "Line", "Expon", o "Log"

### 2. Tipi di Curve Disponibili
- `"Line"`: Interpolazione lineare
- `"Expon"`: Curva esponenziale
- `"Log"`: Curva logaritmica

## Scaling Temporale

Quando onOff è true:
1. Ogni sezione viene scalata per la sua grandezza relativa
2. Gli attacchi dei comportamenti vengono ricalcolati:
   ```python
   attacco_scalato = sezione['attacco'] * durata_totale + attacco_globale
   durata_scalata = sezione['durata'] * durata_totale
   ```

## Esempi Completi

### 1. Forma Manuale
```yaml
forma:
  - onOff: false

sezioni:
  sezione1:
    comportamenti:
      - cAttacco: 0
        durata: 10
        # altri parametri...
  sezione2:
    comportamenti:
      - cAttacco: 8
        durata: 15
        # altri parametri...
```

### 2. Forma Automatica
```yaml
brano:
  durata:
    minuti: 8
    secondi: 0
  forma:
    - onOff: true
    - grandezza: 0.5
      punti:
        - [0, 0.0001, "Expon"]
        - [0.4, 0.5, "Line"]
        - [0.7, 0.7, "Log"]
        - [0.99, 0.001, "Expon"]
    - grandezza: 0.3
      punti:
        - [0.01, 0.01, "Line"]
        - [0.5, 0.6, "Line"]
        - [0.8, 1, "Line"]
        - [1, 0.1, "Line"]

sezioni:
  sezione1:    # Corrisponde alla prima sezione della forma
    comportamenti:
      - cAttacco: 0    # Verrà scalato automaticamente
        # altri parametri...
  sezione2:    # Corrisponde alla seconda sezione della forma
    comportamenti:
      - cAttacco: 0    # Verrà scalato automaticamente
        # altri parametri...
```

## Best Practices

1. **Scelta della Modalità**:
   - Usa onOff: false per strutture temporali precise e complesse
   - Usa onOff: true per strutture proporzionali e scalabili

2. **Forma Automatica**:
   - Assicurati che la somma delle grandezze non superi 1.0
   - Mantieni una sequenza logica nei nomi delle sezioni
   - Usa punti di controllo strategici per le curve

3. **Forma Manuale**:
   - Pianifica attentamente i tempi di attacco
   - Considera le sovrapposizioni tra sezioni
   - Gestisci manualmente le durate totali

4. **Curve**:
   - Usa "Expon" per fade in/out naturali
   - Usa "Line" per transizioni uniformi
   - Usa "Log" per cambiamenti graduali con enfasi iniziale

## Debugging

1. **Verifica della Forma**:
   - La classe Forma include un metodo `plotta_funzione()` per visualizzare l'andamento
   - Usa questo per verificare la forma prima della generazione

2. **Troubleshooting Comune**:
   - Verifica che i nomi delle sezioni corrispondano quando onOff è true
   - Controlla che i tempi relativi siano tra 0 e 1
   - Assicurati che le grandezze siano proporzionate correttamente
