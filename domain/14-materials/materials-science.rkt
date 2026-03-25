#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Materials Science — structure, properties, and behavior
;;; LAYER: 14-materials
;;; DEPENDS ON: 01-particles (electrons), 03-atoms (elements),
;;;   04-molecules (bonding), 09-electromagnetism (fields, conductivity)
;;; DEPENDED ON BY: engineering, nanotechnology, device physics,
;;;   quantum computing substrates
;;;
;;; PURPOSE: Classification and properties of materials from
;;; crystal structure through advanced engineered materials.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Callister-2018] Callister & Rethwisch, Materials Science and
;;;   Engineering: An Introduction, 10th ed., Wiley, 2018
;;; [Ashcroft-1976] Ashcroft & Mermin, Solid State Physics,
;;;   Cengage, 1976 (standard graduate reference)
;;; [Kittel-2005] Kittel, Introduction to Solid State Physics,
;;;   8th ed., Wiley, 2005
;;; [BCS-1957] Bardeen, Cooper, Schrieffer, Phys. Rev. 108, 1175 (1957)
;;; [Bednorz-1986] Bednorz & Müller, Z. Phys. B 64, 189 (1986)
;;; [Novoselov-2004] Novoselov et al., Science 306, 666 (2004)
;;; [Hasan-2010] Hasan & Kane, Rev. Mod. Phys. 82, 3045 (2010)
;;; [Veselago-1968] Veselago, Sov. Phys. Usp. 10, 509 (1968)
;;; [Pendry-2000] Pendry, Phys. Rev. Lett. 85, 3966 (2000)
;;;
;;; UNITS: Stated explicitly. eV for band gaps. K for temperatures.
;;;   S/m for conductivity. m for lattice parameters.
;;;
;;; CALIBRATION: materials-science.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-materials-science

  ((Callister-2018 (materials-science-and-engineering-10th-ed) (authoritative)
    ((materials-science-and-engineering-10th-ed . authoritative)))
   (Ashcroft-1976 (solid-state-physics) (authoritative)
    ((solid-state-physics . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CRYSTAL STRUCTURES — the 4 most common metallic/covalent lattices
    ;;; SOURCE: [Callister-2018] Ch. 3; [Ashcroft-1976] Ch. 4
    ;;; ═══════════════════════════════════════════════════════════

    (face-centered-cubic
      (FCC-unit-cell)
      (coordination-number-12 . packing-factor-0.74)
      ((FCC-unit-cell . atoms-at-corners-and-face-centers)
       (atoms-at-corners-and-face-centers . 4-atoms-per-unit-cell)
       (4-atoms-per-unit-cell . coordination-number-12)
       (coordination-number-12 . atomic-packing-factor-0.74)
       (atomic-packing-factor-0.74 . closest-packed-structure)
       (closest-packed-structure . ABCABC-stacking-sequence)
       (ABCABC-stacking-sequence . examples-Cu-Al-Au-Ag-Ni-Pb-Pt)
       (examples-Cu-Al-Au-Ag-Ni-Pb-Pt . packing-factor-0.74)))

    (body-centered-cubic
      (BCC-unit-cell)
      (coordination-number-8 . packing-factor-0.68)
      ((BCC-unit-cell . atoms-at-corners-and-body-center)
       (atoms-at-corners-and-body-center . 2-atoms-per-unit-cell)
       (2-atoms-per-unit-cell . coordination-number-8)
       (coordination-number-8 . atomic-packing-factor-0.68)
       (atomic-packing-factor-0.68 . not-close-packed)
       (not-close-packed . examples-Fe-Cr-W-Mo-V-Na-K)
       (examples-Fe-Cr-W-Mo-V-Na-K . packing-factor-0.68)))

    (hexagonal-close-packed
      (HCP-unit-cell)
      (coordination-number-12 . packing-factor-0.74)
      ((HCP-unit-cell . atoms-in-hexagonal-arrangement)
       (atoms-in-hexagonal-arrangement . 6-atoms-per-unit-cell)
       (6-atoms-per-unit-cell . coordination-number-12)
       (coordination-number-12 . atomic-packing-factor-0.74)
       (atomic-packing-factor-0.74 . closest-packed-structure)
       (closest-packed-structure . ABABAB-stacking-sequence)
       (ABABAB-stacking-sequence . examples-Mg-Ti-Zn-Co-Zr-Cd)
       (examples-Mg-Ti-Zn-Co-Zr-Cd . packing-factor-0.74)))

    ;;; SOURCE: [Ashcroft-1976] Ch. 4; [Kittel-2005] Ch. 1
    (diamond-cubic
      (diamond-cubic-unit-cell)
      (coordination-number-4 . packing-factor-0.34)
      ((diamond-cubic-unit-cell . two-interpenetrating-FCC-sublattices)
       (two-interpenetrating-FCC-sublattices . 8-atoms-per-unit-cell)
       (8-atoms-per-unit-cell . each-atom-tetrahedrally-bonded)
       (each-atom-tetrahedrally-bonded . coordination-number-4)
       (coordination-number-4 . atomic-packing-factor-0.34)
       (atomic-packing-factor-0.34 . low-packing-due-to-directional-covalent-bonds)
       (low-packing-due-to-directional-covalent-bonds . examples-C-diamond-Si-Ge)
       (examples-C-diamond-Si-Ge . packing-factor-0.34)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; METALLIC BONDING AND CONDUCTIVITY
    ;;; SOURCE: [Callister-2018] Ch. 2, Ch. 18; [Ashcroft-1976] Ch. 1-3
    ;;; ═══════════════════════════════════════════════════════════

    (metallic-bonding
      (metal-atoms-in-lattice)
      (delocalized-electron-sea)
      ((metal-atoms-in-lattice . valence-electrons-not-bound-to-individual-atoms)
       (valence-electrons-not-bound-to-individual-atoms . shared-among-all-atoms-in-lattice)
       (shared-among-all-atoms-in-lattice . delocalized-electron-sea)
       (delocalized-electron-sea . nondirectional-bonding)
       (nondirectional-bonding . high-coordination-numbers)))

    (metallic-conductivity
      (delocalized-electrons-in-metal)
      (high-electrical-and-thermal-conductivity)
      ((delocalized-electrons-in-metal . electrons-free-to-move-under-applied-field)
       (electrons-free-to-move-under-applied-field . electrical-conductivity-1e6-to-1e8-S/m)
       (electrical-conductivity-1e6-to-1e8-S/m . Cu-conductivity-5.96e7-S/m-at-20C)
       (Cu-conductivity-5.96e7-S/m-at-20C . Ag-conductivity-6.30e7-S/m-at-20C)
       (Ag-conductivity-6.30e7-S/m-at-20C . Wiedemann-Franz-law)
       (Wiedemann-Franz-law . thermal-conductivity-proportional-to-electrical)
       (thermal-conductivity-proportional-to-electrical . high-electrical-and-thermal-conductivity)))

    (metallic-properties
      (metallic-bonding-character)
      (ductile-malleable-lustrous)
      ((metallic-bonding-character . nondirectional-bonds-allow-slip)
       (nondirectional-bonds-allow-slip . ductile-and-malleable)
       (ductile-and-malleable . free-electrons-reflect-light)
       (free-electrons-reflect-light . metallic-luster)
       (metallic-luster . ductile-malleable-lustrous)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BAND THEORY — semiconductors, insulators, metals
    ;;; SOURCE: [Ashcroft-1976] Ch. 8-12, 28-29; [Callister-2018] Ch. 18
    ;;; ═══════════════════════════════════════════════════════════

    (band-theory
      (periodic-potential-of-crystal-lattice)
      (allowed-and-forbidden-energy-bands)
      ((periodic-potential-of-crystal-lattice . Bloch-theorem)
       (Bloch-theorem . electron-wavefunctions-are-Bloch-waves)
       (electron-wavefunctions-are-Bloch-waves . energy-eigenvalues-form-bands)
       (energy-eigenvalues-form-bands . allowed-bands-separated-by-forbidden-gaps)
       (allowed-bands-separated-by-forbidden-gaps . allowed-and-forbidden-energy-bands)))

    (valence-band
      (highest-occupied-energy-band-at-0K)
      (electrons-in-bonding-states)
      ((highest-occupied-energy-band-at-0K . contains-valence-electrons)
       (contains-valence-electrons . completely-filled-at-0K-in-semiconductors-and-insulators)
       (completely-filled-at-0K-in-semiconductors-and-insulators . electrons-in-bonding-states)))

    (conduction-band
      (lowest-unoccupied-energy-band-at-0K)
      (electrons-free-to-conduct)
      ((lowest-unoccupied-energy-band-at-0K . empty-at-0K-in-semiconductors-and-insulators)
       (empty-at-0K-in-semiconductors-and-insulators . electrons-promoted-here-are-mobile)
       (electrons-promoted-here-are-mobile . electrons-free-to-conduct)))

    (band-gap
      (energy-gap-between-valence-and-conduction-bands)
      (determines-electrical-classification)
      ((energy-gap-between-valence-and-conduction-bands . no-allowed-states-in-gap)
       (no-allowed-states-in-gap . thermal-excitation-can-bridge-small-gaps)
       (thermal-excitation-can-bridge-small-gaps . determines-electrical-classification)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SEMICONDUCTORS
    ;;; SOURCE: [Ashcroft-1976] Ch. 28-29; [Callister-2018] Ch. 18
    ;;; ═══════════════════════════════════════════════════════════

    (semiconductor-definition
      (material-with-band-gap-0.1-to-3-eV)
      (conductivity-between-metal-and-insulator)
      ((material-with-band-gap-0.1-to-3-eV . Si-band-gap-1.12-eV-at-300K)
       (Si-band-gap-1.12-eV-at-300K . Ge-band-gap-0.67-eV-at-300K)
       (Ge-band-gap-0.67-eV-at-300K . GaAs-band-gap-1.43-eV-at-300K)
       (GaAs-band-gap-1.43-eV-at-300K . conductivity-increases-with-temperature)
       (conductivity-increases-with-temperature . conductivity-between-metal-and-insulator)))

    ;;; SOURCE: [Callister-2018] Ch. 18; [Ashcroft-1976] Ch. 28
    (intrinsic-semiconductor
      (pure-semiconductor-no-dopants)
      (electron-hole-pairs-from-thermal-excitation)
      ((pure-semiconductor-no-dopants . electrons-thermally-excited-across-gap)
       (electrons-thermally-excited-across-gap . each-excited-electron-leaves-a-hole)
       (each-excited-electron-leaves-a-hole . equal-numbers-of-electrons-and-holes)
       (equal-numbers-of-electrons-and-holes . intrinsic-carrier-concentration-ni)
       (intrinsic-carrier-concentration-ni . Si-ni-equals-1.5e10-per-cm3-at-300K)
       (Si-ni-equals-1.5e10-per-cm3-at-300K . electron-hole-pairs-from-thermal-excitation)))

    ;;; SOURCE: [Callister-2018] Ch. 18; [Ashcroft-1976] Ch. 28
    (n-type-doping
      (group-V-dopant-in-group-IV-semiconductor)
      (excess-conduction-electrons)
      ((group-V-dopant-in-group-IV-semiconductor . example-P-or-As-in-Si)
       (example-P-or-As-in-Si . 5-valence-electrons-in-4-bond-lattice)
       (5-valence-electrons-in-4-bond-lattice . one-extra-electron-per-dopant-atom)
       (one-extra-electron-per-dopant-atom . donor-energy-level-near-conduction-band)
       (donor-energy-level-near-conduction-band . easily-ionized-at-room-temperature)
       (easily-ionized-at-room-temperature . majority-carriers-are-electrons)
       (majority-carriers-are-electrons . excess-conduction-electrons)))

    ;;; SOURCE: [Callister-2018] Ch. 18; [Ashcroft-1976] Ch. 28
    (p-type-doping
      (group-III-dopant-in-group-IV-semiconductor)
      (excess-holes)
      ((group-III-dopant-in-group-IV-semiconductor . example-B-or-Ga-in-Si)
       (example-B-or-Ga-in-Si . 3-valence-electrons-in-4-bond-lattice)
       (3-valence-electrons-in-4-bond-lattice . one-missing-bond-per-dopant-atom)
       (one-missing-bond-per-dopant-atom . acceptor-energy-level-near-valence-band)
       (acceptor-energy-level-near-valence-band . easily-ionized-at-room-temperature)
       (easily-ionized-at-room-temperature . majority-carriers-are-holes)
       (majority-carriers-are-holes . excess-holes)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INSULATORS
    ;;; SOURCE: [Callister-2018] Ch. 18; [Ashcroft-1976] Ch. 19
    ;;; ═══════════════════════════════════════════════════════════

    (insulator-definition
      (material-with-band-gap-greater-than-3-eV)
      (negligible-electrical-conductivity)
      ((material-with-band-gap-greater-than-3-eV . diamond-band-gap-5.47-eV)
       (diamond-band-gap-5.47-eV . SiO2-band-gap-9-eV)
       (SiO2-band-gap-9-eV . Al2O3-band-gap-8.8-eV)
       (Al2O3-band-gap-8.8-eV . thermal-excitation-insufficient-at-room-temperature)
       (thermal-excitation-insufficient-at-room-temperature . conductivity-below-1e-10-S/m)
       (conductivity-below-1e-10-S/m . negligible-electrical-conductivity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SUPERCONDUCTORS
    ;;; SOURCE: [BCS-1957]; [Ashcroft-1976] Ch. 34;
    ;;;   [Bednorz-1986]; [Callister-2018] Ch. 20
    ;;; ═══════════════════════════════════════════════════════════

    (superconductivity-fundamentals
      (material-cooled-below-critical-temperature-Tc)
      (zero-electrical-resistance)
      ((material-cooled-below-critical-temperature-Tc . resistance-drops-to-exactly-zero)
       (resistance-drops-to-exactly-zero . not-merely-low-but-identically-zero)
       (not-merely-low-but-identically-zero . persistent-currents-observed-for-years)
       (persistent-currents-observed-for-years . discovered-by-Onnes-1911-in-Hg)
       (discovered-by-Onnes-1911-in-Hg . Hg-Tc-equals-4.15-K)
       (Hg-Tc-equals-4.15-K . zero-electrical-resistance)))

    ;;; SOURCE: [Ashcroft-1976] Ch. 34; Meissner & Ochsenfeld 1933
    (Meissner-effect
      (superconductor-below-Tc-in-external-B-field)
      (complete-expulsion-of-magnetic-flux)
      ((superconductor-below-Tc-in-external-B-field . magnetic-field-expelled-from-interior)
       (magnetic-field-expelled-from-interior . B-equals-0-inside-bulk)
       (B-equals-0-inside-bulk . surface-screening-currents-flow)
       (surface-screening-currents-flow . not-merely-perfect-conductivity)
       (not-merely-perfect-conductivity . thermodynamic-equilibrium-state)
       (thermodynamic-equilibrium-state . complete-expulsion-of-magnetic-flux)))

    ;;; SOURCE: [BCS-1957] Bardeen, Cooper, Schrieffer
    (BCS-theory
      (phonon-mediated-electron-electron-attraction)
      (Cooper-pairs-form-condensate)
      ((phonon-mediated-electron-electron-attraction . electron-deforms-lattice)
       (electron-deforms-lattice . lattice-distortion-attracts-second-electron)
       (lattice-distortion-attracts-second-electron . net-attractive-interaction)
       (net-attractive-interaction . two-electrons-form-Cooper-pair)
       (two-electrons-form-Cooper-pair . opposite-momentum-and-spin)
       (opposite-momentum-and-spin . Cooper-pair-is-boson-spin-0)
       (Cooper-pair-is-boson-spin-0 . all-pairs-condense-into-same-quantum-state)
       (all-pairs-condense-into-same-quantum-state . macroscopic-quantum-coherence)
       (macroscopic-quantum-coherence . energy-gap-2-Delta-at-Fermi-surface)
       (energy-gap-2-Delta-at-Fermi-surface . Cooper-pairs-form-condensate)))

    ;;; SOURCE: [Ashcroft-1976] Ch. 34; [Callister-2018] Ch. 20
    (type-I-superconductor
      (single-critical-magnetic-field-Hc)
      (abrupt-transition-to-normal-state)
      ((single-critical-magnetic-field-Hc . complete-Meissner-effect-below-Hc)
       (complete-Meissner-effect-below-Hc . above-Hc-fully-normal)
       (above-Hc-fully-normal . sharp-first-order-phase-transition)
       (sharp-first-order-phase-transition . most-elemental-superconductors)
       (most-elemental-superconductors . examples-Hg-Pb-Sn-Al-In)
       (examples-Hg-Pb-Sn-Al-In . abrupt-transition-to-normal-state)))

    ;;; SOURCE: [Ashcroft-1976] Ch. 34; Abrikosov 1957
    (type-II-superconductor
      (two-critical-fields-Hc1-and-Hc2)
      (mixed-state-with-vortex-lattice)
      ((two-critical-fields-Hc1-and-Hc2 . below-Hc1-complete-Meissner-effect)
       (below-Hc1-complete-Meissner-effect . between-Hc1-and-Hc2-mixed-state)
       (between-Hc1-and-Hc2-mixed-state . magnetic-flux-enters-as-quantized-vortices)
       (magnetic-flux-enters-as-quantized-vortices . each-vortex-carries-one-flux-quantum)
       (each-vortex-carries-one-flux-quantum . flux-quantum-h-over-2e-equals-2.07e-15-Wb)
       (flux-quantum-h-over-2e-equals-2.07e-15-Wb . Abrikosov-vortex-lattice)
       (Abrikosov-vortex-lattice . above-Hc2-fully-normal)
       (above-Hc2-fully-normal . Hc2-much-greater-than-Hc1)
       (Hc2-much-greater-than-Hc1 . examples-Nb-NbTi-Nb3Sn)
       (examples-Nb-NbTi-Nb3Sn . used-in-high-field-magnets-MRI-LHC)
       (used-in-high-field-magnets-MRI-LHC . mixed-state-with-vortex-lattice)))

    ;;; SOURCE: [Bednorz-1986]; Wu et al. Phys. Rev. Lett. 58, 908 (1987)
    (high-temperature-superconductors
      (cuprate-perovskite-materials)
      (Tc-above-liquid-nitrogen-77K)
      ((cuprate-perovskite-materials . discovered-by-Bednorz-and-Muller-1986)
       (discovered-by-Bednorz-and-Muller-1986 . La-Ba-Cu-O-Tc-35K-original)
       (La-Ba-Cu-O-Tc-35K-original . Nobel-Prize-1987)
       (Nobel-Prize-1987 . YBCO-YBa2Cu3O7-discovered-1987)
       (YBCO-YBa2Cu3O7-discovered-1987 . YBCO-Tc-equals-93K)
       (YBCO-Tc-equals-93K . above-liquid-nitrogen-boiling-77K)
       (above-liquid-nitrogen-boiling-77K . all-type-II-superconductors)
       (all-type-II-superconductors . mechanism-not-fully-explained-by-BCS)
       (mechanism-not-fully-explained-by-BCS . CuO2-planes-essential-for-superconductivity)
       (CuO2-planes-essential-for-superconductivity . Tc-above-liquid-nitrogen-77K)))

    ;;; SOURCE: current status as of established literature
    (room-temperature-superconductivity-goal
      (Tc-at-or-above-300K-at-ambient-pressure)
      (not-yet-achieved-reproducibly)
      ((Tc-at-or-above-300K-at-ambient-pressure . would-revolutionize-power-transmission)
       (would-revolutionize-power-transmission . lossless-electrical-grids)
       (lossless-electrical-grids . current-record-Tc-under-extreme-pressure)
       (current-record-Tc-under-extreme-pressure . H3S-Tc-203K-at-150-GPa-Drozdov-2015)
       (H3S-Tc-203K-at-150-GPa-Drozdov-2015 . LaH10-Tc-250K-at-170-GPa-Somayazulu-2019)
       (LaH10-Tc-250K-at-170-GPa-Somayazulu-2019 . ambient-pressure-room-temp-not-yet-achieved)
       (ambient-pressure-room-temp-not-yet-achieved . not-yet-achieved-reproducibly)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MAGNETIC MATERIALS
    ;;; SOURCE: [Callister-2018] Ch. 20; [Ashcroft-1976] Ch. 31-33;
    ;;;   [Kittel-2005] Ch. 11-12
    ;;; ═══════════════════════════════════════════════════════════

    (diamagnetism
      (all-materials)
      (weak-repulsion-from-applied-field)
      ((all-materials . orbital-electrons-respond-to-external-B)
       (orbital-electrons-respond-to-external-B . induced-magnetic-moment-opposes-field)
       (induced-magnetic-moment-opposes-field . negative-susceptibility)
       (negative-susceptibility . chi-on-order-minus-1e-5)
       (chi-on-order-minus-1e-5 . present-in-all-matter)
       (present-in-all-matter . usually-masked-by-stronger-effects)
       (usually-masked-by-stronger-effects . superconductors-are-perfect-diamagnets)
       (superconductors-are-perfect-diamagnets . diamagnetic-levitation-possible)
       (diamagnetic-levitation-possible . water-and-bismuth-visibly-repelled-by-strong-fields)
       (water-and-bismuth-visibly-repelled-by-strong-fields . weak-repulsion-from-applied-field)))

    (paramagnetism
      (materials-with-unpaired-electrons)
      (weak-attraction-to-applied-field)
      ((materials-with-unpaired-electrons . permanent-atomic-magnetic-moments)
       (permanent-atomic-magnetic-moments . randomly-oriented-without-external-field)
       (randomly-oriented-without-external-field . partially-align-with-applied-B)
       (partially-align-with-applied-B . positive-susceptibility)
       (positive-susceptibility . chi-on-order-1e-5-to-1e-3)
       (chi-on-order-1e-5-to-1e-3 . Curie-law-chi-proportional-to-1-over-T)
       (Curie-law-chi-proportional-to-1-over-T . examples-Al-Pt-O2-Mn)
       (examples-Al-Pt-O2-Mn . weak-attraction-to-applied-field)))

    ;;; SOURCE: [Callister-2018] Ch. 20; [Kittel-2005] Ch. 12
    (ferromagnetism
      (materials-with-exchange-interaction)
      (spontaneous-magnetization-below-Curie-temperature)
      ((materials-with-exchange-interaction . quantum-exchange-aligns-neighboring-spins)
       (quantum-exchange-aligns-neighboring-spins . parallel-alignment-energetically-favored)
       (parallel-alignment-energetically-favored . spontaneous-magnetization-without-external-field)
       (spontaneous-magnetization-without-external-field . organized-into-magnetic-domains)
       (organized-into-magnetic-domains . domain-walls-move-under-applied-field)
       (domain-walls-move-under-applied-field . hysteresis-in-M-vs-H-curve)
       (hysteresis-in-M-vs-H-curve . spontaneous-magnetization-below-Curie-temperature)))

    ;;; SOURCE: [Kittel-2005] Ch. 12; [Callister-2018] Ch. 20
    (ferromagnetic-elements
      (Fe-Co-Ni-and-Gd)
      (Curie-temperatures-vary)
      ((Fe-Co-Ni-and-Gd . iron-Curie-temperature-1043K)
       (iron-Curie-temperature-1043K . cobalt-Curie-temperature-1394K)
       (cobalt-Curie-temperature-1394K . nickel-Curie-temperature-631K)
       (nickel-Curie-temperature-631K . gadolinium-Curie-temperature-292K)
       (gadolinium-Curie-temperature-292K . above-Tc-becomes-paramagnetic)
       (above-Tc-becomes-paramagnetic . Curie-temperatures-vary)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PIEZOELECTRIC MATERIALS
    ;;; SOURCE: [Callister-2018] Ch. 18; [Kittel-2005] Ch. 13
    ;;; ═══════════════════════════════════════════════════════════

    (piezoelectricity
      (non-centrosymmetric-crystal-under-mechanical-stress)
      (generates-electric-voltage)
      ((non-centrosymmetric-crystal-under-mechanical-stress . stress-displaces-charge-centers)
       (stress-displaces-charge-centers . net-electric-polarization-created)
       (net-electric-polarization-created . voltage-appears-across-crystal)
       (voltage-appears-across-crystal . direct-piezoelectric-effect)
       (direct-piezoelectric-effect . generates-electric-voltage)))

    (converse-piezoelectric-effect
      (applied-electric-field-to-piezoelectric-crystal)
      (mechanical-deformation)
      ((applied-electric-field-to-piezoelectric-crystal . electric-field-displaces-ions)
       (electric-field-displaces-ions . crystal-changes-shape)
       (crystal-changes-shape . used-in-actuators-and-transducers)
       (used-in-actuators-and-transducers . mechanical-deformation)))

    ;;; SOURCE: [Callister-2018] Ch. 18
    (piezoelectric-quartz
      (SiO2-alpha-quartz)
      (frequency-standard-and-transducer)
      ((SiO2-alpha-quartz . trigonal-crystal-system)
       (trigonal-crystal-system . lacks-center-of-symmetry)
       (lacks-center-of-symmetry . strong-piezoelectric-response)
       (strong-piezoelectric-response . resonant-frequency-extremely-stable)
       (resonant-frequency-extremely-stable . quartz-oscillator-in-clocks-and-electronics)
       (quartz-oscillator-in-clocks-and-electronics . 32768-Hz-standard-watch-crystal)
       (32768-Hz-standard-watch-crystal . frequency-standard-and-transducer)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; METAMATERIALS
    ;;; SOURCE: [Veselago-1968]; [Pendry-2000];
    ;;;   Smith et al. Phys. Rev. Lett. 84, 4184 (2000)
    ;;; ═══════════════════════════════════════════════════════════

    (metamaterial-definition
      (artificially-structured-material)
      (electromagnetic-properties-not-found-in-nature)
      ((artificially-structured-material . sub-wavelength-unit-cells)
       (sub-wavelength-unit-cells . effective-medium-response)
       (effective-medium-response . engineered-permittivity-and-permeability)
       (engineered-permittivity-and-permeability . can-achieve-negative-epsilon-and-mu)
       (can-achieve-negative-epsilon-and-mu . electromagnetic-properties-not-found-in-nature)))

    ;;; SOURCE: [Veselago-1968]; [Pendry-2000]
    (negative-refractive-index
      (material-with-simultaneously-negative-epsilon-and-mu)
      (reversed-Snell-law-refraction)
      ((material-with-simultaneously-negative-epsilon-and-mu . predicted-by-Veselago-1968)
       (predicted-by-Veselago-1968 . phase-velocity-antiparallel-to-energy-flow)
       (phase-velocity-antiparallel-to-energy-flow . reversed-Doppler-effect)
       (reversed-Doppler-effect . reversed-Cherenkov-radiation)
       (reversed-Cherenkov-radiation . first-demonstrated-Smith-et-al-2000)
       (first-demonstrated-Smith-et-al-2000 . Pendry-superlens-proposal-2000)
       (Pendry-superlens-proposal-2000 . imaging-beyond-diffraction-limit-in-principle)
       (imaging-beyond-diffraction-limit-in-principle . reversed-Snell-law-refraction)))

    ;;; SOURCE: Schurig et al. Science 314, 977 (2006)
    (electromagnetic-cloaking
      (metamaterial-shell-with-graded-refractive-index)
      (guides-EM-waves-around-object)
      ((metamaterial-shell-with-graded-refractive-index . coordinate-transformation-optics)
       (coordinate-transformation-optics . bends-light-around-cloaked-region)
       (bends-light-around-cloaked-region . first-demonstrated-at-microwave-frequencies-2006)
       (first-demonstrated-at-microwave-frequencies-2006 . bandwidth-limited)
       (bandwidth-limited . guides-EM-waves-around-object)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GRAPHENE
    ;;; SOURCE: [Novoselov-2004]; Novoselov & Geim Nobel Prize 2010;
    ;;;   Castro Neto et al. Rev. Mod. Phys. 81, 109 (2009)
    ;;; ═══════════════════════════════════════════════════════════

    (graphene
      (single-layer-of-carbon-atoms)
      (two-dimensional-hexagonal-lattice)
      ((single-layer-of-carbon-atoms . sp2-hybridized-carbon)
       (sp2-hybridized-carbon . honeycomb-lattice-structure)
       (honeycomb-lattice-structure . bond-length-0.142-nm)
       (bond-length-0.142-nm . each-atom-bonded-to-3-neighbors)
       (each-atom-bonded-to-3-neighbors . one-pz-electron-per-atom-delocalized)
       (one-pz-electron-per-atom-delocalized . two-dimensional-hexagonal-lattice)))

    ;;; SOURCE: [Novoselov-2004]; Castro Neto et al. 2009
    (graphene-electronic-properties
      (linear-energy-momentum-dispersion-at-K-points)
      (zero-band-gap-semimetal)
      ((linear-energy-momentum-dispersion-at-K-points . Dirac-cone-band-structure)
       (Dirac-cone-band-structure . charge-carriers-behave-as-massless-Dirac-fermions)
       (charge-carriers-behave-as-massless-Dirac-fermions . electron-mobility-up-to-200000-cm2/Vs)
       (electron-mobility-up-to-200000-cm2/Vs . highest-known-room-temperature-mobility)
       (highest-known-room-temperature-mobility . ambipolar-field-effect)
       (ambipolar-field-effect . zero-band-gap-semimetal)))

    ;;; SOURCE: Lee et al. Science 321, 385 (2008); Balandin et al. Nano Lett. 8, 902 (2008)
    (graphene-mechanical-and-thermal
      (single-atomic-layer)
      (strongest-material-measured)
      ((single-atomic-layer . intrinsic-tensile-strength-130-GPa)
       (intrinsic-tensile-strength-130-GPa . Young-modulus-1-TPa)
       (Young-modulus-1-TPa . strongest-material-ever-measured)
       (strongest-material-ever-measured . thermal-conductivity-about-5000-W/mK)
       (thermal-conductivity-about-5000-W/mK . exceeds-diamond-and-CNT)
       (exceeds-diamond-and-CNT . strongest-material-measured)))

    ;;; SOURCE: [Novoselov-2004]; Geim & Novoselov, Nature Materials 6, 183 (2007)
    (graphene-isolation
      (mechanical-exfoliation-of-graphite)
      (first-isolated-2004-Manchester)
      ((mechanical-exfoliation-of-graphite . scotch-tape-method)
       (scotch-tape-method . Novoselov-and-Geim-2004)
       (Novoselov-and-Geim-2004 . Nobel-Prize-in-Physics-2010)
       (Nobel-Prize-in-Physics-2010 . first-isolated-2004-Manchester)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CARBON NANOTUBES
    ;;; SOURCE: Iijima, Nature 354, 56 (1991);
    ;;;   Saito et al. Physical Properties of Carbon Nanotubes, 1998
    ;;; ═══════════════════════════════════════════════════════════

    (carbon-nanotube-structure
      (graphene-sheet-rolled-into-cylinder)
      (chirality-determines-properties)
      ((graphene-sheet-rolled-into-cylinder . seamless-cylindrical-tube)
       (seamless-cylindrical-tube . diameter-typically-1-to-50-nm)
       (diameter-typically-1-to-50-nm . length-up-to-millimeters)
       (length-up-to-millimeters . chiral-vector-determines-roll-direction)
       (chiral-vector-determines-roll-direction . armchair-zigzag-or-chiral)
       (armchair-zigzag-or-chiral . chirality-determines-properties)))

    (single-walled-carbon-nanotube
      (one-graphene-cylinder)
      (metallic-or-semiconducting-depending-on-chirality)
      ((one-graphene-cylinder . SWCNT)
       (SWCNT . diameter-0.4-to-2-nm-typical)
       (diameter-0.4-to-2-nm-typical . armchair-tubes-are-metallic)
       (armchair-tubes-are-metallic . roughly-1/3-of-chiralities-metallic)
       (roughly-1/3-of-chiralities-metallic . remaining-2/3-semiconducting)
       (remaining-2/3-semiconducting . band-gap-inversely-proportional-to-diameter)
       (band-gap-inversely-proportional-to-diameter . metallic-or-semiconducting-depending-on-chirality)))

    (multi-walled-carbon-nanotube
      (concentric-graphene-cylinders)
      (typically-metallic)
      ((concentric-graphene-cylinders . MWCNT)
       (MWCNT . first-observed-by-Iijima-1991)
       (first-observed-by-Iijima-1991 . 2-to-50-concentric-shells)
       (2-to-50-concentric-shells . interlayer-spacing-about-0.34-nm)
       (interlayer-spacing-about-0.34-nm . similar-to-graphite-interlayer)
       (similar-to-graphite-interlayer . typically-metallic)))

    (carbon-nanotube-properties
      (CNT-mechanical-and-electrical)
      (extreme-strength-and-conductivity)
      ((CNT-mechanical-and-electrical . tensile-strength-up-to-63-GPa)
       (tensile-strength-up-to-63-GPa . Young-modulus-about-1-TPa)
       (Young-modulus-about-1-TPa . current-density-up-to-4e9-A/cm2)
       (current-density-up-to-4e9-A/cm2 . 1000x-greater-than-copper)
       (1000x-greater-than-copper . thermal-conductivity-3500-W/mK)
       (thermal-conductivity-3500-W/mK . extreme-strength-and-conductivity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TOPOLOGICAL INSULATORS
    ;;; SOURCE: [Hasan-2010] Hasan & Kane, Rev. Mod. Phys. 82, 3045;
    ;;;   Fu, Kane, Mele Phys. Rev. Lett. 98, 106803 (2007);
    ;;;   König et al. Science 318, 766 (2007)
    ;;; ═══════════════════════════════════════════════════════════

    (topological-insulator-definition
      (material-with-insulating-bulk-and-conducting-surface)
      (topologically-protected-surface-states)
      ((material-with-insulating-bulk-and-conducting-surface . bulk-band-gap-present)
       (bulk-band-gap-present . gapless-surface-or-edge-states)
       (gapless-surface-or-edge-states . protected-by-time-reversal-symmetry)
       (protected-by-time-reversal-symmetry . robust-against-nonmagnetic-impurities)
       (robust-against-nonmagnetic-impurities . surface-states-are-Dirac-fermions)
       (surface-states-are-Dirac-fermions . spin-locked-to-momentum-direction)
       (spin-locked-to-momentum-direction . backscattering-suppressed)
       (backscattering-suppressed . topologically-protected-surface-states)))

    ;;; SOURCE: [Hasan-2010]; König et al. Science 318, 766 (2007)
    (topological-insulator-examples
      (experimentally-confirmed-TI-materials)
      (Bi2Se3-Bi2Te3-HgTe-quantum-wells)
      ((experimentally-confirmed-TI-materials . Bi2Se3-bulk-gap-0.3-eV)
       (Bi2Se3-bulk-gap-0.3-eV . Bi2Te3-bulk-gap-0.17-eV)
       (Bi2Te3-bulk-gap-0.17-eV . single-Dirac-cone-on-surface)
       (single-Dirac-cone-on-surface . HgTe-CdTe-quantum-well-2D-TI)
       (HgTe-CdTe-quantum-well-2D-TI . first-2D-TI-observed-Konig-2007)
       (first-2D-TI-observed-Konig-2007 . quantized-edge-conductance)
       (quantized-edge-conductance . Bi2Se3-Bi2Te3-HgTe-quantum-wells)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SHAPE MEMORY ALLOYS
    ;;; SOURCE: [Callister-2018] Ch. 10;
    ;;;   Buehler et al. J. Appl. Phys. 34, 1475 (1963) (nitinol discovery);
    ;;;   Otsuka & Wayman, Shape Memory Materials, Cambridge 1998
    ;;; ═══════════════════════════════════════════════════════════

    (shape-memory-effect
      (thermoelastic-martensitic-transformation)
      (recovers-original-shape-upon-heating)
      ((thermoelastic-martensitic-transformation . low-temperature-martensite-phase)
       (low-temperature-martensite-phase . deformable-by-twinning-and-detwinning)
       (deformable-by-twinning-and-detwinning . heating-above-austenite-finish-temperature)
       (heating-above-austenite-finish-temperature . transforms-back-to-austenite)
       (transforms-back-to-austenite . original-shape-recovered)
       (original-shape-recovered . recoverable-strains-up-to-8-percent)
       (recoverable-strains-up-to-8-percent . recovers-original-shape-upon-heating)))

    ;;; SOURCE: Buehler et al. 1963; [Callister-2018] Ch. 10
    (nitinol
      (NiTi-approximately-55-percent-Ni-45-percent-Ti-by-weight)
      (most-widely-used-shape-memory-alloy)
      ((NiTi-approximately-55-percent-Ni-45-percent-Ti-by-weight . discovered-at-Naval-Ordnance-Lab-1963)
       (discovered-at-Naval-Ordnance-Lab-1963 . NiTi-Nickel-Titanium-Naval-Ordnance-Lab)
       (NiTi-Nickel-Titanium-Naval-Ordnance-Lab . transformation-temperature-tunable-minus-50C-to-110C)
       (transformation-temperature-tunable-minus-50C-to-110C . biocompatible)
       (biocompatible . used-in-stents-orthodontic-wires-actuators)
       (used-in-stents-orthodontic-wires-actuators . superelastic-above-austenite-finish)
       (superelastic-above-austenite-finish . most-widely-used-shape-memory-alloy)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHASE CHANGE MATERIALS
    ;;; SOURCE: [Callister-2018] Ch. 9-10;
    ;;;   Wuttig & Yamada, Nature Materials 6, 824 (2007)
    ;;; ═══════════════════════════════════════════════════════════

    (phase-change-material-definition
      (material-that-stores-releases-energy-at-phase-transition)
      (latent-heat-absorption-and-release)
      ((material-that-stores-releases-energy-at-phase-transition . solid-to-liquid-or-liquid-to-solid)
       (solid-to-liquid-or-liquid-to-solid . absorbs-latent-heat-on-melting)
       (absorbs-latent-heat-on-melting . releases-latent-heat-on-solidification)
       (releases-latent-heat-on-solidification . isothermal-during-transition)
       (isothermal-during-transition . thermal-energy-storage-applications)
       (thermal-energy-storage-applications . latent-heat-absorption-and-release)))

    ;;; SOURCE: Wuttig & Yamada, Nature Materials 6, 824 (2007)
    (chalcogenide-phase-change
      (GeSbTe-and-related-alloys)
      (rapid-reversible-amorphous-crystalline-switching)
      ((GeSbTe-and-related-alloys . Ge2Sb2Te5-most-studied)
       (Ge2Sb2Te5-most-studied . amorphous-phase-high-resistivity)
       (amorphous-phase-high-resistivity . crystalline-phase-low-resistivity)
       (crystalline-phase-low-resistivity . large-optical-contrast-between-phases)
       (large-optical-contrast-between-phases . switching-time-nanoseconds)
       (switching-time-nanoseconds . used-in-rewritable-optical-discs-CD-RW-DVD-RW)
       (used-in-rewritable-optical-discs-CD-RW-DVD-RW . phase-change-random-access-memory-PCRAM)
       (phase-change-random-access-memory-PCRAM . rapid-reversible-amorphous-crystalline-switching)))

    ;;; SOURCE: [Callister-2018] Ch. 9; standard thermodynamics
    (thermal-phase-change-materials
      (paraffin-waxes-salt-hydrates-fatty-acids)
      (thermal-regulation-applications)
      ((paraffin-waxes-salt-hydrates-fatty-acids . paraffin-melting-range-20C-to-70C)
       (paraffin-melting-range-20C-to-70C . latent-heat-150-to-250-kJ/kg)
       (latent-heat-150-to-250-kJ/kg . salt-hydrates-higher-volumetric-storage)
       (salt-hydrates-higher-volumetric-storage . building-thermal-management)
       (building-thermal-management . thermal-regulation-applications)))

  )

  ((Callister-2018 . materials-science-registered)))
