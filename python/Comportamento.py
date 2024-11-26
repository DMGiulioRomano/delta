from Evento import Evento
from EventoSonoro import EventoSonoro
from itertools import cycle

class Comportamento(Evento):
    def __init__(self, dizionario, offsetAttacco, idComportamento):
        super().__init__(dizionario)  # Inizializza i punti usando il costruttore della superclasse
        self.offsetAttacco = offsetAttacco
        self.idComportamento = idComportamento
        self.lista_tuples = list(dizionario.items())
        self.durataArmonica = dizionario['durataArmonica']
        self.ritmo = dizionario['ritmo']
        self.generaAttributi()
        self.eventiSonori = []
        #self.creaEventoSonoro()

    def generaAttributi(self):
        for i, (chiave, valore) in enumerate(self.lista_tuples[4:], start=3):
            setattr(self, chiave, valore)  # Assegna dinamicamente l'attributo
            # Crea dinamicamente un attributo "pfield{i}" che è una lista vuota
            setattr(self, f"pfield{i}", [])

    def creaEventoSonoro(self):
        self.calcolaPfield2()
        self.calcolaPfield()
        # Cicliamo per ogni evento che dobbiamo creare
        for i in range(len(self.pfield2)):
            # Creiamo il dizionario per l'evento
            dictEvento = {'idEventoSonoro': i}

            # Cicliamo attraverso gli attributi dinamici pfield3, pfield4, ..., pfieldX
            for j in range(3, len(self.lista_tuples[4:]) + 3):  # Iniziamo da 3 per "pfield3"
                pfield_attr = f"pfield{j}"
                if hasattr(self, pfield_attr):  # Verifica che l'attributo esista
                    # Otteniamo il valore corrispondente all'indice `i` dal pfield
                    valore = getattr(self, pfield_attr)[i]
                    # Aggiungiamo il valore al dizionario, usando una chiave descrittiva
                    dictEvento[self.lista_tuples[j - 3][0]] = valore  # La chiave è presa dalla lista_tuples

            # Aggiungiamo l'evento sonoro alla lista
            self.eventiSonori.append(EventoSonoro(dictEvento))

    def calcolaPfield(self):
        # Ciclo attraverso gli attributi dinamici che iniziano con "pfield"
        for i in range(3, len(self.lista_tuples[4:]) + 3):  # Iniziamo da 3 per "pfield3"
            pfield_attr = f"pfield{i}"
            if hasattr(self, pfield_attr):  # Verifica se l'attributo esiste
                # Eseguiamo un ciclo sui valori da assegnare a ciascun pfield
                cycled = cycle(getattr(self, self.lista_tuples[i - 3][0]))  # Recuperiamo la lista da associare
                for _ in range(len(self.pfield2)):  # Usa la lunghezza di pfield2 per il ciclo
                    getattr(self, pfield_attr).append(next(cycled))  # Assegna i valori dinamicamente

    """    def calcolaPfieldOld(self):
        cycled = cycle(self.ampiezze)
        for _ in range(len(self.pfield2)):
            self.pField_4.append(next(cycled)) 
    """
    def calcolaPfield2(self):
        self.pfield2=[]
        cycled_ritmo = cycle(self.ritmo)
        durata = self.durata
        while durata > 0:
            if not self.pfield2:
                atN = self.offsetAttacco
                ritmoN=1/self.ritmo[0]
            else:
                ritmoN = (1/next(cycled_ritmo))
                atN = self.durataArmonica*ritmoN + self.pfield2[-1]
            self.pfield2.append(atN)
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
        esclusi = {"eventiSonori","lista_tuples"}
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
