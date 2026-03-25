#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; HONESTY INVARIANTS — claims that must hold across all work
;;; LAYER: 00-invariants
;;;
;;; These are the structural constraints on what we can claim.
;;; If a claim violates an invariant, the claim is withdrawn.
;;; The invariants ARE the red team. They run on every strike.
;;; ═══════════════════════════════════════════════════════════════

(honesty-invariants

  ((integrity (structural-honesty) (enforced) ((structural-honesty . enforced))))

  (

    (identity-requires-mechanism
      (claim-A-IS-B)
      (must-cite-shared-causal-mechanism)
      ((claim-A-IS-B . not-A-resembles-B)
       (not-A-resembles-B . not-A-shares-pattern-with-B)
       (not-A-shares-pattern-with-B . A-and-B-share-causal-mechanism)
       (A-and-B-share-causal-mechanism . mechanism-is-cited)
       (mechanism-is-cited . must-cite-shared-causal-mechanism)))

    (O1-claim-requires-body-cost
      (claim-O-1-resolution)
      (must-account-for-body-construction-cost)
      ((claim-O-1-resolution . true-for-query-time)
       (true-for-query-time . but-body-must-exist-first)
       (but-body-must-exist-first . registration-has-cost)
       (registration-has-cost . total-cost-is-registration-plus-query)
       (total-cost-is-registration-plus-query . must-account-for-body-construction-cost)))

    (superset-claim-requires-proof
      (claim-ASF-superset-of-X)
      (must-prove-compositional-power-exceeds-X)
      ((claim-ASF-superset-of-X . requires-formal-characterization)
       (requires-formal-characterization . what-can-composition-solve)
       (what-can-composition-solve . that-X-cannot)
       (that-X-cannot . if-nothing-then-complementary-not-superset)
       (if-nothing-then-complementary-not-superset . must-prove-compositional-power-exceeds-X)))

    (spec-is-program-substrate-is-interpreter
      (claim-spec-IS-impl)
      (must-acknowledge-substrate)
      ((claim-spec-IS-impl . spec-is-the-complete-program)
       (spec-is-the-complete-program . but-needs-grounded-frame)
       (but-needs-grounded-frame . frame-is-the-interpreter)
       (frame-is-the-interpreter . must-acknowledge-substrate)))

    (novel-claim-needs-prior-art-search
      (claim-this-is-novel)
      (must-show-no-prior-work)
      ((claim-this-is-novel . search-was-conducted)
       (search-was-conducted . these-terms-were-searched)
       (these-terms-were-searched . no-prior-work-found-matching)
       (no-prior-work-found-matching . must-show-no-prior-work)))

    (statistical-claim-needs-power
      (claim-X-differs-from-Y)
      (must-have-adequate-sample-size)
      ((claim-X-differs-from-Y . p-value-is-stated)
       (p-value-is-stated . sample-size-is-stated)
       (sample-size-is-stated . minimum-detectable-effect-is-stated)
       (minimum-detectable-effect-is-stated . must-have-adequate-sample-size)))

    (grounded-vs-narrative
      (pair-in-parentheses)
      (must-contain-causal-mechanism)
      ((pair-in-parentheses . does-A-cause-B)
       (does-A-cause-B . by-what-mechanism)
       (by-what-mechanism . mechanism-is-in-the-pair)
       (mechanism-is-in-the-pair . or-move-to-comments)
       (or-move-to-comments . must-contain-causal-mechanism)))

  )

  ((integrity . honesty-invariants-enforced)))
