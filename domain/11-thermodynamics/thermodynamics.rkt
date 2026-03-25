#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Thermodynamics — energy, entropy, and equilibrium
;;; LAYER: 11-thermodynamics
;;; DEPENDS ON: 01-particles (atoms, molecules), 07-waves (blackbody),
;;;   08-relativity (energy-mass), 09-electromagnetism (thermal radiation)
;;; DEPENDED ON BY: chemistry, statistical mechanics, biophysics,
;;;   engineering, cosmology, information theory
;;;
;;; PURPOSE: The laws governing heat, work, energy, and entropy —
;;; the macroscopic consequences of microscopic statistical mechanics.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Callen-1985] Callen, Thermodynamics and an Introduction to
;;;   Thermostatistics, 2nd ed., Wiley
;;; [Schroeder-2000] Schroeder, An Introduction to Thermal Physics,
;;;   Addison-Wesley
;;; [NIST-2019] NIST SP 330: The International System of Units (SI),
;;;   2019 redefinition — Boltzmann constant exact
;;; [CODATA-2022] CODATA 2022 recommended values of fundamental constants
;;; [Clausius-1850] Clausius, On the Motive Power of Heat
;;; [Boltzmann-1877] Boltzmann, On the Relationship between the
;;;   Second Fundamental Theorem of the Mechanical Theory of Heat
;;;   and Probability Calculations
;;; [Carnot-1824] Carnot, Reflections on the Motive Power of Fire
;;; [Nernst-1906] Nernst, The New Heat Theorem (Third Law)
;;; [Shannon-1948] Shannon, A Mathematical Theory of Communication,
;;;   Bell System Technical Journal 27, pp. 379-423
;;; [Maxwell-1860] Maxwell, Illustrations of the Dynamical Theory of Gases
;;;
;;; UNITS: Stated explicitly. No ambiguous values.
;;; ═══════════════════════════════════════════════════════════════

