#!/bin/bash

# Usage: ./tools/combine-md.sh <LAW_NAME>
if [[ $# -lt 1 ]]; then
    echo "Error: Missing law name."
    echo "Usage: ./tools/combine-md.sh <LAW_NAME>"
    exit 1
fi

LAW_NAME=$1
WORKSPACE_DIR="temp/progress/$LAW_NAME"

if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "Error: Workspace directory $WORKSPACE_DIR not found."
    exit 1
fi

COMBINE_DIR="3-combine-markdown/$LAW_NAME"
mkdir -p "$WORKSPACE_DIR/$COMBINE_DIR"

cd 3-combine-markdown || exit 1

# Combine Khmer
echo "Combining Khmer markdown files..."
stack run -- \
  -i "../$WORKSPACE_DIR/2-clean-markdown" \
  -o "../$WORKSPACE_DIR/$COMBINE_DIR" \
  -n "$LAW_NAME"

# Combine English
echo "Combining English markdown files..."
stack run -- \
  -i "../$WORKSPACE_DIR/2.1-en-markdown" \
  -o "../$WORKSPACE_DIR/$COMBINE_DIR" \
  -n "$LAW_NAME-en"
