#!/usr/bin/env python3
"""
Composition Weaver with Density and Spread
===========================================
Orchestra i comportamenti per creare una composizione complessa, controllando
la polifonia (densità) e l'ampiezza spettrale (spread) nel tempo.
"""
import pandas as pd
import numpy as np
import random
from pathlib import Path

# --- MAPPE DI CONTROLLO SEMANTICO ---
DENSITA_MAP = {
    'A': (1, 6),
    'B': (6, 13),
    'C': (13, 20),
    'D': (20, 36),
    'E': (36, 70),
}
SPREAD_MAP = {
    'A': 0.2,
    'B': 1.0,
    'C': 1.5,
    'D': 2.0,
    'E': 4.0,
    'F': 6.0
}

# --- CONFIGURAZIONE DELLA COMPOSIZIONE ---
COMPOSITION_NAME = "texture_evolutiva_01"
COMPOSIZIONE = [
    {
        "nome_sezione": "Introduzione Profonda e Sparsa",
        "durata": 70,
        "num_attivazioni": 8, # Controllava solo QUANTI cluster
        "timing_model": { "type": "accelerando", "shape": 2.5 }, # <-- 
        "stato_iniziale": {
            'ottava': 3, 'registro': 3, 'ampiezza_db': -30,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'convergente',
            'densita_eventi': 'D',
            'tipo_durata': 'brevi',
            'spread_spettrale': 'E',
            'cluster_factor': 1.0  # <-- AGGIUNTO: Inizia molto raggruppato
        },
        "stato_finale": {
            'ottava': 5, 'registro': 5, 'ampiezza_db': -15,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'periodico',
            'densita_eventi': 'A',
            'tipo_durata': 'lunghe',
            'spread_spettrale': 'A',
            'cluster_factor': 0.3  # <-- AGGIUNTO: Inizia molto raggruppato
        }
    },
    {
        "nome_sezione": "pino Profonda e Sparsa",
        "durata": 50,
        "num_attivazioni": 8, # Controllava solo QUANTI cluster
        "timing_model": { "type": "accelerando", "shape": 2.5 }, # <-- 
        "stato_iniziale": {
            'ottava': 3, 'registro': 3, 'ampiezza_db': -30,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'convergente',
            'densita_eventi': 'D',
            'tipo_durata': 'lunghe',
            'spread_spettrale': 'E',
            'cluster_factor': 1.0  # <-- AGGIUNTO: Inizia molto raggruppato
        },
        "stato_finale": {
            'ottava': 5, 'registro': 5, 'ampiezza_db': -15,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'periodico',
            'densita_eventi': 'A',
            'tipo_durata': 'lunghe',
            'spread_spettrale': 'A',
            'cluster_factor': 0.3  # <-- AGGIUNTO: Inizia molto raggruppato
        }
    },
    {
        "nome_sezione": "pluto",
        "durata": 50,
        "num_attivazioni": 30, # Controllava solo QUANTI cluster
        "timing_model": { "type": "stochastic_poisson", "rate": 0.5 },        "stato_iniziale": {
            'ottava': 3, 'registro': 3, 'ampiezza_db': -30,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'convergente',
            'densita_eventi': 'D',
            'tipo_durata': 'lunghe',
            'spread_spettrale': 'E',
            'cluster_factor': 0.4  # <-- AGGIUNTO: Inizia molto raggruppato
        },
        "stato_finale": {
            'ottava': 5, 'registro': 5, 'ampiezza_db': -15,
            'tipo_ritmi': 'grandi', 'nonlinear_mode_label': 'periodico',
            'densita_eventi': 'A',
            'tipo_durata': 'lunghe',
            'spread_spettrale': 'A',
            'cluster_factor': 0.3  # <-- AGGIUNTO: Inizia molto raggruppato
        }
    }

]



