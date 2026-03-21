#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COLLISION: MUSIC × LANGUAGE at "frequency"
;;;
;;; Music: frequency = pitch. Ratios = harmony.
;;; Language: frequency of phonemes = statistical structure.
;;; Vocal fundamental frequency = prosody/emotion.
;;;
;;; Both domains use frequency but mean different things.
;;; What structural isomorphism exists?
;;; ═══════════════════════════════════════════════════════════════

(q:collide-music-language
  (frequency)
  (what-connects)
  (;;; Music wires
   (frequency . pitch)
   (pitch . melody)
   (frequency . ratio-between-pitches)
   (ratio-between-pitches . interval)
   (interval . consonance-or-dissonance)
   (frequency . fundamental-plus-overtones)
   (fundamental-plus-overtones . timbre)

   ;;; Language wires
   (frequency . vocal-cord-vibration-rate)
   (vocal-cord-vibration-rate . fundamental-F0)
   (fundamental-F0 . prosody)
   (prosody . emotional-content)
   (frequency . letter-frequency-in-text)
   (letter-frequency-in-text . entropy-4.18-bits)
   (entropy-4.18-bits . redundancy-11-pct)
   (frequency . formant-frequencies-F1-F2)
   (formant-frequencies-F1-F2 . vowel-identity)

   ;;; Convergence: both use frequency ratios for structure
   (timbre . spectral-shape)
   (vowel-identity . spectral-shape)
   ))
