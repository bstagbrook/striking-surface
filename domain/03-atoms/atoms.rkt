#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: atoms
;;; LAYER: 03-atoms
;;; GENERATED: register-domain.sh (closed-loop)
;;; SOURCE: NIST-CODATA-2022
;;; CALIBRATION: atoms.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-atoms

  ((NIST-CODATA-2022 (NIST-CODATA-2022) (authoritative) ((NIST-CODATA-2022 . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════

    ;;; BIOLOGICALLY RELEVANT ELEMENTS

    ;;; Atomic masses in Da (unified atomic mass units)

    ;;; SOURCE: NIST Standard Atomic Weights 2021

    ;;; ═══════════════════════════════════════════════


    ;;; The 6 elements of life: C H O N S P (99% of body mass)

    (hydrogen
      (Z-1)
      ((mass-1.008-Da . electronegativity-2.20))
      ((Z-1 . 1s1)
       (1s1 . one-electron)
       (one-electron . mass-1.008-Da)
       (mass-1.008-Da . electronegativity-2.20)
       (electronegativity-2.20 . forms-1-bond)
       (forms-1-bond . covalent-bond)
       ;;; BRIDGE: 02-nucleons → 03-atoms
       ;;; Hydrogen nucleus = single proton; Z defines proton count
       ;;; SOURCE: standard — atomic number = proton number
       (covalent-bond . charge-plus-1)
       (charge-plus-1 . single-proton-nucleus)
       (single-proton-nucleus . spin-1/2)
       (spin-1/2 . proton-nuclear-spin)))

    (carbon
      (Z-6)
      ((mass-12.011-Da . electronegativity-2.55))
      ((Z-6 . 1s2-2s2-2p2)
       (1s2-2s2-2p2 . four-valence-electrons)
       (four-valence-electrons . mass-12.011-Da)
       (mass-12.011-Da . electronegativity-2.55)
       (electronegativity-2.55 . forms-4-bonds)
       (forms-4-bonds . basis-of-organic-chemistry)
       (basis-of-organic-chemistry . shared-electron-pair)
       ;;; BRIDGE: 02-nucleons → 03-atoms
       ;;; Carbon-12 has 12 nucleons (6p + 6n); defines the dalton
       ;;; SOURCE: IUPAC — 1 Da = 1/12 mass of carbon-12
       (shared-electron-pair . baryon-number-1)
       (baryon-number-1 . per-nucleon-defines-dalton)))

    (nitrogen
      (Z-7)
      ((mass-14.007-Da . electronegativity-3.04))
      ((Z-7 . 1s2-2s2-2p3)
       (1s2-2s2-2p3 . five-valence-electrons)
       (five-valence-electrons . mass-14.007-Da)
       (mass-14.007-Da . electronegativity-3.04)
       (electronegativity-3.04 . forms-3-bonds)
       (forms-3-bonds . peptide-bond)))

    (oxygen
      (Z-8)
      ((mass-15.999-Da . electronegativity-3.44))
      ((Z-8 . 1s2-2s2-2p4)
       (1s2-2s2-2p4 . six-valence-electrons)
       (six-valence-electrons . mass-15.999-Da)
       (mass-15.999-Da . electronegativity-3.44)
       (electronegativity-3.44 . forms-2-bonds)
       (forms-2-bonds . highly-electronegative)
       (highly-electronegative . hydrogen-bond)))

    (phosphorus
      (Z-15)
      ((mass-30.974-Da . electronegativity-2.19))
      ((Z-15 . 1s2-2s2-2p6-3s2-3p3)
       (1s2-2s2-2p6-3s2-3p3 . five-valence-electrons)
       (five-valence-electrons . mass-30.974-Da)
       (mass-30.974-Da . electronegativity-2.19)
       (electronegativity-2.19 . forms-5-bonds)
       (forms-5-bonds . in-DNA-backbone-and-ATP)
       (in-DNA-backbone-and-ATP . covalent-bond)))

    (sulfur
      (Z-16)
      ((mass-32.06-Da . electronegativity-2.58))
      ((Z-16 . 1s2-2s2-2p6-3s2-3p4)
       (1s2-2s2-2p6-3s2-3p4 . six-valence-electrons)
       (six-valence-electrons . mass-32.06-Da)
       (mass-32.06-Da . electronegativity-2.58)
       (electronegativity-2.58 . forms-2-bonds)
       (forms-2-bonds . in-cysteine-and-methionine)
       (in-cysteine-and-methionine . disulfide-bond-S-S)))


    ;;; Essential ions and trace elements

    (sodium
      (Z-11)
      ((mass-22.990-Da . electronegativity-0.93))
      ((Z-11 . 1s2-2s2-2p6-3s1)
       (1s2-2s2-2p6-3s1 . one-valence-electron)
       (one-valence-electron . mass-22.990-Da)
       (mass-22.990-Da . electronegativity-0.93)
       (electronegativity-0.93 . Na-plus-ion)
       (Na-plus-ion . nerve-signaling)))

    (potassium
      (Z-19)
      ((mass-39.098-Da . electronegativity-0.82))
      ((Z-19 . 4s1-outer)
       (4s1-outer . one-valence-electron)
       (one-valence-electron . mass-39.098-Da)
       (mass-39.098-Da . electronegativity-0.82)
       (electronegativity-0.82 . K-plus-ion)
       (K-plus-ion . membrane-potential)))

    (calcium
      (Z-20)
      ((mass-40.078-Da . electronegativity-1.00))
      ((Z-20 . 4s2-outer)
       (4s2-outer . two-valence-electrons)
       (two-valence-electrons . mass-40.078-Da)
       (mass-40.078-Da . electronegativity-1.00)
       (electronegativity-1.00 . Ca-2plus-ion)
       (Ca-2plus-ion . bone-and-signaling)))

    (iron
      (Z-26)
      ((mass-55.845-Da . electronegativity-1.83))
      ((Z-26 . 3d6-4s2)
       (3d6-4s2 . transition-metal)
       (transition-metal . mass-55.845-Da)
       (mass-55.845-Da . electronegativity-1.83)
       (electronegativity-1.83 . Fe-2plus-and-3plus)
       (Fe-2plus-and-3plus . hemoglobin-oxygen-transport)))

    (zinc
      (Z-30)
      ((mass-65.38-Da . electronegativity-1.65))
      ((Z-30 . 3d10-4s2)
       (3d10-4s2 . transition-metal)
       (transition-metal . mass-65.38-Da)
       (mass-65.38-Da . electronegativity-1.65)
       (electronegativity-1.65 . Zn-2plus-ion)
       (Zn-2plus-ion . enzyme-cofactor-and-zinc-fingers)))


    ;;; Water — the solvent of life

    (water-molecule
      (H2O)
      ((mass-18.015-Da . polar-solvent))
      ((H2O . two-hydrogen-one-oxygen)
       (two-hydrogen-one-oxygen . mass-18.015-Da)
       (mass-18.015-Da . bond-angle-104.5-degrees)
       (bond-angle-104.5-degrees . polar-solvent)
       (polar-solvent . universal-biological-solvent)
       (universal-biological-solvent . hydrogen-bond)))


    ;;; Peptide bond water loss — the key to residue mass calculation

    (peptide-bond-water-loss
      (condensation-reaction)
      (mass-loss-18.015-Da)
      ((condensation-reaction . amino-acid-plus-amino-acid)
       (amino-acid-plus-amino-acid . peptide-bond-formed)
       (peptide-bond-formed . one-water-released)
       (one-water-released . mass-loss-18.015-Da)
       (mass-loss-18.015-Da . minus-water-18.015-Da)))

  )

  ((NIST-CODATA-2022 . atoms-registered)))
