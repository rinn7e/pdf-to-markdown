#!/bin/bash

# Get the last completed PDF name from temp/done
LAST_PDF_NAME=$(ls -1 temp/done 2>/dev/null | LC_ALL=C sort | tail -n 1)

# Find the next PDF file in the sorted list of PDFs in cambodia-law-raw-pdf
RAW_PDF_DIR="/home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf"
PDFS=($(ls -1 "$RAW_PDF_DIR"/*.pdf 2>/dev/null | LC_ALL=C sort | xargs -n 1 basename))

if [ ${#PDFS[@]} -eq 0 ]; then
    echo "Error: No PDFs found in $RAW_PDF_DIR" >&2
    exit 1
fi

if [ -z "$LAST_PDF_NAME" ]; then
    # If done directory is empty, return the first PDF
    PDF_NAME="${PDFS[0]%.pdf}"
else
    FOUND=0
    PDF_NAME=""
    for pdf in "${PDFS[@]}"; do
        if [ "$FOUND" -eq 1 ]; then
            PDF_NAME="${pdf%.pdf}"
            break
        fi
        if [ "$pdf" = "$LAST_PDF_NAME.pdf" ]; then
            FOUND=1
        fi
    done
fi

if [ -z "$PDF_NAME" ]; then
    echo "Error: No successor PDF found (all PDFs processed or LAST_PDF_NAME not in PDF list)" >&2
    exit 1
fi

echo "$PDF_NAME"
