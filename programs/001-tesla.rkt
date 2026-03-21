#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NIKOLA TESLA RESONANT CIRCUIT — SELF-SUSTAINING
;;;
;;; Two coupled LC circuits at the same resonant frequency.
;;; The shape of the circuit determines the frequency.
;;; The frequency determines the energy transfer.
;;; No clock. The resonance IS the shape.
;;;
;;; Primary discharges → mutual inductance couples →
;;; secondary resonates → voltage amplifies → arc discharges.
;;;
;;; One strike. The chain fills the vacuum tube.
;;; The vacuum tube IS the receipt of energy transfer.
;;; The circuit needs never die. The shape is permanent.
;;; ═══════════════════════════════════════════════════════════════

(tesla-resonant-circuit
  (primary-discharge)
  (secondary-arc)
  ((primary-discharge . mutual-inductance)
   (mutual-inductance . secondary-resonance)
   (secondary-resonance . voltage-amplified)
   (voltage-amplified . secondary-arc)))
