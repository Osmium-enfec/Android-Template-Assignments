#!/bin/bash

##############################################################################
# Assignment 1 Validator - Universal Wrapper
# Works both from host and inside container
# Usage: bash validator.sh
##############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect if we're inside the container or on host
if [ -d "/validator" ] && [ -d "/submission" ] && [ -f "/validator/validate_xml.py" ]; then
    # === INSIDE CONTAINER - Run tests ===
    
    VALIDATOR_DIR="/validator"
    SUBMISSION_DIR="/submission"
    RESULTS_DIR="/tmp/validation_results"

    echo "Starting validation..."
    mkdir -p "$RESULTS_DIR"
    export PYTHONPATH="$VALIDATOR_DIR:$SUBMISSION_DIR:$PYTHONPATH"

    # Run pytest with JSON reporting (suppress output)
    pytest "$VALIDATOR_DIR/validate_xml.py" \
        --json-report \
        --json-report-indent=2 \
        --json-report-file="$RESULTS_DIR/report.json" \
        -q 2>&1 > /dev/null || true

    # Run enhancement script and only output JSON
    python "$VALIDATOR_DIR/enhance_json.py"

else
    # === ON HOST - Run docker ===

    # Detect architecture
    if [[ "${PWD}" == *"arm64"* ]]; then
        IMAGE_TAG="android-validator:arm64"
        echo -e "${YELLOW}Detected ARM64 architecture${NC}"
    else
        IMAGE_TAG="android-validator:latest"
        echo -e "${YELLOW}Detected x86_64 architecture${NC}"
    fi

    # Validate prerequisites
    if [ ! -d "submission" ]; then
        echo -e "${RED}✗ Error: 'submission' folder not found${NC}"
        echo "Please ensure submission/activity_main.xml exists"
        exit 1
    fi

    if [ ! -f "submission/activity_main.xml" ]; then
        echo -e "${RED}✗ Error: submission/activity_main.xml not found${NC}"
        exit 1
    fi

    if ! docker image inspect "$IMAGE_TAG" > /dev/null 2>&1; then
        echo -e "${RED}✗ Error: Docker image '$IMAGE_TAG' not found${NC}"
        echo "Load it first: docker load -i android-validator.tar"
        exit 1
    fi

    echo -e "${GREEN}✓ Starting validation...${NC}"
    echo ""

    # Run docker with all mounts - directly execute pytest (no verbose output)
    docker run -it --rm \
      -v "$(pwd)/submission:/submission" \
      -v "$(pwd)/validate_xml.py:/validator/validate_xml.py" \
      -v "$(pwd)/enhance_json.py:/validator/enhance_json.py" \
      -w /validator \
      "$IMAGE_TAG" \
      bash -c "
        export PYTHONPATH=/validator:/submission:\$PYTHONPATH
        mkdir -p /tmp/validation_results
        pytest /validator/validate_xml.py \
          --json-report \
          --json-report-indent=2 \
          --json-report-file=/tmp/validation_results/report.json \
          -q 2>&1 > /dev/null || true
        python /validator/enhance_json.py
      "

    echo ""
    echo -e "${GREEN}✓ Validation complete${NC}"
fi

exit 0

