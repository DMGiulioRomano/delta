from Evento import Evento
from Comportamento import Comportamento

class Sezione(Evento):
    def __init__(self, attacco, durata, idSezione, dizionario):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.idSezione = idSezione
        self.dizionario = dizionario
        self.comportamenti = []
        self.genera_comportamenti()

    def genera_comportamenti(self):
        for index, c in enumerate(self.dizionario['comportamenti']):
            self.comportamenti.append(Comportamento(c['attacco'],c['durata'],c['ritmo'],c['durate'],index+1))

    def __str__(self):
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        [print(c) for c in self.comportamenti]
        return f"\n{self.idSezione}({', '.join(attributi)})"
