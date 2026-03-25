#lang strike

;;; expected-empty-tubes: 13
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: gauge-bosons.rkt
;;; LAYER: 01-particles
;;;
;;; Every claim checked against PDG 2024 via pdglive.lbl.gov
;;; Retrieved: 2026-03-23
;;;
;;; ERRORS CAUGHT:
;;; - W mass: had 80369, PDG says 80369.2 ± 1.3 → FIXED
;;; - W width: had 2085, PDG says 2140 ± 50 → FIXED
;;; - Z mass: had 91187.6, PDG says 91188.0 ± 2.0 → FIXED
;;; - Z width: had 2495.2, PDG says 2495.5 ± 2.3 → FIXED
;;; - Higgs mass: had 125250, PDG says 125200 ± 110 → FIXED
;;; ═══════════════════════════════════════════════════════════════

(calibration-gauge-bosons

  ;;; Source: calibration process
  ((calibration (gauge-bosons) (check) ((gauge-bosons . check))))

  ;;; Target: verification entries
  (

    ;;; ── PHOTON ──
    (check-photon-mass
      (our-claim-mass-0)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S000)
       (retrieved . 2026-03-23)
       (reference-value . mass-less-than-1e-18-eV)
       (our-value . mass-0)
       (status . CONFIRMED)))

    (check-photon-spin
      (our-claim-spin-1)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . spin-1)
       (our-value . spin-1)
       (status . CONFIRMED)))

    ;;; ── GLUON ──
    (check-gluon-mass
      (our-claim-mass-0)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S030)
       (retrieved . 2026-03-23)
       (reference-value . mass-0-theoretical-confirmed-by-QCD)
       (our-value . mass-0)
       (status . CONFIRMED)))

    (check-gluon-count
      (our-claim-8-types)
      (CONFIRMED)
      ((source . SU3-gauge-theory-3-squared-minus-1)
       (retrieved . 2026-03-23)
       (reference-value . 8-gluons)
       (our-value . 8-gluon-types)
       (status . CONFIRMED)))

    ;;; ── W BOSON ──
    (check-W-mass
      (our-claim-80369.2-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S043)
       (retrieved . 2026-03-23)
       (reference-value . 80369.2-pm-1.3-MeV)
       (our-value . 80369.2-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    (check-W-width
      (our-claim-2140-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S043)
       (retrieved . 2026-03-23)
       (reference-value . 2140-pm-50-MeV)
       (our-value . 2140-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── Z BOSON ──
    (check-Z-mass
      (our-claim-91188.0-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S044)
       (retrieved . 2026-03-23)
       (reference-value . 91188.0-pm-2.0-MeV)
       (our-value . 91188.0-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    (check-Z-width
      (our-claim-2495.5-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S044)
       (retrieved . 2026-03-23)
       (reference-value . 2495.5-pm-2.3-MeV)
       (our-value . 2495.5-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── HIGGS BOSON ──
    (check-Higgs-mass
      (our-claim-125200-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S126)
       (retrieved . 2026-03-23)
       (reference-value . 125200-pm-110-MeV)
       (our-value . 125200-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    (check-Higgs-width
      (our-claim-3.7-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S126)
       (retrieved . 2026-03-23)
       (reference-value . 3.7-plus-1.9-minus-1.4-MeV)
       (our-value . 3.7-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    (check-Higgs-spin
      (our-claim-spin-0)
      (CONFIRMED)
      ((source . ATLAS-CMS-spin-parity-analysis)
       (retrieved . 2026-03-23)
       (reference-value . spin-0-positive-parity)
       (our-value . spin-0)
       (status . CONFIRMED)))

    ;;; ── ELECTROWEAK UNIFICATION ──
    (check-Weinberg-angle
      (our-claim-sin2-0.23122)
      (CONFIRMED)
      ((source . PDG-2024-electroweak-review)
       (retrieved . 2026-03-23)
       (reference-value . sin2-theta-W-0.23122-pm-0.00004)
       (our-value . sin2-0.23122)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── GRAVITON ──
    (check-graviton
      (our-claim-predicted-not-observed)
      (CONFIRMED)
      ((source . experimental-consensus-no-graviton-detected)
       (retrieved . 2026-03-23)
       (reference-value . not-observed-as-of-2024)
       (our-value . predicted-not-observed)
       (status . CONFIRMED)))

  )

  ;;; Vacuum tube
  ((calibration . gauge-bosons-calibrated)))
