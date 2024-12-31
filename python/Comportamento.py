from EventoSonoro import EventoSonoro
from itertools import cycle
import random
import pdb
import numpy as np
from funzioni import *
import math
import sys
class Comportamento:
    # attributi relativi al comportamento hanno lachiave che inizia per c. 
    # es. cAttacco, cDurata. 
    def __init__(self, dizionario, idComportamento):
        self.idComportamento = idComportamento
        self.lista_tuples = list(dizionario.items())
        self.lista_tuples.append(("HR", 0))          # Aggiungi la tupla ("HR", 0)
        self.generaAttributi()
        self.eventiSonori = []
    
    def generaAttributi(self):
        # Itera su tutta la lista di tuple, partendo dall'indice 0
        for i, (chiave, valore) in enumerate(self.lista_tuples):
            # Assegna sempre dinamicamente l'attributo
            setattr(self, chiave, valore)
            # Crea dinamicamente un attributo "pfield{i}" solo se i >= 3
            if i > 2:
                setattr(self, f"pfield{i}", [])
                if chiave == "frequenza":
                    setattr(self, f"pfield8", [])
                    

    def creaEventoSonoro(self,spazio):
        self.spazio = spazio
        self.calcolaPfield2()
        self.calcolaPfield()

        for i in range(len(self.pfield2)):
            # Trova l'indice della chiave "ritmo" in lista_tuples
            indice_ritmo = next(
                (index for index, (chiave, _) in enumerate(self.lista_tuples) if chiave == "ritmo"),
                -1
            )
            # Costruisci il dizionario dell'evento
            dictEvento = {}
            for j in range(indice_ritmo, len(self.lista_tuples)):
                # Recupera la chiave corrente dalla lista di tuple
                chiave = self.lista_tuples[j][0]
                # Se la chiave è "ritmo", sostituiscila con "attacco" nel dizionario
                nome_campo = "attacco" if chiave == "ritmo" else chiave
                # Controlla se l'attributo `pfield{j}` esiste e aggiungilo al dizionario
                if hasattr(self, f"pfield{j}"):
                    valore = getattr(self, f"pfield{j}")[i]
                    dictEvento[nome_campo] = valore
            dictEvento["ifreq2"] = self.pfield8[i]
            # Aggiungi un identificatore univoco all'evento
            dictEvento["idEventoSonoro"] = i
            # Crea e aggiungi l'oggetto EventoSonoro alla lista
            self.eventiSonori.append(EventoSonoro(dictEvento))

    def calcolaPfield(self):
        self.cycled = cycle(self.ritmo)
        # Ciclo attraverso gli attributi dinamici che iniziano con "pfield"
        for i in range(3, len(self.lista_tuples[2:]) + 3):  # Iniziamo da 3 per "pfield3"
            # Inizializzazione per prevenire UnboundLocalError
            var_name = ""
            pfield_attr = f"pfield{i}"
            # Verifica se l'attributo esiste
            if hasattr(self, pfield_attr):
                    # Recupera l'attributo
                if i < len(self.lista_tuples):
                    raw_value = getattr(self, self.lista_tuples[i][0])
                    # Usa il valore raw_value come necessario
                    var_name = "creami" + str(self.lista_tuples[i][0])
                for p2 in self.pfield2:
                    if var_name > "":
                        metodo = getattr(self, var_name, None)
                        getattr(self, pfield_attr).append(metodo(raw_value,p2))
                        

    def creamidurata(self,raw_value,p2):
        ritmo=next(self.cycled)
        if isinstance(raw_value, list):
            rand = random.randint(1,raw_value[1])
            res = rand/ritmo
        else: 
            res = 1/ritmo
        return round(res * self.durataArmonica,3)

    def creamiampiezza(self,raw_value,p2):
        if isinstance(raw_value,list):
            amp = raw_value[0]
            dampening = raw_value[1]
        else:
            amp=raw_value
            dampening = -.65
        return round(self.linear2db(self.spazio.ampiezzaSpazio(np.pi/next(self.cycled), self.db2linear(amp),dampening)), 3)
    
    def linear2db(self,g):
        return  20.0 * math.log10(max(sys.float_info.min, g))
    
    def db2linear(self,l):
        return 10.0 ** (l / 20.0)

    def creamiposizione(self,raw_value,p2):
        ritmo = next(self.cycled)
        offsetPos = (abs(raw_value)-1) if raw_value else int(0)
        return random.randint(((offsetPos%ritmo)+1), ritmo) * np.sign(raw_value if raw_value else 1)

    def creamiHR(self,raw_value,p2):
        return next(self.cycled)

    def creamifrequenza(self,raw_value,p2):
        cycledF = next(self.cycled)
        ottava = raw_value[0] if isinstance(raw_value[0],int) else raw_value[0][0]
        regioneOttava = raw_value[1] if isinstance(raw_value[0],int) else raw_value[0][1]
        registroOttava = int(ottava*self.spazio.sistema.intervalli)
        offsetIntervallo = registroOttava+int(((regioneOttava*self.spazio.sistema.intervalli)/self.spazio.nDottava)-(self.spazio.sistema.intervalli/self.spazio.nDottava)) 
        sottoinsieme_frequenze = self.spazio.frequenze[offsetIntervallo:]

        direction = 0 if isinstance(raw_value[0],int) else raw_value[2]
        ottava2 = ottava if isinstance(raw_value[0],int) else raw_value[1][0]
        regioneOttava2 = regioneOttava if isinstance(raw_value[0],int) else raw_value[1][1]
        registroOttava2 = int(ottava2*self.spazio.sistema.intervalli)
        offsetIntervallo2 = registroOttava2+int(((regioneOttava2*self.spazio.sistema.intervalli)/self.spazio.nDottava)-(self.spazio.sistema.intervalli/self.spazio.nDottava)) 
        sottoinsieme_frequenze2 = self.spazio.frequenze[offsetIntervallo2+direction:]
        f = sottoinsieme_frequenze[cycledF  % len(sottoinsieme_frequenze)]
        f1 = sottoinsieme_frequenze2[(cycledF  % len(sottoinsieme_frequenze))]
        self.pfield8.append(f1)
        return f


    def calcolaPfield2(self):
        self.pfield2 = []
        cycled_ritmo = cycle(self.ritmo)
        cdurata = self.durata if isinstance(self.durata,(float,int)) else self.durata[0]
        while cdurata > 0:
            if not self.pfield2:
                atN = round(float(self.cAttacco), 3)
                ritmoN = round(1 / self.ritmo[0], 3)
            else:
                ritmoN = round(1 / next(cycled_ritmo), 3)
                atN = round(self.durataArmonica * ritmoN + self.pfield2[-1], 3)
            self.pfield2.append(atN)
            cdurata = round(cdurata - self.durataArmonica * ritmoN, 3)


    def toCsoundStr(self):
        return "\n".join([ evento.toCsoundStr() for evento in self.eventiSonori])

    def scriviCsd(self,idSezione):
        comportamento = self.toCsoundStr()
        directory = "csound/generazione/"
        subdirExport = "wav/"
        namefile = f"-o \"{directory}{subdirExport}sezione{idSezione}-Comportamento{self.idComportamento}.wav\" -W"
        # Leggi il file originale
        with open('csound/comportamento2.csd', 'r') as file:
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