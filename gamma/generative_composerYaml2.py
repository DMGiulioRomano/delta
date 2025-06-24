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

def load_all_compositions_from_yaml(file_path):
    """
    Carica una o più composizioni da un singolo file YAML.
    I documenti multipli devono essere separati da '---'.
    Restituisce una lista di strutture di composizione.
    """
    print(f"Caricamento partiture dal file multi-documento: {file_path}")
    composizioni = []
    try:
        with open(file_path, 'r') as f:
            # safe_load_all restituisce un generatore, lo convertiamo in lista
            docs = list(yaml.safe_load_all(f))
        
        if not docs or all(d is None for d in docs):
             print(f"ERRORE: Il file YAML '{file_path}' è vuoto o non contiene documenti validi.")
             sys.exit(1)

        for i, composition in enumerate(docs):
            if composition is None: continue # Salta documenti vuoti (es. solo '---')
            
            if not isinstance(composition, list):
                print(f"ERRORE nel documento #{i+1} del file YAML: deve contenere una lista di sezioni.")
                sys.exit(1)
            composizioni.append(composition)

        print(f"✓ Trovati e caricati {len(composizioni)} documenti di composizione.")
        return composizioni
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
            'choices', 'weights', 'distribution', # Metadati
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
        params['registro'] = int(params.get('registro', 5))

        # 2. Logica Gerarchica per calcolare la frequenza di ARRIVO

        # CASO 1: MODALITÀ OFFSET (ha la precedenza su tutto)
        # Controlliamo se la maschera originale conteneva le chiavi di offset.
        # Usiamo la maschera 'mask' perché il dizionario 'params' conterrà solo i valori generati.
        if 'offset_ottava' in mask or 'offset_registro' in mask:
            
            # Recupera i valori di offset generati dal dizionario 'params'.
            # Se un offset non è stato specificato nel YAML, il suo valore generato non esisterà in 'params'.
            # In tal caso, il default è 0.
            offset_ottava = params.get('offset_ottava', 0)
            offset_registro = params.get('offset_registro', 0)
            
            # Calcola i parametri di arrivo sommando gli offset a quelli di partenza.
            ottava_arrivo_calc = params['ottava'] + offset_ottava
            registro_arrivo_calc = params['registro'] + offset_registro
            
            # Salva i valori calcolati nel dizionario 'params'. Questi verranno clippati dopo.
            params['ottava_arrivo'] = ottava_arrivo_calc
            params['registro_arrivo'] = registro_arrivo_calc
            
        # CASO 2: MODALITÀ ASSOLUTA (usata solo se non ci sono offset)
        # Controlliamo se la maschera originale conteneva le chiavi di arrivo assolute.
        elif 'ottava_arrivo' in mask or 'registro_arrivo' in mask:
            
            # I valori sono già stati generati dal ciclo e sono in 'params'.
            # Dobbiamo solo assicurarci che ci siano dei default sensati se ne manca uno.
            # Se 'ottava_arrivo' è specificata ma 'registro_arrivo' no, quest'ultimo sarà uguale al registro di partenza.
            params['ottava_arrivo'] = params.get('ottava_arrivo', params['ottava'])
            params['registro_arrivo'] = params.get('registro_arrivo', params['registro'])

        # CASO 3: DEFAULT (nessun glissando)
        else:
            # Se non sono stati specificati né offset né parametri assoluti di arrivo,
            # la frequenza di arrivo è semplicemente uguale a quella di partenza.
            params['ottava_arrivo'] = params['ottava']
            params['registro_arrivo'] = params['registro']

        # 3. Clipping finale e conversione a intero per i parametri di ARRIVO
        #    Questo è un passaggio di sicurezza fondamentale che si applica a TUTTI i casi.
        params['ottava_arrivo'] = int(round(np.clip(params['ottava_arrivo'], OTTAVE_RANGE[0], OTTAVE_RANGE[1])))
        params['registro_arrivo'] = int(np.clip(params['registro_arrivo'], REGISTRI_RANGE[0], REGISTRI_RANGE[1]))



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

    def _interpolate_mask(self, start_mask, end_mask, progress):
        """
        (Versione Completa e Robusta) Interpola tra due maschere per ottenere una maschera intermedia.
        Gestisce correttamente i parametri che esistono solo in una delle due maschere.
        """
        interp_mask = {}
        all_keys = set(start_mask.keys()) | set(end_mask.keys())

        for key in all_keys:
            s_mask = start_mask.get(key)
            e_mask = end_mask.get(key)

            # --- GESTIONE DEI PARAMETRI ASIMMETRICI (LA VERA CORREZIONE) ---
            if s_mask is None:
                s_mask = e_mask
            
            if e_mask is None:
                e_mask = s_mask

            shape = e_mask.get('interp_shape', 1.0)
            shaped_progress = progress ** shape
            
            interp_mask[key] = {}

            # --- INIZIO LOGICA DI INTERPOLAZIONE COMPLETA ---

            # Blocco 1: Gestione speciale per la dinamica lineare
            # NOTA: questa parte è stata re-integrata.
            if key == 'dinamica' and 'value' in s_mask and 'value' in e_mask:
                start_val_str = s_mask['value']
                end_val_str = e_mask['value']
                
                start_idx = self.dynamic_to_index.get(start_val_str) 
                end_idx = self.dynamic_to_index.get(end_val_str)

                if start_idx is not None and end_idx is not None:
                    interp_idx = start_idx + (end_idx - start_idx) * shaped_progress
                    interp_mask['dynamic_index'] = interp_idx
                    # Aggiungiamo anche la maschera originale per coerenza, sebbene non venga usata nel plot
                    interp_mask[key] = s_mask
                    continue # Abbiamo gestito questa chiave, passiamo alla successiva

            # Blocco 2: Interpolazione per maschere basate su 'range'
            if 'range' in s_mask:
                s_min, s_max = s_mask['range']
                # Gestione sicura nel caso e_mask non abbia 'range' (improbabile con la logica sopra, ma sicuro)
                e_min, e_max = e_mask.get('range', s_mask['range'])
                i_min = s_min + (e_min - s_min) * shaped_progress
                i_max = s_max + (e_max - s_max) * shaped_progress
                interp_mask[key]['range'] = [i_min, i_max]
                if 'distribution' in s_mask:
                    interp_mask[key]['distribution'] = s_mask['distribution']

            # Blocco 3: Interpolazione per maschere basate su 'mean' e 'std'
            elif 'mean' in s_mask:
                # Gestione sicura dei valori di e_mask
                e_mean = e_mask.get('mean', s_mask['mean'])
                e_std = e_mask.get('std', s_mask['std'])
                i_mean = s_mask['mean'] + (e_mean - s_mask['mean']) * shaped_progress
                i_std = s_mask['std'] + (e_std - s_mask['std']) * shaped_progress
                interp_mask[key]['mean'] = i_mean
                interp_mask[key]['std'] = i_std
                if 'distribution' in s_mask:
                    interp_mask[key]['distribution'] = s_mask['distribution']

            # Blocco 4: Interpolazione/Gestione per maschere basate su 'value'
            elif 'value' in s_mask:
                s_value = s_mask['value']
                e_value = e_mask.get('value', s_value)

                if isinstance(s_value, (int, float)) and isinstance(e_value, (int, float)):
                    # Se sono numeri, interpola
                    i_value = s_value + (e_value - s_value) * shaped_progress
                    interp_mask[key]['value'] = i_value
                else:
                    if s_value != e_value:
                        interp_mask[key] = {
                            'choices': [s_value, e_value],
                            'weights': [1 - shaped_progress, shaped_progress]
                        }
                    else:
                        # Se i valori sono identici, non c'è bisogno di probabilismo.
                        # Manteniamo un valore fisso.
                        interp_mask[key] = s_mask

            # Blocco 5: Interpolazione per maschere basate su 'choices'
            elif 'choices' in s_mask:
                s_choices = s_mask['choices']
                e_choices = e_mask.get('choices', s_choices)
                s_weights = np.array(s_mask.get('weights', [1]*len(s_choices)))
                e_weights = np.array(e_mask.get('weights', [1]*len(e_choices)))
                
                # Cross-fade dei pesi solo se le scelte sono identiche e i pesi compatibili
                if s_choices == e_choices and len(s_weights) == len(e_weights):
                    i_weights = s_weights * (1 - shaped_progress) + e_weights * shaped_progress
                    interp_mask[key] = {'choices': s_choices, 'weights': i_weights.tolist()}
                else:
                    # Altrimenti, transizione a scalino
                    interp_mask[key] = s_mask if shaped_progress < 0.5 else e_mask
            
            # Blocco 6: Fallback per maschere non standard (es. 'tipo_ritmi')
            else:
                # Per maschere complesse che non rientrano nei pattern precedenti
                # (come 'tipo_ritmi' con 'explicit_values'), non interpoliamo.
                # Manteniamo il valore stabile per tutta la durata.
                interp_mask[key] = s_mask

        return interp_mask


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
        else:
            # Usa LO STESSO default del generatore
            max_duration_multiplier = 1.6        
        print(f"     > Max Durata Armonica: {max_harmonic_dur_scaled:.2f}s, Max Moltiplicatore: {max_duration_multiplier:.2f}x")

        #       Controlla se il safety buffer deve essere usato per questo layer.
        #     Il default è True se il parametro non è specificato nel YAML.
        use_safety_buffer = layer.get('usa_safety_buffer', True)

        safety_buffer = 0.0 # Inizializza a zero
        if use_safety_buffer:
            # 2c. Calcola il cuscinetto usando il VERO moltiplicatore massimo
            safety_buffer = max_harmonic_dur_scaled * max_duration_multiplier
            print(f"     > Cuscinetto di sicurezza calcolato: {safety_buffer:.2f}s")
        else:
            # Se disabilitato, il buffer rimane a 0.0
            print(f"     > Cuscinetto di sicurezza DISABILITATO dall'utente.")
        
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
                progress = onset_relative_to_layer / generation_duration if generation_duration > 0 else 0
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
                                # Ora leggiamo il leeway dal layer, con un default di 0.0

                        # 1. Calcola il tempo di inizio REALE dell'evento, INCLUSO il jitter
                        jitter_scale = params.get('onset_jitter', 0.05)
                        jitter = np.random.normal(loc=0.0, scale=jitter_scale)
                        final_event_time = absolute_onset_time + jitter

                        # 2. Calcola la durata desiderata dell'evento
                        base_total_duration = params['durata_totale']
                        layer_leeway = layer.get('leeway_fine_layer', 0.0)
                        leeway_bonus = random.uniform(0.0, layer_leeway) if layer_leeway > 0 else 0.0
                        desired_total_duration = base_total_duration + leeway_bonus

                        # 3. Calcola la durata MASSIMA disponibile partendo dal tempo REALE dell'evento
                        layer_end_time_with_leeway = layer_start_time_abs + layer_duration_abs + layer_leeway
                        available_duration = max(0.0, layer_end_time_with_leeway - final_event_time)

                        # 4. Imposta la durata finale come il minimo tra quella desiderata e quella disponibile
                        params['durata_totale'] = min(desired_total_duration, available_duration)
                        params['ritmi_tab_num'] = self.rhythm_table_map[rhythm_tuple]['ritmi_tab_num']
                        params['pos_tab_num'] = self.rhythm_table_map[rhythm_tuple]['pos_tab_num']
                        params['section_env_table_num'] = section_env_table_num
                        params['section_start_time'] = current_time_offset
                        params['section_duration'] = scaled_section_duration
                        params['section_name'] = section_name
                        params['layer_leeway'] = layer_leeway 



                        layer_onsets.append(absolute_onset_time)

                        event_data = {'type': 'voce', 'time': final_event_time, 'params': params}
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
        onsets_by_section = [] 
        all_onsets_flat = [] # Manteniamo anche la lista piatta per usi esistenti
        current_time_offset = 0.0

        solo_mode_active = False
        # Itera su tutta la struttura per trovare almeno un layer con 'solo: True'
        for section in composition_structure:
            if 'layers' in section:
                for layer in section['layers']:
                    if layer.get('solo', False):
                        solo_mode_active = True
                        break # Trovato uno, non serve cercare oltre
            if solo_mode_active:
                break

        if solo_mode_active:
            print("\nMODALITÀ SOLO ATTIVA: Verranno processati solo i layer con 'solo: True'.")


        print("Inizio elaborazione della composizione...")
        for i, section in enumerate(composition_structure):
            section_name = section['nome_sezione']
            section_onsets_data = {'section_name': section['nome_sezione'], 'layers': []}

            # --- 1. GESTIONE PARAMETRI A LIVELLO DI SEZIONE ---
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_section_duration = section['durata'] * time_ratio
            section_env_table_num = 0 # 0 significa "nessun inviluppo"

            print(f"\n--- Sezione {i+1}: '{section['nome_sezione']}' (Durata: {section['durata']}s, riscalata a x{time_ratio}: {scaled_section_duration}s ) ---")

            section_env_name = section.get('inviluppo_sezione', self.default_section_envelope)
            if section_env_name:
                if section_env_name in self.section_envelope_map:
                    section_env_table_num = self.section_envelope_map[section_env_name]
                    print(f"  > Inviluppo di sezione globale: '{section_env_name}' (userà la tabella f{section_env_table_num})")
                else:
                    print(f"  > ATTENZIONE: Inviluppo di sezione '{section_env_name}' non trovato. Verrà ignorato.")

            layers_to_process = []
            if 'layers' in section:
                layers_to_process = section['layers']
            else: # Retrocompatibilità
                layers_to_process = [section]

            for layer in layers_to_process:
                layer_name = layer.get('nome_layer', "Layer Singolo")

                # Se la modalità solo è attiva, controlliamo se questo layer deve essere saltato.
                if solo_mode_active and not layer.get('solo', False):
                    print(f"\n  -- Saltando layer '{layer_name}' (non in solo) --")
                    # Aggiungiamo un placeholder per il plotting, se necessario
                    section_onsets_data['layers'].append({
                        'layer_name': layer_name,
                        'onsets': []
                    })
                    continue # Salta al prossimo layer
                # La chiamata a _process_layer e il resto della logica rimangono identici
                layer_events, layer_onsets = self._process_layer(
                    layer, current_time_offset, scaled_section_duration, time_ratio, 
                    section_env_table_num, section_name # Assumendo che queste variabili siano definite
                )
                full_sequence.extend(layer_events)
                section_onsets_data['layers'].append({
                    'layer_name': layer_name,
                    'onsets': layer_onsets
                })
                all_onsets_flat.extend(layer_onsets)

            onsets_by_section.append(section_onsets_data)
            current_time_offset += scaled_section_duration

        last_event_end_time = 0
        if full_sequence:
            last_event = full_sequence[-1]
            last_event_end_time = last_event['time'] + last_event['params']['durata_totale']

        total_calculated_duration = max(current_time_offset, last_event_end_time)
        num_voce_events = len([e for e in full_sequence if e.get('type') == 'voce'])
        print(f"\n✓ Elaborazione completata. Generati {num_voce_events} eventi 'voce' totali.")
        print(f"  > Durata totale calcolata per questa parte: {total_calculated_duration:.2f} secondi.")
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici a tabelle Csound.")

        # RESTITUISCI LA DURATA CALCOLATA
        return full_sequence, all_onsets_flat, onsets_by_section, total_calculated_duration

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

                    """
                    columns = [
                        ("instr", 'i "Voce"', 8),
                        ("start", event_time, 8),
                        ("dur", p["durata_totale"], 8),
                        ("rit_tab", p["ritmi_tab_num"], 9),
                        ("dur_arm", p["durata_armonica"], 9),
                        ("dyn_idx", p["dynamic_index"], 9),
                        ("ott_S", p["ottava"], 7),
                        ("reg_S", p["registro"], 7),
                        ("ott_E", p["ottava_arrivo"], 7),
                        ("reg_E", p["registro_arrivo"], 7),
                        ("pos_tab", p["pos_tab_num"], 9),
                        ("id_comp", p["id_comp"], 9),
                        ("nlin_mode", p["nonlinear_mode"], 11),
                        ("mov_sense", p["senso_movimento"], 11),
                        ("ifn_att", p["ifn_attacco"], 9),
                        ("ifn_sec_env", p.get("section_env_table_num", 0), 13),
                        ("sec_start", p.get("section_start_time", 0), 11),
                        ("sec_dur", p.get("section_duration", 0), 9),
                        ("leeway", p.get("layer_leeway", 0), 8),
                    ]

                    # 2. Generazione dinamica delle intestazioni (header)
                    #    Questa logica è intelligente e può essere usata solo una volta
                    #    per scrivere l'header all'inizio dello score.
                    #    Per semplicità qui la genero per ogni nota, ma si può ottimizzare.
                    header1_parts = []
                    header2_parts = []
                    for i, (name, value, width) in enumerate(columns):
                        header1_parts.append(f"{name:<{width-1}}")
                        if name != "instr":
                            # Allinea il p-number all'interno dello spazio disponibile
                            header2_parts.append(f"p{i:<{width-1}}") 
                        else:
                            header2_parts.append(f"{'':<{width-1}}") # Spazio vuoto per la colonna 'instr'

                    # Unisci le parti con un separatore per leggibilità
                    score_lines += "; p-fields:  " + " | ".join(header1_parts) + "\n"
                    score_lines += "; p-num:     " + " | ".join(header2_parts) + "\n"


                    # 3. Costruzione della riga di dati formattata
                    row_pieces = []
                    for name, value, width in columns:
                        # Applica formattazioni specifiche in base al nome o al tipo
                        if name in ["start", "sec_start"]:
                            formatted_value = f"{value:<{width}.4f}"
                        elif name in ["dur", "dur_arm", "sec_dur", "leeway"]:
                            formatted_value = f"{value:<{width}.3f}"
                        elif isinstance(value, float):
                            formatted_value = f"{value:<{width}.2f}"
                        elif name == "instr":
                            # Gestisce le virgolette per il nome dello strumento
                            formatted_value = f'{value:<{width}}'
                        else: # Interi e stringhe
                            formatted_value = f"{str(value):<{width}}"
                        
                        row_pieces.append(formatted_value)
                    
                    # Unisci tutti i pezzi per formare la riga di score finale
                    score_lines += " ".join(row_pieces) + "\n"
                """

                # Commento dettagliato che documenta ogni p-field
                #score_lines += ("; p-fields:  instr     | start | dur   | rit_tab | dur_arm | dyn_idx | ott_S | reg_S | ott_E | reg_E | pos_tab | id_comp | nlin_mode | mov_sense | ifn_att | ifn_sec_env | sec_start | sec_dur | leeway\n"
                #                "; p-num:     p1        | p2    | p3    | p4      | p5      | p6      | p7    | p8    | p9    | p10   | p11     | p12     | p13       | p14       | p15     | p16         | p17       | p18     | p19\n")

                score_lines += ";\t\t\tat\t\t\tdur\t\ttab\t\tarmonica\tdinamica\tottava\tregistro\tnew_ottava\tnew_registro\tpos\t\tid_comp\tnonlinearMode\tmovimento\tifn_attacco\tenv_sezione\tsez_attacco\tsez_durata\tsez_leeway\t safety_buffer\n"
                score_lines += (f'i "Voce"\t{event_time:.4f}\t{p["durata_totale"]:.3f}\t'
                                f'{p["ritmi_tab_num"]}\t{p["durata_armonica"]:.3f}\t\t{p["dynamic_index"]:.6f}\t'
                                f'{p["ottava"]}\t\t{p["registro"]}\t\t\t'
                                f'{p["ottava_arrivo"]}\t\t{p["registro_arrivo"]}\t\t'
                                f'{p["pos_tab_num"]}\t{p["id_comp"]}\t\t{p["nonlinear_mode"]}'
                                f'\t\t\t\t{p["senso_movimento"]}\t\t\t{p["ifn_attacco"]}\t\t\t{p.get("section_env_table_num", 0)}'
                                f'\t\t\t{p.get("section_start_time", 0):.4f}\t\t{p.get("section_duration", 0):.3f}'
                                f'\t\t{p.get("layer_leeway", 0):.3f}\t\t{p.get("usa_safety_buffer", True):d}\n')
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

