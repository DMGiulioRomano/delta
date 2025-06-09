#!/bin/bash
# Script per renderizzare tutti i comportamenti della gamma.
# Versione 2.0: Usa 'find' per gestire un numero molto grande di file
# e prevenire l'errore "Argument list too long".

echo "======================================"
echo "RENDERING GAMMA COMPORTAMENTI (v2.0)"
echo "======================================"

CSD_DIR="./csd"
WAV_DIR="./wav"

# Assicurati che la cartella WAV esista
mkdir -p "$WAV_DIR"

# --- Conteggio dei file (metodo sicuro) ---
# Usa 'find' invece di 'ls' per contare i file senza superare i limiti degli argomenti.
echo "Conteggio dei file CSD in corso..."
total=$(find "$CSD_DIR" -type f -name "*.csd" | wc -l)

if [ "$total" -eq 0 ]; then
    echo "Nessun file .csd trovato in $CSD_DIR"
    exit 1
fi

echo "Trovati $total file da renderizzare. L'operazione potrebbe richiedere molto tempo."
current=0

# --- Loop di rendering (metodo sicuro) ---
# Usa 'find' per trovare i file e un loop 'while read' per processarli uno ad uno.
# Questo è il modo corretto per iterare su un numero potenzialmente enorme di file.
find "$CSD_DIR" -type f -name "*.csd" | while read -r file; do
    current=$((current + 1))
    filename=$(basename -- "$file")
    echo ""
    echo "[$current/$total] Rendering: $filename"
    echo "-------------------------------------"
    
    # Renderizza con Csound
    csound "$file" &> /dev/null
    
    if [ $? -eq 0 ]; then
        echo "✓ Completato"
    else
        echo "✗ Errore nel rendering di $filename"
    fi
done

echo ""
echo "======================================"
echo "RENDERING COMPLETATO!"
echo "File WAV salvati in: $WAV_DIR"
echo "======================================"
