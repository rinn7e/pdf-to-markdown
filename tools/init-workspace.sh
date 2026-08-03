#!/bin/bash

# Usage: ./tools/init-workspace.sh <PDF_NAME>
if [[ $# -lt 1 ]]; then
    echo "Error: Missing PDF name."
    echo "Usage: ./tools/init-workspace.sh <PDF_NAME>"
    exit 1
fi

ARG=$1
if [[ -f "$ARG" ]]; then
    PDF_SOURCE="$ARG"
    PDF_NAME=$(basename "$ARG" .pdf)
elif [[ -n "$2" && -f "$2" ]]; then
    PDF_NAME="$1"
    PDF_SOURCE="$2"
else
    PDF_NAME="$1"
    PDF_SOURCE="/Users/rinn7e/projects/serokell/chatfusion/chatfusion-dev/docs/$PDF_NAME.pdf"
fi

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