class TimeScheduler:
    """Una classe per generare sequenze temporali basate su diversi modelli."""
    def generate_onsets(self, model, duration, num_events):
        if model['type'] == 'linear':
            return np.linspace(0, duration, num_events)
        
        elif model['type'] == 'accelerando':
            # shape > 1.0 per accelerare
            shape = model.get('shape', 2.0)
            progress = np.linspace(0, 1, num_events) ** shape
            return progress * duration
            
        elif model['type'] == 'ritardando':
            # shape < 1.0 per rallentare
            shape = model.get('shape', 0.5)
            progress = 1 - (1 - np.linspace(0, 1, num_events)) ** shape
            return progress * duration

        elif model['type'] == 'stochastic_poisson':
            # Rate: numero medio di eventi al secondo
            rate = model.get('rate', num_events / duration)
            lam = duration / rate # Invertiamo per ottenere l'intervallo medio
            
            # Generiamo gli intervalli tra gli eventi
            intervals = np.random.poisson(lam, num_events)
            # Calcoliamo i tempi di attivazione con una somma cumulativa
            onsets = np.cumsum(intervals)
            # Normalizziamo per assicurarci che finisca esattamente alla durata
            if onsets[-1] > 0:
                onsets = (onsets / onsets[-1]) * duration
            return onsets
        
        else: # Default a lineare
            return np.linspace(0, duration, num_events)

# -------------------------------------------

