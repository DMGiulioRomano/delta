from Evento import Evento

class EventoSonoro(Evento):
    def __init__(self, attacco, durata, idEventoSonoro):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.idEventoSonoro= idEventoSonoro

    def toCsoundStr(self):
        return f"i\t1\t{self.attaco}\t{self.durata}\t"

    def __str__(self) -> str:
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        return f"         EventoSonoro{self.idEventoSonoro}({', '.join(attributi)})"