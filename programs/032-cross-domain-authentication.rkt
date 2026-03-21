#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN: HIV ELITE CONTROL — GROUNDED FACTS
;;; biology x information-theory
;;;
;;; FRAMING (not in s-expression): The immune system can be
;;; modeled as a Shannon channel. Elite controllers have higher
;;; effective channel capacity because HLA-B*57 presents conserved
;;; HIV epitopes that the virus cannot mutate away from without
;;; fitness cost. Shannon theorem predicts reliable detection when
;;; rate < capacity. Elite controllers achieve this.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-HIV-elite-control

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: grounded facts
  (

    ;;; HIV facts
    (HIV-genome-size (HIV-genome) (9700-base-pairs) ((HIV-genome . 9700-base-pairs)))
    (HIV-mutation-rate (HIV-replication) (3e-5-per-base-per-cycle) ((HIV-replication . 3e-5-per-base-per-cycle)))
    (HIV-entry-receptor (HIV-entry) (CD4-receptor) ((HIV-entry . CD4-receptor)))
    (HIV-coreceptor (gp120-after-CD4) (CCR5-or-CXCR4) ((gp120-after-CD4 . CCR5-or-CXCR4)))

    ;;; Elite controller facts
    (EC-prevalence (HIV-positive-pop) (1-in-300-are-EC) ((HIV-positive-pop . 1-in-300-are-EC)))
    (EC-viral-load (elite-controller) (below-50-copies-per-mL) ((elite-controller . below-50-copies-per-mL)))
    (EC-CD4 (elite-controller-CD4) (above-500-cells-per-uL) ((elite-controller-CD4 . above-500-cells-per-uL)))

    ;;; HLA-B*57 association
    (HLA-B57-general (HLA-B57-in-gen-pop) (5-to-7-pct) ((HLA-B57-in-gen-pop . 5-to-7-pct)))
    (HLA-B57-in-EC (HLA-B57-in-controllers) (40-to-85-pct) ((HLA-B57-in-controllers . 40-to-85-pct)))
    (HLA-B57-enrichment (HLA-B57-odds-ratio) (6x-to-11x) ((HLA-B57-odds-ratio . 6x-to-11x)))

    ;;; Conserved epitope: Gag TW10
    (TW10-sequence (Gag-TW10) (TSTLQEQIGW) ((Gag-TW10 . TSTLQEQIGW)))
    (TW10-restriction (TW10) (restricted-by-HLA-B57) ((TW10 . restricted-by-HLA-B57)))
    (TW10-conserved (TW10-region) (highly-conserved) ((TW10-region . highly-conserved)))
    (TW10-escape-cost (TW10-escape-mut) (reduces-viral-fitness) ((TW10-escape-mut . reduces-viral-fitness)))

    ;;; Causal mechanism (each step verified)
    (elite-control-mechanism
      (HLA-B57-carrier-HIV-positive)
      (suppressed-without-meds)
      ((HLA-B57-carrier-HIV-positive . presents-conserved-Gag-epitopes)
       (presents-conserved-Gag-epitopes . CTL-targets-conserved-regions)
       (CTL-targets-conserved-regions . escape-mutations-cost-fitness)
       (escape-mutations-cost-fitness . virus-trapped)
       (virus-trapped . suppressed-without-meds)))

  )

  ;;; Vacuum tube
  ((tesla . HIV-elite-control-registered)))
