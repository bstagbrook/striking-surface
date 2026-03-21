#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 02: FOUR-STEP CHAIN BY PURE NESTING
;;;
;;; a → b → c → d expressed as three levels of nesting.
;;; No trace function needed for the chain structure.
;;; The depth IS the chain. The nesting IS the computation.
;;; ═══════════════════════════════════════════════════════════════

;;; a → b → c → d by nesting depth alone
(step-3
  ((step-2
    ((step-1 (a) (b) ((a . b))))
    (c)
    ((step-1 . c))))
  (d)
  ((step-2 . d)))
