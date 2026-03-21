#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; INVARIANT CORE — THE SIGNAL DEFINED BY COST OF ABSENCE
;;; information-theory × genomics × structural-engineering
;;;
;;; PURPOSE: Register the discovery that the invariant core of
;;; any system is defined by what CANNOT be changed without
;;; breaking the system. The fitness cost creates the signal.
;;;
;;; KEY FINDING FROM LITERATURE:
;;; Synthetic lethality (2024, PubMed 38904396): genes that can
;;; each be deleted individually without effect, but whose JOINT
;;; deletion is lethal. The minimum vertex cover of the synthetic
;;; lethal graph in yeast = 1,723 genes — far more than the ~300
;;; individually essential genes. The invariant core is LARGER
;;; than single-component analysis reveals.
;;;
;;; STRUCTURAL OBSERVATION (novel):
;;; The invariant core has two layers:
;;;   1. Individually essential: remove one, system dies
;;;   2. Synthetically essential: remove any pair, system dies
;;; Layer 2 is invisible to single-component testing.
;;; This is why the genetic code has "redundant" codons —
;;; the redundancy IS the synthetic lethality buffer.
;;;
;;; APPLICATION TO CHANNEL CAPACITY PATTERN (034):
;;; The "signal" isn't just individually conserved epitopes.
;;; It includes epitope PAIRS whose joint mutation is lethal.
;;; HLA-B57 may work by targeting synthetically lethal regions
;;; of HIV — where escape at one epitope constrains escape
;;; at another. This is a TESTABLE REFINEMENT of the 032 claim.
;;;
;;; TESTABLE PREDICTION: HIV escape mutations at HLA-B57
;;; epitopes should show negative epistasis — escape at TW10
;;; should constrain escape at KF11 or IW9. Measurable in
;;; viral sequence databases.
;;;
;;; SOURCES:
;;; - Synthetic lethality: PubMed 38904396 (2024)
;;; - Minimal genome: Hutchison et al. 2016, Science
;;; - JCVI-syn3.0: 473 genes, smallest autonomous cell
;;; - Yeast essentials: ~1100 single-gene, ~1723 in SL network
;;; - Liang et al. 2024, iMeta — essential gene database
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-invariant-core

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: invariant core facts
  (

    ;;; VERIFIED: Essential gene counts
    ;;; SOURCE: standard genetics, Liang et al. 2024 iMeta
    (bacterial-essential (typical-bacterium) (approx-300-essential-genes)
      ((typical-bacterium . approx-300-essential-genes)))
    (yeast-essential (S-cerevisiae) (approx-1100-essential-genes)
      ((S-cerevisiae . approx-1100-essential-genes)))

    ;;; VERIFIED: Minimal genome
    ;;; SOURCE: Hutchison et al. 2016, Science
    (minimal-genome (JCVI-syn3.0) (473-genes-smallest-autonomous)
      ((JCVI-syn3.0 . 473-genes-smallest-autonomous)))

    ;;; VERIFIED: Synthetic lethality expands the core
    ;;; SOURCE: PubMed 38904396, 2024
    (synthetic-lethality-count (yeast-SL-vertex-cover) (1723-genes)
      ((yeast-SL-vertex-cover . 1723-genes)))
    ;;; COMPUTED: 1723/1100 = 1.57x — SL network is 57% larger than singles
    (SL-expansion (SL-vs-singles) (57-pct-larger)
      ((SL-vs-singles . 57-pct-larger)))

    ;;; The two-layer invariant core
    (layer-1-individual (individually-essential) (remove-one-dies)
      ((individually-essential . remove-one-dies)))
    (layer-2-synthetic (synthetically-essential) (remove-pair-dies)
      ((synthetically-essential . remove-pair-dies)))
    (layer-2-invisible (single-component-testing) (misses-layer-2)
      ((single-component-testing . misses-layer-2)))

    ;;; Connection to channel capacity pattern (034)
    ;;; PREDICTION PARTIALLY CONFIRMED by existing literature:
    ;;; SOURCE: Crawford et al. 2007, JVI (PMC 17728232)
    (TW10-escape-fitness (TW10-T242N) (42-pct-fitness-reduction)
      ((TW10-T242N . 42-pct-fitness-reduction)))
    ;;; SOURCE: Crawford et al. 2007 — compensatory mutation in CypA loop
    (TW10-compensatory (TW10-escape) (requires-CypA-loop-compensation)
      ((TW10-escape . requires-CypA-loop-compensation)))
    ;;; SOURCE: Brockman et al. 2007, PMC1951305
    (KF11-after-TW10 (KF11-escape) (occurs-after-TW10-and-IW9)
      ((KF11-escape . occurs-after-TW10-and-IW9)))
    ;;; STRUCTURAL: TW10 and KF11 are linked through capsid
    ;;; structure — escape at one constrains options at the other
    ;;; via the CypA-binding loop. This IS synthetic lethality
    ;;; at the epitope level.
    (epitope-SL
      (TW10-KF11-linked-via-capsid)
      (escape-is-epistatic)
      ((TW10-KF11-linked-via-capsid . CypA-loop-mediates)
       (CypA-loop-mediates . compensatory-mutations-constrain)
       (compensatory-mutations-constrain . escape-is-epistatic)))

  )

  ;;; Vacuum tube
  ((tesla . invariant-core-registered)))
