#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; BOOLEAN LOGIC — COMPLETE GATE LIBRARY
;;;
;;; True:  (())   — containment (something is there)
;;; False: ()     — presence alone (nothing contained)
;;;
;;; NAND is the universal gate. Everything derives from NAND.
;;;
;;; DESIGN: Each gate is one transform per input combination.
;;; The source IS the input. The pair maps it to the output.
;;; The vacuum tube fills with the proof: (input . output).
;;;
;;; This is not a simulation of logic. The shapes ARE logic.
;;; The collapse chain IS the computation.
;;;
;;; AUDIT FIX: Previous version had sources that didn't match
;;; pair keys (implies source "true" vs key "true-true").
;;; Now every transform traces correctly.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-boolean-logic

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: complete gate library — every input traces
  (

    ;;; NAND truth table — one transform per input
    (nand-TT (true-true) (false) ((true-true . false)))
    (nand-TF (true-false) (true) ((true-false . true)))
    (nand-FT (false-true) (true) ((false-true . true)))
    (nand-FF (false-false) (true) ((false-false . true)))

    ;;; NOT
    (not-T (true) (false) ((true . false)))
    (not-F (false) (true) ((false . true)))

    ;;; AND truth table
    (and-TT (true-true) (true) ((true-true . true)))
    (and-TF (true-false) (false) ((true-false . false)))
    (and-FT (false-true) (false) ((false-true . false)))
    (and-FF (false-false) (false) ((false-false . false)))

    ;;; OR truth table
    (or-TT (true-true) (true) ((true-true . true)))
    (or-TF (true-false) (true) ((true-false . true)))
    (or-FT (false-true) (true) ((false-true . true)))
    (or-FF (false-false) (false) ((false-false . false)))

    ;;; XOR truth table
    (xor-TT (true-true) (false) ((true-true . false)))
    (xor-TF (true-false) (true) ((true-false . true)))
    (xor-FT (false-true) (true) ((false-true . true)))
    (xor-FF (false-false) (false) ((false-false . false)))

    ;;; IMPLIES truth table
    (imp-TT (true-true) (true) ((true-true . true)))
    (imp-TF (true-false) (false) ((true-false . false)))
    (imp-FT (false-true) (true) ((false-true . true)))
    (imp-FF (false-false) (true) ((false-false . true)))

    ;;; Half adder: XOR for sum, AND for carry
    (hadd-TT (true-true) (sum-0-carry-1) ((true-true . sum-0-carry-1)))
    (hadd-TF (true-false) (sum-1-carry-0) ((true-false . sum-1-carry-0)))
    (hadd-FT (false-true) (sum-1-carry-0) ((false-true . sum-1-carry-0)))
    (hadd-FF (false-false) (sum-0-carry-0) ((false-false . sum-0-carry-0)))

  )

  ;;; Vacuum tube
  ((tesla . logic-registered)))
