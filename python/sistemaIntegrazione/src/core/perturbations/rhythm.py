"""
Modulo che gestisce le perturbazioni ritmiche nel sistema musicale.
"""

from copy import deepcopy
from typing import List
from .base import Perturbation
from ...models.musical_state import StatoMusicale
from ...models.perturbation_result import PerturbationResult


class RhythmPerturbation(Perturbation):
    """
    Implementa una perturbazione che modifica il ritmo dello stato musicale
    secondo una progressione predefinita.
    """
    def __init__(self, progression: List[int] = None):
        self.progression = progression or [1, 2, 2, 3, 3, 4, 4, 5]
        self.index = 0

    def apply(self, state: StatoMusicale) -> PerturbationResult:
        new_state = deepcopy(state)

        # Applica la progressione al ritmo
        new_rhythm = []
        for value in new_state.ritmo:
            new_value = value + self.progression[self.index % len(self.progression)]
            new_rhythm.append(new_value)

        # Salva il valore della progressione applicato prima di avanzare l'indice
        applied_progression = self.progression[self.index % len(self.progression)]

        new_state.ritmo = new_rhythm

        # Avanza l'indice della progressione
        self.index += 1

        # Calcola il punteggio di risonanza
        resonance = self.calculate_resonance(state, new_state)

        return PerturbationResult(
            new_state=new_state,
            resonance_score=resonance,
            applied_changes={"rhythm_progression": applied_progression},
        )

    def calculate_resonance(
        self, old_state: StatoMusicale, new_state: StatoMusicale
    ) -> float:
        # Calcola la differenza media del ritmo tra i due stati
        old_rhythm = old_state.ritmo
        new_rhythm = new_state.ritmo
        rhythm_diff = sum(
            abs(new_value - old_value)
            for new_value, old_value in zip(new_rhythm, old_rhythm)
        ) / len(old_rhythm)

        # Calcola la risonanza basata su rhythm_diff e la lunghezza della progressione
        resonance = 1.0 / (rhythm_diff * len(self.progression))

        return resonance