class AdvancedComposer:
    def __init__(self, index_path='indice_comportamenti.csv'):
        self.base_path = Path(__file__).parent
        self.output_path = self.base_path / "composizioni"
        self.output_path.mkdir(exist_ok=True)
        self.time_scheduler = TimeScheduler() # Crea un'istanza del nostro 
        try:
            self.palette = pd.read_csv(index_path)
            print(f"Tavolozza caricata: {len(self.palette)} comportamenti disponibili.")
        except FileNotFoundError:
            print(f"ERRORE: File indice '{index_path}' non trovato.")
            exit(1)
        # ----- NUOVA LOGICA DI MAPPATURA TABELLE -----
        print("Creazione mappa delle tabelle di ritmi e posizioni...")
        self.rhythm_table_map = {}
        next_table_id = 1000 # Iniziamo a numerare le tabelle da 100

        # Trova tutti i pattern di ritmi unici nella tavolozza
        unique_rhythms = self.palette['ritmi'].unique()

        for rhythm_pattern_str in unique_rhythms:
            # Converte la stringa "[1, 2, 3]" in una tupla (1, 2, 3) per usarla come chiave
            rhythm_tuple = tuple(eval(rhythm_pattern_str))
            
            if rhythm_tuple not in self.rhythm_table_map:
                # Assegna un ID di tabella per i ritmi e uno per le posizioni
                self.rhythm_table_map[rhythm_tuple] = {
                    'ritmi_tab_num': next_table_id,
                    'pos_tab_num': next_table_id + 1
                }
                next_table_id += 2 # Incrementa di 2 per il prossimo set
        
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici a numeri di tabella.")

    def find_best_match(self, target_params):
        query = self.palette.copy()
        # Filtra per parametri testuali
        for key, value in target_params.items():
            if isinstance(value, str):
                query = query[query[key] == value]
        if query.empty: return None

        # Calcola distanza per parametri numerici
        distance = 0
        numeric_keys = ['ottava', 'registro', 'ampiezza_db']
        for key in numeric_keys:
            if key in target_params:
                target_value = target_params[key]
                range_ = self.palette[key].max() - self.palette[key].min()
                if range_ > 0:
                    # Calcola la distanza usando direttamente i nomi delle colonne
                    distance += ((query[key] - target_value) / range_)**2
        
        if not isinstance(distance, pd.Series) or distance.empty:
            return query.sample(n=1).iloc[0] if not query.empty else None
        
        # Restituisce la riga del DataFrame originale (non più .loc) con la distanza minore
        return query.loc[distance.idxmin()]

    def generate_event_cluster(self, center_params, num_events, spread_radius):
        cluster_events = []
        for _ in range(num_events):
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
        """Elabora l'intera struttura della composizione, sezione per sezione."""
        full_sequence = []
        current_time = 0.0
        last_event_time = 0.0 # Per evitare che gli eventi vadano indietro nel tempo

        for section in composition_structure:
            print(f"\nElaborazione sezione: '{section['nome_sezione']}' (Durata: {section['durata']}s)")
            
            # Calcoliamo l'intervallo di tempo medio tra i "punti di attivazione"
            # Questo ci serve per definire la finestra temporale
            num_clusters = int(section['durata'] / 5)
            if num_clusters < 2: num_clusters = 2
            time_interval_to_next_cluster = section['durata'] / num_clusters

            start_state = section['stato_iniziale']
            end_state = section['stato_finale']

            for i in range(num_clusters):
                progress = i / (num_clusters - 1)
                # Questo è il "centro" del nostro bersaglio temporale
                event_time_center = current_time + (progress * section['durata'])
                
                # --- Interpola tutti i parametri per questo istante ---
                center_params = {}
                for key in start_state:
                    if isinstance(start_state[key], (int, float)):
                        # Interpola i parametri numerici (ottava, ampiezza, cluster_factor)
                        center_params[key] = start_state[key] + (end_state[key] - start_state[key]) * progress
                    else:
                        # Scegli i parametri testuali (tipo_ritmi, densita, etc.)
                        center_params[key] = end_state[key] if progress > 0.5 else start_state[key]
                
                # --- Traduci i parametri di controllo in azioni concrete ---
                # 1. Densità
                densita_range = DENSITA_MAP[center_params['densita_eventi']]
                num_events_in_cluster = random.randint(densita_range[0], densita_range[1])
                
                # 2. Spread Spettrale
                spread_radius = SPREAD_MAP[center_params['spread_spettrale']]
                
                # 3. Cluster Factor (la nuova logica)
                current_cf = center_params['cluster_factor']
                std_dev = 0.1 + (1.0 - current_cf) * (time_interval_to_next_cluster / 5)
                max_window = time_interval_to_next_cluster * (1.1 - current_cf)
                
                # --- Genera il cluster di eventi ---
                cluster = self.generate_event_cluster(center_params, num_events_in_cluster, spread_radius)
                
                # --- Schedula gli eventi con la nuova logica temporale ---
                for behavior in cluster:
                    # Estrai un offset da una distribuzione normale
                    onset_offset = np.random.normal(loc=0.0, scale=std_dev)
                    # Limita l'offset
                    onset_offset = max(-max_window/2, min(max_window/2, onset_offset))
                    
                    final_onset = event_time_center + onset_offset
                    
                    # Controllo di sicurezza: l'onset non può essere prima dell'ultimo evento schedulato
                    if final_onset < last_event_time:
                        final_onset = last_event_time + random.uniform(0.01, 0.05) # Lo sposta leggermente dopo
                    
                    full_sequence.append({'time': final_onset, 'behavior': behavior})
                    last_event_time = final_onset # Aggiorna l'ultimo tempo

            current_time += section['durata']
        
        return full_sequence



    def generate_csd(self, composition_name, events):
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        
        # ----- LOGICA DI GENERAZIONE TABELLE OTTIMIZZATA -----
        ftgen_tables = ""
        # Itera sulla mappa che abbiamo creato, non più sui comportamenti
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            ritmi = list(rhythm_tuple)
            ritmi_str = ', '.join(map(str, ritmi))
            
            # Le posizioni le generiamo sempre al volo (qui usiamo 'progressivo')
            posizioni = [i % r for i, r in enumerate(ritmi) if r > 0]
            posizioni_str = ', '.join(map(str, posizioni))

            # Usa i numeri di tabella dalla mappa
            ritmi_tab_num = table_ids['ritmi_tab_num']
            pos_tab_num = table_ids['pos_tab_num']
            
            ftgen_tables += f"gi_RitmiTab_{ritmi_tab_num} ftgen 0, 0, {len(ritmi)+1}, -2, {ritmi_str}\n"
            ftgen_tables += f"gi_PosTab_{pos_tab_num} ftgen 0, 0, {len(posizioni)+1}, -2, {posizioni_str}\n"

        # ----- MODIFICA NELLA GENERAZIONE DELLO SCORE -----
        score_lines = ""
        last_event_time = 0
        for event in events:
            b = event['behavior']
            
            # Converte la stringa dei ritmi del comportamento in una tupla
            current_rhythm_tuple = tuple(eval(b['ritmi']))
            
            # Cerca i numeri di tabella corretti nella nostra mappa
            table_ids = self.rhythm_table_map[current_rhythm_tuple]
            ritmi_tab_num = int(table_ids['ritmi_tab_num'])
            pos_tab_num = int(table_ids['pos_tab_num'])
            
            mode = {'convergente': 0, 'periodico': 1, 'caotico': 2, 'caos_vero': 3}[b['nonlinear_mode_label']]
            
            # La linea di score ora usa i numeri di tabella mappati e ottimizzati
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
        # Template CSD con le tue modifiche richieste
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
;e {durata_totale}
</CsScore>
</CsoundSynthesizer>
"""

if __name__ == "__main__":
    composer = AdvancedComposer()
    event_sequence = composer.process_composition(COMPOSIZIONE)
    if event_sequence:
        composer.generate_csd(COMPOSITION_NAME, event_sequence)
    else:
        print("Nessun evento generato. Controlla la configurazione della composizione.")