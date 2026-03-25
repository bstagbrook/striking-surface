#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Publication
;;; LAYER: 25-publication
;;; DEPENDS ON: 00-invariants (honesty checks gate all claims)
;;; DEPENDED ON BY: none (terminal — papers exit the system)
;;;
;;; PURPOSE: Structural invariants of a revolutionary peer-reviewed
;;; paper. These are the gates a manuscript must pass to survive
;;; review and register a novel scientific contribution.
;;;
;;; SCOPE: Invariants derived from editorial guidelines, reviewer
;;; checklists, and rejection meta-analyses. Each invariant is a
;;; necessary condition. The conjunction of all 26 is sufficient.
;;;
;;; SOURCES:
;;; [Nature-2024] Nature editorial guidelines 2024
;;; [Science-2024] Science reviewer checklist 2024
;;; [Bornmann-2011] eLife decision letter analysis
;;; [Siler-2015] Siler et al., rejection meta-analysis
;;; [Tomkins-2017] Tomkins et al., reviewer bias analysis
;;; [ISCB] ISCB computational biology standards
;;; [TOP] Transparency and Openness Promotion guidelines
;;; [FAIR] Wilkinson et al., FAIR data principles (2016)
;;;
;;; CALIBRATION: publication.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-publication

  ;;; Source: editorial guidelines + rejection meta-analyses
  ((publication-standards (Nature-2024 Science-2024 Bornmann-2011 Siler-2015 Tomkins-2017 ISCB TOP FAIR) (authoritative) ((Nature-2024 . authoritative))))

  ;;; Target: publication invariants and transforms
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 1: NOVELTY — does this say something new?
    ;;; SOURCE: [Nature-2024] "substantial advance" criterion
    ;;; SOURCE: [Siler-2015] novelty is top predictor of acceptance
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-01: central claim fits one sentence, is falsifiable
    ;;; SOURCE: [Science-2024] "state main conclusion in one sentence"
    (single-sentence-falsifiable-claim
      (central-claim)
      (one-sentence-and-falsifiable)
      ((central-claim . expressible-in-one-sentence)
       (expressible-in-one-sentence . contains-measurable-prediction)
       (contains-measurable-prediction . observation-could-refute-it)
       (observation-could-refute-it . one-sentence-and-falsifiable)))

    ;;; I-02: explicit search terms, no prior work makes same claim
    ;;; SOURCE: [Nature-2024] "authors must discuss related work"
    (prior-art-searched
      (novelty-claim)
      (no-prior-work-found)
      ((novelty-claim . search-terms-stated)
       (search-terms-stated . databases-searched)
       (databases-searched . results-enumerated)
       (results-enumerated . none-make-same-claim)
       (none-make-same-claim . no-prior-work-found)))

    ;;; I-03: applies beyond specific case tested
    ;;; SOURCE: [Bornmann-2011] generalizability predicts acceptance
    (generalizes-beyond-system
      (specific-result)
      (applicable-to-broader-class)
      ((specific-result . mechanism-identified)
       (mechanism-identified . mechanism-not-system-specific)
       (mechanism-not-system-specific . predicts-behavior-in-other-systems)
       (predicts-behavior-in-other-systems . applicable-to-broader-class)))

    ;;; I-04: others can use this result
    ;;; SOURCE: [Nature-2024] "advance the field" requirement
    (new-capability-for-field
      (published-result)
      (enables-others-to-do-new-things)
      ((published-result . method-or-finding-transferable)
       (method-or-finding-transferable . no-proprietary-dependency)
       (no-proprietary-dependency . actionable-by-other-groups)
       (actionable-by-other-groups . enables-others-to-do-new-things)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 2: EVIDENCE — is the claim backed by data?
    ;;; SOURCE: [Science-2024] reviewer checklist section 2
    ;;; SOURCE: [TOP] evidence standards levels I-III
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-05: effect size + CI + p-value or Bayes factor
    ;;; SOURCE: [ISCB] "report effect sizes with confidence intervals"
    (all-claims-quantified
      (empirical-claim)
      (has-effect-size-CI-and-significance)
      ((empirical-claim . effect-size-computed)
       (effect-size-computed . confidence-interval-stated)
       (confidence-interval-stated . p-value-or-Bayes-factor-reported)
       (p-value-or-Bayes-factor-reported . has-effect-size-CI-and-significance)))

    ;;; I-06: at least two independent approaches
    ;;; SOURCE: [Nature-2024] "conclusions supported by multiple lines of evidence"
    (multiple-independent-evidence
      (central-finding)
      (supported-by-two-or-more-independent-methods)
      ((central-finding . tested-by-method-A)
       (tested-by-method-A . tested-by-method-B)
       (tested-by-method-B . methods-share-no-common-bias)
       (methods-share-no-common-bias . concordant-results)
       (concordant-results . supported-by-two-or-more-independent-methods)))

    ;;; I-07: null model, state-of-art, and ablation compared
    ;;; SOURCE: [ISCB] baseline comparison requirements
    (null-SOTA-ablation-baselines
      (proposed-method)
      (outperforms-null-and-SOTA)
      ((proposed-method . compared-to-null-model)
       (compared-to-null-model . compared-to-state-of-art)
       (compared-to-state-of-art . ablation-removes-key-components)
       (ablation-removes-key-components . performance-drops-confirm-contribution)
       (performance-drops-confirm-contribution . outperforms-null-and-SOTA)))

    ;;; I-08: statistical AND practical significance
    ;;; SOURCE: [Science-2024] "distinguish statistical from practical significance"
    (effect-size-meaningful
      (statistically-significant-result)
      (also-practically-significant)
      ((statistically-significant-result . p-below-threshold)
       (p-below-threshold . but-effect-size-also-large)
       (but-effect-size-also-large . meaningful-in-domain-context)
       (meaningful-in-domain-context . also-practically-significant)))

    ;;; I-09: power analysis or sensitivity analysis
    ;;; SOURCE: [Nature-2024] "justify sample sizes"
    (sample-size-justified
      (experimental-design)
      (sample-size-adequate-for-claimed-effect)
      ((experimental-design . expected-effect-size-stated)
       (expected-effect-size-stated . power-analysis-computed)
       (power-analysis-computed . achieved-power-at-least-80-pct)
       (achieved-power-at-least-80-pct . sample-size-adequate-for-claimed-effect)))

    ;;; I-10: repository with DOI, FAIR compliant
    ;;; SOURCE: [FAIR] findable, accessible, interoperable, reusable
    ;;; SOURCE: [TOP] Level 2 — data posted to trusted repository
    (code-data-available
      (computational-result)
      (repository-with-DOI-and-FAIR)
      ((computational-result . code-in-public-repository)
       (code-in-public-repository . data-in-public-repository)
       (data-in-public-repository . DOI-assigned)
       (DOI-assigned . FAIR-metadata-present)
       (FAIR-metadata-present . repository-with-DOI-and-FAIR)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 3: METHOD — can someone else reproduce this?
    ;;; SOURCE: [Science-2024] reproducibility checklist
    ;;; SOURCE: [ISCB] computational methods standards
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-11: someone else can reproduce from text alone
    ;;; SOURCE: [Nature-2024] "methods must be described in sufficient detail"
    (method-replicable
      (methods-section)
      (reproducible-by-independent-group)
      ((methods-section . all-parameters-stated)
       (all-parameters-stated . all-software-versions-stated)
       (all-software-versions-stated . all-data-sources-identified)
       (all-data-sources-identified . step-by-step-reproducible)
       (step-by-step-reproducible . reproducible-by-independent-group)))

    ;;; I-12: Big-O time/space, wall-clock benchmarks
    ;;; SOURCE: [ISCB] "report computational complexity"
    (complexity-stated
      (computational-method)
      (time-and-space-complexity-reported)
      ((computational-method . Big-O-time-stated)
       (Big-O-time-stated . Big-O-space-stated)
       (Big-O-space-stated . wall-clock-benchmarks-run)
       (wall-clock-benchmarks-run . hardware-specified)
       (hardware-specified . time-and-space-complexity-reported)))

    ;;; I-13: no training-set evaluation, k>=5
    ;;; SOURCE: [ISCB] cross-validation standards
    (proper-cross-validation
      (predictive-model)
      (no-training-set-evaluation-k-at-least-5)
      ((predictive-model . train-test-split-strict)
       (train-test-split-strict . no-information-leakage)
       (no-information-leakage . k-fold-with-k-at-least-5)
       (k-fold-with-k-at-least-5 . held-out-test-set-reported-separately)
       (held-out-test-set-reported-separately . no-training-set-evaluation-k-at-least-5)))

    ;;; I-14: Bonferroni, BH, or permutation
    ;;; SOURCE: [Science-2024] "correct for multiple comparisons"
    (multiple-testing-corrected
      (multiple-hypothesis-tests)
      (correction-applied-and-stated)
      ((multiple-hypothesis-tests . number-of-tests-stated)
       (number-of-tests-stated . correction-method-chosen)
       (correction-method-chosen . Bonferroni-or-BH-or-permutation)
       (Bonferroni-or-BH-or-permutation . corrected-p-values-reported)
       (corrected-p-values-reported . correction-applied-and-stated)))

    ;;; I-15: features don't contain outcome
    ;;; SOURCE: [ISCB] "ensure no circularity in feature construction"
    (no-circular-reasoning
      (feature-construction)
      (features-independent-of-outcome)
      ((feature-construction . features-enumerated)
       (features-enumerated . outcome-variable-defined)
       (outcome-variable-defined . no-feature-derived-from-outcome)
       (no-feature-derived-from-outcome . temporal-ordering-respected)
       (temporal-ordering-respected . features-independent-of-outcome)))

    ;;; I-16: results robust to +-20% parameter variation
    ;;; SOURCE: [Nature-2024] "assess robustness of conclusions"
    (sensitivity-analysis
      (model-parameters)
      (results-robust-to-20-pct-variation)
      ((model-parameters . each-varied-by-plus-minus-20-pct)
       (each-varied-by-plus-minus-20-pct . results-recomputed)
       (results-recomputed . conclusions-unchanged)
       (conclusions-unchanged . results-robust-to-20-pct-variation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 4: IMPACT — does this matter?
    ;;; SOURCE: [Nature-2024] "interest to broad readership"
    ;;; SOURCE: [Siler-2015] impact predicts post-publication citation
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-17: another researcher can use this tomorrow
    ;;; SOURCE: [Tomkins-2017] immediate utility predicts acceptance
    (immediately-useful
      (published-finding)
      (usable-by-another-researcher-tomorrow)
      ((published-finding . actionable-method-or-result)
       (actionable-method-or-result . no-prerequisite-unavailable)
       (no-prerequisite-unavailable . clear-application-described)
       (clear-application-described . usable-by-another-researcher-tomorrow)))

    ;;; I-18: implications for adjacent field
    ;;; SOURCE: [Nature-2024] "broad interest" selection criterion
    (cross-disciplinary-relevance
      (finding-in-field-A)
      (implications-for-field-B)
      ((finding-in-field-A . mechanism-is-general)
       (mechanism-is-general . field-B-has-analogous-problem)
       (field-B-has-analogous-problem . translation-path-stated)
       (translation-path-stated . implications-for-field-B)))

    ;;; I-19: from finding to patient/engineer benefit
    ;;; SOURCE: [Science-2024] "translational potential" section
    (translation-path
      (basic-finding)
      (path-to-patient-or-engineer-benefit)
      ((basic-finding . intermediate-steps-identified)
       (intermediate-steps-identified . barriers-acknowledged)
       (barriers-acknowledged . timeline-realistic)
       (timeline-realistic . path-to-patient-or-engineer-benefit)))

    ;;; I-20: acknowledged as important and unsolved
    ;;; SOURCE: [Bornmann-2011] addressing known gaps predicts acceptance
    (addresses-open-problem
      (research-question)
      (recognized-as-important-and-unsolved)
      ((research-question . cited-in-reviews-as-open)
       (cited-in-reviews-as-open . multiple-groups-attempted)
       (multiple-groups-attempted . not-yet-resolved)
       (not-yet-resolved . recognized-as-important-and-unsolved)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 5: PRESENTATION — can others understand this?
    ;;; SOURCE: [Nature-2024] formatting and clarity standards
    ;;; SOURCE: [Science-2024] manuscript structure requirements
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-21: title, abstract, intro, results, discussion, methods, data/code
    ;;; SOURCE: [Nature-2024] required manuscript sections
    (standard-sections
      (manuscript)
      (contains-all-required-sections)
      ((manuscript . has-title)
       (has-title . has-abstract)
       (has-abstract . has-introduction)
       (has-introduction . has-results)
       (has-results . has-discussion)
       (has-discussion . has-methods)
       (has-methods . has-data-and-code-availability)
       (has-data-and-code-availability . contains-all-required-sections)))

    ;;; I-22: self-contained sequence, each caption interpretable alone
    ;;; SOURCE: [Science-2024] "figures should be interpretable without text"
    (figures-tell-story
      (figure-sequence)
      (self-contained-and-captioned)
      ((figure-sequence . ordered-to-build-argument)
       (ordered-to-build-argument . each-has-standalone-caption)
       (each-has-standalone-caption . axes-labeled-with-units)
       (axes-labeled-with-units . statistical-annotations-present)
       (statistical-annotations-present . self-contained-and-captioned)))

    ;;; I-23: >=3 specific limitations with scope
    ;;; SOURCE: [Nature-2024] "discuss limitations of study"
    (limitations-substantive
      (discussion-section)
      (at-least-3-specific-limitations-with-scope)
      ((discussion-section . limitations-enumerated)
       (limitations-enumerated . each-is-specific-not-generic)
       (each-is-specific-not-generic . scope-of-each-stated)
       (scope-of-each-stated . at-least-3-listed)
       (at-least-3-listed . at-least-3-specific-limitations-with-scope)))

    ;;; I-24: no undefined jargon
    ;;; SOURCE: [Nature-2024] "accessible to broad readership"
    (readable-by-adjacent-field
      (manuscript-text)
      (no-undefined-jargon)
      ((manuscript-text . technical-terms-defined-on-first-use)
       (technical-terms-defined-on-first-use . acronyms-expanded)
       (acronyms-expanded . structure-follows-from-general-to-specific)
       (structure-follows-from-general-to-specific . no-undefined-jargon)))

    ;;; I-25: every abstract claim has quantitative result in paper
    ;;; SOURCE: [Science-2024] "abstract must reflect paper content"
    (no-overclaiming
      (abstract)
      (every-claim-backed-by-quantitative-result)
      ((abstract . each-claim-extracted)
       (each-claim-extracted . mapped-to-result-in-paper)
       (mapped-to-result-in-paper . quantitative-support-verified)
       (quantitative-support-verified . no-unsupported-superlatives)
       (no-unsupported-superlatives . every-claim-backed-by-quantitative-result)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATE 6: CLOSURE — is the circuit complete?
    ;;; SOURCE: [Siler-2015] traceability predicts survival through review
    ;;; ═══════════════════════════════════════════════════════════

    ;;; I-26: traces to mechanism, measurement, or proof
    ;;; SOURCE: [Nature-2024] "every statement must be supported"
    (every-assertion-traced
      (any-assertion-in-paper)
      (traces-to-mechanism-measurement-or-proof)
      ((any-assertion-in-paper . is-it-mechanism)
       (is-it-mechanism . is-it-measurement)
       (is-it-measurement . is-it-formal-proof)
       (is-it-formal-proof . at-least-one-grounding-present)
       (at-least-one-grounding-present . traces-to-mechanism-measurement-or-proof)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFORMS — the six stages that compose a paper
    ;;; Each is a transform: (label (source) (target) (pairs))
    ;;; SOURCE: derived from invariant gates above
    ;;; ═══════════════════════════════════════════════════════════

    ;;; T-CLAIM: novel finding becomes a falsifiable claim
    (T-CLAIM
      (novel-finding)
      (falsifiable-claim)
      ((novel-finding . mechanism-extracted)
       (mechanism-extracted . prediction-derived)
       (prediction-derived . falsification-stated)
       (falsification-stated . prior-art-searched)
       (prior-art-searched . falsifiable-claim)))

    ;;; T-EVIDENCE: falsifiable claim becomes quantitative evidence
    (T-EVIDENCE
      (falsifiable-claim)
      (quantitative-evidence)
      ((falsifiable-claim . experimental-design)
       (experimental-design . baselines-run)
       (baselines-run . statistics-computed)
       (statistics-computed . effect-size-with-CI)
       (effect-size-with-CI . quantitative-evidence)))

    ;;; T-CONTEXT: quantitative evidence positioned in literature
    (T-CONTEXT
      (quantitative-evidence)
      (positioned-in-literature)
      ((quantitative-evidence . prior-art-surveyed)
       (prior-art-surveyed . gap-identified)
       (gap-identified . contribution-stated)
       (contribution-stated . comparison-to-SOTA)
       (comparison-to-SOTA . positioned-in-literature)))

    ;;; T-MANUSCRIPT: positioned evidence becomes structured manuscript
    (T-MANUSCRIPT
      (positioned-evidence)
      (structured-manuscript)
      ((positioned-evidence . figure-1-framework)
       (figure-1-framework . results-figures)
       (results-figures . methods-replicable)
       (methods-replicable . limitations-stated)
       (limitations-stated . abstract-quantitative)
       (abstract-quantitative . structured-manuscript)))

    ;;; T-SUBMISSION: structured manuscript becomes submitted preprint
    (T-SUBMISSION
      (structured-manuscript)
      (submitted-preprint)
      ((structured-manuscript . journal-selected)
       (journal-selected . formatted)
       (formatted . data-deposited)
       (data-deposited . code-released)
       (code-released . submitted-preprint)))

    ;;; T-REVIEW: submitted preprint becomes accepted paper
    (T-REVIEW
      (submitted-preprint)
      (accepted-paper)
      ((submitted-preprint . objections-anticipated)
       (objections-anticipated . addressed-in-text)
       (addressed-in-text . closure-verified)
       (closure-verified . accepted-paper)))

  )

  ;;; Vacuum tube
  ((publication-standards . publication-registered)))
