import json
from Brano import Brano


if __name__ == "__main__":
    # Apre e carica i dati dal file JSON passato come parametro
    with open('config.json', 'r') as file:
        dizionario = json.load(file)
    brano = Brano(dizionario['brano'])  # Passa il nome del file JSON      # Calcola i rapporti
    #brano.scriviCsd()
    print(brano)