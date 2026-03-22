# Constraint-Shaped Information in Biological Systems
## A Unified Channel Model of Immune Recognition, Cancer Immunotherapy, and Genetic Code Error Correction

**Bruce Stagbrook¹**
¹ Stagbrook Tech, San Francisco, CA

---

## Abstract

We propose that immune recognition, tumor immunogenicity, and genetic code robustness are governed by a shared principle: reliable information transfer emerges when signals are anchored to regions of state space that cannot be freely mutated without incurring fitness cost. We formalize this using a constrained-channel extension of Shannon's framework, in which noise is shaped by viability.

We introduce a measurable quantity, Constraint-Anchored Information (CAI), capturing the degree to which detection systems target constrained regions. We provide a reproducible computational framework using HIV Gag sequence data to quantify entropy, mutual information, and epistasis, and outline tests comparing HLA alleles.

---

## 1. Introduction

Shannon's channel coding theorem establishes that reliable communication is possible over a noisy channel if transmission rate does not exceed channel capacity (Shannon, 1948). Classical treatments assume noise is stochastic and unconstrained.

Biological systems violate this assumption.

Mutation is not free:
- Some mutations are lethal
- Some impose fitness penalties
- Some constrain future mutational options

Thus, biological "noise" is **adversarial but bounded by viability**.

This motivates a refinement of the classical model:

> **Biological communication occurs over constrained channels, where the noise distribution is shaped by fitness landscapes.**

We demonstrate that three systems — viral immune escape, tumor evolution, and genetic encoding — are instances of this principle.

---

## 2. Constrained Channel Model

### 2.1 State Space

Let:
- 𝓧 = all possible sequences
- 𝓥 ⊂ 𝓧 = viable sequences

### 2.2 Constraint Function

    φ(x) = 1 if x ∈ 𝓥, else 0

### 2.3 Mutation Operator

    T(x → x') is allowed only if φ(x') = 1

### 2.4 Signal Definition

A feature f is informative if:

    Changing f ⇒ large drop in φ(x)

### 2.5 Constrained Channel Condition

Classical:

    C > R

Biological:

    R_eff = Σ P(m_i) · fitness(m_i)

    Reliable detection ⇔ C_eff > R_eff

---

## 3. Constraint-Anchored Information (CAI)

### 3.1 Definitions

    H_i = Shannon entropy at position i
    MI_ij = mutual information between positions i and j

### 3.2 Constraint Score

    C_i = (1 / (H_i + ε)) · (1 + Σ_j MI_ij)

### 3.3 CAI

    CAI = Σ_i E_i · C_i

Where E_i ∈ {0,1} indicates epitope targeting.

### Interpretation

- High CAI → targeting constrained regions
- Low CAI → targeting unconstrained regions

---

## 4. Escape Topology

### 4.1 Escape Graph

- Nodes = viable sequences
- Edges = single-step viable mutations

### 4.2 Escape Complexity

    κ = number of viable paths between states

### Interpretation

- Low κ → constrained escape (good control)
- High κ → easy escape

---

## 5. Epistasis

Non-factorizable mutation landscape:

    fitness(A+B) ≠ fitness(A) × fitness(B)

### Consequences

- Path dependence
- Mutation coupling
- Limited trajectories

---

## 6. Three Domains Unified

### 6.1 HIV

- HLA-B*57 targets conserved Gag regions
- Escape mutations reduce fitness (T242N: 42% reduction, Crawford et al. 2007)
- Compensation required (CypA binding loop)
- Escape reverts without immune pressure (Brockman et al. 2007)

Prediction: High CAI, Low κ, Strong epistasis

### 6.2 Cancer

- Driver mutations = constrained
- Driver neoantigens = signal

Prediction: Response correlates with CAI, not total mutation count

### 6.3 Genetic Code

- Degeneracy absorbs mutations at wobble position
- Preserves amino acid identity

Duality:
- Immune system → constrain mutations
- Genetic code → absorb mutations

---

## 7. Quantitative Framework

### 7.1 Data Sources

- HIV-1 Gag sequences: Los Alamos National Laboratory (LANL) HIV Sequence Database
- Reference alignment: subtype B Gag multiple sequence alignment
- Epitope annotations: Pymm et al. 2022

### 7.2 Preprocessing

1. Filter: remove sequences with >10% gaps
2. Restrict to subtype B
3. Align with MAFFT
4. Map to HXB2 reference coordinates

### 7.3 Entropy

    H_i = -Σ p(a) log₂ p(a)

### 7.4 Mutual Information

    MI_ij = Σ p(a,b) log₂ [p(a,b) / (p(a)p(b))]

### 7.5 CAI

    CAI = Σ E_i · C_i

### 7.6 Statistical Tests

1. Mann-Whitney U: epitope vs non-epitope entropy
2. MI comparison: epitope pairs vs background
3. CAI ranking across HLA alleles

---

## 8. Predictions

1. HLA-B*57 exhibits higher CAI than other alleles
2. CAI correlates with viral suppression
3. Epitope positions show higher epistatic coupling
4. Escape trajectories are constrained
5. Driver-constrained neoantigens predict immunotherapy success

---

## 9. Limitations

- Entropy sensitive to sampling bias
- MI inflated by phylogeny (correction required)
- Fitness approximated indirectly
- Cancer heterogeneity may break assumptions

---

## 10. Methods

All analyses reproducible using Python (NumPy, SciPy, BioPython) and MAFFT. Pipeline documented in repository.

---

## 11. Conclusion

Biological systems achieve reliability by anchoring information to constrained regions of state space.

> Find what cannot change. Anchor detection to it. Measure how hard it is to escape. That is the signal.

---

## References

- Shannon, C. E. (1948). A Mathematical Theory of Communication. Bell System Technical Journal, 27, 379-423.
- Deeks, S. G., & Walker, B. D. (2007). HIV Controllers. Immunity, 27(3), 406-416.
- Crawford, H. et al. (2007). Escape and Compensation from HLA-B57 Pressure. Journal of Virology, 81(22), 12382-12393.
- Brockman, M. A. et al. (2007). Compensatory Mutation. Journal of Virology, 81(15), 8346-8351.
- Pymm, P. et al. (2022). Protective HLA-B57. Biochemical Society Transactions, 50(6), 1751-1761.
- Woese, C. R. (1965). Genetic Code Evolution. PNAS, 54(6), 1546-1552.
- Freeland, S. J., & Hurst, L. D. (1998). Genetic Code Optimality. Journal of Molecular Evolution, 47, 238-248.
- Schneider, T. D. (2010). Molecular Information Theory. Nano Communication Networks, 1(3), 173-180.
- Barbieri, M. (2019). Information in Biology. BioSystems, 185, 104023.
- Hutchison, C. A. et al. (2016). Minimal Genome. Science, 351(6280), aad6253.
- Frontiers in Immunology (2025). Neoantigen Prediction.
- ASCO Educational Book (2025). Immunotherapy Adaptation.
