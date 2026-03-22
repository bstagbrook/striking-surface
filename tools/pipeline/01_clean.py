#!/usr/bin/env python3
"""Step 1: Clean HIV Gag sequences. Remove high-gap sequences."""

from Bio import SeqIO
import sys

INPUT = "data/gag_raw.fasta"
OUTPUT = "data/gag_clean.fasta"
MAX_GAP = 0.1

clean = []
total = 0

for record in SeqIO.parse(INPUT, "fasta"):
    total += 1
    seq = str(record.seq)
    gap_fraction = seq.count('-') / len(seq) if len(seq) > 0 else 1.0
    if gap_fraction < MAX_GAP:
        clean.append(record)

SeqIO.write(clean, OUTPUT, "fasta")
print(f"Cleaned: {len(clean)}/{total} sequences retained (gap threshold {MAX_GAP})")
