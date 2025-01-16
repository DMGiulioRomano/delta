# tests/conftest.py
import pytest
from src.models.musical_state import StatoMusicale

@pytest.fixture
def basic_musical_state():
    """Fixture per uno stato musicale base valido"""
    return StatoMusicale(
        cAttacco=0.0,
        durataArmonica=26.0,
        ritmo=[3, 4, 5],
        durata=11.0,
        ampiezza=[-20.0],
        frequenza=[2, 1],
        posizione=2
    )

@pytest.fixture
def sample_composition_params():
    """Fixture per parametri di composizione comuni"""
    return {
        'dt': 1.0,
        'durata_totale': 50.0,
        'debug_level': 0
    }