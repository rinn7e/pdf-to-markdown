#!/bin/bash

# next - script to automate setting up the next law digitization project
# Usage: ./next <name> --old <old-name> --sample <sample-name>

# Check for at least 3 arguments (NAME + 2 flags)
if [[ $# -lt 5 ]]; then
    echo "Usage: ./next <name> --old <old-name> --sample <sample-name>"
    exit 1
fi

NAME=$1
shift

OLD_NAME=""
SAMPLE_NAME=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --old)
            OLD_NAME="$2"
            shift 2
            ;;
        --sample)
            SAMPLE_NAME="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done

if [[ -z "$NAME" || -z "$OLD_NAME" || -z "$SAMPLE_NAME" ]]; then
    echo "Error: Missing required arguments."
    echo "Usage: ./next <name> --old <old-name> --sample <sample-name>"
    exit 1
fi

echo "--- Starting Digitization Setup ---"
echo "New Name: $NAME"
echo "Old Name: $OLD_NAME"
echo "Sample:   $SAMPLE_NAME"

# 1. Move examples/<old-name> dir, to temp/<old-name>
if [ -d "examples/$OLD_NAME" ]; then
    mkdir -p temp
    echo "Moving examples/$OLD_NAME to temp/$OLD_NAME..."
    mv "examples/$OLD_NAME" temp/
else
    echo "Warning: examples/$OLD_NAME not found, skipping move."
fi

# 2. Setup examples/<name> directory
echo "Creating examples/$NAME..."
mkdir -p "examples/$NAME"

# 3. Copy .sh and .md files in examples/<sample-name> to examples/<name>
if [ -d "examples/$SAMPLE_NAME" ]; then
    echo "Copying .sh and .md files from $SAMPLE_NAME..."
    cp examples/"$SAMPLE_NAME"/*.sh examples/"$NAME"/
    cp examples/"$SAMPLE_NAME"/*.md examples/"$NAME"/
else
    echo "Error: Sample directory examples/$SAMPLE_NAME not found."
    exit 1
fi

# 4. Copy /home/rinne/projects/my-package/cambodia-law-raw-pdf/<name>.pdf to examples/<name>
PDF_SOURCE="/home/rinne/projects/my-package/cambodia-law-raw-pdf/$NAME.pdf"
if [ -f "$PDF_SOURCE" ]; then
    echo "Copying PDF: $PDF_SOURCE..."
    cp "$PDF_SOURCE" "examples/$NAME/"
else
    echo "Error: PDF file not found at $PDF_SOURCE"
    exit 1
fi

# 5. Find-and-replace text in examples/<name>, where text = <sample-name>, with <name>
echo "Replacing '$SAMPLE_NAME' with '$NAME' in scripts and markdown files..."
# We use | as delimiter for sed to avoid issues with special characters
# Target only .sh and .md files to avoid touching the PDF
find "examples/$NAME" -type f \( -name "*.sh" -o -name "*.md" \) -exec sed -i "s|$SAMPLE_NAME|$NAME|g" {} +

# 6. cd into examples/<name>, exec ./0-init.sh then exec ./1-pdf-to-images.sh
echo "Changing directory to examples/$NAME"
cd "examples/$NAME" || exit 1

# Make sure scripts are executable
chmod +x ./0-init.sh ./1-pdf-to-images.sh

echo "Executing ./0-init.sh..."
if [ -f "./0-init.sh" ]; then
    ./0-init.sh
else
    echo "Error: ./0-init.sh not found in examples/$NAME!"
    exit 1
fi

echo "Executing ./1-pdf-to-images.sh..."
if [ -f "./1-pdf-to-images.sh" ]; then
    ./1-pdf-to-images.sh
else
    echo "Error: ./1-pdf-to-images.sh not found in examples/$NAME!"
    exit 1
fi

echo "--- Setup Complete ---"
