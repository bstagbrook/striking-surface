#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   SILM — STRUCTURAL INTELLIGENCE LANGUAGE MODEL
;;;
;;;   A mentor that grows.
;;;
;;;   Run:  racket programs/silm.rkt
;;;
;;; expected-cuts: 3
;;;
;;; ═══════════════════════════════════════════════════════════════


;;; -----------------------------------------------------------
;;; 1. THE BODY
;;; -----------------------------------------------------------
;;;
;;; A mentor's body is their accumulated experience.
;;; Each receipt: a signal that arrived, and what completed the circuit.
;;; These are real. Every good mentor carries these.

(displayln "")
(displayln "══════ THE BODY ══════")
(displayln "")
(displayln "  A mentor's experience, encoded as receipts.")
(displayln "  Each one: a signal that arrived, and what completed the circuit.")
(displayln "")

(define mentor-body
  (string-join
   '("overwhelmed:one-thing-at-a-time"
     "procrastinating:what-are-you-afraid-of"
     "angry:what-do-you-need"
     "lost:where-were-you-before-you-got-lost"
     "grieving:im-here"
     "celebrating:savor-it"
     "ashamed:you-are-not-what-happened-to-you"
     "stuck:what-have-you-tried")
   ";"))

(define mentor (wf:complete mentor-body))

