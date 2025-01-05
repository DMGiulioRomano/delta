from .Tabella import Tabella

class GEN06(Tabella):
    def __init__(self, config=None, numero_tabella=2, lunghezza=16777216):
        """
        Tabella che implementa GEN06 di Csound per generare segmenti di polinomi cubici.

        Args:
            config (dict, optional): Configurazione della tabella, contenente:
                - punti (list): Lista di tuple (valore, segmenti) dove:
                    - valore è il valore del punto (massimo/minimo locale o punto di inflessione)
                    - segmenti è il numero di valori tra questo punto e il successivo
            numero_tabella (int): Numero della tabella.
            lunghezza (int): Lunghezza della tabella (deve essere una potenza di 2 o potenza di 2 + 1).
        """
        # Configurazione di default che crea una curva semplice
        default_config = {
            "punti": [
                (0.0, 0),   # primo punto (a, n1) - x=0
                (0.5, .5),   # punto di inflessione (b, n2) - x=0.3
                (1.0, 1)    # punto finale (e) - x=1.0
            ]
        }
        super().__init__(config=config or default_config, numero_tabella=numero_tabella, lunghezza=lunghezza)

    def genera(self):
        if not self._verifica_potenza_due():
            raise ValueError("La lunghezza deve essere una potenza di 2 o potenza di 2 + 1.")

        punti = self.config["punti"]
        self._verifica_x_punti(punti, min_punti=3)  # GEN06 richiede minimo 3 punti
        parametri = self._calcola_punti_scalati(punti)

        commento = "; ---- GEN06 (polinomi cubici) pfields: ---- \n"
        commento += "; number, start, size, \t\tGEN06, p5/p7/p9...=valori (max/min locali), " + \
                 "p6/p8/p10...=punti di inflessione, " + \
                 "p7/p9/p11...=numero segmenti"
        tabella = f"f {self.numero_tabella} 0 {self.lunghezza} 6 " + " ".join(map(str, parametri))
        return f"{commento}\n{tabella}"
