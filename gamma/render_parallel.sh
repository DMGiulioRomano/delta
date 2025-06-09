#!/bin/bash
# Script per renderizzare tutti i comportamenti della gamma.
# Versione 3.0: Usa GNU 'parallel' per un rendering massivamente parallelo e intelligente.

echo "======================================================"
echo "RENDERING GAMMA COMPORTAMENTI (v3.0 - Parallelo)"
echo "======================================================"

CSD_DIR="./csd"
WAV_DIR="./wav"

# Assicurati che la cartella WAV esista
mkdir -p "$WAV_DIR"

# Verifica che 'parallel' sia installato
if ! command -v parallel &> /dev/null
then
    echo "ERRORE: GNU Parallel non è installato. Per favore, installalo con:"
    echo "brew install parallel"
    exit 1
fi

echo "Conteggio dei file CSD in corso..."
# 'find' è necessario per gestire un numero enorme di file
file_list=$(mktemp)
find "$CSD_DIR" -type f -name "*.csd" > "$file_list"
total=$(wc -l < "$file_list")

if [ "$total" -eq 0 ]; then
    echo "Nessun file .csd trovato in $CSD_DIR"
    rm "$file_list"
    exit 1
fi

echo "Trovati $total file. Avvio del rendering parallelo su tutti i core disponibili."
echo "Questo processo richiederà molto tempo. Puoi interromperlo (Ctrl+C) e riprenderlo."
echo "----------------------------------------------------------------------------------"

# --- Il Comando Magico ---
# --bar: mostra una barra di progresso
# --eta: mostra il tempo stimato rimanente
# --jobs 100%: usa un job per ogni core della CPU
# --joblog render.log: crea un log per poter riprendere il lavoro (--resume)
# csound {}: esegue il comando csound per ogni file di input
cat "$file_list" | parallel --bar --eta --jobs 100% --joblog render.log 'csound {} &> /dev/null'

# Rimuovi il file temporaneo
rm "$file_list"

echo ""
echo "======================================"
echo "RENDERING COMPLETATO!"
echo "File WAV salvati in: $WAV_DIR"
echo "Log di rendering salvato in: render.log"
echo "======================================"