#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT: CHAIN-FOLLOWING BY NESTING, NOT BY TRACE
;;;
;;; QUESTION: Can we express a → b → c without relying on the
;;; trace function? Can nesting depth alone carry the current?
;;;
;;; IDEA: Instead of (chain (a) (c) ((a . b) (b . c)))
;;; which requires trace to follow a→b→c,
;;; use nesting: the inner transform produces b,
;;; the outer transform consumes b and produces c.
;;;
;;; (outer
;;;   ((inner (a) (b) ((a . b))))   ;;; inner produces b
;;;   (c)                            ;;; outer target is c
;;;   ((inner . c)))                 ;;; outer wire: inner's label → c
;;;
;;; This follows a→b→c by DEPTH, not by trace.
;;; Inner resolves first (depth). Its label becomes the seed
;;; for the outer. The chain is in the SHAPE, not in the
;;; substrate's trace function.
;;; ═══════════════════════════════════════════════════════════════

;;; Test: a → b → c by nesting
(step-2
  ((step-1 (a) (b) ((a . b))))
  (c)
  ((step-1 . c)))
