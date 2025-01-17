# Variabili
PYTHON := python3.11
PYTEST := pytest
PIP := $(PYTHON) -m pip
COVERAGE := coverage
PYLINT := pylint
BLACK := black

# Percorsi
SRC_DIR := src
TEST_DIR := tests
VENV_DIR := venv

.PHONY: all clean test coverage lint format install-dev venv

# Target di default
all: lint test

run:
	python3.11 main.py 

# Creazione e attivazione virtualenv
venv:
	$(PYTHON) -m venv $(VENV_DIR)

# Installazione dipendenze di sviluppo
install-dev: venv
	$(VENV_DIR)/bin/pip install -r requirements-test.txt


clean-venv:
	@if [ -d "$(VENV_DIR)" ]; then \
		echo "Disattivazione virtualenv..."; \
		if [ -n "$$VIRTUAL_ENV" ]; then \
			deactivate || true; \
		fi; \
		echo "Rimozione directory virtualenv..."; \
		rm -rf $(VENV_DIR); \
		echo "Virtualenv rimosso con successo."; \
	else \
		echo "Virtualenv non trovato in $(VENV_DIR)"; \
	fi

# Pulizia file temporanei e cache
clean: clean-venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type f -name ".coverage" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name "*.egg" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name "htmlcov" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +

# Esecuzione test
test:
	$(VENV_DIR)/bin/pytest $(TEST_DIR) -v

# Test con coverage
coverage:
	$(PYTEST) --cov=$(SRC_DIR) $(TEST_DIR) --cov-report=term-missing --cov-report=html

# Test specifici
test-unit:
	$(PYTEST) $(TEST_DIR)/unit -v

test-integration:
	$(PYTEST) $(TEST_DIR)/integration -v

test-e2e:
	$(PYTEST) $(TEST_DIR)/e2e -v

# Controllo qualità del codice
lint:
	export PYTHONPATH=$(pwd)/src && $(VENV_DIR)/bin/pylint $(SRC_DIR)
#	$(VENV_DIR)/bin/pylint $(TEST_DIR)
#	$(VENV_DIR)/bin/mypy $(SRC_DIR)

# Formattazione del codice
format:
	$(VENV_DIR)/bin/black $(SRC_DIR)
	$(VENV_DIR)/bin/black $(TEST_DIR)

# Target che combina più operazioni
check: format lint coverage

# Help
help:
	@echo "Targets disponibili:"
	@echo "  make install-dev    : Installa dipendenze di sviluppo"
	@echo "  make test          : Esegue tutti i test"
	@echo "  make test-unit     : Esegue solo i test unitari"
	@echo "  make test-integration : Esegue solo i test di integrazione"
	@echo "  make test-e2e      : Esegue solo i test end-to-end"
	@echo "  make coverage      : Esegue i test con report coverage"
	@echo "  make lint          : Esegue controlli di lint e type checking"
	@echo "  make format        : Formatta il codice con black"
	@echo "  make check         : Esegue format, lint e coverage"
	@echo "  make clean         : Rimuove file temporanei e cache"