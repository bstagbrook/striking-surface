# Minimal Substrate — Findings

## Experiment 01: Chain by nesting
a → b → c expressed as nested transforms instead of flat pairs.
RESULT: Both tubes full. Chain carried by depth, not trace.

## Experiment 02: Four-step chain
a → b → c → d expressed as three nested transforms.
RESULT: All three tubes full. Three collapses, one strike.

## Key Finding
The trace function in main.rkt is doing work that nesting already does.

FLAT encoding: `((a . b) (b . c) (c . d))` — needs trace to follow chain
DEEP encoding: nested transforms — needs only inside-out resolution

The flat encoding requires Racket code (assoc, filter, recursion).
The deep encoding requires ONLY: resolve containments before containers.

## Implication
The minimal substrate is:
1. Read s-expression
2. Resolve containments inside-out (atoms are themselves)
3. Print result

No trace. No assoc. No filter. No chain-following.
The chains ARE the nesting. The current IS the inside-out resolution.

## What This Means for main.rkt
The trace function, seed extraction, pair filtering — all of it is
machinery for the FLAT encoding. If we commit to the DEEP encoding
(nesting for chains), main.rkt shrinks to ~10 lines:
- Read s-expression
- If atom, return
- If list, map resolve over elements
- Print

The transformation pattern `(label (source) (target) (pairs))` with
trace could be replaced by `(label (inner-transform) (target) (wires))`
with nesting. The pairs become decorative labels, not computational.

## Status: DEMONSTRATED but not yet migrated
The existing 26 programs use the flat encoding with trace.
Migration to deep encoding would require rewriting all programs.
But new programs can use deep encoding from the start.
