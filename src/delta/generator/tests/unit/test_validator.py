# tests/unit/test_validator.py
from ...src.core.validator import StatoMusicaleValidator, ParameterRules
import pytest

class TestStatoMusicaleValidator:
    """Test suite for StatoMusicaleValidator"""

    def setup_method(self):
        """Setup per ogni test"""
        self.validator = StatoMusicaleValidator(ParameterRules())

    def test_validate_valid_state(self, basic_musical_state):
        """Test validation with valid state"""
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert is_valid
        assert not errors
    # ---------- RHYTHM -------------
    def test_validate_empty_rhythm(self, basic_musical_state):
        """Test validation with empty rhythm"""
        basic_musical_state.ritmo = []  # modifica lo stato con ritmo vuoto
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("empty rhythm" in str(error).lower() for error in errors)

    def test_validate_negative_rhythm(self, basic_musical_state):
        """Test validation with negative rhythm values"""
        basic_musical_state.ritmo = [-1, -2, 3]  # modifica con valori negativi
        is_valid, errors = self.validator.validate_state(basic_musical_state)

        assert not is_valid
        assert any("invalid rhythm" in str(error).lower() for error in errors)

    def test_validate_rhythm_not_list(self, basic_musical_state):
        """Test validation when rhythm is not a list type"""
        validator = StatoMusicaleValidator(ParameterRules())
        basic_musical_state.ritmo = 123  # Set rhythm to an integer instead of a list
        is_valid, errors = validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("must be a list" in str(error).lower() for error in errors)

    # ---------- DURATION -------------
    def test_validate_non_numeric_duration(self, basic_musical_state):
        """Test validation when duration is not a numeric type"""
        basic_musical_state.durata = "10.0"  # passing a string instead of a float
        is_valid, errors = self.validator.validate_state(basic_musical_state)
        
        assert not is_valid
        assert any("float" in str(error).lower() for error in errors)

    def test_validate_negative_duration(self, basic_musical_state):
        """Test validation with negative duration"""
        basic_musical_state.durata = -5.0
        is_valid, errors = self.validator.validate_state(basic_musical_state)
      
        assert not is_valid
        assert any("duration" in str(error).lower() for error in errors)        

  # ---------- POSITION -------------
    def test_validate_position_float(self, basic_musical_state):
        """Test con posizione come float"""
        validator = StatoMusicaleValidator(ParameterRules())
        basic_musical_state.posizione = 2.5
        is_valid, errors = validator.validate_state(basic_musical_state)
        assert not is_valid
        assert any("position" in str(error).lower() for error in errors)

    def test_validate_position_list(self,basic_musical_state):
        """Test con posizione come lista"""
        validator = StatoMusicaleValidator(ParameterRules())
        basic_musical_state.posizione = [[3, 4, 5], [1, 2, 2]]
        rules = ParameterRules()
        is_valid, errors = validator.validate_state(basic_musical_state)
        assert not is_valid
        assert any("position" in str(error).lower() for error in errors)
