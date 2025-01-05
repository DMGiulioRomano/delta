from .Tabella import Tabella

class GEN05(Tabella):
    def __init__(self, config=None, numero_tabella=2, lunghezza=16777216):
        """
        Tabella che implementa GEN05 di Csound per curve esponenziali.

        Args:
            config (dict, optional): Configurazione della tabella, contenente 'punti' (lista di tuple (X, Y)).
                                   X rappresenta la posizione normalizzata (0-1), Y il valore dell'ordinata.
                                   Se non fornito, utilizza un dizionario predefinito.
            numero_tabella (int): Numero della tabella.
            lunghezza (int): Lunghezza della tabella. Deve essere una potenza di 2 o potenza di 2 + 1.
        """
        # Configurazione di default con due punti
        default_config = {
            "punti": [
                (0.0, 0),    # Inizio: x=0, y=0 (verrà convertito in 0.001)
                (0.5, 1),    # Punto intermedio: x=0.5, y=1
                (1.0, 0)     # Fine: x=1, y=0 (verrà convertito in 0.001)
            ],
            "normalizza": True
        }
        super().__init__(config=config or default_config, numero_tabella=numero_tabella, lunghezza=lunghezza)

    def _verifica_punti(self, punti):
        if len(punti) < 2:
            raise ValueError("Ci devono essere almeno due punti per l'interpolazione.")
        # Verifica che le x siano tra 0 e 1 e in ordine crescente
        if not all(0 <= x <= 1 for x, _ in punti):
            raise ValueError("Le posizioni X devono essere tra 0 e 1.")
        if any(x1 >= x2 for (x1, _), (x2, _) in zip(punti, punti[1:])):
            raise ValueError("I punti X devono essere in ordine crescente.")
        # Converti i valori y = 0 in 0.001 e verifica il segno
        y_values = [0.001 if y == 0 else y for _, y in punti]
        if not all((y > 0) for y in y_values) and not all((y < 0) for y in y_values):
            raise ValueError("Tutti i valori Y devono avere lo stesso segno.")

    def genera(self):
        if not self._verifica_potenza_due():
            raise ValueError("La lunghezza deve essere una potenza di 2 o potenza di 2 + 1.")

        punti = [(x, 0.001 if y == 0 else y) for x, y in self.config["punti"]]
        normalizza = self.config.get("normalizza", True)
        
        # Verifica specifica per GEN05 (segno dei valori Y)
        y_values = [y for _, y in punti]
        if not all((y > 0) for y in y_values) and not all((y < 0) for y in y_values):
            raise ValueError("Tutti i valori Y devono avere lo stesso segno.")

        self._verifica_x_punti(punti)
        parametri = self._calcola_punti_scalati(punti)

        commento = "; ---- GEN05 (curve esponenziali) pfields: ----\n"
        commento += "; number, start, size, \t\tGEN05,   p5/p6/p7...=valore/segmenti"
        normalizzazione = "5" if normalizza else "-5"
        tabella = f"f {self.numero_tabella}\t\t  0 \t {self.lunghezza}\t{normalizzazione}\t\t  " + " ".join(map(str, parametri))
        return f"{commento}\n{tabella}"

