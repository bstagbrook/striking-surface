#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NAND UNIVERSALITY — ALL LOGIC FROM ONE GATE
;;;
;;; PURPOSE: Demonstrate that NAND alone produces all Boolean
;;; logic, establishing functional completeness as a foundation
;;; for the Turing completeness argument.
;;;
;;; NAND is functionally complete. Every Boolean function can be
;;; built from NAND alone. NAND + memory = Turing complete.
;;;
;;; TURING COMPLETENESS ARGUMENT (from archived 006):
;;; ( ) = presence. (( )) = containment. ((())(())(()))= transform.
;;; NAND from transform → functional completeness.
;;; SR latch from cross-coupled NAND → memory.
;;; Memory + combinational logic → sequential logic → Turing complete.
;;; All expressible as s-expressions. All s-expressions are Dyck words.
;;; Therefore: pure Dyck words are Turing complete.
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
