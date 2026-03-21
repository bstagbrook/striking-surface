#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; TESLA DEPTH PROOF — UNBOUNDED PROPAGATION
;;;
;;; How deep can one strike go?
;;; Answer: as deep as the nesting.
;;; Nesting depth IS the number of oscillation cycles.
;;; The shape IS the frequency.
;;;
;;; This circuit nests 5 transformations deep.
;;; The deepest resolves first. Each layer's residue becomes
;;; presence for the next. Five collapses. One strike. No clock.
;;; ═══════════════════════════════════════════════════════════════

(depth-5

  ;;; Source: depth 4 (resolves before depth 5)
  ((depth-4

    ;;; Source: depth 3 (resolves before depth 4)
    ((depth-3

      ;;; Source: depth 2 (resolves before depth 3)
      ((depth-2

        ;;; Source: depth 1 — the Tesla core (resolves first)
        ((tesla-core
          (spark)
          (oscillation)
          ((spark . oscillation))))

        ;;; Target
        (depth-2-powered)

        ;;; Vacuum tube
        ((tesla-core . depth-2-powered))))

      (depth-3-powered)
      ((depth-2 . depth-3-powered))))

    (depth-4-powered)
    ((depth-3 . depth-4-powered))))

  (depth-5-powered)
  ((depth-4 . depth-5-powered)))
