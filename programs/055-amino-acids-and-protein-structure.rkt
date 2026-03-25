#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; AMINO ACIDS & PROTEIN STRUCTURE
;;;
;;; 20 standard amino acids, each with backbone + unique side chain.
;;; Side chain properties determine protein behavior.
;;; Four levels of protein structure: primary through quaternary.
;;; Secondary structure elements: alpha-helix, beta-sheet, loops.
;;;
;;; This table is critical for HIV capsid work:
;;; - Which residues are hydrophobic (buried) vs hydrophilic (surface)?
;;; - What secondary structure (helix vs loop) determines escape cost?
;;; - How do amino acid properties constrain mutation?
;;;
;;; SOURCE: standard biochemistry, Lehninger, Branden & Tooze
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-amino-acids-and-protein-structure

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: amino acid and protein structure domain
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; AMINO ACID GENERAL STRUCTURE
    ;;; SOURCE: standard biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    (amino-acid-structure
      (amino-group-carboxyl-group-H-R-group-on-alpha-carbon)
      (zwitterion-at-physiological-pH)
      ((amino-group-carboxyl-group-H-R-group-on-alpha-carbon . chiral-except-glycine)
       (chiral-except-glycine . L-configuration-in-biology)
       (L-configuration-in-biology . zwitterion-at-physiological-pH)))

    (peptide-bond
      (C-N-bond-between-amino-acids)
      (planar-partial-double-bond)
      ((C-N-bond-between-amino-acids . condensation-releases-water)
       (condensation-releases-water . partial-double-bond-character)
       (partial-double-bond-character . planar-rigid-trans-preferred)
       (planar-rigid-trans-preferred . planar-partial-double-bond)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; 20 STANDARD AMINO ACIDS by property class
    ;;; Single letter code, 3-letter code, key property
    ;;; SOURCE: standard biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ── Nonpolar / Hydrophobic ──
    ;;; These residues are BURIED in protein cores
    ;;; Mutations here often destabilize folding

    (Gly-G (glycine) (smallest-no-side-chain) ((glycine . R-is-H) (R-is-H . maximum-conformational-flexibility) (maximum-conformational-flexibility . smallest-no-side-chain)))
    (Ala-A (alanine) (small-hydrophobic) ((alanine . R-is-methyl) (R-is-methyl . small-hydrophobic)))
    (Val-V (valine) (branched-hydrophobic) ((valine . R-is-isopropyl) (R-is-isopropyl . beta-branched) (beta-branched . branched-hydrophobic)))
    (Leu-L (leucine) (hydrophobic-common-in-helices) ((leucine . R-is-isobutyl) (R-is-isobutyl . hydrophobic-common-in-helices)))
    (Ile-I (isoleucine) (beta-branched-hydrophobic) ((isoleucine . R-is-sec-butyl) (R-is-sec-butyl . beta-branched) (beta-branched . beta-branched-hydrophobic)))
    (Pro-P (proline) (helix-breaker-rigid) ((proline . R-is-cyclic-bonded-to-N) (R-is-cyclic-bonded-to-N . restricts-backbone-rotation) (restricts-backbone-rotation . helix-breaker-rigid)))
    (Phe-F (phenylalanine) (aromatic-hydrophobic) ((phenylalanine . R-is-benzyl) (R-is-benzyl . aromatic-hydrophobic)))
    (Trp-W (tryptophan) (largest-aromatic-hydrophobic) ((tryptophan . R-is-indole) (R-is-indole . largest-side-chain) (largest-side-chain . largest-aromatic-hydrophobic)))
    (Met-M (methionine) (sulfur-containing-hydrophobic) ((methionine . R-contains-thioether) (R-contains-thioether . flexible-hydrophobic) (flexible-hydrophobic . sulfur-containing-hydrophobic)))

    ;;; ── Polar Uncharged ──
    ;;; These can be surface or buried, often at interfaces

    (Ser-S (serine) (small-polar-hydroxyl) ((serine . R-is-CH2OH) (R-is-CH2OH . H-bond-donor-acceptor) (H-bond-donor-acceptor . phosphorylation-site) (phosphorylation-site . small-polar-hydroxyl)))
    (Thr-T (threonine) (polar-hydroxyl-beta-branched) ((threonine . R-is-CHOH-CH3) (R-is-CHOH-CH3 . beta-branched-polar) (beta-branched-polar . phosphorylation-site) (phosphorylation-site . polar-hydroxyl-beta-branched)))
    (Cys-C (cysteine) (thiol-disulfide-bonds) ((cysteine . R-is-CH2SH) (R-is-CH2SH . can-form-S-S-bonds) (can-form-S-S-bonds . stabilizes-tertiary-structure) (stabilizes-tertiary-structure . thiol-disulfide-bonds)))
    (Tyr-Y (tyrosine) (aromatic-polar-hydroxyl) ((tyrosine . R-is-hydroxyphenyl) (R-is-hydroxyphenyl . H-bond-capable-aromatic) (H-bond-capable-aromatic . phosphorylation-site) (phosphorylation-site . aromatic-polar-hydroxyl)))
    (Asn-N (asparagine) (polar-amide-short) ((asparagine . R-is-CH2CONH2) (R-is-CH2CONH2 . H-bond-donor-and-acceptor) (H-bond-donor-and-acceptor . glycosylation-site) (glycosylation-site . polar-amide-short)))
    (Gln-Q (glutamine) (polar-amide-long) ((glutamine . R-is-CH2CH2CONH2) (R-is-CH2CH2CONH2 . H-bond-donor-and-acceptor) (H-bond-donor-and-acceptor . polar-amide-long)))

    ;;; ── Positively Charged (basic) ──
    ;;; Surface-exposed, salt bridges, nucleic acid binding

    (Lys-K (lysine) (positive-charge-long-flexible) ((lysine . R-is-CH2x4-NH3-plus) (R-is-CH2x4-NH3-plus . pKa-10.5) (pKa-10.5 . positive-at-physiological-pH) (positive-at-physiological-pH . positive-charge-long-flexible)))
    (Arg-R (arginine) (positive-charge-guanidinium) ((arginine . R-is-guanidinium) (R-is-guanidinium . pKa-12.5) (pKa-12.5 . always-positive-at-physiological-pH) (always-positive-at-physiological-pH . positive-charge-guanidinium)))
    (His-H (histidine) (charge-depends-on-pH) ((histidine . R-is-imidazole) (R-is-imidazole . pKa-6.0) (pKa-6.0 . can-be-positive-or-neutral-at-pH-7) (can-be-positive-or-neutral-at-pH-7 . charge-depends-on-pH)))

    ;;; ── Negatively Charged (acidic) ──
    ;;; Surface-exposed, salt bridges

    (Asp-D (aspartate) (negative-charge-short) ((aspartate . R-is-CH2COO-minus) (R-is-CH2COO-minus . pKa-3.7) (pKa-3.7 . negative-at-physiological-pH) (negative-at-physiological-pH . negative-charge-short)))
    (Glu-E (glutamate) (negative-charge-long) ((glutamate . R-is-CH2CH2COO-minus) (R-is-CH2CH2COO-minus . pKa-4.1) (pKa-4.1 . negative-at-physiological-pH) (negative-at-physiological-pH . negative-charge-long)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PROTEIN STRUCTURE — four levels
    ;;; SOURCE: standard biochemistry, Branden & Tooze
    ;;; ═══════════════════════════════════════════════════════════

    (primary-structure
      (amino-acid-sequence)
      (determines-all-higher-structure)
      ((amino-acid-sequence . encoded-by-DNA)
       (encoded-by-DNA . read-N-to-C-terminus)
       (read-N-to-C-terminus . determines-all-higher-structure)))

    ;;; Alpha helix: right-handed, 3.6 residues per turn
    ;;; H-bond: C=O of residue i to N-H of residue i+4
    (alpha-helix
      (regular-H-bond-pattern-i-to-i+4)
      (right-handed-3.6-residues-per-turn)
      ((regular-H-bond-pattern-i-to-i+4 . backbone-H-bonds)
       (backbone-H-bonds . 5.4-angstrom-pitch)
       (5.4-angstrom-pitch . side-chains-project-outward)
       (side-chains-project-outward . right-handed-3.6-residues-per-turn)))

    ;;; Beta sheet: extended chains, H-bonds between strands
    (beta-sheet
      (extended-chain-H-bonds-between-strands)
      (parallel-or-antiparallel)
      ((extended-chain-H-bonds-between-strands . inter-strand-H-bonds)
       (inter-strand-H-bonds . side-chains-alternate-above-below)
       (side-chains-alternate-above-below . parallel-or-antiparallel)))

    ;;; Loops/turns: irregular, connect helices and sheets
    ;;; CRITICAL FOR HIV: loops are often surface-exposed,
    ;;; more tolerant of mutation than helices/sheets
    (loops-and-turns
      (irregular-no-regular-H-bond-pattern)
      (connect-secondary-structure-elements)
      ((irregular-no-regular-H-bond-pattern . surface-exposed-typically)
       (surface-exposed-typically . more-variable-in-evolution)
       (more-variable-in-evolution . tolerate-mutation-better)
       (tolerate-mutation-better . connect-secondary-structure-elements)))

    ;;; Tertiary structure: 3D fold of single polypeptide
    (tertiary-structure
      (3D-arrangement-of-all-atoms)
      (determined-by-side-chain-interactions)
      ((3D-arrangement-of-all-atoms . hydrophobic-core-polar-surface)
       (hydrophobic-core-polar-surface . stabilized-by-H-bonds-salt-bridges-disulfides-VDW)
       (stabilized-by-H-bonds-salt-bridges-disulfides-VDW . determined-by-side-chain-interactions)))

    ;;; Quaternary structure: multiple polypeptide subunits
    ;;; HIV capsid = quaternary structure (hexamers + pentamers)
    (quaternary-structure
      (multiple-polypeptide-subunits)
      (specific-subunit-interfaces)
      ((multiple-polypeptide-subunits . same-or-different-chains)
       (same-or-different-chains . interface-contacts)
       (interface-contacts . specific-subunit-interfaces)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STRUCTURAL PRINCIPLES relevant to HIV capsid analysis
    ;;; SOURCE: standard structural biology
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Buried residues are constrained
    (buried-residue-constraint
      (hydrophobic-residue-in-protein-core)
      (mutation-often-destabilizing)
      ((hydrophobic-residue-in-protein-core . packs-tightly)
       (packs-tightly . contributes-to-fold-stability)
       (contributes-to-fold-stability . mutation-changes-packing)
       (mutation-changes-packing . mutation-often-destabilizing)))

    ;;; Surface residues are more tolerant
    (surface-residue-tolerance
      (polar-charged-residue-on-surface)
      (mutation-often-tolerated)
      ((polar-charged-residue-on-surface . solvent-exposed)
       (solvent-exposed . fewer-packing-constraints)
       (fewer-packing-constraints . mutation-often-tolerated)))

    ;;; Helix residues more constrained than loop residues
    (helix-vs-loop-constraint
      (helix-residues . loop-residues)
      (helix-more-constrained)
      ((helix-residues . participate-in-regular-H-bond-pattern)
       (participate-in-regular-H-bond-pattern . mutation-can-break-helix)
       (loop-residues . no-regular-H-bond-pattern)
       (no-regular-H-bond-pattern . mutation-better-tolerated)
       (mutation-can-break-helix . helix-more-constrained)))

    ;;; Interface residues: most constrained of all
    (interface-constraint
      (residue-at-subunit-interface)
      (mutation-disrupts-assembly)
      ((residue-at-subunit-interface . complementary-surface)
       (complementary-surface . shape-charge-hydrophobic-match)
       (shape-charge-hydrophobic-match . mutation-disrupts-complementarity)
       (mutation-disrupts-complementarity . mutation-disrupts-assembly)))

  )

  ;;; Vacuum tube
  ((tesla . amino-acids-and-protein-structure-registered)))
