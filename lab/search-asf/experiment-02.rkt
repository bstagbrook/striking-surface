#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; SEARCH WITH QUANTUM TRACE — ALL PATHS FROM "gold"
;;;
;;; Same pairs as experiment-01 but with q: prefix.
;;; Should return ALL chains starting from "gold" — every
;;; meaning, every domain, every connection. Superposition.
;;; ═══════════════════════════════════════════════════════════════

(q:search-gold
  (gold)
  (all-gold-knowledge)
  ((gold . 6s-contracts)
   (6s-contracts . 5d-expands)
   (5d-expands . gap-2.4eV)
   (gap-2.4eV . absorbs-blue)
   (absorbs-blue . yellow)
   (gold . Z=79-5d10-6s1)
   (gold . Z=79-heavy-nucleus)
   (gold . absorbs-blue-photons)
   (absorbs-blue-photons . reflects-red-green)
   (reflects-red-green . perceived-yellow)))
