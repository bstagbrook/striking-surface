#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; QUARKS & LEPTONS — THE STANDARD MODEL PARTICLE CONTENT
;;;
;;; The fundamental fermions of the Standard Model.
;;; 6 quarks in 3 generations. 6 leptons in 3 generations.
;;; 4 fundamental forces mediated by gauge bosons.
;;; The Higgs field gives mass.
;;;
;;; Every value is measured/confirmed experimentally.
;;; All masses in MeV/c² unless noted.
;;;
;;; SOURCE: Particle Data Group (PDG) 2024, pdg.lbl.gov
;;; All values are current accepted experimental values.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-quarks-and-leptons

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: Standard Model particle content
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUARKS — 6 flavors, 3 generations, 3 color charges
    ;;; Fractional electric charge. Confined (never free).
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Generation 1 (stable matter)
    (up-quark
      (flavor-up)
      (charge-plus-2/3 . mass-2.16-MeV)
      ((flavor-up . generation-1)
       (generation-1 . lightest-up-type)
       (lightest-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-2.16-MeV)))

    (down-quark
      (flavor-down)
      (charge-minus-1/3 . mass-4.67-MeV)
      ((flavor-down . generation-1)
       (generation-1 . lightest-down-type)
       (lightest-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-4.67-MeV)))

    ;;; Generation 2
    (charm-quark
      (flavor-charm)
      (charge-plus-2/3 . mass-1270-MeV)
      ((flavor-charm . generation-2)
       (generation-2 . heavier-up-type)
       (heavier-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-1270-MeV)))

    (strange-quark
      (flavor-strange)
      (charge-minus-1/3 . mass-93-MeV)
      ((flavor-strange . generation-2)
       (generation-2 . heavier-down-type)
       (heavier-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-93-MeV)))

    ;;; Generation 3
    (top-quark
      (flavor-top)
      (charge-plus-2/3 . mass-172760-MeV)
      ((flavor-top . generation-3)
       (generation-3 . heaviest-up-type)
       (heaviest-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-172760-MeV)))

    (bottom-quark
      (flavor-bottom)
      (charge-minus-1/3 . mass-4180-MeV)
      ((flavor-bottom . generation-3)
       (generation-3 . heaviest-down-type)
       (heaviest-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-4180-MeV)))

    ;;; Color charge — quarks carry one of 3 colors
    ;;; SOURCE: QCD, standard reference
    (color-charge
      (red green blue)
      (SU3-color-symmetry)
      ((red . color-charge)
       (green . color-charge)
       (blue . color-charge)
       (color-charge . confined-to-color-singlets)
       (confined-to-color-singlets . SU3-color-symmetry)))

    ;;; Confinement — quarks are never observed free
    ;;; SOURCE: QCD, experimentally confirmed
    (confinement
      (color-charged-particles)
      (always-confined-in-hadrons)
      ((color-charged-particles . strong-force-increases-with-distance)
       (strong-force-increases-with-distance . separation-creates-new-pairs)
       (separation-creates-new-pairs . always-confined-in-hadrons)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LEPTONS — 6 flavors, 3 generations, no color charge
    ;;; Integer electric charge. Can exist free.
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Generation 1 (stable matter)
    (electron
      (flavor-electron)
      (charge-minus-1 . mass-0.511-MeV)
      ((flavor-electron . generation-1)
       (generation-1 . lightest-charged-lepton)
       (lightest-charged-lepton . stable)
       (stable . charge-minus-1)
       (charge-minus-1 . mass-0.511-MeV)))

    (electron-neutrino
      (flavor-electron-neutrino)
      (charge-0 . mass-less-than-0.8-eV)
      ((flavor-electron-neutrino . generation-1)
       (generation-1 . pairs-with-electron)
       (pairs-with-electron . charge-0)
       (charge-0 . mass-less-than-0.8-eV)))

    ;;; Generation 2
    (muon
      (flavor-muon)
      (charge-minus-1 . mass-105.66-MeV)
      ((flavor-muon . generation-2)
       (generation-2 . heavier-charged-lepton)
       (heavier-charged-lepton . unstable-2.2-microseconds)
       (unstable-2.2-microseconds . charge-minus-1)
       (charge-minus-1 . mass-105.66-MeV)))

    (muon-neutrino
      (flavor-muon-neutrino)
      (charge-0 . mass-less-than-0.17-MeV)
      ((flavor-muon-neutrino . generation-2)
       (generation-2 . pairs-with-muon)
       (pairs-with-muon . charge-0)
       (charge-0 . mass-less-than-0.17-MeV)))

    ;;; Generation 3
    (tau
      (flavor-tau)
      (charge-minus-1 . mass-1776.86-MeV)
      ((flavor-tau . generation-3)
       (generation-3 . heaviest-charged-lepton)
       (heaviest-charged-lepton . unstable-290-femtoseconds)
       (unstable-290-femtoseconds . charge-minus-1)
       (charge-minus-1 . mass-1776.86-MeV)))

    (tau-neutrino
      (flavor-tau-neutrino)
      (charge-0 . mass-less-than-18.2-MeV)
      ((flavor-tau-neutrino . generation-3)
       (generation-3 . pairs-with-tau)
       (pairs-with-tau . charge-0)
       (charge-0 . mass-less-than-18.2-MeV)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GAUGE BOSONS — force carriers
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Strong force — gluon
    (gluon
      (strong-force-carrier)
      (mass-0 . spin-1)
      ((strong-force-carrier . mediates-color-interaction)
       (mediates-color-interaction . carries-color-charge-itself)
       (carries-color-charge-itself . 8-gluon-types)
       (8-gluon-types . mass-0)
       (mass-0 . spin-1)))

    ;;; Electromagnetic force — photon
    (photon
      (electromagnetic-force-carrier)
      (mass-0 . spin-1)
      ((electromagnetic-force-carrier . mediates-electric-charge-interaction)
       (mediates-electric-charge-interaction . no-self-interaction)
       (no-self-interaction . infinite-range)
       (infinite-range . mass-0)
       (mass-0 . spin-1)))

    ;;; Weak force — W and Z bosons
    (W-boson
      (weak-force-carrier-charged)
      (mass-80379-MeV . spin-1)
      ((weak-force-carrier-charged . W-plus-and-W-minus)
       (W-plus-and-W-minus . mediates-flavor-change)
       (mediates-flavor-change . short-range)
       (short-range . mass-80379-MeV)
       (mass-80379-MeV . spin-1)))

    (Z-boson
      (weak-force-carrier-neutral)
      (mass-91188-MeV . spin-1)
      ((weak-force-carrier-neutral . mediates-neutral-current)
       (mediates-neutral-current . short-range)
       (short-range . mass-91188-MeV)
       (mass-91188-MeV . spin-1)))

    ;;; Gravity — graviton (predicted, not yet observed)
    (graviton
      (gravitational-force-carrier)
      (mass-0 . spin-2)
      ((gravitational-force-carrier . predicted-not-observed)
       (predicted-not-observed . mass-0)
       (mass-0 . spin-2)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HIGGS BOSON — mass generation
    ;;; SOURCE: ATLAS/CMS 2012, PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    (higgs-boson
      (scalar-boson)
      (mass-125250-MeV . spin-0)
      ((scalar-boson . couples-to-mass)
       (couples-to-mass . Higgs-field-nonzero-vacuum)
       (Higgs-field-nonzero-vacuum . spontaneous-symmetry-breaking)
       (spontaneous-symmetry-breaking . gives-mass-to-W-Z-and-fermions)
       (gives-mass-to-W-Z-and-fermions . mass-125250-MeV)
       (mass-125250-MeV . spin-0)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE 4 FUNDAMENTAL FORCES — hierarchy
    ;;; SOURCE: standard physics
    ;;; ═══════════════════════════════════════════════════════════

    (strong-force
      (relative-strength-1)
      (range-1e-15-m)
      ((relative-strength-1 . strongest-force)
       (strongest-force . binds-quarks-in-hadrons)
       (binds-quarks-in-hadrons . binds-nucleons-in-nuclei)
       (binds-nucleons-in-nuclei . range-1e-15-m)))

    (electromagnetic-force
      (relative-strength-1/137)
      (range-infinite)
      ((relative-strength-1/137 . alpha-fine-structure-constant)
       (alpha-fine-structure-constant . binds-electrons-to-nuclei)
       (binds-electrons-to-nuclei . governs-chemistry)
       (governs-chemistry . range-infinite)))

    (weak-force
      (relative-strength-1e-6)
      (range-1e-18-m)
      ((relative-strength-1e-6 . responsible-for-beta-decay)
       (responsible-for-beta-decay . changes-quark-flavor)
       (changes-quark-flavor . range-1e-18-m)))

    (gravitational-force
      (relative-strength-6e-39)
      (range-infinite)
      ((relative-strength-6e-39 . weakest-force)
       (weakest-force . always-attractive)
       (always-attractive . dominates-at-large-scales)
       (dominates-at-large-scales . range-infinite)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ANTIMATTER — every fermion has an antiparticle
    ;;; SOURCE: Dirac 1928, experimentally confirmed
    ;;; ═══════════════════════════════════════════════════════════

    (antimatter
      (every-fermion-has-antiparticle)
      (opposite-quantum-numbers)
      ((every-fermion-has-antiparticle . same-mass)
       (same-mass . opposite-charge)
       (opposite-charge . opposite-color)
       (opposite-color . particle-antiparticle-annihilation)
       (particle-antiparticle-annihilation . opposite-quantum-numbers)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION STRUCTURE — why only generation 1 is stable matter
    ;;; SOURCE: standard physics
    ;;; ═══════════════════════════════════════════════════════════

    (generation-stability
      (three-generations)
      (only-generation-1-is-stable)
      ((three-generations . increasing-mass)
       (increasing-mass . heavier-generations-decay-to-lighter)
       (heavier-generations-decay-to-lighter . via-weak-force)
       (via-weak-force . only-generation-1-is-stable)))

  )

  ;;; Vacuum tube
  ((tesla . quarks-and-leptons-registered)))
