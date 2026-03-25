#lang strike

;;; expected-empty-tubes: 13
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: domain/01-particles/quarks.rkt
;;; LAYER: 01-particles
;;;
;;; Every claim in quarks.rkt checked against primary source.
;;; Primary source: PDG 2024, S. Navas et al.,
;;;   Phys. Rev. D 110, 030001 (2024)
;;;   Retrieved: 2026-03-23
;;;
;;; PREVIOUS ERRORS CAUGHT:
;;; - down quark: had 4.67, PDG says 4.70 ± 0.07 → FIXED
;;; - strange quark: had 93, PDG says 93.5 ± 0.8 → FIXED
;;; - charm quark: had 1270, PDG says 1273.0 ± 4.6 → FIXED
;;; - bottom quark: had 4180, PDG says 4183 ± 7 → FIXED
;;; - top quark: had 172760, PDG says 172520 ± 330 → FIXED
;;; ═══════════════════════════════════════════════════════════════

(calibration-quarks

  ;;; Source: calibration process
  ((calibration (quarks.rkt) (check) ((quarks.rkt . check))))

  ;;; Target: verification entries
  (

    ;;; ── UP QUARK MASS ──
    (check-up-mass
      (our-claim-2.16-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-Q123UM)
       (retrieved . 2026-03-23)
       (reference-value . 2.16-pm-0.07-MeV-CL-90-pct)
       (our-value . 2.16-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── DOWN QUARK MASS ──
    (check-down-mass
      (our-claim-4.70-MeV)
      (CONFIRMED)
      ((source . PDG-2024-quark-summary-table)
       (retrieved . 2026-03-23)
       (reference-value . 4.70-pm-0.07-MeV-CL-90-pct)
       (our-value . 4.70-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── STRANGE QUARK MASS ──
    (check-strange-mass
      (our-claim-93.5-MeV)
      (CONFIRMED)
      ((source . PDG-2024-quark-summary-table)
       (retrieved . 2026-03-23)
       (reference-value . 93.5-pm-0.8-MeV-CL-90-pct)
       (our-value . 93.5-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── CHARM QUARK MASS ──
    (check-charm-mass
      (our-claim-1273-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-Q004M)
       (retrieved . 2026-03-23)
       (reference-value . 1273.0-pm-4.6-MeV-CL-90-pct)
       (our-value . 1273-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── BOTTOM QUARK MASS ──
    (check-bottom-mass
      (our-claim-4183-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-Q005M)
       (retrieved . 2026-03-23)
       (reference-value . 4183-pm-7-MeV-CL-90-pct)
       (our-value . 4183-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── TOP QUARK MASS ──
    (check-top-mass
      (our-claim-172520-MeV)
      (CONFIRMED)
      ((source . PDG-2024-top-quark-review)
       (retrieved . 2026-03-23)
       (reference-value . 172520-pm-330-MeV-direct)
       (our-value . 172520-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── QUARK CHARGES ──
    (check-up-type-charges
      (up-charm-top-charge-plus-2/3)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . plus-2/3-e-for-all-up-type)
       (our-value . plus-2/3)
       (status . CONFIRMED)))

    (check-down-type-charges
      (down-strange-bottom-charge-minus-1/3)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . minus-1/3-e-for-all-down-type)
       (our-value . minus-1/3)
       (status . CONFIRMED)))

    ;;; ── COLOR CHARGE ──
    (check-color-SU3
      (three-colors-SU3)
      (CONFIRMED)
      ((source . QCD-Gross-Wilczek-Politzer-1973-Nobel-2004)
       (retrieved . 2026-03-23)
       (reference-value . SU3-color-gauge-3-colors-8-gluons)
       (our-value . SU3-3-colors)
       (status . CONFIRMED)))

    ;;; ── CONFINEMENT ──
    (check-confinement
      (no-free-quarks-observed)
      (CONFIRMED)
      ((source . experimental-consensus-no-free-quarks)
       (retrieved . 2026-03-23)
       (reference-value . no-isolated-color-charge-ever-observed)
       (our-value . always-confined-in-hadrons)
       (status . CONFIRMED)))

    ;;; ── SPIN ──
    (check-quark-spin
      (all-quarks-spin-1/2)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . spin-1/2-for-all-quarks)
       (our-value . spin-1/2-fermions)
       (status . CONFIRMED)))

    ;;; ── GENERATION COUNT ──
    (check-three-generations
      (exactly-3-generations)
      (CONFIRMED)
      ((source . LEP-Z-width-measurement-3-light-neutrinos)
       (retrieved . 2026-03-23)
       (reference-value . N-nu-equals-2.9840-pm-0.0082)
       (our-value . 3-generations)
       (status . CONFIRMED)))

    ;;; ── RENORMALIZATION SCHEME ──
    (check-scheme-light
      (MS-bar-at-2-GeV-for-u-d-s)
      (CONFIRMED)
      ((source . PDG-2024-quark-masses-review-section-60)
       (retrieved . 2026-03-23)
       (reference-value . MS-bar-mu-equals-2-GeV)
       (our-value . MS-bar-at-mu-2-GeV)
       (status . CONFIRMED)))

  )

  ;;; Vacuum tube
  ((calibration . quarks-calibrated)))
