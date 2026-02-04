#!/bin/bash

##############################################################################
# Assignment 1 Validator Wrapper
# Run this from the extracted distribution folder
# Usage: bash validator.sh
##############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect which image tag to use
if [[ "${PWD}" == *"arm64"* ]]; then
    IMAGE_TAG="android-validator:arm64"
    echo -e "${YELLOW}Detected ARM64 architecture${NC}"
else
    IMAGE_TAG="android-validator:latest"
    echo -e "${YELLOW}Detected x86_64 architecture${NC}"
fi

# Check if submission folder exists
if [ ! -d "submission" ]; then
    echo -e "${RED}✗ Error: 'submission' folder not found${NC}"
    echo "Please ensure submission/activity_main.xml exists in current directory"
    exit 1
fi

# Check if activity_main.xml exists
if [ ! -f "submission/activity_main.xml" ]; then
    echo -e "${RED}✗ Error: submission/activity_main.xml not found${NC}"
    exit 1
fi

# Check if image is loaded
if ! docker image inspect "$IMAGE_TAG" > /dev/null 2>&1; then
    echo -e "${RED}✗ Error: Docker image '$IMAGE_TAG' not found${NC}"
    echo "Load the image first:"
    echo "  docker load -i android-validator.tar"
    exit 1
fi

echo -e "${GREEN}✓ Starting validation...${NC}"
echo ""

# Run docker with all mounts
docker run -it --rm \
  -v "$(pwd)/submission:/submission" \
  -v "$(pwd)/validate_xml.py:/validator/validate_xml.py" \
  -v "$(pwd)/enhance_json.py:/validator/enhance_json.py" \
  -v "$(pwd)/validator.sh:/validator/validator.sh" \
  -w /validator \
  "$IMAGE_TAG" \
  bash /validator/validator.sh

echo ""
echo -e "${GREEN}✓ Validation complete${NC}"
