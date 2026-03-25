#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Chemistry
;;; LAYER: 19-chemistry
;;; DEPENDS ON: 01-particles (electrons), 03-atoms (elements,
;;;   electron configurations), 04-molecules (bonds, functional
;;;   groups), 10-quantum (orbitals, quantum numbers),
;;;   11-thermodynamics (Gibbs free energy, equilibrium, entropy)
;;; DEPENDED ON BY: biochemistry, pharmacology, materials science,
;;;   environmental chemistry, chemical engineering
;;;
;;; PURPOSE: The science of matter — its composition, structure,
;;; properties, and the changes it undergoes during chemical
;;; reactions. Covers atomic orbitals, periodic trends, reaction
;;; types, stoichiometry, acid-base chemistry, redox, organic
;;; chemistry, kinetics, equilibrium, nuclear chemistry, and
;;; spectroscopy.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Zumdahl-10th] S.S. Zumdahl, S.A. Zumdahl, D.J. DeCoste,
;;;   Chemistry, 10th ed., Cengage Learning, 2018.
;;; [Atkins-7th] P. Atkins, L. Jones, L. Laverman, Chemical
;;;   Principles: The Quest for Insight, 7th ed., W.H. Freeman, 2016.
;;; [Atkins-PC-11th] P. Atkins, J. de Paula, J. Keeler, Atkins'
;;;   Physical Chemistry, 11th ed., Oxford University Press, 2018.
;;; [Clayden-2nd] J. Clayden, N. Greeves, S. Warren, Organic
;;;   Chemistry, 2nd ed., Oxford University Press, 2012.
;;; [IUPAC-2019] IUPAC Compendium of Chemical Terminology (Gold Book),
;;;   2019 release. doi:10.1351/goldbook
;;; [NIST-CODATA-2022] CODATA 2022 recommended values of fundamental
;;;   constants.
;;; [Pauling-1960] L. Pauling, The Nature of the Chemical Bond,
;;;   3rd ed., Cornell University Press, 1960.
;;;
;;; UNITS: Stated explicitly. No ambiguous values.
;;; ═══════════════════════════════════════════════════════════════

