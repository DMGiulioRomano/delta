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
        # Genera una stringa in formato Csound, partendo dall'ordine degli attributi in lista_tuples
        csound_str = "i1"  # Tipo di evento sonoro (i1 rappresenta un evento sonoro)
        for chiave, _ in self.lista_tuples:
            # Escludi l'attributo 'idEventoSonoro'
            if chiave != "idEventoSonoro":
                valore = getattr(self, chiave)
                csound_str += f"\t{valore}"
        return csound_str

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