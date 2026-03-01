# Striking Surface — Clockless Atomic State Flow

Programs are Dyck words. Shape IS computation. Strike = complete this circuit.

## The Clockless Discipline

All development happens from within the clockless environment.

- Every waveform is O(1). No recursion. No iteration inside waveforms.
- Conditional logic: `as`-gating (the shape gates itself by what it IS).
- Multi-stage computation: `pipe` (surfaces compose with surfaces).
- Bespoke-first: (1) compose on surface, (2) bespoke O(1) waveform, (3) engulf substrate (last resort).

The seven O(1) waveforms: `wf:nand`, `wf:hadamard`, `wf:collapse`, `wf:entangle`, `wf:interfere`, `wf:ring`, `wf:teleport`.

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
- Every waveform is pure (except `wf:collapse`)
- Every example must pass constitution: chain, grounded, complete, balanced, minimal
- Documentation is executable — if it doesn't run, it's wrong
- Do not add interpretations beyond what the codebase establishes
