#lang racket

;;; ===========================================================
;;; THE STRIKING SURFACE — FRAME
;;;
;;; Alphabet: ( )
;;;
;;; ()       presence    — is
;;; (())     containment — has
;;; ((())(())(()))  transformation — does
;;;
;;; No clock. One shape in, one shape out.
;;; The s-expression IS the Dyck word.
;;; ===========================================================

(provide strike resolve ->str)

(define (->str v)
  (cond
    [(string? v) v]
    [(symbol? v) (symbol->string v)]
    [(number? v) (number->string v)]
    [(null? v) "()"]
    [else (~a v)]))

;; Strike: one shape in, one shape out.
;; The shape is an s-expression. The result is its resolved form.
(define (strike shape)
  (let ([result (resolve shape)])
    (displayln result)
    result))

;; Resolve: structural dispatch on shape.
;; Not a loop. Pattern match on what the shape IS.
(define (resolve shape)
  (cond
    ;; Presence — is itself
    [(symbol? shape) shape]
    [(string? shape) shape]
    [(number? shape) shape]
    [(null? shape) shape]

    ;; Transformation — (label (source) (target) (pairs))
    ;; One lookup per pair. The residue is the collapsed shape.
    [(and (list? shape) (= (length shape) 4)
          (symbol? (first shape))
          (list? (second shape))
          (list? (third shape))
          (list? (fourth shape)))
     (let* ([label (first shape)]
            [src (resolve (second shape))]
            [tgt (resolve (third shape))]
            [pairs (fourth shape)]
            ;; Trace from the source presence.
            ;; If source is a single-element containment, trace its content.
            ;; If source is a symbol/atom, trace it directly.
            ;; If source has multiple elements, trace the first.
            [seed (cond [(not (list? src)) src]
                        [(null? src) src]
                        [(= (length src) 1) (first src)]
                        [else (first src)])]
            [residue (trace seed pairs)])
       (list label src tgt residue))]

    ;; Containment — resolve contents
    [(list? shape)
     (map resolve shape)]

    [else shape]))

;; Trace: source + pairs → residue
;; Pairs are the superposition. Trace collapses it.
(define (trace src pairs)
  (let ([step (assoc (->str src) (map (λ (p) (cons (->str (car p)) (cdr p))) pairs))])
    (if (not step) '()
        (let ([from (->str src)] [to (->str (cdr step))])
          (cons (cons from to)
                (trace (cdr step)
                       (filter (λ (p) (not (equal? (->str (car p)) from))) pairs)))))))
