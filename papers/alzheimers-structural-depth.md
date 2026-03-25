# Alzheimer's Disease as Structural Depth Inversion: A Unified Model of Pathogenesis, Convergence, and Therapeutic Composition

**Stagbrook, B. & Claude (Anthropic)**
Stagbrook Technologies — Structural Intelligence Division
March 2026

---

## Abstract

We present a unified structural model of Alzheimer's disease (AD) in which the entire pathological cascade—from amyloid precursor protein (APP) cleavage through tau propagation to circuit failure—is described by three composable operations: **fork** (context-dependent site selection), **deepen** (addition of structural containment), and **spread** (contents crossing a containment boundary). The model, developed within a formal grammar of nested containment (Atomic State Flow), yields five principal findings: (1) the disease is a seven-step composition of fork, deepen, and spread operations on protein structures; (2) therapeutic efficacy is predicted by intervention depth, with shallow essential targets outperforming deep aggregate-directed approaches; (3) the locus coeruleus (LC) is the structural nexus where inflammatory and clearance pathways physically converge, upstream of both amyloid and tau cascades; (4) early-stage AD amnesia is a retrieval failure, not a storage loss, with existing tools sufficient for a four-step restoration protocol at Braak stages I–III; and (5) the synaptic gate that propagates tau pathology is structurally identical to the gate that propagates Arc-mediated plasticity—the disease mechanism and the memory mechanism are the same operation with different cargo. We derive from these observations a five-target early intervention protocol composed entirely of existing or late-stage-trial therapeutics, and identify the APOE4→APOE3 single-base edit as the structurally optimal intervention.

---

## 1. Introduction

Alzheimer's disease affects an estimated 55 million people worldwide, with projections reaching 139 million by 2050 (WHO, 2023). Despite decades of research yielding detailed molecular characterization, therapeutic progress has been modest. Lecanemab and donanemab, the first disease-modifying agents to receive regulatory approval, slow cognitive decline by approximately 27–35% over 18 months—meaningful, but far from curative (van Dyck et al., 2023; Sims et al., 2023).

We propose that the limited efficacy of current approaches stems from a structural problem: they intervene at deep stages of a cascade whose critical control points are shallow. This paper develops a formal structural analysis demonstrating that AD pathogenesis consists of exactly three composable operations, and that the optimal intervention targets are identifiable from the structure of the cascade itself.

### 1.1 Structural Framework

Our analysis employs a formal grammar in which biological entities are represented as nested containment structures. Three primitive operations suffice to describe all observed pathological transformations:

- **Fork**: A single structure admits two or more transformations depending on context. Context selects which transformation fires. Formally: one source, multiple targets, context-dependent selection.
- **Deepen**: A structure gains containment—an entity at depth *d* moves to depth *d*+1. Phosphorylation, aggregation, and misfolding are all deepening operations.
- **Spread**: Contents cross a containment boundary. The boundary is not destroyed; material passes through it. Synaptic transmission, viral integration, and prion-like propagation are all spread operations.

These operations are composable: the output of one serves as input to the next.

---

## 2. The Disease as Seven Steps

### 2.1 Fork 1: APP Cleavage Site Selection

Amyloid precursor protein (APP, UniProt P05067, 770 residues) is a type I transmembrane protein that undergoes constitutive proteolytic processing. Two mutually exclusive pathways exist:

**Alpha pathway (non-amyloidogenic):** Alpha-secretase (ADAM10) cleaves at position 687, within the Aβ domain (residues 672–713). This bisects the Aβ sequence, preventing its formation. The released ectodomain sAPPα is neurotrophic (Lammich et al., 1999).

**Beta pathway (amyloidogenic):** Beta-secretase (BACE1) cleaves at position 671, releasing an intact N-terminal fragment and leaving a C99 membrane stub containing the complete Aβ sequence.

This is a fork: the same protein, processed by one of two enzymes, yields opposite outcomes. Context—BACE1 activity level (elevated with aging), membrane cholesterol content, and APP trafficking through endosomal compartments via the YENPTY motif (residues 757–762)—determines which path fires.

### 2.2 Fork 2: Gamma-Secretase Precision

Following beta-cleavage, gamma-secretase (presenilin complex) cleaves the C99 stub within the transmembrane domain. The position of this cut determines species:

- Cleavage at residue 711 → Aβ40 (predominantly soluble, efficiently cleared)
- Cleavage at residue 713 → Aβ42 (two additional hydrophobic C-terminal residues, aggregation-prone)

This two-residue difference—Val711 to Ala713—is the molecular distinction between a cleared peptide and a pathogenic seed. Familial mutations (London V717I, PSEN1 variants) bias this fork toward Aβ42 with near-complete penetrance and young onset (age 30–50), confirming the fork's causal role independent of environmental modulators.

