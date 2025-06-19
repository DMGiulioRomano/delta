#!/usr/bin/env python3
"""
Generative Composer with Tendency Masks (v1.0)
===============================================
Generatore di composizioni algoritmiche basato su maschere di tendenza.
Questo script è autonomo e non richiede file CSV o database di suoni pre-calcolati.

La composizione è definita da una serie di sezioni, ognuna con uno stato
iniziale e finale. Questi stati non sono valori fissi, ma "maschere" che
definiscono range, distribuzioni e pesi per la generazione stocastica
dei parametri di ogni evento sonoro.

Concetti chiave:
- Maschere di Tendenza: Controllano il comportamento del generatore.
- Generazione Dinamica: I parametri vengono creati al volo, non cercati.
- Validazione Istantanea: Ogni set di parametri generato viene validato
  per garantire che sia tecnicamente eseguibile da Csound.
- Controllo Continuo: I parametri evolvono fluidamente tra lo stato
  iniziale e finale di una sezione.
"""

import numpy as np
import random
import sys
from pathlib import Path
import matplotlib.pyplot as plt
import seaborn as sns
import yaml
import subprocess 
# =============================================================================
# DEFINIZIONE DELLA COMPOSIZIONE (IL CUORE DEL SISTEMA)
# =============================================================================
# NOTA: In futuro, questo dizionario potrebbe essere caricato da un file esterno
#       (es. YAML) per separare la "partitura" dal "motore".

COMPOSITION_NAME = "composizione_generativa_03"

# Ogni maschera definisce come generare un parametro:
# - 'range': [min, max] per una distribuzione uniforme.
# - 'distribution': 'uniform' (default) o 'normal'.
# - 'mean', 'std': Per la distribuzione normale.
# - 'choices', 'weights': Per una scelta pesata da una lista.

OTTAVE_RANGE = (0, 10)
REGISTRI_RANGE = (1, 50)
INTERVALLI_PER_OTTAVA = 200 

def load_yaml_file(file_path):
    """
    Carica un file YAML generico e gestisce gli errori comuni.
    """
    print(f"Caricamento file di configurazione: {file_path}")
    try:
        with open(file_path, 'r') as f:
            data = yaml.safe_load(f)
        if not isinstance(data, dict):
            print(f"ERRORE: Il file YAML '{file_path}' deve contenere un dizionario (mappatura).")
            sys.exit(1)
        print(f"✓ File '{Path(file_path).name}' caricato con successo.")
        return data
    except FileNotFoundError:
        print(f"ERRORE CRITICO: File di configurazione non trovato: '{file_path}'")
        sys.exit(1)
    except yaml.YAMLError as e:
        print(f"ERRORE CRITICO: Errore nella sintassi del file YAML '{file_path}': {e}")
        sys.exit(1)

def load_composition_from_yaml(file_path):
    """
    Carica e valida una struttura di composizione da un file YAML.
    """
    print(f"Caricamento partitura dal file: {file_path}")
    try:
        with open(file_path, 'r') as f:
            composition = yaml.safe_load(f)
        if not isinstance(composition, list):
            print("ERRORE: Il file YAML deve contenere una lista di sezioni.")
            sys.exit(1)
        print("✓ Partitura caricata con successo.")
        return composition
    except FileNotFoundError:
        print(f"ERRORE CRITICO: File della partitura non trovato: '{file_path}'")
        sys.exit(1)
    except yaml.YAMLError as e:
        print(f"ERRORE CRITICO: Errore nella sintassi del file YAML: {e}")
        sys.exit(1)        

class TimeScheduler:
    """Genera sequenze temporali (onsets) basate su diversi modelli."""
    def generate_onsets(self, model, duration, num_events):
        if num_events == 0: return []
        if num_events == 1: return [0.0]

        base_progress = np.linspace(0, 1, num_events, endpoint=False) # Endpoint False per evitare un evento a durata esatta
        final_progress = np.zeros_like(base_progress)
        model_type = model.get('type', 'linear')

        if model_type == 'ritardando':
            shape = model.get('shape', 2.0)
            final_progress = base_progress ** shape
        elif model_type == 'accelerando':
            shape = model.get('shape', 2.0) # La forma > 1.0 rallenta se invertita
            final_progress = 1 - (1 - base_progress) ** shape
        elif model_type == 'breakpoint':
            points = model['points']
            
            # Itera su ogni segmento della spezzata (da punto i a punto i+1)
            for i in range(len(points) - 1):
                start_point = points[i]
                end_point = points[i+1]
                # Estrai i dati del segmento
                t_start, v_start = start_point[0], start_point[1]
                t_end, v_end = end_point[0], end_point[1]
                # La forma è definita dal punto di arrivo. Default a lineare (1.0).
                shape = end_point[2] if len(end_point) > 2 else 1.0
                # Trova quali eventi cadono in questo intervallo di tempo
                segment_mask = (base_progress >= t_start) & (base_progress < t_end)
                if not np.any(segment_mask):
                    continue
                
                # Seleziona solo i punti di tempo in questo segmento
                segment_times = base_progress[segment_mask]

                # --- CUORE DELLA LOGICA ---
                # 1. Normalizza il tempo all'interno del segmento (da 0 a 1)
                time_in_segment = (segment_times - t_start) / (t_end - t_start)
                # 2. Applica la funzione di shaping (curva)
                shaped_time = time_in_segment ** shape
                # 3. Interpola linearmente tra i VALORI usando il tempo curvato
                interpolated_values = v_start + (v_end - v_start) * shaped_time                
                # Assegna i valori calcolati all'array finale
                final_progress[segment_mask] = interpolated_values            
            # Gestisci l'ultimo punto esatto, se presente
            if base_progress[-1] == 1.0:
                final_progress[-1] = points[-1][1]

        elif model_type == 'stochastic':
            final_progress = np.sort(np.random.rand(num_events))
        else: # Default a lineare
            final_progress = base_progress
            
        return final_progress * duration

