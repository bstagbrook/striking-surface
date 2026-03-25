#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN DEFINITION: molecules
;;; LAYER: 04-molecules
;;; PRIMARY SOURCE: CRC Handbook 97th ed., Lehninger 8th ed.
;;;
;;; This file IS the single source of truth.
;;; register-domain.rkt reads this, produces:
;;;   molecules.rkt (domain strike table)
;;;   molecules.cal.rkt (calibration)
;;;   oracle entries (appended to registry)
;;;
;;; Each entity is a transform:
;;;   (entity-name
;;;     (source-atoms)
;;;     (target)
;;;     (causal-pairs)
;;;     (oracle-entries))
;;;
;;; Oracle entries:
;;;   ((atom source value uncertainty) ...)
;;; ═══════════════════════════════════════════════════════════════

(definition-molecules

  ((meta
    (domain molecules)
    (layer 04-molecules)
    (primary-source standard-chemistry-references)
    ((domain . molecules)
     (layer . 04-molecules))))

  (

    (single-bond-C-C
      (covalent-bond)
      (energy-346-kJ/mol . length-1.54-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-346-kJ/mol)
       (energy-346-kJ/mol . length-1.54-A)
       (length-1.54-A . sp3-hybridization))
      ((energy-346-kJ/mol CRC-97th 346-kJ/mol pm-5)
       (length-1.54-A CRC-97th 1.54-A pm-0.01)))

    (double-bond-C-C
      (covalent-bond)
      (energy-614-kJ/mol . length-1.34-A)
      ((covalent-bond . shared-two-pairs)
       (shared-two-pairs . energy-614-kJ/mol)
       (energy-614-kJ/mol . length-1.34-A)
       (length-1.34-A . sp2-hybridization)
       (sp2-hybridization . planar-geometry))
      ((energy-614-kJ/mol CRC-97th 614-kJ/mol pm-5)
       (length-1.34-A CRC-97th 1.34-A pm-0.01)))

    (single-bond-C-H
      (covalent-bond)
      (energy-411-kJ/mol . length-1.09-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-411-kJ/mol)
       (energy-411-kJ/mol . length-1.09-A))
      ((energy-411-kJ/mol CRC-97th 411-kJ/mol pm-5)
       (length-1.09-A CRC-97th 1.09-A pm-0.01)))

    (single-bond-C-N
      (covalent-bond)
      (energy-305-kJ/mol . length-1.47-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-305-kJ/mol)
       (energy-305-kJ/mol . length-1.47-A))
      ((energy-305-kJ/mol CRC-97th 305-kJ/mol pm-5)
       (length-1.47-A CRC-97th 1.47-A pm-0.01)))

    (single-bond-C-O
      (covalent-bond)
      (energy-358-kJ/mol . length-1.43-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-358-kJ/mol)
       (energy-358-kJ/mol . length-1.43-A))
      ((energy-358-kJ/mol CRC-97th 358-kJ/mol pm-5)
       (length-1.43-A CRC-97th 1.43-A pm-0.01)))

    (double-bond-C-O
      (covalent-bond)
      (energy-799-kJ/mol . length-1.23-A)
      ((covalent-bond . shared-two-pairs)
       (shared-two-pairs . energy-799-kJ/mol)
       (energy-799-kJ/mol . length-1.23-A)
       (length-1.23-A . carbonyl-group))
      ((energy-799-kJ/mol CRC-97th 799-kJ/mol pm-10)
       (length-1.23-A CRC-97th 1.23-A pm-0.01)))

    (single-bond-N-H
      (covalent-bond)
      (energy-386-kJ/mol . length-1.01-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-386-kJ/mol)
       (energy-386-kJ/mol . length-1.01-A))
      ((energy-386-kJ/mol CRC-97th 386-kJ/mol pm-5)
       (length-1.01-A CRC-97th 1.01-A pm-0.01)))

    (single-bond-O-H
      (covalent-bond)
      (energy-459-kJ/mol . length-0.96-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-459-kJ/mol)
       (energy-459-kJ/mol . length-0.96-A))
      ((energy-459-kJ/mol CRC-97th 459-kJ/mol pm-5)
       (length-0.96-A CRC-97th 0.96-A pm-0.01)))

    (disulfide-bond-S-S
      (covalent-bond)
      (energy-266-kJ/mol . length-2.05-A)
      ((covalent-bond . shared-electron-pair)
       (shared-electron-pair . energy-266-kJ/mol)
       (energy-266-kJ/mol . length-2.05-A)
       (length-2.05-A . stabilizes-protein-tertiary-structure))
      ((energy-266-kJ/mol CRC-97th 266-kJ/mol pm-10)
       (length-2.05-A CRC-97th 2.05-A pm-0.01)))

    (peptide-bond
      (C-N-partial-double)
      (energy-330-kJ/mol . length-1.33-A)
      ((C-N-partial-double . partial-double-bond-character)
       (partial-double-bond-character . energy-330-kJ/mol)
       (energy-330-kJ/mol . length-1.33-A)
       (length-1.33-A . planar-and-rigid)
       (planar-and-rigid . trans-configuration-dominant))
      ((energy-330-kJ/mol Lehninger-8th 330-kJ/mol approximate)
       (length-1.33-A Lehninger-8th 1.33-A pm-0.01)))

    (hydrogen-bond
      (electrostatic-dipole)
      (energy-8-to-29-kJ/mol)
      ((electrostatic-dipole . donor-H-acceptor)
       (donor-H-acceptor . distance-2.7-to-3.1-A)
       (distance-2.7-to-3.1-A . directional)
       (directional . energy-8-to-29-kJ/mol)
       (energy-8-to-29-kJ/mol . stabilizes-secondary-structure))
      ((energy-8-to-29-kJ/mol Lehninger-8th 8-to-29-kJ/mol range)))

    (van-der-waals
      (induced-dipole)
      (energy-2-to-4-kJ/mol)
      ((induced-dipole . distance-dependent)
       (distance-dependent . optimal-at-3.5-A)
       (optimal-at-3.5-A . energy-2-to-4-kJ/mol)
       (energy-2-to-4-kJ/mol . hydrophobic-core-packing))
      ((energy-2-to-4-kJ/mol Lehninger-8th 2-to-4-kJ/mol range)))

    (ionic-interaction
      (charge-charge)
      (energy-20-kJ/mol)
      ((charge-charge . distance-dependent)
       (distance-dependent . weakened-by-water)
       (weakened-by-water . energy-20-kJ/mol)
       (energy-20-kJ/mol . salt-bridges-in-proteins))
      ((energy-20-kJ/mol Lehninger-8th 20-kJ/mol approximate)))

    (carboxyl-group
      (COOH)
      (pKa-2.0-to-2.4)
      ((COOH . proton-donor-at-pH-7)
       (proton-donor-at-pH-7 . negatively-charged-COO-minus)
       (negatively-charged-COO-minus . pKa-2.0-to-2.4))
      ((pKa-2.0-to-2.4 Lehninger-8th 2.0-to-2.4 range)))

    (amino-group
      (NH2)
      (pKa-9.0-to-9.5)
      ((NH2 . proton-acceptor-at-pH-7)
       (proton-acceptor-at-pH-7 . positively-charged-NH3-plus)
       (positively-charged-NH3-plus . pKa-9.0-to-9.5))
      ((pKa-9.0-to-9.5 Lehninger-8th 9.0-to-9.5 range)))

    (hydroxyl-group
      (OH)
      (polar-uncharged-at-pH-7)
      ((OH . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond-donor-and-acceptor . polar-uncharged-at-pH-7))
      ((polar-uncharged-at-pH-7 Lehninger-8th qualitative confirmed)))

    (sulfhydryl-group
      (SH)
      (pKa-8.3)
      ((SH . can-form-disulfide-bonds)
       (can-form-disulfide-bonds . pKa-8.3)
       (pKa-8.3 . mostly-protonated-at-pH-7))
      ((pKa-8.3 Lehninger-8th 8.3 pm-0.1)))

    (imidazole-group
      (C3H4N2)
      (pKa-6.0)
      ((C3H4N2 . histidine-side-chain)
       (histidine-side-chain . pKa-6.0)
       (pKa-6.0 . partial-protonation-at-pH-7)
       (partial-protonation-at-pH-7 . acid-base-catalyst))
      ((pKa-6.0 Lehninger-8th 6.0 pm-0.1)))

  )

  ((meta . molecules-defined)))
