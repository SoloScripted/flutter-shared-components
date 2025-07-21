.PHONY: all get clean format lint help

# Default command to run when 'make' is called without a target.
# It ensures dependencies are fetched, code is formatted, and passes all checks.
all: get format lint

# Get project dependencies using 'flutter pub get'.
get:
	@echo "Getting dependencies..."
	@flutter pub get

# Clean the project build artifacts using 'flutter clean'.
clean:
	@echo "Cleaning project..."
	@flutter clean

# Format all Dart files using 'dart format .'.
format:
	@echo "Formatting Dart files..."
	@dart format .

# Lint all Dart files to check for style and potential errors using 'flutter analyze'.
lint:
	@echo "Linting Dart files..."
	@flutter analyze

# Display this help message.
help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  all           Runs the full suite of checks: get, format, and lint. This is the default target."
	@echo "  get           Fetches project dependencies using 'flutter pub get'."
	@echo "  clean         Removes build artifacts with 'flutter clean'."
	@echo "  format        Formats all Dart files in the project with 'dart format .'."
	@echo "  lint          Analyzes the project's source code for errors and warnings with 'flutter analyze'."
	@echo "  help          Displays this help message."
