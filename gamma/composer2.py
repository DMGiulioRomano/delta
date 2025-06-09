#!/usr/bin/env python3
"""
Composition Weaver with Algorithmic Timing (v5)
================================================
Genera una composizione posizionando un numero totale di eventi nel tempo
secondo un modello algoritmico (lineare, curvo, stocastico).
"""
import pandas as pd
import numpy as np
import random
from pathlib import Path

# (Le mappe SPREAD_MAP rimangono, ma DENSITA_MAP non serve più)
SPREAD_MAP = {
    'A': 0.2, 'B': 1.0, 'C': 1.5, 'D': 2.0, 'E': 4.0, 'F': 6.0
}

class TimeScheduler:
    """Genera una sequenza di tempi di attivazione."""
    def generate_onsets(self, model, duration, num_events):
        if num_events == 0: return []
        if num_events == 1: return [duration / 2] # Un evento solo, al centro
        
        # Genera una progressione di base da 0 a 1
        base_progress = np.linspace(0, 1, num_events)

        if model['type'] == 'accelerando':
            shape = model.get('shape', 2.0)
            final_progress = base_progress ** shape
        elif model['type'] == 'ritardando':
            shape = model.get('shape', 0.5)
            final_progress = 1 - (1 - base_progress) ** shape
        elif model['type'] == 'stochastic':
            # Genera N punti casuali e poi li ordina. Molto efficace.
            final_progress = np.sort(np.random.rand(num_events))
        else: # 'linear' è il default
            final_progress = base_progress
            
        return final_progress * duration

# --- CONFIGURAZIONE DELLA COMPOSIZIONE ---
# La configurazione è ora molto più pulita!
COMPOSITION_NAME = "flusso_controllato_01"
COMPOSIZIONE = [
    {
        "nome_sezione": "Nuvola che si addensa",
        "durata": 90,
        "numero_totale_eventi": 150, # <-- L'UNICO CONTROLLO SULLA QUANTITÀ
        "timing_model": { "type": "accelerando", "shape": 2.0 },
        "stato_iniziale": {
            'ottava': 2, 'registro': 3, 'ampiezza_db': -25,
            'tipo_ritmi': 'grandi', 'spread_spettrale': 'B'
        },
        "stato_finale": {
            'ottava': 5, 'registro': 6, 'ampiezza_db': -15,
            'tipo_ritmi': 'medi', 'spread_spettrale': 'D'
        }
    },
    {
        "nome_sezione": "Pioggia Stocastica",
        "durata": 60,
        "numero_totale_eventi": 300, # Molto denso
        "timing_model": { "type": "stochastic" },
        "stato_iniziale": {
            'ottava': 7, 'registro': 8, 'ampiezza_db': -12,
            'tipo_ritmi': 'piccoli', 'spread_spettrale': 'F'
        },
        "stato_finale": {
            'ottava': 6, 'registro': 5, 'ampiezza_db': -20,
            'tipo_ritmi': 'piccoli', 'spread_spettrale': 'C'
        }
    }
]
# Aggiungi parametri di default mancanti
default_state = {
    'nonlinear_mode_label': 'caotico', 'tipo_durata': 'medie'
}
for section in COMPOSIZIONE:
    for state_key in ['stato_iniziale', 'stato_finale']:
        for def_key, def_val in default_state.items():
            if def_key not in section[state_key]:
                section[state_key][def_key] = def_val