(domain-chemistry

  ((Zumdahl-Atkins (Zumdahl-10th Atkins-7th Atkins-PC-11th Clayden-2nd) (authoritative) ((Zumdahl-10th . authoritative) (Atkins-7th . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ATOMIC ORBITALS
    ;;; Spatial probability distributions of electrons
    ;;; SOURCE: [Zumdahl-10th] Ch. 7, [Atkins-PC-11th] Ch. 9
    ;;; ═══════════════════════════════════════════════════════════

    (s-orbital
      (orbital-type)
      (angular-momentum-quantum-number-l-equals-0)
      ((orbital-type . spherically-symmetric)
       (spherically-symmetric . angular-momentum-quantum-number-l-equals-0)
       (angular-momentum-quantum-number-l-equals-0 . one-orbital-per-subshell)
       (one-orbital-per-subshell . holds-maximum-2-electrons)
       (holds-maximum-2-electrons . present-in-all-shells-n-ge-1)
       (present-in-all-shells-n-ge-1 . no-angular-nodes)))

    (p-orbital
      (orbital-type)
      (angular-momentum-quantum-number-l-equals-1)
      ((orbital-type . dumbbell-shaped)
       (dumbbell-shaped . angular-momentum-quantum-number-l-equals-1)
       (angular-momentum-quantum-number-l-equals-1 . three-orbitals-per-subshell)
       (three-orbitals-per-subshell . px-py-pz-along-axes)
       (px-py-pz-along-axes . holds-maximum-6-electrons)
       (holds-maximum-6-electrons . present-in-shells-n-ge-2)
       (present-in-shells-n-ge-2 . one-angular-node-per-orbital)))

    (d-orbital
      (orbital-type)
      (angular-momentum-quantum-number-l-equals-2)
      ((orbital-type . cloverleaf-shaped)
       (cloverleaf-shaped . angular-momentum-quantum-number-l-equals-2)
       (angular-momentum-quantum-number-l-equals-2 . five-orbitals-per-subshell)
       (five-orbitals-per-subshell . holds-maximum-10-electrons)
       (holds-maximum-10-electrons . present-in-shells-n-ge-3)
       (present-in-shells-n-ge-3 . two-angular-nodes-per-orbital)
       (two-angular-nodes-per-orbital . key-to-transition-metal-chemistry)))

    (f-orbital
      (orbital-type)
      (angular-momentum-quantum-number-l-equals-3)
      ((orbital-type . complex-multilobed-shape)
       (complex-multilobed-shape . angular-momentum-quantum-number-l-equals-3)
       (angular-momentum-quantum-number-l-equals-3 . seven-orbitals-per-subshell)
       (seven-orbitals-per-subshell . holds-maximum-14-electrons)
       (holds-maximum-14-electrons . present-in-shells-n-ge-4)
       (present-in-shells-n-ge-4 . three-angular-nodes-per-orbital)
       (three-angular-nodes-per-orbital . key-to-lanthanide-and-actinide-chemistry)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTRON CONFIGURATION
    ;;; Filling order and rules
    ;;; SOURCE: [Zumdahl-10th] Ch. 7, [Atkins-7th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (aufbau-principle
      (electron-filling-rule)
      (electrons-fill-lowest-energy-orbitals-first)
      ((electron-filling-rule . building-up-principle)
       (building-up-principle . electrons-fill-lowest-energy-orbitals-first)
       (electrons-fill-lowest-energy-orbitals-first . filling-order-1s-2s-2p-3s-3p-4s-3d)
       (filling-order-1s-2s-2p-3s-3p-4s-3d . n-plus-l-rule-determines-order)
       (n-plus-l-rule-determines-order . lower-n-plus-l-fills-first)
       (lower-n-plus-l-fills-first . same-n-plus-l-lower-n-fills-first)))

    (Pauli-exclusion-principle
      (electron-occupation-rule)
      (no-two-electrons-share-all-four-quantum-numbers)
      ((electron-occupation-rule . Pauli-1925)
       (Pauli-1925 . each-orbital-holds-maximum-2-electrons)
       (each-orbital-holds-maximum-2-electrons . must-differ-in-spin)
       (must-differ-in-spin . ms-equals-plus-half-or-minus-half)
       (ms-equals-plus-half-or-minus-half . no-two-electrons-share-all-four-quantum-numbers)))

    (Hund-rule
      (electron-filling-rule)
      (maximize-spin-before-pairing)
      ((electron-filling-rule . degenerate-orbitals)
       (degenerate-orbitals . one-electron-in-each-orbital-first)
       (one-electron-in-each-orbital-first . parallel-spins-preferred)
       (parallel-spins-preferred . minimizes-electron-electron-repulsion)
       (minimizes-electron-electron-repulsion . maximize-spin-before-pairing)))

    (electron-configuration-notation
      (notation-system)
      (principal-quantum-number-subshell-superscript-electrons)
      ((notation-system . compact-representation)
       (compact-representation . example-carbon-1s2-2s2-2p2)
       (example-carbon-1s2-2s2-2p2 . noble-gas-core-abbreviation)
       (noble-gas-core-abbreviation . example-Fe-is-Ar-3d6-4s2)
       (example-Fe-is-Ar-3d6-4s2 . principal-quantum-number-subshell-superscript-electrons)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PERIODIC TRENDS
    ;;; Systematic variation of properties across the periodic table
    ;;; SOURCE: [Zumdahl-10th] Ch. 7, [Atkins-7th] Ch. 1,
    ;;;   [Pauling-1960]
    ;;; ═══════════════════════════════════════════════════════════

    (electronegativity
      (periodic-trend)
      (increases-left-to-right-and-bottom-to-top)
      ((periodic-trend . Pauling-scale-1960)
       (Pauling-scale-1960 . measure-of-atom-attraction-for-bonding-electrons)
       (measure-of-atom-attraction-for-bonding-electrons . fluorine-highest-3.98)
       (fluorine-highest-3.98 . cesium-lowest-0.79)
       (cesium-lowest-0.79 . increases-with-effective-nuclear-charge)
       (increases-with-effective-nuclear-charge . decreases-with-atomic-radius)
       (decreases-with-atomic-radius . increases-left-to-right-and-bottom-to-top)))

    (ionization-energy
      (periodic-trend)
      (increases-left-to-right-and-bottom-to-top)
      ((periodic-trend . energy-to-remove-outermost-electron)
       (energy-to-remove-outermost-electron . first-IE-is-X-to-X-plus-plus-e-minus)
       (first-IE-is-X-to-X-plus-plus-e-minus . helium-highest-first-IE-2372-kJ/mol)
       (helium-highest-first-IE-2372-kJ/mol . cesium-lowest-first-IE-376-kJ/mol)
       (cesium-lowest-first-IE-376-kJ/mol . increases-with-effective-nuclear-charge)
       (increases-with-effective-nuclear-charge . successive-IEs-always-increase)
       (successive-IEs-always-increase . large-jump-when-core-electrons-removed)))

    (atomic-radius
      (periodic-trend)
      (increases-right-to-left-and-top-to-bottom)
      ((periodic-trend . distance-from-nucleus-to-outermost-electron)
       (distance-from-nucleus-to-outermost-electron . increases-down-a-group)
       (increases-down-a-group . adding-shells-increases-size)
       (adding-shells-increases-size . decreases-across-a-period)
       (decreases-across-a-period . increasing-Zeff-pulls-electrons-closer)
       (increasing-Zeff-pulls-electrons-closer . cation-smaller-than-parent-atom)
       (cation-smaller-than-parent-atom . anion-larger-than-parent-atom)
       (anion-larger-than-parent-atom . increases-right-to-left-and-top-to-bottom)))

    (electron-affinity
      (periodic-trend)
      (generally-increases-left-to-right)
      ((periodic-trend . energy-released-when-electron-added)
       (energy-released-when-electron-added . X-plus-e-minus-to-X-minus)
       (X-plus-e-minus-to-X-minus . chlorine-most-negative-minus-349-kJ/mol)
       (chlorine-most-negative-minus-349-kJ/mol . halogens-have-large-electron-affinities)
       (halogens-have-large-electron-affinities . noble-gases-near-zero-or-positive)
       (noble-gases-near-zero-or-positive . group-2-and-group-15-anomalously-low)
       (group-2-and-group-15-anomalously-low . generally-increases-left-to-right)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHEMICAL REACTIONS — TYPES
    ;;; Classification of common reaction types
    ;;; SOURCE: [Zumdahl-10th] Ch. 4, [Atkins-7th] Ch. 11
    ;;; ═══════════════════════════════════════════════════════════

    (synthesis-reaction
      (reaction-type)
      (A-plus-B-yields-AB)
      ((reaction-type . combination-reaction)
       (combination-reaction . two-or-more-reactants-form-one-product)
       (two-or-more-reactants-form-one-product . example-2Na-plus-Cl2-yields-2NaCl)
       (example-2Na-plus-Cl2-yields-2NaCl . example-2H2-plus-O2-yields-2H2O)
       (example-2H2-plus-O2-yields-2H2O . A-plus-B-yields-AB)))

    (decomposition-reaction
      (reaction-type)
      (AB-yields-A-plus-B)
      ((reaction-type . single-reactant-breaks-into-products)
       (single-reactant-breaks-into-products . opposite-of-synthesis)
       (opposite-of-synthesis . example-2H2O-yields-2H2-plus-O2)
       (example-2H2O-yields-2H2-plus-O2 . example-CaCO3-yields-CaO-plus-CO2)
       (example-CaCO3-yields-CaO-plus-CO2 . often-requires-energy-input)
       (often-requires-energy-input . AB-yields-A-plus-B)))

    (single-replacement-reaction
      (reaction-type)
      (A-plus-BC-yields-AC-plus-B)
      ((reaction-type . one-element-replaces-another-in-compound)
       (one-element-replaces-another-in-compound . activity-series-determines-spontaneity)
       (activity-series-determines-spontaneity . more-reactive-element-displaces-less-reactive)
       (more-reactive-element-displaces-less-reactive . example-Zn-plus-CuSO4-yields-ZnSO4-plus-Cu)
       (example-Zn-plus-CuSO4-yields-ZnSO4-plus-Cu . A-plus-BC-yields-AC-plus-B)))

    (double-replacement-reaction
      (reaction-type)
      (AB-plus-CD-yields-AD-plus-CB)
      ((reaction-type . metathesis-reaction)
       (metathesis-reaction . cations-and-anions-exchange-partners)
       (cations-and-anions-exchange-partners . driven-by-precipitate-gas-or-water-formation)
       (driven-by-precipitate-gas-or-water-formation . example-AgNO3-plus-NaCl-yields-AgCl-plus-NaNO3)
       (example-AgNO3-plus-NaCl-yields-AgCl-plus-NaNO3 . AB-plus-CD-yields-AD-plus-CB)))

    (combustion-reaction
      (reaction-type)
      (fuel-plus-O2-yields-CO2-plus-H2O)
      ((reaction-type . rapid-exothermic-oxidation)
       (rapid-exothermic-oxidation . hydrocarbon-plus-oxygen)
       (hydrocarbon-plus-oxygen . products-are-CO2-and-H2O)
       (products-are-CO2-and-H2O . example-CH4-plus-2O2-yields-CO2-plus-2H2O)
       (example-CH4-plus-2O2-yields-CO2-plus-2H2O . always-exothermic)
       (always-exothermic . fuel-plus-O2-yields-CO2-plus-H2O)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STOICHIOMETRY
    ;;; Quantitative relationships in chemical reactions
    ;;; SOURCE: [Zumdahl-10th] Ch. 3, [Atkins-7th] Ch. 11
    ;;; ═══════════════════════════════════════════════════════════

    (mole-concept
      (quantity-unit)
      (one-mole-equals-6.02214076e23-entities)
      ((quantity-unit . Avogadro-number)
       (Avogadro-number . exactly-6.02214076e23-since-2019-SI)
       (exactly-6.02214076e23-since-2019-SI . bridges-atomic-and-macroscopic-scales)
       (bridges-atomic-and-macroscopic-scales . molar-mass-in-g/mol-equals-atomic-mass-in-Da)
       (molar-mass-in-g/mol-equals-atomic-mass-in-Da . one-mole-equals-6.02214076e23-entities)))

    (stoichiometric-coefficients
      (balanced-equation)
      (mole-ratios-between-reactants-and-products)
      ((balanced-equation . conservation-of-mass)
       (conservation-of-mass . atoms-balanced-on-both-sides)
       (atoms-balanced-on-both-sides . coefficients-give-mole-ratios)
       (coefficients-give-mole-ratios . used-for-mass-to-mass-conversions)
       (used-for-mass-to-mass-conversions . mole-ratios-between-reactants-and-products)))

    (limiting-reagent
      (stoichiometry)
      (reactant-consumed-first-determines-yield)
      ((stoichiometry . unequal-mole-ratios-of-reactants)
       (unequal-mole-ratios-of-reactants . one-reactant-runs-out-first)
       (one-reactant-runs-out-first . limiting-reagent-determines-theoretical-yield)
       (limiting-reagent-determines-theoretical-yield . excess-reagent-remains)
       (excess-reagent-remains . percent-yield-equals-actual-over-theoretical-times-100)
       (percent-yield-equals-actual-over-theoretical-times-100 . reactant-consumed-first-determines-yield)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MOLARITY AND SOLUTION CONCENTRATION
    ;;; SOURCE: [Zumdahl-10th] Ch. 4, [Atkins-7th] Ch. 9
    ;;; ═══════════════════════════════════════════════════════════

    (molarity
      (concentration-unit)
      (M-equals-moles-solute-per-liter-solution)
      ((concentration-unit . molar-concentration)
       (molar-concentration . M-equals-n-over-V)
       (M-equals-n-over-V . units-mol/L)
       (units-mol/L . used-in-dilution-equation-M1V1-equals-M2V2)
       (used-in-dilution-equation-M1V1-equals-M2V2 . M-equals-moles-solute-per-liter-solution)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IDEAL GAS LAW
    ;;; SOURCE: [Zumdahl-10th] Ch. 5, [Atkins-PC-11th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (ideal-gas-law
      (equation-of-state)
      (PV-equals-nRT)
      ((equation-of-state . ideal-gas)
       (ideal-gas . PV-equals-nRT)
       (PV-equals-nRT . R-equals-8.314-J/mol-K)
       (R-equals-8.314-J/mol-K . P-in-Pa-V-in-m3-n-in-mol-T-in-K)
       (P-in-Pa-V-in-m3-n-in-mol-T-in-K . also-R-equals-0.08206-L-atm/mol-K)
       (also-R-equals-0.08206-L-atm/mol-K . valid-at-low-P-and-high-T)))

    (STP-conditions
      (standard-temperature-and-pressure)
      (0-C-and-1-atm)
      ((standard-temperature-and-pressure . IUPAC-definition)
       (IUPAC-definition . T-equals-273.15-K)
       (T-equals-273.15-K . P-equals-1-bar-or-100-kPa)
       (P-equals-1-bar-or-100-kPa . molar-volume-22.711-L/mol-at-STP)
       (molar-volume-22.711-L/mol-at-STP . 0-C-and-1-atm)))

    (Dalton-law-partial-pressures
      (gas-mixtures)
      (P-total-equals-sum-of-partial-pressures)
      ((gas-mixtures . each-gas-exerts-independent-pressure)
       (each-gas-exerts-independent-pressure . Pi-equals-xi-times-P-total)
       (Pi-equals-xi-times-P-total . xi-is-mole-fraction)
       (xi-is-mole-fraction . P-total-equals-sum-of-partial-pressures)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ACID-BASE CHEMISTRY
    ;;; Bronsted-Lowry, Lewis definitions, pH, buffers
    ;;; SOURCE: [Zumdahl-10th] Ch. 14-15, [Atkins-7th] Ch. 11
    ;;; ═══════════════════════════════════════════════════════════

    (Bronsted-Lowry-acid
      (acid-base-definition)
      (proton-donor)
      ((acid-base-definition . Bronsted-Lowry-1923)
       (Bronsted-Lowry-1923 . acid-donates-H-plus)
       (acid-donates-H-plus . conjugate-base-remains-after-proton-loss)
       (conjugate-base-remains-after-proton-loss . strong-acids-fully-dissociate)
       (strong-acids-fully-dissociate . HCl-HNO3-H2SO4-HBr-HI-HClO4)
       (HCl-HNO3-H2SO4-HBr-HI-HClO4 . proton-donor)))

    (Bronsted-Lowry-base
      (acid-base-definition)
      (proton-acceptor)
      ((acid-base-definition . Bronsted-Lowry-1923)
       (Bronsted-Lowry-1923 . base-accepts-H-plus)
       (base-accepts-H-plus . conjugate-acid-forms-after-proton-gain)
       (conjugate-acid-forms-after-proton-gain . strong-bases-fully-dissociate)
       (strong-bases-fully-dissociate . NaOH-KOH-Ca-OH-2)
       (NaOH-KOH-Ca-OH-2 . proton-acceptor)))

    (Lewis-acid
      (acid-base-definition)
      (electron-pair-acceptor)
      ((acid-base-definition . Lewis-1923)
       (Lewis-1923 . broader-than-Bronsted-Lowry)
       (broader-than-Bronsted-Lowry . accepts-electron-pair-into-empty-orbital)
       (accepts-electron-pair-into-empty-orbital . examples-BF3-AlCl3-metal-cations)
       (examples-BF3-AlCl3-metal-cations . electron-pair-acceptor)))

    (Lewis-base
      (acid-base-definition)
      (electron-pair-donor)
      ((acid-base-definition . Lewis-1923)
       (Lewis-1923 . broader-than-Bronsted-Lowry)
       (broader-than-Bronsted-Lowry . donates-electron-pair-from-lone-pair)
       (donates-electron-pair-from-lone-pair . examples-NH3-H2O-OH-minus)
       (examples-NH3-H2O-OH-minus . electron-pair-donor)))

    (pH-scale
      (concentration-measure)
      (pH-equals-minus-log-H-plus-concentration)
      ((concentration-measure . Sorensen-1909)
       (Sorensen-1909 . logarithmic-scale)
       (logarithmic-scale . pH-0-to-14-in-aqueous-at-25C)
       (pH-0-to-14-in-aqueous-at-25C . pH-7-is-neutral)
       (pH-7-is-neutral . below-7-acidic-above-7-basic)
       (below-7-acidic-above-7-basic . pOH-equals-minus-log-OH-minus)
       (pOH-equals-minus-log-OH-minus . pH-plus-pOH-equals-14-at-25C)
       (pH-plus-pOH-equals-14-at-25C . pH-equals-minus-log-H-plus-concentration)))

    (water-autoionization
      (equilibrium-process)
      (Kw-equals-1.0e-14-at-25C)
      ((equilibrium-process . H2O-plus-H2O-yields-H3O-plus-plus-OH-minus)
       (H2O-plus-H2O-yields-H3O-plus-plus-OH-minus . Kw-equals-H-plus-times-OH-minus)
       (Kw-equals-H-plus-times-OH-minus . Kw-equals-1.0e-14-at-25C)
       (Kw-equals-1.0e-14-at-25C . temperature-dependent)
       (temperature-dependent . basis-of-pH-scale)))

    (Henderson-Hasselbalch
      (buffer-equation)
      (pH-equals-pKa-plus-log-A-minus-over-HA)
      ((buffer-equation . relates-pH-to-pKa-and-concentration-ratio)
       (relates-pH-to-pKa-and-concentration-ratio . applies-to-weak-acid-conjugate-base-pair)
       (applies-to-weak-acid-conjugate-base-pair . pH-equals-pKa-plus-log-base-over-acid)
       (pH-equals-pKa-plus-log-base-over-acid . maximum-buffer-capacity-when-pH-equals-pKa)
       (maximum-buffer-capacity-when-pH-equals-pKa . pH-equals-pKa-plus-log-A-minus-over-HA)))

    (buffer-solution
      (solution-type)
      (resists-pH-change-upon-addition-of-acid-or-base)
      ((solution-type . weak-acid-plus-conjugate-base)
       (weak-acid-plus-conjugate-base . or-weak-base-plus-conjugate-acid)
       (or-weak-base-plus-conjugate-acid . neutralizes-added-H-plus-or-OH-minus)
       (neutralizes-added-H-plus-or-OH-minus . effective-within-pKa-pm-1)
       (effective-within-pKa-pm-1 . biological-example-bicarbonate-buffer-pH-7.4)
       (biological-example-bicarbonate-buffer-pH-7.4 . resists-pH-change-upon-addition-of-acid-or-base)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; REDOX REACTIONS
    ;;; Oxidation states, galvanic cells, electrolysis
    ;;; SOURCE: [Zumdahl-10th] Ch. 4, 17, [Atkins-7th] Ch. 13
    ;;; ═══════════════════════════════════════════════════════════

    (oxidation-states
      (electron-bookkeeping)
      (formal-charge-assigned-by-rules)
      ((electron-bookkeeping . oxidation-number-rules)
       (oxidation-number-rules . free-element-is-zero)
       (free-element-is-zero . monatomic-ion-equals-charge)
       (monatomic-ion-equals-charge . oxygen-usually-minus-2)
       (oxygen-usually-minus-2 . hydrogen-usually-plus-1)
       (hydrogen-usually-plus-1 . sum-equals-overall-charge)
       (sum-equals-overall-charge . formal-charge-assigned-by-rules)))

    (oxidation-reduction
      (reaction-type)
      (electron-transfer-between-species)
      ((reaction-type . redox-reaction)
       (redox-reaction . oxidation-is-loss-of-electrons)
       (oxidation-is-loss-of-electrons . reduction-is-gain-of-electrons)
       (reduction-is-gain-of-electrons . OIL-RIG-mnemonic)
       (OIL-RIG-mnemonic . oxidizing-agent-is-reduced)
       (oxidizing-agent-is-reduced . reducing-agent-is-oxidized)
       (reducing-agent-is-oxidized . electron-transfer-between-species)))

    (galvanic-cell
      (electrochemical-cell)
      (spontaneous-redox-produces-electrical-work)
      ((electrochemical-cell . also-called-voltaic-cell)
       (also-called-voltaic-cell . anode-is-site-of-oxidation)
       (anode-is-site-of-oxidation . cathode-is-site-of-reduction)
       (cathode-is-site-of-reduction . salt-bridge-completes-circuit)
       (salt-bridge-completes-circuit . E-cell-equals-E-cathode-minus-E-anode)
       (E-cell-equals-E-cathode-minus-E-anode . delta-G-equals-minus-nFE)
       (delta-G-equals-minus-nFE . Nernst-equation-E-equals-E0-minus-RT-over-nF-ln-Q)
       (Nernst-equation-E-equals-E0-minus-RT-over-nF-ln-Q . spontaneous-redox-produces-electrical-work)))

    (standard-reduction-potentials
      (electrochemistry)
      (E0-measured-versus-SHE)
      ((electrochemistry . standard-hydrogen-electrode-SHE-defined-as-0.00-V)
       (standard-hydrogen-electrode-SHE-defined-as-0.00-V . more-positive-E0-stronger-oxidizing-agent)
       (more-positive-E0-stronger-oxidizing-agent . F2-highest-at-plus-2.87-V)
       (F2-highest-at-plus-2.87-V . Li-lowest-at-minus-3.04-V)
       (Li-lowest-at-minus-3.04-V . E0-measured-versus-SHE)))

    (electrolysis
      (electrochemical-process)
      (non-spontaneous-reaction-driven-by-external-voltage)
      ((electrochemical-process . electrolytic-cell)
       (electrolytic-cell . external-power-source-required)
       (external-power-source-required . anode-positive-cathode-negative)
       (anode-positive-cathode-negative . Faraday-law-m-equals-MIt-over-nF)
       (Faraday-law-m-equals-MIt-over-nF . F-equals-96485-C/mol)
       (F-equals-96485-C/mol . applications-electroplating-aluminum-refining)
       (applications-electroplating-aluminum-refining . non-spontaneous-reaction-driven-by-external-voltage)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ORGANIC CHEMISTRY — FUNCTIONAL GROUPS
    ;;; Classification of organic compounds by functional group
    ;;; SOURCE: [Clayden-2nd] Ch. 2, [Zumdahl-10th] Ch. 22
    ;;; ═══════════════════════════════════════════════════════════

    (alkanes
      (hydrocarbon-class)
      (CnH2n-plus-2-all-single-bonds)
      ((hydrocarbon-class . saturated-hydrocarbons)
       (saturated-hydrocarbons . general-formula-CnH2n-plus-2)
       (general-formula-CnH2n-plus-2 . sp3-hybridized-carbons)
       (sp3-hybridized-carbons . tetrahedral-geometry-109.5-degrees)
       (tetrahedral-geometry-109.5-degrees . relatively-unreactive)
       (relatively-unreactive . undergo-combustion-and-halogenation)
       (undergo-combustion-and-halogenation . CnH2n-plus-2-all-single-bonds)))

    (alkenes
      (hydrocarbon-class)
      (CnH2n-contain-C-equals-C-double-bond)
      ((hydrocarbon-class . unsaturated-hydrocarbons)
       (unsaturated-hydrocarbons . general-formula-CnH2n)
       (general-formula-CnH2n . sp2-hybridized-at-double-bond)
       (sp2-hybridized-at-double-bond . trigonal-planar-geometry-120-degrees)
       (trigonal-planar-geometry-120-degrees . pi-bond-above-and-below-plane)
       (pi-bond-above-and-below-plane . undergo-addition-reactions)
       (undergo-addition-reactions . cis-trans-isomerism-possible)
       (cis-trans-isomerism-possible . CnH2n-contain-C-equals-C-double-bond)))

    (alkynes
      (hydrocarbon-class)
      (CnH2n-minus-2-contain-C-triple-C-triple-bond)
      ((hydrocarbon-class . unsaturated-hydrocarbons)
       (unsaturated-hydrocarbons . general-formula-CnH2n-minus-2)
       (general-formula-CnH2n-minus-2 . sp-hybridized-at-triple-bond)
       (sp-hybridized-at-triple-bond . linear-geometry-180-degrees)
       (linear-geometry-180-degrees . two-pi-bonds)
       (two-pi-bonds . terminal-alkynes-weakly-acidic-pKa-25)
       (terminal-alkynes-weakly-acidic-pKa-25 . CnH2n-minus-2-contain-C-triple-C-triple-bond)))

    (alcohols
      (functional-group-class)
      (R-OH-hydroxyl-group)
      ((functional-group-class . contain-hydroxyl-group-OH)
       (contain-hydroxyl-group-OH . classified-primary-secondary-tertiary)
       (classified-primary-secondary-tertiary . hydrogen-bonding-raises-boiling-point)
       (hydrogen-bonding-raises-boiling-point . soluble-in-water-for-short-chains)
       (soluble-in-water-for-short-chains . undergo-oxidation-dehydration-esterification)
       (undergo-oxidation-dehydration-esterification . R-OH-hydroxyl-group)))

    (aldehydes
      (functional-group-class)
      (R-CHO-carbonyl-at-terminal-carbon)
      ((functional-group-class . contain-carbonyl-C-equals-O-at-chain-end)
       (contain-carbonyl-C-equals-O-at-chain-end . general-formula-RCHO)
       (general-formula-RCHO . named-with-suffix-al)
       (named-with-suffix-al . undergo-nucleophilic-addition)
       (undergo-nucleophilic-addition . oxidized-to-carboxylic-acids)
       (oxidized-to-carboxylic-acids . reduced-to-primary-alcohols)
       (reduced-to-primary-alcohols . R-CHO-carbonyl-at-terminal-carbon)))

    (ketones
      (functional-group-class)
      (R-CO-R-prime-carbonyl-between-two-carbons)
      ((functional-group-class . contain-carbonyl-C-equals-O-between-two-carbons)
       (contain-carbonyl-C-equals-O-between-two-carbons . general-formula-RCOR-prime)
       (general-formula-RCOR-prime . named-with-suffix-one)
       (named-with-suffix-one . undergo-nucleophilic-addition)
       (undergo-nucleophilic-addition . not-easily-oxidized)
       (not-easily-oxidized . reduced-to-secondary-alcohols)
       (reduced-to-secondary-alcohols . R-CO-R-prime-carbonyl-between-two-carbons)))

    (carboxylic-acids
      (functional-group-class)
      (R-COOH-carboxyl-group)
      ((functional-group-class . contain-carboxyl-group-COOH)
       (contain-carboxyl-group-COOH . general-formula-RCOOH)
       (general-formula-RCOOH . named-with-suffix-oic-acid)
       (named-with-suffix-oic-acid . weak-acids-pKa-typically-4-to-5)
       (weak-acids-pKa-typically-4-to-5 . form-esters-with-alcohols)
       (form-esters-with-alcohols . form-amides-with-amines)
       (form-amides-with-amines . hydrogen-bonding-gives-high-boiling-points)
       (hydrogen-bonding-gives-high-boiling-points . R-COOH-carboxyl-group)))

    (esters
      (functional-group-class)
      (R-COO-R-prime-from-acid-plus-alcohol)
      ((functional-group-class . contain-ester-linkage-COO)
       (contain-ester-linkage-COO . formed-by-condensation-of-acid-and-alcohol)
       (formed-by-condensation-of-acid-and-alcohol . named-with-suffix-oate)
       (named-with-suffix-oate . hydrolyzed-by-acid-or-base)
       (hydrolyzed-by-acid-or-base . saponification-is-base-hydrolysis)
       (saponification-is-base-hydrolysis . fruity-odors-common)
       (fruity-odors-common . R-COO-R-prime-from-acid-plus-alcohol)))

    (amines
      (functional-group-class)
      (R-NH2-nitrogen-with-lone-pair)
      ((functional-group-class . organic-derivatives-of-ammonia)
       (organic-derivatives-of-ammonia . classified-primary-secondary-tertiary)
       (classified-primary-secondary-tertiary . act-as-Bronsted-Lowry-bases)
       (act-as-Bronsted-Lowry-bases . lone-pair-on-nitrogen-is-nucleophilic)
       (lone-pair-on-nitrogen-is-nucleophilic . pKb-typically-3-to-4)
       (pKb-typically-3-to-4 . form-amides-with-carboxylic-acids)
       (form-amides-with-carboxylic-acids . R-NH2-nitrogen-with-lone-pair)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; REACTION KINETICS
    ;;; Rates, rate laws, activation energy, catalysis
    ;;; SOURCE: [Zumdahl-10th] Ch. 12, [Atkins-PC-11th] Ch. 20
    ;;; ═══════════════════════════════════════════════════════════

    (reaction-rate
      (kinetics-concept)
      (change-in-concentration-per-unit-time)
      ((kinetics-concept . rate-equals-minus-d-reactant-over-dt)
       (rate-equals-minus-d-reactant-over-dt . equals-plus-d-product-over-dt)
       (equals-plus-d-product-over-dt . divided-by-stoichiometric-coefficient)
       (divided-by-stoichiometric-coefficient . units-mol/L-s)
       (units-mol/L-s . always-positive-by-convention)
       (always-positive-by-convention . change-in-concentration-per-unit-time)))

    (rate-law
      (kinetics-concept)
      (rate-equals-k-times-concentrations-to-orders)
      ((kinetics-concept . experimentally-determined)
       (experimentally-determined . rate-equals-k-A-to-m-B-to-n)
       (rate-equals-k-A-to-m-B-to-n . m-and-n-are-reaction-orders)
       (m-and-n-are-reaction-orders . overall-order-equals-m-plus-n)
       (overall-order-equals-m-plus-n . k-is-rate-constant)
       (k-is-rate-constant . cannot-be-determined-from-stoichiometry-alone)
       (cannot-be-determined-from-stoichiometry-alone . rate-equals-k-times-concentrations-to-orders)))

    (zero-order-kinetics
      (rate-law-type)
      (rate-independent-of-concentration)
      ((rate-law-type . rate-equals-k)
       (rate-equals-k . integrated-A-equals-A0-minus-kt)
       (integrated-A-equals-A0-minus-kt . linear-plot-A-vs-t)
       (linear-plot-A-vs-t . half-life-equals-A0-over-2k)
       (half-life-equals-A0-over-2k . rate-independent-of-concentration)))

    (first-order-kinetics
      (rate-law-type)
      (rate-proportional-to-concentration)
      ((rate-law-type . rate-equals-k-times-A)
       (rate-equals-k-times-A . integrated-ln-A-equals-ln-A0-minus-kt)
       (integrated-ln-A-equals-ln-A0-minus-kt . linear-plot-ln-A-vs-t)
       (linear-plot-ln-A-vs-t . half-life-equals-ln2-over-k)
       (half-life-equals-ln2-over-k . half-life-independent-of-concentration)
       (half-life-independent-of-concentration . rate-proportional-to-concentration)))

    (second-order-kinetics
      (rate-law-type)
      (rate-proportional-to-concentration-squared)
      ((rate-law-type . rate-equals-k-times-A-squared)
       (rate-equals-k-times-A-squared . integrated-1/A-equals-1/A0-plus-kt)
       (integrated-1/A-equals-1/A0-plus-kt . linear-plot-1/A-vs-t)
       (linear-plot-1/A-vs-t . half-life-equals-1-over-kA0)
       (half-life-equals-1-over-kA0 . half-life-depends-on-initial-concentration)
       (half-life-depends-on-initial-concentration . rate-proportional-to-concentration-squared)))

    (activation-energy
      (kinetics-concept)
      (minimum-energy-required-for-reaction)
      ((kinetics-concept . Ea-is-energy-barrier)
       (Ea-is-energy-barrier . transition-state-at-top-of-barrier)
       (transition-state-at-top-of-barrier . only-molecules-with-E-ge-Ea-react)
       (only-molecules-with-E-ge-Ea-react . higher-Ea-means-slower-reaction)
       (higher-Ea-means-slower-reaction . minimum-energy-required-for-reaction)))

    (Arrhenius-equation
      (kinetics-equation)
      (k-equals-A-exp-minus-Ea-over-RT)
      ((kinetics-equation . Arrhenius-1889)
       (Arrhenius-1889 . relates-rate-constant-to-temperature)
       (relates-rate-constant-to-temperature . A-is-pre-exponential-frequency-factor)
       (A-is-pre-exponential-frequency-factor . Ea-is-activation-energy)
       (Ea-is-activation-energy . exponential-temperature-dependence)
       (exponential-temperature-dependence . ln-k-vs-1/T-gives-straight-line)
       (ln-k-vs-1/T-gives-straight-line . slope-equals-minus-Ea-over-R)
       (slope-equals-minus-Ea-over-R . k-equals-A-exp-minus-Ea-over-RT)))

    (catalysis
      (kinetics-concept)
      (lowers-activation-energy-without-being-consumed)
      ((kinetics-concept . catalyst-provides-alternative-pathway)
       (catalyst-provides-alternative-pathway . lower-Ea-means-faster-rate)
       (lower-Ea-means-faster-rate . catalyst-not-consumed-in-reaction)
       (catalyst-not-consumed-in-reaction . does-not-change-equilibrium-position)
       (does-not-change-equilibrium-position . homogeneous-catalyst-same-phase-as-reactants)
       (homogeneous-catalyst-same-phase-as-reactants . heterogeneous-catalyst-different-phase)
       (heterogeneous-catalyst-different-phase . enzymes-are-biological-catalysts)
       (enzymes-are-biological-catalysts . lowers-activation-energy-without-being-consumed)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHEMICAL EQUILIBRIUM
    ;;; Le Chatelier's principle, Keq
    ;;; SOURCE: [Zumdahl-10th] Ch. 13, [Atkins-PC-11th] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (equilibrium-constant
      (equilibrium-concept)
      (Keq-equals-products-over-reactants-at-equilibrium)
      ((equilibrium-concept . law-of-mass-action)
       (law-of-mass-action . Keq-equals-product-concentrations-raised-to-coefficients)
       (Keq-equals-product-concentrations-raised-to-coefficients . divided-by-reactant-concentrations-raised-to-coefficients)
       (divided-by-reactant-concentrations-raised-to-coefficients . Keq-gt-1-favors-products)
       (Keq-gt-1-favors-products . Keq-lt-1-favors-reactants)
       (Keq-lt-1-favors-reactants . temperature-dependent)
       (temperature-dependent . delta-G0-equals-minus-RT-ln-Keq)
       (delta-G0-equals-minus-RT-ln-Keq . Keq-equals-products-over-reactants-at-equilibrium)))

    (reaction-quotient
      (equilibrium-concept)
      (Q-has-same-form-as-Keq-but-at-any-time)
      ((equilibrium-concept . calculated-at-non-equilibrium-conditions)
       (calculated-at-non-equilibrium-conditions . Q-lt-Keq-reaction-proceeds-forward)
       (Q-lt-Keq-reaction-proceeds-forward . Q-gt-Keq-reaction-proceeds-reverse)
       (Q-gt-Keq-reaction-proceeds-reverse . Q-equals-Keq-system-at-equilibrium)
       (Q-equals-Keq-system-at-equilibrium . Q-has-same-form-as-Keq-but-at-any-time)))

    (Le-Chatelier-principle
      (equilibrium-concept)
      (system-shifts-to-counteract-imposed-change)
      ((equilibrium-concept . Le-Chatelier-1884)
       (Le-Chatelier-1884 . add-reactant-shifts-toward-products)
       (add-reactant-shifts-toward-products . add-product-shifts-toward-reactants)
       (add-product-shifts-toward-reactants . increase-T-shifts-toward-endothermic-direction)
       (increase-T-shifts-toward-endothermic-direction . increase-P-shifts-toward-fewer-moles-of-gas)
       (increase-P-shifts-toward-fewer-moles-of-gas . catalyst-does-not-shift-equilibrium)
       (catalyst-does-not-shift-equilibrium . system-shifts-to-counteract-imposed-change)))

    (Kp-and-Kc-relationship
      (equilibrium-concept)
      (Kp-equals-Kc-times-RT-to-delta-n)
      ((equilibrium-concept . Kc-uses-molar-concentrations)
       (Kc-uses-molar-concentrations . Kp-uses-partial-pressures)
       (Kp-uses-partial-pressures . delta-n-equals-moles-gas-products-minus-reactants)
       (delta-n-equals-moles-gas-products-minus-reactants . if-delta-n-equals-0-then-Kp-equals-Kc)
       (if-delta-n-equals-0-then-Kp-equals-Kc . Kp-equals-Kc-times-RT-to-delta-n)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NUCLEAR CHEMISTRY
    ;;; Fission, fusion, radioactive decay
    ;;; SOURCE: [Zumdahl-10th] Ch. 19, [Atkins-7th] Ch. 17
    ;;; ═══════════════════════════════════════════════════════════

    (alpha-decay
      (radioactive-decay-type)
      (emits-helium-4-nucleus)
      ((radioactive-decay-type . parent-emits-He-4-nucleus)
       (parent-emits-He-4-nucleus . Z-decreases-by-2)
       (Z-decreases-by-2 . A-decreases-by-4)
       (A-decreases-by-4 . heavy-nuclei-Z-gt-82)
       (heavy-nuclei-Z-gt-82 . low-penetrating-power)
       (low-penetrating-power . stopped-by-paper-or-skin)
       (stopped-by-paper-or-skin . emits-helium-4-nucleus)))

    (beta-decay
      (radioactive-decay-type)
      (neutron-converts-to-proton-emitting-electron)
      ((radioactive-decay-type . beta-minus-decay)
       (beta-minus-decay . neutron-to-proton-plus-electron-plus-antineutrino)
       (neutron-to-proton-plus-electron-plus-antineutrino . Z-increases-by-1)
       (Z-increases-by-1 . A-unchanged)
       (A-unchanged . moderate-penetrating-power)
       (moderate-penetrating-power . stopped-by-aluminum-sheet)
       (stopped-by-aluminum-sheet . neutron-converts-to-proton-emitting-electron)))

    (positron-emission
      (radioactive-decay-type)
      (proton-converts-to-neutron-emitting-positron)
      ((radioactive-decay-type . beta-plus-decay)
       (beta-plus-decay . proton-to-neutron-plus-positron-plus-neutrino)
       (proton-to-neutron-plus-positron-plus-neutrino . Z-decreases-by-1)
       (Z-decreases-by-1 . A-unchanged)
       (A-unchanged . positron-annihilates-with-electron)
       (positron-annihilates-with-electron . produces-two-511-keV-gamma-rays)
       (produces-two-511-keV-gamma-rays . proton-converts-to-neutron-emitting-positron)))

    (gamma-emission
      (radioactive-decay-type)
      (excited-nucleus-emits-high-energy-photon)
      ((radioactive-decay-type . electromagnetic-radiation)
       (electromagnetic-radiation . no-change-in-Z-or-A)
       (no-change-in-Z-or-A . follows-alpha-or-beta-decay)
       (follows-alpha-or-beta-decay . nucleus-transitions-from-excited-to-ground-state)
       (nucleus-transitions-from-excited-to-ground-state . highest-penetrating-power)
       (highest-penetrating-power . attenuated-by-lead-or-concrete)
       (attenuated-by-lead-or-concrete . excited-nucleus-emits-high-energy-photon)))

    (electron-capture
      (radioactive-decay-type)
      (inner-electron-captured-by-nucleus)
      ((radioactive-decay-type . orbital-electron-absorbed-by-proton)
       (orbital-electron-absorbed-by-proton . proton-plus-electron-yields-neutron-plus-neutrino)
       (proton-plus-electron-yields-neutron-plus-neutrino . Z-decreases-by-1)
       (Z-decreases-by-1 . A-unchanged)
       (A-unchanged . characteristic-X-rays-emitted)
       (characteristic-X-rays-emitted . inner-electron-captured-by-nucleus)))

    (nuclear-fission
      (nuclear-reaction-type)
      (heavy-nucleus-splits-into-lighter-nuclei)
      ((nuclear-reaction-type . induced-by-neutron-bombardment)
       (induced-by-neutron-bombardment . U-235-plus-n-yields-fission-products-plus-neutrons)
       (U-235-plus-n-yields-fission-products-plus-neutrons . releases-approx-200-MeV-per-fission)
       (releases-approx-200-MeV-per-fission . mass-defect-converted-to-energy-E-equals-mc2)
       (mass-defect-converted-to-energy-E-equals-mc2 . chain-reaction-if-neutrons-sustain)
       (chain-reaction-if-neutrons-sustain . critical-mass-required)
       (critical-mass-required . heavy-nucleus-splits-into-lighter-nuclei)))

    (nuclear-fusion
      (nuclear-reaction-type)
      (light-nuclei-combine-to-form-heavier-nucleus)
      ((nuclear-reaction-type . requires-extreme-temperature-to-overcome-Coulomb-barrier)
       (requires-extreme-temperature-to-overcome-Coulomb-barrier . H-2-plus-H-3-yields-He-4-plus-neutron)
       (H-2-plus-H-3-yields-He-4-plus-neutron . releases-17.6-MeV-per-reaction)
       (releases-17.6-MeV-per-reaction . mass-defect-converted-to-energy)
       (mass-defect-converted-to-energy . powers-main-sequence-stars)
       (powers-main-sequence-stars . higher-energy-per-nucleon-than-fission)
       (higher-energy-per-nucleon-than-fission . light-nuclei-combine-to-form-heavier-nucleus)))

    (radioactive-decay-kinetics
      (nuclear-kinetics)
      (first-order-with-half-life-t-half)
      ((nuclear-kinetics . N-equals-N0-exp-minus-lambda-t)
       (N-equals-N0-exp-minus-lambda-t . lambda-is-decay-constant)
       (lambda-is-decay-constant . t-half-equals-ln2-over-lambda)
       (t-half-equals-ln2-over-lambda . independent-of-temperature-and-pressure)
       (independent-of-temperature-and-pressure . C-14-half-life-5730-years)
       (C-14-half-life-5730-years . used-in-radiometric-dating)
       (used-in-radiometric-dating . first-order-with-half-life-t-half)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPECTROSCOPY
    ;;; IR, NMR, mass spectrometry — functional group identification
    ;;; SOURCE: [Clayden-2nd] Ch. 3, [Atkins-PC-11th] Ch. 12-14
    ;;; ═══════════════════════════════════════════════════════════

    (infrared-spectroscopy
      (spectroscopic-method)
      (measures-molecular-vibrations)
      ((spectroscopic-method . IR-absorption)
       (IR-absorption . molecule-absorbs-IR-if-dipole-moment-changes)
       (molecule-absorbs-IR-if-dipole-moment-changes . frequency-matches-bond-vibration)
       (frequency-matches-bond-vibration . wavenumber-units-cm-inv)
       (wavenumber-units-cm-inv . O-H-stretch-3200-3600-cm-inv-broad)
       (O-H-stretch-3200-3600-cm-inv-broad . N-H-stretch-3300-3500-cm-inv)
       (N-H-stretch-3300-3500-cm-inv . C-H-stretch-2850-3300-cm-inv)
       (C-H-stretch-2850-3300-cm-inv . C-equals-O-stretch-1650-1750-cm-inv-strong)
       (C-equals-O-stretch-1650-1750-cm-inv-strong . C-equals-C-stretch-1620-1680-cm-inv)
       (C-equals-C-stretch-1620-1680-cm-inv . fingerprint-region-below-1500-cm-inv)
       (fingerprint-region-below-1500-cm-inv . measures-molecular-vibrations)))

    (NMR-spectroscopy
      (spectroscopic-method)
      (measures-nuclear-spin-environments)
      ((spectroscopic-method . nuclear-magnetic-resonance)
       (nuclear-magnetic-resonance . spin-half-nuclei-H-1-and-C-13)
       (spin-half-nuclei-H-1-and-C-13 . placed-in-external-magnetic-field)
       (placed-in-external-magnetic-field . resonance-frequency-depends-on-chemical-environment)
       (resonance-frequency-depends-on-chemical-environment . chemical-shift-in-ppm-relative-to-TMS)
       (chemical-shift-in-ppm-relative-to-TMS . H-1-NMR-range-0-to-12-ppm)
       (H-1-NMR-range-0-to-12-ppm . splitting-pattern-from-n-plus-1-rule)
       (splitting-pattern-from-n-plus-1-rule . integration-gives-relative-proton-count)
       (integration-gives-relative-proton-count . measures-nuclear-spin-environments)))

    (mass-spectrometry
      (spectroscopic-method)
      (measures-mass-to-charge-ratio)
      ((spectroscopic-method . ionization-and-fragmentation)
       (ionization-and-fragmentation . molecular-ion-peak-gives-molecular-mass)
       (molecular-ion-peak-gives-molecular-mass . M-plus-peak-at-highest-mass-cluster)
       (M-plus-peak-at-highest-mass-cluster . fragmentation-pattern-indicates-structure)
       (fragmentation-pattern-indicates-structure . base-peak-is-most-abundant-fragment)
       (base-peak-is-most-abundant-fragment . isotope-pattern-identifies-Cl-Br-presence)
       (isotope-pattern-identifies-Cl-Br-presence . high-resolution-gives-molecular-formula)
       (high-resolution-gives-molecular-formula . measures-mass-to-charge-ratio)))

  )

  ((Zumdahl-Atkins . chemistry-registered)))
