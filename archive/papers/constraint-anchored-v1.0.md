# Constraint-Anchored Information in Biological Systems
## A Constrained-Channel Theory of Immune Recognition, Viral Escape, Cancer Immunotherapy, and Genetic Code Robustness

**Bruce Stagbrook¹**
¹ Stagbrook Tech, San Francisco, CA

---

## Abstract

Biological systems must reliably extract signal under adversarial mutation. Classical information theory assumes unconstrained noise; biological mutation violates this assumption because it is bounded by viability. We propose a general framework in which biological detection operates over **constrained adversarial channels**, where the effective noise distribution is restricted by fitness landscapes.

We define a measurable quantity, **Constraint-Anchored Information (CAI)**, capturing the degree to which a detection system targets regions of state space that are resistant to mutation due to fitness costs. We show that this framework unifies:

1. Elite control of HIV associated with HLA-B*57
2. Immune recognition of cancer driver neoantigens
3. Error tolerance in the genetic code via codon degeneracy

We further introduce **escape topology** and **escape complexity (κ)** as graph-theoretic measures of evolutionary constraint, and derive predictions about epistasis, mutational coupling, and disease outcomes.

We provide a fully reproducible computational pipeline for testing these ideas using HIV sequence data and outline extensions to immunotherapy and protein engineering.

---

## 1. Core Principle

> **Reliable biological information arises when signals are anchored to regions of state space that cannot be altered without loss of viability.**

This principle defines **Constraint-Anchored Information (CAI)**.

---

## 2. Formal Model

### 2.1 State Space

Let:

- 𝓧 = all possible sequences
- 𝓥 ⊂ 𝓧 = viable sequences

### 2.2 Constraint Function

φ(x) = 1 if x ∈ 𝓥, else 0

### 2.3 Mutation Operator

T(x → x') is allowed only if φ(x') = 1

---

### 2.4 Signal Definition

A feature f is informative if:

Changing f ⇒ large drop in φ(x)

---

## 3. Constrained Channel

Classical:

    C > R

Biological:

    R_eff = Σ P(m_i) · fitness(m_i)

    Reliable detection ⇔ C_eff > R_eff

---

## 4. Constraint-Anchored Information (CAI)

### 4.1 Definitions

    H_i = entropy at position i

    MI_ij = mutual information between positions

### 4.2 Constraint Score

    C_i = (1 / (H_i + ε)) · (1 + Σ_j MI_ij)

### 4.3 CAI

    CAI = Σ_i E_i · C_i

Where E_i indicates targeting (e.g., epitope positions)

### Interpretation

- High CAI → targeting constrained regions
- Low CAI → targeting unconstrained regions

---

## 5. Escape Topology

### 5.1 Escape Graph

- Nodes = viable sequences
- Edges = single-step viable mutations

### 5.2 Escape Complexity

    κ = number of viable paths between states

### Interpretation

- Low κ → constrained escape (good control)
- High κ → easy escape

---

## 6. Epistasis

Non-factorizable mutation landscape:

    fitness(A+B) ≠ fitness(A) × fitness(B)

### Consequences

- Path dependence
- Mutation coupling
- Limited trajectories

---

## 7. Three Domains Unified

### 7.1 HIV

- HLA-B*57 targets conserved Gag regions
- Escape mutations reduce fitness
- Compensation required

Prediction:
- High CAI
- Low κ
- Strong epistasis

### 7.2 Cancer

- Driver mutations = constrained
- Driver neoantigens = signal

Prediction:
- Response correlates with CAI, not mutation count

### 7.3 Genetic Code

- Degeneracy absorbs mutations
- Preserves amino acid identity

Duality:
- Immune system → constrain
- Genetic code → absorb

---

## 8. Quantitative Framework

### 8.1 Entropy

    H_i = -Σ p(a) log₂ p(a)

### 8.2 Mutual Information

    MI_ij = Σ p(a,b) log₂ [p(a,b)/(p(a)p(b))]

### 8.3 CAI

    CAI = Σ E_i · C_i

### 8.4 Tests

1. Entropy(epitope) < Entropy(background)
2. I(E; conservation) > 0
3. MI(epitope pairs) > background
4. CAI(B*57) > CAI(other alleles)

---

## 9. Predictions

1. Protective HLA alleles maximize CAI
2. CAI correlates with viral suppression
3. Escape mutations show negative epistasis
4. Escape trajectories are constrained
5. Driver-constrained neoantigens predict immunotherapy success

---

## 10. Reproducible Pipeline

1. Download HIV Gag sequences (LANL HIV Database)
2. Remove high-gap sequences
3. Align with MAFFT
4. Compute per-position entropy
5. Compute pairwise mutual information
6. Compute CAI (aggregate constraint scores)
7. Statistical tests (Mann-Whitney U, mutual information)
8. Visualization (entropy distributions, MI heatmaps, CAI comparison)

---

## 11. Critical Path

### DATA
- Download HIV sequences
- Get epitope mappings for multiple HLA alleles

### COMPUTE
- Run entropy calculation
- Run MI computation
- Compute CAI

### COMPARE
- B*57 vs other alleles
- Plot CAI ranking

### VALIDATE
- Check statistical significance
- Run multiple datasets

### EXTEND
- Add longitudinal data (escape over time)
- Add clinical data (viral load)

### OPTIONAL HIGH-IMPACT
- Build escape graph
- Estimate κ (escape complexity)
- Correlate with disease progression

---

## 12. Figures Required

1. Entropy comparison (epitope vs background)
2. MI heatmap (epitope positions)
3. CAI across HLA alleles
4. Escape topology diagram

---

## 13. Publication Path

1. Run pipeline
2. Generate figures
3. Write results section
4. Submit to bioRxiv
5. Target: PLOS Computational Biology

---

## 14. General Law

> Systems achieve robustness by binding information to low-mobility regions of their state space.

---

## 15. Limitations

- Fitness approximated
- Phylogenetic bias
- Cancer heterogeneity
- Data quality constraints

---

## 16. Future Work

- Phylogeny-corrected MI
- Deep mutational scanning integration
- Structural modeling
- Cross-pathogen validation

---

## 17. References

- Shannon, C. E. (1948). A Mathematical Theory of Communication.
- Deeks, S. G., & Walker, B. D. (2007). HIV Controllers.
- Crawford, H. et al. (2007). HIV Escape Mutations.
- Brockman, M. A. et al. (2007). Compensatory Mutation.
- Pymm, P. et al. (2022). HLA-B57 Recognition.
- Woese, C. R. (1965). Genetic Code Evolution.
- Freeland, S. J., & Hurst, L. D. (1998). Genetic Code Optimality.
- Schneider, T. D. (2010). Molecular Information Theory.
- Barbieri, M. (2019). Information in Biology.
- Hutchison, C. A. et al. (2016). Minimal Genome.
- Frontiers in Immunology (2025). Neoantigen Prediction.
- ASCO Educational Book (2025). Immunotherapy Adaptation.

---

## Final Compression

Find what cannot change.
Anchor detection to it.
Measure how hard it is to escape.
That is the signal.
