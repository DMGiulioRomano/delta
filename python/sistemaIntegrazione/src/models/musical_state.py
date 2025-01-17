"""Module defining the musical state data structure."""
# pylint: disable=too-many-instance-attributes
# pylint: disable=C0103  # Disable invalid-name warnings
from dataclasses import dataclass, field
from typing import Union, List


@dataclass
class StatoMusicale:
    """
    Rappresenta lo stato musicale di una composizione algoritmica.
    Include parametri come attacco, durata, ritmo, ampiezza e frequenza.
    """
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
