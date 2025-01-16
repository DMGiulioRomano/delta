from dataclasses import dataclass, asdict
from typing import Union, List
import csv
import yaml
from copy import deepcopy
import numpy as np
from pathlib import Path
import pdb
import math

REGISTRI_OTTAVA=10




@dataclass
class StatoMusicale:
   cAttacco: float
   durataArmonica: float
   ritmo: List[int]  
   durata: float
   ampiezza: Union[float, List[float]]
   frequenza: Union[List[int], List[List[int]]]
   posizione: Union[int, List[int]]

class ComposizioneAlgoritmica:
    perturbazioniDict ={
        '0': "perturbaRitmo",
        '1': "perturbaFrequenza1"
    }
    def __init__(self, stato_iniziale: StatoMusicale, dt: float = 1.0, durata_totale: float = 50.0):
        self.stato = stato_iniziale
        self.dt = dt
        self.durata_totale = durata_totale
        self.storia = []
        self.storia.append(self.stato)
        self.pesi = {
            'frequenza': {'ritmo': 0.3, 'ampiezza': 0.2},
            'ritmo': {'frequenza': 0.2, 'ampiezza': 0.1},
            'ampiezza': {'frequenza': 0.15, 'posizione': 0.2},
            'posizione': {'ritmo': 0.25, 'frequenza': 0.15}
        }
            
    def perturbB(self, stato: StatoMusicale):
        nuovo_stato = deepcopy(stato)
        if nuovo_stato.frequenza[0] == 1:
            nuovo_stato.frequenza[0] = 7
        else:
            nuovo_stato.frequenza[1] -= (nuovo_stato.ritmo[0] % 3)
        return nuovo_stato

    def genera_yaml(self, filename: str):
        comportamenti = []
        for stato in self.storia:
            comportamenti.append(asdict(stato))

        yaml_dict = {'comportamenti': comportamenti}
        with open(filename, 'w') as f:
            yaml.dump(yaml_dict, f, default_flow_style=False)

    def componi(self):
        tempo = 0
        prossima_perturbazione = (10, 0)  # (tempo, tipo)

        comps = perturbaRitmo(self.stato)
        self.storia.extend(comps)
        while tempo < self.durata_totale:
            # analizzare lo storico e proporre una perturbazione
            nuovoComps = True # stato musicale modificato da perturbazione
            self.storia.extend(nuovoComps)
            tempo += self.dt

def perturbaRitmo(statomusicale):
    nuovo_stato = statomusicale
    comportamenti = []
    for counter in range(1, 5):
        nuovo_stato = deepcopy(nuovo_stato)
        nuovo_stato.ritmo += 1
        nuovo_stato.cAttacco += 20*math.exp(-counter/2)
        nuovo_stato.durata -= 1
        comportamenti.append(nuovo_stato)
    return comportamenti

def perturbaFrequenza1(statomusicale):
    nuovo_stato = statomusicale
    comportamenti = []
    step = 17
    for counter in range(1, 5):
        nuovo_stato = deepcopy(nuovo_stato)
        ottava, registro = nuovo_stato.frequenza
        registro+=step
        if registro > REGISTRI_OTTAVA:
            ottava+=registro//REGISTRI_OTTAVA
            registro%=REGISTRI_OTTAVA
        if registro == 0:
            registro = REGISTRI_OTTAVA
            ottava-=1
        nuovo_stato.frequenza[0]= ottava  
        nuovo_stato.frequenza[1]= registro  
        nuovo_stato.cAttacco += 20*math.exp(-counter/2)
        nuovo_stato.durata -= 1
        comportamenti.append(nuovo_stato)
    return comportamenti

def main():
    stato_iniziale = StatoMusicale(
        cAttacco=0.0,
        durataArmonica=26.0,
        ritmo=[7, 9],
        durata=10.0,
        ampiezza=0.75,
        frequenza=[2, 1],
        posizione=2
    )
    
    compositore = ComposizioneAlgoritmica(
        stato_iniziale=stato_iniziale,
        dt=1.0,
        durata_totale=50.0
    )
    
    compositore.componi()
    compositore.genera_yaml('comportamenti.yaml')
    
if __name__ == "__main__":
    main()