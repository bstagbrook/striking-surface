#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: amino-acids
;;; LAYER: 05-amino-acids
;;; GENERATED: register-domain.sh (closed-loop)
;;; SOURCE: Lehninger-8th-edition
;;; CALIBRATION: amino-acids.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-amino-acids

  ((Lehninger-8th-edition (Lehninger-8th-edition) (authoritative) ((Lehninger-8th-edition . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════

    ;;; THE 20 STANDARD AMINO ACIDS

    ;;; Residue molecular weight = free AA weight - 18.015 (water)

    ;;; All weights derivable from atomic masses in 03-atoms

    ;;; Side chain classification at pH 7.0

    ;;; SOURCE: Lehninger Principles of Biochemistry, 8th ed.

    ;;;         NIST amino acid reference data

    ;;; ═══════════════════════════════════════════════════════════


    ;;; NONPOLAR (hydrophobic) — core of folded proteins

    (glycine
      (Gly-G)
      ((residue-mass-57.021-Da . nonpolar))
      ((Gly-G . C2H3NO)
       (C2H3NO . free-mass-75.032-Da)
       (free-mass-75.032-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-57.021-Da)
       (residue-mass-57.021-Da . side-chain-H)
       (side-chain-H . achiral)
       (achiral . nonpolar)
       (nonpolar . hydrophobic-core-packing)
       (hydrophobic-core-packing . glycine-or-proline-favored)))

    (alanine
      (Ala-A)
      ((residue-mass-71.037-Da . nonpolar))
      ((Ala-A . C3H5NO)
       (C3H5NO . free-mass-89.094-Da)
       (free-mass-89.094-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-71.037-Da)
       (residue-mass-71.037-Da . side-chain-CH3)
       (side-chain-CH3 . nonpolar)))

    (valine
      (Val-V)
      ((residue-mass-99.068-Da . nonpolar))
      ((Val-V . C5H9NO)
       (C5H9NO . free-mass-117.148-Da)
       (free-mass-117.148-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-99.068-Da)
       (residue-mass-99.068-Da . side-chain-isopropyl)
       (side-chain-isopropyl . branched-chain)
       (branched-chain . nonpolar)
       (nonpolar . nonpolar-residues-bury)))

    (leucine
      (Leu-L)
      ((residue-mass-113.084-Da . nonpolar))
      ((Leu-L . C6H11NO)
       (C6H11NO . free-mass-131.175-Da)
       (free-mass-131.175-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-113.084-Da)
       (residue-mass-113.084-Da . side-chain-isobutyl)
       (side-chain-isobutyl . branched-chain)
       (branched-chain . nonpolar)
       (nonpolar . compact-hydrophobic-core)))

    (isoleucine
      (Ile-I)
      ((residue-mass-113.084-Da . nonpolar))
      ((Ile-I . C6H11NO)
       (C6H11NO . free-mass-131.175-Da)
       (free-mass-131.175-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-113.084-Da)
       (residue-mass-113.084-Da . side-chain-sec-butyl)
       (side-chain-sec-butyl . branched-chain)
       (branched-chain . nonpolar)))

    (proline
      (Pro-P)
      ((residue-mass-97.052-Da . nonpolar))
      ((Pro-P . C5H7NO)
       (C5H7NO . free-mass-115.132-Da)
       (free-mass-115.132-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-97.052-Da)
       (residue-mass-97.052-Da . cyclic-side-chain)
       (cyclic-side-chain . constrains-backbone)
       (constrains-backbone . nonpolar)
       (nonpolar . glycine-or-proline-favored)))

    (phenylalanine
      (Phe-F)
      ((residue-mass-147.068-Da . nonpolar))
      ((Phe-F . C9H9NO)
       (C9H9NO . free-mass-165.192-Da)
       (free-mass-165.192-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-147.068-Da)
       (residue-mass-147.068-Da . side-chain-benzyl)
       (side-chain-benzyl . aromatic)
       (aromatic . nonpolar)
       (nonpolar . drives-folding)))

    (tryptophan
      (Trp-W)
      ((residue-mass-186.079-Da . nonpolar))
      ((Trp-W . C11H10N2O)
       (C11H10N2O . free-mass-204.229-Da)
       (free-mass-204.229-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-186.079-Da)
       (residue-mass-186.079-Da . side-chain-indole)
       (side-chain-indole . aromatic)
       (aromatic . nonpolar)))

    (methionine
      (Met-M)
      ((residue-mass-131.040-Da . nonpolar))
      ((Met-M . C5H9NOS)
       (C5H9NOS . free-mass-149.208-Da)
       (free-mass-149.208-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-131.040-Da)
       (residue-mass-131.040-Da . side-chain-thioether)
       (side-chain-thioether . contains-sulfur)
       (contains-sulfur . nonpolar)))


    ;;; POLAR UNCHARGED — surface of proteins, hydrogen bonding

    (serine
      (Ser-S)
      ((residue-mass-87.032-Da . polar-uncharged))
      ((Ser-S . C3H5NO2)
       (C3H5NO2 . free-mass-105.093-Da)
       (free-mass-105.093-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-87.032-Da)
       (residue-mass-87.032-Da . side-chain-hydroxymethyl)
       (side-chain-hydroxymethyl . hydrogen-bond-donor)
       (hydrogen-bond-donor . polar-uncharged)
       (polar-uncharged . hydrogen-bond)))

    (threonine
      (Thr-T)
      ((residue-mass-101.048-Da . polar-uncharged))
      ((Thr-T . C4H7NO2)
       (C4H7NO2 . free-mass-119.119-Da)
       (free-mass-119.119-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-101.048-Da)
       (residue-mass-101.048-Da . side-chain-hydroxyethyl)
       (side-chain-hydroxyethyl . hydrogen-bond-donor)
       (hydrogen-bond-donor . polar-uncharged)))

    (cysteine
      (Cys-C)
      ((residue-mass-103.009-Da . polar-uncharged))
      ((Cys-C . C3H5NOS)
       (C3H5NOS . free-mass-121.159-Da)
       (free-mass-121.159-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-103.009-Da)
       (residue-mass-103.009-Da . side-chain-sulfhydryl)
       (side-chain-sulfhydryl . can-form-disulfide-bond)
       (can-form-disulfide-bond . polar-uncharged)
       (polar-uncharged . disulfide-bond-S-S)))

    (tyrosine
      (Tyr-Y)
      ((residue-mass-163.063-Da . polar-uncharged))
      ((Tyr-Y . C9H9NO2)
       (C9H9NO2 . free-mass-181.191-Da)
       (free-mass-181.191-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-163.063-Da)
       (residue-mass-163.063-Da . side-chain-hydroxyphenyl)
       (side-chain-hydroxyphenyl . aromatic-plus-OH)
       (aromatic-plus-OH . polar-uncharged)
       (polar-uncharged . hydroxyl-group)))

    (asparagine
      (Asn-N)
      ((residue-mass-114.043-Da . polar-uncharged))
      ((Asn-N . C4H6N2O2)
       (C4H6N2O2 . free-mass-132.119-Da)
       (free-mass-132.119-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-114.043-Da)
       (residue-mass-114.043-Da . side-chain-amide)
       (side-chain-amide . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond-donor-and-acceptor . polar-uncharged)
       (polar-uncharged . stabilizes-secondary-structure)))

    (glutamine
      (Gln-Q)
      ((residue-mass-128.058-Da . polar-uncharged))
      ((Gln-Q . C5H8N2O2)
       (C5H8N2O2 . free-mass-146.146-Da)
       (free-mass-146.146-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-128.058-Da)
       (residue-mass-128.058-Da . side-chain-amide)
       (side-chain-amide . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond-donor-and-acceptor . polar-uncharged)))


    ;;; POSITIVELY CHARGED at pH 7 — surface, DNA binding

    (lysine
      (Lys-K)
      ((residue-mass-128.095-Da . positive-at-pH7))
      ((Lys-K . C6H12N2O)
       (C6H12N2O . free-mass-146.188-Da)
       (free-mass-146.188-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-128.095-Da)
       (residue-mass-128.095-Da . side-chain-aminobutyl)
       (side-chain-aminobutyl . pKa-10.5)
       (pKa-10.5 . positive-at-pH7)
       (positive-at-pH7 . salt-bridges-in-proteins)
       (salt-bridges-in-proteins . amino-group)))

    (arginine
      (Arg-R)
      ((residue-mass-156.101-Da . positive-at-pH7))
      ((Arg-R . C6H12N4O)
       (C6H12N4O . free-mass-174.203-Da)
       (free-mass-174.203-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-156.101-Da)
       (residue-mass-156.101-Da . side-chain-guanidinium)
       (side-chain-guanidinium . pKa-12.5)
       (pKa-12.5 . positive-at-pH7)))

    (histidine
      (His-H)
      ((residue-mass-137.059-Da . partial-positive-at-pH7))
      ((His-H . C6H7N3O)
       (C6H7N3O . free-mass-155.156-Da)
       (free-mass-155.156-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-137.059-Da)
       (residue-mass-137.059-Da . side-chain-imidazole)
       (side-chain-imidazole . pKa-6.0)
       (pKa-6.0 . partial-positive-at-pH7)
       (partial-positive-at-pH7 . imidazole-group)))


    ;;; NEGATIVELY CHARGED at pH 7 — surface, metal binding

    (aspartate
      (Asp-D)
      ((residue-mass-115.027-Da . negative-at-pH7))
      ((Asp-D . C4H5NO3)
       (C4H5NO3 . free-mass-133.104-Da)
       (free-mass-133.104-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-115.027-Da)
       (residue-mass-115.027-Da . side-chain-carboxyl)
       (side-chain-carboxyl . pKa-3.65)
       (pKa-3.65 . negative-at-pH7)
       (negative-at-pH7 . salt-bridges-in-proteins)
       (salt-bridges-in-proteins . carboxyl-group)))

    (glutamate
      (Glu-E)
      ((residue-mass-129.043-Da . negative-at-pH7))
      ((Glu-E . C5H7NO3)
       (C5H7NO3 . free-mass-147.130-Da)
       (free-mass-147.130-Da . minus-water-18.015-Da)
       (minus-water-18.015-Da . residue-mass-129.043-Da)
       (residue-mass-129.043-Da . side-chain-carboxyl)
       (side-chain-carboxyl . pKa-4.25)
       (pKa-4.25 . negative-at-pH7)))

  )

  ((Lehninger-8th-edition . amino-acids-registered)))
