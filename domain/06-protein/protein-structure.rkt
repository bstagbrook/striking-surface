#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: protein-structure
;;; LAYER: 06-protein
;;; GENERATED: register-domain.sh (closed-loop)
;;; SOURCE: Lehninger-8th-and-PDB
;;; CALIBRATION: protein-structure.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-protein-structure

  ((Lehninger-8th-and-PDB (Lehninger-8th-and-PDB) (authoritative) ((Lehninger-8th-and-PDB . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════

    ;;; PROTEIN SECONDARY AND TERTIARY STRUCTURE

    ;;; Parameters from X-ray crystallography and NMR

    ;;; SOURCE: Lehninger 8th ed., Branden & Tooze, PDB statistics

    ;;; ═══════════════════════════════════════════════════════════


    ;;; ALPHA HELIX — most common secondary structure

    (alpha-helix-geometry
      (right-handed-helix)
      ((residues-per-turn-3.6 . rise-per-residue-1.5-A))
      ((right-handed-helix . hydrogen-bonds-i-to-i-plus-4)
       (hydrogen-bonds-i-to-i-plus-4 . residues-per-turn-3.6)
       (residues-per-turn-3.6 . rise-per-residue-1.5-A)
       (rise-per-residue-1.5-A . pitch-5.4-A)))

    (alpha-helix-hbonds
      (backbone-NH-to-CO)
      ((distance-2.8-A . angle-160-degrees))
      ((backbone-NH-to-CO . i-to-i-plus-4-pattern)
       (i-to-i-plus-4-pattern . distance-2.8-A)
       (distance-2.8-A . angle-160-degrees)
       (angle-160-degrees . stabilization-energy)
       (stabilization-energy . hydrogen-bond-donor-and-acceptor)
       (hydrogen-bond-donor-and-acceptor . polar-uncharged)
       (polar-uncharged . stabilizes-secondary-structure)))

    (alpha-helix-phi-psi
      (backbone-angles)
      ((phi-minus-57-degrees . psi-minus-47-degrees))
      ((backbone-angles . Ramachandran-allowed)
       (Ramachandran-allowed . phi-minus-57-degrees)
       (phi-minus-57-degrees . psi-minus-47-degrees)))


    ;;; BETA SHEET — second most common

    (beta-sheet-geometry
      (extended-strand)
      ((rise-per-residue-3.3-A . distance-between-strands-4.7-A))
      ((extended-strand . hydrogen-bonds-between-strands)
       (hydrogen-bonds-between-strands . parallel-or-antiparallel)
       (parallel-or-antiparallel . rise-per-residue-3.3-A)
       (rise-per-residue-3.3-A . distance-between-strands-4.7-A)
       (distance-between-strands-4.7-A . hydrogen-bond-donor-and-acceptor)))

    (beta-sheet-phi-psi
      (backbone-angles)
      ((phi-minus-120-degrees . psi-plus-120-degrees))
      ((backbone-angles . Ramachandran-allowed)
       (Ramachandran-allowed . phi-minus-120-degrees)
       (phi-minus-120-degrees . psi-plus-120-degrees)))


    ;;; TURNS AND LOOPS

    (beta-turn
      (four-residue-turn)
      (distance-Ca1-Ca4-less-than-7-A)
      ((four-residue-turn . glycine-or-proline-favored)
       (glycine-or-proline-favored . hydrogen-bond-i-to-i-plus-3)
       (hydrogen-bond-i-to-i-plus-3 . distance-Ca1-Ca4-less-than-7-A)
       (distance-Ca1-Ca4-less-than-7-A . constrains-backbone)
       (constrains-backbone . Ramachandran-allowed)))


    ;;; RAMACHANDRAN PLOT — allowed backbone conformations

    (ramachandran-constraints
      (phi-psi-angles)
      (steric-clashes-restrict-angles)
      ((phi-psi-angles . most-combinations-forbidden)
       (most-combinations-forbidden . three-allowed-regions)
       (three-allowed-regions . alpha-helix-region)
       (alpha-helix-region . beta-sheet-region)
       (beta-sheet-region . left-handed-helix-region)
       (left-handed-helix-region . steric-clashes-restrict-angles)
       (steric-clashes-restrict-angles . planar-and-rigid)))


    ;;; HYDROPHOBIC EFFECT — the primary driver of protein folding

    (hydrophobic-effect
      (nonpolar-residues-bury)
      (free-energy-gain-5-to-20-kJ/mol-per-residue)
      ((nonpolar-residues-bury . water-entropy-increases)
       (water-entropy-increases . drives-folding)
       (drives-folding . free-energy-gain-5-to-20-kJ/mol-per-residue)
       (free-energy-gain-5-to-20-kJ/mol-per-residue . hydrophobic-core-packing)
       (hydrophobic-core-packing . nonpolar)
       (nonpolar . water-entropy-increases)))


    ;;; PROTEIN DOMAINS — independently folding units

    (domain-size
      (typical-domain)
      (length-100-to-250-residues)
      ((typical-domain . independently-folding)
       (independently-folding . compact-hydrophobic-core)
       (compact-hydrophobic-core . connected-by-linkers)
       (connected-by-linkers . length-100-to-250-residues)
       (length-100-to-250-residues . minus-water-18.015-Da)
       (minus-water-18.015-Da . condensation-reaction)))


    ;;; LEVINTHAL PARADOX — proteins fold fast despite astronomical conformational space

    (levinthal
      (conformational-space)
      (time-less-than-1-s-for-folding)
      ((conformational-space . 10-to-300-for-100-residue-protein)
       (10-to-300-for-100-residue-protein . random-search-impossible)
       (random-search-impossible . folding-follows-pathway)
       (folding-follows-pathway . time-less-than-1-s-for-folding)))

  )

  ((Lehninger-8th-and-PDB . protein-structure-registered)))
