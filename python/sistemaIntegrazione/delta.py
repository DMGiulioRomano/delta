from dataclasses import dataclass, asdict, field
from typing import Union, List, Dict, Tuple, Callable
import csv
import yaml
from copy import deepcopy
import numpy as np
from pathlib import Path
import pdb
import math
import random
from abc import ABC, abstractmethod
REGISTRI_OTTAVA=10
import functools
import time
import traceback
from collections import OrderedDict

def debug_log(func: Callable):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print(f"\nEntrando in {func.__name__}")
        start_time = time.time()
        try:
            result = func(*args, **kwargs)
            end_time = time.time()
            print(f"Uscendo da {func.__name__}. Tempo di esecuzione: {end_time - start_time:.2f}s")
            return result
        except Exception as e:
            print(f"Errore in {func.__name__}:")
            print(f"Tipo errore: {type(e).__name__}")
            print(f"Messaggio: {str(e)}")
            print("Traceback:")
            print(traceback.format_exc())
            raise
    return wrapper

@dataclass
class StatoMusicale:
    cAttacco: float
    durataArmonica: float
    ritmo: List[int]  
    durata: float
    ampiezza: Union[float, List[float]]
    frequenza: Union[List[int], List[List[int]]]
    posizione: Union[int, List[int]]
    resonance_strength: float = 0.0
    resonance_duration: float = 0.0
    resonance_frequencies: List[float] = field(default_factory=list)



@dataclass
class PerturbationResult:
    """Risultato di una perturbazione"""
    new_state: StatoMusicale
    resonance_score: float = 0.0
    applied_changes: dict = field(default_factory=dict)

class Perturbation(ABC):
    """Classe base astratta per le perturbazioni"""
    
    @abstractmethod
    def apply(self, state: StatoMusicale) -> PerturbationResult:
        """Applica la perturbazione a uno stato"""
        pass
    
    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        """Calcola il punteggio di risonanza tra vecchio e nuovo stato"""
        pass

class FrequencyPerturbation(Perturbation):
    def __init__(self, step: int = 4):
        self.step = step
        
    def apply(self, state: StatoMusicale) -> PerturbationResult:
        new_state = deepcopy(state)
        ottava, registro = new_state.frequenza
        
        # Applica la perturbazione
        registro += self.step
        if registro > REGISTRI_OTTAVA:
            ottava += registro // REGISTRI_OTTAVA
            registro %= REGISTRI_OTTAVA
        if registro == 0:
            registro = REGISTRI_OTTAVA
            ottava -= 1
            
        new_state.frequenza[0] = ottava
        new_state.frequenza[1] = registro
        
        resonance = self.calculate_resonance(state, new_state)
        
        return PerturbationResult(
            new_state=new_state,
            resonance_score=resonance,
            applied_changes={'frequency_step': self.step}
        )
        
    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        # Calcola la differenza di frequenza tra i due stati
        old_freq = old_state.frequenza
        new_freq = new_state.frequenza
        freq_diff = abs(new_freq[0] * 10 + new_freq[1] - (old_freq[0] * 10 + old_freq[1]))

        # Calcola la risonanza basata su freq_diff e self.step
        if freq_diff == 0:
            # Se non c'è differenza di frequenza, la risonanza è massima
            resonance = 1.0
        else:
            # Altrimenti, la risonanza diminuisce all'aumentare di freq_diff e self.step
            resonance = 1.0 / (freq_diff * self.step)

        return resonance

class RhythmPerturbation(Perturbation):
    def __init__(self, progression: List[int] = [1, 2, 2, 3, 3, 4, 4, 5]):
        self.progression = progression
        self.index = 0

    def apply(self, state: StatoMusicale) -> PerturbationResult:
        new_state = deepcopy(state)

        # Applica la progressione al ritmo
        new_rhythm = []
        for value in new_state.ritmo:
            new_value = value + self.progression[self.index % len(self.progression)]
            new_rhythm.append(new_value)
        # Salva il valore della progressione applicato prima di avanzare l'indice
        applied_progression = self.progression[self.index % len(self.progression)]

        new_state.ritmo = new_rhythm

        # Avanza l'indice della progressione
        self.index += 1

        # Calcola il punteggio di risonanza
        resonance = self.calculate_resonance(state, new_state)

        return PerturbationResult(
            new_state=new_state,
            resonance_score=resonance,
            applied_changes={'rhythm_progression': applied_progression}
        )
    def calculate_resonance(self, old_state: StatoMusicale, new_state: StatoMusicale) -> float:
        # Calcola la differenza media del ritmo tra i due stati
        old_rhythm = old_state.ritmo
        new_rhythm = new_state.ritmo
        rhythm_diff = sum(abs(new_value - old_value) for new_value, old_value in zip(new_rhythm, old_rhythm)) / len(old_rhythm)

        # Calcola la risonanza basata su rhythm_diff e la lunghezza della progressione
        resonance = 1.0 / (rhythm_diff * len(self.progression))

        return resonance
