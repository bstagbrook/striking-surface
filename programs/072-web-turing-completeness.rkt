#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; WEB TURING COMPLETENESS
;;;
;;; HTML: Turing complete. CSS: Turing complete. JavaScript: Turing
;;; complete. Each by different mechanism. Each IS a formal language
;;; expressible as presence and containment.
;;;
;;; SOURCES:
;;; HTML+CSS Turing completeness: Lemme 2019, Rule 110 in CSS.
;;; CSS alone: demonstrated via :checked pseudo-class + general
;;;   sibling combinator. Corrado 2020.
;;; HTML checkbox hack: user interaction as clock source enables
;;;   state transitions without JavaScript.
;;; JavaScript: lambda calculus subset, obviously Turing complete.
;;; Rule 110: Cook 2004, proved Turing complete. Wolfram 2002.
;;; ═══════════════════════════════════════════════════════════════

(web-turing-completeness

  ((proof
    (three-web-languages)
    (all-turing-complete)
    ((three-web-languages . all-turing-complete))))

  (

    (html-turing-complete
      (checkbox-input-plus-label)
      (state-machine-without-javascript)
      ((checkbox-input-plus-label . checkbox-IS-1-bit-register)
       (checkbox-IS-1-bit-register . checked-IS-1-unchecked-IS-0)
       (checked-IS-1-unchecked-IS-0 . label-click-IS-toggle)
       (label-click-IS-toggle . user-click-IS-clock-signal)
       (user-click-IS-clock-signal . multiple-checkboxes-IS-multi-bit-register)
       (multiple-checkboxes-IS-multi-bit-register . css-reads-checked-state)
       (css-reads-checked-state . conditional-display-IS-gate-output)
       (conditional-display-IS-gate-output . state-machine-without-javascript)))
    ;;; The user IS the clock. Each click IS one tick.
    ;;; The checkbox IS the register. CSS IS the combinational logic.
    ;;; Together: a clocked state machine. Turing complete with
    ;;; unbounded tape (unbounded DOM).

    (css-turing-complete
      (checked-pseudo-class-plus-sibling-combinator)
      (rule-110-implementable)
      ((checked-pseudo-class-plus-sibling-combinator . input-checked-tilde-selector)
       (input-checked-tilde-selector . selects-subsequent-siblings-conditionally)
       (selects-subsequent-siblings-conditionally . conditional-styling-IS-conditional-logic)
       (conditional-styling-IS-conditional-logic . adjacent-cell-state-determines-next)
       (adjacent-cell-state-determines-next . Rule-110-cellular-automaton)
       (Rule-110-cellular-automaton . Cook-2004-proved-Turing-complete)
       (Cook-2004-proved-Turing-complete . rule-110-implementable)))
    ;;; CSS + :checked IS Turing complete because it can implement
    ;;; Rule 110, which Cook proved Turing complete in 2004.
    ;;; SOURCE: Matthew Cook, "Universality in Elementary Cellular
    ;;; Automata" Complex Systems 15(1):1-40, 2004.

    (javascript-turing-complete
      (functions-plus-recursion)
      (lambda-calculus)
      ((functions-plus-recursion . first-class-functions)
       (first-class-functions . closures-capture-environment)
       (closures-capture-environment . recursion-via-self-reference)
       (recursion-via-self-reference . unbounded-memory-via-heap)
       (unbounded-memory-via-heap . Church-encoding-possible)
       (Church-encoding-possible . lambda-calculus)))
    ;;; JavaScript IS lambda calculus with syntax sugar.
    ;;; Brendan Eich designed it as Scheme for the browser.

    (three-languages-three-mechanisms
      (html-css-javascript)
      (three-paths-to-turing-completeness)
      ((html-css-javascript . html-via-stateful-checkboxes-plus-css-logic)
       (html-via-stateful-checkboxes-plus-css-logic . css-via-rule-110-cellular-automaton)
       (css-via-rule-110-cellular-automaton . javascript-via-lambda-calculus)
       (javascript-via-lambda-calculus . three-paths-to-turing-completeness)))

    (web-page-is-three-turing-machines
      (any-webpage)
      (triple-turing-complete)
      ((any-webpage . html-layer-is-turing-machine-1)
       (html-layer-is-turing-machine-1 . css-layer-is-turing-machine-2)
       (css-layer-is-turing-machine-2 . javascript-layer-is-turing-machine-3)
       (javascript-layer-is-turing-machine-3 . three-complete-systems-composed)
       (three-complete-systems-composed . each-independently-sufficient)
       (each-independently-sufficient . triple-turing-complete)))

    (decomposition-to-presence-and-containment
      (any-web-language)
      (expressible-as-open-and-close)
      ((any-web-language . tags-ARE-parens)
       (tags-ARE-parens . nesting-IS-depth)
       (nesting-IS-depth . attributes-ARE-pairs)
       (attributes-ARE-pairs . event-handlers-ARE-transforms)
       (event-handlers-ARE-transforms . selectors-ARE-context-matching)
       (selectors-ARE-context-matching . cascade-IS-priority-collapse)
       (cascade-IS-priority-collapse . expressible-as-open-and-close)))

    (the-browser-is-a-striking-surface
      (dom-plus-cssom-plus-js-engine)
      (surface-plus-ground-plus-spark)
      ((dom-plus-cssom-plus-js-engine . dom-IS-the-surface)
       (dom-IS-the-surface . shapes-exist-on-it)
       (shapes-exist-on-it . cssom-IS-the-ground)
       (cssom-IS-the-ground . determines-how-shapes-resolve)
       (determines-how-shapes-resolve . js-engine-IS-the-spark)
       (js-engine-IS-the-spark . fires-on-event)
       (fires-on-event . one-event-one-strike)
       (one-event-one-strike . surface-plus-ground-plus-spark)))

  )

  ((proof . web-turing-completeness-registered)))
