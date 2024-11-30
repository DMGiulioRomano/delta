from EventoSonoro import EventoSonoro
from itertools import cycle
import pdb
from Spazio import Spazio
from funzioni import *
class Comportamento:
    # attributi relativi al comportamento hanno lachiave che inizia per c. 
    # es. cAttacco, cDurata. 
    def __init__(self, dizionario, idComportamento):
        self.idComportamento = idComportamento
        self.lista_tuples = list(dizionario.items())
        self.generaAttributi()
        self.eventiSonori = []

    def generaAttributi(self):

        # Itera su tutta la lista di tuple, partendo dall'indice 0
        for i, (chiave, valore) in enumerate(self.lista_tuples):
            # Assegna sempre dinamicamente l'attributo
            setattr(self, chiave, valore)
            # Crea dinamicamente un attributo "pfield{i}" solo se i >= 3
            if i >= 4:
                setattr(self, f"pfield{i-1}", [])

    def creaEventoSonoro(self,spazio):
        self.spazio = spazio
        self.calcolaPfield2()
        self.calcolaPfield()
        # Cicliamo per ogni evento che dobbiamo creare
        for i in range(len(self.pfield2)):
            indice_ritmo = next((i for i, (chiave, _) in enumerate(self.lista_tuples) if chiave == "ritmo"), -1)
            dictEvento = {
                ("attacco" if self.lista_tuples[j][0] == "ritmo" else self.lista_tuples[j][0]): getattr(self, f"pfield{j-1}")[i]
                for j in range(indice_ritmo, len(self.lista_tuples))
                if hasattr(self, f"pfield{j-1}")
            }
            dictEvento["idEventoSonoro"] = i
            """
            dictEvento = {}
            for j in range(indice_ritmo, len(self.lista_tuples)):
                pfield_attr = f"pfield{j-1}"
                if hasattr(self, pfield_attr):
                    chiave = self.lista_tuples[j][0]
                    if chiave == "ritmo":
                        chiave = "attacco"
                    valore = getattr(self, pfield_attr)[i]
                    dictEvento[chiave] = valore
            """
            self.eventiSonori.append(EventoSonoro(dictEvento))

    def calcolaPfield(self):
        # Ciclo attraverso gli attributi dinamici che iniziano con "pfield"
        for i in range(4, len(self.lista_tuples[2:]) + 2):  # Iniziamo da 3 per "pfield3"
            pfield_attr = f"pfield{i-1}"
            # Verifica se l'attributo esiste
            if hasattr(self, pfield_attr):
                # Recupera l'espressione come stringa o valore dall'attributo
                raw_value = getattr(self, self.lista_tuples[i][0])
                try:
                    # Valuta il valore se è una stringa, altrimenti usa direttamente l'oggetto
                    evaluated_value = eval(raw_value) if isinstance(raw_value, str) else raw_value
                    # Se è una classe, crea un'istanza passando i valori richiesti
                    if callable(evaluated_value):
                        # Supponendo che i parametri richiesti siano, ad esempio, `self.pfield2`
                        instanceFunc = evaluated_value(1,1,100,100)  # Passa i valori come richiesto dalla classe
                        funzione = instanceFunc.crea_funzione()
                except Exception as e:
                    raise ValueError(f"Errore nel creare un'istanza da {raw_value}: {e}")

                cycled_ritmo = cycle(self.ritmo)
                # Usa la lunghezza di pfield2 per il ciclo
                for _ in range(len(self.pfield2)):  
                    # Assegna i valori dinamicamente
                    if isinstance(instanceFunc, Funzione):
                        valore = funzione(next(cycled_ritmo))
                        print(valore)
                    else:
                        valore = instanceFunc
                    getattr(self, pfield_attr).append(valore)  

    def calcolaPfield2(self):
        self.pfield2 = []
        cycled_ritmo = cycle(self.ritmo)
        cdurata = self.cDurata
        while cdurata > 0:
            if not self.pfield2:
                atN = round(self.cAttacco, 4)
                ritmoN = round(1 / self.ritmo[0], 4)
            else:
                ritmoN = round(1 / next(cycled_ritmo), 4)
                atN = round(self.durataArmonica * ritmoN + self.pfield2[-1], 4)
            self.pfield2.append(atN)
            cdurata = round(cdurata - self.durataArmonica * ritmoN, 4)


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
        esclusi = {"eventiSonori","lista_tuples", "spazio"}
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            attributo + " = " + repr(valore) 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]
        output+=f"------------| COMPORTAMENTO {self.idComportamento} |----------"
        eventiSonori_str = "\n\t".join([str(c) for c in self.eventiSonori])
        attributi_formattati = ',\n\t\t'.join(attributi)
        return output + "\n\t(\n\t\t" + attributi_formattati + eventiSonori_str + "\n\t)\n"