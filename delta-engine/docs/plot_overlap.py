#!/usr/bin/env python3
import matplotlib.pyplot as plt
import pandas as pd
import sys
import os
import numpy as np

def plot_overlap(file_path):
    """Crea un grafico della sovrapposizione degli eventi nel tempo."""
    # Leggi i dati CSV
    try:
        df = pd.read_csv(file_path)
        df = df.sort_values(by='time').reset_index(drop=True)
    except Exception as e:
        print(f"Errore nella lettura del file: {e}")
        return
    
    if df.empty:
        print("Nessun dato trovato")
        return
    
    # Crea directory di output
    output_dir = os.path.dirname(file_path)
    
    # Grafico principale della sovrapposizione
    plt.figure(figsize=(15, 8))
    
    # Grafico a linee
    plt.plot(df['time'], df['active_events'], 'b-')
    plt.fill_between(df['time'], df['active_events'], alpha=0.3)
    
    # Statistiche
    max_overlap = df['active_events'].max()
    avg_overlap = df['active_events'].mean()
    plt.axhline(y=avg_overlap, color='r', linestyle='--', 
                label=f'Media: {avg_overlap:.2f}')
    
    plt.title('Sovrapposizione di Eventi nel Tempo')
    plt.xlabel('Tempo (secondi)')
    plt.ylabel('Eventi Attivi Simultaneamente')
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    # Salva il grafico
    plt.tight_layout()
    output_path = os.path.join(output_dir, "overlap_time_series.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # Crea anche una heatmap per una visualizzazione alternativa
    plt.figure(figsize=(15, 4))
    plt.imshow([df['active_events']], aspect='auto', cmap='viridis',
               extent=[df['time'].min(), df['time'].max(), 0, 1],
               vmin=0, vmax=max_overlap)
    plt.colorbar(label='Eventi Attivi')
    plt.title('Mappa di Calore della Sovrapposizione di Eventi')
    plt.yticks([])
    plt.xlabel('Tempo (secondi)')
    
    plt.tight_layout()
    heatmap_path = os.path.join(output_dir, "overlap_heatmap.png")
    plt.savefig(heatmap_path, dpi=150)
    plt.close()
    
    # Crea istogramma della distribuzione
    plt.figure(figsize=(10, 6))
    plt.hist(df['active_events'], bins=np.arange(0, max_overlap+2)-0.5, 
             alpha=0.7, color='g', density=True)
    plt.axvline(x=avg_overlap, color='r', linestyle='--', 
                label=f'Media: {avg_overlap:.2f}')
    
    plt.title('Distribuzione della Sovrapposizione di Eventi')
    plt.xlabel('Numero di Eventi Attivi Simultaneamente')
    plt.ylabel('Densità di Probabilità')
    plt.grid(True, alpha=0.3)
    plt.xticks(range(0, int(max_overlap)+1))
    plt.legend()
    
    plt.tight_layout()
    hist_path = os.path.join(output_dir, "overlap_distribution.png")
    plt.savefig(hist_path, dpi=150)
    plt.close()
    
    print(f"Grafici salvati in {output_dir}:")
    print(f"1. Serie temporale: {output_path}")
    print(f"2. Mappa di calore: {heatmap_path}")
    print(f"3. Distribuzione: {hist_path}")

def main():
    if len(sys.argv) < 2:
        print("Utilizzo: python plot_overlap.py <file_csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    plot_overlap(file_path)

if __name__ == "__main__":
    main()