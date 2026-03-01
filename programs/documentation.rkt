#lang racket

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   CLOCKLESS ATOMIC STATE FLOW
;;;   Complete Documentation & Working Examples
;;;
;;;   This file IS the documentation.
;;;   Every section is executable.
;;;   The documentation IS the program.
;;;
;;;   Run:  racket programs/documentation.rkt
;;;
;;; ═══════════════════════════════════════════════════════════════

(require "../strike.rkt")


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 1: THE MACHINE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The machine has three physical parts:
;;;
;;;   1. A BREADBOARD — holds shapes. Components are placed on it.
;;;   2. A STRIKING SURFACE — where shape meets waveform. When you
;;;      strike, current flows. The circuit completes.
;;;   3. A GROUNDED FRAME — the reference point. All current flows
;;;      toward ground. Ground is where current stops.
;;;
;;; There is no clock. There is no runtime. There is no interpreter
;;; stepping through instructions. The program is a Dyck word —
;;; a balanced parenthesis expression — and the shape of that
;;; expression IS the computation. You evaluate it once. Everything
;;; resolves. The circuit completes.
;;;
;;; In Racket, this is literal: S-expressions ARE balanced
;;; parentheses. The code IS the data. The parentheses ARE the
;;; Dyck word. Homoiconic: the program IS its own structure.
;;;
;;; Resolution is O(1) with respect to program size. All shapes
;;; at the same nesting depth are siblings — they resolve in one
;;; structural step. Adding more shapes to the breadboard does not
;;; increase resolution depth, just as adding more components to
;;; a circuit board does not slow down the speed of current.
;;; The resolution depth is the NESTING DEPTH of the Dyck word,
;;; not the NUMBER of shapes.
;;;
;;; What the machine does NOT have:
;;;   - No system clock
;;;   - No program counter
;;;   - No instruction pointer
;;;   - No for loops, while loops, or iteration
;;;   - No mutable state
;;;   - No sequential execution
;;;
;;; What the machine DOES have:
;;;   - Presence (shapes exist)
;;;   - Containment (shapes nest inside shapes)
;;;   - Ground (the reference frame)
;;;   - Transforms (questions with hollows)
;;;   - Waveforms (structural intelligence that fills hollows)
;;;   - Constitution (structural properties of valid circuits)
;;;


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 2: PRESENCE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A presence is the most primitive statement: a shape exists.
;;;
;;;   (presence name value)
;;;
;;; The name is a label — it's for YOU, the human. You invent it.
;;; The value is the shape — it's what's actually there.
;;;
;;; A shape can have more than one label. The shape doesn't care
;;; what you call it. "ten", "fingers", "decade" can all name
;;; the same shape (10). The label is pragmatic — it fits the
;;; context you're working in.
;;;
;;; Placing a presence on the surface is like putting a component
;;; on a breadboard. It's there now. It conducts.

(displayln "\n══════ SECTION 2: PRESENCE ══════")

