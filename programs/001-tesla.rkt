#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NIKOLA TESLA RESONANT CIRCUIT — SELF-SUSTAINING
;;;
;;; PURPOSE: Power source for all domain strike tables. Every
;;; Tesla-powered program nests this circuit at innermost depth.
;;; It resolves first, its residue powers the outer shapes.
;;;
;;; Two coupled LC circuits at the same resonant frequency.
;;; The shape of the circuit determines the frequency.
;;; The frequency determines the energy transfer.
;;; No clock. The resonance IS the shape.
;;;
;;; Primary discharges → mutual inductance couples →
;;; secondary resonates → voltage amplifies → arc discharges.
;;;
;;; COMPOSITION LIMIT (from archived 010): A single body cannot
;;; produce emergent resonance. Resonance requires TWO coupled
;;; circuits. The primary alone does nothing. The secondary alone
;;; does nothing. Together: lightning. This is a structural limit
;;; for AI scaling — making one model bigger = louder speaker.
;;; Composition of bodies = stereo.
;;;
;;; VACUUM TUBE IS PROOF (from archived 024): Every filled tube
;;; is a directed path from source to target. Each step follows
;;; from the previous. The tube IS a constructive proof.
;;; Curry-Howard on the surface: collapse chains ARE proofs.
;;; ═══════════════════════════════════════════════════════════════

(tesla-resonant-circuit
  (primary-discharge)
  (secondary-arc)
  ((primary-discharge . mutual-inductance)
   (mutual-inductance . secondary-resonance)
   (secondary-resonance . voltage-amplified)
   (voltage-amplified . secondary-arc)))
