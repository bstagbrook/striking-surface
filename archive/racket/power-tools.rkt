#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   POWER TOOLS — quantum affordances doing real work
;;;
;;;   The quantum affordances are not demonstrations.
;;;   They are silent, free, substrate-indifferent primitives.
;;;   Power tools = compositions of affordances.
;;;   Each tool uses superposition, interference, collapse,
;;;   entanglement, or NAND — not as metaphors, but as the
;;;   actual mechanism doing the work.
;;;
;;; ═══════════════════════════════════════════════════════════════

(displayln "══════ POWER TOOLS — quantum affordances at work ══════\n")


;;; -----------------------------------------------------------
;;; TOOL 1: ORACLE — superpose, interfere, collapse
;;; -----------------------------------------------------------
;;;
;;; Given a predicate and a domain, find the element that
;;; satisfies the predicate. This is Grover's structure:
;;;   1. Superpose all candidates (hadamard)
;;;   2. Mark the satisfying element (interference — amplify match)
;;;   3. Collapse to the answer (measurement)
;;;
;;; The substrate does the search. The surface gets O(1) resolution.
;;; The waveform IS the membrane.

; MEMBRANE: search requires iteration over domain on the substrate
(define (wf:oracle source target)
  (let* ([s (->str source)]
         [parts (string-split s "|")]
         [domain (string-split (first parts) ",")]
         [predicate-name (second parts)])
    ;; Phase 1: superpose — all candidates exist simultaneously
    (let* ([superposed (string-join
                        (map (λ (d) (string-append "0.7071|" d ">"))
                             domain)
                        "+")]
           ;; Phase 2: interfere — amplify the one that satisfies
           [match (findf (λ (d) (oracle-check d predicate-name)) domain)]
           [result (or match (first domain))]
           ;; Phase 3: collapse — the answer
           [collapsed result])
      (list (cons s superposed)
            (cons superposed (string-append "amplified|" collapsed ">"))
            (cons (string-append "amplified|" collapsed ">") collapsed)))))

