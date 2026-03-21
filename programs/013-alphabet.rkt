#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ALPHABET — PHONEMES, LETTERS, WORDS
;;;
;;; A letter is a presence with a label.
;;; A word is a containment of letters.
;;; A sentence is a containment of words.
;;; A language is a containment of transforms on those shapes.
;;;
;;; The phoneme inventory of English: ~44 phonemes.
;;; The alphabet: 26 letters.
;;; The structural relationships between them: transforms.
;;;
;;; Letters → phonemes is a transform (spelling to sound).
;;; Phonemes → meaning is a transform (sound to concept).
;;; The chain: letters → phonemes → morphemes → words → meaning.
;;; One collapse chain. One strike.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-alphabet

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: language primitives
  (

    ;;; Vowel phonemes (English core)
    (vowel-phonemes
      (english-vowels)
      (five-cardinal-plus-schwa)
      ((english-vowels . ah)
       (ah . eh)
       (eh . ee)
       (ee . oh)
       (oh . oo)
       (oo . uh-schwa)
       (uh-schwa . five-cardinal-plus-schwa)))

    ;;; Consonant classes (by manner of articulation)
    (consonant-structure
      (english-consonants)
      (structured-by-articulation)
      ((english-consonants . stops)
       (stops . p-b-t-d-k-g)
       (p-b-t-d-k-g . fricatives)
       (fricatives . f-v-th-s-z-sh-zh-h)
       (f-v-th-s-z-sh-zh-h . nasals)
       (nasals . m-n-ng)
       (m-n-ng . liquids)
       (liquids . l-r)
       (l-r . glides)
       (glides . w-y)
       (w-y . structured-by-articulation)))

    ;;; Letter-to-phoneme transform
    ;;; (not complete — structural demonstration)
    (letter-to-phoneme
      (written-letter)
      (spoken-sound)
      ((a . ae-or-ah)
       (b . buh)
       (c . kuh-or-suh)
       (d . duh)
       (e . eh-or-ee)
       (s . suh-or-zuh)
       (t . tuh)
       (h . huh)))

    ;;; Word formation: morpheme composition
    ;;; un- + break + -able = unbreakable
    (morpheme-composition
      (morphemes)
      (composed-word)
      ((morphemes . prefix-un)
       (prefix-un . root-break)
       (root-break . suffix-able)
       (suffix-able . composed-word)))

    ;;; The structural insight:
    ;;; Spoken language IS a collapse chain.
    ;;; Phonemes compose into morphemes.
    ;;; Morphemes compose into words.
    ;;; Words compose into sentences.
    ;;; Each level is a containment of the level below.
    ;;; Each transition is a transform.
    ;;; The meaning IS the residue of the full collapse.
    (language-is-collapse
      (phonemes)
      (meaning)
      ((phonemes . morphemes)
       (morphemes . words)
       (words . phrases)
       (phrases . sentences)
       (sentences . meaning)))

  )

  ;;; Vacuum tube
  ((tesla . alphabet-registered)))
