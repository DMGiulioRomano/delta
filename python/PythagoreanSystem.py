from fractions import Fraction
import pdb
class PythagoreanSystem:
    def __init__(self, octave=1, fundamental=32):
        self.fundamental = 2 ** octave
        self.ratios = self.generate_ratios()
        self.sort_ratios()  # Sort ratios based on their real value
        self.frequencies = self.calculate_frequencies()

    def generate_ratios(self):
        ratios = [Fraction(1, 1)]  # The fundamental is 1/1
        fifth_ratio = Fraction(3, 2)  # The ratio of a perfect fifth

        for _ in range(1, 53):  # Generate 53 intervals
            next_ratio = ratios[-1] * fifth_ratio
            # Reduce the ratio within the octave
            while next_ratio >= 2:
                next_ratio /= 2
            ratios.append(next_ratio)
        
        return ratios

    def calculate_frequencies(self):
        return [float(ratio * self.fundamental) for ratio in self.ratios]

    def sort_ratios(self):
        # Sort the ratios based on their real value
        self.ratios.sort(key=lambda ratio: ratio.numerator / ratio.denominator)

    def __repr__(self):
        return (f"PythagoreanSystem(fundamental={self.fundamental}, "
                f"ratios={self.ratios}, frequencies={self.frequencies})")
