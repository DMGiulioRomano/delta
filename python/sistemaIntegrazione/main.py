from src.models.musical_state import StatoMusicale
from src.core.composition import ComposizioneAlgoritmica
from src.utils.constants import DEFAULT_DURATION, DEFAULT_DT

def main(debug_level: int = 0):
    stato_iniziale = StatoMusicale(
        cAttacco=0.0,
        durataArmonica=26.0,
        ritmo=[3, 4, 5],
        durata=11.0,
        ampiezza=[-20.0],
        frequenza=[2, 1],
        posizione=2
    )
    
    compositore = ComposizioneAlgoritmica(
        stato_iniziale=stato_iniziale,
        dt=DEFAULT_DT,
        durata_totale=DEFAULT_DURATION,
        debug_level=debug_level
    )
    
    compositore.componi()
    compositore.genera_yaml('../../yaml_dir/sezioni/sezioneX.yaml')

if __name__ == "__main__":
    main(debug_level=0)