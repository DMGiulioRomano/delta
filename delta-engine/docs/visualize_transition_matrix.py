#!/usr/bin/env python3
"""
Visualizza la matrice di transizione tra stati compositivi.
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import os
import seaborn as sns

def visualize_transition_matrix():
    # Verifica l'esistenza del file CSV
    csv_file = "docs/analysis/transition_matrix_2d.csv"
    if not os.path.exists(csv_file):
        print(f"Errore: File {csv_file} non trovato")
        return
    
    # Leggi la matrice dal file CSV
    df = pd.read_csv(csv_file, index_col=0)
    
    # Converti in array numpy per una manipolazione più facile
    matrix = df.to_numpy()
    
    # Genera visualizzazioni della matrice
    create_heatmap(matrix, df.index, df.columns)
    create_graph_visualization(matrix, df.index, df.columns)
    analyze_matrix(matrix, df.index, df.columns)

def create_heatmap(matrix, row_labels, col_labels):
    """Crea una heatmap della matrice di transizione."""
    # Crea directory output se non esiste
    os.makedirs("docs/analysis/plots", exist_ok=True)
    
    # Plot della heatmap completa
    plt.figure(figsize=(20, 16))
    sns.heatmap(matrix, annot=True, fmt=".3f", cmap="viridis", 
                xticklabels=col_labels, yticklabels=row_labels)
    plt.title("Matrice di Transizione tra Stati", fontsize=16)
    plt.xlabel("Stato Destinazione", fontsize=14)
    plt.ylabel("Stato Origine", fontsize=14)
    plt.xticks(rotation=90)
    plt.tight_layout()
    plt.savefig("docs/analysis/plots/transition_matrix_heatmap.png", dpi=200)
    plt.close()
    
    # Plot di una heatmap semplificata per densità
    plt.figure(figsize=(12, 10))
    # Aggreghiamo i dati in base alla densità
    density_matrix = np.zeros((3, 3))
    for i in range(3):  # densità origine
        for j in range(3):  # densità destinazione
            # Somma tutte le probabilità per questa transizione di densità
            sub_sum = 0
            for r1 in range(3):  # registro origine
                for m1 in range(3):  # movimento origine
                    for r2 in range(3):  # registro destinazione
                        for m2 in range(3):  # movimento destinazione
                            idx1 = i*9 + r1*3 + m1
                            idx2 = j*9 + r2*3 + m2
                            sub_sum += matrix[idx1, idx2]
            density_matrix[i, j] = sub_sum / 9  # media
    
    density_labels = ["Sparse", "Medium", "Dense"]
    sns.heatmap(density_matrix, annot=True, fmt=".3f", cmap="Blues",
                xticklabels=density_labels, yticklabels=density_labels)
    plt.title("Probabilità di Transizione tra Stati di Densità", fontsize=16)
    plt.xlabel("Densità Destinazione", fontsize=14)
    plt.ylabel("Densità Origine", fontsize=14)
    plt.tight_layout()
    plt.savefig("docs/analysis/plots/density_transition_heatmap.png", dpi=200)
    plt.close()

def create_graph_visualization(matrix, node_labels, _):
    """Crea una visualizzazione del grafo di transizione con spessore degli archi proporzionale alle probabilità."""
    try:
        import networkx as nx
        
        # Crea un grafo diretto
        G = nx.DiGraph()
        
        # Aggiungi nodi
        for i, label in enumerate(node_labels):
            G.add_node(label)
        
        # Aggiungi archi con pesi significativi
        for i, from_node in enumerate(node_labels):
            for j, to_node in enumerate(node_labels):
                # Aggiungi solo archi con probabilità significativa
                if matrix[i, j] > 0.03:  # soglia arbitraria
                    G.add_edge(from_node, to_node, weight=matrix[i, j])
        
        # Visualizza il grafo
        plt.figure(figsize=(20, 16))
        pos = nx.spring_layout(G, seed=42)  # layout deterministico
        
        # Disegna nodi
        nx.draw_networkx_nodes(G, pos, node_color="lightblue", 
                               node_size=500, alpha=0.8)
        
        # Disegna etichette
        nx.draw_networkx_labels(G, pos, font_size=10)
        
        # Disegna archi con larghezza proporzionale al peso
        # Qui calcoliamo lo spessore delle frecce basato sulla probabilità
        edge_weights = [G[u][v]['weight'] * 20 for u, v in G.edges()]
        
        # Aumentiamo il contrasto scalando i pesi
        min_width = 0.5
        max_width = 2.0
        if len(edge_weights) > 0:
            min_weight = min(edge_weights)
            max_weight = max(edge_weights)
            if min_weight != max_weight:
                edge_weights = [min_width + (w - min_weight) * (max_width - min_width) / (max_weight - min_weight) for w in edge_weights]
            else:
                edge_weights = [min_width for _ in edge_weights]
        
        # Usa anche colori diversi per probabilità diverse
        edge_colors = ["rgba(100,100,100,{})".format(min(0.9, G[u][v]['weight'] * 5)) for u, v in G.edges()]
        
        nx.draw_networkx_edges(G, pos, width=edge_weights, 
                               alpha=0.7, edge_color="gray",
                               arrowsize=15, arrowstyle='->')
        
        plt.title("Grafo delle Transizioni di Stato", fontsize=16)
        plt.axis('off')
        plt.tight_layout()
        plt.savefig("docs/analysis/plots/transition_graph.png", dpi=200)
        
        # Crea anche una versione con solo le transizioni più probabili
        plt.figure(figsize=(20, 16))
        
        # Filtra per mostrare solo transizioni con alta probabilità
        high_prob_edges = [(u, v) for u, v in G.edges() if G[u][v]['weight'] > 0.06]
        high_prob_weights = [G[u][v]['weight'] * 30 for u, v in high_prob_edges]
        
        nx.draw_networkx_nodes(G, pos, node_color="lightblue", 
                               node_size=500, alpha=0.8)
        nx.draw_networkx_labels(G, pos, font_size=10)
        nx.draw_networkx_edges(G, pos, edgelist=high_prob_edges, width=high_prob_weights,
                               alpha=0.8, edge_color="red", arrows=True,
                               arrowsize=20, arrowstyle='->')
        
        plt.title("Transizioni di Stato Più Probabili", fontsize=16)
        plt.axis('off')
        plt.tight_layout()
        plt.savefig("docs/analysis/plots/high_probability_transitions.png", dpi=200)
        plt.close()
        
    except ImportError:
        print("NetworkX non installato. La visualizzazione del grafo è stata saltata.")

def analyze_matrix(matrix, row_labels, _):
    """Analizza le proprietà della matrice di transizione."""
    # Calcola la distribuzione stazionaria
    try:
        from scipy import linalg
        
        # Trova l'autovettore principale
        eigenvalues, eigenvectors = linalg.eig(matrix.T)
        idx = np.argmin(np.abs(eigenvalues - 1.0))
        stationary = eigenvectors[:, idx].real
        stationary = stationary / np.sum(stationary)
        
        # Crea un DataFrame con la distribuzione stazionaria
        stat_df = pd.DataFrame({
            'state': row_labels,
            'probability': stationary
        })
        
        # Ordina per probabilità decrescente
        stat_df = stat_df.sort_values('probability', ascending=False)
        
        # Visualizza i primi 10 stati più probabili
        plt.figure(figsize=(14, 8))
        sns.barplot(x='state', y='probability', data=stat_df.head(10))
        plt.title("Stati più Probabili nella Distribuzione Stazionaria", fontsize=16)
        plt.xlabel("Stato", fontsize=14)
        plt.ylabel("Probabilità", fontsize=14)
        plt.xticks(rotation=90)
        plt.tight_layout()
        plt.savefig("docs/analysis/plots/stationary_distribution.png", dpi=200)
        plt.close()
        
        # Salva l'analisi completa in CSV
        stat_df.to_csv("docs/analysis/stationary_distribution.csv", index=False)
        
        print("Analisi della distribuzione stazionaria completata.")
        
    except ImportError:
        print("SciPy non installato. L'analisi della distribuzione stazionaria è stata saltata.")

if __name__ == "__main__":
    visualize_transition_matrix()