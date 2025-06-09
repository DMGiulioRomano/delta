# =============================================================================
# Makefile per il Generatore di Gamma di Comportamenti
# =============================================================================
# Questo Makefile automatizza la generazione e il rendering dei comportamenti.
#
# Comandi principali:
#   make all        - (Default) Genera i CSD e poi lancia il rendering.
#   make generate   - Genera solo i file CSD e gli script, senza renderizzare.
#   make render     - Lancia solo il rendering (presuppone che i CSD esistano).
#   make clean      - Rimuove tutti i file generati (csd, wav, script, csv).
# =============================================================================

# --- Variabili Configurabili ---
# Puoi cambiare l'interprete Python qui se necessario
PYTHON = python3.11

# Nomi degli script e delle cartelle
PYTHON_SCRIPT = genera_gamma_comportamenti.py
RENDER_SCRIPT = render_all.sh
CSD_DIR = csd
WAV_DIR = wav
INDEX_FILE = indice_comportamenti.csv

# --- Definizione dei Target ---

# Il target di default: 'make' o 'make all' eseguirà questo.
# Dipende dal target 'render', creando una catena di esecuzione.
all: render

# Target per generare i file CSD e gli script.
# La creazione del RENDER_SCRIPT funge da indicatore che la generazione è avvenuta.
# Dipende dal nostro script Python: se lo script cambia, la generazione va rieseguita.
generate: $(RENDER_SCRIPT)

$(RENDER_SCRIPT): $(PYTHON_SCRIPT)
	@echo "--- 1. Esecuzione dello script Python per generare i file CSD... ---"
	$(PYTHON) $(PYTHON_SCRIPT)

# Target per lanciare il rendering.
# Dipende dal target 'generate' per assicurarsi che i file esistano.
render: generate
	@echo "\n--- 2. Avvio dello script di rendering batch... ---"
	@echo "Questa operazione potrebbe richiedere molto tempo."
	./$(RENDER_SCRIPT)

# Target per la pulizia completa.
# Rimuove le cartelle dei file generati e gli script/indici.
clean:
	@echo "--- Pulizia delle cartelle csd/ e wav/ e dei file generati... ---"
	rm -rf $(CSD_DIR) $(WAV_DIR)
	rm -f $(RENDER_SCRIPT) $(INDEX_FILE)
	@echo "Pulizia completata."

# --- Dichiarazione dei Target "Phony" ---
# Dichiariamo i target che non rappresentano file reali.
# Questo previene conflitti se dovessero esistere file con questi nomi.
.PHONY: all generate render clean