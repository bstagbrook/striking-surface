#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   PAN-MEDIA — FUNCTIONALITY ON DEMAND
;;;
;;;   The surface doesn't care what the waveform does.
;;;   It only cares that the residue is constitutional.
;;;   Register a waveform for any media type. The surface
;;;   resolves it the same way. Pan-media = register on demand.
;;;
;;;   Functionality on demand = registration of new transforms.
;;;   This IS continuations. One concept, two labels.
;;;
;;; ═══════════════════════════════════════════════════════════════

(displayln "══════ PAN-MEDIA — FUNCTIONALITY ON DEMAND ══════\n")


;;; -----------------------------------------------------------
;;; MEDIA TYPE 1: TEXT — tokenization
;;; -----------------------------------------------------------
;;;
;;; A waveform that splits text into tokens (words).
;;; Each step: remove one word from the end.
;;; Residue: chain from full text to single word to ground.

(define (wf:tokenize source target)
  (let ([words (string-split (->str source))])
    (tokenize-chain words)))

(define (tokenize-chain words)
  (match words
    ['() '()]
    [(list w) (list (cons w "e"))]
    [_ (let ([current (string-join words " ")]
             [next (string-join (reverse (cdr (reverse words))) " ")])
         (cons (cons current next)
               (tokenize-chain (reverse (cdr (reverse words))))))]))

(displayln "--- TEXT: tokenize ---")
(surface
  (transform 'tokenize
    (presence 'sentence "the shape is computation")
    (ground)
    wf:tokenize)
  (disclose 'tokenize))


;;; -----------------------------------------------------------
;;; MEDIA TYPE 2: NUMERIC — base conversion (decimal to hex chain)
;;; -----------------------------------------------------------
;;;
;;; A waveform that converts a number through successive
;;; halvings to ground. Each step halves the value.

(define (wf:halve source target)
  (let ([n (string->number (->str source))])
    (cond
      [(or (not n) (<= n 1)) '()]
      [else (halve-chain n)])))

(define (halve-chain n)
  (cond
    [(<= n 1) '()]
    [else (let ([next (quotient n 2)])
            (cons (cons (number->string n) (number->string next))
                  (halve-chain next)))]))

(displayln "\n--- NUMERIC: halve to ground ---")
(surface
  (transform 'halve
    (presence 'value 256)
    (ground)
    wf:halve)
  (disclose 'halve))


;;; -----------------------------------------------------------
;;; MEDIA TYPE 3: STRUCTURAL — JSON-like key extraction
;;; -----------------------------------------------------------
;;;
;;; A waveform that extracts keys from a flat key=value structure.
;;; Each step peels off one key-value pair.

(define (wf:extract-keys source target)
  (let* ([s (->str source)]
         [pairs (string-split s ";")])
    (extract-chain pairs)))

(define (extract-chain pairs)
  (match pairs
    ['() '()]
    [(list p) (let ([kv (string-split p "=")])
                (list (cons p (string-append "key:" (first kv)))))]
    [(cons p rest)
     (let ([remaining (string-join rest ";")])
       (cons (cons (string-join (cons p rest) ";") remaining)
             (extract-chain rest)))]))

(displayln "\n--- STRUCTURAL: key extraction ---")
(surface
  (transform 'extract
    (presence 'data "name=asf;type=machine;version=1")
    (ground)
    wf:extract-keys)
  (disclose 'extract))


;;; -----------------------------------------------------------
;;; MEDIA TYPE 4: BINARY — bit decomposition
;;; -----------------------------------------------------------
;;;
;;; A waveform that decomposes a number into its binary
;;; representation, one bit at a time.

(define (wf:bits source target)
  (let ([n (string->number (->str source))])
    (cond
      [(or (not n) (< n 1)) '()]
      [else (bits-chain n)])))

(define (bits-chain n)
  (cond
    [(< n 1) '()]
    [(= n 1) (list (cons "1" "e"))]
    [else (let* ([bit (modulo n 2)]
                 [rest (quotient n 2)]
                 [label (string-append (number->string n)
                                       "[" (number->string bit) "]")])
            (cons (cons (number->string n) label)
                  (cons (cons label (number->string rest))
                        (bits-chain rest))))]))

(displayln "\n--- BINARY: bit decomposition ---")
(surface
  (transform 'bits
    (presence 'byte 42)
    (ground)
    wf:bits)
  (disclose 'bits))


;;; -----------------------------------------------------------
;;; MEDIA TYPE 5: EXISTING AFFORDANCES — on the same surface
;;; -----------------------------------------------------------
;;;
;;; The point: ALL media types resolve on the same surface.
;;; Register whatever you need. The surface doesn't care.
;;; This IS pan-media. This IS functionality on demand.

(displayln "\n--- ALL MEDIA TYPES ON ONE SURFACE ---")
(surface
  (transform 'text     (presence 's1 "hello world")       (ground) wf:tokenize)
  (transform 'numeric  (presence 's2 64)                   (ground) wf:halve)
  (transform 'struct   (presence 's3 "a=1;b=2")           (ground) wf:extract-keys)
  (transform 'binary   (presence 's4 13)                   (ground) wf:bits)
  (transform 'quantum  (presence 's5 0)                    (ground) wf:hadamard)
  (transform 'factor   (presence 's6 360)                  (ground) wf:factor)
  (transform 'logic    (presence 's7 "1,1")                (ground) wf:nand))

(displayln "\n══════ PROOF ══════")
(displayln "  7 media types. 1 surface. 1 resolution pass.")
(displayln "  Register a waveform = gain a media type.")
(displayln "  The surface is already a pan-media machine.")
