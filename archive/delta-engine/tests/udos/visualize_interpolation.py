#!/usr/bin/env python3
import os
import sys
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def visualize_interpolation_curves(csv_file):
    """
    Crea visualizzazioni delle curve di interpolazione dai dati CSV generati da Csound.
    """
    if not os.path.exists(csv_file):
        print(f"File non trovato: {csv_file}")
        return
    
    # Leggi i dati CSV
    try:
        df = pd.read_csv(csv_file)
        print(f"Dati caricati con successo. Forma: {df.shape}")
    except Exception as e:
        print(f"Errore nel caricamento del file CSV: {e}")
        return
    
    # Crea directory per i grafici
    os.makedirs("tests/plots", exist_ok=True)
    
    # Grafico 1: Tutte le curve su un unico grafico
    plt.figure(figsize=(12, 8))
    plt.plot(df['progress'], df['linear'], label='Lineare', linewidth=2)
    plt.plot(df['progress'], df['ease_in_1'], label='Ease-In (1.0)', linewidth=2)
    plt.plot(df['progress'], df['ease_in_2'], label='Ease-In (2.0)', linewidth=2)
    plt.plot(df['progress'], df['ease_out_1'], label='Ease-Out (-1.0)', linewidth=2)
    plt.plot(df['progress'], df['ease_out_2'], label='Ease-Out (-2.0)', linewidth=2)
    
    plt.title('Confronto Curve di Interpolazione', fontsize=16)
    plt.xlabel('Progresso', fontsize=14)
    plt.ylabel('Valore Interpolato', fontsize=14)
    plt.grid(True, linestyle='--', alpha=0.7)
    plt.legend(fontsize=12)
    plt.tight_layout()
    plt.savefig('plots/curve_interpolazione_confronto.png', dpi=300)
    
    # Grafico 2: Curve separate per tipo con punti di riferimento
    fig, axes = plt.subplots(3, 1, figsize=(10, 12), sharex=True)
    
    # Linear
    axes[0].plot(df['progress'], df['linear'], 'b-', linewidth=3, label='Lineare')
    axes[0].set_title('Interpolazione Lineare', fontsize=14)
    axes[0].grid(True, linestyle='--', alpha=0.7)
    axes[0].legend(fontsize=12)
    
    # Ease-In
    axes[1].plot(df['progress'], df['ease_in_1'], 'r-', linewidth=3, label='Ease-In (1.0)')
    axes[1].plot(df['progress'], df['ease_in_2'], 'r--', linewidth=2, label='Ease-In (2.0)')
    axes[1].set_title('Interpolazione Ease-In (Accelerazione)', fontsize=14)
    axes[1].grid(True, linestyle='--', alpha=0.7)
    axes[1].legend(fontsize=12)
    
    # Ease-Out
    axes[2].plot(df['progress'], df['ease_out_1'], 'g-', linewidth=3, label='Ease-Out (-1.0)')
    axes[2].plot(df['progress'], df['ease_out_2'], 'g--', linewidth=2, label='Ease-Out (-2.0)')
    axes[2].set_title('Interpolazione Ease-Out (Decelerazione)', fontsize=14)
    axes[2].grid(True, linestyle='--', alpha=0.7)
    axes[2].legend(fontsize=12)
    
    # Annotazioni comuni
    for ax in axes:
        # Aggiungi punti di riferimento al 25%, 50%, 75%
        for progress in [0.25, 0.5, 0.75]:
            ax.axvline(x=progress, color='gray', linestyle=':', alpha=0.5)
            
        ax.set_ylabel('Valore Interpolato', fontsize=12)
    
    axes[-1].set_xlabel('Progresso', fontsize=14)
    
    plt.tight_layout()
    plt.savefig('plots/curve_interpolazione_tipi.png', dpi=300)
    
    # Grafico 3: Derivate (velocità) delle curve di interpolazione
    plt.figure(figsize=(12, 8))
    
    # Calcola le derivate (differenze) per visualizzare la velocità
    for col in ['linear', 'ease_in_1', 'ease_in_2', 'ease_out_1', 'ease_out_2']:
        df[f'{col}_speed'] = df[col].diff() / df['progress'].diff()
    
    # Elimina la prima riga che ha NaN nella derivata
    df_speed = df.iloc[1:].copy()
    
    plt.plot(df_speed['progress'], df_speed['linear_speed'], label='Lineare', linewidth=2)
    plt.plot(df_speed['progress'], df_speed['ease_in_1_speed'], label='Ease-In (1.0)', linewidth=2)
    plt.plot(df_speed['progress'], df_speed['ease_in_2_speed'], label='Ease-In (2.0)', linewidth=2)
    plt.plot(df_speed['progress'], df_speed['ease_out_1_speed'], label='Ease-Out (-1.0)', linewidth=2)
    plt.plot(df_speed['progress'], df_speed['ease_out_2_speed'], label='Ease-Out (-2.0)', linewidth=2)
    
    plt.title('Velocità di Cambiamento delle Curve di Interpolazione', fontsize=16)
    plt.xlabel('Progresso', fontsize=14)
    plt.ylabel('Velocità di Variazione', fontsize=14)
    plt.grid(True, linestyle='--', alpha=0.7)
    plt.legend(fontsize=12)
    plt.tight_layout()
    plt.savefig('plots/curve_interpolazione_velocita.png', dpi=300)
    
    print(f"Visualizzazioni generate nella directory 'tests/plots/'")

if __name__ == "__main__":
    # Gestisci l'input da riga di comando o usa il valore predefinito
    csv_file = sys.argv[1] if len(sys.argv) > 1 else "data/interpolation_curves.csv"
    visualize_interpolation_curves(csv_file)