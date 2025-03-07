#!/usr/bin/env python3
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import sys
import os

def visualize_harmony(file_path):
    # Leggi i dati CSV
    df = pd.read_csv(file_path)
    df = df.sort_values(by='time').reset_index(drop=True)
    
    # Crea directory di output
    output_dir = os.path.dirname(file_path)
    output_dir = os.path.join(output_dir, "plots")
    os.makedirs(output_dir, exist_ok=True)
    
    # Grafico della densità armonica
    plt.figure(figsize=(15, 8))
    plt.plot(df['time'], df['harmonic_density'], 'g-', label='Densità Armonica')
    plt.plot(df['time'], df['octave_spread'], 'r-', label='Dispersione Ottave')
    
    plt.title('Analisi Armonica nel Tempo')
    plt.xlabel('Tempo (secondi)')
    plt.ylabel('Valore')
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    # Salva il grafico
    plt.tight_layout()
    output_path = os.path.join(output_dir, "harmonic_analysis.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # Crea grafico di correlazione tra sovrapposizione e densità armonica
    overlap_df = pd.read_csv(os.path.join(output_dir, "..", "overlap_data.csv"))
    merged_df = pd.merge_asof(df, overlap_df, on='time')
    
    plt.figure(figsize=(12, 8))
    plt.scatter(merged_df['active_events'], merged_df['harmonic_density'], 
               alpha=0.6, c=merged_df['time'], cmap='viridis')
    
    plt.colorbar(label='Tempo (secondi)')
    plt.title('Relazione tra Sovrapposizione di Eventi e Densità Armonica')
    plt.xlabel('Eventi Attivi Simultaneamente')
    plt.ylabel('Densità Armonica')
    plt.grid(True, alpha=0.3)
    
    # Salva il grafico
    plt.tight_layout()
    correlation_path = os.path.join(output_dir, "overlap_harmony_correlation.png")
    plt.savefig(correlation_path, dpi=150)
    plt.close()
    
    print(f"Grafici armonici salvati in {output_dir}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Utilizzo: python visualize_harmony.py <file_csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    visualize_harmony(file_path)