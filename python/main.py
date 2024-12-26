import yaml
import os
import argparse
from Brano import Brano
import pdb
# Funzione per caricare una sezione specifica
def carica_sezione(sezione_nome):
    try:
        # Aggiorna il percorso per cercare i file nella sottocartella 'yaml_dir/sezioni/'
        with open(f"yaml_dir/sezioni/{sezione_nome}.yaml", 'r') as file:
            return yaml.safe_load(file)
    except FileNotFoundError:
        print(f"Sezione {sezione_nome} non trovata.")
        return None

# Funzione per caricare tutte le sezioni
def carica_tutte_sezioni():
    sezioni = {}
    # Percorso aggiornato per cercare i file nella cartella 'yaml_dir/sezioni/'
    for filename in os.listdir("yaml_dir/sezioni"):
        if filename.endswith(".yaml"):
            sezione_nome = filename.replace(".yaml", "")
            with open(f"yaml_dir/sezioni/{filename}", 'r') as file:
                sezioni[sezione_nome] = yaml.safe_load(file)
    return sezioni

if __name__ == "__main__":
    # Parser per gli argomenti del terminale
    parser = argparse.ArgumentParser(description="Script per gestire un file YAML e creare un file CSD.")
    parser.add_argument("yaml_file", help="Percorso del file YAML da processare.")
    parser.add_argument("--sezione", help="Nome della sezione da caricare (es. sezione1).", default=None)
    args = parser.parse_args()
    # Apre e carica i dati dal file YAML principale
    with open(args.yaml_file, 'r') as file:
        dizionario = yaml.safe_load(file)

    # Se viene passato il nome della sezione, carica solo quella
    if args.sezione:
        sezione = carica_sezione(args.sezione)
        if sezione:
            dizionario['brano']['sezioni'] = {args.sezione: sezione}
    else:
        # Altrimenti carica tutte le sezioni
        dizionario['brano']['sezioni'] = carica_tutte_sezioni()
    #pdb.set_trace()
    # Crea un'istanza di Brano utilizzando i dati dal file YAML
    brano = Brano(dizionario['brano'])

    # Scrive il file CSD
    brano.scriviCsd()
    
    # Eventuali altre operazioni
    # brano.spazio.genera_e_plotta_con_slider_esponente_globale()
    # brano.spazio.genera_e_plotta_funzioni()
    # brano.spazio.plot_sinusoide_smorzata()
    # Stampa l'oggetto (opzionale, utile per debug)
    # print(brano)
