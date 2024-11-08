CSOUND_DIR = csound
PYTHON_DIR = python
FUNZIONI_DIR = funzioni
LATEX_DIR = latex_diagrams
FILE =forma

py:
	rm -rf $(PYTHON_DIR)/$(FUNZIONI_DIR)/__pycache__
	python3.11 $(PYTHON_DIR)/main.py

forma:
	xelatex -interaction=nonstopmode -halt-on-error -output-directory=$(LATEX_DIR) $(LATEX_DIR)/forma.tex

clean:
	rm -rf $(PYTHON_DIR)/$(FUNZIONI_DIR)/__pycache__ $(PYTHON_DIR)/__pycache__

.PHONY: py
