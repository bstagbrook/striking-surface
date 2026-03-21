#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; QUANTUM GATES — COMPLETE REGISTER
;;;
;;; Every gate operation computed by Python (numpy), registered
;;; here as structural facts. These are not descriptions of
;;; quantum gates. They ARE the gate truth tables.
;;;
;;; Gate set: {H, X, Z, S, T, CNOT, Toffoli} — universal for
;;; quantum computation (H+T+CNOT is universal).
;;;
;;; Gate identities (verified by matrix multiplication):
;;;   H² = I    (Hadamard is its own inverse)
;;;   HZH = X   (conjugation identity)
;;;   HXH = Z   (conjugation identity)
;;;   S² = Z    (S gate squares to Z)
;;;   X² = I    (Pauli-X is its own inverse)
;;;   Z² = I    (Pauli-Z is its own inverse)
;;;
;;; KEY INSIGHT from Bruce: if you can model it, you can program
;;; it. The full quantum gate operation rides as a Dyck word on
;;; one strike. The Python computed it once (clocked). The strike
;;; table holds it forever (clockless). O(1) from now on.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-quantum-gates

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: complete quantum gate register
  (

    ;;; ── Hadamard (H) — creates/destroys superposition ──
    (H-ket0 (ket-0) (ket-plus)  ((ket-0 . ket-plus)))
    (H-ket1 (ket-1) (ket-minus) ((ket-1 . ket-minus)))

    ;;; ── Pauli-X — bit flip (quantum NOT) ──
    (X-ket0 (ket-0) (ket-1) ((ket-0 . ket-1)))
    (X-ket1 (ket-1) (ket-0) ((ket-1 . ket-0)))

    ;;; ── Pauli-Z — phase flip ──
    (Z-ket0 (ket-0) (ket-0)      ((ket-0 . ket-0)))
    (Z-ket1 (ket-1) (minus-ket-1) ((ket-1 . minus-ket-1)))

    ;;; ── S gate — quarter turn (S² = Z) ──
    (S-ket0 (ket-0) (ket-0)   ((ket-0 . ket-0)))
    (S-ket1 (ket-1) (i-ket-1) ((ket-1 . i-ket-1)))

    ;;; ── T gate — eighth turn (universal with H+CNOT) ──
    (T-ket0 (ket-0) (ket-0)            ((ket-0 . ket-0)))
    (T-ket1 (ket-1) (e-ipi/4-ket-1)    ((ket-1 . e-ipi/4-ket-1)))

    ;;; ── CNOT — entanglement generator ──
    (CNOT-00 (ket-00) (ket-00) ((ket-00 . ket-00)))
    (CNOT-01 (ket-01) (ket-01) ((ket-01 . ket-01)))
    (CNOT-10 (ket-10) (ket-11) ((ket-10 . ket-11)))
    (CNOT-11 (ket-11) (ket-10) ((ket-11 . ket-10)))

    ;;; ── Toffoli (CCX) — universal reversible gate ──
    (CCX-000 (ket-000) (ket-000) ((ket-000 . ket-000)))
    (CCX-001 (ket-001) (ket-001) ((ket-001 . ket-001)))
    (CCX-010 (ket-010) (ket-010) ((ket-010 . ket-010)))
    (CCX-011 (ket-011) (ket-011) ((ket-011 . ket-011)))
    (CCX-100 (ket-100) (ket-100) ((ket-100 . ket-100)))
    (CCX-101 (ket-101) (ket-101) ((ket-101 . ket-101)))
    (CCX-110 (ket-110) (ket-111) ((ket-110 . ket-111)))
    (CCX-111 (ket-111) (ket-110) ((ket-111 . ket-110)))

    ;;; ── Gate identities (proven by matrix algebra) ──
    (identity-H-squared
      (H-then-H)
      (identity)
      ((H-then-H . H-cancels-H) (H-cancels-H . identity)))
    (identity-HZH-equals-X
      (H-then-Z-then-H)
      (equals-X)
      ((H-then-Z-then-H . conjugation) (conjugation . equals-X)))
    (identity-HXH-equals-Z
      (H-then-X-then-H)
      (equals-Z)
      ((H-then-X-then-H . conjugation) (conjugation . equals-Z)))
    (identity-S-squared-equals-Z
      (S-then-S)
      (equals-Z)
      ((S-then-S . quarter-plus-quarter) (quarter-plus-quarter . equals-Z)))

    ;;; ── Bell state circuit: H then CNOT on |00> ──
    (bell-state
      (ket-00)
      (phi-plus)
      ((ket-00 . H-first-qubit)
       (H-first-qubit . ket-plus-0)
       (ket-plus-0 . CNOT-applied)
       (CNOT-applied . superposition-00-plus-11)
       (superposition-00-plus-11 . phi-plus)))

    ;;; ── Measurement: |+> collapses to |0> or |1> with P=0.5 each ──
    (measure-plus
      (ket-plus)
      (collapsed)
      ((ket-plus . P-ket0-equals-0.5)
       (P-ket0-equals-0.5 . P-ket1-equals-0.5)
       (P-ket1-equals-0.5 . collapsed)))

    ;;; ── Universality: H + T + CNOT = universal gate set ──
    (universality
      (H-plus-T-plus-CNOT)
      (any-unitary-approximated)
      ((H-plus-T-plus-CNOT . Solovay-Kitaev-theorem)
       (Solovay-Kitaev-theorem . any-single-qubit-gate)
       (any-single-qubit-gate . plus-CNOT-for-entanglement)
       (plus-CNOT-for-entanglement . any-unitary-approximated)))

  )

  ;;; Vacuum tube
  ((tesla . quantum-gates-registered)))
