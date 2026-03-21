#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ALPHABET — PHONEMES, LETTERS, WORDS
;;;
;;; A letter is a presence with a label.
;;; A word is a containment of letters.
;;; A sentence is a containment of words.
;;;
;;; AUDIT FIX: letter-to-phoneme now has one transform per letter
;;; so each source matches its pair key. No empty tubes.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-alphabet

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: language primitives
  (

    ;;; Vowel phonemes (English core — chain traces all 7)
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

    ;;; Consonant classes by manner of articulation (chain traces all)
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

    ;;; Letter-to-phoneme: one transform per letter
    (l2p-a (a) (ae-or-ah) ((a . ae-or-ah)))
    (l2p-b (b) (buh) ((b . buh)))
    (l2p-c (c) (kuh-or-suh) ((c . kuh-or-suh)))
    (l2p-d (d) (duh) ((d . duh)))
    (l2p-e (e) (eh-or-ee) ((e . eh-or-ee)))
    (l2p-f (f) (fuh) ((f . fuh)))
    (l2p-g (g) (guh-or-juh) ((g . guh-or-juh)))
    (l2p-h (h) (huh) ((h . huh)))
    (l2p-i (i) (ih-or-eye) ((i . ih-or-eye)))
    (l2p-j (j) (juh) ((j . juh)))
    (l2p-k (k) (kuh) ((k . kuh)))
    (l2p-l (l) (luh) ((l . luh)))
    (l2p-m (m) (muh) ((m . muh)))
    (l2p-n (n) (nuh) ((n . nuh)))
    (l2p-o (o) (ah-or-oh) ((o . ah-or-oh)))
    (l2p-p (p) (puh) ((p . puh)))
    (l2p-q (q) (kwuh) ((q . kwuh)))
    (l2p-r (r) (ruh) ((r . ruh)))
    (l2p-s (s) (suh-or-zuh) ((s . suh-or-zuh)))
    (l2p-t (t) (tuh) ((t . tuh)))
    (l2p-u (u) (uh-or-yoo) ((u . uh-or-yoo)))
    (l2p-v (v) (vuh) ((v . vuh)))
    (l2p-w (w) (wuh) ((w . wuh)))
    (l2p-x (x) (ks) ((x . ks)))
    (l2p-y (y) (yuh-or-ee) ((y . yuh-or-ee)))
    (l2p-z (z) (zuh) ((z . zuh)))

    ;;; Morpheme composition (traces correctly — 4 steps)
    (morpheme-composition
      (morphemes)
      (composed-word)
      ((morphemes . prefix-un)
       (prefix-un . root-break)
       (root-break . suffix-able)
       (suffix-able . composed-word)))

    ;;; Language as collapse chain (traces correctly — 5 steps)
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
