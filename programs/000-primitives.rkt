#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; THE THREE PRIMITIVES — TAUTOLOGICAL STRIKE TABLE
;;;
;;; Alphabet: ( )
;;; Presence:       ( )         — is-thing
;;; Containment:    (( ))       — has-thing
;;; Transformation: (  (()) (()) (())  ) — three containments
;;;
;;; This strike table defines itself. The shape IS the definition.
;;; expected-empty-tubes: 2
;;; ═══════════════════════════════════════════════════════════════

(
  (presence  ( ))
  (containment  (( )))
  (transformation  (( )) (( )) (( )))
)
