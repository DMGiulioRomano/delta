import yaml
from Brano import Brano

if __name__ == "__main__":
    # Apre e carica i dati dal file YAML passato come parametro
    with open('delta.yaml', 'r') as file:
        dizionario = yaml.safe_load(file)  # Usa safe_load per sicurezza

    # Crea un'istanza di Brano utilizzando i dati dal file YAML
    brano = Brano(dizionario['brano'])

    # Scrive il file CSD
    brano.scriviCsd()
    
    # Stampa le armoniche ritmiche 
    #brano.spazio.genera_e_plotta_con_slider_esponente_globale()
    #brano.spazio.genera_e_plotta_funzioni()

    # Stampa l'oggetto (opzionale, utile per debug)
    # print(brano)