class GenerativeComposer:
    """Classe principale che orchestra la generazione della composizione."""

    def __init__(self, output_dir="composizioni_generate", tables_config_path="yaml/tables.yaml"):
        self.base_path = Path(__file__).parent
        self.output_path = self.base_path / output_dir
        self.output_path.mkdir(exist_ok=True)
        self.wav_output_path = self.output_path / "wav"
        self.wav_output_path.mkdir(exist_ok=True)
        
        self.time_scheduler = TimeScheduler()
        
        # Mappa per le tabelle di Csound. Verrà popolata dinamicamente.
        self.rhythm_table_map = {}
        self.next_table_id = 1000

        # --- CARICAMENTO DELLE CONFIGURAZIONI DELLE TABELLE DAL FILE YAML ---
        full_tables_path = self.base_path / tables_config_path
        tables_config = load_yaml_file(full_tables_path)
        
        # 1. Salva l'intera struttura di configurazione in attributi dedicati.
        # Questi attributi verranno usati da `generate_csd`.
        self.event_envelopes_config = tables_config.get('event_envelopes', {})
        self.section_envelopes_config = tables_config.get('section_envelopes', {})

        # Controlla che le configurazioni siano state caricate correttamente
        if not self.event_envelopes_config or not self.section_envelopes_config:
            print(f"ATTENZIONE: 'event_envelopes' o 'section_envelopes' sono mancanti o vuoti in '{tables_config_path}'.")
            print("Questo potrebbe causare errori se vengono referenziati nella partitura.")

        # 2. Ora, da queste configurazioni complete, crea le mappe semplici nome->numero.
        # Queste mappe più semplici verranno usate internamente per la logica esistente.
        self.envelope_map = {name: config['number'] for name, config in self.event_envelopes_config.items() if 'number' in config}
        self.section_envelope_map = {name: config['number'] for name, config in self.section_envelopes_config.items() if 'number' in config}

        # 3. Imposta i valori di default
        self.default_envelope = 'lineare'
        self.default_section_envelope = 'continua'

        # Mappa per tradurre la dinamica in un indice per Csound
        self.dynamic_to_index = {
            'ppp': 0, 'pp': 1, 'p': 2, 'mf': 3, 'f': 4, 'ff': 5, 'fff': 6
        }
        self.id_comp_counter = 0
        
    def _valida_parametri(self, params):
        """
        Valida un set di parametri generati per assicurarsi che siano
        tecnicamente validi per il motore Csound.
        """
        # 2. Validazione Durata
        min_ritmo = min(r for r in params['ritmi'] if r > 0)
        if not min_ritmo: return False
        min_event_dur = params['durata_armonica'] / min_ritmo
        if params['durata_totale'] <= min_event_dur:
            return False
            
        return True

    def _normalize_mask(self, mask):
        """
        Converte i valori non-dizionario in una maschera nel formato {value: ...}.
        Esempio: 'dinamica: "p"' diventa 'dinamica: {"value": "p"}'.
        """
        if not mask:
            return {}
        normalized = {}
        for key, value in mask.items():
            if not isinstance(value, dict):
                normalized[key] = {'value': value}
            else:
                normalized[key] = value
        return normalized
    
    def _generate_rhythm_pattern(self, tipo_ritmi):
        """Genera una lista di ritmi basata su una categoria."""
        if tipo_ritmi == 'piccoli':
            return random.choice([[1, 2, 3], [2, 3, 5], [3, 4, 2]])
        elif tipo_ritmi == 'medi':
            return random.choice([[6, 8, 10], [7, 9, 12], [8, 12, 8]])
        elif tipo_ritmi == 'grandi':
            return random.choice([[16, 20, 24], [18, 25, 30], [20, 28, 20]])
        elif tipo_ritmi == 'misti':
            return random.choice([[2, 10, 4, 15], [3, 20, 5, 8]])
        return [4, 4, 4] # Default

    def _generate_params_from_mask(self, mask):
        """
        Il cuore del generatore. Versione semplificata e unificata.
        Tutti i parametri sono gestiti dalla stessa logica coerente.
        """
        params = {}

        # Definiamo un set di chiavi che sono gestite da logiche specializzate
        # più avanti in questa funzione o al di fuori di essa (es. densita_cluster).
        # Queste chiavi devono essere saltate dal ciclo di generazione generico.
        SKIPPED_KEYS = {
            'choices', 'weights', 'distribution', 'spread_spettrale', # Metadati
            'dynamic_index',      # Valore pre-calcolato dall'interpolazione
            'dinamica',           # Gestito da logica speciale
            'nonlinear_mode',     # Gestito da logica speciale
            'senso_movimento',    # Gestito da logica speciale
            'inviluppo_attacco',  # Gestito da logica speciale
            'tipo_ritmi',         # Gestito da logica speciale
            'densita_cluster'     # Gestito al di fuori, in _process_layer
        }

        # Itera su ogni parametro definito nella maschera.
        for key, p_mask in mask.items():
            # Salta le chiavi di controllo che non sono parametri diretti.
            if key in SKIPPED_KEYS: 
                continue
            
            val = 0
            
            # --- PERCORSO 1: DISTRIBUZIONE NORMALE ---
            # Se la maschera contiene 'mean' e 'std', usa la generazione Gaussiana.
            if 'mean' in p_mask and 'std' in p_mask:
                mean = p_mask['mean']
                std = p_mask['std']
                val = np.random.normal(loc=mean, scale=std)

            # --- PERCORSO 2: DISTRIBUZIONE UNIFORME (da un range) ---
            elif 'range' in p_mask:
                min_val, max_val = p_mask['range']
                if isinstance(min_val, int) and isinstance(max_val, int):
                    val = random.randint(min_val, max_val)
                else:
                    val = random.uniform(min_val, max_val)
            
            # --- PERCORSO 3: SCELTA PESATA (da una lista) ---
            elif 'choices' in p_mask:
                val = random.choices(p_mask['choices'], weights=p_mask.get('weights'), k=1)[0]
            
            params[key] = val

        # --- nonlinear_mode ---
        # Cerchiamo la maschera per nonlinear_mode
        nonlinear_mask = mask.get('nonlinear_mode')
        if nonlinear_mask:
            # Se la maschera esiste, generiamo il valore da essa
            if 'value' in nonlinear_mask:
                params['nonlinear_mode'] = nonlinear_mask['value']
            elif 'choices' in nonlinear_mask:
                params['nonlinear_mode'] = random.choices(
                    nonlinear_mask['choices'], 
                    weights=nonlinear_mask.get('weights'), 
                    k=1
                )[0]
            else:
                # Fallback se la maschera è malformata
                params['nonlinear_mode'] = 3
        else:
            # Default se la chiave 'nonlinear_mode' è completamente assente
            params['nonlinear_mode'] = 3 # Modalità Caos "Vero" di default

        # --- senso_movimento ---
        mov_mask = mask.get('senso_movimento')
        if mov_mask:
            if 'value' in mov_mask:
                params['senso_movimento'] = mov_mask['value']
            elif 'choices' in mov_mask:
                params['senso_movimento'] = random.choices(
                    mov_mask['choices'], 
                    weights=mov_mask.get('weights'), 
                    k=1
                )[0]
            else:
                params['senso_movimento'] = 1 # Fallback se la maschera è malformata
        else:
            # Default se la chiave 'senso_movimento' è assente
            params['senso_movimento'] = 1

        # --- inviluppo_attacco ---
        env_mask = mask.get('inviluppo_attacco')
        chosen_envelope_name = self.default_envelope
        if env_mask:
            if 'value' in env_mask:
                chosen_envelope_name = env_mask['value']
            elif 'choices' in env_mask:
                chosen_envelope_name = random.choices(
                    env_mask['choices'],
                    weights=env_mask.get('weights'),
                    k=1
                )[0]
        # Traduci il nome dell'inviluppo nel suo numero di tabella Csound
        params['ifn_attacco'] = self.envelope_map.get(chosen_envelope_name, self.envelope_map[self.default_envelope])

        # --- dinamica ---
        # La logica è stata riscritta per essere più robusta e gestire tutti i casi.

        # Priorità 1: L'indice è già stato calcolato e fornito dalla funzione di interpolazione?
        # Se sì, lo usiamo direttamente. Questo è il caso dei layer dinamici.
        if 'dynamic_index' in mask:
            params['dynamic_index'] = mask['dynamic_index']
        else:
            # Priorità 2: L'indice non è pre-calcolato, quindi lo generiamo dalla maschera 'dinamica'.
            dynamic_mask = mask.get('dinamica')
            if dynamic_mask:
                # Caso A: La dinamica è definita come una scelta pesata.
                if 'choices' in dynamic_mask:
                    dynamic_str = random.choices(
                        dynamic_mask['choices'], 
                        weights=dynamic_mask.get('weights'), 
                        k=1
                    )[0]
                    params['dynamic_index'] = self.dynamic_to_index.get(dynamic_str, 3) # Default 'mf'
                
                # Caso B: La dinamica è un valore fisso (es. dinamica: 'f').
                # Questo è il caso che mancava e causava l'errore per i layer statici.
                elif 'value' in dynamic_mask:
                    dynamic_str = dynamic_mask['value']
                    params['dynamic_index'] = self.dynamic_to_index.get(dynamic_str, 3) # Default 'mf'
                    
                # Fallback: la maschera 'dinamica' esiste ma è malformata.
                else:
                    params['dynamic_index'] = 3 # 'mf'
                    
            # Priorità 3: La chiave 'dinamica' non è proprio presente nella maschera.
            else:
                params['dynamic_index'] = 3 # 'mf'

        # --- APPLICAZIONE DEI CLIPPING E GENERAZIONE DERIVATA (POST-GENERAZIONE) ---
        
        # Clipping per garantire che i valori rimangano nei limiti tecnici globali.
        params['ottava'] = int(round(np.clip(params.get('ottava', 5), OTTAVE_RANGE[0], OTTAVE_RANGE[1])))
        params['registro'] = int(np.clip(params.get('registro', 5), REGISTRI_RANGE[0], REGISTRI_RANGE[1]))


        # Generazione di parametri derivati
        rhythm_mask = mask.get('tipo_ritmi', {'choices': ['medi']}) # Default a categoria 'medi'
        if 'explicit_values' in rhythm_mask:
            # --- MODALITÀ 1: L'utente ha fornito una lista esplicita ---
            params['ritmi'] = rhythm_mask['explicit_values']

        elif 'choices' in rhythm_mask:
            # --- MODALITÀ 2: L'utente ha fornito una lista di scelte ---
            choice = random.choices(rhythm_mask['choices'], weights=rhythm_mask.get('weights'), k=1)[0]
            
            if isinstance(choice, list):
                # Sottocaso 2a: La scelta è già una lista di ritmi (es. [[2,3,5], [7,7]])
                params['ritmi'] = choice
            else:
                # Sottocaso 2b: La scelta è una categoria stringa (vecchio comportamento)
                params['ritmi'] = self._generate_rhythm_pattern(choice)
        else:
            # Fallback se la maschera 'tipo_ritmi' è malformata
            params['ritmi'] = self._generate_rhythm_pattern('medi')

        params['posizioni'] = [i % r for i, r in enumerate(params['ritmi']) if r > 0]
        
        moltiplicatore = params.get('moltiplicatore_durata', random.choice([1, 1.25, 1.6]))
        params['durata_totale'] = params['durata_armonica'] * moltiplicatore
        
        self.id_comp_counter += 1
        params['id_comp'] = self.id_comp_counter

        return params

    def _interpolate_mask(self,start_mask, end_mask, progress):
        """Interpola tra due maschere per ottenere una maschera intermedia."""
        interp_mask = {}
        all_keys = set(start_mask.keys()) | set(end_mask.keys())

        for key in all_keys:
            s = start_mask.get(key)
            e = end_mask.get(key, s)
            interp_mask[key] = {}

            if key == 'dinamica' and 'value' in s and 'value' in e:
                start_val_str = s['value']
                end_val_str = e['value']
                
                # Accedi alla mappa tramite 'self', che è già disponibile
                start_idx = self.dynamic_to_index.get(start_val_str) 
                end_idx = self.dynamic_to_index.get(end_val_str)

                if start_idx is not None and end_idx is not None:
                    interp_idx = start_idx + (end_idx - start_idx) * progress
                    interp_mask['dynamic_index'] = interp_idx
                    continue

            # --- Percorso 1: La maschera definisce un range ---
            if 'range' in s:
                s_min, s_max = s['range']
                e_min, e_max = e['range']
                i_min = s_min + (e_min - s_min) * progress
                i_max = s_max + (e_max - s_max) * progress
                interp_mask[key]['range'] = [i_min, i_max]
                # Se è presente, propaga la chiave 'distribution'
                if 'distribution' in s:
                    interp_mask[key]['distribution'] = s['distribution']

            # --- Percorso 2: La maschera definisce media e std ---
            elif 'mean' in s:
                i_mean = s['mean'] + (e['mean'] - s['mean']) * progress
                i_std = s['std'] + (e['std'] - s['std']) * progress
                interp_mask[key]['mean'] = i_mean
                interp_mask[key]['std'] = i_std
                # Propaga la chiave 'distribution'
                if 'distribution' in s:
                    interp_mask[key]['distribution'] = s['distribution']

            elif 'value' in s:
                # Controlla se il valore è un numero (int o float)
                if isinstance(s['value'], (int, float)):
                    # Se è un numero, possiamo interpolarlo (es. per senso_movimento).
                    i_value = s['value'] + (e['value'] - s['value']) * progress
                    interp_mask[key]['value'] = i_value
                else:
                    # Se è una stringa (es. per inviluppo_attacco), non possiamo interpolare.
                    # Semplicemente usiamo il valore dello stato iniziale.
                    # Questo garantisce che un valore fisso rimanga tale.
                    interp_mask[key] = s

            # --- Percorso 3: La maschera definisce scelte pesate ---
            elif 'choices' in s:
                # Per le scelte pesate, la transizione è un "cross-fade" dei pesi
                s_weights = np.array(s.get('weights', [1]*len(s['choices'])))
                e_weights = np.array(e.get('weights', [1]*len(e['choices'])))
                # Assicurati che i due array di pesi abbiano la stessa lunghezza per il cross-fade
                if len(s_weights) == len(e_weights):
                    i_weights = s_weights * (1 - progress) + e_weights * progress
                    interp_mask[key] = {'choices': s['choices'], 'weights': i_weights.tolist()}
                else:
                    # Se i pesi non corrispondono, usa un fade-out/fade-in
                    if progress < 0.5:
                        interp_mask[key] = s
                    else:
                        interp_mask[key] = e
        
        return interp_mask


    # Inserisci questo blocco di codice all'interno della classe GenerativeComposer

    def _process_layer(self, layer, current_time_offset, scaled_section_duration, time_ratio, section_env_table_num, section_name):
        """
        Processa un singolo layer (reale o virtuale) e restituisce i suoi eventi e onsets.
        Questa è una funzione helper per process_composition.
        """
        layer_events = []
        layer_onsets = []
        layer_name = layer.get('nome_layer', "Layer Singolo (compatibilità)")

        print(f"\n  -- Processando {layer_name} --")

        # --- 1: ESTRARRE E INTERPRETARE IL 'LIFESPAN' ---
        lifespan = layer.get('lifespan', [0.0, 1.0])
        start_ratio, end_ratio = lifespan

        # Calcoliamo la durata e il tempo di inizio ASSOLUTI per questo layer
        layer_start_time_abs = current_time_offset + (start_ratio * scaled_section_duration)
        layer_duration_abs = (end_ratio - start_ratio) * scaled_section_duration

        # Controllo di sanità: se la durata è nulla o negativa, salta il layer.
        if layer_duration_abs <= 0:
            print(f"     > ATTENZIONE: Layer '{layer_name}' ha una durata nulla o negativa. Sarà saltato.")
            return [], []

        print(f"     > Finestra Attività: [{start_ratio*100:.0f}%, {end_ratio*100:.0f}%] | Inizio: {layer_start_time_abs:.2f}s, Durata: {layer_duration_abs:.2f}s")

        # --- 1. IDENTIFICA TIPO E TIMING DEL LAYER ---
        is_static_layer = 'stato_unico' in layer
        is_dynamic_layer = 'stato_iniziale' in layer # Aggiunta per chiarezza

        if is_static_layer:
            layer['stato_unico'] = self._normalize_mask(layer['stato_unico'])
        if is_dynamic_layer:
            layer['stato_iniziale'] = self._normalize_mask(layer['stato_iniziale'])
            if 'stato_finale' in layer:
                layer['stato_finale'] = self._normalize_mask(layer['stato_finale'])

        timing_model = layer.get('timing_model', {})
        num_attivazioni = layer.get('num_attivazioni', 10)
        
        print(f"     > Tipo: {'Statico' if is_static_layer else 'Dinamico'}")
        print(f"     > Numero attivazioni: {num_attivazioni}")

        # --- 2. CALCOLA CUSCINETTO E ONSETS PER QUESTO SPECIFICO LAYER ---
        mask_for_buffer = layer.get('stato_unico') if is_static_layer else layer.get('stato_finale')
        if not mask_for_buffer or 'durata_armonica' not in mask_for_buffer or 'range' not in mask_for_buffer['durata_armonica']:
            print(f"     > ERRORE: Maschera 'durata_armonica' mal definita o mancante per il layer '{layer_name}'. Impossibile calcolare il buffer. Layer saltato.")
            return [], []
            
        max_harmonic_dur_unscaled = mask_for_buffer['durata_armonica']['range'][1]
        max_harmonic_dur_scaled = max_harmonic_dur_unscaled * time_ratio
        # 2b. Cerca la maschera per 'moltiplicatore_durata'
        moltiplicatore_mask = mask_for_buffer.get('moltiplicatore_durata')
        max_duration_multiplier = 1.0 # Default se non specificato

        if moltiplicatore_mask and 'choices' in moltiplicatore_mask:
            # Se la maschera esiste, trova il valore massimo tra le scelte possibili
            max_duration_multiplier = max(moltiplicatore_mask['choices'])
        
        print(f"     > Max Durata Armonica: {max_harmonic_dur_scaled:.2f}s, Max Moltiplicatore: {max_duration_multiplier:.2f}x")

        # 2c. Calcola il cuscinetto usando il VERO moltiplicatore massimo
        safety_buffer = max_harmonic_dur_scaled * max_duration_multiplier
        
        print(f"     > Cuscinetto di sicurezza calcolato: {safety_buffer:.2f}s")
        
        generation_duration = layer_duration_abs - safety_buffer
        
        if generation_duration <= 0:
            print(f"     > ATTENZIONE: Cuscinetto di sicurezza ({safety_buffer:.2f}s) > durata sezione. Nessun evento generato per questo layer.")
            cluster_onsets_relative_to_layer = []
        else:
            cluster_onsets_relative_to_layer = self.time_scheduler.generate_onsets(
                timing_model, generation_duration, num_attivazioni
            )
        
        # --- 3. GENERA GLI EVENTI PER IL LAYER ---
        for onset_relative_to_layer in cluster_onsets_relative_to_layer:
            # Ottieni la maschera di controllo (statica o interpolata) per il layer
            absolute_onset_time = layer_start_time_abs + onset_relative_to_layer

            if is_static_layer:
                center_mask = layer['stato_unico']
            else:
                progress = onset_relative_to_layer / layer_duration_abs if layer_duration_abs > 0 else 0
                start_mask = layer['stato_iniziale']
                end_mask = layer['stato_finale']
                center_mask = self._interpolate_mask(start_mask, end_mask, progress) 


            dens_range = center_mask.get('densita_cluster', {'range': [1,1]})['range']
            num_events_in_cluster = random.randint(int(dens_range[0]), int(dens_range[1]))

            for i in range(num_events_in_cluster):
                for attempt in range(10):
                    event_mask = center_mask.copy()
                    if 'durata_armonica' in event_mask and 'range' in event_mask['durata_armonica']:
                        current_range = event_mask['durata_armonica']['range']
                        scaled_range = [val * time_ratio for val in current_range]
                        event_mask['durata_armonica'] = event_mask['durata_armonica'].copy()
                        event_mask['durata_armonica']['range'] = scaled_range

                    params = self._generate_params_from_mask(event_mask)
                    
                    if self._valida_parametri(params):
                        rhythm_tuple = tuple(params['ritmi'])
                        if rhythm_tuple not in self.rhythm_table_map:
                            self.rhythm_table_map[rhythm_tuple] = {
                                'ritmi_tab_num': self.next_table_id, 'pos_tab_num': self.next_table_id + 1
                            }
                            self.next_table_id += 2
                        
                        params['ritmi_tab_num'] = self.rhythm_table_map[rhythm_tuple]['ritmi_tab_num']
                        params['pos_tab_num'] = self.rhythm_table_map[rhythm_tuple]['pos_tab_num']
                        params['section_env_table_num'] = section_env_table_num
                        params['section_start_time'] = current_time_offset
                        params['section_duration'] = scaled_section_duration
                        params['section_name'] = section_name
                        
                        jitter_scale = params.get('onset_jitter', 0.05)
                        jitter = np.random.normal(loc=0.0, scale=jitter_scale)
                        event_time = absolute_onset_time + jitter

                        layer_onsets.append(absolute_onset_time)

                        event_data = {'type': 'voce', 'time': event_time, 'params': params}
                        layer_events.append(event_data)
                        break
                else:
                    print(f"     > ATTENZIONE: Impossibile generare parametri validi per un evento nel layer '{layer_name}'.")

        print(f"     > Eventi 'voce' generati per questo layer: {len(layer_events)}")
        return layer_events, layer_onsets


    def process_composition(self, composition_structure):
        """
        Elabora l'intera struttura della composizione, gestendo sezioni
        con e senza la struttura a layer per retrocompatibilità.
        """
        full_sequence = []
        all_onsets = []
        current_time_offset = 0.0
        
        print("Inizio elaborazione della composizione...")
        for i, section in enumerate(composition_structure):
            print(f"\n--- Sezione {i+1}: '{section['nome_sezione']}' (Durata: {section['durata']}s) ---")
            section_name = section['nome_sezione']
            # --- 1. GESTIONE PARAMETRI A LIVELLO DI SEZIONE ---
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_section_duration = section['durata'] * time_ratio
            section_env_table_num = 0 # 0 significa "nessun inviluppo"

            section_env_name = section.get('inviluppo_sezione', self.default_section_envelope)
            if section_env_name:
                if section_env_name in self.section_envelope_map:
                    section_env_table_num = self.section_envelope_map[section_env_name]
                    print(f"  > Inviluppo di sezione globale: '{section_env_name}' (userà la tabella f{section_env_table_num})")
                else:
                    print(f"  > ATTENZIONE: Inviluppo di sezione '{section_env_name}' non trovato. Verrà ignorato.")

            # --- 2. GESTIONE DEI LAYER ---
            if 'layers' in section:
                print(f"  > Rilevata struttura multi-layer.")
                for layer in section['layers']:
                    layer_events, layer_onsets = self._process_layer(
                        layer, current_time_offset, scaled_section_duration, time_ratio, section_env_table_num, section_name
                    )
                    full_sequence.extend(layer_events)
                    all_onsets.extend(layer_onsets)
            else:
                print(f"  > Rilevata struttura a layer singolo (retrocompatibilità).")
                layer_events, layer_onsets = self._process_layer(
                    section, current_time_offset, scaled_section_duration, time_ratio, section_env_table_num, section_name
                )
                full_sequence.extend(layer_events)
                all_onsets.extend(layer_onsets)

            # --- 3. AGGIORNA IL TEMPO PER LA PROSSIMA SEZIONE ---
            current_time_offset += scaled_section_duration
        
        # Ordina la sequenza finale per tempo e restituisci
        full_sequence.sort(key=lambda e: e['time'])
        num_voce_events = len([e for e in full_sequence if e.get('type') == 'voce'])
        print(f"\n✓ Elaborazione completata. Generati {num_voce_events} eventi 'voce' totali.")
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici a tabelle Csound.")
        return full_sequence, all_onsets


    def generate_csd(self, composition_name, events):
        """Genera il file CSD finale dalla sequenza di eventi."""
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        
        # --- 1. COSTRUZIONE DEGLI F-STATEMENTS PER I RITMI ---
        rhythm_tables_str = ""
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            # ... (questa parte rimane identica) ...
            ritmi_str = ' '.join(map(str, rhythm_tuple))
            posizioni = [i % r for i, r in enumerate(rhythm_tuple) if r > 0]
            posizioni_str = ' '.join(map(str, posizioni))
            rhythm_tables_str += f"f {table_ids['ritmi_tab_num']} 0 {len(rhythm_tuple)} -2 {ritmi_str}\n"
            rhythm_tables_str += f"f {table_ids['pos_tab_num']} 0 {len(posizioni)} -2 {posizioni_str}\n"

        # --- 2. COSTRUZIONE DINAMICA DEGLI F-STATEMENTS PER GLI INVILUPPI ---
        envelope_tables_str = "; --- TABELLE DEGLI INVILUPPI (generate da tables.yaml) ---\n"
        
        # Unisci i due dizionari di configurazione per iterare su tutte le tabelle in una volta
        all_envelope_configs = {**self.event_envelopes_config, **self.section_envelopes_config}

        for name, config in all_envelope_configs.items():
            # Converte la lista di parametri in una stringa separata da spazi
            params_str = ' '.join(map(str, config['parameters']))
            # Costruisce la riga dello score
            envelope_tables_str += f"; {name}\n"
            envelope_tables_str += f"f {config['number']} 0 {config['size']} {config['gen_routine']} {params_str}\n"

        # --- 3. COSTRUZIONE DELLE LINEE DI SCORE PER GLI EVENTI ---
        score_lines = ""
        last_event_time = 0
        current_section_name = None # Inizializza a None per stampare il primo commento
        for event in events:
            p = event['params']
            event_time = max(event['time'], 0.001)
            if event['type'] == 'voce':
                # Controlla se il nome della sezione dell'evento attuale è diverso dall'ultimo visto
                if p.get('section_name') != current_section_name:
                    # Se è diverso, è l'inizio di una nuova sezione
                    current_section_name = p.get('section_name')
                    section_start = p.get('section_start_time', 0)
                    section_dur = p.get('section_duration', 0)
                    # Scrivi il commento descrittivo nello score
                    score_lines += f'\n; =============================================================================\n'
                    score_lines += f'; SEZIONE: "{current_section_name}"\n'
                    score_lines += f'; Inizio: {section_start:.3f}s, Durata: {section_dur:.3f}s\n'
                    score_lines += f'; =============================================================================\n\n'
            
                score_lines += ";\t\t\tat\t\tdur\t\ttab\t\tarmonica\tdinamica\tottava\tregistro\tpos\t\tid_comp\tnonlinearMode\tmovimento\tifn_attacco\tenv_sezione\tenv_attacco\tenv_durata\n"
                score_lines += (f'i "Voce"\t{event_time:.4f}\t{p["durata_totale"]:.3f}\t'
                                f'{p["ritmi_tab_num"]}\t{p["durata_armonica"]:.3f}\t\t{p["dynamic_index"]}\t\t\t'
                                f'{p["ottava"]}\t\t{p["registro"]}\t\t\t{p["pos_tab_num"]}\t{p["id_comp"]}\t\t{p["nonlinear_mode"]}'
                                f'\t\t\t\t{p["senso_movimento"]}\t\t\t{p["ifn_attacco"]}\t\t\t{p.get("section_env_table_num", 0)}'
                                f'\t\t\t{p.get("section_start_time", 0):.4f}\t\t{p.get("section_duration", 0):.3f}\n')
                last_event_time = max(last_event_time, event_time + p["durata_totale"])

        # --- 4. ASSEMBLAGGIO DEL FILE FINALE ---
        wav_file_path = self.wav_output_path / f"{composition_name}.wav"
        csd_file_path = self.output_path / f"{composition_name}.csd"

        # 3. Assembla il file finale usando il NUOVO template e i NUOVI placeholder
        template = self.get_csd_template()
        csd_content = template.format(
            wav_file_path=wav_file_path, 
            envelope_tables=envelope_tables_str, 
            rhythm_tables=rhythm_tables_str, 
            score_lines=score_lines,
            durata_totale=last_event_time + 10,
            ottave_macro = OTTAVE_RANGE[1], 
            registri_macro = REGISTRI_RANGE[1],
            intervalli_macro = INTERVALLI_PER_OTTAVA
        )

        with open(csd_file_path, 'w') as f:
            f.write(csd_content)
        
        return csd_file_path, wav_file_path
    
    def get_csd_template(self):
        """Restituisce il template CSD master."""
        return """
<CsoundSynthesizer>
<CsOptions>
-o "{wav_file_path}" -W -d -m0
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 32
nchnls = 2
0dbfs = 1

#define SQRT2 #1.4142135623730951#
#define MAX_AMP #0.999#
#define FONDAMENTALE #32#
#define OTTAVE #{ottave_macro}#
#define INTERVALLI #{intervalli_macro}#
#define REGISTRI #{registri_macro}#
#define M_PI #3.141592653589793#
gSdirSco = "./sco/"
gi_Index init 1
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0

gi_debug init 2

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/initIsoAmp.orc"
#include "../includes/eventoSonoro.orc"
#include "../includes/voce.orc"

instr Init
    i_Res GenPythagFreqs $FONDAMENTALE, $INTERVALLI, $OTTAVE, gi_Intonazione
    if i_Res == 0 then
        prints "ERRORE: Inizializzazione del sistema pitagorico fallita!\\n"
    endif
    ires system_i 1, sprintf("mkdir %s", gSdirSco)
    turnoff
endin
</CsInstruments>
<CsScore>
f 0 {durata_totale} ; Evento f fittizio per definire la durata totale
f1 0 4096 10 1


; ==============================================================================
; TABELLE DEFINITE DINAMICAMENTE
; ==============================================================================

{envelope_tables}

{rhythm_tables}


i "Init" 0 0.1

; --- EVENTI GENERATI ---
{score_lines}
; ---------------------

e
</CsScore>
</CsoundSynthesizer>
"""

