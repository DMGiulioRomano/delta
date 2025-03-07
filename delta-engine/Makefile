.PHONY = clean venv analyze analyze-memory analyze-all render

CSD ?= main
CS = csound
PYTHON = python3
VENV = venv
VENV_PYTHON = $(VENV)/bin/python
VENV_PIP = $(VENV)/bin/pip

# Target base già presenti
clean:
	rm -rf *.wav *.aif *.log *.sco *.txt *.table

cs:
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log

# Gestione ambiente virtuale Python
$(VENV)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(VENV)
	$(VENV_PIP) install --upgrade pip
	$(VENV_PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

venv: $(VENV)/bin/activate

# Analisi sovrapposizione standard
analyze: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/plot_overlap.py docs/analysis/overlap_data.csv

# Analisi memoria compositiva
analyze-memory: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/visualize_memory.py docs/analysis/compositional_memory.csv

# Analisi armonica
analyze-harmony: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/visualize_harmony.py docs/analysis/harmonic_data.csv

# Aggiorna il target analyze-all
analyze-all: analyze analyze-memory analyze-harmony

# Rendering completo
render: clean
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log

# Rendering e analisi completi
all: render analyze-all