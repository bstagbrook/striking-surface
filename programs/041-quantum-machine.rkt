#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ATOMIC STATE FLOW — STRIKING SURFACE
;;;
;;; CONSTITUTIONAL: Presence is causal. Context is always decisive.
;;; ═══════════════════════════════════════════════════════════════

;;; PURPOSE: Quantum-ready machine. Entities can hold superposed
;;; presence states. Transformations can be in superposition of
;;; applied/not-applied. Residues accumulate. Optional paths
;;; branch. Collapse = editing the file. Git diff = measurement record.
;;; expected-empty-tubes: 14

(quantum-striking-surface

  (entities
    ;;; Active entities (definite state)
    (system (presence true) (contains (users settings logs sessions)))
    (users (presence true) (contains (profile preferences)))
    (profile (presence true) (contains (preferences)))
    (preferences (presence true) (contains ()))
    (settings (presence true) (contains ()))
    (logs (presence true) (contains ()))

    ;;; Superposed entity: sessions might or might not exist
    ;;; Both states present until context collapses
    (sessions (presence (true false)) (contains ()))

    ;;; Entangled pair: if user is deleted, profile must be deleted
    ;;; Their presence states are coupled — cannot be independent
    (entangled-pair
      (user-state (presence true))
      (profile-state (presence true))
      (constraint (user-state implies profile-state))))

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

    ;;; Superposed transformation: create-session is in
    ;;; superposition of applied/not-applied until sessions
    ;;; presence collapses
    (create-session
      (inputs (users settings))
      (outputs (sessions))
      (effect (add sessions))
      (residue (sessions))
      (depth 2)
      (applied (true false)))

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
    ;;; Path A: normal flow
    ((update-profile create-session log-action)
     (probability high)
     (notes normal-user-flow))
    ;;; Path B: deletion
    ((delete-user log-action)
     (probability low)
     (notes cleanup-path))
    ;;; Path C: superposed — both paths exist simultaneously
    ((update-profile delete-user)
     (probability superposed)
     (notes both-paths-until-context-collapses)))

  (measurement-log
    ;;; Empty until collapse events occur
    ;;; Each edit to this file that changes a superposed state
    ;;; to a definite state IS a measurement
    ;;; Git diff captures: what collapsed, when, by whom
    ()))
