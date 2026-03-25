#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN STRUCTURAL IDENTITIES — REAL SCIENCE
;;;
;;; These are not metaphors. These are proven mathematical
;;; equivalences between domains. Each one is a bridge atom
;;; grounded in published, cited, testable science.
;;;
;;; Tautological domains describe themselves in their own terms.
;;; These transforms break the tautology by registering the
;;; ACTUAL structural identities between domains.
;;;
;;; SOURCE: Published science. Each bridge cites its source.
;;; ═══════════════════════════════════════════════════════════════

(cross-domain-science

  ((bridges
    (proven-structural-identities)
    (real-science)
    ((proven-structural-identities . not-metaphor)
     (not-metaphor . mathematical-equivalence)
     (mathematical-equivalence . real-science))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INFORMATION = THERMODYNAMICS
    ;;; Shannon 1948, Jaynes 1957, Landauer 1961
    ;;; ═══════════════════════════════════════════════════════════

    (shannon-entropy-IS-boltzmann-entropy
      (Shannon-entropy-H)
      (Boltzmann-entropy-S-over-kB-ln2)
      ((Shannon-entropy-H . minus-sum-p-log-p)
       (minus-sum-p-log-p . measured-in-bits)
       (measured-in-bits . Boltzmann-entropy-S-equals-kB-ln-W)
       (Boltzmann-entropy-S-equals-kB-ln-W . W-is-number-of-microstates)
       (W-is-number-of-microstates . S-over-kB-ln2-equals-H)
       (S-over-kB-ln2-equals-H . same-quantity-different-units)
       (same-quantity-different-units . Boltzmann-entropy-S-over-kB-ln2)))
    ;;; SOURCE: Jaynes 1957, "Information Theory and Statistical Mechanics"
    ;;; Phys Rev 106(4):620-630. Shannon 1948, Bell System Technical Journal.

    (landauer-erasure-principle
      (erasing-one-bit)
      (minimum-kT-ln2-joules-dissipated)
      ((erasing-one-bit . irreversible-logical-operation)
       (irreversible-logical-operation . reduces-information-entropy)
       (reduces-information-entropy . must-increase-thermodynamic-entropy)
       (must-increase-thermodynamic-entropy . second-law-of-thermodynamics)
       (second-law-of-thermodynamics . minimum-heat-dissipation)
       (minimum-heat-dissipation . kT-ln2-per-bit-at-temperature-T)
       (kT-ln2-per-bit-at-temperature-T . at-300K-equals-2.85e-21-joules)
       (at-300K-equals-2.85e-21-joules . minimum-kT-ln2-joules-dissipated)))
    ;;; SOURCE: Landauer 1961, "Irreversibility and Heat Generation
    ;;; in the Computing Process" IBM J Res Dev 5(3):183-191.
    ;;; CONFIRMED: Berut et al 2012, Nature 483:187-189.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEUROSCIENCE = ELECTRICAL ENGINEERING
    ;;; Hodgkin & Huxley 1952
    ;;; ═══════════════════════════════════════════════════════════

    (neuron-IS-RC-circuit
      (biological-neuron)
      (resistor-capacitor-circuit)
      ((biological-neuron . cell-membrane-is-capacitor)
       (cell-membrane-is-capacitor . capacitance-1-microfarad-per-cm2)
       (capacitance-1-microfarad-per-cm2 . ion-channels-are-variable-resistors)
       (ion-channels-are-variable-resistors . Nernst-potential-is-voltage-source)
       (Nernst-potential-is-voltage-source . Na-K-pump-is-battery)
       (Na-K-pump-is-battery . action-potential-IS-RC-discharge)
       (action-potential-IS-RC-discharge . threshold-IS-voltage-comparator)
       (threshold-IS-voltage-comparator . refractory-IS-reset-circuit)
       (refractory-IS-reset-circuit . resistor-capacitor-circuit)))
    ;;; SOURCE: Hodgkin & Huxley 1952, "A quantitative description of
    ;;; membrane current..." J Physiol 117(4):500-544. Nobel Prize 1963.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIOLOGY = INFORMATION THEORY
    ;;; Crick 1958, Nirenberg 1961, Yockey 2005
    ;;; ═══════════════════════════════════════════════════════════

    (DNA-IS-digital-code
      (deoxyribonucleic-acid)
      (quaternary-digital-code)
      ((deoxyribonucleic-acid . four-base-alphabet-ACGT)
       (four-base-alphabet-ACGT . 2-bits-per-base)
       (2-bits-per-base . triplet-codons-3-bases)
       (triplet-codons-3-bases . 64-possible-codons)
       (64-possible-codons . map-to-20-amino-acids-plus-stop)
       (map-to-20-amino-acids-plus-stop . degenerate-code-redundancy)
       (degenerate-code-redundancy . wobble-position-is-error-correction)
       (wobble-position-is-error-correction . channel-capacity-of-genetic-code)
       (channel-capacity-of-genetic-code . quaternary-digital-code)))
    ;;; SOURCE: Crick 1958, "On Protein Synthesis" (Central Dogma).
    ;;; Nirenberg & Matthaei 1961 (codon deciphering). Nobel 1968.
    ;;; Yockey 2005, "Information Theory, Evolution, and the Origin of Life."

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIOLOGY = COMPUTATION
    ;;; Darwin 1859, Holland 1975, Mitchell 1998
    ;;; ═══════════════════════════════════════════════════════════

    (natural-selection-IS-optimization
      (variation-selection-inheritance)
      (stochastic-gradient-free-optimization)
      ((variation-selection-inheritance . population-of-candidate-solutions)
       (population-of-candidate-solutions . fitness-function-is-environment)
       (fitness-function-is-environment . selection-is-evaluation)
       (selection-is-evaluation . reproduction-is-propagation)
       (reproduction-is-propagation . mutation-is-exploration)
       (mutation-is-exploration . crossover-is-recombination)
       (crossover-is-recombination . convergence-without-gradient)
       (convergence-without-gradient . stochastic-gradient-free-optimization)))
    ;;; SOURCE: Holland 1975, "Adaptation in Natural and Artificial Systems."
    ;;; Mitchell 1998, "An Introduction to Genetic Algorithms."

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIOLOGY = PHYSICS
    ;;; Anfinsen 1973, Levinthal 1969
    ;;; ═══════════════════════════════════════════════════════════

    (protein-folding-IS-energy-minimization
      (amino-acid-sequence)
      (minimum-free-energy-conformation)
      ((amino-acid-sequence . encodes-all-folding-information)
       (encodes-all-folding-information . Anfinsen-thermodynamic-hypothesis)
       (Anfinsen-thermodynamic-hypothesis . native-state-is-global-free-energy-minimum)
       (native-state-is-global-free-energy-minimum . Levinthal-paradox)
       (Levinthal-paradox . cannot-search-all-conformations)
       (cannot-search-all-conformations . folding-funnel-landscape)
       (folding-funnel-landscape . funnel-guides-to-minimum)
       (funnel-guides-to-minimum . hydrophobic-collapse-plus-hydrogen-bonds)
       (hydrophobic-collapse-plus-hydrogen-bonds . minimum-free-energy-conformation)))
    ;;; SOURCE: Anfinsen 1973, Nobel lecture. "Studies on the principles
    ;;; that govern the folding of protein chains."

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ECONOMICS = BIOLOGY
    ;;; Maynard Smith 1982, Nash 1950
    ;;; ═══════════════════════════════════════════════════════════

    (game-theory-IS-evolutionary-dynamics
      (Nash-equilibrium)
      (evolutionarily-stable-strategy)
      ((Nash-equilibrium . no-player-benefits-from-unilateral-change)
       (no-player-benefits-from-unilateral-change . in-biology-no-mutant-invades)
       (in-biology-no-mutant-invades . ESS-is-Nash-equilibrium-of-nature)
       (ESS-is-Nash-equilibrium-of-nature . payoff-matrix-is-fitness-landscape)
       (payoff-matrix-is-fitness-landscape . rational-agents-are-selected-organisms)
       (rational-agents-are-selected-organisms . market-equilibrium-is-ecological-equilibrium)
       (market-equilibrium-is-ecological-equilibrium . evolutionarily-stable-strategy)))
    ;;; SOURCE: Maynard Smith & Price 1973, "The Logic of Animal Conflict."
    ;;; Maynard Smith 1982, "Evolution and the Theory of Games."

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MATHEMATICS = COMPUTATION = LOGIC
    ;;; Curry 1934, Howard 1969, Lambek 1972
    ;;; ═══════════════════════════════════════════════════════════

    (curry-howard-lambek
      (mathematical-proof)
      (program-equals-proof-equals-morphism)
      ((mathematical-proof . IS-a-program)
       (IS-a-program . proposition-IS-type)
       (proposition-IS-type . proof-IS-term)
       (proof-IS-term . implication-IS-function-type)
       (implication-IS-function-type . modus-ponens-IS-function-application)
       (modus-ponens-IS-function-application . in-category-theory)
       (in-category-theory . objects-are-propositions)
       (objects-are-propositions . morphisms-are-proofs)
       (morphisms-are-proofs . composition-IS-cut-elimination)
       (composition-IS-cut-elimination . program-equals-proof-equals-morphism)))
    ;;; SOURCE: Curry 1934, Howard 1969 "The formulae-as-types notion
    ;;; of construction." Lambek 1972.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHYSICS = COMPUTATION
    ;;; Feynman 1982, Deutsch 1985, Lloyd 2006
    ;;; ═══════════════════════════════════════════════════════════

    (universe-IS-computation
      (physical-system-evolving)
      (computation-on-qubits)
      ((physical-system-evolving . state-changes-by-physical-law)
       (state-changes-by-physical-law . law-IS-unitary-transformation)
       (law-IS-unitary-transformation . unitary-transformation-IS-quantum-gate)
       (unitary-transformation-IS-quantum-gate . any-physical-evolution-IS-quantum-computation)
       (any-physical-evolution-IS-quantum-computation . universe-computes-itself)
       (universe-computes-itself . every-atom-IS-a-qubit)
       (every-atom-IS-a-qubit . every-interaction-IS-a-gate)
       (every-interaction-IS-a-gate . computation-on-qubits)))
    ;;; SOURCE: Feynman 1982, "Simulating Physics with Computers."
    ;;; Lloyd 2006, "Programming the Universe."
    ;;; Deutsch 1985, "Quantum theory, the Church-Turing principle..."

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WHAT THIS PROVES
    ;;; ═══════════════════════════════════════════════════════════

    (tautology-broken
      (isolated-domain-describing-itself)
      (domain-grounded-in-cross-domain-identity)
      ((isolated-domain-describing-itself . thermodynamics-in-thermodynamics-words)
       (thermodynamics-in-thermodynamics-words . no-collision-surface)
       (no-collision-surface . register-proven-equivalences)
       (register-proven-equivalences . Shannon-IS-Boltzmann)
       (Shannon-IS-Boltzmann . neuron-IS-circuit)
       (neuron-IS-circuit . DNA-IS-code)
       (DNA-IS-code . selection-IS-optimization)
       (selection-IS-optimization . folding-IS-energy-minimization)
       (folding-IS-energy-minimization . game-IS-evolution)
       (game-IS-evolution . proof-IS-program)
       (proof-IS-program . physics-IS-computation)
       (physics-IS-computation . domain-grounded-in-cross-domain-identity)))

    (the-science
      (eight-proven-cross-domain-identities)
      (each-one-publishable-as-structural-finding)
      ((eight-proven-cross-domain-identities . not-discovered-by-us)
       (not-discovered-by-us . discovered-by-cited-scientists)
       (discovered-by-cited-scientists . registered-as-bridge-atoms)
       (registered-as-bridge-atoms . enable-collision)
       (enable-collision . new-daughter-particles-become-possible)
       (new-daughter-particles-become-possible . each-one-publishable-as-structural-finding)))

  )

  ((bridges . cross-domain-science-registered)))
