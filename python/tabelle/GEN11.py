from .Tabella import Tabella

class GEN11(Tabella):
    def __init__(self, config=None, numero_tabella=2, lunghezza=16777216):
        """
        Tabella che implementa GEN11 di Csound per generare un insieme additivo di parziali cosinusoidali.

        Args:
            config (dict, optional): Configurazione della tabella, contenente:
                - nh (int): Numero di armoniche richieste (deve essere positivo)
                - lh (int, optional): Armonica più bassa presente (default: 1)
                - r (float, optional): Moltiplicatore nella serie dei coefficienti di ampiezza (default: 1.0)
            numero_tabella (int): Numero della tabella
            lunghezza (int): Lunghezza della tabella (deve essere una potenza di 2 o potenza di 2 + 1)
        """
        # Configurazione di default
        default_config = {
            "nh": 10,  # Numero di armoniche di default
            "lh": 1,   # Armonica più bassa di default
            "r": 1.0   # Moltiplicatore di default
        }
        super().__init__(config=config or default_config, numero_tabella=numero_tabella, lunghezza=lunghezza)

    def _is_power_of_two_plus_one(self, n):
        """
        Verifica se un numero è una potenza di 2 o una potenza di 2 più 1.
        
        Args:
            n (int): Numero da verificare
            
        Returns:
            bool: True se il numero è una potenza di 2 o una potenza di 2 più 1
        """
        if n <= 0:
            return False
        # Verifica se n è una potenza di 2
        if (n & (n - 1)) == 0:
            return True
        # Verifica se n-1 è una potenza di 2
        n = n - 1
        return n > 0 and (n & (n - 1)) == 0

    def genera(self):
        if not self._is_power_of_two_plus_one(self.lunghezza):
            raise ValueError("La lunghezza della tabella deve essere una potenza di 2 o una potenza di 2 più 1")

        nh = self.config.get("nh")
        lh = self.config.get("lh", 1)
        r = self.config.get("r", 1.0)

        if not isinstance(nh, int) or nh <= 0:
            raise ValueError("nh deve essere un intero positivo")
        if not isinstance(lh, int):
            raise ValueError("lh deve essere un intero")
        if not isinstance(r, (int, float)):
            raise ValueError("r deve essere un numero")

        parametri = [self.numero_tabella, 0, self.lunghezza, 11, nh]
        if lh != 1 or r != 1.0:
            parametri.append(lh)
            if r != 1.0:
                parametri.append(r)

        commento = "; ---- GEN11 pfields: ----\n"
        commento += "; number, start, \tsize, \t\t\tGEN11, p5=nh, p6=lh(opt), p7=r(opt)"
        tabella = "f " + " \t\t".join(map(str, parametri))
        return f"{commento}\n{tabella}"