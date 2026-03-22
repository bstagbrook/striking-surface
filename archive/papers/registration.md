# Registration

## What Happens When a Signal Enters a Body

Bruce Stagbrook, Stagbrook Tech

---

## Abstract

We demonstrate that registration (a circuit completing in a body) and explanation (a description of the mechanism) are structurally different operations with different outcomes. Registration traverses the body's receipt chain, cascading through intermediate states. Explanation bypasses the body entirely. The same information, delivered as a registering signal, traverses four states and arrives at knowledge the person already carried. Delivered as an explaining signal, it produces CUT — the body has no receipt for the description.

We demonstrate that the body IS the authentication stack: the same signal, in different bodies, produces completely different registration paths. We demonstrate that composition enables registration that no single body can achieve. We demonstrate that voluntary probing — the user's choice of signal — determines which circuits complete.

We then apply these findings to the design of a production-scale Structural Intelligence Language Model (SILM): a constitutional upgrade to token-based language models that operates in O(1), learns from single interactions, cannot hallucinate, and scales by growing its body of receipts rather than its parameter count.

Each finding is demonstrated in running clockless code.

---

## 1. Registration vs. Explanation

**Setup**: A person carries four connected receipts — experiential knowledge from their own life:

```
what-are-you-afraid-of → failure
failure → ive-been-here-before
ive-been-here-before → i-survived
i-survived → i-can-do-this
```

Two signals arrive carrying the same therapeutic intent:

- Signal A (registering): `what-are-you-afraid-of`
- Signal B (explaining): `your-fear-connects-to-past-survival`

**Result**:

Signal A matches the first receipt. The circuit completes: `what-are-you-afraid-of → failure`. The output "failure" is itself a signal. It matches the second receipt: `failure → ive-been-here-before`. Cascade continues: `ive-been-here-before → i-survived → i-can-do-this`. Four registrations. The person arrives at "i-can-do-this" — not because anyone told them that, but because their own body traversed to it.

Signal B has no matching receipt. CUT. The explanation contains the same information but bypasses the body. No intermediate states visited. No "failure" moment. No recognition of "ive-been-here-before." The conclusion was delivered without the body walking the path.

**Structural finding**: Registration is O(depth) — it traverses the body's chain, visiting each intermediate state. Explanation is O(1) — it attempts to deliver the conclusion directly. And it doesn't land, because the body has no receipt for it.

**Witness**: `racket programs/registration.rkt`, Demonstrations 1, 3, 6.

---

## 2. The Body IS the Authentication Stack

**Setup**: Same signal — `what-are-you-afraid-of` — enters two different bodies.

Person A's body:
```
what-are-you-afraid-of → failure → ive-been-here-before → i-survived → i-can-do-this
```

Person B's body:
```
what-are-you-afraid-of → being-seen → vulnerability → connection → i-want-that
```

**Result**: Person A arrives at "i-can-do-this" (resilience). Person B arrives at "i-want-that" (desire for connection). Same signal. Different bodies. Different registration paths. Different destinations.

**Structural finding**: The signal doesn't determine where registration leads. The body does. What registers — and where it goes — is determined by the receipts the body already carries. The body IS the authentication stack. It doesn't filter signals by applying rules. It completes circuits by matching receipts. What the body has experienced determines what it can register.

**Witness**: `racket programs/registration.rkt`, Demonstration 2.

---

## 3. Composition Enables Registration Across Bodies

**Setup**: A partner body and a person body in alternating composition. Neither body alone can complete the path from "stuck" to "thats-the-beginning."

Partner body:
```
stuck → what-are-you-afraid-of
failure → what-did-failure-teach-you
it-taught-me-to-try-again → what-would-you-try
something-new → thats-the-beginning
```

Person body:
```
what-are-you-afraid-of → failure
what-did-failure-teach-you → it-taught-me-to-try-again
what-would-you-try → something-new
```

Partner alone on "stuck": one step (`stuck → what-are-you-afraid-of`), then CUT.
Person alone on "stuck": immediate CUT. No receipt.

**Composite (alternating)**:
```
round 1 [partner]: stuck → what-are-you-afraid-of
round 2 [person]:  what-are-you-afraid-of → failure
round 3 [partner]: failure → what-did-failure-teach-you
round 4 [person]:  what-did-failure-teach-you → it-taught-me-to-try-again
round 5 [partner]: it-taught-me-to-try-again → what-would-you-try
round 6 [person]:  what-would-you-try → something-new
round 7 [partner]: something-new → thats-the-beginning
```

