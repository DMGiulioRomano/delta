from Nota import Nota

class Sezioni:
    def __init__(self, idSezione, attacco, durata, dizionario):
        self.idSezione = idSezione
        self.attacco = attacco
        self.durata = durata
        self.dizionario = dizionario
        self.note = []

    def genera_note(self):
        pass
    
    def __str__(self):
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        return f"\nSezione{self.idSezione}({', \n '.join(attributi)})"
