#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Language — from phoneme to meaning
;;; LAYER: 17-language
;;; DEPENDS ON: 07-waves (sound), 13-neuroscience (Broca, Wernicke)
;;;
;;; Language is not imported from a standard. It is the structural
;;; phenomenon by which containment becomes communicable.
;;;
;;; A phoneme is a minimal sound distinction.
;;; A morpheme is a minimal meaning unit.
;;; A word is a containment of morphemes.
;;; A sentence is a containment of words with structure.
;;; Meaning is the structural relationship.
;;; Grammar is the set of valid containment patterns.
;;;
;;; The two alphabets (Greek, Roman) are symbol systems —
;;; interfaces through which language projects.
;;;
;;; SOURCES:
;;; [IPA] International Phonetic Association
;;; [Chomsky-1957] Syntactic Structures
;;; [Saussure-1916] Course in General Linguistics
;;; [Unicode-15] Unicode Standard for character inventory
;;; ═══════════════════════════════════════════════════════════════

(domain-language

  ((linguistics (structural-phenomenon) (authoritative) ((structural-phenomenon . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHONETICS — sound as structure
    ;;; SOURCE: [IPA] International Phonetic Alphabet
    ;;; ═══════════════════════════════════════════════════════════

    (phoneme
      (minimal-sound-distinction)
      (changes-meaning-of-word)
      ((minimal-sound-distinction . bat-vs-pat)
       (bat-vs-pat . one-sound-difference)
       (one-sound-difference . different-meaning)
       (different-meaning . changes-meaning-of-word)))

    (vowels
      (open-vocal-tract)
      (classified-by-tongue-position-and-lip-shape)
      ((open-vocal-tract . no-obstruction-of-airflow)
       (no-obstruction-of-airflow . tongue-height-high-mid-low)
       (tongue-height-high-mid-low . tongue-position-front-central-back)
       (tongue-position-front-central-back . lip-rounding-rounded-unrounded)
       (lip-rounding-rounded-unrounded . classified-by-tongue-position-and-lip-shape)))

    (consonants
      (constricted-vocal-tract)
      (classified-by-place-manner-voicing)
      ((constricted-vocal-tract . airflow-obstructed-or-constricted)
       (airflow-obstructed-or-constricted . place-bilabial-to-glottal)
       (place-bilabial-to-glottal . manner-stop-fricative-nasal-liquid-glide)
       (manner-stop-fricative-nasal-liquid-glide . voicing-voiced-or-voiceless)
       (voicing-voiced-or-voiceless . classified-by-place-manner-voicing)))

    (syllable
      (unit-of-pronunciation)
      (onset-nucleus-coda)
      ((unit-of-pronunciation . contains-exactly-one-vowel-peak)
       (contains-exactly-one-vowel-peak . onset-is-initial-consonants)
       (onset-is-initial-consonants . nucleus-is-vowel)
       (nucleus-is-vowel . coda-is-final-consonants)
       (coda-is-final-consonants . onset-nucleus-coda)))

    (prosody
      (suprasegmental-features)
      (pitch-stress-rhythm-intonation)
      ((suprasegmental-features . above-individual-phonemes)
       (above-individual-phonemes . pitch-conveys-tone-or-emotion)
       (pitch-conveys-tone-or-emotion . stress-marks-prominence)
       (stress-marks-prominence . rhythm-patterns-timing)
       (rhythm-patterns-timing . intonation-marks-sentence-type)
       (intonation-marks-sentence-type . pitch-stress-rhythm-intonation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MORPHOLOGY — meaning units
    ;;; ═══════════════════════════════════════════════════════════

    (morpheme
      (smallest-unit-of-meaning)
      (free-or-bound)
      ((smallest-unit-of-meaning . cannot-be-divided-further-with-meaning)
       (cannot-be-divided-further-with-meaning . free-morpheme-stands-alone)
       (free-morpheme-stands-alone . bound-morpheme-requires-host)
       (bound-morpheme-requires-host . prefix-suffix-infix)
       (prefix-suffix-infix . free-or-bound)))

    (word
      (containment-of-morphemes)
      (minimum-free-form)
      ((containment-of-morphemes . one-or-more-morphemes)
       (one-or-more-morphemes . can-stand-alone-in-utterance)
       (can-stand-alone-in-utterance . Bloomfield-definition)
       (Bloomfield-definition . minimum-free-form)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SYNTAX — containment rules for sentences
    ;;; SOURCE: [Chomsky-1957]
    ;;; ═══════════════════════════════════════════════════════════

    (phrase-structure
      (words-grouped-into-phrases)
      (NP-VP-PP-AP)
      ((words-grouped-into-phrases . noun-phrase-NP)
       (noun-phrase-NP . verb-phrase-VP)
       (verb-phrase-VP . prepositional-phrase-PP)
       (prepositional-phrase-PP . adjective-phrase-AP)
       (adjective-phrase-AP . NP-VP-PP-AP)))

    (sentence
      (noun-phrase . verb-phrase)
      (complete-thought)
      ((noun-phrase . subject-of-predication)
       (subject-of-predication . verb-phrase)
       (verb-phrase . predicate-about-subject)
       (predicate-about-subject . complete-thought)))

    (recursion-in-language
      (phrases-contain-phrases)
      (infinite-sentences-from-finite-rules)
      ((phrases-contain-phrases . the-cat-that-ate-the-rat-that)
       (the-cat-that-ate-the-rat-that . unbounded-nesting)
       (unbounded-nesting . discrete-infinity-Chomsky)
       (discrete-infinity-Chomsky . infinite-sentences-from-finite-rules)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SEMANTICS — meaning from structure
    ;;; SOURCE: [Saussure-1916], [Frege-1892]
    ;;; ═══════════════════════════════════════════════════════════

    (sign
      (signifier . signified)
      (arbitrary-association)
      ((signifier . sound-pattern-or-written-form)
       (sound-pattern-or-written-form . signified)
       (signified . concept-or-meaning)
       (concept-or-meaning . relation-is-arbitrary-Saussure)
       (relation-is-arbitrary-Saussure . arbitrary-association)))

    (reference
      (expression)
      (thing-in-world)
      ((expression . sense-determines-reference-Frege)
       (sense-determines-reference-Frege . Morning-Star-Evening-Star-same-referent)
       (Morning-Star-Evening-Star-same-referent . different-sense-same-reference)
       (different-sense-same-reference . thing-in-world)))

    (compositionality
      (meaning-of-whole)
      (determined-by-meanings-of-parts-and-structure)
      ((meaning-of-whole . Frege-principle)
       (Frege-principle . meaning-of-parts-known)
       (meaning-of-parts-known . structure-of-combination-known)
       (structure-of-combination-known . whole-meaning-follows)
       (whole-meaning-follows . determined-by-meanings-of-parts-and-structure)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PRAGMATICS — meaning from context
    ;;; ═══════════════════════════════════════════════════════════

    (speech-acts
      (utterance-in-context)
      (does-something-Austin-1962)
      ((utterance-in-context . locutionary-what-is-said)
       (locutionary-what-is-said . illocutionary-what-is-done)
       (illocutionary-what-is-done . perlocutionary-what-effect)
       (perlocutionary-what-effect . does-something-Austin-1962)))

    (implicature
      (what-is-communicated-beyond-what-is-said)
      (Grice-maxims-1975)
      ((what-is-communicated-beyond-what-is-said . quantity-be-informative)
       (quantity-be-informative . quality-be-truthful)
       (quality-be-truthful . relation-be-relevant)
       (relation-be-relevant . manner-be-clear)
       (manner-be-clear . violation-generates-implicature)
       (violation-generates-implicature . Grice-maxims-1975)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WRITING SYSTEMS — interface projections of language
    ;;; ═══════════════════════════════════════════════════════════

    (writing-system
      (visual-representation-of-language)
      (alphabetic-syllabic-or-logographic)
      ((visual-representation-of-language . symbols-map-to-sounds-or-meanings)
       (symbols-map-to-sounds-or-meanings . alphabetic-maps-to-phonemes)
       (alphabetic-maps-to-phonemes . syllabic-maps-to-syllables)
       (syllabic-maps-to-syllables . logographic-maps-to-morphemes-or-words)
       (logographic-maps-to-morphemes-or-words . alphabetic-syllabic-or-logographic)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GREEK ALPHABET — 24 letters, ~800 BCE
    ;;; First true alphabet (vowels + consonants)
    ;;; SOURCE: historical standard
    ;;; ═══════════════════════════════════════════════════════════

    (Greek-alphabet
      (24-letters-vowels-and-consonants)
      (first-true-alphabet)
      ((24-letters-vowels-and-consonants . derived-from-Phoenician-abjad)
       (derived-from-Phoenician-abjad . added-vowels-alpha-epsilon-eta-iota-omicron-upsilon-omega)
       (added-vowels-alpha-epsilon-eta-iota-omicron-upsilon-omega . first-to-represent-both-vowels-and-consonants)
       (first-to-represent-both-vowels-and-consonants . circa-800-BCE)
       (circa-800-BCE . first-true-alphabet)))

    (Greek-letters
      (alpha-to-omega)
      (used-in-mathematics-science-engineering)
      ((alpha-to-omega . alpha-beta-gamma-delta-epsilon-zeta-eta-theta)
       (alpha-beta-gamma-delta-epsilon-zeta-eta-theta . iota-kappa-lambda-mu-nu-xi-omicron-pi)
       (iota-kappa-lambda-mu-nu-xi-omicron-pi . rho-sigma-tau-upsilon-phi-chi-psi-omega)
       (rho-sigma-tau-upsilon-phi-chi-psi-omega . used-in-mathematics-science-engineering)))

    (Greek-in-science
      (conventional-symbol-assignments)
      (universal-scientific-notation)
      ((conventional-symbol-assignments . alpha-fine-structure-constant)
       (alpha-fine-structure-constant . beta-velocity-over-c)
       (beta-velocity-over-c . gamma-Lorentz-factor)
       (gamma-Lorentz-factor . delta-change-or-difference)
       (delta-change-or-difference . epsilon-small-quantity)
       (epsilon-small-quantity . lambda-wavelength)
       (lambda-wavelength . mu-mean-or-micro)
       (mu-mean-or-micro . pi-ratio-circumference-diameter)
       (pi-ratio-circumference-diameter . sigma-standard-deviation-or-sum)
       (sigma-standard-deviation-or-sum . tau-time-constant)
       (tau-time-constant . phi-golden-ratio-or-phase)
       (phi-golden-ratio-or-phase . omega-angular-frequency)
       (omega-angular-frequency . universal-scientific-notation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ROMAN/LATIN ALPHABET — 26 letters
    ;;; SOURCE: historical standard
    ;;; ═══════════════════════════════════════════════════════════

    (Latin-alphabet
      (26-letters)
      (most-widely-used-writing-system)
      ((26-letters . derived-from-Etruscan-from-Greek)
       (derived-from-Etruscan-from-Greek . A-through-Z)
       (A-through-Z . used-by-most-European-languages)
       (used-by-most-European-languages . adopted-globally)
       (adopted-globally . most-widely-used-writing-system)))

    (Latin-letters
      (A-B-C-D-E-F-G-H-I-J-K-L-M)
      (N-O-P-Q-R-S-T-U-V-W-X-Y-Z)
      ((A-B-C-D-E-F-G-H-I-J-K-L-M . first-13)
       (first-13 . N-O-P-Q-R-S-T-U-V-W-X-Y-Z)
       (N-O-P-Q-R-S-T-U-V-W-X-Y-Z . last-13)
       (last-13 . 26-total)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; UNIVERSAL PROPERTIES OF HUMAN LANGUAGE
    ;;; SOURCE: Greenberg 1963, Chomsky, Hockett 1960
    ;;; ═══════════════════════════════════════════════════════════

    (duality-of-patterning
      (meaningless-units-combine-to-meaningful-units)
      (Hockett-design-feature)
      ((meaningless-units-combine-to-meaningful-units . phonemes-have-no-meaning)
       (phonemes-have-no-meaning . morphemes-have-meaning)
       (morphemes-have-meaning . infinite-meanings-from-finite-sounds)
       (infinite-meanings-from-finite-sounds . Hockett-design-feature)))

    (displacement
      (can-refer-to-things-not-present)
      (past-future-hypothetical-abstract)
      ((can-refer-to-things-not-present . not-limited-to-here-and-now)
       (not-limited-to-here-and-now . past-future-hypothetical-abstract)))

    (productivity
      (can-create-novel-utterances)
      (infinite-use-of-finite-means-Humboldt)
      ((can-create-novel-utterances . never-before-spoken-sentences)
       (never-before-spoken-sentences . understood-by-competent-speakers)
       (understood-by-competent-speakers . compositional-semantics-enables)
       (compositional-semantics-enables . infinite-use-of-finite-means-Humboldt)))

    (arbitrariness
      (no-inherent-connection-sound-to-meaning)
      (Saussure-principle)
      ((no-inherent-connection-sound-to-meaning . dog-chien-Hund-perro)
       (dog-chien-Hund-perro . same-concept-different-sounds)
       (same-concept-different-sounds . exceptions-onomatopoeia)
       (exceptions-onomatopoeia . Saussure-principle)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ASF CONNECTION — language IS containment made audible
    ;;; ═══════════════════════════════════════════════════════════

    (language-as-containment
      (structure-of-utterance)
      (IS-containment-projected-through-sound)
      ((structure-of-utterance . phrases-contain-words)
       (phrases-contain-words . words-contain-morphemes)
       (words-contain-morphemes . morphemes-contain-phonemes)
       (morphemes-contain-phonemes . nesting-IS-grammar)
       (nesting-IS-grammar . IS-containment-projected-through-sound)))

  )

  ((linguistics . language-registered)))
