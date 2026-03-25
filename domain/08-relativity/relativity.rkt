#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Relativity — special and general
;;; LAYER: 08-relativity
;;; DEPENDS ON: 01-particles, 07-waves (speed of light)
;;; DEPENDED ON BY: cosmology, GPS, particle accelerators,
;;;   gravitational wave detection, black hole physics
;;;
;;; SOURCES:
;;; [Einstein-1905] On the Electrodynamics of Moving Bodies
;;; [Einstein-1915] General Theory of Relativity
;;; [NIST-2022] CODATA 2022 (c exact)
;;; [MTW-1973] Misner, Thorne, Wheeler — Gravitation
;;; [LIGO-2016] Abbott et al., PRL 116, 061102
;;; ═══════════════════════════════════════════════════════════════

(domain-relativity

  ((Einstein (special-and-general) (authoritative) ((special-and-general . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPECIAL RELATIVITY — Einstein 1905
    ;;; Two postulates. Everything follows.
    ;;; ═══════════════════════════════════════════════════════════

    (postulate-1
      (laws-of-physics)
      (same-in-all-inertial-frames)
      ((laws-of-physics . no-preferred-frame)
       (no-preferred-frame . all-inertial-observers-equivalent)
       (all-inertial-observers-equivalent . same-in-all-inertial-frames)))

    (postulate-2
      (speed-of-light-in-vacuum)
      (same-for-all-observers)
      ((speed-of-light-in-vacuum . c-equals-299792458-m/s)
       (c-equals-299792458-m/s . independent-of-source-motion)
       (independent-of-source-motion . independent-of-observer-motion)
       (independent-of-observer-motion . same-for-all-observers)))

    ;;; Lorentz factor
    (Lorentz-factor
      (relative-velocity-v)
      (gamma-equals-1-over-sqrt-1-minus-v2-over-c2)
      ((relative-velocity-v . v-less-than-c-for-massive-particles)
       (v-less-than-c-for-massive-particles . gamma-ge-1)
       (gamma-ge-1 . gamma-equals-1-at-rest)
       (gamma-equals-1-at-rest . gamma-approaches-infinity-as-v-approaches-c)
       (gamma-approaches-infinity-as-v-approaches-c . gamma-equals-1-over-sqrt-1-minus-v2-over-c2)))

    ;;; Time dilation
    (time-dilation
      (moving-clock-observed-from-rest-frame)
      (ticks-slower-by-factor-gamma)
      ((moving-clock-observed-from-rest-frame . proper-time-tau-in-rest-frame)
       (proper-time-tau-in-rest-frame . observed-time-t-equals-gamma-tau)
       (observed-time-t-equals-gamma-tau . ticks-slower-by-factor-gamma)))

    ;;; Length contraction
    (length-contraction
      (moving-object-observed-from-rest-frame)
      (shortened-by-factor-gamma)
      ((moving-object-observed-from-rest-frame . proper-length-L0-in-rest-frame)
       (proper-length-L0-in-rest-frame . observed-length-L-equals-L0-over-gamma)
       (observed-length-L-equals-L0-over-gamma . shortened-by-factor-gamma)))

    ;;; Relativity of simultaneity
    (simultaneity
      (events-simultaneous-in-one-frame)
      (not-simultaneous-in-another)
      ((events-simultaneous-in-one-frame . separated-in-space)
       (separated-in-space . different-frames-disagree-on-timing)
       (different-frames-disagree-on-timing . not-simultaneous-in-another)))

    ;;; Mass-energy equivalence
    ;;; SOURCE: Einstein 1905, confirmed in nuclear reactions
    (mass-energy
      (rest-mass-m)
      (E-equals-mc2)
      ((rest-mass-m . intrinsic-property)
       (intrinsic-property . energy-content-equals-mc2)
       (energy-content-equals-mc2 . mass-IS-energy)
       (mass-IS-energy . E-equals-mc2)))

    ;;; Relativistic energy-momentum relation
    (energy-momentum
      (particle-with-mass-m-and-momentum-p)
      (E2-equals-pc2-plus-mc2-squared)
      ((particle-with-mass-m-and-momentum-p . total-energy-E)
       (total-energy-E . rest-energy-plus-kinetic)
       (rest-energy-plus-kinetic . E2-equals-pc2-plus-mc2-squared)))

    ;;; Massless particles
    (massless-energy-momentum
      (particle-with-zero-mass)
      (E-equals-pc)
      ((particle-with-zero-mass . photon-gluon)
       (photon-gluon . always-travels-at-c)
       (always-travels-at-c . E-equals-pc)))

    ;;; The speed limit
    (speed-limit
      (massive-particle)
      (cannot-reach-c)
      ((massive-particle . requires-infinite-energy-to-reach-c)
       (requires-infinite-energy-to-reach-c . gamma-diverges)
       (gamma-diverges . cannot-reach-c)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GENERAL RELATIVITY — Einstein 1915
    ;;; Gravity is geometry. Mass curves spacetime.
    ;;; ═══════════════════════════════════════════════════════════

    (equivalence-principle
      (gravitational-mass)
      (equals-inertial-mass)
      ((gravitational-mass . response-to-gravity)
       (response-to-gravity . inertial-mass-response-to-acceleration)
       (inertial-mass-response-to-acceleration . experimentally-identical)
       (experimentally-identical . equals-inertial-mass)))

    (spacetime-curvature
      (mass-energy-distribution)
      (curves-spacetime)
      ((mass-energy-distribution . stress-energy-tensor)
       (stress-energy-tensor . Einstein-field-equations)
       (Einstein-field-equations . Ricci-curvature-tensor)
       (Ricci-curvature-tensor . curves-spacetime)))

    (geodesic-motion
      (free-falling-object)
      (follows-geodesic-in-curved-spacetime)
      ((free-falling-object . no-forces-acting)
       (no-forces-acting . straightest-possible-path)
       (straightest-possible-path . geodesic-in-curved-spacetime)
       (geodesic-in-curved-spacetime . follows-geodesic-in-curved-spacetime)))

    ;;; Gravitational time dilation
    ;;; SOURCE: Pound-Rebka 1959, confirmed by GPS daily
    (gravitational-time-dilation
      (clock-in-gravitational-field)
      (ticks-slower-deeper-in-field)
      ((clock-in-gravitational-field . stronger-field-slower-time)
       (stronger-field-slower-time . confirmed-by-Pound-Rebka-1959)
       (confirmed-by-Pound-Rebka-1959 . GPS-corrects-for-this-daily)
       (GPS-corrects-for-this-daily . 45-microseconds-per-day-GPS-correction)
       (45-microseconds-per-day-GPS-correction . ticks-slower-deeper-in-field)))

    ;;; Gravitational lensing
    ;;; SOURCE: Eddington 1919 (first confirmed), Hubble observations
    (gravitational-lensing
      (light-passing-massive-object)
      (path-bends)
      ((light-passing-massive-object . spacetime-curved-by-mass)
       (spacetime-curved-by-mass . light-follows-geodesic)
       (light-follows-geodesic . path-bends)
       (path-bends . confirmed-Eddington-1919-solar-eclipse)))

    ;;; Gravitational waves
    ;;; SOURCE: LIGO 2015, Abbott et al. PRL 116, 061102 (Nobel 2017)
    (gravitational-waves
      (accelerating-mass)
      (ripples-in-spacetime)
      ((accelerating-mass . quadrupole-moment-change)
       (quadrupole-moment-change . emits-gravitational-radiation)
       (emits-gravitational-radiation . strain-h-equals-delta-L-over-L)
       (strain-h-equals-delta-L-over-L . detected-LIGO-2015)
       (detected-LIGO-2015 . binary-black-hole-merger-GW150914)
       (binary-black-hole-merger-GW150914 . ripples-in-spacetime)))

    ;;; Black holes
    (black-hole
      (mass-collapsed-within-Schwarzschild-radius)
      (event-horizon-nothing-escapes)
      ((mass-collapsed-within-Schwarzschild-radius . Rs-equals-2GM-over-c2)
       (Rs-equals-2GM-over-c2 . escape-velocity-equals-c-at-Rs)
       (escape-velocity-equals-c-at-Rs . nothing-escapes-from-within)
       (nothing-escapes-from-within . event-horizon-nothing-escapes)))

    (Schwarzschild-radius
      (mass-M)
      (Rs-equals-2GM-over-c2)
      ((mass-M . gravitational-constant-G)
       (gravitational-constant-G . G-equals-6.67430e-11-N-m2-kg-2)
       (G-equals-6.67430e-11-N-m2-kg-2 . Rs-equals-2GM-over-c2)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CONFIRMED PREDICTIONS
    ;;; ═══════════════════════════════════════════════════════════

    (Mercury-perihelion
      (Mercury-orbit-precession)
      (43-arcsec-per-century-explained)
      ((Mercury-orbit-precession . Newtonian-prediction-off-by-43-arcsec)
       (Newtonian-prediction-off-by-43-arcsec . GR-predicts-exactly-43-arcsec)
       (GR-predicts-exactly-43-arcsec . 43-arcsec-per-century-explained)))

    (gravitational-redshift
      (photon-climbing-out-of-gravitational-well)
      (frequency-decreases)
      ((photon-climbing-out-of-gravitational-well . loses-energy)
       (loses-energy . E-equals-hf-means-lower-f)
       (E-equals-hf-means-lower-f . frequency-decreases)))

    (frame-dragging
      (rotating-mass)
      (drags-spacetime-around-it)
      ((rotating-mass . Kerr-metric)
       (Kerr-metric . spacetime-rotates-with-mass)
       (spacetime-rotates-with-mass . confirmed-Gravity-Probe-B-2011)
       (confirmed-Gravity-Probe-B-2011 . drags-spacetime-around-it)))

    (Hawking-radiation
      (black-hole-near-event-horizon)
      (emits-thermal-radiation)
      ((black-hole-near-event-horizon . virtual-particle-pairs)
       (virtual-particle-pairs . one-falls-in-one-escapes)
       (one-falls-in-one-escapes . black-hole-slowly-evaporates)
       (black-hole-slowly-evaporates . emits-thermal-radiation)
       (emits-thermal-radiation . predicted-not-yet-observed)))

  )

  ((Einstein . relativity-registered)))
