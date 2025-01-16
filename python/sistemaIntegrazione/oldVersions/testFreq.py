from dataclasses import dataclass, field
from typing import List, Union, Dict, Tuple
import random

@dataclass
class StatoMusicale:
    cAttacco: float
    durataArmonica: float
    ritmo: List[int]
    durata: float
    ampiezza: Union[float, List[float]]
    frequenza: List[int]  # [ottava, intervallo]
    posizione: Union[int, List[int]]
    resonance_strength: float = 0.0
    resonance_duration: float = 0.0
    resonance_frequencies: List[float] = field(default_factory=list)

def analyze_frequency_history(storia: List[StatoMusicale], n_states: int = 10) -> Dict[Tuple[int, int], float]:
    """
    Analizza gli ultimi n_states stati per calcolare i pesi degli intervalli per ottava.
    """
    # Prendi gli ultimi n stati
    recent_states = storia[-n_states:] if len(storia) > n_states else storia
    
    # Inizializza il conteggio
    interval_counts = {}
    
    # Conta le occorrenze di ogni coppia (ottava, intervallo)
    for state in recent_states:
        ottava, intervallo = state.frequenza
        coord = (ottava, intervallo)
        interval_counts[coord] = interval_counts.get(coord, 0) + 1
    
    # Normalizza i conteggi per ottenere pesi
    total_occurrences = sum(interval_counts.values())
    interval_weights = {coord: count/total_occurrences 
                       for coord, count in interval_counts.items()}
    
    return interval_weights

def calculate_harmonic_alignment(current_state: StatoMusicale, storia: List[StatoMusicale]) -> float:
    """
    Calcola l'allineamento armonico considerando la storia degli intervalli.
    """
    # Ottieni i pesi dalla storia
    interval_weights = analyze_frequency_history(storia)
    
    # Coordinate attuali
    current_ottava, current_intervallo = current_state.frequenza
    current_coord = (current_ottava, current_intervallo)
    
    # Se questa coordinata è già stata molto usata, potrebbe essere il momento di cambiare
    current_weight = interval_weights.get(current_coord, 0)
    
    # Calcola la "saturazione" di questa regione dello spazio delle frequenze
    region_saturation = 0
    for (ottava, intervallo), weight in interval_weights.items():
        # Calcola la distanza dalla posizione corrente
        ottava_distance = abs(ottava - current_ottava)
        interval_distance = abs(intervallo - current_intervallo)
        
        # Peso inversamente proporzionale alla distanza
        if ottava_distance == 0 and interval_distance == 0:
            region_saturation += weight
        else:
            region_saturation += weight / (ottava_distance + interval_distance)
    
    # Normalizza tra 0 e 1
    alignment_score = 1.0 - (region_saturation / len(interval_weights))
    
    return alignment_score

def generate_structured_history(n_states: int = 10):
    history = []
    current_time = 0.0
    
    # Pattern di frequenze che potresti voler testare
    frequency_patterns = [
        # Pattern ascendente nella stessa ottava
        [[0, 1], [0, 3], [0, 5], [0, 7]],
        # Salti tra ottave
        [[0, 5], [1, 5], [2, 5]],
        # Pattern che esplora diversi intervalli
        [[1, 1], [1, 4], [1, 7], [1, 10]]
    ]
    
    current_pattern = []
    for i in range(n_states):
        if not current_pattern:
            current_pattern = random.choice(frequency_patterns).copy()
        
        freq = current_pattern.pop(0)
        
        stato = StatoMusicale(
            cAttacco=current_time,
            durataArmonica=20.0,
            ritmo=[3, 4, 5],
            durata=10.0,
            ampiezza=[-12.0],
            frequenza=freq,
            posizione=2
        )
        
        history.append(stato)
        current_time += 3.0
    
    return history


def visualize_interval_distribution(interval_weights: Dict[Tuple[int, int], float]):
    """
    Crea una visualizzazione della distribuzione degli intervalli come mappa di calore.
    """
    import numpy as np
    import matplotlib.pyplot as plt
    # Crea una matrice 11x10 (per ottave 0-10 e intervalli 1-10)
    distribution = np.zeros((11, 10))
    # Riempi la matrice con i pesi
    for (ottava, intervallo), weight in interval_weights.items():
        distribution[ottava, intervallo-1] = weight
    # Crea la visualizzazione
    plt.figure(figsize=(12, 8))
    plt.imshow(distribution, cmap='hot', aspect='auto')
    plt.colorbar(label='Peso')
    plt.xlabel('Intervallo')
    plt.ylabel('Ottava')
    plt.title('Distribuzione degli Intervalli')
    # Aggiungi le etichette degli assi
    plt.xticks(range(10), [str(i+1) for i in range(10)])
    plt.yticks(range(11), [str(i) for i in range(11)])
    # Aggiungi i valori nella griglia
    for i in range(11):
        for j in range(10):
            if distribution[i, j] > 0:
                plt.text(j, i, f'{distribution[i, j]:.2f}', 
                        ha='center', va='center',
                        color='white' if distribution[i, j] > 0.3 else 'black')
    plt.tight_layout()
    plt.show()

