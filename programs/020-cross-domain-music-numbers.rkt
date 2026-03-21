#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN: MUSIC MEETS NUMBERS MEETS GEOMETRY
;;;
;;; The overtone series IS a number sequence: 1, 2, 3, 4, 5, 6...
;;; The intervals between overtones ARE ratios: 2:1, 3:2, 4:3...
;;; These ratios determine consonance vs dissonance.
;;;
;;; Pythagoras discovered this: simple ratios = consonance.
;;; The simpler the ratio (lower numbers), the more consonant.
;;; Unison 1:1 > Octave 2:1 > Fifth 3:2 > Fourth 4:3 > ...
;;;
;;; The geometry connection: vibrating strings form standing
;;; waves. The number of nodes = the harmonic number.
;;; A string vibrating at the 3rd harmonic has 3 segments.
;;; The geometry of the standing wave IS the number IS the pitch.
;;;
;;; Three domains. One structure. One strike.
;;;
;;; LEARNED: The cross-domain interface here is the natural
;;; numbers themselves. Numbers are the UNIVERSAL interface
;;; between domains. Every domain that has quantity connects
;;; through the number domain. Numbers are not a domain —
;;; they are the MEDIUM of cross-domain composition.
;;; ═══════════════════════════════════════════════════════════════

(cross-domain-music-numbers-geometry

  ;;; Source: a vibrating string
  (vibrating-string)

  ;;; Target: the unity of music, number, and space
  (pythagoras-was-right)

  ;;; Vacuum tube: the chain across three domains
  ((vibrating-string . has-length-L)
   ;;; --- numbers domain ---
   (has-length-L . fundamental-frequency-f)
   (fundamental-frequency-f . overtone-2f)
   (overtone-2f . overtone-3f)
   (overtone-3f . overtone-4f)
   (overtone-4f . ratio-sequence-1-2-3-4)
   ;;; --- geometry domain ---
   (ratio-sequence-1-2-3-4 . standing-wave-nodes)
   (standing-wave-nodes . 1-node-fundamental)
   (1-node-fundamental . 2-nodes-octave)
   (2-nodes-octave . 3-nodes-fifth)
   (3-nodes-fifth . spatial-pattern-IS-number)
   ;;; --- music domain ---
   (spatial-pattern-IS-number . interval-ratios)
   (interval-ratios . simple-ratio-consonant)
   (simple-ratio-consonant . complex-ratio-dissonant)
   (complex-ratio-dissonant . harmony-IS-number-IS-geometry)
   (harmony-IS-number-IS-geometry . pythagoras-was-right)))
