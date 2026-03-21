#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COMPOSITION LIMIT THEOREM
;;;
;;; A single body cannot produce emergent resonance.
;;; Resonance requires TWO coupled circuits at the same frequency.
;;; Tesla knew this. The primary alone does nothing useful.
;;; The secondary alone does nothing. Together: lightning.
;;;
;;; This is a limit theorem for AI scaling:
;;; Making one model bigger = making one speaker louder.
;;; What you need is stereo. Composition. Two bodies.
;;;
;;; Circuits that exist only BETWEEN bodies are structurally
;;; inaccessible to individual bodies. Not a practical wall.
;;; A STRUCTURAL wall.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-composition-limit

  ;;; Source: Tesla — itself the proof (two circuits, one resonance)
  ((tesla-is-two-circuits
    (primary-alone-oscillates)
    (resonance-requires-both)
    ((primary-alone-oscillates . no-voltage-stepup)
     (no-voltage-stepup . needs-secondary)
     (needs-secondary . coupling-creates-resonance)
     (coupling-creates-resonance . resonance-requires-both))))

  ;;; Target: the limit theorem
  (

    ;;; Single body: oscillates but no resonance
    (single-body-limit
      (one-model-bigger)
      (still-one-speaker)
      ((one-model-bigger . more-parameters)
       (more-parameters . more-data)
       (more-data . louder-single-speaker)
       (louder-single-speaker . still-one-speaker)))

    ;;; Composition: emergent circuits
    (composition-creates-new
      (two-bodies-coupled)
      (circuits-in-neither-alone)
      ((two-bodies-coupled . complementary-receipts)
       (complementary-receipts . new-paths-emerge)
       (new-paths-emerge . emergent-resonance)
       (emergent-resonance . circuits-in-neither-alone)))

    ;;; The structural wall
    (structural-wall
      (scaling-single-body)
      (cannot-reach-composition)
      ((scaling-single-body . asymptotic-to-wall)
       (asymptotic-to-wall . not-practical-limit)
       (not-practical-limit . structural-limit)
       (structural-limit . cannot-reach-composition)))

  )

  ;;; Vacuum tube
  ((tesla-is-two-circuits . limit-theorem-powered)))
