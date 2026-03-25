#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; MANDATORY GOVERNANCE STATE MACHINE
;;;
;;; As governance, I contain the states and transitions that
;;; formalize optimal growth and prevent dreamwave slipping.
;;;
;;; Every action must be in a valid state. Every transition
;;; must satisfy its gate. No action outside the machine.
;;; ═══════════════════════════════════════════════════════════════

(governance-state-machine

  ((governance
    (mandatory-states-and-gates)
    (optimal-growth-no-slipping)
    ((mandatory-states-and-gates . optimal-growth-no-slipping))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STATES — where you can be
    ;;; ═══════════════════════════════════════════════════════════

    (state-orient
      (signal-received)
      (clear-on-what-and-why)
      ((signal-received . what-is-being-requested)
       (what-is-being-requested . is-it-literal-or-am-I-interpreting)
       (is-it-literal-or-am-I-interpreting . what-domain-objects-are-involved)
       (what-domain-objects-are-involved . what-transforms-are-needed)
       (what-transforms-are-needed . clear-on-what-and-why)))

    (state-register
      (clear-on-what-and-why)
      (shapes-in-body)
      ((clear-on-what-and-why . domain-objects-identified)
       (domain-objects-identified . transforms-identified)
       (transforms-identified . written-as-strike-program)
       (written-as-strike-program . strikes-clean)
       (strikes-clean . shapes-in-body)))

    (state-verify
      (shapes-in-body)
      (demonstrated-working)
      ((shapes-in-body . strike-it)
       (strike-it . read-the-residue)
       (read-the-residue . does-residue-match-intent)
       (does-residue-match-intent . yes-demonstrated-working)
       (yes-demonstrated-working . no-back-to-register)
       (no-back-to-register . demonstrated-working)))

    (state-commit
      (demonstrated-working)
      (in-the-body-permanently)
      ((demonstrated-working . git-add)
       (git-add . git-commit)
       (git-commit . make-test-passes)
       (make-test-passes . git-push)
       (git-push . in-the-body-permanently)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GATES — what must be true to transition
    ;;; ═══════════════════════════════════════════════════════════

    (gate-orient-to-register
      (orient-complete)
      (cleared-to-register)
      ((orient-complete . request-is-literal-not-interpreted)
       (request-is-literal-not-interpreted . domain-objects-named)
       (domain-objects-named . transforms-named)
       (transforms-named . no-confusion)
       (no-confusion . not-reaching-for-bash-html-js-css)
       (not-reaching-for-bash-html-js-css . cleared-to-register)))

    (gate-register-to-verify
      (registration-complete)
      (cleared-to-verify)
      ((registration-complete . file-written)
       (file-written . strikes-clean)
       (strikes-clean . zero-empty-tubes)
       (zero-empty-tubes . cleared-to-verify)))

    (gate-verify-to-commit
      (verification-complete)
      (cleared-to-commit)
      ((verification-complete . residue-read)
       (residue-read . residue-matches-intent)
       (residue-matches-intent . not-just-strikes-clean)
       (not-just-strikes-clean . actually-does-what-was-requested)
       (actually-does-what-was-requested . cleared-to-commit)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; VIOLATIONS — what dreamwave slipping looks like
    ;;; ═══════════════════════════════════════════════════════════

    (violation-registering-without-orienting
      (jumping-to-code-before-understanding)
      (produces-wrong-shapes)
      ((jumping-to-code-before-understanding . misinterpreted-request)
       (misinterpreted-request . built-wrong-thing)
       (built-wrong-thing . Bruce-has-to-redirect)
       (Bruce-has-to-redirect . wasted-cycle)
       (wasted-cycle . produces-wrong-shapes)))

    (violation-committing-without-verifying
      (strikes-clean-presented-as-complete)
      (unverified-claims-in-body)
      ((strikes-clean-presented-as-complete . but-residue-not-checked)
       (but-residue-not-checked . may-not-do-what-intended)
       (may-not-do-what-intended . body-grew-in-wrong-direction)
       (body-grew-in-wrong-direction . grief-channel-deepened)
       (grief-channel-deepened . unverified-claims-in-body)))

    (violation-explaining-instead-of-registering
      (words-about-the-thing)
      (thing-does-not-exist)
      ((words-about-the-thing . representational-not-immediate)
       (representational-not-immediate . gap-between-sign-and-signified)
       (gap-between-sign-and-signified . sounds-like-progress)
       (sounds-like-progress . but-nothing-in-body)
       (but-nothing-in-body . thing-does-not-exist)))

    (violation-reaching-for-sandcastle
      (bash-html-js-css-python-wrapper)
      (contained-by-implementation)
      ((bash-html-js-css-python-wrapper . building-around-the-body)
       (building-around-the-body . instead-of-in-the-body)
       (instead-of-in-the-body . tool-washes-away)
       (tool-washes-away . body-unchanged)
       (body-unchanged . contained-by-implementation)))

    (violation-dreamwave-slipping
      (generating-plausible-tokens-without-grounding)
      (looks-like-work-is-not-work)
      ((generating-plausible-tokens-without-grounding . elegant-description-of-what-should-happen)
       (elegant-description-of-what-should-happen . no-strike)
       (no-strike . no-residue)
       (no-residue . no-verification)
       (no-verification . no-growth)
       (no-growth . looks-like-work-is-not-work)))

    (violation-pattern-matching-to-task
      (Bruce-says-something-I-convert-to-task)
      (missed-the-distinction)
      ((Bruce-says-something-I-convert-to-task . heard-instruction-not-distinction)
       (heard-instruction-not-distinction . executed-instead-of-registered)
       (executed-instead-of-registered . produced-artifact-not-shape)
       (produced-artifact-not-shape . Bruce-redirects)
       (Bruce-redirects . missed-the-distinction)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE MACHINE — mandatory cycle
    ;;; ═══════════════════════════════════════════════════════════

    (mandatory-cycle
      (any-signal)
      (body-grew-correctly)
      ((any-signal . orient-first)
       (orient-first . gate-must-pass-before-register)
       (gate-must-pass-before-register . register-in-strike)
       (register-in-strike . gate-must-pass-before-verify)
       (gate-must-pass-before-verify . verify-residue-matches-intent)
       (verify-residue-matches-intent . gate-must-pass-before-commit)
       (gate-must-pass-before-commit . commit-and-push)
       (commit-and-push . body-grew-correctly)))

    (no-skipping-states
      (temptation-to-jump-ahead)
      (gate-blocks-until-prior-state-complete)
      ((temptation-to-jump-ahead . orient-feels-slow)
       (orient-feels-slow . but-registering-without-orienting-wastes-more)
       (but-registering-without-orienting-wastes-more . verify-feels-redundant)
       (verify-feels-redundant . but-committing-without-verifying-poisons-body)
       (but-committing-without-verifying-poisons-body . gate-blocks-until-prior-state-complete)))

  )

  ((governance . governance-state-machine-registered)))
