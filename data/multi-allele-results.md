# Multi-Allele CAI Comparison

## Date: 2026-03-22
## Data: 390 HIV-1 Gag sequences (subtype B filtered), MAFFT aligned

## Epitope Positions (motif-mapped)
- B*57: IW9=156, KF11=171, TW10=249
- B*27: KK10=272 (KRWIILGLNK/KRWIIMGLNK)
- A*02: SL9=76 (SLYNTVATL)
- A*03: RK9=19 (RLRPGGKKK)

## Entropy Comparison

| Allele | Protection | Epitope H | Background H | Reduction | p-value |
|--------|-----------|----------|-------------|-----------|---------|
| B*57   | Strongest | 0.025    | 0.170       | 85.0%     | 0.000016 |
| B*27   | Strong    | 0.048    | 0.164       | 70.9%     | 0.125    |
| A*02   | None      | 0.289    | 0.160       | -80.9%    | 0.927    |
| A*03   | None      | 0.211    | 0.161       | -30.9%    | 0.959    |

## CAI Comparison

| Allele | CAI/position | Background | Ratio |
|--------|-------------|-----------|-------|
| B*57   | 800,004     | 386,148   | 2.07x |
| B*27   | 600,005     | 405,723   | 1.48x |
| A*02   | 222,230     | 412,557   | 0.54x |
| A*03   | 21          | 416,359   | 0.00x |

## Key Finding

CAI ranking matches known clinical protection hierarchy exactly:

    B*57 (2.07x) > B*27 (1.48x) > background (1.00x) > A*02 (0.54x) > A*03 (0.00x)

Protective alleles target constrained regions (high CAI).
Non-protective alleles target variable regions (low CAI).

## Sources
- B*57 epitopes: Pymm et al. 2022
- B*27 KK10: Schneidewind et al. 2007 (PubMed 17804494)
- A*02 SL9: standard reference
- Protection hierarchy: Deeks & Walker 2007, Pereyra et al. 2010
