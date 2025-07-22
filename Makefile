.PHONY: default all get clean format lint help

# Default command to run when 'make' is called without a target.
# It displays the help message.
default: help

# Run the full suite of checks: get, format, and lint.
all: get format lint

# Get project dependencies using 'flutter pub get'.
get:
	@echo "Getting dependencies using FVM..."
	@fvm flutter pub get

# Clean the project build artifacts using 'flutter clean'.
clean:
	@echo "Cleaning project using FVM..."
	@fvm flutter clean

# Format all Dart files using 'dart format .'.
format:
	@echo "Formatting Dart files using FVM..."
	@fvm dart format .

# Lint all Dart files to check for style and potential errors using 'flutter analyze'.
lint:
	@echo "Linting Dart files using FVM..."
	@fvm flutter analyze

# Display this help message.
help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  help          Displays this help message. This is the default target."
	@echo "  all           Runs the full suite of checks: get, format, and lint."
	@echo "  get           Fetches project dependencies using 'fvm flutter pub get'."
	@echo "  clean         Removes build artifacts with 'fvm flutter clean'."
	@echo "  format        Formats all Dart files in the project with 'fvm dart format .'."
	@echo "  lint          Analyzes the project's source code for errors and warnings with 'fvm flutter analyze'."
