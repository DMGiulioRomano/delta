from funzioni.Funzione import Funzione

class Line(Funzione):
    def __init__(self, x1, y1, x2, y2):
        """Inizializza la retta, estendendo la classe Funzione."""
        super().__init__(x1, y1, x2, y2)  # Inizializza i punti usando il costruttore della superclasse
        self.m = (y2 - y1) / (x2 - x1)  # Calcola la pendenza
        self.b = y1 - self.m * x1       # Calcola l'ordinata all'origine

    def calcola_y(self, x):
        """Calcola il valore di y per un dato x sulla retta."""
        return self.m * x + self.b

    def crea_funzione(self):
        """Restituisce una funzione interrogabile che calcola il valore di y per un dato x sulla retta."""
        return lambda x: self.m * x + self.b
