#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN: SPEECH — THE FULL CHAIN
;;; numbers × geometry × music × alphabet × meaning
;;;
;;; Speech is: vocal cords vibrate (music/physics) producing
;;; a fundamental + overtones. The vocal tract shapes the
;;; overtone spectrum (geometry of mouth/throat = filter).
;;; The shaped spectrum = a phoneme (alphabet).
;;; Phonemes compose into morphemes, words, sentences (alphabet).
;;; Sentences carry meaning.
;;;
;;; This is FIVE domains in one collapse chain:
;;; physics → geometry → music → alphabet → meaning
;;;
;;; The human voice IS a Tesla circuit: vocal cords are the
;;; primary oscillator, the vocal tract is the secondary
;;; resonator, and the coupling between them produces speech.
;;;
;;; LEARNED: Speech is the deepest cross-domain composition
;;; yet. Five domains. One strike. The Tesla circuit analogy
;;; is not metaphorical — vocal cords + vocal tract literally
;;; ARE two coupled resonant circuits. The shape of the throat
;;; determines the resonant frequencies (formants). The formants
;;; determine the phoneme. The phoneme determines the meaning.
;;; Shape → frequency → sound → language → thought. One chain.
;;; ═══════════════════════════════════════════════════════════════

(cross-domain-speech

  ;;; Source: breath
  (air-from-lungs)

  ;;; Target: meaning
  (listener-understands)

  ;;; Vacuum tube: five domains in one chain
  ((air-from-lungs . passes-through-vocal-cords)
   ;;; --- music/physics domain ---
   (passes-through-vocal-cords . cords-vibrate-at-fundamental)
   (cords-vibrate-at-fundamental . produces-overtone-series)
   (produces-overtone-series . raw-voice-spectrum)
   ;;; --- geometry domain (vocal tract shape) ---
   (raw-voice-spectrum . enters-vocal-tract)
   (enters-vocal-tract . tract-shape-filters-spectrum)
   (tract-shape-filters-spectrum . resonant-peaks-formants)
   (resonant-peaks-formants . F1-F2-determine-vowel)
   ;;; --- alphabet domain ---
   (F1-F2-determine-vowel . phoneme-produced)
   (phoneme-produced . combines-with-consonants)
   (combines-with-consonants . syllable-formed)
   (syllable-formed . morphemes-compose)
   (morphemes-compose . word-formed)
   ;;; --- meaning domain ---
   (word-formed . syntactic-structure)
   (syntactic-structure . semantic-content)
   (semantic-content . listener-understands)))
