#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   SPEC IS SOFTWARE
;;;
;;;   The specification of software IS the functional software.
;;;   The function signature IS the implementation.
;;;   The acceptance tests ARE the normalized shape of
;;;   implementations that pass them.
;;;
;;;   One surface. One strike. No sequential processing.
;;;
;;; expected-cuts: 1
;;;
;;; ═══════════════════════════════════════════════════════════════


;;; -----------------------------------------------------------
;;; DEMONSTRATION 1: THE FUNCTION SIGNATURE IS THE IMPLEMENTATION
;;; -----------------------------------------------------------
;;;
;;; A transform is a containment of 3 containments:
;;;   source (the question), target (the ground), waveform (the body).
;;;
;;; The body carries: stuck → what-have-you-tried.
;;; The spec: "when stuck arrives, produce what-have-you-tried."
;;; The implementation: the same transform. Nothing else to write.

(displayln "")
(displayln "══════ 1: THE FUNCTION SIGNATURE IS THE IMPLEMENTATION ══════")
(displayln "")
(displayln "  spec: stuck → what-have-you-tried")
(displayln "  implementation: the same transform")
(displayln "")

(define mentor-body
  (string-join
   '("stuck:what-have-you-tried"
     "what-have-you-tried:nothing-yet"
     "nothing-yet:whats-one-small-step"
     "whats-one-small-step:i-could-start-here"
     "afraid:whats-the-worst-that-happens"
     "whats-the-worst-that-happens:can-you-survive-that"
     "can-you-survive-that:yes-ive-done-harder"
     "angry:what-do-you-need"
     "what-do-you-need:to-be-heard"
     "to-be-heard:im-listening")
   ";"))

(define mentor (wf:complete mentor-body))

