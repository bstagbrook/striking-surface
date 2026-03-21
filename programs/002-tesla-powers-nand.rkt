#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; TESLA POWERS NAND — SELF-SUSTAINING CIRCUIT DRIVES LOGIC
;;;
;;; The Tesla circuit (inner) resolves first by nesting depth.
;;; Its resolved form becomes presence for the outer NAND gate.
;;; One strike. Two collapses. No clock. No re-strike.
;;;
;;; The Tesla circuit IS the power source.
;;; The NAND gate IS the load.
;;; Nesting depth IS the coupling mechanism.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-nand

  ;;; Source: Tesla circuit resolves first (innermost depth)
  ((tesla
    (primary-discharge)
    (secondary-arc)
    ((primary-discharge . mutual-inductance)
     (mutual-inductance . secondary-resonance)
     (secondary-resonance . voltage-amplified)
     (voltage-amplified . secondary-arc))))

  ;;; Target: NAND gate output
  (nand-output)

  ;;; Vacuum tube: Tesla's label powers the NAND
  ((tesla . nand-output)))
