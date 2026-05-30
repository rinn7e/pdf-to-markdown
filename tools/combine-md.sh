#!/bin/bash

# Usage: ./tools/combine-md.sh <PDF_NAME>
if [[ $# -lt 1 ]]; then
    echo "Error: Missing PDF name."
    echo "Usage: ./tools/combine-md.sh <PDF_NAME>"
    exit 1
fi

PDF_NAME=$1
WORKSPACE_DIR="temp/progress/$PDF_NAME"

if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "Error: Workspace directory $WORKSPACE_DIR not found."
    exit 1
fi

COMBINE_DIR="3-combine-markdown/$PDF_NAME"
mkdir -p "$WORKSPACE_DIR/$COMBINE_DIR"

cd 3-combine-markdown || exit 1

# Combine Original Language
echo "Combining original language markdown files..."
stack run -- \
  -i "../$WORKSPACE_DIR/2-clean-markdown" \
  -o "../$WORKSPACE_DIR/$COMBINE_DIR" \
  -n "$PDF_NAME"

# Combine English (if exists)
if [[ -d "../$WORKSPACE_DIR/2.1-en-markdown" ]]; then
    echo "Combining English markdown files..."
    stack run -- \
      -i "../$WORKSPACE_DIR/2.1-en-markdown" \
      -o "../$WORKSPACE_DIR/$COMBINE_DIR" \
      -n "$PDF_NAME-en"
fi
