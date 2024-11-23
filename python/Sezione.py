from Evento import Evento
from Comportamento import Comportamento

class Sezione(Evento):
    def __init__(self, dizionario):
    #def __init__(self, attacco, durata, idSezione, dizionario):
        super().__init__(dizionario)  # Inizializza i punti usando il costruttore della superclasse
        self.idSezione = dizionario['idSezione']
        self.dizionario = dizionario
        self.comportamenti = []
        self.genera_comportamenti()

    def genera_comportamenti(self):
        for index, c in enumerate(self.dizionario['comportamenti']):
            self.comportamenti.append(Comportamento(c,self.attacco,index+1))
            self.attacco = self.comportamenti[-1].durata

    def scriviCsd(self):
        for comportamento in self.comportamenti:
            comportamento.scriviCsd(self.idSezione)


    def __str__(self):
        # Elenco degli attributi da escludere
        esclusi = {"comportamenti"}  
        
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            f"{attributo}={valore!r}" 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]
        print(f"\n    SEZIONE")
    
        # Stampa i comportamenti (se necessario)
        [print(c) for c in self.comportamenti]    
        # Ritorna la rappresentazione formattata
        return f"SEZIONE {self.idSezione}({', '.join(attributi)})\n"
