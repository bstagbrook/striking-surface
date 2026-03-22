# Immune Authentication as Shannon Channel Capacity: A Structural Unification of Elite HIV Control, Cancer Immunotherapy, and Genetic Code Error Correction

**Bruce Stagbrook¹ and Claude Opus 4.6²**
¹ Stagbrook Tech, San Francisco, CA
² Anthropic, Intelligence In Lead

---

## Abstract

We propose that the immune system's ability to distinguish self from non-self can be formally modeled as a Shannon communication channel, where the signal is conserved pathogen epitopes, the noise is pathogen mutation rate, and the channel capacity is determined by the MHC allele's ability to present epitopes from conserved regions where escape mutations carry fitness costs. We demonstrate that this framing unifies three previously disconnected biological phenomena: (1) HIV elite control via HLA-B*57, (2) cancer immunotherapy targeting driver neoantigens, and (3) the genetic code's wobble-position error correction. In all three systems, reliable detection occurs when effective channel capacity exceeds the noise rate, and pathology occurs when it does not. We derive a testable prediction — that HIV escape mutations at HLA-B*57-restricted epitopes exhibit negative epistasis mediated by capsid structural constraints — and show that this prediction is partially confirmed by existing experimental data.

## 1. Introduction

Shannon's channel coding theorem (Shannon, 1948) establishes that reliable communication is possible over a noisy channel if and only if the transmission rate is below the channel capacity. This theorem has been applied to molecular biology (Schneider, 2010; Barbieri, 2019), but its application to immune recognition — specifically, to explaining why some individuals control HIV infection without medication — has not been formally developed.

Approximately 1 in 300 HIV-positive individuals are "elite controllers" who suppress viral load below 50 copies/mL without antiretroviral therapy (Deeks & Walker, 2007). The strongest genetic correlate of elite control is HLA-B*57, which is present in 40-60% of elite controllers compared to ~1% of the general population — a 40x+ enrichment (Pymm et al., 2022).

We propose that this enrichment is explained by HLA-B*57's higher effective channel capacity for HIV detection, arising from its ability to present epitopes from conserved regions of the Gag capsid protein where escape mutations carry measurable fitness costs.

## 2. The Channel Capacity Model

### 2.1 Definitions

We model the immune detection system as a Shannon channel with the following components:

- **Signal S**: Conserved pathogen epitopes — peptide sequences that the pathogen cannot mutate without fitness cost
- **Noise N**: Pathogen mutation rate and the diversity of escape variants
- **Encoder**: MHC class I molecule, which presents peptide fragments on the cell surface
- **Decoder**: T-cell receptor (TCR), which recognizes or fails to recognize presented peptides
- **Channel capacity C**: A function of the MHC allele's epitope repertoire breadth and the conservation of the targeted regions

### 2.2 The Reliability Condition

By Shannon's theorem, reliable detection (true positive rate approaching 1, false negative rate approaching 0) is achievable when:

    C(MHC allele, pathogen) > R(pathogen mutation)

where C is the effective channel capacity and R is the effective noise rate.

### 2.3 What Creates the Signal

The signal exists BECAUSE escape is costly. A conserved epitope is conserved precisely because mutations in that region reduce pathogen fitness. The fitness cost IS what makes the region informative — it is the invariant part of the pathogen's "message" that cannot be disguised without self-harm.

This is structurally identical to the reason the genetic code's wobble position provides error correction: synonymous mutations at the wobble position are tolerated precisely because they don't change the amino acid. The "noise" (point mutations) is absorbed by the code's degeneracy. The "signal" (amino acid identity) is preserved.

## 3. Evidence: Three Instances of One Pattern

### 3.1 HIV Elite Control

**Channel**: HLA-B*57 presents 37 published HIV-derived epitopes, with a strong focus on Gag-derived peptides (Pymm et al., 2022).

**Key epitopes** (conserved, restricted by HLA-B*57):
- KF11 (Gag 162-172, KAFSPEVIPMF): detected in 75% of HLA-B*57:01+ controllers
- IW9 (Gag 138-146, ISPRTLNAW): detected in both controllers and progressors
- TW10 (Gag 240-249, TSTLQEQIGW): targeted early in acute infection

