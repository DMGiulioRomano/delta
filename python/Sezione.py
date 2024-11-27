from Evento import Evento
from Comportamento import Comportamento

class Sezione:
    def __init__(self, dizionario):
        self.sAttacco = dizionario.get('sAttacco', 0)  # Valore di default 0 se non presente
        self.sDurata = dizionario.get('sDurata', 0)    # Valore di default 0 se non presente
        self.idSezione = dizionario['idSezione']
        self.dizionario = dizionario
        self.comportamenti = []
        self.genera_comportamenti()

    def genera_comportamenti(self):
        for index, c in enumerate(self.dizionario['comportamenti']):
            c['cAttacco'] += self.sAttacco
            self.comportamenti.append(Comportamento(c,index+1))
            #offsetAttacco = self.comportamenti[-1].cDurata

    def scriviCsd(self):
        for comportamento in self.comportamenti:
            comportamento.scriviCsd(self.idSezione)

    def __str__(self):
        # Elenco degli attributi da escludere
        output=""
        esclusi = {"comportamenti","dizionario"}  
        # Crea la lista di attributi filtrando quelli esclusi
        attributi = [
            f"{attributo}={valore!r}" 
            for attributo, valore in vars(self).items() 
            if attributo not in esclusi
        ]
        output+="\n\n\n\n========================| "+"SEZIONE " + str(self.idSezione) +" |============================\n"
        # Converti i comportamenti in stringhe e uniscili con una nuova linea
        comportamenti_str = "\n\t".join([str(c) for c in self.comportamenti])
#        [print(c) for c in self.comportamenti]    
        attributi_formattati = ',\n\t'.join(attributi)
        output = output + "{\n\t" + attributi_formattati + comportamenti_str + "}\n\n"
        return output
