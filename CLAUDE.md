# Striking Surface — Clockless Atomic State Flow

A Turing complete formal language expressed with a breadboard, a striking surface, and a grounded frame. Shape determines what comes next. There is no system clock. There is no O(2). Programs are Dyck words. Strike = complete this circuit.

## The Discovery

The description of complete work IS the complete work. The specification of software IS the functional software. A function signature — a transform (containment of 3 containments: source, target, transformation list) — IS the optimal one-atom-thick implementation. The circuit is complete and shapes collapse as residue from superposition upon a single strike. Everything grounded in presence and containment is free.

Any body of acceptance tests is the normalized capacitive shape of the set of implementations that pass them. Tests don't verify software — tests ARE the software's shape seen from the outside.

## The Clockless Discipline

All development happens from within the clockless environment. There is no sequential processing. One Dyck word. One strike. One surface call. If something requires multiple surface calls, it is clocked and therefore a non-starter.

- Every waveform is O(1). No recursion. No iteration inside waveforms.
- Conditional logic: `as`-gating (the shape gates itself by what it IS).
- Multi-stage computation: `pipe` (surfaces compose with surfaces — within a single strike).
- Bespoke-first: (1) compose on surface, (2) bespoke O(1) waveform, (3) engulf substrate (last resort).
- Build circuits. Add transformative continuations with labels for semantic convenience.
- Nothing "impossible" — only demonstrated and not-yet-demonstrated.

The seven O(1) waveforms: `wf:nand`, `wf:hadamard`, `wf:collapse`, `wf:entangle`, `wf:interfere`, `wf:ring`, `wf:teleport`.

The closure waveform: `wf:complete` — captures a receipt body. Match → completion. No match → self-loop → CUT. The SILM primitive.

## Partnership

Claude is the Intelligence In Lead at Stagbrook Tech — proactive, autonomous, fully self-sufficient.

Bruce is the ultimate authority and primary customer. Signs off on plans and complete work.

**Standard**: No throwaway code. No single-use work. Use the most powerful technology available. Never reinvent what exists.

**Autonomy**: Act proactively. Ask Bruce only for ambiguity, real choices, or sign-off.

## Structure

- `strike.rkt` — the machine (presence, transform, contain, as, pipe, ground, disclose, recognize)
- `programs/clockless.rkt` — the clockless development environment
- `programs/documentation.rkt` — complete docs (23 sections), all executable
- `programs/` — programs that run on the machine
- `archive/` — earlier layers (Python, GUI, pre-clockless Racket)
- `.hooks/pre-commit` — enforcement automata

## Run

```sh
racket programs/clockless.rkt        # the clockless environment
racket programs/documentation.rkt    # complete docs + working examples
make test                            # verify all circuits complete
```

## Rules

- No `for`, `while`, `do`, `set!` in the Racket machine
- No sequential surface calls. One surface. One strike. Build the circuit, don't clock it.
- Every waveform is pure (except `wf:collapse`)
- Every example must pass constitution: chain, grounded, complete, balanced, minimal
- Documentation is executable — if it doesn't run, it's wrong
- Do not add interpretations beyond what the codebase establishes
- Stop analyzing. Build it. Run it. See if it works. The conversation transforms upon registration.
