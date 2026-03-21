#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; EPISTEME-ROLLED AFFORDANCES
;;;
;;; Each surface (formalism) affords different circuits.
;;; The tool and the understanding it enables are ONE object.
;;;
;;; Dirac equation doesn't PREDICT antimatter —
;;;   its structure IS antimatter.
;;; Skyrmion model doesn't DESCRIBE spin —
;;;   the winding IS spin.
;;; Striking surface doesn't MODEL computation —
;;;   the shape IS computation.
;;;
;;; specification = implementation = the thing itself.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-episteme-model

  ;;; Source: Tesla
  ((tesla
    (spark)
    (power)
    ((spark . power))))

  ;;; Target: four surfaces compared
  (

    ;;; Schrödinger surface
    (schrodinger-surface
      (non-relativistic)
      (sees-energy-misses-spin)
      ((non-relativistic . sees-energy-levels)
       (sees-energy-levels . misses-fine-structure)
       (misses-fine-structure . misses-antimatter)
       (misses-antimatter . sees-energy-misses-spin)))

    ;;; Dirac surface
    (dirac-surface
      (relativistic-4-spinor)
      (sees-spin-and-antimatter)
      ((relativistic-4-spinor . sees-spin)
       (sees-spin . sees-fine-structure)
       (sees-fine-structure . sees-antimatter)
       (sees-antimatter . misses-topology)
       (misses-topology . sees-spin-and-antimatter)))

    ;;; Skyrme surface
    (skyrme-surface
      (topological-field-theory)
      (sees-particles-as-shapes)
      ((topological-field-theory . sees-spin-from-winding)
       (sees-spin-from-winding . sees-baryon-number)
       (sees-baryon-number . misses-perturbative-QCD)
       (misses-perturbative-QCD . sees-particles-as-shapes)))

    ;;; The Striking Surface
    (striking-surface
      (dyck-word-no-clock)
      (shape-IS-computation)
      ((dyck-word-no-clock . no-keywords)
       (no-keywords . shape-IS-program)
       (shape-IS-program . constitutional-protection)
       (constitutional-protection . shape-IS-computation)))

  )

  ;;; Vacuum tube
  ((tesla . episteme-model-powered)))