class ComposizioneAlgoritmica:
    def __init__(self, stato_iniziale: StatoMusicale, dt: float = 1.0, durata_totale: float = 50.0, debug_level: int = 1):
        self.stato = stato_iniziale
        self.dt = dt
        self.durata_totale = durata_totale
        self.debug_level = debug_level

        self.storia = [self.stato]
        self.perturbations = [
            RhythmPerturbation(),
            FrequencyPerturbation()
        ]
        print(f"Inizializzazione completata. Durata totale: {durata_totale}")

    def debug_print(self, msg: str, level: int):
        if self.debug_level >= level:
            print(msg)


    def componi(self):
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
            self.debug_print(f"Perturbazione scelta: {best_perturbation.__class__.__name__}", 2)
            
            # Applicazione perturbazione
            self.debug_print("Applicando perturbazione...", 2)
            result = best_perturbation.apply(self.stato)
            
            # Validazione
            if self.valida_stato(result.new_state):
                self.debug_print("Stato valido, aggiornando...", 2)
                new_state = result.new_state
                new_state.cAttacco = tempo
                new_state.durata +=4
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
        validator = StatoMusicaleValidator(ParameterRules())
        is_valid, errors = validator.validate_state(stato)
        if not is_valid:
            print("Errori di validazione:")
            for error in errors:
                print(f"- {error}")
        return is_valid
    
    def adjust_time_step(self, resonance_score: float) -> float:
        """Aggiusta il passo temporale in base alla risonanza"""
        # Più alta è la risonanza, più lungo è il tempo di attesa
        return self.dt * (1 + resonance_score)
        
    def genera_yaml(self, filename: str):
        # Definisci l'ordine esatto delle chiavi come nell'esempio YAML che hai mostrato
        key_order = [
            'cAttacco', 
            'durataArmonica', 
            'ritmo', 
            'durata', 
            'ampiezza', 
            'frequenza', 
            'posizione'
        ]
        
        comportamenti = []
        for stato in self.storia:
            # Converti lo stato in un dizionario
            stato_dict = asdict(stato)
            
            # Crea un OrderedDict con l'ordine specificato
            ordered_stato_dict = OrderedDict()
            for key in key_order:
                if key in stato_dict:
                    ordered_stato_dict[key] = stato_dict[key]
            
            # Rimuovi i campi esclusi
            excluded_fields = [
                'resonance_strength', 
                'resonance_duration', 
                'resonance_frequencies'
            ]
            for field in excluded_fields:
                ordered_stato_dict.pop(field, None)
            
            comportamenti.append(ordered_stato_dict)
        
        yaml_dict = {'comportamenti': comportamenti}
        
        # Usa un custom dumper per preservare l'ordine
        class OrderedDumper(yaml.Dumper):
            pass

        def _dict_representer(dumper, data):
            return dumper.represent_mapping(
                yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG,
                data.items())

        OrderedDumper.add_representer(OrderedDict, _dict_representer)
        
        with open(filename, 'w') as f:
            yaml.dump(yaml_dict, f, Dumper=OrderedDumper, default_flow_style=False)
                        
    def analizza_risonanze(self, stato: StatoMusicale) -> Dict[str, float]:
        # Analyze frequency relationships
        freq_ratios = [f2/f1 for f1, f2 in zip(stato.frequenza[:-1], stato.frequenza[1:])]
        
        # Calculate resonance metrics
        resonance_metrics = {
            'harmonic_alignment': sum(abs(1 - (ratio % 1)) for ratio in freq_ratios),
            'rhythm_coherence': self._calculate_rhythm_coherence(stato.ritmo),
            'amplitude_stability': self._analyze_amplitude_stability(stato.ampiezza, tuple(stato.frequenza))  # Corretto passando la frequenza
        }
        
        return resonance_metrics
    def _analyze_amplitude_stability(self, ampiezza, frequenza: Tuple[int, int]) -> float:
        """
        Analizza la stabilità dell'ampiezza in relazione alla frequenza.
        L'ampiezza dovrebbe diminuire logaritmicamente con l'aumentare della frequenza.
        
        Args:
            ampiezza: può essere float o List[float]
            frequenza: tupla (ottava, registro)
        
        Returns:
            float: Un valore tra 0 (instabile) e 1 (stabile)
        """
        # Calcola l'ampiezza massima attesa per questa frequenza
        ottava, registro = frequenza
        if ottava == 0:
            ampiezza_attesa = -6.0
        else:
            # Calcolo logaritmico dell'ampiezza attesa
            ampiezza_attesa = -6.0 - (math.log(ottava * 10 + registro) / math.log(2)) * 3
            ampiezza_attesa = max(ampiezza_attesa, -25.0)  # Limita a -25 dB
        
        # Gestisce sia il caso di ampiezza singola che lista
        ampiezza_corrente = ampiezza[0] if isinstance(ampiezza, list) else ampiezza
        
        # Calcola quanto l'ampiezza corrente si discosta dal valore atteso
        delta = abs(ampiezza_corrente - ampiezza_attesa)
        
        # Normalizza il risultato tra 0 e 1
        # Usa una funzione esponenziale per dare più peso a piccole deviazioni
        stability = math.exp(-delta / 10)  # Il divisore 10 regola la "sensibilità"
        
        return stability

    def _calculate_rhythm_coherence(self, ritmo: List[int]) -> float:
        """
        Calcola la coerenza ritmica analizzando:
        1. Rapporti tra valori ritmici adiacenti
        2. Regolarità della sequenza
        3. Presenza di pattern ripetitivi
        
        Returns:
            float: Un valore tra 0 (incoerente) e 1 (massima coerenza)
        """
        if not ritmo or len(ritmo) < 2:
            return 1.0  # Un singolo valore è coerente per definizione
            
        coherence_score = 0.0
        
        # 1. Rapporti tra valori adiacenti
        ratios = [b/a if a != 0 else 0 for a, b in zip(ritmo[:-1], ritmo[1:])]
        ratio_coherence = sum(1.0 for r in ratios if abs(r - 1.0) < 0.5) / len(ratios)
        coherence_score += ratio_coherence * 0.4  # peso 40%
        
        # 2. Regolarità della sequenza (deviazione standard normalizzata)
        mean_rhythm = sum(ritmo) / len(ritmo)
        if mean_rhythm > 0:
            std_dev = math.sqrt(sum((x - mean_rhythm)**2 for x in ritmo) / len(ritmo))
            regularity = 1.0 - min(std_dev / mean_rhythm, 1.0)  # Normalizzato tra 0 e 1
            coherence_score += regularity * 0.3  # peso 30%
        
        # 3. Pattern ripetitivi
        pattern_score = 0
        for pattern_length in range(1, len(ritmo)//2 + 1):
            chunks = [tuple(ritmo[i:i+pattern_length]) for i in range(0, len(ritmo)-pattern_length+1)]
            repetitions = len(chunks) - len(set(chunks))
            pattern_score = max(pattern_score, repetitions / len(chunks))
        coherence_score += pattern_score * 0.3  # peso 30%
        
        return coherence_score

    def scegli_perturbazione(self, resonance_scores: Dict[str, float]) -> Perturbation:
        """
        Sceglie la perturbazione più appropriata basandosi sui punteggi di risonanza.
        
        Args:
            resonance_scores: Dizionario con i punteggi di risonanza per diversi aspetti
            
        Returns:
            La perturbazione scelta
        """
        # Calcola punteggi per ogni tipo di perturbazione
        perturbation_scores = {
            'rhythm': resonance_scores['rhythm_coherence'],
            'frequency': resonance_scores['harmonic_alignment']
        }
        
        # Scegli la perturbazione con il punteggio più basso
        # (score più basso indica maggior bisogno di miglioramento)
        if perturbation_scores['rhythm'] < perturbation_scores['frequency']:
            return self.perturbations[0]  # RhythmPerturbation
        else:
            return self.perturbations[1]  

    def scegli_prossima_perturbazione(self, resonance_metrics: Dict[str, float]) -> Tuple[str, float]:
        # Weight different perturbation types based on resonance metrics
        weights = {
            'perturbaRitmo': resonance_metrics['rhythm_coherence'],
            'perturbaFrequenza1': resonance_metrics['harmonic_alignment']
        }
        
        # Choose perturbation type with highest potential impact
        perturbation_type = max(weights.items(), key=lambda x: x[1])[0]
        
        # Calculate optimal timing based on current resonances
        optimal_time = self._calculate_optimal_timing(resonance_metrics)
        
        return (perturbation_type, optimal_time)

    def _calculate_optimal_timing(self, resonance_metrics: Dict[str, float]) -> float:
        # Base timing on resonance strength and stability
        base_time = 10.0  # Base duration
        resonance_factor = resonance_metrics['amplitude_stability']
        
        # Adjust timing based on resonance characteristics
        optimal_time = base_time * (1 + resonance_factor)
        
        return min(max(optimal_time, 5.0), 20.0)  # Constrain between 5 and 20 seconds


class ResonanceMemory:
    def __init__(self, capacity: int = 10):
        self.memory = []
        self.capacity = capacity
    
    def add_resonance(self, metrics: Dict[str, float]):
        self.memory.append(metrics)
        if len(self.memory) > self.capacity:
            self.memory.pop(0)
    
    def get_trend(self) -> Dict[str, float]:
        # Analyze trends in resonance metrics
        return {key: sum(m[key] for m in self.memory)/len(self.memory) 
                for key in self.memory[0].keys()}
    

@dataclass
class ParameterRules:
    """Classe che gestisce le regole e le relazioni tra i parametri musicali"""
    
    @staticmethod
    def validate_position(ritmo: List[int], posizione: Union[int, List[int]]) -> bool:
        """
        Valida la posizione in due modi:
        1. Se posizione è una lista, ogni elemento deve essere <= del corrispondente ritmo
        2. Se posizione è un numero, deve essere:
        - maggiore o uguale a 0
        - minore o uguale alla media dei ritmi
        """
        if isinstance(posizione, list):
            # Caso lista: ogni posizione deve essere <= del ritmo corrispondente
            if len(posizione) != len(ritmo):
                return False
            return all(0 <= p <= r for p, r in zip(posizione, ritmo))
        elif isinstance(posizione, (int, float)):
            # Caso numero singolo
            media_ritmi = sum(ritmo) / len(ritmo)
            return 0 <= posizione <= media_ritmi
        else:
            # Tipo non valido
            return False
    
    @staticmethod
    def generate_valid_positions(ritmo: List[int]) -> List[List[int]]:
        """Genera tutte le possibili posizioni valide per un dato ritmo"""
        valid_positions = []
        for r in ritmo:
            valid_positions.append(list(range(r + 1)))
        return valid_positions

    @staticmethod
    def calculate_max_amplitude(frequenza: tuple[int, int]) -> float:
        """
        Calcola l'ampiezza massima per una data frequenza.
        
        Args:
            frequenza: Tupla (ottava, registro)
            
        Returns:
            float: Ampiezza massima in dB
        """
        ottava, registro = frequenza
        
        # Caso speciale per ottava 0
        if ottava == 0:
            return -6.0
            
        # Discesa lineare da -6 a -12 per ottave 1-3
        if ottava <= 3:
            slope = (-12 - (-6)) / (3 - 1)  # Calcolo pendenza per discesa lineare
            return -6 + slope * (ottava - 1) - (registro - 1) * 0.3
            
        # Transizione morbida da -12 a -25 per ottave 4-10
        # Usando interpolazione cosinusoidale per una curva più morbida
        progress = (ottava - 3) / (10 - 3)  # Progresso normalizzato da 4 a 10
        smooth_progress = (1 - math.cos(progress * math.pi)) / 2  # Interpolazione cosinusoidale
        base_amplitude = -12 + (-25 - (-12)) * smooth_progress
        
        # Aggiunge una minore influenza del registro per le ottave più alte
        register_influence = (registro - 1) * 0.2
        return min(base_amplitude - register_influence, -12)


    @staticmethod
    def validate_duration(durata: float, durata_armonica: float, ritmo: List[int]) -> bool:
        """Valida che la durata rispetti la regola della durata armonica"""
        min_duration = durata_armonica / max(ritmo) * 2
        return durata > min_duration

    @staticmethod
    def calculate_min_duration(durata_armonica: float, ritmo: List[int]) -> float:
        """Calcola la durata minima per dati durata armonica e ritmo"""
        return durata_armonica / max(ritmo) * 2

    @staticmethod
    def validate_frequency(freq: Tuple[int, int]) -> bool:
        """Valida che la frequenza sia nel range consentito [0,1] fino a [10,10]"""
        ottava, registro = freq
        return (0 <= ottava <= 10 and 
                1 <= registro <= 10)

class StatoMusicaleValidator:
    """Classe per validare uno stato musicale completo"""
    
    def __init__(self, rules: ParameterRules):
        self.rules = rules

    def validate_state(self, stato: StatoMusicale) -> Tuple[bool, List[str]]:
        """Valida uno stato musicale completo e ritorna errori eventuali"""
        errors = []
        
        # Valida posizione-ritmo
        if not self.rules.validate_position(stato.ritmo, stato.posizione):
            errors.append("Posizione non valida per il ritmo dato")
            
        # Valida ampiezza-frequenza
        max_amp = self.rules.calculate_max_amplitude(stato.frequenza)
        if isinstance(stato.ampiezza, list):
            if stato.ampiezza[0] > max_amp:
                errors.append(f"Ampiezza troppo alta per la frequenza data (max: {max_amp})")
        elif stato.ampiezza > max_amp:
            errors.append(f"Ampiezza troppo alta per la frequenza data (max: {max_amp})")
            
        # Valida durata
        if not self.rules.validate_duration(stato.durata, stato.durataArmonica, stato.ritmo):
            min_dur = self.rules.calculate_min_duration(stato.durataArmonica, stato.ritmo)
            errors.append(f"Durata troppo breve (min: {min_dur})")
            
        # Valida frequenza
        if not self.rules.validate_frequency(stato.frequenza):
            errors.append("Frequenza fuori dal range consentito")
            
        return len(errors) == 0, errors
    
class PositionStrategy:
    @staticmethod
    def random_position(ritmo: List[int]) -> List[int]:
        """Genera posizioni casuali valide per il ritmo dato"""
        return [random.randint(0, r) for r in ritmo]
    
    @staticmethod
    def weighted_position(ritmo: List[int], weights: List[float]) -> List[int]:
        """Genera posizioni con probabilità pesate"""
        positions = []
        for r in ritmo:
            probs = weights[:r+1] / np.sum(weights[:r+1])
            positions.append(np.random.choice(range(r+1), p=probs))
        return positions
    
    @staticmethod
    def symmetric_position(ritmo: List[int]) -> List[int]:
        """Genera posizioni simmetriche"""
        return [r // 2 for r in ritmo]




def main(debug_level: int = 0):
    # Configuriamo i messaggi di debug in base al livello
    def debug_print(msg: str, level: int):
        if debug_level >= level:
            print(msg)

    debug_print("Inizializzazione del programma...", 0)
    
    rules = ParameterRules()
    validator = StatoMusicaleValidator(rules)

    stato_iniziale = StatoMusicale(
        cAttacco=0.0,
        durataArmonica=26.0,
        ritmo=[3, 4, 5],
        durata=11.0,
        ampiezza=[-20.0],
        frequenza=[2, 1],
        posizione=2
    )

    # Valida lo stato
    debug_print("Validazione stato iniziale...", 0)
    is_valid, errors = validator.validate_state(stato_iniziale)
    if not is_valid:
        print("Errori trovati:")
        for error in errors:
            print(f"- {error}")
        return
            
    debug_print("Creazione compositore...", 0)
    compositore = ComposizioneAlgoritmica(
        stato_iniziale=stato_iniziale,
        dt=1.0,
        durata_totale=50.0,
        debug_level=0
    )
    
    debug_print("Avvio composizione...", 1)
    compositore.componi()
    debug_print("Generazione file YAML...", 1)
    compositore.genera_yaml('yaml_dir/sezioni/sezioneX.yaml')
    debug_print("Programma completato!", 1)

if __name__ == "__main__":
    # Puoi cambiare questo valore per vedere più o meno dettagli
    # 0: solo errori
    # 1: informazioni base sul progresso
    # 2: informazioni dettagliate
    debug_level = 1
    main(debug_level)