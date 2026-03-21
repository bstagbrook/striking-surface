#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 03: CONTEXT COLLAPSE
;;;
;;; The quantum trace of "bank" produces two paths in
;;; superposition. Now we nest it inside contexts that
;;; should structurally prefer one path over the other.
;;;
;;; Context 1: "I walked along the bank" — river context
;;; Context 2: "I deposited money at the bank" — finance context
;;;
;;; The outer transform's wires determine which inner path
;;; the current follows. The context IS the measurement.
;;; ═══════════════════════════════════════════════════════════════

;;; Quantum bank in river context
;;; The outer wire connects to "water-flows" — river path preferred
(river-context
  ((q:bank
    (bank)
    (resolved)
    ((bank . river-bank)
     (bank . financial-bank)
     (river-bank . water-flows)
     (financial-bank . money-stored))))
  (river-meaning)
  ((q:bank . river-meaning)))

;;; Quantum bank in finance context
;;; Same inner shape, different outer — outer wire connects to money
(finance-context
  ((q:bank
    (bank)
    (resolved)
    ((bank . river-bank)
     (bank . financial-bank)
     (river-bank . water-flows)
     (financial-bank . money-stored))))
  (finance-meaning)
  ((q:bank . finance-meaning)))