def analyze_grouped_octaves(storia: List[StatoMusicale], n_states: int = 10) -> Dict[str, float]:
    """
    Analizza i pesi delle frequenze raggruppando le ottave in questo modo:
    - Gruppo 1: ottave 0,1,2
    - Gruppo 2: ottave 3,4
    - Gruppo 3: ottave 5,6
    - Gruppo 4: ottave 7,8
    - Gruppo 5: ottava 9
    - Gruppo 6: ottava 10
    """
    # Definizione dei gruppi
    octave_groups = {
        'basse': [0, 1, 2],
        'medio_basse': [3, 4],
        'medie': [5, 6],
        'medio_alte': [7, 8],
        'alte': [9],
        'altissime': [10]
    }
    # Prendi gli ultimi n stati
    recent_states = storia[-n_states:] if len(storia) > n_states else storia    
    # Inizializza conteggi per gruppo
    group_counts = {group_name: 0 for group_name in octave_groups.keys()}
    total_states = len(recent_states)
    # Conta le occorrenze per ogni gruppo
    for state in recent_states:
        ottava = state.frequenza[0]
        for group_name, octaves in octave_groups.items():
            if ottava in octaves:
                group_counts[group_name] += 1
                break
    # Normalizza i conteggi per ottenere pesi
    group_weights = {
        group: count/total_states 
        for group, count in group_counts.items()
    }
    
    return group_weights


def visualize_octave_groups(group_weights: Dict[str, float]):
    """
    Crea una visualizzazione della distribuzione dei pesi per gruppi di ottave.
    """
    import matplotlib.pyplot as plt
    
    # Prepara i dati
    groups = list(group_weights.keys())
    weights = list(group_weights.values())
    
    # Crea il grafico a barre
    plt.figure(figsize=(12, 6))
    
    # Crea le barre con colori diversi per ogni gruppo
    colors = ['#2E86C1', '#3498DB', '#5DADE2', '#85C1E9', '#AED6F1', '#D6EAF8']
    bars = plt.bar(groups, weights, color=colors)
    
    # Personalizza il grafico
    plt.title('Distribuzione dei Pesi per Gruppi di Ottave', pad=20)
    plt.xlabel('Gruppi di Ottave')
    plt.ylabel('Peso (frequenza relativa)')
    
    # Ruota le etichette per maggiore leggibilità
    plt.xticks(rotation=45, ha='right')
    
    # Aggiungi i valori sopra le barre
    for bar in bars:
        height = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2., height,
                f'{height:.3f}',
                ha='center', va='bottom')
    
    # Aggiungi una griglia per facilitare la lettura
    plt.grid(True, axis='y', linestyle='--', alpha=0.7)
    
    # Imposta i limiti dell'asse y da 0 a un valore leggermente superiore al massimo
    plt.ylim(0, max(weights) * 1.2)
    
    # Aggiusta il layout
    plt.tight_layout()
    
    # Mostra il grafico
    plt.show()

def print_group_analysis(group_weights: Dict[str, float]):
    """
    Stampa un'analisi leggibile dei pesi dei gruppi.
    """
    print("\nAnalisi dei gruppi di ottave:")
    print("-" * 40)
    for group, weight in group_weights.items():
        percentage = weight * 100
        print(f"{group.ljust(12)}: {percentage:6.2f}% ({weight:.3f})")
    print("-" * 40)

if __name__ == "__main__":
    # Genera una storia di stati
    history = generate_structured_history(20)
    
    # Stampa la storia generata
    print("\nStoria degli stati generata:")
    for i, state in enumerate(history):
        print(f"Stato {i}: Frequenza {state.frequenza}, Tempo {state.cAttacco}")
    
    # Crea uno stato corrente per il test
    current_state = StatoMusicale(
        cAttacco=60.0,
        durataArmonica=20.0,
        ritmo=[3, 4, 5],
        durata=10.0,
        ampiezza=[-12.0],
        frequenza=[1, 5],  # Test con ottava 1, intervallo 5
        posizione=2
    )
    
    # Calcola e stampa l'harmonic alignment
    alignment_score = calculate_harmonic_alignment(current_state, history)
    print(f"\nHarmonic Alignment Score per lo stato corrente: {alignment_score}")
    
    # Stampa anche i pesi degli intervalli
    interval_weights = analyze_frequency_history(history)
    print("\nPesi degli intervalli nella storia:")
    for coord, weight in sorted(interval_weights.items()):
        print(f"Ottava {coord[0]}, Intervallo {coord[1]}: {weight:.3f}")
    # Visualizza la distribuzione
    print("\nGenerazione mappa di calore della distribuzione degli intervalli...")
    #visualize_interval_distribution(interval_weights)

    group_weights = analyze_grouped_octaves(history)
    print_group_analysis(group_weights)

    visualize_octave_groups(group_weights)