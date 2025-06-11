#!/usr/bin/env python3
"""
Composition Weaver with Hybrid Timing Control (v6.1)
====================================================
Combina un motore ritmico macroscopico (quando) con un controllo
sulla polifonia istantanea (quanti).
"""
import pandas as pd
import numpy as np
import random
from pathlib import Path
import matplotlib.pyplot as plt
import seaborn as sns


"""
        self.parametri = {
            'ritmi_patterns': {
                'piccoli': [[1, 2, 3], [2, 3, 5], [3, 4, 2]],
                'medi': [[6, 8, 10], [7, 9, 12], [8, 12, 8]],
                'grandi': [[16, 20, 24], [18, 25, 30], [20, 28, 20]],
                'misti': [[2, 10, 4, 15], [3, 20, 5, 8]]
            },
            'durate_armoniche': {
                'brevi': [5, 10],
                'medie': [20, 30],
                'lunghe': [40, 60]
            },
            'moltiplicatori_durata': [1, 1.25, 1.6],
            'ottave': list(range(OTTAVE_RANGE[0], OTTAVE_RANGE[1] + 1)),
            'registri': list(range(REGISTRI_RANGE[0], REGISTRI_RANGE[1] + 1)),
            'ampiezze': {
                'pp': [-40, -38],
                'p': [-34, -32],
                'mp': [-38, -26],
                'mf': [-22, -20],
                'f': [-16, -14],
                'ff': [-10, -8],
            },
            'nonlinear_modes': {
                'convergente': 0, 'periodico': 1, 'caotico': 2, 'caos_vero': 3
            },
            'posizioni_patterns': {
                'inizio': lambda ritmi: [0] * len(ritmi),
                'centro': lambda ritmi: [int(r / 2) for r in ritmi],
                'progressivo': lambda ritmi: [i % r for i, r in enumerate(ritmi)]
            }
        }
"""
# --- MAPPE DI CONTROLLO SEMANTICO ---
POLIFONIA_MAP = {
    'solista': (1, 1), 'duetto': (2, 2), 'trio': (3, 4),
    'ensemble': (3, 15), 'orchestra': (15, 60)
}
SPREAD_MAP = {
    'A': 0.2, 'B': 1.0, 'C': 1.5, 'D': 2.0, 'E': 4.0, 'F': 6.0
}

# --- CONFIGURAZIONE DELLA COMPOSIZIONE ---
# Ogni stato ora deve essere un dizionario completo.
COMPOSITION_NAME = "composizione_ibrida_corretta_01"
COMPOSIZIONE = [
    {
        "nome_sezione": "Accelerando di Accordi",
        "durata": 60,
        "num_attivazioni": 15,
        "timing_model": { "type": "accelerando", "shape": 2.5 },
        "stato_iniziale": {
            'ottava': 2, 'registro': 3, 'ampiezza_db': -22,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'periodico',
            'tipo_durata': 'lunghe',
            'densita_polifonica': 'trio',
            'spread_spettrale': 'A'
        },
        "stato_finale": {
            'ottava': 5, 'registro': 6, 'ampiezza_db': -15,
            'tipo_ritmi': 'misti', 'nonlinear_mode_label': 'caotico',
            'tipo_durata': 'medie',
            'densita_polifonica': 'orchestra',
            'spread_spettrale': 'E'
        }
    }
#    {
#        "nome_sezione": "Pioggia Stocastica di Note Singole",
#        "durata": 40,
#        "num_attivazioni": 100,
#        "timing_model": { "type": "stochastic" },
#        "stato_iniziale": {
#            'ottava': 7, 'registro': 8, 'ampiezza_db': -18,
#            'tipo_ritmi': 'piccoli', 'nonlinear_mode_label': 'caos_vero',
#            'tipo_durata': 'brevi',
#            'densita_polifonica': 'solista',
#            'spread_spettrale': 'C'
#        },
#        "stato_finale": {
#            'ottava': 6, 'registro': 5, 'ampiezza_db': -25,
#            'tipo_ritmi': 'piccoli', 'nonlinear_mode_label': 'convergente',
#            'tipo_durata': 'brevi',
#            'densita_polifonica': 'solista',
#            'spread_spettrale': 'C'
#        }
#    }
]

