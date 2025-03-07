#!/usr/bin/env python3
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import sys
import os
import seaborn as sns

def visualize_harmony(file_path):
    # Leggi i dati CSV
    df = pd.read_csv(file_path)
    df = df.sort_values(by='time').reset_index(drop=True)
    
    # Crea directory di output
    output_dir = os.path.dirname(file_path)
    output_dir = os.path.join(output_dir, "plots")
    os.makedirs(output_dir, exist_ok=True)
    
    # Grafico 1: Serie temporali delle metriche armoniche
    plt.figure(figsize=(15, 8))
    plt.plot(df['time'], df['harmonic_density'], 'g-', label='Densità Armonica')
    plt.plot(df['time'], df['octave_spread'], 'r-', label='Dispersione Ottave')
    plt.plot(df['time'], df['spectral_centroid'] / 10, 'b-', label='Centroide Spettrale (scaled)')
    
    plt.title('Analisi Armonica nel Tempo')
    plt.xlabel('Tempo (secondi)')
    plt.ylabel('Valore')
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    plt.tight_layout()
    output_path = os.path.join(output_dir, "harmonic_time_series.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # Leggi distribuzione ottave
    try:
        octave_df = pd.read_csv(os.path.join(output_dir, "..", "octave_distribution.csv"))
        plt.figure(figsize=(12, 6))
        plt.bar(octave_df['octave'], octave_df['count'], color='green')
        plt.title('Distribuzione degli Eventi per Ottava')
        plt.xlabel('Ottava')
        plt.ylabel('Numero di Eventi')
        plt.xticks(range(len(octave_df)))
        plt.grid(True, alpha=0.3)
        
        plt.tight_layout()
        octave_path = os.path.join(output_dir, "octave_distribution.png")
        plt.savefig(octave_path, dpi=150)
        plt.close()
    except Exception as e:
        print(f"Errore nella visualizzazione distribuzione ottave: {e}")
    
    # Leggi matrice ottava/registro
    try:
        matrix_df = pd.read_csv(os.path.join(output_dir, "..", "octave_register_matrix.csv"))
        # Converte in formato pivot per heatmap
        pivot_df = matrix_df.pivot(index='octave', columns='register', values='count')
        pivot_df = pivot_df.fillna(0)
        
        plt.figure(figsize=(14, 10))
        sns.heatmap(pivot_df, annot=True, cmap='viridis', fmt='g')
        plt.title('Distribuzione Eventi per Ottava/Registro')
        plt.xlabel('Registro')
        plt.ylabel('Ottava')
        
        plt.tight_layout()
        matrix_path = os.path.join(output_dir, "octave_register_matrix.png")
        plt.savefig(matrix_path, dpi=150)
        plt.close()
    except Exception as e:
        print(f"Errore nella visualizzazione matrice ottava/registro: {e}")
    
    # Grafico di correlazione con sovrapposizione
    try:
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
        
        plt.tight_layout()
        correlation_path = os.path.join(output_dir, "overlap_harmony_correlation.png")
        plt.savefig(correlation_path, dpi=150)
        plt.close()
    except Exception as e:
        print(f"Errore nella visualizzazione correlazione: {e}")
    
    print(f"Visualizzazioni armoniche salvate in {output_dir}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Utilizzo: python visualize_harmony.py <file_csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    visualize_harmony(file_path)