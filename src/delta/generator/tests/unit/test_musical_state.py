from ..base_test import BaseTest

class TestStatoMusicale(BaseTest):
    """Test suite for StatoMusicale class"""

    def test_initialization_with_basic_values(self, basic_musical_state):
        """Test that StatoMusicale correctly stores all provided values"""
        assert basic_musical_state.cAttacco == 0.0
        assert basic_musical_state.durataArmonica == 26.0
        assert basic_musical_state.ritmo == [3, 4, 5]
        assert basic_musical_state.durata == 11.0
        assert basic_musical_state.ampiezza == [-20.0]
        assert basic_musical_state.frequenza == [2, 1]
        assert basic_musical_state.posizione == 2

    def test_default_resonance_values(self, basic_musical_state):
        """Test that optional resonance fields have correct defaults"""
        assert basic_musical_state.resonance_strength == 0.0
        assert basic_musical_state.resonance_duration == 0.0
        assert basic_musical_state.resonance_frequencies == []
