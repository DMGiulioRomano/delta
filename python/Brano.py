import json
from Sezioni import Sezioni  # Importa la classe Sezioni, presumibilmente definita altrove
from Forma import Forma  # Importa la classe Forma, presumibilmente definita altrove

class Brano:
    def __init__(self, json_file):
        # Apre e carica i dati dal file JSON passato come parametro
        with open(json_file, 'r') as file:
            dati = json.load(file)

        # Estrae le informazioni dal dizionario dei dati
        self.titolo = dati['brano']['titolo']  # Titolo del brano
        self.attacco = dati['brano']['attacco']  # Valore di attacco
        # Converte la durata in minuti (dati in formato stringa) in secondi
        self.durata = int(dati['brano']['durata']) * 60  
        
        # Crea un oggetto Forma utilizzando i dati della forma del brano
        self.forma = Forma(dati['brano']['forma'])
        
        # Estrae le sezioni dal dizionario e le memorizza come attributi
        self.sezioni = dati['brano']['sezioni']
        self.rapporti = self.sezioni['rapporti']  # Lista dei rapporti fra le sezioni
        self.sezione1 = self.sezioni['sezione1']  # Dettagli della prima sezione
        self.sezione2 = self.sezioni['sezione2']  # Dettagli della seconda sezione
        self.sezione3 = self.sezioni['sezione3']  # Dettagli della terza sezione
        self.sezioni_oggetti = []  # Lista che conterrà gli oggetti delle sezioni

    def calcola_rapporti(self):
        """
        Calcola la durata e il punto di attacco per ciascuna sezione in base ai rapporti
        e alla durata complessiva del brano. Crea gli oggetti della classe Sezioni e li
        aggiunge alla lista `sezioni_oggetti`.
        """
        # Calcola il divisore per normalizzare la durata delle sezioni
        divisore = sum(self.rapporti)
        
        # Ciclo che calcola i dettagli per ciascuna sezione
        for i in range(len(self.rapporti)):
            idSezione = i + 1  # L'ID della sezione parte da 1
            
            # Calcola il punto di attacco per la sezione
            if i == 0:
                atSezione = 0 + self.attacco  # Il punto di attacco per la prima sezione
            else:
                # Calcola il punto di attacco per le altre sezioni in base alla durata complessiva
                atSezione = (self.durata / divisore) * sum(self.rapporti[:i]) + self.attacco
            
            # Calcola la durata della sezione
            durSezione = (self.durata / divisore) * self.rapporti[i]
            
            # Crea l'oggetto Sezioni utilizzando i dati calcolati
            s = Sezioni(idSezione, atSezione, durSezione, eval(f"self.sezione{idSezione}"))
            
            # Aggiungi l'oggetto Sezioni alla lista
            self.sezioni_oggetti.append(s)

    def __str__(self):
        """
        Rappresentazione stringa del brano, che include informazioni generali sul brano
        e stampa i dettagli di ogni sezione.
        """
        # Stampa le informazioni di ciascuna sezione
        [print(sezione) for sezione in self.sezioni_oggetti]
        
        # Chiama il metodo per plottare la funzione associata alla forma del brano
        self.forma.plotta_funzione()
        
        # Restituisce una stringa formattata con informazioni generali sul brano
        return (f"\n\nBrano(\n  titolo={self.titolo},\n"
                f"  attacco={self.attacco},\n"
                f"  durata={self.durata},\n"
                f"  rapporti={self.rapporti},\n"
                )