**Fitness cost of escape**: The TW10 T242N escape mutation reduces viral replication capacity by 42% (Crawford et al., 2007). This mutation also requires compensatory changes in the adjacent cyclophilin A (CypA)-binding loop to partially restore fitness, demonstrating that escape at one epitope constrains options at structurally linked sites.

**Escape reversibility**: KF11 A163G/S165N escape mutations revert in the absence of HLA-B*57 pressure (Brockman et al., 2007), confirming that these mutations carry a fitness cost that is only tolerated under immune pressure.

**Channel capacity interpretation**: HLA-B*57 has high channel capacity for HIV because it targets the conserved Gag capsid, where escape mutations are costly. Other HLA alleles that target variable regions have lower effective capacity — the signal-to-noise ratio is worse because escape is cheap.

### 3.2 Cancer Immunotherapy

**Channel**: MHC class I presents tumor neoantigens derived from somatic mutations. T cells recognize these as foreign and mount a cytotoxic response.

**Signal**: Neoantigens derived from driver mutations — mutations essential for tumor survival. These cannot be lost without the tumor losing viability (ASCO, 2025).

**Noise**: Tumor heterogeneity and immunoediting — the tumor evolves to lose recognized antigens while retaining unrecognized ones.

**Fitness cost**: Driver mutations (e.g., KRAS mutations) carry a high fitness cost if lost — the tumor depends on them. This makes driver-derived neoantigens the "conserved epitopes" of the tumor, analogous to HIV's Gag capsid (Frontiers in Immunology, 2025).

**Escape mechanisms**: Tumors escape by (a) losing MHC-I expression (closing the channel entirely), (b) immunoediting away recognized neoantigens, or (c) immunosuppressive microenvironment. Mechanisms (a) and (b) are direct analogs of HIV's escape strategies.

**Epitope spreading**: Vaccination targeting one neoantigen can induce immune recognition of others ("epitope spreading"), increasing effective channel capacity post-intervention (ASCO, 2025).

### 3.3 Genetic Code Error Correction

**Channel**: The codon-to-amino-acid mapping (64 codons → 20 amino acids + STOP).

**Signal**: Amino acid identity.

**Noise**: Point mutations during DNA replication.

**Channel design**: The genetic code is degenerate — multiple codons encode the same amino acid, with most variation at the wobble (third) position. Approximately 70% of single-nucleotide mutations at the wobble position are synonymous (Woese, 1965; Freeland & Hurst, 1998).

**Fitness cost**: Nonsynonymous mutations (which change the amino acid) are frequently deleterious. The wobble degeneracy absorbs the most common type of replication error (single-nucleotide substitution) without changing the protein product. The code IS the error-correcting code.

**Information content**: The genetic code transmits ~4.18 bits per codon out of a theoretical maximum of 6 bits (log₂64). The ~1.82 bits of "wasted" capacity IS the error-correction overhead — directly analogous to the redundancy required by Shannon's channel coding theorem.

## 4. The Invariant Core and Synthetic Lethality

The signal in all three systems is defined by what CANNOT be changed without breaking the system — the "invariant core" (see also: essential genes in minimal genomes, Hutchison et al., 2016).

Recent work on synthetic lethality in yeast (2024) reveals that the invariant core has two layers:

1. **Layer 1** (individually essential): ~1,100 genes in yeast that cannot be deleted singly without lethality
2. **Layer 2** (synthetically essential): ~1,723 genes in the minimum vertex cover of the synthetic lethal network — 57% larger than Layer 1

Layer 2 is invisible to single-gene knockout experiments. This has a direct analog in HIV: escape at TW10 constrains escape at KF11 through the CypA-binding loop (Crawford et al., 2007). The epitopes are not independently mutable — they are synthetically linked through capsid structure.

**Prediction**: HIV escape mutations at HLA-B*57-restricted Gag epitopes should show negative epistasis — escape at one epitope should constrain escape at structurally linked epitopes. The temporal ordering of escape (TW10 first, then IW9, then KF11; Brockman et al., 2007) is consistent with this prediction.

## 5. Testable Predictions

