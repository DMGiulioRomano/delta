import yaml
import os
import argparse
from csd_builder import Brano
import pdb

# Funzione per caricare un file YAML ignorando il contenuto dopo un delimitatore
def carica_yaml_con_delimitatore(filepath, delimiter="# STOP"):
    try:
        with open(filepath, 'r') as file:
            lines = file.readlines()
            relevant_lines = []
            for line in lines:
                if delimiter in line:
                    break
                relevant_lines.append(line)
            return yaml.safe_load("".join(relevant_lines))
    except FileNotFoundError:
        print(f"File {filepath} non trovato.")
        return None

# Funzione per caricare una specifica sezione YAML
def carica_sezione(sezione_nome):
    try:
        filepath = f"yaml_dir/sezioni/{sezione_nome}.yaml"
        return carica_yaml_con_delimitatore(filepath)
    except FileNotFoundError:
        print(f"Sezione {sezione_nome} non trovata.")
        return None

# Funzione per caricare tutte le sezioni YAML nella directory
def carica_tutte_sezioni():
    sezioni = {}
    for filename in os.listdir("yaml_dir/sezioni"):
        if filename.endswith(".yaml"):
            sezione_nome = filename.replace(".yaml", "")
            filepath = f"yaml_dir/sezioni/{filename}"
            sezioni[sezione_nome] = carica_yaml_con_delimitatore(filepath)
    return sezioni

if __name__ == "__main__":
    # Parser per gli argomenti del terminale
    parser = argparse.ArgumentParser(description="Script per gestire un file YAML e creare un file CSD.")
    parser.add_argument("yaml_file", help="Percorso del file YAML da processare.")
    parser.add_argument("--sezione", help="Nome della sezione da caricare (es. sezione1).", default=None)
    args = parser.parse_args()
    
    # Apre e carica i dati dal file YAML principale usando il delimitatore
    dizionario = carica_yaml_con_delimitatore(args.yaml_file)

    # Se viene passato il nome della sezione, carica solo quella
    if args.sezione:
        sezione = carica_sezione(args.sezione)
        if sezione:
            dizionario['brano']['sezioni'] = {args.sezione: sezione}
    else:
        # Altrimenti carica tutte le sezioni
        dizionario['brano']['sezioni'] = carica_tutte_sezioni()

    # Crea un'istanza di Brano utilizzando i dati dal file YAML
    brano = Brano(dizionario['brano'])

    # Scrive il file CSD
    brano.scriviCsd()
    
    # Eventuali altre operazioni (opzionali)
    brano.spazio.genera_e_plotta_con_slider_esponente_globale()
    brano.spazio.genera_e_plotta_funzioni()
    brano.spazio.plot_sinusoide_smorzata()
    brano.spazio.genera_e_plotta_polare_sine()
    brano.spazio.genera_e_plotta_polare_cosine()

    # Debug opzionale: stampa l'oggetto Brano
    # print(brano)
