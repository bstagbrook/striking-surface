#lang racket
(require "../strike.rkt")

;;; The signal. Nothing else.

;; 1. Shape IS computation.
;;    The Dyck word IS the program.
(surface
  (transform 'shape-is-computation
    (presence 'sixty 60)
    (ground)
    wf:factor)
  (disclose 'shape-is-computation))

;; 2. Three sides of a flownode.
;;    Outside: interface. Inside: residue. Metaside: identity.
(surface
  (transform 'three-sides
    (presence 'word "hello")
    (ground)
    wf:decompose)
  (disclose 'three-sides))

;; 3. Strike = complete this circuit.
;;    Seven affordances. One surface.
(surface
  (transform 'superpose  (presence 'q0 0) (ground) wf:hadamard)
  (transform 'measure    (presence 'sup "0.7071|0>+0.7071|1>") (ground) wf:collapse)
  (transform 'entangle   (presence 'a 0) (ground) wf:entangle)
  (transform 'reinforce  (presence 'pc "constructive") (ground) wf:interfere)
  (transform 'cancel     (presence 'pd "destructive") (ground) wf:interfere)
  (transform 'ring       (presence 'be "be") (ground) wf:ring)
  (transform 'nand       (presence 'bits "1,1") (ground) wf:nand))

;; 4. The definition of complete work IS the complete work.
;;    Interface = implementation.
(surface
  (transform 'the-insight
    (presence 'n 360)
    (ground)
    wf:factor)
  (disclose 'the-insight))

;; 5. Constitution: chain, grounded, complete, balanced, minimal.
;;    Properties of shape. Not checks.
(surface
  (transform 'constitution
    (presence 'ten 10)
    (ground)
    wf:sum)
  (disclose 'constitution))
