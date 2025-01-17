from ..base_test import BaseTest
from ...src.core.perturbations.rhythm import RhythmPerturbation
from ...src.core.perturbations.frequency import FrequencyPerturbation
from copy import deepcopy

class TestRhythmPerturbation(BaseTest):
    """Test suite for RhythmPerturbation"""
    
    def test_apply_perturbation(self):
        """Test applying rhythm perturbation"""
        perturbation = RhythmPerturbation()
        result = perturbation.apply(self.basic_state)
        
        assert result.resonance_score >= 0.0
        assert result.resonance_score <= 1.0
        assert len(result.new_state.ritmo) == len(self.basic_state.ritmo)
        
    def test_calculate_resonance(self):
        """Test resonance calculation"""
        perturbation = RhythmPerturbation()
        
        # Test risonanza perfetta (stati identici)
        perfect_resonance = perturbation.calculate_resonance(
            self.basic_state,
            self.basic_state
        )
        assert perfect_resonance == 1.0

        # Test risonanza con stati diversi
        modified_state = deepcopy(self.basic_state)
        modified_state.ritmo = [x + 1 for x in self.basic_state.ritmo]
        different_resonance = perturbation.calculate_resonance(
            self.basic_state,
            modified_state
        )
        assert 0 < different_resonance < 1.0
    
class TestFrequencyPerturbation(BaseTest):
    """Test suite for FrequencyPerturbation"""
    
    def test_apply_perturbation(self):
        """Test applying frequency perturbation"""
        perturbation = FrequencyPerturbation()
        result = perturbation.apply(self.basic_state)
        
        assert result.resonance_score >= 0.0
        assert isinstance(result.new_state.frequenza[0], int)
        assert isinstance(result.new_state.frequenza[1], int)