(domain-thermodynamics

  ((thermodynamics (energy-entropy-equilibrium) (authoritative) ((energy-entropy-equilibrium . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNDAMENTAL CONSTANTS
    ;;; SOURCE: [NIST-2019], [CODATA-2022]
    ;;; ═══════════════════════════════════════════════════════════

    (Boltzmann-constant
      (k-B)
      (exactly-1.380649e-23-J/K)
      ((k-B . relates-temperature-to-energy)
       (relates-temperature-to-energy . defined-exact-since-2019-SI-redefinition)
       (defined-exact-since-2019-SI-redefinition . exactly-1.380649e-23-J/K)
       (exactly-1.380649e-23-J/K . bridges-microscopic-and-macroscopic)))

    (gas-constant
      (R)
      (8.314462618-J/mol-K)
      ((R . equals-N-A-times-k-B)
       (equals-N-A-times-k-B . N-A-equals-6.02214076e23-mol-inv-exact)
       (N-A-equals-6.02214076e23-mol-inv-exact . R-equals-8.314462618-J/mol-K)
       (R-equals-8.314462618-J/mol-K . 8.314462618-J/mol-K)))

    (absolute-zero
      (0-K)
      (minus-273.15-C)
      ((0-K . lowest-possible-temperature)
       (lowest-possible-temperature . all-thermal-motion-minimized)
       (all-thermal-motion-minimized . unattainable-by-finite-steps)
       (unattainable-by-finite-steps . minus-273.15-C)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ZEROTH LAW OF THERMODYNAMICS
    ;;; Thermal equilibrium is transitive — defines temperature
    ;;; SOURCE: [Callen-1985] Ch. 1, [Schroeder-2000] Sec. 1.1
    ;;; ═══════════════════════════════════════════════════════════

    (zeroth-law
      (three-systems-A-B-C)
      (thermal-equilibrium-is-transitive)
      ((three-systems-A-B-C . if-A-in-equilibrium-with-C)
       (if-A-in-equilibrium-with-C . and-B-in-equilibrium-with-C)
       (and-B-in-equilibrium-with-C . then-A-in-equilibrium-with-B)
       (then-A-in-equilibrium-with-B . thermal-equilibrium-is-transitive)
       (thermal-equilibrium-is-transitive . defines-temperature-as-state-variable)
       (defines-temperature-as-state-variable . justifies-thermometers)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FIRST LAW OF THERMODYNAMICS
    ;;; Conservation of energy: dU = dQ - dW
    ;;; SOURCE: [Callen-1985] Ch. 2, [Clausius-1850]
    ;;; ═══════════════════════════════════════════════════════════

    (first-law
      (thermodynamic-system)
      (energy-is-conserved)
      ((thermodynamic-system . has-internal-energy-U)
       (has-internal-energy-U . U-is-state-function)
       (U-is-state-function . dU-equals-dQ-minus-dW)
       (dU-equals-dQ-minus-dW . dQ-is-heat-added-to-system)
       (dQ-is-heat-added-to-system . dW-is-work-done-by-system)
       (dW-is-work-done-by-system . energy-is-conserved)))

    (internal-energy
      (U)
      (state-function-of-system)
      ((U . sum-of-all-microscopic-kinetic-and-potential-energies)
       (sum-of-all-microscopic-kinetic-and-potential-energies . depends-only-on-state)
       (depends-only-on-state . independent-of-path)
       (independent-of-path . state-function-of-system)))

    (heat
      (Q)
      (energy-transfer-due-to-temperature-difference)
      ((Q . not-a-state-function)
       (not-a-state-function . path-dependent)
       (path-dependent . transfers-from-hot-to-cold-spontaneously)
       (transfers-from-hot-to-cold-spontaneously . energy-transfer-due-to-temperature-difference)))

    (work
      (W)
      (energy-transfer-via-macroscopic-force)
      ((W . not-a-state-function)
       (not-a-state-function . path-dependent)
       (path-dependent . PdV-work-for-expansion)
       (PdV-work-for-expansion . energy-transfer-via-macroscopic-force)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECOND LAW OF THERMODYNAMICS
    ;;; Entropy of isolated system never decreases
    ;;; SOURCE: [Clausius-1850], [Callen-1985] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    (second-law-Clausius
      (heat-transfer)
      (cannot-spontaneously-flow-from-cold-to-hot)
      ((heat-transfer . Clausius-statement-1850)
       (Clausius-statement-1850 . no-process-whose-sole-result)
       (no-process-whose-sole-result . is-transfer-of-heat-from-cold-to-hot)
       (is-transfer-of-heat-from-cold-to-hot . cannot-spontaneously-flow-from-cold-to-hot)))

    (second-law-Kelvin-Planck
      (cyclic-heat-engine)
      (cannot-convert-all-heat-to-work)
      ((cyclic-heat-engine . Kelvin-Planck-statement)
       (Kelvin-Planck-statement . no-process-whose-sole-result)
       (no-process-whose-sole-result . is-complete-conversion-of-heat-to-work)
       (is-complete-conversion-of-heat-to-work . cannot-convert-all-heat-to-work)))

    (second-law-entropy
      (isolated-system)
      (total-entropy-never-decreases)
      ((isolated-system . no-exchange-with-surroundings)
       (no-exchange-with-surroundings . dS-ge-0-for-all-processes)
       (dS-ge-0-for-all-processes . dS-equals-0-only-for-reversible)
       (dS-equals-0-only-for-reversible . total-entropy-never-decreases)))

    (Clausius-Kelvin-equivalence
      (Clausius-and-Kelvin-Planck-statements)
      (logically-equivalent)
      ((Clausius-and-Kelvin-Planck-statements . violation-of-one-implies-violation-of-other)
       (violation-of-one-implies-violation-of-other . proved-by-combining-hypothetical-devices)
       (proved-by-combining-hypothetical-devices . logically-equivalent)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THIRD LAW OF THERMODYNAMICS
    ;;; Entropy approaches zero as T approaches absolute zero
    ;;; SOURCE: [Nernst-1906], [Callen-1985] Ch. 11
    ;;; ═══════════════════════════════════════════════════════════

    (third-law
      (system-at-T-approaching-0-K)
      (entropy-approaches-zero)
      ((system-at-T-approaching-0-K . Nernst-heat-theorem-1906)
       (Nernst-heat-theorem-1906 . entropy-of-perfect-crystal-at-0-K-is-zero)
       (entropy-of-perfect-crystal-at-0-K-is-zero . unique-ground-state-W-equals-1)
       (unique-ground-state-W-equals-1 . S-equals-k-ln-1-equals-0)
       (S-equals-k-ln-1-equals-0 . entropy-approaches-zero)))

    (unattainability
      (absolute-zero)
      (cannot-be-reached-in-finite-steps)
      ((absolute-zero . consequence-of-third-law)
       (consequence-of-third-law . each-cooling-step-removes-less-entropy)
       (each-cooling-step-removes-less-entropy . infinite-steps-required)
       (infinite-steps-required . cannot-be-reached-in-finite-steps)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ENTROPY
    ;;; Thermodynamic and statistical definitions
    ;;; SOURCE: [Clausius-1850], [Boltzmann-1877], [Callen-1985] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    (entropy-thermodynamic
      (reversible-process)
      (dS-equals-dQ-rev-over-T)
      ((reversible-process . infinitesimally-slow)
       (infinitesimally-slow . system-always-in-equilibrium)
       (system-always-in-equilibrium . dS-equals-dQ-rev-over-T)
       (dS-equals-dQ-rev-over-T . S-is-state-function)))

    (entropy-Boltzmann
      (macrostate-with-W-microstates)
      (S-equals-k-B-ln-W)
      ((macrostate-with-W-microstates . W-is-number-of-accessible-microstates)
       (W-is-number-of-accessible-microstates . Boltzmann-1877)
       (Boltzmann-1877 . S-equals-k-B-ln-W)
       (S-equals-k-B-ln-W . inscribed-on-Boltzmann-tombstone-Vienna)
       (inscribed-on-Boltzmann-tombstone-Vienna . bridges-microscopic-to-macroscopic)))

    (entropy-Shannon-connection
      (Shannon-information-entropy)
      (formally-identical-to-Boltzmann)
      ((Shannon-information-entropy . H-equals-minus-sum-p-log-p)
       (H-equals-minus-sum-p-log-p . Shannon-1948)
       (Shannon-1948 . measures-uncertainty-in-bits-or-nats)
       (measures-uncertainty-in-bits-or-nats . S-thermo-equals-k-B-times-H-in-nats)
       (S-thermo-equals-k-B-times-H-in-nats . formally-identical-to-Boltzmann)))

    (entropy-additive
      (two-independent-subsystems)
      (total-S-equals-S1-plus-S2)
      ((two-independent-subsystems . microstates-multiply-W-total-equals-W1-times-W2)
       (microstates-multiply-W-total-equals-W1-times-W2 . ln-W-total-equals-ln-W1-plus-ln-W2)
       (ln-W-total-equals-ln-W1-plus-ln-W2 . total-S-equals-S1-plus-S2)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FREE ENERGY
    ;;; Gibbs and Helmholtz — available work
    ;;; SOURCE: [Callen-1985] Ch. 5-6, [Schroeder-2000] Ch. 5
    ;;; ═══════════════════════════════════════════════════════════

    (Gibbs-free-energy
      (system-at-constant-T-and-P)
      (G-equals-H-minus-TS)
      ((system-at-constant-T-and-P . most-common-lab-conditions)
       (most-common-lab-conditions . G-equals-H-minus-TS)
       (G-equals-H-minus-TS . H-is-enthalpy-equals-U-plus-PV)
       (H-is-enthalpy-equals-U-plus-PV . dG-le-0-for-spontaneous-process)
       (dG-le-0-for-spontaneous-process . dG-equals-0-at-equilibrium)
       (dG-equals-0-at-equilibrium . maximum-non-PV-work-equals-minus-delta-G)))

    (Helmholtz-free-energy
      (system-at-constant-T-and-V)
      (F-equals-U-minus-TS)
      ((system-at-constant-T-and-V . canonical-ensemble-conditions)
       (canonical-ensemble-conditions . F-equals-U-minus-TS)
       (F-equals-U-minus-TS . dF-le-0-for-spontaneous-process)
       (dF-le-0-for-spontaneous-process . dF-equals-0-at-equilibrium)
       (dF-equals-0-at-equilibrium . maximum-work-equals-minus-delta-F)))

    (enthalpy
      (H)
      (H-equals-U-plus-PV)
      ((H . state-function)
       (state-function . H-equals-U-plus-PV)
       (H-equals-U-plus-PV . dH-equals-dQ-at-constant-P)
       (dH-equals-dQ-at-constant-P . measured-by-calorimetry)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHASE TRANSITIONS
    ;;; Solid, liquid, gas — latent heat, critical point
    ;;; SOURCE: [Schroeder-2000] Ch. 5, [Callen-1985] Ch. 9
    ;;; ═══════════════════════════════════════════════════════════

    (phases-of-matter
      (substance-at-given-T-and-P)
      (solid-liquid-gas-plasma)
      ((substance-at-given-T-and-P . phase-determined-by-T-and-P)
       (phase-determined-by-T-and-P . solid-at-low-T-high-P)
       (solid-at-low-T-high-P . liquid-at-intermediate-T-and-P)
       (liquid-at-intermediate-T-and-P . gas-at-high-T-low-P)
       (gas-at-high-T-low-P . plasma-at-very-high-T)
       (plasma-at-very-high-T . solid-liquid-gas-plasma)))

    (phase-transition
      (substance-crossing-phase-boundary)
      (discontinuous-change-in-properties)
      ((substance-crossing-phase-boundary . first-order-transition)
       (first-order-transition . latent-heat-absorbed-or-released)
       (latent-heat-absorbed-or-released . density-changes-discontinuously)
       (density-changes-discontinuously . entropy-changes-discontinuously)
       (entropy-changes-discontinuously . discontinuous-change-in-properties)))

    (latent-heat
      (phase-change-at-constant-T-and-P)
      (Q-equals-mL)
      ((phase-change-at-constant-T-and-P . temperature-constant-during-transition)
       (temperature-constant-during-transition . energy-goes-to-breaking-or-forming-bonds)
       (energy-goes-to-breaking-or-forming-bonds . L-fusion-water-equals-334-kJ/kg)
       (L-fusion-water-equals-334-kJ/kg . L-vaporization-water-equals-2260-kJ/kg)
       (L-vaporization-water-equals-2260-kJ/kg . Q-equals-mL)))

    (critical-point
      (end-of-liquid-gas-coexistence-curve)
      (liquid-and-gas-become-indistinguishable)
      ((end-of-liquid-gas-coexistence-curve . critical-temperature-Tc)
       (critical-temperature-Tc . critical-pressure-Pc)
       (critical-pressure-Pc . above-Tc-no-phase-distinction)
       (above-Tc-no-phase-distinction . supercritical-fluid)
       (supercritical-fluid . water-Tc-equals-647-K-Pc-equals-22.064-MPa)
       (water-Tc-equals-647-K-Pc-equals-22.064-MPa . liquid-and-gas-become-indistinguishable)))

    (triple-point
      (coexistence-of-all-three-phases)
      (unique-T-and-P)
      ((coexistence-of-all-three-phases . solid-liquid-gas-in-equilibrium)
       (solid-liquid-gas-in-equilibrium . water-triple-point-273.16-K-611.657-Pa)
       (water-triple-point-273.16-K-611.657-Pa . used-to-define-kelvin-before-2019)
       (used-to-define-kelvin-before-2019 . unique-T-and-P)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HEAT ENGINES AND CARNOT CYCLE
    ;;; SOURCE: [Carnot-1824], [Schroeder-2000] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    (heat-engine
      (cyclic-device-between-hot-and-cold-reservoirs)
      (converts-heat-to-work)
      ((cyclic-device-between-hot-and-cold-reservoirs . absorbs-Qh-from-hot-reservoir)
       (absorbs-Qh-from-hot-reservoir . rejects-Qc-to-cold-reservoir)
       (rejects-Qc-to-cold-reservoir . does-work-W-equals-Qh-minus-Qc)
       (does-work-W-equals-Qh-minus-Qc . efficiency-eta-equals-W-over-Qh)
       (efficiency-eta-equals-W-over-Qh . converts-heat-to-work)))

    (Carnot-cycle
      (reversible-engine-between-Th-and-Tc)
      (maximum-possible-efficiency)
      ((reversible-engine-between-Th-and-Tc . Carnot-1824)
       (Carnot-1824 . two-isothermal-two-adiabatic-steps)
       (two-isothermal-two-adiabatic-steps . eta-Carnot-equals-1-minus-Tc-over-Th)
       (eta-Carnot-equals-1-minus-Tc-over-Th . no-real-engine-exceeds-Carnot)
       (no-real-engine-exceeds-Carnot . maximum-possible-efficiency)))

    (Carnot-theorem
      (any-reversible-engine)
      (same-efficiency-as-Carnot-between-same-reservoirs)
      ((any-reversible-engine . all-reversible-engines-equivalent)
       (all-reversible-engines-equivalent . irreversible-engine-always-less-efficient)
       (irreversible-engine-always-less-efficient . proved-by-second-law)
       (proved-by-second-law . same-efficiency-as-Carnot-between-same-reservoirs)))

    (refrigerator
      (cyclic-device-moving-heat-from-cold-to-hot)
      (requires-work-input)
      ((cyclic-device-moving-heat-from-cold-to-hot . reverse-of-heat-engine)
       (reverse-of-heat-engine . COP-equals-Qc-over-W)
       (COP-equals-Qc-over-W . Carnot-COP-equals-Tc-over-Th-minus-Tc)
       (Carnot-COP-equals-Tc-over-Th-minus-Tc . requires-work-input)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IDEAL GAS LAW
    ;;; SOURCE: [Schroeder-2000] Ch. 1, [Callen-1985] Ch. 3
    ;;; ═══════════════════════════════════════════════════════════

    (ideal-gas-law
      (n-moles-of-ideal-gas)
      (PV-equals-nRT)
      ((n-moles-of-ideal-gas . molar-form)
       (molar-form . PV-equals-nRT)
       (PV-equals-nRT . also-PV-equals-NkT-for-N-particles)
       (also-PV-equals-NkT-for-N-particles . exact-in-limit-of-no-interactions)
       (exact-in-limit-of-no-interactions . good-approximation-at-low-P-high-T)))

    (ideal-gas-assumptions
      (ideal-gas-model)
      (point-particles-no-interactions)
      ((ideal-gas-model . molecules-are-point-particles)
       (molecules-are-point-particles . no-intermolecular-forces)
       (no-intermolecular-forces . elastic-collisions-only)
       (elastic-collisions-only . mean-free-path-much-greater-than-molecular-size)
       (mean-free-path-much-greater-than-molecular-size . point-particles-no-interactions)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MAXWELL-BOLTZMANN DISTRIBUTION
    ;;; SOURCE: [Maxwell-1860], [Schroeder-2000] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (Maxwell-Boltzmann-speed
      (ideal-gas-at-temperature-T)
      (speed-distribution)
      ((ideal-gas-at-temperature-T . Maxwell-1860)
       (Maxwell-1860 . f-of-v-proportional-to-v2-exp-minus-mv2-over-2kT)
       (f-of-v-proportional-to-v2-exp-minus-mv2-over-2kT . most-probable-speed-sqrt-2kT-over-m)
       (most-probable-speed-sqrt-2kT-over-m . mean-speed-sqrt-8kT-over-pi-m)
       (mean-speed-sqrt-8kT-over-pi-m . rms-speed-sqrt-3kT-over-m)
       (rms-speed-sqrt-3kT-over-m . speed-distribution)))

    (Boltzmann-energy-distribution
      (system-in-thermal-equilibrium-at-T)
      (probability-proportional-to-exp-minus-E-over-kT)
      ((system-in-thermal-equilibrium-at-T . Boltzmann-factor)
       (Boltzmann-factor . probability-proportional-to-exp-minus-E-over-kT)
       (probability-proportional-to-exp-minus-E-over-kT . higher-energy-states-less-probable)
       (higher-energy-states-less-probable . partition-function-Z-normalizes)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EQUIPARTITION THEOREM
    ;;; SOURCE: [Schroeder-2000] Sec. 1.3, [Callen-1985]
    ;;; ═══════════════════════════════════════════════════════════

    (equipartition-theorem
      (classical-system-in-thermal-equilibrium)
      (half-kT-per-quadratic-degree-of-freedom)
      ((classical-system-in-thermal-equilibrium . each-quadratic-term-in-energy)
       (each-quadratic-term-in-energy . contributes-half-kT-on-average)
       (contributes-half-kT-on-average . translational-3-degrees)
       (translational-3-degrees . monatomic-ideal-gas-U-equals-3-halves-NkT)
       (monatomic-ideal-gas-U-equals-3-halves-NkT . diatomic-adds-rotational-and-vibrational)
       (diatomic-adds-rotational-and-vibrational . half-kT-per-quadratic-degree-of-freedom)))

    (equipartition-failure
      (quantum-regime-kT-much-less-than-energy-spacing)
      (degrees-of-freedom-freeze-out)
      ((quantum-regime-kT-much-less-than-energy-spacing . equipartition-is-classical-approximation)
       (equipartition-is-classical-approximation . vibrational-modes-freeze-at-low-T)
       (vibrational-modes-freeze-at-low-T . explains-low-T-specific-heat-of-diatomics)
       (explains-low-T-specific-heat-of-diatomics . degrees-of-freedom-freeze-out)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPECIFIC HEAT AND HEAT CAPACITY
    ;;; SOURCE: [Schroeder-2000] Ch. 1, [Callen-1985] Ch. 3
    ;;; ═══════════════════════════════════════════════════════════

    (heat-capacity
      (system-absorbing-heat)
      (C-equals-dQ-over-dT)
      ((system-absorbing-heat . temperature-rises)
       (temperature-rises . C-equals-dQ-over-dT)
       (C-equals-dQ-over-dT . extensive-property-depends-on-amount)
       (extensive-property-depends-on-amount . units-J/K)))

    (specific-heat
      (per-unit-mass)
      (c-equals-C-over-m)
      ((per-unit-mass . intensive-property)
       (intensive-property . c-equals-C-over-m)
       (c-equals-C-over-m . units-J/kg-K)
       (units-J/kg-K . water-c-equals-4186-J/kg-K-at-15C)))

    (Cv-and-Cp
      (heat-capacity-at-constant-V-vs-constant-P)
      (Cp-minus-Cv-equals-nR-for-ideal-gas)
      ((heat-capacity-at-constant-V-vs-constant-P . Cv-equals-dU/dT-at-constant-V)
       (Cv-equals-dU/dT-at-constant-V . Cp-equals-dH/dT-at-constant-P)
       (Cp-equals-dH/dT-at-constant-P . Cp-always-ge-Cv)
       (Cp-always-ge-Cv . Cp-minus-Cv-equals-nR-for-ideal-gas)
       (Cp-minus-Cv-equals-nR-for-ideal-gas . gamma-equals-Cp-over-Cv)))

    (specific-heat-monatomic-ideal
      (monatomic-ideal-gas)
      (Cv-equals-3-halves-nR)
      ((monatomic-ideal-gas . 3-translational-degrees)
       (3-translational-degrees . Cv-equals-3-halves-nR)
       (Cv-equals-3-halves-nR . Cp-equals-5-halves-nR)
       (Cp-equals-5-halves-nR . gamma-equals-5/3)))

    (specific-heat-diatomic-ideal
      (diatomic-ideal-gas-at-room-temperature)
      (Cv-equals-5-halves-nR)
      ((diatomic-ideal-gas-at-room-temperature . 3-translational-plus-2-rotational)
       (3-translational-plus-2-rotational . Cv-equals-5-halves-nR)
       (Cv-equals-5-halves-nR . Cp-equals-7-halves-nR)
       (Cp-equals-7-halves-nR . gamma-equals-7/5)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IRREVERSIBILITY AND THE ARROW OF TIME
    ;;; SOURCE: [Clausius-1850], [Boltzmann-1877], [Callen-1985] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    (irreversibility
      (natural-processes)
      (increase-total-entropy)
      ((natural-processes . heat-flows-hot-to-cold)
       (heat-flows-hot-to-cold . gases-expand-into-vacuum)
       (gases-expand-into-vacuum . mixing-is-spontaneous)
       (mixing-is-spontaneous . all-increase-number-of-microstates)
       (all-increase-number-of-microstates . increase-total-entropy)))

    (arrow-of-time
      (second-law-distinguishes-past-from-future)
      (entropy-defines-time-direction)
      ((second-law-distinguishes-past-from-future . microscopic-laws-are-time-reversible)
       (microscopic-laws-are-time-reversible . macroscopic-entropy-increase-is-not)
       (macroscopic-entropy-increase-is-not . statistical-not-absolute)
       (statistical-not-absolute . overwhelmingly-probable-for-large-N)
       (overwhelmingly-probable-for-large-N . entropy-defines-time-direction)))

    (reversible-process
      (idealized-quasi-static-process)
      (total-entropy-change-is-zero)
      ((idealized-quasi-static-process . system-always-infinitesimally-near-equilibrium)
       (system-always-infinitesimally-near-equilibrium . no-friction-no-turbulence)
       (no-friction-no-turbulence . can-be-reversed-at-any-point)
       (can-be-reversed-at-any-point . total-entropy-change-is-zero)
       (total-entropy-change-is-zero . idealization-never-perfectly-achieved)))

    (free-expansion
      (gas-expanding-into-vacuum)
      (irreversible-no-work-done)
      ((gas-expanding-into-vacuum . no-external-pressure)
       (no-external-pressure . W-equals-0)
       (W-equals-0 . Q-equals-0-if-insulated)
       (Q-equals-0-if-insulated . delta-U-equals-0-temperature-unchanged-for-ideal-gas)
       (delta-U-equals-0-temperature-unchanged-for-ideal-gas . entropy-increases)
       (entropy-increases . irreversible-no-work-done)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THERMODYNAMIC POTENTIALS AND MAXWELL RELATIONS
    ;;; SOURCE: [Callen-1985] Ch. 5-7
    ;;; ═══════════════════════════════════════════════════════════

    (thermodynamic-potentials
      (four-potentials-U-H-F-G)
      (related-by-Legendre-transforms)
      ((four-potentials-U-H-F-G . U-is-natural-function-of-S-V)
       (U-is-natural-function-of-S-V . H-is-natural-function-of-S-P)
       (H-is-natural-function-of-S-P . F-is-natural-function-of-T-V)
       (F-is-natural-function-of-T-V . G-is-natural-function-of-T-P)
       (G-is-natural-function-of-T-P . related-by-Legendre-transforms)))

    (Maxwell-relations
      (second-derivatives-of-potentials)
      (equalities-between-partial-derivatives)
      ((second-derivatives-of-potentials . symmetry-of-mixed-partials)
       (symmetry-of-mixed-partials . dT/dV-at-S-equals-minus-dP/dS-at-V)
       (dT/dV-at-S-equals-minus-dP/dS-at-V . dT/dP-at-S-equals-dV/dS-at-P)
       (dT/dP-at-S-equals-dV/dS-at-P . dS/dV-at-T-equals-dP/dT-at-V)
       (dS/dV-at-T-equals-dP/dT-at-V . dS/dP-at-T-equals-minus-dV/dT-at-P)
       (dS/dP-at-T-equals-minus-dV/dT-at-P . equalities-between-partial-derivatives)))

  )

  ((thermodynamics . thermodynamics-registered)))
