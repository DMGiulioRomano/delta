"""
Csound Data Plotting Script
===========================

This script extracts data from Csound table files and creates a graphical representation.

Original script by Francesco Vitucci:
https://github.com/s-e-a-m/csound-libraries/blob/main/doc/plot.py

Modified with additional error handling and main function structure.
"""

import matplotlib.pyplot as plt
import sys

def estrai_dati(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
        start_index = None
        end_index = None
        
        for i, line in enumerate(lines):
            if "---------END OF HEADER--------------\n" in line:
                start_index = i + 1
            if "---------END OF TABLE---------------\n" in line:
                end_index = i
                break
                
        if start_index is not None and end_index is not None:
            data_lines = lines[start_index:end_index]
            data = []
            for line in data_lines:
                line = line.strip()
                if line:
                    try:
                        data.extend([float(value) for value in line.split()])
                    except ValueError:
                        print(f"Parsing error on line: {repr(line)}")
            return data
        else:
            raise ValueError("The delimiting lines could not be found in the file.")

def plot_dati(data, output_file):
    plt.figure(figsize=(18, 6))
    plt.grid(visible=True)
    plt.plot(data, marker='o', linestyle='', color='black')
    plt.grid(True)
    max_val = max(abs(max(data)), abs(min(data)))
    ax = plt.gca()
    ax.set_ylim([0, max_val])
    plt.yticks([0, max_val/4, max_val/2, (max_val/4)*3, max_val])
#    plt.plot(range(len([1])), [1], linestyle='-', color='red')
#    markerline2, stemlines2, baseline2 = plt.stem(range(len([1])), [1], linefmt='--', markerfmt='red', basefmt=" ")
#    plt.setp(stemlines2, 'color', 'red')
    markerline, stemlines, baseline = plt.stem(range(len(data)), data, linefmt='-', markerfmt='black', basefmt=" ")
    plt.setp(stemlines, 'color', 'black')
    # plt.show()
    plt.savefig(output_file, format='png')

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <file_path>")
        sys.exit(1)
        
    file_path = sys.argv[1]
    try:
        dati = estrai_dati(file_path)
        plot_dati(dati, file_path+'.png')
        print(f"Plot saved as {file_path}.png")
    except ValueError as e:
        print(e)
        sys.exit(1)