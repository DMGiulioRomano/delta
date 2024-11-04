import json

# Leggi il file JSON
with open('config.json', 'r') as file:
    dati = json.load(file)

# Associa i valori a variabili
titolo = dati['brano']['titolo']
durata = dati['brano']['durata']
quantita = dati['brano']['sezioni']['quantita']
rapporti = dati['brano']['sezioni']['rapporti']

# Stampa per conferma
print("Titolo:", titolo)
print("Durata:", durata)
print("Quantità sezioni:", quantita)
print("Rapporti:", rapporti)
