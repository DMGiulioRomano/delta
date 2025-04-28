"""
Csound Multi-Table Combined Plotting Script
==========================================

This script extracts data from Csound table files and creates a single graphical representation
containing all tables found in the file as subplots in a grid layout.
"""

import matplotlib.pyplot as plt
import sys
import os
import re
import math
import numpy as np

def extract_tables(file_path):
    """Extract all tables from a Csound table file."""
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Pattern to match table headers and content
    table_pattern = r'======= TABLE (\d+) size: (\d+) values ======.*?---------END OF HEADER--------------\n(.*?)---------END OF TABLE---------------'
    tables = re.findall(table_pattern, content, re.DOTALL)
    
    result = []
    for table_num, size, data_text in tables:
        data = []
        for line in data_text.strip().split('\n'):
            line = line.strip()
            if not line or line == "-":
                continue
            try:
                data.append(float(line))
            except ValueError:
                print(f"Parsing error on line in table {table_num}: {repr(line)}")
        
        # Include all tables, even if they contain only zeros
        if data:
            result.append((table_num, data))
    
    return result

def filter_empty_indices(tables):
    """Rimuove gli indici dove tutte le tabelle hanno valore zero."""
    if not tables:
        return tables
    
    # Determina la lunghezza minima comune tra tutte le tabelle
    min_length = min(len(data) for _, data in tables)
    
    # Tieni traccia degli indici da mantenere
    indices_to_keep = []
    
    # Per ogni indice, controlla se esiste almeno un valore non zero
    for idx in range(min_length):
        has_non_zero = False
        for _, data in tables:
            if idx < len(data) and data[idx] != 0:
                has_non_zero = True
                break
        
        if has_non_zero:
            indices_to_keep.append(idx)
    
    # Crea nuove tabelle mantenendo solo gli indici non vuoti
    filtered_tables = []
    for table_num, data in tables:
        filtered_data = [data[idx] for idx in indices_to_keep if idx < len(data)]
        filtered_tables.append((table_num, filtered_data))
    
    print(f"Filtered out {min_length - len(indices_to_keep)} empty indices. Kept {len(indices_to_keep)} indices.")
    return filtered_tables

def read_table_short_names(docs_file):
    """Legge il file .docs e crea un dizionario di numeri di tabella e nomi."""
    table_names = {}
    try:
        with open(docs_file, 'r') as file:
            for line in file:
                line = line.strip()
                if line and ':' in line:
                    name, number = line.split(':', 1)
                    # Pulizia e normalizzazione
                    name = name.strip()
                    number = number.strip()
                    
                    # Estrai solo la parte dopo il secondo underscore
                    if name.count('_') >= 2:
                        # Trova la posizione del secondo underscore
                        first_underscore = name.find('_')
                        second_underscore = name.find('_', first_underscore + 1)
                        # Estrai la parte dopo il secondo underscore
                        name = name[second_underscore + 1:]
                    
                    # Aggiungi al dizionario
                    table_names[number] = name
        return table_names
    except Exception as e:
        print(f"Errore nella lettura del file .docs: {e}")
        return {}
    
def sort_tables_by_attack(tables, table_names):
    """Ordina tutte le tabelle in base ai valori della tabella 'attacco'."""
    
    # Cerca la tabella "attacco" tra tutte le tabelle
    attack_table_num = None
    attack_table_data = None
    
    for table_num, data in tables:
        name = table_names.get(table_num, f"Table {table_num}")
        if "attacco" in name.lower():
            attack_table_num = table_num
            attack_table_data = data
            break
    
    # Se la tabella attacco non è stata trovata, non fare nulla
    if attack_table_num is None:
        print("Tabella 'attacco' non trovata, le tabelle non saranno ordinate.")
        return tables
    
    # Crea una lista di tuple (indice_originale, valore_attacco)
    indexed_attack_values = [(i, val) for i, val in enumerate(attack_table_data)]
    
    # Ordina questa lista in base ai valori di attacco
    indexed_attack_values.sort(key=lambda x: x[1])
    
    # Crea la mappatura degli indici vecchi -> nuovi
    old_to_new_indices = {}
    for new_idx, (old_idx, _) in enumerate(indexed_attack_values):
        old_to_new_indices[old_idx] = new_idx
    
    # Riorganizza tutte le tabelle in base a questa mappatura
    sorted_tables = []
    for table_num, data in tables:
        if table_num == attack_table_num:
            # Per la tabella attacco, ordina direttamente i valori
            sorted_data = [val for _, val in indexed_attack_values]
        else:
            # Per le altre tabelle, riorganizza i valori in base agli indici mappati
            sorted_data = [None] * len(data)
            for old_idx, value in enumerate(data):
                if old_idx < len(data):  # Protezione contro indici fuori range
                    new_idx = old_to_new_indices.get(old_idx, old_idx)
                    if new_idx < len(sorted_data):  # Altra protezione
                        sorted_data[new_idx] = value
        
        # Aggiungi la tabella riordinata al risultato
        sorted_tables.append((table_num, sorted_data))
    
    return sorted_tables


