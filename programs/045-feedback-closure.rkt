#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; FEEDBACK CLOSURE — DECISIVE THREE
;;;
;;; CONSTITUTIONAL: Context is always decisive.
;;;
;;; PURPOSE: When does a recursive loop stop? When does energy
;;; propagation halt? Without closure criteria, the system
;;; spins forever. With them, it converges deterministically.
;;;
;;; Three closure conditions:
;;; 1. Residue below threshold (energy dissipated)
;;; 2. Fixed point reached (state unchanged after cycle)
;;; 3. Depth limit exceeded (maximum recursion)
;;; expected-empty-tubes: 10
;;; ═══════════════════════════════════════════════════════════════

(feedback-closure

  ;;; Condition 1: Residue Threshold
  ;;; Loop stops when total residue falls below epsilon.
  ;;; Like a Tesla circuit whose oscillation dampens to silence.
  (residue-threshold
    (parameter epsilon)
    (check (total-residue-of-loop < epsilon))
    (action (halt-loop))
    (residue (final-residue recorded))
    (analogy (damped-oscillation)))

  ;;; Condition 2: Fixed Point
  ;;; Loop stops when the state after one cycle equals
  ;;; the state before. The shape stopped changing.
  (fixed-point
    (check (state-after-cycle = state-before-cycle))
    (action (halt-loop))
    (residue (zero — no change means no residue))
    (analogy (standing-wave)))

  ;;; Condition 3: Depth Limit
  ;;; Loop stops after N cycles regardless of residue.
  ;;; Safety valve against infinite recursion.
  (depth-limit
    (parameter max-depth)
    (check (current-depth >= max-depth))
    (action (halt-loop force-collapse))
    (residue (remaining-residue recorded as unclosed))
    (analogy (circuit-breaker)))

  ;;; Priority: which condition triggers first?
  ;;; Fixed point > residue threshold > depth limit
  ;;; If the shape stopped changing, stop. Otherwise check energy.
  ;;; If neither, enforce the safety limit.
  (priority
    (first fixed-point)
    (second residue-threshold)
    (third depth-limit))

  ;;; Unclosed residue handling
  ;;; When depth-limit forces closure, residue that wasn't
  ;;; fully propagated gets recorded as "unclosed residue"
  ;;; in the measurement log. This is NOT lost — it's a
  ;;; diagnostic signal that more cycles were needed.
  (unclosed-residue
    (action (record in measurement-log))
    (flag (incomplete-propagation))
    (interpretation (gap-is-signal-not-error))))
