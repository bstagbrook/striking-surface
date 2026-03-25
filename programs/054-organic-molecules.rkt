#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ORGANIC MOLECULES — FUNCTIONAL GROUPS & MACROMOLECULES
;;;
;;; Carbon (sp3/sp2/sp) forms the backbone. Functional groups
;;; determine reactivity. Four classes of biological macromolecules.
;;;
;;; SOURCE: standard organic chemistry, Lehninger
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-organic-molecules

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: organic chemistry domain
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CARBON HYBRIDIZATION
    ;;; SOURCE: standard organic chemistry
    ;;; ═══════════════════════════════════════════════════════════

    (sp3-carbon
      (4-sigma-bonds)
      (tetrahedral-109.5-degrees)
      ((4-sigma-bonds . single-bonds-only)
       (single-bonds-only . tetrahedral-109.5-degrees)))

    (sp2-carbon
      (3-sigma-1-pi)
      (trigonal-planar-120-degrees)
      ((3-sigma-1-pi . one-double-bond)
       (one-double-bond . trigonal-planar-120-degrees)))

    (sp-carbon
      (2-sigma-2-pi)
      (linear-180-degrees)
      ((2-sigma-2-pi . triple-bond-or-two-double-bonds)
       (triple-bond-or-two-double-bonds . linear-180-degrees)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNCTIONAL GROUPS — biologically relevant
    ;;; SOURCE: standard organic/biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    (hydroxyl (R-OH) (polar-H-bond-donor-acceptor) ((R-OH . alcohols-sugars) (alcohols-sugars . polar-H-bond-donor-acceptor)))
    (carboxyl (R-COOH) (acidic-loses-H-plus) ((R-COOH . carboxylic-acids-amino-acids) (carboxylic-acids-amino-acids . pKa-about-2-to-5) (pKa-about-2-to-5 . acidic-loses-H-plus)))
    (amino (R-NH2) (basic-accepts-H-plus) ((R-NH2 . amines-amino-acids) (amines-amino-acids . pKa-about-9-to-11) (pKa-about-9-to-11 . basic-accepts-H-plus)))
    (carbonyl (R-CO-R) (polar-electrophilic-carbon) ((R-CO-R . ketones-aldehydes) (ketones-aldehydes . polar-electrophilic-carbon)))
    (phosphoryl (R-OPO3) (energy-carrier-linkage) ((R-OPO3 . ATP-DNA-backbone) (ATP-DNA-backbone . energy-carrier-linkage)))
    (sulfhydryl (R-SH) (can-form-disulfide-bonds) ((R-SH . cysteine-side-chain) (cysteine-side-chain . can-form-disulfide-bonds)))
    (amide (R-CO-NH-R) (peptide-bond-linkage) ((R-CO-NH-R . partial-double-bond-character) (partial-double-bond-character . planar-rigid) (planar-rigid . peptide-bond-linkage)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FOUR CLASSES OF BIOLOGICAL MACROMOLECULES
    ;;; SOURCE: standard biochemistry, Lehninger
    ;;; ═══════════════════════════════════════════════════════════

    ;;; 1. Carbohydrates: (CH2O)n
    (carbohydrates
      (monosaccharide-monomers)
      (energy-storage-and-structural)
      ((monosaccharide-monomers . glucose-C6H12O6)
       (glucose-C6H12O6 . glycosidic-bond-links-monomers)
       (glycosidic-bond-links-monomers . polysaccharides)
       (polysaccharides . glycogen-starch-cellulose)
       (glycogen-starch-cellulose . energy-storage-and-structural)))

    ;;; 2. Lipids: hydrophobic, not true polymers
    (lipids
      (fatty-acids-plus-glycerol)
      (membranes-energy-signaling)
      ((fatty-acids-plus-glycerol . ester-bond-links)
       (ester-bond-links . triglycerides-for-storage)
       (fatty-acids-plus-glycerol . phospholipids)
       (phospholipids . amphipathic-head-tail)
       (amphipathic-head-tail . bilayer-membranes)
       (bilayer-membranes . membranes-energy-signaling)))

    ;;; Saturated vs unsaturated fatty acids
    (saturated-fatty-acid
      (no-double-bonds)
      (straight-chain-solid-at-RT)
      ((no-double-bonds . all-sp3)
       (all-sp3 . straight-chain-packs-tightly)
       (straight-chain-packs-tightly . straight-chain-solid-at-RT)))

    (unsaturated-fatty-acid
      (one-or-more-double-bonds)
      (kinked-chain-liquid-at-RT)
      ((one-or-more-double-bonds . cis-kink-at-double-bond)
       (cis-kink-at-double-bond . disrupts-packing)
       (disrupts-packing . kinked-chain-liquid-at-RT)))

    ;;; 3. Nucleic acids: DNA and RNA
    (nucleic-acids
      (nucleotide-monomers)
      (information-storage-and-expression)
      ((nucleotide-monomers . sugar-phosphate-base)
       (sugar-phosphate-base . phosphodiester-bond-links-backbone)
       (phosphodiester-bond-links-backbone . polynucleotide-chain)
       (polynucleotide-chain . information-storage-and-expression)))

    ;;; Nucleotide components
    (nucleotide-structure
      (pentose-sugar . nitrogenous-base . phosphate-group)
      (monomer-of-nucleic-acid)
      ((pentose-sugar . ribose-in-RNA-deoxyribose-in-DNA)
       (nitrogenous-base . purine-A-G-or-pyrimidine-C-T-U)
       (phosphate-group . links-3-prime-to-5-prime)))

    ;;; 4. Proteins: amino acid polymers (detailed in 055)
    (proteins-overview
      (amino-acid-monomers)
      (catalysis-structure-signaling-transport-defense)
      ((amino-acid-monomers . peptide-bond-links)
       (peptide-bond-links . polypeptide-chain)
       (polypeptide-chain . folds-to-3D-structure)
       (folds-to-3D-structure . catalysis-structure-signaling-transport-defense)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHIRALITY — handedness in biology
    ;;; SOURCE: standard biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    (chirality
      (4-different-substituents-on-carbon)
      (L-and-D-enantiomers)
      ((4-different-substituents-on-carbon . chiral-center)
       (chiral-center . mirror-image-non-superimposable)
       (mirror-image-non-superimposable . L-and-D-enantiomers)))

    (biological-homochirality
      (L-amino-acids-D-sugars)
      (all-life-uses-same-handedness)
      ((L-amino-acids-D-sugars . enzymes-are-stereospecific)
       (enzymes-are-stereospecific . wrong-enantiomer-does-not-fit)
       (wrong-enantiomer-does-not-fit . all-life-uses-same-handedness)))

  )

  ;;; Vacuum tube
  ((tesla . organic-molecules-registered)))
