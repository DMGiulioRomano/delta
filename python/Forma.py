import numpy as np
import matplotlib.pyplot as plt
from funzioni import *

class Forma:
    def __init__(self, forma):
        """Inizializza la classe con una lista di sezioni della forma."""
        self.forma = forma  # La forma è una lista di sezioni con i punti e la grandezza
        self.funzione = None
        self.sezioni = []
        self.crea_funzione_a_tratti()

    def crea_funzione_a_tratti(self):
        """Crea la funzione a tratti basata sulle sezioni della forma."""
        punti_completi = []
        offset = 0  # Inizia con offset 0, la prima sezione parte da x=0
        curvaTraPunti = []
        # Unisci tutti i punti di tutte le sezioni in una lista unica
        for s, sezione in enumerate(self.forma):
            grandezza = sezione["grandezza"]
            punti = sezione["punti"]
            punti_intermedi=[]
            # Applica la grandezza a tutti i punti della sezione
            for punto in punti:
                x, y, curva = punto
                new_x = x * grandezza + offset  # Scala ogni x del punto per la grandezza
                punti_intermedi.append([new_x, y])
                curvaTraPunti.append(curva)
            # Aggiorna l'offset con l'ultima x della sezione corrente
            offset = punti_intermedi[-1][0]  # L'offset è aggiornato all'ultima x della sezione corrente
                # Calcola attacco e durata per la sezione corrente
            attacco = punti_intermedi[0][0]
            durata = punti_intermedi[-1][0] - punti_intermedi[0][0]
            self.sezioni.append({"attacco": attacco, "durata": durata, "idSezione": s+1 })
    
            punti_completi.extend(punti_intermedi)
        condizioni = []
        espressioni = []
        
        # Ciclo su tutti i punti combinati delle sezioni
        for i in range(len(punti_completi) - 1):
            x1, y1 = punti_completi[i]
            x2, y2 = punti_completi[i + 1]
            curva = eval(curvaTraPunti[i])
            fun = curva(x1, y1, x2, y2)
            funzione = fun.crea_funzione()
            condizione = f"(x >= {x1}) & (x < {x2})"  # Condizione per tutti i punti
            
            condizioni.append(eval("lambda x: " + condizione))
            espressioni.append(funzione)
        
        # Funzione finale definita a tratti
        def funzione(x):
            return np.piecewise(x, [condizione(x) for condizione in condizioni], espressioni)
        
        self.funzione = funzione

    def plotta_funzione(self):
        dominio = [0,1]
        """Funzione per plottare la funzione a tratti nell'intervallo specificato."""
        x_vals = np.linspace(dominio[0], dominio[1], 500)  # 500 punti per la trama
        y_vals = self.funzione(x_vals)  # Calcola i valori di y corrispondenti
        plt.plot(x_vals, y_vals, label="Forma")
        plt.xlabel("tempo")
        plt.ylabel("dinamica")
        plt.title("Forma di Delta")
        plt.grid(True)
        plt.legend()
        plt.show()