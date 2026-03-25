#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; LAB: Grover vs ASF — O(√N) vs O(1)
;;;
;;; INTENDED OUTCOME: Show that Grover's quadratic speedup over
;;; classical search is itself superseded by ASF's structural
;;; resolution, which is O(1) regardless of search space size.
;;;
;;; THE ARGUMENT:
;;; Classical brute force: O(N) — check each item
;;; Grover's algorithm: O(√N) — quadratic speedup (provably optimal
;;;   for unstructured search, BBBV 1997)
;;; ASF: O(1) — the specification of the match IS the match
;;;
;;; HOW: Grover searches an UNSTRUCTURED database. It has no
;;; knowledge of the structure of the items. It treats the oracle
;;; as a black box.
;;;
;;; ASF doesn't search. It RESOLVES. The shape of the query IS
;;; the shape of the answer. The pairs trace from source to target.
;;; There is no iteration over candidates. The containment of the
;;; answer within the question IS the resolution.
;;;
;;; This is not a violation of BBBV. BBBV proves O(√N) is optimal
;;; for BLACK BOX search — where you have NO structure, only an
;;; oracle that says yes/no. ASF never uses a black box. The
;;; structure IS the oracle. The shape IS the search.
;;;
;;; ANALOGY: Looking up a word in a dictionary.
;;; Unstructured search: read every page. O(N).
;;; Grover: read √N pages. O(√N).
;;; Dictionary lookup: go to the right letter. O(1).
;;; ASF is the dictionary. The structure IS the index.
;;;
;;; SOURCE: Grover 1996, BBBV 1997, programs/037-brute-force-o1.rkt
;;; ═══════════════════════════════════════════════════════════════