class CompositionDebugger:
    """Utility per visualizzare la composizione generata."""
    def __init__(self, output_dir):
        self.output_path = Path(output_dir)

    # VERSIONE FINALE CORRETTA - USA QUESTA
    def _plot_tendency_masks(self, ax_pitch, ax_dur, ax_dyn, composition_structure, composer):
        """
        MODIFICATA: Disegna le maschere di tendenza per ottava e durata.
        Disegna una linea di tendenza dinamica SEPARATA per ogni layer.
        AGGIUNTO: Visualizza le maschere di probabilità (choices) per la dinamica come un grafico ad aree impilate.
        """
        print("  > Visualizzo le maschere di tendenza (con dinamiche per-layer e probabilità)...")
        section_start_time = 0.0

        layer_colors = {}
        color_cycle = plt.rcParams['axes.prop_cycle'].by_key()['color']
        
        # Mappa per la legenda (per evitare etichette duplicate) - REINTRODOTTA
        labels_added = set()

        for section in composition_structure:
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_duration = section['durata'] * time_ratio
            layers_to_process = section.get('layers', [section])

            for i, layer in enumerate(layers_to_process):
                layer_name = layer.get('nome_layer', f"Layer {i+1}")
                
                if layer_name not in layer_colors:
                    layer_colors[layer_name] = color_cycle[len(layer_colors) % len(color_cycle)]
                layer_color = layer_colors[layer_name]

                if 'stato_unico' in layer:
                    start_mask = layer['stato_unico']
                    end_mask = start_mask
                elif 'stato_iniziale' in layer:
                    start_mask = layer['stato_iniziale']
                    end_mask = layer.get('stato_finale', start_mask)
                else:
                    continue

                num_samples = 100
                times = np.linspace(0, scaled_duration, num_samples) + section_start_time
                
                ottava_lower, ottava_upper = [], []
                durata_lower, durata_upper = [], []
                
                # Variabili di dinamica pulite (rimossa 'dynamics_trend')
                dynamics_line_trend = []
                dynamics_prob_weights = []

                has_ottava = 'ottava' in start_mask
                has_durata = 'durata_armonica' in start_mask
                has_dinamica = 'dinamica' in start_mask
                
                is_dynamic_choices = has_dinamica and 'choices' in start_mask.get('dinamica', {})

                # Ciclo di raccolta dati
                for p in np.linspace(0, 1, num_samples):
                    interp_mask = composer._interpolate_mask(start_mask, end_mask, p)
                    
                    if has_ottava:
                        mask = interp_mask.get('ottava', {})
                        lower, upper = OTTAVE_RANGE
                        if 'range' in mask: lower, upper = mask['range']
                        elif 'mean' in mask: lower, upper = mask['mean'] - mask['std'], mask['mean'] + mask['std']
                        ottava_lower.append(lower)
                        ottava_upper.append(upper)

                    if has_durata:
                        mask = interp_mask.get('durata_armonica', {})
                        lower, upper = (1, 1)
                        if 'range' in mask: lower, upper = [d * time_ratio for d in mask['range']]
                        elif 'mean' in mask: lower, upper = mask['mean'] - mask['std'], mask['mean'] + mask['std']
                        durata_lower.append(lower)
                        durata_upper.append(upper)
                    
                    if has_dinamica:
                        if is_dynamic_choices:
                            weights = interp_mask.get('dinamica', {}).get('weights', [])
                            dynamics_prob_weights.append(weights)
                        else:
                            if 'dynamic_index' in interp_mask:
                                dynamics_line_trend.append(interp_mask['dynamic_index'])
                            elif 'value' in interp_mask.get('dinamica', {}):
                                dyn_str = interp_mask['dinamica']['value']
                                dynamics_line_trend.append(composer.dynamic_to_index.get(dyn_str, 3))
                            else:
                                dynamics_line_trend.append(np.nan)

                # --- Sezione di Plotting CORRETTA ---

                # Disegna la maschera di OGNI layer, ma aggiungi l'etichetta solo la prima volta.
                if has_ottava:
                    label_ottava = 'Maschera Ottava' if 'maschera_ottava' not in labels_added else ""
                    ax_pitch.fill_between(times, ottava_lower, ottava_upper, color='gray', alpha=0.2, zorder=1, label=label_ottava)
                    # Aggiungiamo la chiave al set *dopo* aver deciso la label, ma *dentro* il blocco if
                    # per assicurarci che venga aggiunta solo se la maschera esiste effettivamente.
                    labels_added.add('maschera_ottava')
                
                if has_durata:
                    label_durata = 'Maschera Durata Armonica' if 'maschera_durata' not in labels_added else ""
                    ax_dur.fill_between(times, durata_lower, durata_upper, color='cyan', alpha=0.2, zorder=1, label=label_durata)
                    labels_added.add('maschera_durata')
                    
                # Logica di plotting per la dinamica, con controllo delle etichette anche per lo stackplot
                if is_dynamic_choices and dynamics_prob_weights:
                    weights_per_dynamic = np.array(dynamics_prob_weights).T
                    dynamic_labels = start_mask['dinamica']['choices']
                    
                    # Crea etichette per la legenda solo la prima volta che disegni uno stackplot
                    stackplot_labels = [f"Prob. {label}" for label in dynamic_labels] if 'prob_stack' not in labels_added else ["" for _ in dynamic_labels]

                    cmap = plt.get_cmap('viridis')
                    stackplot_colors = cmap(np.linspace(0.1, 0.9, len(dynamic_labels)))
                    
                    # Controlla se l'asse Y è già stato modificato
                    if 'prob_axis' not in labels_added:
                        ax_dyn.set_ylabel("Probabilità Dinamica")
                        ax_dyn.set_ylim(0, 1)
                        ax_dyn.set_yticks([0, 0.25, 0.5, 0.75, 1.0])
                        ax_dyn.set_yticklabels(['0%', '25%', '50%', '75%', '100%'])
                        labels_added.add('prob_axis')
                    
                    ax_dyn.stackplot(times, weights_per_dynamic, 
                                     labels=stackplot_labels, 
                                     colors=stackplot_colors,
                                     alpha=0.6,
                                     zorder=2)
                    # Segna che abbiamo già aggiunto le etichette dello stackplot alla legenda
                    labels_added.add('prob_stack')

                elif dynamics_line_trend:
                    valid_times = [t for t, d in zip(times, dynamics_line_trend) if not np.isnan(d)]
                    valid_dynamics = [d for d in dynamics_line_trend if not np.isnan(d)]
                    if valid_times:
                        # Questa parte già gestiva correttamente i layer con colori diversi e etichette uniche
                        ax_dyn.plot(valid_times, valid_dynamics, color=layer_color, linewidth=2.5, 
                                    label=f"Dinamica: {layer_name}", zorder=3, alpha=0.8)
            section_start_time += scaled_duration                        
                        
    def plot_piano_roll(self, events, all_onsets, composition_name, composition_structure, composer):
        """
        MODIFICATA: Crea un grafico a due subplot:
        1. Piano-roll (altezza vs tempo) con asse secondario per la durata.
        2. Tendenza dinamica (dinamica vs tempo), con una linea per ogni layer.
        """
        print("\n--- Avvio Debugging Visivo: Generazione Grafico a Subplot ---")
        if not events:
            print("Nessun evento da visualizzare.")
            return

        # ... (la prima parte della funzione, che raccoglie i dati, rimane IDENTICA) ...
        plot_data = []
        max_time = 0
        max_durata_armonica = 0

        # ... (questo ciclo for è identico) ...
        for event in events:
            if event.get('type') == 'voce':
                p = event['params']
                start, duration = event['time'], p['durata_totale']
                pitch = p['ottava'] + (p['registro'] / (REGISTRI_RANGE[1] + 1.0))
                amp_norm = p.get('dynamic_index', 3) / len(composer.dynamic_to_index)
                plot_data.append({'start': start, 'duration': duration, 'pitch': pitch, 'amp_norm': amp_norm})
                if (start + duration) > max_time: max_time = start + duration
                if p['durata_armonica'] > max_durata_armonica: max_durata_armonica = p['durata_armonica']
        
        plt.style.use('seaborn-v0_8-darkgrid')
        
        fig, (ax_pitch, ax_dyn) = plt.subplots(
            nrows=2, ncols=1, figsize=(20, 15), sharex=True, 
            gridspec_kw={'height_ratios': [3, 1]}
        )
        fig.suptitle(f"Visualizzazione Composizione e Maschere di Tendenza: '{composition_name}'", fontsize=16)

        ax_dur = ax_pitch.twinx()

        for item in plot_data:
            ax_pitch.add_patch(plt.Rectangle(
                (item['start'], item['pitch'] - 0.04), item['duration'], 0.08,
                color=plt.cm.viridis(item['amp_norm']), alpha=0.6, zorder=3
            ))

        # Disegna gli onsets sul grafico del pitch
        if all_onsets:
             ax_pitch.vlines(all_onsets, ymin=OTTAVE_RANGE[0] - 1, ymax=OTTAVE_RANGE[1] + 1,
                       color='dodgerblue', linestyle=':', linewidth=0.9, alpha=0.6, label='Attivazione', zorder=2)

        ax_pitch.set_ylim(OTTAVE_RANGE[0] - 1, OTTAVE_RANGE[1] + 1)
        ax_pitch.set_ylabel("Ottava.Registro")
        ax_pitch.set_yticks(range(OTTAVE_RANGE[0], OTTAVE_RANGE[1] + 2))
        
        ax_dur.set_ylabel("Durata Armonica (s)", color='darkcyan')
        ax_dur.set_ylim(0, max_durata_armonica * 1.5 if max_durata_armonica > 0 else 10)
        ax_dur.tick_params(axis='y', labelcolor='darkcyan')
        
        ax_dyn.set_ylabel("Dinamica")
        ax_dyn.set_xlabel("Tempo (secondi)")
        
        dyn_labels = list(composer.dynamic_to_index.keys())
        dyn_ticks = list(composer.dynamic_to_index.values())
        ax_dyn.set_yticks(dyn_ticks)
        ax_dyn.set_yticklabels(dyn_labels)
        ax_dyn.set_ylim(min(dyn_ticks) - 0.5, max(dyn_ticks) + 0.5)
        ax_dyn.grid(True, axis='y', linestyle='--', alpha=0.6)

        self._plot_tendency_masks(ax_pitch, ax_dur, ax_dyn, composition_structure, composer)

        current_time = 0.0
        # Aggiungiamo un set per le etichette delle sezioni per non ripeterle
        section_labels_added = set()
        for section in composition_structure:
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_duration = section['durata'] * time_ratio
            current_time += scaled_duration
            
            label_text = f"Fine: {section['nome_sezione']}" if section['nome_sezione'] not in section_labels_added else ""
            ax_pitch.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2, label=label_text)
            ax_dyn.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2)
            section_labels_added.add(section['nome_sezione'])

        # --- MODIFICA CHIAVE ALLA LEGENDA ---
        # Raccoglie tutte le etichette da tutti gli assi
        handles, labels = ax_pitch.get_legend_handles_labels()
        handles_dur, labels_dur = ax_dur.get_legend_handles_labels()
        handles_dyn, labels_dyn = ax_dyn.get_legend_handles_labels()
        
        # Aumentiamo la dimensione della legenda e il numero di colonne per accomodare tutto
        fig.legend(handles + handles_dur + handles_dyn, labels + labels_dur + labels_dyn,
                   loc='lower center', bbox_to_anchor=(0.5, -0.01), ncol=6, fontsize='small') # <--- MODIFICATO

        fig.tight_layout(rect=[0, 0.05, 1, 0.95]) # <--- Aggiustato per fare spazio alla legenda sotto
        
        plot_filename = self.output_path / f"{composition_name}_visual.png"
        plt.savefig(plot_filename, dpi=150, bbox_inches='tight')
        plt.close()
        print(f"✓ Grafico di visualizzazione salvato in: {plot_filename}")

