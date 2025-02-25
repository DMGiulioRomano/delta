"""
Csound Multi-Table Plotting Script
==================================

This script extracts data from Csound table files and creates a graphical representation
for each table found in the file.

Based on the original script by Francesco Vitucci with enhancements to:
- Process all tables in a single file
- Create a separate plot for each table
- Save plots with table numbers in filenames
- Display non-zero values only by default
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

def plot_table(table_num, data, output_dir, non_zero_only=False, include_zero_line=True):
    """Create and save a plot for a single table."""
    plt.figure(figsize=(12, 6))
    
    # Always show all elements by default
    plot_data = data
    plot_indices = list(range(len(data)))
    
    if non_zero_only:
        non_zero_indices = [i for i, val in enumerate(data) if val != 0]
        if not non_zero_indices:
            print(f"Table {table_num} contains only zeros, plotting all values anyway")
        else:
            plot_data = [data[i] for i in non_zero_indices]
            plot_indices = non_zero_indices
    
    # Set up plot
    plt.title(f"Csound Table {table_num}")
    plt.grid(True, linestyle='--', alpha=0.7)
    
    # Plot points
    plt.plot(plot_indices, plot_data, marker='o', linestyle='', color='black')
    
    # Plot stem lines
    markerline, stemlines, baseline = plt.stem(
        plot_indices, plot_data, 
        linefmt='-', markerfmt='o', basefmt=" "
    )
    plt.setp(stemlines, 'color', 'black')
    
    # Add zero line if requested
    if include_zero_line:
        plt.axhline(y=0, color='gray', linestyle='-', alpha=0.5)
    
    # Calculate y-axis limits
    if data:
        max_val = max(abs(max(plot_data)), abs(min(plot_data)))
        # If all values are positive, start at 0
        if min(plot_data) >= 0:
            plt.ylim(0, max_val * 1.1)
        else:
            plt.ylim(min(plot_data) * 1.1, max_val * 1.1)
    
    # Add x-labels showing indices of points
    if non_zero_only and len(plot_indices) < 20:
        plt.xticks(plot_indices, [str(i) for i in plot_indices])
    
    # Add labels
    plt.xlabel("Index")
    plt.ylabel("Value")
    
    # Save the figure
    output_file = os.path.join(output_dir, f"table_{table_num}.png")
    plt.savefig(output_file, format='png', dpi=150, bbox_inches='tight')
    plt.close()
    
    print(f"Plot for table {table_num} saved as {output_file}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <file_path> [output_directory]")
        sys.exit(1)
    
    file_path = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.dirname(file_path) or '.'
    
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    try:
        tables = extract_tables(file_path)
        
        if not tables:
            print(f"No valid tables found in {file_path}")
            return
        
        print(f"Found {len(tables)} tables with non-zero data")
        
        for table_num, data in tables:
            plot_table(table_num, data, output_dir)
        
        # Create a subplot figure with all tables in separate panes
        tables_with_data = [(table_num, data) for table_num, data in tables]
        
        # Calculate grid dimensions
        n_tables = len(tables_with_data)
        n_cols = 2  # Number of columns in the grid
        n_rows = (n_tables + n_cols - 1) // n_cols  # Ceiling division
        
        # Create figure with subplots
        fig, axes = plt.subplots(n_rows, n_cols, figsize=(15, 4 * n_rows))
        fig.suptitle(f"Csound Tables from {os.path.basename(file_path)}", fontsize=16)
        
        # Flatten axes array for easier indexing if there are multiple rows
        if n_rows > 1:
            axes = axes.flatten()
        elif n_cols == 1:  # Special case for just one subplot
            axes = [axes]
            
        colors = ['blue', 'red', 'green', 'orange', 'purple', 'brown', 'pink', 'gray', 'olive', 'cyan']
        
        # Plot each table in its own subplot
        for i, (table_num, data) in enumerate(tables_with_data):
            if i < len(axes):  # Ensure we don't exceed the number of subplots
                ax = axes[i]
                color = colors[i % len(colors)]
                
                # Plot the data
                ax.plot(range(len(data)), data, marker='.', linestyle='-', color=color)
                ax.stem(range(len(data)), data, linefmt='-', markerfmt='.', basefmt=" ", use_line_collection=True)
                
                # Add grid and labels
                ax.grid(True, linestyle='--', alpha=0.5)
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
        combined_file = os.path.join(output_dir, "all_tables_grid.png")
        plt.savefig(combined_file, format='png', dpi=150, bbox_inches='tight')
        plt.close()
        
        print(f"Combined grid plot saved as {combined_file}")
        
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()