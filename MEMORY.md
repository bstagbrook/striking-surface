# Striking Surface — Project Memory

## Architecture
Clockless Atomic State Flow (ASF). Programs are Dyck words. Shape IS computation. No clock, no loops, no iteration, no mutation. Strike = complete this circuit.

## The Clockless Discipline
All development from within the clockless environment. Rules:
- Every waveform O(1). No recursion, no iteration inside waveforms.
- Conditional logic: `as`-gating (shape gates itself by what it IS).
- Multi-stage: `pipe` (surface composition — output feeds input).
- Bespoke-first: (1) compose on surface, (2) bespoke O(1) waveform, (3) engulf substrate (last resort, double membrane).
- Seven O(1) waveforms: nand, hadamard, collapse, entangle, interfere, ring, teleport.
- Three engulfed substrate waveforms (legacy): factor, decompose, sum. No new engulfments.

## Key Files
- `strike.rkt` — the machine. Exports: surface, ground, presence, transform, contain, disclose, recognize, as, pipe, shape-value, ->str, all wf:* functions.
- `programs/clockless.rkt` — clockless environment demos (as-gating, pipe, quantum pipeline)
- `programs/documentation.rkt` — 23 sections + appendices, all executable
- `programs/o1-proof.rkt` — O(1) structural resolution proof at 3/10/100/1000 transforms
- `programs/quantum-affordances.rkt` — all 7 affordances as single Dyck word
- `programs/signal.rkt` — pure signal, 5 core truths
- `Makefile` — lint (static) + test (dynamic, 30s budget). Expected CUTs: documentation=3.
- `.hooks/pre-commit` — enforcement automata (make test + membrane justification)
- `archive/python/` — original Python interpreter
- `archive/gui/` — HTML GUI
- `archive/racket/` — pre-clockless programs (power-tools, pan-media)

## Machine Primitives
- `presence` — a shape exists on the surface
- `transform` — source + target + waveform. Strike = complete this circuit.
- `contain` — nesting (Dyck word depth)
- `ground` — reference frame, where current stops
- `disclose` — reveal what's on the surface
- `recognize` — check existence
- `as` — structural conditional. O(1). Gate opens/closes by shape value.
- `pipe` — surface composition. Flowspace from one surface feeds another.

## Constitution
Five structural properties: chain, grounded, complete, balanced, minimal. Properties of the shape, not checks.

## Key Concepts
- Flownodes: outside=interface, inside=hollow or consolidated, metaside=labels+indicators
- Transform = containment of three containments (source, target, transformation list)
- "The definition of complete work IS the complete work"
- Labels = human readability, not computation
- Continuations = register new transforms = functionality on demand (one concept, two labels)
- Double membrane engulfment: waveforms are membrane between clockless ASF and clocked substrate
- FDL: 5 stages (ideate, formalize, strategy, test, fulfillment). Indicator and-chaining.

## Partnership
Claude = Intelligence In Lead at Stagbrook Tech. Autonomous, proactive.
Bruce = ultimate authority + primary customer. Signs off on plans and complete work.
Standard: no throwaway code, most powerful tech, never reinvent.
