from .Forma import Forma
from .Sezione import Sezione
from .Spazio import Spazio
import pdb
class Brano:
    def __init__(self, dizionario):
        self.titolo = dizionario['titolo']  # Titolo del brano
        self.attacco = dizionario['attacco']  # Valore di attacco
        self.durata = dizionario['durata']['minuti'] * 60 + dizionario['durata']['secondi']
        self.dictSezioni = dizionario['sezioni']
        self.sezioni=[]
        self.forma = Forma(dizionario['forma'])
        self.spazio = Spazio(dizionario['dimensioni'])
        self.crea_sezioni(dizionario['forma'][0])
    
    def crea_sezioni(self,boolForma):
        if not boolForma['onOff']:
            self.sez_tuples = list(self.dictSezioni.items())
            for i, (chiave, valore) in enumerate(self.sez_tuples):
                idSezione = f"{chiave[-1]}"
                whichSezione = chiave
                dizionarioSezioneFromJSON = self.dictSezioni[whichSezione]
                newDictSezioneFromForma = {'sAttacco' : 0 , 'sDurata' : 0, 'idSezione' : idSezione , 'spazio': self.spazio}
                newDictSezioneFromForma.update(dizionarioSezioneFromJSON)
                self.sezioni.append(Sezione(newDictSezioneFromForma))
        else:
            for sezione in self.forma.sezioni:
                at = sezione['attacco'] * self.durata + self.attacco
                dur = sezione['durata'] * self.durata
                idSezione = f"{sezione['idSezione']}"
                whichSezione = f"sezione{idSezione}"
                
                # Controlla se la chiave 'whichSezione' esiste nel dizionario
                if whichSezione in self.dictSezioni:
                    dizionarioSezioneFromJSON = self.dictSezioni[whichSezione]
                    newDictSezioneFromForma = {'sAttacco' : at , 'sDurata' : dur, 'idSezione' : idSezione , 'spazio': self.spazio}
                    newDictSezioneFromForma.update(dizionarioSezioneFromJSON)
                    self.sezioni.append(Sezione(newDictSezioneFromForma))
                else:
                    print(f"Warning: La sezione {whichSezione} non esiste nel dizionario. Saltando...")

    def scriviCsd(self):
        for sezione in self.sezioni:
            sezione.scriviCsd()

    def __str__(self):
        # Stampa le informazioni di ciascuna sezione
        [print(sezione) for sezione in self.sezioni]
        # Chiama il metodo per plottare la funzione associata alla forma del brano
        self.forma.plotta_funzione()
        print(self.spazio)
        # Restituisce una stringa formattata con informazioni generali sul brano
        return (f"\n\nBrano(\n  titolo={self.titolo},\n"
                f"  attacco={self.attacco},\n"
                f"  durata={self.durata},\n"
                )