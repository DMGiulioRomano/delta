"""
Modulo principale per la composizione algoritmica musicale.
"""

import math
from typing import Dict, List
from ..models.musical_state import StatoMusicale
from .perturbations.base import Perturbation
from .perturbations.rhythm import RhythmPerturbation
from .perturbations.frequency import FrequencyPerturbation
from .validator import StatoMusicaleValidator, ParameterRules
from ..utils.yaml_utils import generate_yaml


class ComposizioneAlgoritmica:
    """
    Gestisce il processo di composizione algoritmica musicale, 
    applicando perturbazioni e validando gli stati risultanti.
    """

    def __init__(
        self,
        stato_iniziale: StatoMusicale,
        dt: float = 1.0,
        durata_totale: float = 50.0,
        debug_level: int = 1,
    ):
        self.stato = stato_iniziale
        self.dt = dt
        self.durata_totale = durata_totale
        self.debug_level = debug_level

        self.storia = [self.stato]
        self.perturbations = [RhythmPerturbation(), FrequencyPerturbation()]
        print(f"Inizializzazione completata. Durata totale: {durata_totale}")

    def debug_print(self, msg: str, level: int):
        """Stampa messaggi di debug se il livello è appropriato."""
        if self.debug_level >= level:
            print(msg)

    def componi(self):
        """
        Esegue il processo di composizione algoritmica, 
        generando una sequenza di stati musicali.
        """
        tempo = 0
        iterazione = 0
        self.debug_print("Inizio composizione...", 1)

        while tempo < self.durata_totale:
            iterazione += 1
            self.debug_print(f"\nIterazione {iterazione}:", 1)
            self.debug_print(f"Tempo corrente: {tempo:.2f}/{self.durata_totale}", 2)

            # Analisi risonanze
            self.debug_print("Analizzando risonanze...", 2)
            resonance_scores = self.analizza_risonanze(self.stato)
            self.debug_print(f"Punteggi risonanza: {resonance_scores}", 2)

            # Scelta perturbazione
            best_perturbation = self.scegli_perturbazione(resonance_scores)
            self.debug_print(
                f"Perturbazione scelta: {best_perturbation.__class__.__name__}", 2
            )

            # Applicazione perturbazione
            self.debug_print("Applicando perturbazione...", 2)
            result = best_perturbation.apply(self.stato)

            # Validazione
            if self.valida_stato(result.new_state):
                self.debug_print("Stato valido, aggiornando...", 2)
                new_state = result.new_state
                new_state.cAttacco = tempo
                new_state.durata += 4
                self.stato = new_state
                self.storia.append(self.stato)

                dt_adjusted = self.adjust_time_step(result.resonance_score)
                tempo += dt_adjusted
                self.debug_print(f"Nuovo tempo: {tempo:.2f}", 2)
            else:
                self.debug_print("Stato non valido, iterazione saltata", 1)

            if iterazione > 1000:
                self.debug_print("ATTENZIONE: Raggiunto limite massimo iterazioni!", 1)
                break

        self.debug_print(f"\nComposizione completata! Iterazioni: {iterazione}", 1)

    def valida_stato(self, stato: StatoMusicale) -> bool:
        """
        Valida uno stato musicale usando il validatore.
        
        Args:
            stato: Lo stato musicale da validare
            
        Returns:
            bool: True se lo stato è valido, False altrimenti
        """
        validator = StatoMusicaleValidator(ParameterRules())
        is_valid, errors = validator.validate_state(stato)
        if not is_valid:
            print("Errori di validazione:")
            for error in errors:
                print(f"- {error}")
        return is_valid

    def adjust_time_step(self, resonance_score: float) -> float:
        """
        Adjust time step based on resonance score.
        
        Args:
            resonance_score: Current resonance score
            
        Returns:
            float: Adjusted time step
        """
        return self.dt * (1 + resonance_score)

    def genera_yaml(self, filename: str):
        """Genera il file YAML utilizzando l'utility dedicata"""
        generate_yaml(self.storia, filename)

    def analizza_risonanze(self, stato: StatoMusicale) -> Dict[str, float]:
        """
        Analyzes resonance characteristics of a musical state by calculating various metrics.
        
        This method evaluates three main aspects of resonance:
        1. Harmonic alignment: How well frequencies align with harmonic ratios
        2. Rhythm coherence: The internal consistency of rhythmic patterns
        3. Amplitude stability: How well amplitude values 
                match expected levels for given frequencies

        Args:
            stato (StatoMusicale): The musical state to analyze

        Returns:
            Dict[str, float]: Dictionary containing resonance metrics with keys:
                - 'harmonic_alignment': Score for frequency ratios alignment (0-1)
                - 'rhythm_coherence': Score for rhythmic pattern consistency (0-1)
                - 'amplitude_stability': Score for amplitude appropriateness (0-1)
        """
        freq_ratios = [
            f2 / f1 for f1, f2 in zip(stato.frequenza[:-1], stato.frequenza[1:])
        ]

        # Calculate resonance metrics
        resonance_metrics = {
            "harmonic_alignment": sum(abs(1 - (ratio % 1)) for ratio in freq_ratios),
            "rhythm_coherence": self._calculate_rhythm_coherence(stato.ritmo),
            "amplitude_stability": self._analyze_amplitude_stability(
                stato.ampiezza, tuple(stato.frequenza)
            ),
        }

        return resonance_metrics

    def _analyze_amplitude_stability(
        self, ampiezza, frequenza: tuple[int, int]
    ) -> float:
        """
        Analizza la stabilità dell'ampiezza in relazione alla frequenza.
        """
        ottava, registro = frequenza
        if ottava == 0:
            ampiezza_attesa = -6.0
        else:
            ampiezza_attesa = (
                -6.0 - (math.log(ottava * 10 + registro) / math.log(2)) * 3
            )
            ampiezza_attesa = max(ampiezza_attesa, -25.0)  # Limita a -25 dB

        ampiezza_corrente = ampiezza[0] if isinstance(ampiezza, list) else ampiezza

        delta = abs(ampiezza_corrente - ampiezza_attesa)
        stability = math.exp(-delta / 10)

        return stability

    def _calculate_rhythm_coherence(self, ritmo: List[int]) -> float:
        if not ritmo or len(ritmo) < 2:
            return 1.0

        coherence_score = 0.0

        # 1. Rapporti tra valori adiacenti
        ratios = [b / a if a != 0 else 0 for a, b in zip(ritmo[:-1], ritmo[1:])]
        ratio_coherence = sum(1.0 for r in ratios if abs(r - 1.0) < 0.5) / len(ratios)
        coherence_score += ratio_coherence * 0.4

        # 2. Regolarità della sequenza
        mean_rhythm = sum(ritmo) / len(ritmo)
        if mean_rhythm > 0:
            std_dev = math.sqrt(sum((x - mean_rhythm) ** 2 for x in ritmo) / len(ritmo))
            regularity = 1.0 - min(std_dev / mean_rhythm, 1.0)
            coherence_score += regularity * 0.3

        # 3. Pattern ripetitivi
        pattern_score = 0
        for pattern_length in range(1, len(ritmo) // 2 + 1):
            chunks = [
                tuple(ritmo[i : i + pattern_length])
                for i in range(0, len(ritmo) - pattern_length + 1)
            ]
            repetitions = len(chunks) - len(set(chunks))
            pattern_score = max(pattern_score, repetitions / len(chunks))
        coherence_score += pattern_score * 0.3

        return coherence_score

    def scegli_perturbazione(self, resonance_scores: Dict[str, float]) -> Perturbation:
        """
        Sceglie la perturbazione più appropriata basandosi sui punteggi di risonanza.
        """
        perturbation_scores = {
            "rhythm": resonance_scores["rhythm_coherence"],
            "frequency": resonance_scores["harmonic_alignment"],
        }

        if perturbation_scores["rhythm"] < perturbation_scores["frequency"]:
            return self.perturbations[0]  # RhythmPerturbation

        return self.perturbations[1]