class AlgorithmicComposer:
    def __init__(self, index_path='indice_comportamenti.csv'):
        self.base_path = Path(__file__).parent
        self.output_path = self.base_path / "composizioni"
        self.output_path.mkdir(exist_ok=True)
        self.time_scheduler = TimeScheduler()
        try:
            self.palette = pd.read_csv(index_path)
            print(f"Tavolozza caricata: {len(self.palette)} comportamenti disponibili.")
        except FileNotFoundError:
            print(f"ERRORE: File indice '{index_path}' non trovato.")
            exit(1)
        
        print("Creazione mappa delle tabelle di ritmi...")
        self.rhythm_table_map = {}
        next_table_id = 1000
        for rhythm_tuple in self.palette['ritmi'].apply(eval).unique():
            if rhythm_tuple not in self.rhythm_table_map:
                self.rhythm_table_map[rhythm_tuple] = {
                    'ritmi_tab_num': next_table_id, 'pos_tab_num': next_table_id + 1
                }
                next_table_id += 2
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici.")

    def find_best_match(self, target_params):
        query = self.palette.copy()
        for key, value in target_params.items():
            if isinstance(value, str):
                query = query[query[key] == value]
        if query.empty: return None

        distance = 0
        numeric_keys = ['ottava', 'registro', 'ampiezza_db']
        for key in numeric_keys:
            if key in target_params:
                target_value = target_params[key]
                range_ = self.palette[key].max() - self.palette[key].min()
                if range_ > 0:
                    distance += ((query[key] - target_value) / range_)**2
        
        return query.loc[distance.idxmin()] if isinstance(distance, pd.Series) and not distance.empty else (query.sample(n=1).iloc[0] if not query.empty else None)

    def process_composition(self, composition_structure):
        full_sequence = []
        current_time = 0.0

        for section in composition_structure:
            print(f"\nElaborazione sezione: '{section['nome_sezione']}'")
            
            num_events = section.get("numero_totale_eventi", 50)
            timing_model = section.get("timing_model", {"type": "linear"})
            print(f"  -> Modello: {timing_model['type']}, Eventi totali: {num_events}")

            # 1. Genera tutti i tempi di attivazione per la sezione
            event_onsets = self.time_scheduler.generate_onsets(
                timing_model, section['durata'], num_events
            )

            start_state = section['stato_iniziale']
            end_state = section['stato_finale']

            # 2. Per ogni tempo di attivazione, calcola i parametri e trova un comportamento
            for onset in event_onsets:
                progress = onset / section['durata'] if section['durata'] > 0 else 0
                
                # Interpola i parametri per questo singolo evento
                target_params = {}
                for key in start_state:
                    if isinstance(start_state[key], (int, float)):
                        target_params[key] = start_state[key] + (end_state[key] - start_state[key]) * progress
                    else: # Parametri testuali
                        target_params[key] = end_state[key] if progress > 0.5 else start_state[key]
                
                # Lo spread ora definisce la varianza attorno ai parametri interpolati
                spread_radius = SPREAD_MAP[target_params['spread_spettrale']]
                target_params['ottava'] += random.uniform(-spread_radius, spread_radius)
                target_params['registro'] += random.uniform(-spread_radius, spread_radius)

                # Trova il miglior match per questo evento
                best_match = self.find_best_match(target_params)
                
                if best_match is not None:
                    final_onset = current_time + onset
                    full_sequence.append({'time': final_onset, 'behavior': best_match})

            current_time += section['durata']
        
        # Ordina gli eventi per tempo, per sicurezza
        full_sequence.sort(key=lambda e: e['time'])
        return full_sequence

    def generate_csd(self, composition_name, events):
        # (Questa funzione rimane quasi identica, la logica di assemblaggio è la stessa)
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        ftgen_tables = ""
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            ritmi_str = ', '.join(map(str, rhythm_tuple))
            posizioni = [i % r for i, r in enumerate(ritmi_str.split(',')) if int(r) > 0]
            posizioni_str = ', '.join(map(str, posizioni))
            ftgen_tables += f"gi_RitmiTab_{table_ids['ritmi_tab_num']} ftgen 0, 0, {len(rhythm_tuple)+1}, -2, {ritmi_str}\n"
            ftgen_tables += f"gi_PosTab_{table_ids['pos_tab_num']} ftgen 0, 0, {len(posizioni)+1}, -2, {posizioni_str}\n"

        score_lines = ""
        last_event_time = 0
        for event in events:
            b = event['behavior']
            current_rhythm_tuple = tuple(eval(b['ritmi']))
            table_ids = self.rhythm_table_map.get(current_rhythm_tuple)
            if not table_ids: continue # Sicurezza
            
            ritmi_tab_num = int(table_ids['ritmi_tab_num'])
            pos_tab_num = int(table_ids['pos_tab_num'])
            mode = {'convergente': 0, 'periodico': 1, 'caotico': 2, 'caos_vero': 3}[b['nonlinear_mode_label']]
            score_lines += (f'i "AvviaComportamento" {event["time"]:.4f} {b["durata_totale"]:.3f} '
                            f'{ritmi_tab_num} {b["durata_armonica"]:.3f} {b["ampiezza_db"]:.2f} '
                            f'{b["ottava"]} {b["registro"]} {pos_tab_num} {b["id_comp"]} {mode}\n')
            last_event_time = max(last_event_time, event["time"] + b["durata_totale"])

        template = self.get_csd_template()
        csd_content = template.format(
            composition_name=composition_name,
            ftgen_tables=ftgen_tables,
            score_lines=score_lines,
            durata_totale=last_event_time + 60
        )
        file_path = self.output_path / f"{composition_name}.csd"
        with open(file_path, 'w') as f: f.write(csd_content)
        print(f"\n✓ Composizione creata: {file_path}")
        print(f"  Per renderizzare: csound {file_path}")

    def get_csd_template(self):
        # (Il template CSD non cambia)
        return """
<CsoundSynthesizer>
<CsOptions>
-o "{composition_name}.wav" -W
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
#define SQRT2 #1.4142135623730951#
#define MAX_AMP #0.999#
#define FONDAMENTALE #32#
#define OTTAVE #10#
#define INTERVALLI #200#
#define REGISTRI #10#
#define M_PI #3.141592653589793#
gSdirSco = "sco/"
gi_Index init 1
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0
{ftgen_tables}
#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/eventoSonoro.orc"
#include "../includes/comportamento.orc"
#include "../includes/avvia_comportamento.orc"
instr Init
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    turnoff
endin
</CsInstruments>
<CsScore>
f1 0 4096 10 1
f2 0 [2^10] 6 0 [2^9] .5 [2^9] 1
i "Init" 0 0.1
{score_lines}
e {durata_totale}
</CsScore>
</CsoundSynthesizer>
"""

if __name__ == "__main__":
    composer = AlgorithmicComposer()
    event_sequence = composer.process_composition(COMPOSIZIONE)
    if event_sequence:
        composer.generate_csd(COMPOSITION_NAME, event_sequence)
    else:
        print("Nessun evento generato. Controlla la configurazione della composizione.")