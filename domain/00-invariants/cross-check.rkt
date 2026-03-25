#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN INVARIANTS
;;; LAYER: 00-invariants
;;; DEPENDS ON: all domain files
;;; DEPENDED ON BY: all research files
;;;
;;; PURPOSE: Structural invariants that must hold across the entire
;;; domain model. Each transformation is a checkable claim about
;;; relationships between domain files. If the residue traces
;;; completely, the invariant holds. Empty tube = violation.
;;;
;;; This file IS the cross-check. Strike it. Read the residue.
;;; Every tube must be full. Every chain must complete.
;;;
;;; SCOPE: Only invariants derivable from accepted physics.
;;; ═══════════════════════════════════════════════════════════════

(domain-cross-check

  ;;; Source: structural invariants of the Standard Model
  ((invariants (Standard-Model) (must-hold) ((Standard-Model . must-hold))))

  ;;; Target: the invariants themselves
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHARGE QUANTIZATION
    ;;; All quark charges are multiples of 1/3.
    ;;; All lepton charges are integers.
    ;;; Proton charge = +1 (exact) = uud = 2/3 + 2/3 - 1/3.
    ;;; Neutron charge = 0 (exact) = udd = 2/3 - 1/3 - 1/3.
    ;;; SOURCE: Standard Model, experimentally confirmed
    ;;; ═══════════════════════════════════════════════════════════

    (proton-charge-sum
      (uud-composition)
      (charge-exactly-plus-1)
      ((uud-composition . two-up-one-down)
       (two-up-one-down . 2/3-plus-2/3-minus-1/3)
       (2/3-plus-2/3-minus-1/3 . equals-3/3)
       (equals-3/3 . charge-exactly-plus-1)))

    (neutron-charge-sum
      (udd-composition)
      (charge-exactly-0)
      ((udd-composition . one-up-two-down)
       (one-up-two-down . 2/3-minus-1/3-minus-1/3)
       (2/3-minus-1/3-minus-1/3 . equals-0/3)
       (equals-0/3 . charge-exactly-0)))

    (electron-charge-exact
      (electron-charge)
      (charge-exactly-minus-1)
      ((electron-charge . integer-charge)
       (integer-charge . lepton-charges-are-integers)
       (lepton-charges-are-integers . charge-exactly-minus-1)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION STRUCTURE
    ;;; Exactly 3 generations.
    ;;; Each generation has: 1 up-type quark, 1 down-type quark,
    ;;;   1 charged lepton, 1 neutrino.
    ;;; Confirmed by LEP Z-width: N_nu = 2.9840 ± 0.0082
    ;;; SOURCE: PDG 2024; LEP electroweak working group
    ;;; ═══════════════════════════════════════════════════════════

    (generation-1-complete
      (gen-1-members)
      (four-fermions)
      ((gen-1-members . up-quark)
       (up-quark . down-quark)
       (down-quark . electron)
       (electron . electron-neutrino)
       (electron-neutrino . four-fermions)))

    (generation-2-complete
      (gen-2-members)
      (four-fermions)
      ((gen-2-members . charm-quark)
       (charm-quark . strange-quark)
       (strange-quark . muon)
       (muon . muon-neutrino)
       (muon-neutrino . four-fermions)))

    (generation-3-complete
      (gen-3-members)
      (four-fermions)
      ((gen-3-members . top-quark)
       (top-quark . bottom-quark)
       (bottom-quark . tau)
       (tau . tau-neutrino)
       (tau-neutrino . four-fermions)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MASS ORDERING
    ;;; Within each charge sector, masses increase by generation.
    ;;; up < charm < top
    ;;; down < strange < bottom
    ;;; electron < muon < tau
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    (up-type-mass-ordering
      (mass-2.16-MeV)
      (confirmed-increasing)
      ((mass-2.16-MeV . less-than-mass-1273-MeV)
       (less-than-mass-1273-MeV . less-than-mass-172520-MeV)
       (less-than-mass-172520-MeV . confirmed-increasing)))

    (down-type-mass-ordering
      (mass-4.70-MeV)
      (confirmed-increasing)
      ((mass-4.70-MeV . less-than-mass-93.5-MeV)
       (less-than-mass-93.5-MeV . less-than-mass-4183-MeV)
       (less-than-mass-4183-MeV . confirmed-increasing)))

    (charged-lepton-mass-ordering
      (mass-0.51099895-MeV)
      (confirmed-increasing)
      ((mass-0.51099895-MeV . less-than-mass-105.6583755-MeV)
       (less-than-mass-105.6583755-MeV . less-than-mass-1776.93-MeV)
       (less-than-mass-1776.93-MeV . confirmed-increasing)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CONSERVATION LAWS
    ;;; Electric charge is conserved in all interactions.
    ;;; Baryon number is conserved (in SM).
    ;;; Lepton number is conserved (in SM, per generation).
    ;;; Color charge is conserved (all hadrons are color singlets).
    ;;; SOURCE: Standard Model, experimentally confirmed
    ;;; ═══════════════════════════════════════════════════════════

    (charge-conservation
      (all-interactions)
      (total-charge-before-equals-after)
      ((all-interactions . electromagnetic-conserves)
       (electromagnetic-conserves . weak-conserves)
       (weak-conserves . strong-conserves)
       (strong-conserves . total-charge-before-equals-after)))

    (baryon-number-conservation
      (quarks-carry-baryon-1/3)
      (total-baryon-number-conserved)
      ((quarks-carry-baryon-1/3 . antiquarks-carry-minus-1/3)
       (antiquarks-carry-minus-1/3 . proton-baryon-number-1)
       (proton-baryon-number-1 . no-proton-decay-observed)
       (no-proton-decay-observed . total-baryon-number-conserved)))

    (color-singlet-confinement
      (observable-hadrons)
      (always-color-neutral)
      ((observable-hadrons . mesons-are-color-anticolor)
       (mesons-are-color-anticolor . baryons-are-rgb-singlet)
       (baryons-are-rgb-singlet . no-free-color-charge-observed)
       (no-free-color-charge-observed . always-color-neutral)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FORCE HIERARCHY
    ;;; strong > electromagnetic > weak > gravity
    ;;; Relative strengths span ~40 orders of magnitude
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    (force-hierarchy
      (strong-relative-1)
      (gravity-weakest)
      ((strong-relative-1 . electromagnetic-relative-1/137)
       (electromagnetic-relative-1/137 . weak-relative-1e-6)
       (weak-relative-1e-6 . gravity-relative-6e-39)
       (gravity-relative-6e-39 . gravity-weakest)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPIN-STATISTICS
    ;;; All quarks and leptons are spin-1/2 fermions.
    ;;; All force carriers are spin-1 bosons (except graviton spin-2).
    ;;; Higgs is spin-0.
    ;;; SOURCE: Standard Model
    ;;; ═══════════════════════════════════════════════════════════

    (fermion-boson-division
      (matter-particles)
      (correct-spin-statistics)
      ((matter-particles . quarks-are-spin-1/2)
       (quarks-are-spin-1/2 . leptons-are-spin-1/2)
       (leptons-are-spin-1/2 . fermions-obey-Pauli)
       (fermions-obey-Pauli . force-carriers-are-spin-1)
       (force-carriers-are-spin-1 . bosons-obey-Bose-Einstein)
       (bosons-obey-Bose-Einstein . correct-spin-statistics)))

  )

  ;;; Vacuum tube
  ((invariants . cross-check-passed)))
