"""Module defining the musical state data structure."""

# pylint: disable=too-many-instance-attributes
# pylint: disable=C0103  # Disable invalid-name warnings
from dataclasses import dataclass, field
from typing import List
from ..core.types import FrequencyType, AmplitudeType, RhythmType, PositionType


@dataclass
class StatoMusicale:
    """
    Rappresenta lo stato musicale di una composizione algoritmica.
    Include parametri come attacco, durata, ritmo, ampiezza e frequenza.
    """

    cAttacco: float
    durataArmonica: float
    ritmo: RhythmType
    durata: float
    ampiezza: AmplitudeType
    frequenza: FrequencyType
    posizione: PositionType
    resonance_strength: float = 0.0
    resonance_duration: float = 0.0
    resonance_frequencies: List[float] = field(default_factory=list)
