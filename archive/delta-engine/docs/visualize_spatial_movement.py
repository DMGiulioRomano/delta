#!/usr/bin/env python3
"""
Spatial Movement Visualization Script
=====================================

This script creates visualizations of the spatial movement metric from the delta-engine,
showing how the movement evolves over time and its correlation with other compositional parameters.
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import sys
import os
import seaborn as sns

def visualize_spatial_movement(file_path):
    """Creates visualizations of the spatial movement data."""
    try:
        df = pd.read_csv(file_path)
        df = df.sort_values(by='time').reset_index(drop=True)
    except Exception as e:
        print(f"Error reading file: {e}")
        return
    
    if df.empty or 'spatial_movement' not in df.columns:
        print("No spatial movement data found in the file")
        return
    
    # Create output directory
    output_dir = os.path.dirname(file_path)
    output_dir = os.path.join(output_dir, "plots")
    os.makedirs(output_dir, exist_ok=True)
    
    # 1. Time series plot of spatial movement
    plt.figure(figsize=(15, 8))
    
    plt.plot(df['time'], df['spatial_movement'], 'g-', linewidth=2, 
             label='Spatial Movement')
    plt.fill_between(df['time'], df['spatial_movement'], alpha=0.3, color='green')
    
    plt.title('Spatial Movement Evolution Over Time')
    plt.xlabel('Time (seconds)')
    plt.ylabel('Spatial Movement')
    plt.grid(True, alpha=0.3)
    
    # Add statistical annotations
    avg_movement = df['spatial_movement'].mean()
    max_movement = df['spatial_movement'].max()
    plt.axhline(y=avg_movement, color='r', linestyle='--', 
                label=f'Average: {avg_movement:.4f}')
    plt.axhline(y=max_movement, color='b', linestyle=':', 
                label=f'Maximum: {max_movement:.4f}')
    
    plt.legend(loc='best')
    plt.tight_layout()

    output_path = os.path.join(output_dir, "spatial_movement_time_series.png")
    plt.savefig(output_path, dpi=150)
    plt.close()
    
    # 2. Correlation with density
    if 'harmonic_density' in df.columns:
        plt.figure(figsize=(10, 8))
        
        scatter = plt.scatter(df['spatial_movement'], df['harmonic_density'], 
                   alpha=0.6, c=df['time'], cmap='viridis', 
                   label='Data points colored by time')
        
        plt.colorbar(scatter, label='Time (seconds)')
        plt.title('Relationship Between Spatial Movement and Harmonic Density')
        plt.xlabel('Spatial Movement')
        plt.ylabel('Harmonic Density')
        plt.grid(True, alpha=0.3)
        
        # Calculate correlation
        corr = df['spatial_movement'].corr(df['harmonic_density'])
        plt.annotate(f"Correlation: {corr:.4f}", 
                    xy=(0.05, 0.95), xycoords='axes fraction',
                    bbox=dict(boxstyle="round,pad=0.3", fc="white", ec="gray", alpha=0.8))
        
        
        plt.tight_layout()
        correlation_path = os.path.join(output_dir, "spatial_movement_density_correlation.png")
        plt.savefig(correlation_path, dpi=150)
        plt.close()

    # 3. Create a heatmap for visualization in time
    plt.figure(figsize=(15, 4))
    
    # Normalize the data for better visualization
    spatial_normalized = df['spatial_movement'] / df['spatial_movement'].max()
    
    plt.imshow([spatial_normalized], aspect='auto', cmap='inferno',
              extent=[df['time'].min(), df['time'].max(), 0, 1])
    
    plt.colorbar(label='Normalized Spatial Movement')
    plt.title('Spatial Movement Intensity Over Time')
    plt.xlabel('Time (seconds)')
    plt.yticks([])
    
    plt.tight_layout()
    heatmap_path = os.path.join(output_dir, "spatial_movement_heatmap.png")
    plt.savefig(heatmap_path, dpi=150)
    plt.close()
    
    # 4. Distribution of spatial movement values
    plt.figure(figsize=(12, 6))
    
    # Add label for the histogram
    hist = sns.histplot(df['spatial_movement'], kde=True, bins=20, 
                       color='green', alpha=0.7)
    # Aggiungi l'istogramma alla legenda manualmente
    from matplotlib.patches import Patch
    legend_elements = [Patch(facecolor='green', alpha=0.7, label='Frequency distribution')]

    # Calculate statistics
    avg_movement = df['spatial_movement'].mean()
    median_movement = df['spatial_movement'].median()
    q1 = df['spatial_movement'].quantile(0.25)
    q3 = df['spatial_movement'].quantile(0.75)
    
    # Add reference lines
    plt.axvline(x=avg_movement, color='r', linestyle='--', 
                label=f'Mean: {avg_movement:.4f}')
    plt.axvline(x=median_movement, color='blue', linestyle=':', 
                label=f'Median: {median_movement:.4f}')
    plt.axvline(x=q1, color='purple', linestyle='-.', 
                label=f'Q1: {q1:.4f}')
    plt.axvline(x=q3, color='purple', linestyle='-.', 
                label=f'Q3: {q3:.4f}')

    # Usa legend_elements per aggiungere l'istogramma alla legenda
    handles, labels = plt.gca().get_legend_handles_labels()
    plt.legend(handles=legend_elements + handles, loc='best')

    plt.title('Distribution of Spatial Movement Values')
    plt.xlabel('Spatial Movement')
    plt.ylabel('Frequency')
    plt.grid(True, alpha=0.3)
    
    plt.tight_layout()
    
    hist_path = os.path.join(output_dir, "spatial_movement_distribution.png")
    plt.savefig(hist_path, dpi=150)
    plt.close()
    
    # 5. Movement vs Overlap comparison
    if 'active_events' in df.columns:
        plt.figure(figsize=(15, 8))
        
        # Create two subplots
        fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(15, 10), sharex=True)
        
        # Plot spatial movement
        ax1.plot(df['time'], df['spatial_movement'], 'g-', linewidth=2, 
                 label='Spatial Movement')
        ax1.fill_between(df['time'], df['spatial_movement'], alpha=0.3, color='green')
        
        # Add statistics to spatial movement
        sm_avg = df['spatial_movement'].mean()
        sm_max = df['spatial_movement'].max()
        ax1.axhline(y=sm_avg, color='r', linestyle='--', 
                    label=f'Avg: {sm_avg:.4f}')
        ax1.axhline(y=sm_max, color='darkgreen', linestyle=':', 
                    label=f'Max: {sm_max:.4f}')
        
        ax1.set_ylabel('Spatial Movement')
        ax1.grid(True, alpha=0.3)
        ax1.legend(loc='upper right')
        
        # Plot active events
        ax2.plot(df['time'], df['active_events'], 'b-', linewidth=2, 
                 label='Active Events')
        ax2.fill_between(df['time'], df['active_events'], alpha=0.3, color='blue')
        
        # Add statistics to active events
        ae_avg = df['active_events'].mean()
        ae_max = df['active_events'].max()
        ax2.axhline(y=ae_avg, color='r', linestyle='--', 
                    label=f'Avg: {ae_avg:.2f}')
        ax2.axhline(y=ae_max, color='darkblue', linestyle=':', 
                    label=f'Max: {ae_max}')
        
        ax2.set_xlabel('Time (seconds)')
        ax2.set_ylabel('Active Events')
        ax2.grid(True, alpha=0.3)
        ax2.legend(loc='upper right')
        
        plt.suptitle('Comparison of Spatial Movement and Event Overlap')
        plt.tight_layout()

        comparison_path = os.path.join(output_dir, "spatial_movement_overlap_comparison.png")
        plt.savefig(comparison_path, dpi=150)
        plt.close()
    
    print(f"Spatial movement visualizations saved to {output_dir}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python visualize_spatial_movement.py <harmonic_data_csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    visualize_spatial_movement(file_path)

if __name__ == "__main__":
    main()