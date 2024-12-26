CSOUND_DIR = csound
PYTHON_DIR = python
FUNZIONI_DIR = funzioni
LATEX_DIR = latex_diagrams
FILE =forma
CSD_DIR = generazione
WAV_DIR = wav
YAML ?= brano
SEZIONE ?= 

all : py csound run

create_dir:
	mkdir -p $(CSOUND_DIR)/$(CSD_DIR)
	mkdir -p $(CSOUND_DIR)/$(CSD_DIR)/$(WAV_DIR)
	
py: clean create_dir
	@echo "Running Python script..."
	python3.11 $(PYTHON_DIR)/main.py yaml_dir/$(YAML).yaml $(if $(SEZIONE),--sezione $(SEZIONE))

pyDebug: clean create_dir
	python3.11 $(PYTHON_DIR)/main.py $(YAML).yaml >logPython.log

csound: create_dir
	@for file in $(CSOUND_DIR)/$(CSD_DIR)/*.csd; do \
		if [ -f "$$file" ]; then \
			echo "Processing $$file..."; \
			csound "$$file"; \
		else \
			echo "No .csd files found in $(CSOUND_DIR)/$(CSD_DIR)"; \
		fi; \
	done

run:
	open $(CSOUND_DIR)/$(CSD_DIR)/$(WAV_DIR)
	open -a Reaper
clean:
	rm -rf $(PYTHON_DIR)/$(FUNZIONI_DIR)/__pycache__ $(PYTHON_DIR)/__pycache__ $(CSOUND_DIR)/$(CSD_DIR)


.PHONY: py