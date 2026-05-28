"""Module for handling frequency perturbations in the musical system."""

from copy import deepcopy
from typing import List, cast
from .base import Perturbation
from ...models.musical_state import StatoMusicale
from ...models.perturbation_result import PerturbationResult
from ...utils.constants import REGISTRI_OTTAVA
from ..types import FrequencyType

class FrequencyPerturbation(Perturbation):
    """Implements a perturbation that modifies the musical state frequency."""

    def __init__(self, step: int = 4):
        self.step = step

    def _update_frequency(self, ottava: int, registro: int) -> List[int]:
        registro += self.step
        if registro > REGISTRI_OTTAVA:
            ottava += registro // REGISTRI_OTTAVA
            registro %= REGISTRI_OTTAVA
        if registro == 0:
            registro = REGISTRI_OTTAVA
            ottava -= 1
        return [ottava, registro]

    def apply(self, state: StatoMusicale) -> PerturbationResult:
        """
        Applies frequency perturbation to the musical state by adjusting octave and register.

        The method increments the frequency register by a predefined step value. When the register
        exceeds REGISTRI_OTTAVA, it rolls over and increments the octave. Special handling is
        provided when register becomes 0.

        Args:
            state (StatoMusicale): The original musical state to be perturbed

        Returns:
            PerturbationResult: A result object containing:
                - new_state: The perturbed musical state
                - resonance_score: Calculated resonance between old and new states
                - applied_changes: Dictionary with the frequency step that was applied
        """
        new_state = deepcopy(state)
        match new_state.frequenza:
            case [ottava, registro] if isinstance(ottava, int) and isinstance(registro, int):
                new_state.frequenza = self._update_frequency(ottava, registro)

            case [[o1, r1], [o2, r2], pos] if all(isinstance(x, int) for x in [o1, r1, o2, r2, pos]):
                for freq_pair in [new_state.frequenza[0], new_state.frequenza[1]]:
                    take_freq = cast(List[int], freq_pair)
                    freq_pair = self._update_frequency(take_freq[0], take_freq[1])

            case _:
                raise ValueError("Invalid frequency format")

        resonance = self.calculate_resonance(state, new_state)
        return PerturbationResult(
            new_state=new_state,
            resonance_score=resonance,
            applied_changes={"frequency_step": self.step},
        )

    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        """
        Calculates the resonance score between two musical states based on frequency changes.

        The resonance is inversely proportional to both the frequency
        difference between states and the perturbation step size.
        Perfect resonance (1.0) occurs when frequencies match exactly.

        Args:
            old_state (StatoMusicale): The original musical state
            new_state (StatoMusicale): The perturbed musical state

        Returns:
            float: Resonance score between 0 and 1, where:
                - 1.0 indicates perfect resonance (no frequency change)
                - Lower values indicate decreasing resonance due to larger frequency differences
        """
        def freq_to_value(freq: FrequencyType) -> float:
            match freq:
                case [ottava, registro] if isinstance(ottava, int) and isinstance(registro, int):
                    return ottava * 10 + registro
                case [[o1, r1], [o2, r2], _] if all(isinstance(x, int) for x in [o1, r1, o2, r2]):
                    return (o1 * 10 + r1 + o2 * 10 + r2) / 2
                case _:
                    raise ValueError("Invalid frequency format")

        freq_diff = abs(freq_to_value(new_state.frequenza) - freq_to_value(old_state.frequenza))
        return 1.0 if freq_diff == 0 else 1.0 / (freq_diff * self.step)
