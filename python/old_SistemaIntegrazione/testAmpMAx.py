import math

class ParameterRules:
    """Classe che gestisce le regole e le relazioni tra i parametri musicali"""
    
    @staticmethod
    def calculate_max_amplitude(frequenza: tuple[int, int]) -> float:
        """
        Calcola l'ampiezza massima per una data frequenza.
        
        Args:
            frequenza: Tupla (ottava, registro)
            
        Returns:
            float: Ampiezza massima in dB
        """
        ottava, registro = frequenza
        
        # Caso speciale per ottava 0
        if ottava == 0:
            return -6.0
            
        # Discesa lineare da -6 a -12 per ottave 1-3
        if ottava <= 3:
            slope = (-12 - (-6)) / (3 - 1)  # Calcolo pendenza per discesa lineare
            return -6 + slope * (ottava - 1) - (registro - 1) * 0.3
            
        # Transizione morbida da -12 a -25 per ottave 4-10
        # Usando interpolazione cosinusoidale per una curva più morbida
        progress = (ottava - 3) / (10 - 3)  # Progresso normalizzato da 4 a 10
        smooth_progress = (1 - math.cos(progress * math.pi)) / 2  # Interpolazione cosinusoidale
        base_amplitude = -12 + (-25 - (-12)) * smooth_progress
        
        # Aggiunge una minore influenza del registro per le ottave più alte
        register_influence = (registro - 1) * 0.2
        return min(base_amplitude - register_influence, -12)

def test_octave(octave):
    print(f"\nTest completo per Ottava {octave}:")
    print("=" * 40)
    print(f"{'Registro':<10} {'Ampiezza (dB)':<15}")
    print("-" * 40)
    for register in range(1, 11):
        amp = ParameterRules.calculate_max_amplitude((octave, register))
        print(f"{register:<10} {amp:.2f} dB")

if __name__ == "__main__":
    for octave in range(0, 11):
        test_octave(octave)