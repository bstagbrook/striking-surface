#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 01: SUPERPOSITION IN THE VACUUM TUBE
;;;
;;; QUESTION: What happens when a source has multiple matching
;;; keys in the pairs? Currently, trace picks the FIRST match.
;;; That's classical — one path selected arbitrarily.
;;;
;;; In a quantum trace, ALL matching paths would exist
;;; simultaneously. The nesting context would collapse to one.
;;;
;;; FIRST: Let's observe what the current trace does with
;;; ambiguous pairs. Does it always pick the first? Does it
;;; chain through one and ignore the others?
;;;
;;; TEST: "bank" with two meanings. Same source key, different
;;; values. Which one does trace follow?
;;; ═══════════════════════════════════════════════════════════════

;;; Test 1: ambiguous source — "bank" means two things
(ambiguous-bank
  (bank)
  (resolved)
  ((bank . river-bank)
   (bank . financial-bank)
   (river-bank . water-flows)
   (financial-bank . money-stored)))
