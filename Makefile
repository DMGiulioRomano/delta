CSOUND_DIR = csound
PYTHON_DIR = python
LATEX_DIR = latex_diagrams
FILE =forma

py:
	python3 $(PYTHON_DIR)/main.py

forma:
	xelatex -interaction=nonstopmode -halt-on-error -output-directory=$(LATEX_DIR) $(LATEX_DIR)/forma.tex

clean:
	rm -f $(LATEX_DIR)/$(FILE).fls $(LATEX_DIR)/$(FILE).fdb_latexmk $(LATEX_DIR)/$(FILE).aux $(LATEX_DIR)/$(FILE).log $(LATEX_DIR)/$(FILE).pdf

.PHONY: py
