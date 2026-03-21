#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; LEARNINGS — WHAT CROSS-DOMAIN COMPOSITION TAUGHT US
;;;
;;; After building 019-022, these structural facts emerged:
;;;
;;; 1. INTERFACES ARE EVERYTHING
;;;    The shared label between domains IS the interface.
;;;    "absorbs-blue-photons" bridges relativity and vision.
;;;    "sp3-hybridization" bridges periodic table and geometry.
;;;    "phoneme-produced" bridges physics/geometry and alphabet.
;;;    The interfaces are where novelty lives. A domain alone
;;;    is a dictionary. The interface is where generation happens.
;;;
;;; 2. NUMBERS ARE THE UNIVERSAL MEDIUM
;;;    Every domain that has quantity connects through numbers.
;;;    Frequency (music), wavelength (color), atomic number
;;;    (chemistry), coordination number (crystals), harmonic
;;;    number (overtones), nesting depth (containment).
;;;    Numbers are not a domain. They are the substrate of
;;;    cross-domain composition.
;;;
;;; 3. CHAIN LENGTH = DOMAIN BOUNDARIES CROSSED
;;;    019 (gold): 15 steps, 1 boundary (relativity→vision)
;;;    020 (music): 16 steps, 2 boundaries (numbers→geometry→music)
;;;    021 (crystal): 12 steps, 3 boundaries (periodic→geometry→numbers→geometry)
;;;    022 (speech): 16 steps, 4 boundaries (physics→geometry→alphabet→meaning)
;;;    More boundaries = richer composition = more emergent structure.
;;;
;;; 4. TESLA ANALOGY IS LITERAL FOR SPEECH
;;;    Vocal cords = primary oscillator.
;;;    Vocal tract = secondary resonator.
;;;    Coupling = mutual inductance.
;;;    Formants = resonant frequencies.
;;;    This is not metaphor. It is structural identity.
;;;
;;; 5. THE LANGUAGE CONTINUUM IS CROSS-DOMAIN COMPOSITION
;;;    Single domains = vocabulary.
;;;    Cross-domain = generation.
;;;    The continuum is not bigger domains. It is MORE INTERFACES.
;;;    Adding a domain adds N new interfaces (one per existing
;;;    domain it can connect to). The power grows combinatorially.
;;;
;;; This file IS these learnings, registered as structure.
;;; ═══════════════════════════════════════════════════════════════

(learnings-from-cross-domain

  ;;; Source: what we built
  (nineteen-through-twenty-two)

  ;;; Target: what we learned
  (five-structural-discoveries)

  ;;; Vacuum tube: the learning chain
  ((nineteen-through-twenty-two . built-four-cross-domain-tables)
   (built-four-cross-domain-tables . discovery-1-interfaces-are-everything)
   (discovery-1-interfaces-are-everything . discovery-2-numbers-are-universal-medium)
   (discovery-2-numbers-are-universal-medium . discovery-3-chain-length-equals-boundaries)
   (discovery-3-chain-length-equals-boundaries . discovery-4-tesla-literal-for-speech)
   (discovery-4-tesla-literal-for-speech . discovery-5-continuum-is-more-interfaces)
   (discovery-5-continuum-is-more-interfaces . five-structural-discoveries)))
