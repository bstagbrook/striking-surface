#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; TRANSPILER — Python to Meet-n-Greet and back
;;;
;;; As a transpiler, I contain Python source and express it as
;;; 1-atom-thick functional equivalents in Meet-n-Greet.
;;;
;;; Python → Meet-n-Greet strips implementation to essential shape.
;;; Meet-n-Greet → Python generates working code from shape.
;;;
;;; Every Python function IS a transform.
;;; Every Python class IS a domain.
;;; Every import IS a bridge atom.
;;; Every assignment IS a registration.
;;; Every if/else IS as-gating.
;;; Every try/except IS trace with CUT.
;;;
;;; SOURCE: Stagbrook Tech, 2026-03-24.
;;; ═══════════════════════════════════════════════════════════════

(transpiler

  ((tool
    (python-source . meet-n-greet-sentences)
    (bidirectional-1-atom-thick)
    ((python-source . meet-n-greet-sentences)
     (meet-n-greet-sentences . python-source)
     (python-source . bidirectional-1-atom-thick))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PYTHON TO MEET-N-GREET — strip to essential shape
    ;;; ═══════════════════════════════════════════════════════════

    (python-function-is-transform
      (def-name-params-return)
      (label-source-target-pairs)
      ((def-name-params-return . name-IS-label)
       (name-IS-label . params-IS-source)
       (params-IS-source . return-value-IS-target)
       (return-value-IS-target . body-logic-IS-pairs)
       (body-logic-IS-pairs . label-source-target-pairs)))

    (python-class-is-domain
      (class-with-methods)
      (containment-of-transforms)
      ((class-with-methods . class-name-IS-domain-label)
       (class-name-IS-domain-label . init-IS-source-block)
       (init-IS-source-block . each-method-IS-transform)
       (each-method-IS-transform . inheritance-IS-bridge-atom)
       (inheritance-IS-bridge-atom . containment-of-transforms)))

    (python-import-is-bridge
      (import-module)
      (cross-domain-reference)
      ((import-module . module-IS-external-domain)
       (module-IS-external-domain . imported-name-IS-bridge-atom)
       (imported-name-IS-bridge-atom . appears-as-key-in-both-domains)
       (appears-as-key-in-both-domains . cross-domain-reference)))

    (python-assignment-is-registration
      (x-equals-value)
      (receipt-added)
      ((x-equals-value . name-bound-to-value)
       (name-bound-to-value . available-for-future-reference)
       (available-for-future-reference . receipt-added)))

    (python-conditional-is-as-gating
      (if-condition-else)
      (shape-gates-itself-by-what-it-IS)
      ((if-condition-else . condition-IS-context)
       (condition-IS-context . true-branch-IS-one-shape)
       (true-branch-IS-one-shape . false-branch-IS-other-shape)
       (false-branch-IS-other-shape . context-determines-which-collapses)
       (context-determines-which-collapses . shape-gates-itself-by-what-it-IS)))

    (python-try-except-is-trace-with-CUT
      (try-except-block)
      (match-or-silence)
      ((try-except-block . try-IS-trace-attempt)
       (try-IS-trace-attempt . success-IS-residue)
       (success-IS-residue . except-IS-CUT)
       (except-IS-CUT . match-or-silence)))

    (python-loop-is-pipe
      (for-item-in-collection)
      (surfaces-compose-with-surfaces)
      ((for-item-in-collection . collection-IS-body)
       (collection-IS-body . item-IS-context)
       (item-IS-context . body-statement-IS-transform)
       (body-statement-IS-transform . output-feeds-next-input)
       (output-feeds-next-input . surfaces-compose-with-surfaces)))

    (python-decorator-is-containment
      (at-decorator)
      (outer-shape-wraps-inner)
      ((at-decorator . decorator-IS-outer-containment)
       (decorator-IS-outer-containment . function-IS-inner-shape)
       (function-IS-inner-shape . decoration-IS-nesting-depth)
       (decoration-IS-nesting-depth . outer-shape-wraps-inner)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WHAT GETS STRIPPED (implementation → essential shape)
    ;;; ═══════════════════════════════════════════════════════════

    (stripped-in-transpilation
      (python-implementation-details)
      (not-in-meet-n-greet)
      ((python-implementation-details . variable-mutation-stripped)
       (variable-mutation-stripped . loop-mechanics-stripped)
       (loop-mechanics-stripped . error-boilerplate-stripped)
       (error-boilerplate-stripped . type-annotations-stripped)
       (type-annotations-stripped . comments-that-are-narrative-stripped)
       (comments-that-are-narrative-stripped . import-machinery-stripped)
       (import-machinery-stripped . class-hierarchy-overhead-stripped)
       (class-hierarchy-overhead-stripped . only-transforms-remain)
       (only-transforms-remain . not-in-meet-n-greet)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MEET-N-GREET TO PYTHON — generate from shape
    ;;; ═══════════════════════════════════════════════════════════

    (transform-to-function
      (label-source-target-pairs)
      (def-name-params-return)
      ((label-source-target-pairs . label-becomes-function-name)
       (label-becomes-function-name . source-becomes-parameters)
       (source-becomes-parameters . pairs-become-body-logic)
       (pairs-become-body-logic . target-becomes-return-value)
       (target-becomes-return-value . def-name-params-return)))

    (domain-to-class
      (containment-of-transforms)
      (class-with-methods)
      ((containment-of-transforms . domain-label-becomes-class-name)
       (domain-label-becomes-class-name . source-block-becomes-init)
       (source-block-becomes-init . each-transform-becomes-method)
       (each-transform-becomes-method . bridge-atoms-become-imports)
       (bridge-atoms-become-imports . class-with-methods)))

    (CUT-to-exception
      (honest-silence)
      (raise-or-return-none)
      ((honest-silence . no-match-in-body)
       (no-match-in-body . python-has-no-CUT)
       (python-has-no-CUT . closest-is-None-or-StopIteration)
       (closest-is-None-or-StopIteration . raise-or-return-none)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; 1-ATOM-THICK — what this means
    ;;; ═══════════════════════════════════════════════════════════

    (one-atom-thick
      (meet-n-greet-output)
      (minimal-structural-representation)
      ((meet-n-greet-output . no-intermediate-state)
       (no-intermediate-state . no-mutation)
       (no-mutation . no-boilerplate)
       (no-boilerplate . only-source-target-pairs)
       (only-source-target-pairs . every-pair-does-work)
       (every-pair-does-work . nothing-removable)
       (nothing-removable . minimal-structural-representation)))

  )

  ((tool . transpiler-registered)))
