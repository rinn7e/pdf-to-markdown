#!/bin/bash

# Usage: ./tools/pdf-to-images.sh <PDF_NAME>
if [[ $# -lt 1 ]]; then
    echo "Error: Missing PDF name."
    echo "Usage: ./tools/pdf-to-images.sh <PDF_NAME>"
    exit 1
fi

PDF_NAME=$1
WORKSPACE_DIR="temp/progress/$PDF_NAME"

if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "Error: Workspace directory $WORKSPACE_DIR not found."
    exit 1
fi

PDF_PATH="../$WORKSPACE_DIR/$PDF_NAME.pdf"
OUTPUT_DIR="../$WORKSPACE_DIR/1-output-images"

echo "Running pdf-to-images extraction..."
cd 1-pdf-to-images || exit 1
stack run -- "$PDF_PATH" -o "$OUTPUT_DIR" -p page -f png
