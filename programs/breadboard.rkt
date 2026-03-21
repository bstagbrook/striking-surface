#lang racket

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   CLOCKLESS BREADBOARD
;;;
;;;   ()       presence    — is
;;;   (())     containment — has
;;;   ((())(())(()))  transformation — does
;;;
;;;   DrRacket IS the striking surface.
;;;   S-expressions ARE Dyck words.
;;;   Hit Run = strike.
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════

;; presence — things that exist
(define zero 0)
(define one 1)

;; transformation — (source . target) pairs
(define not-0 '((0 . 1)))
(define not-1 '((1 . 0)))
(define chain '((a . b) (b . c)))
(define step  '((a . b)))

;; disclose
not-0
not-1
chain
step
