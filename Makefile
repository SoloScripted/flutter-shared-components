# Use a single shell for each recipe.
.ONESHELL:

# Set the default goal to 'help' if no target is specified.
.DEFAULT_GOAL := help

# Define the FVM installation URL
FVM_INSTALL_URL := https://fvm.app/install.sh

# Define the default Flutter SDK version to install (optional, FVM will use .fvm/fvm_config.json if present)
# FLUTTER_VERSION := 3.19.6 # Uncomment and set a specific version if needed

.PHONY: setup get lint format help

# Target to set up the Flutter project, installing FVM if necessary
setup:
	@echo "Checking for FVM installation..."
	if ! command -v fvm >/dev/null 2>&1; then
		echo "FVM not found. Attempting to install FVM..."
		if command -v curl >/dev/null 2>&1; then
			echo "Downloading and running FVM installation script..."
			curl -fsSL $(FVM_INSTALL_URL) | bash
			# Attempt to source shell profiles to make fvm available in the current session
			if [ -f "$$HOME/.zshrc" ]; then source "$$HOME/.zshrc"; fi
			if [ -f "$$HOME/.bashrc" ]; then source "$$HOME/.bashrc"; fi
			if [ -f "$$HOME/.profile" ]; then source "$$HOME/.profile"; fi
			echo "FVM installation complete. Please restart your terminal or source your shell config if 'fvm' command is still not found."
			echo "Proceeding with 'fvm install' now, but future calls might require a new terminal."
		else
			echo "Error: 'curl' command not found. Please install curl or install FVM manually."
			echo "See: https://fvm.app/docs/getting_started/installation"
			exit 1
		fi
	fi
	@echo "Installing project-specific Flutter SDK via FVM..."
	@fvm install $(FLUTTER_VERSION) # Pass FLUTTER_VERSION if defined, otherwise FVM uses .fvm/fvm_config.json
	@$(MAKE) get

# Target to get Flutter project dependencies
# Accepts CLEAN_LOCK=true to remove pubspec.lock before getting packages
get:
	@echo "Getting Flutter project dependencies..."
	if [ "$(CLEAN_LOCK)" = "true" ]; then
		echo "Cleaning pubspec.lock..."
		rm -f pubspec.lock
	fi
	@fvm flutter pub get

# Target to run Flutter analysis (linting)
lint:
	@echo "Running Flutter analysis (linting)..."
	@fvm flutter analyze

# format: Format all .dart files. Pass CHECK=true to exit if not formatted.
format:
	@if [ "$(CHECK)" = "true" ]; then \
		echo "Checking for formatting issues..."; \
		fvm dart format --output=none --set-exit-if-changed .; \
	else \
		echo "Formatting all .dart files..."; \
		fvm dart format .; \
	fi

# Target to display help information for available commands
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  setup      : Checks for FVM, installs it if missing, installs project Flutter SDK, and gets dependencies."
	@echo "  get        : Gets Flutter project dependencies. Use 'make get CLEAN_LOCK=true' to remove pubspec.lock first."
	@echo "  lint       : Runs Flutter analysis (linting)."
	@echo "  format     : Formats all Dart code in the project."
	@echo "  help       : Displays this help message."

# Note for Windows users:
# FVM installation on Windows typically involves PowerShell, Chocolatey, or Scoop.
# Automating this directly in a generic Makefile target is complex.
# It's recommended to install FVM manually on Windows if you encounter issues.
# See: https://fvm.app/docs/getting_started/installation
