class Evento:
    def __init__(self, dizionario):
        self.attacco = dizionario.get('attacco', 0)  # Valore di default 0 se non presente
        self.durata = dizionario.get('durata', 0)    # Valore di default 0 se non presente
