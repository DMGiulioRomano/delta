"""
Modulo che definisce il risultato di una perturbazione musicale.
Bilancia semplicità e funzionalità mantenendo un'interfaccia pulita.
"""

from dataclasses import dataclass, field
from typing import Dict, Any, Optional
from .musical_state import StatoMusicale


@dataclass
class PerturbationResult:
    """
    Risultato di una perturbazione musicale.

    Attributes:
        new_state (StatoMusicale): Il nuovo stato dopo la perturbazione
        resonance_score (float): Punteggio di risonanza complessivo (0-1)
        applied_changes (dict): Registro dei cambiamenti applicati
        success (bool): Indica se la perturbazione è stata applicata con successo
        error_message (Optional[str]): Messaggio di errore, se presente
    """

    new_state: StatoMusicale
    resonance_score: float = 0.0
    applied_changes: Dict[str, Any] = field(default_factory=dict)
    success: bool = True
    error_message: Optional[str] = None

    def add_change(self, parameter: str, old_value: Any, new_value: Any) -> None:
        """
        Registra un cambiamento specifico della perturbazione.

        Args:
            parameter: Nome del parametro modificato
            old_value: Valore originale
            new_value: Nuovo valore
        """
        self.applied_changes[parameter] = {
            "old": old_value,
            "new": new_value,
            "delta": self._calculate_delta(old_value, new_value),
        }

    def _calculate_delta(self, old_value: Any, new_value: Any) -> Any:
        """Calcola la differenza tra vecchio e nuovo valore."""
        try:
            if isinstance(old_value, (int, float)) and isinstance(
                new_value, (int, float)
            ):
                return new_value - old_value
            if isinstance(old_value, list) and isinstance(new_value, list):
                return [n - o for n, o in zip(new_value, old_value)]
            return None
        except (TypeError, ValueError, IndexError) as e:
            print(f"Errore nel calcolo delta: {e}")
            return None

    def summarize(self) -> str:
        """
        Genera un resoconto leggibile del risultato della perturbazione.
        """
        if not self.success:
            return f"Perturbazione fallita: {self.error_message}"

        summary = [
            "Risultato Perturbazione:",
            f"- Punteggio risonanza: {self.resonance_score:.3f}",
        ]

        for param, change in self.applied_changes.items():
            delta_info = (
                f" (Δ: {change['delta']})" if change.get("delta") is not None else ""
            )
            summary.append(f"- {param}: {change['old']} → {change['new']}{delta_info}")

        return "\n".join(summary)


def create_failed_perturbation(
    state: StatoMusicale, error_message: str = "Errore durante la perturbazione"
) -> PerturbationResult:
    """
    Crea un risultato per una perturbazione fallita.

    Args:
        state: Stato originale
        error_message: Descrizione dell'errore

    Returns:
        PerturbationResult indicante il fallimento
    """
    return PerturbationResult(
        new_state=state, success=False, error_message=error_message
    )
