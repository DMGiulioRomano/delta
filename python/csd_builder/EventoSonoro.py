import pdb 
from tabelle import Tabella

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

    def toCsoundStr(self, skip_table_gen=False):
        csound_str = ""
        csound_str+=f";i1\t\t|at|\t\t|dur|\t\t|amp|\t\t\t|freqi|\t\t\t|wchZ|\t|HR|\t|freqf|\t\t\t|funPos|" + "\n"
        try:
            if isinstance(self.tabellaPosizione, Tabella):
                if not skip_table_gen:
                    # Only generate table string if not skipped
                    csound_str += self.tabellaPosizione.genera() + "\n"
                self.lista_tuples.append(('ifnPos', self.tabellaPosizione.numero_tabella))
                setattr(self, 'ifnPos', self.tabellaPosizione.numero_tabella)
            else:
                raise TypeError("tabellaPosizione non è una classe figlia di Tabella.")
        except Exception as e:
            raise ValueError(f"Errore nella generazione dell'istanza tabellaPosizione: {e}")

        # Generate event string
        csound_str += "i1"
        esclusi = ["idEventoSonoro", "tabellaPosizione"]
        for chiave, _ in self.lista_tuples:
            if chiave not in esclusi:
                valore = getattr(self, chiave)
                csound_str += f"\t\t {valore}"
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