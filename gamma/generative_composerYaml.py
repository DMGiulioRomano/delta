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

# --- Costanti tecniche derivate da validator.udo ---
OTTAVE_RANGE = (0, 10)
REGISTRI_RANGE = (1, 10)


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
        if num_events == 1: return [duration / 2.0]

        base_progress = np.linspace(0, 1, num_events, endpoint=False) # Endpoint False per evitare un evento a durata esatta

        if model['type'] == 'accelerando':
            shape = model.get('shape', 2.0)
            final_progress = base_progress ** shape
        elif model['type'] == 'ritardando':
            shape = model.get('shape', 2.0) # La forma > 1.0 rallenta se invertita
            final_progress = 1 - (1 - base_progress) ** shape
        elif model['type'] == 'stochastic':
            final_progress = np.sort(np.random.rand(num_events))
        else: # Default a lineare
            final_progress = base_progress
            
        return final_progress * duration

class GenerativeComposer:
    """Classe principale che orchestra la generazione della composizione."""

    def __init__(self, output_dir="composizioni_generate"):
        self.base_path = Path(__file__).parent
        self.output_path = self.base_path / output_dir
        self.output_path.mkdir(exist_ok=True)
        
        self.time_scheduler = TimeScheduler()
        
        # Mappa per le tabelle di Csound. Verrà popolata dinamicamente.
        self.rhythm_table_map = {}
        self.next_table_id = 1000
        
        self.id_comp_counter = 0

