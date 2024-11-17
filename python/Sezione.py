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
            self.comportamenti.append(Comportamento(c['attacco'],c['durata'],c['metro'],c['ritmo'],c['durate'],index+1))

    def scriviCsd(self):
        for i in self.comportamenti:
            pass


    def __str__(self):
        # Elenco degli attributi da escludere
        esclusi = {"comportamenti"}  
        
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            f"{attributo}={valore!r}" 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]    
        # Stampa i comportamenti (se necessario)
        [print(c) for c in self.comportamenti]    
        # Ritorna la rappresentazione formattata
        return f"{self.idSezione}({', '.join(attributi)})\n"
