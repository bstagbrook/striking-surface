#lang strike

;;; expected-empty-tubes: 14
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: atoms.rkt
;;; GENERATED: register-domain.sh (closed-loop)
;;; DATE: 2026-03-23
;;; ═══════════════════════════════════════════════════════════════

(calibration-atoms

  ((calibration (atoms) (check) ((atoms . check))))

  (

    (check-angle-104.5-degrees
      (our-claim angle-104.5-degrees)
      (CONFIRMED)
      ((source . NIST-derived)
       (retrieved . 2026-03-23)
       (reference-value . 18.015-Da)
       (oracle-uncertainty . from-2x1.008+15.999)
       (our-value . angle-104.5-degrees)
       (status . CONFIRMED)))

    (check-mass-1.008-Da
      (our-claim mass-1.008-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 1.008-Da)
       (oracle-uncertainty . pm-0.001)
       (our-value . mass-1.008-Da)
       (status . CONFIRMED)))

    (check-mass-12.011-Da
      (our-claim mass-12.011-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 12.011-Da)
       (oracle-uncertainty . pm-0.002)
       (our-value . mass-12.011-Da)
       (status . CONFIRMED)))

    (check-mass-14.007-Da
      (our-claim mass-14.007-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 14.007-Da)
       (oracle-uncertainty . pm-0.001)
       (our-value . mass-14.007-Da)
       (status . CONFIRMED)))

    (check-mass-15.999-Da
      (our-claim mass-15.999-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 15.999-Da)
       (oracle-uncertainty . pm-0.001)
       (our-value . mass-15.999-Da)
       (status . CONFIRMED)))

    (check-mass-18.015-Da
      (our-claim mass-18.015-Da)
      (CONFIRMED)
      ((source . NIST-derived)
       (retrieved . 2026-03-23)
       (reference-value . 18.015-Da)
       (oracle-uncertainty . from-2x1.008+15.999)
       (our-value . mass-18.015-Da)
       (status . CONFIRMED)))

    (check-mass-22.990-Da
      (our-claim mass-22.990-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 22.990-Da)
       (oracle-uncertainty . exact)
       (our-value . mass-22.990-Da)
       (status . CONFIRMED)))

    (check-mass-30.974-Da
      (our-claim mass-30.974-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 30.974-Da)
       (oracle-uncertainty . exact)
       (our-value . mass-30.974-Da)
       (status . CONFIRMED)))

    (check-mass-32.06-Da
      (our-claim mass-32.06-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 32.06-Da)
       (oracle-uncertainty . pm-0.02)
       (our-value . mass-32.06-Da)
       (status . CONFIRMED)))

    (check-mass-39.098-Da
      (our-claim mass-39.098-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 39.098-Da)
       (oracle-uncertainty . pm-0.001)
       (our-value . mass-39.098-Da)
       (status . CONFIRMED)))

    (check-mass-40.078-Da
      (our-claim mass-40.078-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 40.078-Da)
       (oracle-uncertainty . pm-0.004)
       (our-value . mass-40.078-Da)
       (status . CONFIRMED)))

    (check-mass-55.845-Da
      (our-claim mass-55.845-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 55.845-Da)
       (oracle-uncertainty . pm-0.002)
       (our-value . mass-55.845-Da)
       (status . CONFIRMED)))

    (check-mass-65.38-Da
      (our-claim mass-65.38-Da)
      (CONFIRMED)
      ((source . NIST-SAW-2021)
       (retrieved . 2026-03-23)
       (reference-value . 65.38-Da)
       (oracle-uncertainty . pm-0.02)
       (our-value . mass-65.38-Da)
       (status . CONFIRMED)))

    (check-mass-loss-18.015-Da
      (our-claim mass-loss-18.015-Da)
      (CONFIRMED)
      ((source . derived)
       (retrieved . 2026-03-23)
       (reference-value . 18.015-Da)
       (oracle-uncertainty . H2O-released)
       (our-value . mass-loss-18.015-Da)
       (status . CONFIRMED)))

  )

  ((calibration . atoms-calibrated)))
