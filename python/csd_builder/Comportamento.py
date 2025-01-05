from itertools import cycle
import random
import pdb
import numpy as np
from funzioni import *
import math
import sys
from tabelle import *
from .EventoSonoro import EventoSonoro

class Comportamento:
    # attributi relativi al comportamento hanno lachiave che inizia per c. 
    # es. cAttacco, cDurata. 
    def __init__(self, dizionario, idComportamento):
        self.idComportamento = idComportamento
        self.lista_tuples = list(dizionario.items())
        self.lista_tuples.append(("HR", 0))          # Aggiungi la tupla ("HR", 0)
        self.generaAttributi()
        self.eventiSonori = []
        self._tabelle_cache = {}  # Cache to store created tables
        self._tabelle_generate = set()  # Set to track which tables have been generated
    
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
                if chiave == "posizione":
                    setattr(self, f"pfield9", [])
                    

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
            dictEvento["tabellaPosizione"] = self.pfield9[i]
            # Aggiungi un identificatore univoco all'evento
            dictEvento["idEventoSonoro"] = i
            # Crea e aggiungi l'oggetto EventoSonoro alla lista
            self.eventiSonori.append(EventoSonoro(dictEvento))

    def calcolaPfield(self):
        self.ritmo = [int(x) for x in self.ritmo]
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
        offsetPos = int(raw_value if isinstance(raw_value, (int,float)) else (raw_value[0] if raw_value else 0))
        sign = int(raw_value if isinstance(raw_value, (int,float)) else (raw_value[0] if raw_value else 1))
        self.creatiTabella(raw_value)
        return random.randint(((offsetPos%ritmo)+1), ritmo) * np.sign(sign)

    def creatiTabella(self, raw_value):
        try:
            tabella_nome = raw_value[1] if isinstance(raw_value, list) else "GEN07"
            
            # Check if we already have this type of table in our cache
            if tabella_nome in self._tabelle_cache:
                # Reuse existing table
                self.pfield9.append(self._tabelle_cache[tabella_nome])
                return

            # If not in cache, create new table
            tabella_classe = eval(tabella_nome)
            if not issubclass(tabella_classe, Tabella):
                raise TypeError("La classe specificata non è una sottoclasse di Tabella")
            
            # Create new table instance
            tabella_istanza = tabella_classe()
            
            # Store in cache
            self._tabelle_cache[tabella_nome] = tabella_istanza
            
            # Use the table
            self.pfield9.append(tabella_istanza)

        except Exception as e:
            raise ValueError(f"Errore nell'assegnazione di pfield9: {str(e)}")

    def creamiHR(self,raw_value,p2):
        return next(self.cycled)

    def creamifrequenza(self,raw_value,p2):
        cycledF = next(self.cycled)
        ottava = int(raw_value[0] if isinstance(raw_value[0], (int,float)) else raw_value[0][0])
        regioneOttava = int(raw_value[1] if isinstance(raw_value[0],(int,float)) else raw_value[0][1])
        registroOttava = int(ottava*self.spazio.sistema.intervalli)
        offsetIntervallo = registroOttava+int(((regioneOttava*self.spazio.sistema.intervalli)/self.spazio.nDottava)-(self.spazio.sistema.intervalli/self.spazio.nDottava)) 
        sottoinsieme_frequenze = self.spazio.frequenze[offsetIntervallo:]

        try:
            # Logica originale
            direction = int(0 if isinstance(raw_value[0], (int,float)) else raw_value[2])
        except (TypeError, IndexError) as e:
            # Stampa dell'errore e del valore di raw_value
            print(f"Errore: {e}. raw_value: {raw_value}")
            raise  # Rilancia l'eccezione per una gestione successiva
        ottava2 = int(ottava if isinstance(raw_value[0],(int,float)) else raw_value[1][0])
        regioneOttava2 = int(regioneOttava if isinstance(raw_value[0],(int,float)) else raw_value[1][1])
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
        # First generate all unique table definitions
        table_definitions = []
        for evento in self.eventiSonori:
            if hasattr(evento, 'tabellaPosizione'):
                table_key = evento.tabellaPosizione.__class__.__name__
                if table_key not in self._tabelle_generate:
                    table_definitions.append(evento.tabellaPosizione.genera())
                    self._tabelle_generate.add(table_key)
        
        # Then generate all event strings
        event_strings = [evento.toCsoundStr(skip_table_gen=True) for evento in self.eventiSonori]
        
        # Combine table definitions and event strings
        return "\n".join(table_definitions) + "\n; ---- Eventi sonori ----\n" + "\n".join(event_strings)

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