gi_debug init 1

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/initIsoAmp.orc"
#include "../includes/eventoSonoro.orc"
#include "../includes/voce.orc"

instr time
    ktime times
    if gi_debug > 1 then
    printk 1,ktime
    endif
endin

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

i "time" 0 {durata_totale}
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
    def _plot_tendency_masks(self, ax_pitch, ax_dur, ax_dyn, composition_structure, composer, onsets_by_section):
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

        for section_idx, section in enumerate(composition_structure):
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_duration = section['durata'] * time_ratio
            layers_to_process = section.get('layers', [section])
            # Accediamo ai dati degli onsets per questa sezione
            section_onsets = onsets_by_section[section_idx]['layers']

            for layer_idx, layer in enumerate(layers_to_process):
                layer_name = layer.get('nome_layer', f"Layer {layer_idx+1}")
                layer_onsets = section_onsets[layer_idx]['onsets']
                
                if layer_name not in layer_colors:
                    layer_colors[layer_name] = color_cycle[len(layer_colors) % len(color_cycle)]
                layer_color = layer_colors[layer_name]

                if 'stato_unico' in layer:
                    start_mask = composer._normalize_mask(layer['stato_unico'])
                    end_mask = start_mask
                elif 'stato_iniziale' in layer:
                    start_mask = composer._normalize_mask(layer['stato_iniziale'])
                    end_mask = composer._normalize_mask(layer.get('stato_finale', layer['stato_iniziale']))
                else:
                    continue

                # Se non ci sono onsets, non c'è nulla da disegnare.
                if not layer_onsets:
                    continue

                # Estrarre il lifespan del layer (default: tutta la sezione)
                lifespan = layer.get('lifespan', [0.0, 1.0])
                start_ratio, end_ratio = lifespan
                # Calcolare la durata e il tempo di inizio ASSOLUTI per la maschera di questo layer
                layer_plot_start_time = section_start_time + (start_ratio * scaled_duration)
                layer_plot_duration = (end_ratio - start_ratio) * scaled_duration

                # 3. Trova il primo e l'ultimo tempo di attivazione
                first_onset_time = min(layer_onsets)
                last_onset_time = max(layer_onsets)

                # Se primo e ultimo onset coincidono (un solo cluster), crea un piccolo intervallo visibile
                plot_duration = last_onset_time - first_onset_time
                if plot_duration < 0.1: # Durata minima per la visualizzazione
                    plot_duration = layer_plot_duration

                # Se la durata è nulla o negativa, non c'è nulla da disegnare per questo layer.
                if layer_plot_duration <= 0:
                    continue

                num_samples = 100
                # Creare l'array dei tempi corretto, che copre solo il lifespan del layer.
                times = np.linspace(first_onset_time, first_onset_time + plot_duration, num_samples)
                
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
                        
    def plot_piano_roll(self, events, all_onsets, composition_name, composition_structure, composer, onsets_by_section, title=None):
        """
        MODIFICATA: Crea un grafico a due subplot...
        """
        # Cambiamo il messaggio di log per essere più generico
        print(f"\n--- Generazione Grafico: '{composition_name}' ---")
        if not events:
            print("Nessun evento da visualizzare.")
            return

        # ... (il codice da qui in poi rimane per lo più uguale) ...
        plot_data = []
        max_time = 0
        max_durata_armonica = 0

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
        
        # --- ECCO LA MODIFICA CHIAVE ---
        # Se un titolo personalizzato è stato fornito, usalo.
        # Altrimenti, crea il titolo di default.
        if title:
            fig.suptitle(title, fontsize=16)
        else:
            fig.suptitle(f"Visualizzazione Composizione e Maschere di Tendenza: '{composition_name}'", fontsize=16)

        # ... (TUTTO IL RESTO DELLA FUNZIONE RIMANE IDENTICO A PRIMA) ...
        
        ax_dur = ax_pitch.twinx()

        for item in plot_data:
            ax_pitch.add_patch(plt.Rectangle(
                (item['start'], item['pitch'] - 0.04), item['duration'], 0.08,
                color=plt.cm.viridis(item['amp_norm']), alpha=0.6, zorder=3
            ))

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

        self._plot_tendency_masks(ax_pitch, ax_dur, ax_dyn, composition_structure, composer,onsets_by_section)

        current_time = 0.0
        section_labels_added = set()
        for section in composition_structure:
            time_ratio = section.get('ratio_temporale', 1.0)
            scaled_duration = section['durata'] * time_ratio
            
            # **NOTA IMPORTANTE:**
            # Poiché ora il plot completo passa una structure aggregata,
            # current_time deve essere calcolato in modo diverso per il plot completo.
            # Questa logica di calcolo di current_time funzionerà bene per i plot
            # delle singole parti, ma per quello completo potrebbe mostrare le linee
            # di sezione "riavvolte". Per ora, questa è una semplificazione accettabile.
            current_time += scaled_duration
            
            label_text = f"Fine: {section['nome_sezione']}" if section['nome_sezione'] not in section_labels_added else ""
            ax_pitch.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2, label=label_text)
            ax_dyn.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2)
            section_labels_added.add(section['nome_sezione'])

        handles, labels = ax_pitch.get_legend_handles_labels()
        handles_dur, labels_dur = ax_dur.get_legend_handles_labels()
        handles_dyn, labels_dyn = ax_dyn.get_legend_handles_labels()
        
        fig.legend(handles + handles_dur + handles_dyn, labels + labels_dur + labels_dyn,
                   loc='lower center', bbox_to_anchor=(0.5, -0.01), ncol=6, fontsize='small')

        fig.tight_layout(rect=[0, 0.05, 1, 0.95])
        
        plot_filename = self.output_path / f"{composition_name}_visual.png"
        plt.savefig(plot_filename, dpi=150, bbox_inches='tight')
        plt.close()
        print(f"✓ Grafico di visualizzazione salvato in: {plot_filename}")