def create_combined_plot_chunked(tables, file_path, output_dir, docs_file=None, output_filename="all_tables_grid", chunk_size=100):
    """Create multiple figures with all tables in a grid of subplots, chunked in blocks.
    
    Args:
        tables: Lista di tuple (numero_tabella, dati)
        file_path: Percorso del file di origine
        output_dir: Directory dove salvare i grafici
        docs_file: File con i nomi delle tabelle (opzionale)
        output_filename: Nome base del file di output
        chunk_size: Dimensione del blocco standard per tabelle normali
    """
    
    # Cerca di leggere i nomi delle tabelle dal file .docs
    table_short_names = {}
    if docs_file:
        table_short_names = read_table_short_names(docs_file)
        # Ordina le tabelle in base ai tempi di attacco se la tabella attacco è presente
        if any("attacco" == name for name in table_short_names.values()):
            tables = sort_tables_by_attack(tables, table_short_names)
            print("Tabelle riordinate in base ai tempi di attacco.")


    if not tables:
        print(f"No valid tables found in {file_path}")
        return
    
    # Identifica le tabelle con un numero di punti molto maggiore
    table_sizes = [(table_num, len(data)) for table_num, data in tables]
    
    # Calcola la mediana delle dimensioni
    sizes = [size for _, size in table_sizes]
    sizes.sort()
    median_size = sizes[len(sizes) // 2]
    
    # Classifica ogni tabella come "normale" o "grande"
    large_tables_indices = []
    
    # Definiamo una tabella come "grande" se è almeno 5 volte più grande della mediana
    large_factor = 5
    
    for i, ((table_num, _), (_, size)) in enumerate(zip(tables, table_sizes)):
        if size > median_size * large_factor:
            # È una tabella grande
            print(f"Table {table_num} identified as large table ({size} points)")
            large_tables_indices.append(i)
    
    # Determina il numero massimo di punti per tabelle normali
    max_points_normal = 0
    for i, (_, data) in enumerate(tables):
        if i not in large_tables_indices:
            max_points_normal = max(max_points_normal, len(data))
    
    # Calcola quanti blocchi da chunk_size punti saranno necessari per tabelle normali
    num_chunks_normal = math.ceil(max_points_normal / chunk_size)
    
    # Calcola il numero massimo di blocchi necessari per le tabelle grandi
    max_chunks_large = 0
    for i in large_tables_indices:
        _, data = tables[i]
        table_chunks = math.ceil(len(data) / (chunk_size * 11))
        max_chunks_large = max(max_chunks_large, table_chunks)
    
    # Il numero totale di blocchi sarà il massimo tra quelli normali e quelli grandi
    num_chunks = max(num_chunks_normal, max_chunks_large)
    
    print(f"Data will be split into {num_chunks} chunks")
    
    # Per ogni blocco, crea un grafico separato
    for chunk_idx in range(num_chunks):
        # Calculate grid dimensions
        n_tables = len(tables)
        n_cols = 1  # Max 3 columns for better readability
        n_rows = n_tables  # Ceiling division
        
        # Create figure with subplots
        fig, axes = plt.subplots(n_rows, n_cols, figsize=(30, 8 * n_rows))
        fig.suptitle(f"Csound Tables from {os.path.basename(file_path)} (Chunk {chunk_idx+1}/{num_chunks})", fontsize=16)
        
        # Flatten axes array for easier indexing if there are multiple rows/columns
        if n_rows > 1 or n_cols > 1:
            axes = axes.flatten()
        else:
            axes = [axes]  # Convert to list for single subplot case
        
        colors = ['blue', 'red', 'green', 'orange', 'purple', 'brown', 'pink', 'gray', 'olive', 'cyan']
        
        # Plot each table in its own subplot
        for i, (table_num, data) in enumerate(tables):
            if i < len(axes):  # Ensure we don't exceed the number of subplots
                ax = axes[i]
                color = colors[i % len(colors)]
                
                # Determina se questa è una tabella grande
                is_large_table = i in large_tables_indices
                
                # Calcola gli indici di inizio e fine in base al tipo di tabella
                if is_large_table:
                    # Per tabelle grandi, usa un passo di chunk_size*11
                    start_idx = chunk_idx * (chunk_size * 11)
                    end_idx = min((chunk_idx + 1) * (chunk_size * 11), len(data))
                else:
                    # Per tabelle normali, usa un passo di chunk_size
                    start_idx = chunk_idx * chunk_size
                    end_idx = min((chunk_idx + 1) * chunk_size, len(data))
                
                # Estrai solo i dati per questo blocco
                chunk_data = data[start_idx:end_idx] if start_idx < len(data) else []
                chunk_indices = range(start_idx, start_idx + len(chunk_data))
                
                if chunk_data:  # Solo se ci sono dati da mostrare in questo blocco
                    # Plot points
                    ax.plot(chunk_indices, chunk_data, marker='.', markersize=8, linestyle='', color=color, alpha=0.8)
                    
                    # Plot stem lines
                    ax.stem(chunk_indices, chunk_data, linefmt='-', markerfmt='.', basefmt=" ")

                    max_labels = 20  # imposta un massimo di etichette da mostrare
                    step = max(1, len(chunk_data) // max_labels)
                    
                    for i in range(0, len(chunk_data), step):
                        idx = chunk_indices[i]
                        val = chunk_data[i]
                        # Formatta la label con il valore arrotondato a 2 decimali
                        ax.annotate(f"{val:.2f}", 
                                    (idx, val),
                                    textcoords="offset points", 
                                    xytext=(0, 10),  # offset verticale di 10 punti
                                    ha='center',  # allineamento orizzontale centrato
                                    fontsize=8)   # dimensione testo più piccola

                    # Add grid and labels
                    ax.grid(True, linestyle='--', alpha=0.5)
                    
                    # Trova il nome della tabella dal dizionario o usa il numero come fallback
                    table_title = f"Table {table_num}"
                    if table_num in table_short_names:
                        table_title = f"{table_short_names[table_num]} (Table {table_num})"
                    
                    if is_large_table:
                        table_title += f" [LARGE TABLE - Points {start_idx}-{end_idx-1}]"
                    else:
                        table_title += f" [Points {start_idx}-{end_idx-1}]"
                    
                    ax.set_title(table_title, fontsize=18)
                    ax.set_xlabel("Index", fontsize=16)
                    ax.set_ylabel("Value", fontsize=16)
                    ax.tick_params(axis='both', which='major', labelsize=12)
                    
                    # Add horizontal line at y=0
                    ax.axhline(y=0, color='black', linestyle='-', alpha=0.3)
                    
                    # Calculate y-axis limits
                    if chunk_data:
                        max_val = max(abs(max(chunk_data)), abs(min(chunk_data))) if chunk_data else 0
                        if max_val > 0:
                            if min(chunk_data) >= 0:
                                ax.set_ylim(0, max_val * 1.1)
                            else:
                                ax.set_ylim(min(chunk_data) * 1.1, max_val * 1.1)
                else:
                    # Se non ci sono dati per questo blocco, mostra un messaggio
                    ax.text(0.5, 0.5, "No data in this range", 
                            horizontalalignment='center', verticalalignment='center',
                            transform=ax.transAxes, fontsize=14)
                    
                    if is_large_table:
                        range_text = f"[LARGE TABLE - Range {start_idx}-{end_idx-1}]"
                    else:
                        range_text = f"[Range {start_idx}-{end_idx-1}]"
                    
                    ax.set_title(f"Table {table_num} {range_text}", fontsize=16)
        
        # Hide any unused subplots
        for j in range(min(i+1, len(axes)), len(axes)):
            axes[j].axis('off')
        
        # Adjust layout
        plt.tight_layout()
        plt.subplots_adjust(top=0.95, hspace=0.4)
        plt.rcParams.update({'font.size': 14})  # Aumenta dimensione font globale
        
        # Save the figure
        os.makedirs(output_dir, exist_ok=True)
        chunk_filename = f"{output_filename}_chunk{chunk_idx+1}.png"
        combined_file = os.path.join(output_dir, chunk_filename)
        plt.savefig(combined_file.replace('.png', '.pdf'), format='pdf', bbox_inches='tight')
        plt.close()
        
        print(f"Chunk {chunk_idx+1}/{num_chunks} saved as {combined_file}")

    pdf_files = [os.path.join(output_dir, f"{output_filename}_chunk{idx+1}.pdf") for idx in range(num_chunks)]
    output_merged_pdf = os.path.join(output_dir, f"{output_filename}_complete.pdf")
    pdf_files_str = " ".join(pdf_files)

    # Esegui il comando pdfunite
    import subprocess
    subprocess.run(f"pdfunite {pdf_files_str} {output_merged_pdf}", shell=True)
    print(f"All PDF chunks merged into {output_merged_pdf}")
    subprocess.run(f"rm {pdf_files_str}", shell=True)


def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <table_file> [docs_file] [output_directory] [output_filename] [chunk_size]")
        sys.exit(1)
    
    file_path = sys.argv[1]
    docs_file = sys.argv[2] if len(sys.argv) > 2 else None
    output_dir = sys.argv[3] if len(sys.argv) > 3 else os.path.dirname(file_path) or '.'
    output_filename = sys.argv[4] if len(sys.argv) > 4 else "all_tables_grid"
    
    # Aggiungi parametro per la dimensione del blocco (default: 100)
    chunk_size = int(sys.argv[5]) if len(sys.argv) > 5 else 100
    
    try:
        tables = extract_tables(file_path)
        print(f"Extracted {len(tables)} tables from {file_path}")
        # Filtra gli indici vuoti
        tables = filter_empty_indices(tables)
    
        create_combined_plot_chunked(tables, file_path, output_dir, docs_file, output_filename, chunk_size)

    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()