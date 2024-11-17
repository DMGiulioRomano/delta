from Evento import Evento
from EventoSonoro import EventoSonoro
from itertools import cycle

class Comportamento(Evento):
    def __init__(self, attacco, durata, metro, ritmo, durate, idComportamento):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.metro = metro
        self.ritmo = ritmo
        self.durate = durate
        self.idComportamento = idComportamento
        self.eventiSonori = []
        self.pField_2 = []
        self.pField_3 = []
        self.creaEventoSonoro()

    def creaEventoSonoro(self):
        self.calcolaPfield2()
        self.calcolaPfield3()
        for i, (p2, p3) in enumerate(zip(self.pField_2, self.pField_3)):
            self.eventiSonori.append(EventoSonoro(p2,p3,i))

    def calcolaPfield3(self):
        cycled = cycle(self.durate)
        for _ in range(len(self.pField_2)):
            self.pField_3.append(next(cycled)) 

    def calcolaPfield2(self):
        cycled_ritmo = cycle(self.ritmo)
        durata = self.durata
        while durata > 0:
            ritmoN = (1/next(cycled_ritmo))
            atN = self.metro*ritmoN
            self.pField_2.append(atN)
            durata -= atN

    def toCsoundStr(self):
        s=""
        for evento in self.eventiSonori:
            s += evento.toCsoundStr()
        return s

    def scriviCsd(self):
        # Leggi il file originale
        with open('csound/comportamento.csd', 'r') as file:
            lines = file.readlines()
        # Cerca la stringa "comportamento" e aggiungi "hello!" sotto di essa
        for index, line in enumerate(lines):
            if 'comportamento' in line:
                lines.insert(index + 1, "evento\n")
                break

        # Scrivi il nuovo contenuto in un nuovo file
        with open('csound/prova.csd', 'w') as new_file:
            new_file.writelines(lines)

    def __str__(self):
        # Elenco degli attributi da escludere
        esclusi = {"eventiSonori"}         
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            f"{attributo}={valore!r}" 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]    
        print(f"\n    COMPORTAMENTO {self.idComportamento}")
        [print(e) for e in self.eventiSonori]
        # Ritorna la rappresentazione formattata
        return f"     Comportamento{self.idComportamento}({', '.join(attributi)})"
