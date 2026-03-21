#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; BOOLEAN LOGIC — COMPLETE GATE LIBRARY
;;;
;;; True:  (())   — containment (something is there)
;;; False: ()     — presence alone (nothing contained)
;;;
;;; NAND is the universal gate. Everything derives from NAND.
;;; Each gate is a transform with explicit truth table pairs.
;;; The vacuum tube captures which path collapsed.
;;;
;;; This is not a simulation of logic. The shapes ARE logic.
;;; The collapse chain IS the computation.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-boolean-logic

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: complete gate library
  (

    ;;; NAND — the universal gate
    ;;; Only (true,true) → false. All others → true.
    (nand-gate
      (true-true)
      (false)
      ((true-true . false)
       (true-false . true)
       (false-true . true)
       (false-false . true)))

    ;;; NOT — from NAND(x,x)
    (not-gate
      (true)
      (false)
      ((true . false)
       (false . true)))

    ;;; AND — NOT(NAND(a,b))
    (and-gate
      (true-true)
      (true)
      ((true-true . true)
       (true-false . false)
       (false-true . false)
       (false-false . false)))

    ;;; OR — NAND(NOT(a),NOT(b))
    (or-gate
      (false-false)
      (false)
      ((true-true . true)
       (true-false . true)
       (false-true . true)
       (false-false . false)))

    ;;; XOR — exactly one true
    (xor-gate
      (true-false)
      (true)
      ((true-true . false)
       (true-false . true)
       (false-true . true)
       (false-false . false)))

    ;;; IMPLIES — false only when true→false
    (implies-gate
      (true)
      (anything)
      ((true-true . true)
       (true-false . false)
       (false-true . true)
       (false-false . true)))

    ;;; Half adder — XOR for sum, AND for carry
    (half-adder
      (two-bits)
      (sum-and-carry)
      ((true-true . sum-false-carry-true)
       (true-false . sum-true-carry-false)
       (false-true . sum-true-carry-false)
       (false-false . sum-false-carry-false)))

  )

  ;;; Vacuum tube
  ((tesla . logic-registered)))
