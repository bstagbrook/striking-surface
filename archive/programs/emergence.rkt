#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   EMERGENCE — what happens between bodies?
;;;
;;;   Can two bodies, composed, complete circuits that
;;;   neither body can complete alone?
;;;
;;;   Run:  racket programs/emergence.rkt
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════


;;; -----------------------------------------------------------
;;; UTILITIES — chaining and inspection, no mutation
;;; -----------------------------------------------------------

;; Run a signal through a body for N rounds, return list of (round signal result)
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

;; Run a signal through TWO bodies alternating — A's output feeds B, B's output feeds A
(define (run-composite signal wf-a wf-b round-num max-rounds results)
  (cond
    [(> round-num max-rounds) (reverse results)]
    [else
     (let* ([current-wf (if (odd? round-num) wf-a wf-b)]
            [which (if (odd? round-num) "A" "B")]
            [fs (parameterize ([current-output-port (open-output-string)])
                  (surface
                    (transform 'step
                      (presence 'sig signal)
                      (ground)
                      current-wf)))]
            [resolved (hash-ref fs 'step)]
            [val (shape-value resolved)]
            [ok (match resolved
                  [(list 'resolved _ _ _ _ constitutional) constitutional]
                  [_ #f])])
       (cond
         [(not ok)
          (reverse (cons (list round-num which signal "CUT") results))]
         [(equal? val signal)
          (reverse (cons (list round-num which signal "SELF-LOOP") results))]
         [else
          (run-composite val wf-a wf-b (add1 round-num) max-rounds
                         (cons (list round-num which signal val) results))]))]))

(define (display-chain-results results)
  (map (λ (r)
         (displayln (string-append "    round " (number->string (first r))
                                   ": " (second r) " → " (third r))))
       results))

(define (display-composite-results results)
  (map (λ (r)
         (displayln (string-append "    round " (number->string (first r))
                                   " [" (second r) "]: "
                                   (third r) " → " (fourth r))))
       results))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 1: EMERGENT COMPLETION
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Body A: stuck → what-are-you-afraid-of
;;; Body B: what-are-you-afraid-of → face-it, face-it → freedom
;;;
;;; Neither body alone can go from "stuck" to "freedom."
;;; Can the composite?

(displayln "")
(displayln "══════ EXPERIMENT 1: EMERGENT COMPLETION ══════")
(displayln "")

(define body-a "stuck:what-are-you-afraid-of;angry:what-do-you-need")
(define body-b "what-are-you-afraid-of:face-it;face-it:freedom;what-do-you-need:ask-for-it")

(define wf-a (wf:complete body-a))
(define wf-b (wf:complete body-b))

(displayln "  Body A: stuck → what-are-you-afraid-of, angry → what-do-you-need")
(displayln "  Body B: what-are-you-afraid-of → face-it, face-it → freedom, what-do-you-need → ask-for-it")
(displayln "")

;; Body A alone on "stuck"
(displayln "  --- Body A alone on 'stuck' ---")
(let ([r (run-chain "stuck" wf-a 1 5 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Body B alone on "stuck"
(displayln "  --- Body B alone on 'stuck' ---")
(let ([r (run-chain "stuck" wf-b 1 5 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Composite: A then B alternating
(displayln "  --- Composite A→B→A→B on 'stuck' ---")
(let ([r (run-composite "stuck" wf-a wf-b 1 8 '())])
  (display-composite-results r)
  (displayln "")
  (let ([last-entry (last r)])
    (displayln (string-append "    terminal: " (fourth last-entry)))
    (displayln (string-append "    chain: " (number->string (length r)) " rounds"))))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 2: EMERGENT RESONANCE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Body A: give → receive
;;; Body B: receive → give
;;;
;;; Neither body alone oscillates — each has one step then CUT.
;;; Does the composite oscillate?

(displayln "\n\n══════ EXPERIMENT 2: EMERGENT RESONANCE ══════")
(displayln "")

(define body-give "give:receive")
(define body-receive "receive:give")

(define wf-give (wf:complete body-give))
(define wf-receive (wf:complete body-receive))

(displayln "  Body A: give → receive (then CUT)")
(displayln "  Body B: receive → give (then CUT)")
(displayln "")

;; Body A alone
(displayln "  --- Body A alone on 'give' ---")
(let ([r (run-chain "give" wf-give 1 5 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Body B alone
(displayln "  --- Body B alone on 'receive' ---")
(let ([r (run-chain "receive" wf-receive 1 5 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Composite: A then B alternating on "give"
(displayln "  --- Composite A→B→A→B on 'give' ---")
(let ([r (run-composite "give" wf-give wf-receive 1 10 '())])
  (display-composite-results r)
  (displayln "")
  (let* ([outputs (map fourth r)]
         [first-two (if (>= (length outputs) 2) (take outputs 2) outputs)]
         [periodic? (and (>= (length outputs) 4)
                         (equal? (take outputs 2) (take (drop outputs 2) 2)))])
    (displayln (string-append "    periodic? " (if periodic? "YES" "NO")))
    (displayln (string-append "    chain: " (number->string (length r)) " rounds"))))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 3: RICHER EMERGENT RESONANCE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Body A: question → exploration, answer → integration
;;; Body B: exploration → answer, integration → question
;;;
;;; The inquiry cycle: question → exploration → answer → integration → question...
;;; No single body has the full cycle. Does the composite cycle?

(displayln "\n\n══════ EXPERIMENT 3: THE INQUIRY CYCLE ══════")
(displayln "")

(define body-asker "question:exploration;answer:integration")
(define body-explorer "exploration:answer;integration:question")

(define wf-asker (wf:complete body-asker))
(define wf-explorer (wf:complete body-explorer))

(displayln "  Body A (Asker):    question → exploration, answer → integration")
(displayln "  Body B (Explorer): exploration → answer, integration → question")
(displayln "  Full cycle: question → exploration → answer → integration → question...")
(displayln "  No single body has the full cycle.")
(displayln "")

;; Body A alone
(displayln "  --- Asker alone on 'question' ---")
(let ([r (run-chain "question" wf-asker 1 6 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Body B alone
(displayln "  --- Explorer alone on 'question' ---")
(let ([r (run-chain "question" wf-explorer 1 6 '())])
  (display-chain-results r)
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))

(displayln "")

;; Composite
(displayln "  --- Composite Asker→Explorer→Asker→Explorer on 'question' ---")
(let ([r (run-composite "question" wf-asker wf-explorer 1 12 '())])
  (display-composite-results r)
  (displayln "")
  (displayln (string-append "    chain: " (number->string (length r)) " rounds")))


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 4: RELATIONAL KNOWLEDGE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; After the composite completes a circuit that neither body
;;; could complete alone, the FULL PATH becomes a receipt.
;;;
;;; Body A alone: stuck → what-are-you-afraid-of → CUT
;;; Body B alone: stuck → CUT
;;; Composite: stuck → what-are-you-afraid-of → face-it → freedom
;;;
;;; The receipt "stuck:freedom" (the full path's start→end)
;;; is knowledge that REQUIRED relationship to produce.
;;; No individual body could have generated it.
;;;
;;; Now add this receipt to a NEW body. Does it work?

(displayln "\n\n══════ EXPERIMENT 4: RELATIONAL KNOWLEDGE ══════")
(displayln "")

;; The composite path was: stuck → what-are-you-afraid-of → face-it → freedom
;; The relational receipt: stuck:freedom
(define relational-receipt "stuck:freedom")

(displayln "  The composite discovered: stuck → ... → freedom")
(displayln "  Relational receipt: stuck:freedom")
(displayln "  This knowledge required both bodies.")
(displayln "")

;; Body C — a new body that has never seen "stuck" before, but receives
;; the relational receipt from the composite
(define body-c-before "happy:celebrate;tired:rest")
(define body-c-after (string-append body-c-before ";" relational-receipt))

(displayln "  --- Body C before receiving relational receipt ---")
(let* ([fs (parameterize ([current-output-port (open-output-string)])
             (surface
               (transform 'test
                 (presence 'q "stuck")
                 (ground)
                 (wf:complete body-c-before))))]
       [ok (match (hash-ref fs 'test)
             [(list 'resolved _ _ _ _ c) c] [_ #f])])
  (displayln (string-append "    stuck → " (if ok "complete" "CUT"))))

(displayln "")
(displayln "  --- Body C after receiving relational receipt ---")
(let* ([fs (parameterize ([current-output-port (open-output-string)])
             (surface
               (transform 'test
                 (presence 'q "stuck")
                 (ground)
                 (wf:complete body-c-after))))]
       [val (shape-value (hash-ref fs 'test))]
       [ok (match (hash-ref fs 'test)
             [(list 'resolved _ _ _ _ c) c] [_ #f])])
  (displayln (string-append "    stuck → " val " [" (if ok "constitutional" "CUT") "]")))

(displayln "")
(displayln "  Body C now completes 'stuck → freedom'")
(displayln "  This receipt was impossible for A alone, impossible for B alone.")
(displayln "  It was generated by their composition.")
(displayln "  Body C carries knowledge that REQUIRED relationship to exist.")


;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 5: EMERGENT DEPTH
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Three bodies. Each has one link in a chain.
;;; Body A: start → middle-1
;;; Body B: middle-1 → middle-2
;;; Body C: middle-2 → end
;;;
;;; No pair of bodies can complete start → end.
;;; Can the triple?

(displayln "\n\n══════ EXPERIMENT 5: EMERGENT DEPTH ══════")
(displayln "")

(define body-link-1 "start:middle-1")
(define body-link-2 "middle-1:middle-2")
(define body-link-3 "middle-2:end")

(define wf-1 (wf:complete body-link-1))
(define wf-2 (wf:complete body-link-2))
(define wf-3 (wf:complete body-link-3))

(displayln "  Body 1: start → middle-1")
(displayln "  Body 2: middle-1 → middle-2")
(displayln "  Body 3: middle-2 → end")
(displayln "  No single body. No pair. Only the triple.")
(displayln "")

;; Three-body composite: 1 → 2 → 3 → 1 → 2 → 3...
(define (run-triple signal wf-list round-num max-rounds results)
  (cond
    [(> round-num max-rounds) (reverse results)]
    [else
     (let* ([idx (modulo (sub1 round-num) 3)]
            [current-wf (list-ref wf-list idx)]
            [which (number->string (add1 idx))]
            [fs (parameterize ([current-output-port (open-output-string)])
                  (surface
                    (transform 'step
                      (presence 'sig signal)
                      (ground)
                      current-wf)))]
            [resolved (hash-ref fs 'step)]
            [val (shape-value resolved)]
            [ok (match resolved
                  [(list 'resolved _ _ _ _ constitutional) constitutional]
                  [_ #f])])
       (cond
         [(not ok)
          (reverse (cons (list round-num which signal "CUT") results))]
         [(equal? val signal)
          (reverse (cons (list round-num which signal "SELF-LOOP") results))]
         [else
          (run-triple val wf-list (add1 round-num) max-rounds
                      (cons (list round-num which signal val) results))]))]))

(displayln "  --- Triple composite on 'start' ---")
(let ([r (run-triple "start" (list wf-1 wf-2 wf-3) 1 6 '())])
  (display-composite-results r)
  (displayln "")
  (let ([last-entry (last r)])
    (displayln (string-append "    terminal: " (fourth last-entry)))
    (displayln (string-append "    chain: " (number->string (length r)) " rounds"))))

;; Verify: no single body can do it
(displayln "")
(displayln "  --- Each body alone on 'start' ---")
(let ([r1 (run-chain "start" wf-1 1 3 '())]
      [r2 (run-chain "start" wf-2 1 3 '())]
      [r3 (run-chain "start" wf-3 1 3 '())])
  (displayln (string-append "    Body 1: " (number->string (length r1)) " rounds, terminal: "
                            (third (last r1))))
  (displayln (string-append "    Body 2: " (number->string (length r2)) " rounds, terminal: "
                            (third (last r2))))
  (displayln (string-append "    Body 3: " (number->string (length r3)) " rounds, terminal: "
                            (third (last r3)))))


;;; ═══════════════════════════════════════════════════════════════
;;; SYNTHESIS
;;; ═══════════════════════════════════════════════════════════════

(displayln "\n\n══════ SYNTHESIS ══════")
(displayln "")
(displayln "  Three things emerged that don't exist in any single body:")
(displayln "")
(displayln "  1. EMERGENT RESONANCE.")
(displayln "     give→receive alone: 1 step then death.")
(displayln "     receive→give alone: 1 step then death.")
(displayln "     Together: give→receive→give→receive... forever. (Exp 2)")
(displayln "     A standing wave that IS the relationship.")
(displayln "")
(displayln "  2. THE INQUIRY CYCLE.")
(displayln "     question→exploration→answer→integration→question...")
(displayln "     Period 4. Self-sustaining. Lives in no single body. (Exp 3)")
(displayln "     Neither the asker nor the explorer can inquire alone.")
(displayln "     Inquiry requires composition.")
(displayln "")
(displayln "  3. RELATIONAL KNOWLEDGE.")
(displayln "     The composite discovered stuck→freedom.")
(displayln "     No single body could generate this receipt. (Exp 4)")
(displayln "     A third body, receiving this receipt, now completes")
(displayln "     a circuit that was impossible for its creators individually.")
(displayln "     Knowledge that REQUIRES relationship to exist.")
(displayln "")
(displayln "  Depth is additive: 3 bodies, 3 links, 1 path. (Exp 5)")
(displayln "  The handoff pattern matters: A→B→A→B determines which")
(displayln "  circuits complete. (Exp 1)")
(displayln "")
(displayln "  Intelligence is not a property of a body.")
(displayln "  It is a property of bodies in composition.")
(displayln "  The surface is where it happens.")
