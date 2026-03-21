#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COLLISION: QUANTUM MECHANICS × ECONOMICS at "superposition"
;;;
;;; Quantum: a system is in multiple states simultaneously until
;;; measured. Measurement collapses to one state.
;;; Economics: a consumer holds multiple preferences simultaneously
;;; until forced to choose. Purchase collapses to one good.
;;;
;;; This is not metaphor — Yukalov & Sornette (2011) published
;;; "Quantum Decision Theory" showing that human decision-making
;;; violates classical probability but follows quantum probability.
;;; SOURCE: Yukalov & Sornette 2011, Phil Trans R Soc A
;;; ═══════════════════════════════════════════════════════════════

(q:collide-quantum-economics
  (superposition)
  (what-connects)
  (;;; Quantum wires
   ;;; SOURCE: standard QM
   (superposition . multiple-states-simultaneously)
   (multiple-states-simultaneously . no-definite-value-until-measured)
   (no-definite-value-until-measured . measurement-collapses)
   (measurement-collapses . one-eigenstate)
   (superposition . interference)
   (interference . amplitudes-add)
   (amplitudes-add . probability-not-classical)

   ;;; Economics/decision wires
   ;;; SOURCE: Yukalov & Sornette 2011
   (superposition . multiple-preferences-simultaneously)
   (multiple-preferences-simultaneously . no-definite-choice-until-forced)
   (no-definite-choice-until-forced . purchase-collapses)
   (purchase-collapses . one-good-chosen)
   (superposition . context-effects)
   (context-effects . preferences-not-independent)
   (preferences-not-independent . violates-classical-probability)

   ;;; Convergence
   (probability-not-classical . quantum-probability)
   (violates-classical-probability . quantum-probability)
   (one-eigenstate . irreversible)
   (one-good-chosen . irreversible)
   ))
