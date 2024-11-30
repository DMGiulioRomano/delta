import pdb 
class EventoSonoro:
    def __init__(self, dizionario):
        self.dizionario = dizionario
        #pdb.set_trace()
        self.lista_tuples = list(dizionario.items())
        self.generaAttributi()

    def generaAttributi(self):
        # Itera su tutta la lista di tuple, partendo dall'indice 0
        for _, (chiave, valore) in enumerate(self.lista_tuples):
            # Assegna sempre dinamicamente l'attributo
            setattr(self, chiave, valore)
            # Crea dinamicamente un attributo "pfield{i}" solo se i >= 3

    def toCsoundStr(self):
        pass#return f"i1\t{self.attacco}\t{self.durata}\t{self.ampiezza}\t{self.frequenza}"

    def __str__(self) -> str:
        output ="\n\t\t"
        esclusi ={"lista_tuples", "dizionario", "idEventoSonoro"}
        output+=f"-----------------------| E {self.idEventoSonoro} |--------------------------------"

        attributi = [f"{attributo} = {valore!r}" 
                     for attributo, valore in vars(self).items()
                     if attributo not in esclusi
                     ]
        attributi_formattati = ',\t'.join(attributi)
        return output +"\n\t\t\t" + attributi_formattati