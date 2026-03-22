# Complete Analysis Results

## Date: 2026-03-22
## Data: 390 HIV-1 Gag sequences (subtype B), MAFFT aligned

---

## 1. Multi-Allele Entropy

| Allele | Protection | Epi H | Bg H | Reduction | p-value |
|--------|-----------|-------|------|-----------|---------|
| B*57 | Strongest | 0.025 | 0.170 | 85.0% | 0.000016 |
| B*27 | Strong | 0.048 | 0.164 | 70.9% | 0.125 |
| A*02 | None | 0.289 | 0.160 | -80.9% | 0.927 |
| A*03 | None | 0.211 | 0.161 | -30.9% | 0.959 |

## 2. Bootstrap (1000 resamples)

| Metric | Value |
|--------|-------|
| Mean reduction | 84.7% |
| 95% CI | 80.1% - 89.7% |
| Fraction p<0.05 | 100.0% |
| Fraction p<0.01 | 100.0% |
| Fraction p<0.001 | 100.0% |

## 3. CAI Ranking

| Allele | CAI/pos | Ratio |
|--------|---------|-------|
| B*57 | 800,004 | 2.07x |
| B*27 | 600,005 | 1.48x |
| A*02 | 222,230 | 0.54x |
| A*03 | 21 | 0.00x |

## 4. Phylogeny-Corrected MI (APC)

| Pair type | Mean MIp | n | p-value |
|-----------|----------|---|---------|
| Epitope | 0.0073 | 15 | 0.434 |
| Non-epitope | 0.0020 | 105 | — |

Direction correct (3.7x higher) but not significant (n too small).

## 5. Escape Topology — TW10

| Metric | Value |
|--------|-------|
| Unique variants | 1 (TSTLQEQIGW) |
| κ (escape paths) | 0 |
| Conservation | 100% invariant |

TW10 is perfectly conserved. No single-step escape observed.

## 6. Per-Epitope Entropy

| Epitope | H | HLA |
|---------|------|-----|
| TW10 | 0.000 | B*57 |
| KF11 | 0.019 | B*57 |
| IW9 | 0.062 | B*57 |
| KK10 | 0.048 | B*27 |
| SL9 | 0.289 | A*02 |
