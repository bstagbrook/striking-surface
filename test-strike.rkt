#lang strike

;;; The Tesla circuit powers domain-specific strike tables
;;; through nesting depth. One shape. No keywords. No clock.
;;; The spark gap is #lang strike. The shape does the rest.

;;; ── The Tesla power source: self-sustaining ──
;;; Its vacuum tube fills with the full transfer chain.
;;; Its resolved form becomes presence for outer shapes.

(tesla-powers-all

  ;;; Source: the Tesla circuit (innermost — resolves first)
  ((tesla
    (primary-discharge)
    (secondary-arc)
    ((primary-discharge . mutual-inductance)
     (mutual-inductance . secondary-resonance)
     (secondary-resonance . voltage-amplified)
     (voltage-amplified . secondary-arc))))

  ;;; Target: what the Tesla circuit powers
  (domain-tables-powered)

  ;;; Vacuum tube: the proof of power transfer
  ((tesla . domain-tables-powered)))
