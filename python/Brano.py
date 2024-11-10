import json
from Sezione import Sezione  # Importa la classe Sezioni, presumibilmente definita altrove
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
        self.durata = dati['brano']['durata']['minuti'] * 60 + dati['brano']['durata']['secondi']
        # Crea un oggetto Forma utilizzando i dati della forma del brano
        self.forma = Forma(dati['brano']['forma'])
        # Estrae le sezioni dal dizionario e le memorizza come attributi
        self.sezioni=[]
        self.dictSezioni = dati['brano']['sezioni']
        self.crea_sezioni()
        self.sezioni_oggetti = []  # Lista che conterrà gli oggetti delle sezioni

    def crea_sezioni(self):
        for sezione in self.forma.sezioni:
            at = sezione['attacco'] * self.durata + self.attacco
            dur = sezione['durata'] * self.durata
            idSezione = f"sezione{sezione['idSezione']}"
            dizionarioSezione = self.dictSezioni[idSezione]
            self.sezioni.append(Sezione(at,dur,idSezione,dizionarioSezione))

    def __str__(self):
        """
        Rappresentazione stringa del brano, che include informazioni generali sul brano
        e stampa i dettagli di ogni sezione.
        """
        # Stampa le informazioni di ciascuna sezione
        [print(sezione) for sezione in self.sezioni]
        
        # Chiama il metodo per plottare la funzione associata alla forma del brano
        self.forma.plotta_funzione()
        
        # Restituisce una stringa formattata con informazioni generali sul brano
        return (f"\n\nBrano(\n  titolo={self.titolo},\n"
                f"  attacco={self.attacco},\n"
                f"  durata={self.durata},\n"
                )