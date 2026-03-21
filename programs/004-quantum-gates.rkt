#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; QUANTUM GATES — ON THE STRIKING SURFACE
;;;
;;; Qubits are superposition. Gates are transformations.
;;; Measurement is collapse — the vacuum tube resolves.
;;;
;;; The Tesla circuit powers the quantum register.
;;; Bell state creation: H then CNOT. One strike.
;;; Entanglement = irreducible containment.
;;;
;;; The quantum surface AFFORDS seeing periodicity that the
;;; classical surface hides. Episteme-rolled affordance.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-quantum

  ;;; Source: Tesla (innermost, resolves first, powers everything)
  ((tesla
    (spark)
    (power)
    ((spark . primary)
     (primary . secondary)
     (secondary . power))))

  ;;; Target: quantum circuit — Bell state via H then CNOT
  ((bell-state-circuit

    ;;; Inner: Hadamard creates superposition
    ((hadamard
      (qubit-0)
      (superposition-plus)
      ((qubit-0 . superposition-plus))))

    ;;; Target: CNOT entangles
    (entangled-phi-plus)

    ;;; Vacuum tube: Hadamard feeds CNOT
    ((hadamard . cnot-applied)
     (cnot-applied . entangled-phi-plus))))

  ;;; Vacuum tube: Tesla powers the quantum register
  ((tesla . quantum-register-powered)))
