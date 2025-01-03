from fractions import Fraction
import pdb

class PythagoreanSystem:
    def __init__(self,intervalli):
        self.intervalli = intervalli
        self.ratios = []  # Lista vuota da riempire con i rapporti
        self.frequencies = []  # Lista vuota da riempire con le frequenze
        self.calculate_frequencies()

    def generate_ratios(self,i):
        ratios =[Fraction(1, 1)]  # Lista vuota da riempire con i rapporti
        fifth_ratio = Fraction(3, 2)  # Il rapporto della quinta giusta
        for _ in range((self.intervalli-1)):  # Genera 53 intervalli
            next_ratio = ratios[-1] * fifth_ratio
            # Riduci il rapporto all'interno dell'ottava
            while next_ratio >= 2:
                next_ratio /= 2
            ratios.append(next_ratio)
        return ratios

    def calculate_frequencies(self):
        for i in range(5, 15):
            #pdb.set_trace()
            self.fundamental = 2 ** i  # Aggiorna il fondamentale
            ratios = self.generate_ratios(i-4)  # Genera i rapporti
            self.sort_ratios(ratios)
            frequencies = [round(float(ratio * self.fundamental),3) for ratio in  ratios]
            self.ratios.extend(ratios)
            self.frequencies.extend(frequencies)  # Estendi self.frequencies

    def sort_ratios(self,listRatios):
        # Ordina i rapporti basandoti sul loro valore reale
        return listRatios.sort(key=lambda ratio: ratio.numerator / ratio.denominator)

    def __repr__(self):
        return (f"PythagoreanSystem(frequencies={self.frequencies}, "
                #f"ratios={self.ratios}"
                f"len={len(self.frequencies)})")
