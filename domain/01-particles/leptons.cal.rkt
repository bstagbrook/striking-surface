#lang strike

;;; expected-empty-tubes: 14
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: leptons.rkt
;;; LAYER: 01-particles
;;;
;;; Every claim in leptons.rkt checked against primary source.
;;; Primary source: PDG 2024, S. Navas et al.,
;;;   Phys. Rev. D 110, 030001 (2024)
;;;   Retrieved: 2026-03-23 via pdglive.lbl.gov
;;;
;;; ERRORS CAUGHT:
;;; - electron neutrino mass: had 0.45 eV (recent KATRIN, not in PDG 2024)
;;;   PDG 2024 says < 0.8 eV CL=90% → FIXED
;;; ═══════════════════════════════════════════════════════════════

(calibration-leptons

  ;;; Source: calibration process
  ((calibration (leptons) (check) ((leptons . check))))

  ;;; Target: verification entries
  (

    ;;; ── ELECTRON MASS ──
    (check-electron-mass
      (our-claim-0.51099895-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S003)
       (retrieved . 2026-03-23)
       (reference-value . 0.51099895-pm-0.00000015-MeV)
       (our-value . 0.51099895-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── ELECTRON NEUTRINO MASS LIMIT ──
    (check-nu-e-mass
      (our-claim-less-than-0.8-eV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S066)
       (retrieved . 2026-03-23)
       (reference-value . less-than-0.8-eV-CL-90-pct)
       (our-value . less-than-0.8-eV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── MUON MASS ──
    (check-muon-mass
      (our-claim-105.6583755-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S004)
       (retrieved . 2026-03-23)
       (reference-value . 105.6583755-pm-0.0000023-MeV)
       (our-value . 105.6583755-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── MUON LIFETIME ──
    (check-muon-lifetime
      (our-claim-2.1969811e-6-s)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S004)
       (retrieved . 2026-03-23)
       (reference-value . 2.1969811-pm-0.0000022-e-6-s)
       (our-value . 2.1969811e-6-s)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── MUON NEUTRINO MASS LIMIT ──
    (check-nu-mu-mass
      (our-claim-less-than-0.19-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive)
       (retrieved . 2026-03-23)
       (reference-value . less-than-0.19-MeV-CL-90-pct)
       (our-value . less-than-0.19-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── TAU MASS ──
    (check-tau-mass
      (our-claim-1776.93-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S035)
       (retrieved . 2026-03-23)
       (reference-value . 1776.93-pm-0.09-MeV)
       (our-value . 1776.93-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── TAU LIFETIME ──
    (check-tau-lifetime
      (our-claim-2.903e-13-s)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S035)
       (retrieved . 2026-03-23)
       (reference-value . 2.903-pm-0.005-e-13-s)
       (our-value . 2.903e-13-s)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── TAU NEUTRINO MASS LIMIT ──
    (check-nu-tau-mass
      (our-claim-less-than-18.2-MeV)
      (CONFIRMED)
      ((source . PDG-2024-pdglive)
       (retrieved . 2026-03-23)
       (reference-value . less-than-18.2-MeV-CL-95-pct)
       (our-value . less-than-18.2-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── CHARGES ──
    (check-charged-lepton-charges
      (electron-muon-tau-charge-minus-1)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . charge-minus-1-e-for-all)
       (our-value . charge-minus-1)
       (status . CONFIRMED)))

    (check-neutrino-charges
      (all-neutrinos-charge-0)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . charge-0-for-all-neutrinos)
       (our-value . charge-0)
       (status . CONFIRMED)))

    ;;; ── SPIN ──
    (check-lepton-spin
      (all-leptons-spin-1/2)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . spin-1/2-for-all-leptons)
       (our-value . spin-1/2-fermions)
       (status . CONFIRMED)))

    ;;; ── NEUTRINO OSCILLATION ──
    (check-oscillation
      (neutrino-flavor-mixing)
      (CONFIRMED)
      ((source . Super-Kamiokande-1998-SNO-2001-Nobel-2015)
       (retrieved . 2026-03-23)
       (reference-value . flavor-and-mass-eigenstates-differ-PMNS)
       (our-value . mass-eigenstates-differ-from-flavor)
       (status . CONFIRMED)))

    ;;; ── LEPTON UNIVERSALITY ──
    (check-universality
      (identical-EW-coupling)
      (CONFIRMED)
      ((source . LEP-precision-tests-LHCb-RK-consistent-with-SM)
       (retrieved . 2026-03-23)
       (reference-value . SM-predicts-universal-coupling)
       (our-value . identical-electroweak-coupling)
       (status . CONFIRMED)))

    ;;; ── NO COLOR CHARGE ──
    (check-no-color
      (leptons-no-strong-interaction)
      (CONFIRMED)
      ((source . Standard-Model-QCD)
       (retrieved . 2026-03-23)
       (reference-value . leptons-are-color-singlets)
       (our-value . do-not-carry-color)
       (status . CONFIRMED)))

  )

  ;;; Vacuum tube
  ((calibration . leptons-calibrated)))