class TimeScheduler:
    # ... (La classe TimeScheduler non cambia) ...
    def generate_onsets(self, model, duration, num_events):
        if num_events == 0: return []
        if num_events == 1: return [duration / 2]
        base_progress = np.linspace(0, 1, num_events)
        if model['type'] == 'accelerando':
            final_progress = base_progress ** model.get('shape', 2.0)
        elif model['type'] == 'ritardando':
            final_progress = 1 - (1 - base_progress) ** model.get('shape', 0.5)
        elif model['type'] == 'stochastic':
            final_progress = np.sort(np.random.rand(num_events))
        else:
            final_progress = base_progress
        return final_progress * duration

class FinalComposer:
    def __init__(self, index_path='indice_comportamenti.csv'):
        # (Il costruttore non cambia)
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

        # --- MODIFICA CHIAVE QUI ---
        # 1. Applichiamo eval per ottenere le liste
        # 2. Convertiamo ogni lista in una tupla
        # 3. Applichiamo .unique() alle tuple (che sono hashable)
        rhythm_lists = self.palette['ritmi'].apply(eval)
        unique_rhythm_tuples = rhythm_lists.apply(tuple).unique()
        
        for rhythm_tuple in unique_rhythm_tuples:
            if rhythm_tuple not in self.rhythm_table_map:
                self.rhythm_table_map[rhythm_tuple] = {
                    'ritmi_tab_num': next_table_id, 'pos_tab_num': next_table_id + 1
                }
                next_table_id += 2
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici.")

    def find_best_match(self, target_params):
        # (Questa funzione non cambia)
        query = self.palette.copy()
        for key, value in target_params.items():
            if isinstance(value, str):
                if key in query.columns:
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
    
    def generate_event_cluster(self, center_params, num_events_in_cluster, spread_radius):
        # (Questa funzione non cambia)
        cluster_events = []
        for _ in range(num_events_in_cluster):
            search_params = {
                'tipo_ritmi': center_params['tipo_ritmi'],
                'nonlinear_mode_label': center_params['nonlinear_mode_label'],
                'tipo_durata': center_params['tipo_durata'],
            }
            ottava_offset = random.uniform(-spread_radius, spread_radius)
            search_params['ottava'] = max(0, min(10, int(center_params['ottava'] + ottava_offset)))
            registro_offset = random.uniform(-spread_radius, spread_radius)
            search_params['registro'] = max(1, min(10, int(center_params['registro'] + registro_offset)))
            search_params['ampiezza_db'] = center_params['ampiezza_db']
            best_match = self.find_best_match(search_params)
            if best_match is not None:
                cluster_events.append(best_match)
        return cluster_events

    def process_composition(self, composition_structure):
        # (Questa funzione non cambia)
        full_sequence = []
        current_time = 0.0
        last_event_time = 0.0

        for section in composition_structure:
            print(f"\nElaborazione sezione: '{section['nome_sezione']}'")
            
            num_attivazioni = section.get("num_attivazioni", 10)
            timing_model = section.get("timing_model", {"type": "linear"})
            print(f"  -> Modello: {timing_model['type']}, Punti di attivazione: {num_attivazioni}")

            cluster_onsets = self.time_scheduler.generate_onsets(
                timing_model, section['durata'], num_attivazioni
            )

            start_state = section['stato_iniziale']
            end_state = section['stato_finale']

            for onset_time in cluster_onsets:
                progress = onset_time / section['durata'] if section['durata'] > 0 else 0
                event_time_center = current_time + onset_time
                
                center_params = {}
                for key in start_state:
                    if isinstance(start_state[key], (int, float)):
                        center_params[key] = start_state[key] + (end_state[key] - start_state[key]) * progress
                    else:
                        center_params[key] = end_state[key] if progress > 0.5 else start_state[key]
                
                polifonia_range = POLIFONIA_MAP[center_params['densita_polifonica']]
                num_events_in_cluster = random.randint(polifonia_range[0], polifonia_range[1])
                spread_radius = SPREAD_MAP[center_params['spread_spettrale']]
                
                cluster = self.generate_event_cluster(
                    center_params, num_events_in_cluster, spread_radius
                )
                
                for behavior in cluster:
                    jitter = np.random.normal(loc=0.0, scale=0.05)
                    final_onset = max(last_event_time, event_time_center + jitter)
                    full_sequence.append({'time': final_onset, 'behavior': behavior})
                    last_event_time = final_onset

            current_time += section['durata']
        
        full_sequence.sort(key=lambda e: e['time'])
        return full_sequence

    def generate_csd(self, composition_name, events):
        # (Questa funzione non cambia)
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        ftgen_tables = ""
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            ritmi_str = ', '.join(map(str, rhythm_tuple))
            posizioni = [i % r for i, r_str in enumerate(ritmi_str.split(',')) if (r := int(r_str.strip())) > 0]
            posizioni_str = ', '.join(map(str, posizioni))
            ftgen_tables += f"gi_RitmiTab_{table_ids['ritmi_tab_num']} ftgen 0, 0, {len(rhythm_tuple)+1}, -2, {ritmi_str}\n"
            ftgen_tables += f"gi_PosTab_{table_ids['pos_tab_num']} ftgen 0, 0, {len(posizioni)+1}, -2, {posizioni_str}\n"

        score_lines = ""
        last_event_time = 0
        for event in events:
            b = event['behavior']
            current_rhythm_tuple = tuple(eval(b['ritmi']))
            table_ids = self.rhythm_table_map.get(current_rhythm_tuple)
            if not table_ids: continue
            
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
        # (Il template non cambia)
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