def generate_silent_wav(output_wav_path, duration):
    """
    Genera un file WAV di silenzio digitale della durata specificata usando Csound.
    """
    # Assicurati che la directory di output esista
    output_wav_path.parent.mkdir(exist_ok=True, parents=True)

    # Il CSD più semplice possibile per creare un file di una certa durata
    csd_content = f"""
<CsoundSynthesizer>
<CsOptions>
-o "{output_wav_path}" -W -d
</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 32
nchnls = 2
0dbfs = 1
</CsInstruments>
<CsScore>
f 0 {duration} ; Imposta la durata totale del file
e
</CsScore>
</CsoundSynthesizer>
"""
    # Usa un percorso temporaneo per il file CSD
    temp_csd_path = output_wav_path.parent / f"__{output_wav_path.stem}_silent_gen.csd"
    try:
        with open(temp_csd_path, 'w') as f:
            f.write(csd_content)        
        # Dentro generate_silent_wav
        subprocess.run(['csound', '--format=float', str(temp_csd_path)], check=True, capture_output=True)
        print(f"   ✓ Generato WAV silenzioso di {duration:.2f}s: {output_wav_path.name}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"   ✗ ERRORE: Creazione del WAV silenzioso per '{output_wav_path.name}' fallita.")
        print(e.stderr)
        return False
    except Exception as e:
        print(f"   ✗ ERRORE INATTESO durante la generazione del WAV silenzioso: {e}")
        return False
    finally:
        # Pulisci il file CSD temporaneo
        if temp_csd_path.exists():
            temp_csd_path.unlink()

if __name__ == "__main__":
    # ===================================================================
    RENDER_AUTOMATICAMENTE = True
    APRI_FILE_DOPO_RENDER = True
    # ===================================================================

    if len(sys.argv) < 2:
        print("ERRORE: Devi specificare il percorso del file YAML della composizione.")
        sys.exit(1)
    
    yaml_file_path = sys.argv[1]
    all_composition_structures = load_all_compositions_from_yaml(yaml_file_path)
    base_composition_name = Path(yaml_file_path).stem
    
    csound_processes = []
    assembly_data = []

    # Dati aggregati per il plot completo
    full_composition_events = []
    full_composition_structures = []
    full_composition_onsets_by_section = []
    full_composition_onsets_flat = []

    # Rilevamento "Veteran Mode"
    veteran_mode_active = False
    parts_to_process_indices = []
    for i, comp_struct in enumerate(all_composition_structures):
        if comp_struct and isinstance(comp_struct[0], dict) and comp_struct[0].get('veteranMode', False):
            veteran_mode_active = True
            parts_to_process_indices.append(i)

    if veteran_mode_active:
        print("\n" + "="*30 + " M O D A L I T À   V E T E R A N   A T T I V A " + "="*30)
        print("Verranno ricalcolate solo le parti con 'veteranMode: true'. Le altre verranno riutilizzate.")
    else:
        parts_to_process_indices = list(range(len(all_composition_structures)))

    print("\n--- FASE 1: Analisi Parti, Generazione CSD e Grafici Individuali ---")
    current_onset_time = 0.0

    # 1. LOOP DI ANALISI E GENERAZIONE (SEQUENZIALE) - LOGICA RISTRUTTURATA
    for i, composition_structure in enumerate(all_composition_structures):
        part_name = f"{base_composition_name}_part_{i+1}"
        wav_path_for_part = Path("composizioni_generate") / "wav" / f"{part_name}.wav"
        
        duration_for_next_onset = 0.0

        # Calcola sempre la durata strutturale, ci servirà come fallback
        structural_duration = sum(s.get('durata', 0) * s.get('ratio_temporale', 1.0) for s in composition_structure)
        print(f'for {part_name} abbiamo durata {structural_duration}\n')

        # Determina se la parte è silenziosa
        is_silent_part = all(section.get('num_attivazioni', -1) == 0 for section in composition_structure) if composition_structure else False

        # Determina se la parte deve essere processata o skippata
        should_process = i in parts_to_process_indices
        
        # --- LOGICA DECISIONALE CHIARA ---
        
        if is_silent_part:
            print(f"\n{'='*80}")
            print(f"RILEVATA PARTE SILENZIOSA: '{part_name}' (Pausa di {structural_duration:.2f}s)")
            print(f"{'='*80}")
            if RENDER_AUTOMATICAMENTE:
                generate_silent_wav(wav_path_for_part, structural_duration)
            duration_for_next_onset = structural_duration

        elif should_process:
            print(f"\n{'='*80}")
            print(f"ELABORAZIONE PARTE: '{part_name}' (Onset programmato: {current_onset_time:.2f}s)")
            print(f"{'='*80}")

            composer = GenerativeComposer()
            debugger = CompositionDebugger(composer.output_path)
        
            event_sequence, all_onsets, onsets_by_section, precise_part_duration = composer.process_composition(composition_structure)
            
            if not event_sequence:
                print(f"ATTENZIONE: Nessun evento generato per '{part_name}'. La parte avrà durata 0.")
                duration_for_next_onset = 0.0
            else:
                duration_for_next_onset = precise_part_duration
                debugger.plot_piano_roll(event_sequence, all_onsets, part_name, composition_structure, composer, onsets_by_section)
                csd_file_path, _ = composer.generate_csd(part_name, event_sequence)
            
                # Aggregazione dati per il plot completo
                for event in event_sequence:
                    event['time'] += current_onset_time
                full_composition_events.extend(event_sequence)
                for onset in all_onsets:
                    full_composition_onsets_flat.append(onset + current_onset_time)
                full_composition_structures.extend(composition_structure)
                for section_data in onsets_by_section:
                    for layer_onset_data in section_data['layers']:
                        layer_onset_data['onsets'] = [t + current_onset_time for t in layer_onset_data['onsets']]
                    full_composition_onsets_by_section.append(section_data)
                
                # Aggiunta alla coda di rendering
                if RENDER_AUTOMATICAMENTE:
                    log_file_path = csd_file_path.parent / f"csound_render_{part_name}.log"
                    print(f" > Aggiunto '{part_name}' alla coda di rendering parallelo.")
                    try:
                        log_file = open(log_file_path, 'w')
                        process = subprocess.Popen(['csound', '--format=float', str(csd_file_path)], stdout=log_file, stderr=log_file)
                        csound_processes.append((process, part_name, log_file))
                    except Exception as e:
                        print(f"ERRORE nel lanciare Csound per {part_name}: {e}")
        else: # La parte non è silenziosa e non deve essere processata (skip in veteran mode)
            print(f"\n- SKIP PARTE: '{part_name}' (Onset: {current_onset_time:.2f}s). Uso WAV esistente.")
            # La durata della parte skippata è quella strutturale
            composer = GenerativeComposer()
            debugger = CompositionDebugger(composer.output_path)
            _, _, _, precise_part_duration = composer.process_composition(composition_structure)
            duration_for_next_onset = precise_part_duration
        
        # Aggiungi i dati per l'assemblaggio con l'onset attuale (PRIMA dell'incremento)
        assembly_data.append({'wav_path': wav_path_for_part, 'onset': current_onset_time})
        
        # Aggiorna l'orologio globale per la *prossima* parte.
        print(f"   > Durata di questa parte: {duration_for_next_onset:.2f}s. Prossimo onset sarà a: {current_onset_time + duration_for_next_onset:.2f}s")
        current_onset_time += duration_for_next_onset


    # Il resto del codice da qui in poi è corretto e non necessita modifiche.
    
    # 2. FASE DI ATTESA PARALLELA
    if RENDER_AUTOMATICAMENTE and csound_processes:
        print("\n--- FASE 2: Attesa Completamento Rendering Paralleli ---")
        success = True
        for process, name, log_file in csound_processes:
            print(f" > In attesa di '{name}'...")
            process.wait()
            log_file.close()
            if process.returncode == 0:
                print(f"   ✓ '{name}' completato con successo.")
            else:
                print(f"   ✗ ERRORE: Rendering di '{name}' fallito (codice: {process.returncode}). Controlla il log.")
                success = False
        if not success:
            print("\nCi sono stati errori nei rendering. Assemblaggio finale annullato.")
            sys.exit(1)

    # 3. PLOT FINALE COMPLETO
    if not veteran_mode_active and full_composition_events:
        print("\n--- FASE 3: Generazione Grafico Completo della Composizione ---")
        if full_composition_events:
            final_composer = GenerativeComposer()
            final_debugger = CompositionDebugger(final_composer.output_path)
            final_title = f"Visualizzazione Completa: '{base_composition_name}'"
            final_debugger.plot_piano_roll(
                full_composition_events,
                full_composition_onsets_flat,
                base_composition_name + "_complete",
                full_composition_structures,
                final_composer,
                full_composition_onsets_by_section,
                title=final_title
            )
    elif veteran_mode_active:
        print("\n--- FASE 3: Generazione Grafico Completo saltata (Veteran Mode attivo) ---")

    # 4. FASE DI ASSEMBLAGGIO FINALE
    if assembly_data:
        print("\n--- FASE 4: Assemblaggio Finale ---")
        score_lines = ""
        for part in assembly_data:
            score_lines += f'i "orchestrator" {part["onset"]:.4f} [60*8-{part["onset"]:.4f}] "{part["wav_path"]}"\n'

        output_dir = Path("composizioni_generate")
        assembler_csd_path = output_dir / f"{base_composition_name}_assembler.csd"
        final_wav_path = output_dir / "wav" / f"{base_composition_name}_complete.wav"

        template = """
<CsoundSynthesizer>
<CsOptions>
-o "{final_wav_path}" -W -d -m0
</CsOptions>
<CsInstruments>
sr=96000
ksmps=32
nchnls=2
0dbfs=1
instr orchestrator
    S_file strget p4
    i_dur filelen S_file
    prints "i_dur: %f\\tfor %s\\n",i_dur, S_file
    schedule "playFile", 0, i_dur, S_file
endin
instr playFile
    a_L, a_R diskin2 p4, 1
    outs a_L, a_R
endin
</CsInstruments>
<CsScore>
{score_lines}
e
</CsScore>
</CsoundSynthesizer>
"""
        csd_content = template.format(final_wav_path=final_wav_path, score_lines=score_lines)
        with open(assembler_csd_path, 'w') as f: f.write(csd_content)

        print(f"✓ CSD di assemblaggio creato: {assembler_csd_path}")
        print("--- Avvio rendering di assemblaggio... ---")

        log_file_path = output_dir / f"csound_render_{base_composition_name}_assembler.log"
        log_file = None
        try:
            log_file = open(log_file_path, 'w')
            print(f"   (Log di rendering verrà salvato in: {log_file_path})")
            process = subprocess.Popen(['csound', '--format=float', str(assembler_csd_path)], stdout=log_file, stderr=log_file)
            process.wait()
            if process.returncode == 0:
                print(f"\n✓✓✓ COMPOSIZIONE FINALE COMPLETATA: {final_wav_path} ✓✓✓")
                if APRI_FILE_DOPO_RENDER:
                    print("Apertura del file audio completo...")
                    open_command = 'open' if sys.platform == 'darwin' else 'xdg-open' if sys.platform.startswith('linux') else 'start'
                    subprocess.run([open_command, str(final_wav_path)], check=True)
            else:
                print(f"\n✗ ERRORE CRITICO durante l'assemblaggio (codice: {process.returncode}).")
                print(f"   Per i dettagli, consultare il file di log: {log_file_path}")
        except Exception as e:
            print(f"ERRORE INATTESO durante l'esecuzione dell'assemblaggio: {e}")
        finally:
            if log_file:
                log_file.close()

