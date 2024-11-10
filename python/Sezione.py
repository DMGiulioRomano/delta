from Nota import Nota
from Evento import Evento

class Sezione(Evento):
    def __init__(self, attacco, durata, idSezione, dizionario):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.idSezione = idSezione
        self.dizionario = dizionario
        self.note = []

    def genera_note(self):
        pass
    
    def __str__(self):
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        return f"\nSezione{self.idSezione}({', '.join(attributi)})"
