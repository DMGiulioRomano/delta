# Configurazione dei Comportamenti

Questa guida descrive in dettaglio come configurare i parametri dei comportamenti nel sistema di sintesi del suono, basata sull'implementazione in Comportamento.py.

## Struttura Base di un Comportamento

```yaml
comportamenti:
  - cAttacco: 0              # Tempo di attacco
    durataArmonica: 35       # Durata base degli eventi
    ritmo: [3]               # Pattern ritmico
```

## Parametri Configurabili

### 1. Durata
La durata può essere specificata in due modi:

```yaml
# Modo 1: Durata semplice
durata: 10  # Userà 1/ritmo come moltiplicatore

# Modo 2: Durata con randomizzazione
durata: [35, 3]  # Genererà un valore random tra 1 e 3, diviso per il ritmo
```

### 2. Ampiezza
L'ampiezza può essere configurata in due modi:

```yaml
# Modo 1: Ampiezza semplice con dampening default (-0.65)
ampiezza: -14  # Valore in dB

# Modo 2: Ampiezza con dampening personalizzato
ampiezza: [-18, -0.75]  # [ampiezza in dB, fattore di dampening]
```

### 3. Posizione
La posizione determina la collocazione nello spazio stereo:

```yaml
# Modo 1: Centro
posizione: 0  # o omesso - genererà valori random tra 1 e ritmo

# Modo 2: Posizione con offset
posizione: 6  # Positivo - offset a destra
posizione: -5 # Negativo - offset a sinistra
```
Il valore assoluto della posizione influenza il range di randomizzazione in relazione al ritmo.

### 4. Frequenza
La frequenza può essere configurata in due modi principali:

```yaml
# Modo 1: Frequenza statica
frequenza: [2, 5]  # [ottava, regione]

# Modo 2: Frequenza con evoluzione
frequenza: [[2, 5], [2, 5], +5]  # [[ottava1, regione1], [ottava2, regione2], direzione]
```

Dove:
- `ottava`: determina il registro base
- `regione`: determina la suddivisione all'interno dell'ottava
- `direzione`: (opzionale) determina la direzione dell'evoluzione della frequenza

## Esempi Completi

### 1. Comportamento Base
```yaml
comportamenti:
  - cAttacco: 0
    durataArmonica: 35
    ritmo: [3]
    durata: 10
    ampiezza: -14
    frequenza: [2, 5]
    posizione: -2
```

### 2. Comportamento con Evoluzione
```yaml
comportamenti:
  - cAttacco: 17
    durataArmonica: 30
    ritmo: [3, 2]
    durata: [10, 3]
    ampiezza: [-16, -0.8]
    frequenza: [[2, 5], [3, 6], +5]
    posizione: -2
```

### 3. Comportamento Complesso
```yaml
comportamenti:
  - cAttacco: 51
    durataArmonica: 35
    ritmo: [7, 15, 10, 4]
    durata: [35, 3]
    ampiezza: [-25, -0.25]
    frequenza: [[6, 1], [7, 2], +3]
    posizione: -8
```

## Note Importanti

1. **Ritmo**: 
   - Influenza il calcolo della durata effettiva
   - Impatta sulla randomizzazione della posizione
   - Può essere un singolo valore o una lista di valori

2. **Interazione tra Parametri**:
   - La posizione viene modulata dal ritmo
   - La durata effettiva dipende dal ritmo e dalla durataArmonica
   - L'ampiezza viene modificata dal fattore di dampening e dalla posizione

3. **Best Practices**:
   - Iniziare con configurazioni semplici e gradualmente aumentare la complessità
   - Testare l'interazione tra ritmo e posizione con valori piccoli
   - Usare dampening conservativi (-0.65 come default è un buon punto di partenza)
   - Per le frequenze, mantenere coerenza tra ottave e regioni correlate