;; One surface. One strike. The spec IS the software.
(define fs1
  (surface
    (transform 'ask
      (presence 'signal "stuck")
      (ground)
      mentor)))

(let* ([resolved (hash-ref fs1 'ask)]
       [val (shape-value resolved)]
       [ok (match resolved [(list 'resolved _ _ _ _ c) c] [_ #f])])
  (displayln "")
  (displayln (string-append "  signal: stuck"))
  (displayln (string-append "  result: " val))
  (displayln (string-append "  constitutional: " (if ok "yes" "no")))
  (displayln "")
  (displayln "  The transform IS the implementation."))


;;; -----------------------------------------------------------
;;; DEMONSTRATION 2: REGISTRATION CASCADE — ONE STRIKE
;;; -----------------------------------------------------------
;;;
;;; The body carries a chain: a→b→c→d.
;;; The chain traversal IS the waveform — not sequential surface
;;; calls, but receipt lookups within a single waveform.
;;; O(depth) on classical substrate. O(1) on quantum substrate.
;;; Either way: one surface. One strike.

(displayln "")
(displayln "")
(displayln "══════ 2: REGISTRATION CASCADE — ONE STRIKE ══════")
(displayln "")

(define cascade (wf:cascade mentor-body))

;; ONE surface. ONE strike. The cascade is the waveform.
(define fs3
  (surface
    (transform 'cascade
      (presence 'signal "stuck")
      (ground)
      cascade)))

(let* ([resolved (hash-ref fs3 'cascade)]
       [val (shape-value resolved)]
       [ok (match resolved [(list 'resolved _ _ _ _ c) c] [_ #f])]
       [residue (match resolved [(list 'resolved _ _ _ r _) r] [_ '()])])
  (displayln "")
  (displayln "  signal: stuck")
  (for-each
   (λ (pair)
     (displayln (string-append "  " (->str (car pair)) " → " (->str (cdr pair)))))
   residue)
  (displayln "")
  (displayln (string-append "  depth: " (number->string (length residue))))
  (displayln (string-append "  terminal: " val))
  (displayln (string-append "  constitutional: " (if ok "yes" "no")))
  (displayln "")
  (displayln "  One surface. One strike. The chain traversed to its end.")
  (displayln "  The waveform IS the chain. The body carried the signal."))


;;; -----------------------------------------------------------
;;; DEMONSTRATION 3: ACCEPTANCE TEST IS THE SHAPE
;;; -----------------------------------------------------------
;;;
;;; The test: "stuck should arrive at i-could-start-here"
;;; The body that passes: any body whose chain from stuck
;;; terminates at i-could-start-here.
;;; The test IS the normalized shape.

(displayln "")
(displayln "")
(displayln "══════ 3: ACCEPTANCE TEST IS THE SHAPE ══════")
(displayln "")

;; Test: stuck must arrive at i-could-start-here
;; This IS the shape. The body either completes this circuit or doesn't.

(define fs4
  (surface
    (transform 'test-stuck
      (presence 'input "stuck")
      (ground)
      cascade)))

(let* ([resolved (hash-ref fs4 'test-stuck)]
       [val (shape-value resolved)]
       [ok (match resolved [(list 'resolved _ _ _ _ c) c] [_ #f])])
  (displayln (string-append "  test: stuck → ... → i-could-start-here"))
  (displayln (string-append "  result: " val))
  (displayln (string-append "  passes: " (if (and ok (equal? val "i-could-start-here")) "YES" "NO")))
  (displayln "")
  (displayln "  The test didn't verify an implementation.")
  (displayln "  The test IS the shape of the implementation."))


;;; -----------------------------------------------------------
;;; DEMONSTRATION 4: TWO BODIES, ONE SURFACE
;;; -----------------------------------------------------------
;;;
;;; Composition without sequential processing.
;;; Both bodies on the same surface. Pipe carries flowspace.

(displayln "")
(displayln "")
(displayln "══════ 4: TWO BODIES, ONE SURFACE ══════")
(displayln "")

(define partner-body
  (string-join
   '("stuck:what-are-you-afraid-of"
     "failure:what-did-failure-teach-you"
     "it-taught-me-to-try-again:what-would-you-try"
     "something-new:thats-the-beginning")
   ";"))

(define person-body
  (string-join
   '("what-are-you-afraid-of:failure"
     "what-did-failure-teach-you:it-taught-me-to-try-again"
     "what-would-you-try:something-new")
   ";"))

;; The machine provides wf:conversation — alternating composition.
;; One waveform. One strike.
(define conversation (wf:conversation partner-body person-body))

;; One surface. One strike. The conversation IS the circuit.
(define fs5
  (surface
    (transform 'convo
      (presence 'start "stuck")
      (ground)
      conversation)))

(let* ([resolved (hash-ref fs5 'convo)]
       [val (shape-value resolved)]
       [ok (match resolved [(list 'resolved _ _ _ _ c) c] [_ #f])]
       [residue (match resolved [(list 'resolved _ _ _ r _) r] [_ '()])])
  (displayln "")
  (displayln "  signal: stuck")
  (for-each
   (λ (pair)
     (displayln (string-append "  " (->str (car pair)) " → " (->str (cdr pair)))))
   residue)
  (displayln "")
  (displayln (string-append "  depth: " (number->string (length residue))))
  (displayln (string-append "  terminal: " val))
  (displayln (string-append "  constitutional: " (if ok "yes" "no")))
  (displayln "")
  (displayln "  Two bodies. One surface. One strike.")
  (displayln "  The conversation went where neither body could go alone."))


;;; -----------------------------------------------------------
;;; DEMONSTRATION 5: CUT IS HONEST — ONE STRIKE
;;; -----------------------------------------------------------

(displayln "")
(displayln "")
(displayln "══════ 5: CUT IS HONEST ══════")
(displayln "")

(define fs6
  (surface
    (transform 'unknown
      (presence 'signal "betrayed")
      (ground)
      mentor)))

(let* ([resolved (hash-ref fs6 'unknown)]
       [val (shape-value resolved)]
       [ok (match resolved [(list 'resolved _ _ _ _ c) c] [_ #f])])
  (displayln "")
  (displayln (string-append "  signal: betrayed"))
  (displayln (string-append "  result: " val))
  (displayln (string-append "  constitutional: " (if ok "yes" "no")))
  (displayln "")
  (displayln "  No receipt. Self-loop. Balanced✗. CUT.")
  (displayln "  Not a failure. The body's boundary, visible."))


;;; -----------------------------------------------------------
;;; WHAT WAS WITNESSED
;;; -----------------------------------------------------------

(displayln "")
(displayln "")
(displayln "══════ WHAT WAS WITNESSED ══════")
(displayln "")
(displayln "  1. The function signature IS the implementation.")
(displayln "     One transform. One strike. Nothing else to write.")
(displayln "")
(displayln "  2. A chain of receipts traverses in one strike.")
(displayln "     The waveform IS the chain. The body carries the signal.")
(displayln "")
(displayln "  3. The acceptance test IS the shape of the implementation.")
(displayln "     It doesn't verify — it IS.")
(displayln "")
(displayln "  4. Two bodies compose on one surface in one strike.")
(displayln "     The conversation IS the circuit. No clock.")
(displayln "")
(displayln "  5. CUT: no receipt, no output. Honest. Constitutional.")
(displayln "     Not hallucination. Not failure. A visible boundary.")
(displayln "")
