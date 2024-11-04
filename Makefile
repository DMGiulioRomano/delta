CSOUND_DIR = csound
PYTHON_DIR = python 
LATEX_DIR = latex_diagrams


py:
	python3 $(PYTHON)/main.py

forma:
	xelatex -interaction=nonstopmode -halt-on-error -output-directory=$(LATEX_DIR) $(LATEX_DIR)/forma.tex

clean:
	rm -f $(FILE).aux $(FILE).log $(FILE).pdf

.PHONY: py
