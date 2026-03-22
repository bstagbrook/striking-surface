# CAI Computation Pipeline

## Constraint-Anchored Information for HIV Gag / HLA-B*57

### Prerequisites

```bash
pip install biopython scipy
sudo apt install mafft
```

### Step A — Get Data

Download HIV-1 Gag protein alignment (subtype B) from:
https://www.hiv.lanl.gov/content/sequence/NEWALIGN/align.html

Select:
- Organism: HIV-1
- Region: Gag
- Subtype: B
- Alignment type: Filtered web
- Format: FASTA

Save as: `data/gag_raw.fasta`

### Step B — Clean

```bash
python3 tools/pipeline/01_clean.py
```

Output: `data/gag_clean.fasta`

### Step C — Align

```bash
bash tools/pipeline/02_align.sh
```

Output: `data/gag_aligned.fasta`

### Step D — Analyze

```bash
python3 tools/pipeline/03_analyze.py
```

Output: entropy comparison, MI analysis, CAI computation

### What You Get

1. Entropy comparison: epitope vs non-epitope positions (Mann-Whitney U)
2. Mutual information: epistatic coupling at epitope positions
3. CAI score for HLA-B*57 epitopes vs background
4. Summary statistics

### Next Steps (v1.3)

- Add multiple HLA allele epitope sets
- Compute CAI for each allele
- Rank alleles by CAI
- Correlate with published viral control data
