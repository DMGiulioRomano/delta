"""
Type definitions for the musical composition system.
"""

from typing import Union, List, Tuple

# Basic types
FrequencyPair = List[int]  # [ottava, registro]
FrequencyComplex = List[Union[List[int], int]]  # [[5,2],[3,4],5]
FrequencyType = Union[FrequencyPair, FrequencyComplex]
AmplitudeType = Union[float, List[float]]
RhythmType = List[int]
PositionType = Union[int, List[int]]
DurationType = float
HarmsDurationType = float
# Logging types

ErrorLogType = Tuple[bool, List[str]]