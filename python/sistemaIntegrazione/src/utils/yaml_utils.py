"""
Utilities per la gestione dei file YAML nel progetto di composizione algoritmica.
Gestisce la serializzazione e deserializzazione degli stati musicali.
"""

import yaml
from pathlib import Path
from typing import List, Dict, Any, Union
from collections import OrderedDict
from dataclasses import asdict

from src.models.musical_state import StatoMusicale

# Ordine predefinito delle chiavi nel file YAML
DEFAULT_KEY_ORDER = [
    'cAttacco',
    'durataArmonica',
    'ritmo',
    'durata',
    'ampiezza',
    'frequenza',
    'posizione'
]

# Campi da escludere nella serializzazione YAML
EXCLUDED_FIELDS = [
    'resonance_strength',
    'resonance_duration',
    'resonance_frequencies'
]

class OrderedDumper(yaml.Dumper):
    """Custom YAML Dumper che preserva l'ordine delle chiavi."""
    pass

def _dict_representer(dumper: yaml.Dumper, data: OrderedDict) -> yaml.Node:
    """Rappresenta un OrderedDict nel formato YAML."""
    return dumper.represent_mapping(
        yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG,
        data.items()
    )

# Registra il rappresentatore personalizzato
OrderedDumper.add_representer(OrderedDict, _dict_representer)

def stato_to_ordered_dict(stato: StatoMusicale, key_order: List[str] = None) -> OrderedDict:
    """
    Converte uno StatoMusicale in un OrderedDict con l'ordine specificato.
    
    Args:
        stato: Lo stato musicale da convertire
        key_order: Ordine desiderato delle chiavi (usa DEFAULT_KEY_ORDER se non specificato)
    
    Returns:
        OrderedDict con le chiavi nell'ordine specificato
    """
    if key_order is None:
        key_order = DEFAULT_KEY_ORDER
        
    # Converti lo stato in dizionario
    stato_dict = asdict(stato)
    
    # Crea OrderedDict con l'ordine specificato
    ordered_dict = OrderedDict()
    for key in key_order:
        if key in stato_dict:
            ordered_dict[key] = stato_dict[key]
            
    # Rimuovi i campi esclusi
    for field in EXCLUDED_FIELDS:
        ordered_dict.pop(field, None)
        
    return ordered_dict

def generate_yaml(stati: List[StatoMusicale], filename: Union[str, Path]) -> None:
    """
    Genera un file YAML dalla lista di stati musicali.
    
    Args:
        stati: Lista di stati musicali da serializzare
        filename: Percorso del file YAML da generare
    """
    # Converti ogni stato in OrderedDict
    comportamenti = [stato_to_ordered_dict(stato) for stato in stati]
    
    # Crea il dizionario principale
    yaml_dict = {'comportamenti': comportamenti}
    
    # Assicurati che la directory esista
    path = Path(filename)
    path.parent.mkdir(parents=True, exist_ok=True)
    
    # Scrivi il file YAML
    with open(path, 'w', encoding='utf-8') as f:
        yaml.dump(
            yaml_dict,
            f,
            Dumper=OrderedDumper,
            default_flow_style=False,
            allow_unicode=True,
            sort_keys=False
        )

def load_yaml(filename: Union[str, Path]) -> List[StatoMusicale]:
    """
    Carica stati musicali da un file YAML.
    
    Args:
        filename: Percorso del file YAML da caricare
    
    Returns:
        Lista di stati musicali
    
    Raises:
        FileNotFoundError: Se il file non esiste
        yaml.YAMLError: Se il file non è un YAML valido
    """
    path = Path(filename)
    if not path.exists():
        raise FileNotFoundError(f"File non trovato: {filename}")
    
    with open(path, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    
    if not isinstance(data, dict) or 'comportamenti' not in data:
        raise ValueError("Formato YAML non valido: manca la chiave 'comportamenti'")
    
    stati = []
    for comp in data['comportamenti']:
        # Aggiungi i campi predefiniti mancanti
        for field in EXCLUDED_FIELDS:
            if field == 'resonance_frequencies':
                comp[field] = []
            else:
                comp[field] = 0.0
        
        stati.append(StatoMusicale(**comp))
    
    return stati

def merge_yaml_files(files: List[Union[str, Path]], output_file: Union[str, Path]) -> None:
    """
    Unisce più file YAML in un unico file.
    
    Args:
        files: Lista di file YAML da unire
        output_file: File di output
    """
    all_states = []
    
    for file in files:
        states = load_yaml(file)
        all_states.extend(states)
    
    generate_yaml(all_states, output_file)

# Esempio di utilizzo nel modulo composition.py:
"""
from utils.yaml_utils import generate_yaml

class ComposizioneAlgoritmica:
    def genera_yaml(self, filename: str) -> None:
        generate_yaml(self.storia, filename)
"""