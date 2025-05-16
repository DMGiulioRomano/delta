import numpy as np
import matplotlib.pyplot as plt
from math import log

# Valori di sistema predefiniti - adattali in base al tuo sistema
OTTAVE = 10
REGISTRI = 10

def plot_mapping_curves():
    # Configurazione figura principale
    fig, axs = plt.subplots(3, 1, figsize=(12, 15))
    fig.suptitle('Curve di Mapping per Stati in Delta-Engine', fontsize=16)
    
    # Range di input per i tre parametri
    overlap_values = np.linspace(3, 300, 1000)  # Overlap: partendo dal minimo 3 fino a ~300
    spread_values = np.linspace(0, 1, 1000)     # Octave Spread: 0-1
    movement_values = np.linspace(0, 1, 1000)   # Spatial Movement: 0-1
    
    # ======= GRAFICO 1: DENSITÀ =======
    ax = axs[0]
    
    # Calcolo della curva di mapping per densità
    density_states = []
    for overlap in overlap_values:
        # Replica l'algoritmo da determineCurrentState.udo
        min_overlap = 3
        max_overlap = 3 * OTTAVE * REGISTRI
        
        safe_overlap = max(min_overlap, overlap)
        
        log_min = log(min_overlap)
        log_max = log(max_overlap)
        log_range = log_max - log_min
        
        density_state = (log(safe_overlap) - log_min) / log_range * 2.999
        density_state = min(2.999, max(0, density_state))
        
        density_states.append(density_state)
    
    # Plot della curva di densità
    ax.plot(overlap_values, density_states, 'b-', linewidth=2)
    ax.set_title('Mapping Densità: Overlap → Density State', fontsize=14)
    ax.set_xlabel('Overlap (eventi attivi)', fontsize=12)
    ax.set_ylabel('Density State (0-2.999)', fontsize=12)
    ax.grid(True, alpha=0.3)


    # Aggiungi linee di riferimento per gli stati discreti (0, 1, 2, 3)
    for i in range(4):
        ax.axhline(y=i, color='b', linestyle='--', alpha=0.5)
        if i < 3:
            ax.text(1.01, i, f'Stato {i}', va='center', fontsize=10)
    
    # Annota punti chiave
    key_spreads = [3, 25, 75, 155, 200]
    # Annota punti chiave
    key_overlaps = [3, 25, 75, 155, 200]
    for overlap in key_overlaps:
        # Trova l'indice del valore più vicino a 'overlap' nell'array 'overlap_values'
        idx = min(range(len(overlap_values)), key=lambda i: abs(overlap_values[i] - overlap))
        state = density_states[idx]
        ax.plot(overlap_values[idx], state, 'bo', markersize=4)
        ax.annotate(f'({overlap_values[idx]:.1f}, {state:.2f})',
                xy=(overlap_values[idx], state),
                xytext=(overlap_values[idx]+10, state+0.1),
                fontsize=9)

    # ======= GRAFICO 2: REGISTRO (ARMONICO) =======
    ax = axs[1]
    
    # Calcolo della curva di mapping per registro
    register_states = []
    for spread in spread_values:
        # Replica l'algoritmo da determineCurrentState.udo
        inverted_spread = 1 - spread
        
        min_reg_map = 2
        max_reg_map = 30
        
        mapped_spread = min_reg_map + inverted_spread * (max_reg_map - min_reg_map)
        
        log_min = log(min_reg_map)
        log_max = log(max_reg_map)
        log_range = log_max - log_min
        
        register_state = (log(mapped_spread) - log_min) / log_range * 2.999
        register_state = min(2.999, max(0, register_state))
        
        register_states.append(register_state)
    
    # Plot della curva di registro
    ax.plot(spread_values, register_states, 'g-', linewidth=2)
    ax.set_title('Mapping Registro: Octave Spread → Register State', fontsize=14)
    ax.set_xlabel('Octave Spread (0-1)', fontsize=12)
    ax.set_ylabel('Register State (0-2.999)', fontsize=12)
    ax.grid(True, alpha=0.3)
    
    # Aggiungi linee di riferimento per gli stati discreti (0, 1, 2, 3)
    for i in range(4):
        ax.axhline(y=i, color='r', linestyle='--', alpha=0.5)
        if i < 3:
            ax.text(1.01, i, f'Stato {i}', va='center', fontsize=10)
    
    # Annota punti chiave
    key_spreads = [0, 0.25, 0.5, 0.75, 1.0]
    for spread in key_spreads:
        idx = int(spread * (len(spread_values) - 1))
        state = register_states[idx]
        ax.plot(spread, state, 'ro', markersize=4)
        ax.annotate(f'({spread:.2f}, {state:.2f})',
                    xy=(spread, state),
                    xytext=(spread+0.05, state+0.1),
                    fontsize=9)
    
    # ======= GRAFICO 3: MOVIMENTO =======
    ax = axs[2]
    
    # Calcolo della curva di mapping per movimento
    movement_states = []
    for movement in movement_values:
        # Replica l'algoritmo da determineCurrentState.udo
        min_mov_map = 1
        max_mov_map = 35
        
        mapped_movement = min_mov_map + movement * (max_mov_map - min_mov_map)
        
        log_min = log(min_mov_map)
        log_max = log(max_mov_map)
        log_range = log_max - log_min
        
        movement_state = (log(mapped_movement) - log_min) / log_range * 2.999
        movement_state = min(2.999, max(0, movement_state))
        
        movement_states.append(movement_state)
    
    # Plot della curva di movimento
    ax.plot(movement_values, movement_states, 'r-', linewidth=2)
    ax.set_title('Mapping Movimento: Spatial Movement → Movement State', fontsize=14)
    ax.set_xlabel('Spatial Movement (0-1)', fontsize=12)
    ax.set_ylabel('Movement State (0-2.999)', fontsize=12)
    ax.grid(True, alpha=0.3)
    
    # Aggiungi linee di riferimento per gli stati discreti (0, 1, 2, 3)
    for i in range(4):
        ax.axhline(y=i, color='r', linestyle='--', alpha=0.5)
        if i < 3:
            ax.text(1.01, i, f'Stato {i}', va='center', fontsize=10)
    
    # Annota punti chiave
    key_movements = [0, 0.25, 0.5, 0.75, 1.0]
    for mov in key_movements:
        idx = int(mov * (len(movement_values) - 1))
        state = movement_states[idx]
        ax.plot(mov, state, 'ro', markersize=4)
        ax.annotate(f'({mov:.2f}, {state:.2f})',
                    xy=(mov, state),
                    xytext=(mov+0.05, state+0.1),
                    fontsize=9)
    
    # Aggiunta di note informative
    fig.text(0.1, -0.02, 
             "Note: Le curve mostrano la mappatura dai parametri di analisi musicale (overlap, octave spread, spatial movement)\n"
             "agli stati continui (0-2.999) utilizzati nel sistema di transizione Delta-Engine.\n"
             "Le linee tratteggiate rosse rappresentano i confini tra stati discreti (0, 1, 2).", 
             fontsize=10)
    
    # Sistemazione layout
    plt.tight_layout()
    plt.subplots_adjust(top=0.92, bottom=0.05)
    
    return fig

# Crea e salva la figura
fig = plot_mapping_curves()
plt.savefig('delta_engine_mapping_curves.png', dpi=300, bbox_inches='tight')
plt.savefig('delta_engine_mapping_curves.pdf', format='pdf', bbox_inches='tight')
#plt.show()

print("Grafici delle curve di mapping generati e salvati con successo!")