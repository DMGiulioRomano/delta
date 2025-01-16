from dataclasses import dataclass, field
from typing import Union, List, Dict, Tuple

@dataclass
class StatoMusicale:
    cAttacco: float
    durataArmonica: float
    ritmo: List[int]  
    durata: float
    ampiezza: Union[float, List[float]]
    frequenza: Union[List[int], List[List[int]]]
    posizione: Union[int, List[int]]
    resonance_strength: float = 0.0
    resonance_duration: float = 0.0
    resonance_frequencies: List[float] = field(default_factory=list)
