#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Computation — foundations of computability and complexity
;;; LAYER: 15-computation
;;; DEPENDS ON: none (foundational, mathematical)
;;; DEPENDED ON BY: programming languages, software verification,
;;;   cryptography, quantum information, artificial intelligence
;;;
;;; PURPOSE: The mathematical theory of what can be computed, how
;;; efficiently, and what cannot be computed at all.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Turing-1936] A.M. Turing, "On Computable Numbers, with an
;;;   Application to the Entscheidungsproblem,"
;;;   Proc. London Math. Soc. 2(42), 230-265, 1936.
;;; [Church-1936] A. Church, "An Unsolvable Problem of Elementary
;;;   Number Theory," American Journal of Mathematics 58(2),
;;;   345-363, 1936.
;;; [Goedel-1931] K. Gödel, "Über formal unentscheidbare Sätze der
;;;   Principia Mathematica und verwandter Systeme I,"
;;;   Monatshefte für Mathematik und Physik 38, 173-198, 1931.
;;; [Sipser-2013] M. Sipser, Introduction to the Theory of
;;;   Computation, 3rd ed., Cengage Learning, 2013.
;;; [Arora-Barak-2009] S. Arora & B. Barak, Computational
;;;   Complexity: A Modern Approach, Cambridge University Press, 2009.
;;; [Chomsky-1956] N. Chomsky, "Three Models for the Description of
;;;   Language," IRE Trans. Information Theory 2(3), 113-124, 1956.
;;; [Cook-1971] S.A. Cook, "The Complexity of Theorem-Proving
;;;   Procedures," Proc. 3rd ACM STOC, 151-158, 1971.
;;; [Curry-1934] H.B. Curry, "Functionality in Combinatory Logic,"
;;;   Proc. Natl. Acad. Sci. 20(11), 584-590, 1934.
;;; [Howard-1980] W.A. Howard, "The Formulae-as-Types Notion of
;;;   Construction," in To H.B. Curry: Essays on Combinatory Logic,
;;;   Lambda Calculus and Formalism, Academic Press, 1980.
;;; [VonNeumann-1945] J. von Neumann, "First Draft of a Report on
;;;   the EDVAC," U.S. Army Ordnance Dept., 1945.
;;; [Shor-1994] P.W. Shor, "Algorithms for Quantum Computation:
;;;   Discrete Logarithms and Factoring," Proc. 35th IEEE FOCS,
;;;   124-134, 1994.
;;; [Grover-1996] L.K. Grover, "A Fast Quantum Mechanical Algorithm
;;;   for Database Search," Proc. 28th ACM STOC, 212-219, 1996.
;;; [Shannon-1948] C.E. Shannon, "A Mathematical Theory of
;;;   Communication," Bell System Technical Journal 27, 379-423, 1948.
;;; [Sheffer-1913] H.M. Sheffer, "A Set of Five Independent
;;;   Postulates for Boolean Algebras," Trans. AMS 14(4),
;;;   481-488, 1913.
;;; [Boole-1854] G. Boole, "An Investigation of the Laws of Thought,"
;;;   Walton and Maberly, London, 1854.
;;; [Knuth-1976] D.E. Knuth, "Big Omicron and Big Omega and Big
;;;   Theta," SIGACT News 8(2), 18-24, 1976.
;;;
;;; CALIBRATION: computation.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-computation

  ;;; Sources
  ((computation-theory
    (Turing-1936 Church-1936 Goedel-1931 Sipser-2013 Arora-Barak-2009)
    (authoritative)
    ((Turing-1936 . authoritative)
     (Church-1936 . authoritative)
     (Goedel-1931 . authoritative)
     (Sipser-2013 . authoritative)
     (Arora-Barak-2009 . authoritative))))

  ;;; Entities
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TURING MACHINE
    ;;; SOURCE: [Turing-1936] Sec. 1-2; [Sipser-2013] Ch. 3
    ;;; The abstract machine that formalizes the notion of
    ;;; mechanical computation.
    ;;; ═══════════════════════════════════════════════════════════

    (turing-machine
      (finite-state-control infinite-tape read-write-head)
      (universal-model-of-computation)
      ((finite-state-control . finite-set-of-states)
       (finite-set-of-states . includes-start-state-accept-state-reject-state)
       (includes-start-state-accept-state-reject-state . deterministic-or-nondeterministic)
       (infinite-tape . divided-into-cells)
       (divided-into-cells . each-cell-holds-one-symbol-from-finite-alphabet)
       (each-cell-holds-one-symbol-from-finite-alphabet . tape-infinite-in-both-directions)
       (read-write-head . reads-current-cell)
       (reads-current-cell . transition-function-determines-next-action)
       (transition-function-determines-next-action . writes-symbol-moves-left-or-right-changes-state)
       (writes-symbol-moves-left-or-right-changes-state . halts-on-accept-or-reject)
       (halts-on-accept-or-reject . or-loops-forever)
       (or-loops-forever . universal-model-of-computation)))

    ;;; SOURCE: [Turing-1936] Sec. 6; [Sipser-2013] Thm. 4.11
    (universal-turing-machine
      (turing-machine-U)
      (simulates-any-turing-machine-M-on-input-w)
      ((turing-machine-U . takes-encoding-of-M-and-w-as-input)
       (takes-encoding-of-M-and-w-as-input . simulates-M-step-by-step)
       (simulates-M-step-by-step . accepts-iff-M-accepts-w)
       (accepts-iff-M-accepts-w . single-machine-is-programmable)
       (single-machine-is-programmable . simulates-any-turing-machine-M-on-input-w)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHURCH-TURING THESIS
    ;;; SOURCE: [Turing-1936]; [Church-1936]; [Sipser-2013] Ch. 3.3
    ;;; Not a theorem — a thesis. No known counterexample.
    ;;; ═══════════════════════════════════════════════════════════

    (church-turing-thesis
      (informal-notion-of-algorithm)
      (captured-exactly-by-turing-machines)
      ((informal-notion-of-algorithm . any-effective-procedure)
       (any-effective-procedure . finite-description-mechanical-steps)
       (finite-description-mechanical-steps . equivalent-formalizations-all-converge)
       (equivalent-formalizations-all-converge . turing-machines-lambda-calculus-recursive-functions)
       (turing-machines-lambda-calculus-recursive-functions . all-define-same-class-of-computable-functions)
       (all-define-same-class-of-computable-functions . thesis-not-theorem)
       (thesis-not-theorem . cannot-be-proved-because-algorithm-is-informal)
       (cannot-be-proved-because-algorithm-is-informal . no-known-counterexample)
       (no-known-counterexample . captured-exactly-by-turing-machines)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LAMBDA CALCULUS
    ;;; SOURCE: [Church-1936]; [Sipser-2013] Ch. 3.3
    ;;; ═══════════════════════════════════════════════════════════

    (lambda-calculus
      (Church-1936)
      (formal-system-of-function-abstraction-and-application)
      ((Church-1936 . introduced-lambda-notation)
       (introduced-lambda-notation . variables-abstraction-application)
       (variables-abstraction-application . abstraction-binds-variable-in-body)
       (abstraction-binds-variable-in-body . application-substitutes-argument-for-bound-variable)
       (application-substitutes-argument-for-bound-variable . beta-reduction-is-computation)
       (beta-reduction-is-computation . alpha-conversion-renames-bound-variables)
       (alpha-conversion-renames-bound-variables . Turing-complete)
       (Turing-complete . equivalent-to-turing-machines)
       (equivalent-to-turing-machines . formal-system-of-function-abstraction-and-application)))

    ;;; SOURCE: [Church-1936]; [Sipser-2013] Ch. 6
    (church-numerals
      (lambda-calculus-encoding-of-natural-numbers)
      (zero-is-lambda-f-lambda-x-dot-x)
      ((lambda-calculus-encoding-of-natural-numbers . zero-applies-f-zero-times)
       (zero-applies-f-zero-times . successor-adds-one-application-of-f)
       (successor-adds-one-application-of-f . n-applies-f-n-times)
       (n-applies-f-n-times . arithmetic-expressible-as-lambda-terms)
       (arithmetic-expressible-as-lambda-terms . zero-is-lambda-f-lambda-x-dot-x)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HALTING PROBLEM
    ;;; SOURCE: [Turing-1936] Sec. 8; [Sipser-2013] Thm. 4.11
    ;;; ═══════════════════════════════════════════════════════════

    (halting-problem
      (given-turing-machine-M-and-input-w)
      (undecidable)
      ((given-turing-machine-M-and-input-w . does-M-halt-on-w)
       (does-M-halt-on-w . no-turing-machine-can-decide-for-all-M-and-w)
       (no-turing-machine-can-decide-for-all-M-and-w . proved-by-diagonalization)
       (proved-by-diagonalization . assume-decider-H-exists)
       (assume-decider-H-exists . construct-D-that-does-opposite-of-H-on-self)
       (construct-D-that-does-opposite-of-H-on-self . D-on-D-yields-contradiction)
       (D-on-D-yields-contradiction . therefore-no-such-H-exists)
       (therefore-no-such-H-exists . undecidable)))

    ;;; SOURCE: [Turing-1936]; [Sipser-2013] Thm. 5.1 (Rice)
    (rices-theorem
      (any-nontrivial-semantic-property-of-programs)
      (undecidable)
      ((any-nontrivial-semantic-property-of-programs . property-of-the-language-recognized)
       (property-of-the-language-recognized . nontrivial-means-some-TMs-have-it-some-dont)
       (nontrivial-means-some-TMs-have-it-some-dont . no-algorithm-can-decide-it)
       (no-algorithm-can-decide-it . proved-by-reduction-from-halting-problem)
       (proved-by-reduction-from-halting-problem . undecidable)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BOOLEAN ALGEBRA
    ;;; SOURCE: [Boole-1854]; [Sipser-2013] Ch. 7.4
    ;;; ═══════════════════════════════════════════════════════════

    (boolean-algebra
      (Boole-1854)
      (algebraic-structure-over-truth-values)
      ((Boole-1854 . formalized-logic-as-algebra)
       (formalized-logic-as-algebra . two-values-true-and-false)
       (two-values-true-and-false . three-basic-operations-AND-OR-NOT)
       (three-basic-operations-AND-OR-NOT . AND-true-iff-both-inputs-true)
       (AND-true-iff-both-inputs-true . OR-true-iff-at-least-one-input-true)
       (OR-true-iff-at-least-one-input-true . NOT-inverts-truth-value)
       (NOT-inverts-truth-value . all-boolean-functions-expressible-from-AND-OR-NOT)
       (all-boolean-functions-expressible-from-AND-OR-NOT . De-Morgan-laws-relate-AND-OR-NOT)
       (De-Morgan-laws-relate-AND-OR-NOT . algebraic-structure-over-truth-values)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NAND UNIVERSALITY
    ;;; SOURCE: [Sheffer-1913]; [Sipser-2013] Ch. 9
    ;;; ═══════════════════════════════════════════════════════════

    (nand-universality
      (NAND-gate)
      (functionally-complete)
      ((NAND-gate . output-false-only-when-both-inputs-true)
       (output-false-only-when-both-inputs-true . Sheffer-stroke)
       (Sheffer-stroke . Sheffer-1913-proved-single-connective-suffices)
       (Sheffer-1913-proved-single-connective-suffices . NOT-from-NAND-x-x)
       (NOT-from-NAND-x-x . AND-from-NOT-NAND)
       (AND-from-NOT-NAND . OR-from-NAND-of-NOTs)
       (OR-from-NAND-of-NOTs . any-boolean-function-from-NAND-alone)
       (any-boolean-function-from-NAND-alone . functionally-complete)))

    ;;; NOR also universal
    ;;; SOURCE: [Sheffer-1913]; dual of NAND
    (nor-universality
      (NOR-gate)
      (also-functionally-complete)
      ((NOR-gate . output-true-only-when-both-inputs-false)
       (output-true-only-when-both-inputs-false . Peirce-arrow)
       (Peirce-arrow . dual-of-NAND)
       (dual-of-NAND . NOT-from-NOR-x-x)
       (NOT-from-NOR-x-x . OR-from-NOT-NOR)
       (OR-from-NOT-NOR . AND-from-NOR-of-NOTs)
       (AND-from-NOR-of-NOTs . any-boolean-function-from-NOR-alone)
       (any-boolean-function-from-NOR-alone . also-functionally-complete)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COMPUTATIONAL COMPLEXITY
    ;;; SOURCE: [Cook-1971]; [Sipser-2013] Ch. 7; [Arora-Barak-2009]
    ;;; ═══════════════════════════════════════════════════════════

    (complexity-class-P
      (decision-problems)
      (solvable-in-polynomial-time)
      ((decision-problems . yes-or-no-answer)
       (yes-or-no-answer . deterministic-turing-machine)
       (deterministic-turing-machine . runs-in-time-O-n-to-the-k-for-some-constant-k)
       (runs-in-time-O-n-to-the-k-for-some-constant-k . P-equals-union-of-TIME-n-to-k)
       (P-equals-union-of-TIME-n-to-k . considered-efficiently-solvable)
       (considered-efficiently-solvable . solvable-in-polynomial-time)))

    (complexity-class-NP
      (decision-problems)
      (verifiable-in-polynomial-time)
      ((decision-problems . yes-or-no-answer)
       (yes-or-no-answer . given-certificate-of-polynomial-length)
       (given-certificate-of-polynomial-length . deterministic-verifier-checks-in-poly-time)
       (deterministic-verifier-checks-in-poly-time . equivalently-solvable-by-nondeterministic-TM-in-poly-time)
       (equivalently-solvable-by-nondeterministic-TM-in-poly-time . NP-contains-P)
       (NP-contains-P . verifiable-in-polynomial-time)))

    ;;; SOURCE: [Cook-1971]; [Sipser-2013] Thm. 7.27
    (np-completeness
      (decision-problem-L)
      (hardest-problems-in-NP)
      ((decision-problem-L . L-is-in-NP)
       (L-is-in-NP . every-problem-in-NP-poly-time-reduces-to-L)
       (every-problem-in-NP-poly-time-reduces-to-L . Cook-1971-proved-SAT-is-NP-complete)
       (Cook-1971-proved-SAT-is-NP-complete . independently-Levin-1973)
       (independently-Levin-1973 . Cook-Levin-theorem)
       (Cook-Levin-theorem . if-any-NP-complete-in-P-then-P-equals-NP)
       (if-any-NP-complete-in-P-then-P-equals-NP . hardest-problems-in-NP)))

    ;;; SOURCE: [Sipser-2013] Ch. 7.4; [Arora-Barak-2009] Ch. 2
    (np-hard
      (problem-H)
      (at-least-as-hard-as-NP-complete)
      ((problem-H . every-problem-in-NP-poly-time-reduces-to-H)
       (every-problem-in-NP-poly-time-reduces-to-H . H-need-not-be-in-NP)
       (H-need-not-be-in-NP . may-be-decision-or-optimization-or-search)
       (may-be-decision-or-optimization-or-search . NP-complete-is-intersection-of-NP-and-NP-hard)
       (NP-complete-is-intersection-of-NP-and-NP-hard . at-least-as-hard-as-NP-complete)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; P VS NP
    ;;; SOURCE: [Cook-1971]; Clay Mathematics Institute, 2000
    ;;; ═══════════════════════════════════════════════════════════

    (P-vs-NP
      (open-problem)
      (unresolved-Clay-Millennium-Prize)
      ((open-problem . is-P-equal-to-NP)
       (is-P-equal-to-NP . can-every-efficiently-verifiable-problem-be-efficiently-solved)
       (can-every-efficiently-verifiable-problem-be-efficiently-solved . most-experts-conjecture-P-ne-NP)
       (most-experts-conjecture-P-ne-NP . no-proof-in-either-direction)
       (no-proof-in-either-direction . Clay-Mathematics-Institute-Millennium-Prize-2000)
       (Clay-Mathematics-Institute-Millennium-Prize-2000 . one-million-USD-prize)
       (one-million-USD-prize . resolution-would-transform-cryptography-optimization-AI)
       (resolution-would-transform-cryptography-optimization-AI . unresolved-Clay-Millennium-Prize)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIG-O NOTATION
    ;;; SOURCE: [Knuth-1976]; [Sipser-2013] Ch. 7.1
    ;;; ═══════════════════════════════════════════════════════════

    (big-O-notation
      (function-f-of-n)
      (asymptotic-upper-bound)
      ((function-f-of-n . f-is-O-of-g-means)
       (f-is-O-of-g-means . exists-constants-c-and-n0)
       (exists-constants-c-and-n0 . for-all-n-ge-n0-f-le-c-times-g)
       (for-all-n-ge-n0-f-le-c-times-g . describes-worst-case-growth-rate)
       (describes-worst-case-growth-rate . ignores-constant-factors-and-lower-order-terms)
       (ignores-constant-factors-and-lower-order-terms . asymptotic-upper-bound)))

    ;;; SOURCE: [Knuth-1976]
    (big-Omega-and-big-Theta
      (related-asymptotic-notations)
      (lower-bound-and-tight-bound)
      ((related-asymptotic-notations . big-Omega-is-asymptotic-lower-bound)
       (big-Omega-is-asymptotic-lower-bound . f-is-Omega-g-means-f-ge-c-times-g-for-large-n)
       (f-is-Omega-g-means-f-ge-c-times-g-for-large-n . big-Theta-is-tight-bound)
       (big-Theta-is-tight-bound . f-is-Theta-g-means-f-is-both-O-g-and-Omega-g)
       (f-is-Theta-g-means-f-is-both-O-g-and-Omega-g . lower-bound-and-tight-bound)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FORMAL LANGUAGES AND THE CHOMSKY HIERARCHY
    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 1-5
    ;;; ═══════════════════════════════════════════════════════════

    (formal-language
      (set-of-strings-over-finite-alphabet)
      (classified-by-generative-grammar)
      ((set-of-strings-over-finite-alphabet . alphabet-is-finite-set-of-symbols)
       (alphabet-is-finite-set-of-symbols . string-is-finite-sequence-of-symbols)
       (string-is-finite-sequence-of-symbols . language-is-set-of-strings)
       (language-is-set-of-strings . grammar-generates-language-via-production-rules)
       (grammar-generates-language-via-production-rules . classified-by-generative-grammar)))

    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 1
    (type-3-regular
      (Chomsky-Type-3)
      (recognized-by-finite-automata)
      ((Chomsky-Type-3 . most-restrictive-grammar)
       (most-restrictive-grammar . productions-A-to-aB-or-A-to-a)
       (productions-A-to-aB-or-A-to-a . equivalent-to-regular-expressions)
       (equivalent-to-regular-expressions . recognized-by-DFA-or-NFA)
       (recognized-by-DFA-or-NFA . closed-under-union-concatenation-star)
       (closed-under-union-concatenation-star . pumping-lemma-proves-non-regularity)
       (pumping-lemma-proves-non-regularity . recognized-by-finite-automata)))

    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 2
    (type-2-context-free
      (Chomsky-Type-2)
      (recognized-by-pushdown-automata)
      ((Chomsky-Type-2 . productions-A-to-any-string-of-terminals-and-nonterminals)
       (productions-A-to-any-string-of-terminals-and-nonterminals . strictly-contains-regular-languages)
       (strictly-contains-regular-languages . example-balanced-parentheses)
       (example-balanced-parentheses . Dyck-language-is-context-free)
       (Dyck-language-is-context-free . parsed-by-pushdown-automaton-with-one-stack)
       (parsed-by-pushdown-automaton-with-one-stack . CFL-pumping-lemma-for-non-membership)
       (CFL-pumping-lemma-for-non-membership . Chomsky-normal-form-any-CFG)
       (Chomsky-normal-form-any-CFG . CYK-algorithm-parses-in-O-n-cubed)
       (CYK-algorithm-parses-in-O-n-cubed . recognized-by-pushdown-automata)))

    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 5
    (type-1-context-sensitive
      (Chomsky-Type-1)
      (recognized-by-linear-bounded-automata)
      ((Chomsky-Type-1 . productions-alpha-A-beta-to-alpha-gamma-beta)
       (productions-alpha-A-beta-to-alpha-gamma-beta . nonterminal-replaced-in-context)
       (nonterminal-replaced-in-context . strictly-contains-context-free-languages)
       (strictly-contains-context-free-languages . example-a-n-b-n-c-n)
       (example-a-n-b-n-c-n . recognized-by-nondeterministic-TM-with-tape-bounded-by-input-length)
       (recognized-by-nondeterministic-TM-with-tape-bounded-by-input-length . recognized-by-linear-bounded-automata)))

    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 3-4
    (type-0-recursively-enumerable
      (Chomsky-Type-0)
      (recognized-by-turing-machines)
      ((Chomsky-Type-0 . unrestricted-grammars)
       (unrestricted-grammars . any-production-alpha-to-beta)
       (any-production-alpha-to-beta . generates-recursively-enumerable-languages)
       (generates-recursively-enumerable-languages . TM-may-accept-or-loop-forever)
       (TM-may-accept-or-loop-forever . strictly-contains-context-sensitive)
       (strictly-contains-context-sensitive . recognized-by-turing-machines)))

    ;;; SOURCE: [Sipser-2013] Ch. 4
    (decidable-languages
      (subset-of-recursively-enumerable)
      (turing-machine-halts-on-all-inputs)
      ((subset-of-recursively-enumerable . also-called-recursive-or-computable)
       (also-called-recursive-or-computable . TM-always-halts-accepts-or-rejects)
       (TM-always-halts-accepts-or-rejects . complement-is-also-decidable)
       (complement-is-also-decidable . closed-under-complement-union-intersection)
       (closed-under-complement-union-intersection . turing-machine-halts-on-all-inputs)))

    ;;; Hierarchy containment
    ;;; SOURCE: [Chomsky-1956]; [Sipser-2013] Ch. 1-5
    (chomsky-hierarchy
      (four-levels-of-formal-languages)
      (strict-containment-chain)
      ((four-levels-of-formal-languages . Type-3-regular-subset-Type-2-context-free)
       (Type-3-regular-subset-Type-2-context-free . Type-2-context-free-subset-Type-1-context-sensitive)
       (Type-2-context-free-subset-Type-1-context-sensitive . Type-1-context-sensitive-subset-Type-0-recursively-enumerable)
       (Type-1-context-sensitive-subset-Type-0-recursively-enumerable . each-inclusion-is-strict)
       (each-inclusion-is-strict . each-level-has-languages-not-in-level-below)
       (each-level-has-languages-not-in-level-below . automata-hierarchy-parallels-grammar-hierarchy)
       (automata-hierarchy-parallels-grammar-hierarchy . strict-containment-chain)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GOEDEL'S INCOMPLETENESS THEOREMS
    ;;; SOURCE: [Goedel-1931]; [Sipser-2013] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (goedel-first-incompleteness
      (Goedel-1931)
      (any-consistent-sufficiently-strong-system-has-unprovable-true-statements)
      ((Goedel-1931 . formal-system-containing-arithmetic)
       (formal-system-containing-arithmetic . sufficiently-strong-means-represents-all-computable-functions)
       (sufficiently-strong-means-represents-all-computable-functions . if-consistent-then-incomplete)
       (if-consistent-then-incomplete . there-exist-true-statements-not-provable-within-the-system)
       (there-exist-true-statements-not-provable-within-the-system . proved-via-Goedel-numbering)
       (proved-via-Goedel-numbering . self-referential-sentence-G-says-G-is-not-provable)
       (self-referential-sentence-G-says-G-is-not-provable . if-G-provable-then-inconsistent)
       (if-G-provable-then-inconsistent . if-consistent-then-G-is-true-but-unprovable)
       (if-consistent-then-G-is-true-but-unprovable . any-consistent-sufficiently-strong-system-has-unprovable-true-statements)))

    (goedel-second-incompleteness
      (Goedel-1931)
      (consistent-system-cannot-prove-its-own-consistency)
      ((Goedel-1931 . extends-first-theorem)
       (extends-first-theorem . consistency-statement-Con-T)
       (consistency-statement-Con-T . expressible-in-arithmetic-via-Goedel-numbering)
       (expressible-in-arithmetic-via-Goedel-numbering . if-T-is-consistent)
       (if-T-is-consistent . T-cannot-prove-Con-T)
       (T-cannot-prove-Con-T . consistency-proof-requires-stronger-system)
       (consistency-proof-requires-stronger-system . consistent-system-cannot-prove-its-own-consistency)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CURRY-HOWARD CORRESPONDENCE
    ;;; SOURCE: [Curry-1934]; [Howard-1980]
    ;;; ═══════════════════════════════════════════════════════════

    (curry-howard-correspondence
      (Curry-1934 Howard-1980)
      (proofs-are-programs-types-are-propositions)
      ((Curry-1934 . noted-analogy-between-combinatory-logic-and-Hilbert-deduction)
       (noted-analogy-between-combinatory-logic-and-Hilbert-deduction . Howard-1980-made-correspondence-precise)
       (Howard-1980-made-correspondence-precise . propositions-correspond-to-types)
       (propositions-correspond-to-types . proofs-correspond-to-programs)
       (proofs-correspond-to-programs . proof-simplification-corresponds-to-program-evaluation)
       (proof-simplification-corresponds-to-program-evaluation . implication-corresponds-to-function-type)
       (implication-corresponds-to-function-type . conjunction-corresponds-to-product-type)
       (conjunction-corresponds-to-product-type . disjunction-corresponds-to-sum-type)
       (disjunction-corresponds-to-sum-type . modus-ponens-corresponds-to-function-application)
       (modus-ponens-corresponds-to-function-application . proofs-are-programs-types-are-propositions)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; VON NEUMANN ARCHITECTURE
    ;;; SOURCE: [VonNeumann-1945]
    ;;; ═══════════════════════════════════════════════════════════

    (von-neumann-architecture
      (VonNeumann-1945)
      (stored-program-computer)
      ((VonNeumann-1945 . first-draft-report-on-EDVAC)
       (first-draft-report-on-EDVAC . single-memory-for-instructions-and-data)
       (single-memory-for-instructions-and-data . program-is-data-in-memory)
       (program-is-data-in-memory . CPU-contains-ALU-and-control-unit)
       (CPU-contains-ALU-and-control-unit . fetch-decode-execute-cycle)
       (fetch-decode-execute-cycle . fetch-instruction-from-memory)
       (fetch-instruction-from-memory . decode-instruction)
       (decode-instruction . execute-instruction)
       (execute-instruction . program-counter-advances-to-next)
       (program-counter-advances-to-next . stored-program-computer)))

    ;;; SOURCE: [VonNeumann-1945]; standard computer architecture
    (von-neumann-bottleneck
      (shared-bus-between-CPU-and-memory)
      (throughput-limited-by-bus-bandwidth)
      ((shared-bus-between-CPU-and-memory . instructions-and-data-share-same-path)
       (instructions-and-data-share-same-path . cannot-fetch-instruction-and-data-simultaneously)
       (cannot-fetch-instruction-and-data-simultaneously . CPU-often-idle-waiting-for-memory)
       (CPU-often-idle-waiting-for-memory . throughput-limited-by-bus-bandwidth)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM COMPUTATION
    ;;; SOURCE: [Shor-1994]; [Grover-1996]; [Sipser-2013] Ch. 10
    ;;; ═══════════════════════════════════════════════════════════

    (qubit
      (quantum-bit)
      (superposition-of-zero-and-one)
      ((quantum-bit . two-level-quantum-system)
       (two-level-quantum-system . state-is-alpha-ket-0-plus-beta-ket-1)
       (state-is-alpha-ket-0-plus-beta-ket-1 . alpha-and-beta-are-complex-amplitudes)
       (alpha-and-beta-are-complex-amplitudes . abs-alpha-squared-plus-abs-beta-squared-equals-1)
       (abs-alpha-squared-plus-abs-beta-squared-equals-1 . measurement-collapses-to-0-or-1)
       (measurement-collapses-to-0-or-1 . probability-of-0-is-abs-alpha-squared)
       (probability-of-0-is-abs-alpha-squared . superposition-of-zero-and-one)))

    (quantum-entanglement
      (two-or-more-qubits)
      (joint-state-not-separable-into-individual-states)
      ((two-or-more-qubits . can-be-in-entangled-state)
       (can-be-in-entangled-state . Bell-state-example)
       (Bell-state-example . measuring-one-qubit-instantly-determines-other)
       (measuring-one-qubit-instantly-determines-other . correlations-stronger-than-classical)
       (correlations-stronger-than-classical . no-faster-than-light-communication)
       (no-faster-than-light-communication . joint-state-not-separable-into-individual-states)))

    (quantum-gates
      (unitary-operations-on-qubits)
      (reversible-transformations)
      ((unitary-operations-on-qubits . represented-by-unitary-matrices)
       (represented-by-unitary-matrices . single-qubit-gates-Hadamard-Pauli-phase)
       (single-qubit-gates-Hadamard-Pauli-phase . two-qubit-gates-CNOT-CZ)
       (two-qubit-gates-CNOT-CZ . universal-gate-sets-exist)
       (universal-gate-sets-exist . CNOT-plus-single-qubit-rotations-is-universal)
       (CNOT-plus-single-qubit-rotations-is-universal . all-quantum-gates-are-reversible)
       (all-quantum-gates-are-reversible . reversible-transformations)))

    ;;; SOURCE: [Shor-1994]
    (shor-algorithm
      (Shor-1994)
      (factors-integers-in-polynomial-time-on-quantum-computer)
      ((Shor-1994 . quantum-algorithm-for-integer-factoring)
       (quantum-algorithm-for-integer-factoring . reduces-factoring-to-period-finding)
       (reduces-factoring-to-period-finding . quantum-Fourier-transform-finds-period)
       (quantum-Fourier-transform-finds-period . runs-in-O-n-cubed-on-n-bit-number)
       (runs-in-O-n-cubed-on-n-bit-number . best-known-classical-is-sub-exponential)
       (best-known-classical-is-sub-exponential . breaks-RSA-if-large-quantum-computer-built)
       (breaks-RSA-if-large-quantum-computer-built . factors-integers-in-polynomial-time-on-quantum-computer)))

    ;;; SOURCE: [Grover-1996]
    (grover-algorithm
      (Grover-1996)
      (searches-unsorted-database-in-O-sqrt-N)
      ((Grover-1996 . quantum-search-algorithm)
       (quantum-search-algorithm . unstructured-search-of-N-items)
       (unstructured-search-of-N-items . classical-requires-O-N-queries)
       (classical-requires-O-N-queries . Grover-achieves-O-sqrt-N-queries)
       (Grover-achieves-O-sqrt-N-queries . uses-amplitude-amplification)
       (uses-amplitude-amplification . provably-optimal-BBBV-1997)
       (provably-optimal-BBBV-1997 . quadratic-speedup-not-exponential)
       (quadratic-speedup-not-exponential . searches-unsorted-database-in-O-sqrt-N)))

    ;;; SOURCE: [Sipser-2013] Ch. 10; [Arora-Barak-2009] Ch. 21
    (complexity-class-BQP
      (decision-problems)
      (solvable-in-polynomial-time-on-quantum-computer-with-bounded-error)
      ((decision-problems . quantum-TM-runs-in-poly-time)
       (quantum-TM-runs-in-poly-time . answers-correct-with-probability-ge-2/3)
       (answers-correct-with-probability-ge-2/3 . BQP-contains-P)
       (BQP-contains-P . BQP-contained-in-PSPACE)
       (BQP-contained-in-PSPACE . factoring-in-BQP-via-Shor)
       (factoring-in-BQP-via-Shor . whether-BQP-contains-NP-complete-is-open)
       (whether-BQP-contains-NP-complete-is-open . solvable-in-polynomial-time-on-quantum-computer-with-bounded-error)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INFORMATION-THEORETIC LOWER BOUNDS
    ;;; SOURCE: [Shannon-1948]; [Sipser-2013] Ch. 7;
    ;;; [Arora-Barak-2009] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (comparison-sorting-lower-bound
      (comparison-based-sorting)
      (Omega-n-log-n-comparisons)
      ((comparison-based-sorting . only-pairwise-comparisons-allowed)
       (only-pairwise-comparisons-allowed . decision-tree-model)
       (decision-tree-model . n-factorial-possible-permutations)
       (n-factorial-possible-permutations . binary-tree-needs-log-n-factorial-depth)
       (binary-tree-needs-log-n-factorial-depth . Stirling-gives-Omega-n-log-n)
       (Stirling-gives-Omega-n-log-n . merge-sort-and-heapsort-match-bound)
       (merge-sort-and-heapsort-match-bound . Omega-n-log-n-comparisons)))

    (information-entropy
      (Shannon-1948)
      (minimum-bits-to-encode-source)
      ((Shannon-1948 . entropy-H-equals-negative-sum-p-log-p)
       (entropy-H-equals-negative-sum-p-log-p . measures-average-information-per-symbol)
       (measures-average-information-per-symbol . maximum-when-all-symbols-equally-likely)
       (maximum-when-all-symbols-equally-likely . zero-when-outcome-is-certain)
       (zero-when-outcome-is-certain . no-lossless-encoding-below-entropy-rate)
       (no-lossless-encoding-below-entropy-rate . Shannon-source-coding-theorem)
       (Shannon-source-coding-theorem . minimum-bits-to-encode-source)))

    (shannon-channel-capacity
      (Shannon-1948)
      (maximum-reliable-communication-rate)
      ((Shannon-1948 . noisy-channel-coding-theorem)
       (noisy-channel-coding-theorem . channel-has-capacity-C-bits-per-use)
       (channel-has-capacity-C-bits-per-use . rates-below-C-achievable-with-arbitrarily-low-error)
       (rates-below-C-achievable-with-arbitrarily-low-error . rates-above-C-have-unavoidable-errors)
       (rates-above-C-have-unavoidable-errors . C-equals-max-mutual-information-over-input-distributions)
       (C-equals-max-mutual-information-over-input-distributions . maximum-reliable-communication-rate)))

  )

  ;;; Vacuum tube
  ((computation-theory . computation-registered)))