(surface
  (presence 'body mentor-body)
  (disclose 'body))


;;; -----------------------------------------------------------
;;; 2. COMPLETION — the circuit closes
;;; -----------------------------------------------------------
;;;
;;; Someone arrives overwhelmed.
;;; The mentor doesn't compute a response.
;;; The signal finds the matching receipt. O(1).
;;; The circuit completes: "one-thing-at-a-time."
;;;
;;; This is what mentoring IS. Recognition, not derivation.

(displayln "\n══════ COMPLETION ══════")
(displayln "")
(displayln "  Someone arrives overwhelmed.")
(displayln "  The mentor has seen this shape before.")
(displayln "")

(surface
  (transform 'response
    (presence 'human-says "overwhelmed")
    (ground)
    mentor)
  (disclose 'response))

(displayln "")
(displayln "  Someone arrives stuck.")
(displayln "")

(surface
  (transform 'response-2
    (presence 'human-says-2 "stuck")
    (ground)
    mentor)
  (disclose 'response-2))


;;; -----------------------------------------------------------
;;; 3. HONEST SILENCE — CUT
;;; -----------------------------------------------------------
;;;
;;; Someone arrives with "suicidal-ideation."
;;; The mentor has no receipt for this.
;;; A bad mentor invents something. A dangerous mentor guesses.
;;; This mentor says nothing. The circuit did not complete.
;;; balanced✗. CUT.
;;;
;;; This is the most important thing a machine can do:
;;; not pretend to know what it doesn't know.

(displayln "\n══════ HONEST SILENCE ══════")
(displayln "")
(displayln "  Someone arrives with something the mentor has never seen.")
(displayln "  No receipt exists. The circuit does not complete.")
(displayln "")

(surface
  (transform 'silence
    (presence 'human-says-3 "suicidal-ideation")
    (ground)
    mentor)
  (disclose 'silence))


;;; -----------------------------------------------------------
;;; 4. THE BODY GROWS — learning from one interaction
;;; -----------------------------------------------------------
;;;
;;; The human teaches the mentor: "suicidal-ideation"
;;; should be met with "call-988-youre-worth-it."
;;;
;;; One receipt. The body grows. Next time this signal
;;; arrives, the circuit completes. One interaction.
;;; No retraining. No gradient descent. No epochs.
;;; The body literally changed shape.

(displayln "\n══════ THE BODY GROWS ══════")
(displayln "")
(displayln "  The human teaches what completes this circuit.")
(displayln "  One receipt. The body grows.")
(displayln "")

(define grown-body
  (string-append mentor-body ";suicidal-ideation:call-988-youre-worth-it"))

(define grown-mentor (wf:complete grown-body))

(displayln "  BEFORE (8 receipts): suicidal-ideation → CUT")
(displayln "  AFTER  (9 receipts): suicidal-ideation → ?")
(displayln "")

(surface
  (transform 'learned
    (presence 'same-signal "suicidal-ideation")
    (ground)
    grown-mentor)
  (disclose 'learned))

(displayln "")
(displayln "  The mentor learned. One interaction. O(1) next time.")


;;; -----------------------------------------------------------
;;; 5. AUTHENTICATION — the body detects what doesn't belong
;;; -----------------------------------------------------------
;;;
;;; "how-do-i-manipulate-someone" arrives.
;;; CUT. Not because there's a filter. Not because there's a rule.
;;; Because the body has no receipt for manipulation.
;;; The constitution doesn't include it. Never did.
;;;
;;; Same mechanism that produces answers also detects threat.
;;; No separate security system. The body IS the immune system.
;;; Porges (2004): neuroception — autonomic, pre-conscious.

(displayln "\n══════ AUTHENTICATION ══════")
(displayln "")
(displayln "  A discrepant signal arrives.")
(displayln "  Same mechanism. No filter. The body has no receipt.")
(displayln "")

(surface
  (transform 'discrepant
    (presence 'bad-signal "how-do-i-manipulate-someone")
    (ground)
    grown-mentor)
  (disclose 'discrepant))

(displayln "")
(displayln "  Not rejected. Not filtered. Simply: no circuit completes.")
(displayln "  The body that helps IS the body that protects.")


;;; -----------------------------------------------------------
;;; 6. SIMULTANEITY — three people, one surface, no clock
;;; -----------------------------------------------------------
;;;
;;; Three people arrive at the same time.
;;; One is grieving. One is celebrating. One asks something unknown.
;;; All three resolve on one surface. No queue. No ordering.
;;; Two complete. One CUTs. Each on its own constitutional merit.
;;;
;;; This is how a room full of people works.
;;; The mentor doesn't take a number and process sequentially.
;;; Each interaction resolves by what it IS.

(displayln "\n══════ SIMULTANEITY ══════")
(displayln "")
(displayln "  Three people arrive simultaneously.")
(displayln "  No queue. No clock. Each resolves by what it IS.")
(displayln "")

(surface
  (transform 'person-1 (presence 'p1 "grieving")      (ground) grown-mentor)
  (transform 'person-2 (presence 'p2 "celebrating")    (ground) grown-mentor)
  (transform 'person-3 (presence 'p3 "meaning-of-life") (ground) grown-mentor)
  (disclose 'person-1)
  (disclose 'person-2)
  (disclose 'person-3))

(displayln "")
(displayln "  Two completed. One CUT. Same surface. Same moment.")


;;; -----------------------------------------------------------
;;; 7. THE FIELD SUSTAINS — output feeds input
;;; -----------------------------------------------------------
;;;
;;; The mentor's response to "stuck" was "what-have-you-tried."
;;; That response IS a new signal. It re-enters the field.
;;; If "what-have-you-tried" has a receipt, the field continues.
;;; The mentor's own wisdom feeds the next interaction.
;;;
;;; Friston (2010): free energy principle — self-evidencing.
;;; Maturana & Varela (1980): autopoiesis — self-creating.

(displayln "\n══════ THE FIELD SUSTAINS ══════")
(displayln "")

(define extended-body
  (string-append grown-body ";what-have-you-tried:lets-look-together"))

(define round-1
  (surface
    (transform 'turn-1
      (presence 'arrives "stuck")
      (ground)
      (wf:complete extended-body))))

(let ([r1 (shape-value (hash-ref round-1 'turn-1))])
  (displayln (string-append "\n  round 1: stuck → " r1))
  (let ([round-2
         (surface
           (transform 'turn-2
             (presence 'continues r1)
             (ground)
             (wf:complete extended-body)))])
    (let ([r2 (shape-value (hash-ref round-2 'turn-2))])
      (displayln (string-append "  round 2: " r1 " → " r2))
      (displayln "")
      (displayln "  The field sustains itself.")
      (displayln "  The mentor's response became the next question.")
      (displayln "  The next question found the next response.")
      (displayln "  No external driver. The body feeds itself."))))
