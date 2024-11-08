from funzioni.Funzione import Funzione
import numpy as np  # Assicurati che numpy sia importato

class Expon(Funzione):
    def __init__(self, x1, y1, x2, y2):
        super().__init__(x1, y1, x2, y2)  # Inizializza i punti usando il costruttore della superclasse
        if y1 <= 0 or y2 <= 0:
            raise ValueError("y1 e y2 devono essere positivi e non nulli per il calcolo del logaritmo.")
        self.A = y1
        self.B = np.log(y2 / y1) / (x2 - x1) if y1 != 0 else 0

    def crea_funzione(self):
        """Restituisce una funzione che calcola il valore di y per un dato x sulla curva esponenziale."""
        return lambda x: self.A * np.exp(self.B * (x - self.x1))  # Usa np.exp per array

    def __str__(self):
        return f"Expon({self.x1}, {self.y1}, {self.x2}, {self.y2})"
