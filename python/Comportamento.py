from Evento import Evento
from EventoSonoro import EventoSonoro
from itertools import cycle

class Comportamento:
    # attributi relativi al comportamento hanno lachiave che inizia per c. 
    # es. cAttacco, cDurata. 
    def __init__(self, dizionario, idComportamento):
        self.sezioneAttacco = 1000000000 # da modificare la funzione 'calcolaPfield2'
        self.idComportamento = idComportamento
        self.lista_tuples = list(dizionario.items())
        self.generaAttributi()
        self.eventiSonori = []
        #self.creaEventoSonoro()

    def generaAttributi(self):
        # Itera su tutta la lista di tuple, partendo dall'indice 0
        for i, (chiave, valore) in enumerate(self.lista_tuples):
            # Assegna sempre dinamicamente l'attributo
            setattr(self, chiave, valore)
            # Crea dinamicamente un attributo "pfield{i}" solo se i >= 3
            if i >= 3:
                setattr(self, f"pfield{i}", [])

    def creaEventoSonoro(self):
        self.calcolaPfield2()
        self.calcolaPfield()
        # Cicliamo per ogni evento che dobbiamo creare
        for i in range(len(self.pfield2)):
            # Creiamo il dizionario per l'evento
            dictEvento = {'idEventoSonoro': i}
            # Cicliamo attraverso gli attributi dinamici pfield3, pfield4, ..., pfieldX
            # Iniziamo da 3 per "pfield3"
            for j in range(3, len(self.lista_tuples[4:]) + 3):  
                pfield_attr = f"pfield{j}"
                # Verifica che l'attributo esista
                if hasattr(self, pfield_attr):  
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
            # Verifica se l'attributo esiste
            if hasattr(self, pfield_attr):  
                # Eseguiamo un ciclo sui valori da assegnare a ciascun pfield
                # Recuperiamo la lista da associare
                cycled = cycle(getattr(self, self.lista_tuples[i - 3][0]))  
                # Usa la lunghezza di pfield2 per il ciclo
                for _ in range(len(self.pfield2)):  
                    # Assegna i valori dinamicamente
                    getattr(self, pfield_attr).append(next(cycled))  

    def calcolaPfield2(self):
        self.pfield2=[]
        cycled_ritmo = cycle(self.ritmo)
        cdurata = self.cdurata
        while cdurata > 0:
            if not self.pfield2:
                atN = self.sezioneAttacco
                ritmoN=1/self.ritmo[0]
            else:
                ritmoN = (1/next(cycled_ritmo))
                atN = self.durataArmonica*ritmoN + self.pfield2[-1]
            self.pfield2.append(atN)
            cdurata = cdurata - self.durataArmonica*ritmoN

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
        output = "\n\t"
        # Elenco degli attributi da escludere
        esclusi = {"eventiSonori","lista_tuples"}
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            attributo + " = " + repr(valore) 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]
        output+=f"------------| COMPORTAMENTO {self.idComportamento} |----------"
        #[print(e) for e in self.eventiSonori]
        # Ritorna la rappresentazione formattata
        attributi_formattati = ',\n\t\t'.join(attributi)
        output = output + "\n\t(\n\t\t" + attributi_formattati + "\n\t)\n"
        return output
#        return f"     Comportamento{self.idComportamento}({',\n '.join(attributi)})"