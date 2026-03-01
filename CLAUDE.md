# Striking Surface — Clockless Atomic State Flow

## What This Is

A computation model where programs are Dyck words (balanced parentheses).
The shape IS the computation. No clock, no loops, no iteration, no mutation.
Strike = complete this circuit.

## Two Machines

### Racket Machine (clockless)
- `strike.rkt` — the clockless striking surface
- `programs/*.rkt` — clockless programs (S-expressions)
- No `for`, `while`, `do`, `set!` — structural `match` dispatch only
- All waveforms are pure functions: `(string, string) -> (listof (cons string string))`
- Run: `racket programs/documentation.rkt`

### Python Machine (original)
- `strike.py` — the original interpreter
- `programs/*.asf` — ASF-format programs
- `waveforms/*.py` — external waveform processes (14 total)
- Run: `python3 strike.py programs/quantum_affordances.asf`

### HTML GUI
- `quantum_affordances.html` — self-contained browser interface (JS port of both machines)

## Key Concepts

- **Flownodes** have three sides: outside (interface), inside (hollow or consolidated), metaside (volunteered metadata — names, hierarchical ordering index, indicators, indicator chains)
- **Constitution**: chain, grounded, complete, balanced, minimal — properties of shape, not checks
- **Waveforms**: structural intelligence. Shape in, residue out. ONE source of non-determinism: `wf:collapse`
- **Labels**: human readability, not computation. Labels name compositions.
- **Continuations**: new transforms registered onto existing machine, instantaneously transformative

## Documentation

The complete documentation is `programs/documentation.rkt`. It IS executable.
Every claim is backed by a working example. Run it:

```
racket programs/documentation.rkt
```

## Rules for Contributing

- Do not add interpretations beyond what the codebase establishes
- The Racket machine must remain clockless: no `for`, `while`, `do`, `set!`
- Every new waveform must be a pure function (except `wf:collapse`)
- Every new example must pass all five constitution checks
- Documentation is executable — if it doesn't run, it's wrong
