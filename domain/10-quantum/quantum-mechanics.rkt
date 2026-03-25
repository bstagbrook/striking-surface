#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Quantum Mechanics
;;; LAYER: 10-quantum
;;; DEPENDS ON: 01-particles (fermions, bosons), 07-waves (Planck
;;;   constant, de Broglie), 08-relativity (energy-momentum),
;;;   09-electromagnetism (Coulomb, photon)
;;; DEPENDED ON BY: quantum field theory, quantum computing,
;;;   chemistry (orbital structure), condensed matter, nuclear physics
;;;
;;; PURPOSE: The non-relativistic quantum mechanical framework —
;;; wave functions, measurement, operators, and the quantum numbers
;;; that determine atomic structure.
;;;
;;; SCOPE: Only accepted, experimentally verified results. No
;;; interpretational speculation beyond operational statements.
;;; Novel claims belong in research/.
;;;
;;; SOURCES:
;;; [Griffiths-2018] D.J. Griffiths, Introduction to Quantum
;;;   Mechanics, 3rd ed., Cambridge University Press, 2018.
;;; [Sakurai-2020] J.J. Sakurai & J. Napolitano, Modern Quantum
;;;   Mechanics, 3rd ed., Cambridge University Press, 2020.
;;; [Dirac-1930] P.A.M. Dirac, The Principles of Quantum Mechanics,
;;;   Oxford University Press, 1930.
;;; [NIST-2022] CODATA 2022 fundamental constants.
;;; [Born-1926] M. Born, Z. Phys. 37, 863 (1926). (Born rule)
;;; [Heisenberg-1927] W. Heisenberg, Z. Phys. 43, 172 (1927).
;;; [Schrodinger-1926] E. Schrodinger, Ann. d. Phys. 79, 361 (1926).
;;; [Bell-1964] J.S. Bell, Physics 1, 195 (1964).
;;; [Aspect-1982] A. Aspect, J. Dalibard, G. Roger, PRL 49, 1804 (1982).
;;; [Stern-Gerlach-1922] W. Gerlach & O. Stern, Z. Phys. 9, 349 (1922).
;;; [Pauli-1925] W. Pauli, Z. Phys. 31, 765 (1925).
;;; [Davisson-Germer-1927] C. Davisson & L. Germer, Nature 119, 558 (1927).
;;; [Young-1801] T. Young, Phil. Trans. R. Soc. 92, 12 (1802).
;;; [Jonsson-1961] C. Jonsson, Z. Phys. 161, 454 (1961).
;;; [Tonomura-1989] A. Tonomura et al., Am. J. Phys. 57, 117 (1989).
;;; [Zurek-2003] W.H. Zurek, Rev. Mod. Phys. 75, 715 (2003).
;;; [Gamow-1928] G. Gamow, Z. Phys. 51, 204 (1928).
;;; [EPR-1935] Einstein, Podolsky, Rosen, Phys. Rev. 47, 777 (1935).
;;;
;;; UNITS: SI throughout. Energies in eV or J as context requires.
;;; h-bar = 1.054571817e-34 J-s (derived from exact h).
;;;
;;; CALIBRATION: quantum-mechanics.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-quantum-mechanics

  ;;; Source declaration
  ((quantum-mechanics (Griffiths-Sakurai-Dirac) (authoritative)
    ((Griffiths-Sakurai-Dirac . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WAVE FUNCTION AND SCHRODINGER EQUATION
    ;;; SOURCE: [Schrodinger-1926], [Griffiths-2018] Ch. 1-2,
    ;;; [Sakurai-2020] Ch. 1
    ;;; Nobel Prize: Schrodinger 1933
    ;;; ═══════════════════════════════════════════════════════════

    ;;; The wave function psi(x,t) is the complete description of
    ;;; a quantum system's state.
    ;;; SOURCE: [Griffiths-2018] Sec. 1.1, [Dirac-1930] Ch. 1
    (wave-function
      (quantum-system)
      (described-by-psi-of-x-and-t)
      ((quantum-system . state-vector-in-Hilbert-space)
       (state-vector-in-Hilbert-space . position-representation-psi-x-t)
       (position-representation-psi-x-t . complex-valued-function)
       (complex-valued-function . contains-all-measurable-information)
       (contains-all-measurable-information . described-by-psi-of-x-and-t)))

    ;;; Born rule: |psi(x,t)|^2 dx is probability of finding particle
    ;;; in interval dx at time t.
    ;;; SOURCE: [Born-1926], Nobel Prize 1954
    (Born-rule
      (psi-of-x-t)
      (mod-psi-squared-is-probability-density)
      ((psi-of-x-t . complex-amplitude)
       (complex-amplitude . mod-psi-squared-equals-probability-density)
       (mod-psi-squared-equals-probability-density . integrate-over-all-space-equals-1)
       (integrate-over-all-space-equals-1 . normalization-condition)
       (normalization-condition . mod-psi-squared-is-probability-density)))

    ;;; Time-dependent Schrodinger equation:
    ;;; i h-bar d/dt |psi> = H |psi>
    ;;; SOURCE: [Schrodinger-1926], [Griffiths-2018] Eq. 1.1
    (time-dependent-Schrodinger-equation
      (quantum-state-psi)
      (i-hbar-dpsi/dt-equals-H-psi)
      ((quantum-state-psi . evolves-in-time)
       (evolves-in-time . governed-by-Hamiltonian-operator-H)
       (governed-by-Hamiltonian-operator-H . H-equals-kinetic-plus-potential)
       (H-equals-kinetic-plus-potential . T-equals-minus-hbar2-over-2m-nabla2)
       (T-equals-minus-hbar2-over-2m-nabla2 . first-order-in-time)
       (first-order-in-time . deterministic-evolution-of-psi)
       (deterministic-evolution-of-psi . i-hbar-dpsi/dt-equals-H-psi)))

    ;;; Time-independent Schrodinger equation:
    ;;; H psi = E psi  (eigenvalue equation)
    ;;; SOURCE: [Griffiths-2018] Sec. 2.1
    (time-independent-Schrodinger-equation
      (stationary-state)
      (H-psi-equals-E-psi)
      ((stationary-state . separable-solution-psi-x-times-phi-t)
       (separable-solution-psi-x-times-phi-t . time-part-exp-minus-iEt-over-hbar)
       (time-part-exp-minus-iEt-over-hbar . spatial-part-satisfies-eigenvalue-equation)
       (spatial-part-satisfies-eigenvalue-equation . E-is-energy-eigenvalue)
       (E-is-energy-eigenvalue . H-psi-equals-E-psi)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SUPERPOSITION PRINCIPLE
    ;;; SOURCE: [Dirac-1930] Ch. 1, [Griffiths-2018] Sec. 2.1,
    ;;; [Sakurai-2020] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    ;;; If psi1 and psi2 are solutions, then a*psi1 + b*psi2 is
    ;;; also a solution (linearity of Schrodinger equation).
    (superposition-principle
      (psi1-and-psi2-are-valid-states)
      (linear-combination-is-also-valid-state)
      ((psi1-and-psi2-are-valid-states . Schrodinger-equation-is-linear)
       (Schrodinger-equation-is-linear . any-linear-combination-a-psi1-plus-b-psi2)
       (any-linear-combination-a-psi1-plus-b-psi2 . also-satisfies-Schrodinger-equation)
       (also-satisfies-Schrodinger-equation . system-can-be-in-multiple-states-simultaneously)
       (system-can-be-in-multiple-states-simultaneously . linear-combination-is-also-valid-state)))

    ;;; General solution as superposition of energy eigenstates:
    ;;; psi(x,t) = sum_n c_n psi_n(x) exp(-i E_n t / h-bar)
    ;;; SOURCE: [Griffiths-2018] Eq. 2.18
    (eigenstate-expansion
      (general-state-psi)
      (sum-of-energy-eigenstates-with-coefficients)
      ((general-state-psi . expandable-in-energy-eigenbasis)
       (expandable-in-energy-eigenbasis . psi-equals-sum-cn-psi-n-exp-minus-iEnt/hbar)
       (psi-equals-sum-cn-psi-n-exp-minus-iEnt/hbar . cn-squared-is-probability-of-measuring-En)
       (cn-squared-is-probability-of-measuring-En . sum-cn-squared-equals-1)
       (sum-cn-squared-equals-1 . sum-of-energy-eigenstates-with-coefficients)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MEASUREMENT AND WAVE FUNCTION COLLAPSE
    ;;; SOURCE: [Dirac-1930], [von Neumann-1932], [Griffiths-2018]
    ;;; Sec. 1.3-1.4, [Sakurai-2020] Sec. 1.4
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Measurement postulate: measuring observable A yields one
    ;;; of its eigenvalues a_n with probability |<a_n|psi>|^2.
    ;;; SOURCE: [Dirac-1930] Ch. 2, [Griffiths-2018] Sec. 1.3
    (measurement-postulate
      (observable-A-represented-by-Hermitian-operator)
      (measurement-yields-eigenvalue)
      ((observable-A-represented-by-Hermitian-operator . eigenvalues-are-real)
       (eigenvalues-are-real . eigenstates-are-orthogonal)
       (eigenstates-are-orthogonal . probability-of-an-equals-mod-braket-an-psi-squared)
       (probability-of-an-equals-mod-braket-an-psi-squared . measurement-yields-eigenvalue)))

    ;;; Wave function collapse: after measurement yielding a_n,
    ;;; the state becomes |a_n>.
    ;;; SOURCE: [Dirac-1930], [Griffiths-2018] Sec. 1.3
    (wave-function-collapse
      (measurement-of-observable-A-yields-an)
      (state-projects-to-eigenstate-an)
      ((measurement-of-observable-A-yields-an . superposition-destroyed)
       (superposition-destroyed . state-instantaneously-becomes-eigenstate-an)
       (state-instantaneously-becomes-eigenstate-an . subsequent-measurement-yields-same-an)
       (subsequent-measurement-yields-same-an . non-unitary-irreversible-process)
       (non-unitary-irreversible-process . state-projects-to-eigenstate-an)))

    ;;; Expectation value: <A> = <psi|A|psi>
    ;;; SOURCE: [Griffiths-2018] Sec. 1.5
    (expectation-value
      (observable-A-in-state-psi)
      (braket-psi-A-psi)
      ((observable-A-in-state-psi . average-over-many-measurements)
       (average-over-many-measurements . equals-sum-an-times-probability-an)
       (equals-sum-an-times-probability-an . computed-as-braket-psi-A-psi)
       (computed-as-braket-psi-A-psi . braket-psi-A-psi)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HEISENBERG UNCERTAINTY PRINCIPLE
    ;;; SOURCE: [Heisenberg-1927], [Griffiths-2018] Sec. 3.5,
    ;;; [Sakurai-2020] Sec. 1.6. Nobel Prize: Heisenberg 1932.
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Position-momentum uncertainty:
    ;;; delta-x * delta-p >= h-bar / 2
    ;;; SOURCE: [Heisenberg-1927], [Griffiths-2018] Eq. 3.62
    (position-momentum-uncertainty
      (simultaneous-measurement-of-x-and-p)
      (delta-x-times-delta-p-ge-hbar-over-2)
      ((simultaneous-measurement-of-x-and-p . x-and-p-are-conjugate-variables)
       (x-and-p-are-conjugate-variables . commutator-xp-minus-px-equals-i-hbar)
       (commutator-xp-minus-px-equals-i-hbar . non-commuting-operators)
       (non-commuting-operators . cannot-simultaneously-have-sharp-values)
       (cannot-simultaneously-have-sharp-values . delta-x-times-delta-p-ge-hbar-over-2)))

    ;;; Energy-time uncertainty: delta-E * delta-t >= h-bar / 2
    ;;; SOURCE: [Griffiths-2018] Sec. 3.5.3
    (energy-time-uncertainty
      (energy-measurement-in-time-interval-delta-t)
      (delta-E-times-delta-t-ge-hbar-over-2)
      ((energy-measurement-in-time-interval-delta-t . delta-t-is-time-for-system-to-change)
       (delta-t-is-time-for-system-to-change . short-lived-states-have-broad-energy)
       (short-lived-states-have-broad-energy . natural-linewidth-of-spectral-lines)
       (natural-linewidth-of-spectral-lines . delta-E-times-delta-t-ge-hbar-over-2)))

    ;;; General uncertainty relation:
    ;;; sigma_A sigma_B >= (1/2) |<[A,B]>|
    ;;; SOURCE: [Griffiths-2018] Eq. 3.62, [Sakurai-2020] Sec. 1.6
    (generalized-uncertainty-relation
      (observables-A-and-B)
      (sigma-A-sigma-B-ge-half-mod-braket-commutator-AB)
      ((observables-A-and-B . represented-by-Hermitian-operators)
       (represented-by-Hermitian-operators . commutator-AB-equals-AB-minus-BA)
       (commutator-AB-equals-AB-minus-BA . if-commutator-nonzero-then-incompatible)
       (if-commutator-nonzero-then-incompatible . Robertson-Schrodinger-inequality)
       (Robertson-Schrodinger-inequality . sigma-A-sigma-B-ge-half-mod-braket-commutator-AB)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM TUNNELING
    ;;; SOURCE: [Gamow-1928], [Griffiths-2018] Sec. 2.5,
    ;;; [Sakurai-2020] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Particle with energy E < V0 can penetrate a potential barrier
    ;;; of height V0. Transmission coefficient T > 0.
    ;;; SOURCE: [Gamow-1928], [Griffiths-2018] Sec. 2.5
    (quantum-tunneling
      (particle-with-E-less-than-barrier-V0)
      (nonzero-transmission-probability)
      ((particle-with-E-less-than-barrier-V0 . classically-forbidden-region)
       (classically-forbidden-region . wave-function-does-not-vanish-inside-barrier)
       (wave-function-does-not-vanish-inside-barrier . exponential-decay-kappa-equals-sqrt-2m-V0-minus-E-over-hbar)
       (exponential-decay-kappa-equals-sqrt-2m-V0-minus-E-over-hbar . thinner-barrier-higher-transmission)
       (thinner-barrier-higher-transmission . nonzero-transmission-probability)))

    ;;; Alpha decay as tunneling: Gamow's theory
    ;;; SOURCE: [Gamow-1928], Nobel context (no direct Nobel for Gamow)
    (alpha-decay-tunneling
      (alpha-particle-inside-nucleus)
      (tunnels-through-Coulomb-barrier)
      ((alpha-particle-inside-nucleus . confined-by-Coulomb-barrier)
       (confined-by-Coulomb-barrier . barrier-height-exceeds-alpha-kinetic-energy)
       (barrier-height-exceeds-alpha-kinetic-energy . exponential-dependence-on-barrier-width)
       (exponential-dependence-on-barrier-width . explains-enormous-half-life-range)
       (explains-enormous-half-life-range . tunnels-through-Coulomb-barrier)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM ENTANGLEMENT AND BELL'S THEOREM
    ;;; SOURCE: [EPR-1935], [Bell-1964], [Aspect-1982].
    ;;; Nobel Prize: Aspect, Clauser, Zeilinger 2022.
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Entanglement: composite system in a state that cannot be
    ;;; factored into product of individual states.
    ;;; SOURCE: [Griffiths-2018] Sec. 12.1, [Sakurai-2020] Ch. 6
    (quantum-entanglement
      (two-particle-system)
      (non-separable-joint-state)
      ((two-particle-system . joint-state-psi-AB)
       (joint-state-psi-AB . cannot-be-written-as-psi-A-tensor-psi-B)
       (cannot-be-written-as-psi-A-tensor-psi-B . measurement-on-A-instantly-determines-B)
       (measurement-on-A-instantly-determines-B . correlations-independent-of-separation-distance)
       (correlations-independent-of-separation-distance . non-separable-joint-state)))

    ;;; EPR paradox: Einstein, Podolsky, Rosen 1935
    ;;; SOURCE: [EPR-1935] Phys. Rev. 47, 777
    (EPR-paradox
      (entangled-pair-with-correlated-observables)
      (local-realism-vs-QM-completeness)
      ((entangled-pair-with-correlated-observables . measuring-position-of-A-determines-position-of-B)
       (measuring-position-of-A-determines-position-of-B . measuring-momentum-of-A-determines-momentum-of-B)
       (measuring-momentum-of-A-determines-momentum-of-B . EPR-argued-hidden-variables-must-exist)
       (EPR-argued-hidden-variables-must-exist . QM-either-incomplete-or-nonlocal)
       (QM-either-incomplete-or-nonlocal . local-realism-vs-QM-completeness)))

    ;;; Bell's theorem: no local hidden variable theory can
    ;;; reproduce all QM predictions.
    ;;; SOURCE: [Bell-1964] Physics 1, 195
    (Bell-theorem
      (local-hidden-variable-theories)
      (cannot-reproduce-QM-predictions)
      ((local-hidden-variable-theories . assume-locality-and-realism)
       (assume-locality-and-realism . imply-Bell-inequality-CHSH-S-le-2)
       (imply-Bell-inequality-CHSH-S-le-2 . QM-predicts-S-up-to-2-sqrt-2)
       (QM-predicts-S-up-to-2-sqrt-2 . Tsirelson-bound-2-sqrt-2-approx-2.828)
       (Tsirelson-bound-2-sqrt-2-approx-2.828 . cannot-reproduce-QM-predictions)))

    ;;; Aspect experiment: experimental violation of Bell inequality
    ;;; SOURCE: [Aspect-1982] PRL 49, 1804. Nobel Prize 2022.
    (Aspect-experiment
      (entangled-photon-pairs-from-calcium-cascade)
      (Bell-inequality-violated-by-5-standard-deviations)
      ((entangled-photon-pairs-from-calcium-cascade . polarization-correlated)
       (polarization-correlated . spacelike-separated-measurements)
       (spacelike-separated-measurements . measured-S-equals-2.697-pm-0.015)
       (measured-S-equals-2.697-pm-0.015 . violates-CHSH-bound-of-2)
       (violates-CHSH-bound-of-2 . rules-out-local-hidden-variables)
       (rules-out-local-hidden-variables . Bell-inequality-violated-by-5-standard-deviations)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPIN ANGULAR MOMENTUM
    ;;; SOURCE: [Stern-Gerlach-1922], [Griffiths-2018] Ch. 4,
    ;;; [Sakurai-2020] Ch. 3. Nobel Prize: Stern 1943.
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Intrinsic angular momentum with no classical analog.
    ;;; SOURCE: [Griffiths-2018] Sec. 4.4
    (spin
      (intrinsic-angular-momentum)
      (quantized-in-half-integer-or-integer-multiples-of-hbar)
      ((intrinsic-angular-momentum . no-classical-analog)
       (no-classical-analog . not-orbital-rotation)
       (not-orbital-rotation . S-squared-eigenvalue-s-times-s-plus-1-hbar2)
       (S-squared-eigenvalue-s-times-s-plus-1-hbar2 . Sz-eigenvalue-ms-times-hbar)
       (Sz-eigenvalue-ms-times-hbar . ms-ranges-from-minus-s-to-plus-s)
       (ms-ranges-from-minus-s-to-plus-s . quantized-in-half-integer-or-integer-multiples-of-hbar)))

    ;;; Fermion spin: half-integer (1/2, 3/2, 5/2, ...)
    ;;; SOURCE: [Griffiths-2018] Sec. 5.1, [PDG-2024]
    (fermion-spin
      (electrons-quarks-protons-neutrons)
      (spin-1/2)
      ((electrons-quarks-protons-neutrons . fundamental-matter-particles)
       (fundamental-matter-particles . spin-quantum-number-s-equals-1/2)
       (spin-quantum-number-s-equals-1/2 . two-possible-ms-values)
       (two-possible-ms-values . ms-equals-plus-1/2-or-minus-1/2)
       (ms-equals-plus-1/2-or-minus-1/2 . spin-1/2)))

    ;;; Boson spin: integer (0, 1, 2, ...)
    ;;; SOURCE: [Griffiths-2018] Sec. 5.1, [PDG-2024]
    (boson-spin
      (photon-W-Z-gluon-Higgs)
      (integer-spin)
      ((photon-W-Z-gluon-Higgs . force-carriers-and-Higgs)
       (force-carriers-and-Higgs . photon-spin-1)
       (photon-spin-1 . W-and-Z-spin-1)
       (W-and-Z-spin-1 . gluon-spin-1)
       (gluon-spin-1 . Higgs-spin-0)
       (Higgs-spin-0 . graviton-predicted-spin-2)
       (graviton-predicted-spin-2 . integer-spin)))

    ;;; Stern-Gerlach experiment: space quantization of angular momentum
    ;;; SOURCE: [Stern-Gerlach-1922] Z. Phys. 9, 349
    (Stern-Gerlach-experiment
      (silver-atoms-through-inhomogeneous-magnetic-field)
      (beam-splits-into-discrete-components)
      ((silver-atoms-through-inhomogeneous-magnetic-field . force-proportional-to-dB/dz)
       (force-proportional-to-dB/dz . classically-expect-continuous-spread)
       (classically-expect-continuous-spread . observed-two-discrete-spots)
       (observed-two-discrete-spots . demonstrates-spin-1/2-quantization)
       (demonstrates-spin-1/2-quantization . beam-splits-into-discrete-components)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PAULI EXCLUSION PRINCIPLE
    ;;; SOURCE: [Pauli-1925] Z. Phys. 31, 765.
    ;;; Nobel Prize: Pauli 1945.
    ;;; ═══════════════════════════════════════════════════════════

    (Pauli-exclusion-principle
      (two-identical-fermions)
      (cannot-occupy-same-quantum-state)
      ((two-identical-fermions . wave-function-must-be-antisymmetric)
       (wave-function-must-be-antisymmetric . exchanging-two-fermions-flips-sign)
       (exchanging-two-fermions-flips-sign . if-same-state-then-psi-equals-minus-psi)
       (if-same-state-then-psi-equals-minus-psi . implies-psi-equals-zero)
       (implies-psi-equals-zero . cannot-occupy-same-quantum-state)))

    ;;; Consequences of exclusion
    ;;; SOURCE: [Griffiths-2018] Sec. 5.2, [Pauli-1925]
    (exclusion-consequences
      (fermion-exclusion)
      (determines-atomic-structure-and-stability-of-matter)
      ((fermion-exclusion . electrons-fill-successive-orbitals)
       (electrons-fill-successive-orbitals . periodic-table-structure)
       (periodic-table-structure . degeneracy-pressure-in-white-dwarfs)
       (degeneracy-pressure-in-white-dwarfs . Chandrasekhar-limit-1.4-solar-masses)
       (Chandrasekhar-limit-1.4-solar-masses . determines-atomic-structure-and-stability-of-matter)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM HARMONIC OSCILLATOR
    ;;; SOURCE: [Griffiths-2018] Sec. 2.3, [Sakurai-2020] Ch. 2
    ;;; ═══════════════════════════════════════════════════════════

    ;;; V(x) = (1/2) m omega^2 x^2
    ;;; Energy eigenvalues: E_n = (n + 1/2) h-bar omega
    ;;; SOURCE: [Griffiths-2018] Eq. 2.62
    (quantum-harmonic-oscillator
      (particle-in-quadratic-potential)
      (equally-spaced-energy-levels-En-equals-n-plus-half-hbar-omega)
      ((particle-in-quadratic-potential . V-equals-half-m-omega2-x2)
       (V-equals-half-m-omega2-x2 . Schrodinger-equation-yields-discrete-En)
       (Schrodinger-equation-yields-discrete-En . En-equals-n-plus-half-hbar-omega)
       (En-equals-n-plus-half-hbar-omega . n-equals-0-1-2-3-...)
       (n-equals-0-1-2-3-... . equally-spaced-by-hbar-omega)
       (equally-spaced-by-hbar-omega . equally-spaced-energy-levels-En-equals-n-plus-half-hbar-omega)))

    ;;; Zero-point energy: E_0 = (1/2) h-bar omega
    ;;; Particle cannot have zero energy — uncertainty principle.
    ;;; SOURCE: [Griffiths-2018] Sec. 2.3
    (zero-point-energy
      (ground-state-n-equals-0)
      (E0-equals-half-hbar-omega)
      ((ground-state-n-equals-0 . minimum-energy-not-zero)
       (minimum-energy-not-zero . consequence-of-uncertainty-principle)
       (consequence-of-uncertainty-principle . localizing-particle-requires-kinetic-energy)
       (localizing-particle-requires-kinetic-energy . E0-equals-half-hbar-omega)))

    ;;; Ladder operators: a+ (raising) and a- (lowering)
    ;;; SOURCE: [Griffiths-2018] Sec. 2.3.1, [Dirac-1930]
    (ladder-operators
      (creation-and-annihilation-operators)
      (a-plus-raises-a-minus-lowers-quantum-number)
      ((creation-and-annihilation-operators . algebraic-method-for-QHO)
       (algebraic-method-for-QHO . a-plus-psi-n-equals-sqrt-n-plus-1-psi-n-plus-1)
       (a-plus-psi-n-equals-sqrt-n-plus-1-psi-n-plus-1 . a-minus-psi-n-equals-sqrt-n-psi-n-minus-1)
       (a-minus-psi-n-equals-sqrt-n-psi-n-minus-1 . a-minus-psi-0-equals-zero)
       (a-minus-psi-0-equals-zero . a-plus-raises-a-minus-lowers-quantum-number)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HYDROGEN ATOM ENERGY LEVELS
    ;;; SOURCE: [Griffiths-2018] Ch. 4, [Sakurai-2020] Ch. 4
    ;;; Bohr model: [Bohr-1913] Phil. Mag. 26, 1 (1913).
    ;;; Nobel Prize: Bohr 1922.
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Bohr model (approximation): E_n = -13.6 eV / n^2
    ;;; SOURCE: [Bohr-1913], [Griffiths-2018] Sec. 4.2
    (Bohr-model
      (electron-orbiting-proton)
      (E-n-equals-minus-13.6-eV-over-n-squared)
      ((electron-orbiting-proton . quantized-angular-momentum-L-equals-n-hbar)
       (quantized-angular-momentum-L-equals-n-hbar . only-discrete-orbits-allowed)
       (only-discrete-orbits-allowed . Bohr-radius-a0-equals-0.529-angstrom)
       (Bohr-radius-a0-equals-0.529-angstrom . orbit-radius-rn-equals-n2-times-a0)
       (orbit-radius-rn-equals-n2-times-a0 . E-n-equals-minus-13.6-eV-over-n-squared)))

    ;;; Exact QM solution: same energy eigenvalues, but with full
    ;;; quantum numbers (n, l, ml) and probability distributions.
    ;;; SOURCE: [Griffiths-2018] Sec. 4.2, [Sakurai-2020] Sec. 4.2
    (hydrogen-atom-exact
      (electron-in-Coulomb-potential)
      (En-equals-minus-13.6-eV-over-n2-with-degeneracy-n2)
      ((electron-in-Coulomb-potential . V-equals-minus-e2-over-4pi-epsilon0-r)
       (V-equals-minus-e2-over-4pi-epsilon0-r . separation-in-spherical-coordinates)
       (separation-in-spherical-coordinates . radial-equation-yields-energy-eigenvalues)
       (radial-equation-yields-energy-eigenvalues . En-depends-only-on-n-not-l)
       (En-depends-only-on-n-not-l . accidental-degeneracy-of-Coulomb-potential)
       (accidental-degeneracy-of-Coulomb-potential . n2-degenerate-states-per-level)
       (n2-degenerate-states-per-level . En-equals-minus-13.6-eV-over-n2-with-degeneracy-n2)))

    ;;; 13.6 eV ground state energy
    ;;; SOURCE: [NIST-2022] ionization energy of hydrogen
    (hydrogen-ground-state-energy
      (n-equals-1)
      (minus-13.605693-eV)
      ((n-equals-1 . ground-state)
       (ground-state . ionization-energy-equals-13.605693-eV)
       (ionization-energy-equals-13.605693-eV . NIST-accepted-value)
       (NIST-accepted-value . equals-minus-me-e4-over-2-hbar2-times-4pi-epsilon0-squared)
       (equals-minus-me-e4-over-2-hbar2-times-4pi-epsilon0-squared . minus-13.605693-eV)))

    ;;; Bohr radius
    ;;; SOURCE: [NIST-2022] CODATA
    (Bohr-radius
      (a0)
      (0.529177210903-angstrom)
      ((a0 . most-probable-distance-in-1s-orbital)
       (most-probable-distance-in-1s-orbital . a0-equals-4pi-epsilon0-hbar2-over-me-e2)
       (a0-equals-4pi-epsilon0-hbar2-over-me-e2 . 5.29177210903e-11-m)
       (5.29177210903e-11-m . 0.529177210903-angstrom)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM NUMBERS
    ;;; SOURCE: [Griffiths-2018] Sec. 4.2-4.4,
    ;;; [Sakurai-2020] Ch. 3-4
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Principal quantum number n: determines energy level
    ;;; SOURCE: [Griffiths-2018] Sec. 4.2
    (principal-quantum-number
      (n)
      (positive-integer-determines-energy-shell)
      ((n . n-equals-1-2-3-...)
       (n-equals-1-2-3-... . determines-energy-En-equals-minus-13.6-over-n2-eV)
       (determines-energy-En-equals-minus-13.6-over-n2-eV . determines-maximum-l)
       (determines-maximum-l . l-ranges-from-0-to-n-minus-1)
       (l-ranges-from-0-to-n-minus-1 . positive-integer-determines-energy-shell)))

    ;;; Orbital angular momentum quantum number l
    ;;; SOURCE: [Griffiths-2018] Sec. 4.1, 4.3
    (orbital-quantum-number
      (l)
      (integer-from-0-to-n-minus-1-determines-orbital-shape)
      ((l . L-squared-eigenvalue-l-times-l-plus-1-hbar2)
       (L-squared-eigenvalue-l-times-l-plus-1-hbar2 . l-equals-0-is-s-orbital-spherical)
       (l-equals-0-is-s-orbital-spherical . l-equals-1-is-p-orbital-dumbbell)
       (l-equals-1-is-p-orbital-dumbbell . l-equals-2-is-d-orbital)
       (l-equals-2-is-d-orbital . l-equals-3-is-f-orbital)
       (l-equals-3-is-f-orbital . integer-from-0-to-n-minus-1-determines-orbital-shape)))

    ;;; Magnetic quantum number ml
    ;;; SOURCE: [Griffiths-2018] Sec. 4.1
    (magnetic-quantum-number
      (ml)
      (integer-from-minus-l-to-plus-l-determines-orientation)
      ((ml . Lz-eigenvalue-ml-times-hbar)
       (Lz-eigenvalue-ml-times-hbar . ml-ranges-from-minus-l-to-plus-l)
       (ml-ranges-from-minus-l-to-plus-l . 2l-plus-1-possible-values)
       (2l-plus-1-possible-values . determines-orbital-orientation-in-magnetic-field)
       (determines-orbital-orientation-in-magnetic-field . integer-from-minus-l-to-plus-l-determines-orientation)))

    ;;; Spin magnetic quantum number ms
    ;;; SOURCE: [Griffiths-2018] Sec. 4.4
    (spin-magnetic-quantum-number
      (ms)
      (plus-or-minus-1/2-for-electrons)
      ((ms . Sz-eigenvalue-ms-times-hbar)
       (Sz-eigenvalue-ms-times-hbar . for-spin-1/2-particles)
       (for-spin-1/2-particles . ms-equals-plus-1/2-spin-up)
       (ms-equals-plus-1/2-spin-up . ms-equals-minus-1/2-spin-down)
       (ms-equals-minus-1/2-spin-down . plus-or-minus-1/2-for-electrons)))

    ;;; Complete specification: (n, l, ml, ms) uniquely determines
    ;;; an electron state in hydrogen.
    ;;; SOURCE: [Griffiths-2018] Sec. 5.2
    (quantum-number-set
      (n-l-ml-ms)
      (uniquely-specifies-electron-state-in-hydrogen)
      ((n-l-ml-ms . four-quantum-numbers-required)
       (four-quantum-numbers-required . n-determines-energy)
       (n-determines-energy . l-determines-orbital-shape)
       (l-determines-orbital-shape . ml-determines-orientation)
       (ml-determines-orientation . ms-determines-spin-projection)
       (ms-determines-spin-projection . uniquely-specifies-electron-state-in-hydrogen)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IDENTICAL PARTICLES — FERMIONS VS BOSONS
    ;;; SOURCE: [Griffiths-2018] Ch. 5, [Sakurai-2020] Ch. 7
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Exchange symmetry: fundamental distinction between
    ;;; fermions and bosons.
    ;;; SOURCE: [Griffiths-2018] Sec. 5.1
    (exchange-symmetry
      (two-identical-particles)
      (wave-function-symmetric-or-antisymmetric-under-exchange)
      ((two-identical-particles . truly-indistinguishable)
       (truly-indistinguishable . exchange-operator-P12-psi-equals-pm-psi)
       (exchange-operator-P12-psi-equals-pm-psi . plus-sign-is-symmetric-bosons)
       (plus-sign-is-symmetric-bosons . minus-sign-is-antisymmetric-fermions)
       (minus-sign-is-antisymmetric-fermions . wave-function-symmetric-or-antisymmetric-under-exchange)))

    ;;; Spin-statistics theorem: integer spin -> bosons -> symmetric;
    ;;; half-integer spin -> fermions -> antisymmetric.
    ;;; SOURCE: [Pauli-1940] Phys. Rev. 58, 716, [Griffiths-2018] Sec. 5.1
    (spin-statistics-theorem
      (spin-determines-statistics)
      (half-integer-spin-fermions-integer-spin-bosons)
      ((spin-determines-statistics . relativistic-quantum-field-theory-proof)
       (relativistic-quantum-field-theory-proof . half-integer-spin-obeys-Fermi-Dirac)
       (half-integer-spin-obeys-Fermi-Dirac . Fermi-Dirac-antisymmetric-wave-function)
       (Fermi-Dirac-antisymmetric-wave-function . integer-spin-obeys-Bose-Einstein)
       (integer-spin-obeys-Bose-Einstein . Bose-Einstein-symmetric-wave-function)
       (Bose-Einstein-symmetric-wave-function . half-integer-spin-fermions-integer-spin-bosons)))

    ;;; Bose-Einstein condensation: many bosons in same ground state
    ;;; SOURCE: [Einstein-1925], [Cornell-Wieman-1995] Science 269, 198.
    ;;; Nobel Prize: Cornell, Ketterle, Wieman 2001.
    (Bose-Einstein-condensation
      (identical-bosons-at-very-low-temperature)
      (macroscopic-occupation-of-ground-state)
      ((identical-bosons-at-very-low-temperature . de-Broglie-wavelength-exceeds-interparticle-spacing)
       (de-Broglie-wavelength-exceeds-interparticle-spacing . wave-functions-overlap)
       (wave-functions-overlap . bosons-can-all-occupy-same-state)
       (bosons-can-all-occupy-same-state . first-observed-in-rubidium-87-at-170-nanokelvin)
       (first-observed-in-rubidium-87-at-170-nanokelvin . macroscopic-occupation-of-ground-state)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTUM DECOHERENCE
    ;;; SOURCE: [Zurek-2003] Rev. Mod. Phys. 75, 715,
    ;;; [Griffiths-2018] Sec. 12.5, [Schlosshauer-2007]
    ;;; Decoherence and the Quantum-to-Classical Transition, Springer
    ;;; ═══════════════════════════════════════════════════════════

    (quantum-decoherence
      (quantum-system-interacting-with-environment)
      (loss-of-coherence-apparent-classical-behavior)
      ((quantum-system-interacting-with-environment . entanglement-with-many-environmental-degrees-of-freedom)
       (entanglement-with-many-environmental-degrees-of-freedom . off-diagonal-density-matrix-elements-decay)
       (off-diagonal-density-matrix-elements-decay . superposition-becomes-statistical-mixture)
       (superposition-becomes-statistical-mixture . interference-terms-vanish)
       (interference-terms-vanish . loss-of-coherence-apparent-classical-behavior)))

    ;;; Decoherence timescale: extremely rapid for macroscopic objects
    ;;; SOURCE: [Zurek-2003], [Schlosshauer-2007] Ch. 3
    (decoherence-timescale
      (macroscopic-object-in-thermal-environment)
      (decoherence-time-extremely-short)
      ((macroscopic-object-in-thermal-environment . many-environmental-photons-and-molecules)
       (many-environmental-photons-and-molecules . scattering-encodes-which-state-information)
       (scattering-encodes-which-state-information . decoherence-faster-for-larger-objects)
       (decoherence-faster-for-larger-objects . dust-grain-in-air-decoherence-time-approx-10e-31-seconds)
       (dust-grain-in-air-decoherence-time-approx-10e-31-seconds . decoherence-time-extremely-short)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DOUBLE-SLIT EXPERIMENT
    ;;; SOURCE: [Young-1801] (classical), [Davisson-Germer-1927]
    ;;; (electrons), [Jonsson-1961] (electron double-slit),
    ;;; [Tonomura-1989] (single-electron buildup).
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Young's double-slit: wave nature of light
    ;;; SOURCE: [Young-1801] Phil. Trans. R. Soc.
    (Young-double-slit
      (coherent-light-through-two-slits)
      (interference-pattern-on-screen)
      ((coherent-light-through-two-slits . each-slit-acts-as-coherent-source)
       (each-slit-acts-as-coherent-source . waves-from-two-slits-superpose)
       (waves-from-two-slits-superpose . path-difference-determines-constructive-or-destructive)
       (path-difference-determines-constructive-or-destructive . bright-fringes-at-d-sin-theta-equals-n-lambda)
       (bright-fringes-at-d-sin-theta-equals-n-lambda . interference-pattern-on-screen)))

    ;;; Electron double-slit: wave-particle duality
    ;;; SOURCE: [Jonsson-1961], [Tonomura-1989]
    (electron-double-slit
      (electrons-through-two-slits)
      (interference-pattern-builds-up-one-electron-at-a-time)
      ((electrons-through-two-slits . each-electron-detected-as-single-point)
       (each-electron-detected-as-single-point . particle-behavior-at-detector)
       (particle-behavior-at-detector . many-electrons-form-interference-pattern)
       (many-electrons-form-interference-pattern . wave-behavior-in-propagation)
       (wave-behavior-in-propagation . interference-pattern-builds-up-one-electron-at-a-time)))

    ;;; Which-path information destroys interference
    ;;; SOURCE: [Griffiths-2018] Sec. 1.1, [Feynman-1965] Lectures Vol. III Ch. 1
    (which-path-erasure
      (detector-placed-at-one-slit)
      (interference-pattern-disappears)
      ((detector-placed-at-one-slit . determines-which-slit-electron-passed-through)
       (determines-which-slit-electron-passed-through . entanglement-with-detector)
       (entanglement-with-detector . coherence-between-paths-destroyed)
       (coherence-between-paths-destroyed . pattern-becomes-sum-of-single-slit-patterns)
       (pattern-becomes-sum-of-single-slit-patterns . interference-pattern-disappears)))

  )

  ;;; Vacuum tube
  ((quantum-mechanics . quantum-mechanics-registered)))
