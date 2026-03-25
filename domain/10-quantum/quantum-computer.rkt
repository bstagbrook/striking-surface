#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Quantum Computer — complete interface
;;; LAYER: 10-quantum
;;; DEPENDS ON: 01-particles, 07-waves, 08-relativity
;;;
;;; PURPOSE: Every transform a fully functional quantum computer
;;; must provide. Each transform IS a function signature.
;;; The interface IS the implementation.
;;;
;;; This is not a simulation. This is registration of what
;;; a quantum computer DOES — presence, containment, transformation.
;;;
;;; SOURCES:
;;; [Nielsen-Chuang] Quantum Computation and Quantum Information
;;; [Shor-1994] Algorithms for quantum computation
;;; [Grover-1996] A fast quantum mechanical algorithm for database search
;;; [Deutsch-1985] Quantum theory, the Church-Turing principle
;;; ═══════════════════════════════════════════════════════════════

(domain-quantum-computer

  ((quantum (computation) (authoritative) ((computation . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE QUBIT — fundamental unit
    ;;; ═══════════════════════════════════════════════════════════

    (qubit
      (quantum-two-level-system)
      (superposition-of-0-and-1)
      ((quantum-two-level-system . alpha-ket-0-plus-beta-ket-1)
       (alpha-ket-0-plus-beta-ket-1 . alpha-squared-plus-beta-squared-equals-1)
       (alpha-squared-plus-beta-squared-equals-1 . lives-on-Bloch-sphere)
       (lives-on-Bloch-sphere . superposition-of-0-and-1)))

    (measurement
      (qubit-in-superposition)
      (collapses-to-0-or-1)
      ((qubit-in-superposition . Born-rule)
       (Born-rule . probability-0-equals-alpha-squared)
       (probability-0-equals-alpha-squared . probability-1-equals-beta-squared)
       (probability-1-equals-beta-squared . irreversible)
       (irreversible . collapses-to-0-or-1)))

    (multi-qubit-state
      (n-qubits)
      (2-to-n-dimensional-state-space)
      ((n-qubits . tensor-product-of-individual-spaces)
       (tensor-product-of-individual-spaces . 2-to-n-basis-states)
       (2-to-n-basis-states . exponential-state-space)
       (exponential-state-space . 2-to-n-dimensional-state-space)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SINGLE-QUBIT GATES — complete set
    ;;; ═══════════════════════════════════════════════════════════

    (Pauli-X
      (qubit)
      (bit-flip)
      ((qubit . ket-0-to-ket-1)
       (ket-0-to-ket-1 . ket-1-to-ket-0)
       (ket-1-to-ket-0 . quantum-NOT)
       (quantum-NOT . bit-flip)))

    (Pauli-Y
      (qubit)
      (bit-and-phase-flip)
      ((qubit . ket-0-to-i-ket-1)
       (ket-0-to-i-ket-1 . ket-1-to-minus-i-ket-0)
       (ket-1-to-minus-i-ket-0 . bit-and-phase-flip)))

    (Pauli-Z
      (qubit)
      (phase-flip)
      ((qubit . ket-0-unchanged)
       (ket-0-unchanged . ket-1-gets-minus-sign)
       (ket-1-gets-minus-sign . phase-flip)))

    (Hadamard
      (qubit)
      (equal-superposition)
      ((qubit . ket-0-to-ket-plus)
       (ket-0-to-ket-plus . ket-1-to-ket-minus)
       (ket-1-to-ket-minus . creates-superposition-from-basis)
       (creates-superposition-from-basis . equal-superposition)))

    (Phase-S
      (qubit)
      (pi-over-2-phase)
      ((qubit . ket-0-unchanged)
       (ket-0-unchanged . ket-1-gets-factor-i)
       (ket-1-gets-factor-i . pi-over-2-phase)))

    (T-gate
      (qubit)
      (pi-over-4-phase)
      ((qubit . ket-0-unchanged)
       (ket-0-unchanged . ket-1-gets-factor-exp-i-pi-over-4)
       (ket-1-gets-factor-exp-i-pi-over-4 . pi-over-4-phase)))

    (Rx-rotation
      (qubit . angle-theta)
      (rotation-around-x-axis)
      ((qubit . Bloch-sphere-rotation)
       (Bloch-sphere-rotation . angle-theta-around-x)
       (angle-theta-around-x . rotation-around-x-axis)))

    (Ry-rotation
      (qubit . angle-theta)
      (rotation-around-y-axis)
      ((qubit . Bloch-sphere-rotation)
       (Bloch-sphere-rotation . angle-theta-around-y)
       (angle-theta-around-y . rotation-around-y-axis)))

    (Rz-rotation
      (qubit . angle-theta)
      (rotation-around-z-axis)
      ((qubit . Bloch-sphere-rotation)
       (Bloch-sphere-rotation . angle-theta-around-z)
       (angle-theta-around-z . rotation-around-z-axis)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MULTI-QUBIT GATES
    ;;; ═══════════════════════════════════════════════════════════

    (CNOT
      (control-qubit . target-qubit)
      (conditional-bit-flip)
      ((control-qubit . if-control-is-1)
       (if-control-is-1 . flip-target)
       (flip-target . if-control-is-0-do-nothing)
       (if-control-is-0-do-nothing . creates-entanglement)
       (creates-entanglement . conditional-bit-flip)))

    (CZ
      (control-qubit . target-qubit)
      (conditional-phase-flip)
      ((control-qubit . if-both-are-1)
       (if-both-are-1 . apply-minus-sign)
       (apply-minus-sign . symmetric-in-control-and-target)
       (symmetric-in-control-and-target . conditional-phase-flip)))

    (SWAP
      (qubit-a . qubit-b)
      (exchange-states)
      ((qubit-a . state-goes-to-b)
       (state-goes-to-b . qubit-b-state-goes-to-a)
       (qubit-b-state-goes-to-a . three-CNOTs)
       (three-CNOTs . exchange-states)))

    (Toffoli
      (control-2 . control-1 . target)
      (AND-gate-reversible)
      ((control-1 . control-2)
       (control-2 . if-both-controls-are-1)
       (if-both-controls-are-1 . flip-target)
       (flip-target . universal-for-classical-computation)
       (universal-for-classical-computation . AND-gate-reversible)))

    (Fredkin
      (target-a . control . target-b)
      (controlled-SWAP)
      ((control . if-control-is-1)
       (if-control-is-1 . swap-target-a-and-target-b)
       (swap-target-a-and-target-b . universal-for-classical-computation)
       (universal-for-classical-computation . controlled-SWAP)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; UNIVERSALITY
    ;;; SOURCE: [Nielsen-Chuang] Chapter 4
    ;;; ═══════════════════════════════════════════════════════════

    (universal-gate-set
      (H . CNOT . T)
      (can-approximate-any-unitary)
      ((CNOT . two-qubit-entangling-gate)
       (two-qubit-entangling-gate . H-creates-superposition)
       (H-creates-superposition . T-provides-non-Clifford)
       (T-provides-non-Clifford . Solovay-Kitaev-theorem)
       (Solovay-Kitaev-theorem . any-unitary-to-arbitrary-precision)
       (any-unitary-to-arbitrary-precision . can-approximate-any-unitary)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ENTANGLEMENT — the resource
    ;;; ═══════════════════════════════════════════════════════════

    (create-Bell-pair
      (two-qubits-both-ket-0)
      (maximally-entangled-Bell-state)
      ((two-qubits-both-ket-0 . Hadamard-on-first)
       (Hadamard-on-first . CNOT-first-to-second)
       (CNOT-first-to-second . ket-00-plus-ket-11-over-sqrt-2)
       (ket-00-plus-ket-11-over-sqrt-2 . maximally-entangled-Bell-state)))

    (entanglement-properties
      (entangled-pair)
      (nonlocal-correlations)
      ((entangled-pair . measuring-one-determines-other)
       (measuring-one-determines-other . instantaneous-regardless-of-distance)
       (instantaneous-regardless-of-distance . no-faster-than-light-communication)
       (no-faster-than-light-communication . Bell-inequality-violated)
       (Bell-inequality-violated . nonlocal-correlations)))

    (GHZ-state
      (n-qubits)
      (maximally-entangled-n-party)
      ((n-qubits . Hadamard-on-first)
       (Hadamard-on-first . CNOT-chain-to-all-others)
       (CNOT-chain-to-all-others . ket-000-plus-ket-111-over-sqrt-2)
       (ket-000-plus-ket-111-over-sqrt-2 . maximally-entangled-n-party)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM ALGORITHMS — the function signatures
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Deutsch-Jozsa: determine if f is constant or balanced
    ;;; SOURCE: [Deutsch-1985] [Deutsch-Jozsa-1992]
    (Deutsch-Jozsa
      (oracle-f-constant-or-balanced)
      (answer-in-one-query)
      ((oracle-f-constant-or-balanced . classical-requires-2-to-n-minus-1-plus-1-queries)
       (classical-requires-2-to-n-minus-1-plus-1-queries . quantum-requires-1-query)
       (quantum-requires-1-query . exponential-speedup)
       (exponential-speedup . answer-in-one-query)))

    ;;; Bernstein-Vazirani: find hidden string s where f(x) = s·x mod 2
    (Bernstein-Vazirani
      (oracle-f-dot-product-with-hidden-s)
      (find-s-in-one-query)
      ((oracle-f-dot-product-with-hidden-s . classical-requires-n-queries)
       (classical-requires-n-queries . quantum-requires-1-query)
       (quantum-requires-1-query . find-s-in-one-query)))

    ;;; Simon's algorithm: find period of f
    (Simon
      (oracle-f-with-hidden-period-s)
      (find-period-in-O-n-queries)
      ((oracle-f-with-hidden-period-s . classical-requires-2-to-n/2-queries)
       (classical-requires-2-to-n/2-queries . quantum-requires-O-n-queries)
       (quantum-requires-O-n-queries . exponential-speedup)
       (exponential-speedup . find-period-in-O-n-queries)))

    ;;; Quantum Fourier Transform
    (QFT
      (quantum-state-of-n-qubits)
      (discrete-Fourier-transform-of-amplitudes)
      ((quantum-state-of-n-qubits . O-n-squared-gates)
       (O-n-squared-gates . classical-FFT-requires-O-n-2-to-n)
       (classical-FFT-requires-O-n-2-to-n . exponential-speedup)
       (exponential-speedup . basis-of-Shor-algorithm)
       (basis-of-Shor-algorithm . discrete-Fourier-transform-of-amplitudes)))

    ;;; Shor's algorithm: factor integers
    ;;; SOURCE: [Shor-1994]
    (Shor-factoring
      (integer-N-to-factor)
      (prime-factors-in-O-log-N-cubed)
      ((integer-N-to-factor . reduce-to-period-finding)
       (reduce-to-period-finding . QFT-finds-period)
       (QFT-finds-period . period-gives-factors-via-GCD)
       (period-gives-factors-via-GCD . polynomial-time)
       (polynomial-time . classical-best-is-sub-exponential)
       (classical-best-is-sub-exponential . breaks-RSA)
       (breaks-RSA . prime-factors-in-O-log-N-cubed)))

    ;;; Grover's search: unstructured search
    ;;; SOURCE: [Grover-1996]
    (Grover-search
      (unsorted-database-of-N-items)
      (find-target-in-O-sqrt-N)
      ((unsorted-database-of-N-items . classical-requires-O-N-queries)
       (classical-requires-O-N-queries . Grover-requires-O-sqrt-N)
       (Grover-requires-O-sqrt-N . quadratic-speedup)
       (quadratic-speedup . provably-optimal-BBBV-1997)
       (provably-optimal-BBBV-1997 . find-target-in-O-sqrt-N)))

    ;;; Quantum phase estimation
    (phase-estimation
      (unitary-U-and-eigenstate)
      (estimate-eigenvalue-phase)
      ((unitary-U-and-eigenstate . controlled-U-operations)
       (controlled-U-operations . inverse-QFT)
       (inverse-QFT . phase-in-ancilla-register)
       (phase-in-ancilla-register . precision-scales-with-ancilla-count)
       (precision-scales-with-ancilla-count . estimate-eigenvalue-phase)))

    ;;; Variational Quantum Eigensolver
    (VQE
      (Hamiltonian-H)
      (approximate-ground-state-energy)
      ((Hamiltonian-H . parameterized-quantum-circuit)
       (parameterized-quantum-circuit . measure-expectation-value)
       (measure-expectation-value . classical-optimizer-updates-parameters)
       (classical-optimizer-updates-parameters . variational-principle)
       (variational-principle . converges-to-ground-state)
       (converges-to-ground-state . approximate-ground-state-energy)))

    ;;; Quantum approximate optimization (QAOA)
    (QAOA
      (combinatorial-optimization-problem)
      (approximate-solution)
      ((combinatorial-optimization-problem . encode-as-Hamiltonian)
       (encode-as-Hamiltonian . alternating-cost-and-mixer)
       (alternating-cost-and-mixer . p-rounds-of-evolution)
       (p-rounds-of-evolution . measure-and-optimize-angles)
       (measure-and-optimize-angles . approximate-solution)))

    ;;; Quantum simulation
    (Hamiltonian-simulation
      (physical-Hamiltonian-H)
      (simulate-time-evolution)
      ((physical-Hamiltonian-H . decompose-into-local-terms)
       (decompose-into-local-terms . Trotter-Suzuki-decomposition)
       (Trotter-Suzuki-decomposition . sequence-of-gates)
       (sequence-of-gates . exponential-advantage-over-classical)
       (exponential-advantage-over-classical . simulate-time-evolution)))

    ;;; Quantum machine learning
    (quantum-kernel-estimation
      (data-points-in-feature-space)
      (kernel-matrix-from-quantum-circuit)
      ((data-points-in-feature-space . encode-in-quantum-state)
       (encode-in-quantum-state . inner-product-via-SWAP-test)
       (inner-product-via-SWAP-test . kernel-matrix)
       (kernel-matrix . feed-to-classical-SVM)
       (feed-to-classical-SVM . kernel-matrix-from-quantum-circuit)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM COMMUNICATION PROTOCOLS
    ;;; ═══════════════════════════════════════════════════════════

    (quantum-teleportation
      (unknown-qubit-state . shared-Bell-pair)
      (state-transferred-to-remote-qubit)
      ((unknown-qubit-state . Bell-measurement-with-half-of-pair)
       (Bell-measurement-with-half-of-pair . two-classical-bits-sent)
       (two-classical-bits-sent . receiver-applies-correction)
       (receiver-applies-correction . original-state-at-receiver)
       (original-state-at-receiver . original-destroyed-no-cloning)
       (original-destroyed-no-cloning . state-transferred-to-remote-qubit)))

    (superdense-coding
      (shared-Bell-pair . two-classical-bits)
      (send-2-bits-via-1-qubit)
      ((shared-Bell-pair . sender-encodes-2-bits-on-their-half)
       (sender-encodes-2-bits-on-their-half . sends-1-qubit)
       (sends-1-qubit . receiver-Bell-measures-both)
       (receiver-Bell-measures-both . recovers-2-classical-bits)
       (recovers-2-classical-bits . send-2-bits-via-1-qubit)))

    (QKD-BB84
      (Alice-and-Bob)
      (shared-secret-key-information-theoretically-secure)
      ((Alice-and-Bob . Alice-sends-qubits-in-random-bases)
       (Alice-sends-qubits-in-random-bases . Bob-measures-in-random-bases)
       (Bob-measures-in-random-bases . public-comparison-of-bases)
       (public-comparison-of-bases . matching-bases-kept)
       (matching-bases-kept . eavesdropper-detected-by-error-rate)
       (eavesdropper-detected-by-error-rate . no-cloning-prevents-undetected-copy)
       (no-cloning-prevents-undetected-copy . shared-secret-key-information-theoretically-secure)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM ERROR CORRECTION
    ;;; ═══════════════════════════════════════════════════════════

    (no-cloning-theorem
      (unknown-quantum-state)
      (cannot-be-perfectly-copied)
      ((unknown-quantum-state . linearity-of-quantum-mechanics)
       (linearity-of-quantum-mechanics . cloning-would-violate-linearity)
       (cloning-would-violate-linearity . Wootters-Zurek-1982)
       (Wootters-Zurek-1982 . cannot-be-perfectly-copied)))

    (quantum-error-correction
      (logical-qubit)
      (encoded-in-multiple-physical-qubits)
      ((logical-qubit . errors-are-bit-flip-phase-flip-or-both)
       (errors-are-bit-flip-phase-flip-or-both . syndrome-measurement)
       (syndrome-measurement . identifies-error-without-measuring-state)
       (identifies-error-without-measuring-state . correction-applied)
       (correction-applied . encoded-in-multiple-physical-qubits)))

    (surface-code
      (2D-grid-of-physical-qubits)
      (threshold-error-rate-approximately-1-pct)
      ((2D-grid-of-physical-qubits . data-qubits-and-syndrome-qubits)
       (data-qubits-and-syndrome-qubits . nearest-neighbor-interactions-only)
       (nearest-neighbor-interactions-only . topological-protection)
       (topological-protection . threshold-error-rate-approximately-1-pct)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM ADVANTAGE CLASSIFICATION
    ;;; ═══════════════════════════════════════════════════════════

    (BQP
      (bounded-error-quantum-polynomial-time)
      (problems-efficiently-solvable-on-quantum-computer)
      ((bounded-error-quantum-polynomial-time . contains-P)
       (contains-P . contained-in-PSPACE)
       (contained-in-PSPACE . believed-larger-than-P)
       (believed-larger-than-P . factoring-is-in-BQP)
       (factoring-is-in-BQP . problems-efficiently-solvable-on-quantum-computer)))

    (quantum-supremacy
      (specific-computational-task)
      (quantum-faster-than-any-classical)
      ((specific-computational-task . random-circuit-sampling)
       (random-circuit-sampling . Google-Sycamore-2019-53-qubits)
       (Google-Sycamore-2019-53-qubits . 200-seconds-vs-10000-years-claimed)
       (200-seconds-vs-10000-years-claimed . quantum-faster-than-any-classical)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHYSICAL IMPLEMENTATIONS
    ;;; ═══════════════════════════════════════════════════════════

    (superconducting-qubits
      (Josephson-junction)
      (transmon-qubit)
      ((Josephson-junction . nonlinear-inductor)
       (nonlinear-inductor . creates-anharmonic-oscillator)
       (creates-anharmonic-oscillator . lowest-two-levels-are-qubit)
       (lowest-two-levels-are-qubit . operates-at-millikelvin)
       (operates-at-millikelvin . gate-times-nanoseconds)
       (gate-times-nanoseconds . transmon-qubit)))

    (trapped-ion-qubits
      (individual-ions-in-RF-trap)
      (longest-coherence-times)
      ((individual-ions-in-RF-trap . internal-states-are-qubit)
       (internal-states-are-qubit . laser-pulses-for-gates)
       (laser-pulses-for-gates . Coulomb-interaction-for-entanglement)
       (Coulomb-interaction-for-entanglement . all-to-all-connectivity)
       (all-to-all-connectivity . longest-coherence-times)))

    (photonic-qubits
      (single-photons)
      (naturally-resistant-to-decoherence)
      ((single-photons . polarization-or-path-encoding)
       (polarization-or-path-encoding . beam-splitters-and-phase-shifters)
       (beam-splitters-and-phase-shifters . measurement-based-quantum-computation)
       (measurement-based-quantum-computation . room-temperature-operation)
       (room-temperature-operation . naturally-resistant-to-decoherence)))

    (topological-qubits
      (non-Abelian-anyons)
      (intrinsically-error-protected)
      ((non-Abelian-anyons . braiding-operations-are-gates)
       (braiding-operations-are-gates . topological-protection)
       (topological-protection . exponentially-suppressed-errors)
       (exponentially-suppressed-errors . not-yet-fully-demonstrated)
       (not-yet-fully-demonstrated . intrinsically-error-protected)))

  )

  ((quantum . quantum-computer-registered)))
