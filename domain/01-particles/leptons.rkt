#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Leptons
;;; LAYER: 01-particles
;;; DEPENDS ON: none (fundamental)
;;; DEPENDED ON BY: 04-atoms (electron shells), 00-invariants
;;;
;;; PURPOSE: The six leptons of the Standard Model with their
;;; measured properties.
;;;
;;; SCOPE: Only experimentally measured, PDG-accepted values.
;;;
;;; SOURCES:
;;; [PDG-2024] S. Navas et al. (Particle Data Group),
;;;   Phys. Rev. D 110, 030001 (2024).
;;;   pdg.lbl.gov/2024
;;;   rpp2024-sum-leptons.pdf
;;;
;;; UNITS: MeV/c² for masses unless noted. Seconds for lifetimes.
;;;
;;; CALIBRATION: leptons.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-leptons

  ;;; Source: PDG 2024
  ((PDG-2024 (Phys-Rev-D-110-030001) (authoritative) ((Phys-Rev-D-110-030001 . authoritative))))

  ;;; Target: lepton properties
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 1 — stable matter
    ;;; SOURCE: [PDG-2024] rpp2024-sum-leptons.pdf
    ;;; ═══════════════════════════════════════════════════════════

    (electron
      (flavor-electron)
      (charge-minus-1 . mass-0.51099895-MeV)
      ((flavor-electron . generation-1)
       (generation-1 . lightest-charged-lepton)
       (lightest-charged-lepton . stable)
       (stable . charge-minus-1)
       (charge-minus-1 . mass-0.51099895-MeV)
       (mass-0.51099895-MeV . uncertainty-pm-0.00000015-MeV)
       (uncertainty-pm-0.00000015-MeV . spin-1/2)))

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov — neutrino mass limits
    ;;; Direct kinematic limit from KATRIN (tritium beta decay)
    (electron-neutrino
      (flavor-electron-neutrino)
      (charge-0 . mass-less-than-0.8-eV)
      ((flavor-electron-neutrino . generation-1)
       (generation-1 . pairs-with-electron)
       (pairs-with-electron . charge-0)
       (charge-0 . mass-less-than-0.8-eV)
       (mass-less-than-0.8-eV . CL-90-pct)
       (CL-90-pct . direct-kinematic-limit)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 2
    ;;; SOURCE: [PDG-2024] rpp2024-sum-leptons.pdf
    ;;; ═══════════════════════════════════════════════════════════

    (muon
      (flavor-muon)
      (charge-minus-1 . mass-105.6583755-MeV)
      ((flavor-muon . generation-2)
       (generation-2 . heavier-charged-lepton)
       (heavier-charged-lepton . charge-minus-1)
       (charge-minus-1 . mass-105.6583755-MeV)
       (mass-105.6583755-MeV . uncertainty-pm-0.0000023-MeV)
       (uncertainty-pm-0.0000023-MeV . mean-life-2.1969811e-6-s)
       (mean-life-2.1969811e-6-s . spin-1/2)))

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov — muon neutrino
    (muon-neutrino
      (flavor-muon-neutrino)
      (charge-0 . mass-less-than-0.19-MeV)
      ((flavor-muon-neutrino . generation-2)
       (generation-2 . pairs-with-muon)
       (pairs-with-muon . charge-0)
       (charge-0 . mass-less-than-0.19-MeV)
       (mass-less-than-0.19-MeV . CL-90-pct)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 3
    ;;; SOURCE: [PDG-2024] rpp2024-sum-leptons.pdf
    ;;; ═══════════════════════════════════════════════════════════

    (tau
      (flavor-tau)
      (charge-minus-1 . mass-1776.93-MeV)
      ((flavor-tau . generation-3)
       (generation-3 . heaviest-charged-lepton)
       (heaviest-charged-lepton . charge-minus-1)
       (charge-minus-1 . mass-1776.93-MeV)
       (mass-1776.93-MeV . uncertainty-pm-0.09-MeV)
       (uncertainty-pm-0.09-MeV . mean-life-2.903e-13-s)
       (mean-life-2.903e-13-s . spin-1/2)))

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov — tau neutrino
    (tau-neutrino
      (flavor-tau-neutrino)
      (charge-0 . mass-less-than-18.2-MeV)
      ((flavor-tau-neutrino . generation-3)
       (generation-3 . pairs-with-tau)
       (pairs-with-tau . charge-0)
       (charge-0 . mass-less-than-18.2-MeV)
       (mass-less-than-18.2-MeV . CL-95-pct)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; UNIVERSAL LEPTON PROPERTIES
    ;;; SOURCE: [PDG-2024] standard electroweak theory
    ;;; ═══════════════════════════════════════════════════════════

    ;;; All leptons are spin-1/2 fermions
    (lepton-spin
      (all-leptons)
      (spin-1/2-fermions)
      ((all-leptons . obey-Fermi-Dirac-statistics)
       (obey-Fermi-Dirac-statistics . Pauli-exclusion-principle)
       (Pauli-exclusion-principle . spin-1/2-fermions)))

    ;;; Leptons carry no color charge — no strong interaction
    (no-color-charge
      (all-leptons)
      (do-not-carry-color)
      ((all-leptons . no-strong-interaction)
       (no-strong-interaction . not-confined)
       (not-confined . can-exist-free)
       (can-exist-free . do-not-carry-color)))

    ;;; Neutrino oscillation — flavor and mass eigenstates differ
    ;;; SOURCE: Super-Kamiokande 1998, SNO 2001 (Nobel 2015)
    (neutrino-oscillation
      (neutrino-flavors)
      (mass-eigenstates-differ-from-flavor)
      ((neutrino-flavors . PMNS-matrix-mixes)
       (PMNS-matrix-mixes . neutrinos-have-nonzero-mass)
       (neutrinos-have-nonzero-mass . mass-eigenstates-differ-from-flavor)))

    ;;; Lepton universality — all charged leptons couple identically
    ;;; to W and Z bosons (up to mass effects)
    ;;; SOURCE: LEP precision tests; recent LHCb R(K) consistent with SM
    (lepton-universality
      (electron-muon-tau)
      (identical-electroweak-coupling)
      ((electron-muon-tau . same-weak-isospin)
       (same-weak-isospin . same-hypercharge)
       (same-hypercharge . coupling-differs-only-by-mass)
       (coupling-differs-only-by-mass . identical-electroweak-coupling)))

  )

  ;;; Vacuum tube
  ((PDG-2024 . leptons-registered)))
