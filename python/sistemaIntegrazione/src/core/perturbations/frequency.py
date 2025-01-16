from copy import deepcopy
from .base import Perturbation
from src.models.musical_state import StatoMusicale
from src.models.perturbation_result import PerturbationResult
from src.utils.constants import REGISTRI_OTTAVA

class FrequencyPerturbation(Perturbation):
    def __init__(self, step: int = 4):
        self.step = step
        
    def apply(self, state: StatoMusicale) -> PerturbationResult:
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
            applied_changes={'frequency_step': self.step}
        )
        
    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        # Calcola la differenza di frequenza tra i due stati
        old_freq = old_state.frequenza
        new_freq = new_state.frequenza
        freq_diff = abs(new_freq[0] * 10 + new_freq[1] - (old_freq[0] * 10 + old_freq[1]))

        # Calcola la risonanza basata su freq_diff e self.step
        if freq_diff == 0:
            # Se non c'è differenza di frequenza, la risonanza è massima
            resonance = 1.0
        else:
            # Altrimenti, la risonanza diminuisce all'aumentare di freq_diff e self.step
            resonance = 1.0 / (freq_diff * self.step)

        return resonance