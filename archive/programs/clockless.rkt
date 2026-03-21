#lang racket
(require "../strike.rkt")

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   CLOCKLESS — development from within the environment
;;;
;;;   Every waveform here is O(1). No recursion. No iteration.
;;;   Complex behavior comes from:
;;;     - as-gating: structural conditional (the shape gates itself)
;;;     - pipe: surface composition (output feeds input)
;;;     - arrangement of O(1) transforms on the surface
;;;
;;;   Nothing here takes longer than O(1). Nothing ever will.
;;;
;;; ═══════════════════════════════════════════════════════════════

(displayln "══════ CLOCKLESS ENVIRONMENT ══════\n")


;;; -----------------------------------------------------------
;;; DEMO 1: AS-GATING — conditional routing without iteration
;;; -----------------------------------------------------------
;;;
;;; Place a value on the surface. Two gates check it.
;;; One opens, one stays closed. O(1). No if/else in a waveform.
;;; The shape on the surface IS the condition.

(displayln "--- AS-GATING: structural conditional ---")
(surface
  (presence 'signal "1")

  ;; Gate opens when signal = "1" → superpose
  (as 'when-high 'signal "1"
    (transform 'action-high
      (presence 'in-hi "1")
      (ground)
      wf:hadamard))

  ;; Gate stays closed when signal ≠ "0"
  (as 'when-low 'signal "0"
    (transform 'action-low
      (presence 'in-lo "0")
      (ground)
      wf:hadamard)))


;;; -----------------------------------------------------------
;;; DEMO 2: PIPE — surface composition
;;; -----------------------------------------------------------
;;;
;;; Surface A produces a flowspace.
;;; Surface B receives it via pipe. Shapes from A are visible in B.
;;; No glue code. No manual threading. O(1) composition.

(displayln "\n--- PIPE: surface composition ---")

(define stage-1
  (surface
    (transform 'prepare
      (presence 'raw "0")
      (ground)
      wf:hadamard)))

;; Stage 2 sees stage 1's flowspace
(surface
  (pipe stage-1
    (disclose 'prepare)
    (recognize 'raw)))


;;; -----------------------------------------------------------
;;; DEMO 3: NOT gate — from NAND, on the surface
;;; -----------------------------------------------------------
;;;
;;; NOT(x) = NAND(x, x). One NAND. O(1).
;;; No waveform needed — it's an arrangement on the surface.

(displayln "\n--- NOT from NAND: structural composition ---")

;; NOT(1) = NAND(1,1) = 0
(surface
  (transform 'not-1
    (presence 'bit-1 "1,1")
    (ground)
    wf:nand)
  (disclose 'not-1))

;; NOT(0) = NAND(0,0) = 1
(surface
  (transform 'not-0
    (presence 'bit-0 "0,0")
    (ground)
    wf:nand)
  (disclose 'not-0))


;;; -----------------------------------------------------------
;;; DEMO 4: AND gate — from two NANDs, piped
;;; -----------------------------------------------------------
;;;
;;; AND(a,b) = NOT(NAND(a,b)) = NAND(NAND(a,b), NAND(a,b))
;;; Two surfaces. First computes NAND. Second inverts via pipe.

(displayln "\n--- AND from NAND: piped surfaces ---")

(define nand-result
  (surface
    (transform 'nand-step
      (presence 'inputs "1,1")
      (ground)
      wf:nand)))

;; Extract the NAND result, feed it back as NOT
(let ([nand-val (shape-value (hash-ref nand-result 'nand-step))])
  (surface
    (transform 'and-gate
      (presence 'nand-out (string-append nand-val "," nand-val))
      (ground)
      wf:nand)
    (disclose 'and-gate)))


;;; -----------------------------------------------------------
;;; DEMO 5: SUPERPOSE → COLLAPSE decision pipeline
;;; -----------------------------------------------------------
;;;
;;; Stage 1: superpose (hadamard). O(1).
;;; Stage 2: collapse (measurement). O(1).
;;; Two O(1) stages piped. Total: O(1).
;;; A genuine quantum decision made structurally.

(displayln "\n--- QUANTUM DECISION: superpose → collapse pipeline ---")

(define superposed
  (surface
    (transform 'superpose
      (presence 'qubit "0")
      (ground)
      wf:hadamard)))

(let ([sup-val (shape-value (hash-ref superposed 'superpose))])
  (surface
    (transform 'decide
      (presence 'state sup-val)
      (ground)
      wf:collapse)
    (disclose 'decide)))


;;; -----------------------------------------------------------
;;; DEMO 6: AS-GATED PIPELINE — route by quantum outcome
;;; -----------------------------------------------------------
;;;
;;; Superpose → collapse → as-gate routes based on outcome.
;;; The entire pipeline is O(1). No iteration anywhere.
;;; The collapsed value gates which path activates.

(displayln "\n--- AS-GATED QUANTUM PIPELINE ---")

(define q-result
  (surface
    (transform 'q-flip
      (presence 'coin "0")
      (ground)
      wf:hadamard)))

(define measured
  (let ([sv (shape-value (hash-ref q-result 'q-flip))])
    (surface
      (transform 'measure
        (presence 'sup sv)
        (ground)
        wf:collapse))))

(let ([outcome (shape-value (hash-ref measured 'measure))])
  (surface
    (presence 'outcome outcome)

    (as 'path-0 'outcome "|0>"
      (transform 'chose-zero
        (presence 'z "0,0")
        (ground)
        wf:nand))

    (as 'path-1 'outcome "|1>"
      (transform 'chose-one
        (presence 'o "1,0")
        (ground)
        wf:nand))

    (disclose 'outcome)))


(displayln "\n══════ PROOF ══════")
(displayln "  Every waveform: O(1). NAND, hadamard, collapse.")
(displayln "  Complex behavior: as-gating + pipe + arrangement.")
(displayln "  Nothing here iterates. Nothing here recurses.")
(displayln "  This is the clockless environment.")
