#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CHEMICAL BONDS & WATER
;;;
;;; Atoms (015, 052) combine via electron sharing/transfer.
;;; Bond type determines molecular shape, strength, and behavior.
;;; Water's properties emerge from hydrogen bonding.
;;;
;;; SOURCE: standard chemistry, Pauling 1960
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-chemical-bonds

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: chemical bond domain
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BOND TYPES
    ;;; SOURCE: standard chemistry
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Covalent bond: electrons shared between atoms
    (covalent-bond
      (shared-electron-pair)
      (directional-strong)
      ((shared-electron-pair . both-atoms-fill-valence)
       (both-atoms-fill-valence . bond-energy-150-to-950-kJ-mol)
       (bond-energy-150-to-950-kJ-mol . directional-strong)))

    ;;; Polar covalent: unequal sharing due to electronegativity
    (polar-covalent
      (unequal-electron-sharing)
      (partial-charges-delta-plus-delta-minus)
      ((unequal-electron-sharing . electronegativity-difference-0.4-to-1.7)
       (electronegativity-difference-0.4-to-1.7 . electron-density-toward-more-EN)
       (electron-density-toward-more-EN . partial-charges-delta-plus-delta-minus)))

    ;;; Ionic bond: electron transfer, not sharing
    (ionic-bond
      (electron-transfer)
      (non-directional-electrostatic)
      ((electron-transfer . electronegativity-difference-greater-than-1.7)
       (electronegativity-difference-greater-than-1.7 . cation-plus-anion)
       (cation-plus-anion . lattice-structure)
       (lattice-structure . non-directional-electrostatic)))

    ;;; Hydrogen bond: H bonded to N/O/F attracted to lone pair
    ;;; Critical for water, DNA, protein folding
    (hydrogen-bond
      (H-bonded-to-electronegative-atom)
      (weak-directional-5-to-30-kJ-mol)
      ((H-bonded-to-electronegative-atom . partial-positive-on-H)
       (partial-positive-on-H . attracted-to-lone-pair-on-N-O-F)
       (attracted-to-lone-pair-on-N-O-F . weak-directional-5-to-30-kJ-mol)))

    ;;; Van der Waals (London dispersion): temporary dipole
    (van-der-Waals
      (temporary-induced-dipole)
      (weakest-0.4-to-4-kJ-mol)
      ((temporary-induced-dipole . electron-cloud-fluctuation)
       (electron-cloud-fluctuation . induces-dipole-in-neighbor)
       (induces-dipole-in-neighbor . weakest-0.4-to-4-kJ-mol)))

    ;;; Disulfide bond: covalent S-S between cysteines
    ;;; Critical for protein structure
    (disulfide-bond
      (cysteine-SH-plus-cysteine-SH)
      (covalent-S-S-stabilizes-protein)
      ((cysteine-SH-plus-cysteine-SH . oxidation-removes-2H)
       (oxidation-removes-2H . S-S-bond-formed)
       (S-S-bond-formed . bond-energy-251-kJ-mol)
       (bond-energy-251-kJ-mol . covalent-S-S-stabilizes-protein)))

    ;;; Hydrophobic interaction: nonpolar groups cluster in water
    ;;; Not a bond per se — entropy-driven
    (hydrophobic-effect
      (nonpolar-groups-in-water)
      (cluster-to-minimize-surface)
      ((nonpolar-groups-in-water . water-forms-ordered-cage)
       (water-forms-ordered-cage . entropy-decrease-unfavorable)
       (entropy-decrease-unfavorable . nonpolar-groups-aggregate)
       (nonpolar-groups-aggregate . cluster-to-minimize-surface)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTRONEGATIVITY — Pauling scale
    ;;; Biologically relevant atoms
    ;;; SOURCE: Pauling 1960, standard reference
    ;;; ═══════════════════════════════════════════════════════════

    (EN-fluorine (F) (3.98) ((F . most-electronegative-element) (most-electronegative-element . 3.98)))
    (EN-oxygen (O) (3.44) ((O . 3.44)))
    (EN-nitrogen (N) (3.04) ((N . 3.04)))
    (EN-sulfur (S) (2.58) ((S . 2.58)))
    (EN-carbon (C) (2.55) ((C . 2.55)))
    (EN-phosphorus (P) (2.19) ((P . 2.19)))
    (EN-hydrogen (H) (2.20) ((H . 2.20)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WATER — properties from hydrogen bonding
    ;;; SOURCE: standard chemistry/biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    (water-structure
      (H2O)
      (bent-104.5-degrees)
      ((H2O . 2-polar-O-H-bonds)
       (2-polar-O-H-bonds . 2-lone-pairs-on-oxygen)
       (2-lone-pairs-on-oxygen . tetrahedral-electron-geometry)
       (tetrahedral-electron-geometry . bent-104.5-degrees)))

    (water-hydrogen-bonding
      (each-water-up-to-4-H-bonds)
      (extensive-H-bond-network)
      ((each-water-up-to-4-H-bonds . 2-as-donor-2-as-acceptor)
       (2-as-donor-2-as-acceptor . extensive-H-bond-network)))

    (water-properties
      (H-bond-network)
      (high-specific-heat-high-boiling-point-universal-solvent)
      ((H-bond-network . high-specific-heat-4.18-J-g-K)
       (high-specific-heat-4.18-J-g-K . thermal-buffer-for-organisms)
       (H-bond-network . high-boiling-point-100C)
       (high-boiling-point-100C . liquid-at-biological-temperatures)
       (H-bond-network . excellent-solvent-for-polar-molecules)
       (excellent-solvent-for-polar-molecules . high-specific-heat-high-boiling-point-universal-solvent)))

    (water-ionization
      (H2O-autoionization)
      (Kw-equals-1e-14-at-25C)
      ((H2O-autoionization . H-plus-and-OH-minus)
       (H-plus-and-OH-minus . concentration-product-1e-14)
       (concentration-product-1e-14 . pH-equals-negative-log-H-plus)
       (pH-equals-negative-log-H-plus . Kw-equals-1e-14-at-25C)))

    ;;; pH of biological relevance
    (biological-pH
      (blood-pH-7.35-to-7.45)
      (tightly-regulated)
      ((blood-pH-7.35-to-7.45 . bicarbonate-buffer-system)
       (bicarbonate-buffer-system . tightly-regulated)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BOND HIERARCHY — strength ordering
    ;;; SOURCE: standard chemistry
    ;;; ═══════════════════════════════════════════════════════════

    (bond-strength-hierarchy
      (covalent-strongest)
      (van-der-Waals-weakest)
      ((covalent-strongest . 150-to-950-kJ-mol)
       (150-to-950-kJ-mol . ionic-next)
       (ionic-next . 400-to-4000-kJ-mol-lattice)
       (400-to-4000-kJ-mol-lattice . hydrogen-bond-next)
       (hydrogen-bond-next . 5-to-30-kJ-mol)
       (5-to-30-kJ-mol . van-der-Waals-weakest)
       (van-der-Waals-weakest . 0.4-to-4-kJ-mol)))

  )

  ;;; Vacuum tube
  ((tesla . chemical-bonds-registered)))
