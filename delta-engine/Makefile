.PHONY = clean venv analyze render

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

# Nuovi target per l'ambiente Python e l'analisi
$(VENV)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(VENV)
	$(VENV_PIP) install --upgrade pip
	$(VENV_PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

venv: $(VENV)/bin/activate

analyze: venv
	mkdir -p docs/analysis
	$(VENV_PYTHON) docs/plot_overlap.py docs/analysis/overlap_data.csv

render: clean
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log

all: render analyze