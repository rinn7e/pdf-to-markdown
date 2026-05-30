#!/bin/bash

# Usage: ./tools/init-workspace.sh <PDF_NAME>
if [[ $# -lt 1 ]]; then
    echo "Error: Missing PDF name."
    echo "Usage: ./tools/init-workspace.sh <PDF_NAME>"
    exit 1
fi

PDF_NAME=$1
PDF_SOURCE="/home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf/$PDF_NAME.pdf"

if [[ ! -f "$PDF_SOURCE" ]]; then
    echo "Error: PDF source not found at $PDF_SOURCE"
    exit 1
fi

WORKSPACE_DIR="temp/progress/$PDF_NAME"

echo "Creating workspace at $WORKSPACE_DIR..."
mkdir -p "$WORKSPACE_DIR/1-output-images"
mkdir -p "$WORKSPACE_DIR/2-clean-markdown"
mkdir -p "$WORKSPACE_DIR/2.1-en-markdown"
mkdir -p "$WORKSPACE_DIR/3-combine-markdown"

echo "Copying PDF to workspace..."
cp "$PDF_SOURCE" "$WORKSPACE_DIR/"

echo "Workspace initialized successfully at $WORKSPACE_DIR"
