from Evento import Evento

class EventoSonoro(Evento):
    def __init__(self, dizionario):
    #def __init__(self, attacco, durata, ampiezza, frequenze, idEventoSonoro):
        super().__init__(dizionario)  # Inizializza i punti usando il costruttore della superclasse
        self.idEventoSonoro= dizionario['idEventoSonoro']
        self.ampiezza = dizionario['ampiezza']
        self.frequenza = dizionario['frequenza']

    def toCsoundStr(self):
        return f"i1\t{self.attacco}\t{self.durata}\t{self.ampiezza}\t{self.frequenza}"

    def __str__(self) -> str:
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        return f"         EventoSonoro{self.idEventoSonoro}({', '.join(attributi)})"