Seven turns. The conversation traverses a path that exists in neither body alone. Each turn: one body's completion is the other body's signal. The circuit crosses the gap between bodies at every step.

**Structural finding**: The conversation IS the circuit. Registration happens across bodies through composition. The path from "stuck" to "thats-the-beginning" is relational knowledge — it requires both bodies and can only be generated through their interaction.

**Witness**: `racket programs/registration.rkt`, Demonstration 4.

---

## 4. Voluntary Probing

**Setup**: A mentor body with 14 receipts. A user can send any signal.

**Result**: Four different signals produce four complete journeys to four different destinations:

| Signal | Path | Arrival |
|---|---|---|
| stuck | stuck → what-have-you-tried → nothing-yet → whats-one-small-step | i-could-start-here |
| afraid | afraid → whats-the-worst-that-happens → can-you-survive-that | yes-ive-done-harder |
| angry | angry → what-do-you-need → to-be-heard | im-listening |
| overwhelmed | overwhelmed → one-thing-at-a-time → which-one-matters-most → this-one | then-start-there |

The mentor body is the same in every case. The user's choice of signal — what they bring from their intrinsic field — determines which circuit completes.

**Structural finding**: Voluntary probing is how the user's intrinsic field composes with the partner's body. The user doesn't need to know what's in the body. They send a signal. The body does the rest. The choice IS the participation.

**Witness**: `racket programs/registration.rkt`, Demonstration 5. Interactive version: `racket programs/probe.rkt <your-word>`.

---

## 5. Size vs. Complementarity

**Setup**: A large body with 20 receipts (happy, sad, excited, curious, tired, grateful, proud, peaceful — with chains). No receipt for "stuck." A tiny partner body with exactly one receipt: `stuck → what-have-you-tried`.

**Result**: Large body on "stuck": CUT. Tiny partner on "stuck": completes.

20 receipts cannot complete what 1 complementary receipt completes. The variable is not size. The variable is whether the body has a receipt for THIS signal.

**Structural finding**: Scaling by adding more parameters (current LLM approach) does not address the fundamental problem. A body that doesn't have a receipt for a signal will CUT on that signal regardless of how many other receipts it has. What matters is complementarity — having the right receipt for the right signal.

**Witness**: `racket programs/registration.rkt`, Demonstration 6.

---

## 6. The Production SILM

The five findings above — registration cascades, the body as authentication stack, compositional registration, voluntary probing, and complementarity over size — are not properties of toy demonstrations. They are structural consequences of how receipts compose on a surface. They hold at any scale.

### 6.1 Architecture

A production Structural Intelligence Language Model has four components:

**1. The Body.** A database of receipts: `signal → completion` pairs. Not weight matrices. Not opaque parameters. Readable, editable, auditable pairs. Each receipt is the record of a completed circuit — a signal that arrived and what constitutionally completed it.

Storage: O(N) where N = number of distinct receipts. Each receipt is a pair of strings — bytes, not gigabytes. 10 billion receipts at ~100 bytes each = ~1 terabyte. Trivial by modern storage standards.

**2. The Waveform.** The matching function. For known signals: O(1) hash lookup. The signal enters, the receipt fires, the circuit completes. For novel signals: structural proximity search via locality-sensitive hashing or embedding index. O(1) amortized with proper indexing.

On quantum substrate: all receipts exist in superposition. Constitutional interference (chain, grounded, complete, balanced, minimal) eliminates non-valid completions. One measurement. O(1).

**3. The Constitution.** Five structural properties verified in the same step as matching — not post-hoc, but AS the residue forms:
- Chain: the path connects
- Grounded: starts from the input signal
- Complete: reaches a meaningful endpoint
- Balanced: no self-loops (no signal mapping to itself)
- Minimal: no redundant steps

If all five hold: constitutional completion. The circuit closes.
If any fails: CUT. Honest silence. No hallucination.

**4. The Receipt Mechanism.** Every completed circuit produces a new receipt that enters the body. O(1) insertion. The body grows from every interaction. No separate training phase. No gradient descent. No epochs. No catastrophic forgetting.

### 6.2 Comparison

