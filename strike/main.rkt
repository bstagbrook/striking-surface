#lang racket/base

;;; ═══════════════════════════════════════════════════════════════
;;; THE STRIKING SURFACE — SUBSTRATE
;;;
;;; This file IS the breadboard. It uses Racket keywords because
;;; it IS the substrate — the frame, the ground. Programs written
;;; in #lang strike use ZERO Racket keywords. They are pure
;;; s-expressions. One per file. One shape. One strike.
;;;
;;; Alphabet:
;;;   (   — continue / step-up / creation / open
;;;   )   — complete / step-down / fulfillment / close
;;;
;;; Two primitives:
;;;   ( )    — presence / is-thing / empty-list / empty-set
;;;   (( ))  — containment / has-thing / list-containing-empty-list
;;;
;;; Labels: countably infinite set of alpha-normalizing,
;;;         beta-reducing labels. One per contextual use of a shape.
;;;
;;; Transformation: containment of three containments.
;;;   ( (()) (()) (()) )  — input, output, vacuum tube
;;;   With a label: (label (source) (target) (pairs))
;;;   The vacuum tube holds (key . value) pairs — the superposition.
;;;   Strike traces the chain from source through pairs.
;;;   The chain IS the residue. The residue IS the receipt.
;;;
;;; Nesting: inner shapes resolve before outer shapes.
;;;   Depth IS propagation. Not time. Not sequence.
;;;   This is the Tesla mechanism: one strike, unbounded depth.
;;;
;;; #lang strike IS the spark gap. Hit Run. The shape resolves.
;;; ═══════════════════════════════════════════════════════════════

(require racket/list)

(provide (rename-out [strike-module-begin #%module-begin])
         #%app #%datum #%top
         resolve ->str)

;;; ─── ->str ─────────────────────────────────────────────────
;;; Shape to string for trace key matching.

(define (->str v)
  (cond
    [(string? v) v]
    [(symbol? v) (symbol->string v)]
    [(number? v) (number->string v)]
    [(null? v) "()"]
    [else (format "~a" v)]))

;;; ─── resolve ───────────────────────────────────────────────
;;; Structural dispatch on what the shape IS.
;;; Presence → itself. Transformation → trace. Containment → resolve contents.

(define (resolve shape)
  (cond
    [(symbol? shape) shape]
    [(string? shape) shape]
    [(number? shape) shape]
    [(null? shape) shape]

    ;; Transformation: (label (source) (target) (pairs))
    [(and (list? shape) (= (length shape) 4)
          (symbol? (first shape))
          (list? (second shape))
          (list? (third shape))
          (list? (fourth shape)))
     (let* ([label (first shape)]
            [src (resolve (second shape))]
            [tgt (resolve (third shape))]
            [pairs (fourth shape)]
            ;; Seed extraction: what does the outer circuit see?
            ;; - Atom → itself
            ;; - Null → itself
            ;; - Single-element containment → unwrap, then:
            ;;   - If unwrapped is a resolved transform (label src tgt residue),
            ;;     the seed is the LABEL. Other circuits reference by label.
            ;;   - Otherwise the unwrapped element itself.
            ;; - Multi-element → first element (same label logic)
            [unwrapped (cond [(not (list? src)) src]
                             [(null? src) src]
                             [(= (length src) 1) (first src)]
                             [else (first src)])]
            [seed (if (and (list? unwrapped)
                           (>= (length unwrapped) 1)
                           (symbol? (first unwrapped)))
                      (first unwrapped)
                      unwrapped)]
            [residue (trace seed pairs)])
       (list label src tgt residue))]

    ;; Containment: resolve contents
    [(list? shape)
     (map resolve shape)]

    [else shape]))

;;; ─── trace ─────────────────────────────────────────────────
;;; Walk the collapse chain. Source matches key → value becomes
;;; next source. Chain terminates when no key matches.
;;; The accumulated steps ARE the residue.

(define (trace src pairs)
  ;; Filter to only actual dotted pairs (not lists, not atoms, not null)
  (let* ([real-pairs (filter (λ (p) (and (pair? p) (not (list? p)))) pairs)]
         [step (assoc (->str src)
                      (map (λ (p) (cons (->str (car p)) (cdr p))) real-pairs))])
    (if (not step) '()
        (let ([from (->str src)] [to (->str (cdr step))])
          (cons (cons from to)
                (trace (cdr step)
                       (filter (λ (p) (not (equal? (->str (car p)) from)))
                               real-pairs)))))))

;;; ─── strike-module-begin: the spark gap ────────────────────
;;; #lang strike reads the file. This fires once. The shape resolves.

(define-syntax-rule (strike-module-begin expr ...)
  (#%plain-module-begin
   (let ([results (list (resolve 'expr) ...)])
     (for-each displayln results))))
