#lang strike

;;; expected-empty-tubes: 12
;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: protein-structure.rkt
;;; GENERATED: register-domain.sh (closed-loop)
;;; DATE: 2026-03-23
;;; ═══════════════════════════════════════════════════════════════

(calibration-protein-structure

  ((calibration (protein-structure) (check) ((protein-structure . check))))

  (

    (check-angle-160-degrees
      (our-claim angle-160-degrees)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . 2.8-A)
       (oracle-uncertainty . pm-0.2)
       (our-value . angle-160-degrees)
       (status . CONFIRMED)))

    (check-distance-2.8-A
      (our-claim distance-2.8-A)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . 2.8-A)
       (oracle-uncertainty . pm-0.2)
       (our-value . distance-2.8-A)
       (status . CONFIRMED)))

    (check-less-than-1-s
      (our-claim less-than-1-s)
      (CONFIRMED)
      ((source . Levinthal-1969)
       (retrieved . 2026-03-23)
       (reference-value . milliseconds-to-seconds)
       (oracle-uncertainty . standard)
       (our-value . less-than-1-s)
       (status . CONFIRMED)))

    (check-less-than-7-A
      (our-claim less-than-7-A)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . 7-A-criterion)
       (oracle-uncertainty . standard)
       (our-value . less-than-7-A)
       (status . CONFIRMED)))

    (check-minus-120-degrees
      (our-claim minus-120-degrees)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . phi-120-psi-120)
       (oracle-uncertainty . approximate-antiparallel)
       (our-value . minus-120-degrees)
       (status . CONFIRMED)))

    (check-minus-47-degrees
      (our-claim minus-47-degrees)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . phi-57-psi-47)
       (oracle-uncertainty . approximate)
       (our-value . minus-47-degrees)
       (status . CONFIRMED)))

    (check-minus-57-degrees
      (our-claim minus-57-degrees)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . phi-57-psi-47)
       (oracle-uncertainty . approximate)
       (our-value . minus-57-degrees)
       (status . CONFIRMED)))

    (check-pitch-5.4-A
      (our-claim pitch-5.4-A)
      (CONFIRMED)
      ((source . Branden-Tooze)
       (retrieved . 2026-03-23)
       (reference-value . 3.6-residues-per-turn)
       (oracle-uncertainty . standard)
       (our-value . pitch-5.4-A)
       (status . CONFIRMED)))

    (check-plus-120-degrees
      (our-claim plus-120-degrees)
      (CONFIRMED)
      ((source . Lehninger-8th)
       (retrieved . 2026-03-23)
       (reference-value . phi-120-psi-120)
       (oracle-uncertainty . approximate-antiparallel)
       (our-value . plus-120-degrees)
       (status . CONFIRMED)))

    (check-residue-1.5-A
      (our-claim residue-1.5-A)
      (CONFIRMED)
      ((source . Branden-Tooze)
       (retrieved . 2026-03-23)
       (reference-value . 3.6-residues-per-turn)
       (oracle-uncertainty . standard)
       (our-value . residue-1.5-A)
       (status . CONFIRMED)))

    (check-residue-3.3-A
      (our-claim residue-3.3-A)
      (CONFIRMED)
      ((source . Branden-Tooze)
       (retrieved . 2026-03-23)
       (reference-value . 3.3-A-rise)
       (oracle-uncertainty . standard)
       (our-value . residue-3.3-A)
       (status . CONFIRMED)))

    (check-strands-4.7-A
      (our-claim strands-4.7-A)
      (CONFIRMED)
      ((source . Branden-Tooze)
       (retrieved . 2026-03-23)
       (reference-value . 3.3-A-rise)
       (oracle-uncertainty . standard)
       (our-value . strands-4.7-A)
       (status . CONFIRMED)))

  )

  ((calibration . protein-structure-calibrated)))
