#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; LAB: Quantum Teleportation — transfer state without moving qubit
;;;
;;; INTENDED OUTCOME: Demonstrate that ASF quantum teleportation
;;; reproduces the known protocol and produces correct residue.
;;;
;;; The protocol:
;;; 1. Create Bell pair between Alice and Bob
;;; 2. Alice has unknown state |ψ⟩ she wants to send
;;; 3. Alice does Bell measurement on |ψ⟩ and her half of pair
;;; 4. Alice sends 2 classical bits to Bob
;;; 5. Bob applies correction based on those bits
;;; 6. Bob now has |ψ⟩. Alice's original is destroyed.
;;;
;;; In ASF: the transforms chain. The residue IS the teleported state.
;;; ═══════════════════════════════════════════════════════════════

(teleportation-lab

  ((lab (quantum-teleportation) (demonstrate) ((quantum-teleportation . demonstrate))))

  (

    ;;; Step 1: Create shared entangled pair
    (create-resource
      (two-qubits-at-ket-00)
      (Bell-pair-ket-00-plus-ket-11)
      ((two-qubits-at-ket-00 . Hadamard-on-first)
       (Hadamard-on-first . CNOT-first-to-second)
       (CNOT-first-to-second . Bell-pair-ket-00-plus-ket-11)))

    ;;; Step 2: Alice has unknown state
    (unknown-state
      (alpha-ket-0-plus-beta-ket-1)
      (state-to-teleport)
      ((alpha-ket-0-plus-beta-ket-1 . unknown-to-Alice)
       (unknown-to-Alice . cannot-be-cloned)
       (cannot-be-cloned . state-to-teleport)))

    ;;; Step 3: Alice's Bell measurement
    (alice-measures
      (unknown-state . her-half-of-Bell-pair)
      (two-classical-bits)
      ((unknown-state . CNOT-unknown-to-her-half)
       (CNOT-unknown-to-her-half . Hadamard-on-unknown)
       (Hadamard-on-unknown . measure-both)
       (measure-both . four-possible-outcomes-00-01-10-11)
       (four-possible-outcomes-00-01-10-11 . two-classical-bits)))

    ;;; Step 4: Classical communication
    (classical-channel
      (two-classical-bits)
      (Bob-receives-bits)
      ((two-classical-bits . sent-at-speed-of-light-or-slower)
       (sent-at-speed-of-light-or-slower . no-FTL-communication)
       (no-FTL-communication . Bob-receives-bits)))

    ;;; Step 5: Bob's correction
    (bob-corrects
      (Bob-receives-bits . Bobs-half-of-Bell-pair)
      (Bobs-qubit-now-in-state-psi)
      ((Bob-receives-bits . if-00-do-nothing)
       (if-00-do-nothing . if-01-apply-X)
       (if-01-apply-X . if-10-apply-Z)
       (if-10-apply-Z . if-11-apply-ZX)
       (if-11-apply-ZX . Bobs-qubit-now-in-state-psi)))

    ;;; Verification: state transferred, original destroyed
    (verification
      (Bobs-qubit-now-in-state-psi)
      (teleportation-complete)
      ((Bobs-qubit-now-in-state-psi . alpha-ket-0-plus-beta-ket-1-at-Bob)
       (alpha-ket-0-plus-beta-ket-1-at-Bob . Alices-original-collapsed)
       (Alices-original-collapsed . no-cloning-respected)
       (no-cloning-respected . no-FTL-respected)
       (no-FTL-respected . teleportation-complete)))

  )

  ((lab . teleportation-demonstrated)))
