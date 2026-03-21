#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NATURAL NUMBERS — STRUCTURAL INVESTIGATION
;;;
;;; FINDING: Structural nesting () (()) ((())) CANNOT serve as
;;; dotted pair keys in Racket because:
;;;   (() . (()))  is read as the list (() ())  — not a dotted pair
;;;   () is null in Racket, and (null . X) = a list starting with ()
;;;
;;; The trace function filters out proper lists from the pair set,
;;; so structural-nesting pairs get excluded.
;;;
;;; CONCLUSION: Labels for numbers are not laziness — they are a
;;; substrate constraint. The label "3" is the alpha-normalized
;;; name for the structural shape (((()))). The structure IS the
;;; number. The label enables the pair mechanism on this substrate.
;;;
;;; On a different substrate (hardware, custom reader), structural
;;; nesting could serve directly as keys. The limitation is
;;; Racket's reader, not ASF.
;;;
;;; VERIFIED: tested directly — (() . (())) reads as (() ()),
;;; which is pair? #t AND list? #t, filtered out by trace.
;;; ═══════════════════════════════════════════════════════════════

;;; This test confirms the substrate constraint:
;;; source (()) resolves, but pair (() . (())) is filtered out
(substrate-constraint-test
  (())
  ((()))
  ((() . (()))))