# In generative_composerYaml.py -> class GenerativeComposer

    def _valida_parametri(self, params):
        """
        Valida un set di parametri generati per assicurarsi che siano
        tecnicamente validi per il motore Csound.
        """
        # ... (la validazione dell'ampiezza rimane identica)
        ott, reg, amp = params.get('ottava', 5), params.get('registro', 5), params.get('ampiezza_db', -12)
        max_amp = -6
        if ott > 0:
            if ott <= 3:
                slope = (-12 - (-6)) / 2
                max_amp = -6 + slope * (ott - 1) - (reg - 1) * 0.3
            else:
                progress = (ott - 3) / 7
                smooth_progress = (1 - np.cos(progress * np.pi)) / 2
                base_amp = -12 + (-25 - (-12)) * smooth_progress
                reg_influence = (reg - 1) * 0.2
                max_amp = min(base_amp - reg_influence, -12)
        if amp > max_amp:
            return False
            
        # --- INIZIO NUOVA LOGICA DI VALIDAZIONE DURATA ---
        
        # 1. Controlliamo che i ritmi siano validi
        if not params.get('ritmi') or not any(r > 0 for r in params['ritmi']):
            return False # Se la lista è vuota o contiene solo zeri, non è valida

        # 2. Troviamo il ritmo più grande (il più lento)
        #    Usiamo max() perché un ritmo grande (es. 20) corrisponde a un impulso breve (1/20),
        #    ma qui ci interessa il "passo" del ciclo while in Csound.
        #    La logica originale era errata, il problema non è il ritmo più piccolo ma la relazione generale.
        #    Ripristiniamo una versione migliorata della logica originale.
        max_ritmo_val = max(params['ritmi'])
        if max_ritmo_val == 0: return False # Evita divisione per zero
        
        # Durata del singolo passo nel ciclo while di Csound
        step_duration = params['durata_armonica'] / max_ritmo_val
        
        # La durata totale deve essere almeno lunga quanto un passo, più un piccolo margine.
        if params['durata_totale'] < step_duration:
            # print(f"DEBUG: Validazione fallita per durata. Durata totale {params['durata_totale']:.2f} < un passo {step_duration:.2f}")
            return False
            
        # --- FINE NUOVA LOGICA DI VALIDAZIONE DURATA ---

        return True
    
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
        Il cuore del generatore. Prende una maschera e produce un set di
        parametri concreti e validi.
        """
        params = {}

        # Itera su ogni parametro definito nella maschera
        for key, p_mask in mask.items():
            if key in ['choices', 'weights','attenuazione_ottava']: continue # Proprietà, non parametri
            
            val = 0
            if 'range' in p_mask:
                # Caso 1: Distribuzione Uniforme
                min_val, max_val = p_mask['range']
                # Controlla se i limiti sono interi per generare un intero
                if isinstance(min_val, int) and isinstance(max_val, int):
                    val = random.randint(min_val, max_val)
                else:
                    val = random.uniform(min_val, max_val)
            elif 'mean' in p_mask and 'std' in p_mask:
                # Caso 2: Distribuzione Normale
                mean = p_mask['mean']
                std = p_mask['std']
                val = np.random.normal(loc=mean, scale=std)
            elif 'choices' in p_mask:
                # Caso 3: Scelta Pesata
                val = random.choices(p_mask['choices'], weights=p_mask.get('weights'), k=1)[0]
            
            params[key] = val

        # Clipping per garantire che i valori rimangano nei limiti tecnici
        params['ottava'] = int(np.clip(params.get('ottava', 5), OTTAVE_RANGE[0], OTTAVE_RANGE[1]))
        params['registro'] = int(np.clip(params.get('registro', 5), REGISTRI_RANGE[0], REGISTRI_RANGE[1]))

        # Generazione derivata
        params['ritmi'] = self._generate_rhythm_pattern(params['tipo_ritmi'])
        params['posizioni'] = [i % r for i, r in enumerate(params['ritmi']) if r > 0]
        moltiplicatore = random.choice([1, 1.25, 1.6])
        params['durata_totale'] = params['durata_armonica'] * moltiplicatore

        config_attenuazione = mask.get('attenuazione_ottava', {})
        
        # Prendi i valori dalla configurazione o usa i default che hai proposto.
        ottava_min_attenuazione = config_attenuazione.get('range_ottava', [5, 7])[0]
        ottava_max_attenuazione = config_attenuazione.get('range_ottava', [5, 7])[1]
        valore_attenuazione_db = config_attenuazione.get('valore_db', -10.0)

        # 2. Applica la logica di attenuazione.
        # Controlla se il valore di 'ottava' generato per questo evento
        # rientra nel range specificato.
        if ottava_min_attenuazione <= params['ottava'] <= ottava_max_attenuazione:
            # Se sì, sottrai il valore di attenuazione dall'ampiezza già generata.
            # Usiamo .get() anche qui per sicurezza, nel caso 'ampiezza_db' non fosse stata generata.
            ampiezza_originale = params.get('ampiezza_db', 0)
            params['ampiezza_db'] = ampiezza_originale + valore_attenuazione_db # Sommiamo un valore negativo
            
            # (Opzionale) Aggiungiamo un print per il debugging, che puoi commentare in seguito
            # print(f"DEBUG: Ottava {params['ottava']} nel range. Attenuazione applicata. Amp: {ampiezza_originale:.1f} -> {params['ampiezza_db']:.1f} dB")

        self.id_comp_counter += 1
        params['id_comp'] = self.id_comp_counter

        return params

    def _interpolate_mask(self, start_mask, end_mask, progress):
        """Interpola tra due maschere per ottenere una maschera intermedia."""
        interp_mask = {}
        for key in start_mask:
            s = start_mask[key]
            e = end_mask[key]
            interp_mask[key] = {}

            if 'range' in s:
                s_min, s_max = s['range']
                e_min, e_max = e['range']
                i_min = s_min + (e_min - s_min) * progress
                i_max = s_max + (e_max - s_max) * progress
                interp_mask[key]['range'] = [i_min, i_max]
                if 'distribution' in s:
                    interp_mask[key]['distribution'] = s['distribution']
            elif 'choices' in s:
                 # Per le scelte pesate, la transizione è un "cross-fade" dei pesi
                s_weights = np.array(s.get('weights', [1]*len(s['choices'])))
                e_weights = np.array(e.get('weights', [1]*len(e['choices'])))
                i_weights = s_weights * (1 - progress) + e_weights * progress
                interp_mask[key] = {'choices': s['choices'], 'weights': i_weights.tolist()}
        return interp_mask

    def process_composition(self, composition_structure):
        """Elabora l'intera struttura della composizione, generando la sequenza di eventi."""
        full_sequence = []
        current_time_offset = 0.0
        all_onsets = []  # <-- 1. INIZIALIZZA LA LISTA VUOTA
        tendency_ranges = [] # <-- 1. INIZIALIZZA LA NUOVA LISTA
        
        print("Inizio elaborazione della composizione...")
        for i, section in enumerate(composition_structure):
            time_ratio = section.get('ratio_temporale', 1.0)
            # Calcola la durata effettiva (scalata) della sezione
            scaled_section_duration = section['durata'] * time_ratio
            print(f"\n--- Sezione {i+1}: '{section['nome_sezione']}' (Durata: {section['durata']}s, Ratio: {time_ratio}x, Effettiva: {scaled_section_duration:.2f}s) ---")
            section_end_time = current_time_offset + scaled_section_duration # Calcoliamolo una volta per sezione
            
            # Controlla se la sezione è statica o dinamica
            is_static_section = 'stato_unico' in section
            print(f"  > Tipo sezione: {'Statica (stato_unico)' if is_static_section else 'Dinamica (interpolata)'}")

            if not is_static_section:
                # Se è una sezione dinamica, carica stato iniziale e finale come prima
                start_mask = section.get('stato_iniziale')
                end_mask = section.get('stato_finale')
                if not start_mask or not end_mask:
                    print(f"ATTENZIONE: La sezione '{section['nome_sezione']}' è dinamica ma manca stato_iniziale o stato_finale. Sezione saltata.")
                    continue # Salta al prossimo ciclo della sezione

            # 1. Calcola il "cuscinetto di sicurezza" (safety buffer)
            mask_for_buffer = section.get('stato_finale', section.get('stato_unico'))
            if not mask_for_buffer:
                print(f"  > ATTENZIONE: Maschera non trovata. Impossibile calcolare safeguard.")
                safety_buffer = 5.0 # Fallback
            else:
                max_harmonic_dur_unscaled = mask_for_buffer['durata_armonica']['range'][1]
                max_harmonic_dur_scaled = max_harmonic_dur_unscaled * time_ratio
                max_duration_multiplier = 1.6 
                safety_buffer = max_harmonic_dur_scaled * max_duration_multiplier
            
            print(f"  > Cuscinetto di sicurezza calcolato: {safety_buffer:.2f}s.")
            
            # 2. Definisci la zona sicura per la generazione degli onset
            generation_duration = scaled_section_duration - safety_buffer
            num_attivazioni_richieste = section.get('num_attivazioni', 10)

            cluster_onsets = []
            if num_attivazioni_richieste == 1:
                cluster_onsets = [0.0]
            elif generation_duration > 0:
                cluster_onsets = self.time_scheduler.generate_onsets(
                    section['timing_model'], generation_duration, num_attivazioni_richieste
                )
            else:
                print(f"  > ATTENZIONE: Cuscinetto ({safety_buffer:.2f}s) >= durata sezione. Nessun evento generato.")

            print(f"  > Generati {len(cluster_onsets)} onset nella zona sicura.")
            all_onsets.extend([o + current_time_offset for o in cluster_onsets])
            
            # La logica del jitter di fine sezione la spostiamo DENTRO il ciclo degli eventi,
            # perché non influenza più la generazione degli onset.


            # 2. Per ogni punto di attivazione, genera un cluster di eventi
            for onset in cluster_onsets:
                if is_static_section:
                    # Se la sezione è statica, la maschera è sempre la stessa
                    center_mask = section['stato_unico']
                else:
                    # Il progresso viene calcolato sulla durata di generazione, non su quella totale della sezione.
                    # Questo assicura che il progress raggiunga 1.0 quando l'ultimo onset viene generato.
                    progress = onset / generation_duration if generation_duration > 0 else 0
                    
                    # Aggiungiamo una piccola sicurezza per evitare che, per errori di approssimazione,
                    # il progresso superi 1.0.
                    progress = min(progress, 1.0) 
                    
                    center_mask = self._interpolate_mask(start_mask, end_mask, progress)                
                # Interpola le maschere per ottenere quella per l'istante corrente
                absolute_onset_time = current_time_offset + onset
                # Dizionario per contenere i dati di questo onset
                tendency_data = {'time': absolute_onset_time}
                                

                # Cattura dati 'ottava'
                if 'ottava' in center_mask:
                    ottava_mask = center_mask['ottava']
                    if 'range' in ottava_mask:
                        tendency_data['ottava'] = {'min': ottava_mask['range'][0], 'max': ottava_mask['range'][1]}
                    elif 'mean' in ottava_mask and 'std' in ottava_mask:
                        # Per la distribuzione normale, visualizziamo un range statistico (es. mean ± 2*std)
                        mean, std = ottava_mask['mean'], ottava_mask['std']
                        tendency_data['ottava'] = {'min': mean - 2 * std, 'max': mean + 2 * std}

                # Cattura dati 'durata_armonica'
                if 'durata_armonica' in center_mask and 'range' in center_mask['durata_armonica']:
                    scaled_range = [val * time_ratio for val in center_mask['durata_armonica']['range']]
                    tendency_data['durata_armonica'] = {'min': scaled_range[0], 'max': scaled_range[1]}

                
                tendency_ranges.append(tendency_data)
 
 
                # Determina quanti eventi generare in questo cluster
                dens_range = center_mask['densita_cluster']['range']
                num_events_in_cluster = random.randint(int(dens_range[0]), int(dens_range[1]))
                
                # 3. Genera gli eventi effettivi del cluster
                for _ in range(num_events_in_cluster):
                    
                    # Genera un set di parametri, con un massimo di tentativi
                    for attempt in range(10): # Tenta max 10 volte di trovare parametri validi
                        
                        # Perturba leggermente la maschera per lo "spread" spettrale
                        event_mask = center_mask.copy()

                        if 'durata_armonica' in event_mask and 'range' in event_mask['durata_armonica']:
                            event_mask['durata_armonica'] = event_mask['durata_armonica'].copy()
                            current_range = event_mask['durata_armonica']['range']
                            event_mask['durata_armonica']['range'] = [val * time_ratio for val in current_range]
                        
                        params = self._generate_params_from_mask(event_mask)
                        
                        if self._valida_parametri(params):                            # Mappa il ritmo a una tabella Csound
                            # 1. Calcoliamo il tempo di attacco effettivo dell'evento
                            onset_jitter = np.random.normal(loc=0.0, scale=0.05)
                            event_time = current_time_offset + onset + onset_jitter

                            # 2. Controlliamo se l'evento sfora la fine della sezione
                            expected_end_time = event_time + params['durata_totale']
                            if expected_end_time > section_end_time:
                                # L'evento sfora. Controlliamo se è un errore recuperabile.
                                
                                # 2a. Check fatale: la sola durata armonica sfora?
                                harmonic_end_time = event_time + params['durata_armonica']
                                if harmonic_end_time > section_end_time:
                                    # ERRORE CRITICO: Impossibile schedulare, neanche la durata base ci sta.
                                    # Questo indica un problema nel YAML (es. durate troppo lunghe per la sezione)
                                    # o un jitter troppo grande. Scartiamo questo tentativo e proviamo a generarne un altro.
                                    # print(f"ATTENZIONE CRITICA: Evento scartato. La durata armonica ({params['durata_armonica']:.2f}s) sfora la sezione che finisce a {section_end_time:.2f}s. (Tentativo {attempt+1}/10)")
                                    continue # Passa al prossimo tentativo nel `for attempt...` loop
                                
                                # 2b. Recupero: la durata armonica ci sta. Tronchiamo la durata totale.
                                else:
                                    old_dur = params['durata_totale']
                                    new_dur = section_end_time - event_time
                                    # Assicuriamoci che la nuova durata non sia inferiore a quella armonica
                                    params['durata_totale'] = max(new_dur, params['durata_armonica'])
                                    # print(f"INFO: Durata evento troncata. Da {old_dur:.2f}s a {params['durata_totale']:.2f}s per rientrare nella sezione.")

                            rhythm_tuple = tuple(params['ritmi'])
                            if rhythm_tuple not in self.rhythm_table_map:
                                self.rhythm_table_map[rhythm_tuple] = {
                                    'ritmi_tab_num': self.next_table_id,
                                    'pos_tab_num': self.next_table_id + 1
                                }
                                self.next_table_id += 2

                            # 3. La durata del comportamento ora è il MINIMO tra la sua durata "naturale" 
                            #    e la durata massima consentita dallo spazio rimanente nella sezione.
                            
                            params['ritmi_tab_num'] = self.rhythm_table_map[rhythm_tuple]['ritmi_tab_num']
                            params['pos_tab_num'] = self.rhythm_table_map[rhythm_tuple]['pos_tab_num']
                            params['section_start_time'] = current_time_offset
                            params['section_duration'] = scaled_section_duration
                            params['section_jitter'] = section.get('end_of_section_jitter', 0.0)

                            # Schedula l'evento (con il suo jitter di posizionamento)
                            onset_jitter = np.random.normal(loc=0.0, scale=0.05)
                            event_time = current_time_offset + onset + onset_jitter
                            
                            full_sequence.append({'time': event_time, 'params': params})
                            break # Parametri validi trovati, esci dal ciclo dei tentativi
                    else:
                        # Questo `else` si attiva se il `for` dei tentativi finisce senza `break`
                        # print(f"Attenzione: Impossibile generare parametri validi per un evento al tempo ~{onset:.2f}s")
                        pass

            current_time_offset += scaled_section_duration
        
        # Ordina la sequenza finale per tempo
        full_sequence.sort(key=lambda e: e['time'])
        print(f"\n✓ Elaborazione completata. Generati {len(full_sequence)} eventi sonori.")
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici a tabelle Csound.")
        return full_sequence, all_onsets, tendency_ranges

    def generate_csd(self, composition_name, events):
        """Genera il file CSD finale dalla sequenza di eventi."""
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        
        # 1. Costruisci gli f-statement per le tabelle nello score
        score_tables = ""
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            ritmi_str = ' '.join(map(str, rhythm_tuple))
            posizioni = [i % r for i, r in enumerate(rhythm_tuple) if r > 0]
            posizioni_str = ' '.join(map(str, posizioni))
            
            score_tables += f"f {table_ids['ritmi_tab_num']} 0 {len(rhythm_tuple)} -2 {ritmi_str}\n"
            score_tables += f"f {table_ids['pos_tab_num']} 0 {len(posizioni)} -2 {posizioni_str}\n"

        # 2. Costruisci le linee di score (questa parte non cambia)
        score_lines = ""
        last_event_time = 0
        for event in events:
            p = event['params']
            event_time = max(event['time'], 0.001)
            score_lines += ";\t\t\t\t\t\tat\t\tdur\t\tritmi\tarmonica\tamp\t\t\tott\t\treg\t\t\tpos\t\tid\tnonlin\tsec_start\tsec_dur\n"
            score_lines += (f'i "AvviaComportamento"\t{event_time:.4f}\t{p["durata_totale"]:.3f}\t'
                            f'{p["ritmi_tab_num"]}\t{p["durata_armonica"]:.3f}\t\t{p["ampiezza_db"]:.2f}\t\t'
                            f'{p["ottava"]}\t\t{p["registro"]}\t\t\t{p["pos_tab_num"]}\t'
                            f'{p["id_comp"]}\t{p["nonlinear_mode"]}\t\t'
                            f'{p["section_start_time"]:.4f}\t\t{p["section_duration"]:.3f}\t'
                            f'{p["section_jitter"]:.3f}\n') # <-- NUOVO PARAMETRO
            last_event_time = max(last_event_time, event_time + p["durata_totale"])

        # 3. Assembla il file finale usando il NUOVO template e i NUOVI placeholder
        template = self.get_csd_template()
        csd_content = template.format(
            composition_name=composition_name,
            score_tables=score_tables,  # <--- NUOVO
            score_lines=score_lines,
            durata_totale=last_event_time
        )
        file_path = self.output_path / f"{composition_name}.csd"
        with open(file_path, 'w') as f:
            f.write(csd_content)
        
        print(f"\n✓ Composizione creata: {file_path}")
        print(f"  Per renderizzare: csound \"{file_path}\"")

    def get_csd_template(self):
        """Restituisce il template CSD master."""
        return """
<CsoundSynthesizer>
<CsOptions>
-o "{composition_name}.wav" -W -d
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
#define REGISTRI #50#
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
#include "../includes/eventoSonoroOld.orc"
#include "../includes/comportamento.orc"
#include "../includes/avvia_comportamento.orc"

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
f1 0 4096 10 1
f2 0 1024 6 0 512 0.5 512 1 ; Envelope per il suono

; --- TABELLE DI DATI PER LA PARTITURA ---
{score_tables}
; --------------------------------------



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

    def plot_piano_roll(self, events, all_onsets, tendency_ranges, composition_name, composition_structure): 
        print("\n--- Avvio Debugging Visivo: Generazione Grafico ---")
        if not events:
            print("Nessun evento da visualizzare.")
            return

        # ... (La preparazione dei dati e il calcolo dei limiti temporali sono invariati) ...
        plot_data = []
        for event in events:
            p = event['params']
            start, duration = event['time'], p['durata_totale']
            plot_data.append({'start': start, 'end': start + duration, 'pitch': p['ottava'] + (p['registro'] / 10.0), 'amp_norm': (p['ampiezza_db'] + 60) / 60})
        structural_max_time = sum(s['durata'] * s.get('ratio_temporale', 1.0) for s in composition_structure)
        events_max_time = max((item['end'] for item in plot_data), default=0)
        final_plot_width = max(events_max_time, structural_max_time)
        
        # --- INIZIO PLOTTER SEMPLIFICATO ---
        plt.style.use('seaborn-v0_8-darkgrid')
        fig, ax = plt.subplots(figsize=(20, 12))
        ax2 = ax.twinx()

        print("  > Disegno i nastri di tendenza...")
        if tendency_ranges:
            tendency_ranges.sort(key=lambda item: item['time'])
            
            # --- Tendenza per l'OTTAVA (un solo nastro) ---
            times_ott = [item['time'] for item in tendency_ranges if 'ottava' in item]
            if times_ott:
                mins_ott = [item['ottava']['min'] for item in tendency_ranges if 'ottava' in item]
                maxs_ott = [item['ottava']['max'] for item in tendency_ranges if 'ottava' in item]
                
                ax.fill_between(times_ott, mins_ott, maxs_ott, color='gray', alpha=0.3, label='Range Ottava')

            # --- Tendenza per la DURATA ARMONICA (invariata) ---
            times_dur = [item['time'] for item in tendency_ranges if 'durata_armonica' in item]
            if times_dur:
                mins_dur = [item['durata_armonica']['min'] for item in tendency_ranges if 'durata_armonica' in item]
                maxs_dur = [item['durata_armonica']['max'] for item in tendency_ranges if 'durata_armonica' in item]
                
                ax2.fill_between(times_dur, mins_dur, maxs_dur, color='coral', alpha=0.25, label='Range Durata Armonica (s)')
                ax2.plot(times_dur, mins_dur, color='coral', linestyle='-.', linewidth=1.2, alpha=0.6)
                ax2.plot(times_dur, maxs_dur, color='coral', linestyle='-.', linewidth=1.2, alpha=0.6)

        # Disegno eventi e marker (invariato)
        for item in plot_data:
            ax.add_patch(plt.Rectangle((item['start'], item['pitch'] - 0.04), item['end'] - item['start'], 0.08, color=plt.cm.viridis(item['amp_norm']), alpha=0.7))
        for onset_time in all_onsets:
            ax.axvline(x=onset_time, color='dodgerblue', linestyle=':', linewidth=0.9, alpha=0.7, label='Attivazione')
        current_time = 0
        for section in composition_structure:
            current_time += section['durata'] * section.get('ratio_temporale', 1.0)
            ax.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2, label=f"Fine: {section['nome_sezione']}")
        
        # Impostazioni finali e legenda (invariate)
        ax.set_xlim(0, final_plot_width + 2)
        ax.set_ylim(OTTAVE_RANGE[0] - 1, OTTAVE_RANGE[1] + 1)
        ax.set_xlabel("Tempo (secondi)", fontsize=12)
        ax.set_ylabel("Ottava.Registro", color='black', fontsize=12)
        ax.set_title(f"Visualizzazione Composizione: '{composition_name}'", fontsize=16, pad=20)
        ax.set_yticks(range(OTTAVE_RANGE[0], OTTAVE_RANGE[1] + 2))
        ax.grid(True, which='major', linestyle='--', linewidth='0.5', color='grey')
        
        ax2.set_ylabel("Durata Armonica (secondi)", color='coral', fontsize=12)
        ax2.tick_params(axis='y', labelcolor='coral')
        ax2.grid(False)

        handles1, labels1 = ax.get_legend_handles_labels()
        handles2, labels2 = ax2.get_legend_handles_labels()
        by_label = dict(zip(labels1 + labels2, handles1 + handles2))
        fig.legend(by_label.values(), by_label.keys(), loc='lower center', ncol=len(by_label), bbox_to_anchor=(0.5, 0.01))

        plt.tight_layout(rect=[0, 0.05, 1, 0.95])
        plot_filename = self.output_path / f"{composition_name}_visual.png"
        plt.savefig(plot_filename, dpi=150)
        plt.close()
        
        print(f"✓ Grafico di visualizzazione salvato in: {plot_filename}")

if __name__ == "__main__":
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
    event_sequence, all_onsets, tendency_ranges = composer.process_composition(composition_structure)
    
    if event_sequence:
        # 5. Visualizza la sequenza
        debugger.plot_piano_roll(event_sequence, all_onsets, tendency_ranges, composition_name, composition_structure)
        
        # 6. Genera il file CSD finale
        composer.generate_csd(composition_name, event_sequence)
    else:
        print("\nERRORE: Nessun evento generato. Controlla la configurazione della composizione.")