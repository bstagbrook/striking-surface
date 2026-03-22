#!/usr/bin/env python3
"""Step 3: Compute entropy, MI, and CAI from aligned HIV Gag sequences."""

from collections import Counter
from itertools import combinations
from scipy.stats import mannwhitneyu
from Bio import SeqIO

INPUT = "data/gag_aligned.fasta"

# HLA-B*57 epitope positions (HXB2 Gag numbering)
# IW9: 138-146, KF11: 162-172, TW10: 240-249
EPITOPE_POSITIONS = set(range(138, 147)) | set(range(162, 173)) | set(range(240, 250))

def log2(x):
    if x <= 0:
        return 0
    ln2 = 0.6931471805599453
    k = 0
    m = x
    while m >= 2:
        m /= 2
        k += 1
    while m < 1:
        m *= 2
        k -= 1
    y = (m - 1) / (m + 1)
    ln_m = sum(2 * y**(2*i+1) / (2*i+1) for i in range(30))
    return (ln_m + k * ln2) / ln2

def entropy(col):
    counts = Counter(c for c in col if c != '-' and c != 'X')
    total = sum(counts.values())
    if total == 0:
        return 0
    return -sum((c/total) * log2(c/total) for c in counts.values() if c > 0)

def mutual_info(seqs, i, j):
    pairs = [(s[i], s[j]) for s in seqs if s[i] not in ('-','X') and s[j] not in ('-','X')]
    total = len(pairs)
    if total < 10:
        return 0
    joint = Counter(pairs)
    px = Counter(p[0] for p in pairs)
    py = Counter(p[1] for p in pairs)
    mi = 0
    for (a, b), c in joint.items():
        pxy = c / total
        pa = px[a] / total
        pb = py[b] / total
        if pa > 0 and pb > 0 and pxy > 0:
            mi += pxy * log2(pxy / (pa * pb))
    return mi

# Load alignment
print("Loading alignment...")
seqs = [str(r.seq) for r in SeqIO.parse(INPUT, "fasta")]
L = len(seqs[0]) if seqs else 0
N = len(seqs)
print(f"Sequences: {N}, Length: {L}")

# Compute per-position entropy
print("Computing entropy...")
H = [entropy([s[i] for s in seqs]) for i in range(L)]

# Epitope indicator
E = [1 if i in EPITOPE_POSITIONS else 0 for i in range(L)]

# Entropy comparison
H_epi = [H[i] for i in range(L) if E[i] == 1]
H_non = [H[i] for i in range(L) if E[i] == 0]

print(f"\n{'='*60}")
print(f"ENTROPY COMPARISON")
print(f"{'='*60}")
print(f"Epitope positions (n={len(H_epi)}): mean={sum(H_epi)/max(len(H_epi),1):.4f}")
print(f"Non-epitope (n={len(H_non)}): mean={sum(H_non)/max(len(H_non),1):.4f}")

if H_epi and H_non:
    stat, pval = mannwhitneyu(H_epi, H_non, alternative='less')
    print(f"Mann-Whitney U (epitope < non-epitope): p={pval:.6f}")
    if pval < 0.05:
        print("SIGNIFICANT: epitope positions are more conserved")
    else:
        print("NOT SIGNIFICANT at p<0.05")

# Compute MI for epitope positions (pairwise)
print(f"\nComputing pairwise MI for epitope positions...")
epi_positions = sorted(EPITOPE_POSITIONS & set(range(L)))
mi_values = []
for i, j in combinations(epi_positions, 2):
    mi = mutual_info(seqs, i, j)
    if mi > 0:
        mi_values.append(mi)

# MI for random background pairs
import random
random.seed(42)
bg_positions = [i for i in range(L) if i not in EPITOPE_POSITIONS]
bg_mi = []
for _ in range(len(mi_values)):
    i, j = random.sample(bg_positions, 2)
    mi = mutual_info(seqs, i, j)
    if mi > 0:
        bg_mi.append(mi)

print(f"\n{'='*60}")
print(f"MUTUAL INFORMATION")
print(f"{'='*60}")
if mi_values:
    print(f"Epitope pairs MI: mean={sum(mi_values)/len(mi_values):.4f} (n={len(mi_values)})")
if bg_mi:
    print(f"Background pairs MI: mean={sum(bg_mi)/len(bg_mi):.4f} (n={len(bg_mi)})")
if mi_values and bg_mi:
    stat, pval = mannwhitneyu(mi_values, bg_mi, alternative='greater')
    print(f"Mann-Whitney U (epitope MI > background MI): p={pval:.6f}")

# Compute CAI
print(f"\n{'='*60}")
print(f"CONSTRAINT-ANCHORED INFORMATION (CAI)")
print(f"{'='*60}")

MI_sum = [0.0] * L
for i in epi_positions:
    for j in epi_positions:
        if i != j:
            MI_sum[i] += mutual_info(seqs, i, j)

epsilon = 1e-6
C = [(1.0 / (H[i] + epsilon)) * (1.0 + MI_sum[i]) for i in range(L)]

CAI = sum(C[i] for i in range(L) if E[i] == 1)
CAI_bg = sum(C[i] for i in range(L) if E[i] == 0) / max(sum(1 for i in range(L) if E[i] == 0), 1) * sum(E)

print(f"CAI (B*57 epitopes): {CAI:.2f}")
print(f"CAI (equivalent background): {CAI_bg:.2f}")
print(f"CAI ratio: {CAI/max(CAI_bg,0.01):.2f}x")

print(f"\n{'='*60}")
print(f"SUMMARY")
print(f"{'='*60}")
print(f"Sequences: {N}")
print(f"Alignment length: {L}")
print(f"Epitope positions: {len(epi_positions)}")
print(f"Entropy reduction: {(1 - sum(H_epi)/max(len(H_epi),1) / (sum(H_non)/max(len(H_non),1) + epsilon)) * 100:.1f}%")
print(f"CAI advantage: {CAI/max(CAI_bg,0.01):.2f}x")