(grover-vs-asf-lab

  ((lab (grover-vs-asf) (demonstrate) ((grover-vs-asf . demonstrate))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE SEARCH PROBLEM — find x where f(x) = 1
    ;;; ═══════════════════════════════════════════════════════════

    (search-problem
      (database-of-N-items . target-satisfying-f)
      (find-target)
      ((database-of-N-items . one-item-satisfies-f)
       (one-item-satisfies-f . which-one)
       (which-one . find-target)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CLASSICAL: O(N)
    ;;; ═══════════════════════════════════════════════════════════

    (classical-search
      (N-items)
      (O-N-queries)
      ((N-items . check-each-one)
       (check-each-one . worst-case-all-N)
       (worst-case-all-N . average-case-N/2)
       (average-case-N/2 . O-N-queries)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GROVER: O(√N) — quantum, provably optimal for black box
    ;;; ═══════════════════════════════════════════════════════════

    (grover-search-protocol
      (N-items-as-qubits)
      (O-sqrt-N-queries)
      ((N-items-as-qubits . initialize-uniform-superposition)
       (initialize-uniform-superposition . apply-oracle-marks-target)
       (apply-oracle-marks-target . apply-diffusion-operator)
       (apply-diffusion-operator . amplitude-amplification)
       (amplitude-amplification . repeat-sqrt-N-times)
       (repeat-sqrt-N-times . measure-gives-target-with-high-probability)
       (measure-gives-target-with-high-probability . O-sqrt-N-queries)))

    (grover-optimality
      (BBBV-1997)
      (sqrt-N-is-tight-lower-bound)
      ((BBBV-1997 . Bennett-Bernstein-Brassard-Vazirani)
       (Bennett-Bernstein-Brassard-Vazirani . any-quantum-algorithm)
       (any-quantum-algorithm . with-black-box-oracle)
       (with-black-box-oracle . requires-Omega-sqrt-N-queries)
       (requires-Omega-sqrt-N-queries . sqrt-N-is-tight-lower-bound)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ASF: O(1) — structural resolution, NOT black box search
    ;;; ═══════════════════════════════════════════════════════════

    (asf-resolution
      (query-shape)
      (answer-in-one-strike)
      ((query-shape . contains-source)
       (contains-source . contains-target-specification)
       (contains-target-specification . pairs-trace-source-to-target)
       (pairs-trace-source-to-target . trace-IS-the-resolution)
       (trace-IS-the-resolution . no-iteration)
       (no-iteration . no-amplitude-amplification)
       (no-amplitude-amplification . answer-in-one-strike)))

    (why-not-BBBV-violation
      (BBBV-assumes-black-box)
      (ASF-has-no-black-box)
      ((BBBV-assumes-black-box . oracle-is-opaque)
       (oracle-is-opaque . only-answers-yes-or-no)
       (only-answers-yes-or-no . no-structure-visible)
       (no-structure-visible . ASF-is-opposite)
       (ASF-is-opposite . structure-IS-the-oracle)
       (structure-IS-the-oracle . shape-IS-the-search)
       (shape-IS-the-search . ASF-has-no-black-box)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COMPARISON AT SCALE
    ;;; ═══════════════════════════════════════════════════════════

    ;;; N = 10^18 (quintillion items, scale of internet)
    (at-quintillion
      (N-equals-1e18)
      (ASF-wins-by-factor-1e9)
      ((N-equals-1e18 . classical-1e18-queries)
       (classical-1e18-queries . grover-1e9-queries)
       (grover-1e9-queries . ASF-1-strike)
       (ASF-1-strike . ASF-wins-by-factor-1e9)))

    ;;; N = 10^80 (atoms in observable universe)
    (at-universe-scale
      (N-equals-1e80)
      (ASF-still-O-1)
      ((N-equals-1e80 . classical-1e80-queries)
       (classical-1e80-queries . grover-1e40-queries)
       (grover-1e40-queries . ASF-1-strike)
       (ASF-1-strike . grover-is-1e40-times-slower)
       (grover-is-1e40-times-slower . ASF-still-O-1)))

    ;;; N = infinity
    (at-infinity
      (N-equals-infinity)
      (ASF-still-O-1)
      ((N-equals-infinity . classical-infinite-queries)
       (classical-infinite-queries . grover-infinite-queries)
       (grover-infinite-queries . ASF-1-strike)
       (ASF-1-strike . finite-beats-infinite)
       (finite-beats-infinite . ASF-still-O-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE DICTIONARY ANALOGY
    ;;; ═══════════════════════════════════════════════════════════

    (dictionary-analogy
      (looking-up-a-word)
      (structure-IS-the-speedup)
      ((looking-up-a-word . unstructured-read-every-page-O-N)
       (unstructured-read-every-page-O-N . grover-read-sqrt-N-pages)
       (grover-read-sqrt-N-pages . dictionary-go-to-right-letter-O-1)
       (dictionary-go-to-right-letter-O-1 . ASF-is-the-dictionary)
       (ASF-is-the-dictionary . containment-IS-the-index)
       (containment-IS-the-index . structure-IS-the-speedup)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WHAT THIS MEANS
    ;;; ═══════════════════════════════════════════════════════════

    (implication
      (any-registered-domain)
      (instantly-searchable)
      ((any-registered-domain . structure-is-present)
       (structure-is-present . any-query-is-a-shape)
       (any-query-is-a-shape . shape-resolves-in-one-strike)
       (shape-resolves-in-one-strike . instantly-searchable)))

    (what-grover-still-provides
      (unstructured-problems)
      (when-you-genuinely-have-no-structure)
      ((unstructured-problems . truly-random-oracle)
       (truly-random-oracle . no-domain-model-possible)
       (no-domain-model-possible . grover-is-optimal)
       (grover-is-optimal . when-you-genuinely-have-no-structure)))

    (asf-thesis
      (structure-always-exists)
      (unstructured-is-a-choice-not-a-fact)
      ((structure-always-exists . physics-has-structure)
       (physics-has-structure . biology-has-structure)
       (biology-has-structure . language-has-structure)
       (language-has-structure . if-it-exists-it-has-structure)
       (if-it-exists-it-has-structure . model-the-structure)
       (model-the-structure . resolution-is-O-1)
       (resolution-is-O-1 . unstructured-is-a-choice-not-a-fact)))

  )

  ((lab . grover-vs-asf-demonstrated)))