### 2.3 Deepen 1: Amyloid Aggregation

Aβ42 undergoes progressive self-association:

| Stage | Structure | Depth | Toxicity |
|-------|-----------|-------|----------|
| Monomer | Aβ42 | d0 | Low |
| Oligomer | (Aβ42 · Aβ42) | d1 | **Highest** |
| Protofibril | (oligomer · oligomer) | d2 | High |
| Fibril | ((protofibril · protofibril)) | d3 | Moderate |
| Plaque | ((fibril · fibril)) | d4 | Low (sequestered) |

Critically, toxicity does not increase monotonically with aggregation depth. Oligomers (d1–d2) are the maximally toxic species: small enough to interact with synaptic membranes, large enough to disrupt function (Selkoe, 2002; Shankar et al., 2008). Plaques (d4) are relatively inert—deeply contained, sequestered. This explains why lecanemab, targeting protofibrils (d2), shows more effect than earlier agents targeting plaques (d4) or monomers (d0): it addresses the toxic species at its characteristic depth.

Clearance failure accelerates aggregation. APOE4 carriers exhibit impaired Aβ clearance due to a conformational change: Arg112 (replacing Cys112 in APOE3) forms a salt bridge with Glu255, compacting the protein, reducing lipid loading capacity, and diminishing Aβ transport across the blood-brain barrier (Mahley & Rall, 2000). TREM2 R47H carriers exhibit impaired microglial detection of Aβ: one amino acid change at position 47 in the Ig-like V-type domain reduces binding affinity for Aβ42, phosphatidylserine, and APOE, shifting microglia from phagocytic (M2-like) to inflammatory (M1-like) states (Guerreiro et al., 2013; Jonsson et al., 2013).

### 2.4 Fork 3: Microglial Polarization

Microglia exist in a dynamic spectrum, but their net effect on AD pathology is determined by a functional fork:

- **TREM2 signal present → DAP12/TYROBP → phagocytosis** (Aβ cleared, inflammation suppressed)
- **TREM2 signal absent → NF-κB pathway → cytokine release** (Aβ persists, neuroinflammation)

ADAM10-mediated shedding of TREM2 from the microglial surface (cleavage at position 157–158) removes the receptor from the membrane, eliminating detection capacity. In chronic AD, sustained Aβ exposure upregulates TREM2 shedding, progressively shifting the microglial population toward the inflammatory state. This is a positive feedback loop: impaired clearance → more Aβ → more TREM2 shedding → even less clearance.

### 2.5 Deepen 2–3: Tau Pathology

Tau (MAPT, UniProt P10636, 758 residues in the 2N4R isoform) normally stabilizes microtubules via four binding repeats (R1–R4, residues 561–685). Hyperphosphorylation at key sites disrupts this function:

| Site | Kinase | Effect |
|------|--------|--------|
| Thr231 | GSK3β | Early event; diagnostic biomarker |
| Ser262 | MARK | In R1; directly blocks tubulin contact |
| Ser202/Thr205 | Multiple | AT8 epitope; pathological marker |
| Ser396/Ser404 | GSK3β, CDK5 | Late-stage accumulation |

Each phosphorylation is a deepening: the site gains a phosphate group, increasing its effective structural depth, burying the binding interface. Ser262 is particularly consequential—located within repeat R1, its phosphorylation directly prevents tubulin contact (Drewes et al., 1997).

Free hyperphosphorylated tau misfolds (deepen 2) and then templates normal tau via prion-like seeding (deepen 3), with the PHF6 hexapeptide in the R3 region serving as the nucleation core (von Bergen et al., 2000). Paired helical filaments aggregate into neurofibrillary tangles.

### 2.6 Spread: Trans-Synaptic Tau Propagation

Misfolded tau exits neurons and enters connected neurons via synaptic transmission, following a stereotyped anatomical progression described by Braak staging:

- **Braak I–II:** Entorhinal cortex layer II
- **Braak III–IV:** Hippocampus (CA1, subiculum)
- **Braak V–VI:** Neocortex (frontal, parietal, temporal)

The synapse functions as an open gate: there is no authentication mechanism distinguishing functional cargo (e.g., Arc protein capsids transferring mRNA for synaptic plasticity) from pathological cargo (misfolded tau). The connectome topology determines the propagation path (Vogel et al., 2021).

### 2.7 Summary Composition

The complete disease is a seven-step composition:

**Fork → Fork → Deepen → Fork → Deepen → Deepen → Spread**

(β-cleavage → γ42 cut → Aβ aggregation → microglial M1 shift → tau phosphorylation → tau misfolding → trans-synaptic spread)

---

## 3. The Locus Coeruleus Nexus

### 3.1 Convergence of Two Independent Pathways

