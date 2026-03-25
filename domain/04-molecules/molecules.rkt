#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: molecules
;;; LAYER: 04-molecules
;;; GENERATED: register.rkt (s-expression projection)
;;; SOURCE: standard-chemistry-references
;;; CALIBRATION: molecules.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-molecules

  ((standard-chemistry-references (standard-chemistry-references) (authoritative) ((standard-chemistry-references . authoritative))))

  (

    (single-bond-C-C
      (covalent-bond)
      (energy-346-kJ/mol . length-1.54-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-346-kJ/mol)
       (energy-346-kJ/mol . length-1.54-A)
       (length-1.54-A . sp3-hybridization)
       (sp3-hybridization . four-valence-electrons)
       (four-valence-electrons . basis-of-organic-chemistry)))

    (double-bond-C-C
      (covalent-bond)
      (energy-614-kJ/mol . length-1.34-A)
      ((covalent-bond . shared-two-pairs)
       (shared-two-pairs . energy-614-kJ/mol)
       (energy-614-kJ/mol . length-1.34-A)
       (length-1.34-A . sp2-hybridization)
       (sp2-hybridization . planar-geometry)
       (planar-geometry . four-valence-electrons)))

    (single-bond-C-H
      (covalent-bond)
      (energy-411-kJ/mol . length-1.09-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-411-kJ/mol)
       (energy-411-kJ/mol . length-1.09-A)))

    (single-bond-C-N
      (covalent-bond)
      (energy-305-kJ/mol . length-1.47-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-305-kJ/mol)
       (energy-305-kJ/mol . length-1.47-A)))

    (single-bond-C-O
      (covalent-bond)
      (energy-358-kJ/mol . length-1.43-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-358-kJ/mol)
       (energy-358-kJ/mol . length-1.43-A)))

    (double-bond-C-O
      (covalent-bond)
      (energy-799-kJ/mol . length-1.23-A)
      ((covalent-bond . shared-two-pairs)
       (shared-two-pairs . energy-799-kJ/mol)
       (energy-799-kJ/mol . length-1.23-A)
       (length-1.23-A . carbonyl-group)))

    (single-bond-N-H
      (covalent-bond)
      (energy-386-kJ/mol . length-1.01-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-386-kJ/mol)
       (energy-386-kJ/mol . length-1.01-A)))

    (single-bond-O-H
      (covalent-bond)
      (energy-459-kJ/mol . length-0.96-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-459-kJ/mol)
       (energy-459-kJ/mol . length-0.96-A)))

    (disulfide-bond-S-S
      (covalent-bond)
      (energy-266-kJ/mol . length-2.05-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-266-kJ/mol)
       (energy-266-kJ/mol . length-2.05-A)
       (length-2.05-A . stabilizes-protein-tertiary-structure)
       (stabilizes-protein-tertiary-structure . can-form-disulfide-bond)
       (disulfide-bond-S-S . shared-electron-pair)))

    (peptide-bond
      (C-N-partial-double)
      (energy-330-kJ/mol . length-1.33-A)
      ((C-N-partial-double . partial-double-bond-character)
       (partial-double-bond-character . energy-330-kJ/mol)
       (energy-330-kJ/mol . length-1.33-A)
       (length-1.33-A . planar-and-rigid)
       (planar-and-rigid . trans-configuration-dominant)
       (trans-configuration-dominant . condensation-reaction)
       (peptide-bond . C-N-partial-double)
       (condensation-reaction . amino-acid-plus-amino-acid)))

    (hydrogen-bond
      (electrostatic-dipole)
      (energy-8-to-29-kJ/mol)
      ((electrostatic-dipole . donor-H-acceptor)
       (donor-H-acceptor . distance-2.7-to-3.1-A)
       (distance-2.7-to-3.1-A . directional)
       (directional . energy-8-to-29-kJ/mol)
       (energy-8-to-29-kJ/mol . stabilizes-secondary-structure)
       (stabilizes-secondary-structure . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond . electrostatic-dipole)))

    (van-der-waals
      (induced-dipole)
      (energy-2-to-4-kJ/mol)
      ((induced-dipole . distance-dependent)
       (distance-dependent . optimal-at-3.5-A)
       (optimal-at-3.5-A . energy-2-to-4-kJ/mol)
       (energy-2-to-4-kJ/mol . hydrophobic-core-packing)
       (hydrophobic-core-packing . nonpolar)
       (nonpolar . induced-dipole)))

    (ionic-interaction
      (charge-charge)
      (energy-20-kJ/mol)
      ((charge-charge . distance-dependent)
       (distance-dependent . weakened-by-water)
       (weakened-by-water . energy-20-kJ/mol)
       (energy-20-kJ/mol . salt-bridges-in-proteins)
       (salt-bridges-in-proteins . side-chain-carboxyl)))

    (carboxyl-group
      (COOH)
      (pKa-2.0-to-2.4)
      ((COOH . proton-donor-at-pH-7)
       (proton-donor-at-pH-7 . negatively-charged-COO-minus)
       (negatively-charged-COO-minus . pKa-2.0-to-2.4)
       (pKa-2.0-to-2.4 . negative-at-pH7)))

    (amino-group
      (NH2)
      (pKa-9.0-to-9.5)
      ((NH2 . proton-acceptor-at-pH-7)
       (proton-acceptor-at-pH-7 . positively-charged-NH3-plus)
       (positively-charged-NH3-plus . pKa-9.0-to-9.5)
       (pKa-9.0-to-9.5 . positive-at-pH7)))

    (hydroxyl-group
      (OH)
      (polar-uncharged-at-pH-7)
      ((OH . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond-donor-and-acceptor . polar-uncharged-at-pH-7)))

    (sulfhydryl-group
      (SH)
      (pKa-8.3)
      ((SH . can-form-disulfide-bonds)
       (can-form-disulfide-bonds . pKa-8.3)
       (pKa-8.3 . mostly-protonated-at-pH-7)
       (mostly-protonated-at-pH-7 . polar-uncharged)
       (polar-uncharged . hydrogen-bond-donor-and-acceptor)))

    (imidazole-group
      (C3H4N2)
      (pKa-6.0)
      ((C3H4N2 . histidine-side-chain)
       (histidine-side-chain . pKa-6.0)
       (pKa-6.0 . partial-protonation-at-pH-7)
       (partial-protonation-at-pH-7 . acid-base-catalyst)
       (acid-base-catalyst . partial-positive-at-pH7)))

  )

  ((standard-chemistry-references . molecules-registered)))