class CompositionDebugger:
    def __init__(self, composition_name):
        self.output_path = Path("composizioni")
        self.composition_name = composition_name

    def plot_piano_roll(self, events):
        print("\n--- Avvio Debugging Visivo: Generazione Grafico Piano Roll ---")
        if not events:
            print("Nessun evento da visualizzare.")
            return

        plot_data = []
        max_time = 0
        for event in events:
            start = event['time']
            duration = event['behavior']['durata_totale']
            end = start + duration
            # Usiamo l'ottava come "pitch" per la visualizzazione
            pitch = event['behavior']['ottava']
            # Normalizziamo l'ampiezza per usarla come colore
            amp_norm = (event['behavior']['ampiezza_db'] + 60) / 60 

            plot_data.append({'start': start, 'end': end, 'pitch': pitch, 'amp': amp_norm})
            if end > max_time:
                max_time = end
        
        df = pd.DataFrame(plot_data)

        plt.style.use('seaborn-v0_8-darkgrid')
        fig, ax = plt.subplots(figsize=(20, 10))
        
        # Disegniamo ogni evento come una barra orizzontale
        for i, row in df.iterrows():
            ax.add_patch(
                plt.Rectangle(
                    (row['start'], row['pitch'] - 0.4), # Posizione
                    row['end'] - row['start'], # Larghezza (durata)
                    0.8, # Altezza
                    color=plt.cm.viridis(row['amp']),
                    alpha=0.7
                )
            )

        ax.set_xlim(0, max_time)
        ax.set_ylim(-1, 11)
        ax.set_xlabel("Tempo (secondi)")
        ax.set_ylabel("Ottava")
        ax.set_title(f"Visualizzazione Composizione: '{self.composition_name}'")
        ax.set_yticks(range(0, 11))
        
        # Aggiungiamo linee verticali per marcare le sezioni
        current_time = 0
        for section in COMPOSIZIONE:
            current_time += section['durata']
            ax.axvline(x=current_time, color='r', linestyle='--', linewidth=1.5, label=f"Fine Sez: {section['nome_sezione']}")
        
        # Rimuovi etichette duplicate nella legenda
        handles, labels = ax.get_legend_handles_labels()
        by_label = dict(zip(labels, handles))
        ax.legend(by_label.values(), by_label.keys())
        
        plot_filename = self.output_path / f"{self.composition_name}_pianoroll.png"
        plt.savefig(plot_filename, dpi=150)
        plt.close()
        
        print(f"✓ Grafico salvato in: {plot_filename}")
        print(f"Durata totale stimata (con code): {max_time:.2f} secondi")

if __name__ == "__main__":
    composer = FinalComposer()
    debugger = CompositionDebugger(COMPOSITION_NAME)
    
    # 1. Genera la sequenza di eventi
    event_sequence = composer.process_composition(COMPOSIZIONE)
    
    if event_sequence:
        # 2. **NUOVO**: Visualizza la sequenza prima di generare il CSD
        debugger.plot_piano_roll(event_sequence)
        
        # 3. Genera il file CSD
        composer.generate_csd(COMPOSITION_NAME, event_sequence)
    else:
        print("Nessun evento generato. Controlla la configurazione della composizione.")