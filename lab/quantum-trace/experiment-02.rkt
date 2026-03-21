#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EXPERIMENT 02: QUANTUM TRACE — SUPERPOSITION OF PATHS
;;;
;;; Same "bank" example as experiment-01, but with q: prefix
;;; on the label. This triggers quantum-trace, which finds
;;; ALL matching paths instead of just the first.
;;;
;;; PREDICTION: The residue should contain BOTH paths:
;;;   bank → river-bank → water-flows
;;;   bank → financial-bank → money-stored
;;; ═══════════════════════════════════════════════════════════════

;;; Classical (first match only — should show river-bank path)
(classical-bank
  (bank)
  (resolved)
  ((bank . river-bank)
   (bank . financial-bank)
   (river-bank . water-flows)
   (financial-bank . money-stored)))

;;; Quantum (all matches — should show BOTH paths)
(q:bank
  (bank)
  (resolved)
  ((bank . river-bank)
   (bank . financial-bank)
   (river-bank . water-flows)
   (financial-bank . money-stored)))
