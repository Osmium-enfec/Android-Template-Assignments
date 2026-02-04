#!/bin/bash
# Validator Script for x86 architecture
# Executes validation tests and outputs JSON results

set -e

VALIDATOR_DIR="/validator"
SUBMISSION_DIR="/submission"
RESULTS_DIR="/tmp/validation_results"

# Initialize mode: just start the container
if [ "$1" = "init" ]; then
    echo "✓ Android XML Validator initialized"
    echo "✓ Ready for validation commands"
    tail -f /dev/null
    exit 0
fi

# Validation mode: run tests
echo "Starting validation..."

# Create results directory
mkdir -p "$RESULTS_DIR"

# Set Python path to include validator and submission
export PYTHONPATH="$VALIDATOR_DIR:$SUBMISSION_DIR:$PYTHONPATH"

# Run pytest with JSON reporting
pytest "$VALIDATOR_DIR/validate_xml.py" \
    --json-report \
    --json-report-indent=2 \
    --json-report-file="$RESULTS_DIR/report.json" \
    -v --tb=short 2>&1 || true

# Run enhancement script to add statistics
python "$VALIDATOR_DIR/enhance_json.py"

exit 0
