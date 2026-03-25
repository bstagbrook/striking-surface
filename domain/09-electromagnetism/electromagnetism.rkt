#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Electromagnetism — Maxwell's equations and consequences
;;; LAYER: 09-electromagnetism
;;; DEPENDS ON: 01-particles (photon, charges), 07-waves, 08-relativity
;;; DEPENDED ON BY: circuits, optics, antennas, signal processing,
;;;   all electronic technology
;;;
;;; SOURCES:
;;; [Maxwell-1865] A Dynamical Theory of the Electromagnetic Field
;;; [Griffiths-2017] Introduction to Electrodynamics, 4th ed.
;;; [NIST-2022] CODATA 2022 (permittivity, permeability)
;;; ═══════════════════════════════════════════════════════════════

(domain-electromagnetism

  ((Maxwell (classical-electrodynamics) (authoritative) ((classical-electrodynamics . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MAXWELL'S EQUATIONS — the complete classical theory
    ;;; 4 equations unify electricity, magnetism, and light
    ;;; SOURCE: Maxwell 1865, standard physics
    ;;; ═══════════════════════════════════════════════════════════

    (Gauss-law-electric
      (electric-charges)
      (produce-electric-field)
      ((electric-charges . source-of-electric-field)
       (source-of-electric-field . field-lines-begin-and-end-on-charges)
       (field-lines-begin-and-end-on-charges . flux-through-surface-equals-enclosed-charge)
       (flux-through-surface-equals-enclosed-charge . div-E-equals-rho-over-epsilon0)
       (div-E-equals-rho-over-epsilon0 . produce-electric-field)))

    (Gauss-law-magnetic
      (magnetic-field)
      (no-magnetic-monopoles)
      ((magnetic-field . always-has-north-and-south)
       (always-has-north-and-south . field-lines-always-close)
       (field-lines-always-close . net-flux-through-any-surface-is-zero)
       (net-flux-through-any-surface-is-zero . div-B-equals-0)
       (div-B-equals-0 . no-magnetic-monopoles)))

    (Faraday-law
      (changing-magnetic-flux)
      (induces-electric-field)
      ((changing-magnetic-flux . time-varying-B)
       (time-varying-B . creates-circulating-E)
       (creates-circulating-E . curl-E-equals-minus-dB/dt)
       (curl-E-equals-minus-dB/dt . induces-electric-field)
       (induces-electric-field . basis-of-all-generators-and-transformers)))

    (Ampere-Maxwell-law
      (electric-current-and-changing-electric-flux)
      (produce-magnetic-field)
      ((electric-current-and-changing-electric-flux . current-creates-B)
       (current-creates-B . displacement-current-also-creates-B)
       (displacement-current-also-creates-B . curl-B-equals-mu0-J-plus-mu0-epsilon0-dE/dt)
       (curl-B-equals-mu0-J-plus-mu0-epsilon0-dE/dt . produce-magnetic-field)
       (produce-magnetic-field . Maxwell-addition-of-displacement-current)))

    ;;; The unification — light IS electromagnetic
    (EM-wave-derivation
      (Faraday-plus-Ampere-Maxwell)
      (electromagnetic-waves-at-speed-c)
      ((Faraday-plus-Ampere-Maxwell . changing-E-creates-B)
       (changing-E-creates-B . changing-B-creates-E)
       (changing-B-creates-E . self-sustaining-oscillation)
       (self-sustaining-oscillation . propagates-at-1-over-sqrt-mu0-epsilon0)
       (propagates-at-1-over-sqrt-mu0-epsilon0 . equals-speed-of-light)
       (equals-speed-of-light . electromagnetic-waves-at-speed-c)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNDAMENTAL CONSTANTS
    ;;; SOURCE: [NIST-2022]
    ;;; ═══════════════════════════════════════════════════════════

    (vacuum-permittivity
      (epsilon-0)
      (8.8541878128e-12-F/m)
      ((epsilon-0 . electric-constant)
       (electric-constant . derived-from-c-and-mu0)
       (derived-from-c-and-mu0 . 8.8541878128e-12-F/m)))

    (vacuum-permeability
      (mu-0)
      (1.25663706212e-6-N/A2)
      ((mu-0 . magnetic-constant)
       (magnetic-constant . 4-pi-times-1e-7-approximately)
       (4-pi-times-1e-7-approximately . 1.25663706212e-6-N/A2)))

    (c-from-constants
      (1-over-sqrt-mu0-epsilon0)
      (equals-c)
      ((1-over-sqrt-mu0-epsilon0 . derivable-from-Maxwell)
       (derivable-from-Maxwell . equals-299792458-m/s)
       (equals-299792458-m/s . equals-c)))

    (elementary-charge
      (e)
      (exactly-1.602176634e-19-C)
      ((e . charge-of-proton)
       (charge-of-proton . negative-of-electron-charge)
       (negative-of-electron-charge . defined-exact-since-2019)
       (defined-exact-since-2019 . exactly-1.602176634e-19-C)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COULOMB'S LAW — static electric force
    ;;; ═══════════════════════════════════════════════════════════

    (Coulomb-law
      (two-point-charges-q1-q2)
      (force-proportional-to-product-over-r-squared)
      ((two-point-charges-q1-q2 . F-equals-k-q1-q2-over-r2)
       (F-equals-k-q1-q2-over-r2 . k-equals-1-over-4pi-epsilon0)
       (k-equals-1-over-4pi-epsilon0 . k-equals-8.9875e9-N-m2-C-2)
       (k-equals-8.9875e9-N-m2-C-2 . like-charges-repel)
       (like-charges-repel . opposite-charges-attract)
       (opposite-charges-attract . force-proportional-to-product-over-r-squared)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LORENTZ FORCE — complete electromagnetic force
    ;;; ═══════════════════════════════════════════════════════════

    (Lorentz-force
      (charge-q-in-E-and-B-fields)
      (F-equals-q-E-plus-v-cross-B)
      ((charge-q-in-E-and-B-fields . electric-force-qE)
       (electric-force-qE . magnetic-force-qv-cross-B)
       (magnetic-force-qv-cross-B . magnetic-force-perpendicular-to-v)
       (magnetic-force-perpendicular-to-v . magnetic-force-does-no-work)
       (magnetic-force-does-no-work . F-equals-q-E-plus-v-cross-B)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTROMAGNETIC INDUCTION
    ;;; SOURCE: Faraday 1831, standard
    ;;; ═══════════════════════════════════════════════════════════

    (electromagnetic-induction
      (changing-magnetic-flux-through-circuit)
      (induces-EMF)
      ((changing-magnetic-flux-through-circuit . Faraday-law-of-induction)
       (Faraday-law-of-induction . EMF-equals-minus-d-phi-B-over-dt)
       (EMF-equals-minus-d-phi-B-over-dt . Lenz-law-opposes-change)
       (Lenz-law-opposes-change . induces-EMF)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CIRCUIT FUNDAMENTALS
    ;;; ═══════════════════════════════════════════════════════════

    (Ohm-law
      (voltage-across-resistor)
      (V-equals-IR)
      ((voltage-across-resistor . current-proportional-to-voltage)
       (current-proportional-to-voltage . resistance-is-proportionality-constant)
       (resistance-is-proportionality-constant . V-equals-IR)))

    (Kirchhoff-current
      (junction-in-circuit)
      (currents-in-equal-currents-out)
      ((junction-in-circuit . conservation-of-charge)
       (conservation-of-charge . currents-in-equal-currents-out)))

    (Kirchhoff-voltage
      (closed-loop-in-circuit)
      (sum-of-voltages-equals-zero)
      ((closed-loop-in-circuit . conservation-of-energy)
       (conservation-of-energy . sum-of-voltages-equals-zero)))

    (capacitance
      (two-conductors-separated-by-insulator)
      (stores-charge-Q-equals-CV)
      ((two-conductors-separated-by-insulator . electric-field-between)
       (electric-field-between . energy-stored-in-field)
       (energy-stored-in-field . stores-charge-Q-equals-CV)))

    (inductance
      (coil-carrying-current)
      (stores-energy-in-magnetic-field)
      ((coil-carrying-current . creates-magnetic-flux)
       (creates-magnetic-flux . changing-current-induces-back-EMF)
       (changing-current-induces-back-EMF . opposes-change-in-current)
       (opposes-change-in-current . stores-energy-in-magnetic-field)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTROMAGNETIC RADIATION — energy transport
    ;;; ═══════════════════════════════════════════════════════════

    (Poynting-vector
      (E-cross-B)
      (energy-flux-of-EM-wave)
      ((E-cross-B . S-equals-E-cross-B-over-mu0)
       (S-equals-E-cross-B-over-mu0 . direction-of-energy-flow)
       (direction-of-energy-flow . magnitude-is-power-per-unit-area)
       (magnitude-is-power-per-unit-area . energy-flux-of-EM-wave)))

    (radiation-pressure
      (EM-wave-hitting-surface)
      (exerts-force)
      ((EM-wave-hitting-surface . momentum-carried-by-photons)
       (momentum-carried-by-photons . p-equals-E-over-c)
       (p-equals-E-over-c . absorption-transfers-momentum)
       (absorption-transfers-momentum . exerts-force)))

    (antenna-principle
      (accelerating-charge)
      (radiates-EM-waves)
      ((accelerating-charge . changing-electric-field)
       (changing-electric-field . creates-changing-magnetic-field)
       (creates-changing-magnetic-field . self-propagating-wave)
       (self-propagating-wave . radiates-EM-waves)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHOTOELECTRIC EFFECT — quantum bridge
    ;;; SOURCE: Einstein 1905 (Nobel 1921)
    ;;; ═══════════════════════════════════════════════════════════

    (photoelectric-effect
      (photon-hits-metal-surface)
      (ejects-electron-if-frequency-exceeds-threshold)
      ((photon-hits-metal-surface . photon-energy-E-equals-hf)
       (photon-energy-E-equals-hf . work-function-phi-is-minimum-energy)
       (work-function-phi-is-minimum-energy . if-hf-gt-phi-electron-ejected)
       (if-hf-gt-phi-electron-ejected . KE-equals-hf-minus-phi)
       (KE-equals-hf-minus-phi . ejects-electron-if-frequency-exceeds-threshold)))

  )

  ((Maxwell . electromagnetism-registered)))