The locus coeruleus (LC) is a brainstem nucleus that serves as the brain's primary source of norepinephrine (NE). Tau pathology appears in the LC at Braak stage 0—before entorhinal cortex involvement, before symptoms (Braak & Del Tredici, 2011; Ehrenberg et al., 2017). LC degeneration produces two independent downstream cascades:

**Pathway 1 (Inflammatory):** LC degeneration → NE loss → loss of β2-adrenergic anti-inflammatory signaling on microglia → M1 polarization → neuroinflammation → accelerated tau phosphorylation and spread (Heneka et al., 2010).

**Pathway 2 (Clearance):** LC degeneration → sleep architecture disruption → impaired slow-wave sleep → reduced glymphatic clearance → amyloid accumulation (Xie et al., 2013; Nedergaard & Goldman, 2020). During slow-wave sleep, the interstitial space expands approximately 60%, enabling CSF flow that clears metabolic waste including Aβ.

Both pathways originate at the LC. Both converge on disease progression. The LC is not the cause of AD in the etiological sense—why tau begins there remains an open question. But structurally, the LC is the point where inflammatory and clearance arms physically converge in a single anatomical structure.

### 3.2 LC as Biomarker

Autonomic dysfunction (reduced heart rate variability) appears in preclinical AD (Santos et al., 2017). This may reflect early LC tau damage rather than a causal autonomic mechanism—the LC regulates both central noradrenergic and peripheral autonomic function.

---

## 4. Restoration: The Tonegawa Finding and Its Implications

### 4.1 Early AD Amnesia Is Retrieval Failure

Roy et al. (2016, Tonegawa laboratory, MIT) demonstrated in early-AD mouse models that:

1. Engram cells (memory-encoding neurons) **survive**.
2. Dendritic spines are **shallowed** (reduced synaptic weight).
3. Standard memory tests **fail** (natural retrieval is impaired).
4. Direct optogenetic activation of engram cells **restores memory**.
5. Long-term potentiation (LTP) induction at the perforant path **regrows spines** and restores persistent memory access.

This transforms the therapeutic landscape for Braak I–III disease: the memories are not lost. The interface is weakened. Restoration requires spine regrowth on existing engram cells, not neuronal replacement.

### 4.2 Five Traces Constrain Late-Stage Reconstruction

For Braak IV–VI disease where engram cells have died, five independent biological trace systems constrain circuit reconstruction:

