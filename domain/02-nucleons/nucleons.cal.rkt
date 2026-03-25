#lang strike

;;; expected-empty-tubes: 16
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: nucleons.rkt
;;; LAYER: 02-nucleons
;;;
;;; Every claim checked against NIST CODATA 2022 and PDG 2024.
;;; Retrieved: 2026-03-23
;;;
;;; CROSS-SOURCE CHECK:
;;; Neutron mass: NIST says 939.56542194 ± 0.00000048 MeV
;;;               PDG says  939.5654205  ± 0.0000005  MeV
;;;   Consistent within uncertainty. We use NIST value.
;;; ═══════════════════════════════════════════════════════════════

(calibration-nucleons

  ;;; Source: calibration process
  ((calibration (nucleons) (check) ((nucleons . check))))

  ;;; Target: verification entries
  (

    ;;; ── PROTON MASS ──
    (check-proton-mass
      (our-claim-938.27208943-MeV)
      (CONFIRMED)
      ((source . NIST-CODATA-2022-mpc2mev)
       (retrieved . 2026-03-23)
       (reference-value . 938.27208943-pm-0.00000029-MeV)
       (our-value . 938.27208943-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── NEUTRON MASS ──
    (check-neutron-mass
      (our-claim-939.56542194-MeV)
      (CONFIRMED)
      ((source . NIST-CODATA-2022-mnc2mev)
       (retrieved . 2026-03-23)
       (reference-value . 939.56542194-pm-0.00000048-MeV)
       (cross-check . PDG-2024-says-939.5654205-pm-0.0000005-MeV)
       (our-value . 939.56542194-MeV)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── NEUTRON LIFETIME ──
    (check-neutron-lifetime
      (our-claim-878.4-s)
      (CONFIRMED)
      ((source . PDG-2024-pdglive-S017)
       (retrieved . 2026-03-23)
       (reference-value . 878.4-pm-0.5-s)
       (our-value . 878.4-s)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── PROTON CHARGE = +1 ──
    (check-proton-charge
      (proton-charge-plus-1)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . charge-plus-1-exact)
       (our-value . charge-plus-1)
       (status . CONFIRMED)))

    ;;; ── NEUTRON CHARGE = 0 ──
    (check-neutron-charge
      (neutron-charge-0)
      (CONFIRMED)
      ((source . PDG-2024-standard)
       (retrieved . 2026-03-23)
       (reference-value . charge-0-exact)
       (our-value . charge-0)
       (status . CONFIRMED)))

    ;;; ── QUARK COMPOSITION ──
    (check-proton-composition
      (proton-is-uud)
      (CONFIRMED)
      ((source . deep-inelastic-scattering-SLAC-1968-Nobel-1990)
       (retrieved . 2026-03-23)
       (reference-value . uud-confirmed)
       (our-value . quark-composition-uud)
       (status . CONFIRMED)))

    (check-neutron-composition
      (neutron-is-udd)
      (CONFIRMED)
      ((source . deep-inelastic-scattering-standard)
       (retrieved . 2026-03-23)
       (reference-value . udd-confirmed)
       (our-value . quark-composition-udd)
       (status . CONFIRMED)))

    ;;; ── NEUTRON-PROTON MASS DIFFERENCE ──
    ;;; Derived: 939.56542194 - 938.27208943 = 1.29333251 MeV
    ;;; Our rounded value: 1.293 MeV
    (check-mass-difference
      (our-claim-1.293-MeV)
      (CONFIRMED)
      ((source . derived-from-NIST-masses)
       (retrieved . 2026-03-23)
       (reference-value . 1.29333251-MeV-exact-from-NIST)
       (our-value . 1.293-MeV-rounded)
       (within-uncertainty . yes)
       (status . CONFIRMED)))

    ;;; ── QCD BINDING FRACTION ──
    ;;; Quark mass sum: 2.16 + 2.16 + 4.70 = 9.02 MeV
    ;;; Proton mass: 938.272 MeV
    ;;; Ratio: 9.02/938.272 = 0.96% from quarks, 99.04% from QCD
    (check-binding-fraction
      (99-pct-binding-energy)
      (CONFIRMED)
      ((source . derived-from-quarks-layer-and-NIST-proton-mass)
       (retrieved . 2026-03-23)
       (reference-value . 99.04-pct-from-QCD)
       (our-value . 99-pct)
       (status . CONFIRMED)))

    ;;; ── BETA DECAY PRODUCTS ──
    (check-decay-products
      (n-to-p-e-nu)
      (CONFIRMED)
      ((source . PDG-2024-neutron-decay-modes)
       (retrieved . 2026-03-23)
       (reference-value . proton-plus-electron-plus-antineutrino-BR-100-pct)
       (our-value . proton-plus-electron-plus-antineutrino)
       (status . CONFIRMED)))

    ;;; ── DERIVED QUANTITIES ──
    ;;; Quark mass sum: 2.16 + 2.16 + 4.70 = 9.02 MeV
    (check-quark-mass-sum
      (our-claim-sum-9.02-MeV)
      (CONFIRMED)
      ((source . derived-from-quarks-layer)
       (retrieved . 2026-03-23)
       (reference-value . 2.16-plus-2.16-plus-4.70-equals-9.02-MeV)
       (our-value . mass-sum-9.02-MeV)
       (status . CONFIRMED)))

    ;;; QCD binding: 938.272 - 9.02 = 929.25 MeV
    (check-qcd-binding
      (our-claim-energy-929.25-MeV)
      (CONFIRMED)
      ((source . derived-from-proton-mass-minus-quark-sum)
       (retrieved . 2026-03-23)
       (reference-value . difference-929.25-MeV)
       (our-value . energy-929.25-MeV)
       (status . CONFIRMED)))

    ;;; Abbreviated masses used in derivations
    (check-proton-mass-rounded
      (our-claim-mass-938.272-MeV)
      (CONFIRMED)
      ((source . NIST-CODATA-2022-rounded)
       (retrieved . 2026-03-23)
       (reference-value . 938.27208943-MeV-rounded-to-938.272-MeV)
       (our-value . mass-938.272-MeV)
       (status . CONFIRMED)))

    (check-neutron-mass-rounded
      (our-claim-mass-939.565-MeV)
      (CONFIRMED)
      ((source . NIST-CODATA-2022-rounded)
       (retrieved . 2026-03-23)
       (reference-value . 939.56542194-MeV-rounded-to-939.565-MeV)
       (our-value . mass-939.565-MeV)
       (status . CONFIRMED)))

    ;;; Gluon momentum fraction
    (check-gluon-momentum
      (carry-50-pct)
      (CONFIRMED)
      ((source . deep-inelastic-scattering-experiments)
       (retrieved . 2026-03-23)
       (reference-value . gluons-carry-approximately-50-pct-of-nucleon-momentum)
       (our-value . carry-50-pct)
       (status . CONFIRMED)))

  )

  ;;; Vacuum tube
  ((calibration . nucleons-calibrated)))
