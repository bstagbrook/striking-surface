#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CONTINUUM LATTICE PROTOCOL — DECISIVE FOUR
;;;
;;; CONSTITUTIONAL: Context is always decisive.
;;;
;;; PURPOSE: How do residues propagate ACROSS layers? When
;;; chemistry produces energy, how does that energy reach
;;; the computation layer? This protocol defines the rules.
;;;
;;; The lattice is a DAG. Layers are depth levels.
;;; Residues flow downward (deeper layers) by default.
;;; Feedback flows upward (shallower layers) via explicit loops.
;;; Cross-layer connections require registered interfaces.
;;; expected-empty-tubes: 14
;;; ═══════════════════════════════════════════════════════════════

(continuum-protocol

  ;;; Layer definitions (ordered by depth)
  (layers
    (depth-1 (name primitives) (contains (numbers arithmetic logic)))
    (depth-2 (name signals) (contains (waves light sound)))
    (depth-3 (name language) (contains (phonemes morphemes words)))
    (depth-4 (name chemistry) (contains (atoms molecules reactions)))
    (depth-5 (name computation) (contains (bits registers algorithms)))
    (depth-6 (name patterns) (contains (neurons tensors gradients))))

  ;;; Forward propagation: residues flow from shallow to deep
  (forward-rules
    (direction shallow-to-deep)
    (mechanism (residue-of-output-at-depth-N feeds input-at-depth-N+1))
    (type-mapping
      (energy-at-primitives feeds energy-at-signals)
      (error-at-signals feeds ambiguity-at-language)
      (energy-at-chemistry feeds charge-at-computation)
      (error-at-computation feeds gradient-at-patterns))
    (residue-algebra (use rules from 043-residue-algebra)))

  ;;; Backward propagation: feedback from deep to shallow
  (backward-rules
    (direction deep-to-shallow)
    (mechanism (gradient-at-depth-N feeds correction-at-depth-N-1))
    (requires (explicit feedback-loop registration))
    (type-mapping
      (gradient-at-patterns feeds error-correction-at-computation)
      (error-at-computation feeds parameter-adjustment-at-chemistry)
      (ambiguity-at-language feeds phase-correction-at-signals))
    (closure (use rules from 045-feedback-closure)))

  ;;; Cross-layer interfaces
  ;;; Each interface maps residue types between layers
  (interfaces
    (primitives-to-signals
      (maps energy to amplitude)
      (maps error to phase-offset))
    (signals-to-language
      (maps frequency to phoneme-identity)
      (maps amplitude to stress))
    (language-to-chemistry
      (maps word to molecular-name)
      (maps ambiguity to reaction-uncertainty))
    (chemistry-to-computation
      (maps energy to charge)
      (maps bond-state to bit-state))
    (computation-to-patterns
      (maps register-value to tensor-element)
      (maps overflow to gradient-clipping)))

  ;;; Conservation across layers
  ;;; Total energy/information is conserved across the full lattice
  ;;; unless explicitly consumed by a cancel or conversion rule
  (conservation
    (total-energy conserved-across-all-layers)
    (total-error conserved-unless-cancelled)
    (total-ambiguity monotonically-non-increasing-with-measurement)))
