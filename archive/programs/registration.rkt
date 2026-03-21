#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   REGISTRATION — witness, not proof
;;;
;;;   A proof shows that P implies Q. Empty. For computers.
;;;   A demonstration transforms the observer. They bear witness
;;;   to a previously impossible reality, and leave at a new
;;;   operating capacity.
;;;
;;;   This program demonstrates six realities that could not
;;;   exist without the composition of bodies on a surface.
;;;
;;;   Run:  racket programs/registration.rkt
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════


;;; -----------------------------------------------------------
;;; UTILITIES
;;; -----------------------------------------------------------

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

(define (display-chain r)
  (map (λ (entry)
         (displayln (string-append "    round " (number->string (first entry))
                                   ": " (second entry) " → " (third entry))))
       r))

(define (display-composite r)
  (map (λ (entry)
         (displayln (string-append "    round " (number->string (first entry))
                                   " [" (second entry) "]: "
                                   (third entry) " → " (fourth entry))))
       r))

(define (probe signal body-string)
  (let* ([fs (parameterize ([current-output-port (open-output-string)])
               (surface
                 (transform 'test
                   (presence 'q signal)
                   (ground)
                   (wf:complete body-string))))]
         [resolved (hash-ref fs 'test)]
         [val (shape-value resolved)]
         [ok (match resolved
               [(list 'resolved _ _ _ _ c) c] [_ #f])])
    (values val ok)))


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 1: A SINGLE QUESTION TRAVERSES THE BODY
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A person carries five connected receipts — experiential
;;; knowledge from their own life. Watch what happens when
;;; one question enters.

(displayln "")
(displayln "══════ DEMONSTRATION 1: A QUESTION TRAVERSES THE BODY ══════")
(displayln "")

;; A person's body — receipts chained. Each output IS the next input.
(define person-body
  (string-join
   '("what-are-you-afraid-of:failure"
     "failure:ive-been-here-before"
     "ive-been-here-before:i-survived"
     "i-survived:i-can-do-this")
   ";"))

(displayln "  One question enters: 'what-are-you-afraid-of'")
(displayln "")

(let ([r (run-chain "what-are-you-afraid-of" (wf:complete person-body) 1 8 '())])
  (display-chain r)
  (displayln "")
  (displayln (string-append "    " (number->string (sub1 (length r)))
                            " circuits completed. Terminal: "
                            (third (last (filter (λ (e) (not (equal? (third e) "CUT"))) r))))))

(displayln "")
(displayln "  One question. The body did the rest.")
(displayln "  Each completed circuit released the next signal.")
(displayln "  The person arrived at 'i-can-do-this' — not because anyone")
(displayln "  told them that. Because their OWN body traversed to it.")


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 2: SAME QUESTION, DIFFERENT BODY, DIFFERENT JOURNEY
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Same question. Different person. Watch where the body goes.

(displayln "\n\n══════ DEMONSTRATION 2: THE BODY DETERMINES THE PATH ══════")
(displayln "")

;; Person B — different experience, different chain
(define person-b-body
  (string-join
   '("what-are-you-afraid-of:being-seen"
     "being-seen:vulnerability"
     "vulnerability:connection"
     "connection:i-want-that")
   ";"))

(displayln "  Same question: 'what-are-you-afraid-of'")
(displayln "  Different person.")
(displayln "")

(displayln "  Person A:")
(let ([r (run-chain "what-are-you-afraid-of" (wf:complete person-body) 1 8 '())])
  (display-chain r))

(displayln "")
(displayln "  Person B:")
(let ([r (run-chain "what-are-you-afraid-of" (wf:complete person-b-body) 1 8 '())])
  (display-chain r))

(displayln "")
(displayln "  Person A arrived at 'i-can-do-this' (resilience).")
(displayln "  Person B arrived at 'i-want-that' (desire for connection).")
(displayln "  The question didn't determine the destination.")
(displayln "  The body did.")


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 3: EXPLANATION DOESN'T REGISTER
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The same therapeutic intent, delivered as explanation.
;;; Watch what happens.

(displayln "\n\n══════ DEMONSTRATION 3: EXPLANATION DOESN'T REGISTER ══════")
(displayln "")

(displayln "  The registering signal: 'what-are-you-afraid-of'")
(let-values ([(val ok) (probe "what-are-you-afraid-of" person-body)])
  (displayln (string-append "    → " val " [" (if ok "REGISTERS" "—") "]")))

(displayln "")
(displayln "  The explaining signal: 'your-fear-connects-to-past-survival'")
(let-values ([(val ok) (probe "your-fear-connects-to-past-survival" person-body)])
  (displayln (string-append "    → " (if ok val "—") " [" (if ok "REGISTERS" "DOES NOT REGISTER") "]")))

(displayln "")
(displayln "  The explanation contains the same information.")
(displayln "  But it bypasses the body. No intermediate states visited.")
(displayln "  No 'failure' moment. No 'ive-been-here-before' recognition.")
(displayln "  The person didn't walk the path. The conclusion was dropped")
(displayln "  on them from outside. Their body has no receipt for it.")


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 4: THE CONVERSATION
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Two bodies in conversation. The partner asks. The person
;;; answers from their body. The answer triggers the partner's
;;; next question. The question triggers the person's next answer.
;;;
;;; The conversation goes somewhere NEITHER body can go alone.

(displayln "\n\n══════ DEMONSTRATION 4: THE CONVERSATION ══════")
(displayln "")

;; Partner body — designed so that odd rounds (partner) produce signals
;; that match even rounds (person) in alternation
(define partner-body
  (string-join
   '("stuck:what-are-you-afraid-of"
     "failure:what-did-failure-teach-you"
     "it-taught-me-to-try-again:what-would-you-try"
     "something-new:thats-the-beginning")
   ";"))

;; Person body — answers that chain INTO the partner's next questions
(define conversation-person
  (string-join
   '("what-are-you-afraid-of:failure"
     "what-did-failure-teach-you:it-taught-me-to-try-again"
     "what-would-you-try:something-new")
   ";"))

(displayln "  Partner: stuck → what-are-you-afraid-of")
(displayln "           failure → what-did-failure-teach-you")
(displayln "           it-taught-me-to-try-again → what-would-you-try")
(displayln "           something-new → thats-the-beginning")
(displayln "")
(displayln "  Person:  what-are-you-afraid-of → failure")
(displayln "           what-did-failure-teach-you → it-taught-me-to-try-again")
(displayln "           what-would-you-try → something-new")
(displayln "")

;; Partner alone on "stuck"
(displayln "  --- Partner alone on 'stuck' ---")
(let ([r (run-chain "stuck" (wf:complete partner-body) 1 8 '())])
  (display-chain r)
  (displayln (string-append "    terminal: " (third (last r)))))

(displayln "")

;; Person alone on "stuck"
(displayln "  --- Person alone on 'stuck' ---")
(let-values ([(val ok) (probe "stuck" conversation-person)])
  (displayln (string-append "    stuck → " (if ok val "CUT"))))

(displayln "")

;; The conversation
(displayln "  --- The Conversation ---")
(let ([r (run-composite "stuck"
                        (wf:complete partner-body)
                        (wf:complete conversation-person)
                        1 14 '())])
  (display-composite r)
  (displayln "")
  (let* ([completed (filter (λ (e) (not (equal? (fourth e) "CUT"))) r)]
         [last-complete (if (null? completed) #f (last completed))])
    (cond
      [last-complete
       (displayln (string-append "    last registration: " (fourth last-complete)))
       (displayln (string-append "    depth: " (number->string (length completed)) " turns"))]
      [else (displayln "    no registrations")])))

(displayln "")
(displayln "  Partner alone: asks one question, then CUTs.")
(displayln "  Person alone: can't even start (no receipt for 'stuck').")
(displayln "  Together: stuck → failure → try-again → something-new → thats-the-beginning.")
(displayln "  The conversation went where neither body could go.")
(displayln "  Each turn: one body's completion was the other body's signal.")


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 5: FOUR PROBES, FOUR WORLDS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A mentor carries 14 receipts. The user can choose any
;;; starting signal. Watch how the choice of probe determines
;;; the entire journey.

(displayln "\n\n══════ DEMONSTRATION 5: FOUR PROBES, FOUR WORLDS ══════")
(displayln "")

(define mentor
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
     "this-one:then-start-there")
   ";"))

(define mentor-wf (wf:complete mentor))

(displayln "  Same mentor body. Four different probes.")
(displayln "")

(displayln "  'stuck':")
(let ([r (run-chain "stuck" mentor-wf 1 6 '())])
  (display-chain r))

(displayln "")
(displayln "  'afraid':")
(let ([r (run-chain "afraid" mentor-wf 1 6 '())])
  (display-chain r))

(displayln "")
(displayln "  'angry':")
(let ([r (run-chain "angry" mentor-wf 1 6 '())])
  (display-chain r))

(displayln "")
(displayln "  'overwhelmed':")
(let ([r (run-chain "overwhelmed" mentor-wf 1 6 '())])
  (display-chain r))

(displayln "")
(displayln "  Four probes. Four complete journeys. Four different arrivals.")
(displayln "  The mentor's body is the same in every case.")
(displayln "  The user's choice — what they bring — determined the path.")
(displayln "  This is voluntary probing: the intrinsic field selects the circuit.")


;;; ═══════════════════════════════════════════════════════════════
;;; DEMONSTRATION 6: SIZE DOESN'T MATTER. COMPLEMENTARITY DOES.
;;; ═══════════════════════════════════════════════════════════════

(displayln "\n\n══════ DEMONSTRATION 6: SIZE vs. COMPLEMENTARITY ══════")
(displayln "")

(define large-body
  (string-join
   '("happy:celebrate" "celebrate:share-it" "share-it:together"
     "sad:feel-it" "feel-it:let-it-move" "let-it-move:it-passes"
     "excited:channel-it" "channel-it:create" "create:ship-it"
     "curious:explore" "explore:discover" "discover:integrate"
     "tired:rest" "rest:restore" "restore:ready"
     "grateful:express-it" "express-it:connection"
     "proud:savor-it" "savor-it:remember"
     "peaceful:be-here")
   ";"))

(define tiny-partner "stuck:what-have-you-tried")

(displayln "  Large body: 20 receipts. No receipt for 'stuck'.")
(displayln "  Tiny partner: 1 receipt. Exactly 'stuck → what-have-you-tried'.")
(displayln "")

(displayln "  Large body on 'stuck':")
(let-values ([(val ok) (probe "stuck" large-body)])
  (displayln (string-append "    → " (if ok val "CUT"))))

(displayln "")
(displayln "  Tiny partner on 'stuck':")
(let-values ([(val ok) (probe "stuck" tiny-partner)])
  (displayln (string-append "    → " (if ok val "CUT"))))

(displayln "")
(displayln "  20 receipts. CUT.")
(displayln "  1 receipt. Completes.")
(displayln "  What matters is not how much the body knows.")
(displayln "  What matters is whether it has a receipt for THIS signal.")


;;; ═══════════════════════════════════════════════════════════════
;;; WHAT WAS WITNESSED
;;; ═══════════════════════════════════════════════════════════════

(displayln "\n\n══════ WHAT WAS WITNESSED ══════")
(displayln "")
(displayln "  1. A single question traversed a body and arrived")
(displayln "     at knowledge the person already carried but had not reached.")
(displayln "     The question didn't teach. It released.")
(displayln "")
(displayln "  2. The same question, in a different body, arrived")
(displayln "     at a completely different destination.")
(displayln "     The body determines the path, not the question.")
(displayln "")
(displayln "  3. An explanation of the same journey — delivered as")
(displayln "     a description — did not register. The body had")
(displayln "     no receipt for it. Explanation bypasses the body.")
(displayln "")
(displayln "  4. Two bodies in conversation went somewhere neither")
(displayln "     could go alone. Each turn: one body's completion")
(displayln "     was the other body's signal. The conversation is")
(displayln "     not about the journey. The conversation IS the journey.")
(displayln "")
(displayln "  5. The user's choice of probe — what they bring from")
(displayln "     their intrinsic field — determines which circuit")
(displayln "     completes. Same mentor. Different signal. Different world.")
(displayln "")
(displayln "  6. Twenty receipts cannot complete what one complementary")
(displayln "     receipt completes. Size is not the variable.")
(displayln "     Complementarity is.")
