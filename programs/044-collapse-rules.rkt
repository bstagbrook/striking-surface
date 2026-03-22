#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COLLAPSE / MEASUREMENT RULES — DECISIVE TWO
;;;
;;; CONSTITUTIONAL: Context is always decisive.
;;;
;;; PURPOSE: When superposed states or optional paths must resolve
;;; to a definite outcome, these rules determine which path
;;; survives. The context IS the measurement.
;;;
;;; Three collapse strategies, each deterministic:
;;; 1. energy-max: path with highest residue energy wins
;;; 2. error-min: path with lowest residual error wins
;;; 3. entropy-min: path with least ambiguity wins
;;;
;;; Plus: entanglement propagation rules for coupled entities.
;;; expected-empty-tubes: 11
;;; ═══════════════════════════════════════════════════════════════

(collapse-rules

  ;;; Strategy 1: Maximum Energy
  ;;; The path with the most accumulated energy residue collapses.
  ;;; Like lightning choosing the most conductive route.
  (energy-max
    (input (optional-paths with energy-residues))
    (method (compare energy-residue across paths))
    (select (path with maximum energy))
    (effect (other-paths vanish))
    (residue (energy-difference redistributed)))

  ;;; Strategy 2: Minimum Error
  ;;; The path with the least accumulated error residue collapses.
  ;;; Like gradient descent choosing the steepest direction.
  (error-min
    (input (optional-paths with error-residues))
    (method (compare error-residue across paths))
    (select (path with minimum error))
    (effect (other-paths vanish))
    (residue (error-of-selected-path persists)))

  ;;; Strategy 3: Minimum Entropy / Ambiguity
  ;;; The path with the least uncertainty collapses.
  ;;; Like measurement reducing a quantum state.
  (entropy-min
    (input (optional-paths with ambiguity-residues))
    (method (compare ambiguity across paths))
    (select (path with minimum ambiguity))
    (effect (other-paths vanish))
    (residue (ambiguity-of-selected-path persists)))

  ;;; Entanglement propagation
  ;;; When one entity in an entangled pair collapses,
  ;;; the other collapses consistently.
  (entanglement-rule
    (input (entangled-pair entity-A entity-B))
    (trigger (collapse of entity-A))
    (effect (entity-B collapses to consistent state))
    (constraint (A-state implies B-state via entanglement-map))
    (residue (correlation-maintained)))

  ;;; Context-driven collapse
  ;;; The outer containment determines which collapse strategy applies.
  ;;; No strategy is "default" — context is always decisive.
  (context-selection
    (input (superposed-entity with outer-containment))
    (method (read collapse-strategy from outer-containment))
    (strategies (energy-max error-min entropy-min))
    (fallback (no-collapse-until-context-provides-strategy))
    (residue (strategy-selection-recorded)))

  ;;; Measurement log entry format
  (measurement-format
    (collapsed-entity name)
    (from-state superposed-states)
    (to-state selected-state)
    (strategy used)
    (residue remaining)
    (timestamp git-commit-hash)))
