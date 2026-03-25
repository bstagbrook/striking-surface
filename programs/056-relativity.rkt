#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; SPECIAL & GENERAL RELATIVITY — FOUNDATIONAL PHYSICS
;;;
;;; Sits between particles (051) and nuclei (052) in the stack.
;;; E=mc² explains nuclear binding energy and mass defect.
;;; Relativistic effects explain heavy-element chemistry (015).
;;; Spacetime geometry is the arena for all physics.
;;;
;;; SOURCE: Einstein 1905 (SR), Einstein 1915 (GR), standard physics
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-relativity

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: relativistic physics domain
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPECIAL RELATIVITY (1905)
    ;;; SOURCE: Einstein 1905, standard physics
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Postulate 1: Laws of physics same in all inertial frames
    (SR-postulate-1
      (laws-of-physics)
      (same-in-all-inertial-frames)
      ((laws-of-physics . no-preferred-reference-frame)
       (no-preferred-reference-frame . same-in-all-inertial-frames)))

    ;;; Postulate 2: Speed of light is constant
    (SR-postulate-2
      (speed-of-light)
      (c-equals-299792458-m-per-s-in-all-frames)
      ((speed-of-light . independent-of-source-motion)
       (independent-of-source-motion . independent-of-observer-motion)
       (independent-of-observer-motion . c-equals-299792458-m-per-s-in-all-frames)))

    ;;; Time dilation: moving clocks run slow
    (time-dilation
      (relative-motion-at-velocity-v)
      (moving-clock-runs-slower)
      ((relative-motion-at-velocity-v . gamma-equals-1-over-sqrt-1-minus-v2-over-c2)
       (gamma-equals-1-over-sqrt-1-minus-v2-over-c2 . delta-t-prime-equals-gamma-delta-t)
       (delta-t-prime-equals-gamma-delta-t . moving-clock-runs-slower)))

    ;;; Length contraction: moving objects are shorter
    (length-contraction
      (relative-motion-at-velocity-v)
      (moving-object-shorter-in-direction-of-motion)
      ((relative-motion-at-velocity-v . L-equals-L0-over-gamma)
       (L-equals-L0-over-gamma . moving-object-shorter-in-direction-of-motion)))

    ;;; Mass-energy equivalence: E = mc²
    ;;; THE critical equation for nuclear physics
    (mass-energy-equivalence
      (rest-mass-m)
      (rest-energy-E0-equals-mc2)
      ((rest-mass-m . contains-energy)
       (contains-energy . E0-equals-mc2)
       (E0-equals-mc2 . mass-IS-energy)
       (mass-IS-energy . rest-energy-E0-equals-mc2)))

    ;;; Full energy-momentum relation
    (energy-momentum
      (total-energy-E)
      (E2-equals-pc2-plus-mc2-squared)
      ((total-energy-E . includes-kinetic-and-rest)
       (includes-kinetic-and-rest . E2-equals-pc2-plus-mc2-squared)
       (E2-equals-pc2-plus-mc2-squared . massless-particles-E-equals-pc)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MASS-ENERGY IN NUCLEAR PHYSICS
    ;;; Why nuclei weigh less than their parts
    ;;; SOURCE: standard nuclear physics
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Mass defect: binding energy appears as missing mass
    (mass-defect
      (nucleus-mass-less-than-sum-of-parts)
      (binding-energy-equals-mass-defect-times-c2)
      ((nucleus-mass-less-than-sum-of-parts . mass-difference-delta-m)
       (mass-difference-delta-m . energy-released-during-binding)
       (energy-released-during-binding . binding-energy-equals-mass-defect-times-c2)))

    ;;; Helium-4 example: 28.3 MeV binding energy
    ;;; 2 protons + 2 neutrons = 3755.67 MeV
    ;;; He-4 nucleus = 3727.38 MeV
    ;;; Mass defect = 28.3 MeV
    ;;; SOURCE: standard nuclear physics
    (He-4-mass-defect
      (2-protons-plus-2-neutrons-3755.67-MeV)
      (He-4-nucleus-3727.38-MeV)
      ((2-protons-plus-2-neutrons-3755.67-MeV . mass-defect-28.3-MeV)
       (mass-defect-28.3-MeV . binding-energy-7.07-MeV-per-nucleon)
       (binding-energy-7.07-MeV-per-nucleon . He-4-nucleus-3727.38-MeV)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; RELATIVISTIC EFFECTS IN CHEMISTRY
    ;;; Why heavy atoms behave differently from light atoms
    ;;; SOURCE: Pyykko 1988, standard relativistic quantum chemistry
    ;;; ═══════════════════════════════════════════════════════════

    (relativistic-orbital-contraction
      (inner-electrons-near-heavy-nucleus)
      (s-and-p-orbitals-contract)
      ((inner-electrons-near-heavy-nucleus . velocity-approaches-c)
       (velocity-approaches-c . relativistic-mass-increase)
       (relativistic-mass-increase . orbital-radius-decreases)
       (orbital-radius-decreases . s-and-p-orbitals-contract)))

    (relativistic-orbital-expansion
      (d-and-f-orbitals)
      (expand-due-to-better-shielding)
      ((d-and-f-orbitals . shielded-by-contracted-s-p)
       (shielded-by-contracted-s-p . see-lower-effective-nuclear-charge)
       (see-lower-effective-nuclear-charge . expand-due-to-better-shielding)))

    ;;; Connects to 015 (periodic table): gold color, mercury liquidity
    (relativity-explains-heavy-elements
      (gold-yellow . mercury-liquid)
      (relativistic-effects-dominant-for-Z-above-70)
      ((gold-yellow . 6s-contracts-5d-expands-gap-shrinks)
       (mercury-liquid . 6s-pair-inert-weak-bonding)
       (6s-contracts-5d-expands-gap-shrinks . relativistic-effects-dominant-for-Z-above-70)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERAL RELATIVITY (1915) — gravity as geometry
    ;;; SOURCE: Einstein 1915, standard physics
    ;;; ═══════════════════════════════════════════════════════════

    (equivalence-principle
      (gravitational-mass)
      (equals-inertial-mass)
      ((gravitational-mass . how-much-gravity-pulls)
       (how-much-gravity-pulls . equals-how-much-resists-acceleration)
       (equals-how-much-resists-acceleration . equals-inertial-mass)))

    (gravity-as-geometry
      (mass-energy-curves-spacetime)
      (objects-follow-geodesics)
      ((mass-energy-curves-spacetime . Einstein-field-equations)
       (Einstein-field-equations . Ricci-curvature-equals-stress-energy)
       (Ricci-curvature-equals-stress-energy . objects-follow-geodesics)))

    ;;; Schwarzschild radius: boundary of black hole
    (schwarzschild-radius
      (mass-M)
      (rs-equals-2GM-over-c2)
      ((mass-M . sufficient-concentration)
       (sufficient-concentration . event-horizon-forms)
       (event-horizon-forms . rs-equals-2GM-over-c2)))

    ;;; Gravitational time dilation: clocks run slower in gravity
    (gravitational-time-dilation
      (deeper-in-gravitational-well)
      (clock-runs-slower)
      ((deeper-in-gravitational-well . stronger-spacetime-curvature)
       (stronger-spacetime-curvature . clock-runs-slower)))

  )

  ;;; Vacuum tube
  ((tesla . relativity-registered)))
