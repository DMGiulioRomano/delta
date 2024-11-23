from Evento import Evento
from EventoSonoro import EventoSonoro
from itertools import cycle

class Comportamento(Evento):
    def __init__(self, dizionario, offsetAttacco, idComportamento):
    #def __init__(self, attacco, durata, durataArmonica, ritmo, durate, ampiezze, frequenze, offsetAttacco, idComportamento):
        super().__init__(dizionario)  # Inizializza i punti usando il costruttore della superclasse
        self.durataArmonica = dizionario['durataArmonica']
        self.ritmo = dizionario['ritmo']
        self.durate = dizionario['durate']
        self.ampiezze = dizionario['ampiezze']
        self.frequenze = dizionario['frequenze']
        self.offsetAttacco = offsetAttacco
        self.idComportamento = idComportamento
        self.eventiSonori = []
        self.pField_2 = []
        self.pField_3 = []
        self.pField_4 = []
        self.pField_5 = []
        self.creaEventoSonoro()

    def creaEventoSonoro(self):
        self.calcolaPfield2()
        self.calcolaPfield3()
        self.calcolaPfield4()
        self.calcolaPfield5()
        for i, (p2, p3, p4, p5) in enumerate(zip(self.pField_2, self.pField_3, self.pField_4, self.pField_5)):
            dictEvento = {'attacco' : p2 , 'durata' : p3, 'ampiezza' : p4 , 'frequenza' : p5 , 'idEventoSonoro': i}
            self.eventiSonori.append(EventoSonoro(dictEvento))

    def calcolaPfield3(self):
        cycled = cycle(self.durate)
        for _ in range(len(self.pField_2)):
            ritmoN = 1/next(cycled)
            durN = self.durataArmonica*ritmoN
            self.pField_3.append(durN) 

    def calcolaPfield5(self):
        cycled = cycle(self.frequenze)
        for _ in range(len(self.pField_2)):
            self.pField_5.append(next(cycled)) 

    def calcolaPfield4(self):
        cycled = cycle(self.ampiezze)
        for _ in range(len(self.pField_2)):
            self.pField_4.append(next(cycled)) 

    def calcolaPfield2(self):
        cycled_ritmo = cycle(self.ritmo)
        durata = self.durata
        while durata > 0:
            if not self.pField_2:
                atN = self.offsetAttacco
                ritmoN=1/self.ritmo[0]
            else:
                ritmoN = (1/next(cycled_ritmo))
                atN = self.durataArmonica*ritmoN + self.pField_2[-1]
            self.pField_2.append(atN)
            durata = durata - self.durataArmonica*ritmoN

    def toCsoundStr(self):
        return "\n".join([ evento.toCsoundStr() for evento in self.eventiSonori])

    def scriviCsd(self,idSezione):
        comportamento = self.toCsoundStr()
        directory = "csound/generazione/"
        subdirExport = "wav/"
        namefile = f"-o \"{directory}{subdirExport}sezione{idSezione}-Comportamento{self.idComportamento}.wav\" -W"
        # Leggi il file originale
        with open('csound/comportamento.csd', 'r') as file:
            lines = file.readlines()
        # Cerca la stringa "comportamento" e aggiungi "hello!" sotto di essa
        for index, line in enumerate(lines):
            if 'comportamento' in line:
                lines.insert(index + 1, comportamento)
                break
            if '; namefile' in line:
                lines.insert(index +1, namefile)
        # Scrivi il nuovo contenuto in un nuovo file
        nomeFile = f"{directory}{idSezione}-Comportamento{self.idComportamento}.csd"
        with open(nomeFile, 'w') as new_file:
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
