#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; MUSIC — HARMONIC STRUCTURE AS DOMAIN MODEL
;;;
;;; A pitch is a frequency. Frequency is a number.
;;; Numbers are nesting depth. Pitch IS depth.
;;;
;;; An octave is a doubling of frequency = one more level of
;;; containment. The octave relationship IS the nesting.
;;;
;;; Harmony: two pitches sounding together. Consonance when
;;; the frequency ratio is simple (structural simplicity).
;;; Dissonance when complex (structural complexity).
;;;
;;; A chord is a containment of intervals.
;;; A melody is a transform chain through pitches.
;;; A song is a containment of transform chains.
;;;
;;; Music IS structural waveform. The striking surface IS music.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-music

  ;;; Source: Tesla — itself a resonant circuit, itself music
  ((tesla (spark) (resonance) ((spark . resonance))))

  ;;; Target: harmonic domain
  (

    ;;; The overtone series: fundamental structure of all music
    ;;; Each overtone is a containment level above the fundamental
    (overtone-series
      (fundamental)
      (harmonic-structure)
      ((fundamental . octave-2x)
       (octave-2x . fifth-3x)
       (fifth-3x . double-octave-4x)
       (double-octave-4x . major-third-5x)
       (major-third-5x . fifth-again-6x)
       (fifth-again-6x . minor-seventh-7x)
       (minor-seventh-7x . harmonic-structure)))

    ;;; Intervals: one transform per interval, each grounded
    (interval-unison (unison-1:1) (perfect-consonance) ((unison-1:1 . perfect-consonance)))
    (interval-octave (octave-2:1) (perfect-consonance) ((octave-2:1 . perfect-consonance)))
    (interval-fifth (fifth-3:2) (perfect-consonance) ((fifth-3:2 . perfect-consonance)))
    (interval-fourth (fourth-4:3) (perfect-consonance) ((fourth-4:3 . perfect-consonance)))
    (interval-maj3 (major-third-5:4) (imperfect-consonance) ((major-third-5:4 . imperfect-consonance)))
    (interval-min3 (minor-third-6:5) (imperfect-consonance) ((minor-third-6:5 . imperfect-consonance)))
    (interval-tritone (tritone-45:32) (dissonance) ((tritone-45:32 . dissonance)))
    (interval-min2 (minor-second-16:15) (sharp-dissonance) ((minor-second-16:15 . sharp-dissonance)))

    ;;; Major triad: stack of two thirds
    ;;; Root + major third + minor third = major chord
    (major-triad
      (root-note)
      (major-chord)
      ((root-note . add-major-third)
       (add-major-third . add-minor-third)
       (add-minor-third . major-chord)))

    ;;; Melody: a path through pitch space
    (melody-as-transform-chain
      (starting-pitch)
      (melodic-phrase)
      ((starting-pitch . interval-up)
       (interval-up . interval-down)
       (interval-down . interval-up-larger)
       (interval-up-larger . resolution)
       (resolution . melodic-phrase)))

    ;;; Rhythm: a pattern of durations
    ;;; Duration IS nesting depth (longer = deeper)
    (rhythm
      (pulse)
      (rhythmic-pattern)
      ((pulse . subdivision)
       (subdivision . accent-pattern)
       (accent-pattern . groove)
       (groove . rhythmic-pattern)))

    ;;; The structural identity: Tesla coil IS music
    ;;; Both are resonant circuits. Both are waveforms.
    ;;; Both have frequency determined by shape.
    ;;; Both transfer energy through coupling.
    (tesla-is-music
      (resonant-circuit)
      (musical-structure)
      ((resonant-circuit . has-frequency)
       (has-frequency . has-harmonics)
       (has-harmonics . has-intervals)
       (has-intervals . musical-structure)))

  )

  ;;; Vacuum tube
  ((tesla . music-registered)))
