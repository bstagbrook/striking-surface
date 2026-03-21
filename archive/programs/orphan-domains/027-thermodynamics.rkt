#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; THERMODYNAMICS — ENERGY, ENTROPY, PHASE TRANSITIONS
;;;
;;; The laws of thermodynamics as structural chains.
;;; Physical constants computed/known. Phase transition
;;; temperatures for common substances.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-thermodynamics

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: thermodynamics register
  (
    ;;; Zeroth law: thermal equilibrium is transitive
    (zeroth-law (A-equil-B-and-B-equil-C) (A-equil-C) ((A-equil-B-and-B-equil-C . transitivity) (transitivity . A-equil-C)))

    ;;; First law: energy conservation, dU = dQ - dW
    (first-law (system) (energy-conserved) ((system . internal-energy-U) (internal-energy-U . heat-in-Q) (heat-in-Q . work-out-W) (work-out-W . dU-equals-dQ-minus-dW) (dU-equals-dQ-minus-dW . energy-conserved)))

    ;;; Second law: entropy of isolated system never decreases
    (second-law (isolated-system) (entropy-nondecreasing) ((isolated-system . spontaneous-process) (spontaneous-process . dS-geq-0) (dS-geq-0 . entropy-nondecreasing)))

    ;;; Third law: entropy approaches zero as T approaches zero
    (third-law (perfect-crystal) (S-approaches-0-at-T-0) ((perfect-crystal . T-approaches-0K) (T-approaches-0K . ground-state-only) (ground-state-only . S-approaches-0-at-T-0)))

    ;;; Boltzmann constant: k_B = 1.380649e-23 J/K (exact, SI definition)
    (boltzmann-constant (k-B) (1.380649e-23-J/K) ((k-B . 1.380649e-23-J/K)))

    ;;; Water phase transitions at 1 atm
    (water-freeze (water-at-273.15K) (ice) ((water-at-273.15K . releases-heat) (releases-heat . crystallizes) (crystallizes . ice)))
    (water-boil (water-at-373.15K) (steam) ((water-at-373.15K . absorbs-heat) (absorbs-heat . vaporizes) (vaporizes . steam)))

    ;;; Element melting and boiling points
    (melt-mercury (mercury-solid) (mercury-liquid-at-234.32K) ((mercury-solid . mercury-liquid-at-234.32K)))
    (boil-mercury (mercury-liquid) (mercury-gas-at-629.88K) ((mercury-liquid . mercury-gas-at-629.88K)))
    (melt-gold (gold-solid) (gold-liquid-at-1337.33K) ((gold-solid . gold-liquid-at-1337.33K)))
    (boil-gold (gold-liquid) (gold-gas-at-3243K) ((gold-liquid . gold-gas-at-3243K)))
    (melt-iron (iron-solid) (iron-liquid-at-1811K) ((iron-solid . iron-liquid-at-1811K)))
    (boil-iron (iron-liquid) (iron-gas-at-3134K) ((iron-liquid . iron-gas-at-3134K)))
    (melt-nitrogen (nitrogen-solid) (nitrogen-liquid-at-63.15K) ((nitrogen-solid . nitrogen-liquid-at-63.15K)))
    (boil-nitrogen (nitrogen-liquid) (nitrogen-gas-at-77.36K) ((nitrogen-liquid . nitrogen-gas-at-77.36K)))
    (melt-helium (helium-solid) (helium-liquid-at-none-no-solid-at-1atm) ((helium-solid . helium-liquid-at-none-no-solid-at-1atm)))
    (boil-helium (helium-liquid) (helium-gas-at-4.22K) ((helium-liquid . helium-gas-at-4.22K)))

    ;;; Carnot efficiency: eta = 1 - T_cold/T_hot
    (carnot-efficiency (T-hot-and-T-cold) (max-efficiency) ((T-hot-and-T-cold . eta-equals-1-minus-Tc/Th) (eta-equals-1-minus-Tc/Th . no-engine-exceeds-Carnot) (no-engine-exceeds-Carnot . max-efficiency)))

    ;;; Computed Carnot efficiencies
    (carnot-steam-engine (steam-engine-Th373K-Tc300K) (eta-19.6pct) ((steam-engine-Th373K-Tc300K . eta-19.6pct)))
    (carnot-car-engine (car-engine-Th600K-Tc300K) (eta-50.0pct) ((car-engine-Th600K-Tc300K . eta-50.0pct)))
    (carnot-power-plant (power-plant-Th800K-Tc300K) (eta-62.5pct) ((power-plant-Th800K-Tc300K . eta-62.5pct)))
    (carnot-sun-surface-to-earth (sun-surface-to-earth-Th5778K-Tc300K) (eta-94.8pct) ((sun-surface-to-earth-Th5778K-Tc300K . eta-94.8pct)))

    ;;; Entropy of mixing (ideal): dS = -nR * sum(xi * ln(xi))
    (entropy-of-mixing (two-ideal-gases) (positive-dS) ((two-ideal-gases . spontaneous-mixing) (spontaneous-mixing . dS-positive) (dS-positive . irreversible) (irreversible . positive-dS)))

  )

  ;;; Vacuum tube
  ((tesla . thermodynamics-registered)))
