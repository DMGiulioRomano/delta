import numpy as np
from funzioni.Funzione import Funzione

class Log(Funzione):
    def __init__(self, x1, y1, x2, y2, offset=1e-5):
        super().__init__(x1, y1, x2, y2)  # Inizializza i punti usando il costruttore della superclasse
        # Assicurati che x1 e x2 siano validi per il logaritmo
        self.x1 = max(x1, offset)  # Forza un valore minimo maggiore dell'offset
        self.x2 = max(x2, offset)
        self.offset = offset        
        self.A = (self.y2 - self.y1) / (np.log(self.x2 + offset) - np.log(self.x1 + offset))  # Coefficiente A
        self.B = self.y1 - self.A * np.log(self.x1 + offset)  # Calcola B utilizzando il primo punto
    
    def calcola_y(self, x):
        """Calcola il valore di y per un dato x nel segmento logaritmico."""
        return self.A * np.log(x + self.offset) + self.B

    def crea_funzione(self):
        """Restituisce una funzione interrogabile che calcola il valore di y per un dato x."""
        return lambda x: self.A * np.log(x + self.offset) + self.B
