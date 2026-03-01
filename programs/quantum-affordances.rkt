#lang racket

;;; ===========================================================
;;; QUANTUM AFFORDANCES — as a single Dyck word
;;;
;;; This IS the program. Not instructions. Not steps.
;;; One S-expression. One circuit. Strike it.
;;; ===========================================================

(require "../strike.rkt")

(surface

  ;; ── SUPERPOSITION ──────────────────────────────────────
  ;; A shape exists in multiple states at once.
  ;; Before measurement, the qubit is BOTH. Not either/or.

  (transform 'superpose
    (presence 'qubit-zero 0)
    (ground)
    wf:hadamard)

  (disclose 'superpose)

  ;; ── COLLAPSE ───────────────────────────────────────────
  ;; Measurement resolves superposition to one state.
  ;; The act of looking is what settles it. Born rule.

  (transform 'measure
    (presence 'superposed "0.7071|0>+0.7071|1>")
    (ground)
    wf:collapse)

  (disclose 'measure)

  ;; ── ENTANGLEMENT ───────────────────────────────────────
  ;; Two particles, one fate. Bell pair.
  ;; Measure one, you know the other.

  (transform 'bell-pair
    (presence 'alice-qubit 0)
    (ground)
    wf:entangle)

  (disclose 'bell-pair)

  ;; ── INTERFERENCE ───────────────────────────────────────
  ;; Paths that reinforce or cancel.
  ;; Wrong answers destructively interfere.
  ;; Right answer constructively interferes.

  (transform 'reinforce
    (presence 'path-constructive "constructive")
    (ground)
    wf:interfere)

  (transform 'cancel
    (presence 'path-destructive "destructive")
    (ground)
    wf:interfere)

  (transform 'identity
    (presence 'path-HH "HH")
    (ground)
    wf:interfere)

  (disclose 'reinforce)
  (disclose 'cancel)
  (disclose 'identity)

  ;; ── RING ───────────────────────────────────────────────
  ;; be → have → do → be. Self-sustaining.
  ;; One strike, permanent current.

  (transform 'lifecycle
    (presence 'being "be")
    (ground)
    wf:ring)

  (disclose 'lifecycle)

  ;; ── TELEPORTATION ──────────────────────────────────────
  ;; State transfer without physical movement.
  ;; Entanglement + collapse + classical channel.

  (transform 'teleport
    (presence 'alice-state "secret_quantum_state")
    (ground)
    wf:teleport)

  (disclose 'teleport)

  ;; ── NAND ───────────────────────────────────────────────
  ;; The universal classical gate. Everything classical
  ;; is built from this.

  (transform 'nand
    (presence 'bits-11 "1,1")
    (ground)
    wf:nand)

  (disclose 'nand))
