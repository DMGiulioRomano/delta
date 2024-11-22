from Evento import Evento

class EventoSonoro(Evento):
    def __init__(self, attacco, durata, ampiezza, frequenze, idEventoSonoro):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.idEventoSonoro= idEventoSonoro
        self.ampiezza = ampiezza
        self.frequenze = frequenze

    def toCsoundStr(self):
        return f"i1\t{self.attacco}\t{self.durata}\t{self.ampiezza}\t{self.frequenze}"

    def __str__(self) -> str:
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        return f"         EventoSonoro{self.idEventoSonoro}({', '.join(attributi)})"