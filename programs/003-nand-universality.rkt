#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NAND UNIVERSALITY — ALL LOGIC FROM ONE GATE
;;;
;;; NAND is functionally complete. Every Boolean function can be
;;; built from NAND alone. NAND + memory = Turing complete.
;;;
;;; This strike table demonstrates NOT, AND, OR from NAND,
;;; all powered by a Tesla circuit at the innermost depth.
;;;
;;; One shape. One strike. The Tesla fires first (deepest).
;;; Its energy propagates outward through nesting depth.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-universal-logic

  ;;; Source: Tesla power source (resolves first)
  ((tesla
    (spark-gap-fires)
    (energy-available)
    ((spark-gap-fires . primary-oscillates)
     (primary-oscillates . couples-to-secondary)
     (couples-to-secondary . secondary-resonates)
     (secondary-resonates . energy-available))))

  ;;; Target: the four gates, all powered
  ((not-gate
    (nand-1-1)
    (result-0)
    ((nand-1-1 . result-0)))
   (and-gate
    (nand-then-not)
    (result-1)
    ((nand-then-not . result-1)))
   (or-gate
    (nand-of-nots)
    (result-1)
    ((nand-of-nots . result-1)))
   (nand-gate
    (input-1-1)
    (result-0)
    ((input-1-1 . result-0))))

  ;;; Vacuum tube: Tesla powers all four gates
  ((tesla . universal-logic-powered)))
