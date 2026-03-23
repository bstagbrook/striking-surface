# IEDB-Powered Multi-Allele Analysis

## Date: 2026-03-23
## Data: 500 HIV-1 Gag sequences, IEDB T-cell epitope database

## Method
Queried IEDB API for HIV-1 T-cell epitopes restricted by each HLA allele.
Mapped epitope sequences to alignment positions by motif search.
Computed per-position Shannon entropy at epitope vs background positions.

## Results

| Allele | Protection | IEDB hits | Mapped | Positions | Epi H | Reduction | p-value |
|--------|-----------|----------|--------|-----------|-------|-----------|---------|
| B*27:05 | Protective | 5 | 2 | 12 | 0.057 | 78.7% | 0.120 |
| B*57:01 | Protective | 24 | 5 | 39 | 0.148 | 45.1% | 0.163 |
| B*07:02 | Non-protective | 54 | 3 | 26 | 0.169 | 36.7% | 0.112 |
| B*08:01 | Non-protective | 8 | 6 | 26 | 0.233 | 11.7% | 0.420 |
| A*02:01 | Non-protective | 26 | 11 | 37 | 0.242 | 8.2% | 0.773 |
| A*03:01 | Non-protective | 19 | 6 | 11 | 0.278 | -6.1% | 0.952 |

## Group Comparison

| Group | N | Mean reduction |
|-------|---|---------------|
| Protective | 2 | 61.9% |
| Non-protective | 4 | 12.6% |

Mann-Whitney U: p = 0.067

## Observations

1. Protective alleles show substantially higher entropy reduction (62% vs 13%)
2. B*07:02 shows unexpectedly high reduction (37%) for a non-protective allele
   - May target conserved regions but fail to confer protection for other reasons
   - (e.g., less effective epitope processing, cheaper escape at B*07 epitopes)
3. B*57:01 reduction is lower (45%) than hand-picked analysis (64%)
   - IEDB includes ALL epitopes, not just the most conserved ones
   - Dilution from less conserved B*57 epitopes outside Gag p24
4. Several alleles (B*13:02, B*81:01, B*58:01, B*35:01) had no epitopes
   mapping to the alignment — IEDB coverage is incomplete for some alleles

## Comparison with Hand-Picked Analysis

| Method | Protective mean | Non-protective mean | Separation |
|--------|----------------|--------------------| -----------|
| Hand-picked epitopes | 66.4% | -19.9% | Complete |
| IEDB all epitopes | 61.9% | 12.6% | Substantial but not complete |

The hand-picked analysis using well-characterized immunodominant epitopes
shows cleaner separation. The IEDB analysis includes all reported epitopes
(some of which may be subdominant or poorly characterized), which adds noise.

## Sources
- IEDB API: https://query-api.iedb.org/
- B*07:02 protection status: Pereyra et al. 2010
- B*08:01 protection status: standard classification
