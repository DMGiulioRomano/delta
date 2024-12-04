from PythagoreanSystem import PythagoreanSystem
import pdb
class Spazio:
    def __init__(self, dizionario):
        self.sistema = eval(dizionario['frequenze'])
        self.durate = dizionario.get("durate", [])
        self.ampiezze = dizionario.get("ampiezze", [])
        self.frequenze = self.creaDimensioneFrequenze()

    def creaDimensioneFrequenze(self):
        return [freq for i in range(5, 14) for freq in self.sistema(i).frequencies]

    def __str__(self):
        """
        Rappresentazione testuale dell'oggetto Spazio.
        """
        return (f"Spazio(\n"
                f"  frequenze={self.frequenze},\n"
                f"  durate={self.durate},\n"
                f"  ampiezze={self.ampiezze}\n"
                f")")