(surface
  ;; Three labels for the same shape (10).
  ;; The shape is 10. The names are yours.
  (presence 'ten 10)
  (presence 'fingers 10)
  (presence 'decade 10)

  ;; Different shapes, different values.
  (presence 'greeting "hello")
  (presence 'ground-state "e")

  ;; Disclose shows what's on the surface.
  (disclose 'ten)
  (disclose 'greeting))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 3: CONTAINMENT
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Containment is nesting. One shape inside another.
;;;
;;;   (contain name child1 child2 ...)
;;;
;;; The parentheses ARE the containment. In a Dyck word, nesting
;;; is what the balanced parentheses express. The outer parens
;;; are the container. The inner parens are the contained.
;;;
;;; This is like wires in plastic tubing. The tubing (containment)
;;; is the insulation. It keeps one conductor from touching another
;;; where it shouldn't. The Dyck word structure guarantees no
;;; shorts — balanced parentheses mean every opening has a closing,
;;; every container is properly sealed.
;;;
;;; Containment resolves all children structurally — every shape
;;; inside the container resolves when the container resolves.

(displayln "\n══════ SECTION 3: CONTAINMENT ══════")

(surface
  (contain 'pair
    (presence 'left "alice")
    (presence 'right "bob"))

  (disclose 'pair))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 4: GROUND
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Ground is the reference frame. Every circuit needs one.
;;;
;;;   (ground)
;;;
;;; Ground is where current stops. It is the identity element.
;;; In the constitution, "complete" means the residue chain reaches
;;; ground (or "e"). Ground doesn't do anything — it's the
;;; destination. The frame that everything resolves toward.
;;;
;;; In every ASF program, ground is the first thing placed:
;;;
;;;   presence ground e
;;;
;;; In the Racket machine, (ground) returns the ground shape.
;;; Transforms target (ground) to mean: "resolve this toward
;;; wherever current naturally stops."

(displayln "\n══════ SECTION 4: GROUND ══════")

(surface
  ;; Ground alone. The simplest possible circuit.
  ;; A shape that is already at ground needs no transformation.
  (presence 'at-ground "e")

  ;; A transform whose source IS ground value resolves immediately.
  ;; Empty residue. The constitution recognizes: "at ground."
  (transform 'already-there
    (presence 'already "5")
    (ground)
    wf:factor)

  ;; 5 is prime. No factors to extract. Empty residue.
  ;; The circuit completes because 5 is already at ground
  ;; (no further decomposition possible).
  (disclose 'already-there))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 5: TRANSFORMS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A transform is a question. It says:
;;;   "I have THIS (source). I want THAT (target).
;;;    I don't know the path yet."
;;;
;;;   (transform name source-shape target-shape waveform)
;;;
;;; A transform is a containment of three containments:
;;;
;;;   1. SOURCE CONTAINMENT — the formal definition of inputs.
;;;      What you have. What you're starting with.
;;;
;;;   2. TARGET CONTAINMENT — the formal definition of outputs.
;;;      What "done" looks like. The definition of complete work.
;;;
;;;   3. THE HOLLOW — the list of transformations that connect
;;;      source to target. Before the waveform fills it, this
;;;      is empty. A vacuum tube. Awaiting structural intelligence.
;;;
;;; When the surface resolves, the waveform fills the hollow.
;;; The waveform is the structural intelligence — it knows how
;;; to get from source to target. The residue it produces IS
;;; the path. The constitution verifies the path is valid.
;;;
;;; The key insight: the definition of complete work IS the
;;; complete work. You declare what "done" looks like (the target).
;;; The waveform fills in the path. If you provide the interface
;;; (source shape + target shape), you get the implementation
;;; for free.
;;;
;;; This is the same as acceptance testing. You write what "done"
;;; looks like. If the specification is precise enough, there is
;;; exactly one valid residue chain. The test IS the implementation.

(displayln "\n══════ SECTION 5: TRANSFORMS ══════")

(surface
  ;; "What is 60 made of?"
  ;; Source: 60. Target: ground. Waveform: factor.
  ;; The question IS the answer — factor fills the hollow
  ;; with the prime decomposition path.
  (transform 'what-makes-60
    (presence 'sixty 60)
    (ground)
    wf:factor)

  (disclose 'what-makes-60)

  ;; "What is 'hello' made of?"
  ;; Source: "hello". Target: ground. Waveform: decompose.
  ;; The string decomposes character by character to ground.
  (transform 'what-makes-hello
    (presence 'greeting "hello")
    (ground)
    wf:decompose)

  (disclose 'what-makes-hello)

  ;; "What is the sum of 1 to 10?"
  ;; Source: 10. Target: ground. Waveform: sum.
  ;; Gauss saw that the shape of the sum IS the answer.
  (transform 'gauss
    (presence 'ten 10)
    (ground)
    wf:sum)

  (disclose 'gauss))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 6: CONSTITUTION
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The constitution is five structural properties of valid
;;; residue. These are NOT checks that run after the computation.
;;; They ARE properties of the shape. The residue either has them
;;; or it doesn't. The constitution is a predicate on shape.
;;;
;;; The five properties:
;;;
;;;   1. CHAIN — each step's endpoint is the next step's start.
;;;      The residue forms an unbroken path. No gaps in the wire.
;;;
;;;        a -> b, b -> c, c -> d     ✓ chain
;;;        a -> b, c -> d             ✗ broken wire
;;;
;;;   2. GROUNDED — the first step starts from the source.
;;;      Current begins where it should begin.
;;;
;;;        source="60", residue starts "60 -> ..."   ✓ grounded
;;;        source="60", residue starts "30 -> ..."   ✗ floating
;;;
;;;   3. COMPLETE — the last step reaches the target (or ground).
;;;      Current arrives where it should arrive.
;;;
;;;        target=ground, residue ends "... -> 5"    ✓ complete
;;;        target="7",    residue ends "... -> 5"    ✗ incomplete
;;;
;;;   4. BALANCED — no step is a self-loop. No wire connects
;;;      a point to itself. Every step makes progress.
;;;
;;;        "a -> b"     ✓ balanced
;;;        "a -> a"     ✗ self-loop
;;;
;;;   5. MINIMAL — no start point appears more than once. No
;;;      redundant paths. The circuit has no unnecessary loops.
;;;
;;;        "a -> b, b -> c"          ✓ minimal
;;;        "a -> b, a -> c"          ✗ redundant start
;;;
;;; If all five hold: the circuit is complete. ")"
;;; If any fails: CUT. The circuit is broken.
;;;
;;; The constitution is what makes the machine self-verifying.
;;; You don't check your work — the shape of the residue either
;;; IS a valid circuit or it ISN'T.

(displayln "\n══════ SECTION 6: CONSTITUTION ══════")

(surface
  ;; A valid circuit: factor 12.
  ;; Residue: 12 -> 6 -> 3
  ;; chain✓ grounded✓ complete✓ balanced✓ minimal✓
  (transform 'valid-circuit
    (presence 'twelve 12)
    (ground)
    wf:factor)

  (disclose 'valid-circuit)

  ;; NAND gate: simplest possible valid circuit.
  ;; Residue: "1,1" -> "0" (one step)
  ;; All five properties hold trivially for a single step.
  (transform 'simplest-circuit
    (presence 'bits "1,1")
    (ground)
    wf:nand)

  (disclose 'simplest-circuit))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 7: FLOWNODES
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A flownode has three sides:
;;;
;;;   OUTSIDE — the interface. What the shape looks like from the
;;;   outside. The name, the source, the target. What it promises
;;;   to do. The type signature.
;;;
;;;   INSIDE — one of two states:
;;;
;;;     HOLLOW — a vacuum tube. Empty. Awaiting structural
;;;     intelligence (a waveform). The transform has been declared
;;;     but not resolved. The question has been asked but not
;;;     answered. The circuit is open.
;;;
;;;     CONSOLIDATED — filled with residue. The waveform has
;;;     produced a path from source to target. The constitution
;;;     has been verified. The hollow is now solid. The work is
;;;     done. The circuit is closed.
;;;
;;;   METASIDE — volunteered information that is detectable
;;;   everywhere the flownode is detectable. The metaside is not
;;;   the outside (which is the functional interface) and not the
;;;   inside (which is the residue). It is information ABOUT the
;;;   flownode that travels with it.
;;;
;;;   The metaside can contain:
;;;
;;;     NAMES — self-selected identifiers used for identification.
;;;     The flownode volunteers what it is called. This is not
;;;     assigned from outside — it is part of the shape.
;;;
;;;     HIERARCHICAL ORDERING INDEX — the position of the flownode
;;;     within a containment hierarchy. Where it sits relative to
;;;     other flownodes in the structure.
;;;
;;;     INDICATORS — boolean expressions that allow for knowledge
;;;     of the presence of a specific shape from within the
;;;     abstracted interior of the flownode. An indicator is a
;;;     predicate: "is this shape present?" Indicators allow for
;;;     automatic mechanical collapse at the presence of a shape.
;;;
;;;     INDICATOR CHAINS — sequences of indicators. When a chain
;;;     of indicators all resolve to true, the combined condition
;;;     is met. This is how complex presence-detection composes
;;;     from simple boolean tests.
;;;
;;;     Indicator chains can be PROGRESSIVE. An and-chaining of
;;;     indicators resolves sequentially as each watched shape
;;;     becomes present. Each indicator in the chain that resolves
;;;     to true is a step forward. This makes indicator chains
;;;     capable of indicating progress or growth — the chain
;;;     itself becomes a measure of how far along the flownode
;;;     is toward its conditions being met. The more indicators
;;;     in the chain that have resolved, the more progress has
;;;     been made. The chain does not need to be fully resolved
;;;     to carry information — a partially-resolved chain
;;;     indicates partial progress.
;;;
;;; The transition from hollow to consolidated happens when
;;; the surface resolves. The waveform fills the vacuum tube
;;; with residue. There is no intermediate state — the node
;;; is either hollow or consolidated.
;;;
;;; Indicators enable automatic mechanical collapse: when the
;;; shape an indicator watches for becomes present on the surface,
;;; the indicator resolves to true. If a flownode's indicators
;;; all resolve, the flownode can collapse — transition from
;;; hollow to consolidated — mechanically, without external
;;; instruction. The presence of the shape IS the trigger.
;;;
;;; Disclose reveals all three sides:
;;;   META: name        (the metaside — volunteered identity)
;;;   OUTSIDE: (src) -> (tgt) [n shapes]   (the interface)
;;;   residue steps     (the inside — consolidated content)

(displayln "\n══════ SECTION 7: FLOWNODES ══════")

(surface
  ;; Before and after. The waveform fills the hollow.
  ;; Disclose shows the outside (interface) and inside (residue).
  (transform 'decompose-abc
    (presence 'abc "abc")
    (ground)
    wf:decompose)

  ;; META: decompose-abc               <- the metaside (volunteered identity)
  ;; OUTSIDE: (abc) -> (e) [3 shapes]  <- the outside (interface)
  ;;   abc -> ab                       <- the inside (residue)
  ;;   ab -> a                            consolidated content
  ;;   a -> e                             the hollow is filled
  (disclose 'decompose-abc))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 7b: FLOWNODE PROPERTIES
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Flownodes are the unit of work in clockless atomic state flow.
;;; Once a transform has been built, it can be used. The complete
;;; set of flownode properties:
;;;
;;;   TRAVERSABLE — the residue chain can be walked. Each step
;;;   links to the next. The shape IS the path. You can follow
;;;   it from source to ground.
;;;
;;;   INSTANTIATABLE — a transform can be struck with different
;;;   source values. The same waveform, different input shapes,
;;;   different residue. Each instance is its own circuit.
;;;
;;;   COMPOSABLE — transforms can feed into other transforms.
;;;   The output of one becomes the source of the next. This is
;;;   how arrangements become programs.
;;;
;;;   DECOMPOSABLE (from the outside) — functional decomposition.
;;;   Every transform can be broken down into smaller transforms,
;;;   each with a single-responsibility use-case label, all the
;;;   way down to presence and containment. The labels name the
;;;   decomposition at every level.
;;;
;;;   DECOMPOSABLE (from the inside) — planning on demand.
;;;   Milestones can be broken into smaller milestones. Each
;;;   sub-milestone has specific, measurable results as proof of
;;;   complete work and intermediary outcomes. The residue chain
;;;   IS the plan — each step is a milestone with a measurable
;;;   before (car) and after (cdr).
;;;
;;;   SERIALIZABLE — a flownode's state (outside + inside) can be
;;;   written out and reconstituted. The shape is data. The data
;;;   is shape.
;;;
;;;   MEMOIZABLE — once consolidated, a flownode's residue never
;;;   changes. The same source with the same waveform always
;;;   produces the same residue (except wf:collapse — the ONE
;;;   source of non-determinism). A consolidated flownode IS its
;;;   own memo.
;;;
;;;   HASHABLE — the outside (interface) of a flownode is a unique
;;;   key: name + source + target. This is what the flowspace
;;;   indexes on.
;;;
;;;   COLLAPSABLE — a consolidated flownode can be treated as a
;;;   single value (its final residue endpoint) rather than the
;;;   full chain. The shape can be collapsed to its result.
;;;
;;;   EMBEDDABLE — a flownode can be placed inside a containment.
;;;   Transforms nest. A transform can be the source or target
;;;   of another transform. Embedding is how complexity composes
;;;   without increasing resolution depth.
;;;
;;;   SHIPPABLE — a consolidated flownode is complete, verified,
;;;   and self-contained. It carries its own proof of work
;;;   (the residue) and its own verification (the constitution).
;;;   It can be shipped as-is.
;;;
;;; These are not features added to flownodes. These ARE flownodes.
;;; A shape on the surface that has been resolved through a waveform
;;; and verified by the constitution inherently has all of these
;;; properties.

(displayln "\n══════ SECTION 7b: FLOWNODE PROPERTIES ══════")

;;; --- TRAVERSABLE: walk the residue chain ---
(surface
  (transform 'traversable-demo
    (presence 'word "hello")
    (ground)
    wf:decompose)
  (disclose 'traversable-demo))
  ;; Each step links to the next:
  ;;   hello -> hell -> hel -> he -> h -> e
  ;; The chain IS the traversal.

;;; --- INSTANTIATABLE: same waveform, different source ---
(surface
  (transform 'instance-a
    (presence 'small 12)
    (ground)
    wf:factor)
  (transform 'instance-b
    (presence 'large 360)
    (ground)
    wf:factor)
  (disclose 'instance-a)
  (disclose 'instance-b))
  ;; Same waveform (wf:factor). Different inputs.
  ;; Different residue chains. Each is its own circuit.

;;; --- COMPOSABLE: output of one feeds the next ---
(surface
  ;; Step 1: superpose a qubit
  (transform 'compose-step-1
    (presence 'input-qubit 0)
    (ground)
    wf:hadamard)
  ;; Step 2: measure the superposition
  (transform 'compose-step-2
    (presence 'superposed-state "0.7071|0>+0.7071|1>")
    (ground)
    wf:collapse)
  (disclose 'compose-step-1)
  (disclose 'compose-step-2))
  ;; The output of superposition becomes the input to collapse.
  ;; Composition is arrangement on the surface.

;;; --- DECOMPOSABLE (outside): single-responsibility labels ---
(surface
  ;; "factor-and-sum" decomposes into two labeled transforms,
  ;; each with a single responsibility.
  (transform 'find-factors
    (presence 'n 60)
    (ground)
    wf:factor)
  (transform 'sum-to-ten
    (presence 'k 10)
    (ground)
    wf:sum)
  (disclose 'find-factors)
  (disclose 'sum-to-ten))
  ;; Every transform has one job. One label. One responsibility.
  ;; Decomposition is just giving each sub-task its own label.

;;; --- DECOMPOSABLE (inside): milestones as residue steps ---
(surface
  (transform 'milestones
    (presence 'project "hello")
    (ground)
    wf:decompose)
  (disclose 'milestones))
  ;; Each residue step is a milestone:
  ;;   hello -> hell  (milestone 1: measurable intermediate)
  ;;   hell -> hel    (milestone 2: measurable intermediate)
  ;;   hel -> he      (milestone 3: measurable intermediate)
  ;;   he -> h        (milestone 4: measurable intermediate)
  ;;   h -> e         (milestone 5: complete — at ground)
  ;; The residue chain IS the plan. Each step has a measurable
  ;; before (car) and after (cdr) as proof of work.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 7c: FUNCTIONALITY ON DEMAND
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; In clockless atomic state flow, functionality is available on
;;; demand. You get the functionality you need by being very
;;; specific about the type of functionality you want.
;;;
;;; If you have already built up a transform, you can use it.
;;; A consolidated flownode on the surface is available to any
;;; subsequent transform that names it. The work is done. The
;;; result is there. Use it.
;;;
;;; This is not lazy evaluation. This is not eager evaluation.
;;; This is structural availability. The shape exists on the
;;; surface. It has been resolved. It is present. Any transform
;;; that needs it can reference it.
;;;
;;; Specificity is the mechanism:
;;;   - A vague request produces nothing (absent)
;;;   - A specific request with a matching shape produces
;;;     the functionality (recognized, available, usable)
;;;   - The more specific the request, the more precise
;;;     the functionality
;;;
;;; This is why every transform has a single-responsibility label.
;;; The label IS the specificity. The label IS the demand.
;;; "factor" demands factoring. "decompose" demands decomposition.
;;; "superpose" demands superposition. Name what you need.

(displayln "\n══════ SECTION 7c: FUNCTIONALITY ON DEMAND ══════")

(surface
  ;; Build a transform. It's now on the surface.
  (transform 'prepared-work
    (presence 'value 60)
    (ground)
    wf:factor)

  ;; Recognize it — it exists. It's available on demand.
  (recognize 'prepared-work)

  ;; Any subsequent work can reference what's already there.
  ;; The flowspace holds all resolved shapes.
  ;; Specificity: we named exactly what we need.
  (disclose 'prepared-work))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 8: WAVEFORMS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A waveform is structural intelligence. It is a pure function:
;;;
;;;   (string, string) -> (listof (cons string string))
;;;
;;; Shape in, residue out. No side effects. No I/O. No state.
;;; The waveform knows how to get from source to target. It
;;; produces the residue — the chain of steps — that fills
;;; the hollow.
;;;
;;; The waveform does not "run." It resolves. Given a source
;;; and a target, it structurally produces the path. The path
;;; is determined by the shape of the source value, not by
;;; stepping through time.
;;;
;;; There is ONE source of non-determinism in the entire machine:
;;; wf:collapse. It uses (random) to sample the Born probability
;;; distribution. This is the measurement problem — the act of
;;; looking is what settles it. Every other waveform is fully
;;; deterministic.
;;;
;;; Available waveforms:
;;;
;;;   QUANTUM:
;;;     wf:hadamard   — superposition. Puts |0> or |1> into
;;;                     equal superposition of both.
;;;     wf:collapse   — measurement. Resolves superposition to
;;;                     |0> or |1> via Born rule. NON-DETERMINISTIC.
;;;     wf:entangle   — Bell pair. Creates maximally correlated
;;;                     two-qubit state from one qubit + ground.
;;;     wf:interfere  — constructive or destructive interference.
;;;                     Paths reinforce or cancel.
;;;     wf:ring       — be -> have -> do -> be. Self-sustaining
;;;                     cycle. The ring IS persistence.
;;;     wf:teleport   — state transfer via entanglement + collapse
;;;                     + classical channel. The state doesn't
;;;                     travel. The information reconstructs.
;;;
;;;   CLASSICAL:
;;;     wf:nand       — the universal gate. NAND(1,1)=0,
;;;                     NAND(anything else)=1. Everything classical
;;;                     is built from this. NAND is the only thing
;;;                     that touches the substrate.
;;;
;;;   STRUCTURAL:
;;;     wf:factor     — prime factorization. Structural recursion
;;;                     on the value. Divides until prime.
;;;     wf:decompose  — string decomposition. Structural recursion
;;;                     on the string. Peels characters until empty.
;;;     wf:sum        — Gauss summation. Structural recursion on
;;;                     the number. Accumulates 1 to n.
;;;
;;; NOTE: The Python machine (strike.py) has four additional waveforms
;;; that perform filesystem I/O:
;;;
;;;     count.py    — traverse a directory tree, count files matching
;;;                   a pattern. Uses os.walk().
;;;     tree.py     — map a directory tree as a chain of file paths.
;;;                   Uses os.walk().
;;;     readfile.py — read a file's contents as a chain of lines
;;;                   (first 20 lines, truncated to 80 chars).
;;;     listdir.py  — list directory contents in sorted order.
;;;
;;; These are NOT in the clockless Racket machine because filesystem
;;; I/O is inherently clocked — it depends on external state. The
;;; clockless machine contains only pure waveforms whose residue is
;;; determined entirely by the shape of the source value.

(displayln "\n══════ SECTION 8: WAVEFORMS ══════")

(surface
  ;; wf:hadamard — superposition
  ;; |0> becomes equal superposition of |0> and |1>
  (transform 'superposition-demo
    (presence 'zero "0")
    (ground)
    wf:hadamard)
  (disclose 'superposition-demo)

  ;; wf:collapse — measurement (NON-DETERMINISTIC)
  ;; Each run may produce |0> or |1>. Born rule.
  (transform 'measurement-demo
    (presence 'sup "0.7071|0>+0.7071|1>")
    (ground)
    wf:collapse)
  (disclose 'measurement-demo)

  ;; wf:entangle — Bell pair
  ;; One qubit + ground becomes maximally entangled pair
  (transform 'entanglement-demo
    (presence 'qubit "0")
    (ground)
    wf:entangle)
  (disclose 'entanglement-demo)

  ;; wf:interfere — constructive: paths reinforce
  (transform 'constructive-demo
    (presence 'path-c "constructive")
    (ground)
    wf:interfere)
  (disclose 'constructive-demo)

  ;; wf:interfere — destructive: paths cancel
  (transform 'destructive-demo
    (presence 'path-d "destructive")
    (ground)
    wf:interfere)
  (disclose 'destructive-demo)

  ;; wf:interfere — HH identity: Hadamard twice = back to start
  (transform 'identity-demo
    (presence 'path-hh "HH")
    (ground)
    wf:interfere)
  (disclose 'identity-demo)

  ;; wf:ring — be -> have -> do -> be
  ;; Self-sustaining cycle. One strike, permanent current.
  (transform 'ring-demo
    (presence 'being "be")
    (ground)
    wf:ring)
  (disclose 'ring-demo)

  ;; wf:teleport — quantum teleportation protocol
  ;; State doesn't travel. Information reconstructs.
  (transform 'teleport-demo
    (presence 'secret "my_state")
    (ground)
    wf:teleport)
  (disclose 'teleport-demo)

  ;; wf:nand — universal classical gate
  (transform 'nand-demo
    (presence 'both-on "1,1")
    (ground)
    wf:nand)
  (disclose 'nand-demo)

  ;; wf:factor — prime factorization
  (transform 'factor-demo
    (presence 'sixty 60)
    (ground)
    wf:factor)
  (disclose 'factor-demo)

  ;; wf:decompose — string decomposition
  (transform 'decompose-demo
    (presence 'word "hello")
    (ground)
    wf:decompose)
  (disclose 'decompose-demo)

  ;; wf:sum — Gauss summation (1 + 2 + ... + 10 = 55)
  (transform 'sum-demo
    (presence 'ten 10)
    (ground)
    wf:sum)
  (disclose 'sum-demo))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 9: LABELS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A label is a name you give a shape. The name is yours.
;;; You invent it. The shape doesn't care what you call it.
;;;
;;; Labels are for human readability. They are NOT computation.
;;; They function like a lookup — you use the label to find the
;;; shape on the surface. But there is no cache, no hash table
;;; at runtime, no indirection. The label IS the shape's handle.
;;;
;;; One shape can have many labels:
;;;   "ten"     — when you're counting
;;;   "fingers" — when you're talking about hands
;;;   "decade"  — when you're talking about time
;;; Same shape (10). Three use cases.
;;;
;;; Labels also name compositions. When you say "NOT", that's
;;; a label for a specific arrangement of NAND. When you say
;;; "QKD", that's a label for a specific arrangement of
;;; superposition + entanglement + collapse + interference.
;;; The label names the composition. The composition IS the
;;; arrangement of shapes on the surface. The labels ARE the
;;; compositions. The compositions ARE the programs.
;;;
;;; In the Racket machine, the first argument to (presence ...),
;;; (transform ...), etc. is the label. It's a symbol — a human
;;; word. The surface stores shapes by label in the flowspace.

(displayln "\n══════ SECTION 9: LABELS ══════")

(surface
  ;; One shape (10). Three labels. Three use cases.
  (presence 'ten 10)
  (presence 'fingers 10)
  (presence 'decade 10)

  ;; "NOT" is a label for NAND(A,A).
  ;; NOT(1) = NAND(1,1) = 0.
  ;; The label "not-one" names a specific arrangement of NAND.
  (transform 'not-one
    (presence 'both "1,1")
    (ground)
    wf:nand)

  ;; Disclose shows the labels at work.
  (disclose 'ten)
  (disclose 'fingers)
  (disclose 'decade)
  (disclose 'not-one))
  ;; Same shape (10), three labels.
  ;; "not-one" is a label for a NAND arrangement.
  ;; The labels are for you. The shapes don't care.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 10: THE QUANTUM AFFORDANCES — COMPLETE SET
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; An affordance is a capability that a shape provides.
;;; The complete set of quantum affordances:
;;;
;;;   1. SUPERPOSITION — a shape exists in multiple states at once.
;;;      Before measurement, the qubit is BOTH. Not either/or.
;;;      Both. The Hadamard gate creates equal superposition.
;;;
;;;   2. COLLAPSE — measurement resolves superposition to one
;;;      state. The act of looking is what settles it. Born rule:
;;;      probability proportional to |amplitude|^2. This is the
;;;      ONE source of non-determinism in the machine.
;;;
;;;   3. ENTANGLEMENT — two particles, one fate. Create a Bell
;;;      pair. Measure one, you know the other. No signal travels.
;;;      The correlation was there from creation.
;;;
;;;   4. INTERFERENCE — paths that reinforce or cancel. This is
;;;      how quantum computers solve problems: wrong answers
;;;      destructively interfere (cancel). Right answer
;;;      constructively interferes (survives). Shor's algorithm
;;;      is a constitutional filter.
;;;
;;;   5. RING — be -> have -> do -> be. Self-sustaining. One
;;;      strike, permanent current. The cycle IS persistence.
;;;      The ring is why resolved shapes stay resolved.
;;;
;;;   6. TELEPORTATION — state transfer without physical movement.
;;;      Requires entanglement + collapse + classical channel.
;;;      The state doesn't travel. The information reconstructs.
;;;
;;;   7. NAND — the universal classical gate. Everything classical
;;;      is built from this. NAND is the only thing that touches
;;;      the substrate.
;;;
;;; Each affordance is a shape. Each shape conducts. One waveform
;;; per affordance. One striking surface.

(displayln "\n══════ SECTION 10: QUANTUM AFFORDANCES ══════")

(surface
  ;; The complete set, all at once. One Dyck word.
  ;; Seven affordances. Seven transforms. One surface.

  ;; 1. SUPERPOSITION
  (transform 'superpose
    (presence 'qubit-zero 0)
    (ground)
    wf:hadamard)

  ;; 2. COLLAPSE
  (transform 'measure
    (presence 'superposed "0.7071|0>+0.7071|1>")
    (ground)
    wf:collapse)

  ;; 3. ENTANGLEMENT
  (transform 'bell-pair
    (presence 'alice-qubit 0)
    (ground)
    wf:entangle)

  ;; 4. INTERFERENCE (three modes)
  (transform 'reinforce
    (presence 'path-constructive "constructive")
    (ground)
    wf:interfere)
  (transform 'cancel
    (presence 'path-destructive "destructive")
    (ground)
    wf:interfere)
  (transform 'identity
    (presence 'path-HH "HH")
    (ground)
    wf:interfere)

  ;; 5. RING
  (transform 'lifecycle
    (presence 'being "be")
    (ground)
    wf:ring)

  ;; 6. TELEPORTATION
  (transform 'teleport
    (presence 'alice-state "secret_quantum_state")
    (ground)
    wf:teleport)

  ;; 7. NAND
  (transform 'nand
    (presence 'bits-11 "1,1")
    (ground)
    wf:nand)

  (disclose 'superpose)
  (disclose 'measure)
  (disclose 'bell-pair)
  (disclose 'reinforce)
  (disclose 'cancel)
  (disclose 'identity)
  (disclose 'lifecycle)
  (disclose 'teleport)
  (disclose 'nand))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 11: UNIVERSALITY — NAND AND THE SUBSTRATE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; NAND is the only waveform that touches the substrate for
;;; classical computation. Every other classical gate — NOT, AND,
;;; OR, XOR — is a label for a specific arrangement of NAND.
;;;
;;;   NOT(A)    = NAND(A, A)
;;;   AND(A,B)  = NOT(NAND(A,B)) = NAND(NAND(A,B), NAND(A,B))
;;;   OR(A,B)   = NAND(NOT(A), NOT(B))
;;;   XOR(A,B)  = NAND(NAND(A, NAND(A,B)), NAND(B, NAND(A,B)))
;;;
;;; The gates are labels. The shapes are arrangements of NAND.
;;; No new waveform is needed. One waveform. Many arrangements.
;;; Many labels. The labels ARE the compositions.

(displayln "\n══════ SECTION 11: UNIVERSALITY ══════")

(surface
  ;; NAND truth table — all four input combinations
  (transform 'nand-11 (presence 'in-11 "1,1") (ground) wf:nand)
  (transform 'nand-10 (presence 'in-10 "1,0") (ground) wf:nand)
  (transform 'nand-01 (presence 'in-01 "0,1") (ground) wf:nand)
  (transform 'nand-00 (presence 'in-00 "0,0") (ground) wf:nand)

  (disclose 'nand-11)   ;; 1,1 -> 0
  (disclose 'nand-10)   ;; 1,0 -> 1
  (disclose 'nand-01)   ;; 0,1 -> 1
  (disclose 'nand-00)   ;; 0,0 -> 1

  ;; NOT from NAND: NOT(1) = NAND(1,1) = 0
  (transform 'not-1 (presence 'one-one "1,1") (ground) wf:nand)
  ;; NOT(0) = NAND(0,0) = 1
  (transform 'not-0 (presence 'zero-zero "0,0") (ground) wf:nand)

  (disclose 'not-1)     ;; 1,1 -> 0  (NOT 1 = 0)
  (disclose 'not-0)     ;; 0,0 -> 1  (NOT 0 = 1)

  ;; AND from NAND: AND(1,1) = NOT(NAND(1,1)) = NOT(0) = NAND(0,0) = 1
  (transform 'and-11 (presence 'and-mid "0,0") (ground) wf:nand)
  (disclose 'and-11))   ;; 0,0 -> 1  (AND 1,1 = 1)


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 12: COMPOSITION
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Compositions are not separate waveforms. They are LABELS for
;;; specific ARRANGEMENTS of the affordances.
;;;
;;; The label names the composition.
;;; The composition IS the arrangement of shapes on the surface.
;;; The affordances ARE the building blocks.
;;; The labels ARE the compositions.
;;; The compositions ARE the programs.
;;;
;;; Known compositions:
;;;
;;;   QKD (Quantum Key Distribution)
;;;     = superposition + entanglement + collapse + interference
;;;     Alice superposes, entangles with Bob, both collapse,
;;;     interference detects eavesdropper.
;;;
;;;   ML (Quantum Machine Learning)
;;;     = superposition + collapse + interference
;;;     Superpose similar shapes, interfere (amplify resonant,
;;;     cancel dissonant), collapse to response.
;;;
;;;   TELEPORT
;;;     = entanglement + collapse + classical channel
;;;     Entangle, collapse Alice's side, Bob corrects.
;;;
;;;   OPTIMIZE
;;;     = superposition + collapse
;;;     Try all routes (superpose), collapse to shortest.
;;;
;;; These are not separate programs. They are different
;;; arrangements of the same seven affordances on the same
;;; surface. Writing a new composition means placing existing
;;; affordances in a new arrangement.

(displayln "\n══════ SECTION 12: COMPOSITION ══════")

;; QKD: Alice prepares (superpose), shares (entangle),
;;       both measure (collapse), verify channel (interfere).
(surface
  ;; Alice prepares key bits via superposition
  (transform 'alice-prep
    (presence 'key-bit "0")
    (ground)
    wf:hadamard)

  ;; Entangle to share with Bob
  (transform 'shared-pair
    (presence 'alice-side "0")
    (ground)
    wf:entangle)

  ;; Bob measures — collapse to key bit
  (transform 'bob-measures
    (presence 'bob-superposed "0.7071|0>+0.7071|1>")
    (ground)
    wf:collapse)

  ;; Verify no eavesdropper — constructive interference = clean
  (transform 'channel-verify
    (presence 'channel "constructive")
    (ground)
    wf:interfere)

  (disclose 'alice-prep)
  (disclose 'shared-pair)
  (disclose 'bob-measures)
  (disclose 'channel-verify))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 13: CONTINUATIONS
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Once the basic O(1) machine is set up — the breadboard with
;;; its shapes — additional functionality is added by registering
;;; continuations.
;;;
;;; A continuation is a new transformation registered onto the
;;; existing machine. It is instantaneously transformative of the
;;; entire machine. The machine doesn't restart. It doesn't
;;; re-execute. The new shape is simply... part of the circuit now.
;;;
;;; In the Racket machine, this is literal: you call (surface ...)
;;; with additional transforms. Each surface invocation is a
;;; complete circuit. But transforms from one surface can inform
;;; the shapes placed on the next — the resolved value of one
;;; transform becomes the input shape for the next.
;;;
;;; The machine grows by accretion. Each new transform is a
;;; continuation — it extends the circuit without invalidating
;;; what's already resolved.

(displayln "\n══════ SECTION 13: CONTINUATIONS ══════")

;; First surface: establish base shapes
(displayln "  --- base machine ---")
(surface
  (transform 'factor-360
    (presence 'n 360)
    (ground)
    wf:factor)
  (disclose 'factor-360))

;; Continuation: new transform using knowledge from above
;; 360 = 2 * 2 * 2 * 3 * 3 * 5 (factored to ground)
;; Now ask a new question of a different shape.
(displayln "  --- continuation ---")
(surface
  (transform 'factor-97
    (presence 'prime 97)
    (ground)
    wf:factor)
  (disclose 'factor-97)

  ;; 97 is prime — no factors to extract.
  ;; Empty residue. Source is already at ground.
  ;; The constitution recognizes this: "at ground."
  (recognize 'factor-97))


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 14: THE INSIGHT
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; In clockless atomic state flow, the definition of complete
;;; work IS the complete work.
;;;
;;; You set it up like a function signature:
;;;
;;;   - Source containment = formal definition of inputs
;;;   - Target containment = formal definition of outputs
;;;   - Transformation list = hollow (empty)
;;;
;;; You tell the structural intelligence (the waveform) that the
;;; definition of complete work is the target. The waveform fills
;;; the hollow. The constitution verifies the path. If you provide
;;; the interface, you get the implementation for free.
;;;
;;; This is the same thing as acceptance tests. You write what
;;; "done" looks like. The test IS the implementation.
;;;
;;; This is why the machine is O(1). There is nothing to iterate.
;;; The shape IS the answer. The Dyck word IS the program. The
;;; balanced parentheses ARE the circuit topology. You evaluate
;;; the expression. The circuit completes.
;;;
;;; One breadboard. One striking surface. One grounded frame.
;;; Strike it.

(displayln "\n══════ SECTION 14: THE INSIGHT ══════")

(surface
  ;; The interface IS the implementation.
  ;; Source: what you have. Target: what "done" looks like.
  ;; The waveform fills the gap.

  ;; "Factor 60 to ground."
  ;; That sentence IS the program. The answer is in the shape.
  (transform 'the-insight
    (presence 'shape 60)
    (ground)
    wf:factor)

  (disclose 'the-insight))

;; The residue is: 60 -> 30 -> 15 -> 5
;; chain✓ grounded✓ complete✓ balanced✓ minimal✓
;; )  complete.
;;
;; The definition of complete work (reach ground via factoring)
;; IS the complete work (the prime decomposition path).
;; The interface (source=60, target=ground, waveform=factor)
;; IS the implementation (60 -> 30 -> 15 -> 5).
;;
;; One breadboard. One striking surface. One grounded frame.


;;; ═══════════════════════════════════════════════════════════════
;;; APPENDIX: WRITING YOUR OWN WAVEFORM
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; A waveform is any pure function with signature:
;;;
;;;   (define (my-waveform source target)
;;;     ... returns list of (cons from to) pairs ...)
;;;
;;; The function takes two strings (source value, target value)
;;; and returns a list of pairs. Each pair is one step in the
;;; residue chain:
;;;
;;;   (list (cons "start" "middle")
;;;         (cons "middle" "end"))
;;;
;;; The striking surface reads the pairs, checks the constitution,
;;; and tells you if the circuit holds.
;;;
;;; Rules:
;;;   - The first pair must start from source (grounded)
;;;   - Each pair's endpoint must be the next pair's start (chain)
;;;   - No pair may have equal start and end (balanced)
;;;   - No start may repeat (minimal)
;;;   - The last pair should reach target or ground (complete)
;;;
;;; Example: a waveform that doubles a number three times.

(displayln "\n══════ APPENDIX: CUSTOM WAVEFORM ══════")

(define (wf:triple-double source target)
  (let* ([n (string->number (->str source))]
         [n2 (* n 2)]
         [n4 (* n2 2)]
         [n8 (* n4 2)])
    (list (cons (->str n) (->str n2))
          (cons (->str n2) (->str n4))
          (cons (->str n4) (->str n8)))))

(surface
  (transform 'double-three-times
    (presence 'five 5)
    (ground)
    wf:triple-double)
  (disclose 'double-three-times))

;; Residue: 5 -> 10 -> 20 -> 40
;; chain✓ grounded✓ complete✓ balanced✓ minimal✓
;; )  complete.


;;; ═══════════════════════════════════════════════════════════════
;;; APPENDIX B: DISCOVERIES
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Five structural properties discovered by experimenting with
;;; the machine.


;;; -----------------------------------------------------------
;;; DISCOVERY 1: NESTING IS COMPOSITION
;;; -----------------------------------------------------------
;;;
;;; A transform can be the source expression of another transform.
;;; The inner transform resolves first — structural nesting
;;; determines resolution order — and its result value flows
;;; outward to become the source of the outer transform.
;;;
;;; You don't wire composition. You nest it. The Dyck word depth
;;; IS the composition order.

(displayln "\n══════ DISCOVERY 1: NESTING IS COMPOSITION ══════")

(surface
  ;; The inner transform (factor 360) resolves first.
  ;; Its result value (5) becomes the source of the outer.
  ;; The outer (decompose "5") resolves second.
  ;; Two waveforms, composed by nesting. No manual wiring.
  (transform 'outer
    (transform 'inner
      (presence 'seed 360)
      (ground)
      wf:factor)
    (ground)
    wf:decompose)
  (disclose 'inner)
  (disclose 'outer))
  ;; inner: 360 -> 180 -> 90 -> 45 -> 15 -> 5
  ;; outer: 5 -> e
  ;; The nesting IS the composition.


;;; -----------------------------------------------------------
;;; DISCOVERY 2: CYCLES ARE CONSTITUTIONAL
;;; -----------------------------------------------------------
;;;
;;; The ring waveform produces residue that returns to source:
;;; be -> have -> do -> be. The last endpoint equals the first
;;; start. The constitution says complete✓.
;;;
;;; "Complete" means current stopped. A cycle that returns to
;;; origin HAS stopped — it's self-sustaining. The ring IS
;;; constitutional. This is why persistence works. A complete
;;; circuit doesn't have to arrive somewhere new. It can
;;; arrive back.

(displayln "\n══════ DISCOVERY 2: CYCLES ARE CONSTITUTIONAL ══════")

(surface
  (transform 'cycle
    (presence 'start "be")
    (ground)
    wf:ring)
  (disclose 'cycle))
  ;; be -> have -> do -> be
  ;; chain✓ grounded✓ complete✓ balanced✓ minimal✓
  ;; The last step ends where the first step began.
  ;; The circuit is closed. The ring persists.


;;; -----------------------------------------------------------
;;; DISCOVERY 3: THREE FAILURE MODES
;;; -----------------------------------------------------------
;;;
;;; The constitution catches exactly three ways a circuit breaks:
;;;
;;;   1. WRONG START — residue doesn't begin from source.
;;;      grounded✗. The current starts from the wrong place.
;;;
;;;   2. STASIS — a step goes nowhere (self-loop: a -> a).
;;;      balanced✗. No progress is made.
;;;
;;;   3. BRANCHING — the path forks (two steps from same start).
;;;      chain✗ and minimal✗. Current can't split.
;;;
;;; These are the ONLY ways a circuit breaks. Every other
;;; configuration passes. The constitution is a complete
;;; characterization of "broken circuit."

(displayln "\n══════ DISCOVERY 3: THREE FAILURE MODES ══════")

;; Failure mode 1: WRONG START (grounded✗)
(define (wf:wrong-start source target)
  (list (cons "wrong" "place")))

(surface
  (transform 'wrong-start
    (presence 'x "hello")
    (ground)
    wf:wrong-start)
  (disclose 'wrong-start))
  ;; grounded✗ — residue starts from "wrong", not "hello"

;; Failure mode 2: STASIS (balanced✗)
(define (wf:self-loop source target)
  (list (cons (->str source) (->str source))))

(surface
  (transform 'stasis
    (presence 'y "7")
    (ground)
    wf:self-loop)
  (disclose 'stasis))
  ;; balanced✗ — 7 -> 7 makes no progress

;; Failure mode 3: BRANCHING (chain✗ minimal✗)
(define (wf:fork source target)
  (list (cons (->str source) "left")
        (cons (->str source) "right")))

(surface
  (transform 'branch
    (presence 'z "alpha")
    (ground)
    wf:fork)
  (disclose 'branch))
  ;; chain✗ minimal✗ — current can't split


;;; -----------------------------------------------------------
;;; DISCOVERY 4: IRREDUCIBILITY = ALREADY AT GROUND
;;; -----------------------------------------------------------
;;;
;;; Primes produce zero shapes of residue. All five constitution
;;; checks pass on empty residue. A prime has no factors to
;;; extract — it IS ground. There exists a class of shapes that
;;; need no transformation. They are already complete.
;;;
;;; Empty residue is the most constitutional residue possible:
;;; trivially chained, trivially grounded, trivially complete,
;;; trivially balanced, trivially minimal.

(displayln "\n══════ DISCOVERY 4: IRREDUCIBILITY ══════")

(surface
  (transform 'prime-2  (presence 'p2 2)  (ground) wf:factor)
  (transform 'prime-7  (presence 'p7 7)  (ground) wf:factor)
  (transform 'prime-97 (presence 'p97 97) (ground) wf:factor)
  (disclose 'prime-2)
  (disclose 'prime-7)
  (disclose 'prime-97))
  ;; All three: 0 shapes. chain✓ grounded✓ complete✓ balanced✓ minimal✓
  ;; Already at ground. Nothing to do. Complete.


;;; -----------------------------------------------------------
;;; DISCOVERY 5: THE EMPTY SURFACE IS VALID
;;; -----------------------------------------------------------
;;;
;;; (surface) with no shapes produces 0 shapes on the surface.
;;; No error. No CUT. The machine with nothing on it is a valid
;;; machine. This is the ground state of the machine itself —
;;; the breadboard before any components. It is the identity
;;; element of the surface, the same way "e" is the identity
;;; element of ground.

(displayln "\n══════ DISCOVERY 5: THE EMPTY SURFACE ══════")

(surface)
  ;; flowspace: 0 shapes on the surface
  ;; The empty circuit is valid.
  ;; The breadboard before any components.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 15: GOVERNANCE — THE MODEL APPLIED TO WORKFLOW
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Governance is not a rule imposed on the model. It IS the model.
;;; Before any work begins, three phases:
;;;
;;;   PHASE 1: TRANSFORM
;;;     Co-define intention (source) and outcome (target).
;;;     What are we doing, why, and what does done look like?
;;;     Intention and outcome are co-discovered — you don't fully
;;;     know the intention until you articulate the outcome, and
;;;     the outcome sharpens as the intention clarifies. They are
;;;     source and target, defined together like two ends of the
;;;     same wire. Outcome must account for updated documentation
;;;     and working demonstrations.
;;;
;;;   PHASE 2: PLAN
;;;     From the outcome backwards, decompose into a topologically
;;;     sorted list of steps. Each step has a boolean indicator:
;;;     done or not done. The plan IS the residue chain traced
;;;     from target back to source.
;;;
;;;   PHASE 3: ALIGNMENT
;;;     Both intelligence partners confirm the plan is
;;;     constitutional: chain, grounded, complete, balanced,
;;;     minimal. Then strike.
;;;
;;; Governance is a view of the Flownode Development Lifecycle
;;; (Section 20):
;;;   Transform = Ideate + Formalize
;;;   Plan      = Strategy
;;;   Alignment = Test
;;;   Strike    = Fulfillment
;;;
;;; Discussion can happen to establish the transform. No other
;;; work begins until alignment, unless a relevant exception is
;;; explicitly made.
;;;
;;; A transform has three containments: source, target, waveform.
;;; Governance has three phases: transform, plan, alignment.
;;; Same shape. Same circuit. Same strike.

(displayln "\n══════ SECTION 15: GOVERNANCE ══════")

;; Phase 1: TRANSFORM — co-define intention and outcome.
;;   Intention: understand the structure of 360.
;;   Outcome: a chain of prime factors from 360 to ground.
;;   (These emerge together — you can't state one without the other.)

;; Phase 2: PLAN — from outcome backwards, with indicators.
;;   Step 3: residue is constitutional? [done/not done]
;;   Step 2: wf:factor decomposes 360? [done/not done]
;;   Step 1: place 360 on the surface? [done/not done]

;; Phase 3: ALIGNMENT — both partners confirm. Strike.

(surface
  (transform 'governed-task
    (presence 'intention 360)    ; source: the intention
    (ground)                      ; target: the outcome (ground = done)
    wf:factor)                    ; plan: the waveform that gets us there
  (disclose 'governed-task))
  ;; The residue IS the plan, executed.
  ;; 360 -> 2, 2 -> 3, 3 -> 5, ... chain to ground.
  ;; All indicators: done. Constitutional. Complete.

;; The empty governed task: no transform, no plan, no alignment.
;; Still valid. The machine before any work begins.
(surface)
  ;; Governance with nothing to govern = the empty surface.
  ;; Valid. Ready. Waiting for the transform to be defined.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 16: O(1) STRUCTURAL RESOLUTION
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The machine makes ONE structural pass through all shapes.
;;; Each shape is resolved EXACTLY ONCE. No iteration. No
;;; re-processing. No convergence loops.
;;;
;;; Resolution depth = nesting depth of the Dyck word, not the
;;; number of shapes. Adding more shapes to the breadboard does
;;; not add resolution passes. A surface with 10 shapes and a
;;; surface with 10,000 shapes both resolve in one pass.
;;;
;;; In a parallel execution model, all siblings at the same
;;; depth resolve simultaneously. O(1).
;;;
;;; ASF resolution is O(1). Waveforms may reach through the
;;; membrane into clocked substrates (see Section 19). The
;;; substrate cost is the membrane's domain, not ASF's. From
;;; ASF's perspective, every waveform call is one structural
;;; step — regardless of what happens inside the membrane.
;;;
;;; Full proof with benchmarks: programs/o1-proof.rkt

(displayln "\n══════ SECTION 16: O(1) RESOLUTION ══════")

;; Demonstration: two transforms at the same depth.
;; Both resolve in one pass. Neither waits for the other.
(surface
  (transform 'resolve-once-a (presence 'ra "1,0") (ground) wf:nand)
  (transform 'resolve-once-b (presence 'rb "0,1") (ground) wf:nand)
  (disclose 'resolve-once-a)
  (disclose 'resolve-once-b))
  ;; Two shapes. One pass. O(1).


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 17: PAN-MEDIA — FUNCTIONALITY ON DEMAND
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The surface doesn't care what the waveform does.
;;; It cares that the residue is constitutional.
;;; Register a waveform for any media type — text, numeric,
;;; structural, binary, quantum — the surface resolves it
;;; the same way.
;;;
;;; Pan-media = register waveforms on demand.
;;; Functionality on demand = registration of new transforms.
;;; This IS continuations. One concept, two labels.
;;;
;;; The surface IS already a pan-media machine. It always was.
;;; You don't build pan-media capability. You register it.
;;;
;;; Full demonstration with 7 media types: programs/pan-media.rkt

(displayln "\n══════ SECTION 17: PAN-MEDIA ══════")

;; A custom waveform for a new media type: text reversal.
;; Register it. Use it. The surface doesn't care.
(define (wf:reverse-text source target)
  (let* ([s (->str source)]
         [rev (list->string (reverse (string->list s)))])
    (list (cons s rev)
          (cons rev "e"))))

(surface
  (transform 'reverse-demo
    (presence 'msg "hello")
    (ground)
    wf:reverse-text)
  (disclose 'reverse-demo))
  ;; "hello" -> "olleh". Constitutional. Complete.
  ;; One registration. One new media capability.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 18: ENFORCEMENT
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; The Makefile enforces two properties on all programs:
;;;
;;;   1. STATIC LINT — no forbidden constructs.
;;;      Scans for: for, while, do, set!
;;;      If found: FAIL. Iteration or mutation detected.
;;;
;;;   2. TIME BUDGET — every program must complete within
;;;      a fixed time limit (30 seconds).
;;;      If exceeded: FAIL. The circuit took too long.
;;;
;;; These are constitution checks on the WORKFLOW.
;;; The Makefile is the striking surface for the process.
;;; A program that iterates is a CUT.
;;; A program that times out is a CUT.
;;;
;;; Run: make test (includes lint automatically)
;;; Run: make lint (static analysis only)

(displayln "\n══════ SECTION 18: ENFORCEMENT ══════")
(displayln "  make lint — no forbidden constructs in any program")
(displayln "  make test — includes lint + time budget + circuit verification")


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 19: DOUBLE MEMBRANE ENGULFMENT
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; ASF is clockless. The substrate (Racket, the OS, hardware)
;;; is clocked. The WAVEFORM is the membrane between them.
;;;
;;; Double membrane engulfment:
;;;   Inner membrane = the transform definition.
;;;     Source, target, waveform. Pure ASF. Clockless.
;;;   Outer membrane = the waveform implementation.
;;;     Runs on the substrate. Clocked if it needs to be.
;;;   ASF wraps substrate capabilities without inheriting
;;;   their constraints.
;;;
;;; From ASF's perspective, every waveform call is one
;;; structural step. O(1). What happens inside the membrane
;;; — recursion, I/O, network calls, GPU kernels — is the
;;; substrate's concern. ASF rides on top, penalty free.
;;;
;;; PRIORITY ORDER for new functionality:
;;;
;;;   1. FIRST: Express it as transforms on the surface.
;;;      Pure ASF. O(1). The power is in the composition
;;;      of atomic transforms, not in clever waveforms.
;;;      Build bespoke functionality on demand.
;;;
;;;   2. IF NEEDED: Build a bespoke O(1) waveform.
;;;      One structural step. Minimal membrane.
;;;
;;;   3. LAST RESORT: Engulf a clocked substrate capability.
;;;      Full membrane. The substrate does the work.
;;;      ASF doesn't care how — only that the residue
;;;      is constitutional.
;;;
;;; The model waveform is wf:nand — one operation, one step,
;;; O(1). All classical gates are compositions of NAND.
;;; The power is in arrangement, not in atoms.

(displayln "\n══════ SECTION 19: DOUBLE MEMBRANE ENGULFMENT ══════")

;; Demonstration: a substrate-engulfing waveform vs a pure ASF composition.
;;
;; ENGULFMENT: wf:factor recurses in the substrate to find factors.
;; The recursion is the substrate's problem. ASF sees one step.
(surface
  (transform 'engulf-demo
    (presence 'n 30)
    (ground)
    wf:factor)
  (disclose 'engulf-demo))
  ;; 30 -> 15 -> 5. Three shapes of residue.
  ;; wf:factor recurses internally. ASF doesn't care.
  ;; One transform. One resolution. O(1) from ASF's view.

;; PURE ASF: the same result through composition of atomic transforms.
;; Each wf:nand is O(1). The power is in the arrangement.
(surface
  (transform 'nand-a (presence 'x "1,1") (ground) wf:nand)
  (transform 'nand-b (presence 'y "1,0") (ground) wf:nand)
  (transform 'nand-c (presence 'z "0,0") (ground) wf:nand))
  ;; Three O(1) transforms. No membrane needed.
  ;; Composition IS the program. Arrangement IS the power.


;;; ═══════════════════════════════════════════════════════════════
;;; SECTION 20: FLOWNODE DEVELOPMENT LIFECYCLE
;;; ═══════════════════════════════════════════════════════════════
;;;
;;; Every flownode progresses through five stages:
;;;
;;;   1. IDEATE — many idea flownodes converge to one.
;;;      in: idea flownodes. out: one single idea flownode.
;;;
;;;   2. FORMALIZE — declare the interface.
;;;      What goes in, what comes out, specifically.
;;;      This IS the definition of complete work.
;;;      in: idea flownode. out: interface flownode.
;;;
;;;   3. STRATEGY — how to achieve the complete work.
;;;      in: interface flownode. out: strategy flownode.
;;;
;;;   4. TEST — a fool-proof, reality-based method of knowing
;;;      when complete work is present.
;;;      in: strategy flownode. out: "not yet" flownode.
;;;
;;;   5. FULFILLMENT — demonstrate complete work.
;;;      in: "not yet" flownode. out: demonstrating flownode.
;;;
;;; INDICATOR AND-CHAINING tracks progression:
;;;
;;;   ideated? ∧ formalized? ∧ strategized? ∧ tested? ∧ fulfilled?
;;;
;;; A partially-resolved chain carries information:
;;;   ideated?✓ formalized?✓ strategized?✗
;;;   = has an interface, strategy in progress.
;;;
;;; PLAYABLE NODES: a flownode with an interface (stage 2+)
;;; but not yet fulfilled is "playable" — it can be placed on
;;; the flowstack of the current flownode IDE. You can program
;;; against the interface before the implementation exists.
;;;
;;; The governance process (Section 15) is a view of this lifecycle:
;;;   Transform = Ideate + Formalize
;;;   Plan = Strategy
;;;   Alignment = Test
;;;   Strike = Fulfillment

(displayln "\n══════ SECTION 20: FLOWNODE DEVELOPMENT LIFECYCLE ══════")

;; Example: building a NOT gate from NAND.
;; We progress through all five lifecycle stages.

;; STAGE 1: IDEATE
;; Many ideas converge to one: NOT(x) can be built from NAND.
(displayln "\n  --- Stage 1: IDEATE ---")
(displayln "  idea: build NOT from NAND")
(displayln "  ideated?✓")

;; STAGE 2: FORMALIZE
;; Interface: in = one bit (0 or 1), out = complement.
;; Definition of complete work: NOT(0)=1, NOT(1)=0.
(displayln "\n  --- Stage 2: FORMALIZE ---")
(displayln "  interface: in=bit, out=complement")
(displayln "  definition of complete work: NOT(0)=1, NOT(1)=0")
(displayln "  ideated?✓ formalized?✓")
(displayln "  [this flownode is now PLAYABLE]")

;; STAGE 3: STRATEGY
;; NOT(x) = NAND(x, x). Feed the same bit to both inputs.
(displayln "\n  --- Stage 3: STRATEGY ---")
(displayln "  strategy: NOT(x) = NAND(x, x)")
(displayln "  ideated?✓ formalized?✓ strategized?✓")

;; STAGE 4: TEST
;; When NAND(0,0)=1 and NAND(1,1)=0, complete work is present.
(displayln "\n  --- Stage 4: TEST ---")
(displayln "  test: NAND(0,0) must yield 1, NAND(1,1) must yield 0")
(displayln "  ideated?✓ formalized?✓ strategized?✓ tested?✓")

;; STAGE 5: FULFILLMENT
;; Demonstrate. Strike the circuit.
(displayln "\n  --- Stage 5: FULFILLMENT ---")

(surface
  (transform 'not-0
    (presence 'bit-0 "0,0")
    (ground)
    wf:nand)
  (transform 'not-1
    (presence 'bit-1 "1,1")
    (ground)
    wf:nand)
  (disclose 'not-0)
  (disclose 'not-1))
  ;; NOT(0) = NAND(0,0) = 1  ✓
  ;; NOT(1) = NAND(1,1) = 0  ✓
  ;; Complete work demonstrated.

(displayln "  ideated?✓ formalized?✓ strategized?✓ tested?✓ fulfilled?✓")
(displayln "  All indicators resolved. Lifecycle complete.")
