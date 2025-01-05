from .Tabella import Tabella

class GEN07(Tabella):
    def __init__(self, config=None, numero_tabella=2, lunghezza=16777216):
        """
        Tabella che implementa GEN07 di Csound.

        Args:
            config (dict, optional): Configurazione della tabella, contenente 'punti' (lista di tuple (X, Y)).
                                     Se non fornito, utilizza un dizionario predefinito.
            numero_tabella (int): Numero della tabella.
            lunghezza (int): Lunghezza della tabella.
        """
        # Configurazione di default
        default_config = {"punti": [(0.0, 0), (1.0, 1)]}
        super().__init__(config=config or default_config, numero_tabella=numero_tabella, lunghezza=lunghezza)

    def genera(self):
        punti = self.config["punti"]
        self._verifica_x_punti(punti)
        parametri = self._calcola_punti_scalati(punti)

        commento = "; ---- GEN07 (spezzata di rette) pfields: ----\n"
        commento += "; number, start, size, \t\tGEN07,   p5/p6/p7...=valore/segmenti"
        tabella = f"f {self.numero_tabella}\t\t  0 \t {self.lunghezza}\t7\t\t" + " ".join(map(str, parametri))
        return f"{commento}\n{tabella}"
