#!/usr/bin/env python3
"""
Generatore di Gamma di Comportamenti per Delta-Engine (Versione Autonoma)
==========================================================================
Genera una vasta gamma di file CSD per esplorare tutte le permutazioni
del generatore di comportamenti.
"""

import os
import csv
import numpy as np
from pathlib import Path
import sys

# --- Costanti di Validazione (derivate da validator.udo) ---
OTTAVE_RANGE = (0, 10)
REGISTRI_RANGE = (1, 10)

class ComportamentoGenerator:
    def __init__(self):
        self.base_path = Path(__file__).parent
        self.csd_path = self.base_path / "csd"
        self.wav_path = self.base_path / "wav"
        
        self.csd_path.mkdir(parents=True, exist_ok=True)
        self.wav_path.mkdir(parents=True, exist_ok=True)
        
        # Parametri per la generazione massiva
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

    def genera_template_csd(self):
        # Il template rimane identico alla versione precedente
        return """
<CsoundSynthesizer>
<CsOptions>
-o "wav/{nome_file}.wav" -W -d 
</CsOptions>
<CsInstruments>
sr = 192000
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
    if i_Res == 1 then
        prints "Sistema pitagorico inizializzato.\\n"
    else
        prints "ERRORE nell'inizializzazione del sistema pitagorico!\\n"
        turnoff
    endif
    prints "Sistema pronto per comportamento: {nome_comportamento}\\n\\n"
    turnoff
endin
</CsInstruments>
<CsScore>
f 2 0 [2^10] 10 1
f 2 0 [2^10] 6 0 [2^9] 0.5 [2^9] 1
i "Init" 0 0.1
{score_line}
e {durata_totale}
</CsScore>
</CsoundSynthesizer>
"""

    def valida_parametri(self, params):
        """Valida un set di parametri prima di generare il CSD (controllo tecnico)."""
        ott, reg, amp = params['ottava'], params['registro'], params['ampiezza']
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

        min_ritmo = min(r for r in params['ritmi'] if r > 0)
        if not min_ritmo: return False
        min_event_dur = params['durata_armonica'] / min_ritmo
        if params['durata'] <= min_event_dur:
            return False
            
        return True

    def genera_istruzioni_csd(self, params):
        ritmi, posizioni = params['ritmi'], params['posizioni']
        ftgen_block = f"""
gi_RitmiTab ftgen 0, 0, {len(ritmi)}, -2, {', '.join(map(str, ritmi))}
gi_PosTab   ftgen 0, 0, {len(posizioni)}, -2, {', '.join(map(str, posizioni))}
"""
        score_line = (f'i "AvviaComportamento" {params["attacco"]:.3f} {params["durata"]:.3f} '
                      f'{params["durata_armonica"]:.3f} {params["ampiezza"]:.2f} '
                      f'{params["ottava"]} {params["registro"]} '
                      f'{params["nonlinear_mode"]} {params["id_comp"]}')
        return ftgen_block, score_line

    def genera_combinazioni_intelligenti(self):
        """Genera TUTTE le possibili combinazioni di parametri."""
        print("Avvio generazione esaustiva di tutte le combinazioni...")
        combinazioni = []
        id_comp = 0
        tentativi = 0

        # Cicli annidati per la massima permutazione
        for ottava in self.parametri['ottave']:
            # Per ridurre leggermente il numero, selezioniamo alcuni registri chiave
            for registro in range(10):
                if registro not in self.parametri['registri']: continue
                
                for tipo_ritmi, patterns in self.parametri['ritmi_patterns'].items():
                    for pattern_ritmi in patterns:
                        for tipo_dur_arm, durate_list in self.parametri['durate_armoniche'].items():
                            for dur_arm in durate_list:
                                for molt in self.parametri['moltiplicatori_durata']:
                                    for tipo_amp, amp_list in self.parametri['ampiezze'].items():
                                        for amp in amp_list:
                                            for tipo_pos, pos_func in self.parametri['posizioni_patterns'].items():
                                                for mode_label, mode in self.parametri['nonlinear_modes'].items():
                                                    
                                                    tentativi += 1
                                                    id_comp += 1
                                                    
                                                    posizioni = pos_func(pattern_ritmi)
                                                    durata_totale = dur_arm * molt

                                                    params = {
                                                        'id_comp': id_comp, 'ottava': ottava, 'registro': registro,
                                                        'tipo_ritmi': tipo_ritmi, 'ritmi': pattern_ritmi,
                                                        'durata_armonica': dur_arm, 'durata': durata_totale,
                                                        'tipo_durata': tipo_dur_arm,
                                                        'tipo_ampiezza': tipo_amp, 'ampiezza': amp,
                                                        'tipo_posizioni': tipo_pos, 'posizioni': posizioni,
                                                        'nonlinear_mode_label': mode_label, 'nonlinear_mode': mode,
                                                        'attacco': 1.0
                                                    }

                                                    if self.valida_parametri(params):
                                                        nome_parti = [
                                                            f"ott{ottava:02d}", f"reg{registro:02d}", tipo_ritmi,
                                                            f"dur{int(durata_totale)}s", f"amp_{tipo_amp}",
                                                            f"pos_{tipo_pos}", f"mode{mode}"
                                                        ]
                                                        params['nome'] = "_".join(nome_parti)
                                                        combinazioni.append(params)
        
        print(f"Generazione combinazioni completata.")
        print(f"Trovate {len(combinazioni)} combinazioni valide su {tentativi} tentativi totali.")
        return combinazioni
    
    def genera_gamma_comportamenti(self):
        """Metodo principale per generare tutti i file CSD."""
        print("=" * 60)
        print("Generatore di Gamma di Comportamenti (v2.1 - Mass Production)")
        print("=" * 60)
        
        template = self.genera_template_csd()
        combinazioni = self.genera_combinazioni_intelligenti()
        
        if not combinazioni:
            print("\nERRORE: Nessuna combinazione di parametri valida è stata generata.")
            sys.exit(1)

        num_combinazioni = len(combinazioni)
        print(f"\nATTENZIONE: Verranno generati {num_combinazioni} file CSD.")
        print("L'operazione potrebbe richiedere qualche secondo...")
        
        for i, params in enumerate(combinazioni):
            ftgen_block, score_line = self.genera_istruzioni_csd(params)
            csd_content = template.format(
                nome_file=params['nome'], nome_comportamento=params['nome'],
                ftgen_tables=ftgen_block, score_line=score_line,
                durata_totale=params['durata'] + 5
            )
            
            file_path = self.csd_path / f"{params['nome']}.csd"
            with open(file_path, 'w') as f:
                f.write(csd_content)
        
        print(f"\n✓ Generazione completata! Creati {num_combinazioni} file CSD in '{self.csd_path}'")
        
        self.genera_script_rendering()
        self.genera_indice_comportamenti(combinazioni)
        
        print("\n" + "=" * 60)
        print("ISTRUZIONI:")
        print(f"1. Rendi eseguibile lo script di rendering: chmod +x {self.base_path / 'render_all.sh'}")
        print("2. Avvia il rendering (potrebbe richiedere molto tempo!): ./render_all.sh")
        print(f"3. I file WAV verranno salvati in: '{self.wav_path}'")
        print(f"4. L'indice dei comportamenti generati è in: '{self.base_path / 'indice_comportamenti.csv'}'")
        print("=" * 60)

    # Le funzioni genera_script_rendering e genera_indice_comportamenti rimangono invariate.
    def genera_script_rendering(self):
        script_content = f"""#!/bin/bash
# Script per renderizzare tutti i comportamenti della gamma.
# Versione 2.0: Usa 'find' per gestire un numero molto grande di file
# e prevenire l'errore "Argument list too long".

echo "======================================"
echo "RENDERING GAMMA COMPORTAMENTI (v2.0)"
echo "======================================"

CSD_DIR="./csd"
WAV_DIR="./wav"

# Assicurati che la cartella WAV esista
mkdir -p "$WAV_DIR"

# --- Conteggio dei file (metodo sicuro) ---
# Usa 'find' invece di 'ls' per contare i file senza superare i limiti degli argomenti.
echo "Conteggio dei file CSD in corso..."
total=$(find "$CSD_DIR" -type f -name "*.csd" | wc -l)

if [ "$total" -eq 0 ]; then
    echo "Nessun file .csd trovato in $CSD_DIR"
    exit 1
fi

echo "Trovati $total file da renderizzare. L'operazione potrebbe richiedere molto tempo."
current=0

# --- Loop di rendering (metodo sicuro) ---
# Usa 'find' per trovare i file e un loop 'while read' per processarli uno ad uno.
# Questo è il modo corretto per iterare su un numero potenzialmente enorme di file.
find "$CSD_DIR" -type f -name "*.csd" | while read -r file; do
    current=$((current + 1))
    filename=$(basename -- "$file")
    echo ""
    echo "[$current/$total] Rendering: $filename"
    echo "-------------------------------------"
    
    # Renderizza con Csound
    csound "$file" &> /dev/null
    
    if [ $? -eq 0 ]; then
        echo "✓ Completato"
    else
        echo "✗ Errore nel rendering di $filename"
    fi
done

echo ""
echo "======================================"
echo "RENDERING COMPLETATO!"
echo "File WAV salvati in: $WAV_DIR"
echo "======================================"
"""
        script_path = self.base_path / "render_all.sh"
        with open(script_path, 'w') as f: f.write(script_content)
        os.chmod(script_path, 0o755)
        print(f"\n✓ Creato script di rendering eseguibile: {script_path}")

    def genera_indice_comportamenti(self, combinazioni):
        csv_path = self.base_path / "indice_comportamenti.csv"
        fieldnames = [
            'nome_file', 'id_comp', 'ottava', 'registro', 'tipo_ritmi', 'ritmi',
            'durata_armonica', 'durata_totale', 'tipo_durata', 'ampiezza_db', 'tipo_ampiezza',
            'tipo_posizioni', 'nonlinear_mode_label'
        ]
        with open(csv_path, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()
            for params in combinazioni:
                writer.writerow({
                    'nome_file': params['nome'], 'id_comp': params['id_comp'],
                    'ottava': params['ottava'], 'registro': params['registro'],
                    'tipo_ritmi': params['tipo_ritmi'], 'ritmi': str(params['ritmi']),
                    'durata_armonica': f"{params['durata_armonica']:.2f}",
                    'durata_totale': f"{params['durata']:.2f}", 'ampiezza_db': params['ampiezza'],
                    'tipo_durata': params['tipo_durata'],
                    'tipo_ampiezza': params['tipo_ampiezza'],
                    'tipo_posizioni': params['tipo_posizioni'],
                    'nonlinear_mode_label': params['nonlinear_mode_label']
                })
        print(f"✓ Creato indice dei comportamenti: {csv_path}")

if __name__ == "__main__":
    generator = ComportamentoGenerator()
    generator.genera_gamma_comportamenti()