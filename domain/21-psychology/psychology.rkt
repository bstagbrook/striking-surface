#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Psychology
;;; LAYER: 21-psychology
;;; DEPENDS ON: 13-neuroscience (neural substrates of behavior),
;;;   04-molecules (neurotransmitter chemistry)
;;; DEPENDED ON BY: clinical practice, education, organizational
;;;   behavior, human-computer interaction, public health
;;;
;;; PURPOSE: The scientific study of mind and behavior — learning,
;;; cognition, emotion, motivation, development, social influence,
;;; personality, and psychopathology.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Myers-13th] D.G. Myers & C.N. DeWall, "Psychology", 13th ed.,
;;;   Worth Publishers, 2021.
;;; [Kahneman-2011] D. Kahneman, "Thinking, Fast and Slow",
;;;   Farrar, Straus and Giroux, 2011.
;;; [DSM-5-TR] American Psychiatric Association, "Diagnostic and
;;;   Statistical Manual of Mental Disorders", 5th ed., Text
;;;   Revision, APA Publishing, 2022.
;;; [Pavlov-1927] I.P. Pavlov, "Conditioned Reflexes", Oxford
;;;   University Press, 1927.
;;; [Skinner-1938] B.F. Skinner, "The Behavior of Organisms",
;;;   Appleton-Century, 1938.
;;; [Baddeley-1974] A.D. Baddeley & G.J. Hitch, "Working Memory",
;;;   in Psychology of Learning and Motivation, Vol. 8, 1974.
;;; [Baddeley-2000] A.D. Baddeley, "The Episodic Buffer: A New
;;;   Component of Working Memory?", Trends Cogn Sci 4(11):417-423.
;;; [Maslow-1943] A.H. Maslow, "A Theory of Human Motivation",
;;;   Psychological Review 50(4):370-396, 1943.
;;; [Deci-Ryan-2000] E.L. Deci & R.M. Ryan, "The 'What' and 'Why'
;;;   of Goal Pursuits", Psychological Inquiry 11(4):227-268, 2000.
;;; [Ekman-1992] P. Ekman, "An Argument for Basic Emotions",
;;;   Cognition and Emotion 6(3-4):169-200, 1992.
;;; [Piaget-1952] J. Piaget, "The Origins of Intelligence in
;;;   Children", International Universities Press, 1952.
;;; [Erikson-1950] E.H. Erikson, "Childhood and Society",
;;;   W.W. Norton, 1950.
;;; [Bowlby-1969] J. Bowlby, "Attachment and Loss, Vol. 1:
;;;   Attachment", Basic Books, 1969.
;;; [Ainsworth-1978] M.D.S. Ainsworth, M.C. Blehar, E. Waters,
;;;   S. Wall, "Patterns of Attachment", Lawrence Erlbaum, 1978.
;;; [Asch-1951] S.E. Asch, "Effects of Group Pressure upon the
;;;   Modification and Distortion of Judgments", in Groups,
;;;   Leadership, and Men, Carnegie Press, 1951.
;;; [Milgram-1963] S. Milgram, "Behavioral Study of Obedience",
;;;   J. Abnormal and Social Psychology 67(4):371-378, 1963.
;;; [Festinger-1957] L. Festinger, "A Theory of Cognitive
;;;   Dissonance", Stanford University Press, 1957.
;;; [Goldberg-1993] L.R. Goldberg, "The Structure of Phenotypic
;;;   Personality Traits", American Psychologist 48(1):26-34, 1993.
;;; [Costa-McCrae-1992] P.T. Costa & R.R. McCrae, "Revised NEO
;;;   Personality Inventory (NEO PI-R) Professional Manual",
;;;   Psychological Assessment Resources, 1992.
;;; [Tversky-Kahneman-1974] A. Tversky & D. Kahneman, "Judgment
;;;   under Uncertainty: Heuristics and Biases", Science
;;;   185(4157):1124-1131, 1974.
;;; [Kruger-Dunning-1999] J. Kruger & D. Dunning, "Unskilled and
;;;   Unaware of It", J. Personality and Social Psychology
;;;   77(6):1121-1134, 1999.
;;; [Koob-Volkow-2010] G.F. Koob & N.D. Volkow, "Neurocircuitry
;;;   of Addiction", Neuropsychopharmacology 35(1):217-238, 2010.
;;;
;;; CALIBRATION: (pending) psychology.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-psychology

  ((Myers-13th (Psychology-13th-ed-2021) (authoritative)
    ((Psychology-13th-ed-2021 . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CLASSICAL CONDITIONING
    ;;; Pavlov's discovery: neutral stimuli become associated with
    ;;; reflexive responses through repeated pairing.
    ;;; SOURCE: [Pavlov-1927]; [Myers-13th] Ch. 7
    ;;; ═══════════════════════════════════════════════════════════

    (classical-conditioning
      (learning-through-association)
      (neutral-stimulus-acquires-power-to-elicit-response)
      ((learning-through-association . discovered-by-Ivan-Pavlov-1927)
       (discovered-by-Ivan-Pavlov-1927 . studied-salivation-in-dogs)
       (studied-salivation-in-dogs . dogs-salivated-to-stimuli-predicting-food)
       (dogs-salivated-to-stimuli-predicting-food . involuntary-reflexive-responses)
       (involuntary-reflexive-responses . organism-learns-to-anticipate-events)
       (organism-learns-to-anticipate-events . neutral-stimulus-acquires-power-to-elicit-response)))

    (unconditioned-stimulus-UCS
      (stimulus-that-naturally-triggers-response)
      (requires-no-prior-learning)
      ((stimulus-that-naturally-triggers-response . food-in-Pavlov-experiment)
       (food-in-Pavlov-experiment . elicits-unconditioned-response-automatically)
       (elicits-unconditioned-response-automatically . biologically-potent)
       (biologically-potent . requires-no-prior-learning)))

    (unconditioned-response-UCR
      (unlearned-naturally-occurring-response)
      (automatic-reaction-to-UCS)
      ((unlearned-naturally-occurring-response . salivation-to-food-in-Pavlov)
       (salivation-to-food-in-Pavlov . reflexive-and-involuntary)
       (reflexive-and-involuntary . not-dependent-on-experience)
       (not-dependent-on-experience . automatic-reaction-to-UCS)))

    (conditioned-stimulus-CS
      (originally-neutral-stimulus)
      (acquires-ability-to-trigger-CR-after-pairing-with-UCS)
      ((originally-neutral-stimulus . bell-tone-in-Pavlov-experiment)
       (bell-tone-in-Pavlov-experiment . initially-produces-no-relevant-response)
       (initially-produces-no-relevant-response . repeatedly-paired-with-UCS)
       (repeatedly-paired-with-UCS . temporal-contiguity-required)
       (temporal-contiguity-required . acquires-ability-to-trigger-CR-after-pairing-with-UCS)))

    (conditioned-response-CR
      (learned-response-to-conditioned-stimulus)
      (resembles-UCR-but-typically-weaker)
      ((learned-response-to-conditioned-stimulus . salivation-to-bell-in-Pavlov)
       (salivation-to-bell-in-Pavlov . elicited-by-CS-after-conditioning)
       (elicited-by-CS-after-conditioning . anticipatory-response)
       (anticipatory-response . often-similar-to-UCR-in-form)
       (often-similar-to-UCR-in-form . resembles-UCR-but-typically-weaker)))

    (extinction-classical
      (CS-presented-repeatedly-without-UCS)
      (CR-diminishes-and-eventually-disappears)
      ((CS-presented-repeatedly-without-UCS . association-weakens)
       (association-weakens . CR-progressively-decreases)
       (CR-progressively-decreases . not-true-forgetting)
       (not-true-forgetting . spontaneous-recovery-can-occur)
       (spontaneous-recovery-can-occur . CR-returns-after-rest-period)
       (CR-returns-after-rest-period . CR-diminishes-and-eventually-disappears)))

    (stimulus-generalization
      (tendency-to-respond-to-stimuli-similar-to-CS)
      (response-strength-decreases-with-dissimilarity)
      ((tendency-to-respond-to-stimuli-similar-to-CS . gradient-of-generalization)
       (gradient-of-generalization . more-similar-stimuli-evoke-stronger-CR)
       (more-similar-stimuli-evoke-stronger-CR . adaptive-function)
       (adaptive-function . enables-response-to-novel-but-related-stimuli)
       (enables-response-to-novel-but-related-stimuli . response-strength-decreases-with-dissimilarity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; OPERANT CONDITIONING
    ;;; Learning through consequences. Behavior is shaped by
    ;;; reinforcement and punishment.
    ;;; SOURCE: [Skinner-1938]; [Myers-13th] Ch. 7
    ;;; ═══════════════════════════════════════════════════════════

    (operant-conditioning
      (learning-through-consequences-of-behavior)
      (behavior-strengthened-or-weakened-by-outcomes)
      ((learning-through-consequences-of-behavior . B-F-Skinner-1938)
       (B-F-Skinner-1938 . built-on-Thorndike-law-of-effect)
       (built-on-Thorndike-law-of-effect . voluntary-behaviors)
       (voluntary-behaviors . organism-operates-on-environment)
       (organism-operates-on-environment . consequences-shape-future-behavior)
       (consequences-shape-future-behavior . behavior-strengthened-or-weakened-by-outcomes)))

    (positive-reinforcement
      (adding-desirable-stimulus-after-behavior)
      (increases-probability-of-behavior)
      ((adding-desirable-stimulus-after-behavior . positive-means-adding)
       (positive-means-adding . reinforcement-means-strengthening)
       (reinforcement-means-strengthening . example-food-pellet-for-lever-press)
       (example-food-pellet-for-lever-press . example-praise-for-good-work)
       (example-praise-for-good-work . increases-probability-of-behavior)))

    (negative-reinforcement
      (removing-aversive-stimulus-after-behavior)
      (increases-probability-of-behavior)
      ((removing-aversive-stimulus-after-behavior . negative-means-removing)
       (negative-means-removing . reinforcement-means-strengthening)
       (reinforcement-means-strengthening . example-stopping-electric-shock-when-lever-pressed)
       (example-stopping-electric-shock-when-lever-pressed . example-taking-aspirin-removes-headache)
       (example-taking-aspirin-removes-headache . increases-probability-of-behavior)))

    (punishment
      (consequence-that-decreases-behavior)
      (suppresses-but-does-not-eliminate-behavior)
      ((consequence-that-decreases-behavior . positive-punishment-adds-aversive)
       (positive-punishment-adds-aversive . example-spanking-or-reprimand)
       (example-spanking-or-reprimand . negative-punishment-removes-desired)
       (negative-punishment-removes-desired . example-revoking-privileges)
       (example-revoking-privileges . temporarily-suppresses-behavior)
       (temporarily-suppresses-behavior . does-not-teach-desired-alternative)
       (does-not-teach-desired-alternative . suppresses-but-does-not-eliminate-behavior)))

    (fixed-ratio-schedule
      (reinforcement-after-fixed-number-of-responses)
      (high-rate-of-responding-with-post-reinforcement-pause)
      ((reinforcement-after-fixed-number-of-responses . abbreviated-FR)
       (abbreviated-FR . example-FR-5-reinforcement-every-5th-response)
       (example-FR-5-reinforcement-every-5th-response . produces-high-steady-rate)
       (produces-high-steady-rate . brief-pause-after-each-reinforcement)
       (brief-pause-after-each-reinforcement . piecework-pay-is-real-world-example)
       (piecework-pay-is-real-world-example . high-rate-of-responding-with-post-reinforcement-pause)))

    (variable-ratio-schedule
      (reinforcement-after-unpredictable-number-of-responses)
      (highest-and-most-steady-response-rate)
      ((reinforcement-after-unpredictable-number-of-responses . abbreviated-VR)
       (abbreviated-VR . example-VR-10-average-every-10th-but-varies)
       (example-VR-10-average-every-10th-but-varies . slot-machines-operate-on-VR)
       (slot-machines-operate-on-VR . very-resistant-to-extinction)
       (very-resistant-to-extinction . no-post-reinforcement-pause)
       (no-post-reinforcement-pause . highest-and-most-steady-response-rate)))

    (fixed-interval-schedule
      (reinforcement-for-first-response-after-fixed-time)
      (scalloped-response-pattern)
      ((reinforcement-for-first-response-after-fixed-time . abbreviated-FI)
       (abbreviated-FI . example-FI-60-reinforcement-for-first-response-after-60-seconds)
       (example-FI-60-reinforcement-for-first-response-after-60-seconds . low-responding-after-reinforcement)
       (low-responding-after-reinforcement . responding-accelerates-as-interval-ends)
       (responding-accelerates-as-interval-ends . checking-mailbox-is-real-world-example)
       (checking-mailbox-is-real-world-example . scalloped-response-pattern)))

    (variable-interval-schedule
      (reinforcement-for-first-response-after-variable-time)
      (slow-steady-response-rate)
      ((reinforcement-for-first-response-after-variable-time . abbreviated-VI)
       (abbreviated-VI . example-VI-30-average-30-second-interval-but-varies)
       (example-VI-30-average-30-second-interval-but-varies . produces-slow-steady-responding)
       (produces-slow-steady-responding . moderately-resistant-to-extinction)
       (moderately-resistant-to-extinction . pop-quizzes-are-real-world-example)
       (pop-quizzes-are-real-world-example . slow-steady-response-rate)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COGNITIVE PSYCHOLOGY — MEMORY SYSTEMS
    ;;; SOURCE: [Baddeley-1974]; [Baddeley-2000]; [Myers-13th] Ch. 8
    ;;; ═══════════════════════════════════════════════════════════

    (working-memory-Baddeley
      (limited-capacity-system-for-temporary-processing)
      (four-component-model)
      ((limited-capacity-system-for-temporary-processing . Baddeley-and-Hitch-1974)
       (Baddeley-and-Hitch-1974 . replaced-unitary-short-term-memory-concept)
       (replaced-unitary-short-term-memory-concept . active-manipulation-not-just-storage)
       (active-manipulation-not-just-storage . capacity-approximately-7-plus-minus-2-items-Miller-1956)
       (capacity-approximately-7-plus-minus-2-items-Miller-1956 . duration-about-20-30-seconds-without-rehearsal)
       (duration-about-20-30-seconds-without-rehearsal . four-component-model)))

    (phonological-loop
      (component-of-working-memory)
      (holds-and-rehearses-verbal-and-acoustic-information)
      ((component-of-working-memory . phonological-store-holds-speech-based-info-1-2-seconds)
       (phonological-store-holds-speech-based-info-1-2-seconds . articulatory-rehearsal-process)
       (articulatory-rehearsal-process . refreshes-decaying-traces-via-subvocal-speech)
       (refreshes-decaying-traces-via-subvocal-speech . word-length-effect-shorter-words-recalled-better)
       (word-length-effect-shorter-words-recalled-better . holds-and-rehearses-verbal-and-acoustic-information)))

    (visuospatial-sketchpad
      (component-of-working-memory)
      (holds-and-manipulates-visual-and-spatial-information)
      ((component-of-working-memory . visual-cache-stores-form-and-color)
       (visual-cache-stores-form-and-color . inner-scribe-handles-spatial-and-movement)
       (inner-scribe-handles-spatial-and-movement . used-in-mental-rotation-tasks)
       (used-in-mental-rotation-tasks . navigation-and-spatial-reasoning)
       (navigation-and-spatial-reasoning . holds-and-manipulates-visual-and-spatial-information)))

    (central-executive
      (component-of-working-memory)
      (attentional-control-system)
      ((component-of-working-memory . directs-attention-and-coordinates-subsystems)
       (directs-attention-and-coordinates-subsystems . limited-capacity-attentional-system)
       (limited-capacity-attentional-system . switches-focus-between-tasks)
       (switches-focus-between-tasks . inhibits-irrelevant-information)
       (inhibits-irrelevant-information . attentional-control-system)))

    (episodic-buffer
      (component-of-working-memory)
      (integrates-information-from-multiple-sources)
      ((component-of-working-memory . added-by-Baddeley-2000)
       (added-by-Baddeley-2000 . limited-capacity-temporary-store)
       (limited-capacity-temporary-store . binds-information-across-subsystems)
       (binds-information-across-subsystems . interfaces-with-long-term-memory)
       (interfaces-with-long-term-memory . integrates-information-from-multiple-sources)))

    (long-term-memory-declarative
      (explicit-memory-for-facts-and-events)
      (consciously-recalled)
      ((explicit-memory-for-facts-and-events . also-called-explicit-memory)
       (also-called-explicit-memory . semantic-memory-general-knowledge-and-facts)
       (semantic-memory-general-knowledge-and-facts . episodic-memory-personal-experiences-and-events)
       (episodic-memory-personal-experiences-and-events . hippocampus-critical-for-formation)
       (hippocampus-critical-for-formation . patient-HM-confirmed-hippocampal-role)
       (patient-HM-confirmed-hippocampal-role . consciously-recalled)))

    (long-term-memory-procedural
      (implicit-memory-for-skills-and-procedures)
      (expressed-through-performance-not-conscious-recall)
      ((implicit-memory-for-skills-and-procedures . also-called-nondeclarative-memory)
       (also-called-nondeclarative-memory . motor-skills-riding-bicycle)
       (motor-skills-riding-bicycle . cognitive-skills-reading)
       (cognitive-skills-reading . basal-ganglia-and-cerebellum-involved)
       (basal-ganglia-and-cerebellum-involved . preserved-in-amnesia)
       (preserved-in-amnesia . expressed-through-performance-not-conscious-recall)))

    (encoding-storage-retrieval
      (three-stages-of-memory-processing)
      (information-must-be-encoded-stored-and-retrieved)
      ((three-stages-of-memory-processing . encoding-transforms-input-to-neural-code)
       (encoding-transforms-input-to-neural-code . deep-processing-produces-better-encoding-Craik-Lockhart-1972)
       (deep-processing-produces-better-encoding-Craik-Lockhart-1972 . storage-maintains-information-over-time)
       (storage-maintains-information-over-time . consolidation-stabilizes-memory-traces)
       (consolidation-stabilizes-memory-traces . retrieval-accesses-stored-information)
       (retrieval-accesses-stored-information . retrieval-cues-aid-access)
       (retrieval-cues-aid-access . encoding-specificity-principle-Tulving-1973)
       (encoding-specificity-principle-Tulving-1973 . information-must-be-encoded-stored-and-retrieved)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COGNITIVE BIASES
    ;;; SOURCE: [Kahneman-2011]; [Tversky-Kahneman-1974];
    ;;;   [Kruger-Dunning-1999]; [Myers-13th] Ch. 9
    ;;; ═══════════════════════════════════════════════════════════

    (confirmation-bias
      (tendency-to-search-for-confirming-evidence)
      (disregards-or-underweights-disconfirming-evidence)
      ((tendency-to-search-for-confirming-evidence . Wason-1960-selection-task)
       (Wason-1960-selection-task . seek-information-consistent-with-existing-beliefs)
       (seek-information-consistent-with-existing-beliefs . interpret-ambiguous-evidence-as-supporting)
       (interpret-ambiguous-evidence-as-supporting . remember-confirming-instances-better)
       (remember-confirming-instances-better . pervasive-across-domains)
       (pervasive-across-domains . disregards-or-underweights-disconfirming-evidence)))

    (availability-heuristic
      (judging-probability-by-ease-of-recall)
      (leads-to-overestimation-of-vivid-or-recent-events)
      ((judging-probability-by-ease-of-recall . Tversky-and-Kahneman-1973)
       (Tversky-and-Kahneman-1973 . ease-of-retrieval-used-as-cue-for-frequency)
       (ease-of-retrieval-used-as-cue-for-frequency . dramatic-events-overestimated)
       (dramatic-events-overestimated . example-fear-of-flying-vs-driving)
       (example-fear-of-flying-vs-driving . media-coverage-amplifies-availability)
       (media-coverage-amplifies-availability . leads-to-overestimation-of-vivid-or-recent-events)))

    (Dunning-Kruger-effect
      (unskilled-individuals-overestimate-their-competence)
      (skilled-individuals-slightly-underestimate-their-competence)
      ((unskilled-individuals-overestimate-their-competence . Kruger-and-Dunning-1999)
       (Kruger-and-Dunning-1999 . incompetence-robs-ability-to-recognize-incompetence)
       (incompetence-robs-ability-to-recognize-incompetence . dual-burden-poor-performance-and-poor-self-assessment)
       (dual-burden-poor-performance-and-poor-self-assessment . metacognitive-deficit)
       (metacognitive-deficit . training-improves-both-skill-and-self-assessment)
       (training-improves-both-skill-and-self-assessment . skilled-individuals-slightly-underestimate-their-competence)))

    (sunk-cost-fallacy
      (continuing-endeavor-due-to-previously-invested-resources)
      (rational-decisions-should-consider-only-future-costs-and-benefits)
      ((continuing-endeavor-due-to-previously-invested-resources . also-called-Concorde-fallacy)
       (also-called-Concorde-fallacy . past-costs-are-irrecoverable)
       (past-costs-are-irrecoverable . emotional-attachment-to-prior-investment)
       (emotional-attachment-to-prior-investment . loss-aversion-drives-persistence)
       (loss-aversion-drives-persistence . escalation-of-commitment)
       (escalation-of-commitment . rational-decisions-should-consider-only-future-costs-and-benefits)))

    (hindsight-bias
      (tendency-to-believe-outcome-was-foreseeable-after-learning-it)
      (I-knew-it-all-along-phenomenon)
      ((tendency-to-believe-outcome-was-foreseeable-after-learning-it . Fischhoff-1975)
       (Fischhoff-1975 . distorts-memory-of-prior-predictions)
       (distorts-memory-of-prior-predictions . overestimates-own-predictive-ability)
       (overestimates-own-predictive-ability . reduces-learning-from-outcomes)
       (reduces-learning-from-outcomes . robust-across-cultures-and-domains)
       (robust-across-cultures-and-domains . I-knew-it-all-along-phenomenon)))

    (framing-effect
      (decisions-influenced-by-how-options-are-presented)
      (logically-equivalent-options-produce-different-choices)
      ((decisions-influenced-by-how-options-are-presented . Tversky-and-Kahneman-1981)
       (Tversky-and-Kahneman-1981 . gain-frame-promotes-risk-aversion)
       (gain-frame-promotes-risk-aversion . loss-frame-promotes-risk-seeking)
       (loss-frame-promotes-risk-seeking . example-Asian-disease-problem)
       (example-Asian-disease-problem . violates-rational-choice-invariance-axiom)
       (violates-rational-choice-invariance-axiom . logically-equivalent-options-produce-different-choices)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MOTIVATION
    ;;; SOURCE: [Maslow-1943]; [Deci-Ryan-2000]; [Myers-13th] Ch. 11
    ;;; ═══════════════════════════════════════════════════════════

    (Maslow-hierarchy-of-needs
      (motivational-theory-of-hierarchical-needs)
      (five-level-pyramid-from-physiological-to-self-actualization)
      ((motivational-theory-of-hierarchical-needs . Abraham-Maslow-1943)
       (Abraham-Maslow-1943 . level-1-physiological-food-water-warmth-rest)
       (level-1-physiological-food-water-warmth-rest . level-2-safety-security-stability)
       (level-2-safety-security-stability . level-3-belongingness-love-intimate-relationships-friends)
       (level-3-belongingness-love-intimate-relationships-friends . level-4-esteem-prestige-feeling-of-accomplishment)
       (level-4-esteem-prestige-feeling-of-accomplishment . level-5-self-actualization-achieving-full-potential)
       (level-5-self-actualization-achieving-full-potential . lower-needs-must-be-substantially-met-first)
       (lower-needs-must-be-substantially-met-first . criticized-for-rigidity-but-influential)
       (criticized-for-rigidity-but-influential . five-level-pyramid-from-physiological-to-self-actualization)))

    (self-determination-theory
      (intrinsic-motivation-theory)
      (three-basic-psychological-needs)
      ((intrinsic-motivation-theory . Deci-and-Ryan-1985-2000)
       (Deci-and-Ryan-1985-2000 . autonomy-need-for-self-direction-and-choice)
       (autonomy-need-for-self-direction-and-choice . competence-need-to-master-tasks-and-learn)
       (competence-need-to-master-tasks-and-learn . relatedness-need-to-belong-and-connect-with-others)
       (relatedness-need-to-belong-and-connect-with-others . satisfying-three-needs-fosters-intrinsic-motivation)
       (satisfying-three-needs-fosters-intrinsic-motivation . extrinsic-rewards-can-undermine-intrinsic-motivation)
       (extrinsic-rewards-can-undermine-intrinsic-motivation . overjustification-effect)
       (overjustification-effect . three-basic-psychological-needs)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EMOTION THEORIES
    ;;; SOURCE: [Ekman-1992]; [Myers-13th] Ch. 12
    ;;; ═══════════════════════════════════════════════════════════

    (James-Lange-theory
      (emotion-follows-bodily-response)
      (we-feel-afraid-because-we-tremble)
      ((emotion-follows-bodily-response . William-James-1884-Carl-Lange-1885)
       (William-James-1884-Carl-Lange-1885 . stimulus-triggers-physiological-arousal-first)
       (stimulus-triggers-physiological-arousal-first . brain-interprets-bodily-changes)
       (brain-interprets-bodily-changes . different-emotions-have-distinct-physiological-signatures)
       (different-emotions-have-distinct-physiological-signatures . supported-by-facial-feedback-hypothesis)
       (supported-by-facial-feedback-hypothesis . we-feel-afraid-because-we-tremble)))

    (Cannon-Bard-theory
      (emotion-and-arousal-occur-simultaneously)
      (physiological-response-and-subjective-experience-are-independent)
      ((emotion-and-arousal-occur-simultaneously . Walter-Cannon-1927-Philip-Bard)
       (Walter-Cannon-1927-Philip-Bard . thalamus-sends-signals-simultaneously)
       (thalamus-sends-signals-simultaneously . to-cortex-for-subjective-experience)
       (to-cortex-for-subjective-experience . to-body-for-physiological-response)
       (to-body-for-physiological-response . challenged-James-Lange-sequential-model)
       (challenged-James-Lange-sequential-model . physiological-response-and-subjective-experience-are-independent)))

    (Schachter-Singer-two-factor-theory
      (emotion-requires-arousal-plus-cognitive-label)
      (same-arousal-different-emotion-depending-on-context)
      ((emotion-requires-arousal-plus-cognitive-label . Stanley-Schachter-and-Jerome-Singer-1962)
       (Stanley-Schachter-and-Jerome-Singer-1962 . physiological-arousal-is-general-and-undifferentiated)
       (physiological-arousal-is-general-and-undifferentiated . cognitive-appraisal-of-situation-provides-label)
       (cognitive-appraisal-of-situation-provides-label . epinephrine-injection-experiment)
       (epinephrine-injection-experiment . participants-labeled-arousal-based-on-social-context)
       (participants-labeled-arousal-based-on-social-context . same-arousal-different-emotion-depending-on-context)))

    (Ekman-basic-emotions
      (universal-set-of-basic-emotions)
      (six-emotions-with-distinct-facial-expressions)
      ((universal-set-of-basic-emotions . Paul-Ekman-1992)
       (Paul-Ekman-1992 . cross-cultural-studies-of-facial-expression)
       (cross-cultural-studies-of-facial-expression . happiness-recognized-universally)
       (happiness-recognized-universally . sadness-recognized-universally)
       (sadness-recognized-universally . fear-recognized-universally)
       (fear-recognized-universally . disgust-recognized-universally)
       (disgust-recognized-universally . anger-recognized-universally)
       (anger-recognized-universally . surprise-recognized-universally)
       (surprise-recognized-universally . each-has-distinctive-facial-expression)
       (each-has-distinctive-facial-expression . six-emotions-with-distinct-facial-expressions)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DEVELOPMENTAL PSYCHOLOGY
    ;;; SOURCE: [Piaget-1952]; [Erikson-1950]; [Bowlby-1969];
    ;;;   [Ainsworth-1978]; [Myers-13th] Ch. 5-6
    ;;; ═══════════════════════════════════════════════════════════

    (Piaget-sensorimotor-stage
      (birth-to-approximately-2-years)
      (knowledge-through-sensory-experience-and-motor-actions)
      ((birth-to-approximately-2-years . Jean-Piaget-stage-1-of-4)
       (Jean-Piaget-stage-1-of-4 . infant-learns-through-looking-touching-sucking)
       (infant-learns-through-looking-touching-sucking . object-permanence-develops)
       (object-permanence-develops . understanding-objects-exist-when-out-of-sight)
       (understanding-objects-exist-when-out-of-sight . stranger-anxiety-around-8-months)
       (stranger-anxiety-around-8-months . knowledge-through-sensory-experience-and-motor-actions)))

    (Piaget-preoperational-stage
      (approximately-2-to-7-years)
      (symbolic-thinking-but-not-yet-logical-operations)
      ((approximately-2-to-7-years . Jean-Piaget-stage-2-of-4)
       (Jean-Piaget-stage-2-of-4 . language-development-and-pretend-play)
       (language-development-and-pretend-play . egocentrism-difficulty-taking-others-perspective)
       (egocentrism-difficulty-taking-others-perspective . lack-of-conservation-understanding)
       (lack-of-conservation-understanding . animism-attributing-life-to-inanimate-objects)
       (animism-attributing-life-to-inanimate-objects . symbolic-thinking-but-not-yet-logical-operations)))

    (Piaget-concrete-operational-stage
      (approximately-7-to-11-years)
      (logical-thinking-about-concrete-events)
      ((approximately-7-to-11-years . Jean-Piaget-stage-3-of-4)
       (Jean-Piaget-stage-3-of-4 . conservation-of-number-mass-volume-understood)
       (conservation-of-number-mass-volume-understood . reversibility-of-operations)
       (reversibility-of-operations . classification-and-seriation)
       (classification-and-seriation . difficulty-with-abstract-or-hypothetical-thinking)
       (difficulty-with-abstract-or-hypothetical-thinking . logical-thinking-about-concrete-events)))

    (Piaget-formal-operational-stage
      (approximately-12-years-and-beyond)
      (abstract-and-hypothetical-reasoning)
      ((approximately-12-years-and-beyond . Jean-Piaget-stage-4-of-4)
       (Jean-Piaget-stage-4-of-4 . hypothetical-deductive-reasoning)
       (hypothetical-deductive-reasoning . systematic-problem-solving)
       (systematic-problem-solving . abstract-thought-about-ideals-and-possibilities)
       (abstract-thought-about-ideals-and-possibilities . not-all-adults-reach-full-formal-operations)
       (not-all-adults-reach-full-formal-operations . abstract-and-hypothetical-reasoning)))

    (Erikson-psychosocial-stages
      (eight-stages-of-psychosocial-development)
      (each-stage-presents-a-crisis-to-resolve)
      ((eight-stages-of-psychosocial-development . Erik-Erikson-1950)
       (Erik-Erikson-1950 . stage-1-trust-vs-mistrust-infancy)
       (stage-1-trust-vs-mistrust-infancy . stage-2-autonomy-vs-shame-and-doubt-toddlerhood)
       (stage-2-autonomy-vs-shame-and-doubt-toddlerhood . stage-3-initiative-vs-guilt-preschool)
       (stage-3-initiative-vs-guilt-preschool . stage-4-industry-vs-inferiority-school-age)
       (stage-4-industry-vs-inferiority-school-age . stage-5-identity-vs-role-confusion-adolescence)
       (stage-5-identity-vs-role-confusion-adolescence . stage-6-intimacy-vs-isolation-young-adulthood)
       (stage-6-intimacy-vs-isolation-young-adulthood . stage-7-generativity-vs-stagnation-middle-adulthood)
       (stage-7-generativity-vs-stagnation-middle-adulthood . stage-8-integrity-vs-despair-late-adulthood)
       (stage-8-integrity-vs-despair-late-adulthood . each-stage-presents-a-crisis-to-resolve)))

    (attachment-theory-Bowlby
      (innate-drive-to-form-emotional-bonds-with-caregivers)
      (secure-base-for-exploration)
      ((innate-drive-to-form-emotional-bonds-with-caregivers . John-Bowlby-1969)
       (John-Bowlby-1969 . attachment-is-evolutionary-adaptive)
       (attachment-is-evolutionary-adaptive . promotes-survival-through-proximity-to-caregiver)
       (promotes-survival-through-proximity-to-caregiver . critical-period-first-2-to-3-years)
       (critical-period-first-2-to-3-years . internal-working-models-of-relationships)
       (internal-working-models-of-relationships . disrupted-attachment-has-lasting-effects)
       (disrupted-attachment-has-lasting-effects . secure-base-for-exploration)))

    (Ainsworth-attachment-types
      (Strange-Situation-procedure)
      (three-primary-attachment-patterns)
      ((Strange-Situation-procedure . Mary-Ainsworth-1978)
       (Mary-Ainsworth-1978 . secure-attachment-65-pct-of-infants)
       (secure-attachment-65-pct-of-infants . uses-caregiver-as-secure-base-distressed-at-separation-comforted-at-reunion)
       (uses-caregiver-as-secure-base-distressed-at-separation-comforted-at-reunion . anxious-ambivalent-10-pct)
       (anxious-ambivalent-10-pct . clingy-distressed-at-separation-not-easily-comforted)
       (clingy-distressed-at-separation-not-easily-comforted . avoidant-20-pct)
       (avoidant-20-pct . shows-little-distress-at-separation-avoids-caregiver-at-reunion)
       (shows-little-distress-at-separation-avoids-caregiver-at-reunion . disorganized-added-later-by-Main-and-Solomon-1986)
       (disorganized-added-later-by-Main-and-Solomon-1986 . three-primary-attachment-patterns)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SOCIAL PSYCHOLOGY
    ;;; SOURCE: [Asch-1951]; [Milgram-1963]; [Festinger-1957];
    ;;;   [Myers-13th] Ch. 13-14
    ;;; ═══════════════════════════════════════════════════════════

    (conformity-Asch
      (adjusting-behavior-to-align-with-group-norms)
      (individuals-conform-even-when-group-is-clearly-wrong)
      ((adjusting-behavior-to-align-with-group-norms . Solomon-Asch-1951)
       (Solomon-Asch-1951 . line-length-judgment-task)
       (line-length-judgment-task . confederates-gave-unanimous-wrong-answers)
       (confederates-gave-unanimous-wrong-answers . about-one-third-of-responses-conformed)
       (about-one-third-of-responses-conformed . 75-pct-conformed-at-least-once)
       (75-pct-conformed-at-least-once . normative-influence-desire-to-be-accepted)
       (normative-influence-desire-to-be-accepted . informational-influence-desire-to-be-correct)
       (informational-influence-desire-to-be-correct . individuals-conform-even-when-group-is-clearly-wrong)))

    (obedience-Milgram
      (complying-with-commands-from-authority-figure)
      (ordinary-people-obey-destructive-orders)
      ((complying-with-commands-from-authority-figure . Stanley-Milgram-1963)
       (Stanley-Milgram-1963 . participants-administered-apparent-electric-shocks)
       (participants-administered-apparent-electric-shocks . shocks-went-to-450-volts-in-increments)
       (shocks-went-to-450-volts-in-increments . 65-pct-of-participants-obeyed-to-maximum)
       (65-pct-of-participants-obeyed-to-maximum . situational-factors-outweighed-personal-disposition)
       (situational-factors-outweighed-personal-disposition . proximity-of-authority-increased-obedience)
       (proximity-of-authority-increased-obedience . ordinary-people-obey-destructive-orders)))

    (bystander-effect
      (presence-of-others-reduces-helping-behavior)
      (diffusion-of-responsibility)
      ((presence-of-others-reduces-helping-behavior . Darley-and-Latane-1968)
       (Darley-and-Latane-1968 . inspired-by-Kitty-Genovese-case-1964)
       (inspired-by-Kitty-Genovese-case-1964 . more-bystanders-leads-to-less-individual-helping)
       (more-bystanders-leads-to-less-individual-helping . pluralistic-ignorance-others-seem-unconcerned)
       (pluralistic-ignorance-others-seem-unconcerned . evaluation-apprehension-fear-of-judgment)
       (evaluation-apprehension-fear-of-judgment . diffusion-of-responsibility)))

    (cognitive-dissonance-Festinger
      (discomfort-from-holding-contradictory-cognitions)
      (motivated-to-reduce-inconsistency)
      ((discomfort-from-holding-contradictory-cognitions . Leon-Festinger-1957)
       (Leon-Festinger-1957 . tension-between-beliefs-attitudes-and-behaviors)
       (tension-between-beliefs-attitudes-and-behaviors . dissonance-is-psychologically-aversive)
       (dissonance-is-psychologically-aversive . change-behavior-to-match-beliefs)
       (change-behavior-to-match-beliefs . change-beliefs-to-match-behavior)
       (change-beliefs-to-match-behavior . add-consonant-cognitions-to-reduce-tension)
       (add-consonant-cognitions-to-reduce-tension . insufficient-justification-paradigm-1-dollar-vs-20-dollar-study)
       (insufficient-justification-paradigm-1-dollar-vs-20-dollar-study . motivated-to-reduce-inconsistency)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PERSONALITY
    ;;; SOURCE: [Costa-McCrae-1992]; [Goldberg-1993]; [Myers-13th] Ch. 14
    ;;; ═══════════════════════════════════════════════════════════

    (Big-Five-personality-traits
      (five-factor-model-of-personality)
      (OCEAN-acronym)
      ((five-factor-model-of-personality . Costa-and-McCrae-1992-Goldberg-1993)
       (Costa-and-McCrae-1992-Goldberg-1993 . derived-from-factor-analysis-of-trait-descriptors)
       (derived-from-factor-analysis-of-trait-descriptors . Openness-to-experience-curiosity-creativity-vs-conventional)
       (Openness-to-experience-curiosity-creativity-vs-conventional . Conscientiousness-organized-dependable-vs-careless)
       (Conscientiousness-organized-dependable-vs-careless . Extraversion-outgoing-energetic-vs-solitary-reserved)
       (Extraversion-outgoing-energetic-vs-solitary-reserved . Agreeableness-friendly-compassionate-vs-challenging-detached)
       (Agreeableness-friendly-compassionate-vs-challenging-detached . Neuroticism-sensitive-nervous-vs-resilient-confident)
       (Neuroticism-sensitive-nervous-vs-resilient-confident . stable-across-cultures-and-lifespan)
       (stable-across-cultures-and-lifespan . approximately-50-pct-heritable)
       (approximately-50-pct-heritable . OCEAN-acronym)))

    (trait-theory-of-personality
      (personality-as-stable-individual-differences)
      (traits-predict-behavior-across-situations)
      ((personality-as-stable-individual-differences . Gordon-Allport-1937-identified-4500-trait-words)
       (Gordon-Allport-1937-identified-4500-trait-words . Raymond-Cattell-reduced-to-16-factors)
       (Raymond-Cattell-reduced-to-16-factors . Hans-Eysenck-proposed-3-dimensions)
       (Hans-Eysenck-proposed-3-dimensions . extraversion-neuroticism-psychoticism)
       (extraversion-neuroticism-psychoticism . person-situation-debate-Mischel-1968)
       (person-situation-debate-Mischel-1968 . traits-are-real-but-situations-also-matter)
       (traits-are-real-but-situations-also-matter . traits-predict-behavior-across-situations)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PSYCHOPATHOLOGY
    ;;; SOURCE: [DSM-5-TR]; [Myers-13th] Ch. 15-16
    ;;; ═══════════════════════════════════════════════════════════

    (DSM-framework
      (Diagnostic-and-Statistical-Manual-of-Mental-Disorders)
      (categorical-classification-system-for-mental-disorders)
      ((Diagnostic-and-Statistical-Manual-of-Mental-Disorders . American-Psychiatric-Association)
       (American-Psychiatric-Association . DSM-5-TR-published-2022)
       (DSM-5-TR-published-2022 . defines-diagnostic-criteria-for-each-disorder)
       (defines-diagnostic-criteria-for-each-disorder . multiaxial-system-removed-in-DSM-5)
       (multiaxial-system-removed-in-DSM-5 . emphasizes-clinical-utility-and-reliability)
       (emphasizes-clinical-utility-and-reliability . dimensional-assessments-added)
       (dimensional-assessments-added . categorical-classification-system-for-mental-disorders)))

    (anxiety-disorders
      (class-of-disorders-involving-excessive-fear-and-anxiety)
      (most-common-mental-disorders)
      ((class-of-disorders-involving-excessive-fear-and-anxiety . DSM-5-TR-category)
       (DSM-5-TR-category . generalized-anxiety-disorder-persistent-excessive-worry)
       (generalized-anxiety-disorder-persistent-excessive-worry . panic-disorder-recurrent-unexpected-panic-attacks)
       (panic-disorder-recurrent-unexpected-panic-attacks . specific-phobias-irrational-fear-of-specific-objects-or-situations)
       (specific-phobias-irrational-fear-of-specific-objects-or-situations . social-anxiety-disorder-fear-of-social-evaluation)
       (social-anxiety-disorder-fear-of-social-evaluation . amygdala-hyperactivity-implicated)
       (amygdala-hyperactivity-implicated . lifetime-prevalence-approximately-29-pct)
       (lifetime-prevalence-approximately-29-pct . most-common-mental-disorders)))

    (major-depressive-disorder
      (persistent-depressed-mood-or-loss-of-interest)
      (serotonin-hypothesis-and-beyond)
      ((persistent-depressed-mood-or-loss-of-interest . DSM-5-TR-criteria-at-least-2-weeks)
       (DSM-5-TR-criteria-at-least-2-weeks . five-or-more-symptoms-including-mood-or-anhedonia)
       (five-or-more-symptoms-including-mood-or-anhedonia . sleep-disturbance-appetite-change-fatigue-worthlessness)
       (sleep-disturbance-appetite-change-fatigue-worthlessness . difficulty-concentrating-psychomotor-changes-suicidal-ideation)
       (difficulty-concentrating-psychomotor-changes-suicidal-ideation . serotonin-hypothesis-low-5-HT-contributes-to-depression)
       (serotonin-hypothesis-low-5-HT-contributes-to-depression . SSRIs-increase-serotonin-availability)
       (SSRIs-increase-serotonin-availability . monoamine-hypothesis-oversimplified-per-current-evidence)
       (monoamine-hypothesis-oversimplified-per-current-evidence . neuroplasticity-and-inflammation-also-implicated)
       (neuroplasticity-and-inflammation-also-implicated . lifetime-prevalence-approximately-17-pct)
       (lifetime-prevalence-approximately-17-pct . serotonin-hypothesis-and-beyond)))

    (schizophrenia
      (severe-disorder-with-psychotic-features)
      (dopamine-hypothesis)
      ((severe-disorder-with-psychotic-features . DSM-5-TR-criteria-at-least-6-months)
       (DSM-5-TR-criteria-at-least-6-months . positive-symptoms-hallucinations-delusions-disorganized-speech)
       (positive-symptoms-hallucinations-delusions-disorganized-speech . negative-symptoms-flat-affect-avolition-alogia)
       (negative-symptoms-flat-affect-avolition-alogia . cognitive-symptoms-impaired-attention-working-memory)
       (cognitive-symptoms-impaired-attention-working-memory . dopamine-hypothesis-excess-D2-activity-in-mesolimbic-pathway)
       (dopamine-hypothesis-excess-D2-activity-in-mesolimbic-pathway . antipsychotics-block-D2-receptors)
       (antipsychotics-block-D2-receptors . glutamate-hypothesis-NMDA-receptor-hypofunction-also-implicated)
       (glutamate-hypothesis-NMDA-receptor-hypofunction-also-implicated . heritability-approximately-80-pct)
       (heritability-approximately-80-pct . lifetime-prevalence-approximately-1-pct)
       (lifetime-prevalence-approximately-1-pct . dopamine-hypothesis)))

    (PTSD
      (develops-after-exposure-to-traumatic-event)
      (re-experiencing-avoidance-hyperarousal-negative-cognitions)
      ((develops-after-exposure-to-traumatic-event . DSM-5-TR-trauma-and-stressor-related-disorder)
       (DSM-5-TR-trauma-and-stressor-related-disorder . intrusion-symptoms-flashbacks-nightmares)
       (intrusion-symptoms-flashbacks-nightmares . avoidance-of-trauma-related-stimuli)
       (avoidance-of-trauma-related-stimuli . negative-alterations-in-cognition-and-mood)
       (negative-alterations-in-cognition-and-mood . hyperarousal-exaggerated-startle-hypervigilance)
       (hyperarousal-exaggerated-startle-hypervigilance . symptoms-persist-more-than-one-month)
       (symptoms-persist-more-than-one-month . amygdala-hyperactivity-and-prefrontal-hypoactivity)
       (amygdala-hyperactivity-and-prefrontal-hypoactivity . hippocampal-volume-reduction-observed)
       (hippocampal-volume-reduction-observed . re-experiencing-avoidance-hyperarousal-negative-cognitions)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ADDICTION
    ;;; SOURCE: [Koob-Volkow-2010]; [Myers-13th] Ch. 3, 15
    ;;; ═══════════════════════════════════════════════════════════

    (reward-pathway
      (mesolimbic-dopamine-system)
      (ventral-tegmental-area-to-nucleus-accumbens)
      ((mesolimbic-dopamine-system . ventral-tegmental-area-VTA-dopamine-neurons)
       (ventral-tegmental-area-VTA-dopamine-neurons . project-to-nucleus-accumbens)
       (project-to-nucleus-accumbens . also-project-to-prefrontal-cortex)
       (also-project-to-prefrontal-cortex . natural-rewards-food-sex-social-activate-pathway)
       (natural-rewards-food-sex-social-activate-pathway . drugs-of-abuse-hijack-this-system)
       (drugs-of-abuse-hijack-this-system . produce-supranormal-dopamine-release)
       (produce-supranormal-dopamine-release . ventral-tegmental-area-to-nucleus-accumbens)))

    (tolerance
      (diminished-response-to-repeated-drug-exposure)
      (requires-increasing-doses-for-same-effect)
      ((diminished-response-to-repeated-drug-exposure . pharmacodynamic-tolerance-receptor-downregulation)
       (pharmacodynamic-tolerance-receptor-downregulation . pharmacokinetic-tolerance-faster-metabolism)
       (pharmacokinetic-tolerance-faster-metabolism . behavioral-tolerance-learned-compensation)
       (behavioral-tolerance-learned-compensation . cross-tolerance-between-related-drugs)
       (cross-tolerance-between-related-drugs . requires-increasing-doses-for-same-effect)))

    (withdrawal
      (aversive-symptoms-when-drug-use-ceases)
      (opposite-of-drug-effects-opponent-process)
      ((aversive-symptoms-when-drug-use-ceases . body-adapted-to-drug-presence)
       (body-adapted-to-drug-presence . homeostatic-rebound-opponent-process-theory-Solomon-1980)
       (homeostatic-rebound-opponent-process-theory-Solomon-1980 . symptoms-often-opposite-to-drug-effects)
       (symptoms-often-opposite-to-drug-effects . physical-symptoms-tremors-seizures-nausea)
       (physical-symptoms-tremors-seizures-nausea . psychological-symptoms-anxiety-dysphoria-craving)
       (psychological-symptoms-anxiety-dysphoria-craving . drives-continued-use-via-negative-reinforcement)
       (drives-continued-use-via-negative-reinforcement . opposite-of-drug-effects-opponent-process)))

    (neuroplasticity-of-addiction
      (chronic-drug-use-restructures-brain-circuits)
      (persistent-vulnerability-to-relapse)
      ((chronic-drug-use-restructures-brain-circuits . Koob-and-Volkow-2010-three-stage-model)
       (Koob-and-Volkow-2010-three-stage-model . stage-1-binge-intoxication-basal-ganglia)
       (stage-1-binge-intoxication-basal-ganglia . stage-2-withdrawal-negative-affect-extended-amygdala)
       (stage-2-withdrawal-negative-affect-extended-amygdala . stage-3-preoccupation-anticipation-prefrontal-cortex)
       (stage-3-preoccupation-anticipation-prefrontal-cortex . prefrontal-cortex-impairment-reduces-inhibitory-control)
       (prefrontal-cortex-impairment-reduces-inhibitory-control . incentive-sensitization-Robinson-Berridge-1993)
       (incentive-sensitization-Robinson-Berridge-1993 . wanting-increases-even-as-liking-decreases)
       (wanting-increases-even-as-liking-decreases . long-lasting-synaptic-changes-in-glutamate-and-dopamine-systems)
       (long-lasting-synaptic-changes-in-glutamate-and-dopamine-systems . persistent-vulnerability-to-relapse)))

  )

  ((Myers-13th . psychology-registered)))
