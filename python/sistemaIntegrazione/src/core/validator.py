"""
Modulo per la validazione degli stati musicali e dei loro parametri.
"""

from typing import List, Tuple, cast
import math
from ..models.musical_state import StatoMusicale
from ..core.types import FrequencyType, RhythmType, PositionType


class ParameterRules:
    """Classe che gestisce le regole e le relazioni tra i parametri musicali"""

    @staticmethod
    def validate_position(ritmo: RhythmType, posizione: PositionType) -> bool:
        """
        Validates position against rhythm values using pattern matching.
        """
        if not isinstance(ritmo, list):
            return False

        match posizione:
            case float():
                raise TypeError("La posizione deve essere un intero, non un float")

            case int():
                if not ritmo:  # Protezione contro lista ritmo vuota
                    return False
                media_ritmi = sum(ritmo) / len(ritmo)
                return 0 <= posizione <= media_ritmi

            case list():
                # Verifica che le liste abbiano la stessa lunghezza
                if len(posizione) != len(ritmo):
                    return False

                return all(
                    isinstance(pos, int) and 0 <= pos <= rit 
                    for pos, rit in zip(posizione, ritmo)
                )

            case _:
                return False

    @staticmethod
    def generate_valid_positions(ritmo: PositionType) -> List[List[int]]:
        """Genera tutte le possibili posizioni valide per un dato ritmo"""
        match ritmo:
            case int():
                # Se ritmo è un intero, genera una singola lista di posizioni valide
                return [list(range(ritmo + 1))]
            case list():
                # Se ritmo è una lista, genera una lista di posizioni valide per ogni elemento
                return [list(range(r + 1)) for r in ritmo]
            case _:
                return []

    @staticmethod
    def calculate_max_amplitude(frequenza: FrequencyType) -> float:
        """
        Calculates the maximum allowed amplitude for a given frequency configuration.

        This method implements amplitude scaling rules based on octave and register values:
        - For octave 0: fixed -6.0 dB
        - For octaves 1-3: linear scaling from -6 to -12 dB with register influence
        - For octaves 4-10: smooth cosine interpolation from -12 to -25 dB

        Args:
            frequenza: Either a FrequencyPair [octave, register] or 
                        FrequencyComplex [[oct1, reg1], [oct2, reg2], position]

        Returns:
            float: Maximum allowed amplitude in dB

        Raises:
            ValueError: If frequency format is invalid

        Examples:
            --> calculate_max_amplitude([2, 3])  # FrequencyPair
            -9.9
            --> calculate_max_amplitude([[2, 3], [4, 1], 5])  # FrequencyComplex
            -13.2
        """
        def _calculate_single_amplitude(ottava: int, registro: int) -> float:
            if ottava == 0:
                return -6.0
            if ottava <= 3:
                slope = (-12 - (-6)) / (3 - 1)
                return -6 + slope * (ottava - 1) - (registro - 1) * 0.3
            progress = (ottava - 3) / (10 - 3)
            smooth_progress = (1 - math.cos(progress * math.pi)) / 2
            base_amplitude = -12 + (-25 - (-12)) * smooth_progress
            register_influence = (registro - 1) * 0.2
            return min(base_amplitude - register_influence, -12)

        match frequenza:
            case [int(), int()]:  # È un FrequencyPair
                ottava, registro = cast(List[int], frequenza)
                return _calculate_single_amplitude(ottava, registro)
            case list():  # È un FrequencyComplex
                results = []
                for elem in frequenza:
                    if isinstance(elem, list) and len(elem) == 2:
                        registro, ottava = cast(List[int], elem)
                        results.append(_calculate_single_amplitude(registro, ottava))
                    elif isinstance(elem, int):
                        # Gestisci il caso di un singolo intero (se necessario)
                        results.append(-6.0)  # O un valore di default
                return sum(results) / len(results)
            case _:
                raise ValueError("Formato di frequenza non valido")

    @staticmethod
    def validate_duration(
        durata: float, durata_armonica: float, ritmo: List[int]
    ) -> bool:
        """Validates that duration respects the harmonic duration rule."""
        min_duration = durata_armonica / max(ritmo) * 2
        return durata > min_duration

    @staticmethod
    def calculate_min_duration(durata_armonica: float, ritmo: List[int]) -> float:
        """Calculates minimum duration for given harmonic duration and rhythm."""
        return durata_armonica / max(ritmo) * 2

    @staticmethod
    def validate_frequency(freq: FrequencyType) -> bool:
        """
        Validates that frequency is in allowed range.

        Args:
            freq: Can be either:
                - [ottava, registro] as List[int]
                - [[ottava1, registro1], [ottava2, registro2], position] 
                        as List[Union[List[int], int]]

        Returns:
            bool: True if frequency is valid, False otherwise
        """
        match freq:
            # Caso 1: freq è una FrequencyPair [ottava, registro]
            case [ottava, registro] if isinstance(ottava, int) and isinstance(registro, int):
                return 0 <= ottava <= 10 and 1 <= registro <= 10

            # Caso 2: freq è una FrequencyComplex [[o1, r1], [o2, r2], pos]
            case [[o1, r1], [o2, r2], pos] if all(isinstance(x, int) for x in [o1, r1, o2, r2, pos]):
                # Verifica i range per ottave e registri
                if not (0 <= o1 <= 10 and 1 <= r1 <= 10 and 0 <= o2 <= 10 and 1 <= r2 <= 10):
                    return False
                # Verifica il range della posizione
                return 0 <= cast(int,pos) <= 20

            # Caso predefinito: tipo non valido
            case _:
                return False


class StatoMusicaleValidator:
    """Class for validating a complete musical state"""

    def __init__(self, rules: ParameterRules):
        self.rules = rules

    def validate_state(self, stato: StatoMusicale) -> Tuple[bool, List[str]]:
        """Validates a complete musical state and returns any errors."""
        errors = []

        # Valida posizione-ritmo
        if not self.rules.validate_position(stato.ritmo, stato.posizione):
            errors.append("Invalid position for given rhythm")

        # Valida ampiezza-frequenza
        try:
            max_amp = self.rules.calculate_max_amplitude(stato.frequenza)
            if isinstance(stato.ampiezza, list):
                if stato.ampiezza[0] > max_amp:
                    errors.append(f"Amplitude too high for given frequency (max: {max_amp})")
            elif stato.ampiezza > max_amp:
                errors.append(f"Amplitude too high for given frequency (max: {max_amp})")
        except (ValueError, IndexError) as e:
            errors.append(f"Invalid frequency format: {str(e)}")

        # Valida durata
        if not self.rules.validate_duration(
            stato.durata, stato.durataArmonica, stato.ritmo
        ):
            min_dur = self.rules.calculate_min_duration(
                stato.durataArmonica, stato.ritmo
            )
            errors.append(f"Duration too short (min: {min_dur})")

        # Valida frequenza
        if not self.rules.validate_frequency(stato.frequenza):
            errors.append("Frequency out of allowed range")

        return len(errors) == 0, errors
