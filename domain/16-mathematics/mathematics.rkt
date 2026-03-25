#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Mathematics — from presence and containment
;;; LAYER: 16-mathematics
;;; DEPENDS ON: nothing (foundational)
;;;
;;; Numbers are not imported. They are derived.
;;; 0 = () — empty presence
;;; 1 = (()) — containment of presence
;;; 2 = (() ()) — two presences
;;; n = n presences contained
;;;
;;; Every operation is a transform on containment.
;;; Addition is union. Multiplication is nesting.
;;; Nothing borrowed. Everything from ( and ).
;;;
;;; SOURCE: Peano 1889, Church 1936, ZF set theory
;;; ═══════════════════════════════════════════════════════════════

(domain-mathematics

  ((foundations (presence-and-containment) (authoritative) ((presence-and-containment . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NATURAL NUMBERS — from presence
    ;;; ═══════════════════════════════════════════════════════════

    (zero
      (empty-presence)
      (the-number-0)
      ((empty-presence . nothing-contained)
       (nothing-contained . the-additive-identity)
       (the-additive-identity . the-number-0)))

    (successor
      (any-number-n)
      (n-plus-one)
      ((any-number-n . add-one-containment)
       (add-one-containment . Peano-axiom)
       (Peano-axiom . n-plus-one)))

    (one
      (successor-of-zero)
      (the-number-1)
      ((successor-of-zero . containment-of-empty)
       (containment-of-empty . the-multiplicative-identity)
       (the-multiplicative-identity . the-number-1)))

    (infinity
      (no-largest-natural-number)
      (always-one-more)
      ((no-largest-natural-number . for-every-n-exists-n-plus-1)
       (for-every-n-exists-n-plus-1 . Peano-axiom-5)
       (Peano-axiom-5 . always-one-more)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ARITHMETIC — transforms on containment
    ;;; ═══════════════════════════════════════════════════════════

    (addition
      (two-containments)
      (union-of-presences)
      ((two-containments . place-side-by-side)
       (place-side-by-side . count-total-presences)
       (count-total-presences . commutative-a-plus-b-equals-b-plus-a)
       (commutative-a-plus-b-equals-b-plus-a . associative)
       (associative . union-of-presences)))

    (multiplication
      (containment-a . containment-b)
      (a-copies-of-b)
      ((containment-a . for-each-presence-in-a)
       (for-each-presence-in-a . place-one-copy-of-b)
       (place-one-copy-of-b . commutative-a-times-b-equals-b-times-a)
       (commutative-a-times-b-equals-b-times-a . a-copies-of-b)))

    (subtraction
      (two-containments-a-minus-b)
      (remove-b-presences-from-a)
      ((two-containments-a-minus-b . requires-a-ge-b-for-naturals)
       (requires-a-ge-b-for-naturals . motivates-integers)
       (motivates-integers . remove-b-presences-from-a)))

    (division
      (containment-a . containment-b)
      (how-many-copies-of-b-fit-in-a)
      ((containment-a . partition-into-groups-of-size-b)
       (partition-into-groups-of-size-b . count-groups)
       (count-groups . remainder-if-not-exact)
       (remainder-if-not-exact . motivates-rationals)
       (motivates-rationals . how-many-copies-of-b-fit-in-a)))

    (exponentiation
      (base-b . exponent-n)
      (b-multiplied-by-itself-n-times)
      ((base-b . nesting-of-multiplication)
       (nesting-of-multiplication . b-to-0-equals-1)
       (b-to-0-equals-1 . b-to-n-equals-b-times-b-to-n-minus-1)
       (b-to-n-equals-b-times-b-to-n-minus-1 . b-multiplied-by-itself-n-times)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NUMBER SYSTEMS — each extends the previous
    ;;; ═══════════════════════════════════════════════════════════

    (integers
      (naturals-plus-negatives)
      (closed-under-subtraction)
      ((naturals-plus-negatives . every-n-has-additive-inverse-minus-n)
       (every-n-has-additive-inverse-minus-n . subtraction-always-defined)
       (subtraction-always-defined . closed-under-subtraction)))

    (rationals
      (integers-plus-fractions)
      (closed-under-division-except-by-zero)
      ((integers-plus-fractions . every-nonzero-n-has-multiplicative-inverse-1-over-n)
       (every-nonzero-n-has-multiplicative-inverse-1-over-n . division-always-defined-except-zero)
       (division-always-defined-except-zero . countably-infinite)
       (countably-infinite . closed-under-division-except-by-zero)))

    (irrationals
      (not-expressible-as-ratio)
      (fill-gaps-in-rationals)
      ((not-expressible-as-ratio . sqrt-2-is-irrational-Hippasus)
       (sqrt-2-is-irrational-Hippasus . pi-is-irrational-Lambert-1761)
       (pi-is-irrational-Lambert-1761 . e-is-irrational-Euler-1737)
       (e-is-irrational-Euler-1737 . fill-gaps-in-rationals)))

    (reals
      (rationals-plus-irrationals)
      (complete-ordered-field)
      ((rationals-plus-irrationals . no-gaps-on-number-line)
       (no-gaps-on-number-line . Dedekind-completeness-1872)
       (Dedekind-completeness-1872 . uncountably-infinite-Cantor-1874)
       (uncountably-infinite-Cantor-1874 . complete-ordered-field)))

    (complex-numbers
      (reals-plus-imaginary-unit-i)
      (algebraically-closed)
      ((reals-plus-imaginary-unit-i . i-squared-equals-minus-1)
       (i-squared-equals-minus-1 . every-polynomial-has-root)
       (every-polynomial-has-root . fundamental-theorem-of-algebra)
       (fundamental-theorem-of-algebra . algebraically-closed)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNDAMENTAL CONSTANTS — from structure
    ;;; ═══════════════════════════════════════════════════════════

    (pi
      (ratio-circumference-to-diameter)
      (3.14159265358979)
      ((ratio-circumference-to-diameter . same-for-every-circle)
       (same-for-every-circle . transcendental-Lindemann-1882)
       (transcendental-Lindemann-1882 . 3.14159265358979)))

    (e
      (base-of-natural-logarithm)
      (2.71828182845905)
      ((base-of-natural-logarithm . limit-of-1-plus-1-over-n-to-n)
       (limit-of-1-plus-1-over-n-to-n . derivative-of-e-to-x-is-e-to-x)
       (derivative-of-e-to-x-is-e-to-x . transcendental-Hermite-1873)
       (transcendental-Hermite-1873 . 2.71828182845905)))

    (Euler-identity
      (e-to-i-pi-plus-1)
      (equals-zero)
      ((e-to-i-pi-plus-1 . connects-5-fundamental-constants)
       (connects-5-fundamental-constants . e-i-pi-1-and-0)
       (e-i-pi-1-and-0 . called-most-beautiful-equation)
       (called-most-beautiful-equation . equals-zero)))

    (golden-ratio
      (phi-equals-1-plus-sqrt-5-over-2)
      (1.61803398874989)
      ((phi-equals-1-plus-sqrt-5-over-2 . phi-squared-equals-phi-plus-1)
       (phi-squared-equals-phi-plus-1 . appears-in-Fibonacci-sequence)
       (appears-in-Fibonacci-sequence . 1.61803398874989)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SET THEORY — containment formalized
    ;;; ═══════════════════════════════════════════════════════════

    (empty-set
      (set-with-no-elements)
      (exists-by-axiom)
      ((set-with-no-elements . ZF-axiom-of-empty-set)
       (ZF-axiom-of-empty-set . unique)
       (unique . exists-by-axiom)))

    (union
      (two-sets-A-and-B)
      (all-elements-in-either)
      ((two-sets-A-and-B . ZF-axiom-of-union)
       (ZF-axiom-of-union . all-elements-in-either)))

    (intersection
      (two-sets-A-and-B)
      (elements-in-both)
      ((two-sets-A-and-B . derivable-from-separation)
       (derivable-from-separation . elements-in-both)))

    (power-set
      (set-S)
      (set-of-all-subsets)
      ((set-S . ZF-axiom-of-power-set)
       (ZF-axiom-of-power-set . 2-to-n-subsets-for-n-elements)
       (2-to-n-subsets-for-n-elements . set-of-all-subsets)))

    (cardinality
      (set-S)
      (number-of-elements)
      ((set-S . finite-or-infinite)
       (finite-or-infinite . countable-or-uncountable)
       (countable-or-uncountable . Cantor-diagonal-argument-1891)
       (Cantor-diagonal-argument-1891 . number-of-elements)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOGIC — truth from structure
    ;;; ═══════════════════════════════════════════════════════════

    (propositional-logic
      (propositions-with-truth-values)
      (AND-OR-NOT-IMPLIES)
      ((propositions-with-truth-values . true-or-false)
       (true-or-false . connectives-combine)
       (connectives-combine . truth-tables-define-meaning)
       (truth-tables-define-meaning . AND-OR-NOT-IMPLIES)))

    (predicate-logic
      (propositions-with-variables-and-quantifiers)
      (for-all-and-there-exists)
      ((propositions-with-variables-and-quantifiers . extends-propositional)
       (extends-propositional . universal-quantifier-for-all)
       (universal-quantifier-for-all . existential-quantifier-there-exists)
       (existential-quantifier-there-exists . for-all-and-there-exists)))

    (proof
      (sequence-of-valid-inferences)
      (conclusion-follows-from-premises)
      ((sequence-of-valid-inferences . each-step-justified)
       (each-step-justified . axiom-or-inference-rule)
       (axiom-or-inference-rule . chain-from-premises-to-conclusion)
       (chain-from-premises-to-conclusion . conclusion-follows-from-premises)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TOPOLOGY — shape without measurement
    ;;; ═══════════════════════════════════════════════════════════

    (topological-space
      (set-with-open-sets)
      (structure-preserved-under-continuous-deformation)
      ((set-with-open-sets . open-sets-closed-under-union-and-finite-intersection)
       (open-sets-closed-under-union-and-finite-intersection . homeomorphism-preserves-topology)
       (homeomorphism-preserves-topology . structure-preserved-under-continuous-deformation)))

    (connectedness
      (topological-space)
      (cannot-be-split-into-disjoint-open-sets)
      ((topological-space . either-connected-or-disconnected)
       (either-connected-or-disconnected . connected-means-one-piece)
       (connected-means-one-piece . cannot-be-split-into-disjoint-open-sets)))

    (compactness
      (topological-space)
      (every-open-cover-has-finite-subcover)
      ((topological-space . generalization-of-closed-and-bounded)
       (generalization-of-closed-and-bounded . Heine-Borel-theorem)
       (Heine-Borel-theorem . every-open-cover-has-finite-subcover)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNCTIONS — transforms formalized
    ;;; ═══════════════════════════════════════════════════════════

    (function
      (mapping-from-domain-to-codomain)
      (each-input-exactly-one-output)
      ((mapping-from-domain-to-codomain . f-colon-A-to-B)
       (f-colon-A-to-B . every-element-of-A-mapped)
       (every-element-of-A-mapped . to-exactly-one-element-of-B)
       (to-exactly-one-element-of-B . each-input-exactly-one-output)))

    (injection
      (different-inputs-different-outputs)
      (one-to-one)
      ((different-inputs-different-outputs . a-ne-b-implies-fa-ne-fb)
       (a-ne-b-implies-fa-ne-fb . one-to-one)))

    (surjection
      (every-output-is-hit)
      (onto)
      ((every-output-is-hit . for-every-b-exists-a-where-fa-equals-b)
       (for-every-b-exists-a-where-fa-equals-b . onto)))

    (bijection
      (injection-and-surjection)
      (one-to-one-correspondence)
      ((injection-and-surjection . invertible)
       (invertible . sets-have-same-cardinality)
       (sets-have-same-cardinality . one-to-one-correspondence)))

    (composition
      (f-then-g)
      (g-of-f)
      ((f-then-g . output-of-f-is-input-of-g)
       (output-of-f-is-input-of-g . g-composed-f-of-x-equals-g-of-f-of-x)
       (g-composed-f-of-x-equals-g-of-f-of-x . associative)
       (associative . g-of-f)))

  )

  ((foundations . mathematics-registered)))
