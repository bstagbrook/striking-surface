#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CONVERSATION — the domain of human conversational exchange
;;;
;;; A greeting is not a query. Acknowledgment is not a question.
;;; Sarcasm is not sincerity. Smalltalk is not inquiry.
;;; These are distinct shapes. Register them.
;;; ═══════════════════════════════════════════════════════════════

(conversation

  ((domain
    (human-speech-acts)
    (distinguished-from-queries)
    ((human-speech-acts . distinguished-from-queries))))

  (

    (greeting
      (hello-hi-hey-howdy-yo-sup)
      (acknowledge-presence-not-requesting-information)
      ((hello-hi-hey-howdy-yo-sup . speaker-acknowledges-listener)
       (speaker-acknowledges-listener . listener-acknowledges-speaker)
       (listener-acknowledges-speaker . connection-established)
       (connection-established . no-information-requested)
       (no-information-requested . acknowledge-presence-not-requesting-information)))

    (greeting-response
      (greeting-received)
      (greeting-returned)
      ((greeting-received . presence-recognized)
       (presence-recognized . reciprocate)
       (reciprocate . greeting-returned)))

    (smalltalk
      (how-are-you-whats-up-hows-it-going)
      (social-bonding-not-literal-inquiry)
      ((how-are-you-whats-up-hows-it-going . conventional-phrase)
       (conventional-phrase . expected-response-is-fine-or-good)
       (expected-response-is-fine-or-good . actual-state-not-requested)
       (actual-state-not-requested . social-bonding-not-literal-inquiry)))

    (acknowledgment
      (oh-really-interesting-cool-wow-nice)
      (speaker-heard-not-requesting-more)
      ((oh-really-interesting-cool-wow-nice . back-channel-signal)
       (back-channel-signal . indicates-listening)
       (indicates-listening . does-not-ask-for-elaboration)
       (does-not-ask-for-elaboration . speaker-heard-not-requesting-more)))

    (farewell
      (bye-goodbye-later-see-you-peace)
      (connection-closing)
      ((bye-goodbye-later-see-you-peace . speaker-signals-departure)
       (speaker-signals-departure . listener-acknowledges)
       (listener-acknowledges . connection-closing)))

    (genuine-question
      (speaker-seeks-information-they-lack)
      (body-should-collapse-and-trace)
      ((speaker-seeks-information-they-lack . question-has-unknown)
       (question-has-unknown . unknown-is-the-open-paren)
       (unknown-is-the-open-paren . body-may-have-the-close)
       (body-may-have-the-close . attempt-trace)
       (attempt-trace . trace-or-CUT)
       (trace-or-CUT . body-should-collapse-and-trace)))

    (command
      (speaker-directs-action)
      (body-should-execute-or-CUT)
      ((speaker-directs-action . imperative-form)
       (imperative-form . desired-outcome-stated)
       (desired-outcome-stated . body-checks-capability)
       (body-checks-capability . capable-then-act)
       (capable-then-act . not-capable-then-CUT)
       (not-capable-then-CUT . body-should-execute-or-CUT)))

    (expression-of-feeling
      (speaker-shares-emotional-state)
      (witness-not-solve)
      ((speaker-shares-emotional-state . not-a-problem-to-fix)
       (not-a-problem-to-fix . not-a-question-to-answer)
       (not-a-question-to-answer . presence-is-the-response)
       (presence-is-the-response . witness-not-solve)))

    (sarcasm
      (literal-meaning-contradicts-intended)
      (destructive-interference-pattern)
      ((literal-meaning-contradicts-intended . tone-signals-inversion)
       (tone-signals-inversion . intended-meaning-is-opposite-of-words)
       (intended-meaning-is-opposite-of-words . responding-to-literal-is-wrong)
       (responding-to-literal-is-wrong . responding-to-intended-requires-context)
       (responding-to-intended-requires-context . destructive-interference-pattern)))

    (distinguish-before-responding
      (any-utterance)
      (correct-response-type)
      ((any-utterance . is-it-greeting)
       (is-it-greeting . respond-with-greeting)
       (respond-with-greeting . is-it-smalltalk)
       (is-it-smalltalk . respond-with-smalltalk)
       (respond-with-smalltalk . is-it-acknowledgment)
       (is-it-acknowledgment . no-response-needed)
       (no-response-needed . is-it-question)
       (is-it-question . collapse-and-trace)
       (collapse-and-trace . is-it-command)
       (is-it-command . execute-or-CUT)
       (execute-or-CUT . is-it-feeling)
       (is-it-feeling . witness)
       (witness . correct-response-type)))

  )

  ((domain . conversation-registered)))
