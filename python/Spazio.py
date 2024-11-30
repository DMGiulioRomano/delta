class Spazio:
    def __init__(self, dizionario):
        self.frequenze = dizionario.get("frequenze", [])
        self.durate = dizionario.get("durate", [])
        self.ampiezze = dizionario.get("ampiezze", [])

    def __str__(self):
        """
        Rappresentazione testuale dell'oggetto Spazio.
        """
        return (f"Spazio(\n"
                f"  frequenze={self.frequenze},\n"
                f"  durate={self.durate},\n"
                f"  ampiezze={self.ampiezze}\n"
                f")")
