from Evento import Evento
from EventoSonoro import EventoSonoro

class Comportamento(Evento):
    def __init__(self, attacco, durata, ritmo, durate, idComportamento):
        super().__init__(attacco, durata)  # Inizializza i punti usando il costruttore della superclasse
        self.ritmo = ritmo
        self.durate = durate
        self.idComportamento = idComportamento
        self.eventiSonori = []
        self.creaEventoCsound()

    def creaEventoCsound(self):
        for i in range(10):
            self.eventiSonori.append(EventoSonoro(1,2,i))

    def toCsound(self):
        return "\n".join([e.toCsound() for e in self.eventiSonori])


    def creaCsd(self):
        # Leggi il file originale
        with open('csound/comportamento.csd', 'r') as file:
            lines = file.readlines()
        # Cerca la stringa "comportamento" e aggiungi "hello!" sotto di essa
        for index, line in enumerate(lines):
            if 'comportamento' in line:
                lines.insert(index + 1, "evento\n")
                break

        # Scrivi il nuovo contenuto in un nuovo file
        with open('csound/prova.csd', 'w') as new_file:
            new_file.writelines(lines)

    def __str__(self):
        attributi = [f"{attributo}={valore!r}" for attributo, valore in vars(self).items()]
        [print(e) for e in self.eventiSonori]
        return f"\n     Comportamento{self.idComportamento}({', '.join(attributi)})"
