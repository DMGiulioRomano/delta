from .Comportamento import Comportamento

class Sezione:
    def __init__(self, dizionario):
        self.dizionario = dizionario
        self.lista_tuples = list(dizionario.items())
        self.generaAttributi()
        self.comportamenti = []
        self.genera_comportamenti()
        self.creaEventi()

    def creaEventi(self):
        for c in self.comportamenti:
            c.creaEventoSonoro(self.spazio)

    def generaAttributi(self):
        # Itera su tutta la lista di tuple, partendo dall'indice 0
        for _, (chiave, valore) in enumerate(self.lista_tuples):
            # Assegna sempre dinamicamente l'attributo
            setattr(self, chiave, valore)
            # Crea dinamicamente un attributo "pfield{i}" solo se i >= 3

    def genera_comportamenti(self):
        for index, c in enumerate(self.dizionario['comportamenti']):
            c['cAttacco'] += self.sAttacco
            self.comportamenti.append(Comportamento(c,index+1))


    def scriviCsd(self):
        for comportamento in self.comportamenti:
            comportamento.scriviCsd(self.idSezione)

    def __str__(self):
        # Elenco degli attributi da escludere
        output=""
        esclusi = {"comportamenti","dizionario", "lista_tuples", "spazio"}  
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
