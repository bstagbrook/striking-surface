#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NATURAL NUMBERS — PEANO ARITHMETIC ON THE SURFACE
;;;
;;; Zero:  ()          — presence, nothing contained
;;; One:   (())        — containment of presence
;;; Two:   ((()))      — containment of containment
;;; Three: (((()))) — containment of containment of containment
;;;
;;; Depth of nesting IS the number. Not a representation.
;;; The shape IS the quantity.
;;;
;;; Successor: wrap in one more containment.
;;; Predecessor: unwrap one containment.
;;; Addition: nest the second number inside the first's deepest point.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-natural-numbers

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: number domain
  (

    ;;; The numbers themselves — shapes, not symbols
    (zero
      (nothing)
      (quantity-0)
      ((nothing . quantity-0)))

    (one
      (containment-of-nothing)
      (quantity-1)
      ((containment-of-nothing . quantity-1)))

    (two
      (containment-of-one)
      (quantity-2)
      ((containment-of-one . quantity-2)))

    ;;; Successor transform: n → n+1
    ;;; Wrapping = adding one level of containment
    (successor
      (any-number-n)
      (number-n+1)
      ((any-number-n . wrap-in-containment)
       (wrap-in-containment . number-n+1)))

    ;;; Predecessor transform: n → n-1 (for n > 0)
    ;;; Unwrapping = removing one level of containment
    (predecessor
      (any-number-n>0)
      (number-n-1)
      ((any-number-n>0 . unwrap-one-containment)
       (unwrap-one-containment . number-n-1)))

    ;;; Addition: structural merge
    ;;; 2 + 3 = nest 3 inside 2's deepest point = depth 5
    (addition
      (two-numbers-a-b)
      (sum-depth-a+b)
      ((two-numbers-a-b . find-deepest-of-a)
       (find-deepest-of-a . graft-b-at-depth)
       (graft-b-at-depth . sum-depth-a+b)))

    ;;; Multiplication: repeated structural merge
    ;;; 2 × 3 = three copies of depth-2, nested
    (multiplication
      (two-numbers-a-b)
      (product-depth-a*b)
      ((two-numbers-a-b . replicate-a-structure-b-times)
       (replicate-a-structure-b-times . nest-replicas)
       (nest-replicas . product-depth-a*b)))

    ;;; Equality: structural comparison
    ;;; Two numbers equal iff same nesting depth
    (equality
      (two-numbers)
      (same-depth-or-not)
      ((two-numbers . compare-nesting-depth)
       (compare-nesting-depth . same-depth-or-not)))

  )

  ;;; Vacuum tube
  ((tesla . numbers-registered)))