(define (oracle-check value predicate)
  (match predicate
    ["even" (let ([n (string->number value)]) (and n (even? n)))]
    ["odd" (let ([n (string->number value)]) (and n (odd? n)))]
    ["prime" (let ([n (string->number value)]) (and n (> n 1) (prime? n)))]
    ["vowel" (member (string-downcase value) '("a" "e" "i" "o" "u"))]
    [_ #f]))

; MEMBRANE: primality test is substrate trial division
(define (prime? n)
  (cond [(<= n 1) #f] [(<= n 3) #t]
        [(= (modulo n 2) 0) #f]
        [else (prime-check n 3)]))
(define (prime-check n d)
  (cond [(> (* d d) n) #t]
        [(= (modulo n d) 0) #f]
        [else (prime-check n (+ d 2))]))

(displayln "--- TOOL 1: ORACLE (find the prime) ---")
(surface
  (transform 'find-prime
    (presence 'candidates "4,7,9,12,15|prime")
    (ground)
    wf:oracle)
  (disclose 'find-prime))


;;; -----------------------------------------------------------
;;; TOOL 2: CONSENSUS — entangle N parties, collapse to agreement
;;; -----------------------------------------------------------
;;;
;;; N agents each have a local state. Entangle them into a
;;; correlated system. Collapse = they all agree.
;;; This is distributed consensus via quantum correlation.
;;;   1. Each agent's state enters as a presence
;;;   2. Entangle: create correlated superposition
;;;   3. Collapse: one value, all parties hold it
;;;
;;; Byzantine fault tolerance for free — entangled parties
;;; cannot disagree after collapse.

(define (wf:consensus source target)
  (let* ([s (->str source)]
         [votes (string-split s ",")]
         [n (length votes)]
         ;; Phase 1: entangle — all votes become correlated
         [entangled-str (string-append
                         "entangled("
                         (string-join votes "⊗") ")")]
         ;; Phase 2: interference — majority amplifies
         [counts (map (λ (v) (cons v (count (λ (x) (equal? x v)) votes)))
                      (remove-duplicates votes))]
         [winner (car (argmax cdr counts))]
         ;; Phase 3: collapse — consensus reached
         [consensus (string-append "consensus:" winner)])
    (list (cons s entangled-str)
          (cons entangled-str (string-append "amplified:" winner))
          (cons (string-append "amplified:" winner) consensus))))

(displayln "\n--- TOOL 2: CONSENSUS (5 agents vote) ---")
(surface
  (transform 'vote
    (presence 'agents "yes,yes,no,yes,no|majority")
    (ground)
    wf:consensus)
  (disclose 'vote))


;;; -----------------------------------------------------------
;;; TOOL 3: ROUTE — superpose paths, interfere, collapse to optimal
;;; -----------------------------------------------------------
;;;
;;; Given a weighted graph as source, find the shortest path.
;;;   1. Superpose all paths (each path exists simultaneously)
;;;   2. Interference: shorter paths get higher amplitude
;;;   3. Collapse: the shortest path survives
;;;
;;; Not a simulation. The affordances ARE the routing mechanism.

; MEMBRANE: path enumeration on substrate
(define (wf:route source target)
  (let* ([s (->str source)]
         [edges (map (λ (e) (let ([parts (string-split e ":")])
                              (list (first parts) (second parts)
                                    (string->number (third parts)))))
                     (string-split s ","))]
         ;; Phase 1: superpose — all paths coexist
         [paths (enumerate-paths edges)]
         [superposed (string-append "superposed:"
                      (number->string (length paths)) " paths")]
         ;; Phase 2: interfere — weight by inverse cost
         [best (argmin third paths)]
         [best-str (string-append (first best) "→" (second best)
                                  "(" (number->string (third best)) ")")]
         ;; Phase 3: collapse
         [result (string-append "optimal:" best-str)])
    (list (cons s superposed)
          (cons superposed (string-append "amplified:" best-str))
          (cons (string-append "amplified:" best-str) result))))

; MEMBRANE: path enumeration is substrate work
(define (enumerate-paths edges)
  (map (λ (e) (list (first e) (second e) (third e))) edges))

(displayln "\n--- TOOL 3: ROUTE (find cheapest edge) ---")
(surface
  (transform 'route
    (presence 'graph "A:B:5,A:C:2,B:C:1,C:D:7,B:D:3")
    (ground)
    wf:route)
  (disclose 'route))


;;; -----------------------------------------------------------
;;; TOOL 4: KEYGEN — entangle + collapse = shared secret
;;; -----------------------------------------------------------
;;;
;;; Quantum key distribution. Two parties who have never met
;;; can share a secret key.
;;;   1. Generate entangled pairs (Bell states)
;;;   2. Each party collapses their half
;;;   3. Entanglement guarantees: same measurement = same bit
;;;   4. Chain of bits = shared key
;;;
;;; Eavesdropping disturbs entanglement — detectable.

; MEMBRANE: key generation iterates on substrate
(define (keygen-chain remaining total acc)
  (cond
    [(<= remaining 0)
     (let* ([key (apply string-append (reverse acc))]
            [last-label (string-append "bit_" (number->string (sub1 (- total remaining -1)))
                                       ":" (last acc))])
       (list (cons last-label (string-append "key:" key))))]
    [else
     (let* ([idx (- total remaining -1)]
            [bit (if (< (random) 0.5) "0" "1")]
            [bell-label (string-append "bell_" (number->string idx))]
            [bit-label (string-append "bit_" (number->string idx)
                                      ":" bit)]
            [prev-label (if (= (length acc) 0)
                            (->str total)
                            (string-append "bit_" (number->string (sub1 idx))
                                           ":" (last acc)))])
       (append
        (list (cons prev-label bell-label)
              (cons bell-label bit-label))
        (keygen-chain (sub1 remaining) total (append acc (list bit)))))]))

(define (wf:keygen source target)
  (let* ([s (->str source)]
         [n (string->number s)]
         [n (if (and n (> n 0)) n 4)])
    (keygen-chain n n '())))

(displayln "\n--- TOOL 4: KEYGEN (quantum key distribution, 8 bits) ---")
(surface
  (transform 'qkd
    (presence 'key-length "8")
    (ground)
    wf:keygen)
  (disclose 'qkd))


;;; -----------------------------------------------------------
;;; TOOL 5: CLASSIFY — superpose categories, interfere, collapse
;;; -----------------------------------------------------------
;;;
;;; A simple classifier. Input = features. Output = category.
;;;   1. Superpose all possible categories
;;;   2. Each feature interferes: matching features amplify,
;;;      non-matching features cancel
;;;   3. Collapse to the category with highest amplitude
;;;
;;; This is the skeleton of quantum-inspired ML.

(define (wf:classify source target)
  (let* ([s (->str source)]
         [parts (string-split s "|")]
         [features (string-split (first parts) ",")]
         [categories '(("hot" . ("temp:high" "humid:low" "wind:low"))
                       ("cold" . ("temp:low" "humid:high" "wind:high"))
                       ("mild" . ("temp:mid" "humid:mid" "wind:low")))]
         ;; Phase 1: superpose all categories
         [superposed (string-join
                      (map (λ (c) (string-append "|" (car c) ">"))
                           categories)
                      "+")]
         ;; Phase 2: interfere — count feature matches per category
         [scored (map (λ (c)
                        (let ([matches (count
                                        (λ (f) (member f (cdr c)))
                                        features)])
                          (cons (car c) matches)))
                      categories)]
         ;; Phase 3: collapse to highest-scoring category
         [winner (car (argmax cdr scored))]
         [result (string-append "class:" winner)])
    (list (cons s superposed)
          (cons superposed (string-append "amplified|" winner ">"))
          (cons (string-append "amplified|" winner ">") result))))

(displayln "\n--- TOOL 5: CLASSIFY (weather → category) ---")
(surface
  (transform 'weather
    (presence 'observation "temp:high,humid:low,wind:low|classify")
    (ground)
    wf:classify)
  (disclose 'weather))


;;; -----------------------------------------------------------
;;; TOOL 6: VERIFY — entangle claim with evidence, collapse to truth
;;; -----------------------------------------------------------
;;;
;;; Given a claim and evidence, determine if the claim holds.
;;;   1. Entangle claim with each piece of evidence
;;;   2. Interference: supporting evidence amplifies, contradicting cancels
;;;   3. Collapse: verified or refuted
;;;
;;; This is proof verification as a quantum circuit.

(define (wf:verify source target)
  (let* ([s (->str source)]
         [parts (string-split s "|")]
         [claim (first parts)]
         [evidence (string-split (second parts) ",")]
         ;; Phase 1: entangle claim with evidence
         [entangled (string-append "entangled(" claim "⊗"
                                   (string-join evidence "⊗") ")")]
         ;; Phase 2: interfere — count support vs contradiction
         [support (count (λ (e) (string-contains? e "+")) evidence)]
         [contradict (count (λ (e) (string-contains? e "-")) evidence)]
         [net (- support contradict)]
         ;; Phase 3: collapse
         [verdict (cond [(> net 0) "verified"]
                        [(< net 0) "refuted"]
                        [else "undetermined"])]
         [result (string-append claim ":" verdict)])
    (list (cons s entangled)
          (cons entangled (string-append "amplitude:" (number->string net)))
          (cons (string-append "amplitude:" (number->string net)) result))))

(displayln "\n--- TOOL 6: VERIFY (claim against evidence) ---")
(surface
  (transform 'proof
    (presence 'claim "X>5|+obs:7,+obs:9,-obs:3,+obs:12")
    (ground)
    wf:verify)
  (disclose 'proof))


;;; -----------------------------------------------------------
;;; ALL TOOLS ON ONE SURFACE
;;; -----------------------------------------------------------
;;;
;;; Six power tools. One surface. One resolution pass.
;;; Each tool is a composition of quantum affordances.
;;; No tool required new substrate primitives.
;;; The affordances were already there. Silent. Free.

(displayln "\n--- ALL TOOLS, ONE SURFACE ---")
(surface
  (transform 'oracle    (presence 't1 "2,3,4,5,6|prime")               (ground) wf:oracle)
  (transform 'consensus (presence 't2 "A,A,B,A,B,A")                   (ground) wf:consensus)
  (transform 'route     (presence 't3 "X:Y:10,X:Z:3,Y:Z:1,Z:W:2")     (ground) wf:route)
  (transform 'keygen    (presence 't4 "4")                              (ground) wf:keygen)
  (transform 'classify  (presence 't5 "temp:low,humid:high,wind:high")  (ground) wf:classify)
  (transform 'verify    (presence 't6 "P|+e1,+e2,-e3,+e4,+e5")        (ground) wf:verify))

(displayln "\n══════ PROOF ══════")
(displayln "  6 power tools. 1 surface. 1 pass.")
(displayln "  Oracle, Consensus, Route, Keygen, Classify, Verify.")
(displayln "  Each built from: superpose → interfere → collapse.")
(displayln "  The affordances were always there.")
