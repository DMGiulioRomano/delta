.PHONY = clean venv analyze analyze-memory analyze-all render help

CSD ?= main
CS = csound
PYTHON = python3
VENV = venv
VENV_PYTHON = $(VENV)/bin/python
VENV_PIP = $(VENV)/bin/pip

## Display this help message
help:
	@echo "Delta-Engine Makefile Help"
	@echo "=========================="
	@echo ""
	@echo "Available targets:"
	@echo "  clean               Clean up generated files and temporary data"
	@echo "  cs                  Run Csound with the specified CSD file"
	@echo "  venv                Set up Python virtual environment"
	@echo "  analyze             Analyze overlap data and generate plots"
	@echo "  analyze-memory      Analyze compositional memory data"
	@echo "  analyze-harmony     Analyze harmonic data and generate plots"
	@echo "  analyze-spatial     Analyze spatial movement data"
	@echo "  analyze-all         Run all analysis scripts"
	@echo "  render              Render the composition to audio file"
	@echo "  all                 Render the composition and run all analyses"
	@echo "  help                Display this help message"
	@echo ""
	@echo "Usage example: make render"
	@echo ""
	@echo "For detailed documentation, see the README.md file"
			
## Clean up generated files and temporary data
clean:
	rm -rf *.wav *.aif *.log *.sco *.txt *.table

## Run Csound with the specified CSD file (default: main.csd)
cs:
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log

## Set up Python virtual environment
venv: $(VENV)/bin/activate

$(VENV)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(VENV)
	$(VENV_PIP) install --upgrade pip
	$(VENV_PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

## Analyze overlap data and generate plots
analyze: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/plot_overlap.py docs/analysis/overlap_data.csv

## Analyze compositional memory data and generate plots
analyze-memory: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/visualize_memory.py docs/analysis/compositional_memory.csv

## Analyze harmonic data and generate plots
analyze-harmony: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/visualize_harmony.py docs/analysis/harmonic_data.csv

## Analyze spatial movement data and generate plots
analyze-spatial: venv
	mkdir -p docs/analysis/plots
	$(VENV_PYTHON) docs/visualize_spatial_movement.py docs/analysis/harmonic_data.csv

## Run all analysis scripts to generate all plots
analyze-all: analyze analyze-memory analyze-harmony analyze-spatial

## Render the composition to audio file
render: clean
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log

## Render the composition and run all analyses
all: render analyze-all