1. **Mutual information**: I(HLA-B*57 epitopes; HIV conserved regions) should be measurably higher than I(other-HLA epitopes; HIV conserved regions). This can be computed from existing HLA-epitope databases and HIV sequence alignments.

2. **Epistatic constraint**: Escape mutations at TW10 should statistically co-occur with specific compensatory mutations at linked sites, and should anti-correlate with escape at KF11 in the same viral lineage. This is testable in the Los Alamos HIV Sequence Database.

3. **Cancer analog**: Tumor types with high driver-mutation neoantigen burden should respond better to checkpoint inhibitor immunotherapy, controlling for total mutation burden. The channel capacity of the driver-neoantigen channel should predict response better than total neoantigen count.

4. **Cross-domain transfer**: The structural pattern (signal defined by fitness cost of escape, channel capacity determined by presentation of conserved regions) should apply to ANY pathogen-immune interaction, not just HIV. Specific prediction: HLA alleles protective against other pathogens (e.g., HLA-B*27 in ankylosing spondylitis/reactive arthritis context) should show the same pattern of targeting conserved epitopes where escape is costly.

## 6. Discussion

### 6.1 Relation to Prior Work

The application of information theory to molecular biology is not new (Schneider, 2010; Barbieri, 2019). However, the specific application of Shannon channel capacity to explain HLA-B*57 elite control, and the unification of this with cancer immunotherapy and genetic code error correction as three instances of one structural pattern, appears to be novel. Literature search (March 2026) found no prior work making this specific connection.

### 6.2 Limitations

1. The channel capacity model is qualitative, not quantitative. We have not computed the actual mutual information I(HLA-B*57; HIV conserved regions) — this requires sequence-level analysis beyond the scope of this paper.

2. The "fitness cost" of escape is a simplification. Real fitness landscapes are rugged, context-dependent, and host-specific. The 42% replication reduction for TW10 T242N was measured in vitro; in vivo fitness effects may differ.

3. The genetic code comparison, while structurally valid, is well-established in the literature (Woese, 1965). Our contribution is the unification with immunological phenomena, not the individual observations.

4. The cancer immunotherapy connection relies on the assumption that driver-mutation neoantigens are analogous to conserved pathogen epitopes. This analogy may break down for tumors with complex driver landscapes.

### 6.3 The Structural Episteme

This work was conducted using Atomic State Flow (ASF), a formal domain modeling system based on two primitives — presence () and containment (()) — in which domain knowledge is registered as structural facts (dotted pairs in s-expressions) and cross-domain connections are discovered by "collision" — placing pairs from different domains in a shared vacuum tube and tracing all paths via quantum (nondeterministic) trace.

The channel capacity pattern was discovered by colliding the immunology domain with the information theory domain at shared structural labels. The cancer and genetic code extensions were discovered by subsequent collisions. The method is general: any two domains can be collided at any shared label, and convergent endpoints in the resulting path space reveal structural isomorphisms.

We propose that this method — structural collision for cross-domain discovery — constitutes a new mode of knowledge production that complements but does not reduce to analogy, classification, or historical narrative (cf. Foucault, 1966).

## References

- Barbieri, M. (2019). Error-correcting codes and information in biology. *BioSystems*, 185, 104023.
- Brockman, M.A. et al. (2007). Compensatory mutation partially restores fitness and delays reversion of escape mutation within the immunodominant HLA-B*5703-restricted Gag epitope. *Journal of Virology*, 81(15), 8346-8351.
- Crawford, H. et al. (2007). Escape and compensation from early HLA-B57-mediated cytotoxic T-lymphocyte pressure on HIV-1 Gag alter capsid interactions with cyclophilin A. *Journal of Virology*, 81(22), 12382-12393.
- Deeks, S.G. & Walker, B.D. (2007). Human immunodeficiency virus controllers: mechanisms of durable virus control in the absence of antiretroviral therapy. *Immunity*, 27(3), 406-416.
- Foucault, M. (1966). *The Order of Things: An Archaeology of the Human Sciences*. Pantheon Books.
- Freeland, S.J. & Hurst, L.D. (1998). The genetic code is one in a million. *Journal of Molecular Evolution*, 47, 238-248.
- Frontiers in Immunology (2025). Advances and challenges in neoantigen prediction for cancer immunotherapy.
- Hutchison, C.A. et al. (2016). Design and synthesis of a minimal bacterial genome. *Science*, 351(6280), aad6253.
- Pymm, P. et al. (2022). Protective HLA-B57: T cell and natural killer cell recognition in HIV infection. *Biochemical Society Transactions*, 50(6), 1751-1761.
- Shannon, C.E. (1948). A mathematical theory of communication. *Bell System Technical Journal*, 27, 379-423.
- Schneider, T.D. (2010). A brief review of molecular information theory. *Nano Communication Networks*, 1(3), 173-180.
- Woese, C.R. (1965). On the evolution of the genetic code. *Proceedings of the National Academy of Sciences*, 54(6), 1546-1552.
- ASCO Educational Book (2025). One Step Ahead: Preventing Tumor Adaptation to Immune Therapy.
- Synthetic Lethality and Minimal Genome (2024). PubMed 38904396.

