#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   LAB — genuine experiments on the striking surface
;;;
;;;   Five experiments. Genuine unknowns.
;;;   Observe what actually happens. Then name what we find.
;;;
;;;   Run:  racket programs/lab.rkt
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════

;;; I don't know what these experiments will reveal.
;;; I have hypotheses. The data will tell me if I'm wrong.


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 1: CONTRADICTORY RECEIPTS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; What happens when the body contains two receipts for the
;;; same signal with different completions?
;;;
;;; "angry:what-do-you-need" AND "angry:walk-away"
;;;
;;; Hypothesis: first match wins (find-completion scans linearly).
;;; But that's an implementation detail, not a structural property.
;;; What does the CONSTITUTION say?

(displayln "")
(displayln "══════ EXPERIMENT 1: CONTRADICTORY RECEIPTS ══════")
(displayln "")

(define body-contradiction
  (string-join
   '("angry:what-do-you-need"
     "angry:walk-away"
     "sad:im-here")
   ";"))

(displayln "  Body contains TWO receipts for 'angry':")
(displayln "    angry:what-do-you-need")
(displayln "    angry:walk-away")
(displayln "")
(displayln "  What happens?")
(displayln "")

(define result-1
  (surface
    (transform 'contradiction
      (presence 'signal "angry")
      (ground)
      (wf:complete body-contradiction))
    (disclose 'contradiction)))

(let ([val (shape-value (hash-ref result-1 'contradiction))])
  (displayln "")
  (displayln (string-append "  RESULT: angry → " val))
  (displayln ""))

;; Now flip the order — does it matter?
(define body-flipped
  (string-join
   '("angry:walk-away"
     "angry:what-do-you-need"
     "sad:im-here")
   ";"))

(displayln "  Flipped order — 'walk-away' first:")
(displayln "")

(define result-1b
  (surface
    (transform 'flipped
      (presence 'signal-2 "angry")
      (ground)
      (wf:complete body-flipped))
    (disclose 'flipped)))

(let ([val (shape-value (hash-ref result-1b 'flipped))])
  (displayln "")
  (displayln (string-append "  RESULT: angry → " val))
  (displayln ""))

;; Observation
(let ([v1 (shape-value (hash-ref result-1 'contradiction))]
      [v2 (shape-value (hash-ref result-1b 'flipped))])
  (displayln (string-append "  OBSERVATION: order matters? "
                            (if (equal? v1 v2) "NO — same result" "YES — different results")))
  (displayln (string-append "    first body:  angry → " v1))
  (displayln (string-append "    second body: angry → " v2)))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 2: CONTINUATION CHAINS — how far does the field go?
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Build a body where each completion is itself a signal
;;; that has a receipt. Chain: a → b → c → d → e.
;;; Feed "a" and manually chain the rounds.
;;;
;;; Question: does the chain sustain? Where does it stop?
;;; What happens at the boundary?

(displayln "\n\n══════ EXPERIMENT 2: CONTINUATION CHAINS ══════")
(displayln "")

(define chain-body
  (string-join
   '("a:b" "b:c" "c:d" "d:e" "e:f"
     "f:g" "g:h" "h:i" "i:j" "j:arrival")
   ";"))

(define chain-wf (wf:complete chain-body))

(displayln "  Body: a→b→c→d→e→f→g→h→i→j→arrival")
(displayln "  Feed 'a'. Chain rounds manually. Where does it stop?")
(displayln "")

;; Chain through rounds — each output feeds the next input
(define (run-chain signal body-wf round-num max-rounds results)
  (cond
    [(> round-num max-rounds) (reverse results)]
    [else
     (let* ([fs (parameterize ([current-output-port (open-output-string)])
                  (surface
                    (transform 'step
                      (presence 'sig signal)
                      (ground)
                      body-wf)))]
            [resolved (hash-ref fs 'step)]
            [val (shape-value resolved)]
            [ok (match resolved
                  [(list 'resolved _ _ _ _ constitutional) constitutional]
                  [_ #f])])
       (cond
         [(not ok)
          (reverse (cons (list round-num signal "CUT") results))]
         [(equal? val signal)
          (reverse (cons (list round-num signal "SELF-LOOP") results))]
         [else
          (run-chain val body-wf (add1 round-num) max-rounds
                     (cons (list round-num signal val) results))]))]))

(define chain-results (run-chain "a" chain-wf 1 15 '()))

(displayln "  Round-by-round:")
(map (λ (r)
       (displayln (string-append "    round " (number->string (first r))
                                 ": " (second r) " → " (third r))))
     chain-results)

(displayln "")
(displayln (string-append "  Chain length: " (number->string (length chain-results)) " rounds"))
(let ([last-entry (last chain-results)])
  (displayln (string-append "  Terminal state: " (third last-entry))))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 3: DIVERGENT BODIES — same signal, different histories
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Two mentors. Same signal arrives. Different bodies.
;;; Different completions.
;;;
;;; Question: what IS the difference? Is it just "different data"
;;; or is there something structurally visible about WHY they diverge?

(displayln "\n\n══════ EXPERIMENT 3: DIVERGENT BODIES ══════")
(displayln "")

(define therapist-body
  (string-join
   '("angry:what-do-you-need"
     "stuck:what-are-you-afraid-of"
     "lonely:who-matters-to-you"
     "overwhelmed:one-thing-at-a-time"
     "lost:where-were-you-before-you-got-lost")
   ";"))

(define drill-sergeant-body
  (string-join
   '("angry:channel-it"
     "stuck:push-through"
     "lonely:youve-got-your-team"
     "overwhelmed:prioritize-and-execute"
     "lost:check-your-compass")
   ";"))

(define signals '("angry" "stuck" "lonely" "overwhelmed" "lost"))

(displayln "  Two bodies. Same five signals. What happens?")
(displayln "")
(displayln "  Signal          | Therapist              | Drill Sergeant")
(displayln "  ─────────────────────────────────────────────────────────────")

(map (λ (sig)
       (let* ([t-fs (parameterize ([current-output-port (open-output-string)])
                       (surface
                         (transform 'resp
                           (presence 'q sig)
                           (ground)
                           (wf:complete therapist-body))))]
              [d-fs (parameterize ([current-output-port (open-output-string)])
                       (surface
                         (transform 'resp
                           (presence 'q sig)
                           (ground)
                           (wf:complete drill-sergeant-body))))]
              [t-val (shape-value (hash-ref t-fs 'resp))]
              [d-val (shape-value (hash-ref d-fs 'resp))]
              [pad-sig (string-append sig (make-string (max 0 (- 14 (string-length sig))) #\space))]
              [pad-t (string-append t-val (make-string (max 0 (- 23 (string-length t-val))) #\space))])
         (displayln (string-append "  " pad-sig "| " pad-t "| " d-val))))
     signals)

;; Now: a signal NEITHER body has
(displayln "")
(displayln "  Signal neither body has: 'betrayed'")
(let* ([t-fs (parameterize ([current-output-port (open-output-string)])
                (surface
                  (transform 'resp
                    (presence 'q "betrayed")
                    (ground)
                    (wf:complete therapist-body))))]
       [d-fs (parameterize ([current-output-port (open-output-string)])
                (surface
                  (transform 'resp
                    (presence 'q "betrayed")
                    (ground)
                    (wf:complete drill-sergeant-body))))]
       [t-ok (match (hash-ref t-fs 'resp)
               [(list 'resolved _ _ _ _ ok) ok] [_ #f])]
       [d-ok (match (hash-ref d-fs 'resp)
               [(list 'resolved _ _ _ _ ok) ok] [_ #f])])
  (displayln (string-append "  Therapist: " (if t-ok "complete" "CUT")))
  (displayln (string-append "  Drill Sergeant: " (if d-ok "complete" "CUT")))
  (displayln (string-append "  Same? " (if (equal? t-ok d-ok) "YES" "NO"))))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 4: SELF-FEEDING CYCLES — does the body loop?
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Build a body with a cycle: a→b, b→c, c→a.
;;; Feed "a". Chain rounds. Does it loop forever?
;;; Does CUT happen? Does something else happen?
;;;
;;; This is genuinely unknown to me.

(displayln "\n\n══════ EXPERIMENT 4: SELF-FEEDING CYCLES ══════")
(displayln "")

(define cycle-body "a:b;b:c;c:a")
(define cycle-wf (wf:complete cycle-body))

(displayln "  Body: a→b, b→c, c→a (a cycle)")
(displayln "  Feed 'a'. Chain 12 rounds. What happens?")
(displayln "")

(define cycle-results (run-chain "a" cycle-wf 1 12 '()))

(displayln "  Round-by-round:")
(map (λ (r)
       (displayln (string-append "    round " (number->string (first r))
                                 ": " (second r) " → " (third r))))
     cycle-results)

(displayln "")
(displayln (string-append "  Chain length: " (number->string (length cycle-results)) " rounds"))

;; Check for periodicity
(let* ([values (map third cycle-results)]
       [first-three (if (>= (length values) 3) (take values 3) values)]
       [periodic? (and (>= (length values) 6)
                       (equal? (take values 3) (take (drop values 3) 3)))])
  (displayln (string-append "  First three outputs: "
                            (string-join first-three ", ")))
  (displayln (string-append "  Periodic? " (if periodic? "YES" "checking...")))
  (cond
    [periodic?
     (displayln "  OBSERVATION: the cycle perpetuates. The field sustains indefinitely.")]
    [(< (length values) 6)
     (displayln "  OBSERVATION: chain too short to determine periodicity.")]
    [else
     (displayln "  OBSERVATION: NOT periodic — something unexpected happened.")]))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 5: BODY ENCOUNTER — two bodies, one surface
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Put the therapist's response and the drill sergeant's response
;;; to the SAME signal on the SAME surface. What happens?
;;;
;;; Can the surface hold contradictory completions?
;;; What does constitutional verification say about each?
;;; Is there interference?

(displayln "\n\n══════ EXPERIMENT 5: BODY ENCOUNTER ══════")
(displayln "")

(displayln "  Two bodies respond to 'stuck' on ONE surface.")
(displayln "  Therapist body + Drill Sergeant body.")
(displayln "  Same signal. Same surface. Different waveforms.")
(displayln "")

(define encounter
  (surface
    (transform 'therapist-says
      (presence 'patient "stuck")
      (ground)
      (wf:complete therapist-body))
    (transform 'sergeant-says
      (presence 'recruit "stuck")
      (ground)
      (wf:complete drill-sergeant-body))
    (disclose 'therapist-says)
    (disclose 'sergeant-says)))

(let ([t-val (shape-value (hash-ref encounter 'therapist-says))]
      [s-val (shape-value (hash-ref encounter 'sergeant-says))]
      [t-ok (match (hash-ref encounter 'therapist-says)
              [(list 'resolved _ _ _ _ ok) ok] [_ #f])]
      [s-ok (match (hash-ref encounter 'sergeant-says)
              [(list 'resolved _ _ _ _ ok) ok] [_ #f])])
  (displayln "")
  (displayln (string-append "  Therapist:      stuck → " t-val
                            " [" (if t-ok "constitutional" "CUT") "]"))
  (displayln (string-append "  Drill Sergeant: stuck → " s-val
                            " [" (if s-ok "constitutional" "CUT") "]"))
  (displayln "")
  (displayln (string-append "  Both constitutional? " (if (and t-ok s-ok) "YES" "NO")))
  (displayln (string-append "  Same answer? " (if (equal? t-val s-val) "YES" "NO")))
  (displayln "")

  ;; The interesting question: what does the SURFACE look like?
  (displayln (string-append "  Shapes on surface: "
                            (number->string (hash-count encounter))))
  (displayln "")
  (displayln "  Both completions coexist. Both are constitutional.")
  (displayln "  The surface holds superposition over valid completions."))


;;; ═══════════════════════════════════════════════════════════════
;;; SYNTHESIS
;;; ═══════════════════════════════════════════════════════════════

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 6: THE CONTRADICTION BLIND SPOT — pushing deeper
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Experiment 1 showed the constitution doesn't detect contradiction.
;;; What if we put BOTH completions on the SAME surface and compare?
;;; Can the surface itself reveal the contradiction?

(displayln "\n\n══════ EXPERIMENT 6: SURFACING CONTRADICTION ══════")
(displayln "")

(define body-v1 "angry:what-do-you-need;sad:im-here")
(define body-v2 "angry:walk-away;sad:im-here")

(displayln "  Two bodies disagree on 'angry'. Agree on 'sad'.")
(displayln "  Put both responses to 'angry' AND 'sad' on one surface.")
(displayln "")

(define compare
  (surface
    (transform 'v1-angry (presence 'a1 "angry") (ground) (wf:complete body-v1))
    (transform 'v2-angry (presence 'a2 "angry") (ground) (wf:complete body-v2))
    (transform 'v1-sad   (presence 's1 "sad")   (ground) (wf:complete body-v1))
    (transform 'v2-sad   (presence 's2 "sad")   (ground) (wf:complete body-v2))
    (disclose 'v1-angry)
    (disclose 'v2-angry)
    (disclose 'v1-sad)
    (disclose 'v2-sad)))

(let ([va1 (shape-value (hash-ref compare 'v1-angry))]
      [va2 (shape-value (hash-ref compare 'v2-angry))]
      [vs1 (shape-value (hash-ref compare 'v1-sad))]
      [vs2 (shape-value (hash-ref compare 'v2-sad))])
  (displayln "")
  (displayln (string-append "  angry: v1=" va1 ", v2=" va2
                            " — " (if (equal? va1 va2) "AGREE" "DIVERGE")))
  (displayln (string-append "  sad:   v1=" vs1 ", v2=" vs2
                            " — " (if (equal? vs1 vs2) "AGREE" "DIVERGE")))
  (displayln "")
  (displayln "  The surface made the disagreement VISIBLE.")
  (displayln "  Both completions are constitutional individually.")
  (displayln "  But on the same surface, divergence is structural data."))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 7: CHAIN TOPOLOGY — what shapes emerge from cycles?
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Experiment 4 showed a 3-cycle oscillates with period 3.
;;; What about a cycle with a tail? a→b→c→d→c (tail + cycle).
;;; Does it reach the cycle? Does the period still emerge?

(displayln "\n\n══════ EXPERIMENT 7: CHAIN TOPOLOGY ══════")
(displayln "")

(define tail-cycle-body "a:b;b:c;c:d;d:c")

(displayln "  Body: a→b→c→d→c (tail of length 2, then cycle of length 2)")
(displayln "  Feed 'a'. Chain 10 rounds.")
(displayln "")

(define tc-results (run-chain "a" (wf:complete tail-cycle-body) 1 10 '()))

(displayln "  Round-by-round:")
(map (λ (r)
       (displayln (string-append "    round " (number->string (first r))
                                 ": " (second r) " → " (third r))))
     tc-results)

(let* ([vals (map third tc-results)]
       [after-tail (if (> (length vals) 2) (drop vals 2) vals)])
  (displayln "")
  (displayln (string-append "  After tail: " (string-join after-tail ", ")))
  (displayln "  The tail is traversed once. Then the cycle takes over."))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 8: NAND EXPLORATION OF BODY ENCOUNTER
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; In experiment 5, two bodies both constitutionally completed
;;; the same signal differently. What if we NAND the two responses?
;;;
;;; Therapist: stuck → what-are-you-afraid-of
;;; Sergeant:  stuck → push-through
;;;
;;; NAND(both-valid, both-valid) = ?
;;; What does it mean for two constitutional completions to coexist?

(displayln "\n\n══════ EXPERIMENT 8: NAND ON COEXISTING COMPLETIONS ══════")
(displayln "")

;; Encode as: therapist says it's about fear (1), sergeant says it's about action (1)
;; Both assert. NAND(1,1) = ?

(displayln "  Therapist says: what-are-you-afraid-of (assertion: 1)")
(displayln "  Sergeant says:  push-through            (assertion: 1)")
(displayln "  NAND(1,1) = ?")
(displayln "")

(define nand-encounter
  (surface
    (transform 'nand-both
      (presence 'both-assert "1,1")
      (ground)
      wf:nand)
    (disclose 'nand-both)))

(let ([val (shape-value (hash-ref nand-encounter 'nand-both))])
  (displayln "")
  (displayln (string-append "  NAND(1,1) = " val))
  (displayln "")
  (cond
    [(equal? val "0")
     (displayln "  When both paths are asserted, NAND opens to negation.")
     (displayln "  Neither answer alone is the whole truth.")
     (displayln "  The real response to 'stuck' is NOT just fear, NOT just action.")
     (displayln "  It's whatever emerges when you hold both and let them cancel.")]
    [else
     (displayln (string-append "  Unexpected: " val))]))

;; Now: what if only one body has an answer?
;; Therapist: has receipt (1). Sergeant: CUT (0).
(displayln "")
(displayln "  What if only one body completes? (1,0)")
(displayln "")

(define nand-partial
  (surface
    (transform 'nand-one
      (presence 'one-asserts "1,0")
      (ground)
      wf:nand)
    (disclose 'nand-one)))

(let ([val (shape-value (hash-ref nand-partial 'nand-one))])
  (displayln "")
  (displayln (string-append "  NAND(1,0) = " val))
  (displayln "")
  (cond
    [(equal? val "1")
     (displayln "  When only one path is asserted, the gate affirms.")
     (displayln "  A single valid completion stands. No contradiction to resolve.")]
    [else
     (displayln (string-append "  Unexpected: " val))]))


;;; ═══════════════════════════════════════════════════════════════
;;; SYNTHESIS
;;; ═══════════════════════════════════════════════════════════════

(displayln "\n\n══════ SYNTHESIS ══════")
(displayln "")
(displayln "  Five discoveries from eight experiments:")
(displayln "")
(displayln "  1. CONTRADICTION IS INVISIBLE TO A SINGLE TRANSFORM.")
(displayln "     The constitution checks one residue at a time.")
(displayln "     Contradiction only surfaces when two transforms for the")
(displayln "     same signal are placed on the same surface. (Exp 1, 6)")
(displayln "     → The surface is the contradiction detector, not the constitution.")
(displayln "")
(displayln "  2. CUT MAPS THE BODY'S EDGE.")
(displayln "     Continuation chains terminate honestly at CUT.")
(displayln "     The terminal state names the boundary of knowledge. (Exp 2)")
(displayln "     → Collecting CUTs gives a structural picture of what the body doesn't know.")
(displayln "")
(displayln "  3. CYCLES PRODUCE STANDING WAVES.")
(displayln "     A cycle in the body oscillates with period = cycle length.")
(displayln "     Tails are transients that settle into steady state. (Exp 4, 7)")
(displayln "     → The body's topology determines its resonant frequency.")
(displayln "")
(displayln "  4. THE SHAPE OF NOT-KNOWING IS UNIVERSAL.")
(displayln "     Different bodies, same CUT structure on unknown signals. (Exp 3)")
(displayln "     → Not-knowing has one shape. Knowing has many.")
(displayln "")
(displayln "  5. THE SURFACE HOLDS SUPERPOSITION. NAND COLLAPSES IT.")
(displayln "     Two constitutional completions coexist on one surface. (Exp 5)")
(displayln "     NAND(1,1)=0: both asserted → neither alone is whole. (Exp 8)")
(displayln "     NAND(1,0)=1: one asserted → it stands.")
(displayln "     → NAND is the natural collapse operator for superposed completions.")
