#!/bin/bash
# Step 2: Align cleaned sequences with MAFFT
# Requires: mafft (sudo apt install mafft)

INPUT="data/gag_clean.fasta"
OUTPUT="data/gag_aligned.fasta"

if ! command -v mafft &> /dev/null; then
    echo "MAFFT not installed. Run: sudo apt install mafft"
    exit 1
fi

mafft --auto "$INPUT" > "$OUTPUT"
echo "Aligned: $OUTPUT"
