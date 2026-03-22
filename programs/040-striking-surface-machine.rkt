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
;;; transformations + residue tracking + lattice depth + optional
;;; path tracking in one s-expression. No define. No external
;;; state. The file IS the machine. Editing it transforms it.
;;; expected-empty-tubes: 12

(striking-surface

  (entities
    (system (presence true) (contains (users settings logs sessions)))
    (users (presence true) (contains (profile preferences)))
    (profile (presence true) (contains (preferences)))
    (preferences (presence true) (contains ()))
    (settings (presence true) (contains ()))
    (logs (presence true) (contains ()))
    (sessions (presence false) (contains ())))

  (transformations

    (update-profile
      (inputs (users profile preferences))
      (outputs (users profile preferences))
      (effect (update preferences))
      (residue (preferences))
      (depth 1)
      (applied false))

    (delete-user
      (inputs (users))
      (outputs ())
      (effect (remove users profile preferences sessions logs))
      (residue ())
      (depth 1)
      (applied false))

    (create-session
      (inputs (users settings))
      (outputs (sessions))
      (effect (add sessions))
      (residue (sessions))
      (depth 2)
      (applied false))

    (update-settings
      (inputs (settings))
      (outputs (settings))
      (effect (modify settings))
      (residue (settings))
      (depth 2)
      (applied false))

    (log-action
      (inputs (logs users))
      (outputs (logs))
      (effect (append logs))
      (residue (logs))
      (depth 3)
      (applied false)))

  (residue-map
    (users (profile preferences))
    (sessions ())
    (settings ())
    (logs ()))

  (lattice
    (depth-1 (update-profile delete-user))
    (depth-2 (create-session update-settings))
    (depth-3 (log-action)))

  (optional-paths
    ((update-profile delete-user create-session log-action)
     (notes example-sequence-through-lattice))
    ((delete-user) (notes edge-case-deletion-path))))
