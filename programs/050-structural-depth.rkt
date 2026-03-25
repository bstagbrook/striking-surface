#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; STRUCTURAL DEPTH — WHY CONSERVATION IS NECESSARY NOT SUFFICIENT
;;;
;;; FINDING: B*07:02 targets conserved regions (37% entropy reduction)
;;; but does NOT confer protection. B*57:01 targets conserved regions
;;; (45-64% reduction) and DOES protect. The difference is WHERE
;;; in the capsid structure the epitopes sit.
;;;
;;; B*57 epitopes sit at structural load-bearing positions:
;;;   - KF11 (Gag 162-172 = p24 30-40): NTD helix 2, highly networked
;;;     residues bridging NTD-CTD inter-domain contacts
;;;   - TW10 (Gag 240-249 = p24 108-117): NTD helix 6 stabilization
;;;   - IW9 (Gag 138-146 = p24 6-14): NTD helices, hexamer contacts
;;; Escape at these positions breaks the capsid.
;;;
;;; B*07 epitope sits in a disordered C-terminal tail:
;;;   - GPGHKARVL (Gag 355-363 = p24 223-231): CTD C-terminal
;;;     disordered region, last 11 residues of p24
;;;   - Not in a helix, not at the dimer interface (helix 9),
;;;     not in any load-bearing structure
;;;   - Conserved on average, but escape is structurally cheap
;;;
;;; NUMBERING CONVENTIONS (critical for correctness):
;;;   Gag HXB2 numbering: p24 starts at Gag position 133
;;;   p24-internal numbering: residue 1 = Gag 133
;;;   Conversion: p24_internal = Gag_HXB2 - 132
;;;   NTD: p24 1-145 (Gag 133-277)
;;;   Linker: p24 146-150 (Gag 278-282)
;;;   CTD: p24 151-231 (Gag 283-363)
;;;
;;; NOTE ON CypA LOOP: The CypA-binding loop is at p24 85-93
;;; (Gag 217-225). Woo et al. 2010's "position 223" refers to
;;; Gag HXB2 position 223 = p24 residue 91 (IN the CypA loop).
;;; The B*07 epitope "p24 223-231" is p24-INTERNAL numbering
;;; = Gag 355-363 (CTD tail). Completely different location.
;;;
;;; THE MECHANISM: Protection requires targeting positions where
;;; escape has HIGH FITNESS COST. Conservation alone doesn't
;;; guarantee high fitness cost.
;;;
;;; NOVEL DISTINCTION:
;;;   Conserved-and-constrained (cannot change) → protection
;;;   Conserved-and-tolerant (happens not to change) → no protection
;;;
;;; SOURCES:
;;; - p24 structure: Gamble et al. 1996, Nature Struct Biol
;;; - p24 domain boundaries: standard ref, NTD 1-145, CTD 151-231
;;; - MHR (p24 153-172 = Gag 285-304): standard reference
;;; - KF11 inter-domain bridging: search result, LANL
;;; - TW10 T242 helix stabilization: Pymm et al. 2017, PMC5520415
;;; - TW10 escape cost 42%: Crawford et al. 2007, PMC 17728232
;;; - CypA loop p24 85-93 (Gag 217-225): standard structural ref
;;; - 8 HLA-independent variable residues: Woo et al. 2010, PMC3020512
;;;   (Gag HXB2 positions: 138, 215, 219, 223, 228, 248, 252, 256)
;;; - B*07 GPGHKARVL Gag 355-363: peptides.de, jpt.com, IEDB
;;; - p24 CTD disordered tail (last 11 residues): Wikipedia/standard
;;; - CTD dimer interface at helix 9 (~p24 181-190): Gamble et al.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-structural-depth

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: the structural depth finding
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; p24 CAPSID ARCHITECTURE
    ;;; SOURCE: Gamble et al. 1996; standard structural biology
    ;;; ═══════════════════════════════════════════════════════════

    ;;; p24 numbering: residue 1 = Gag HXB2 position 133
    ;;; NTD: p24 1-145 (Gag 133-277), 7 alpha-helices + beta-hairpin
    ;;; Linker: p24 146-150 (Gag 278-282), flexible
    ;;; CTD: p24 151-231 (Gag 283-363), 4 alpha-helices + disordered tail
    (p24-architecture
      (NTD-p24-1-145-Gag-133-277 . CTD-p24-151-231-Gag-283-363)
      (two-domain-capsid-protein)
      ((NTD-p24-1-145-Gag-133-277 . 7-alpha-helices-plus-beta-hairpin)
       (CTD-p24-151-231-Gag-283-363 . 4-alpha-helices-plus-disordered-tail)
       (7-alpha-helices-plus-beta-hairpin . hexamer-contacts)
       (4-alpha-helices-plus-disordered-tail . dimer-interface-at-helix-9)
       (hexamer-contacts . capsid-assembly)
       (dimer-interface-at-helix-9 . capsid-assembly)))

    ;;; Major Homology Region: 20 most conserved residues
    ;;; p24 153-172 = Gag 285-304 (in the CTD, NOT the NTD)
    ;;; SOURCE: standard reference
    (MHR
      (p24-153-172-Gag-285-304)
      (most-conserved-in-all-retroviruses)
      ((p24-153-172-Gag-285-304 . in-CTD-not-NTD)
       (in-CTD-not-NTD . essential-for-capsid-assembly)
       (essential-for-capsid-assembly . most-conserved-in-all-retroviruses)))

    ;;; CypA-binding loop: p24 85-93 = Gag 217-225
    ;;; Surface-exposed, between helix 4 and helix 5 of NTD
    ;;; SOURCE: standard structural reference; Woo et al. 2010
    (CypA-loop
      (p24-85-93-Gag-217-225)
      (surface-exposed-NTD-loop)
      ((p24-85-93-Gag-217-225 . between-helix-4-and-helix-5)
       (between-helix-4-and-helix-5 . surface-exposed)
       (surface-exposed . binds-cyclophilin-A)
       (binds-cyclophilin-A . tropism-determining)))

    ;;; CTD disordered C-terminal tail: p24 221-231 = Gag 353-363
    ;;; Last 11 residues, unstructured
    ;;; SOURCE: Wikipedia p24, standard structural reference
    (CTD-disordered-tail
      (p24-221-231-Gag-353-363)
      (unstructured-flexible-tail)
      ((p24-221-231-Gag-353-363 . last-11-residues-of-p24)
       (last-11-residues-of-p24 . no-alpha-helix)
       (no-alpha-helix . no-dimer-interface)
       (no-dimer-interface . unstructured-flexible-tail)))

    ;;; CTD dimer interface: helix 9, p24 ~181-190
    ;;; SOURCE: Gamble et al. 1996
    (CTD-dimer-interface
      (helix-9-p24-181-190)
      (critical-for-capsid-lattice)
      ((helix-9-p24-181-190 . V181-K182-W184-M185-L189-L190)
       (V181-K182-W184-M185-L189-L190 . inter-hexamer-contacts)
       (inter-hexamer-contacts . critical-for-capsid-lattice)))

    ;;; 8 HLA-independent high-variability positions
    ;;; SOURCE: Woo et al. 2010 — phylogenetic analysis, 662 sequences
    ;;; ALL positions in Gag HXB2 numbering
    (HLA-independent-variable
      (Gag-138 Gag-215 Gag-219 Gag-223 Gag-228 Gag-248 Gag-252 Gag-256)
      (vary-without-HLA-pressure)
      ((Gag-138 . NTD-tropism-loop)
       (Gag-215 . CypA-loop)
       (Gag-219 . CypA-loop)
       (Gag-223 . CypA-loop)
       (Gag-228 . downstream-of-CypA-loop)
       (Gag-248 . NTD-tropism-loop-2)
       (Gag-252 . NTD-tropism-loop-3)
       (Gag-256 . downstream-of-loop-3)
       (vary-without-HLA-pressure . low-fitness-cost-of-change)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; B*57 EPITOPES — STRUCTURAL LOAD-BEARING
    ;;; ═══════════════════════════════════════════════════════════

    ;;; KF11: Gag 162-172 = p24 30-40, in NTD helix 2 region
    ;;; Highly networked residues bridging NTD-CTD contacts
    ;;; NOT in the MHR (MHR is p24 153-172 = Gag 285-304)
    ;;; SOURCE: LANL HIV immunology database; web search confirmed
    ;;; "contains highly networked residues that bridge N- and C-
    ;;; terminal domains"
    (B*57-KF11-structure
      (KF11-Gag-162-172-p24-30-40)
      (NTD-inter-domain-bridge)
      ((KF11-Gag-162-172-p24-30-40 . NTD-helix-2-region)
       (NTD-helix-2-region . highly-networked-residues)
       (highly-networked-residues . bridges-NTD-CTD-contacts)
       (bridges-NTD-CTD-contacts . escape-disrupts-inter-domain-network)
       (escape-disrupts-inter-domain-network . NTD-inter-domain-bridge)))

    ;;; TW10: Gag 240-249 = p24 108-117, NTD helix 6
    ;;; T242 (p24 110) anchors helix 6 start
    ;;; SOURCE: Pymm et al. 2017, PMC5520415; Crawford et al. 2007
    (B*57-TW10-structure
      (TW10-Gag-240-249-p24-108-117)
      (helix-6-stabilizer)
      ((TW10-Gag-240-249-p24-108-117 . T242-anchors-helix-6-start)
       (T242-anchors-helix-6-start . T242N-escape-destabilizes)
       (T242N-escape-destabilizes . 42-pct-fitness-reduction)
       (42-pct-fitness-reduction . requires-compensatory-mutations)
       (requires-compensatory-mutations . helix-6-stabilizer)))

    ;;; IW9: Gag 138-146 = p24 6-14, NTD N-terminal helices
    ;;; SOURCE: Pymm et al. 2022, PMC9704518
    (B*57-IW9-structure
      (IW9-Gag-138-146-p24-6-14)
      (NTD-hexamer-interface)
      ((IW9-Gag-138-146-p24-6-14 . within-NTD-helices)
       (within-NTD-helices . mediates-hexamer-contacts)
       (mediates-hexamer-contacts . escape-disrupts-assembly)
       (escape-disrupts-assembly . NTD-hexamer-interface)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; B*07 EPITOPE — DISORDERED C-TERMINAL TAIL
    ;;; ═══════════════════════════════════════════════════════════

    ;;; GPGHKARVL: Gag 355-363 = p24 223-231
    ;;; This is the LAST 9 residues of p24, within the 11-residue
    ;;; disordered C-terminal tail. Not a helix. Not the dimer
    ;;; interface (that's helix 9, ~p24 181-190). Not load-bearing.
    ;;;
    ;;; CRITICAL NUMBERING NOTE: "p24 223-231" is p24-internal
    ;;; numbering. This is NOT Gag position 223 (which is p24
    ;;; residue 91, in the CypA loop). The B*07 epitope is at
    ;;; the C-terminal end of p24, not the CypA loop.
    ;;;
    ;;; SOURCE: peptides.de, jpt.com (Gag 355-363 confirmed)
    (B*07-GPGHKARVL-structure
      (GPGHKARVL-Gag-355-363-p24-223-231)
      (CTD-disordered-tail-non-structural)
      ((GPGHKARVL-Gag-355-363-p24-223-231 . within-CTD-disordered-tail)
       (within-CTD-disordered-tail . not-in-any-helix)
       (not-in-any-helix . not-at-dimer-interface)
       (not-at-dimer-interface . no-structural-role)
       (no-structural-role . escape-is-structurally-cheap)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE DISTINCTION — CONSTRAINED vs TOLERANT CONSERVATION
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Two kinds of conserved regions:
    ;;;   1. Constrained: conserved BECAUSE mutation is costly
    ;;;   2. Tolerant: conserved BECAUSE no pressure to change
    ;;;      (but CAN change cheaply when pressure arrives)
    (conserved-constrained
      (low-entropy-high-fitness-cost)
      (escape-breaks-virus)
      ((low-entropy-high-fitness-cost . mutation-is-costly)
       (mutation-is-costly . escape-requires-compensation)
       (escape-requires-compensation . escape-breaks-virus)))

    (conserved-tolerant
      (low-entropy-low-fitness-cost)
      (escape-is-cheap)
      ((low-entropy-low-fitness-cost . no-pressure-to-change)
       (no-pressure-to-change . appears-conserved-in-absence-of-immune-pressure)
       (appears-conserved-in-absence-of-immune-pressure . but-can-change-when-pressured)
       (but-can-change-when-pressured . escape-is-cheap)))

    ;;; THE REFINED MODEL
    (refined-model
      (entropy-reduction . structural-constraint)
      (predicts-protection)
      ((entropy-reduction . measures-conservation)
       (structural-constraint . measures-escape-cost)
       (measures-conservation . necessary-but-not-sufficient)
       (measures-escape-cost . the-missing-factor)
       (necessary-but-not-sufficient . requires-the-missing-factor)
       (requires-the-missing-factor . predicts-protection)))

    ;;; TESTABLE PREDICTION:
    ;;; For ANY HLA allele, protection correlates with:
    ;;;   CAI × (fraction of epitope positions in load-bearing structure)
    ;;; Not just CAI alone.
    (testable-prediction
      (CAI-times-structural-depth)
      (predicts-protection-better-than-CAI-alone)
      ((CAI-times-structural-depth . product-of-two-measurements)
       (product-of-two-measurements . entropy-reduction-times-structural-fraction)
       (entropy-reduction-times-structural-fraction . testable-with-PDB-and-IEDB)
       (testable-with-PDB-and-IEDB . predicts-protection-better-than-CAI-alone)))

  )

  ;;; Vacuum tube
  ((tesla . structural-depth-registered)))
