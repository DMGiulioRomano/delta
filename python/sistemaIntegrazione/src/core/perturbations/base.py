"""
Base module for defining musical perturbations in the system.
"""

from abc import ABC, abstractmethod
from ...models.musical_state import StatoMusicale
from ...models.perturbation_result import PerturbationResult


class Perturbation(ABC):
    """Base class for musical perturbations."""

    @abstractmethod
    def apply(self, state: StatoMusicale) -> PerturbationResult:
        """
        Applica la perturbazione allo stato musicale.

        Args:
            state: Lo stato musicale da perturbare

        Returns:
            PerturbationResult: Il risultato della perturbazione
        """
        raise NotImplementedError

    def calculate_resonance(
        self, old_state: StatoMusicale, new_state: StatoMusicale
    ) -> float:
        """
        Calcola il punteggio di risonanza tra due stati.

        Args:
            old_state: Stato originale
            new_state: Nuovo stato dopo la perturbazione

        Returns:
            float: Punteggio di risonanza (0-1)
        """
        raise NotImplementedError
