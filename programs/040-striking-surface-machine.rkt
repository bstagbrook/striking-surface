#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ATOMIC STATE FLOW — STRIKING SURFACE
;;;
;;; Alphabet: ( creation   ) fulfillment
;;; Primitives: () presence   (()) containment
;;; CONSTITUTIONAL: Shape determines what comes next because
;;; the values of contextual causal field properties determine
;;; what comes next. Context is always decisive.
;;; ═══════════════════════════════════════════════════════════════

;;; PURPOSE: Complete self-contained machine. Domain entities +
;;; transformations + residue tracking in one s-expression.
;;; This IS the striking surface — not a description of one.

(striking-surface

  (entities
    (system (presence active) (contains (users settings logs)))
    (users (presence active) (contains (profile preferences)))
    (profile (presence active) (contains (preferences)))
    (preferences (presence active) (contains ()))
    (settings (presence active) (contains ()))
    (logs (presence active) (contains ()))
    (sessions (presence inactive) (contains ())))

  (transformations
    (update-profile
      (inputs (users profile preferences))
      (outputs (users profile preferences))
      (effect (update preferences))
      (residue (preferences))
      (depth 1))

    (delete-user
      (inputs (users))
      (outputs ())
      (effect (remove users profile preferences sessions logs))
      (residue ())
      (depth 1))

    (create-session
      (inputs (users settings))
      (outputs (sessions))
      (effect (add sessions))
      (residue (sessions))
      (depth 2))

    (update-settings
      (inputs (settings))
      (outputs (settings))
      (effect (modify settings))
      (residue (settings))
      (depth 2))

    (log-action
      (inputs (logs users))
      (outputs (logs))
      (effect (append logs))
      (residue (logs))
      (depth 3)))

  (residue-map
    (users (profile preferences))
    (sessions ())
    (settings ())
    (logs ()))

  ;;; expected-empty-tubes: 7
)
