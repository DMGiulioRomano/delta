# tests/unit/test_validator.py
from ...src.core.validator import StatoMusicaleValidator, ParameterRules

class TestStatoMusicaleValidator:
    """Test suite for StatoMusicaleValidator"""

    def setup_method(self):
        """Setup per ogni test"""
        self.validator = StatoMusicaleValidator(ParameterRules())

    def test_validate_empty_rhythm(self, basic_musical_state):
        """Test validation with empty rhythm"""
        basic_musical_state.ritmo = []  # modifica lo stato con ritmo vuoto
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("ritmo" in str(error).lower() for error in errors)

    def test_validate_negative_rhythm(self, basic_musical_state):
        """Test validation with negative rhythm values"""
        basic_musical_state.ritmo = [-1, -2, 3]  # modifica con valori negativi
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("ritmo" in str(error).lower() for error in errors)
        
    def test_validate_negative_duration(self, basic_musical_state):
        """Test validation with negative duration"""
        basic_musical_state.durata = -5.0
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("durata" in str(error).lower() for error in errors)

    def test_validate_valid_state(self, basic_musical_state):
        """Test validation with valid state"""
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert is_valid
        assert not errors