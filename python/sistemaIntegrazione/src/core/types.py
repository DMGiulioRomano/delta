"""
Type definitions for the musical composition system.
"""

from typing import Union, List

# Basic types
FrequencyPair = List[int]  # [ottava, registro]
FrequencyComplex = List[Union[List[int], int]]  # [[5,2],[3,4],5]
FrequencyType = Union[FrequencyPair, FrequencyComplex]

# Altri tipi che potrebbero essere utili
AmplitudeType = Union[float, List[float]]
RhythmType = List[int]
PositionType = Union[int, List[int]]
