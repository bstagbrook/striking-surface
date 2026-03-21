#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ELECTROMAGNETISM — MAXWELL + CONSTANTS + WAVE STRUCTURE
;;;
;;; Maxwell unified electricity, magnetism, and light.
;;; Four equations. One structural chain. The unification
;;; IS the chain connecting the four.
;;;
;;; c = 1/sqrt(mu0 * epsilon0) — the speed of light falls
;;; out of the relationship between electric and magnetic
;;; constants. Not measured. DERIVED from structure.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-electromagnetism

  ;;; Source: Tesla (Nikola would approve)
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: electromagnetism register
  (
    ;;; Gauss law for E: div(E) = rho/epsilon0
    (gauss-E (charge-distribution-rho) (electric-field-diverges) ((charge-distribution-rho . produces-E-field) (produces-E-field . flux-proportional-to-charge) (flux-proportional-to-charge . electric-field-diverges)))

    ;;; Gauss law for B: div(B) = 0 (no magnetic monopoles)
    (gauss-B (magnetic-field-B) (no-monopoles) ((magnetic-field-B . field-lines-are-loops) (field-lines-are-loops . no-sources-or-sinks) (no-sources-or-sinks . no-monopoles)))

    ;;; Faraday law: curl(E) = -dB/dt
    (faraday (changing-B-field) (induced-E-field) ((changing-B-field . dB/dt-nonzero) (dB/dt-nonzero . curl-E-appears) (curl-E-appears . induced-E-field)))

    ;;; Ampere-Maxwell: curl(B) = mu0*J + mu0*epsilon0*dE/dt
    (ampere-maxwell (current-or-changing-E) (magnetic-field) ((current-or-changing-E . current-density-J) (current-density-J . displacement-current) (displacement-current . curl-B-appears) (curl-B-appears . magnetic-field)))

    ;;; Maxwell unification: E and B are one thing
    (maxwell-unification
      (electricity-and-magnetism)
      (electromagnetic-wave)
      ((electricity-and-magnetism . Faraday-changing-B-makes-E)
       (Faraday-changing-B-makes-E . Ampere-changing-E-makes-B)
       (Ampere-changing-E-makes-B . self-sustaining-oscillation)
       (self-sustaining-oscillation . propagates-at-c)
       (propagates-at-c . electromagnetic-wave)))

    ;;; Fundamental EM constants
    (speed-of-light (c) (299792458-m/s) ((c . 299792458-m/s)))
    (mu0 (vacuum-permeability) (1.25663706e-6-H/m) ((vacuum-permeability . 1.25663706e-6-H/m)))
    (epsilon0 (vacuum-permittivity) (8.85418782e-12-F/m) ((vacuum-permittivity . 8.85418782e-12-F/m)))
    (elementary-charge (e) (1.602176634e-19-C) ((e . 1.602176634e-19-C)))

    ;;; Speed of light from EM constants
    (c-derived
      (mu0-and-epsilon0)
      (c-equals-299792458)
      ((mu0-and-epsilon0 . product-mu0-epsilon0)
       (product-mu0-epsilon0 . inverse-square-root)
       (inverse-square-root . c-equals-299792458)))

    ;;; EM spectrum frequencies (Hz)
    (em-radio (radio) (freq-3e3-to-3e9-Hz) ((radio . freq-3e3-to-3e9-Hz)))
    (em-microwave (microwave) (freq-3e9-to-3e11-Hz) ((microwave . freq-3e9-to-3e11-Hz)))
    (em-infrared (infrared) (freq-3e11-to-4.3e14-Hz) ((infrared . freq-3e11-to-4.3e14-Hz)))
    (em-visible (visible) (freq-4.3e14-to-7.5e14-Hz) ((visible . freq-4.3e14-to-7.5e14-Hz)))
    (em-ultraviolet (ultraviolet) (freq-7.5e14-to-3e16-Hz) ((ultraviolet . freq-7.5e14-to-3e16-Hz)))
    (em-xray (xray) (freq-3e16-to-3e19-Hz) ((xray . freq-3e16-to-3e19-Hz)))
    (em-gamma (gamma) (freq-above-3e19-Hz) ((gamma . freq-above-3e19-Hz)))

    ;;; Visible light wavelengths (nm)
    (visible-red (red-light) (700nm) ((red-light . 700nm)))
    (visible-orange (orange-light) (620nm) ((orange-light . 620nm)))
    (visible-yellow (yellow-light) (580nm) ((yellow-light . 580nm)))
    (visible-green (green-light) (530nm) ((green-light . 530nm)))
    (visible-blue (blue-light) (470nm) ((blue-light . 470nm)))
    (visible-violet (violet-light) (400nm) ((violet-light . 400nm)))

    ;;; Coulomb constant
    (coulomb-constant (k-coulomb) (8.988e9-N-m2/C2) ((k-coulomb . 8.988e9-N-m2/C2)))

  )

  ;;; Vacuum tube
  ((tesla . electromagnetism-registered)))
