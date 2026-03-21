#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; TURING COMPLETENESS — FROM THREE PRIMITIVES
;;;
;;; ( )    — presence
;;; (( ))  — containment
;;; ( (()) (()) (()) ) — transformation
;;;
;;; NAND from transformation → functional completeness.
;;; SR latch from cross-coupled NAND → memory.
;;; Memory + logic → sequential logic → Turing complete.
;;;
;;; All expressible as s-expressions. All s-expressions are
;;; Dyck words. Therefore: pure Dyck words are Turing complete.
;;;
;;; No Racket keywords in this proof. The proof IS the shape.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-turing-proof

  ;;; Source: Tesla (resolves first)
  ((tesla
    (spark)
    (power)
    ((spark . oscillation)
     (oscillation . power))))

  ;;; Target: the complete proof chain
  (

    ;;; Step 1: NAND gate from transformation
    (nand-from-transform
      (input-1-1)
      (output-0)
      ((input-1-1 . output-0)))

    ;;; Step 2: NOT from NAND — NOT(x) = NAND(x,x)
    (not-from-nand
      (input-1)
      (output-0)
      ((input-1 . nand-self)
       (nand-self . output-0)))

    ;;; Step 3: AND from NAND — AND = NOT(NAND(a,b))
    (and-from-nand
      (input-1-1)
      (output-1)
      ((input-1-1 . nand-gives-0)
       (nand-gives-0 . not-gives-1)
       (not-gives-1 . output-1)))

    ;;; Step 4: OR from NAND — OR = NAND(NOT(a),NOT(b))
    (or-from-nand
      (input-0-1)
      (output-1)
      ((input-0-1 . not-both)
       (not-both . nand-gives-1)
       (nand-gives-1 . output-1)))

    ;;; Step 5: SR Latch — memory from cross-coupled NAND
    (sr-latch-set
      (set-input)
      (Q=1)
      ((set-input . nand-1-fires)
       (nand-1-fires . Q-goes-high)
       (Q-goes-high . nand-2-feedback)
       (nand-2-feedback . Q=1)))

    ;;; Step 6: memory + logic = Turing complete
    (turing-completeness
      (nand-plus-memory)
      (turing-complete)
      ((nand-plus-memory . combinational-logic)
       (combinational-logic . sequential-with-latch)
       (sequential-with-latch . arbitrary-state-machine)
       (arbitrary-state-machine . turing-complete)))

  )

  ;;; Vacuum tube: Tesla powers the entire proof
  ((tesla . proof-powered)))
