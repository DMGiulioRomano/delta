from dataclasses import dataclass
from typing import Union, List
import csv
import yaml
from copy import deepcopy
import numpy as np
from pathlib import Path

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
    def __init__(self, stato_iniziale: StatoMusicale, dt: float = 1.0, durata_totale: float = 50.0):
        self.stato = stato_iniziale
        self.dt = dt
        self.durata_totale = durata_totale
        self.storia = []
        self.pesi = {
            'frequenza': {'ritmo': 0.3, 'ampiezza': 0.2},
            'ritmo': {'frequenza': 0.2, 'ampiezza': 0.1},
            'ampiezza': {'frequenza': 0.15, 'posizione': 0.2},
            'posizione': {'ritmo': 0.25, 'frequenza': 0.15}
        }
        
    def evolvi_parametri(self, stato: StatoMusicale):
        nuovo_stato = deepcopy(stato)
        
        for param, influenze in self.pesi.items():
            if param == 'frequenza' and isinstance(stato.frequenza, list):
                # For list parameters, use first element or sum
                delta = sum(self.pesi[param].get(altro, 0) * 
                        (sum(getattr(stato, altro)) if isinstance(getattr(stato, altro), list) 
                            else getattr(stato, altro))
                        for altro in influenze if hasattr(stato, altro))
                nuovo_stato.frequenza[1] = max(1, min(9, stato.frequenza[1] + int(delta)))
        
        return nuovo_stato
    
    def perturbA(self, stato: StatoMusicale):
        nuovo_stato = deepcopy(stato)
        if nuovo_stato.frequenza[0] == 6:
            nuovo_stato.frequenza[0] = 2
        else:
            nuovo_stato.frequenza[1] += (nuovo_stato.ritmo[0] % 3)
        return nuovo_stato

    def perturbB(self, stato: StatoMusicale):
        nuovo_stato = deepcopy(stato)
        if nuovo_stato.frequenza[0] == 1:
            nuovo_stato.frequenza[0] = 7
        else:
            nuovo_stato.frequenza[1] -= (nuovo_stato.ritmo[0] % 3)
        return nuovo_stato

    def calcola_cambiamenti_parametri(self, storia: List[StatoMusicale]):
        if len(storia) < 2:
            return {}
        
        cambiamenti = {
            'frequenza': abs(storia[-1].frequenza[1] - storia[-2].frequenza[1]),
            'ritmo': sum(abs(a - b) for a, b in zip(storia[-1].ritmo, storia[-2].ritmo)),
            'ampiezza': abs(storia[-1].ampiezza - storia[-2].ampiezza) if isinstance(storia[-1].ampiezza, (int, float)) else 0
        }
        return cambiamenti

    def determina_prossima_perturbazione(self, cambiamenti: dict) -> tuple:
        # Esempio semplice: se i cambiamenti sono significativi, applica perturbazione
        if cambiamenti.get('frequenza', 0) > 2:
            return (10, 0)  # (tempo_attesa, tipo_perturbazione)
        return (5, 1)


    def salva_csv(self, filename: str):
        with open(filename, 'w', newline='') as f:
            writer = csv.writer(f, delimiter=',')
            for stato in self.storia:
                writer.writerow([
                    stato.cAttacco,
                    stato.durataArmonica,
                    stato.ritmo,
                    stato.durata, 
                    stato.ampiezza,
                    stato.frequenza,
                    stato.posizione
                ])

    def leggi_csv(self, filename: str) -> List[StatoMusicale]:
        stati = []
        with open(filename, 'r') as f:
            reader = csv.reader(f, delimiter=',')
            for row in reader:
                stato = StatoMusicale(
                    cAttacco=float(row[0]),
                    durataArmonica=float(row[1]),
                    ritmo=eval(row[2]),
                    durata=float(row[3]),
                    ampiezza=eval(row[4]),
                    frequenza=eval(row[5]),
                    posizione=eval(row[6])
                )
                stati.append(stato)
        return stati

    def genera_yaml(self, filename: str):
        comportamenti = []
        for stato in self.storia:
            comportamento = {
                'cAttacco': stato.cAttacco,
                'durataArmonica': stato.durataArmonica,
                'ritmo': stato.ritmo,
                'durata': stato.durata,
                'ampiezza': stato.ampiezza,
                'frequenza': stato.frequenza,
                'posizione': stato.posizione
            }
            comportamenti.append(comportamento)

        yaml_dict = {'comportamenti': comportamenti}
        with open(filename, 'w') as f:
            yaml.dump(yaml_dict, f, default_flow_style=False)

    def simula(self):
        tempo = 0
        prossima_perturbazione = (10, 0)  # (tempo, tipo)
        
        while tempo < self.durata_totale:
            # Evoluzione normale
            self.stato = self.evolvi_parametri(self.stato)
            
            if tempo >= prossima_perturbazione[0]:
                if prossima_perturbazione[1] == 0:
                    self.stato = self.perturbA(self.stato)
                else:
                    self.stato = self.perturbB(self.stato)
                    
                cambiamenti = self.calcola_cambiamenti_parametri(self.storia)
                prossima_perturbazione = self.determina_prossima_perturbazione(cambiamenti)
            
            self.storia.append(deepcopy(self.stato))
            tempo += self.dt

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
    
    compositore.simula()
    compositore.salva_csv('storia_stati.csv')
    compositore.genera_yaml('comportamenti.yaml')
    
    stati = compositore.leggi_csv('storia_stati.csv')
    print(f"Generati {len(stati)} stati")

if __name__ == "__main__":
    main()