if __name__ == "__main__":
    # ===================================================================
    # FLAG DI CONTROLLO: Decidi se lanciare Csound dopo la generazione.
    # Imposta su True per renderizzare automaticamente il file audio.
    # Imposta su False per generare solo il file .csd e il grafico.
    RENDER_AUTOMATICAMENTE = True
    # Imposta su True per aprire il file .wav al termine del rendering.
    # Funziona solo se RENDER_AUTOMATICAMENTE è True.
    APRI_FILE_DOPO_RENDER = True
    # ===================================================================
    # 1. Controllo degli argomenti
    if len(sys.argv) < 2:
        print("ERRORE: Devi specificare il percorso del file YAML della composizione.")
        print("Uso: python generative_composer.py percorso/della/composizione.yaml")
        sys.exit(1)
    
    yaml_file_path = sys.argv[1]
    
    # 2. Carica la partitura dal file YAML
    composition_structure = load_composition_from_yaml(yaml_file_path)
    
    # Deriva il nome della composizione dal nome del file
    composition_name = Path(yaml_file_path).stem
    
    # 3. Inizializza il compositore e il debugger
    composer = GenerativeComposer()
    debugger = CompositionDebugger(composer.output_path)
    
    # 4. Genera la sequenza di eventi
    event_sequence, all_onsets = composer.process_composition(composition_structure)
    csd_file_path = None
    wav_file_path = None # Inizializza anche il percorso del wav
    
    if event_sequence:
        # 5. Visualizza la sequenza
        debugger.plot_piano_roll(event_sequence, all_onsets, composition_name, composition_structure, composer)        
        # 6. Genera il file CSD finale
        csd_file_path, wav_file_path = composer.generate_csd(composition_name, event_sequence)
    else:
        print("\nERRORE: Nessun evento generato. Controlla la configurazione della composizione.")

    # 7. ESECUZIONE AUTOMATICA DI CSOUND
    if RENDER_AUTOMATICAMENTE and csd_file_path:
        print("\n--- AVVIO RENDERING CON CSOUND ---")
        # Definisci il percorso del file di log all'interno della directory di output
        log_file_path = composer.output_path / "csound_render.log"
        print(f"L'output di Csound verrà reindirizzato su: {log_file_path}")
        try:

            # Apri il file di log in modalità scrittura ('w').
            # Il blocco 'with' garantisce che il file venga chiuso correttamente
            # anche se si verificano errori.
            with open(log_file_path, 'w') as log_file:
                command = ['csound', str(csd_file_path)]
                
                # Esegui il comando, reindirizzando stdout e stderr al nostro file di log.
                # check=True farà comunque sollevare un'eccezione se Csound restituisce un codice di errore.
                result = subprocess.run(
                    command, 
                    stdout=log_file, 
                    stderr=log_file, 
                    check=True,
                    text=True # Assicura che l'output sia scritto come testo
                )
            print("\n✓ Rendering Csound completato con successo.")

            # Logica per aprire il file
            if APRI_FILE_DOPO_RENDER and wav_file_path:
                print(f"Apertura del file audio generato: {wav_file_path}")
                try:
                    if not wav_file_path.exists():
                        print(f"ATTENZIONE: File .wav non trovato a '{wav_file_path}'. Impossibile aprirlo.")
                    else:
                        open_command = ['open', str(wav_file_path)]
                        subprocess.run(open_command, check=True)
                except Exception as e:
                    print(f"\nERRORE: Impossibile aprire il file audio.")
                    print(f"Dettagli: {e}")
                    print("Questo comando funziona solo su macOS.")

        except FileNotFoundError:
            print("\nERRORE CRITICO: Comando 'csound' non trovato.")
            print("Assicurati che Csound sia installato e che il suo eseguibile sia nel PATH di sistema.")
        except subprocess.CalledProcessError:
            print("\nERRORE: Csound ha terminato con un errore durante il rendering.")
    elif csd_file_path:
        # Se il rendering non è automatico, stampa il comando come prima
        print(f"\nPer renderizzare manualmente, esegui:")
        print(f"  csound \"{csd_file_path}\"")