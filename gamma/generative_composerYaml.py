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

OTTAVE_RANGE = (0, 10)
REGISTRI_RANGE = (1, 50)
INTERVALLI_PER_OTTAVA = 200 

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

    def _valida_parametri(self, params):
        """
        Valida un set di parametri generati per assicurarsi che siano
        tecnicamente validi per il motore Csound.
        Copiato e adattato da `genera_gamma_comportamenti.py`.
        """
        ott, reg, amp = params['ottava'], params['registro'], params['ampiezza_db']
        
        # 1. Validazione Ampiezza vs Ottava/Registro
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

        # 2. Validazione Durata
        min_ritmo = min(r for r in params['ritmi'] if r > 0)
        if not min_ritmo: return False
        min_event_dur = params['durata_armonica'] / min_ritmo
        if params['durata_totale'] <= min_event_dur:
            return False
            
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
        parametri concreti e validi, con una gestione intelligente dello spread.
        """
        params = {}

        # --- GESTIONE SPECIALE PER L'OTTAVA CON SPREAD ---
        
        # 1. Estrai le maschere rilevanti
        ottava_mask = mask['ottava']
        spread_mask = mask.get('spread_spettrale', {'range': [0, 0]}) # Usa 0 se non definito

        # 2. Genera un valore di spread per questo specifico evento
        spread_value = random.uniform(spread_mask['range'][0], spread_mask['range'][1])

        # 3. Calcola il "centro di gravità" del range di ottave originale
        ottava_min_orig, ottava_max_orig = ottava_mask['range']
        ottava_center = random.uniform(ottava_min_orig, ottava_max_orig)
        
        # 4. Applica la logica di generazione in base al tipo di distribuzione
        generated_ottava = 0 # Valore di default
        
        if ottava_mask.get('distribution') == 'normal':
            # Per la distribuzione normale: genera e poi clippa.
            # Lo spread agisce come deviazione standard per creare dispersione attorno al centro.
            valore_generato = np.random.normal(loc=ottava_center, scale=spread_value)
            generated_ottava = int(np.clip(valore_generato, OTTAVE_RANGE[0], OTTAVE_RANGE[1]))
        
        else: # Default a distribuzione "uniform"
            # Per la distribuzione uniforme: calcola i limiti sicuri e poi genera.
            # Lo spread definisce l'ampiezza del range di generazione.
            
            # Calcola i limiti del nostro range desiderato, tenendoli dentro i limiti globali
            min_gen = max(OTTAVE_RANGE[0], ottava_center - spread_value)
            max_gen = min(OTTAVE_RANGE[1], ottava_center + spread_value)
            
            # Assicurati che min_gen non sia maggiore di max_gen
            if min_gen >= max_gen:
                valore_generato = min_gen
            else:
                # Generiamo un valore uniforme DENTRO il range sicuro calcolato
                valore_generato = random.uniform(min_gen, max_gen)
            
            generated_ottava = int(round(valore_generato))

        params['ottava'] = generated_ottava

        # --- FINE GESTIONE SPECIALE OTTAVA ---


        # --- GESTIONE DI TUTTI GLI ALTRI PARAMETRI ---
        # Itera su ogni parametro definito nella maschera, saltando l'ottava
        # perché è già stata gestita.
        for key, p_mask in mask.items():
            if key in ['choices', 'weights', 'ottava', 'spread_spettrale']: continue
            
            val = 0
            if 'range' in p_mask:
                min_val, max_val = p_mask['range']
                if p_mask.get('distribution') == 'normal':
                    mean = (min_val + max_val) / 2
                    std = (max_val - min_val) / 4 # Stima approssimativa
                    val = np.random.normal(mean, std)
                else: # Uniforme
                    if isinstance(min_val, int):
                        val = random.randint(min_val, max_val)
                    else:
                        val = random.uniform(min_val, max_val)
            elif 'choices' in p_mask:
                val = random.choices(p_mask['choices'], weights=p_mask.get('weights'), k=1)[0]
            
            params[key] = val

        # Clipping per garantire che il registro rimanga nei limiti tecnici
        params['registro'] = int(np.clip(params.get('registro', 5), REGISTRI_RANGE[0], REGISTRI_RANGE[1]))

        # Generazione derivata
        params['ritmi'] = self._generate_rhythm_pattern(params.get('tipo_ritmi', 'medi'))
        params['posizioni'] = [i % r for i, r in enumerate(params['ritmi']) if r > 0]
        
        # Usa un moltiplicatore di default se non è specificato
        moltiplicatore = params.get('moltiplicatore_durata', random.choice([1, 1.25, 1.6]))
        params['durata_totale'] = params['durata_armonica'] * moltiplicatore
        
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
        
        # --- NUOVO ---
        # Definiamo il moltiplicatore massimo come costante per chiarezza
        MAX_DURATION_MULTIPLIER = 1.6
        
        print("Inizio elaborazione della composizione...")
        for i, section in enumerate(composition_structure):
            print(f"\n--- Sezione {i+1}: '{section['nome_sezione']}' (Durata: {section['durata']}s) ---")

            section_events_for_logging = []

            # --- LOGICA MODIFICATA PER LA DURATA SICURA ---
            
            # 1. Calcoliamo il 'cuscinetto di sicurezza' basato sullo stato finale.
            end_mask = section['stato_finale']
            max_harmonic_dur_at_end = end_mask['durata_armonica']['range'][1]
            safety_buffer = max_harmonic_dur_at_end * MAX_DURATION_MULTIPLIER
            
            # 2. Calcoliamo la nuova durata 'sicura' per la generazione degli onsets.
            generation_duration = section['durata'] - safety_buffer
            
            print(f"  > Durata totale: {section['durata']}s. Cuscinetto di sicurezza calcolato: {safety_buffer:.2f}s.")
            print(f"  > Gli eventi verranno generati entro una finestra di {generation_duration:.2f}s.")
            
            # 3. Gestiamo il caso in cui il cuscinetto sia troppo grande.
            if generation_duration <= 0:
                print(f"  > ATTENZIONE: Il cuscinetto di sicurezza è maggiore della durata della sezione. Nessun evento generato.")
                cluster_onsets = []
            else:
                # 4. Chiamiamo TimeScheduler con la nuova durata ridotta.
                cluster_onsets = self.time_scheduler.generate_onsets(
                    section['timing_model'], generation_duration, section['num_attivazioni']
                )

            start_mask = section['stato_iniziale']
            # end_mask è già stato definito sopra

            # 2. Per ogni punto di attivazione, genera un cluster di eventi (il resto non cambia)
            for onset in cluster_onsets:
                progress = onset / section['durata'] if section['durata'] > 0 else 0
                
                # ... il resto della funzione rimane identico da qui in poi ...
                
                center_mask = self._interpolate_mask(start_mask, end_mask, progress)
                dens_range = center_mask['densita_cluster']['range']
                num_events_in_cluster = random.randint(int(dens_range[0]), int(dens_range[1]))
                for _ in range(num_events_in_cluster):
                    for attempt in range(10):
                        event_mask = center_mask.copy()
                        spread = random.uniform(event_mask['spread_spettrale']['range'][0], 
                                                event_mask['spread_spettrale']['range'][1])
                        ott_range = event_mask['ottava']['range']
                        event_mask['ottava']['range'] = [ott_range[0] - spread, ott_range[1] + spread]
                        params = self._generate_params_from_mask(event_mask)
                        if self._valida_parametri(params):
                            rhythm_tuple = tuple(params['ritmi'])
                            if rhythm_tuple not in self.rhythm_table_map:
                                self.rhythm_table_map[rhythm_tuple] = {
                                    'ritmi_tab_num': self.next_table_id,
                                    'pos_tab_num': self.next_table_id + 1
                                }
                                self.next_table_id += 2
                            params['ritmi_tab_num'] = self.rhythm_table_map[rhythm_tuple]['ritmi_tab_num']
                            params['pos_tab_num'] = self.rhythm_table_map[rhythm_tuple]['pos_tab_num']
                            jitter = np.random.normal(loc=0.0, scale=0.05)
                            event_time = current_time_offset + onset + jitter
                            event_data = {'time': event_time, 'params': params}
                            full_sequence.append(event_data)
                            section_events_for_logging.append(event_data)
                            break
                    else:
                        pass
            print(f"  > Comportamenti generati per questa sezione: {len(section_events_for_logging)}")
            current_time_offset += section['durata']
        
        full_sequence.sort(key=lambda e: e['time'])
        print(f"\n✓ Elaborazione completata. Generati {len(full_sequence)} eventi sonori.")
        print(f"Mappati {len(self.rhythm_table_map)} pattern di ritmi unici a tabelle Csound.")
        return full_sequence

    def generate_csd(self, composition_name, events):
        """Genera il file CSD finale dalla sequenza di eventi."""
        print(f"\nAssemblo il file CSD '{composition_name}.csd'...")
        
        # 1. Costruisci gli f-statement per le tabelle nello score
        score_tables = ""
        for rhythm_tuple, table_ids in self.rhythm_table_map.items():
            ritmi_str = ', '.join(map(str, rhythm_tuple))
            posizioni = [i % r for i, r in enumerate(rhythm_tuple) if r > 0]
            posizioni_str = ', '.join(map(str, posizioni))
            
            # Sintassi f-statement: f <num> <start> <size> <GEN> <params...>
            # GEN 2 legge i valori direttamente. Lo start time è 0 per renderle subito disponibili.
            score_tables += f"f {table_ids['ritmi_tab_num']} 0 {len(rhythm_tuple)} 2 {ritmi_str}\n"
            score_tables += f"f {table_ids['pos_tab_num']} 0 {len(posizioni)} 2 {posizioni_str}\n"

        # 2. Costruisci le linee di score (questa parte non cambia)
        score_lines = ""
        last_event_time = 0
        # ... (il resto del loop rimane identico) ...
        for event in events:
            p = event['params']
            event_time = max(event['time'], 0.001)
            score_lines += ";\t\t\t\t\t\tat\t\tdur\t\ttab\t\tarmonica\tampiezza\tottava\tregistro\tniente\tid_comp\tnonlinearMode\n"
            score_lines += (f'i "AvviaComportamento"\t{event_time:.4f}\t{p["durata_totale"]:.3f}\t'
                            f'{p["ritmi_tab_num"]}\t{p["durata_armonica"]:.3f}\t\t{p["ampiezza_db"]:.2f}\t\t'
                            f'{p["ottava"]}\t\t{p["registro"]}\t\t\t{p["pos_tab_num"]}\t{p["id_comp"]}\t\t{p["nonlinear_mode"]}\n')
            last_event_time = max(last_event_time, event_time + p["durata_totale"])

        # 3. Assembla il file finale usando il NUOVO template e i NUOVI placeholder
        template = self.get_csd_template()
        csd_content = template.format(
            composition_name=composition_name,
            score_tables=score_tables, 
            score_lines=score_lines,
            durata_totale=last_event_time + 10,
            ottave_macro = OTTAVE_RANGE[1], 
            registri_macro = REGISTRI_RANGE[1],
            intervalli_macro = INTERVALLI_PER_OTTAVA
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
#define OTTAVE #{ottave_macro}#
#define INTERVALLI #{intervalli_macro}#
#define REGISTRI #{registri_macro}#
#define M_PI #3.141592653589793#
gSdirSco = "./sco/"
gi_Index init 1
gi_eve_attacco ftgen 0, 0, 2^20, -2, 0
gi_Intonazione ftgen 0, 0, $OTTAVE*$INTERVALLI+1, -2, 0

#include "../includes/gamma_utils.udo"
#include "../includes/pfield_comp.udo"
#include "../includes/NonlinearFunc.udo"
#include "../includes/GenPythagFreqs.udo"
#include "../includes/eventoSonoro.orc"
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
f 0 {durata_totale} ; Evento f fittizio per definire la durata totale
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

    def plot_piano_roll(self, events, composition_name, composition_structure): 
        print("\n--- Avvio Debugging Visivo: Generazione Grafico ---")
        if not events:
            print("Nessun evento da visualizzare.")
            return

        plot_data = []
        max_time = 0
        for event in events:
            p = event['params']
            start = event['time']
            duration = p['durata_totale']
            end = start + duration
            pitch = p['ottava'] + (p['registro'] / 10.0)
            amp_norm = (p['ampiezza_db'] + 60) / 60
            plot_data.append({'start': start, 'end': end, 'pitch': pitch, 'amp_norm': amp_norm})
            if end > max_time: max_time = end

        plt.style.use('seaborn-v0_8-darkgrid')
        fig, ax = plt.subplots(figsize=(20, 10))
        for item in plot_data:
            ax.add_patch(plt.Rectangle(
                (item['start'], item['pitch'] - 0.04),
                item['end'] - item['start'], 0.08,
                color=plt.cm.viridis(item['amp_norm']), alpha=0.7
            ))

        ax.set_xlim(0, max_time)
        ax.set_ylim(OTTAVE_RANGE[0] - 1, OTTAVE_RANGE[1] + 1)
        ax.set_xlabel("Tempo (secondi)")
        ax.set_ylabel("Ottava.Registro")
        ax.set_title(f"Visualizzazione Composizione: '{composition_name}'")
        ax.set_yticks(range(OTTAVE_RANGE[0], OTTAVE_RANGE[1] + 2))
        
        # --- MODIFICA CHIAVE QUI ---
        current_time = 0
        for section in composition_structure: # <--- 2. USATO IL NUOVO PARAMETRO
            current_time += section['durata']
            ax.axvline(x=current_time, color='r', linestyle='--', linewidth=1.2, label=f"Fine: {section['nome_sezione']}")
        
        handles, labels = ax.get_legend_handles_labels()
        by_label = dict(zip(labels, handles))
        ax.legend(by_label.values(), by_label.keys())
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
    event_sequence = composer.process_composition(composition_structure)
    
    if event_sequence:
        # 5. Visualizza la sequenza
        debugger.plot_piano_roll(event_sequence, composition_name, composition_structure)
        
        # 6. Genera il file CSD finale
        composer.generate_csd(composition_name, event_sequence)
    else:
        print("\nERRORE: Nessun evento generato. Controlla la configurazione della composizione.")