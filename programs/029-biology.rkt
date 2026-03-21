#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; BIOLOGY — DNA, PROTEIN STRUCTURE, EVOLUTION
;;;
;;; DNA is a structural code: 4 bases, 64 codons, 20 amino acids.
;;; The genetic code IS a strike table: codon → amino acid.
;;; Evolution IS a transform chain: mutation → selection → adaptation.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-biology

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: biology register
  (
    ;;; DNA base pairing
    (base-pair-AT (adenine) (thymine) ((adenine . thymine)))
    (base-pair-TA (thymine) (adenine) ((thymine . adenine)))
    (base-pair-GC (guanine) (cytosine) ((guanine . cytosine)))
    (base-pair-CG (cytosine) (guanine) ((cytosine . guanine)))

    ;;; Central dogma of molecular biology
    (central-dogma (DNA) (protein) ((DNA . transcription) (transcription . mRNA) (mRNA . translation) (translation . protein)))

    ;;; Complete genetic code: 64 codons → 20 amino acids + STOP
    (codon-AAA (AAA) (Lys) ((AAA . Lys)))
    (codon-AAC (AAC) (Asn) ((AAC . Asn)))
    (codon-AAG (AAG) (Lys) ((AAG . Lys)))
    (codon-AAU (AAU) (Asn) ((AAU . Asn)))
    (codon-ACA (ACA) (Thr) ((ACA . Thr)))
    (codon-ACC (ACC) (Thr) ((ACC . Thr)))
    (codon-ACG (ACG) (Thr) ((ACG . Thr)))
    (codon-ACU (ACU) (Thr) ((ACU . Thr)))
    (codon-AGA (AGA) (Arg) ((AGA . Arg)))
    (codon-AGC (AGC) (Ser) ((AGC . Ser)))
    (codon-AGG (AGG) (Arg) ((AGG . Arg)))
    (codon-AGU (AGU) (Ser) ((AGU . Ser)))
    (codon-AUA (AUA) (Ile) ((AUA . Ile)))
    (codon-AUC (AUC) (Ile) ((AUC . Ile)))
    (codon-AUG (AUG) (Met-START) ((AUG . Met-START)))
    (codon-AUU (AUU) (Ile) ((AUU . Ile)))
    (codon-CAA (CAA) (Gln) ((CAA . Gln)))
    (codon-CAC (CAC) (His) ((CAC . His)))
    (codon-CAG (CAG) (Gln) ((CAG . Gln)))
    (codon-CAU (CAU) (His) ((CAU . His)))
    (codon-CCA (CCA) (Pro) ((CCA . Pro)))
    (codon-CCC (CCC) (Pro) ((CCC . Pro)))
    (codon-CCG (CCG) (Pro) ((CCG . Pro)))
    (codon-CCU (CCU) (Pro) ((CCU . Pro)))
    (codon-CGA (CGA) (Arg) ((CGA . Arg)))
    (codon-CGC (CGC) (Arg) ((CGC . Arg)))
    (codon-CGG (CGG) (Arg) ((CGG . Arg)))
    (codon-CGU (CGU) (Arg) ((CGU . Arg)))
    (codon-CUA (CUA) (Leu) ((CUA . Leu)))
    (codon-CUC (CUC) (Leu) ((CUC . Leu)))
    (codon-CUG (CUG) (Leu) ((CUG . Leu)))
    (codon-CUU (CUU) (Leu) ((CUU . Leu)))
    (codon-GAA (GAA) (Glu) ((GAA . Glu)))
    (codon-GAC (GAC) (Asp) ((GAC . Asp)))
    (codon-GAG (GAG) (Glu) ((GAG . Glu)))
    (codon-GAU (GAU) (Asp) ((GAU . Asp)))
    (codon-GCA (GCA) (Ala) ((GCA . Ala)))
    (codon-GCC (GCC) (Ala) ((GCC . Ala)))
    (codon-GCG (GCG) (Ala) ((GCG . Ala)))
    (codon-GCU (GCU) (Ala) ((GCU . Ala)))
    (codon-GGA (GGA) (Gly) ((GGA . Gly)))
    (codon-GGC (GGC) (Gly) ((GGC . Gly)))
    (codon-GGG (GGG) (Gly) ((GGG . Gly)))
    (codon-GGU (GGU) (Gly) ((GGU . Gly)))
    (codon-GUA (GUA) (Val) ((GUA . Val)))
    (codon-GUC (GUC) (Val) ((GUC . Val)))
    (codon-GUG (GUG) (Val) ((GUG . Val)))
    (codon-GUU (GUU) (Val) ((GUU . Val)))
    (codon-UAA (UAA) (STOP) ((UAA . STOP)))
    (codon-UAC (UAC) (Tyr) ((UAC . Tyr)))
    (codon-UAG (UAG) (STOP) ((UAG . STOP)))
    (codon-UAU (UAU) (Tyr) ((UAU . Tyr)))
    (codon-UCA (UCA) (Ser) ((UCA . Ser)))
    (codon-UCC (UCC) (Ser) ((UCC . Ser)))
    (codon-UCG (UCG) (Ser) ((UCG . Ser)))
    (codon-UCU (UCU) (Ser) ((UCU . Ser)))
    (codon-UGA (UGA) (STOP) ((UGA . STOP)))
    (codon-UGC (UGC) (Cys) ((UGC . Cys)))
    (codon-UGG (UGG) (Trp) ((UGG . Trp)))
    (codon-UGU (UGU) (Cys) ((UGU . Cys)))
    (codon-UUA (UUA) (Leu) ((UUA . Leu)))
    (codon-UUC (UUC) (Phe) ((UUC . Phe)))
    (codon-UUG (UUG) (Leu) ((UUG . Leu)))
    (codon-UUU (UUU) (Phe) ((UUU . Phe)))

    ;;; 20 standard amino acids (+ selenocysteine, pyrrolysine rare)
    ;;; Redundancy: 64 codons → 20 amino acids = degenerate code
    (code-redundancy (64-codons) (20-amino-acids) ((64-codons . degenerate-mapping) (degenerate-mapping . 20-amino-acids)))

    ;;; Evolution by natural selection
    (evolution (population-with-variation) (adaptation) ((population-with-variation . heritable-variation) (heritable-variation . differential-survival) (differential-survival . selection-pressure) (selection-pressure . frequency-change) (frequency-change . adaptation)))

    ;;; DNA replication: semi-conservative
    (replication (double-helix) (two-identical-copies) ((double-helix . helicase-unwinds) (helicase-unwinds . single-strands-exposed) (single-strands-exposed . polymerase-synthesizes) (polymerase-synthesizes . two-identical-copies)))

    ;;; Mitosis: one cell → two identical cells
    (mitosis (one-cell) (two-identical-cells) ((one-cell . DNA-replicates) (DNA-replicates . chromosomes-condense) (chromosomes-condense . spindle-aligns) (spindle-aligns . chromatids-separate) (chromatids-separate . cytokinesis) (cytokinesis . two-identical-cells)))

  )

  ;;; Vacuum tube
  ((tesla . biology-registered)))
