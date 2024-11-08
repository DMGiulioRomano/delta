import json
from Sezioni import Sezioni
from Forma import Forma

class Brano:
    def __init__(self, json_file):
        with open(json_file, 'r') as file:
            dati = json.load(file)

        self.titolo = dati['brano']['titolo']
        self.attacco = dati['brano']['attacco']
        self.durata = int(dati['brano']['durata']) * 60  # Converti la durata in secondi
        self.forma = Forma(dati['brano']['forma'])
        self.sezioni = dati['brano']['sezioni']
        self.rapporti = self.sezioni['rapporti']
        self.sezione1 = self.sezioni['sezione1']
        self.sezione2 = self.sezioni['sezione2']
        self.sezione3 = self.sezioni['sezione3']
        self.sezioni_oggetti = []

    def calcola_rapporti(self):
        divisore = sum(self.rapporti)
        for i in range(len(self.rapporti)):
            idSezione = i+1
            if i == 0:
                atSezione = 0 + self.attacco
            else:
                atSezione = (self.durata / divisore) * sum(self.rapporti[:i]) + self.attacco
            durSezione = (self.durata / divisore) * self.rapporti[i]
            s = Sezioni(idSezione,atSezione, durSezione, eval(f"self.sezione{idSezione}"))
            self.sezioni_oggetti.append(s)


    def __str__(self):
        [print(sezione) for sezione in self.sezioni_oggetti]
        self.forma.plotta_funzione()
        return (f"\n\nBrano(\n  titolo={self.titolo},\n"
                f"  attacco={self.attacco},\n"
                f"  durata={self.durata},\n"
                f"  rapporti={self.rapporti},\n"
                )
