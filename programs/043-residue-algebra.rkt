#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; RESIDUE ALGEBRA — THE FIRST OF THE DECISIVE FIVE
;;;
;;; CONSTITUTIONAL: Presence is causal. Context is always decisive.
;;;
;;; PURPOSE: Define how residues combine, split, cancel, and scale.
;;; Without this, the CFT-OS has no rules for how information
;;; propagates between transformations. With it, every residue
;;; flow is deterministic, traceable, and auditable.
;;;
;;; Residue = information left behind after a transformation.
;;; Types: energy, error, ambiguity, gradient, phase, charge.
;;; Each type has specific algebra rules.
;;; expected-empty-tubes: 16
;;; ═══════════════════════════════════════════════════════════════

(residue-algebra

  ;;; Residue types and their domains
  (types
    (energy (domain non-negative-real) (unit joules-or-bits))
    (error (domain real) (unit deviation))
    (ambiguity (domain zero-to-one) (unit probability))
    (gradient (domain real) (unit per-parameter))
    (phase (domain zero-to-2pi) (unit radians))
    (charge (domain non-negative-real) (unit coulombs-or-bits)))

  ;;; COMBINE: two residues of same type → one residue
  (combine-rules
    (energy (rule sum) (a+b energy))
    (error (rule sum) (a+b error))
    (ambiguity (rule max) (max-a-b ambiguity))
    (gradient (rule sum) (a+b gradient))
    (phase (rule modular-sum) (a+b-mod-2pi phase))
    (charge (rule sum) (a+b charge)))

  ;;; SPLIT: one residue → two residues (proportional)
  (split-rules
    (energy (rule proportional) (a*r and a*(1-r) for ratio r))
    (error (rule proportional) (a*r and a*(1-r)))
    (ambiguity (rule copy) (both-branches-get-full-ambiguity))
    (gradient (rule proportional) (a*r and a*(1-r)))
    (phase (rule copy) (both-branches-same-phase))
    (charge (rule proportional) (a*r and a*(1-r))))

  ;;; CANCEL: two residues of same type with opposite sign → zero
  (cancel-rules
    (energy (rule never) (energy-cannot-be-negative))
    (error (rule opposing-sign) (positive+negative=reduced))
    (ambiguity (rule resolution) (measurement-reduces-to-zero))
    (gradient (rule opposing-sign) (positive+negative=reduced))
    (phase (rule destructive-interference) (pi-apart=cancel))
    (charge (rule never) (charge-cannot-be-negative)))

  ;;; SCALE: residue × factor → scaled residue
  (scale-rules
    (energy (rule multiply) (a*k energy))
    (error (rule multiply) (a*k error))
    (ambiguity (rule clamp) (min-1-of-a*k ambiguity))
    (gradient (rule multiply) (a*k gradient))
    (phase (rule modular-multiply) (a*k-mod-2pi phase))
    (charge (rule multiply) (a*k charge)))

  ;;; CROSS-TYPE RULES: when residues of different types interact
  (cross-type
    (energy+error (rule independence) (no-interaction))
    (energy+ambiguity (rule weighted) (high-energy-reduces-ambiguity))
    (error+gradient (rule feedback) (gradient-reduces-error-via-update))
    (phase+phase (rule interference) (constructive-or-destructive))
    (charge+energy (rule conversion) (charge-releases-as-energy)))

  ;;; CONSERVATION LAW
  ;;; Total residue of each type is conserved across transformations
  ;;; unless explicitly consumed by a cancel or conversion rule
  (conservation
    (energy conserved)
    (error conserved-unless-cancelled)
    (ambiguity reduced-by-measurement)
    (gradient conserved-unless-cancelled)
    (phase conserved-mod-2pi)
    (charge conserved)))
