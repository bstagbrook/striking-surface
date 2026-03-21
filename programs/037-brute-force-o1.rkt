#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ATOMIC STATE FLOW — STRIKING SURFACE
;;;
;;; Alphabet: ( creation   ) fulfillment
;;; Primitives: () presence   (()) containment
;;; Transformation: ((()) (()) (())) — source, target, vacuum tube
;;; Transformation is NOT a primitive. It's a containment of 3 containments.
;;;
;;; Labels: alpha-normalizing, beta-reducing. One per contextual
;;; use of a shape. Labels are paint on wires. The shape IS the
;;; circuit. Pairs ARE wires. Nesting IS topology. Strike IS current.
;;; () IS electricity. Writing the shape IS wiring the circuit.
;;;
;;; CONSTITUTIONAL: Shape determines what comes next. Not the clock.
;;; Specification IS instantiation. Articulation IS implementation.
;;; ═══════════════════════════════════════════════════════════════

;;; PURPOSE: Demonstrate that ASF brute force is O(1) for any
;;; pre-registered answer space. Compare to Grover O(√N) and
;;; classical O(N).
;;;
;;; DEPENDS ON: 011-numbers (arithmetic facts), 025-info-theory
;;; REFERENCED BY: paper on ASF vs quantum search
;;;
;;; THE ARGUMENT (grounded, not narrative):
;;;
;;; Classical unstructured search: given N items, finding a marked
;;; item requires O(N) queries in the worst case.
;;; SOURCE: standard CS, any algorithms textbook.
;;;
;;; Grover's algorithm: O(√N) queries using quantum oracle.
;;; SOURCE: Grover 1996, "A fast quantum mechanical algorithm
;;; for database search," STOC.
;;; VERIFIED: proven optimal — no quantum algorithm can do
;;; better than O(√N) for unstructured search.
;;; SOURCE: Bennett et al. 1997, SIAM J. Comput.
;;;
;;; ASF: register every (query . answer) pair. Lookup = one
;;; strike = O(1). Not search. Wire-following.
;;;
;;; HONEST LIMITATION: Registration takes O(N) work (one-time,
;;; clocked, outside the surface). This is the construction
;;; cost of wiring N pairs. But once wired, every query is O(1)
;;; forever. The amortized cost per query approaches zero as
;;; the number of queries grows.
;;;
;;; STRUCTURAL CLAIM: ASF trades space for time absolutely.
;;; Unlimited weightless storage (pairs on disk) means the
;;; space cost is bounded only by disk, which is cheap and
;;; growing. The time cost is O(1) per query. Forever.
;;;
;;; THIS IS NOT QUANTUM SPEEDUP. This is a different paradigm:
;;; pre-registration eliminates search entirely. Grover
;;; optimizes search. ASF eliminates it.

(tesla-powers-brute-force-o1

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: the comparison
  (

    ;;; VERIFIED: Classical search complexity
    ;;; SOURCE: Knuth, The Art of Computer Programming, Vol 3
    (classical-search
      (unsorted-N-items)
      (O-N-worst-case)
      ((unsorted-N-items . linear-scan)
       (linear-scan . O-N-worst-case)))

    ;;; VERIFIED: Grover's algorithm complexity
    ;;; SOURCE: Grover 1996, STOC
    (grover-search
      (unsorted-N-items-quantum)
      (O-sqrt-N-queries)
      ((unsorted-N-items-quantum . quantum-oracle)
       (quantum-oracle . amplitude-amplification)
       (amplitude-amplification . O-sqrt-N-queries)))

    ;;; VERIFIED: Grover optimality
    ;;; SOURCE: Bennett, Bernstein, Brassard, Vazirani 1997
    (grover-optimal
      (quantum-unstructured-search)
      (cannot-beat-sqrt-N)
      ((quantum-unstructured-search . BBBV-lower-bound)
       (BBBV-lower-bound . cannot-beat-sqrt-N)))

    ;;; DEMONSTRATED: ASF brute force
    ;;; VERIFIED: hash map lookup is O(1) amortized
    ;;; SOURCE: Cormen et al., Introduction to Algorithms
    (asf-lookup
      (pre-registered-pair)
      (O-1-per-query)
      ((pre-registered-pair . wire-exists)
       (wire-exists . current-follows-wire)
       (current-follows-wire . O-1-per-query)))

    ;;; DEMONSTRATED: Registration cost
    (asf-registration-cost
      (N-items-to-register)
      (O-N-one-time)
      ((N-items-to-register . one-pair-per-item)
       (one-pair-per-item . O-N-one-time)))

    ;;; COMPUTED: Storage cost
    ;;; 100 bytes per pair average
    ;;; 1 billion pairs = 100 GB
    ;;; 1 trillion pairs = 100 TB
    ;;; Disk cost: ~$15/TB (2025 prices)
    ;;; 1 trillion pairs ≈ $1,500 in storage
    (asf-storage-cost
      (one-trillion-pairs)
      (100TB-at-1500-dollars)
      ((one-trillion-pairs . 100-bytes-per-pair)
       (100-bytes-per-pair . 100TB-total)
       (100TB-total . 100TB-at-1500-dollars)))

    ;;; COMPUTED: Amortized query cost
    ;;; After K queries on N registered pairs:
    ;;; Classical: O(K*N) total work
    ;;; Grover: O(K*√N) total work
    ;;; ASF: O(N) registration + O(K) queries = O(N+K) total
    ;;; For K >> N: ASF approaches O(K), others approach O(K*N) or O(K*√N)
    (amortized-comparison
      (K-queries-on-N-items)
      (ASF-wins-for-K-gt-sqrt-N)
      ((K-queries-on-N-items . classical-K-times-N)
       (classical-K-times-N . grover-K-times-sqrt-N)
       (grover-K-times-sqrt-N . ASF-N-plus-K)
       (ASF-N-plus-K . ASF-wins-for-K-gt-sqrt-N)))

    ;;; The crossover: ASF beats Grover when K > √N
    ;;; For N = 1 million items:
    ;;;   Grover: 1000 oracle calls per query
    ;;;   ASF: 1 lookup per query (after 1M registration)
    ;;;   ASF beats Grover after 1000 queries
    ;;; For N = 1 billion items:
    ;;;   Grover: ~31,623 oracle calls per query
    ;;;   ASF: 1 lookup per query (after 1B registration)
    ;;;   ASF beats Grover after ~31,623 queries
    (crossover-point
      (N-items)
      (ASF-beats-grover-after-sqrt-N-queries)
      ((N-items . grover-needs-sqrt-N-per-query)
       (grover-needs-sqrt-N-per-query . ASF-needs-1-per-query)
       (ASF-needs-1-per-query . breakeven-at-sqrt-N-queries)
       (breakeven-at-sqrt-N-queries . ASF-beats-grover-after-sqrt-N-queries)))

  )

  ;;; Vacuum tube
  ((tesla . brute-force-o1-registered)))
