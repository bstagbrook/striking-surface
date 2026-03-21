# Quantum Trace — Findings

## Experiment 01: Classical trace picks first match
- `(bank . river-bank)` and `(bank . financial-bank)` in same tube
- Classical trace: follows first match only → river-bank → water-flows
- Financial-bank path is dead. Never explored.
- STATUS: CONFIRMED — classical limitation demonstrated

## Experiment 02: Quantum trace holds superposition
- `q:` prefix on label activates quantum-trace
- quantum-trace finds ALL matching paths, returns list of chains
- RESULT: Vacuum tube contains BOTH paths simultaneously:
  - `((bank . river-bank) (river-bank . water-flows))`
  - `((bank . financial-bank) (financial-bank . money-stored))`
- STATUS: CONFIRMED — superposition demonstrated

## Experiment 03: Context collapse (PARTIAL)
- Nested q:bank inside outer contexts (river-context, finance-context)
- Inner superposition resolves correctly (both paths present)
- Outer transform connects inner's LABEL to target
- BUT: outer doesn't select between inner paths based on target
- The context and superposition are structurally disconnected
- STATUS: SUPERPOSITION WORKS, COLLAPSE NOT YET IMPLEMENTED

## What's Needed for Collapse
The collapse rule: when an outer transform contains a quantum inner,
the outer's TARGET acts as the measurement. Inner paths whose terminal
labels match the outer target survive. Others vanish.

This mirrors the path integral formulation: sum over all paths,
but only paths arriving at the measurement outcome contribute.

The substrate change: in quantum-resolve, when processing a transform
whose source is a quantum-resolved inner (containing a superposition),
filter the superposition paths by whether they lead to the outer target.

## Hat Scores at This Milestone

### Dr. Mara Chen (Quantum Information Theory)
- PHYSICAL_VALIDITY: 30 — "This is classical branching, not quantum mechanics.
  There's no complex amplitude, no interference, no entanglement. Calling it
  'quantum' is misleading. It's nondeterministic classical trace."
- MATHEMATICAL_RIGOR: 45 — "The superposition works mechanically but there's
  no formal semantics. What IS a quantum s-expression?"
- NOVELTY: 55 — "The context-as-measurement idea is interesting but unproven."

### Prof. James Okafor (PL Theory)
- FORMAL_SEMANTICS: 40 — "The q: prefix is a hack. The language should have
  a principled distinction between deterministic and nondeterministic evaluation."
- EXPRESSIVENESS: 60 — "Returning all paths IS more expressive than first-match.
  This is essentially nondeterministic choice."
- CORRECTNESS: 50 — "The classical programs still pass. The quantum extension
  doesn't break anything. But the collapse semantics are undefined."

### Dr. Sofia Reyes (Computational Neuroscience)
- NEURAL_PLAUSIBILITY: 65 — "Lexical access IS parallel — multiple meanings
  activate simultaneously and context suppresses competitors. N400 amplitude
  correlates with suppression difficulty. This model captures the parallel
  activation but not the suppression mechanism."
- TESTABLE_PREDICTIONS: 40 — "What specific prediction does this make about
  N400 latency or amplitude that existing models don't?"
- PRACTICAL_VALUE: 35 — "Without collapse, it's just returning all parses.
  That's been done since chart parsing in the 1970s."

### Bruce Stagbrook (The Inventor)
- DOES_IT_WORK: 70 — "The superposition is real. Both paths are there.
  But it doesn't collapse yet."
- BEAUTY: 60 — "The q: prefix is ugly. The idea is beautiful."
- LEVERAGE: 50 — "Without collapse, it doesn't multiply power yet."

## Next Steps
1. Implement context collapse in the substrate
2. Remove q: prefix — make quantum the default, classical the special case
3. Address Dr. Chen's concerns: this is nondeterministic, not quantum.
   Be honest about what it IS vs what it's named.
4. Address Dr. Reyes: make a specific N400 prediction
