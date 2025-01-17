"""Module for handling frequency perturbations in the musical system."""

from copy import deepcopy
from .base import Perturbation
from ...models.musical_state import StatoMusicale
from ...models.perturbation_result import PerturbationResult
from ...utils.constants import REGISTRI_OTTAVA


class FrequencyPerturbation(Perturbation):
    """
    Implementa una perturbazione che modifica la frequenza dello stato musicale
    secondo step predefiniti.
    """
    def __init__(self, step: int = 4):
        self.step = step

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
        ottava, registro = new_state.frequenza

        # Applica la perturbazione
        registro += self.step
        if registro > REGISTRI_OTTAVA:
            ottava += registro // REGISTRI_OTTAVA
            registro %= REGISTRI_OTTAVA
        if registro == 0:
            registro = REGISTRI_OTTAVA
            ottava -= 1

        new_state.frequenza[0] = ottava
        new_state.frequenza[1] = registro

        resonance = self.calculate_resonance(state, new_state)

        return PerturbationResult(
            new_state=new_state,
            resonance_score=resonance,
            applied_changes={"frequency_step": self.step},
        )

    def calculate_resonance(
        self, old_state: StatoMusicale, new_state: StatoMusicale
    ) -> float:
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
        old_freq = old_state.frequenza
        new_freq = new_state.frequenza
        freq_diff = abs(
            new_freq[0] * 10 + new_freq[1] - (old_freq[0] * 10 + old_freq[1])
        )

        # Calcola la risonanza basata su freq_diff e self.step
        if freq_diff == 0:
            # Se non c'è differenza di frequenza, la risonanza è massima
            resonance = 1.0
        else:
            # Altrimenti, la risonanza diminuisce all'aumentare di freq_diff e self.step
            resonance = 1.0 / (freq_diff * self.step)

        return resonance
