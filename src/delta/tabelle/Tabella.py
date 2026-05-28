from abc import ABC, abstractmethod

class Tabella(ABC):
    def __init__(self, config, numero_tabella=2, lunghezza=1024):
        self.config = config
        self.numero_tabella = numero_tabella
        self.lunghezza = lunghezza

    def _verifica_x_punti(self, punti, min_punti=2):
        """Verifica base per i punti x."""
        if len(punti) < min_punti:
            raise ValueError(f"Ci devono essere almeno {min_punti} punti per l'interpolazione.")
        if not all(0 <= x <= 1 for x, _ in punti):
            raise ValueError("Le posizioni X devono essere tra 0 e 1.")
        if any(x1 >= x2 for (x1, _), (x2, _) in zip(punti, punti[1:])):
            raise ValueError("I punti X devono essere in ordine crescente.")

    def _verifica_potenza_due(self):
        """Verifica se la lunghezza è una potenza di 2 o potenza di 2 + 1."""
        n = self.lunghezza - 1
        return (n & (n - 1) == 0) or (self.lunghezza & (self.lunghezza - 1) == 0)

    def _calcola_punti_scalati(self, punti):
        """Calcola i punti scalati e verifica la somma degli intervalli."""
        punti_scalati = []
        somma_intervalli = 0
        resto_della_lunghezza = 0

        for i in range(len(punti) - 1):
            x1, y1 = punti[i]
            x2, _ = punti[i + 1]
            distanza_x = (x2 - x1) * self.lunghezza
            distanza_intera = int(distanza_x)
            resto_della_lunghezza += distanza_x - distanza_intera

            if i == len(punti) - 2:
                distanza_intera += round(resto_della_lunghezza)
            
            somma_intervalli += distanza_intera
            punti_scalati.extend([y1, distanza_intera])

        punti_scalati.append(punti[-1][1])

        if somma_intervalli != self.lunghezza:
            raise ValueError(
                f"La somma degli intervalli delle X ({somma_intervalli}) "
                f"non è uguale alla lunghezza della tabella ({self.lunghezza})."
            )

        return punti_scalati

    @abstractmethod
    def genera(self):
        """Metodo astratto per generare la stringa Csound per la tabella."""
        pass