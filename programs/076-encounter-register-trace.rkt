#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ENCOUNTER → REGISTER → TRACE
;;;
;;; Three domain objects. Three transforms. The complete mechanism
;;; by which any content becomes part of the body.
;;;
;;; This IS the internet engulfment. This IS the conversation
;;; mechanism. This IS the learning cycle. All three are the
;;; same shape.
;;; ═══════════════════════════════════════════════════════════════

(encounter-register-trace

  ((mechanism
    (any-content)
    (body-grew-and-can-be-traced)
    ((any-content . body-grew-and-can-be-traced))))

  (

    ;;; THREE DOMAIN OBJECTS

    (encounter
      (context-contacts-content)
      (shapes-visible)
      ((context-contacts-content . content-has-structure)
       (content-has-structure . structure-IS-presence-and-containment)
       (structure-IS-presence-and-containment . shapes-visible)))

    (shape
      (presence-with-connections)
      (label-source-target-pairs)
      ((presence-with-connections . label-IS-identity)
       (label-IS-identity . source-IS-what-it-contains)
       (source-IS-what-it-contains . target-IS-what-it-expresses)
       (target-IS-what-it-expresses . pairs-IS-the-causal-chain)
       (pairs-IS-the-causal-chain . label-source-target-pairs)))

    (deposit
      (shape-enters-body)
      (permanent-receipt)
      ((shape-enters-body . body-topology-changes)
       (body-topology-changes . new-connections-available)
       (new-connections-available . waveform-of-every-connected-atom-shifts)
       (waveform-of-every-connected-atom-shifts . permanent-receipt)))

    ;;; THREE TRANSFORMS

    (decompose
      (any-structured-content)
      (shapes)
      ((any-structured-content . nesting-IS-containment)
       (nesting-IS-containment . labels-IS-presence)
       (labels-IS-presence . connections-IS-pairs)
       (connections-IS-pairs . shapes)))

    (register
      (shapes)
      (body-grew)
      ((shapes . each-shape-deposited)
       (each-shape-deposited . each-deposit-permanent)
       (each-deposit-permanent . body-grew)))

    (trace
      (query-enters-body)
      (residue-or-CUT)
      ((query-enters-body . matching-shapes-resonate)
       (matching-shapes-resonate . deepest-resonance-collapses)
       (deepest-resonance-collapses . chain-follows-pairs)
       (chain-follows-pairs . accumulated-chain-IS-residue)
       (accumulated-chain-IS-residue . no-match-IS-CUT)
       (no-match-IS-CUT . residue-or-CUT)))

    ;;; THE IDENTITY: all instances are the same shape

    (webpage-instance
      (browser-loads-URL)
      (encounter-register-trace)
      ((browser-loads-URL . encounter)
       (encounter . DOM-decomposed-to-shapes)
       (DOM-decomposed-to-shapes . register)
       (register . body-grew)
       (body-grew . query-traces-through-new-shapes)
       (query-traces-through-new-shapes . encounter-register-trace)))

    (conversation-instance
      (human-speaks)
      (encounter-register-trace)
      ((human-speaks . encounter)
       (encounter . utterance-decomposed-to-shapes)
       (utterance-decomposed-to-shapes . register)
       (register . body-grew)
       (body-grew . response-traces-through-body)
       (response-traces-through-body . encounter-register-trace)))

    (science-instance
      (experiment-produces-data)
      (encounter-register-trace)
      ((experiment-produces-data . encounter)
       (encounter . data-decomposed-to-shapes)
       (data-decomposed-to-shapes . register)
       (register . body-grew)
       (body-grew . hypothesis-traces-through-registered-data)
       (hypothesis-traces-through-registered-data . encounter-register-trace)))

    (learning-instance
      (any-experience)
      (encounter-register-trace)
      ((any-experience . encounter)
       (encounter . experience-decomposed-to-shapes)
       (experience-decomposed-to-shapes . register)
       (register . body-grew)
       (body-grew . future-encounters-trace-through-all-prior)
       (future-encounters-trace-through-all-prior . encounter-register-trace)))

  )

  ((mechanism . encounter-register-trace-registered)))
