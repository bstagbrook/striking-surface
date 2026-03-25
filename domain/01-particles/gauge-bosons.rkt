#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Gauge Bosons & Higgs
;;; LAYER: 01-particles
;;; DEPENDS ON: none (fundamental)
;;; DEPENDED ON BY: 02-forces, 00-invariants
;;;
;;; PURPOSE: The force-carrying bosons of the Standard Model
;;; and the Higgs scalar.
;;;
;;; SCOPE: Only experimentally measured, PDG-accepted values.
;;;
;;; SOURCES:
;;; [PDG-2024] S. Navas et al. (Particle Data Group),
;;;   Phys. Rev. D 110, 030001 (2024).
;;;   rpp2024-sum-gauge-higgs-bosons.pdf
;;;
;;; UNITS: MeV/c² for masses. GeV for W/Z/Higgs where conventional.
;;;
;;; CALIBRATION: gauge-bosons.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-gauge-bosons

  ;;; Source: PDG 2024
  ((PDG-2024 (Phys-Rev-D-110-030001) (authoritative) ((Phys-Rev-D-110-030001 . authoritative))))

  ;;; Target: boson properties
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHOTON — electromagnetic force carrier
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov S000
    ;;; ═══════════════════════════════════════════════════════════

    (photon
      (electromagnetic-force-carrier)
      (mass-0 . spin-1)
      ((electromagnetic-force-carrier . U1-gauge-boson)
       (U1-gauge-boson . electrically-neutral)
       (electrically-neutral . no-self-interaction)
       (no-self-interaction . infinite-range)
       (infinite-range . mass-0)
       (mass-0 . spin-1)
       (spin-1 . stable)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GLUON — strong force carrier
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov S030
    ;;; ═══════════════════════════════════════════════════════════

    (gluon
      (strong-force-carrier)
      (mass-0 . spin-1)
      ((strong-force-carrier . SU3-gauge-boson)
       (SU3-gauge-boson . carries-color-charge)
       (carries-color-charge . self-interacting)
       (self-interacting . 8-gluon-types)
       (8-gluon-types . confinement)
       (confinement . mass-0)
       (mass-0 . spin-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; W BOSON — charged weak force carrier
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov S043
    ;;; ═══════════════════════════════════════════════════════════

    (W-boson
      (charged-weak-force-carrier)
      (mass-80369.2-MeV . spin-1)
      ((charged-weak-force-carrier . SU2-gauge-boson)
       (SU2-gauge-boson . W-plus-and-W-minus)
       (W-plus-and-W-minus . mediates-flavor-change)
       (mediates-flavor-change . couples-to-left-handed-fermions)
       (couples-to-left-handed-fermions . mass-80369.2-MeV)
       (mass-80369.2-MeV . uncertainty-pm-1.3-MeV)
       (uncertainty-pm-1.3-MeV . total-width-2140-MeV)
       (total-width-2140-MeV . spin-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; Z BOSON — neutral weak force carrier
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov S044
    ;;; ═══════════════════════════════════════════════════════════

    (Z-boson
      (neutral-weak-force-carrier)
      (mass-91188.0-MeV . spin-1)
      ((neutral-weak-force-carrier . SU2-x-U1-gauge-boson)
       (SU2-x-U1-gauge-boson . mediates-neutral-current)
       (mediates-neutral-current . couples-to-all-fermions)
       (couples-to-all-fermions . mass-91188.0-MeV)
       (mass-91188.0-MeV . uncertainty-pm-2.0-MeV)
       (uncertainty-pm-2.0-MeV . total-width-2495.5-MeV)
       (total-width-2495.5-MeV . spin-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HIGGS BOSON — mass generation
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov S126
    ;;; Discovered: ATLAS & CMS 2012 (Nobel 2013)
    ;;; ═══════════════════════════════════════════════════════════

    (Higgs-boson
      (scalar-boson)
      (mass-125200-MeV . spin-0)
      ((scalar-boson . SU2-doublet-component)
       (SU2-doublet-component . nonzero-vacuum-expectation-value)
       (nonzero-vacuum-expectation-value . spontaneous-symmetry-breaking)
       (spontaneous-symmetry-breaking . gives-mass-to-W-Z-and-fermions)
       (gives-mass-to-W-Z-and-fermions . mass-125200-MeV)
       (mass-125200-MeV . uncertainty-pm-110-MeV)
       (uncertainty-pm-110-MeV . total-width-3.7-MeV)
       (total-width-3.7-MeV . spin-0)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTROWEAK UNIFICATION
    ;;; SOURCE: Weinberg 1967, Salam 1968, Glashow 1961 (Nobel 1979)
    ;;; ═══════════════════════════════════════════════════════════

    ;;; SU(2)×U(1) → photon + W + Z after symmetry breaking
    (electroweak-unification
      (SU2-x-U1-symmetry)
      (four-gauge-bosons-after-breaking)
      ((SU2-x-U1-symmetry . three-W-bosons-plus-one-B-boson)
       (three-W-bosons-plus-one-B-boson . Higgs-breaks-symmetry)
       (Higgs-breaks-symmetry . W-plus-W-minus-acquire-mass)
       (W-plus-W-minus-acquire-mass . W3-and-B-mix)
       (W3-and-B-mix . Z-acquires-mass-photon-stays-massless)
       (Z-acquires-mass-photon-stays-massless . Weinberg-angle-sin2-0.23122)
       (Weinberg-angle-sin2-0.23122 . four-gauge-bosons-after-breaking)))

    ;;; Graviton — predicted, not observed
    ;;; SOURCE: general relativity + quantum field theory prediction
    (graviton
      (gravitational-force-carrier)
      (mass-0 . spin-2)
      ((gravitational-force-carrier . predicted-not-observed)
       (predicted-not-observed . if-exists-mass-0)
       (if-exists-mass-0 . if-exists-spin-2)
       (if-exists-spin-2 . mass-0)
       (mass-0 . spin-2)))

  )

  ;;; Vacuum tube
  ((PDG-2024 . gauge-bosons-registered)))
