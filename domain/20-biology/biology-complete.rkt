#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: biology-complete
;;; LAYER: 20-biology
;;; DEPENDS ON: 04-molecules (biochemistry), 05-amino-acids (proteins),
;;;   06-protein (protein structure), 12-information (genetic code)
;;; DEPENDED ON BY: medicine, pharmacology, epidemiology, biotechnology
;;;
;;; PURPOSE: Comprehensive biology — from cell structure through
;;; evolution, ecology, immunology, virology, and cancer biology.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Campbell-12th] Campbell, Urry, Cain, Wasserman, Minorsky, Reece.
;;;   Biology, 12th ed. (2021). Pearson.
;;; [Alberts-7th] Alberts, Johnson, Lewis, Morgan, Raff, Roberts, Walter.
;;;   Molecular Biology of the Cell, 7th ed. (2022). W.W. Norton.
;;;
;;; UNITS: nm for molecular dimensions. kDa for molecular masses.
;;;   mV for membrane potentials. Degrees C for temperatures.
;;;
;;; CALIBRATION: (pending) biology-complete.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-biology-complete

  ((Campbell-12th-and-Alberts-7th (Campbell-12th-and-Alberts-7th) (authoritative) ((Campbell-12th-and-Alberts-7th . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CELL BIOLOGY — PROKARYOTIC VS EUKARYOTIC
    ;;; All cells share plasma membrane, cytoplasm, ribosomes, DNA.
    ;;; Eukaryotes have membrane-bound organelles; prokaryotes do not.
    ;;; SOURCE: [Campbell-12th] Ch. 6; [Alberts-7th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (prokaryotic-cell
      (no-membrane-bound-nucleus)
      (diameter-1-to-10-micrometers)
      ((no-membrane-bound-nucleus . DNA-in-nucleoid-region)
       (DNA-in-nucleoid-region . typically-single-circular-chromosome)
       (typically-single-circular-chromosome . may-have-plasmids)
       (may-have-plasmids . 70S-ribosomes)
       (70S-ribosomes . cell-wall-present-in-most)
       (cell-wall-present-in-most . no-membrane-bound-organelles)
       (no-membrane-bound-organelles . includes-bacteria-and-archaea)
       (includes-bacteria-and-archaea . diameter-1-to-10-micrometers)))

    (eukaryotic-cell
      (membrane-bound-nucleus)
      (diameter-10-to-100-micrometers)
      ((membrane-bound-nucleus . DNA-in-linear-chromosomes)
       (DNA-in-linear-chromosomes . 80S-ribosomes)
       (80S-ribosomes . extensive-endomembrane-system)
       (extensive-endomembrane-system . membrane-bound-organelles)
       (membrane-bound-organelles . cytoskeleton-present)
       (cytoskeleton-present . includes-animals-plants-fungi-protists)
       (includes-animals-plants-fungi-protists . diameter-10-to-100-micrometers)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ORGANELLES
    ;;; SOURCE: [Campbell-12th] Ch. 6; [Alberts-7th] Ch. 12, 14, 15
    ;;; ═══════════════════════════════════════════════════════════

    (nucleus
      (double-membrane-envelope)
      (contains-genetic-material)
      ((double-membrane-envelope . nuclear-pores-regulate-transport)
       (nuclear-pores-regulate-transport . contains-chromatin)
       (contains-chromatin . chromatin-is-DNA-plus-histone-proteins)
       (chromatin-is-DNA-plus-histone-proteins . nucleolus-produces-rRNA)
       (nucleolus-produces-rRNA . site-of-DNA-replication-and-transcription)
       (site-of-DNA-replication-and-transcription . contains-genetic-material)))

    (mitochondria
      (double-membrane-organelle)
      (site-of-oxidative-phosphorylation)
      ((double-membrane-organelle . outer-membrane-permeable-to-small-molecules)
       (outer-membrane-permeable-to-small-molecules . inner-membrane-highly-folded-into-cristae)
       (inner-membrane-highly-folded-into-cristae . cristae-increase-surface-area-for-ATP-synthesis)
       (cristae-increase-surface-area-for-ATP-synthesis . matrix-contains-own-circular-DNA)
       (matrix-contains-own-circular-DNA . own-70S-ribosomes)
       (own-70S-ribosomes . endosymbiotic-origin-from-alpha-proteobacteria)
       (endosymbiotic-origin-from-alpha-proteobacteria . produces-most-cellular-ATP-via-electron-transport-chain)
       (produces-most-cellular-ATP-via-electron-transport-chain . site-of-oxidative-phosphorylation)))

    (endoplasmic-reticulum
      (continuous-with-nuclear-envelope)
      (rough-ER-and-smooth-ER)
      ((continuous-with-nuclear-envelope . rough-ER-studded-with-ribosomes)
       (rough-ER-studded-with-ribosomes . rough-ER-synthesizes-secretory-and-membrane-proteins)
       (rough-ER-synthesizes-secretory-and-membrane-proteins . smooth-ER-lacks-ribosomes)
       (smooth-ER-lacks-ribosomes . smooth-ER-synthesizes-lipids)
       (smooth-ER-synthesizes-lipids . smooth-ER-detoxifies-drugs)
       (smooth-ER-detoxifies-drugs . smooth-ER-stores-calcium-ions)
       (smooth-ER-stores-calcium-ions . rough-ER-and-smooth-ER)))

    (golgi-apparatus
      (stack-of-flattened-membrane-cisternae)
      (modifies-sorts-and-packages-proteins)
      ((stack-of-flattened-membrane-cisternae . cis-face-receives-from-ER)
       (cis-face-receives-from-ER . medial-cisternae-modify-glycoproteins)
       (medial-cisternae-modify-glycoproteins . trans-face-ships-to-destinations)
       (trans-face-ships-to-destinations . adds-carbohydrate-tags-for-sorting)
       (adds-carbohydrate-tags-for-sorting . produces-lysosomes)
       (produces-lysosomes . modifies-sorts-and-packages-proteins)))

    (lysosomes
      (membrane-bound-vesicles)
      (contain-hydrolytic-enzymes-at-pH-5)
      ((membrane-bound-vesicles . acidic-interior-pH-4.5-to-5)
       (acidic-interior-pH-4.5-to-5 . contain-acid-hydrolases)
       (contain-acid-hydrolases . digest-macromolecules-via-phagocytosis)
       (digest-macromolecules-via-phagocytosis . autophagy-recycles-damaged-organelles)
       (autophagy-recycles-damaged-organelles . lysosomal-membrane-protects-cytoplasm)
       (lysosomal-membrane-protects-cytoplasm . contain-hydrolytic-enzymes-at-pH-5)))

    (ribosomes
      (two-subunit-RNA-protein-complex)
      (site-of-protein-synthesis)
      ((two-subunit-RNA-protein-complex . eukaryotic-80S-is-60S-plus-40S)
       (eukaryotic-80S-is-60S-plus-40S . prokaryotic-70S-is-50S-plus-30S)
       (prokaryotic-70S-is-50S-plus-30S . free-ribosomes-in-cytoplasm)
       (free-ribosomes-in-cytoplasm . bound-ribosomes-on-rough-ER)
       (bound-ribosomes-on-rough-ER . catalytic-activity-in-rRNA-not-protein)
       (catalytic-activity-in-rRNA-not-protein . ribozyme)
       (ribozyme . site-of-protein-synthesis)))

    (cytoskeleton
      (network-of-protein-filaments)
      (structure-and-motility)
      ((network-of-protein-filaments . microfilaments-actin-7nm-diameter)
       (microfilaments-actin-7nm-diameter . muscle-contraction-and-cell-shape)
       (muscle-contraction-and-cell-shape . intermediate-filaments-8-to-12nm)
       (intermediate-filaments-8-to-12nm . mechanical-strength-keratins-lamins)
       (mechanical-strength-keratins-lamins . microtubules-tubulin-25nm-diameter)
       (microtubules-tubulin-25nm-diameter . intracellular-transport-and-cell-division)
       (intracellular-transport-and-cell-division . motor-proteins-kinesin-dynein-myosin)
       (motor-proteins-kinesin-dynein-myosin . structure-and-motility)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CELL MEMBRANE
    ;;; Phospholipid bilayer with embedded proteins.
    ;;; Fluid mosaic model (Singer and Nicolson 1972).
    ;;; SOURCE: [Campbell-12th] Ch. 7; [Alberts-7th] Ch. 10, 11
    ;;; ═══════════════════════════════════════════════════════════

    (phospholipid-bilayer
      (amphipathic-phospholipids)
      (selectively-permeable-barrier)
      ((amphipathic-phospholipids . hydrophilic-head-faces-aqueous-environment)
       (hydrophilic-head-faces-aqueous-environment . hydrophobic-tails-face-interior)
       (hydrophobic-tails-face-interior . fluid-mosaic-model)
       (fluid-mosaic-model . lateral-movement-of-lipids-is-rapid)
       (lateral-movement-of-lipids-is-rapid . cholesterol-modulates-fluidity)
       (cholesterol-modulates-fluidity . integral-proteins-span-bilayer)
       (integral-proteins-span-bilayer . peripheral-proteins-on-surface)
       (peripheral-proteins-on-surface . thickness-approximately-7-to-8-nm)
       (thickness-approximately-7-to-8-nm . selectively-permeable-barrier)))

    (passive-transport
      (no-energy-input-required)
      (movement-down-concentration-gradient)
      ((no-energy-input-required . simple-diffusion-of-small-nonpolar-molecules)
       (simple-diffusion-of-small-nonpolar-molecules . O2-CO2-cross-directly)
       (O2-CO2-cross-directly . facilitated-diffusion-via-channel-proteins)
       (facilitated-diffusion-via-channel-proteins . aquaporins-for-water)
       (aquaporins-for-water . ion-channels-gated-by-voltage-or-ligand)
       (ion-channels-gated-by-voltage-or-ligand . carrier-proteins-change-conformation)
       (carrier-proteins-change-conformation . osmosis-is-water-diffusion-across-membrane)
       (osmosis-is-water-diffusion-across-membrane . movement-down-concentration-gradient)))

    (active-transport
      (requires-ATP-or-energy-input)
      (movement-against-concentration-gradient)
      ((requires-ATP-or-energy-input . primary-active-transport-uses-ATP-directly)
       (primary-active-transport-uses-ATP-directly . Na+/K+-ATPase-3Na-out-2K-in)
       (Na+/K+-ATPase-3Na-out-2K-in . maintains-electrochemical-gradient)
       (maintains-electrochemical-gradient . secondary-active-transport-cotransport)
       (secondary-active-transport-cotransport . symport-same-direction)
       (symport-same-direction . antiport-opposite-direction)
       (antiport-opposite-direction . electrogenic-pump-generates-voltage)
       (electrogenic-pump-generates-voltage . movement-against-concentration-gradient)))

    (endocytosis
      (cell-takes-in-material-by-vesicle-formation)
      (plasma-membrane-invaginates)
      ((cell-takes-in-material-by-vesicle-formation . phagocytosis-engulfs-large-particles)
       (phagocytosis-engulfs-large-particles . pinocytosis-engulfs-fluid-nonspecifically)
       (pinocytosis-engulfs-fluid-nonspecifically . receptor-mediated-endocytosis-is-specific)
       (receptor-mediated-endocytosis-is-specific . clathrin-coated-pits)
       (clathrin-coated-pits . ligand-binds-receptor-triggers-internalization)
       (ligand-binds-receptor-triggers-internalization . plasma-membrane-invaginates)))

    (exocytosis
      (cell-secretes-material-by-vesicle-fusion)
      (vesicle-fuses-with-plasma-membrane)
      ((cell-secretes-material-by-vesicle-fusion . transport-vesicle-from-Golgi)
       (transport-vesicle-from-Golgi . SNARE-proteins-mediate-fusion)
       (SNARE-proteins-mediate-fusion . contents-released-to-extracellular-space)
       (contents-released-to-extracellular-space . membrane-proteins-inserted-into-plasma-membrane)
       (membrane-proteins-inserted-into-plasma-membrane . vesicle-fuses-with-plasma-membrane)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CELL CYCLE
    ;;; Ordered sequence of events from one cell division to the next.
    ;;; SOURCE: [Campbell-12th] Ch. 12; [Alberts-7th] Ch. 17
    ;;; ═══════════════════════════════════════════════════════════

    (G1-phase
      (first-gap-phase)
      (cell-growth-and-normal-function)
      ((first-gap-phase . cell-grows-in-size)
       (cell-grows-in-size . synthesizes-proteins-and-organelles)
       (synthesizes-proteins-and-organelles . G1-checkpoint-restriction-point)
       (G1-checkpoint-restriction-point . checks-cell-size-and-nutrients)
       (checks-cell-size-and-nutrients . checks-DNA-damage)
       (checks-DNA-damage . commits-to-division-or-enters-G0)
       (commits-to-division-or-enters-G0 . cell-growth-and-normal-function)))

    (S-phase
      (synthesis-phase)
      (DNA-replication-occurs)
      ((synthesis-phase . each-chromosome-replicated)
       (each-chromosome-replicated . produces-sister-chromatids)
       (produces-sister-chromatids . joined-at-centromere-by-cohesin)
       (joined-at-centromere-by-cohesin . centrosome-duplicated)
       (centrosome-duplicated . histone-synthesis-doubles)
       (histone-synthesis-doubles . DNA-replication-occurs)))

    (G2-phase
      (second-gap-phase)
      (preparation-for-mitosis)
      ((second-gap-phase . continued-cell-growth)
       (continued-cell-growth . synthesis-of-mitotic-proteins)
       (synthesis-of-mitotic-proteins . G2-checkpoint)
       (G2-checkpoint . checks-DNA-replication-completion)
       (checks-DNA-replication-completion . checks-DNA-damage-repair)
       (checks-DNA-damage-repair . preparation-for-mitosis)))

    (M-phase
      (mitotic-phase)
      (nuclear-division-and-cytokinesis)
      ((mitotic-phase . shortest-phase-of-cell-cycle)
       (shortest-phase-of-cell-cycle . mitosis-divides-nucleus)
       (mitosis-divides-nucleus . cytokinesis-divides-cytoplasm)
       (cytokinesis-divides-cytoplasm . spindle-assembly-checkpoint)
       (spindle-assembly-checkpoint . checks-kinetochore-attachment-to-spindle)
       (checks-kinetochore-attachment-to-spindle . nuclear-division-and-cytokinesis)))

    (cell-cycle-checkpoints
      (regulatory-surveillance-mechanism)
      (prevent-damaged-cells-from-dividing)
      ((regulatory-surveillance-mechanism . cyclin-dependent-kinases-CDKs)
       (cyclin-dependent-kinases-CDKs . activated-by-cyclin-binding)
       (activated-by-cyclin-binding . cyclin-levels-oscillate)
       (cyclin-levels-oscillate . G1-checkpoint-requires-cyclin-D-CDK4/6)
       (G1-checkpoint-requires-cyclin-D-CDK4/6 . S-phase-entry-requires-cyclin-E-CDK2)
       (S-phase-entry-requires-cyclin-E-CDK2 . M-phase-entry-requires-cyclin-B-CDK1)
       (M-phase-entry-requires-cyclin-B-CDK1 . p53-halts-cycle-if-DNA-damaged)
       (p53-halts-cycle-if-DNA-damaged . prevent-damaged-cells-from-dividing)))

    (apoptosis
      (programmed-cell-death)
      (controlled-self-destruction)
      ((programmed-cell-death . intrinsic-pathway-via-mitochondria)
       (intrinsic-pathway-via-mitochondria . cytochrome-c-released-into-cytoplasm)
       (cytochrome-c-released-into-cytoplasm . activates-caspase-cascade)
       (activates-caspase-cascade . extrinsic-pathway-via-death-receptors)
       (extrinsic-pathway-via-death-receptors . Fas-and-TNF-receptor-families)
       (Fas-and-TNF-receptor-families . cell-shrinks-DNA-fragmented)
       (cell-shrinks-DNA-fragmented . apoptotic-bodies-phagocytosed)
       (apoptotic-bodies-phagocytosed . no-inflammatory-response)
       (no-inflammatory-response . controlled-self-destruction)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MITOSIS AND MEIOSIS
    ;;; SOURCE: [Campbell-12th] Ch. 12, 13; [Alberts-7th] Ch. 17
    ;;; ═══════════════════════════════════════════════════════════

    (mitosis
      (nuclear-division-producing-identical-daughter-nuclei)
      (2n-to-two-2n)
      ((nuclear-division-producing-identical-daughter-nuclei . prophase-chromatin-condenses)
       (prophase-chromatin-condenses . spindle-forms-from-centrosomes)
       (spindle-forms-from-centrosomes . prometaphase-nuclear-envelope-breaks-down)
       (prometaphase-nuclear-envelope-breaks-down . kinetochores-attach-to-spindle-microtubules)
       (kinetochores-attach-to-spindle-microtubules . metaphase-chromosomes-align-at-metaphase-plate)
       (metaphase-chromosomes-align-at-metaphase-plate . anaphase-sister-chromatids-separate)
       (anaphase-sister-chromatids-separate . cohesin-cleaved-by-separase)
       (cohesin-cleaved-by-separase . telophase-nuclear-envelopes-reform)
       (telophase-nuclear-envelopes-reform . chromatin-decondenses)
       (chromatin-decondenses . 2n-to-two-2n)))

    (meiosis
      (two-sequential-divisions)
      (2n-to-four-n)
      ((two-sequential-divisions . meiosis-I-separates-homologous-pairs)
       (meiosis-I-separates-homologous-pairs . prophase-I-crossing-over-occurs)
       (prophase-I-crossing-over-occurs . synapsis-forms-bivalents)
       (synapsis-forms-bivalents . chiasmata-are-crossover-sites)
       (chiasmata-are-crossover-sites . metaphase-I-homologs-align-independently)
       (metaphase-I-homologs-align-independently . independent-assortment-of-chromosomes)
       (independent-assortment-of-chromosomes . anaphase-I-homologs-separate)
       (anaphase-I-homologs-separate . meiosis-II-separates-sister-chromatids)
       (meiosis-II-separates-sister-chromatids . similar-to-mitosis)
       (similar-to-mitosis . produces-four-genetically-distinct-haploid-cells)
       (produces-four-genetically-distinct-haploid-cells . 2n-to-four-n)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DNA REPLICATION
    ;;; Semi-conservative replication (Meselson-Stahl 1958).
    ;;; SOURCE: [Campbell-12th] Ch. 16; [Alberts-7th] Ch. 5
    ;;; ═══════════════════════════════════════════════════════════

    (dna-replication-overview
      (semi-conservative-mechanism)
      (each-strand-serves-as-template)
      ((semi-conservative-mechanism . origin-of-replication-ORI)
       (origin-of-replication-ORI . bidirectional-replication-forks)
       (bidirectional-replication-forks . multiple-origins-in-eukaryotes)
       (multiple-origins-in-eukaryotes . rate-approximately-1000-nt-per-second-in-E-coli)
       (rate-approximately-1000-nt-per-second-in-E-coli . rate-approximately-50-nt-per-second-in-humans)
       (rate-approximately-50-nt-per-second-in-humans . error-rate-1-in-10-to-9th-after-proofreading)
       (error-rate-1-in-10-to-9th-after-proofreading . each-strand-serves-as-template)))

    (helicase
      (unwinds-double-helix)
      (breaks-hydrogen-bonds-between-base-pairs)
      ((unwinds-double-helix . moves-along-DNA-using-ATP-hydrolysis)
       (moves-along-DNA-using-ATP-hydrolysis . creates-replication-fork)
       (creates-replication-fork . single-strand-binding-proteins-stabilize)
       (single-strand-binding-proteins-stabilize . topoisomerase-relieves-torsional-strain)
       (topoisomerase-relieves-torsional-strain . breaks-hydrogen-bonds-between-base-pairs)))

    (primase
      (RNA-polymerase)
      (synthesizes-RNA-primer)
      ((RNA-polymerase . synthesizes-short-RNA-primer-5-to-10-nt)
       (synthesizes-short-RNA-primer-5-to-10-nt . provides-3-prime-OH-for-DNA-polymerase)
       (provides-3-prime-OH-for-DNA-polymerase . required-because-DNA-pol-cannot-initiate-de-novo)
       (required-because-DNA-pol-cannot-initiate-de-novo . one-primer-on-leading-strand)
       (one-primer-on-leading-strand . multiple-primers-on-lagging-strand)
       (multiple-primers-on-lagging-strand . synthesizes-RNA-primer)))

    (dna-polymerase
      (synthesizes-new-DNA-strand)
      (5-prime-to-3-prime-direction-only)
      ((synthesizes-new-DNA-strand . adds-nucleotides-to-3-prime-OH)
       (adds-nucleotides-to-3-prime-OH . requires-template-strand)
       (requires-template-strand . DNA-pol-III-is-main-replicase-in-E-coli)
       (DNA-pol-III-is-main-replicase-in-E-coli . DNA-pol-alpha-delta-epsilon-in-eukaryotes)
       (DNA-pol-alpha-delta-epsilon-in-eukaryotes . 3-prime-to-5-prime-exonuclease-proofreading)
       (3-prime-to-5-prime-exonuclease-proofreading . sliding-clamp-PCNA-increases-processivity)
       (sliding-clamp-PCNA-increases-processivity . 5-prime-to-3-prime-direction-only)))

    (leading-and-lagging-strand
      (antiparallel-strands-replicated-differently)
      (continuous-vs-discontinuous-synthesis)
      ((antiparallel-strands-replicated-differently . leading-strand-synthesized-continuously)
       (leading-strand-synthesized-continuously . same-direction-as-replication-fork-movement)
       (same-direction-as-replication-fork-movement . lagging-strand-synthesized-discontinuously)
       (lagging-strand-synthesized-discontinuously . produces-Okazaki-fragments)
       (produces-Okazaki-fragments . Okazaki-fragments-1000-to-2000-nt-in-prokaryotes)
       (Okazaki-fragments-1000-to-2000-nt-in-prokaryotes . Okazaki-fragments-100-to-200-nt-in-eukaryotes)
       (Okazaki-fragments-100-to-200-nt-in-eukaryotes . continuous-vs-discontinuous-synthesis)))

    (dna-ligase
      (joins-Okazaki-fragments)
      (seals-phosphodiester-backbone)
      ((joins-Okazaki-fragments . RNA-primers-removed-by-RNase-H-or-DNA-pol-I)
       (RNA-primers-removed-by-RNase-H-or-DNA-pol-I . gaps-filled-by-DNA-polymerase)
       (gaps-filled-by-DNA-polymerase . ligase-seals-remaining-nick)
       (ligase-seals-remaining-nick . forms-phosphodiester-bond-using-ATP-or-NAD+)
       (forms-phosphodiester-bond-using-ATP-or-NAD+ . seals-phosphodiester-backbone)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSCRIPTION
    ;;; DNA to mRNA. RNA polymerase reads template 3' to 5',
    ;;; synthesizes mRNA 5' to 3'.
    ;;; SOURCE: [Campbell-12th] Ch. 17; [Alberts-7th] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (rna-polymerase
      (synthesizes-RNA-from-DNA-template)
      (no-primer-required)
      ((synthesizes-RNA-from-DNA-template . reads-template-strand-3-prime-to-5-prime)
       (reads-template-strand-3-prime-to-5-prime . synthesizes-mRNA-5-prime-to-3-prime)
       (synthesizes-mRNA-5-prime-to-3-prime . prokaryotes-have-one-RNA-polymerase)
       (prokaryotes-have-one-RNA-polymerase . eukaryotes-have-RNA-pol-I-II-III)
       (eukaryotes-have-RNA-pol-I-II-III . RNA-pol-II-transcribes-mRNA)
       (RNA-pol-II-transcribes-mRNA . error-rate-1-in-10-to-4th)
       (error-rate-1-in-10-to-4th . no-primer-required)))

    (promoter-and-initiation
      (DNA-sequence-where-transcription-begins)
      (RNA-polymerase-binds-promoter)
      ((DNA-sequence-where-transcription-begins . prokaryotic-minus-10-TATAAT-Pribnow-box)
       (prokaryotic-minus-10-TATAAT-Pribnow-box . prokaryotic-minus-35-TTGACA)
       (prokaryotic-minus-35-TTGACA . sigma-factor-recognizes-promoter)
       (sigma-factor-recognizes-promoter . eukaryotic-TATA-box-approximately-minus-25)
       (eukaryotic-TATA-box-approximately-minus-25 . TFIID-binds-TATA-box)
       (TFIID-binds-TATA-box . general-transcription-factors-assemble)
       (general-transcription-factors-assemble . RNA-polymerase-binds-promoter)))

    (introns-and-exons
      (eukaryotic-genes-contain-intervening-sequences)
      (exons-expressed-introns-removed)
      ((eukaryotic-genes-contain-intervening-sequences . introns-are-noncoding-intervening-sequences)
       (introns-are-noncoding-intervening-sequences . exons-are-coding-expressed-sequences)
       (exons-are-coding-expressed-sequences . average-human-gene-has-8-to-9-exons)
       (average-human-gene-has-8-to-9-exons . some-introns-larger-than-100-kb)
       (some-introns-larger-than-100-kb . exons-expressed-introns-removed)))

    (rna-splicing
      (removal-of-introns-from-pre-mRNA)
      (spliceosome-catalyzes)
      ((removal-of-introns-from-pre-mRNA . spliceosome-is-snRNPs-plus-proteins)
       (spliceosome-is-snRNPs-plus-proteins . U1-recognizes-5-prime-splice-site-GU)
       (U1-recognizes-5-prime-splice-site-GU . U2-binds-branch-point-adenine)
       (U2-binds-branch-point-adenine . two-transesterification-reactions)
       (two-transesterification-reactions . lariat-intermediate-formed)
       (lariat-intermediate-formed . exons-joined-intron-released)
       (exons-joined-intron-released . alternative-splicing-produces-multiple-mRNAs)
       (alternative-splicing-produces-multiple-mRNAs . 5-prime-cap-7-methylguanosine-added)
       (5-prime-cap-7-methylguanosine-added . 3-prime-poly-A-tail-100-to-250-adenines)
       (3-prime-poly-A-tail-100-to-250-adenines . spliceosome-catalyzes)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSLATION
    ;;; mRNA to protein at the ribosome.
    ;;; SOURCE: [Campbell-12th] Ch. 17; [Alberts-7th] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (translation-ribosome
      (two-subunit-molecular-machine)
      (has-A-P-E-sites)
      ((two-subunit-molecular-machine . small-subunit-binds-mRNA)
       (small-subunit-binds-mRNA . large-subunit-catalyzes-peptide-bond)
       (large-subunit-catalyzes-peptide-bond . A-site-aminoacyl-incoming-tRNA)
       (A-site-aminoacyl-incoming-tRNA . P-site-peptidyl-growing-chain)
       (P-site-peptidyl-growing-chain . E-site-exit-for-empty-tRNA)
       (E-site-exit-for-empty-tRNA . peptidyl-transferase-is-ribozyme-in-23S-rRNA)
       (peptidyl-transferase-is-ribozyme-in-23S-rRNA . has-A-P-E-sites)))

    (transfer-rna
      (adapter-molecule)
      (anticodon-recognizes-codon)
      ((adapter-molecule . cloverleaf-secondary-structure)
       (cloverleaf-secondary-structure . L-shaped-3D-structure)
       (L-shaped-3D-structure . anticodon-loop-base-pairs-with-mRNA-codon)
       (anticodon-loop-base-pairs-with-mRNA-codon . 3-prime-CCA-accepts-amino-acid)
       (3-prime-CCA-accepts-amino-acid . aminoacyl-tRNA-synthetase-charges-tRNA)
       (aminoacyl-tRNA-synthetase-charges-tRNA . 20-synthetases-one-per-amino-acid)
       (20-synthetases-one-per-amino-acid . wobble-at-third-codon-position)
       (wobble-at-third-codon-position . anticodon-recognizes-codon)))

    (codons-and-genetic-code
      (triplet-code-64-codons)
      (degenerate-and-universal)
      ((triplet-code-64-codons . AUG-start-codon-methionine)
       (AUG-start-codon-methionine . UAA-UAG-UGA-stop-codons)
       (UAA-UAG-UGA-stop-codons . 61-sense-codons-for-20-amino-acids)
       (61-sense-codons-for-20-amino-acids . degenerate-multiple-codons-per-amino-acid)
       (degenerate-multiple-codons-per-amino-acid . nearly-universal-across-all-life)
       (nearly-universal-across-all-life . reading-frame-set-by-start-codon)
       (reading-frame-set-by-start-codon . degenerate-and-universal)))

    (translation-elongation
      (ribosome-moves-along-mRNA)
      (peptide-bond-formation-cycle)
      ((ribosome-moves-along-mRNA . aminoacyl-tRNA-binds-A-site-with-EF-Tu-GTP)
       (aminoacyl-tRNA-binds-A-site-with-EF-Tu-GTP . codon-anticodon-recognition)
       (codon-anticodon-recognition . GTP-hydrolysis-for-proofreading)
       (GTP-hydrolysis-for-proofreading . peptidyl-transferase-forms-peptide-bond)
       (peptidyl-transferase-forms-peptide-bond . translocation-by-EF-G-GTP)
       (translocation-by-EF-G-GTP . ribosome-shifts-one-codon-3-prime)
       (ribosome-shifts-one-codon-3-prime . rate-approximately-15-to-20-amino-acids-per-second)
       (rate-approximately-15-to-20-amino-acids-per-second . peptide-bond-formation-cycle)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENE REGULATION
    ;;; SOURCE: [Campbell-12th] Ch. 18; [Alberts-7th] Ch. 7
    ;;; ═══════════════════════════════════════════════════════════

    (operons
      (prokaryotic-gene-regulation-unit)
      (coordinately-controlled-genes)
      ((prokaryotic-gene-regulation-unit . operator-is-repressor-binding-site)
       (operator-is-repressor-binding-site . promoter-upstream-of-operator)
       (promoter-upstream-of-operator . structural-genes-transcribed-as-polycistronic-mRNA)
       (structural-genes-transcribed-as-polycistronic-mRNA . lac-operon-inducible-by-lactose)
       (lac-operon-inducible-by-lactose . allolactose-binds-repressor-releases-operator)
       (allolactose-binds-repressor-releases-operator . trp-operon-repressible-by-tryptophan)
       (trp-operon-repressible-by-tryptophan . CAP-cAMP-positive-regulation)
       (CAP-cAMP-positive-regulation . coordinately-controlled-genes)))

    (enhancers-and-eukaryotic-regulation
      (distal-regulatory-elements)
      (activators-bind-enhancers)
      ((distal-regulatory-elements . enhancers-can-be-thousands-of-bp-from-promoter)
       (enhancers-can-be-thousands-of-bp-from-promoter . work-in-either-orientation)
       (work-in-either-orientation . activator-proteins-bind-enhancers)
       (activator-proteins-bind-enhancers . mediator-complex-bridges-to-RNA-pol-II)
       (mediator-complex-bridges-to-RNA-pol-II . silencers-are-negative-regulatory-elements)
       (silencers-are-negative-regulatory-elements . combinatorial-control-multiple-TFs)
       (combinatorial-control-multiple-TFs . activators-bind-enhancers)))

    (epigenetics-dna-methylation
      (heritable-changes-without-DNA-sequence-change)
      (methyl-groups-on-cytosine)
      ((heritable-changes-without-DNA-sequence-change . DNA-methyltransferases-add-CH3)
       (DNA-methyltransferases-add-CH3 . CpG-dinucleotides-are-primary-target)
       (CpG-dinucleotides-are-primary-target . methylation-generally-silences-transcription)
       (methylation-generally-silences-transcription . CpG-islands-in-promoter-regions)
       (CpG-islands-in-promoter-regions . maintenance-methyltransferase-copies-pattern)
       (maintenance-methyltransferase-copies-pattern . genomic-imprinting-parent-specific-expression)
       (genomic-imprinting-parent-specific-expression . X-inactivation-uses-methylation)
       (X-inactivation-uses-methylation . methyl-groups-on-cytosine)))

    (epigenetics-histone-modification
      (post-translational-modification-of-histone-tails)
      (alters-chromatin-accessibility)
      ((post-translational-modification-of-histone-tails . acetylation-of-lysines-opens-chromatin)
       (acetylation-of-lysines-opens-chromatin . histone-acetyltransferases-HATs)
       (histone-acetyltransferases-HATs . histone-deacetylases-HDACs-close-chromatin)
       (histone-deacetylases-HDACs-close-chromatin . methylation-can-activate-or-repress)
       (methylation-can-activate-or-repress . H3K4me3-associated-with-active-transcription)
       (H3K4me3-associated-with-active-transcription . H3K27me3-associated-with-repression)
       (H3K27me3-associated-with-repression . histone-code-hypothesis)
       (histone-code-hypothesis . alters-chromatin-accessibility)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EVOLUTION
    ;;; SOURCE: [Campbell-12th] Ch. 22-24; [Alberts-7th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (natural-selection
      (differential-reproductive-success)
      (heritable-traits-favored-by-environment)
      ((differential-reproductive-success . variation-exists-in-population)
       (variation-exists-in-population . variation-is-heritable)
       (variation-is-heritable . more-offspring-than-can-survive)
       (more-offspring-than-can-survive . individuals-with-favorable-traits-reproduce-more)
       (individuals-with-favorable-traits-reproduce-more . directional-stabilizing-or-disruptive)
       (directional-stabilizing-or-disruptive . acts-on-phenotype-not-genotype)
       (acts-on-phenotype-not-genotype . only-mechanism-that-produces-adaptation)
       (only-mechanism-that-produces-adaptation . heritable-traits-favored-by-environment)))

    (genetic-drift
      (random-changes-in-allele-frequency)
      (stronger-effect-in-small-populations)
      ((random-changes-in-allele-frequency . not-driven-by-selection)
       (not-driven-by-selection . bottleneck-effect-reduces-genetic-variation)
       (bottleneck-effect-reduces-genetic-variation . founder-effect-in-colonizing-populations)
       (founder-effect-in-colonizing-populations . can-fix-or-eliminate-alleles-by-chance)
       (can-fix-or-eliminate-alleles-by-chance . neutral-theory-Kimura-1968)
       (neutral-theory-Kimura-1968 . most-molecular-evolution-is-neutral-drift)
       (most-molecular-evolution-is-neutral-drift . stronger-effect-in-small-populations)))

    (gene-flow
      (movement-of-alleles-between-populations)
      (migration-reduces-genetic-differences)
      ((movement-of-alleles-between-populations . individuals-move-and-reproduce)
       (individuals-move-and-reproduce . pollen-dispersal-in-plants)
       (pollen-dispersal-in-plants . tends-to-homogenize-allele-frequencies)
       (tends-to-homogenize-allele-frequencies . counteracts-effects-of-natural-selection-and-drift)
       (counteracts-effects-of-natural-selection-and-drift . migration-reduces-genetic-differences)))

    (speciation
      (formation-of-new-species)
      (reproductive-isolation-is-key)
      ((formation-of-new-species . allopatric-speciation-geographic-barrier)
       (allopatric-speciation-geographic-barrier . sympatric-speciation-without-geographic-barrier)
       (sympatric-speciation-without-geographic-barrier . polyploidy-common-in-plants)
       (polyploidy-common-in-plants . prezygotic-barriers-prevent-mating)
       (prezygotic-barriers-prevent-mating . temporal-behavioral-mechanical-gametic-isolation)
       (temporal-behavioral-mechanical-gametic-isolation . postzygotic-barriers-reduce-hybrid-fitness)
       (postzygotic-barriers-reduce-hybrid-fitness . hybrid-inviability-sterility-breakdown)
       (hybrid-inviability-sterility-breakdown . reproductive-isolation-is-key)))

    (hardy-weinberg
      (equilibrium-model-for-allele-frequencies)
      (p-squared-plus-2pq-plus-q-squared-equals-1)
      ((equilibrium-model-for-allele-frequencies . p-plus-q-equals-1-for-two-alleles)
       (p-plus-q-equals-1-for-two-alleles . genotype-frequencies-predicted)
       (genotype-frequencies-predicted . requires-no-mutation)
       (requires-no-mutation . requires-no-selection)
       (requires-no-selection . requires-no-gene-flow)
       (requires-no-gene-flow . requires-random-mating)
       (requires-random-mating . requires-large-population-size)
       (requires-large-population-size . deviations-indicate-evolution-occurring)
       (deviations-indicate-evolution-occurring . p-squared-plus-2pq-plus-q-squared-equals-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ECOLOGY
    ;;; SOURCE: [Campbell-12th] Ch. 54-55
    ;;; ═══════════════════════════════════════════════════════════

    (food-webs
      (network-of-feeding-relationships)
      (interconnected-food-chains)
      ((network-of-feeding-relationships . producers-autotrophs-at-base)
       (producers-autotrophs-at-base . primary-consumers-herbivores)
       (primary-consumers-herbivores . secondary-consumers-eat-herbivores)
       (secondary-consumers-eat-herbivores . tertiary-consumers-top-predators)
       (tertiary-consumers-top-predators . decomposers-recycle-all-trophic-levels)
       (decomposers-recycle-all-trophic-levels . omnivores-feed-at-multiple-levels)
       (omnivores-feed-at-multiple-levels . interconnected-food-chains)))

    (trophic-levels-and-energy-pyramid
      (hierarchical-feeding-positions)
      (only-10-percent-energy-transferred-per-level)
      ((hierarchical-feeding-positions . first-trophic-level-producers)
       (first-trophic-level-producers . second-trophic-level-primary-consumers)
       (second-trophic-level-primary-consumers . third-trophic-level-secondary-consumers)
       (third-trophic-level-secondary-consumers . energy-lost-as-heat-at-each-level)
       (energy-lost-as-heat-at-each-level . approximately-10-percent-ecological-efficiency)
       (approximately-10-percent-ecological-efficiency . Lindeman-1942-trophic-dynamics)
       (Lindeman-1942-trophic-dynamics . limits-food-chain-length-to-4-or-5-levels)
       (limits-food-chain-length-to-4-or-5-levels . biomass-pyramid-decreases-upward)
       (biomass-pyramid-decreases-upward . only-10-percent-energy-transferred-per-level)))

    (carbon-cycle
      (biogeochemical-cycling-of-carbon)
      (links-atmosphere-biosphere-lithosphere-hydrosphere)
      ((biogeochemical-cycling-of-carbon . photosynthesis-fixes-CO2-into-organic-carbon)
       (photosynthesis-fixes-CO2-into-organic-carbon . cellular-respiration-releases-CO2)
       (cellular-respiration-releases-CO2 . decomposition-returns-carbon-to-soil-and-atmosphere)
       (decomposition-returns-carbon-to-soil-and-atmosphere . fossil-fuels-are-stored-ancient-carbon)
       (fossil-fuels-are-stored-ancient-carbon . combustion-releases-stored-carbon-as-CO2)
       (combustion-releases-stored-carbon-as-CO2 . ocean-dissolves-CO2-as-bicarbonate)
       (ocean-dissolves-CO2-as-bicarbonate . links-atmosphere-biosphere-lithosphere-hydrosphere)))

    (nitrogen-cycle
      (biogeochemical-cycling-of-nitrogen)
      (nitrogen-fixation-is-key-step)
      ((biogeochemical-cycling-of-nitrogen . N2-is-78-percent-of-atmosphere)
       (N2-is-78-percent-of-atmosphere . nitrogen-fixation-N2-to-NH3-by-nitrogenase)
       (nitrogen-fixation-N2-to-NH3-by-nitrogenase . biological-fixation-by-Rhizobium-and-cyanobacteria)
       (biological-fixation-by-Rhizobium-and-cyanobacteria . nitrification-NH4-to-NO2-to-NO3)
       (nitrification-NH4-to-NO2-to-NO3 . assimilation-plants-absorb-NH4-and-NO3)
       (assimilation-plants-absorb-NH4-and-NO3 . ammonification-organic-N-to-NH4)
       (ammonification-organic-N-to-NH4 . denitrification-NO3-to-N2-returns-to-atmosphere)
       (denitrification-NO3-to-N2-returns-to-atmosphere . nitrogen-fixation-is-key-step)))

    (water-cycle
      (biogeochemical-cycling-of-water)
      (evaporation-precipitation-runoff)
      ((biogeochemical-cycling-of-water . evaporation-from-oceans-and-surface-water)
       (evaporation-from-oceans-and-surface-water . transpiration-from-plants)
       (transpiration-from-plants . condensation-forms-clouds)
       (condensation-forms-clouds . precipitation-as-rain-snow-sleet)
       (precipitation-as-rain-snow-sleet . surface-runoff-to-rivers-and-lakes)
       (surface-runoff-to-rivers-and-lakes . groundwater-infiltration-and-aquifers)
       (groundwater-infiltration-and-aquifers . evaporation-precipitation-runoff)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IMMUNE SYSTEM
    ;;; SOURCE: [Campbell-12th] Ch. 43; [Alberts-7th] Ch. 24
    ;;; ═══════════════════════════════════════════════════════════

    (innate-immunity
      (nonspecific-first-line-defense)
      (rapid-response-no-memory)
      ((nonspecific-first-line-defense . physical-barriers-skin-and-mucous-membranes)
       (physical-barriers-skin-and-mucous-membranes . chemical-barriers-lysozyme-defensins-low-pH)
       (chemical-barriers-lysozyme-defensins-low-pH . phagocytes-neutrophils-and-macrophages)
       (phagocytes-neutrophils-and-macrophages . pattern-recognition-receptors-TLRs)
       (pattern-recognition-receptors-TLRs . recognize-PAMPs-pathogen-associated-molecular-patterns)
       (recognize-PAMPs-pathogen-associated-molecular-patterns . natural-killer-cells-destroy-infected-cells)
       (natural-killer-cells-destroy-infected-cells . inflammatory-response-redness-heat-swelling-pain)
       (inflammatory-response-redness-heat-swelling-pain . fever-raises-body-temperature)
       (fever-raises-body-temperature . rapid-response-no-memory)))

    (adaptive-immunity
      (specific-antigen-targeted-defense)
      (clonal-selection-and-immunological-memory)
      ((specific-antigen-targeted-defense . requires-days-for-primary-response)
       (requires-days-for-primary-response . faster-stronger-secondary-response)
       (faster-stronger-secondary-response . lymphocytes-B-cells-and-T-cells)
       (lymphocytes-B-cells-and-T-cells . antigen-receptors-generated-by-V-D-J-recombination)
       (antigen-receptors-generated-by-V-D-J-recombination . clonal-selection-amplifies-specific-lymphocytes)
       (clonal-selection-amplifies-specific-lymphocytes . effector-cells-and-memory-cells-produced)
       (effector-cells-and-memory-cells-produced . self-tolerance-prevents-autoimmunity)
       (self-tolerance-prevents-autoimmunity . clonal-selection-and-immunological-memory)))

    (b-cells-and-antibodies
      (humoral-immunity)
      (secrete-antibodies-into-blood-and-lymph)
      ((humoral-immunity . B-cell-receptor-is-membrane-bound-antibody)
       (B-cell-receptor-is-membrane-bound-antibody . antigen-binding-activates-B-cell)
       (antigen-binding-activates-B-cell . T-helper-cell-costimulation-usually-required)
       (T-helper-cell-costimulation-usually-required . clonal-expansion-produces-plasma-cells)
       (clonal-expansion-produces-plasma-cells . plasma-cells-secrete-up-to-2000-antibodies-per-second)
       (plasma-cells-secrete-up-to-2000-antibodies-per-second . antibody-structure-two-heavy-two-light-chains)
       (antibody-structure-two-heavy-two-light-chains . variable-regions-bind-antigen-epitope)
       (variable-regions-bind-antigen-epitope . five-classes-IgM-IgG-IgA-IgE-IgD)
       (five-classes-IgM-IgG-IgA-IgE-IgD . class-switching-changes-effector-function)
       (class-switching-changes-effector-function . secrete-antibodies-into-blood-and-lymph)))

    (t-cells
      (cell-mediated-immunity)
      (recognize-antigen-presented-on-MHC)
      ((cell-mediated-immunity . mature-in-thymus)
       (mature-in-thymus . CD8+-cytotoxic-T-cells-kill-infected-cells)
       (CD8+-cytotoxic-T-cells-kill-infected-cells . release-perforin-and-granzymes)
       (release-perforin-and-granzymes . CD4+-helper-T-cells-coordinate-response)
       (CD4+-helper-T-cells-coordinate-response . secrete-cytokines-IL-2-IFN-gamma)
       (secrete-cytokines-IL-2-IFN-gamma . Th1-activates-macrophages-and-CTLs)
       (Th1-activates-macrophages-and-CTLs . Th2-activates-B-cells)
       (Th2-activates-B-cells . regulatory-T-cells-suppress-immune-response)
       (regulatory-T-cells-suppress-immune-response . recognize-antigen-presented-on-MHC)))

    (mhc-molecules
      (major-histocompatibility-complex)
      (present-peptide-antigens-to-T-cells)
      ((major-histocompatibility-complex . MHC-class-I-on-all-nucleated-cells)
       (MHC-class-I-on-all-nucleated-cells . presents-intracellular-peptides-8-to-10-aa)
       (presents-intracellular-peptides-8-to-10-aa . recognized-by-CD8+-T-cells)
       (recognized-by-CD8+-T-cells . MHC-class-II-on-antigen-presenting-cells)
       (MHC-class-II-on-antigen-presenting-cells . APCs-are-dendritic-cells-macrophages-B-cells)
       (APCs-are-dendritic-cells-macrophages-B-cells . presents-extracellular-peptides-13-to-25-aa)
       (presents-extracellular-peptides-13-to-25-aa . recognized-by-CD4+-T-cells)
       (recognized-by-CD4+-T-cells . highly-polymorphic-thousands-of-alleles)
       (highly-polymorphic-thousands-of-alleles . present-peptide-antigens-to-T-cells)))

    (complement-system
      (cascade-of-plasma-proteins)
      (enhances-innate-and-adaptive-immunity)
      ((cascade-of-plasma-proteins . over-30-proteins-in-complement)
       (over-30-proteins-in-complement . classical-pathway-antibody-dependent)
       (classical-pathway-antibody-dependent . alternative-pathway-spontaneous-C3-hydrolysis)
       (alternative-pathway-spontaneous-C3-hydrolysis . lectin-pathway-mannose-binding)
       (lectin-pathway-mannose-binding . all-converge-on-C3-convertase)
       (all-converge-on-C3-convertase . C3b-opsonization-tags-for-phagocytosis)
       (C3b-opsonization-tags-for-phagocytosis . C3a-C5a-attract-phagocytes-inflammation)
       (C3a-C5a-attract-phagocytes-inflammation . membrane-attack-complex-C5b-C9-forms-pore)
       (membrane-attack-complex-C5b-C9-forms-pore . lyses-target-cell)
       (lyses-target-cell . enhances-innate-and-adaptive-immunity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; VIROLOGY
    ;;; SOURCE: [Campbell-12th] Ch. 19; [Alberts-7th] Ch. 23
    ;;; ═══════════════════════════════════════════════════════════

    (lytic-cycle
      (virus-replicates-and-lyses-host)
      (releases-new-virions)
      ((virus-replicates-and-lyses-host . attachment-to-host-receptor)
       (attachment-to-host-receptor . penetration-injection-of-nucleic-acid)
       (penetration-injection-of-nucleic-acid . biosynthesis-host-machinery-makes-viral-components)
       (biosynthesis-host-machinery-makes-viral-components . assembly-of-new-virions)
       (assembly-of-new-virions . lysis-of-host-cell-releases-progeny)
       (lysis-of-host-cell-releases-progeny . T4-phage-example-burst-size-100-to-200)
       (T4-phage-example-burst-size-100-to-200 . releases-new-virions)))

    (lysogenic-cycle
      (viral-DNA-integrates-into-host-genome)
      (prophage-replicates-with-host)
      ((viral-DNA-integrates-into-host-genome . phage-DNA-becomes-prophage)
       (phage-DNA-becomes-prophage . prophage-replicated-with-host-chromosome)
       (prophage-replicated-with-host-chromosome . lysogenic-cells-immune-to-superinfection)
       (lysogenic-cells-immune-to-superinfection . stress-can-induce-switch-to-lytic-cycle)
       (stress-can-induce-switch-to-lytic-cycle . lambda-phage-is-model-temperate-phage)
       (lambda-phage-is-model-temperate-phage . prophage-replicates-with-host)))

    (retrovirus
      (RNA-genome-reverse-transcribed-to-DNA)
      (integrates-into-host-genome)
      ((RNA-genome-reverse-transcribed-to-DNA . reverse-transcriptase-RNA-to-DNA)
       (reverse-transcriptase-RNA-to-DNA . creates-double-stranded-DNA-copy)
       (creates-double-stranded-DNA-copy . integrase-inserts-into-host-chromosome)
       (integrase-inserts-into-host-chromosome . provirus-transcribed-by-host-RNA-pol-II)
       (provirus-transcribed-by-host-RNA-pol-II . viral-mRNA-translated-by-host-ribosomes)
       (viral-mRNA-translated-by-host-ribosomes . error-prone-reverse-transcriptase-high-mutation-rate)
       (error-prone-reverse-transcriptase-high-mutation-rate . integrates-into-host-genome)))

    (hiv-lifecycle
      (human-immunodeficiency-virus)
      (targets-CD4+-T-cells)
      ((human-immunodeficiency-virus . gp120-binds-CD4-receptor)
       (gp120-binds-CD4-receptor . gp41-mediates-membrane-fusion)
       (gp41-mediates-membrane-fusion . coreceptor-CCR5-or-CXCR4-required)
       (coreceptor-CCR5-or-CXCR4-required . reverse-transcriptase-copies-RNA-to-DNA)
       (reverse-transcriptase-copies-RNA-to-DNA . integrase-inserts-provirus)
       (integrase-inserts-provirus . latent-reservoir-in-resting-memory-T-cells)
       (latent-reservoir-in-resting-memory-T-cells . viral-protease-cleaves-polyproteins)
       (viral-protease-cleaves-polyproteins . budding-acquires-envelope-from-host-membrane)
       (budding-acquires-envelope-from-host-membrane . progressive-CD4-depletion-leads-to-AIDS)
       (progressive-CD4-depletion-leads-to-AIDS . targets-CD4+-T-cells)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CANCER BIOLOGY
    ;;; SOURCE: [Campbell-12th] Ch. 18; [Alberts-7th] Ch. 20
    ;;; ═══════════════════════════════════════════════════════════

    (oncogenes
      (gain-of-function-mutations-in-proto-oncogenes)
      (promote-uncontrolled-cell-growth)
      ((gain-of-function-mutations-in-proto-oncogenes . proto-oncogenes-are-normal-growth-regulators)
       (proto-oncogenes-are-normal-growth-regulators . mutation-produces-constitutively-active-protein)
       (mutation-produces-constitutively-active-protein . one-mutant-allele-sufficient-dominant)
       (one-mutant-allele-sufficient-dominant . Ras-oncogene-in-30-percent-of-cancers)
       (Ras-oncogene-in-30-percent-of-cancers . Ras-stuck-in-GTP-bound-active-state)
       (Ras-stuck-in-GTP-bound-active-state . HER2-amplification-in-breast-cancer)
       (HER2-amplification-in-breast-cancer . Myc-overexpression-drives-proliferation)
       (Myc-overexpression-drives-proliferation . promote-uncontrolled-cell-growth)))

    (tumor-suppressors
      (loss-of-function-mutations-remove-brakes)
      (both-alleles-must-be-inactivated)
      ((loss-of-function-mutations-remove-brakes . normally-inhibit-cell-cycle-progression)
       (normally-inhibit-cell-cycle-progression . two-hit-hypothesis-Knudson-1971)
       (two-hit-hypothesis-Knudson-1971 . recessive-at-cellular-level)
       (recessive-at-cellular-level . gatekeepers-directly-regulate-growth)
       (gatekeepers-directly-regulate-growth . caretakers-maintain-genomic-stability)
       (caretakers-maintain-genomic-stability . both-alleles-must-be-inactivated)))

    (p53
      (guardian-of-the-genome)
      (mutated-in-over-50-percent-of-cancers)
      ((guardian-of-the-genome . transcription-factor-activated-by-DNA-damage)
       (transcription-factor-activated-by-DNA-damage . induces-p21-which-inhibits-CDKs)
       (induces-p21-which-inhibits-CDKs . arrests-cell-cycle-at-G1-checkpoint)
       (arrests-cell-cycle-at-G1-checkpoint . allows-time-for-DNA-repair)
       (allows-time-for-DNA-repair . triggers-apoptosis-if-damage-irreparable)
       (triggers-apoptosis-if-damage-irreparable . MDM2-normally-targets-p53-for-degradation)
       (MDM2-normally-targets-p53-for-degradation . Li-Fraumeni-syndrome-germline-p53-mutation)
       (Li-Fraumeni-syndrome-germline-p53-mutation . mutated-in-over-50-percent-of-cancers)))

    (rb-retinoblastoma-protein
      (master-regulator-of-G1-to-S-transition)
      (first-tumor-suppressor-identified)
      ((master-regulator-of-G1-to-S-transition . hypophosphorylated-Rb-binds-E2F)
       (hypophosphorylated-Rb-binds-E2F . E2F-is-transcription-factor-for-S-phase-genes)
       (E2F-is-transcription-factor-for-S-phase-genes . Rb-sequesters-E2F-prevents-S-phase-entry)
       (Rb-sequesters-E2F-prevents-S-phase-entry . cyclin-D-CDK4/6-phosphorylates-Rb)
       (cyclin-D-CDK4/6-phosphorylates-Rb . phosphorylated-Rb-releases-E2F)
       (phosphorylated-Rb-releases-E2F . retinoblastoma-from-both-Rb-alleles-lost)
       (retinoblastoma-from-both-Rb-alleles-lost . first-tumor-suppressor-identified)))

    (metastasis
      (cancer-cells-spread-to-distant-sites)
      (multi-step-invasion-metastasis-cascade)
      ((cancer-cells-spread-to-distant-sites . loss-of-cell-adhesion-E-cadherin-downregulated)
       (loss-of-cell-adhesion-E-cadherin-downregulated . epithelial-to-mesenchymal-transition-EMT)
       (epithelial-to-mesenchymal-transition-EMT . invasion-through-basement-membrane)
       (invasion-through-basement-membrane . matrix-metalloproteinases-degrade-ECM)
       (matrix-metalloproteinases-degrade-ECM . intravasation-into-blood-or-lymph)
       (intravasation-into-blood-or-lymph . survival-in-circulation)
       (survival-in-circulation . extravasation-at-distant-site)
       (extravasation-at-distant-site . colonization-requires-compatible-microenvironment)
       (colonization-requires-compatible-microenvironment . seed-and-soil-hypothesis-Paget-1889)
       (seed-and-soil-hypothesis-Paget-1889 . angiogenesis-VEGF-supplies-tumor-blood-vessels)
       (angiogenesis-VEGF-supplies-tumor-blood-vessels . multi-step-invasion-metastasis-cascade)))

  )

  ((Campbell-12th-and-Alberts-7th . biology-complete-registered)))