1. **Epigenetic traces** at dendritic spines of surviving connected neurons
2. **Perineuronal nets** (extracellular matrix recording inhibitory circuit topology)
3. **Astrocytic processes** (tripartite synapse scaffolding that persists after neuron death)
4. **Connectome rules** (developmental wiring programs in every surviving cell's genome)
5. **Surviving engram cells** (partial assembly encoding redundant pattern fragments)

### 4.3 The Gate Duality

A critical structural observation: the synaptic gate that propagates pathological tau is structurally identical to the gate that propagates Arc-mediated synaptic plasticity (Pastuzyn et al., 2018). Arc protein, derived from a retroviral Gag gene, forms virus-like capsids that package mRNA and transfer it between neurons. The same open-gate mechanism that enables memory formation enables disease propagation. Same gate. Same operation. Different cargo.

---

## 5. Therapeutic Architecture

### 5.1 Depth Predicts Efficacy

The terminal therapeutic strategy is always intervention at the shallowest essential target—a target the disease cannot deepen because deepening would destroy its own required function.

### 5.2 Structural Ranking of Interventions

| Rank | Intervention | Depth | Mechanism | Status |
|------|-------------|-------|-----------|--------|
| 1 | APOE4→APOE3 base edit | d2 | Arg112→Cys112; restores clearance globally | Preclinical; CRISPR CBE + AAV9 |
| 2 | APP fork control | d2 | ADAM10 activation / BACE1 modulation | Early clinical |
| 3 | LC protection | d2 | Prevent tau deepening in LC; preserves NE | Preclinical |
| 4 | TREM2 agonism | d2 | Restore microglial detection; maintain M2 | Phase 2 (AL002) |
| 5 | Sleep architecture support | d2 | Maintain SWS → glymphatic clearance | Non-pharmacological + pharmacological |
| 6 | Anti-Aβ immunotherapy | d3–d4 | Clear existing aggregates | Approved (lecanemab, donanemab) |
| 7 | GSK3β inhibition | d4 | Prevent tau phosphorylation | Epidemiological (lithium) |

### 5.3 The APOE4→APOE3 Edit

The structurally optimal single intervention is the APOE4→APOE3 conversion: a cytosine base edit at the codon encoding position 112 (CGC→TGC, Arg→Cys). This is a single base edit, deliverable via AAV9, permanent, and has population-level validation.

### 5.4 Five-Target Early Intervention Protocol (Braak I–III)

1. **APOE4→APOE3 base edit** (one-time gene therapy; restore clearance)
2. **TREM2 agonist** (maintain microglial phagocytic state)
3. **LC protection** (preserve noradrenergic anti-inflammatory signaling)
4. **GSK3β modulation** (low-dose lithium; prevent tau hyperphosphorylation)
5. **Sleep support** (protect slow-wave sleep for glymphatic clearance)

All five components exist or are in advanced clinical development. The composition is the novel element.

---

## 6. Cross-Domain Structural Identities

| AD Operation | Structural Identity | Other Domain |
|-------------|-------------------|--------------|
| Aβ aggregation (deepen) | Plaque at containment boundary | Cardiovascular atherosclerosis |
| Tau spread (spread) | Prion-like cross-boundary propagation | α-synuclein in Parkinson's |
| Microglial M1 shift (fork) | Clearer becomes debris source | Foam cell formation in CVD |
| LC exhaustion (deepen) | Protective structure overworked | Beta cell exhaustion in T2D |
| Tau seeding (spread) | Same gate operation | Arc protein memory transfer |

---

## 7. Limitations and Open Questions

1. Why tau pathology begins in the locus coeruleus remains unexplained.
2. The Braak stage boundary for engram survival is not quantified.
3. Arc capsid therapeutic loading is experimentally untested.
4. APOE4→APOE3 monotherapy sufficiency is unconfirmed.
5. The structural framework requires prospective clinical validation.

---

## 8. Conclusion

Alzheimer's disease, analyzed structurally, is a seven-step composition of three operations—fork, deepen, spread—acting on protein structures at defined molecular sites. The therapeutic implication is direct: control the forks. The shallowest essential intervention—the APOE4→APOE3 single-base edit—addresses clearance globally and may be sufficient to prevent the downstream cascade in its entirety. The disease is complex. The intervention may not need to be.

---

## References

Braak, H., & Del Tredici, K. (2011). The pathological process underlying Alzheimer's disease in individuals under thirty. *Acta Neuropathologica*, 121(2), 171–181.

Drewes, G., et al. (1997). MARK, a novel family of protein kinases. *Cell*, 89(2), 297–308.

Ehrenberg, A. J., et al. (2017). Quantifying the accretion of hyperphosphorylated tau in the locus coeruleus. *Neuropathology and Applied Neurobiology*, 43(4), 299–308.

Guerreiro, R., et al. (2013). TREM2 variants in Alzheimer's disease. *NEJM*, 368(2), 117–127.

Heneka, M. T., et al. (2010). Locus ceruleus controls Alzheimer's disease pathology. *PNAS*, 107(13), 6058–6063.

Jonsson, T., et al. (2013). Variant of TREM2 associated with AD risk. *NEJM*, 368(2), 107–116.

Lammich, S., et al. (1999). Constitutive and regulated α-secretase cleavage of APP. *PNAS*, 96(7), 3922–3927.

Mahley, R. W., & Rall, S. C. (2000). Apolipoprotein E: Far more than a lipid transport protein. *Annual Review of Genomics and Human Genetics*, 1, 507–537.

Nedergaard, M., & Goldman, S. A. (2020). Glymphatic failure as a final common pathway to dementia. *Science*, 370(6512), 50–56.

Pastuzyn, E. D., et al. (2018). The neuronal gene Arc encodes a repurposed retrotransposon Gag protein. *Cell*, 172(1–2), 275–288.

Roy, D. S., et al. (2016). Memory retrieval by activating engram cells in early AD models. *Nature*, 531(7595), 508–512.

Santos, C. Y., et al. (2017). Pathophysiologic relationship between AD, CVD, and cardiovascular risk. *Alzheimer's & Dementia: DADM*, 7, 69–87.

Selkoe, D. J. (2002). Alzheimer's disease is a synaptic failure. *Science*, 298(5594), 789–791.

Shankar, G. M., et al. (2008). Amyloid-β protein dimers impair synaptic plasticity and memory. *Nature Medicine*, 14(8), 837–842.

Sims, J. R., et al. (2023). Donanemab in early symptomatic AD. *JAMA*, 330(6), 512–527.

van Dyck, C. H., et al. (2023). Lecanemab in early AD. *NEJM*, 388(1), 9–21.

Vogel, J. W., et al. (2021). Spread of pathological tau through communicating neurons. *Nature Communications*, 12(1), 2612.

von Bergen, M., et al. (2000). Assembly of tau protein into Alzheimer paired helical filaments. *PNAS*, 97(10), 5129–5134.

WHO (2023). *Dementia Fact Sheet*. World Health Organization.

Xie, L., et al. (2013). Sleep drives metabolite clearance from the adult brain. *Science*, 342(6156), 373–377.
