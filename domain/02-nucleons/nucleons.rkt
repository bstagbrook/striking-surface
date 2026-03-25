#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Nucleons
;;; LAYER: 02-nucleons
;;; DEPENDS ON: 01-particles/quarks (quark composition, masses, charges)
;;; DEPENDED ON BY: 03-atoms (nuclear composition)
;;;
;;; PURPOSE: Proton and neutron — the composite particles that
;;; form atomic nuclei. Built from quarks via the strong force.
;;;
;;; SCOPE: Measured properties + derivable relationships.
;;; The quark composition is experimentally confirmed.
;;; The mass difference between nucleon mass and constituent
;;; quark masses IS the strong force binding energy — this is
;;; a key cross-layer invariant.
;;;
;;; SOURCES:
;;; [NIST-2022] CODATA 2022 recommended values, physics.nist.gov
;;; [PDG-2024] S. Navas et al., Phys. Rev. D 110, 030001 (2024)
;;;
;;; UNITS: MeV/c² for masses. Seconds for neutron lifetime.
;;;
;;; CALIBRATION: nucleons.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-nucleons

  ;;; Source: NIST CODATA 2022 + PDG 2024
  ((NIST-2022 (CODATA-recommended-values) (authoritative) ((CODATA-recommended-values . authoritative))))

  ;;; Target: nucleon properties
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PROTON
    ;;; SOURCE: [NIST-2022] physics.nist.gov/cgi-bin/cuu/Value?mpc2mev
    ;;; ═══════════════════════════════════════════════════════════

    (proton
      (quark-composition-uud)
      (mass-938.27208943-MeV . charge-plus-1)
      ((quark-composition-uud . two-up-one-down)
       (two-up-one-down . baryon)
       (baryon . baryon-number-1)
       (baryon-number-1 . charge-plus-1)
       (charge-plus-1 . mass-938.27208943-MeV)
       (mass-938.27208943-MeV . uncertainty-pm-0.00000029-MeV)
       (uncertainty-pm-0.00000029-MeV . spin-1/2)
       (spin-1/2 . stable)
       (stable . no-observed-proton-decay)
       (no-observed-proton-decay . lifetime-greater-than-1e34-years)
       ;;; BRIDGE: 01-particles/quarks → 02-nucleons
       ;;; Proton is a color-singlet bound state of 3 colored quarks
       ;;; SOURCE: QCD, standard
       (color-charge . color-singlet-in-proton)
       (color-singlet-in-proton . three-colors-sum-to-white)
       (confined-to-color-singlets . proton-is-color-neutral)
       (separation-energy-creates-new-pairs . proton-binding-energy)
       ;;; BRIDGE: 02-nucleons → 03-atoms
       ;;; A bare proton IS a hydrogen-1 nucleus (Z=1)
       ;;; SOURCE: standard — proton number defines element
       (Z-1 . hydrogen-is-single-proton)))

    ;;; Proton charge derivation from quarks
    ;;; up(+2/3) + up(+2/3) + down(-1/3) = +1
    ;;; SOURCE: Standard Model, derivable from 01-particles/quarks
    (proton-charge-derivation
      (uud-charges)
      (net-charge-plus-1)
      ((uud-charges . plus-2/3-plus-2/3-minus-1/3)
       (plus-2/3-plus-2/3-minus-1/3 . equals-3/3)
       (equals-3/3 . net-charge-plus-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEUTRON
    ;;; SOURCE: [NIST-2022] physics.nist.gov/cgi-bin/cuu/Value?mnc2mev
    ;;; ═══════════════════════════════════════════════════════════

    (neutron
      (quark-composition-udd)
      (mass-939.56542194-MeV . charge-0)
      ((quark-composition-udd . one-up-two-down)
       (one-up-two-down . baryon)
       (baryon . baryon-number-1)
       (baryon-number-1 . charge-0)
       (charge-0 . mass-939.56542194-MeV)
       (mass-939.56542194-MeV . uncertainty-pm-0.00000048-MeV)
       (uncertainty-pm-0.00000048-MeV . spin-1/2)
       (spin-1/2 . unstable-free-neutron)
       ;;; BRIDGE: 01-particles/quarks → 02-nucleons
       ;;; Neutron is a color-singlet bound state of 3 colored quarks
       ;;; SOURCE: QCD, standard
       (color-charge . color-singlet-in-neutron)
       (confined-to-color-singlets . neutron-is-color-neutral)))

    ;;; Neutron charge derivation from quarks
    ;;; up(+2/3) + down(-1/3) + down(-1/3) = 0
    (neutron-charge-derivation
      (udd-charges)
      (net-charge-0)
      ((udd-charges . plus-2/3-minus-1/3-minus-1/3)
       (plus-2/3-minus-1/3-minus-1/3 . equals-0/3)
       (equals-0/3 . net-charge-0)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEUTRON DECAY
    ;;; Free neutrons decay via weak force: n → p + e⁻ + ν̄ₑ
    ;;; SOURCE: [PDG-2024] pdglive — neutron mean life
    ;;; ═══════════════════════════════════════════════════════════

    (neutron-decay
      (free-neutron)
      (mean-life-878.4-s)
      ((free-neutron . beta-minus-decay)
       (beta-minus-decay . proton-plus-electron-plus-antineutrino)
       (proton-plus-electron-plus-antineutrino . W-boson-mediates)
       (W-boson-mediates . down-to-up-flavor-change)
       (down-to-up-flavor-change . mean-life-878.4-s)
       (mean-life-878.4-s . uncertainty-pm-0.5-s)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MASS DIFFERENCE AND BINDING ENERGY
    ;;; The nucleon mass is ~99% QCD binding energy.
    ;;; Constituent quark masses: u(2.16) + u(2.16) + d(4.70) = 9.02 MeV
    ;;; Proton mass: 938.272 MeV
    ;;; Therefore ~929 MeV = QCD binding energy (from gluon fields)
    ;;; This is one of the most profound facts in physics.
    ;;; SOURCE: derivable from 01-particles/quarks + NIST proton mass
    ;;; ═══════════════════════════════════════════════════════════

    (proton-qcd-binding
      (constituent-quark-mass-sum-9.02-MeV)
      (qcd-binding-energy-929.25-MeV)
      ((constituent-quark-mass-sum-9.02-MeV . proton-mass-938.272-MeV)
       (proton-mass-938.272-MeV . difference-929.25-MeV)
       (difference-929.25-MeV . 99-pct-of-proton-mass-is-binding-energy)
       (99-pct-of-proton-mass-is-binding-energy . mass-from-gluon-field-energy)
       (mass-from-gluon-field-energy . qcd-binding-energy-929.25-MeV)))

    (neutron-proton-mass-difference
      (neutron-mass-939.565-MeV . proton-mass-938.272-MeV)
      (mass-difference-1.293-MeV)
      ((neutron-mass-939.565-MeV . minus-proton-mass-938.272-MeV)
       (minus-proton-mass-938.272-MeV . equals-1.293-MeV)
       (equals-1.293-MeV . neutron-heavier-than-proton)
       (neutron-heavier-than-proton . enables-neutron-beta-decay)
       (enables-neutron-beta-decay . mass-difference-1.293-MeV)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NUCLEON STRUCTURE
    ;;; SOURCE: deep inelastic scattering experiments, standard QCD
    ;;; ═══════════════════════════════════════════════════════════

    (nucleon-structure
      (three-valence-quarks)
      (sea-quarks-plus-gluons)
      ((three-valence-quarks . carry-quantum-numbers)
       (carry-quantum-numbers . plus-sea-quark-pairs)
       (plus-sea-quark-pairs . plus-gluon-field)
       (plus-gluon-field . gluons-carry-50-pct-of-momentum)
       (gluons-carry-50-pct-of-momentum . sea-quarks-plus-gluons)))

    ;;; Isospin symmetry: proton and neutron are an isospin doublet
    ;;; SOURCE: Heisenberg 1932, standard nuclear physics
    (isospin
      (proton-neutron-doublet)
      (isospin-1/2)
      ((proton-neutron-doublet . same-strong-interaction)
       (same-strong-interaction . mass-difference-from-electromagnetic-plus-quark-mass)
       (mass-difference-from-electromagnetic-plus-quark-mass . approximate-symmetry)
       (approximate-symmetry . isospin-1/2)))

  )

  ;;; Vacuum tube
  ((NIST-2022 . nucleons-registered)))
