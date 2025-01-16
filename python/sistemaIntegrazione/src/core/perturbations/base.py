from abc import ABC, abstractmethod
from src.models.musical_state import StatoMusicale
from src.models.perturbation_result import PerturbationResult

class Perturbation(ABC):
    @abstractmethod
    def apply(self, state: StatoMusicale) -> PerturbationResult:
        pass
    
    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        pass
