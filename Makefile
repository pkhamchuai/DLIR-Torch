.PHONY: install-python-package setup clean

PYTHON := python3

install-python-package:
	@echo "Installing requirements python package"
	@$(PYTHON) -m venv .venv
	@.venv/bin/pip install -r requirements.txt
	# @.venv/bin/pip install scikit-image
	@.venv/bin/pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
	@.venv/bin/pip install -r requirements_tutorial.txt
	@.venv/bin/pip install torchsummary pytorch_model_summary

clean:
	@echo "Cleaning up"
	@rm -rf .venv

# Add a target for setup that depends on installing Python packages
setup: install-python-package # create-directories
	@echo "ALL requirements are installed"

create-directories:
	@mkdir -p trained_models output

# To use setup and cleanup, you can run:
# make setup
# make clean