"""
Modulo per la validazione degli stati musicali e dei loro parametri.
"""

from typing import List, Tuple, Union
import math
from ..models.musical_state import StatoMusicale


class ParameterRules:
    """Classe che gestisce le regole e le relazioni tra i parametri musicali"""

    @staticmethod
    def validate_position(ritmo: List[int], posizione: Union[int, List[int]]) -> bool:
        """
        Valida la posizione in due modi:
        1. Se posizione è una lista, ogni elemento deve essere <= del corrispondente ritmo
        2. Se posizione è un numero, deve essere:
        - maggiore o uguale a 0
        - minore o uguale alla media dei ritmi
        """
        if isinstance(posizione, list):
            # Caso lista: ogni posizione deve essere <= del ritmo corrispondente
            if len(posizione) != len(ritmo):
                return False
            return all(0 <= p <= r for p, r in zip(posizione, ritmo))

        if isinstance(posizione, (int, float)):
            # Caso numero singolo
            media_ritmi = sum(ritmo) / len(ritmo)
            return 0 <= posizione <= media_ritmi

        return False

    @staticmethod
    def generate_valid_positions(ritmo: List[int]) -> List[List[int]]:
        """Genera tutte le possibili posizioni valide per un dato ritmo"""
        valid_positions = []
        for r in ritmo:
            valid_positions.append(list(range(r + 1)))
        return valid_positions

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
        smooth_progress = (
            1 - math.cos(progress * math.pi)
        ) / 2  # Interpolazione cosinusoidale
        base_amplitude = -12 + (-25 - (-12)) * smooth_progress

        # Aggiunge una minore influenza del registro per le ottave più alte
        register_influence = (registro - 1) * 0.2
        return min(base_amplitude - register_influence, -12)

    @staticmethod
    def validate_duration(
        durata: float, durata_armonica: float, ritmo: List[int]
    ) -> bool:
        """Valida che la durata rispetti la regola della durata armonica"""
        min_duration = durata_armonica / max(ritmo) * 2
        return durata > min_duration

    @staticmethod
    def calculate_min_duration(durata_armonica: float, ritmo: List[int]) -> float:
        """Calcola la durata minima per dati durata armonica e ritmo"""
        return durata_armonica / max(ritmo) * 2

    @staticmethod
    def validate_frequency(freq: Tuple[int, int]) -> bool:
        """Valida che la frequenza sia nel range consentito [0,1] fino a [10,10]"""
        ottava, registro = freq
        return 0 <= ottava <= 10 and 1 <= registro <= 10


class StatoMusicaleValidator:
    """Classe per validare uno stato musicale completo"""

    def __init__(self, rules: ParameterRules):
        self.rules = rules

    def validate_state(self, stato: StatoMusicale) -> Tuple[bool, List[str]]:
        """Valida uno stato musicale completo e ritorna errori eventuali"""
        errors = []

        # Valida posizione-ritmo
        if not self.rules.validate_position(stato.ritmo, stato.posizione):
            errors.append("Posizione non valida per il ritmo dato")

        # Valida ampiezza-frequenza
        max_amp = self.rules.calculate_max_amplitude(stato.frequenza)
        if isinstance(stato.ampiezza, list):
            if stato.ampiezza[0] > max_amp:
                errors.append(
                    f"Ampiezza troppo alta per la frequenza data (max: {max_amp})"
                )
        elif stato.ampiezza > max_amp:
            errors.append(
                f"Ampiezza troppo alta per la frequenza data (max: {max_amp})"
            )

        # Valida durata
        if not self.rules.validate_duration(
            stato.durata, stato.durataArmonica, stato.ritmo
        ):
            min_dur = self.rules.calculate_min_duration(
                stato.durataArmonica, stato.ritmo
            )
            errors.append(f"Durata troppo breve (min: {min_dur})")

        # Valida frequenza
        if not self.rules.validate_frequency(stato.frequenza):
            errors.append("Frequenza fuori dal range consentito")

        return len(errors) == 0, errors
