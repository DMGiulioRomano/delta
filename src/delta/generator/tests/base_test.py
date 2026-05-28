import pytest
from typing import Any

class BaseTest:
    """Base class for all test cases"""
    
    @pytest.fixture(autouse=True)
    def setup(self, basic_musical_state: Any):
        """Common setup for all tests"""
        self.basic_state = basic_musical_state
        
    def assert_valid_musical_state(self, state):
        """Helper to validate musical state properties"""
        assert hasattr(state, 'cAttacco')
        assert hasattr(state, 'durataArmonica')
        assert hasattr(state, 'ritmo')
        assert hasattr(state, 'durata')
        assert hasattr(state, 'ampiezza')
        assert hasattr(state, 'frequenza')
        assert hasattr(state, 'posizione')
