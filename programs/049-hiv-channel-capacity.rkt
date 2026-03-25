#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; HIV CHANNEL CAPACITY — EMPIRICAL FINDING
;;;
;;; The data, registered as presence and containment.
;;; 500 HIV-1 Gag sequences, MAFFT aligned.
;;; Shannon entropy per position. Epitope positions mapped from
;;; published immunodominant epitopes and IEDB T-cell epitope DB.
;;;
;;; FINDING: Protective HLA alleles target conserved Gag positions.
;;; Non-protective alleles target variable positions.
;;; Complete separation in hand-picked immunodominant epitopes.
;;; Substantial separation (62% vs 13%) in systematic IEDB query.
;;;
;;; SOURCES:
;;; B*57 IW9, KF11: Pymm et al. 2022, PMC9704518
;;; B*27 KK10: Schneidewind et al. 2007
;;; B*81 TL9: Nature Communications 2018, s41467-018-07209-7
;;; B*13 RI9: PMC1866034
;;; A*02 SL9: standard reference
;;; A*03 RK9: standard reference
;;; B*07:02, B*08:01: IEDB API, Pereyra et al. 2010
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-hiv-channel-capacity

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: the empirical finding
  (

    ;;; ── Ground truth: Gag background ──
    ;;; 500 sequences, alignment length ~500 positions
    ;;; Mean background entropy across all non-epitope positions
    (gag-background
      (500-sequences)
      (mean-entropy-0.266-bits)
      ((500-sequences . MAFFT-aligned)
       (MAFFT-aligned . per-position-Shannon-entropy)
       (per-position-Shannon-entropy . mean-entropy-0.266-bits)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HAND-PICKED IMMUNODOMINANT EPITOPES (highest quality)
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ── Protective alleles ──

    ;;; B*57:01 — KF11 + IW9
    ;;; SOURCE: Pymm et al. 2022, PMC9704518
    (B*57-hand-picked
      (KF11-positions-162-172 . IW9-positions-138-146)
      (entropy-0.097-bits . reduction-64.0-pct)
      ((20-positions . epitope-entropy-0.097)
       (epitope-entropy-0.097 . background-entropy-0.268)
       (background-entropy-0.268 . reduction-64.0-pct)
       (reduction-64.0-pct . p-value-0.031)))

    ;;; B*27:05 — KK10
    ;;; SOURCE: Schneidewind et al. 2007
    (B*27-hand-picked
      (KK10-positions-263-272)
      (entropy-0.063-bits . reduction-76.4-pct)
      ((10-positions . epitope-entropy-0.063)
       (epitope-entropy-0.063 . background-entropy-0.266)
       (background-entropy-0.266 . reduction-76.4-pct)
       (reduction-76.4-pct . p-value-0.186)))

    ;;; B*13:02 — RI9
    ;;; SOURCE: PMC1866034
    (B*13-hand-picked
      (RI9-RQANFLGKI)
      (entropy-0.085-bits . reduction-67.9-pct)
      ((9-positions . epitope-entropy-0.085)
       (epitope-entropy-0.085 . background-entropy-0.265)
       (background-entropy-0.265 . reduction-67.9-pct)
       (reduction-67.9-pct . p-value-0.496)))

    ;;; B*81:01 — TL9
    ;;; SOURCE: Nature Communications 2018, s41467-018-07209-7
    (B*81-hand-picked
      (TL9-TPQDLNTML)
      (entropy-0.113-bits . reduction-57.4-pct)
      ((9-positions . epitope-entropy-0.113)
       (epitope-entropy-0.113 . background-entropy-0.265)
       (background-entropy-0.265 . reduction-57.4-pct)
       (reduction-57.4-pct . p-value-0.406)))

    ;;; ── Non-protective alleles ──

    ;;; A*02:01 — SL9
    ;;; SOURCE: standard reference
    (A*02-hand-picked
      (SL9-SLYNTVATL)
      (entropy-0.330-bits . reduction-neg-26.4-pct)
      ((9-positions . epitope-entropy-0.330)
       (epitope-entropy-0.330 . background-entropy-0.261)
       (background-entropy-0.261 . reduction-neg-26.4-pct)
       (reduction-neg-26.4-pct . targets-variable-region)))

    ;;; A*03:01 — RK9
    ;;; SOURCE: standard reference
    (A*03-hand-picked
      (RK9-RLRPGGKKK)
      (entropy-0.297-bits . reduction-neg-13.4-pct)
      ((9-positions . epitope-entropy-0.297)
       (epitope-entropy-0.297 . background-entropy-0.262)
       (background-entropy-0.262 . reduction-neg-13.4-pct)
       (reduction-neg-13.4-pct . targets-variable-region)))

    ;;; ── Hand-picked group separation ──
    (hand-picked-separation
      (protective-mean-66.4-pct . non-protective-mean-neg-19.9-pct)
      (complete-separation)
      ((protective-mean-66.4-pct . all-positive)
       (non-protective-mean-neg-19.9-pct . all-negative)
       (all-positive . zero-overlap-with-all-negative)
       (zero-overlap-with-all-negative . complete-separation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IEDB SYSTEMATIC QUERY (unbiased, noisier)
    ;;; SOURCE: IEDB API, https://query-api.iedb.org/
    ;;; ═══════════════════════════════════════════════════════════

    ;;; B*27:05 — IEDB
    (B*27-IEDB
      (IEDB-5-hits . 2-mapped)
      (entropy-0.057-bits . reduction-78.7-pct)
      ((12-positions . epitope-entropy-0.057)
       (epitope-entropy-0.057 . reduction-78.7-pct)
       (reduction-78.7-pct . p-value-0.120)))

    ;;; B*57:01 — IEDB
    (B*57-IEDB
      (IEDB-24-hits . 5-mapped)
      (entropy-0.148-bits . reduction-45.1-pct)
      ((39-positions . epitope-entropy-0.148)
       (epitope-entropy-0.148 . reduction-45.1-pct)
       (reduction-45.1-pct . p-value-0.163)))

    ;;; B*07:02 — IEDB (THE ANOMALY)
    ;;; Targets conserved regions (37%) but does NOT confer protection
    ;;; SOURCE: Pereyra et al. 2010 (non-protective classification)
    (B*07-IEDB
      (IEDB-54-hits . 3-mapped)
      (entropy-0.169-bits . reduction-36.7-pct)
      ((26-positions . epitope-entropy-0.169)
       (epitope-entropy-0.169 . reduction-36.7-pct)
       (reduction-36.7-pct . p-value-0.112)
       (reduction-36.7-pct . ANOMALY-conserved-but-non-protective)))

    ;;; B*08:01 — IEDB
    (B*08-IEDB
      (IEDB-8-hits . 6-mapped)
      (entropy-0.233-bits . reduction-11.7-pct)
      ((26-positions . epitope-entropy-0.233)
       (epitope-entropy-0.233 . reduction-11.7-pct)
       (reduction-11.7-pct . p-value-0.420)))

    ;;; A*02:01 — IEDB
    (A*02-IEDB
      (IEDB-26-hits . 11-mapped)
      (entropy-0.242-bits . reduction-8.2-pct)
      ((37-positions . epitope-entropy-0.242)
       (epitope-entropy-0.242 . reduction-8.2-pct)
       (reduction-8.2-pct . p-value-0.773)))

    ;;; A*03:01 — IEDB
    (A*03-IEDB
      (IEDB-19-hits . 6-mapped)
      (entropy-0.278-bits . reduction-neg-6.1-pct)
      ((11-positions . epitope-entropy-0.278)
       (epitope-entropy-0.278 . reduction-neg-6.1-pct)
       (reduction-neg-6.1-pct . p-value-0.952)))

    ;;; ── IEDB group separation ──
    (IEDB-separation
      (protective-mean-61.9-pct . non-protective-mean-12.6-pct)
      (substantial-separation)
      ((protective-mean-61.9-pct . 2-alleles)
       (non-protective-mean-12.6-pct . 4-alleles)
       (Mann-Whitney-U . p-value-0.067)
       (p-value-0.067 . minimum-possible-for-2-vs-4)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE OPEN QUESTION: B*07:02
    ;;; Conservation targeting is necessary but not sufficient?
    ;;; What else does B*57 have that B*07 lacks?
    ;;; ═══════════════════════════════════════════════════════════

    ;;; B*07:02 targets moderately conserved positions (37% reduction)
    ;;; but is classified non-protective (Pereyra et al. 2010).
    ;;; Possible explanations (each testable):
    ;;;   1. Escape fitness cost: B*57 epitope escape costs more
    ;;;   2. Epitope processing: B*57 epitopes processed more efficiently
    ;;;   3. TCR repertoire: B*57-restricted T cells have higher avidity
    ;;;   4. Structural depth: B*57 epitopes sit at buried/structural positions
    ;;;      vs B*07 epitopes at surface-exposed conserved positions
    ;;; Each of these IS a strike table. Each IS a testable prediction.
    (B*07-open-question
      (conserved-but-non-protective)
      (conservation-necessary-not-sufficient)
      ((conserved-but-non-protective . B*07-reduction-36.7-pct)
       (B*07-reduction-36.7-pct . conserved-targeting-confirmed)
       (conserved-targeting-confirmed . protection-not-conferred)
       (protection-not-conferred . additional-factor-required)
       (additional-factor-required . conservation-necessary-not-sufficient)))

  )

  ;;; Vacuum tube
  ((tesla . hiv-channel-capacity-registered)))
