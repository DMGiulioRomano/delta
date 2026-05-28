#!/usr/bin/env python3
"""
Visualizzatore della Memoria Compositiva
=======================================

Questo script crea visualizzazioni della memoria compositiva,
mostrando come evolve la sovrapposizione nel tempo e la correlazione
tra diversi aspetti della composizione.
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import sys
import os

def visualize_compositional_memory(memory_file):
    """Crea visualizzazioni della memoria compositiva."""
    try:
        df = pd.read_csv(memory_file)
        df = df.sort_values(by='time').reset_index(drop=True)
    except Exception as e:
        print(f"Errore nella lettura del file: {e}")
        return
    
    if df.empty:
        print("Nessun dato trovato")
        return
    
    # Crea directory di output
    output_dir = os.path.dirname(memory_file)
    output_dir = os.path.join(output_dir, "plots")
    os.makedirs(output_dir, exist_ok=True)
    
    # 1. Grafico combinato di sovrapposizione ed eventi attivi
    fig, ax1 = plt.subplots(figsize=(15, 8))
    
    # Sovrapposizione (asse sinistro)
    color = 'tab:blue'
    ax1.set_xlabel('Tempo (secondi)')
    ax1.set_ylabel('Sovrapposizione', color=color)
    ax1.plot(df['time'], df['overlap'], color=color)
    ax1.tick_params(axis='y', labelcolor=color)
    ax1.grid(True, alpha=0.3)
    
    # Eventi attivi (asse destro)
    ax2 = ax1.twinx()
    color = 'tab:red'
    ax2.set_ylabel('Eventi Attivi', color=color)
    ax2.plot(df['time'], df['active_events'], color=color)
    ax2.tick_params(axis='y', labelcolor=color)
    
    fig.tight_layout()
    plt.title('Memoria Compositiva: Evoluzione della Densità')
    
    output_path = os.path.join(output_dir, "memory_combined.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # 2. Mappa di calore della densità nel tempo
    plt.figure(figsize=(15, 6))
    
    # Prepara i dati per la heatmap
    memory_data = np.array([df['overlap'], df['active_events']])
    
    plt.imshow(memory_data, aspect='auto', cmap='viridis',
               extent=[df['time'].min(), df['time'].max(), -0.5, 1.5])
    
    plt.colorbar(label='Valore')
    plt.title('Mappa di Calore della Memoria Compositiva')
    plt.xlabel('Tempo (secondi)')
    plt.yticks([0, 1], ['Sovrapposizione', 'Eventi Attivi'])
    
    plt.tight_layout()
    output_path = os.path.join(output_dir, "memory_heatmap.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # 3. Analisi a finestra mobile della densità
    window_size = 30  # Finestra di 30 secondi
    if len(df) > window_size:
        df['rolling_overlap'] = df['overlap'].rolling(window=window_size).mean()
        df['rolling_events'] = df['active_events'].rolling(window=window_size).mean()
        
        plt.figure(figsize=(15, 8))
        
        plt.plot(df['time'], df['overlap'], 'b-', alpha=0.3, label='Sovrapposizione Istantanea')
        plt.plot(df['time'], df['rolling_overlap'], 'b-', linewidth=2, label='Sovrapposizione Media (30s)')
        plt.plot(df['time'], df['active_events'], 'r-', alpha=0.3, label='Eventi Istantanei')
        plt.plot(df['time'], df['rolling_events'], 'r-', linewidth=2, label='Eventi Medi (30s)')
        
        plt.title('Analisi a Finestra Mobile della Densità Compositiva')
        plt.xlabel('Tempo (secondi)')
        plt.ylabel('Valore')
        plt.grid(True, alpha=0.3)
        plt.legend()
        
        plt.tight_layout()
        output_path = os.path.join(output_dir, "memory_rolling_analysis.png")
        plt.savefig(output_path, dpi=150)
        plt.close()
    
    # 4. Distribuzione della sovrapposizione
    plt.figure(figsize=(12, 6))
    
    # Istogramma della sovrapposizione
    plt.hist(df['overlap'], bins=np.arange(0, df['overlap'].max()+2)-0.5, 
             alpha=0.7, color='blue', density=True, label='Sovrapposizione')
    
    # Aggiungi linea della media
    avg_overlap = df['overlap'].mean()
    plt.axvline(x=avg_overlap, color='blue', linestyle='--', 
                label=f'Media Sovrapposizione: {avg_overlap:.2f}')
    
    # Istogramma degli eventi attivi
    if df['active_events'].max() > 0:
        plt.hist(df['active_events'], bins=np.arange(0, df['active_events'].max()+2)-0.5, 
                 alpha=0.5, color='red', density=True, label='Eventi Attivi')
        
        # Aggiungi linea della media
        avg_events = df['active_events'].mean()
        plt.axvline(x=avg_events, color='red', linestyle='--', 
                    label=f'Media Eventi: {avg_events:.2f}')
    
    plt.title('Distribuzione della Densità Compositiva')
    plt.xlabel('Valore')
    plt.ylabel('Densità di Probabilità')
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    plt.tight_layout()
    output_path = os.path.join(output_dir, "memory_distribution.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    print(f"Visualizzazioni memoria compositiva salvate in {output_dir}")

def main():
    if len(sys.argv) < 2:
        print("Utilizzo: python visualize_memory.py <file_csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    visualize_compositional_memory(file_path)

if __name__ == "__main__":
    main()