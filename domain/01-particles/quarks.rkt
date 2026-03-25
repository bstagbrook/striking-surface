#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Quarks
;;; LAYER: 01-particles
;;; DEPENDS ON: none (fundamental)
;;; DEPENDED ON BY: 03-nucleons (proton/neutron composition)
;;;
;;; PURPOSE: The six quarks of the Standard Model with their
;;; measured properties.
;;;
;;; SCOPE: Only experimentally measured, PDG-accepted values.
;;;
;;; SOURCES:
;;; [PDG-2024] S. Navas et al. (Particle Data Group),
;;;   Phys. Rev. D 110, 030001 (2024).
;;;   pdg.lbl.gov/2024
;;;   pdgLive: pdglive.lbl.gov
;;;
;;; UNITS: MeV/c² for masses. MS-bar scheme at μ = 2 GeV
;;; for light quarks (u, d, s). MS-bar at m_q for heavy quarks
;;; (c, b). Direct measurement for top.
;;;
;;; CALIBRATION: quarks.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-quarks

  ;;; Source: PDG 2024
  ((PDG-2024 (Phys-Rev-D-110-030001) (authoritative) ((Phys-Rev-D-110-030001 . authoritative))))

  ;;; Target: quark properties
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 1 — stable matter
    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov/DataBlock.action?node=Q123UM
    ;;; ═══════════════════════════════════════════════════════════

    (up-quark
      (flavor-up)
      (charge-plus-2/3 . mass-2.16-MeV)
      ((flavor-up . generation-1)
       (generation-1 . lightest-up-type)
       (lightest-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-2.16-MeV)
       (mass-2.16-MeV . uncertainty-pm-0.07-MeV)
       (uncertainty-pm-0.07-MeV . CL-90-pct)
       (CL-90-pct . MS-bar-at-mu-2-GeV)
       ;;; BRIDGE: 02-nucleons → 01-particles/quarks
       ;;; Two up quarks in proton (uud), one in neutron (udd)
       ;;; SOURCE: Standard Model quark composition
       (baryon . three-quarks-in-color-singlet)
       (three-quarks-in-color-singlet . color-charge)
       (spin-1/2 . intrinsic-angular-momentum)
       (intrinsic-angular-momentum . half-integer-h-bar)
       (charge-plus-1 . two-up-plus-one-down)))

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov/DataBlock.action?node=Q123DM
    (down-quark
      (flavor-down)
      (charge-minus-1/3 . mass-4.70-MeV)
      ((flavor-down . generation-1)
       (generation-1 . lightest-down-type)
       (lightest-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-4.70-MeV)
       (mass-4.70-MeV . uncertainty-pm-0.07-MeV)
       (uncertainty-pm-0.07-MeV . CL-90-pct)
       (CL-90-pct . MS-bar-at-mu-2-GeV)
       ;;; BRIDGE: 02-nucleons → 01-particles/quarks
       ;;; One down quark in proton (uud), two in neutron (udd)
       ;;; SOURCE: Standard Model quark composition
       (baryon-number-1 . each-quark-carries-1/3)
       (each-quark-carries-1/3 . three-quarks-per-baryon)
       (charge-0 . one-up-two-down-cancel)
       (one-up-two-down-cancel . net-zero-electric-charge)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 2
    ;;; ═══════════════════════════════════════════════════════════

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov/DataBlock.action?node=Q004M
    (charm-quark
      (flavor-charm)
      (charge-plus-2/3 . mass-1273-MeV)
      ((flavor-charm . generation-2)
       (generation-2 . heavier-up-type)
       (heavier-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-1273-MeV)
       (mass-1273-MeV . uncertainty-pm-4.6-MeV)
       (uncertainty-pm-4.6-MeV . CL-90-pct)
       (CL-90-pct . MS-bar-at-mu-mc)))

    ;;; SOURCE: [PDG-2024] light quark summary table
    (strange-quark
      (flavor-strange)
      (charge-minus-1/3 . mass-93.5-MeV)
      ((flavor-strange . generation-2)
       (generation-2 . heavier-down-type)
       (heavier-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-93.5-MeV)
       (mass-93.5-MeV . uncertainty-pm-0.8-MeV)
       (uncertainty-pm-0.8-MeV . CL-90-pct)
       (CL-90-pct . MS-bar-at-mu-2-GeV)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERATION 3
    ;;; ═══════════════════════════════════════════════════════════

    ;;; SOURCE: [PDG-2024] pdg.lbl.gov/2024/reviews/rpp2024-rev-top-quark.pdf
    (top-quark
      (flavor-top)
      (charge-plus-2/3 . mass-172520-MeV)
      ((flavor-top . generation-3)
       (generation-3 . heaviest-up-type)
       (heaviest-up-type . charge-plus-2/3)
       (charge-plus-2/3 . mass-172520-MeV)
       (mass-172520-MeV . uncertainty-pm-330-MeV)
       (uncertainty-pm-330-MeV . direct-measurement-LHC)))

    ;;; SOURCE: [PDG-2024] pdglive.lbl.gov/DataBlock.action?node=Q005M
    (bottom-quark
      (flavor-bottom)
      (charge-minus-1/3 . mass-4183-MeV)
      ((flavor-bottom . generation-3)
       (generation-3 . heaviest-down-type)
       (heaviest-down-type . charge-minus-1/3)
       (charge-minus-1/3 . mass-4183-MeV)
       (mass-4183-MeV . uncertainty-pm-7-MeV)
       (uncertainty-pm-7-MeV . CL-90-pct)
       (CL-90-pct . MS-bar-at-mu-mb)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUARK PROPERTIES — universal
    ;;; SOURCE: [PDG-2024] standard QCD
    ;;; ═══════════════════════════════════════════════════════════

    ;;; All quarks carry color charge (red, green, blue)
    ;;; SOURCE: QCD, Gross-Wilczek-Politzer 1973 (Nobel 2004)
    (color-charge
      (red green blue)
      (SU3-color-gauge-symmetry)
      ((red . color-charge)
       (green . color-charge)
       (blue . color-charge)
       (color-charge . confined-to-color-singlets)
       (confined-to-color-singlets . SU3-color-gauge-symmetry)))

    ;;; Confinement: quarks are never observed free
    ;;; SOURCE: QCD, experimentally confirmed (no free quarks observed)
    (confinement
      (color-charged-particles)
      (always-confined-in-hadrons)
      ((color-charged-particles . strong-coupling-increases-with-distance)
       (strong-coupling-increases-with-distance . separation-energy-creates-new-pairs)
       (separation-energy-creates-new-pairs . always-confined-in-hadrons)))

    ;;; All quarks are spin-1/2 fermions
    ;;; SOURCE: [PDG-2024] standard
    (quark-spin
      (all-quarks)
      (spin-1/2-fermions)
      ((all-quarks . obey-Fermi-Dirac-statistics)
       (obey-Fermi-Dirac-statistics . Pauli-exclusion-principle)
       (Pauli-exclusion-principle . spin-1/2-fermions)))

    ;;; Generation stability: heavier generations decay to lighter
    ;;; SOURCE: standard electroweak theory, CKM matrix
    (generation-decay
      (heavier-quarks)
      (decay-to-lighter-via-weak-force)
      ((heavier-quarks . weak-interaction-changes-flavor)
       (weak-interaction-changes-flavor . W-boson-mediates)
       (W-boson-mediates . CKM-matrix-determines-rates)
       (CKM-matrix-determines-rates . decay-to-lighter-via-weak-force)))

  )

  ;;; Vacuum tube
  ((PDG-2024 . quarks-registered)))
