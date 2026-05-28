CSOUND_DIR = csound
CSD_DIR = generazione
WAV_DIR = wav
YAML ?= brano
SEZIONE ?= sezione1

all : py csound run

create_dir:
	mkdir -p $(CSOUND_DIR)/$(CSD_DIR)
	mkdir -p $(CSOUND_DIR)/$(CSD_DIR)/$(WAV_DIR)

py: clean create_dir
	@echo "Running Python script..."
	python3.11 -m delta compositions/$(YAML).yaml $(if $(SEZIONE),--sezione $(SEZIONE))

pyDebug: clean create_dir
	python3.11 -m delta $(YAML).yaml >logPython.log

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
	open -a Reaper reaper/dcBlockerAt.RPP

clean:
	rm -rf $(CSOUND_DIR)/$(CSD_DIR) src/delta/__pycache__ src/delta/*/__pycache__


.PHONY: py csound run clean create_dir pyDebug all
