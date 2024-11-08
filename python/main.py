from Brano import Brano


if __name__ == "__main__":
    brano = Brano('config.json')  # Passa il nome del file JSON
    brano.calcola_rapporti()       # Calcola i rapporti
    print(brano)
