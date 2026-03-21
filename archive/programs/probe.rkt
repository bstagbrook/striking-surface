#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   PROBE — the integral experience
;;;
;;;   This program demonstrates what happens when a signal
;;;   enters a body. Run it with YOUR word:
;;;
;;;     racket programs/probe.rkt stuck
;;;     racket programs/probe.rkt afraid
;;;     racket programs/probe.rkt <anything>
;;;
;;;   What you choose determines what happens.
;;;   What the body carries determines where it goes.
;;;   Where the body CUTs is where the next receipt belongs.
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════


;;; -----------------------------------------------------------
;;; THE BODY — 29 receipts, a mentor's experience
;;; -----------------------------------------------------------

(define body-string
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
     "to-be-heard:im-listening"
     "overwhelmed:one-thing-at-a-time"
     "one-thing-at-a-time:which-one-matters-most"
     "which-one-matters-most:this-one"
     "this-one:then-start-there"
     "lost:where-were-you-before-you-got-lost"
     "where-were-you-before-you-got-lost:i-was-here"
     "i-was-here:then-you-know-the-way-back"
     "grieving:im-here"
     "im-here:you-dont-have-to-talk"
     "celebrating:savor-it"
     "savor-it:what-made-this-possible"
     "what-made-this-possible:i-did"
     "ashamed:you-are-not-what-happened-to-you"
     "you-are-not-what-happened-to-you:who-are-you-then"
     "who-are-you-then:still-finding-out"
     "procrastinating:what-are-you-avoiding"
     "what-are-you-avoiding:the-hard-part"
     "the-hard-part:whats-the-first-move"
     "whats-the-first-move:just-start")
   ";"))

(define body-wf (wf:complete body-string))


;;; -----------------------------------------------------------
;;; TRAVERSE — the signal enters, the body does the rest
;;; -----------------------------------------------------------

(define (traverse signal wf depth max-depth path)
  (cond
    [(> depth max-depth) (reverse path)]
    [else
     (let* ([fs (parameterize ([current-output-port (open-output-string)])
                  (surface
                    (transform 'step
                      (presence 'sig signal)
                      (ground)
                      wf)))]
            [resolved (hash-ref fs 'step)]
            [val (shape-value resolved)]
            [ok (match resolved
                  [(list 'resolved _ _ _ _ constitutional) constitutional]
                  [_ #f])])
       (cond
         [(not ok)
          (reverse (cons (list signal #f) path))]
         [(equal? val signal)
          (reverse (cons (list signal #f) path))]
         [else
          (traverse val wf (add1 depth) max-depth
                    (cons (list signal val) path))]))]))


;;; -----------------------------------------------------------
;;; THE SIGNAL — from you
;;; -----------------------------------------------------------

(define user-signal
  (cond
    [(> (vector-length (current-command-line-arguments)) 0)
     (vector-ref (current-command-line-arguments) 0)]
    [else "stuck"]))


;;; -----------------------------------------------------------
;;; STRIKE
;;; -----------------------------------------------------------

(displayln "")

(let* ([path (traverse user-signal body-wf 1 20 '())]
       [completed (filter (λ (p) (second p)) path)]
       [terminal (last path)]
       [cut? (not (second terminal))]
       [terminal-signal (first terminal)])

  ;; Show the traversal
  (for-each
   (λ (step)
     (if (second step)
         (displayln (string-append "  " (first step) " → " (second step)))
         (void)))
   path)

  ;; Show what happened
  (cond
    ;; CUT on the first signal — unknown
    [(and cut? (= (length completed) 0))
     (displayln (string-append "  " terminal-signal))
     (displayln "  ·")
     (displayln "")
     (displayln (string-append "  The body has no receipt for '" terminal-signal "'."))
     (displayln "  This is not a failure. This is where the body's knowledge ends.")
     (displayln "  This is where the next receipt belongs.")]

    ;; CUT after some traversal — reached the boundary
    [cut?
     (displayln "")
     (displayln (string-append "  → " terminal-signal))
     (displayln "  ·")
     (displayln "")
     (displayln (string-append "  " (number->string (length completed))
                               " registrations. Arrived at '" (second (last completed)) "'."))
     (displayln (string-append "  The body then reached '" terminal-signal
                               "' — no receipt for it."))
     (displayln "  The journey continued until the body's knowledge ended.")]

    ;; Shouldn't happen with current bodies (no infinite loops)
    [else
     (displayln "")
     (displayln (string-append "  " (number->string (length completed)) " registrations."))])

  (displayln "")

  ;; Show what the body grew FROM
  (cond
    [(> (length completed) 0)
     (let* ([start (first (first completed))]
            [end (second (last completed))])
       (displayln (string-append "  Your signal '" user-signal "' entered."))
       (displayln (string-append "  The body traversed to '" end "'."))
       (displayln "  You didn't arrive there because someone told you to.")
       (displayln "  The body carried you.")
       (displayln "")
       (displayln "  Try a different word. See where the body goes.")
       (displayln "  The body doesn't change. Your signal does."))]
    [else
     (displayln "  Try: stuck, afraid, angry, overwhelmed, lost,")
     (displayln "       grieving, celebrating, ashamed, procrastinating")
     (displayln "")
     (displayln "  Or try any word. CUT is honest. CUT is a port.")
     (displayln "  The body's boundary is visible — not hidden.")])

  (displayln ""))
