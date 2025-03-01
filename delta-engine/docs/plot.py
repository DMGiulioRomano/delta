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

def create_combined_plot(tables, file_path, output_dir, output_filename="all_tables_grid.png"):
    """Create a single figure with all tables in a grid of subplots."""
    # Definizione delle etichette personalizzate per i subplot
    custom_labels = ["attacco", "durata", "ritmi", "durata armonica", "ampiezza", "ottava", "registro", "posizione"]
    
    if not tables:
        print(f"No valid tables found in {file_path}")
        return
    
    # Calculate grid dimensions
    n_tables = len(tables)
    n_cols = 1  # Max 3 columns for better readability
    n_rows = n_tables  # Ceiling division
    
    # Create figure with subplots
    fig, axes = plt.subplots(n_rows, n_cols, figsize=(15, 5 * n_rows))
    fig.suptitle(f"Csound Tables from {os.path.basename(file_path)}", fontsize=16)
    
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
            
            # Plot points
            ax.plot(range(len(data)), data, marker='o', linestyle='', color=color, alpha=0.7)
            
            # Plot stem lines
            ax.stem(range(len(data)), data, linefmt='-', markerfmt='o', basefmt=" ")
            
            # Add grid and labels
            ax.grid(True, linestyle='--', alpha=0.5)
            # Usa l'etichetta personalizzata se disponibile, altrimenti usa l'etichetta predefinita
            if i < len(custom_labels):
                ax.set_title(custom_labels[i])
            else:
                ax.set_title(f"Table {table_num}")
            ax.set_xlabel("Index")
            ax.set_ylabel("Value")
            
            # Add horizontal line at y=0
            ax.axhline(y=0, color='black', linestyle='-', alpha=0.3)
            
            # Calculate y-axis limits
            if data:
                max_val = max(abs(max(data)), abs(min(data)))
                if max_val > 0:
                    if min(data) >= 0:
                        ax.set_ylim(0, max_val * 1.1)
                    else:
                        ax.set_ylim(min(data) * 1.1, max_val * 1.1)
    
    # Hide any unused subplots
    for j in range(i + 1, len(axes)):
        axes[j].axis('off')
    
    # Adjust layout
    plt.tight_layout()
    plt.subplots_adjust(top=0.95)
    
    # Save the figure
    os.makedirs(output_dir, exist_ok=True)
    combined_file = os.path.join(output_dir, output_filename)
    plt.savefig(combined_file, format='png', dpi=150, bbox_inches='tight')
    plt.close()
    
    print(f"Combined grid plot saved as {combined_file}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <file_path> [output_directory] [output_filename]")
        sys.exit(1)
    
    file_path = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.dirname(file_path) or '.'
    output_filename = sys.argv[3] if len(sys.argv) > 3 else "all_tables_grid.png"
    
    try:
        tables = extract_tables(file_path)
        create_combined_plot(tables, file_path, output_dir, output_filename)
        
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()