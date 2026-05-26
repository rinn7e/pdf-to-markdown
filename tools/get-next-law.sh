#!/bin/bash

# Get the last completed law name from temp/done
LAST_LAW_NAME=$(ls -1 temp/done 2>/dev/null | LC_ALL=C sort | tail -n 1)

# Find the next PDF file in the sorted list of PDFs in cambodia-law-raw-pdf
RAW_PDF_DIR="/home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf"
PDFS=($(ls -1 "$RAW_PDF_DIR"/*.pdf 2>/dev/null | LC_ALL=C sort | xargs -n 1 basename))

if [ ${#PDFS[@]} -eq 0 ]; then
    echo "Error: No PDFs found in $RAW_PDF_DIR" >&2
    exit 1
fi

if [ -z "$LAST_LAW_NAME" ]; then
    # If done directory is empty, return the first PDF
    LAW_NAME="${PDFS[0]%.pdf}"
else
    FOUND=0
    LAW_NAME=""
    for pdf in "${PDFS[@]}"; do
        if [ "$FOUND" -eq 1 ]; then
            LAW_NAME="${pdf%.pdf}"
            break
        fi
        if [ "$pdf" = "$LAST_LAW_NAME.pdf" ]; then
            FOUND=1
        fi
    done
fi

if [ -z "$LAW_NAME" ]; then
    echo "Error: No successor law found (all laws processed or LAST_LAW_NAME not in PDF list)" >&2
    exit 1
fi

echo "$LAW_NAME"