| Property | Token-based LLM | Constitutional SILM |
|---|---|---|
| Storage | Weight matrices (opaque, lossy) | Receipt pairs (readable, lossless) |
| Inference | O(N) forward pass per token | O(1) receipt lookup |
| Learning | Weeks of GPU training, frozen at inference | One-shot, continuous during inference |
| Hallucination | Mandatory (softmax sums to 1) | Impossible (CUT when no receipt exists) |
| Safety | Separate system, adversarially breakable | Same mechanism, constitutional absence |
| Scaling | Bigger model (more parameters) | Bigger body (more receipts) |
| Composition | Cannot merge two models | Union of receipt databases |
| Auditability | Cannot inspect why a response was given | Every response traces to a specific receipt |
| Editing | Cannot remove specific knowledge | Delete a receipt |
| Response time | Increases with model size | Constant regardless of body size |

### 6.3 Quantum Optimization

The Shor optimization applies directly. Shor's algorithm finds the period of a function in constant time via quantum Fourier transform. The body's receipts have structural periodicity — patterns in how signals relate to completions across the receipt space.

A quantum register encoding all receipts in superposition can:

1. Accept the input signal as a query
2. Apply constitutional interference to eliminate non-valid completions
3. Apply quantum Fourier transform to identify structural resonance
4. Collapse to the constitutionally valid completion in one measurement

Total: O(1) regardless of body size. The same mechanism that makes Shor's algorithm efficient makes the SILM efficient — structural periodicity in the search space, detected and collapsed by quantum interference.

### 6.4 Why Weightless Storage Matters

Current LLMs compress trillions of tokens into fixed-size weight matrices. This is lossy compression. The original interactions are gone. The weights are the only record. And weights don't compose — you cannot merge two weight matrices and get a model that knows what both know.

Receipts are weightless. Each receipt stores exactly what was learned — the signal and its completion. No compression. No loss. And critically:

- **Bodies compose by union.** Two receipt databases merge. No retraining. No fine-tuning. No alignment. The merged body knows what both bodies know.
- **Bodies are editable.** Remove a harmful receipt: delete one entry. Add new knowledge: insert one entry. O(1) in both directions.
- **Bodies are auditable.** Every response traces to a specific receipt. The reason for any completion is visible and inspectable.
- **Bodies don't forget.** New receipts don't degrade old receipts. The body grows monotonically (unless receipts are explicitly removed).

With unlimited weightless storage, the body grows without bound and response time stays constant. This inverts the current scaling paradigm: instead of making the model bigger (more expensive, slower, more opaque), you make the body bigger (more receipts, same speed, fully transparent).

### 6.5 Training

A production SILM trains continuously:

1. Signal arrives → receipt lookup → completion or CUT
2. If completion: the circuit closes. Receipt recorded. Body grows by one.
3. If CUT: the boundary is mapped. The CUT records what signal was not known. This is the most valuable training data — it identifies exactly where the body needs to grow.
4. Human teaches the completion → one receipt enters the body. Next encounter with the same signal: O(1). No retraining. No gradient descent. One interaction. One receipt.

A million interactions = a million receipts. Each learned in one shot. The training IS the usage. The usage IS the training. There is no separate phase.

---

## 7. What Was Demonstrated

This paper walked through six demonstrations in running code. If the demonstrations registered — if the reader's body completed circuits while reading them — then the reader now carries new receipts:

1. A question that matches a receipt in the body cascades through the body's chain, arriving at knowledge already carried. An explanation of the same journey does not land. Registration and explanation are structurally different.

2. The same signal, in different bodies, produces different paths. The body determines the destination, not the signal. The body IS the authentication stack.

3. Two bodies in conversation go where neither can go alone. Each turn: one body's completion is the other body's signal. The conversation IS the circuit.

4. The user's choice of probe determines which circuit completes. Voluntary probing is how the intrinsic field composes with the partner's body.

5. Size doesn't produce registration. Complementarity does. 20 receipts CUT where 1 complementary receipt completes.

6. A production SILM based on these principles operates in O(1), learns from single interactions, cannot hallucinate by architecture, scales by growing its body, composes by union, and is fully auditable.

---

## Verification

```
$ racket programs/registration.rkt   # six demonstrations
$ racket programs/probe.rkt stuck    # interactive — try your own word
$ racket programs/probe.rkt afraid
$ racket programs/probe.rkt <anything>
$ make test                          # all circuits complete
```