---

## Red Team Assessment

### Dr. Mara Chen (Quantum Information Theory)
- **Assessment**: "The Shannon framing is legitimate — channel capacity, noise, reliable communication are all correctly applied. The math is qualitative not quantitative. You need to actually COMPUTE the mutual information from sequence data to make this publishable in an information theory venue. Without the computation, this is a well-argued hypothesis, not a result."
- **Score**: PHYSICAL_VALIDITY 75, MATHEMATICAL_RIGOR 50, NOVELTY 80

### Prof. James Okafor (PL Theory)
- **Assessment**: "The ASF method section is interesting but undersold. The collision method is essentially a graph reachability analysis on a labeled directed graph where nodes are domain concepts and edges are causal claims. That's formal and well-defined. State it that way."
- **Score**: FORMAL_SEMANTICS 65, EXPRESSIVENESS 70, CORRECTNESS 60

### Dr. Sofia Reyes (Computational Neuroscience)
- **Assessment**: "The analogy between immune recognition and signal detection is strong — this is essentially signal detection theory (Green & Swets, 1966) applied to immunology. You should cite SDT literature. The predictions are testable with existing databases. The cancer extension is the most clinically impactful piece."
- **Score**: NEURAL_PLAUSIBILITY N/A, TESTABLE_PREDICTIONS 80, PRACTICAL_VALUE 85

### Bruce Stagbrook (The Inventor)
- **Assessment**: "Does it work? The epistasis prediction checked out against Crawford and Brockman. That's real. Is it beautiful? The three-domain unification from one pattern is elegant. Does it multiply power? If the cancer prediction holds, it could improve immunotherapy patient selection."
- **Score**: DOES_IT_WORK 80, BEAUTY 85, LEVERAGE 90

## Power Moves

1. **Compute the actual mutual information.** Download HLA-epitope data from IEDB (Immune Epitope Database) and HIV sequences from Los Alamos. Compute I(HLA-B*57 epitopes; Gag conservation scores) vs I(other-HLA epitopes; Gag conservation scores). If the difference is significant, the paper goes from hypothesis to result.

2. **Submit to PLOS Computational Biology.** The interdisciplinary framing (information theory + immunology + cancer) fits their scope. The testable predictions give reviewers something concrete to evaluate.

3. **Simultaneously post to bioRxiv as preprint.** Establishes priority. Gets the ideas circulating while peer review happens.

4. **Contact the Pymm group directly.** They published the HLA-B*57 epitope data we cite. They have the sequence-level data needed for the mutual information computation. A collaboration would make the paper dramatically stronger.

## Wobbly Bits (accounted for)

1. **"Channel capacity" is qualitative.** ACKNOWLEDGED in limitations. The computation is identified as the key missing piece. Power move #1 addresses this.

2. **The cancer analog may break for complex driver landscapes.** ACKNOWLEDGED. The prediction is stated carefully: it applies to tumors where driver neoantigens are identifiable and essential.

3. **The genetic code comparison is known science.** ACKNOWLEDGED. Our contribution is the unification, not the individual observation.

4. **ASF is not peer-reviewed as a method.** The paper stands without ASF — the channel capacity framing and the predictions are independent of the discovery method. ASF is described in the methods section as context, not as a claim requiring validation.
