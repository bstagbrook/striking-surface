# Striking Surface — Clockless Atomic State Flow

Programs are Dyck words. Shape IS computation. Strike = complete this circuit.

## Structure

- `strike.rkt` — the machine. No loops, no clock, no mutation.
- `programs/` — programs that run on the machine.
- `archive/` — earlier layers (Python interpreter, HTML GUI). Git history has full provenance.

## Run

```sh
racket programs/documentation.rkt   # complete docs + working examples
racket programs/quantum-affordances.rkt   # the quantum affordances
make test   # verify all circuits complete
```

## Rules

- No `for`, `while`, `do`, `set!` in the Racket machine
- Every waveform is pure (except `wf:collapse`)
- Every example must pass constitution: chain, grounded, complete, balanced, minimal
- Documentation is executable — if it doesn't run, it's wrong
- Do not add interpretations beyond what the codebase establishes
